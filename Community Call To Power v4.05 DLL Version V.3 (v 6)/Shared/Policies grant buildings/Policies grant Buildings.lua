-- Policies grant buildings
-- Author: Machiavelli
-- DateCreated: 6/27/2014 7:46:43 PM
--------------------------------------------------------------
-- Version 8
--
-- Purpose:
-- When a player adopts a policy, founds a city or captures a city
-- LuaEvents.GetPolicyBuildings gets called for the city (or every city
-- if a policy was adopted).  Tables (like those in PGB_Tables.xml) hook
-- into LuaEvents.GetPolicyBuildings and add their valid buildings to the
-- buildingList.  When this code gets the populated buildingList back it
-- adds those buildings to the city.
--
-- Each turn LuaEvents.GetBlockedPolicyBuildings is called tables hook
-- into that event as well.  Any buildings put into the list will be removed
-- from the city.
--------------------------------------------------------------

------------------------------
-- Private helper functions --
------------------------------
function GetBuildingTypeFromClass(buildingClass, civilizationTypeID)
	-- Assume it is the default building
	local buildingType = GameInfo.BuildingClasses[buildingClass].DefaultBuilding;

	-- See if this civilization has a unique building for this building class
	local condition = "CivilizationType = '" .. GameInfo.Civilizations[civilizationTypeID].Type .. "' AND BuildingClassType = '" .. buildingClass .. "'";
	for row in GameInfo.Civilization_BuildingClassOverrides(condition) do
		buildingType = row.BuildingType;
		return buildingType;
	end

	return buildingType;
end

----------------------------------
-- functions that add buildings --
----------------------------------
-- Used as a wrapper for AddPolicyBuildingsToCity
function PolicyBuildings_CityCaptured(oldPlayerID, bCapital, iX, iY, newPlayerID, conquest, conquest2)
	local player = Players[newPlayerID];

	if(not player:IsMinorCiv() and not player:IsBarbarian()) then
		AddPolicyBuildingsToCity(newPlayerID, Map.GetPlot(iX, iY):GetPlotCity():GetID());
	end
end
--GameEvents.CityCaptureComplete.Add(PolicyBuildings_CityCaptured);

-- Used as a wrapper for AddPolicyBuildingsToCity
function PolicyBuildings_CityFounded(playerID, iX, iY)
	local player = Players[playerID];

	if(not player:IsMinorCiv() and not player:IsBarbarian()) then
		AddPolicyBuildingsToCity(playerID, Map.GetPlot(iX, iY):GetPlotCity():GetID());
	end
end
--GameEvents.PlayerCityFounded.Add(PolicyBuildings_CityFounded);

function PolicyBuildings_PolicyAdopted(playerID, policyID)
	for city in Players[playerID]:Cities() do
		AddPolicyBuildingsToCity(playerID, city:GetID());
	end
end
--GameEvents.PlayerAdoptPolicy.Add(PolicyBuildings_PolicyAdopted);
--GameEvents.PlayerAdoptPolicyBranch.Add(PolicyBuildings_PolicyAdopted);

function AddPolicyBuildingsToCity(playerID, cityID)
	local player = Players[playerID];
	local city = player:GetCityByID(cityID);
	local buildingList = {}; -- A list of buildingClass strings to add to the city
	local buildingType;

	-- All XML tables should hook into this event and add building class strings to the buildingList table.
	LuaEvents.GetPolicyBuildings(playerID, cityID, buildingList);

	for k, v in pairs(buildingList) do
		buildingType = GetBuildingTypeFromClass(k, player:GetCivilizationType());
		if(buildingType ~= nil and buildingType ~= "") then
			city:SetNumRealBuilding(GameInfoTypes[buildingType], 1);
		end
	end
end

--------------------------------------
-- functions for removing buildings --
--------------------------------------
function PolicyBuildings_RemoveBlockedBuildings(playerID)
	for city in Players[playerID]:Cities() do
		RemoveBlockedBuildingsFromCity(playerID, city:GetID());
	end
end
--GameEvents.PlayerDoTurn.Add(PolicyBuildings_RemoveBlockedBuildings);

function RemoveBlockedBuildingsFromCity(playerID, cityID)
	local player = Players[playerID];
	local city = player:GetCityByID(cityID);
	local buildingList = {}; -- A list of buildingClass strings to add to the city
	local buildingType;
	local buildingID;

	-- All XML tables should hook into this event and add building class strings to the buildingList table.
	LuaEvents.GetBlockedPolicyBuildings(playerID, cityID, buildingList);

	for k, v in pairs(buildingList) do
		buildingType = GetBuildingTypeFromClass(k, player:GetCivilizationType());
		if(buildingType ~= nil and buildingType ~= "") then
			buildingID = GameInfoTypes[buildingType];

			if(city:IsHasBuilding(buildingID)) then
				-- Remove any specialists from the building
				if(city:GetNumSpecialistsInBuilding(buildingID) > 0) then
					local numSpecialists = city:GetNumSpecialistsInBuilding(buildingID);
					local isNoAutoAssign = city:IsNoAutoAssignSpecialists();

					city:DoTask(TaskTypes.TASK_NO_AUTO_ASSIGN_SPECIALISTS, 0, 0, 1); -- Turn on manual specialist control

					for i = city:GetNumSpecialistsInBuilding(buildingID), 0, -1 do
						city:DoTask(TaskTypes.TASK_REMOVE_SPECIALIST, 1, buildingID, newPlayerID);
					end
					-- Error check
					if(city:GetNumSpecialistsInBuilding(buildingID) > 0) then
						print("WARN -- Failed to remove all specialists from " .. tostring(GameInfoTypes[buildingID]) .. " in " .. tostring(city:GetName()) .. "!  The Citizens data will become malformed when the building is removed!");
					end
					-- Restore AutoAssign Specialist if it was enabled
					if(not isNoAutoAssign) then
						city:DoTask(TaskTypes.TASK_NO_AUTO_ASSIGN_SPECIALISTS, 0, 0, 0); -- Turn off manual specialist control
					end
				end
				-- Remove the building
				city:SetNumRealBuilding(buildingID, 0);
			end
		end
	end
end

--------------
-- Initialization check.  Ensures this code isn't loaded twice
--------------
local retVal = {};
LuaEvents.PoliciesGrantBuildings_IsInitialized(retVal);

-- If retVal isn't changed, no other mod has initialized this code.
if (retVal.isInitialized == nil) then
	LuaEvents.PoliciesGrantBuildings_IsInitialized.Add(function (retVal) retVal.isInitialized = true; end);
	-- Initialize the code
	GameEvents.CityCaptureComplete.Add(PolicyBuildings_CityCaptured);
	GameEvents.PlayerCityFounded.Add(PolicyBuildings_CityFounded);
	GameEvents.PlayerAdoptPolicy.Add(PolicyBuildings_PolicyAdopted);
	GameEvents.PlayerAdoptPolicyBranch.Add(PolicyBuildings_PolicyAdopted);

	GameEvents.PlayerDoTurn.Add(PolicyBuildings_RemoveBlockedBuildings);
end