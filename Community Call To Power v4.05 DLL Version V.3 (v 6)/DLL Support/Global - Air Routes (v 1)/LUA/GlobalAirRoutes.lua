print("This is the 'Global - Air Routes' mod script.")

local iBuildingAirport = GameInfoTypes.BUILDING_AIRPORT

--
-- Determine if two plots(cities) are connected by an air route
--
function OnCityConnections(iPlayer, bDirect)
  -- Only interested in indirect city connection events
  return (not bDirect)
end
GameEvents.CityConnections.Add(OnCityConnections)

function OnCityConnected(iPlayer, iCityX, iCityY, iToCityX, iToCityY, bDirect)
  if (not bDirect) then
    local pCity = Map.GetPlot(iCityX, iCityY):GetPlotCity()
    local pToCity = Map.GetPlot(iToCityX, iToCityY):GetPlotCity()

	return (pCity and pToCity and pCity:GetNumBuilding(iBuildingAirport) > 0 and pToCity:GetNumBuilding(iBuildingAirport) > 0)
  end

  return false
end
GameEvents.CityConnected.Add(OnCityConnected)
