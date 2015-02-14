print("This is the 'Improvement - Airbases' mod script.")

local iImprovementAirbase = GameInfoTypes.IMPROVEMENT_AIRBASE
local iLateTech = GameInfoTypes.TECH_RADAR
local iMaxAircraftPerAirbaseEarly = 3
local iMaxAircraftPerAirbaseLate  = 5

--
-- CanLoadAt() is only called for plots that are neither a city nor have a cargo carrying unit in them
-- It should be used to ascertain if the plot can hold aircraft anyway (usually in an improvement)
--
function OnCanLoadAt(iPlayer, iUnit, iPlotX, iPlotY)
  local pPlot = Map.GetPlot(iPlotX, iPlotY)
  local pUnit = Players[iPlayer]:GetUnitByID(iUnit)
  local unit = GameInfo.Units[pUnit:GetUnitType()]

  if (pPlot:GetImprovementType() == iImprovementAirbase) then
    print(string.format("Airbase found at (%i, %i)", iPlotX, iPlotY))
	return not pPlot:IsImprovementPillaged()
  end
  
  return false
end
GameEvents.CanLoadAt.Add(OnCanLoadAt)

--
-- CanRebaseTo() is only called for non-city plots without a unit that can take cargo
-- It should be used to ascertain if the plot can take our aircraft anyway
--
-- The city equivalent is CanRebaseInCity()
--
function OnCanRebaseTo(iPlayer, iUnit, iPlotX, iPlotY)
  local pPlot = Map.GetPlot(iPlotX, iPlotY)
  local pPlayer = Players[iPlayer]
  local pUnit = pPlayer:GetUnitByID(iUnit)

  if (pPlot:GetImprovementType() == iImprovementAirbase and not pPlot:IsImprovementPillaged() and CanLandAt(pPlot, pUnit)) then
    print(string.format("Found a viable airbase at (%i, %i) - checking aircraft limit", iPlotX, iPlotY))
	local iMaxAircraftPerAirbase = (Teams[pPlayer:GetTeam()]:IsHasTech(iLateTech)) and iMaxAircraftPerAirbaseLat or iMaxAircraftPerAirbaseEarly

    return (CountAircraft(pPlot, pUnit) < iMaxAircraftPerAirbase)
  end

  return false
end
GameEvents.CanRebaseTo.Add(OnCanRebaseTo)

--
-- RebaseTo() is called after one of our aircraft is rebased
--
function OnRebaseTo(iPlayer, iUnit, iPlotX, iPlotY)
  local pCity = Map.GetPlot(iPlotX, iPlotY):GetPlotCity()
  local pUnit = Players[iPlayer]:GetUnitByID(iUnit)
  print(string.format("%s rebased to %s (%i, %i)", pUnit:GetName(), (pCity and pCity:GetName() or ""), iPlotX, iPlotY))
end
-- GameEvents.RebaseTo.Add(OnRebaseTo)


function CanLandAt(pPlot, pUnit)
  local iPlayer = pUnit:GetOwner()

  -- Check the units on the tile (if any) 
  for i = 0, pPlot:GetNumUnits()-1, 1 do
    local pPlotUnit = pPlot:GetUnit(i)
	
	if (pPlotUnit:GetOwner() == iPlayer) then
	  return true -- Any of our own is good
	else
	  return false -- Any not ours is bad
	end
  end
  
  -- No units, so check ownership of the tile
  local iOwner = pPlot:GetOwner()
  if (iOwner == iPlayer or iOwner == -1 or Players[iPlayer]:GetTeam() == Players[iOwner]:GetTeam()) then
    return true
  end
  
  local pOwner = Players[iOwner]
  if (pOwner:IsMinor() and pOwner:GetAlly() == iPlayer) then
    -- No suicide units (missiles, nukes etc) in city states
    return (not unit.Suicide and unit.NukeDamageLevel == -1)
  end

  return false
end

function CountAircraft(pPlot, pUnit)
  local iAircraft = 0
  local iPlayer = pUnit:GetOwner()
  
  for i = 0, pPlot:GetNumUnits()-1, 1 do
    local pPlotUnit = pPlot:GetUnit(i)
	
	if (pPlotUnit:GetOwner() == iPlayer and pPlotUnit:GetDomainType() == DomainTypes.DOMAIN_AIR) then
	  iAircraft = iAircraft + 1
	end
  end
  
  return iAircraft
end
