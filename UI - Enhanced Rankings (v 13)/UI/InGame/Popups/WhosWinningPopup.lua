print("This is the 'UI - Enhanced Rankings - WhosWinningPopup' mod script.")

local isBNW = ContentManager.IsActive("6DA07636-4123-4018-B643-6575B4EC336B", ContentType.GAMEPLAY)

local isUsingFlagsPlus = false

local FlagsPlusModId = "e1ccf71a-f248-498c-8f30-5ca6d851079d"
for _, mod in pairs(Modding.GetActivatedMods()) do
  if (mod.ID == FlagsPlusModId) then
    isUsingFlagsPlus = true
	break
  end
end

-------------------------------------------------
-- Who's Winning Popup
-------------------------------------------------

include( "InstanceManager" );
include( "IconSupport" );

local g_PlayerListInstanceManager = InstanceManager:new( "PlayerEntryInstance", "PlayerEntryBox", Controls.PlayerListStack );
local m_PopupInfo = nil;

local g_iListMode = -1;
local g_iLastListMode = -1;

local g_ListMode_Overall = 0;
local g_ListMode_Food = g_ListMode_Overall+1;
local g_ListMode_Production = g_ListMode_Food+1;
local g_ListMode_Gold = g_ListMode_Production+1;
local g_ListMode_Gold_Turn = g_ListMode_Gold+1;
local g_ListMode_Science = g_ListMode_Gold_Turn+1;
local g_ListMode_Science_Turn = g_ListMode_Science+1;
local g_ListMode_Culture = g_ListMode_Science_Turn+1;
local g_ListMode_Culture_Turn = g_ListMode_Culture+1;
local g_ListMode_Faith = g_ListMode_Culture_Turn+1;
local g_ListMode_Faith_Turn = g_ListMode_Faith+1;
local g_ListMode_Tourist_Cities = g_ListMode_Faith_Turn+1;
local g_ListMode_Cultural_Influence = g_ListMode_Tourist_Cities+1;
local g_ListMode_Tourism_Turn = g_ListMode_Cultural_Influence+1;
local g_ListMode_Happiness = isBNW and (g_ListMode_Tourism_Turn+1) or (g_ListMode_Faith_Turn+1);
local g_ListMode_Wonders = g_ListMode_Happiness+1;
local g_ListMode_Power = g_ListMode_Wonders+1; -- Should be the last one, if not change g_NumModes below

local g_NumModes = g_ListMode_Power;
local g_CurrentPage = 0;

local g_tListModeText = {};
g_tListModeText[g_ListMode_Overall] = "TXT_KEY_PROGRESS_SCREEN_OVERALL";
g_tListModeText[g_ListMode_Food] = "TXT_KEY_PROGRESS_SCREEN_FOOD";
g_tListModeText[g_ListMode_Production] = "TXT_KEY_PROGRESS_SCREEN_PRODUCTION";
g_tListModeText[g_ListMode_Gold] = "TXT_KEY_PROGRESS_SCREEN_GOLD";
g_tListModeText[g_ListMode_Gold_Turn] = "TXT_KEY_PROGRESS_SCREEN_GPT";
g_tListModeText[g_ListMode_Science] = "TXT_KEY_PROGRESS_SCREEN_SCIENCE";
g_tListModeText[g_ListMode_Science_Turn] = "TXT_KEY_PROGRESS_SCREEN_SPT";
g_tListModeText[g_ListMode_Culture] = "TXT_KEY_PROGRESS_SCREEN_CULTURE";
g_tListModeText[g_ListMode_Culture_Turn] = "TXT_KEY_PROGRESS_SCREEN_CPT";
g_tListModeText[g_ListMode_Faith] = "TXT_KEY_PROGRESS_SCREEN_FAITH";
g_tListModeText[g_ListMode_Faith_Turn] = "TXT_KEY_PROGRESS_SCREEN_FPT";
g_tListModeText[g_ListMode_Tourist_Cities] = "TXT_KEY_PROGRESS_SCREEN_CITY_TOURISM";
g_tListModeText[g_ListMode_Cultural_Influence] = "TXT_KEY_PROGRESS_SCREEN_CULTURAL_INFLUENCE";
g_tListModeText[g_ListMode_Tourism_Turn] = "TXT_KEY_PROGRESS_SCREEN_TPT";
g_tListModeText[g_ListMode_Happiness] = "TXT_KEY_PROGRESS_SCREEN_HAPPINESS";
g_tListModeText[g_ListMode_Wonders] = "TXT_KEY_PROGRESS_SCREEN_WONDERS";
g_tListModeText[g_ListMode_Power] = "TXT_KEY_PROGRESS_SCREEN_POWER";

local g_tListOfDudes = {
	"TXT_KEY_DUDE_A",
	"TXT_KEY_DUDE_B",
	"TXT_KEY_DUDE_C",
	"TXT_KEY_DUDE_D",
	"TXT_KEY_DUDE_E",
	"TXT_KEY_DUDE_F",
	"TXT_KEY_DUDE_G",
	"TXT_KEY_DUDE_H",
	"TXT_KEY_DUDE_I",
	"TXT_KEY_DUDE_J",
	"TXT_KEY_DUDE_K",
	"TXT_KEY_DUDE_L",
	"TXT_KEY_DUDE_M",
	"TXT_KEY_DUDE_N",
	"TXT_KEY_DUDE_O",
	"TXT_KEY_DUDE_P",
};


-------------------------------------------------
-- On Popup
-------------------------------------------------
function OnPopup( popupInfo )

	if( popupInfo.Type ~= ButtonPopupTypes.BUTTONPOPUP_WHOS_WINNING ) then
		return;
	end

	m_PopupInfo = popupInfo;
	g_PlayerListInstanceManager:ResetInstances();

    local iPlayer = Game.GetActivePlayer();
	local pPlayer = Players[iPlayer];
	local pTeam = Teams[pPlayer:GetTeam()];

	local pOtherPlayer;
	local iOtherTeam;

	local tPlayers = {};
	local tCities = {};

	-- Pick a random dude's name
	local iRand = Game.Rand(#g_tListOfDudes, "Rolling to determine Progress Screen dude.");
	iRand = iRand + 1;	-- Screw you, Lua
	local strDudesName = g_tListOfDudes[iRand];

	local strPresents = Locale.ConvertTextKey(strDudesName);
	Controls.PresentsLabel:SetText(strPresents);

	g_iListMode = g_CurrentPage;

	local strListName = Locale.ConvertTextKey(g_tListModeText[g_iListMode]);
	Controls.ListNameLabel:SetText(strListName);

	-- Tooltip
	local strToolTip = g_tListModeText[g_iListMode] .. "_TT";	-- Sorta hardcoded, but convenient
	Controls.PresentsLabel:SetToolTipString(Locale.ConvertTextKey(strToolTip));
	Controls.ListNameLabel:SetToolTipString(Locale.ConvertTextKey(strToolTip));

	-- Special case for list of cities
	if (isBNW and g_iListMode == g_ListMode_Tourist_Cities) then

		for iPlayerLoop = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
			pOtherPlayer = Players[iPlayerLoop];

			-- Player has to be alive to be in the list
			if (pOtherPlayer:IsAlive()) then

				for cityIndex = 0, pOtherPlayer:GetNumCities() - 1, 1 do
    				local pCity = pOtherPlayer:GetCityByID(cityIndex);
    				if (pCity ~= nil) then
						table.insert(tCities, {iPlayerLoop, cityIndex, pCity:GetBaseTourism()});
					end
				end
			end
		end

		-- Sort our list of cities
		local f = function(a, b)
			return a[3] > b[3];
		end

		table.sort(tCities, f);

		local iCount = 0;
		for i, v in ipairs(tCities) do
			if (iCount < 10 and v[3] > 0) then
				AddCityEntry(v[1], v[2], v[3], i);		-- PlayerID, City ID, Score, Rank
				iCount = iCount + 1;
			end
		end

	-- Normal case (list of players)
	else
		for iPlayerLoop = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do

			pOtherPlayer = Players[iPlayerLoop];
			iOtherTeam = pOtherPlayer:GetTeam();

			-- Player has to be alive to be in the list
			if (pOtherPlayer:IsAlive()) then
				table.insert(tPlayers, {iPlayerLoop, GetScoreFromMode(iPlayerLoop, g_iListMode)});
			end
		end

		-- Sort our list of players
		local f = function(a, b)
			return a[2] > b[2];
		end

		table.sort(tPlayers, f);

		-- Display sorted list
		for i, v in ipairs(tPlayers) do
			AddPlayerEntry(v[1], v[2], i);		-- PlayerID, Score, Rank
		end
	end

	Controls.PlayerListStack:CalculateSize();
	Controls.PlayerListStack:ReprocessAnchoring();
	Controls.PlayerListScrollPanel:CalculateInternalSize();

	UIManager:QueuePopup( ContextPtr, PopupPriority.WhosWinning );
end
Events.SerialEventGameMessagePopup.Add( OnPopup );

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
function IsListModeAllowed(iMode)

	-- Power, Wonder and Happiness mode checks MUST come first

    -- Power Mode restrictions
    if (iMode == g_ListMode_Power) then
		return true;

    -- Wonder Mode restrictions
    elseif (iMode == g_ListMode_Wonders) then
		if (Game.GetNumWorldWonders() < 2) then
			print("Progress Screen: Can't display wonders because there are less than 2 in the world!");
			return false;
		end

    -- Happiness restrictions
    elseif (iMode == g_ListMode_Happiness) then
		if (Game.IsOption(GameOptionTypes.GAMEOPTION_NO_HAPPINESS)) then
			print("Progress Screen: Can't display Happiness because the system is off!");
			return false;
		end

    -- Culture Mode restrictions
    elseif (iMode == g_ListMode_Culture) then

		local pLoopPlayer;

		-- Does everyone (alive) have at least 2 Policies?
		for iPlayerLoop = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
			pLoopPlayer = Players[iPlayerLoop];
			if (pLoopPlayer:IsAlive()) then
				if (pLoopPlayer:GetNumPolicies() < 2) then
					print("Progress Screen: Can't display Culture Mode because at least 1 player has fewer than 2 Policies!");
					return false;
				end
			end
		end

if (isBNW) then
		if AnyoneInIndustrial() then
			print("Progress Screen: Can't display Culture Mode because we've reached the Industrial Era!");
			return false;
		end
end

    -- Cultural Influence restrictions
    elseif (iMode == g_ListMode_Cultural_Influence) then
      if (not isBNW) then return false end

		local bUse = false;

		-- Does anyone have influence over another civ?
		for iPlayerLoop = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
			pLoopPlayer = Players[iPlayerLoop];
			if (pLoopPlayer:IsAlive()) then
				if (pLoopPlayer:GetNumCivsInfluentialOn() > 0) then
					bUse = true;
				end
			end
		end
		if (not bUse) then
			print("Progress Screen: Can't display Cultural Influence because no player has influence over another!");
			return false;
		end

    -- Tourism per turn restrictions
    elseif (iMode == g_ListMode_Tourism_Turn) then
      return IsListModeAllowed(g_ListMode_Tourist_Cities)

    -- Tourism restrictions
    elseif (iMode == g_ListMode_Tourist_Cities) then
      if (not isBNW) then return false end

		local bNoTourism = true;

		-- Need someone generating tourism
		for iPlayerLoop = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
			pLoopPlayer = Players[iPlayerLoop];
			if (pLoopPlayer:IsAlive()) then
				if (pLoopPlayer:GetTourism() > 0) then
					bNoTourism = false;
				end
			end
		end

		if (bNoTourism) then
			print("Progress Screen: Can't display Tourism because no players are generating any!");
			return false;
		else
			print("Progress Screen: Found someone generating tourism!");
		end

    -- Food Mode restrictions
    elseif (iMode == g_ListMode_Food) then
      if (not isBNW) then return true end

		-- Anyone in the Industrial Era?
		if AnyoneInIndustrial() then
			print("Progress Screen: Can't display Food Mode because we've reached the Industrial Era!");
			return false;
		end

    -- Production Mode restrictions
    elseif (iMode == g_ListMode_Production) then
      if (not isBNW) then return true end

		-- Anyone in the Industrial Era?
		if AnyoneInIndustrial() then
			print("Progress Screen: Can't display Production Mode because we've reached the Industrial Era!");
			return false;
		end

    -- Faith Mode restrictions
    elseif (iMode == g_ListMode_Faith) then
      -- Has the player created a religion?
      local player = Players[Game.GetActivePlayer()];
      if (not player:HasCreatedReligion()) then
        return false;
      end

	-- Science restrictions
	elseif (iMode == g_ListMode_Science) then
		if (Game.IsOption(GameOptionTypes.GAMEOPTION_NO_SCIENCE)) then
			print("Progress Screen: Can't display Science because the system is off!");
			return false;
		end
    end

    return true;

end

function AnyoneInIndustrial()
	-- Anyone in the Industrial Era?
	-- Actually we don't care
--	for iPlayerLoop = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
--		pLoopPlayer = Players[iPlayerLoop];
--		if (pLoopPlayer:IsAlive()) then
--			if (pLoopPlayer:GetCurrentEra() >= GameInfo.Eras["ERA_INDUSTRIAL"].ID) then
--				return true;
--			end
--		end
--	end

	return false
end

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
function GetScoreFromMode(iPlayer, iMode)

    local pPlayer = Players[iPlayer];

	-- Overall Mode
	if (iMode == g_ListMode_Overall) then
		return pPlayer:GetScore();

    -- Food Mode
	elseif (iMode == g_ListMode_Food) then
		local iTotalFoodSurplus = 0;
		local iTotalCities = 0;

		for pLoopCity in pPlayer:Cities() do
			iTotalFoodSurplus = iTotalFoodSurplus + pLoopCity:FoodDifference();
			iTotalCities = iTotalCities + 1;
		end

		if iTotalCities == 0 then
			iTotalCities = 1;
		end

		return iTotalFoodSurplus / iTotalCities;

	-- Production Mode
	elseif (iMode == g_ListMode_Production) then
		local iTotalProduction = 0;
		local iTotalCities = 0;

		local bIgnoreFood = true;
		local bOverflow = false;

		for pLoopCity in pPlayer:Cities() do
			iTotalProduction = iTotalProduction + pLoopCity:GetCurrentProductionDifference(bIgnoreFood, bOverflow);
			iTotalCities = iTotalCities + 1;
		end

		if iTotalCities == 0 then
			iTotalCities = 1;
		end

		return iTotalProduction / iTotalCities;

	-- Gold Mode
	elseif (iMode == g_ListMode_Gold) then
		return pPlayer:GetGold();

	-- Gold per turn Mode
	elseif (iMode == g_ListMode_Gold_Turn) then
		return pPlayer:CalculateGoldRate();

	-- Science Mode
	elseif (iMode == g_ListMode_Science) then
		local pTeam = Teams[pPlayer:GetTeam()];
		return pTeam:GetTeamTechs():GetNumTechsKnown();

	-- Science per turn Mode
	elseif (iMode == g_ListMode_Science_Turn) then
		return pPlayer:GetScience();

	-- Culture Mode
	elseif (iMode == g_ListMode_Culture) then
		return pPlayer:GetNumPolicies();

	-- Culture per turn Mode
	elseif (iMode == g_ListMode_Culture_Turn) then
		return pPlayer:GetTotalJONSCulturePerTurn();

	-- Faith Mode
	elseif (iMode == g_ListMode_Faith) then
	  local player = Players[iPlayer];
    if (player:HasCreatedReligion()) then
		  local eReligion = player:GetReligionCreatedByPlayer();
			return Game.GetNumCitiesFollowing(eReligion);
    else
      return 0; -- Should never happen
    end
		return pPlayer:GetNumPolicies();

	-- Faith per turn Mode
	elseif (iMode == g_ListMode_Faith_Turn) then
		return pPlayer:GetTotalFaithPerTurn();

	-- Happiness Mode
	elseif (iMode == g_ListMode_Happiness) then
		return pPlayer:GetExcessHappiness();

	-- Wonders Mode
	elseif (iMode == g_ListMode_Wonders) then
		return pPlayer:GetNumWorldWonders();

	-- Power Mode
	elseif (iMode == g_ListMode_Power) then
		return pPlayer:GetMilitaryMight();

	-- Cultural Influence
	elseif (isBNW and iMode == g_ListMode_Cultural_Influence) then
	    return pPlayer:GetNumCivsInfluentialOn();

	-- Tourism per turn Mode
	elseif (isBNW and iMode == g_ListMode_Tourism_Turn) then
	    return pPlayer:GetTourism();

    end

    return 0;

end


-------------------------------------------------
-- AddPlayerEntry
-------------------------------------------------
function AddPlayerEntry (iPlayerID, iScore, iRank)

	local pPlayer = Players[iPlayerID];
	local iTeam = pPlayer:GetTeam();
	local pTeam = Teams[iTeam];

	local controlTable = g_PlayerListInstanceManager:GetInstance();

    -- Use the Civilization_Leaders table to cross reference from this civ to the Leaders table
    local leader = GameInfo.Leaders[pPlayer:GetLeaderType()];
    local leaderDescription = leader.Description;

	local strName = Locale.ConvertTextKey("TXT_KEY_PROGRESS_SCREEN_NUMBERING", iRank);

	-- Active player
	if (pPlayer:GetID() == Game.GetActivePlayer()) then
		strName = strName .. " " .. Locale.ConvertTextKey( "TXT_KEY_POP_VOTE_RESULTS_YOU" );
		if (isUsingFlagsPlus) then
			controlTable.CivNormal:SetHide(true);
			controlTable.CivPlus:SetHide(false);
			CivIconHookup( iPlayerID, 64, controlTable.PlusIcon, controlTable.PlusCivIconBG, controlTable.PlusCivIconShadow, false, true);
		else
			controlTable.CivNormal:SetHide(false);
			controlTable.CivPlus:SetHide(true);
			CivIconHookup( iPlayerID, 32, controlTable.Icon, controlTable.CivIconBG, controlTable.CivIconShadow, false, true);
		end
		IconHookup( leader.PortraitIndex, 64, leader.IconAtlas, controlTable.Portrait );
	-- Haven't yet met this player
	elseif (not pTeam:IsHasMet(Game.GetActiveTeam())) then
		strName = strName .. " " .. Locale.ConvertTextKey( "TXT_KEY_POP_VOTE_RESULTS_UNMET_PLAYER" );
		if (isUsingFlagsPlus) then
			controlTable.CivNormal:SetHide(true);
			controlTable.CivPlus:SetHide(false);
			CivIconHookup( -1, 64, controlTable.PlusIcon, controlTable.PlusCivIconBG, controlTable.PlusCivIconShadow, false, true);
		else
			controlTable.CivNormal:SetHide(false);
			controlTable.CivPlus:SetHide(true);
			CivIconHookup( -1, 32, controlTable.Icon, controlTable.CivIconBG, controlTable.CivIconShadow, false, true);
		end
        IconHookup( 22, 64, "LEADER_ATLAS", controlTable.Portrait );
	-- Met players
	else
		strName = strName .. " " .. Locale.ConvertTextKey(pPlayer:GetNameKey());
		if (isUsingFlagsPlus) then
			controlTable.CivNormal:SetHide(true);
			controlTable.CivPlus:SetHide(false);
			CivIconHookup( iPlayerID, 64, controlTable.PlusIcon, controlTable.PlusCivIconBG, controlTable.PlusCivIconShadow, false, true);
		else
			controlTable.CivNormal:SetHide(false);
			controlTable.CivPlus:SetHide(true);
			CivIconHookup( iPlayerID, 32, controlTable.Icon, controlTable.CivIconBG, controlTable.CivIconShadow, false, true);
		end
		IconHookup( leader.PortraitIndex, 64, leader.IconAtlas, controlTable.Portrait );
	end

	controlTable.PlayerNameText:SetText(strName);

	-- Formats the # and reduces it to X.XX
	local strPoints = Locale.ConvertTextKey("TXT_KEY_FORMAT_NUMBER", iScore);
	controlTable.ScoreText:SetText(strPoints);

	-- Tooltip
	local strToolTip = g_tListModeText[g_iListMode] .. "_TT";	-- Sorta hardcoded, but convenient
	controlTable.PlayerEntryBox:SetToolTipString(Locale.ConvertTextKey(strToolTip));

end

-------------------------------------------------
-- AddCityEntry
-------------------------------------------------
function AddCityEntry (iPlayerID, iCityID, iScore, iRank)

	local pPlayer = Players[iPlayerID];
	local iTeam = pPlayer:GetTeam();
	local pTeam = Teams[iTeam];
	local pCity = pPlayer:GetCityByID(iCityID);

	local controlTable = g_PlayerListInstanceManager:GetInstance();

    -- Use the Civilization_Leaders table to cross reference from this civ to the Leaders table
    local leader = GameInfo.Leaders[pPlayer:GetLeaderType()];
    local leaderDescription = leader.Description;

	local strName = Locale.ConvertTextKey("TXT_KEY_PROGRESS_SCREEN_NUMBERING", iRank);

	-- Haven't yet met this player
	if (not pTeam:IsHasMet(Game.GetActiveTeam())) then
		strName = strName .. " " .. Locale.ConvertTextKey( "TXT_KEY_POP_VOTE_RESULTS_UNMET_PLAYER" );
		if (isUsingFlagsPlus) then
			controlTable.CivNormal:SetHide(true);
			controlTable.CivPlus:SetHide(false);
			CivIconHookup( -1, 64, controlTable.PlusIcon, controlTable.PlusCivIconBG, controlTable.PlusCivIconShadow, false, true);
		else
			controlTable.CivNormal:SetHide(false);
			controlTable.CivPlus:SetHide(true);
			CivIconHookup( -1, 32, controlTable.Icon, controlTable.CivIconBG, controlTable.CivIconShadow, false, true);
		end
        IconHookup( 22, 64, "LEADER_ATLAS", controlTable.Portrait );
	-- Met players
	else
		strName = strName .. " " .. Locale.ConvertTextKey(pCity:GetNameKey());
		if (isUsingFlagsPlus) then
			controlTable.CivNormal:SetHide(true);
			controlTable.CivPlus:SetHide(false);
			CivIconHookup( iPlayerID, 64, controlTable.PlusIcon, controlTable.PlusCivIconBG, controlTable.PlusCivIconShadow, false, true);
		else
			controlTable.CivNormal:SetHide(false);
			controlTable.CivPlus:SetHide(true);
			CivIconHookup( iPlayerID, 32, controlTable.Icon, controlTable.CivIconBG, controlTable.CivIconShadow, false, true);
		end
		IconHookup( leader.PortraitIndex, 64, leader.IconAtlas, controlTable.Portrait );
	end

	controlTable.PlayerNameText:SetText(strName);

	-- Formats the # and reduces it to X.XX
	local strPoints = Locale.ConvertTextKey("TXT_KEY_FORMAT_NUMBER", iScore);
	controlTable.ScoreText:SetText(strPoints);

	-- Tooltip
	local strToolTip = g_tListModeText[g_iListMode] .. "_TT";	-- Sorta hardcoded, but convenient
	controlTable.PlayerEntryBox:SetToolTipString(Locale.ConvertTextKey(strToolTip));

end

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
function OnClose ()
	g_CurrentPage = 0;
    UIManager:DequeuePopup( ContextPtr );
end
Controls.CloseButton:RegisterCallback( Mouse.eLClick, OnClose );


-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
function OnNext ()
    --UIManager:DequeuePopup( ContextPtr );
	g_CurrentPage = g_CurrentPage + 1;
	if g_CurrentPage > g_NumModes then
		g_CurrentPage = 0;
	end
	Events.SerialEventGameMessagePopup( { Type = ButtonPopupTypes.BUTTONPOPUP_WHOS_WINNING} );
end
Controls.NextButton:RegisterCallback( Mouse.eLClick, OnNext );


-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
function OnPrev ()
    --UIManager:DequeuePopup( ContextPtr );
	g_CurrentPage = g_CurrentPage - 1;
	if g_CurrentPage < 0 then
		g_CurrentPage = g_NumModes;
	end
	Events.SerialEventGameMessagePopup( { Type = ButtonPopupTypes.BUTTONPOPUP_WHOS_WINNING} );
end
Controls.PrevButton:RegisterCallback( Mouse.eLClick, OnPrev );


-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
function InputHandler( uiMsg, wParam, lParam )
    if uiMsg == KeyEvents.KeyDown then
        if wParam == Keys.VK_ESCAPE or wParam == Keys.VK_RETURN then
            OnClose();
            return true;
        end
    end
end
ContextPtr:SetInputHandler( InputHandler );


-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
function ShowHideHandler( bIsHide, bInitState )

    if( not bInitState ) then
        if( not bIsHide ) then
        	UI.incTurnTimerSemaphore();
        	Events.SerialEventGameMessagePopupShown(m_PopupInfo);
        else
            UI.decTurnTimerSemaphore();
            Events.SerialEventGameMessagePopupProcessed.CallImmediate(ButtonPopupTypes.BUTTONPOPUP_WHOS_WINNING, 0);
        end
    end
end
ContextPtr:SetShowHideHandler( ShowHideHandler );

----------------------------------------------------------------
-- 'Active' (local human) player has changed
----------------------------------------------------------------
Events.GameplaySetActivePlayer.Add(OnClose);


function OnDiploCornerPopup()
  Events.SerialEventGameMessagePopup({Type = ButtonPopupTypes.BUTTONPOPUP_WHOS_WINNING})
end

function OnAdditionalInformationDropdownGatherEntries(additionalEntries)
  table.insert(additionalEntries, {text=Locale.ConvertTextKey("TXT_KEY_RANKINGS_DIPLO_CORNER_HOOK"), call=OnDiploCornerPopup})
end
LuaEvents.AdditionalInformationDropdownGatherEntries.Add(OnAdditionalInformationDropdownGatherEntries)
LuaEvents.RequestRefreshAdditionalInformationDropdownEntries()
