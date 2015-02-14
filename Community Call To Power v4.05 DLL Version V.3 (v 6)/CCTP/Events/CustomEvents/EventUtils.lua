if(Game.GetCustomOption("GAMEOPTION_CCTP_EVENTS") == 0) then
	return;
end
-- EventUtils
-- Author: Gyogen
-- DateCreated: 10/7/2014 11:23:07 AM
--------------------------------------------------------------
include( "EventOptions.lua" );



--------------------------------------------------------------
function IsValidTile(plot, pResource)
	if (plot:GetResourceType() ~= NO_RESOURCE) then return false end

	local type = plot:GetPlotType();
	if type == PlotTypes.PLOT_HILLS and not pResource.hills then 
		return false;
	end
	if type == PlotTypes.PLOT_LAND and not pResource.flatLands then 
		return false;
	end

	local terrainID = plot:GetTerrainType();
	local featureID = plot:GetFeatureType();
	if not MatchValidTerrainsAndFeatures(pResource, terrainID, featureID) then return false end

	return true;
end

--------------------------------------------------------------
function IsValidFlood(plot)
	
	local plotType = plot:GetPlotType();
	local featureType = plot:GetFeatureType();

	if ( plotType == PlotTypes.PLOT_MOUNTAIN ) then
		return false;
	elseif plotType == PlotTypes.PLOT_HILLS then
		return false;
	elseif ( plotType == PlotTypes.PLOT_OCEAN ) then
		return false;
	end

    if ( plot:IsCity() ) then
		return false;
	end

	if ( featureType == FeatureTypes.FEATURE_MARSH ) then
		return false;
	end

	if (featureType > 5 ) then
		return false; 
	end

	if plot:IsAdjacentToShallowWater() then
		return true;
	end

	return false;
end
--------------------------------------------------------------
function GetRandomCity(cCity)
	local apCities = {}
	local iChance = 0;
	for iPlayerLoop = 0, GameDefines.MAX_CIV_PLAYERS-1, 1 do
		local player = Players[iPlayerLoop]
		if (player:IsAlive()) then
			for city in player:Cities() do
				apCities[iChance] = city;
				iChance = iChance + 1;
			end
		end
	end
		
	if (iChance > 0) then
		local iRandChoice = Game.Rand(iChance, "Choosing random city");
		targetCity = apCities[iRandChoice];
	end
	return targetCity
end
--------------------------------------------------------------
function GetRandomPlayerCity(pPlayer)
	local apCities = {}
	local iChance = 0;
	if (pPlayer:IsAlive()) then
		for city in pPlayer:Cities() do
			apCities[iChance] = city;
			iChance = iChance + 1;
		end
	end
	if (iChance == 0) then
		local targetCity = apCities[iChance];
	elseif (iChance > 0) then
		local iRandChoice = Game.Rand(iChance, "Choosing random city");
		 targetCity = apCities[iRandChoice];
	end
	return targetCity
end
		
	
--------------------------------------------------------------
function GetRandomPlayerPortCity(pPlayer)
	local apCities = {}
	local iChance = 0;
	if (pPlayer:IsAlive()) then
		for city in pPlayer:Cities() do
		 local iX = city:GetX();
		 local iY = city:GetY();
		 local plot = Map.GetPlot(iX, iY);
			if plot:IsCoastalLand() then
			apCities[iChance] = city;
			iChance = iChance + 1;
			end	
		end
	end
	if (iChance >= 0) then
		
		local iRandChoice = Game.Rand(iChance, "Choosing random city");
		 targetCity = apCities[iRandChoice];
		 
	end
	return targetCity
end
		
	
--------------------------------------------------------------
function GetRandomPlayerCityNotCap(pPlayer)
	
	local playerCap = pPlayer:GetCapitalCity();	
	local apCities = {}
	local iChance = 0;
	if (pPlayer:IsAlive()) then
		for city in pPlayer:Cities() do
			apCities[iChance] = city;
			iChance = iChance + 1;
				
		end
	end
	if (iChance == 0) then
		return nil
	elseif (iChance > 0) then
		repeat
		local iRandChoice = Game.Rand(iChance, "Choosing random city");
		 targetCity = apCities[iRandChoice];
		 until targetCity ~= playerCap
	end
	return targetCity
end
		
	
--------------------------------------------------------------
function GetRandomCIv(pPlayer)
	local iNumPlayers = NumPlayers();	
	print("players", iNumPlayers);
	
	local pickID = math.random(0,iNumPlayers);
	pRandomPlayer = Players[pickID];
	print ("id", pickID);

	print ("pPlayer", pRandomPlayer);
	return pRandomPlayer
end	
-------------------------------------------------------------------------
function GetRandomOtherPlayer(pPlayer)
	local iNumPlayers = NumPlayers();	
	print("players", iNumPlayers);
	local pickID = math.random(1, (iNumPlayers - 1));
	pRandomPlayer = Players[pickID];
	print ("id", pickID);
	
	print ("pPlayer", pRandomPlayer);
	return pRandomPlayer, pickID
end	
-------------------------------------------------------------------------
function NumPlayers()
	local iNumPlayers = 0;
	
	-- Loop through all the Majors
	for iPlayerLoop = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
		
		if (Players[iPlayerLoop]:IsAlive()) then
			iNumPlayers = iNumPlayers + 1;
		end
	end
	return iNumPlayers
end 
----------------------------------------------------------------------------
function EraCheck()
	

	local iPlayerID = Game.GetActivePlayer();
	local pPlayer = Players[iPlayerID];
	local iEra = pPlayer:GetCurrentEra();
	print("era", iEra);

return iEra
end
--------------------------------------------------------------
function GetRandomTech(pPlayer, pTeam)
	local curEra = EraCheck();
	for row in GameInfo.Eras() do
		if row.ID == curEra then
			currentEra = row.Type
		end
	end
	local iChance = 0
	local newTechID = {}

	for tech in GameInfo.Technologies("Era = '" .. currentEra .. "'") do
		if not (pTeam:GetTeamTechs():HasTech(tech)) then 
			newTechID[iChance] = tech.ID;
			iChance = iChance + 1;
		end
	end

	if (iChance > 0) then
		local iRandChoice = Game.Rand(iChance, "Choosing random tech");
		 randTechID = newTechID[iRandChoice];
	end
	print("randTech", randTechID);
	return randTechID
end
------------------------------------------------------------------
function CanDeclareWar(team1, team2)
	if not team1:IsAlive() then 
		return false;
	elseif team1 == team2 then
		return false;
	elseif team1:IsAtWar(team2) then
		return false;
	else
	return true;
	end
end
--------------------------------------------------------------------
function InitUnitFromCity(pCity, iUnitType, iNum)
	local tUnits = {}
	local pPlayer = Players[pCity:GetOwner()]
	for i = 1, iNum do
		pUnit = pPlayer:InitUnit(iUnitType, pCity:GetX(), pCity:GetY())
		if not(pUnit:JumpToNearestValidPlot()) then
			 return tUnits 
		end
	end
end
--------------------------------------------------------------------
function PlayersStrongestUnit(pPlayer, bIgnoreResources, ...)
	local tUnit = {["ID"] = GameInfoTypes.UNIT_WARRIOR, ["Combat"] = 0}
	for iKey, sCombatType in pairs(arg) do
		for row in GameInfo.Units("CombatClass = \'" .. sCombatType .. "\'") do
			if pPlayer:CanTrain(row.ID, bIgnoreResources) and row.Combat > tUnit.Combat then
				tUnit = row
			end
		end
	end
	return tUnit.ID
end
---------------------------------------------------------------------
function GetCityStateNearestToCity(pCity)
print("GETNEARCITY");
  local iShortestDistance = 99999
  local pNearestCS = nil
	
  local iCityX = pCity:GetX()
  local iCityY = pCity:GetY()
	print(iCityX, iCityY);
  for iCityState=GameDefines.MAX_MAJOR_CIVS, GameDefines.MAX_CIV_PLAYERS-1, 1 do 
    local pCityState = Players[iCityState]
	print("citystate", pCityState);
    if (pCityState:IsEverAlive() and pCityState:IsAlive()) and not pCityState:IsBarbarian() then
      for pCSCity in pCityState:Cities() do
        local iDist = Map.PlotDistance(pCSCity:GetX(), pCSCity:GetY(), iCityX, iCityY)
		print("dist", iDist);
        if (iDist < iShortestDistance) then
          iShortestDistance = iDist
          pNearestCS = pCityState
		  print("nearest", pNearestCS);
        end
      end
    end
  end
  print("nearest", pNearestCS);
  return pNearestCS
end	
-------------------------------------------------------------------------
function HighestEra()
	local iHighEra = 0

	for iLoopPlayer = 0, GameDefines.MAX_CIV_PLAYERS-1, 1 do
	    local pPlayer = Players[iLoopPlayer];
		local curEra = pPlayer:GetCurrentEra();
		if (curEra > iHighEra) then
			iHighEra = curEra
		end
		
	end
return iHighEra;
end
--------------------------------------------------------------------------
function RandomUnit(pPlayer)
	local pUnit = {}
	local iChance = 0;
	if (pPlayer:IsAlive()) then
		for unit in pPlayer:Units() do
			if unit:IsCombatUnit() then
				pUnit[iChance] = unit;
				iChance = iChance + 1;
			end
		end	
		
	end
	if (iChance > 0) then
		local iRandChoice = Game.Rand(iChance, "Choosing random unit");
		 randUnit = pUnit[iRandChoice];
	end
	return randUnit
end
------------------------------------------------------------------------
function RandomUnitNotGarrisoned(pPlayer)
	local pUnit = {}
	local iChance = 0;
	if (pPlayer:IsAlive()) then
		for unit in pPlayer:Units() do
			if (unit:IsCombatUnit() and not unit:IsGarrisoned()) then
					pUnit[iChance] = unit;
					iChance = iChance + 1;
				
			end
		end	
		
	end
	if (iChance > 0) then
		local iRandChoice = Game.Rand(iChance, "Choosing random unit");
		 randUnit = pUnit[iRandChoice];
	end
	return randUnit
end
------------------------------------------------------------------------


function RandomUnitNotInCap(pPlayer)
	local pUnit = {}
	local iChance = 0;
	local capCity = pPlayer:GetCapitalCity();
	if (pPlayer:IsAlive()) then
		for unit in pPlayer:Units() do
			if (unit:IsCombatUnit() and not unit:IsGarrisoned()) then
				pUnit[iChance] = unit;
				iChance = iChance + 1;
			end
			
		end	
		
	end
	if (iChance > 0) then
		local iRandChoice = Game.Rand(iChance, "Choosing random unit");
		 randUnit = pUnit[iRandChoice];
	end
	return randUnit
end

-------------------------------------------------------------------------
function round(num, idp)
  local mult = 10^(idp or 0)
  return math.floor(num * mult + 0.5) / mult
end
-----------------------------------------------------------------------
function ChangeOwner(unit, iNewOwner, iPlayerForName)

	local iX;
	local iY;
	local iUnitType;
	local iUnitDamage;
	local iOldOwner;
	local pNewUnit;
	local player;

	iX = unit:GetX();
	iY = unit:GetY();
	iUnitType = unit:GetUnitType();
	iUnitDamage = unit:GetDamage();
	iOldOwner = unit:GetOwner();
	player = Players[iNewOwner];

	unit:Kill();

	pNewUnit = player:InitUnit(iUnitType, iX, iY);
	pNewUnit:SetDamage(iUnitDamage);
	pNewUnit:SetOriginalOwner(iOldOwner);

	if (iPlayerForName ~= -1) then
		local playerName = Locale.ConvertTextKey(Players[iPlayerForName]:GetCivilizationShortDescriptionKey());
		pNewUnit:SetName(playerName);
	else
		pNewUnit:SetName("");
	end
end
----------------------------------------------------------------------
function GetFollowers(pPlayer,playerReligion)
	local totFollowers = 0
	for pCity in pPlayer:Cities() do	
		local curFollowers = pCity:GetNumFollowers(playerReligion);
		totFollowers = totFollowers + curFollowers;
	end
return totFollowers
end
----------------------------------------------------------------------
function GetRandomMinor()
local iRandMinor = {}
local iChance = 0

	for iCS = GameDefines.MAX_MAJOR_CIVS, GameDefines.MAX_CIV_PLAYERS-1, 1 do
		local pCS = Players[iCS]
		if pCS:IsEverAlive() then
			iRandMinor[iChance] = pCS;
			iChance = iChance + 1;
			local sCsName = pCS:GetName()
	print("MinCIv", sCsName)
		end		
	end

	if iChance > 0 then
	local iRandChoice = Game.Rand(iChance, "Choosing random Minor");
	randMinor = iRandMinor[iRandChoice];
	end
	local sCsName = randMinor:GetName()
	print("MinCIv", sCsName)
return randMinor
end
--------------------------------------------------------------------
function DestroyImprovement(pPlayer, improveType, numKill)
	local plotCount = numKill
	local plotImrove = {}

	for pCity in pPlayer:Cities() do
		local n = pCity:GetNumCityPlots() - 1
		for i = 1, n, 1 do
			local plot = pCity:GetCityIndexPlot( i );
			if plot then
				if plot:GetImprovementType() == improveType then
					if plotCount > 0 then
					plot:SetImprovementType(-1);
					plotCount = plotCount - 1;
					end
				end
			end
		end
	end

end
--------------------------------------------------------------------
function GetRandomPlot()
	local impPlots = {}
	local iImpactChance = 0;
	for plotLoop = 0, Map.GetNumPlots() - 1, 1 do
		local plot = Map.GetPlotByIndex(plotLoop);
			impPlots[iImpactChance] = plot;
			iImpactChance = iImpactChance + 1;
    	
	end
	if (iImpactChance > 0) then
		local iRandChoice = Game.Rand(iImpactChance, "Choosing random plot");
		targetImpactPlot = impPlots[iRandChoice];
	end
return targetImpactPlot
end
-------------------------------------------------------------------------
function GetRandomOceanPlot()
	local impPlots = {}
	local iImpactChance = 0;
	for id, area in Map.Areas() do
		if area:IsWater() then
			local GridX, GridY = Map.GetGridSize();
			for iX = 0, GridX do
				for iY = 0, GridX do
					local plot = Map.GetPlot(iX, iY);
						if (plot ~= nil) then
							if (plot:GetArea() == area:GetID()) then
								local featureType = plot:GetFeatureType();
								if ( featureType ~= FeatureTypes.FEATURE_ICE ) then
									impPlots[iImpactChance] = plot;
									iImpactChance = iImpactChance + 1;
								end
    						end
						end
				end
			end
		end
	end
	if (iImpactChance > 0) then
		local iRandChoice = Game.Rand(iImpactChance, "Choosing random plot");
		targetImpactPlot = impPlots[iRandChoice];
	end
return targetImpactPlot
end
-------------------------------------------------------------------------
function GetRandomPlotType(terrainType, terrainTypeB)
	local randPlot = {}
	local iPlotChance = 0;
	if terrainTypeB == nil then terrainTypeB = terrainType end
	for plotLoop = 0, Map.GetNumPlots() - 1, 1 do
		local plot = Map.GetPlotByIndex(plotLoop);
			if (plot:GetTerrainType() == terrainType) or  (plot:GetTerrainType() == terrainTypeB)then
			randPlot[iPlotChance] = plot;
			iPlotChance = iPlotChance + 1;
    		end
	end
	if (iPlotChance > 0) then
		local iRandChoice = Game.Rand(iPlotChance, "Choosing random plot");
		targetPlot = randPlot[iRandChoice];
	end
return targetPlot
end
-------------------------------------------------------------------------
function GetRandomPlotFeature(featureType, featureTypeB)
	local randPlot = {}
	local iPlotChance = 0;
	if featureTypeB == nil then featureTypeB = featureType end
	for plotLoop = 0, Map.GetNumPlots() - 1, 1 do
		local plot = Map.GetPlotByIndex(plotLoop);
			if (plot:GetFeatureType() == featureType) or  (plot:GetFeatureType() == featureTypeB)then
			randPlot[iPlotChance] = plot;
			iPlotChance = iPlotChance + 1;
    		end
	end
	if (iPlotChance > 0) then
		local iRandChoice = Game.Rand(iPlotChance, "Choosing random plot");
		targetPlot = randPlot[iRandChoice];
	end
return targetPlot
end
-------------------------------------------------------------------------
function CityLostToOther(city, otherPlayer)
	otherPlayer:AcquireCity(city, false, true)

	if city:GetResistanceTurns() > 0 then
		city:ChangeResistanceTurns(-city:GetResistanceTurns())
	end

	if not otherPlayer:IsHuman() then
		city:SetPuppet(false)
		if city:IsRazing() then
			city:DoTask(TaskTypes.TASK_UNRAZE, -1, -1, -1)
		end
	end

	if city:IsOccupied() then
		city:SetOccupied(false)
	end
	InvalidateCity();
end
------------------------------------------------------------------------
function GetPlayerPuppet(pPlayer)
	
	local apCities = {}
	local iChance = 0;
	if (pPlayer:IsAlive()) then
		for city in pPlayer:Cities() do
			if (city:IsPuppet()) then
			apCities[iChance] = city;
			iChance = iChance + 1;
			end
		end
	end
	if (iChance == 0) then
		local targetCity = apCities[iChance];
	elseif (iChance > 0) then
		local iRandChoice = Game.Rand(iChance, "Choosing random city");
		 targetCity = apCities[iRandChoice];
	end
	return targetCity
end
-----------------------------------------------------------------------
function SpawnBarbs(barbUnit, iX, iY, numBarbs)
	local barbPlayer = Players[63];
	for i = 1, numBarbs do
		unit = barbPlayer:InitUnit(barbUnit, iX, iY);
		unit:JumpToNearestValidPlot();
	end
end
-----------------------------------------------------------------------
function GetRandomStratResource(pPlayer)
	local iNumTotal = 0	
	local pGetResource = nil
	for pResource in GameInfo.Resources() do
		local iResourceLoop = pResource.ID;
		if (Game.GetResourceUsageType(iResourceLoop) == ResourceUsageTypes.RESOURCEUSAGE_STRATEGIC) then
			iNumTotal = pPlayer:GetNumResourceTotal(iResourceLoop, true);
			if iNumTotal > 0 then
				pGetResource = 	pResource	
				return pGetResource, iNumTotal;	
			end
		end
	end

	return pGetResource, iNumTotal;	
end
---------------------------------------------------------------------
function GetRandomImprovement(pPlayer, pCity)
	local plotImrovement = {}
	local iImprovecount = 0
	local n = pCity:GetNumCityPlots() - 1
	for i = 1, n, 1 do
		local plot = pCity:GetCityIndexPlot( i );
		if plot then
			if (plot:GetImprovementType() ~= NO_IMPROVEMENT) then
				plotImrovement[iImprovecount] = plot
				iImprovecount = iImprovecount + 1;
			end
		end
	end

	if (iImprovecount == 0) then
		local targetPlot = plotImrovement[iRandImp];
	elseif (iImprovecount > 0) then
		iRandImp = Game.Rand(iImprovecount, "get rand");
		targetPlot = plotImrovement[iRandImp]
	end
	return targetPlot;
end
---------------------------------------------------------------------
function GetRandBuilding(pCity)
	local pBuilding = {};
	local iBuildCount = 0;
	local targetBuilding = nil
	for building in GameInfo.Buildings() do
		local buildingID= building.ID;
		if (pCity:IsHasBuilding(buildingID)) then
			if (building.WonderSplashImage == nil or building.Capital ~= true) then
				pBuilding[iBuildCount] = building
				iBuildCount = iBuildCount + 1;
			end
		end
	end
	print("builds", iBuildCount);
	if iBuildCount > 0 then
		local randBuild = math.random(1, iBuildCount)
		targetBuilding = pBuilding[randBuild];
	end
	print("build", targetBuilding);
	return targetBuilding;
end
---------------------------------------------------------------------
function InvalidateCity()
	if currentCity then
		local cityID = currentCity:GetID();
		local playerID = currentCity:GetOwner();
		Events.SpecificCityInfoDirty(playerID, cityID, CityUpdateTypes.CITY_UPDATE_TYPE_BANNER);
		Events.SpecificCityInfoDirty(playerID, cityID, CityUpdateTypes.CITY_UPDATE_TYPE_PRODUCTION);
	end
	Events.SerialEventGameDataDirty();
end
---------------------------------------------------------------------
function GetNumAllPlayers()
	local iPlayerCount = 0
	local iMaxPlayers = 0
	local availPlayerID = {}
	for iPlayerLoop = 0, GameDefines.MAX_CIV_PLAYERS-1, 1 do
		local pPlayer = Players[iPlayerLoop];
		if pPlayer:IsAlive() then
			availPlayerID[iPlayerCount] = iPlayerLoop
			iPlayerCount = iPlayerCount + 1;
		end
	end
	for iPlayerLoop = 0, GameDefines.MAX_CIV_PLAYERS-1, 1 do
			iMaxPlayers = iMaxPlayers + 1;
	end


	return iPlayerCount, iMaxPlayers;
end
-----------------------------------------------------------------------
function GetZedEraUnit()
	local zedUnit
	local basePlayer = Players[0]
	local zedEra = basePlayer:GetCurrentEra();
	if zedEra == 6 then
		zedUnit = GameInfoTypes["UNIT_ZOMBIE"];
	elseif zedEra == 7 then
		zedUnit = GameInfoTypes["UNIT_ZOMBIEB"];
	elseif zedEra == 8 then
		zedUnit = GameInfoTypes["UNIT_ZOMBIEC"];
	else zedUnit = GameInfoTypes["UNIT_ZOMBIE"];
	end
	
	return zedUnit;
end
-------------------------------------------------------------------------
function PlayerHasUnit(pPlayer, unitType)
	local pHasUnit = nil
	for pUnit in pPlayer:Units() do
			if (pUnit:GetUnitType() == unitType) then
			pHasUnit = pUnit;
			return pHasUnit;
		end
	end
	return pHasUnit;
end
--------------------------------------------------------------------------
function DoChangeYields(pPlayer, yieldType, iDoChange)
	for pCity in pPlayer:Cities() do
		local n = pCity:GetNumCityPlots() - 1
		for i = 1, n, 1 do
			local plot = pCity:GetCityIndexPlot( i );
			if plot then
				local iX = plot:GetX();
				local iY = plot:GetY();	
				iPlotYield = plot:GetYield(yieldType);
				if iPlotYield > 0 then
				Game.SetPlotExtraYield(iX, iY, yieldType, iDoChange)	
				end	
				
			end
		end
	end
end
------------------------------------------------------------------------
function KillBarbsInTerr(playerID)
	for id, area in Map.Areas() do
		if (area:IsWater() == false) then
			local GridX, GridY = Map.GetGridSize();
			for iX = 0, GridX do
				for iY = 0, GridX do
					local plot = Map.GetPlot(iX, iY);
					if (plot ~= nil) then
						if (plot:GetOwner()) == playerID then
							print("plot", plot:GetOwner(), playerID);
								local pUnit = plot:GetUnit();
								
								if pUnit ~= nil then
									print("unit", pUnit, pUnit:GetOwner());
									if pUnit:GetOwner() == 63 then
										pUnit:Kill();
									end
								end
							
						end
					end
				end
			end
		end
	end
end
----------------------------------------------------------------------
function NumPlayersAtWar()
	local iWarCount = 0
	local pWarPlayer = {}
	local pOtherWarPlayer = {}

	for iPlayerLoop = 0, GameDefines.MAX_CIV_PLAYERS-1, 1 do
		local onePlayer = Players[iPlayerLoop]
		if (onePlayer:IsAlive()) then
			local pOneTeamID = onePlayer:GetTeam();
			local pOneTeam = Teams[pOneTeamID];
			for iPlayerLoopTwo = 0, GameDefines.MAX_CIV_PLAYERS-1, 1 do
				if iPlayerLoopTwo ~= iPlayerLoop then
					local TwoPlayer = Players[iPlayerLoopTwo]
					local pTwoTeamID = TwoPlayer:GetTeam();
					local pTwoTeam = Teams[pTwoTeamID];
					if pOneTeam:IsAtWar( pTwoTeamID ) then 
						pWarPlayer[iWarCount] = onePlayer;
						pOtherWarPlayer[iWarCount] = TwoPlayer;
						iWarCount = iWarCount + 1;
					print(onePlayer, iPlayerLoop, TwoPlayer, iPlayerLoopTwo, "wars", iWarCount);
					end
				end
			end
		end
	end
	iWarCount = (iWarCount / 2);
	return iWarCount;
end
--------------------------------------------------------------------------------------
function AddNewResource(playerID, iAddResource, iNumNewResource)
	local pPlayer = Players[playerID];
	print("resourceadd", iAddResource, iNumNewResource);
	for id, area in Map.Areas() do
		if iNumNewResource <= 0 then break end
		local GridX, GridY = Map.GetGridSize();
		for iX = 0, GridX do
			for iY = 0, GridX do
				local plot = Map.GetPlot(iX, iY);
				if (plot ~= nil) then
					if (plot:GetOwner()) == playerID then
						if (plot:GetImprovementType() ~= NO_IMPROVEMENT) and (plot:GetResourceType(-1) == -1) then
							if iNumNewResource > 0 then
								plot:SetResourceType(iAddResource, 6);
								plot:SetNumResource(6);
								iNumNewResource = iNumNewResource - 1;
								text = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_SUMMARY_ADDRESOURCE");
								heading = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_ADDRESOURCE");
								pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, text, heading, iX, iY);
							end
						end
					end
				end
			end
		end
	end
end
---------------------------------------------------
function GetRandomLuxury(pPlayer)
	local plotLuxury = {}
	local luxPlot = {}
	local iLuxurycount = 0
	for pCity in pPlayer:Cities() do
		local n = pCity:GetNumCityPlots() - 1
		for i = 1, n, 1 do
			local plot = pCity:GetCityIndexPlot( i );
			if plot then
				local iResourceType = plot:GetResourceType();
				if (iResourceType ~= -1) then
					if (Game.GetResourceUsageType(iResourceType) == ResourceUsageTypes.RESOURCEUSAGE_LUXURY) then
						plotLuxury[iLuxurycount] =	iResourceType;
						luxPlot[iLuxurycount] =	plot;
						iLuxurycount = iLuxurycount + 1;
					end
				end
			end
		end
	end
	if iLuxurycount > 0 then 
		local iRandLux = Game.Rand(iLuxurycount, "choosing");
			randLuxury = plotLuxury[iRandLux]
			targetPlot = luxPlot[iRandLux]
	end

	return randLuxury, targetPlot
end