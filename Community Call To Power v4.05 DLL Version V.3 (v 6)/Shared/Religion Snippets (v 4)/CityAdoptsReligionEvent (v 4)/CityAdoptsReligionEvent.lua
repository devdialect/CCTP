-- CityAdoptReligionEvent
-- Author: Machiavelli
-- DateCreated: 8/20/2012 10:02:01 AM
--------------------------------------------------------------
-- Version 4
--
-- Purpose:
-- LuaEvents.CityAdoptsReligionEvent(iOwner, iX, iY, eOldReligion, eNewReligion, bFirstConversion)
-- Will be called whenever any city (human or ai) adopts or changes to a religion.  It is not called
-- when a Pantheon is adopted.  Nor is it called when an Inquisitor cleans a city.
--
-- Known limitations:
-- When an Inquisitor cleans a city the religion building marking that city remains even though
-- the city is no longer that religion.  The religion building won't be removed until this
-- function is called again, and if the city has at least 1 follower of the old religion when
-- that happens (due to natural pressure or a missionary) the CityAdoptsReligionEvent won't fire.
--
-- iOwner: The ID of the player who owns the city
-- iX, iY: The location of the city, use Map.GetPlot(iX, iY) to get the plot object
-- eOldReligion: The ID of the religion the city use to be.  If the city was not previously a
--       founded religion (due to the city having a Pantheon or no Pantheon) eOldReligion will
--       be 0.
-- eNewReligion: The ID of the religion the city is now.  Will always be 1 or greater because
--       the 0 ID is for "Pantheon religions".
-- bFirstConversion: A boolean that will be true if this is the first time the city has become
--       eNewReligion, false otherwise.
--------------------------------------------------------------
function CallCityAdoptsReligionEvent(iOwner, eReligion, iX, iY)
	local plot = Map.GetPlot(iX, iY);
	-- Error check, if this isn't a city don't continue
	if(not plot:IsCity()) then
		return;
	end

	local city = plot:GetPlotCity();
	local eNewReligion = city:GetReligiousMajority();
	local newReligionBuilding = nil;

	-- If a city has no religious majority, eNewReligion will be -1
	if(eNewReligion < 1) then
		-- Case 1) no majority religion
		-- Remove any buildings marking what the old religion the city is (TODO: this check should be happening every turn to avoid having incorrect state for a few turns)
		for row in GameInfo.Religions() do
			local temp = "BUILDING_" .. row.Type;

			if (city:IsHasBuilding(GameInfoTypes[temp])) then
				city:SetNumRealBuilding(GameInfoTypes[temp], 0); -- Remove the building
			end
		end
		-- Do not continue because the city has no majority religion
		return;
	else
		-- Case 2.A) majority religion but city hasn't changed religion
		newReligionBuilding = "BUILDING_" .. GameInfo.Religions[eNewReligion].Type;
		if(city:IsHasBuilding(GameInfoTypes[newReligionBuilding])) then
			-- The city has not changed religion, don't continue
			return;
		end
	end

	-- Only way to get here is if: eNewReligion >= 1 and city does not have newReligionBuilding
	-- Case 2.B) majority religion and city has changed religion
	local eOldReligion = 0;
	-- Find any buildings marking what the old religion the city is
	for row in GameInfo.Religions() do
		local religionMarkingBuilding = "BUILDING_" .. row.Type;
		-- Skip the current local majority religion (eNewReligion) but remove all other religion marking buildings
		if (row.ID ~= eNewReligion and city:IsHasBuilding(GameInfoTypes[religionMarkingBuilding])) then
			city:SetNumRealBuilding(GameInfoTypes[religionMarkingBuilding], 0);

			-- Possible error check.  Just because there is a building marking for the old religion doesn't mean the city has been that religion recently.
			--    For example, if the city was hit by an Inquisitor the building marking old religion wouldn't be removed.
			--    For now, better to have old religion sometimes be the most recent religion than risk adding bugs with extra checks.
			--if(city:GetNumFollowers(row.ID) > 0 or city:GetPopulation() == 1) then
				
			-- Found the old religion of the city
			eOldReligion = row.ID;
			--end
		end
	end

	-- Is this the first time the city has adopted the majorityReligion
	local hasBeenReligionBuilding = "BUILDING_HAS_BEEN_" .. GameInfo.Religions[eNewReligion].Type;
	local bFirstConversion = false;

	if(not city:IsHasBuilding(GameInfoTypes[hasBeenReligionBuilding])) then
		bFirstConversion = true;
	end

	-- Update religion building state
	city:SetNumRealBuilding(GameInfoTypes[newReligionBuilding], 1);
	city:SetNumRealBuilding(GameInfoTypes[hasBeenReligionBuilding], 1);

	-- Call the lua event
	--print("Calling CityAdoptsReligionEvent(iOwner: " .. tostring(iOwner) .. " iX: " .. tostring(iX) .. " iY: " .. tostring(iY) .. " eOldReligion: " .. tostring(eOldReligion) .. " eNewReligion: " .. tostring(eNewReligion) .. " bFirstConversion: " .. tostring(bFirstConversion) .. ")");
	LuaEvents.CityAdoptsReligionEvent(iOwner, iX, iY, eOldReligion, eNewReligion, bFirstConversion);
end

--------------
-- Initialization check.  Ensures this code isn't loaded twice
--------------
local retVal = {};
LuaEvents.CityAdoptsReligionEvent_IsInitialized(retVal);

-- If retVal isn't changed, no other mod has initialized this code.
if (retVal.isInitialized == nil) then
	LuaEvents.CityAdoptsReligionEvent_IsInitialized.Add(function (retVal) retVal.isInitialized = true; end);
	-- Initialize the code
	GameEvents.CityConvertsReligion.Add(CallCityAdoptsReligionEvent);
end