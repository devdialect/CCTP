-- Belief_FounderFreeBuildingClassCapital
-- Author: Machiavelli
-- DateCreated: 3/6/2014 10:49:51 AM
--------------------------------------------------------------
-- Version 4
--
-- Depends on:
-- ReligionFoundedEvent.
--------------------------------------------------------------
function GiveBeliefBuildingCapital(founderID, iX, iY, eOldReligion, eNewReligion)
	local founder = Players[founderID];
	local buildingType;

	for row in GameInfo.Belief_FounderFreeBuildingClassCapital() do
		if(ReligionHasBelief(eNewReligion, GameInfoTypes[row.BeliefType])) then
			buildingType = GetBuildingTypeFromClass(row.BuildingClassType, founder:GetCivilizationType());
			if(buildingType ~= nil and buildingType ~= "") then
				founder:GetCapitalCity():SetNumRealBuilding(GameInfoTypes[buildingType], 1);
			end
		end
	end
end
--LuaEvents.ReligionFoundedEvent.Add(GiveBeliefBuildingCapital);

function GiveBeliefBuildingCapitalMove(oldPlayerID, bCapital, iX, iY, newPlayerID, conquest, conquest2)
	local oldPlayer = Players[oldPlayerID];
	local newPlayer = Players[newPlayerID];
	local city =  Map.GetPlot(iX, iY):GetPlotCity();
	local oldPlayerReligion = oldPlayer:GetReligionCreatedByPlayer();
	local newPlayerReligion = newPlayer:GetReligionCreatedByPlayer();
	local buildingType;
	
	-- If the old player just lost their capital, they may need to have their buildings replaced
	if(bCapital and oldPlayer:IsAlive() and oldPlayerReligion > 0) then
		for row in GameInfo.Belief_FounderFreeBuildingClassCapital() do
			if(ReligionHasBelief(oldPlayerReligion, GameInfoTypes[row.BeliefType])) then
				buildingType = GetBuildingTypeFromClass(row.BuildingClassType, oldPlayer:GetCivilizationType());
				if(buildingType ~= nil and buildingType ~= "") then
					oldPlayer:GetCapitalCity():SetNumRealBuilding(GameInfoTypes[buildingType], 1);
				end
			end
		end
	end
	---------------------------------
	-- If the new player just recovered their capital, they will need to have their buildings moved
	if(newPlayer ~= nil and newPlayer:GetCapitalCity() ~= nil and city ~= nil and city:GetID() ~= nil) then
		if(newPlayer:GetCapitalCity():GetID() == city:GetID() and newPlayerReligion > 0) then
			for row in GameInfo.Belief_FounderFreeBuildingClassCapital() do
				if(ReligionHasBelief(newPlayerReligion, GameInfoTypes[row.BeliefType])) then
					buildingType = GetBuildingTypeFromClass(row.BuildingClassType, newPlayer:GetCivilizationType());
					if(buildingType ~= nil and buildingType ~= "") then
						-- Remove capital only buildings from the new player's cities
						for cityToRemove in newPlayer:Cities() do
							cityToRemove:SetNumRealBuilding(GameInfoTypes[buildingType], 0);
						end
						-- Add back the capital-only buildings
						city:SetNumRealBuilding(GameInfoTypes[buildingType], 1);
					end
				end
			end
		end
	end
end
--GameEvents.CityCaptureComplete.Add(GiveBeliefBuildingCapitalMove);

--------------------
-- Private helper functions
--------------------
function ReligionHasBelief(eReligion, eBelief)
	local hasBelief = false;

	for i,v in ipairs(Game.GetBeliefsInReligion(eReligion)) do
		local belief = GameInfo.Beliefs[v];

		if (belief ~= nil and belief.ID == eBelief) then
			hasBelief = true;
			return hasBelief;
		end
	end

	return hasBelief;
end

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

--------------
-- Initialization check.  Ensures this code isn't loaded twice
--------------
local retVal = {};
LuaEvents.Belief_FounderFreeBuildingClassCapital_IsInitialized(retVal);

-- If retVal isn't changed, no other mod has initialized this code.
if (retVal.isInitialized == nil) then
	LuaEvents.Belief_FounderFreeBuildingClassCapital_IsInitialized.Add(function (retVal) retVal.isInitialized = true; end);
	-- Initialize the code
	LuaEvents.ReligionFoundedEvent.Add(GiveBeliefBuildingCapital);
	GameEvents.CityCaptureComplete.Add(GiveBeliefBuildingCapitalMove);
end