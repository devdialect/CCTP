if(Game.GetCustomOption("GAMEOPTION_CULTURALCAPITALS") == 0) then
	return;
end

-- CC
-- Author: Moaf
--------------------------------------------------------------
include("CCStorage");
dosetCacheState(0);


local g_fastDebug = (GameDefines.CC_FASTDEBUG > 0);
local g_doDebug = (GameDefines.CC_DEBUG == 1);

-- ======================================================
-- Debug
-- ======================================================
function Debug(message)
  if g_doDebug then
    print(message);
  end
end

-- returns the player object of the active human player
function GetPlayer()
	local iPlayerID = Game.GetActivePlayer();
	if (iPlayerID < 0) then
		Debug("Error - player index not correct");
		return nil;
	end

	if (not Players[iPlayerID]:IsHuman()) then
		Debug("Error - player is not human");
		return nil;
	end;

	return Players[iPlayerID];
end

function IsValidMajorPlayer(pPlayer, bCityCheckRequired)
	if(bCityCheckRequired == nil) then
	  bCityCheckRequired = true;
	end
	local bCityCheckResult = true;
	if(bCityCheckRequired) then
		bCityCheckResult = (pPlayer:GetNumCities() > 0);
	end
  return (pPlayer ~= nil) and pPlayer:IsAlive() and not pPlayer:IsMinorCiv() and not pPlayer:IsBarbarian() and bCityCheckResult;
end

function GetWinnerVisibilityInfo(instigatingPlayer)
	local playerId, cityId = LoadWinner();
	local player, city = GetPlayerCity(playerId, cityId);
	return GetElectionVisibilityInfo(instigatingPlayer, player, city);
end

function GetElectionVisibilityInfo(instigatingPlayer, player, city)
	if (instigatingPlayer == nil) or (player == nil) or (city == nil) then
		return false, false;
	end
	if(instigatingPlayer:GetID() == player:GetID()) then
		return true, true;
	end

	local instTeam = Teams[instigatingPlayer:GetTeam()];
	local bHasMetTeam = instTeam:IsHasMet(player:GetTeam());
	local bCityIsRevealed = city:IsRevealed(instTeam);

	return bHasMetTeam, bCityIsRevealed;
end

-- Evaluates the visibility of the given city and returns a corresponding textual representation and its location if necessary
function GetLocationInfo(instigatingPlayer, playerId, cityId, bPlayerHasFormedCommittee)
	local bPlayerHasFormedCommittee = bPlayerHasFormedCommittee or false;
	local player, city = GetPlayerCity(playerId, cityId);
  if (instigatingPlayer == nil) or (player == nil) or (city == nil) then
    return nil, nil, nil, nil;
  end
  
	local bPlayerHasWon = PlayerHasWon(instigatingPlayer:GetID());
  local bHasMetTeam, bCityIsRevealed = GetElectionVisibilityInfo(instigatingPlayer, player, city);
  local location = nil;
	if(bCityIsRevealed) then
		location = {city:GetX(), city:GetY()};
	end

  local cityStr = GetCityName(city);


  if bPlayerHasWon or bPlayerHasFormedCommittee then
    return "[COLOR_FONT_GREEN]"..cityStr.."[ENDCOLOR]", location, true, true;
  else
		local bHasCommittee = PlayerHasCommittee(instigatingPlayer:GetID());
		
    if bHasMetTeam or bHasCommittee then
      if bCityIsRevealed or bHasCommittee then
				-- player has the committee -> he is allowed to see the winner and theme
				--if bHasCommittee then
				--	location = nil;
				--end

        return "[COLOR_FONT_RED]"..cityStr.." ("..player:GetName()..")[ENDCOLOR]", location, bHasMetTeam, bCityIsRevealed;
      else
				
        return "[COLOR_FONT_RED]"..player:GetName().."[ENDCOLOR]", nil, bHasMetTeam, bCityIsRevealed;
      end
    else
      return "[COLOR_FONT_RED]"..Locale.ConvertTextKey("TXT_KEY_CC_DISTANT_CIV").."[ENDCOLOR]", nil, bHasMetTeam, bCityIsRevealed;
    end
  end
end



function GetNotificationData(notificationType, playerId, cityId, bIsViewAll)
	--local popupInfo = {
		--Type = NotificationTypes.NOTIFICATION_POLICY,
		--Data1 = -1,
		--Data2 = -1,
		--Data3 = -1,
		--Option1 = false,
		--Option2 = false;
	--}
	--local popupInfo = {
		--Type = ButtonPopupTypes.BUTTONPOPUP_CHOOSEPRODUCTION,
		--Data1 = cityID,
		--Data2 = -1,
		--Data3 = -1,
		--Option1 = false,
		--Option2 = false;
	--}

  local data = {};
	local nType = GameInfo.CCPopupTypes[notificationType];
	if(nType == nil) then
		print("### ERROR ### NotifictionType "..notifictionType.." not found!");
	end
  data.Type = nType.ID;
  if(playerId ~= nil) then
    data.Data2 = playerId;
  end
  if(cityId ~= nil) then
    data.Data3 = cityId;
  end
	if(bIsViewAll ~= nil) then
		data.Option1 = true;
	end

  return data;
end

function GetCityName(city)
  if city == nil then
    print("Warning: city is nil");
    return "";
  end
  
  local cityStr = city:GetName();
  if(city:IsCapital()) then
    cityStr = "[ICON_CAPITAL]"..cityStr;
  end
  return cityStr;
end

-- Gets a theme and adds the evaluated bonuses to it; returns theme and corresponding bonus evals
function GetEvaluatedTheme(playerId, theme)
	local player = Players[playerId];
	local noOfElections = doload("cc_noOfElections");
	local evals = {};
	for key, value in pairs(theme.ccBonuses) do
		local eraBonus = player:GetCurrentEra() * value.IncreasePerEra;
		local electionBonus = noOfElections * value.IncreasePerElection;
		local eval = value.BaseValue + eraBonus + electionBonus;

		-- scale eval if necessary
		if(value.SpeedScaler ~= nil) then
			local scale = GetSpeedScale(value.SpeedScaler);
			eval = eval * scale;
		end

		if(value.MapScaler ~= nil) then
			local scale = GetMapScale(value.MapScaler);
			eval = eval * scale;
		end
		evals[key] = eval;
	end

	return evals;
end

function LoadWinner()
	local playerId = doload("cc_electedPlayerId");
	if(playerId == nil) then
		return nil, nil, nil;
	end
	local player = Players[playerId];
	local cityId = doload("cc_electedCityId");
	if(cityId == nil) then
		return nil, nil, nil;
	end
	local city = player:GetCityByID(cityId);
	local team = Teams[player:GetTeam()];
	return playerId, cityId, team;
end

-- returns the highest value and the index of an indexed table
function GetHighestValue(table)
	if(#table) < 1 then
		return;
	end

	local highest, highestIdx = table[1], 1;
	for idx, value in ipairs(table) do
		if(value > highest) then
			highest = value;
			highestIdx = idx;
		end
	end

	return highest, highestIdx;
end

function ConvertToIndexedTable(t)
	local indexedTable = {};
	for key, value in pairs(t) do
		local entry = { ["key"] = key, ["value"] = value };
		table.insert(indexedTable, entry);
	end

	return indexedTable;
end

function GetRandomElement(indexedTable, size, offset)
	if(indexedTable == nil) then
		return nil;
	end

	if(size == nil) then
		size = #indexedTable;
	end

	if(size == 0) then
		return nil;
	end

	local rand = Game.Rand(size, "(Lua::MoafsUltils.lua::GetRandomElement) Random Element from Table"); -- {0, i-1}
	if(offset ~= nil) then
		rand = rand + offset;
	end
	return indexedTable[rand];
end

local g_mapType = GameInfo.Worlds[Map.GetWorldSize()];
local g_mapScale = GameInfo.CCMapScales[g_mapType.Type] or GameInfo.CCMapScales.WORLDSIZE_STANDARD;
local g_speedType = GameInfo.GameSpeeds[Game.GetGameSpeedType()];
local g_speedScale = GameInfo.CCSpeedScales[g_speedType.Type] or GameInfo.CCSpeedScales.GAMESPEED_STANDARD;

function GetMapScale(property)
	return g_mapScale[property];
end

function GetSpeedScale(property)
	return g_speedScale[property];
end

function GetDashString()
	return "[NEWLINE]-----------------[NEWLINE]";
end

function PlayerHasCommittee(playerId)
	if(GameDefines.CC_USE_COMMITTEESTART ~= 1) then
		return false;
	end

	local player = Players[playerId]; 
	if (player == nil) then
		return false;
	end

	return (player:GetBuildingClassCount(GameInfo.BuildingClasses[GameDefines.CC_BUILDINGCLASS_COMMITTEE].ID) > 0);
end

function PlayerHasWon(playerId)
	local electedPlayerId = LoadWinner();
	if(electedPlayerId == nil) then
		return false;
	end
	return (electedPlayerId == playerId);
end

function PlayerHasWonLastElection(player)
	local lastPlayerId = doload("cc_lastElectedPlayerId");
	if(lastPlayerId == nil) then
		return false;
	end
	return (player:GetID() == lastPlayerId);
end


local g_bribeAllowed = (GameDefines.CC_BRIBE_ALLOWED == 1);
local g_bribeCooldown = GetSpeedScale("BribeCooldown");
local g_iBribeBaseCost = GameDefines.CC_BRIBE_BASECOST;
local g_iBribeIncreasePerBribe = GameDefines.CC_BRIBE_COSTINCREASE_PERBRIBE;
local g_iBribeIncreasePerEra = GameDefines.CC_BRIBE_COSTINCREASE_PERERA;

function GetBribeAmount(player, bribeTable)
	local bribeTable = bribeTable or doload("cc_bribeTable");
	return math.floor((g_iBribeBaseCost + (player:GetCurrentEra() * g_iBribeIncreasePerEra) + ( bribeTable[player:GetID()].n * g_iBribeIncreasePerBribe )) * GetSpeedScale("GlobalModifier"));
end

function PlayerCanBribe(player, bribeTable)

	if(not g_bribeAllowed) then
		return false, 0;
	end

	if(not (doload("cc_bRaceInProgress") or false)) then
		return false, 1;
	end

	local bribeTable = bribeTable or doload("cc_bribeTable");
	if(bribeTable == nil) then
		print("### Error ### BribeTable is nil!");
		return false, 0;
	end

	if(bribeTable[player:GetID()].cooldown > -g_bribeCooldown) then
		return false, 2;
	end

	local bribeAmount = GetBribeAmount(player, bribeTable);
	if(player:GetGold() < bribeAmount) then
		return false, 3, bribeAmount;
	end

	return true, 0, bribeAmount;
end

-- returns the estimated turns remaining and the completed percents
function GetTurnsRemaining(iProgress, iGain, iThreshold)
	return math.abs(math.max(0, math.ceil((iThreshold - iProgress) / iGain))), (iProgress / iThreshold);
end

local g_iFuzziness = GameDefines.CC_OVERVIEW_PROGRESS_FUZZINESS;

function GetFuzzyProgress(progress, threshold)
	local segmentSize = (threshold / g_iFuzziness);
	local fuzzied = math.floor(progress / segmentSize) + 1;
	return fuzzied, (fuzzied / g_iFuzziness);
end

local g_flavors = {};

function GetLeaderFlavors(player)
	local id = player:GetID();
	local entry = g_flavors[id];
	if(entry == nil) then
		local myCivType = player:GetCivilizationType();
		local myCivInfo = GameInfo.Civilizations[myCivType];
		local leader = GameInfo.Leaders("Type = '"..GameInfo.Civilization_Leaders("CivilizationType = '"..myCivInfo.Type.."'")().LeaderheadType.."'")();
		entry = {};
		for row in GameInfo.Leader_Flavors{LeaderType = leader.Type} do
			entry[row.FlavorType] = row.Flavor;
		end
	end

	return entry;
end

function GetLeaderFlavor(player, flavor)
	return GetLeaderFlavors(player)[flavor];
end

-- Picks an item from the list; iBest defines if there only e.g. the best three entries to consider for picking
function GetRandomByWeight(wList, iBest)
	local idxList = ConvertToIndexedTable(wList);
	
	table.sort(idxList, function (a, b) return (a.value > b.value) end);
	
	local size = math.min(iBest, #idxList);

	-- get the summed weight and create boundaries for random picking
	local bounds = {};
	local weight = 0;
	for i = 1, size do
		weight = weight + idxList[i].value;
		bounds[i] = weight;
	end

	-- now pick by weight
	local random = 1 + Game.Rand(weight, "(Lua::MoafsUtils.lua::PickBestFromWeightedList) Random weight");
	for i = 1, size do
		if(random <= bounds[i]) then
			return idxList[i].key, idxList[i].value;
		end
	end
end

-- Returns a string containing the date representation of the given int value
function GetDate(iYear)
	if(iYear < 0) then
		return Locale.ConvertTextKey("TXT_KEY_TIME_BC", math.abs(iYear));
	else
		return Locale.ConvertTextKey("TXT_KEY_TIME_AD", math.abs(iYear));
	end
end

-- Returns (player, city) having the committee
-- returns (nil, nil) if not found
function GetCommittee()
	for _, player in pairs(Players) do
		if(PlayerHasCommittee(player:GetID())) then
			for city in player:Cities() do
				if(city:IsHasBuilding(GameInfo.Buildings[GameInfo.BuildingClasses[GameDefines.CC_BUILDINGCLASS_COMMITTEE].DefaultBuilding].ID)) then
					return player, city;
				end
			end

			return nil, nil;
		end
	end

	return nil, nil;
end

-- returns the player and city instances (player, city)
function GetPlayerCity(playerId, cityId)
	local player = Players[playerId];
	if(player == nil) then
		return nil, nil;
	end

	local city = player:GetCityByID(cityId);
	return player, city;
end