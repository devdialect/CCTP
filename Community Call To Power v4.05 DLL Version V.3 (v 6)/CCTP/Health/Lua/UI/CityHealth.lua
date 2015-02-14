include("IconSupport")
include("InstanceManager")
include( "Plague_UI.lua" );
--------------------------------------------------------------------
MapModData.g_Properties	= MapModData.g_Properties or {}
local g_Properties		= MapModData.g_Properties;
--------------------------------------------------------------------
local g_ProductionManager = InstanceManager:new("CityHealth", "City", Controls.HealthStack)

local g_SortTable = {}
local g_ActiveSort = "status"
local g_ReverseSort = false

local g_StatusIcons = {"", "[ICON_PLAGUE]"}
local g_StatusToolTips = {"", "TXT_KEY_CH_STATUS_PLAGUED_TT"}
--------------------------------------------------------------------
function OnSort(sort)
  if (sort == g_ActiveSort) then
    g_ReverseSort = not g_ReverseSort
  else
    g_ReverseSort = not (sort == "name" or sort == "status")
    g_ActiveSort = sort
  end

  Controls.HealthStack:SortChildren(SortByValue)
end
Controls.SortIcon:RegisterCallback(Mouse.eLClick, function() OnSort("status") end)
Controls.SortName:RegisterCallback(Mouse.eLClick, function() OnSort("name") end)
Controls.SortHealth:RegisterCallback(Mouse.eLClick, function() OnSort("health") end)
Controls.SortRisk:RegisterCallback(Mouse.eLClick, function() OnSort("risk") end)
--------------------------------------------------------------------
function SortByValue(a, b)
  local entryA = g_SortTable[tostring(a)]
  local entryB = g_SortTable[tostring(b)]

  if (entryA == nil or entryB == nil) then
    return tostring(a) < tostring(b)
  end

  local valueA = entryA[g_ActiveSort]
  local valueB = entryB[g_ActiveSort]

  if (valueA == valueB) then
    valueA = entryA.name
    valueB = entryB.name
  elseif (g_ReverseSort) then
    valueA = entryB[g_ActiveSort]
    valueB = entryA[g_ActiveSort]
  end

  if (valueA == nil or valueB == nil) then
    return tostring(a) < tostring(b)
  end

  return valueA < valueB
end
--------------------------------------------------------------------
function OnCity(pCity)
  -- From CityBannerManager
  if (pCity:IsPuppet()) then
    Events.SerialEventGameMessagePopup({Type=ButtonPopupTypes.BUTTONPOPUP_ANNEX_CITY, Data1=pCity:GetID(), Data2=-1, Data3=-1, Option1=false, Option2=false})
  else
    UI.DoSelectCityAtPlot(pCity:Plot())
  end
end
--------------------------------------------------------------------
function UpdateData(iPlayer)
  local pPlayer = Players[iPlayer]

  g_ProductionManager:ResetInstances()
  g_SortTable = {}

  for pCity in pPlayer:Cities() do
    local instance = g_ProductionManager:GetInstance()
    local sort = {}
    g_SortTable[tostring(instance.City)] = sort

    local iStatus = IsPlagued(pCity) and 2 or 1
    sort.status = iStatus
    instance.Icon:SetText(g_StatusIcons[iStatus])
    instance.Icon:SetToolTipString(Locale.ConvertTextKey(g_StatusToolTips[iStatus]))

    sort.name = pCity:GetName()
    instance.Name:SetText(pCity:GetName())
    instance.Name:RegisterCallback(Mouse.eLClick, function() OnCity(pCity) end)

	local cityHealth = GetCityHealthIndex(pCity)
    sort.health = cityHealth
    instance.Health:SetText(cityHealth)
	instance.Health:SetToolTipString(GetHealthTooltip(pCity, true))
	
    sort.risk = GetCityRiskString(cityHealth - 1)
    instance.Risk:SetText(Locale.ConvertTextKey(sort.risk))
	
  end
  
  Controls.HealthStack:SortChildren(SortByValue)
  Controls.HealthStack:CalculateSize()
  Controls.HealthScrollPanel:CalculateInternalSize()
end
--------------------------------------------------------------------
function OnClose()
  ContextPtr:SetHide(true)
end
Controls.CloseButton:RegisterCallback(Mouse.eLClick, OnClose)
--------------------------------------------------------------------
function InputHandler(uiMsg, wParam, lParam)
  if (uiMsg == KeyEvents.KeyDown) then
    if (wParam == Keys.VK_ESCAPE) then
      OnClose()
      return true
    end
  end
end
ContextPtr:SetInputHandler(InputHandler)
--------------------------------------------------------------------
function OnCityViewUpdate()
  if (not ContextPtr:IsHidden()) then
    UpdateData(Game.GetActivePlayer())
  end
end
Events.SerialEventCityInfoDirty.Add(OnCityViewUpdate)
LuaEvents.CityProductionDisplay.Add(function() ContextPtr:SetHide(false) end)
--------------------------------------------------------------------
local wasHidden
function OnEnterCityScreen()
  wasHidden = ContextPtr:IsHidden()
  ContextPtr:SetHide(true);
end
Events.SerialEventEnterCityScreen.Add(OnEnterCityScreen)
--------------------------------------------------------------------
function OnExitCityScreen()
  ContextPtr:SetHide(wasHidden)
end
Events.SerialEventExitCityScreen.Add(OnExitCityScreen)
--------------------------------------------------------------------
function ShowHideHandler(bIsHide, bInitState)
  if (not bInitState and not bIsHide) then
    OnCityViewUpdate()
  end
end
ContextPtr:SetShowHideHandler(ShowHideHandler)
ContextPtr:SetHide(true)
--------------------------------------------------------------------
local bStandardInsert = true
LuaEvents.DiploCornerExtended.Add(function() bStandardInsert = false; end)
--------------------------------------------------------------------
function OnDiploCornerPopup()
  ContextPtr:SetHide(false)
end
--------------------------------------------------------------------
function OnAdditionalInformationDropdownGatherEntries(additionalEntries)
  if (bStandardInsert) then
    table.insert(additionalEntries, {text=Locale.ConvertTextKey("TXT_KEY_CH_DIPLO_CORNER_HOOK"), call=OnDiploCornerPopup})
  end
end
LuaEvents.AdditionalInformationDropdownGatherEntries.Add(OnAdditionalInformationDropdownGatherEntries)
LuaEvents.RequestRefreshAdditionalInformationDropdownEntries()
