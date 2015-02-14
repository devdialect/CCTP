print("This is the 'Improvement - Pontoon Bridge' mod script.")

local iBuildPontoonBridge = GameInfoTypes.BUILD_PONTOON_BRIDGE
local iImprovementPontoonBridge = GameInfoTypes.IMPROVEMENT_PONTOON_BRIDGE

directions = {DirectionTypes.DIRECTION_NORTHEAST, DirectionTypes.DIRECTION_EAST, DirectionTypes.DIRECTION_SOUTHEAST,
              DirectionTypes.DIRECTION_SOUTHWEST, DirectionTypes.DIRECTION_WEST, DirectionTypes.DIRECTION_NORTHWEST}

GameEvents.PlayerCanBuild.Add(function(iPlayer, iUnit, iPlotX, iPlotY, iBuild) 
  if (iBuild == iBuildPontoonBridge) then
    if (Players[iPlayer]:IsMinorCiv()) then
	  return false;
    elseif (not Players[iPlayer]:IsHuman()) then
	  local pLandPlots, pWaterPlots = getAdjacentPlots(iPlotX, iPlotY)

      -- Save the AI from themselves!	  
	  if (#pLandPlots == 6) then
	    -- Not in one hex lakes!
	    return false
	  else
        -- Never in a hex with 4 contiuous land tiles
	    if (#pWaterPlots == 2 and Map.PlotDistance(pWaterPlots[1]:GetX(), pWaterPlots[1]:GetY(), pWaterPlots[2]:GetX(), pWaterPlots[2]:GetY()) == 1) then
		  return false
	    end

	    -- Never adjacent to another pontoon
	    for _,pPlot in ipairs(pWaterPlots) do
		  if (pPlot:GetImprovementType() == iImprovementPontoonBridge) then
		    return false
		  end
		end
	  end
	end
  end

  return true
end)

GameEvents.PlotCanImprove.Add(function(iPlotX, iPlotY, iImprovement) 
  if (iImprovement == iImprovementPontoonBridge) then
	local pLandPlots = getAdjacentPlots(iPlotX, iPlotY)

	if (#pLandPlots <= 1) then
	  return false
	elseif (#pLandPlots == 2) then
	  -- We don't want the two plots to be adjacent themselves, ie Land-Land is bad, but Land-Sea-Land is good
	  return (Map.PlotDistance(pLandPlots[1]:GetX(), pLandPlots[1]:GetY(), pLandPlots[2]:GetX(), pLandPlots[2]:GetY()) > 1)
	elseif (#pLandPlots == 3) then
	  -- We don't want all three plots to be adjacent to each other, ie Land-Land-Land is bad but Land-Sea-Land-Land is good
	  return (Map.PlotDistance(pLandPlots[1]:GetX(), pLandPlots[1]:GetY(), pLandPlots[2]:GetX(), pLandPlots[2]:GetY()) + Map.PlotDistance(pLandPlots[2]:GetX(), pLandPlots[2]:GetY(), pLandPlots[3]:GetX(), pLandPlots[3]:GetY()) + Map.PlotDistance(pLandPlots[1]:GetX(), pLandPlots[1]:GetY(), pLandPlots[3]:GetX(), pLandPlots[3]:GetY()) > 4)
	else
	  return true
	end
  end

  return true
end)

function getAdjacentPlots(iPlotX, iPlotY)
  local pCentrePlot = Map.GetPlot(iPlotX, iPlotY)
  local pLandPlots = {}
  local pWaterPlots = {}

  for loop, direction in ipairs(directions) do
    local pPlot = Map.PlotDirection(pCentrePlot:GetX(), pCentrePlot:GetY(), direction)

    if (pPlot ~= nil and not(pPlot:IsMountain() or pPlot:IsImpassable())) then
	  if (pPlot:IsWater()) then
        table.insert(pWaterPlots, pPlot)
	  else
        table.insert(pLandPlots, pPlot)
	  end
    end
  end

  return pLandPlots, pWaterPlots
end
