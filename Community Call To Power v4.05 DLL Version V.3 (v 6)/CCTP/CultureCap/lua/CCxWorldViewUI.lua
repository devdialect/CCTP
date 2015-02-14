if(Game.GetCustomOption("GAMEOPTION_CULTURALCAPITALS") == 0) then
	return;
end
-- CC
-- Author: Moaf
--------------------------------------------------------------
include("MoafsUtils");
include("IconSupport");
include("CCStorage");
include("FLuaVector");


local g_mode = "hidden";
local g_ccWorld = ContextPtr:LookUpControl("../CCWorldViewUI/");

-- print control
function prc(msg, var)
	if(var == nil) then
		print(msg.."nil");
	else
		print(msg..var:GetID());
	end
end

-- ======================================================
-- Init
-- ======================================================
function CCWorld_Init()
	local context = ContextPtr:LookUpControl("../CCWorldViewUI/");
	local stack = ContextPtr:LookUpControl("/InGame/TopPanel/TopPanelInfoStack");

	context:ChangeParent(stack);
	stack:ReprocessAnchoring();
end

-- ======================================================
-- OnUpdateCCCountdown
-- ======================================================
-- Updates the controls countdown
function CCWorld_OnUpdateCCCountdown(iCountdown, iDuration)
  CCWorld_SwitchToMode("countdown");
	local ccBarCd = ContextPtr:LookUpControl("../CCWorldViewUI/CCBarCd");
	local ccBarShadowCd = ContextPtr:LookUpControl("../CCWorldViewUI/CCBarShadowCd");
  local ccButton = ContextPtr:LookUpControl("../CCWorldViewUI/CCButton");
	local ccActiveFlash = ContextPtr:LookUpControl("../CCWorldViewUI/CCActiveFlash");
	local ccFlashBG = ContextPtr:LookUpControl("../CCWorldViewUI/CCFlashBG");
	local bPlayerHasWon = PlayerHasWon(Game.GetActivePlayer());
	local bPlayerHasChosenTheme = doload("cc_bPlayerHasChosenTheme") or false;

	ccButton:SetToolTipString(CCWorld_BuildToolTip(iCountdown, bPlayerHasWon, bPlayerHasChosenTheme));
  ccBarCd:SetPercent(iCountdown / iDuration);

	local decCountdown = math.max(iCountdown - 1, 0);
	ccBarShadowCd:SetPercent(decCountdown / iDuration);
	ccActiveFlash:SetHide(true);
	ccFlashBG:SetHide(false);
	
	if(bPlayerHasWon) then
		ccActiveFlash:SetHide(bPlayerHasChosenTheme);
		ccFlashBG:SetHide(not bPlayerHasChosenTheme);
	end
end
LuaEvents.UpdateCCCountdown.Add(CCWorld_OnUpdateCCCountdown);

function CCWorld_OnThemeChosen()
	local ccActiveFlash = ContextPtr:LookUpControl("../CCWorldViewUI/CCActiveFlash");
	local ccFlashBG = ContextPtr:LookUpControl("../CCWorldViewUI/CCFlashBG");
	ccActiveFlash:SetHide(true);
	ccFlashBG:SetHide(false);
end
LuaEvents.CCThemeChosen.Add(CCWorld_OnThemeChosen);
-- ======================================================
-- BuildToolTip
-- ======================================================
-- builds the tooltip; if countdown is given it adds a middle-click option
function CCWorld_BuildToolTip(countdown, bPlayerHasWon, bPlayerHasChosenTheme)
	local bPlayerHasWon = bPlayerHasWon or false;
	local playerId, cityId = LoadWinner();
	local player, city = GetPlayerCity(playerId, cityId);
	local cityStr, location, bHasMetTeam, bCityIsRevealed = GetLocationInfo(GetPlayer(), playerId, cityId);
	local bPlayerHasWon = PlayerHasWon(Game.GetActivePlayer());

	-- Tooltip building
  local toolTip = "";
	if(bPlayerHasWon and not bPlayerHasChosenTheme) then
		toolTip = toolTip..Locale.ConvertTextKey("TXT_KEY_CC_WORLD_CANCHOOSE_TOOLTIP").."[NEWLINE][NEWLINE]";
	end
	if(countdown ~= nil) then
		toolTip = toolTip..Locale.ConvertTextKey("TXT_KEY_CC_WORLD_COUNTDOWN_TOOLTIP", countdown)..GetDashString();
	end
	toolTip = toolTip..Locale.ConvertTextKey("TXT_KEY_CC_WORLD_LCLICK_TOOLTIP").."[NEWLINE]";
	if(bPlayerHasWon or bCityIsRevealed) then
		toolTip = toolTip..Locale.ConvertTextKey("TXT_KEY_CC_WORLD_MCLICK_TOOLTIP", cityStr).."[NEWLINE]";
	end
	toolTip = toolTip..Locale.ConvertTextKey("TXT_KEY_CC_WORLD_RCLICK_TOOLTIP");
	return toolTip;
end

-- ======================================================
-- OnUpdateCCProgress
-- ======================================================
-- Sets the controls progressmeter and builds its tooltip
function CCWorld_OnUpdateCCProgress(iProgress, iThreshold, iBribeCooldown, iTotal, iBase, iMinor, iWonder, iCity, iBribe, iLastWin, bIsAllowedToProgress)
  CCWorld_SwitchToMode("race");

	local toolTip = iProgress.."/"..iThreshold;
	if(not bIsAllowedToProgress) then
		toolTip = toolTip..GetDashString().."[NEWLINE]";
		toolTip = toolTip..Locale.ConvertTextKey("TXT_KEY_CC_WORLD_ZERO_TOOLTIP");
	else
		toolTip = toolTip.." (+[COLOR_FONT_GREEN]"..iTotal.."[ENDCOLOR])";
		if(iTotal > 0) then
			local iRemaining = GetTurnsRemaining(iProgress, iTotal, iThreshold);
			toolTip = toolTip.."[NEWLINE]"..Locale.ConvertTextKey("TXT_KEY_CC_WORLD_TURNSREMAINING_TOOLTIP", iRemaining);
		end
		toolTip = toolTip..GetDashString();
		toolTip = toolTip..Locale.ConvertTextKey("TXT_KEY_CC_WORLD_BONUS_BASE_TOOLTIP", iBase).."[NEWLINE]";

		if(iMinor > 0) then
			toolTip = toolTip..Locale.ConvertTextKey("TXT_KEY_CC_WORLD_BONUS_MINOR_TOOLTIP", iMinor).."[NEWLINE]";
		end
		if(iWonder > 0) then
			toolTip = toolTip..Locale.ConvertTextKey("TXT_KEY_CC_WORLD_BONUS_WONDER_TOOLTIP", iWonder).."[NEWLINE]";
		end
		if(iBribe > 0) then
			toolTip = toolTip..Locale.ConvertTextKey("TXT_KEY_CC_WORLD_BONUS_BRIBE_TOOLTIP", iBribe, iBribeCooldown).."[NEWLINE]";
		end
		if(iCity > 0) then
			toolTip = toolTip..Locale.ConvertTextKey("TXT_KEY_CC_WORLD_MALUS_CITY_TOOLTIP", iCity).."[NEWLINE]";
		end
		if(iLastWin > 0) then
			toolTip = toolTip..Locale.ConvertTextKey("TXT_KEY_CC_WORLD_MALUS_LASTWIN_TOOLTIP", iLastWin).."[NEWLINE]";
		end
		toolTip = toolTip..GetDashString();
		toolTip = toolTip..Locale.ConvertTextKey("TXT_KEY_CC_WORLD_TOTAL_TOOLTIP", iTotal);
		--end
	end
  toolTip = toolTip.."[NEWLINE]"..GetDashString()..CCWorld_BuildToolTip();

	local ccBar = ContextPtr:LookUpControl("../CCWorldViewUI/CCBar");
	local ccBarShadow = ContextPtr:LookUpControl("../CCWorldViewUI/CCBarShadow");
  local ccButton = ContextPtr:LookUpControl("../CCWorldViewUI/CCButton");
  ccBar:SetPercent(iProgress / iThreshold);
	ccBarShadow:SetPercent((iProgress + iTotal) / iThreshold);
  ccButton:SetToolTipString(toolTip);

	-- disable flash
	local ccActiveFlash = ContextPtr:LookUpControl("../CCWorldViewUI/CCActiveFlash");
	local ccFlashBG = ContextPtr:LookUpControl("../CCWorldViewUI/CCFlashBG");
	ccActiveFlash:SetHide(true);
	ccFlashBG:SetHide(false);
end
LuaEvents.UpdateCCProgress.Add(CCWorld_OnUpdateCCProgress);

function CCWorld_Show()
	local ccWorld = ContextPtr:LookUpControl("../CCWorldViewUI/");
  ccWorld:SetHide(false);
end

function CCWorld_Hide()
	local ccWorld = ContextPtr:LookUpControl("../CCWorldViewUI/");
	ccWorld:SetHide(true);
end

function CCWorld_SwitchToMode(mode)
  if(g_mode == mode) then
    -- already in this mode
    return;
  end
  
	local ccBox = ContextPtr:LookUpControl("../CCWorldViewUI/CCBox");
	local ccBar = ContextPtr:LookUpControl("../CCWorldViewUI/CCBar");
	local ccBarShadow = ContextPtr:LookUpControl("../CCWorldViewUI/CCBarShadow");
	local ccBoxCd = ContextPtr:LookUpControl("../CCWorldViewUI/CCBoxCd");
	local ccBarCd = ContextPtr:LookUpControl("../CCWorldViewUI/CCBarCd");
	local ccBarShadowCd = ContextPtr:LookUpControl("../CCWorldViewUI/CCBarShadowCd");
  local ccButton = ContextPtr:LookUpControl("../CCWorldViewUI/CCButton");
	local ccIcon = ContextPtr:LookUpControl("../CCWorldViewUI/CCIcon");
	local ccIconBG = ContextPtr:LookUpControl("../CCWorldViewUI/CCIconBG");
	local ccIconShadow = ContextPtr:LookUpControl("../CCWorldViewUI/CCIconShadow");

	ccButton:ClearCallback(Mouse.eMClick);
	ccButton:SetVoids(0, 0);
	ccButton:RegisterCallback(Mouse.eLClick, CCWorld_OnShowPopup);
	ccButton:RegisterCallback(Mouse.eRClick, CCWorld_OnShowOverview);
  if(mode == "countdown") then
    CCWorld_Show();
    local electedPlayerId = doload("cc_electedPlayerId");
    local electedPlayer = Players[electedPlayerId];
    local electedCityId = doload("cc_electedCityId");
    local electedCity = electedPlayer:GetCityByID(electedCityId);
    
    
    if(electedPlayer ~= nil) and (electedCity ~= nil) then
			local bPlayerHasWon = PlayerHasWon(Game.GetActivePlayer());
      local bPlayerHasMetElectedPlayer = doload("cc_bPlayerHasMetElectedPlayer") or false;
      local bPlayerKnowsElectedCity = doload("cc_bPlayerKnowsElectedCity") or false;
			local bPlayerHasCommittee = PlayerHasCommittee(Game.GetActivePlayer());

			if(bPlayerHasWon or bPlayerHasCommittee) then
				bPlayerKnowsElectedCity = true;
			end

      if(bPlayerHasWon or bPlayerHasMetElectedPlayer or bPlayerHasCommittee) then
        local leader = GameInfo.Leaders[electedPlayer:GetLeaderType()];
        -- fill images with leader portraits / civ icons
        CivIconHookup(electedPlayer:GetID(), 32, ccIcon, ccIconBG, ccIconShadow, false, true);  
		    if(bPlayerHasWon or bPlayerKnowsElectedCity) then
		      -- set location for the button
					ccButton:RegisterCallback(Mouse.eMClick, CCWorld_OnLookAtCC);
		    end
      else
        -- fill images with unknown
        --CivIconHookup(22, 32, ccIcon, ccIconBG, ccIconShadow, false, true);
				IconHookup(22, 64, "LEADER_ATLAS", ccIcon, ccIconBG, ccIconShadow);
				--CivIconHookup(-1, 32, ccIcon, ccIconBG, ccIconShadow, false, true);
      end
      
			if(bPlayerHasWon) then
				ccButton:RegisterCallback(Mouse.eLClick, CCWorld_OnShowPopup);
			end
			
			ccButton:SetVoids(bPlayerKnowsElectedCity and 1 or 0, bPlayerHasWon and 1 or 0);
      ccButton:SetToolTipString(CCWorld_BuildToolTip());
    end
    
		ccBox:SetHide(true);
		ccBoxCd:SetHide(false);
  elseif (mode == "race") then
    CCWorld_Show();
    ccBox:SetHide(false);
		ccBoxCd:SetHide(true);		
		CCWorld_SetToEmpty();

		ccIcon:SetHide(true);
		ccIconBG:SetHide(false);
		ccIconShadow:SetHide(true);
		IconHookup(2, 32, "GAMESPEED_ATLAS", ccIcon);
		IconHookup(2, 32, "GAMESPEED_ATLAS", ccIconBG);
		IconHookup(2, 32, "GAMESPEED_ATLAS", ccIconShadow);
	elseif (mode == "empty") then
		CCWorld_Show();
		ccBox:SetHide(true);
		ccBoxCd:SetHide(true);
		CCWorld_SetToEmpty();

		ccIcon:SetHide(true);
		ccIconBG:SetHide(false);
		ccIconShadow:SetHide(true);
		IconHookup(0, 32, "CC_ATLAS_BASE", ccIconBG);
		local wondersRequired = GameDefines.CC_WONDERSREQUIRED;
		ccButton:SetToolTipString(Locale.ConvertTextKey("TXT_KEY_CC_WORLD_EMPTY_TOOLTIP", wondersRequired).."[NEWLINE]"..GetDashString()..CCWorld_BuildToolTip());
  elseif (mode == "hidden") then
    CCWorld_Hide();
  else
    print("CCWORLD_UI: Mode "..mode.." not supported");
    CCWorld_Hide();
    return;
  end
  
  g_mode = mode;
  dosave("cc_ui_world_mode", mode);
end

function CCWorld_OnReloadUI()
  CCWorld_SwitchToMode(doload("cc_ui_world_mode") or "empty");
end
LuaEvents.CCReloadUI.Add(CCWorld_OnReloadUI);

function CCWorld_OnRaceStarted()
  CCWorld_SwitchToMode("race");
end
LuaEvents.CCRaceStarted.Add(CCWorld_OnRaceStarted);

function CCWorld_OnCCElected(playerId, cityId)
  CCWorld_ProcessElection(playerId, cityId);
end
LuaEvents.CCElected.Add(CCWorld_OnCCElected);

function CCWorld_IsActivePlayer(player)
  return (player:GetID() == GetPlayer():GetID());
end

function CCWorld_ProcessElection(playerId, cityId)
	local player, city = GetPlayerCity(playerId, cityId);
  CCWorld_SwitchToMode("countdown");
  if(player:GetID() == GetPlayer():GetID()) then
    CCWorld_ShowPopup(player:GetID(), city:GetID());
  end
  CCWorld_PlaySoundOnPlayerWinner(player);
end

function CCWorld_OnCCDestroyedOrCaptured(playerId, cityId)
  --local player = Players[playerId];
  --local city = player:GetCityByID(cityId);
	CCWorld_SetToEmpty();
end
LuaEvents.CCDestroyedOrCaptured.Add(CCWorld_OnCCDestroyedOrCaptured);


-- Resets the worldview in case something happened (like city lost, etc)
function CCWorld_SetToEmpty()
  --local ccButton = ContextPtr:LookUpControl("../CCWorldViewUI/CCButton");
	local ccIcon = ContextPtr:LookUpControl("../CCWorldViewUI/CCIcon");
	local ccIconBG = ContextPtr:LookUpControl("../CCWorldViewUI/CCIconBG");
	local ccIconShadow = ContextPtr:LookUpControl("../CCWorldViewUI/CCIconShadow");

	-- question mark
	CivIconHookup(-1, 32, ccIcon, ccIconBG, ccIconShadow, false, true);
		--IconHookup(0, 32, "CC_ATLAS_BASE", ccIcon);
	ccIcon:SetHide(false);
	ccIconBG:SetHide(false);
	ccIconShadow:SetHide(false);
		--IconHookup(0, 32, "CC_ATLAS_BASE", ccIconBG);

		--IconHookup(0, 32, "CC_ATLAS_BASE", ccIconShadow);
end

-- Checks if the given player is the active player, when true the sound will be played
function CCWorld_PlaySoundOnPlayerWinner(player, sound)
  if(player:GetID() == GetPlayer():GetID()) then
    Events.AudioPlay2DSound("AS2D_EVENT_NOTIFICATION_GOOD");
  else
    Events.AudioPlay2DSound("AS2D_EVENT_NOTIFICATION_BAD");
  end
end

function CCWorld_OnShowPopup(_, iAllowThemeSelection)
  CCWorld_ShowPopup();
end

function CCWorld_OnShowOverview()
	CCWorld_ShowOverview();
end

function CCWorld_OnLookAtCC(iKnowsElectedCity, _)
  if(iKnowsElectedCity == 0) then
		return;
	end

	local playerId, cityId = LoadWinner();
	local player, city = GetPlayerCity(playerId, cityId);
  local plot = city:Plot();
  if plot ~= nil then
		Events.SerialEventHexHighlight(ToHexFromGrid(Vector2(plot:GetX(), plot:GetY())), true, Vector4(1.0, 0.0, 1.0, 1.0));
    UI.LookAt(plot, 0);
  end
end

function CCWorld_ShowOverview()
  local overview = ContextPtr:LookUpControl("../CCOverview/");
	overview:SetHide(not overview:IsHidden());
end

function CCWorld_ShowPopup()
  Events.SerialEventGameMessagePopup(GetNotificationData("MAIN"));
end



-- Default CCWorld_Show/CCWorld_Hide call
function CCWorld_ShowHideHandler( bIsCCWorld_Hide, bIsCCWorld_Init )
end
g_ccWorld:SetShowHideHandler(CCWorld_ShowHideHandler);
