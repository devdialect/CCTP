if(Game.GetCustomOption("GAMEOPTION_CULTURALCAPITALS") == 0) then
	return;
end

include("MoafsUtils");
include("FLuaVector");
include( "CCWhysUtils" );
-- vymdt.01.2010.11.12.1515
-- Created by: Whys Alives, modified by Moaf
--===========================================================================
--[[
Global Variables.
]]
local g_customActiveNotifications  = {};
local g_customInstances            = {};
local g_customData                 = {};
local g_customId                   = 0;

--handled custom notification types.
local g_customNameTable = {};
g_customNameTable[GameInfo.CCNotifications.NOTIFICATION_CULTURALCAPITAL] = "CC";
g_customNameTable[GameInfo.CCNotifications.NOTIFICATION_ELECTIONSTARTED] = "CC";
g_customNameTable[GameInfo.CCNotifications.NOTIFICATION_THEMECHOSEN] = "ThemeChosen";

--===========================================================================
--[[
handles default mouse left-click for custom notifications.  Uses fourth
argument in LuaEvents.CustomNotification() to goto {x,y} map location.
]]
function CCNot_CustomLeftClick( id )
	Debug("Left Click detected. Id = " .. out(it) .. "; customData[id] = " .. out(g_customData[id]));
  if  type( g_customData[id] ) == "table" and
      type( g_customData[id]["location"] ) == "table" then
    local plot = Map.GetPlot( g_customData[id]["location"][1]
        , g_customData[id]["location"][2] );
    if plot ~= nil then
			UI.LookAt( plot, 0 );
			Events.SerialEventHexHighlight(ToHexFromGrid(Vector2(plot:GetX(), plot:GetY())), true, Vector4(1.0, 0.0, 1.0, 1.0));
		end
  end
end
--===========================================================================
--[[
handles default mouse right-click for custom notifications.  Deactivates
custom notification.
]]
function CCNot_CustomRightClick( id )
  if g_customActiveNotifications[id] == nil then
    Debug("Unknown Custom Notification Id: "..tostring(id));
		return;
  end
  local name = g_customNameTable[g_customActiveNotifications[id]];
  local instance = g_customInstances[id];
  if instance ~= nil then
		local smallStack = ContextPtr:LookUpControl("/InGame/WorldView/ActionInfoPanel/NotificationPanel/SmallStack");
    smallStack:ReleaseChild( instance[name.."Container"] );
    g_customInstances[id] = nil;
  end
  CCNot_ProcessStackSizes();
end

-------------------------------------------------------------------------------
-- details for dynamically sizing the small notification stack
-------------------------------------------------------------------------------
local DIPLO_SIZE_GUESS = 120;
local _, screenY = UIManager:GetScreenSizeVal();
local offsetY;
local g_SmallScrollMax;

-- Init function
function CCNot_Init()
	local context = ContextPtr:LookUpControl("../CCNotifications/");
	context:ChangeParent(ContextPtr:LookUpControl("/InGame/WorldView/ActionInfoPanel/NotificationPanel/"));
  _, offsetY = ContextPtr:LookUpControl("/InGame/WorldView/ActionInfoPanel/NotificationPanel/OuterStack"):GetOffsetVal();
	g_SmallScrollMax = screenY - offsetY - DIPLO_SIZE_GUESS;
end


-------------------------------------------------
-------------------------------------------------
-- copied and modified from notificationpanel.lua
function CCNot_ProcessStackSizes()
	local smallStack = ContextPtr:LookUpControl("/InGame/WorldView/ActionInfoPanel/NotificationPanel/SmallStack");
	local smallScrollPanel = ContextPtr:LookUpControl("/InGame/WorldView/ActionInfoPanel/NotificationPanel/SmallScrollPanel");
	local bigStack = ContextPtr:LookUpControl("/InGame/WorldView/ActionInfoPanel/NotificationPanel/BigStack");
	local outerStack = ContextPtr:LookUpControl("/InGame/WorldView/ActionInfoPanel/NotificationPanel/OuterStack");

  bigStack:CalculateSize();
  local bigY = bigStack:GetSizeY();
  smallScrollPanel:SetSizeY( g_SmallScrollMax - bigY );
  smallStack:CalculateSize();
  smallStack:ReprocessAnchoring();
	smallScrollPanel:CalculateInternalSize();
  if( smallScrollPanel:GetRatio() ~= 1 ) then
      smallScrollPanel:SetOffsetVal( 20, 0 );
  else
      smallScrollPanel:SetOffsetVal( 0, 0 );
  end
    
  outerStack:CalculateSize();
  outerStack:ReprocessAnchoring();
end

--===========================================================================
--===========================================================================

function CCNot_OpenCCInfoOnLeftClick(id)
  CCNot_CustomLeftClick(id);
end
--===========================================================================
--[[
Activates custom notification.
]]
function CCNot_OnCustomNotificationAdded( iType, summary, toolTip, data )

	local smallStack = ContextPtr:LookUpControl("/InGame/WorldView/ActionInfoPanel/NotificationPanel/SmallStack");
	local notificationPanelContext = ContextPtr:LookUpControl("/InGame/WorldView/ActionInfoPanel/NotificationPanel/");
	local ccNotContext = ContextPtr:LookUpControl("../CCNotifications/");

  g_customId = g_customId + 1;
  if g_customActiveNotifications[g_customId] ~= nil then
    Debug("Redundant Custom Notification Type: "..tostring(iType));
		return;
  end
  local instance = {};
  local name = g_customNameTable[iType];

	ccNotContext:BuildInstanceForControl(name.."Item", instance, smallStack);
  g_customInstances[g_customId]  = instance;
  g_customData[g_customId] = data;

  local root   = instance[name.."Container"];
  local button = instance[name.."Button"];

  instance.FingerTitle:SetText( summary );
  root:BranchResetAnimation();

  local leftClick, rightClick = nil, nil;
  --.........................................................................
  -- Custom Notification Handling
  if(iType == GameInfo.CCNotifications.NOTIFICATION_CULTURALCAPITAL) then
    leftClick = CCNot_OpenCCInfoOnLeftClick;
		local player = Players[data.playerId];
		if(player ~= nil) then
			local myCivType = player:GetCivilizationType();
			local myCivInfo = GameInfo.Civilizations[myCivType];
			local leader = GameInfo.Leaders( "Type = '" .. GameInfo.Civilization_Leaders( "CivilizationType = '" .. myCivInfo.Type .. "'" )().LeaderheadType .. "'" )();
			IconHookup(leader.PortraitIndex, 64, leader.IconAtlas, instance.LeaderPortrait);
		else
			--CivIconHookup(-1, 64, instance.LeaderPortrait, nil, nil, false, true);
			IconHookup(22, 64, "LEADER_ATLAS", instance.LeaderPortrait);
		end
		instance.Anim:SetHide(false);
	elseif(iType == GameInfo.CCNotifications.NOTIFICATION_THEMECHOSEN) then
		local theme = data.theme;
		IconHookup(theme.ccType.PortraitIndex, 64, theme.ccType.IconAtlas, instance.ThemePortrait);
  end

	-- setting the custom CC Icon -> CCIconBg element must exist in instance!
	IconHookup(0, 80, "CC_ATLAS_BASE", instance.CCIconBg);
  --END Custom Notification Handling
  --.........................................................................
  if type( leftClick  ) ~= "function" then leftClick  = CCNot_CustomLeftClick;  end
  if type( rightClick ) ~= "function" then rightClick = CCNot_CustomRightClick; end

  button:SetHide( false );
  button:SetVoid1( g_customId );
  button:RegisterCallback( Mouse.eLClick, leftClick );
  button:RegisterCallback( Mouse.eRClick, rightClick );
  button:SetToolTipString( toolTip );

  g_customActiveNotifications[g_customId] = iType;
  CCNot_ProcessStackSizes();
end
LuaEvents.CustomNotification.Add( CCNot_OnCustomNotificationAdded );
--===========================================================================
--[[
Deactivates all custom notifications on end of turn.
]]
function CCNot_OnTurnEnd()
  for id,type in pairs(g_customInstances) do CCNot_CustomRightClick(id); end
end
Events.ActivePlayerTurnEnd.Add(CCNot_OnTurnEnd);