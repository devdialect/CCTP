if(Game.GetCustomOption("GAMEOPTION_CULTURALCAPITALS") == 0) then
	return;
end
-- CCxOverview
-- Author: Moaf
-- DateCreated: 2/8/2011 10:16:43 AM
--------------------------------------------------------------
include("MoafsUtils");
include("IconSupport");
include("CCStorage");
include("CCXmlData");
include("CCWhysUtils");

-- history void sorting
local m_SortTable;
local eYear = 0;
local eWinner = 1;
local eCity = 2;
local eTheme = 3;
local eId = 4;
local m_SortMode = eYear;
local m_bSortReverse = true;
local g_showAllOption = true;

-- progress view sorting
local pm_SortTable;
local pePlayer = 0;
local peProgress = 1;
local peWins = 2;
local pm_SortMode = peProgress;
local pm_bSortReverse = true;


local g_ccOverview = ContextPtr:LookUpControl("../CCOverview/");
local g_closeButton = ContextPtr:LookUpControl("../CCOverview/CloseButton");
local g_mainStack = ContextPtr:LookUpControl("../CCOverview/MainStack");
local g_scrollPanel = ContextPtr:LookUpControl("../CCOverview/ScrollPanel");
local g_scrollBar = ContextPtr:LookUpControl("../CCOverview/ScrollBar");
local g_sortYear = ContextPtr:LookUpControl("../CCOverview/SortYear");
local g_sortWinner = ContextPtr:LookUpControl("../CCOverview/SortWinner");
local g_sortCity = ContextPtr:LookUpControl("../CCOverview/SortCity");
local g_sortTheme = ContextPtr:LookUpControl("../CCOverview/SortTheme");
local g_showAllOption = ContextPtr:LookUpControl("../CCOverview/ShowAllOption");
local g_bribeButton = ContextPtr:LookUpControl("../CCOverview/BribeButton");
local g_bribeLabel = ContextPtr:LookUpControl("../CCOverview/BribeLabel");
local g_bribeAnim = ContextPtr:LookUpControl("../CCOverview/BribeAnim");
local g_bribeBox = ContextPtr:LookUpControl("../CCOverview/BribeBox");
local g_bribeText = ContextPtr:LookUpControl("../CCOverview/BribeText");
local g_bribeYes = ContextPtr:LookUpControl("../CCOverview/BribeYes");
local g_bribeNo = ContextPtr:LookUpControl("../CCOverview/BribeNo");
local g_progressBox = ContextPtr:LookUpControl("../CCOverview/ProgressBox");
local g_historyBox = ContextPtr:LookUpControl("../CCOverview/HistoryBox");
local g_progressMainStack = ContextPtr:LookUpControl("../CCOverview/ProgressMainStack");
local g_progressScrollPanel = ContextPtr:LookUpControl("../CCOverview/ProgressScrollPanel");
local g_progressSortPlayer = ContextPtr:LookUpControl("../CCOverview/ProgressSortPlayer");
local g_progressSortProgress = ContextPtr:LookUpControl("../CCOverview/ProgressSortProgress");
local g_progressSortWins = ContextPtr:LookUpControl("../CCOverview/ProgressSortWins");
local g_showHistoryButton = ContextPtr:LookUpControl("../CCOverview/ShowHistoryButton");
local g_showHistoryButtonHighlight = ContextPtr:LookUpControl("../CCOverview/ShowHistoryButtonHighlight");
local g_showProgressButton = ContextPtr:LookUpControl("../CCOverview/ShowProgressButton");
local g_showProgressButtonHighlight = ContextPtr:LookUpControl("../CCOverview/ShowProgressButtonHighlight");
local g_historyOptionsStack = ContextPtr:LookUpControl("../CCOverview/HistoryOptionsStack");
local g_committeeButton = ContextPtr:LookUpControl("../CCOverview/CommitteeButton");
local g_committeeLeaderBox = ContextPtr:LookUpControl("../CCOverview/CommitteeLeaderFrame");
local g_committeeLeaderFrame = ContextPtr:LookUpControl("../CCOverview/CommitteeLeaderFrame");
local g_committeeLeaderIcon = ContextPtr:LookUpControl("../CCOverview/CommitteeLeaderIcon");
local g_committeeCityLabel = ContextPtr:LookUpControl("../CCOverview/CommitteeCityLabel");
local g_committeeThemeBox = ContextPtr:LookUpControl("../CCOverview/CommitteeThemeBox");
local g_committeeThemeFrame = ContextPtr:LookUpControl("../CCOverview/CommitteeThemeFrame");
local g_committeeThemePortrait = ContextPtr:LookUpControl("../CCOverview/CommitteeThemePortrait");
local g_committeeNotFormedBox = ContextPtr:LookUpControl("../CCOverview/CommitteeNotFormedBox");
local g_committeeNotFormedLabel = ContextPtr:LookUpControl("../CCOverview/CommitteeNotFormedLabel");
local g_committeeRootBox = ContextPtr:LookUpControl("../CCOverview/CommitteeRootBox");

local g_history = {};
local g_historySize = 0;
local g_h = "cc__historyEntry";
local g_hs = "cc__historySize";

local g_playerInfo = {};
local g_p = "cc__playerEntry";

local g_iBribeCooldown = GetSpeedScale("BribeCooldown");
local g_iBribeDuration = GetSpeedScale("BribeDuration");
local g_iBribeBonus = GameDefines.CC_BRIBE_BONUSPERCENTAGE;

function CCOver_InitTestValues()

	-- check if the values have already been initialized (so they don't get intialized on load)
	local bDoInitTest = (doload(g_hs) or 0) == 0;
	if(not bDoInitTest) then
		return;
	end
	-- Testing
	local size = 10;
	for id = 1, size do
		local historyEntry = {["Id"] = id, ["Year"] = (-4000 + (id - 1) * 100), ["Winner"] = (id % 3) - 1, ["City"] = "City"..tostring(id % 4), ["Theme"] = (id % 3) - 1};
		dosave(g_h..id, historyEntry);
	end
	dosave(g_hs, size);
end

-- Initializes the history data
function CCOver_InitHistory()
	g_history = {};
	g_historySize = doload(g_hs) or 0;
	for i = 1, g_historySize do
		local historyEntry = doload(g_h..i);
		g_history[i] = historyEntry;
	end

	IconHookup(0, 64, "CC_ATLAS_BASE", g_committeeThemePortrait);
	g_committeeThemeBox:LocalizeAndSetToolTip("TXT_KEY_CC_COMMITTEE");

	g_committeeNotFormedLabel:LocalizeAndSetText("TXT_KEY_CC_COMMITTEENOTFORMED");
	g_committeeNotFormedBox:LocalizeAndSetToolTip("TXT_KEY_CC_WORLD_EMPTY_TOOLTIP", GameDefines.CC_WONDERSREQUIRED);
end

function CCOver_GetPlayerInfoInitEntry()
	return { noOfWins = 0 };
end

function CCOver_InitPlayerInfo()
	g_playerInfo = {};
	for idx, player in pairs(Players) do
		if(IsValidMajorPlayer(player, false)) then
			local entry = doload(g_p..idx);
			if(entry == nil) then
				entry = CCOver_GetPlayerInfoInitEntry();
				dosave(g_p..idx, entry);
			end
			g_playerInfo[idx] = entry;
		end
	end
end

function CCOver_GetPlayerInfo(player, info)
	local entry = g_playerInfo[player:GetID()];
	if(entry == nil) then
		-- init it there when there isn't one
		entry = CCOver_GetPlayerInfoInitEntry();
		dosave(g_p..player:GetID(), entry);
	end

	local eInfo = entry[info];
	if(eInfo == nil) then
		print("### Error ### Couldn't find entry "..tostring(info).." in PlayerInfo!");
		return nil;
	end

	return eInfo;
end

function CCOver_Init()
	g_ccOverview:ChangeParent(ContextPtr:LookUpControl("/InGame/WorldView/"));

	--CCOver_InitTestValues();
	CCOver_InitPlayerInfo();
	CCOver_InitHistory();
end

function CCOver_OnCCElected(playerId, cityId, noOfElections)
	local player, city = GetPlayerCity(playerId, cityId);
	local year = doload("cc_electionYear") or Game.GetGameTurnYear();
	local winnerEntry = player:GetID();
	-- save by city name instead of ID, since city can be captured/destroyed
	local cityEntry = city:GetName();

	local activePlayer = GetPlayer();
	local bHasMetTeam, bCityIsRevealed = GetWinnerVisibilityInfo(activePlayer);
	local bPlayerHasCommittee = PlayerHasCommittee(activePlayer:GetID());
	if(not bHasMetTeam and not bPlayerHasCommittee) then
		winnerEntry = -1;
		cityEntry = Locale.ConvertTextKey("TXT_KEY_CC_OVERVIEW_UNKNOWN_CITY");
	else
		if(not bCityIsRevealed and not bPlayerHasCommittee) then
			cityEntry = Locale.ConvertTextKey("TXT_KEY_CC_OVERVIEW_UNKNOWN_CITY");
		end

		local noOfWins = CCOver_GetPlayerInfo(player, "noOfWins");
		local entry = g_playerInfo[player:GetID()];
		entry.noOfWins = noOfWins + 1;
		dosave(g_p..player:GetID(), entry);

	end

	local historyEntry = {["Id"] = noOfElections, ["Year"] = year, ["Winner"] = winnerEntry, ["City"] = cityEntry};
	Debug("Saving History Entry" .. out(historyEntry));
	g_history[noOfElections] = dosave(g_h..noOfElections, historyEntry);
	g_historySize = dosave(g_hs, noOfElections);
	-- refresh list
	if(not g_ccOverview:IsHidden()) then
		CCOver_BuildInterface();
		g_bribeBox:SetHide(true);
	end
end
LuaEvents.CCElected.Add(CCOver_OnCCElected);

function CCOver_OnThemeChosen(playerId, cityId, theme)

	local player, city = GetPlayerCity(playerId, cityId);

	-- insert the theme into the last entry
	local historyEntry = g_history[g_historySize];
	if(historyEntry == nil) then
		print("### Error ### Couldn't find history entry at index "..g_historySize);
		return nil;
	end

	
	local activePlayer = GetPlayer();
	local bSameTeam = player:GetTeam() == activePlayer:GetTeam();
	local bDoF = player:IsDoF(activePlayer:GetID());
	local bPlayerHasCommittee = PlayerHasCommittee(activePlayer:GetID());
	if bSameTeam or bDoF or bPlayerHasCommittee then
		historyEntry.Theme = theme.ccType.ID;
	else
		historyEntry.Theme = -1;
	end

	dosave(g_h..g_historySize, historyEntry);

	-- refresh list
	if(not g_ccOverview:IsHidden()) then
		CCOver_BuildInterface();
		g_bribeBox:SetHide(true);
	end
end
LuaEvents.CCThemeChosen.Add(CCOver_OnThemeChosen);

function CCOver_BuildInterface()
	CCOver_BuildHistoryInterface();
	CCOver_BuildProgressInterface();
	CCOver_UpdateBribeButton();
end

function CCOver_BuildHistoryInterface()
	g_mainStack:DestroyAllChildren();

	m_SortTable = {};

	--for i = 1, 15 do
	--	local instance = {};
	--	g_ccOverview:BuildInstanceForControl("CCWinnerInstance", instance, g_mainStack);
	--end
	Debug("Building History Interface...");

	if(GameDefines.CC_USE_COMMITTEESTART ~= 1) then
		-- legacy mode
		g_committeeNotFormedBox:SetHide(true);
		g_committeeRootBox:SetHide(true);
		local boxY = g_committeeNotFormedBox:GetSizeY();
		g_scrollPanel:SetSizeY(g_scrollPanel:GetSizeY() + boxY);
		g_scrollBar:SetSizeY(g_scrollBar:GetSizeY() + boxY);
	else
		-- normal mode
		Debug("Generating Committee Information");
		-- building the committee entry
		local committeePlayer, committeeCity = GetCommittee();
		if((committeePlayer == nil) or (committeeCity == nil)) then
			-- committee not found
			g_committeeNotFormedBox:SetHide(false);
			g_committeeRootBox:SetHide(true);

			-- Check if committee was formed -> if yes, it was destroyed
			--if(doload("bCommitteeFormed")) then

			--end
		else
			g_committeeNotFormedBox:SetHide(true);
			g_committeeRootBox:SetHide(false);
			-- committee found -> display only when player can see city
			local activePlayer = GetPlayer();
			local bHasMetCommitteeTeam, bCommitteeCityIsRevealed = GetElectionVisibilityInfo(activePlayer, committeePlayer, committeeCity);
			
			if((activePlayer:GetID() == committeePlayer:GetID()) or bHasMetCommitteeTeam or bCommitteeCityIsRevealed) then
				local myCivType = committeePlayer:GetCivilizationType();
				local myCivInfo = GameInfo.Civilizations[myCivType];
				local leader = GameInfo.Leaders("Type = '" .. GameInfo.Civilization_Leaders("CivilizationType = '" .. myCivInfo.Type .. "'" )().LeaderheadType .. "'" )();
				IconHookup(leader.PortraitIndex, 64, leader.IconAtlas, g_committeeLeaderIcon);
				if(committeePlayer:GetID() ~= Game.GetActivePlayer()) then
					g_committeeLeaderBox:LocalizeAndSetToolTip(leader.Description);
				else
					g_committeeLeaderBox:LocalizeAndSetToolTip("TXT_KEY_CC_OVERVIEW_YOU");
					g_committeeLeaderFrame:SetHide(false);
				end
			else
				--CivIconHookup(-1, 64, instance.LeaderIcon, nil, nil, false, true);
				IconHookup(22, 64, "LEADER_ATLAS", g_committeeLeaderIcon);
				g_committeeLeaderBox:LocalizeAndSetToolTip("TXT_KEY_CC_OVERVIEW_UNMET");
			end

			if((activePlayer:GetID() == committeePlayer:GetID()) or bCommitteeCityIsRevealed) then
				g_committeeCityLabel:SetText(committeeCity:GetName());
			end
		end
	end

	-- traverse and build the history entries
	for key, value in ipairs(g_history) do
		if (g_showAllOption or (value.Winner == Game.GetActivePlayer())) then
			local instance = {};
			g_ccOverview:BuildInstanceForControl("CCWinnerInstance", instance, g_mainStack);

			local sortEntry = {};
			m_SortTable[tostring(instance.Root)] = sortEntry;

			sortEntry.Id = value.Id;
			sortEntry.Year = value.Year;
			sortEntry.Winner = value.Winner;
			sortEntry.City = value.City;
			sortEntry.Theme = value.Theme;

			instance.YearLabel:SetText(GetDate(value.Year));

			local winner = Players[value.Winner];
			if(winner ~= nil) then
				local myCivType = winner:GetCivilizationType();
				local myCivInfo = GameInfo.Civilizations[myCivType];
				local leader = GameInfo.Leaders("Type = '" .. GameInfo.Civilization_Leaders("CivilizationType = '" .. myCivInfo.Type .. "'" )().LeaderheadType .. "'" )();
				IconHookup(leader.PortraitIndex, 64, leader.IconAtlas, instance.LeaderIcon);
				if(winner:GetID() ~= Game.GetActivePlayer()) then
					instance.LeaderBox:LocalizeAndSetToolTip(leader.Description);
				else
					instance.LeaderBox:LocalizeAndSetToolTip("TXT_KEY_CC_OVERVIEW_YOU");
					instance.LeaderFrame:SetHide(false);
					instance.ThemeFrame:SetHide(false);
				end
			else
				--CivIconHookup(-1, 64, instance.LeaderIcon, nil, nil, false, true);
				IconHookup(22, 64, "LEADER_ATLAS", instance.LeaderIcon);
				instance.LeaderBox:LocalizeAndSetToolTip("TXT_KEY_CC_OVERVIEW_UNMET");
			end
				
			local city = value.City;
			if(city ~= nil) then
				instance.CityLabel:SetText(city);
			end

			local theme = GetThemeById(value.Theme);
			if(theme ~= nil) then
				local ccType = theme.ccType;
				IconHookup(ccType.PortraitIndex, 64, ccType.IconAtlas, instance.ThemePortrait);
				instance.ThemeBox:LocalizeAndSetToolTip(ccType.Title);
			else
				CivIconHookup(-1, 64, instance.ThemePortrait, nil, nil, false, true);
				--IconHookup(-1, 64, "LEADER_ATLAS", instance.ThemePortrait);
				instance.ThemeBox:LocalizeAndSetToolTip("TXT_KEY_CC_OVERVIEW_UNKNOWN_THEME");
			end
		end
	end

	CCOver_OnSort(m_SortMode, 0);
	g_mainStack:CalculateSize();
  g_scrollPanel:CalculateInternalSize();
  g_scrollPanel:ReprocessAnchoring();
end



function CCOver_BuildProgressInterface()
	local bCommitteeFormed = doload("cc_bCommitteeFormed") or false;
	if(not bCommitteeFormed) then
		return;
	end
	local iThreshold = doload("cc_iThreshold");
	if(iThreshold <= 0) then
		return;
	end
	local progressTable = doload("cc_progressTable");
	if(progressTable == nil) then
		return;
	end


	g_progressMainStack:DestroyAllChildren();
	pm_SortTable = {};
	local activePlayer = GetPlayer();
	local bPlayerHasCommittee = PlayerHasCommittee(activePlayer:GetID());
	--traverse all players and check if they have met the active player
	for idx, player in pairs(Players) do
		if((player:GetID() == activePlayer:GetID()) or IsValidMajorPlayer(player)
				and (Teams[activePlayer:GetTeam()]:IsHasMet(player:GetTeam()) or bPlayerHasCommittee)) then
			-- build interface here
			local instance = {};
			g_ccOverview:BuildInstanceForControl("CCProgressInstance", instance, g_progressMainStack);

			local sortEntry = {};
			pm_SortTable[tostring(instance.Root)] = sortEntry;

			-- player
			sortEntry.Player = idx;
			local myCivType = player:GetCivilizationType();
			local myCivInfo = GameInfo.Civilizations[myCivType];
			local leader = GameInfo.Leaders( "Type = '" .. GameInfo.Civilization_Leaders( "CivilizationType = '" .. myCivInfo.Type .. "'" )().LeaderheadType .. "'" )();
			IconHookup(leader.PortraitIndex, 64, leader.IconAtlas, instance.LeaderIcon);
			if(player:GetID() ~= Game.GetActivePlayer()) then
				instance.PlayerBox:LocalizeAndSetToolTip(leader.Description);
			else
				instance.PlayerBox:LocalizeAndSetToolTip("TXT_KEY_CC_OVERVIEW_YOU");
				instance.LeaderFrame:SetHide(false);
			end
			
			-- progress
			local progress = progressTable[idx];
			local fuzzyProgress, fuzzyPercents = GetFuzzyProgress(progress, iThreshold);
			--print("Fuzzy progress for values "..tostring(progress).."/"..tostring(iThreshold).." is "..tostring(fuzzyProgress)..", "..tostring(fuzzyPercents)..")");
			local r, g, b;
			b = 0;
			r = math.min(1, fuzzyPercents * 2);
			g = math.min(1, (1 - fuzzyPercents) * 2);
			instance.ProgressBar:SetFGColor({ x = r, y = g, z = b, w = 0.6 });
			instance.ProgressBar:SetPercent(fuzzyPercents);
			sortEntry.Progress = fuzzyProgress;

			-- wins
			local wins = CCOver_GetPlayerInfo(player, "noOfWins") or 0;
			instance.WinsLabel:SetText(wins);
			sortEntry.Wins = wins;
		end
	end

	CCOver_OnSortProgress(pm_SortMode, 0);
	g_progressMainStack:CalculateSize();
  g_progressScrollPanel:CalculateInternalSize();
  g_progressScrollPanel:ReprocessAnchoring();
end

function CCOver_OnBribeButtonLClick(iBribeAmount)
	local iCooldown = g_iBribeDuration + g_iBribeCooldown;
	g_bribeBox:SetHide(false);
	g_bribeText:LocalizeAndSetText("TXT_KEY_CC_OVERVIEW_BRIBE_CONFIRM", iBribeAmount, g_iBribeDuration, g_iBribeBonus, iCooldown);
	g_bribeYes:SetVoids(iBribeAmount, nil);
end

function CCOver_UpdateBribeButton()
	local bribeTable = doload("cc_bribeTable");
	local player = GetPlayer();
	local entry = bribeTable[player:GetID()];
	local bPlayerCanBribe, fail, bribeAmount = PlayerCanBribe(player, bribeTable);
	if(bPlayerCanBribe) then
		g_bribeButton:LocalizeAndSetToolTip("TXT_KEY_CC_OVERVIEW_BRIBE_BUTTON_ALLOWED_TOOLTIP", bribeAmount);
		g_bribeButton:RegisterCallback(Mouse.eLClick, CCOver_OnBribeButtonLClick);
		g_bribeButton:SetVoids(bribeAmount, nil);
		--g_bribeLabel:SetColorByName("Beige_Black_Alpha");
		g_bribeAnim:Play();
	else
		if(fail == 1) then
			g_bribeButton:LocalizeAndSetToolTip("TXT_KEY_CC_OVERVIEW_BRIBE_BUTTON_NOT_ALLOWED_RACE_TOOLTIP");
		elseif(fail == 2) then
			g_bribeButton:LocalizeAndSetToolTip("TXT_KEY_CC_OVERVIEW_BRIBE_BUTTON_NOT_ALLOWED_COOLDOWN_TOOLTIP", (g_iBribeCooldown + entry.cooldown));
		elseif(fail == 3) then
			g_bribeButton:LocalizeAndSetToolTip("TXT_KEY_CC_OVERVIEW_BRIBE_BUTTON_NOT_ALLOWED_GOLD_TOOLTIP", bribeAmount);
		else
			g_bribeButton:LocalizeAndSetToolTip("TXT_KEY_CC_OVERVIEW_BRIBE_BUTTON_NOT_ALLOWED_RACE_TOOLTIP");
		end
		g_bribeButton:ClearCallback(Mouse.eLClick);
		--g_bribeLabel:SetColorByName("Red_Black");
		g_bribeAnim:SetToBeginning();
		g_bribeAnim:Stop();
	end
end


function CCOver_OnShowProgressButtonClick()
	g_progressBox:SetHide(false);
	g_historyBox:SetHide(true);
	g_showHistoryButtonHighlight:SetHide(true);
	g_showProgressButtonHighlight:SetHide(false);
	g_historyOptionsStack:SetHide(true);
end
g_showProgressButton:RegisterCallback(Mouse.eLClick, CCOver_OnShowProgressButtonClick);

function CCOver_OnShowHistoryButtonClick()
	g_progressBox:SetHide(true);
	g_historyBox:SetHide(false);
	g_historyOptionsStack:SetHide(false);
	g_showHistoryButtonHighlight:SetHide(false);
	g_showProgressButtonHighlight:SetHide(true);
end
g_showHistoryButton:RegisterCallback(Mouse.eLClick, CCOver_OnShowHistoryButtonClick);

function CCOver_OnBribeYesClick()
	g_bribeBox:SetHide(true);
	LuaEvents.CCBribe(GetPlayer());
	Events.AudioPlay2DSound("AS2D_INTERFACE_CITY_SCREEN_PURCHASE");
	CCOver_UpdateBribeButton();
end
g_bribeYes:RegisterCallback(Mouse.eLClick, CCOver_OnBribeYesClick);

function CCOver_OnBribeNoClick()
	g_bribeBox:SetHide(true);
end
g_bribeNo:RegisterCallback(Mouse.eLClick, CCOver_OnBribeNoClick);

function CCOver_OnUpdate()
	local player = GetPlayer();
	if(player == nil) then
		return;
	end

	if(not g_ccOverview:IsHidden()) then
		--CCOver_UpdateBribeButton();
		CCOver_BuildInterface();
		g_bribeBox:SetHide(true);
	end
end
--Events.ActivePlayerTurnStart.Add(CCOver_OnUpdate);

-------------------------------------------------
-- Functions for History sorting
-------------------------------------------------
function CCOver_SortFunction(a, b)
  local valueA, valueB;

  local entryA = m_SortTable[tostring(a)];
  local entryB = m_SortTable[tostring(b)];

  if (entryA == nil) or (entryB == nil) then 
		if entryA and (entryB == nil) then
			return false;
		elseif (entryA == nil) and entryB then
			return true;
		else
			if(m_bSortReverse) then
				return tostring(a) > tostring(b); -- gotta do something deterministic
			else
				return tostring(a) < tostring(b); -- gotta do something deterministic
			end
		end
  else
		if(m_SortMode == eYear) then
			valueA = entryA.Year;
			valueB = entryB.Year;
		elseif(m_SortMode == eWinner) then
			valueA = entryA.Winner;
			valueB = entryB.Winner;
		elseif(m_SortMode == eCity) then
			valueA = entryA.City;
			valueB = entryB.City;
		elseif(m_SortMode == eTheme) then
			valueA = entryA.Theme;
			valueB = entryB.Theme;
		else
			valueA = entryA.Id;
			valueB = entryB.Id;
		end
	    
		if(valueA == valueB) then
			valueA = entryA.Winner;
			valueB = entryB.Winner;
		end

		if(m_bSortReverse) then
			return valueA > valueB;
		else
			return valueA < valueB;
		end
  end
end

function CCOver_OnSort(type, iDoFlip)
	local bDoFlip = (iDoFlip == 1);
  if(m_SortMode == type) then
		if(bDoFlip) then
			m_bSortReverse = not m_bSortReverse;
		end
  else
    m_bSortReverse = false;
  end
  m_SortMode = type;
  g_mainStack:SortChildren(CCOver_SortFunction);
end
g_sortYear:RegisterCallback( Mouse.eLClick, CCOver_OnSort );
g_sortWinner:RegisterCallback( Mouse.eLClick, CCOver_OnSort );
g_sortCity:RegisterCallback( Mouse.eLClick, CCOver_OnSort );
g_sortTheme:RegisterCallback( Mouse.eLClick, CCOver_OnSort );
g_sortYear:SetVoids(eYear, 1);
g_sortWinner:SetVoids(eWinner, 1);
g_sortCity:SetVoids(eCity, 1);
g_sortTheme:SetVoids(eTheme, 1);

-------------------------------------------------
-- Functions for Progress sorting
-------------------------------------------------
function CCOver_ProgressSortFunction(a, b)
  local valueA, valueB;

  local entryA = pm_SortTable[tostring(a)];
  local entryB = pm_SortTable[tostring(b)];

  if (entryA == nil) or (entryB == nil) then 
		if entryA and (entryB == nil) then
			return false;
		elseif (entryA == nil) and entryB then
			return true;
		else
			if(pm_bSortReverse) then
				return tostring(a) > tostring(b); -- gotta do something deterministic
			else
				return tostring(a) < tostring(b); -- gotta do something deterministic
			end
		end
  else
		if(pm_SortMode == pePlayer) then
			valueA = entryA.Player;
			valueB = entryB.Player;
		elseif(pm_SortMode == peProgress) then
			valueA = entryA.Progress;
			valueB = entryB.Progress;
		elseif(pm_SortMode == peWins) then
			valueA = entryA.Wins;
			valueB = entryB.Wins;
		else
			valueA = entryA.Player;
			valueB = entryB.Player;
		end
	    
		if(valueA == valueB) then
			valueA = entryA.Wins;
			valueB = entryB.Wins;
		end

		if(pm_bSortReverse) then
			return valueA > valueB;
		else
			return valueA < valueB;
		end
  end
end

function CCOver_OnSortProgress(type, iDoFlip)
	local bDoFlip = (iDoFlip == 1);
  if(pm_SortMode == type) then
		if(bDoFlip) then
			pm_bSortReverse = not pm_bSortReverse;
		end
  else
    pm_bSortReverse = false;
  end
  pm_SortMode = type;
  g_progressMainStack:SortChildren(CCOver_ProgressSortFunction);
end
g_progressSortPlayer:RegisterCallback( Mouse.eLClick, CCOver_OnSortProgress );
g_progressSortProgress:RegisterCallback( Mouse.eLClick, CCOver_OnSortProgress );
g_progressSortWins:RegisterCallback( Mouse.eLClick, CCOver_OnSortProgress );
g_progressSortPlayer:SetVoids(pePlayer, 1);
g_progressSortProgress:SetVoids(peProgress, 1);
g_progressSortWins:SetVoids(peWins, 1);



function CCOver_OnShowAllOptionChecked(bIsChecked)
	g_showAllOption = bIsChecked;

	CCOver_BuildInterface();
end
g_showAllOption:RegisterCheckHandler(CCOver_OnShowAllOptionChecked);

function CCOver_InputHandler(uiMsg, wParam, lParam)
	if uiMsg == KeyEvents.KeyDown then
		if wParam == Keys.VK_ESCAPE or wParam == Keys.VK_RETURN then
			g_ccOverview:SetHide(true);
			return true;
		end
  end
end
g_ccOverview:SetInputHandler(CCOver_InputHandler);

function CCOver_ShowHideHandler( bIsHide, bIsInit)
	if(not bIsHide) then
		CCOver_BuildInterface();
	end
	g_bribeBox:SetHide(true);
end
g_ccOverview:SetShowHideHandler(CCOver_ShowHideHandler);

function CCOver_OnCloseButtonClicked()
	g_ccOverview:SetHide(true);
end
g_closeButton:RegisterCallback(Mouse.eLClick, CCOver_OnCloseButtonClicked);


