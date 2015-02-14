-- Building_EmpireResources
-- Author: Machiavelli
-- DateCreated: 6/13/2014 7:30:09 PM
--------------------------------------------------------------
-- Version 3
--
-- Purpose:
-- These functions enforce the empire resources restriction for the buildings.
--------------------------------------------------------------
function Building_EmpireReourceAnds_Check(playerID, buildingID)
	local player = Players[playerID];

	local condition = "BuildingType = '" .. GameInfo.Buildings[buildingID].Type .. "'";
	for row in GameInfo.Building_EmpireResourceAnds(condition) do
		if(player:GetNumResourceAvailable(GameInfoTypes[row.ResourceType], row.AllowsImport) <= 0) then
			return false; -- Found a required resource the player doesn't have
		end
	end

	return true;
end
--GameEvents.PlayerCanConstruct.Add(Building_EmpireReourceAnds_Check);

function Building_EmpireReourceOrs_Check(playerID, buildingID)
	local player = Players[playerID];
	local buildingNotInTable = true;
	
	local condition = "BuildingType = '" .. GameInfo.Buildings[buildingID].Type .. "'";
	for row in GameInfo.Building_EmpireResourceOrs(condition) do
		buildingNotInTable = false; -- This building will require a resource to build
			
		if(player:GetNumResourceAvailable(GameInfoTypes[row.ResourceType], row.AllowsImport) > 0) then
			return true; -- Found a required resource the player has
		end
	end

	return buildingNotInTable;
end
--GameEvents.PlayerCanConstruct.Add(Building_EmpireReourceOrs_Check);

--------------
-- Initialization check.  Ensures this code isn't loaded twice
--------------
local retVal = {};
LuaEvents.Building_EmpireResources_IsInitialized(retVal);

-- If retVal isn't changed, no other mod has initialized this code.
if (retVal.isInitialized == nil) then
	LuaEvents.Building_EmpireResources_IsInitialized.Add(function (retVal) retVal.isInitialized = true; end);
	-- Initialize the code
	GameEvents.PlayerCanConstruct.Add(Building_EmpireReourceAnds_Check);
	GameEvents.PlayerCanConstruct.Add(Building_EmpireReourceOrs_Check);
end