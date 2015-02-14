if(Game.GetCustomOption("GAMEOPTION_CULTURALCAPITALS") == 0) then
	return;
end
-- CC
-- Author: Moaf
--------------------------------------------------------------
include("MoafsUtils");

local g_data = nil;
local g_specialistsData = nil;

local g_ccTypeIdList = {};

local DODEBUG_XMLDATA = false;

function Debug(message)
  if DODEBUG_XMLDATA then
    print(message);
  end
end

function InitXmlData()
  if(g_data == nil) then
    g_data = GetXmlData();
  end
  
  if(g_specialistsData == nil) then
    g_specialistsData = GetSpecialistsData();
  end
end

-- structure: {   .ccTypes = {.ccType = CCType, .ccBonuses = {CCBonus},
--                .ccBonusTypes = {CCBonusType} }
function GetXmlData()
	if(g_data ~= nil) then
		return g_data;
	end
  
  --Debug("Loading XML data");
  g_data = {};
	g_data.ccBonusTypes = GetCCBonusTypes();
  g_data.ccTypes = GetCCTypes();
  
	--AssignFlavors();
  --AssignBonuses();

  return g_data;
end

function GetThemeByType(strCCType)
  return g_data.ccTypes[strCCType];
end

function GetCCBonusType(strCCBonusType)
  return g_data.ccBonusTypes[strCCBonusType];
end

function GetCCBonusesForType(strCCType)
  return g_data.ccTypes[strCCType].ccBonuses;
end

function GetThemeById(ccTypeId)
	if(ccTypeId == nil) or (ccTypeId < 0) then
		return nil;
	end
	local ccTypeId = g_ccTypeIdList[ccTypeId];
	if(ccTypeId == nil) then
		return nil;
	end
  return g_data.ccTypes[ccTypeId];
end

-- checks if referenced objects do exist in the database
-- happens when other mods delete objects
function IsInvalidCCType(ccType)
	if(ccType.TechRequired ~= nil) and (GameInfo.Technologies[ccType.TechRequired] == nil) then return true; end
	if(ccType.SpecialistBuildingRequired ~= nil) and (GameInfo.Specialists[ccType.SpecialistBuildingRequired] == nil) then return true; end
	if(ccType.EraRequired ~= nil) and (GameInfo.Eras[ccType.EraRequired] == nil) then return true; end
	if(ccType.BuildingClassRequired ~= nil) then
		local buildingClass = GameInfo.BuildingClasses[ccType.BuildingClassRequired];
		if(buildingClass == nil) then return true; end
		if(GameInfo.Buildings[buildingClass.DefaultBuilding] == nil) then return true; end
	end
	if(ccType.BuildingClassInEmpireRequired ~= nil) then
		local buildingClass = GameInfo.BuildingClasses[ccType.BuildingClassInEmpireRequired];
		if(buildingClass == nil) then return true; end
		if(GameInfo.Buildings[buildingClass.DefaultBuilding] == nil) then return true; end
	end
	if(ccType.BuildingClassExcluded ~= nil) then
		local buildingClass = GameInfo.BuildingClasses[ccType.BuildingClassExcluded];
		if(buildingClass == nil) then return true; end
		if(GameInfo.Buildings[buildingClass.DefaultBuilding] == nil) then return true; end
	end
	if(ccType.BuildingClassInEmpireExcluded ~= nil) then
		local buildingClass = GameInfo.BuildingClasses[ccType.BuildingClassInEmpireExcluded];
		if(buildingClass == nil) then return true; end
		if(GameInfo.Buildings[buildingClass.DefaultBuilding] == nil) then return true; end
	end
	if(ccType.PolicyRequired ~= nil) and (GameInfo.Policies[ccType.PolicyRequired] == nil) then return true; end
	if(ccType.ObsoleteTech ~= nil) and (GameInfo.Technologies[ccType.ObsoleteTech] == nil) then return true; end
	if(ccType.ObsoleteEra ~= nil) and (GameInfo.Eras[ccType.ObsoleteEra] == nil) then return true; end
	if(ccType.CanHaveResource ~= nil) and (GameInfo.Resources[ccType.CanHaveResource] == nil) then return true; end
end

function AssignBonuses()
  for ccBonus in GameInfo.CCBonuses() do
		local ccType = GameInfo.CCTypes[ccBonus.CCType];
		if(ccType.IsEnabled and not IsInvalidCCType(ccType)) then
			local b = g_data.ccTypes[ccBonus.CCType].ccBonuses;
			local ccBonusType = GameInfo.CCBonusTypes[ccBonus.CCBonusType];
			b[ccBonusType.Type] = ccBonusType;
		end
  end
end

function GetCCTypes()
  local retVal = {};
  for ccType in GameInfo.CCTypes() do
		if(ccType.IsEnabled and not IsInvalidCCType(ccType)) then
			retVal[ccType.Type] = {};
			retVal[ccType.Type].ccType = ccType;

			-- assigning Bonuses
			retVal[ccType.Type].ccBonuses = {};
			for ccBonus in GameInfo.CCBonuses{CCType = ccType.Type}  do
				local ccBonusType = g_data.ccBonusTypes[ccBonus.CCBonusType];
				retVal[ccType.Type].ccBonuses[ccBonusType.Type] = ccBonusType;
			end

			-- assigning Flavors
			retVal[ccType.Type].ccFlavors = {};
			for flavor in GameInfo.CCType_Flavors{CCType = ccType.Type} do
				retVal[ccType.Type].ccFlavors[flavor.FlavorType] = flavor;
			end

			-- additionally, fill id list
			g_ccTypeIdList[ccType.ID] = ccType.Type;
		end

  end
  
  
  return retVal;
end

function GetCCBonusTypes()
  local retVal = {};
  for ccBonusType in GameInfo.CCBonusTypes() do
    retVal[ccBonusType.Type] = ccBonusType;
  end
  
  return retVal;
end


-- ======================================================
-- GetSpecialistsData
-- ======================================================
-- returns a table with buildings that have the according specialistslot
function GetSpecialistsData()
  if(g_specialistsData ~= nil) then
    return g_specialistsData;
  end
  
  g_specialistsData = {};
  
  for specialist in GameInfo.Specialists() do
    g_specialistsData[specialist.Type] = {};
  end
  
  for building in GameInfo.Buildings() do
    local specialistType = building.SpecialistType;
    if (building.SpecialistCount > 0) and (building.SpecialistType ~= nil) then
      local entry = g_specialistsData[specialistType];
      entry[building.Type] = building.ID;
    end
  end
  
  return g_specialistsData;
end

-- ======================================================
-- GetAllowedCCTypes
-- ======================================================
-- returns a list of allowed CCTypes and not allowed CCTypes for the current elected city
function GetAllowedCCTypes(playerId, cityId, bViewOnly)
	local player, city = GetPlayerCity(playerId, cityId);
	local bViewOnly = bViewOnly or false;
  local ret = {};
  local notAllowedRet = {};
  for key, value in pairs(g_data.ccTypes) do
    if(not bViewOnly and IsValidCCType(playerId, cityId, value.ccType)) then
      table.insert(ret, value);
    else
      table.insert(notAllowedRet, value);
    end
  end
  
  return ret, notAllowedRet;
end

function GetCCTypeData(ccType)
	return g_data.ccTypes[ccType.Type];
end

-- ======================================================
-- CityHasSpecialistBuilding
-- ======================================================
-- returns whether or not the city has buildings with the specified specialist
function CityHasSpecialistBuilding(city, specialist)
  for buildingType, buildingId in pairs(g_specialistsData[specialist.Type]) do
    if(city:IsHasBuilding(buildingId)) then
      return true;
    end
  end
  
  return false;
end

-- ======================================================
-- CityHasBuildingClass
-- ======================================================
-- returns true if the city has the specified buildingclass
function CityHasBuildingClass(city, buildingClass)
  for building in GameInfo.Buildings{BuildingClass = buildingClass} do
    if(city:IsHasBuilding(building.ID)) then
      return true;
    end
  end
  
  return false;
end

function GetOriginalCityCount(player)
	local cityCount = 0;
	for city in player:Cities() do
		if(city:GetOriginalOwner() == player:GetID()) then
			cityCount = cityCount + 1;
		end
	end

	return cityCount;
end

function GetNoOfCitiesRequired(ccType)
	if(ccType.NoOfCitiesRequired == 0) then
		return 0;
	end

	return math.max(math.floor(ccType.NoOfCitiesRequired * GetMapScale("NoOfCityModifier")), 1);
end

-- ======================================================
-- ======================================================
-- Fail Checks
-- ======================================================
function FailsCitySizeCheck(city, ccType)
	if(city == nil) then
		return true;
	end
	if(ccType.CitySizeRequired ~= 0) then
		if(ccType.CitySizeRequired < 0) then
			return (city:GetPopulation() > math.abs(ccType.CitySizeRequired));
		else
			return (city:GetPopulation() < ccType.CitySizeRequired);
		end
  end

  return false;
end

function FailsTechCheck(player, ccType)
	if(player == nil) then
		return true;
	end
	local team = Teams[player:GetTeam()];
  return (ccType.TechRequired ~= nil) and (GameInfo.Technologies[ccType.TechRequired] ~= nil) and (not team:IsHasTech(GameInfo.Technologies[ccType.TechRequired].ID));
end

function FailsSpecialistBuildingCheck(city, ccType)
	if(city == nil) then
		return true;
	end
  return (ccType.SpecialistBuildingRequired ~= nil) and (GameInfo.Specialists[ccType.SpecialistBuildingRequired] ~= nil) and (not CityHasSpecialistBuilding(city, GameInfo.Specialists[ccType.SpecialistBuildingRequired]));
end

function FailsWonderCheck(city, ccType)
	if(city == nil) then
		return true;
	end
  return (ccType.NoOfWondersRequired > 0) and (city:GetNumWorldWonders() < ccType.NoOfWondersRequired);
end

function FailsCityCheck(player, ccType)
	if(player == nil) then
		return true;
	end
	if(ccType.NoOfCitiesRequired ~= 0) then
		local cityCount = GetOriginalCityCount(player);
		local countRequired = GetNoOfCitiesRequired(ccType);

		if(cityCount > 0) then
			return (cityCount < countRequired);
		else
			return (cityCount > math.abs(countRequired));
		end
	end

	return false;
end

function FailsEraCheck(player, ccType)
	if(player == nil) then
		return true;
	end
  return (ccType.EraRequired ~= nil) and (GameInfo.Eras[ccType.EraRequired] ~= nil) and (player:GetCurrentEra() < GameInfo.Eras[ccType.EraRequired].ID);
end

function FailsBuildingClassCheck(city, ccType)
	if(city == nil) then
		return true;
	end
  return (ccType.BuildingClassRequired ~= nil) and (not CityHasBuildingClass(city, ccType.BuildingClassRequired));
end

function FailsBuildingClassInEmpireCheck(player, ccType)
	if(player == nil) then
		return true;
	end
  return (ccType.BuildingClassInEmpireRequired ~= nil) and (player:GetBuildingClassCount(GameInfo.BuildingClasses[ccType.BuildingClassInEmpireRequired].ID) < 1);
end

function FailsPolicyCheck(player, ccType)
	if(player == nil) then
		return true;
	end
  return (ccType.PolicyRequired ~= nil) and (GameInfo.Policies[ccType.PolicyRequired] ~= nil) and (not player:HasPolicy(GameInfo.Policies[ccType.PolicyRequired].ID));
end

function FailsGarrisonCheck(city, ccType)
	if(city == nil) then
		return true;
	end
  return (ccType.GarrisonRequired) and (city:GetGarrisonedUnit() == nil);
end

function FailsBuildingClassExcludedCheck(city, ccType)
	if(city == nil) then
		return true;
	end
	return (ccType.BuildingClassExcluded ~= nil) and (CityHasBuildingClass(city, ccType.BuildingClassExcluded));
end

function FailsBuildingClassInEmpireExcludedCheck(player, ccType)
	if(player == nil) then
		return true;
	end
	return (ccType.BuildingClassInEmpireExcluded ~= nil) and (player:GetBuildingClassCount(GameInfo.BuildingClasses[ccType.BuildingClassInEmpireExcluded].ID) > 0);
end

function HasValidResourcePlot(city, ccType)
	local cityX = city:GetX();
	local cityY = city:GetY();

	local citySize = 3; -- todo: find value that defines the city size in xml files

	for x = -citySize, citySize, 1 do
		for y = -citySize, citySize, 1 do
			plot = Map.GetPlotXY(cityX, cityY, x, y);
			if(plot ~= nil) then
				local plotX = plot:GetX();
				local plotY = plot:GetY();
				if(plotX ~= cityX) and (plotY ~= cityY) and
					(Map.PlotDistance(cityX, cityY, plotX, plotY) <= citySize) and
					(plot:GetOwner() == city:GetOwner()) and
					(plot:GetNumResource() < 1) and plot:CanHaveResource(ccType.CanHaveResource, true)
						then
					return true;
				end
			end
		end
	end

	return false;
end

function FailsCanHaveResourceCheck(city, ccType)
	if(city == nil) then
		return true;
	end

	if(ccType.CanHaveResource == nil) then
		return false;
	end

	
	return not HasValidResourcePlot(city, ccType);
	--return (ccType.CanHaveResource ~= nil) and (plot:GetNumResource() > 0) and not plot:CanHaveResource(ccType.CanHaveResource, true);
end

function FailsMustProduceCheck(city, ccType)
	if(city == nil) then
		return true;
	end
	return ccType.MustProduce and not city:IsProductionBuilding() and not city:IsProductionUnit();
end

function IsObsolete(playerId, ccType)
	local player = Players[playerId];
	if(player == nil) then
		return false;
	end
  return IsObsoleteTech(player, ccType) or IsObsoleteEra(player, ccType);
end

function IsObsoleteTech(player, ccType)
	if(player == nil) then
		return false;
	end
	local team = Teams[player:GetTeam()];
	return (ccType.ObsoleteTech ~= nil) and (GameInfo.Technologies[ccType.ObsoleteTech] ~= nil) and (team:IsHasTech(GameInfo.Technologies[ccType.ObsoleteTech].ID));
end

function IsObsoleteEra(player, ccType)
	if(player == nil) then
		return false;
	end
	return (ccType.ObsoleteEra ~= nil) and (GameInfo.Eras[ccType.ObsoleteEra] ~= nil) and (player:GetCurrentEra() >= GameInfo.Eras[ccType.ObsoleteEra].ID);
end

function IsDebug(ccType)
	return ccType.IsDebug;
end

-- ======================================================
-- IsValidCCType
-- ======================================================
-- returns whether or not the city fulfills the requirements given by the ccType
function IsValidCCType(playerId, cityId, ccType)
	local player, city = GetPlayerCity(playerId, cityId);
	if(player == nil) or (city == nil) then
		return false;
	end

	-- FOR TESTING
	if(IsDebug(ccType)) then
		return true;
	end

  if(IsObsolete(playerId, ccType)) then
    return false;
  end
  
  -- SpecialistBuilding Check
  if(FailsSpecialistBuildingCheck(city, ccType)) then
    return false;
  end
  
  -- Wonders Check
  if(FailsWonderCheck(city, ccType)) then
    return false;
  end

	-- Cities Check
  if(FailsCityCheck(player, ccType)) then
    return false;
  end
  
  -- CitySize Check
  if(FailsCitySizeCheck(city, ccType)) then
    return false;
  end
  
  -- Tech Check
  if(FailsTechCheck(player, ccType)) then
    return false;
  end
  
  -- Era Check
  if(FailsEraCheck(player, ccType)) then
    return false;
  end
 
  -- BuildingClass Check
  if(FailsBuildingClassCheck(city, ccType)) then
    return false;
  end
  
  -- Policy Check
  if(FailsPolicyCheck(player, ccType)) then
    return false;
  end
  
  -- Garrison Check
  if(FailsGarrisonCheck(city, ccType)) then
    return false;
  end

	-- BuildingClassExcluded Check
  if(FailsBuildingClassExcludedCheck(city, ccType)) then
    return false;
  end

  -- BuildingClassInEmpireExcluded Check
  if(FailsBuildingClassInEmpireExcludedCheck(player, ccType)) then
    return false;
  end

	-- FailsBuildingClassInEmpire Check
  if(FailsBuildingClassInEmpireCheck(player, ccType)) then
    return false;
  end

	-- FailsCanHaveResource Check
	if(FailsCanHaveResourceCheck(city, ccType)) then
		return false;
	end

	if(FailsMustProduceCheck(city, ccType)) then
		return false;
	end

  return true;
end

-- alias function
function IsValidTheme(playerId, cityId, theme)
	return IsValidCCType(playerId, cityId, theme.ccType);
end

