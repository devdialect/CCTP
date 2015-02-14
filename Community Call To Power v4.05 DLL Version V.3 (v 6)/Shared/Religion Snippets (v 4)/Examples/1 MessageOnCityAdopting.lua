-- Message on city adopting a religion
-- Author: Machiavelli
-- DateCreated: 6/2/2014 8:36:06 PM
--------------------------------------------------------------
-- Prints a message to fire turner when a city adopts a religion
function MessageOnCityAdopting(iOwner, iX, iY, eOldReligion, eNewReligion, bFirstConversion)
	local plot = Map.GetPlot(iX, iY);
	local city = plot:GetPlotCity();

	print(city.GetName() .. " has adopted a religion.");
end
LuaEvents.CityAdoptsReligionEvent.Add(MessageOnCityAdopting);