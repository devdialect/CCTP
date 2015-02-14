-- Policy_PGB_FreeBuildingClass table
-- Author: Machiavelli
-- DateCreated: 6/27/2014 8:09:35 PM
--------------------------------------------------------------
-- Version 8
--
-- Purpose:
-- Implements the Policy_PGB_FreeBuildingClassCapital.  Buildings will
-- be given only to the capital.  If the capital moves due to conquest
-- the buildings automatically move.
--------------------------------------------------------------
function FreeBuildingClassCapital_Table(playerID, cityID, buildingList)
	local player = Players[playerID];
	local city = player:GetCityByID(cityID);
	local policyID;
	local building;
	
	if(city:IsCapital()) then
		for row in GameInfo.Policy_PGB_FreeBuildingClassCapital() do
			policyID = GameInfoTypes[row.PolicyType];
		
			if(player:HasPolicy(policyID) and not player:IsPolicyBlocked(policyID)) then
				building = row.BuildingClassType;
				buildingList[building] = true;
			end
		end
	end
end
--LuaEvents.GetPolicyBuildings.Add(FreeBuildingClassCapital_Table);

function FreeBuildingClassCapital_Table_Blocked(playerID, cityID, buildingList)
	local player = Players[playerID];
	local city = player:GetCityByID(cityID);
	local policyID;
	local building;
	
	if(city:IsCapital()) then
		for row in GameInfo.Policy_PGB_FreeBuildingClassCapital() do
			policyID = GameInfoTypes[row.PolicyType];
		
			if(player:HasPolicy(policyID) and player:IsPolicyBlocked(policyID)) then
				building = row.BuildingClassType;
				buildingList[building] = true;
			end
		end
	end
end
--LuaEvents.GetBlockedPolicyBuildings.Add(FreeBuildingClassCapital_Table_Blocked);

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

function GiveCapitalBuildingsOnCapitalMove(oldPlayerID, bCapital, iX, iY, newPlayerID, conquest, conquest2)
	local oldPlayer = Players[oldPlayerID];
	local newPlayer = Players[newPlayerID];
	local city =  Map.GetPlot(iX, iY):GetPlotCity();
	local capitalOnlyBuildings = {};
	local building;
	local buildingID;
	
	-- If the old player just lost their capital, they may need to have their buildings replaced
	if(bCapital and oldPlayer:IsAlive()) then
		for row in GameInfo.Policy_PGB_FreeBuildingClassCapital() do
			if (oldPlayer:HasPolicy(GameInfoTypes[row.PolicyType]) and not oldPlayer:IsPolicyBlocked(GameInfoTypes[row.PolicyType])) then
				building = GetBuildingTypeFromClass(row.BuildingClassType, oldPlayer:GetCivilizationType());
				if(building ~= nil and building ~= "") then
					oldPlayer:GetCapitalCity():SetNumRealBuilding(GameInfoTypes[building], 1);
				end
			end
		end
	end
	---------------------------------
	-- If the new player just recovered their capital, they will need to have their buildings moved
	if(newPlayer:GetCapitalCity():GetID() == city:GetID()) then
		-- Build a list of all capital only buildings they could have
		for row in GameInfo.Policy_PGB_FreeBuildingClassCapital() do
			if(newPlayer:HasPolicy(GameInfoTypes[row.PolicyType]) and not newPlayer:IsPolicyBlocked(GameInfoTypes[row.PolicyType])) then
				capitalOnlyBuildings[row.BuildingClassType] = true;
			end
		end

		-- Remove all the capital only buildings from non-capital cities
		for cityToRemove in newPlayer:Cities() do
			if(cityToRemove:GetID() ~= city:GetID()) then
				-- Remove the buildings in the list
				for k,v in pairs(capitalOnlyBuildings) do
					building = GetBuildingTypeFromClass(k, newPlayer:GetCivilizationType());
					if(building ~= nil and building ~= "") then
						buildingID = GameInfoTypes[building];

						-- If the city has the building, remove it
						if(cityToRemove:IsHasBuilding(buildingID)) then
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
							cityToRemove:SetNumRealBuilding(buildingID, 0);
						end
					end
				end
			end
		end

		-- Add the capital only buildings to the player's new capital
		for k,v in pairs(capitalOnlyBuildings) do
			building = GetBuildingTypeFromClass(k, newPlayer:GetCivilizationType());
			if(building ~= nil and building ~= "") then
				city:SetNumRealBuilding(GameInfoTypes[building], 1);
			end
		end
	end
end
--GameEvents.CityCaptureComplete.Add(GiveCapitalBuildingsOnCapitalMove);

--------------
-- Initialization check.  Ensures this code isn't loaded twice
--------------
local retVal = {};
LuaEvents.Policy_PGB_FreeBuildingClassCapital_Table_IsInitialized(retVal);

-- If retVal isn't changed, no other mod has initialized this code.
if (retVal.isInitialized == nil) then
	LuaEvents.Policy_PGB_FreeBuildingClassCapital_Table_IsInitialized.Add(function (retVal) retVal.isInitialized = true; end);
	-- Initialize the code
	LuaEvents.GetPolicyBuildings.Add(FreeBuildingClassCapital_Table);
	LuaEvents.GetBlockedPolicyBuildings.Add(FreeBuildingClassCapital_Table_Blocked);
	GameEvents.CityCaptureComplete.Add(GiveCapitalBuildingsOnCapitalMove);
end