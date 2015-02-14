-- OceanCities_Main
-- Author: FramedArchitecture
-- DateCreated: 3/2014
--------------------------------------------------------------
include( "FLuaVector" )
include( "Serializer.lua" )
--------------------------------------------------------------
MapModData.g_Properties		= MapModData.g_Properties or {}
g_Properties				= MapModData.g_Properties;
--------------------------------------------------------------
local saveData = Modding.OpenSaveData()
local cityGraphic = GameInfoTypes["IMPROVEMENT_OCEAN_CITY"]
local oceanBuilding = GameInfoTypes["BUILDING_AC_OCEAN_CITY"]
local maxDamage = GameDefines["MAX_CITY_HIT_POINTS"]
local coastTerrain = TerrainTypes.TERRAIN_COAST
local cityEra = GameInfo.Eras["ERA_MODERN"]
local next = next
--------------------------------------------------------------
function OnTestOceanFoundPlot(playerID, unitID, x, y)
	OnRestorePlot()

	local player = Players[playerID]
	if not IsFoundEra(player) then return end
	if not player:GetCapitalCity() then return end
	
	local plot = Map.GetPlot(x, y)
	local unit = player:GetUnitByID(unitID)
	if IsOceanFoundPlot(plot, unit) then
		OnFoundPlot(plot)
	end
end
GameEvents.UnitSetXY.Add( OnTestOceanFoundPlot )
--------------------------------------------------------------
function OnUnitSelected(playerID, unitID, hexX, hexY, int, bSelected)
	if bSelected then
		OnTestOceanFoundPlot(playerID, unitID, ToGridFromHex( hexX, hexY ))
	end
end
Events.UnitSelectionChanged.Add( OnUnitSelected )
--------------------------------------------------------------
function OnCityFounded(playerID, x, y)
	local t = GetSettlerPlots()
	for _,v in pairs(t) do
		if (v.x == x) and (v.y == y) then
			FoundOceanCity(playerID, x, y)
		end
	end
end
GameEvents.PlayerCityFounded.Add( OnCityFounded )
--------------------------------------------------------------
function OnOceanCityDestroyed(hexPos)
	local plot = Map.GetPlot(ToGridFromHex(hexPos.x, hexPos.y))
	if plot:IsCity() then return end
	if plot:GetImprovementType() == cityGraphic then
		plot:SetImprovementType(-1)
	end
end
Events.SerialEventCityDestroyed.Add(OnOceanCityDestroyed)
--------------------------------------------------------------
function OnOceanCitySetDamage(playerID, cityID, damage, prevdamage)
	local city = Players[playerID]:GetCityByID(cityID)
	if city and IsOcean(city) then
		city:Plot():SetImprovementPillaged(damage~=0)
	end
end
Events.SerialEventCitySetDamage.Add(OnOceanCitySetDamage)
--------------------------------------------------------------
function OnCityCanConstruct(playerID, cityID, buildingType)
	if GameInfo.Buildings[buildingType].OceanCityWater then
		local city = Players[playerID]:GetCityByID(cityID)
		return (city:IsCoastal() or IsOcean(city))
	end
	return true
end
GameEvents.CityCanConstruct.Add( OnCityCanConstruct )
--------------------------------------------------------------
function OnEraChanged(eraID, playerID)
	local player = Players[playerID]
	if cityEra and player:IsHuman() then
		if cityEra.ID == eraID then 
			ValidEraNotification(player)
		end
	end
end
Events.SerialEventEraChanged.Add( OnEraChanged )
--------------------------------------------------------------
function OnRestorePlot()
	local restore = function(data)
		local plot = Map.GetPlot(data.x, data.y)
		if plot and data.type then
			plot:SetPlotType(data.type)
			if data.terrain then
				plot:SetTerrainType(data.terrain)
			end
			if data.feature then
				plot:SetFeatureType(data.feature, -1)
			end
			if data.resource then
				if data.resnum then
					plot:SetResourceType(data.resource, data.resnum)
				end
			end
			if data.improvement then
				plot:SetImprovementType(data.improvement)
				plot:SetImprovementPillaged(data.pillaged)
			end
		end
		return nil
	end
	local t = GetSettlerPlots()
	if #t > 0 then
		for i,data in ipairs(t) do
			t[i] = restore(data)
		end
		SaveSettlerPlots(t)
	end
end
Events.StrategicViewStateChanged.Add(OnRestorePlot)
Events.SerialEventEnterCityScreen.Add(OnRestorePlot)
Events.ActivePlayerTurnEnd.Add(OnRestorePlot)
--------------------------------------------------------------
function OnFoundPlot(plot)
	local swap = function()
		local data = {
			x = plot:GetX(),
			y = plot:GetY(),
			type = (plot:GetPlotType()~=-1) and plot:GetPlotType() or nil,
			terrain = (plot:GetTerrainType()~=-1) and plot:GetTerrainType() or nil,
			feature = (plot:GetFeatureType()~=-1) and plot:GetFeatureType() or nil,
			resource = (plot:GetResourceType()~=-1) and plot:GetResourceType() or nil,
			resnum = (plot:GetNumResource() > 0) and plot:GetNumResource() or nil,
			improvement = (plot:GetImprovementType()~=-1) and plot:GetImprovementType() or nil,
			pillaged = plot:IsImprovementPillaged()
		};
		ResetUnits(plot)
		plot:SetPlotType(PlotTypes.PLOT_LAND)
		plot:SetTerrainType(TerrainTypes.TERRAIN_PLAINS)
		return data
	end
	local t = GetSettlerPlots()
	t[1] = swap()
	SaveSettlerPlots(t)
end
--------------------------------------------------------------
function IsOcean(city)
	return city:Plot():IsWater()
end
--------------------------------------------------------------
function IsOceanFoundPlot(plot, unit)
	if not plot then return false end
	if not unit then return false end
	if not plot:IsWater() then return false end
	if not IsFoundUnit(unit) then return false end
	if unit:GetMoves() < 1 then return false end
	if not IsCoastal(plot) then return false end
	if plot:IsCity() then return false end
	return true
end
--------------------------------------------------------------
function IsCoastal(plot)
	if plot:GetTerrainType() == coastTerrain then
		return true
	end
	local x, y = plot:GetX(), plot:GetY()
	for i = 0, 5 do
		local adjPlot = Map.PlotDirection(x, y, i);
		if adjPlot and (adjPlot:GetTerrainType() == coastTerrain) then
			return true
		end
	end
	return false
end
--------------------------------------------------------------
function IsFoundUnit(unit)
	return GameInfo.Units[unit:GetUnitType()].Found
end
--------------------------------------------------------------
function IsFoundEra(player)
	if cityEra then 
		return cityEra.ID <= player:GetCurrentEra() 
	end
	return false
end
--------------------------------------------------------------
function FoundOceanCity(playerID, x, y)
	local plot = Map.GetPlot(x, y)
	local city = plot:GetPlotCity()
	if city then
		local info = GetCityInfo(city)
		local CloneCity = function()
			OnRestorePlot()
			city = Players[playerID]:InitCity(x, y)
			city:SetName(info.name)
			city:SetPopulation(info.pop, true)
			city:SetNumRealBuilding(oceanBuilding, 1)
			for type,num in pairs(info.buildings) do
				city:SetNumRealBuilding(GameInfoTypes[type],num)
			end
			plot:SetImprovementType(cityGraphic)
		end
		city:Kill()
		Events.SerialEventCityDestroyed(ToHexFromGrid(Vector2(x, y)), playerID, city:GetID(), -1)
		CloneCity()
		Events.SerialEventGameDataDirty()
	end
end
--------------------------------------------------------------
function GetCityInfo(city)
	print("GetCityInfo(city)")
	local info = {}
	local buildings = function()
		local t = {}
		for row in GameInfo.Buildings() do
			if city:IsHasBuilding(row.ID) then
				t[row.Type] = city:GetNumBuilding(row.ID)
			end
		end
		return t
	end
	info.name = city:GetName()
	info.pop = city:GetPopulation()
	info.buildings = buildings()
	return info
end
--------------------------------------------------------------
function ResetUnits(plot)
	for i = 0, plot:GetNumUnits() - 1, 1 do
         local unit = plot:GetUnit( i );
         if unit and not IsFoundUnit(unit) then
			unit:JumpToNearestValidPlot()
         end
     end
end
--------------------------------------------------------------
function ValidEraNotification(player)
	local heading = Locale.ConvertTextKey("TXT_KEY_IMPROVEMENT_OCEAN_CITY");
	local text = Locale.ConvertTextKey("TXT_KEY_AC_ERA_FOUND_OCEAN_CITY_TT");
	local help = Locale.ConvertTextKey("TXT_KEY_AC_ERA_FOUND_OCEAN_CITY_CHANGE");
	player:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, text, heading, -1, -1);
	UI.AddPopup( { Type = ButtonPopupTypes.BUTTONPOPUP_TEXT, Data1 = 800, Option1 = true, Text = help } );
end
--------------------------------------------------------------
--SaveHandler
--------------------------------------------------------------
function SaveSettlerPlots(t)
	SetPersistentTable("g_OceanCitiesTempPlots", t)
end
--------------------------------------------------------------
function GetSettlerPlots()
	return GetPersistentTable("g_OceanCitiesTempPlots");
end
--------------------------------------------------------------
function GetPersistentTable(name)
	if (g_Properties[name] == nil) then
		local code = saveData.GetValue(name);
		if code then
			g_Properties[name] = loadstring(code)();
		else
			g_Properties[name] = {}
		end
	end
	return g_Properties[name];
end
--------------------------------------------------------------
function SetPersistentTable(name, t)
    saveData.SetValue(name, serialize(t))
	g_Properties[name] = t;
end
--------------------------------------------------------------
function Init()
	if PreGame.GetGameOption("GAMEOPTION_OCEAN_CITIES_EARLY") then
		cityEra = GameInfo.Eras["ERA_INDUSTRIAL"]
	end
	if Game.GetElapsedGameTurns() == 0 then
		for i = 0, GameDefines.MAX_MAJOR_CIVS - 1, 1 do
			local player = Players[i]
			if player and player:IsHuman() and IsFoundEra(player) then
				ValidEraNotification(player)
				break;
			end
		end
	end
end
--------------------------------------------------------------
Init()