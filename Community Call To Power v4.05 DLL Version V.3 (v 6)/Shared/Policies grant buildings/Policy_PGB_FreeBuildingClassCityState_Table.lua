-- Policy_PGB_FreeBuildingClass table
-- Author: Machiavelli
-- DateCreated: 6/27/2014 8:09:35 PM
--------------------------------------------------------------
-- Version 8
--
-- Purpose:
-- Implements the Policy_PGB_FreeBuildingClassCityStates.  Buildings will
-- be given to captured city-states.
--------------------------------------------------------------
function FreeBuildingClassCityState_Table(playerID, cityID, buildingList)
	local player = Players[playerID];
	local city = player:GetCityByID(cityID);
	local policyID;
	local building;
	
	if(Players[city:GetOriginalOwner()]:IsMinorCiv()) then
		for row in GameInfo.Policy_PGB_FreeBuildingClassCityStates() do
			policyID = GameInfoTypes[row.PolicyType];
		
			if(player:HasPolicy(policyID) and not player:IsPolicyBlocked(policyID)) then
				building = row.BuildingClassType;
				buildingList[building] = true;
			end
		end
	end
end
--LuaEvents.GetPolicyBuildings.Add(FreeBuildingClassCityState_Table);

function FreeBuildingClassCityState_Table_Blocked(playerID, cityID, buildingList)
	local player = Players[playerID];
	local city = player:GetCityByID(cityID);
	local policyID;
	local building;
	
	if(Players[city:GetOriginalOwner()]:IsMinorCiv()) then
		for row in GameInfo.Policy_PGB_FreeBuildingClassCityStates() do
			policyID = GameInfoTypes[row.PolicyType];
		
			if(player:HasPolicy(policyID) and player:IsPolicyBlocked(policyID)) then
				building = row.BuildingClassType;
				buildingList[building] = true;
			end
		end
	end
end
--LuaEvents.GetBlockedPolicyBuildings.Add(FreeBuildingClassCityState_Table_Blocked);

--------------
-- Initialization check.  Ensures this code isn't loaded twice
--------------
local retVal = {};
LuaEvents.Policy_PGB_FreeBuildingClassCityState_Table_IsInitialized(retVal);

-- If retVal isn't changed, no other mod has initialized this code.
if (retVal.isInitialized == nil) then
	LuaEvents.Policy_PGB_FreeBuildingClassCityState_Table_IsInitialized.Add(function (retVal) retVal.isInitialized = true; end);
	-- Initialize the code
	LuaEvents.GetPolicyBuildings.Add(FreeBuildingClassCityState_Table);
	LuaEvents.GetBlockedPolicyBuildings.Add(FreeBuildingClassCityState_Table_Blocked);
end