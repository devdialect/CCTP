print("This is the 'Trait - River Connection' mod script.")

include("RiverConnections")

local gRiverManager = nil
local gNeedRescan = false

local gCurrentPlayer = nil

--
-- Catch terraforming events (after the map has been loaded) as these can change the river system
--
-- As there can be many sequential terraforming events when a river is added, rather then rescanning on every one,
-- just invalidate the river manager and then rescan when the next needing to check the river system
--
GameEvents.TerraformingMap.Add(function(iEvent, iLoad)
  GameEvents.TerraformingPlot.Add(OnTerraformingPlot)
end)

function OnTerraformingPlot(iEvent, iPlotX, iPlotY, iInfo, iNewValue, iOldValue, iNewExtra, iOldExtra)
  if (not gNeedRescan) then
    if (iEvent == TerraformingEventTypes.TERRAFORMINGEVENT_TERRAIN and (iNewValue == TerrainTypes.TERRAIN_COAST or iOldValue == TerrainTypes.TERRAIN_COAST)) then
      -- If a plot terrain has changed to/from coast (lake), invalidate the river manager
      gNeedRescan = true
    elseif (iEvent == TerraformingEventTypes.TERRAFORMINGEVENT_RIVER) then
      -- If a river segment changes, invalidate the river manager
      gNeedRescan = true
    end
  end
end


--
-- Lazily get the river manager, allowing for map rescans
--
function getRiverManager(iPlayer)
  if (gRiverManager == nil) then
    gRiverManager = RiverManager:new(function(pPlot) return isPlotPassablePlayer(pPlot, gCurrentPlayer) end)
    gNeedRescan = false
  end

  if (gNeedRescan) then
    gRiverManager:rescanMap()
    gNeedRescan = false
  end

  -- remember the current player for the isPlotPassablePlayer method
  gCurrentPlayer = Players[iPlayer]

  return gRiverManager
end


--
-- Does this civ have the river expansion trait
--
local hasRiverExpansionTrait = {}
function isRiverExpansion(iPlayer)
  if (hasRiverExpansionTrait[iPlayer] == nil) then
    hasRiverExpansionTrait[iPlayer] = false
	
    for _ in DB.Query("SELECT 1 FROM Leader_Traits WHERE LeaderType=? AND TraitType='TRAIT_RIVER_EXPANSION'", GameInfo.Leaders[Players[iPlayer]:GetLeaderType()].Type) do
      hasRiverExpansionTrait[iPlayer] = true
    end
  end

  return hasRiverExpansionTrait[iPlayer]
end


--
-- Determine if two plots(cities) are connected by a known river
--
-- Note: If we don't care if the river route is known to iPlayer, we can speed this up considerably
--       by checking the intersection of getRivers(iCityX, iCityY) and getRivers(iToCityX, iToCityY)
--
function OnCityConnections(iPlayer, bDirect)
  -- print(string.format("OnCityConnections: %i %s", iPlayer, (bDirect and "direct" or "indirect")))

  -- Only interested in indirect city connection events for the civ with the river expansion trait
  return ((not bDirect) and isRiverExpansion(iPlayer))
end
GameEvents.CityConnections.Add(OnCityConnections)

function OnCityConnected(iPlayer, iCityX, iCityY, iToCityX, iToCityY, bDirect)
  -- print(string.format("OnCityConnected: %i %s %s to %s", iPlayer, (bDirect and "direct" or "indirect"), Map.GetPlot(iCityX, iCityY):GetPlotCity():GetName(), Map.GetPlot(iToCityX, iToCityY):GetPlotCity():GetName()))

  -- No need to test that the plots contain cities or that both cities belong to iPlayer as the DLL guarantees this
  if ((not bDirect) and isRiverExpansion(iPlayer)) then -- another mod could be listening for these events
    -- Is there a known and passable river bank route between the cities?
    return (#(getRiverManager(iPlayer):getRiverBankRoute(iCityX, iCityY, iToCityX, iToCityY)) > 0)
    -- local x = os.clock()
    -- local bRet = (#(getRiverManager(iPlayer):getRiverBankRoute(iCityX, iCityY, iToCityX, iToCityY)) > 0)
    -- print(string.format("  elapsed time: %.4f", (os.clock() - x)))
    -- return bRet
  end

  return false
end
GameEvents.CityConnected.Add(OnCityConnected)
