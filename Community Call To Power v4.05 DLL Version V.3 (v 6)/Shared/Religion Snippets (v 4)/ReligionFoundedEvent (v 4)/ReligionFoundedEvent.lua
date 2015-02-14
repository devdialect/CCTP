-- Religion founded event
-- Author: Machiavelli
-- DateCreated: 3/6/2014 10:37:12 AM
--------------------------------------------------------------
-- Version 4
--
-- Depends on:
-- LuaEvents.CityAdoptsReligionEvent
--
-- iOwner: The ID of the player who owns the city
-- iX, iY: The location of the city, use Map.GetPlot(iX, iY) to get the plot object
-- eOldReligion: The ID of the religion the city use to be.  If the city was not previously a
--       founded religion (due to the city having a Pantheon or no Pantheon) eOldReligion will
--       be 0.
-- eNewReligion: The ID of the religion the city is now.  Will always be 1 or greater because
--       the 0 ID is for "Pantheon religions".
--------------------------------------------------------------
function CallReligionFoundedEvent(iOwner, iX, iY, eOldReligion, eNewReligion, bFirstConversion)
	local plot = Map.GetPlot(iX, iY);
	local city = plot:GetPlotCity();
	
	if(city:IsHolyCityForReligion(eNewReligion) and bFirstConversion) then
		LuaEvents.ReligionFoundedEvent(iOwner, iX, iY, eOldReligion, eNewReligion);
	end
end

--------------
-- Initialization check.  Ensures this code isn't loaded twice
--------------
local retVal = {};
LuaEvents.ReligionFoundedEvent_IsInitialized(retVal);

-- If retVal isn't changed, no other mod has initialized this code.
if (retVal.isInitialized == nil) then
	LuaEvents.ReligionFoundedEvent_IsInitialized.Add(function (retVal) retVal.isInitialized = true; end);
	-- Initialize the code
	LuaEvents.CityAdoptsReligionEvent.Add(CallReligionFoundedEvent);
end