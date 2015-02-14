-- Policy_PGB_FreeBuildingClass table
-- Author: Machiavelli
-- DateCreated: 6/27/2014 8:09:35 PM
--------------------------------------------------------------
-- Version 8
--
-- Purpose:
-- Implements the Policy_PGB_FreeBuildingClass.  Buildings will
-- be given to every city the player owns.
--------------------------------------------------------------
function FreeBuildingClass_Table(playerID, cityID, buildingList)
	local player = Players[playerID];
	local policyID;
	local building;
	
	for row in GameInfo.Policy_PGB_FreeBuildingClass() do
		policyID = GameInfoTypes[row.PolicyType];
		
		if(player:HasPolicy(policyID) and not player:IsPolicyBlocked(policyID)) then
			building = row.BuildingClassType;
			buildingList[building] = true;
		end
	end
end
--LuaEvents.GetPolicyBuildings.Add(FreeBuildingClass_Table);

function FreeBuildingClass_Table_Blocked(playerID, cityID, buildingList)
	local player = Players[playerID];
	local policyID;
	local building;
	
	for row in GameInfo.Policy_PGB_FreeBuildingClass() do
		policyID = GameInfoTypes[row.PolicyType];
		
		if(player:HasPolicy(policyID) and player:IsPolicyBlocked(policyID)) then
			building = row.BuildingClassType;
			buildingList[building] = true;
		end
	end
end
--LuaEvents.GetBlockedPolicyBuildings.Add(FreeBuildingClass_Table_Blocked);

--------------
-- Initialization check.  Ensures this code isn't loaded twice
--------------
local retVal = {};
LuaEvents.Policy_PGB_FreeBuildingClass_Table_IsInitialized(retVal);

-- If retVal isn't changed, no other mod has initialized this code.
if (retVal.isInitialized == nil) then
	LuaEvents.Policy_PGB_FreeBuildingClass_Table_IsInitialized.Add(function (retVal) retVal.isInitialized = true; end);
	-- Initialize the code
	LuaEvents.GetPolicyBuildings.Add(FreeBuildingClass_Table);
	LuaEvents.GetBlockedPolicyBuildings.Add(FreeBuildingClass_Table_Blocked);
end