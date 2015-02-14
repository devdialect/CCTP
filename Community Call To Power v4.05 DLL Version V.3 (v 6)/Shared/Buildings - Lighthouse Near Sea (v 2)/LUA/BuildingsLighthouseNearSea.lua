print("This is the 'Buildings - Lighthouse Near Sea' mod script.")

local iLighthouse = GameInfoTypes.BUILDING_LIGHTHOUSE

directions = {DirectionTypes.DIRECTION_NORTHEAST, DirectionTypes.DIRECTION_EAST, DirectionTypes.DIRECTION_SOUTHEAST,
              DirectionTypes.DIRECTION_SOUTHWEST, DirectionTypes.DIRECTION_WEST, DirectionTypes.DIRECTION_NORTHWEST}

GameEvents.CityCanConstruct.Add(function(iPlayer, iCity, iBuilding) 
  if (iBuilding == iLighthouse) then
    local pCityPlot = Players[iPlayer]:GetCityByID(iCity):Plot()

    if (isCoastLine(pCityPlot)) then
      -- If the city is on a coastal tile, it can build a lighthouse
      return true
    else
      -- Or, if the city is adjacent to a coastal tile which itself is adjacent to a workable water, the city can build a lighthouse
      for loop, direction in ipairs(directions) do
        local pPlot = Map.PlotDirection(pCityPlot:GetX(), pCityPlot:GetY(), direction)

        if (pPlot ~= nil and iPlayer == pPlot:GetOwner()) then
          if (isCoastLine(pPlot)) then
            return true
          end
        end
      end
    end

	  return false
  end

  return true
end)

function isCoastLine(pLandPlot)
  -- DON'T use IsCoastalLand here, as that includes lakes!
  if (pLandPlot ~= nil) then
    local iOwner = pLandPlot:GetOwner()

    for loop, direction in ipairs(directions) do
      local pPlot = Map.PlotDirection(pLandPlot:GetX(), pLandPlot:GetY(), direction)

      -- Is the adjacent plot owned by the same player as the land plot
      if (pPlot ~= nil and iOwner == pPlot:GetOwner()) then
        -- Is this an ocean coast (ie non-lake water) plot
        if (pPlot:IsWater() and not pPlot:IsLake()) then
          return true
        end
      end
    end
  end

  return false
end
