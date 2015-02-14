if(Game.GetCustomOption("GAMEOPTION_CULTURALCAPITALS") == 0) then
	return;
end

-- CC
-- Author: Moaf
--------------------------------------------------------------

include("CCStorage");
include("CCWhysUtils");
include("CCXmlData");
include("MoafsUtils");
include("CCxWorldViewUI");
include("CCxPopup");
include("CCxNotifications");
include("CCxOverview");
include("CCThemeManager");

local g_modId = "6763d715-af95-4bbf-8c04-13a11de025b5";

--------------- Init Data ------------------
-- Gets loaded when game starts
local g_electedPlayerId = nil;
--local g_electedCity = nil; -- do not use pointer, since it can be changed e.g. when the capital is captured it will point to the new capital instead to the correct city
local g_electedCityId = nil;
local g_noOfElections = nil;
local g_bCommitteeFormed = nil;
local g_bRaceInProgress = nil; -- determines whether or not the race for the cultural capital is in progress

local g_progressTable = nil;
local g_iCountdown = nil;
local g_iThreshold = nil;
local g_bPlayerHasMetElectedPlayer = nil;
local g_bPlayerKnowsElectedCity = nil;
local g_bribeTable = nil;

---------------------------------------------

----------------- Xml Data ------------------
local g_bFastDebug = GameDefines.CC_FASTDEBUG;
local g_iDuration = GetSpeedScale("Duration");
local g_iBribeDuration = GetSpeedScale("BribeDuration");
local g_iBribeCooldown = GetSpeedScale("BribeCooldown");
local g_iBribeBonus = GameDefines.CC_BRIBE_BONUSPERCENTAGE / 100.0;

local g_iWondersRequired = GameDefines.CC_WONDERSREQUIRED;
local g_progressIncreaseBase = GameDefines.CC_PROGRESSINCREASE_BASE;
local g_progressIncrease = GameDefines.CC_PROGRESSINCREASE_PERELECTION;
local g_progressIncreaseExponent = GameDefines.CC_PROGRESSINCREASE_EXPONENT;
local g_progressIncreaseTurnModifier = GameDefines.CC_PROGRESSINCREASE_TURNMODIFIER;
local g_progressVisibleDivisor = GameDefines.CC_PROGRESS_VISIBLEDIVISOR;
local g_iMinorCivCultureBonus = GameDefines.CC_MINORCIV_BONUSPERCENTAGE / 100.0;
local g_iWonderBonus = GameDefines.CC_WONDERS_BONUSPERCENTAGE / 100.0;
local g_iWondersRequiredForProgress = GameDefines.CC_PROGRESS_WONDERSREQUIRED;
local g_cityElectionPopMod = GameDefines.CC_CITYELECTION_POPMOD;
local g_cityElectionCultureMod = GameDefines.CC_CITYELECTION_CULTUREMOD;
local g_iLastWinMalus = GameDefines.CC_LASTWIN_MALUS / 100.0;
local g_bUseCommitteeStart = (GameDefines.CC_USE_COMMITTEESTART == 1);
local g_committeeBuildingClass = GameDefines.CC_BUILDINGCLASS_COMMITTEE;

local g_bInitialized = false;

local g_doDebug = (GameDefines.CC_DEBUG == 1);
local g_fastDebugPlayer = GameDefines.CC_FASTDEBUG_PLAYER;
if(g_bFastDebug > 0) then
	g_iDuration = 3;
	g_iWondersRequired = 0;
	g_progressIncreaseBase = 10;
	g_progressIncrease = 10;
	g_progressIncreaseExponent = 1;
	g_progressVisibleDivisor = 1;
  g_iWondersRequiredForProgress = 0;
end
---------------------------------------------

local g_activePlayer = nil;

-- **********************************************************************************************************
-- ********************************************* INIT FUNCTIONS *********************************************
-- **********************************************************************************************************



-- ======================================================
-- LoadOrInit
-- ======================================================
function LoadOrInit(value, key, initializer, initValue)
  value = doload(key);
  -- since on turn 0 doload returns nil, init it
  if(value == nil) then
    -- initialize it
    if(type(initializer) == "function") then
      value = initializer(value, initValue);
    else
      value = initializer;
    end
    -- now, dosave it again to overwrite possible old data
    dosave(key, value);
  end
  return value;
end

-- ======================================================
-- InitializeTable
-- ======================================================
function InitializeTable(table, initValue)
	if(initValue == nil) then
		initValue = 0;
	end
  table = {};
  for idx, pPlayer in pairs(Players) do
    if IsValidMajorPlayer(pPlayer, false) then
			if(type(initValue) == "table") then
				local inits = {};
				for key, value in pairs(initValue) do
					inits[key] = value;
				end
				table[idx] = inits;
			else
				table[idx] = initValue;	
			end
      
    end
  end
  return table;
end

-- ======================================================
-- LoadData
-- ======================================================
function LoadData()
  Debug("Loading data...");
	--dosetCacheState(1);
  g_progressTable = LoadOrInit(g_progressTable, "cc_progressTable", InitializeTable);
  g_bribeTable = LoadOrInit(g_bribeTable, "cc_bribeTable", InitializeTable, {cooldown = -g_iBribeCooldown, n = 0}); --{cooldown = -GetSpeedScale("BribeCooldown"), n = 0});
  g_noOfElections = LoadOrInit(g_noOfElections, "cc_noOfElections", 0);
  g_bCommitteeFormed = LoadOrInit(g_bCommitteeFormed, "cc_bCommitteeFormed", false);
  g_bRaceInProgress = LoadOrInit(g_bRaceInProgress, "cc_bRaceInProgress", false);
  g_iCountdown = LoadOrInit(g_iCountdown, "cc_iCountdown", g_iDuration);
  g_iThreshold = LoadOrInit(g_iThreshold, "cc_iThreshold", 0);
  
  g_electedPlayerId = doload("cc_electedPlayerId");
  g_electedCityId = doload("cc_electedCityId");
  
	g_bPlayerHasMetElectedPlayer = LoadOrInit(g_bPlayerHasMetElectedPlayer, "cc_bPlayerHasMetElectedPlayer");
	g_bPlayerKnowsElectedCity = LoadOrInit(g_bPlayerKnowsElectedCity, "cc_bPlayerKnowsElectedCity");

	TM_Load(g_electedPlayerId, g_electedCityId);
end

-- ======================================================
-- LoadUI
-- ======================================================
function LoadUI()
  Debug("Loading UI...");
  if g_bCommitteeFormed then
    if g_bRaceInProgress then
			local player = GetPlayer();
      
			UpdateCCProgress();
			--LuaEvents.UpdateCCProgress(g_progressTable[player:GetID()], g_iThreshold, g_bribeTable[player:GetID()].cooldown, GetElectionProgress(player));
    else
      LuaEvents.UpdateCCCountdown(g_iCountdown, g_iDuration);
    end
  end
  
  LuaEvents.CCReloadUI();
end

-- ======================================================
-- Initialize
-- ======================================================
function Initialize()
	if(g_bInitialized) then
		return;
	end

	InitSaveData();
	InitXmlData();

	Debug("CCWorld_Init");
  CCWorld_Init();
	Debug("CCPopup_Init");
	CCPopup_Init();
	Debug("CCNot_Init");
	CCNot_Init();
	Debug("CCOver_Init");
	CCOver_Init();

	Debug("AI_Init");
	AI_Init();

  LoadData();
  LoadUI();

	g_bInitialized = true;
	Debug("Done Initializing");
end

-- ======================================================
-- OnLoadScreenClose
-- ======================================================
function OnLoadScreenClose()
	g_bInitialized = false;
  Initialize();
end
Events.LoadScreenClose.Add(OnLoadScreenClose);

-- **********************************************************************************************************

-- ======================================================
-- GetNextThreshold
-- ======================================================
function GetNextThreshold()
  local gameTurns = Game:GetElapsedGameTurns();
	return math.max(1, math.ceil(((g_progressIncreaseBase + (gameTurns * g_progressIncreaseTurnModifier) + (g_noOfElections * g_progressIncrease)) ^ g_progressIncreaseExponent) * GetSpeedScale("ThresholdModifier") / g_progressVisibleDivisor) * g_progressVisibleDivisor);
end

-- ======================================================
-- OnPlayerTurnStart
-- ======================================================
function OnPlayerTurnStart()
	Initialize();

	local player = GetPlayer();
	if(player ~= nil) then
		--Events.GameplayAlertMessage("[COLOR_FONT_RED]TEST 1 2; Born to be wiiild.[ENDCOLOR]");
		g_activePlayer = player;

		if not g_bCommitteeFormed then
			CCWorld_SwitchToMode("empty");
			if(g_bFastDebug > 0) then
				--Testing
				if(Game.GetElapsedGameTurns() >= g_bFastDebug) then
					FormCommittee(Players[g_fastDebugPlayer]);
				end
			else
			-- Traverse through all major players and check their wonder count
				local winners = {};
				local i = 0;
				for index, pPlayer in pairs(Players) do
					if IsValidMajorPlayer(pPlayer) then
						local iNumWonders = pPlayer:GetNumWorldWonders();
						if (iNumWonders >= g_iWondersRequired) then
							winners[i] = pPlayer;
							i = i + 1;
						end
					end
				end
				if(i > 0) then
					local element = GetRandomElement(winners, i);
					FormCommittee(element);
				end
			end
		else
			if g_bRaceInProgress then
				ContinueRace();
			else
				Countdown();
			end
		end
	end

	AI_Think_All();

	-- ui updates
	CCOver_OnUpdate();
end
Events.ActivePlayerTurnStart.Add(OnPlayerTurnStart);

-- ======================================================
-- StartRace
-- ======================================================
function StartRace()
  g_bRaceInProgress = true;
  g_iThreshold = GetNextThreshold();
  
  dosave("cc_bRaceInProgress", g_bRaceInProgress);
  dosave("cc_iThreshold", g_iThreshold);
  
  LuaEvents.CustomNotification(GameInfo.CCNotifications.NOTIFICATION_ELECTIONSTARTED, Locale.ConvertTextKey("TXT_KEY_CC_ELECTIONSTARTED_NOTIFICATION_TITLE"), Locale.ConvertTextKey("TXT_KEY_CC_ELECTIONSTARTED_NOTIFICATION_DESC"));
  LuaEvents.CCRaceStarted();
	UpdateCCProgress();
end

-- ======================================================
-- CalcCityMalus
-- ======================================================
-- Recursive function to calculate a value with diminuishing returns
-- (0.5, 1) = 0.5; (0.5, 2) = 0.25; (0.5, 3) = 0.375; etc
function CalcCityMalus(x, n)
	if(n <= 0) then
		return 0;
	elseif (n == 1) then
		return x;
	else
		return x ^ n + CalcCityMalus(x, n - 1);
	end
end

-- ======================================================
-- GetElectionProgress
-- ======================================================
function GetElectionProgress(player)
	local baseBonus = 0;
	local minorBonus = 0;
	local wonderBonus = 0;
	local cityMalus = 0;
	local bribeBonus = 0;
	local lastWinMalus = 0;
	local totalBonus = 0;
	

	local bIsAllowedToProgress = IsAllowedToProgress(player);
	if(bIsAllowedToProgress) then
		baseBonus = player:GetTotalJONSCulturePerTurn();
		minorBonus = math.floor(player:GetJONSCulturePerTurnFromMinorCivs() * g_iMinorCivCultureBonus);
		wonderBonus = math.floor(baseBonus * player:GetNumWorldWonders() * g_iWonderBonus);
		local tempBonus = baseBonus + minorBonus + wonderBonus;
		-- add now bribebonus
		if(g_bribeTable[player:GetID()].cooldown > 0) then
			bribeBonus = math.ceil(tempBonus * g_iBribeBonus);
			tempBonus = tempBonus + bribeBonus;
		end

		cityMalus = math.floor(tempBonus * CalcCityMalus(GetMapScale("CityMalusModifier"), player:GetNumCities() - 1));
		tempBonus = tempBonus - cityMalus;

		-- subtract now malus if the player has won the last election
		if(PlayerHasWonLastElection(player)) then
			lastWinMalus = math.floor(tempBonus * g_iLastWinMalus);
			tempBonus = tempBonus - lastWinMalus;	
		end
		
		
		totalBonus = math.max(tempBonus, 0);
	end

  return totalBonus, baseBonus, minorBonus, wonderBonus, cityMalus, bribeBonus, lastWinMalus, bIsAllowedToProgress;
end

-- ======================================================
-- IsAllowedToProgress
-- ======================================================
-- Determines if the player is allowed to get electionPoints
function IsAllowedToProgress(player)
	return IsValidMajorPlayer(player) and (player:GetNumWorldWonders() >= g_iWondersRequiredForProgress);
end

-- ======================================================
-- ContinueRace
-- ======================================================
-- returns true if a winner was found
function ContinueRace()
	Debug("Continuing the Race...");

  local candidates = {};
  local nCandidates = 0;
  
	for idx, pPlayer in pairs(Players) do
    if IsValidMajorPlayer(pPlayer) then
			-- counting down bribe cooldown
			if(g_bribeTable[idx].cooldown > -g_iBribeCooldown) then
				g_bribeTable[idx].cooldown = g_bribeTable[idx].cooldown - 1;
			end

			-- updating election progress
			local newValue = g_progressTable[idx] + GetElectionProgress(pPlayer);
      g_progressTable[idx] = newValue;
      if(newValue >= g_iThreshold) then -- a player won, add to winner list
				nCandidates = nCandidates + 1;
        candidates[nCandidates] = pPlayer;
      end
    end
  end

	dosave("cc_progressTable", g_progressTable);
	dosave("cc_bribeTable", g_bribeTable);
  
  -- randomly select winner, if there are more than one winners
  if(nCandidates > 0) then
    ElectWinner(candidates);
    LuaEvents.CCElected(g_electedPlayerId, g_electedCityId, g_noOfElections);
		AI_CheckForWin();
  else
    --LuaEvents.UpdateCCProgress(g_progressTable[player:GetID()], g_iThreshold, g_bribeTable[player:GetID()].cooldown, GetElectionProgress(player));
		UpdateCCProgress();
  end

  return nCandidates > 0;
end

-- ======================================================
-- ElectWinner
-- ======================================================
-- data: contains a list of candidates or the player that has formed the committee
function ElectWinner(data, bCommitteeFormed)
  if not bCommitteeFormed then 
		local player = GetRandomElement(data, #data, 1);
    SetElectedPlayer(player:GetID());
    SetElectedCity(ElectCity():GetID());

		g_noOfElections = dosave("cc_noOfElections", g_noOfElections + 1);
		-- reset the winners election points (save overflow)
		g_progressTable[g_electedPlayerId] = math.max(0, g_progressTable[g_electedPlayerId] - g_iThreshold);
		dosave("cc_progressTable", g_progressTable);

		g_bRaceInProgress = dosave("cc_bRaceInProgress", false);
		local year = Game.GetGameTurnYear();
		dosave("cc_electionYear", year);
		LuaEvents.CCPopupSelectNewWisdom();
		InitiateCountdown();
		NotifyAboutElection(false, true);

  else

		if(g_bUseCommitteeStart) then
			-- CommitteeStart -> give committee building to player's capital and start the race
			local capital = data:GetCapitalCity();
			--SetElectedPlayer(data:GetID());
			--SetElectedCity(capital:GetID());
			local building = GameInfo.BuildingClasses[g_committeeBuildingClass].DefaultBuilding;
			capital:SetNumRealBuilding(GameInfo.Buildings[building].ID, 1);
			
			NotifyAboutElection(true, false, data:GetID(), capital:GetID());
			StartRace();
			dosave("cc_iCountdown", nil);

		else
		  -- old mode; let the player win the first election
			SetElectedPlayer(data:GetID());
			SetElectedCity(Players[g_electedPlayerId]:GetCapitalCity():GetID());

			g_noOfElections = dosave("cc_noOfElections", g_noOfElections + 1);
			g_bRaceInProgress = dosave("cc_bRaceInProgress", false);
			local year = Game.GetGameTurnYear();
			dosave("cc_electionYear", year);
			LuaEvents.CCPopupSelectNewWisdom();
			InitiateCountdown();
			NotifyAboutElection(true, true);
		end

		Events.AudioPlay2DSound("AS2D_EVENT_NOTIFICATION_GOOD");
  end

end



-- ======================================================
-- SetElectedPlayer
-- ======================================================
function SetElectedPlayer(playerId)
  g_electedPlayerId = dosave("cc_electedPlayerId", playerId);
  --dosetshared("electedPlayerId", g_electedPlayerId);
end

-- ======================================================
-- SetElectedCity
-- ======================================================
function SetElectedCity(cityId)
  g_electedCityId = dosave("cc_electedCityId", cityId);
  --dosetshared("electedCityId", g_electedCityId);
end

-- Returns true if the given player/city is the cultural capital
function CCCapturedOrDestroyed(playerId, cityId)
	return not ((g_electedPlayerId == nil) or (g_electedPlayerId ~= playerId) or (g_electedCityId == nil) or (g_electedCityId ~= cityId));
end

function UpdateCCOnCapturedOrDestroyed(playerId, cityId, newPlayerId)
	Debug("g_electedPlayerId = " .. out(g_electedPlayerId) .. "; g_electedCityId = " .. out(g_electedCityId));
  if(not CCCapturedOrDestroyed(playerId, cityId)) then
		return;
	end

	Debug("The cultural capital was captured or destroyed! Player: " .. out(playerId) .. "; City: " .. out(cityId) .. "; NewPlayer: " .. out(newPlayerId));
  LuaEvents.CCDestroyedOrCaptured(playerId, cityId);
	
  LuaEvents.CCEnded();
	ResetValuesOnEnded();
  StartRace();
	dosave("cc_iCountdown", nil);
end

-- ======================================================
-- OnCityCaptured
-- ======================================================
function OnCityCaptured(hexPos, playerId, cityId, newPlayerId)
	Debug("City captured! Player: " .. out(playerId) .. "; City: " .. out(cityId) .. "; NewPlayer: " .. out(newPlayerId));
	UpdateCCOnCapturedOrDestroyed(playerId, cityId, newPlayerId);
end
Events.SerialEventCityCaptured.Add(OnCityCaptured);

-- ======================================================
-- OnCityDestroyed
-- ======================================================
function OnCityDestroyed(hexPos, playerId, cityId, newPlayerId)
	Debug("City destroyed! Player: " .. out(playerId) .. "; City: " .. out(cityId) .. "; NewPlayer: " .. out(newPlayerId));
	UpdateCCOnCapturedOrDestroyed(playerId, cityId, newPlayerId);
	
	-- check if the city contained the committee and give it to players capital if yes
	if(GameDefines.CC_USE_COMMITTEESTART ~= 1) then
		return;
	end

	if(not g_bCommitteeFormed) then
		return;
	end

	local committeePlayer, committeeCity = GetCommittee();

	local destroyedCity = Players[playerId]:GetCityByID(cityId);
	if(destroyedCity == nil) then
		return;
	end
	Debug("Destroyed City: " .. destroyedCity:GetName());
	local bHasCommittee = destroyedCity:IsHasBuilding(GameInfo.Buildings[GameInfo.BuildingClasses[GameDefines.CC_BUILDINGCLASS_COMMITTEE].DefaultBuilding].ID);
	if(bHasCommittee) then
		Debug("The city containing the committee has been destroyed - moving committee to new player " .. newPlayerId);
		
		local newPlayer = Players[newPlayerId];
		local newCity = newPlayer:GetCapitalCity();
		if (newPlayer ~= nil) and (newCity ~= nil) then
			-- moving it now to new city
			local building = GameInfo.BuildingClasses[g_committeeBuildingClass].DefaultBuilding;
			newCity:SetNumRealBuilding(GameInfo.Buildings[building].ID, 1);

			-- notify user about this
			local strLocation, location, bHasMetTeam, bKnowsCity = GetLocationInfo(GetPlayer(), newPlayer:GetID(), newCity:GetID());
			local toolTip = "";
			local title = "";

			title = Locale.ConvertTextKey("TXT_KEY_CC_COMMITTEEMOVED_NOTIFICATION", strLocation);
			toolTip = title;

			-- only notify about player when met
			local playerId = nil;
			if(bHasMetTeam) then
				playerId = newPlayer:GetID();
			end
			LuaEvents.CustomNotification(GameInfo.CCNotifications.NOTIFICATION_CULTURALCAPITAL, title, toolTip, {["location"] = location, ["playerId"] = playerId});
		else
		  print("### ERROR ### (CC.lua/OnCityDestroyed): Couldn't find player or city for new Committee");
		end

		Events.AudioPlay2DSound("AS2D_EVENT_NOTIFICATION_GOOD");
	end

end
Events.SerialEventCityDestroyed.Add(OnCityDestroyed);



-- ======================================================
-- OnThemeChosen
-- ======================================================
-- delegates event
function OnThemeChosen(playerId, cityId, theme, evals)
	dosave("cc_chosenTheme", theme);
	dosave("cc_chosenThemeEvals", evals);

	local player, city = GetPlayerCity(playerId, cityId);
	TM_SetChosenTheme(playerId, cityId, theme, evals);

	Debug(player:GetName().." has chosen theme "..theme.ccType.Type);

	local activePlayer = GetPlayer();

	-- inform player about chosen theme (if in same team or has a DoF or has Cultural Committee)
	if(
		player:GetID() ~= activePlayer:GetID()) and 
				(
				(player:GetTeam() == activePlayer:GetTeam()) or
				(player:IsDoF(activePlayer:GetID()) or
				((GameDefines.CC_USE_COMMITTEESTART == 1) and (activePlayer:GetBuildingClassCount(GameInfo.BuildingClasses[GameDefines.CC_BUILDINGCLASS_COMMITTEE].ID) > 0))
				)
		) then
			local title = Locale.ConvertTextKey("TXT_KEY_CC_PLAYER_THEMECHOSEN", player:GetName(), Locale.ConvertTextKey(theme.ccType.Title));
			local toolTip = title;
			LuaEvents.CustomNotification(GameInfo.CCNotifications.NOTIFICATION_THEMECHOSEN, title, toolTip, {["theme"] = theme});
	end

end
LuaEvents.CCThemeChosen.Add(OnThemeChosen);

-- ======================================================
-- ElectCity
-- ======================================================
function ElectCity()
  local electedPlayer = Players[g_electedPlayerId];

	if (electedPlayer == nil) then
    return nil;
  end  
  
  local totalPopulation = electedPlayer:GetTotalPopulation();
  local totalCulture = electedPlayer:GetJONSCulturePerTurnFromCities();
	local nCities = electedPlayer:GetNumCities();
  
  if nCities == nil then
    return nil;
  end
  
  -- Get now all cities that are larger than the average city size
  local avgPopulation = totalPopulation / nCities;
	local avgCulture = totalCulture / nCities;
	local popMod = math.ceil(avgPopulation * g_cityElectionPopMod);
	local cultureMod = math.ceil(avgCulture * g_cityElectionCultureMod);

  local cityTable = {};
  local i = 0;
  for pCity in electedPlayer:Cities() do
		if	(pCity:IsCapital()) or 
				(
					(pCity:GetOriginalOwner() == g_electedPlayerId) and
					(
						(pCity:GetPopulation() >= popMod) or
						(pCity:GetJONSCulturePerTurn() >= cultureMod)
					)
				) then
      cityTable[i] = pCity;
      i = i + 1;
    end
  end
  
  -- Select randomly a city from the list
	local city = GetRandomElement(cityTable, i);
	if(city ~= nil) then
		return city;
	end
  
  -- return the capital if everything else fails
  return electedPlayer:GetCapitalCity();
end

-- ======================================================
-- FormCommittee
-- ======================================================
-- Initiates the elections for cultural capitals
function FormCommittee(player)
  if(player == nil) then
		print("###ERROR### (CC.lua/FormCommittee) player is nil!");
		return;
	end
	g_bCommitteeFormed = dosave("cc_bCommitteeFormed", true);
  ElectWinner(player, true);
  LuaEvents.CCCommitteeFormed(g_electedPlayerId, g_electedCityId);
end

-- ======================================================
-- OnCommitteeFormed
-- ======================================================
-- For testing purposes
function OnCommitteeFormed(electedPlayerId, electedCityId)
	--[[
	local electedPlayer, electedCity = GetPlayerCity(electedPlayerId, electedCityId);
	local plot = electedCity:Plot();
	print("Plot num resource before="..plot:GetNumResource());
	print("Plot can haz resource "..tostring(plot:CanHaveResource(GameInfo.Resources.RESOURCE_IRON.ID, true)));
	plot:SetResourceType(GameInfo.Resources.RESOURCE_IRON.ID, 2);
	print("Plot num resource after="..plot:GetNumResource());
	]]
  -------- TESTING -------
  -- electedCity:CreateGreatGeneral(GameInfo.Units.UNIT_ENGINEER.ID); -- works
  --electedCity:CreateGreatGeneral(GameInfo.Units.UNIT_SPEARMAN.ID); -- "Great person as spearman!"
  -- electedCity:ChangeGreatPeopleUnitProgress(GameInfo.Units.UNIT_SCIENTIST.ID, 11); -- no idea
  --local i = electedCity:GetGreatPeopleRate();
	--print("GreatPeopleRateBefore="..i);
	--electedCity:ChangeBaseGreatPeopleRate(GameInfo.Specialists.SPECIALIST_SCIENTIST.ID, 2); -- no idea
	--electedCity:ChangeBaseGreatPeopleRate(GameInfo.Units.UNIT_SCIENTIST.ID, 1); -- no idea
	--electedCity:ChangeBaseGreatPeopleRate(1);
  -- electedCity:ChangePopulation(7, true); -- works fine (with 2nd parameter)
  -- electedPlayer:ChangeGoldenAgeTurns(10); -- works normally
  -- electedPlayer:ChangeGold(599); -- works
  -- electedPlayer:ChangeAnarchyNumTurns(5); -- works
  -- Players[0]:AddFreeUnit(66,6); -- adds 2 spearmen(unitId = 66) to player 0; second parameter = cityId?

  --electedPlayer:SetNumFreeTechs(electedPlayer:GetNumFreeTechs() + 10); -- doesnt work
  --electedPlayer:SetNumFreePolicies(electedPlayer:GetNumFreePolicies() + 10); -- doesnt trigger notification
	--electedPlayer:ChangeNumFreePolicies(1); -- works
  ------------------------
	--electedPlayer:ChangeHappinessFromGarrisonedUnits(11);
	--electedPlayer:ChangeHappinessFromBuildings(5);
end
LuaEvents.CCCommitteeFormed.Add(OnCommitteeFormed);

-- ======================================================
-- InitiateCountdown
-- ======================================================
function InitiateCountdown()
  g_iCountdown = dosave("cc_iCountdown", g_iDuration);
  LuaEvents.UpdateCCCountdown(g_iCountdown, g_iDuration);
end

-- ======================================================
-- Countdown
-- ======================================================
function Countdown()
	Debug("Counting down...");
  g_iCountdown = g_iCountdown - 1;
  
  if g_iCountdown < 1 then
		LuaEvents.CCEnded();
		ResetValuesOnEnded();
    StartRace();
		dosave("cc_iCountdown", nil);
  else
    LuaEvents.UpdateCCCountdown(g_iCountdown, g_iDuration);
		dosave("cc_iCountdown", g_iCountdown);
  end
  
	Debug("New Countdown value: " .. out(g_iCountdown));
end

function ResetValuesOnEnded()
	TM_CCEnded();
	dosave("cc_lastElectedPlayerId", g_electedPlayerId);
	dosave("cc_bPlayerHasChosenTheme", false);
	dosave("cc_electedPlayerId", nil);
	dosave("cc_electedCityId", nil);
end

-- ======================================================
-- NotifyAboutElection
-- ======================================================
-- creates a notification for the player
function NotifyAboutElection(bCommitteeFormed, bDoPersist, playerId, cityId)
	if(playerId == nil) then
		playerId = g_electedPlayerId;
	end

	if(cityId == nil) then
		cityId = g_electedCityId;
	end

  local bCommitteFormed = bCommitteeFormed or false;
  if (playerId ~= nil) and (cityId ~= nil) then
		local committeePlayer, committeeCity = GetCommittee();
		local bPlayerHasFormedCommittee = bCommitteeFormed and (committeePlayer:GetID() == Game.GetActivePlayer());
    local strLocation, location, bHasMetTeam, bKnowsCity = GetLocationInfo(GetPlayer(), playerId, cityId, bPlayerHasFormedCommittee);
    local toolTip = "";
		local title = "";

    if(bCommitteeFormed) then
			title = Locale.ConvertTextKey("TXT_KEY_CC_COMMITTEEFORMED_NOTIFICATION", strLocation);
    else
			local year = Game.GetGameTurnYear();
			local date = GetDate(year);
			title = Locale.ConvertTextKey("TXT_KEY_CC_WINNER_NOTIFICATION", date, strLocation);
    end
    if(bCommitteeFormed) then
      toolTip = Locale.ConvertTextKey("TXT_KEY_CC_WONDERSERECTED_NOTIFICATION", g_iWondersRequired).."[NEWLINE]"..title;
    else
      toolTip = title;
    end

		-- only notify about player when met
		local notifiyPlayerId = nil;
		if(bHasMetTeam) then
			notifiyPlayerId = playerId;
		end
		Debug("strLocation = " .. out(strLocation) .. "; location = " .. out(location) .. "; bHasMetTeam = " .. out(bHasMetTeam) .. "; bKnowsCity = " .. out(bKnowsCity));
    LuaEvents.CustomNotification(GameInfo.CCNotifications.NOTIFICATION_CULTURALCAPITAL, title, toolTip, {["location"] = location, ["playerId"] = notifiyPlayerId});

    if(bDoPersist) then
      g_bPlayerHasMetElectedPlayer = dosave("cc_bPlayerHasMetElectedPlayer", bHasMetTeam);
      g_bPlayerKnowsElectedCity = dosave("cc_bPlayerKnowsElectedCity", bKnowsCity);
    end
  end
end

-- ======================================================
-- UnitEvents
-- ======================================================
function OnRunCombatFunction(iAttackingPlayer, iAttackingUnit, iAttackingUnitDamage, iAttackingUnitFinalDamage, iAttackingUnitMaxHitPoints, iDefendingPlayer, iDefendingUnit, iDefendingUnitDamage, iDefendingUnitFinalDamage, iDefendingUnitMaxHitPoints, bContinuation)
	-- Event doesn't get fired, dunno why
end
Events.RunCombatSim.Add(OnRunCombatFunction);

function OnEndCombatFunction(iAttackingPlayer, iAttackingUnit, iAttackingUnitDamage, iAttackingUnitFinalDamage, iAttackingUnitMaxHitPoints, iDefendingPlayer, iDefendingUnit, iDefendingUnitDamage, iDefendingUnitFinalDamage, iDefendingUnitMaxHitPoints, bContinuation)
	-- Event doesn't get fired, dunno why
end
Events.EndCombatSim.Add(OnEndCombatFunction);

function OnUnitSetDamage(playerId, unitId, iDamage, iPreviousDamage)
	TM_UnitSetDamage(playerId, unitId, iDamage, iPreviousDamage);
end
Events.SerialEventUnitSetDamage.Add(OnUnitSetDamage);


function OnBribe(player)
	local bCanBribe, _, bribeAmount = PlayerCanBribe(player, g_bribeTable);
	if(not bCanBribe) then
		print("Player "..player:GetName().." wanted to bribe, but isn't allowed to.");
		return;
	end
	local entry = g_bribeTable[player:GetID()];
	entry.cooldown = g_iBribeDuration;
	entry.n = entry.n + 1;
	dosave("cc_bribeTable", g_bribeTable);
	player:ChangeGold(-bribeAmount);

	Debug("+++ BRIBE: Player "..player:GetName().." bribed the Committee for "..bribeAmount.." Gold.");

	if(player:GetID() == Game.GetActivePlayer()) then
		UpdateCCProgress();
	end
end
LuaEvents.CCBribe.Add(OnBribe);

function UpdateCCProgress()
	local player = GetPlayer();
	LuaEvents.UpdateCCProgress(g_progressTable[player:GetID()], g_iThreshold, g_bribeTable[player:GetID()].cooldown, GetElectionProgress(player));
end




--------------------------------------------------------------
--------------------------------------------------------------
-- AI FUNCTIONS
--------------------------------------------------------------
--------------------------------------------------------------
-- ======================================================
-- AI_ChooseForAI
-- ======================================================
-- called after winner has been elected
function AI_CheckForWin()
	local player = Players[g_electedPlayerId];
	if(not player:IsHuman()) then
		AI_ChooseForAI();
	end
end

-- Main function that gets called when an AI wins the cultural Capital
function AI_ChooseForAI()
	--AI_ChooseRandom();
	AI_ChooseTheme();
end

local ai_happinessThreshold = GameDefines.CC_AI_NEEDS_HAPPINESS_THRESHOLD;
local ai_goldThreshold = GameDefines.CC_AI_NEEDS_GOLD_THRESHOLD;
local ai_incomeThreshold = GameDefines.CC_AI_NEEDS_INCOME_THRESHOLD;

local g_needs;

function AI_ResetNeeds()
	g_needs = {};
end

-- priority: the lower the number the higher its priority
function AI_AddNeed(need, priority)
	table.insert(g_needs, {["type"] = need, ["priority"] = priority});
end

function AI_HasNeeds()
	return #g_needs > 0;
end

-- returns immediate needs
function AI_GetNeeds()
	local player, city = GetPlayerCity(g_electedPlayerId, g_electedCityId);

	Debug("AI: Getting Needs");
	AI_ResetNeeds();
	
	-- happiness
	local bNeedsHappiness = (player:GetHappiness() <= ai_happinessThreshold);
	if(bNeedsHappiness) then
		AI_AddNeed("FLAVOR_HAPPINESS", 2);
	end

	-- gold
	local gold = player:GetGold() * GetSpeedScale("GlobalModifier");
	local bNeedsGold = (gold < ai_goldThreshold) and (player:CalculateGoldRate() < ai_incomeThreshold);
	if(bNeedsGold) then
		AI_AddNeed("FLAVOR_GOLD", 2);
	end

	-- hitpoints
	local bNeedsDefense = (city:GetDamage() > 0);
	if(bNeedsDefense) then
		AI_AddNeed("FLAVOR_CITY_DEFENSE", 1);
	end
	
	-- food
	local bNeedsFood = (city:FoodDifference() < 0);
	if(bNeedsFood) then
		AI_AddNeed("FLAVOR_GROWTH", 3);
	end

	table.sort(g_needs, function(a, b) return (a.priority < b.priority) end);
end

-- returns the theme that covers the needs the best (evaluated by flavor value)
function AI_PickByNeed(need, viableThemes)
	local highestValue = -1000;
	local chosenTheme = nil;
	local cached = nil;

	--for row in GameInfo.CCType_Flavors{FlavorType = need.type} do
	for key, theme in ipairs(viableThemes) do
		for _, flavor in pairs(theme.ccFlavors) do
			if(flavor.FlavorType == need.type) then
				if(flavor.Flavor > highestValue) then
					cached = {};
					cached[1] = theme;
					highestValue = flavor.Flavor;
				elseif(flavor.Flavor == highestValue) then
					cached[#cached + 1] = theme;
				end
			end
		end
	end

	-- needs can't be satisfied
	if(cached == nil) then
		return nil;
	end

	return GetRandomElement(cached, nil, 1);
end

-- Checks if it makes sense to pick that theme
function AI_IsViableTheme(theme)
	if(theme.ccType.AIViabilityContext == nil) then
		return true;
	end

	local ctx = GameInfo.CCAIViabilityContexts[theme.ccType.AIViabilityContext];

	if(ctx.Type == "NOT_VIABLE") then
		return false;
	end

	local player, city = GetPlayerCity(g_electedPlayerId, g_electedCityId);

	if(ctx.Type == "CONTROVERSY_CHECK") then
		return (player:GetUnhappinessFromCityCount() * (1 + ctx.Value)) > 0;

	elseif(ctx.Type == "EXCHANGE_CHECK") then
		local value = player:GetCityConnectionGold() * GetSpeedScale("GlobalModifier");
		return (value >= ctx.Value);

	elseif(ctx.Type == "ECOLOGY_CHECK") then
		return (city:CountNumWaterPlots() >= ctx.Value);

	elseif(ctx.Type == "ARCHITECTURE_CHECK") then
		if(not city:IsProductionBuilding()) then
			return false;
		end
		local buildingClass = GameInfo.BuildingClasses[GameInfo.Buildings[city:GetProductionBuilding()].BuildingClass];
		-- building is not a wonder
		if(buildingClass.MaxGlobalInstances < 1) then
			return false;
		end
		local turnsLeft = city:GetProductionTurnsLeft();
		return (turnsLeft > (ctx.Value * GetSpeedScale("GlobalModifier")));

	elseif(ctx.Type == "GEOLOGY_CHECK") then
		local resources = {GameInfo.Resources.RESOURCE_GEMS.ID, GameInfo.Resources.RESOURCE_GOLD.ID, GameInfo.Resources.RESOURCE_SILVER.ID, GameInfo.Resources.RESOURCE_MARBLE.ID, GameInfo.Resources.RESOURCE_PEARLS.ID, GameInfo.Resources.RESOURCE_IRON.ID, GameInfo.Resources.RESOURCE_COAL.ID, GameInfo.Resources.RESOURCE_ALUMINUM.ID, GameInfo.Resources.RESOURCE_URANIUM.ID, GameInfo.Resources.RESOURCE_COPPER.ID, GameInfo.Resources.RESOURCE_SALT.ID };
		local sum = 0;
		for key, value in ipairs(resources) do
			if(city:IsHasResourceLocal(value)) then
				sum = sum + 1;
			end
			if(sum >= ctx.Value) then
				return true;
			end
		end
		return false;

	else
		print("### Warning ###: CCAIViabilityContext "..ctx.Type.." not found!");
	end

	return false;
end

-- Gets the leaders flavors and picks the themes according to them
function AI_PickByFlavor(viableThemes)
	local player = Players[g_electedPlayerId];
	local myCivType = player:GetCivilizationType();
	local myCivInfo = GameInfo.Civilizations[myCivType];
	local leader = GameInfo.Leaders("Type = '"..GameInfo.Civilization_Leaders("CivilizationType = '"..myCivInfo.Type.."'")().LeaderheadType.."'")();
	local wList = {};
	local flavors = GetLeaderFlavors(player);

	for key, theme in ipairs(viableThemes) do
		--print("theme = "..out(theme.ccType.Type));
		local value = 0;
		-- create now a sum of all flavors * leader flavor for that flavortype
		for _, flavor in pairs(theme.ccFlavors) do
			value = value + (flavor.Flavor * flavors[flavor.FlavorType]);
		end
			
		wList[key] = value;
	end

	return viableThemes[GetRandomByWeight(wList, 3)];
end

-- ======================================================
-- AI_ChooseTheme
-- ======================================================
-- Better AI Handling function that picks Theme based on immediate needs and flavors
function AI_ChooseTheme()
	local allowedTypes, notAllowedTypes = GetAllowedCCTypes(g_electedPlayerId, g_electedCityId);
	local viableThemes = {};
	-- create a list containing only viable themes
	for key, theme in ipairs(allowedTypes) do
		if AI_IsViableTheme(theme) then
			table.insert(viableThemes, theme);
		end
	end

	--Debug("viableThemes: "..out(viableThemes));
	local chosenTheme = nil;
	-- pick by Needs
	AI_GetNeeds();
	if(AI_HasNeeds()) then
		Debug("AI: Choosing a Theme by Needs!");
		-- traverse through all needs (which are sorted by priority)
		for key, value in ipairs(g_needs) do
			chosenTheme = AI_PickByNeed(value, viableThemes);
			if(chosenTheme ~= nil) then
				break;
			end
		end
	end

	-- no need encountered or nothing available to satisfy needs => pick by flavor and (some) reason
	if(chosenTheme == nil) then
		Debug("AI: Choosing a Theme by Flavors!");
		chosenTheme = AI_PickByFlavor(viableThemes);
	end

	-- if chosenTheme is still nil, then choose a random one
	if(chosenTheme == nil) then
		Debug("AI: Choosing a Random Theme!");
		AI_ChooseRandom(viableThemes);
		return;
	end

	--Debug("AI: ChosenTheme = "..out(chosenTheme));
	LuaEvents.CCThemeChosen(g_electedPlayerId, g_electedCityId, chosenTheme, GetEvaluatedTheme(g_electedPlayerId, chosenTheme));
end

-- ======================================================
-- AI_ChooseRandom
-- ======================================================
-- Stupid AI Handling by choosing a random Theme
function AI_ChooseRandom(allowedTypes)
	if(allowedTypes == nil) then
		allowedTypes, notAllowedTypes = GetAllowedCCTypes(g_electedPlayerId, g_electedCityId);
	end

	-- convert allowedTypes table to new table with indexed values for random grabbing
	--local indexedTable, size = ConvertToIndexedTable(allowedTypes);
	local randTheme = GetRandomElement(allowedTypes, nil, 1);
	--local theme = GetCCTypeData(randTheme);
	local evals = GetEvaluatedTheme(g_electedPlayerId, randTheme);
	LuaEvents.CCThemeChosen(g_electedPlayerId, g_electedCityId, randTheme, evals);
end

-- Gets called on ai turn start
function AI_Think_All()
	--Debug(".oOoooooO AI_Think_All() OoooooOo.");

	AI_CreateBriberyList();

	for idx, player in pairs(Players) do
		if(IsValidMajorPlayer(player) and not player:IsHuman()) then
			AI_Think(player);
		end
	end

end

-- Main think function for each ai player
function AI_Think(player)
	--Debug(".oO "..player:GetName().." is Thinking() Oo.");
	if(g_bRaceInProgress) then
		AI_CheckBribery(player);
	end
end

function AI_Init()
	for idx, player in pairs(Players) do
		if(IsValidMajorPlayer(player) and not player:IsHuman()) then

			AI_CreateFlavorProbs(player);

		end
	end
end


-- ======================================================
-- ======================================================
--------- Bribery Functions ---------
-- ======================================================
-- ======================================================

local b_flavorThreshold = 10;
local b_cultureWeight = GameDefines.CC_AI_BRIBE_FLAVOR_CULTURE_WEIGHT;
local b_wonderWeight = GameDefines.CC_AI_BRIBE_FLAVOR_WONDER_WEIGHT;
local b_infraWeight = GameDefines.CC_AI_BRIBE_FLAVOR_INFRASTRUCTURE_WEIGHT;
local b_growthWeight = GameDefines.CC_AI_BRIBE_FLAVOR_GROWTH_WEIGHT;
local b_minGoldNeededMod = GameDefines.CC_AI_BRIBE_MINGOLDNEEDED_MOD;
local b_alwaysBribeMod = GameDefines.CC_AI_BRIBE_ALWAYSBRIBE_MOD;
local b_turnsScale = GetSpeedScale("GlobalModifier");
local b_lowerLimit = math.floor(2 * b_turnsScale);


local b_probs = {};
function AI_ResetProbs()
	b_probs = {};
end

function AI_AddProb(prob)
	if(type(prob) == "table") then
		for i, value in ipairs(prob) do
			AI_AddProb(value);
		end
	else
		table.insert(b_probs, prob);
	end
end

function AI_CalcProb(mode)
	local mode = mode or 0;
	if(#b_probs == 0) then
		return 0;
	end

	if(mode == 0) then
		local sum = 0;
		for idx, value in ipairs(b_probs) do
			sum = sum + value;
		end

		return sum / #b_probs;
	else
		local mult = 1;
		for idx, value in ipairs(b_probs) do
			mult = mult * value;
		end

		return mult;
	end
end

local b_bribeCompPercents = 0.66;
local b_bribeCompTable = {};

function AI_CreateBriberyList()
	if(not g_bRaceInProgress) then
		return;
	end

	--Debug("AI: Creating bribery competitiveness list");
	-- okay here we have a little cheating for the ai (for faster performance)
	b_bribeCompTable = {};
	for idx, player in pairs(Players) do
		if(IsValidMajorPlayer(player)) then
			if(g_progressTable[idx] > (g_iThreshold * b_bribeCompPercents)) then
				table.insert(b_bribeCompTable, idx);
			end
		end
	end
end

local b_totalFlavorWeight = (b_flavorThreshold / 10) * (b_cultureWeight + b_wonderWeight + b_infraWeight + b_growthWeight);
local b_flavorProbs = {};

function AI_CreateFlavorProbs(player)
	local entry = b_flavorProbs[player:GetID()];
	if(entry == nil) then
		local flavors = GetLeaderFlavors(player);
		entry = {
							b_cultureWeight * flavors.FLAVOR_CULTURE / b_flavorThreshold,
							b_wonderWeight * flavors.FLAVOR_WONDER / b_flavorThreshold,
							b_infraWeight * flavors.FLAVOR_INFRASTRUCTURE / b_flavorThreshold,
							b_growthWeight * flavors.FLAVOR_GROWTH / b_flavorThreshold
						};
	end
	return entry;
end

function AI_GetFlavorProbs(player)
	local entry = b_flavorProbs[player:GetID()];
	if(entry == nil) then
		return AI_CreateFlavorProbs(player);
	end

	return entry;
end

function AI_CheckBribery(player)
	local bPlayerCanBribe, iFail, iBribeAmount = PlayerCanBribe(player, g_bribeTable);
	if(not bPlayerCanBribe) then
		--Debug("AI is not allowed to bribe: "..tostring(iFail));
		return;
	end
	
	-- check if it has enough gold for that
	local gold = player:GetGold();
	if(gold < (iBribeAmount * b_minGoldNeededMod)) then
		--Debug("AI has not enough gold");
		return;
	end

	-- also don't consider bribing with negative income
	local income = player:CalculateGoldRate();
	if(income < 0) then
		--Debug("AI has not enough income");
		return;
	end

	-- no progress no bribing
	local iTotal = GetElectionProgress(player);
	if(iTotal <= 0) then
		--Debug("AI has no election progress per turn");
		return;
	end

	-- player has waaaaay too much gold, so let him bribe
	if(gold > (iBribeAmount * b_alwaysBribeMod)) then
		LuaEvents.CCBribe(player);
		return;
	end

	AI_ResetProbs();

	local iProgress = g_progressTable[player:GetID()];
	local turnsRemaining, iPercents = GetTurnsRemaining(iProgress, iTotal, g_iThreshold);
	-- calculate new gain if the ai bribes
	local newTotal = g_iBribeBonus * iTotal;
	local bPlayerHasWonLast = PlayerHasWonLastElection(player);
	if(bPlayerHasWonLast) then
		newTotal = newTotal * g_iLastWinMalus;
	end
	local est = GetTurnsRemaining(iProgress, newTotal, g_iThreshold);
	-- dont bribe if he will next round anyways or the bribing won't effect the turns remaining
	if(turnsRemaining <= b_lowerLimit) or (est == turnsRemaining) then
		--Debug("AI doesnt bribe because it doesnt pay off (by turns)");
		return;
	end

	AI_AddProb(AI_GetFlavorProbs(player));

	-- Increase probability if he has above average flavor
	local flavorProb = AI_CalcProb(1);
	local flavorProb = math.min(3, 0.1 + ((flavorProb ^ 3) / b_totalFlavorWeight));
	

	-- check competitiveness level
	local competitiveness = #b_bribeCompTable;
	-- if player is also over comppercents, remove him from comp
	if(iPercents > b_bribeCompPercents) then
		competitiveness = math.max(0, competitiveness - 1);
	end

	local compProb = 1.0;
	local imminentProb = 1.0;
	--Debug("AI Competitiveness="..competitiveness);
	if(est <= (g_iBribeDuration * 1.5)) and (competitiveness > 0) then
		imminentProb = 1 + (1 / (2 * math.max(1, math.abs(est - g_iBribeDuration))) );
		--Debug("AI imminentProb = "..imminentProb);
		-- increased chance of bribing if he is close to win and there is competition
		compProb = 1.5 - ((competitiveness - 1) / 10); -- see too much competition as a bad thing
		--Debug("AI competitiveness prob = "..compProb);
	else
		-- if player has won the last election, don't bribe since it isn't effective (only bribe if it has a shot to win); only consider if it is swimming in gold
		if(bPlayerHasWonLast) then
			--Debug("AI doesnt bribe because it won last round");
			return;
		end
	end

	local prob = flavorProb * compProb * imminentProb;
	--Debug("prob for player "..player:GetName().." = "..tostring(prob)); 
	local turnsProb = math.floor((prob / (turnsRemaining * b_turnsScale)) * 1000);
	--Debug("turnsProb = "..tostring(turnsProb));

	local rand = Game.Rand(1001, "(Lua::CC.lua::AI_CheckBribery) Bribery Check per turn");
	--Debug("Rolled "..rand);
	if(rand < turnsProb) then
		LuaEvents.CCBribe(player);
	end

end