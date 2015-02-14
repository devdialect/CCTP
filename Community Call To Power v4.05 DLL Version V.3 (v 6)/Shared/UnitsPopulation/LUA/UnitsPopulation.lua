print("This is the 'Units - Population version 7 by Whoward69' mod script.")

-- Copied from UnitsProspectors.lua
function isFriendlyCity(pUnit, pCity)
  local bFriendly = (pCity:GetTeam() == pUnit:GetTeam())
  bFriendly = (bFriendly and not pCity:IsPuppet())
  bFriendly = (bFriendly and not pCity:IsResistance())
  bFriendly = (bFriendly and not pCity:IsRazing())
  bFriendly = (bFriendly and not (pCity:IsOccupied() and not pCity:IsNoOccupiedUnhappiness()))
  return bFriendly
end

function isGenerateRefugees(pCity)
  return (pCity:IsRazing() and (Game.Rand(math.ceil(pCity:GetPopulation()/2)+1, "Population - Generate Refugees") < 1))
end


function onGarrison(iPlayer, iUnitID) 
  local pPlayer = Players[iPlayer];
  local pUnit = pPlayer:GetUnitByID(iUnitID);

  if (pUnit == nil or pUnit:IsDelayedDeath()) then
    return
  end

  -- Refugees that have reached a city?
  if (pUnit:GetUnitType() == GameInfoTypes["UNIT_POPULATION"]) then
    local pCity = pUnit:GetPlot():GetPlotCity()
    if (isFriendlyCity(pUnit, pCity)) then
	    pCity:ChangePopulation(1, true)
	    pUnit:Kill(true)
    end
  end
end

function onUnitSetXY(iPlayer, iUnit, iX, iY)
  local pPlayer = Players[iPlayer]
  local pUnit = pPlayer:GetUnitByID(iUnit)

  if (pUnit == nil or pUnit:IsDelayedDeath()) then
    return
  end

  -- Refugees that have reached their final destination which is a city?
  if (pUnit:GetUnitType() == GameInfoTypes["UNIT_POPULATION"]) then
    local pMissionPlot = pUnit:LastMissionPlot()

    if (pUnit:GetX() == pMissionPlot:GetX() and pUnit:GetY() == pMissionPlot:GetY()) then
      if (pUnit:GetPlot():IsCity()) then
        local pCity = pUnit:GetPlot():GetPlotCity()

        if (isFriendlyCity(pUnit, pCity)) then
	        pCity:ChangePopulation(1, true)
	        pUnit:Kill(true)
        end
      end
    end
  end
end
GameEvents.UnitSetXY.Add(onUnitSetXY)

function onSetPopulation(iX, iY, iOldPopulation, iNewPopulation) 
  local pPlot = Map.GetPlot(iX, iY);
  local pCity = pPlot:GetPlotCity();

  if (isGenerateRefugees(pCity)) then
    local pPlayer = Players[pCity:GetOwner()]

    if (pPlayer:IsMinorCiv()) then
      -- Just increase the pop in the City State directly
      print("Population: Increasing the CS capital population")
      pPlayer:GetCapitalCity():ChangePopulation(1, true)
    else
      local iPopulationType
      if (pPlayer:IsHuman()) then
        -- Give human players population (75%) or a worker (25%)
        if (Game.Rand(4, "Population - Human Population or Worker") < 3) then
          print("Population: Giving a human player a UNIT_POPULATION")
          iPopulationType = GameInfoTypes["UNIT_POPULATION"]
        else
          print("Population: Giving a human player a UNIT_WORKER")
          iPopulationType = GameInfoTypes["UNIT_WORKER"]
        end
      else
        -- Give AI players a settler (33%) or a worker (66%), as it knows how to deal with those
        if (Game.Rand(3, "Population - AI Settler or Worker") < 1) then
          print("Population: Giving an AI player a UNIT_SETTLER")
          iPopulationType = GameInfoTypes["UNIT_SETTLER"]
        else
          print("Population: Giving an AI player a UNIT_WORKER")
          iPopulationType = GameInfoTypes["UNIT_WORKER"]
        end
      end

      local pUnit = pPlayer:InitUnit(iPopulationType, iX, iY)
      pUnit:JumpToNearestValidPlot()

      if (pPlayer:IsHuman()) then
        local sTitle = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_SUMMARY_POPULATION_CITY", pUnit:GetName(), pCity:GetName())
        local sText = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_POPULATION_CITY", pUnit:GetName(), pCity:GetName())
        pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, sText, sTitle, pUnit:GetX(), pUnit:GetY())
      end
    end
  end
end
GameEvents.SetPopulation.Add(onSetPopulation) 
