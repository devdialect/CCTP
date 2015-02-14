if(Game.GetCustomOption("GAMEOPTION_CCTP_EVENTS") == 0) then
	return;
end

-- WeatherEvents
-- Author: gyogen
-- DateCreated: 11/22/2014 11:44:17 AM
--------------------------------------------------------------




----------------------------------------------------------
function FloodEvent()
	print("FloodEvent");
	local apPlots = {}
	local iChance = 0;
	local iPlayerID = Game.GetActivePlayer();
	local pPlayer = Players[iPlayerID];
	local eBase = BaseFloodChance;
		local iRandEvent = Game.Rand(100, "Flood check");
			if iRandEvent > eBase then 
				return
			end

	for plotLoop = 0, Map.GetNumPlots() - 1, 1 do
		local plot = Map.GetPlotByIndex(plotLoop);
		if ( IsValidFlood(plot) ) then
			apPlots[iChance] = plot;
			iChance = iChance + 1;
    	end
	end

	if (iChance > 0) then

			local iRandChoice = Game.Rand(iChance, "Choosing random plot");
			local targetPlot = apPlots[iRandChoice];
			local iX = targetPlot:GetX();
			local iY = targetPlot:GetY();	
			
			targetPlot:SetImprovementType(-1);
			targetPlot:SetFeatureType(FeatureTypes.FEATURE_MARSH, -1)
			targetPlot:SetTerrainType(TerrainTypes.TERRAIN_GRASS, false, true)
			iLastEvent = 4			if ( DestroyResource ) then
				local player = Players[targetPlot:GetOwner()];
				local iResourceID = targetPlot:GetResourceType();
				local plot = targetPlot;
					if ( iResourceID ~= -1 ) then
						targetPlot:SetResourceType(-1);	
						if (player:IsHuman()) then
							text = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_SUMMARY_FLOODEVNTLOSS"), lResource;
							heading = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_FLOODEVNT");
							pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, text, heading, iX, iY);
								
						end					
					end

			end
			if (pPlayer:IsHuman()) then 
				if ( targetPlot:IsRevealed(pPlayer:GetTeam()) ) then
					text = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_SUMMARY_FLOODEVNT");
					heading = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_FLOODEVNT");
					pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, text, heading, iX, iY);
				end
			end
	end
	
end
--------------------------------------------------------------------------------------
function TornadoEvent()
		print("TornadoEvent");
		local eBase = BaseTornadoChance
		local iRandEvent = Game.Rand(100, "Tornado check");
			if iRandEvent > eBase then 
				return
			end

			local targetCity = GetRandomCity(cCity);
			local iX = targetCity:GetX();
			local iY = targetCity:GetY();	
			local n = targetCity:GetNumCityPlots() - 1	
			for i = 1, n, 1 do
				local plot = targetCity:GetCityIndexPlot( i );
				if (plot:GetImprovementType() ~= NO_IMPROVEMENT) then
					local dRand = 1 + Game.Rand(100, "Random Destruction");
					if dRand > 65 then
						plot:SetImprovementPillaged(true);
						local pPlayer = Players[targetCity:GetOwner()];
						if (pPlayer:IsHuman()) then 
							text = targetCity:GetName(), Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_SUMMARY_TORNADOEVNT");
							heading = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_TORNADOEVNT");
							pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, text, heading, iX, iY);
								
						end
					end
				end
			end
			local iPlayerID = Game.GetActivePlayer();
			local pPlayer = Players[iPlayerID];
			if (pPlayer:IsHuman()) then
				if ( targetPlot:IsRevealed(pPlayer:GetTeam()) ) then
					text = targetCity:GetName(), Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_SUMMARY_TORNADOEVNT2");
					heading = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_TORNADOEVNT2");
					pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, text, heading, iX, iY);
				end
			end

	
end
------------------------------------------------------------------------------
function BlizzardEvent()
	local iPlayerID = Game.GetActivePlayer();
	local pActivePlayer = Players[iPlayerID];
	local terrainType =(TerrainTypes.TERRAIN_SNOW);
	local terrainTypeB = (TerrainTypes.TERRAIN_TUNDRA);
	local targetPlot = GetRandomPlotType(terrainType, terrainTypeB);
	local iX = targetPlot:GetX();
	local iY = targetPlot:GetY();
	local iCityOwner
	local pCityOwner
	local pTargetCity
		if targetPlot:IsCity() then
			pTargetCity = targetPlot:GetPlotCity();
		end
		for i = 0, 5 do
			local adjPlot = Map.PlotDirection(iX, iY, i)
			if adjPlot then
				if adjPlot:IsCity() then
					pCity = adjPlot:GetPlotCity();
					if (pCity ~= nil) then
					pTargetCity = pCity
					break
					end
				end
			end
		end
		if (pTargetCity ~= nil) then
		iCityOwner = pTargetCity:GetOwner();
		pCityOwner = Players[iCityOwner];
		pCityName = pTargetCity:GetName()
		pTargetCity:ChangePopulation(-1);
		local iCurrProd = pTargetCity:GetProduction();
		pTargetCity:ChangeProduction(-iCurrProd);
		end
	
	if 	pTargetCity ~= nil then
		text = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_SUMMARY_BLIZZARDA", pCityName);
	else
		text = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_SUMMARY_BLIZZARDB");
	end
	if (pActivePlayer:IsHuman()) then
		if ( targetPlot:IsRevealed(pActivePlayer:GetTeam()) ) then
			heading = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_BLIZZARD");
			pActivePlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, text, heading, iX, iY);
		end
	end

	print("snow", terrainType, iX, iY);
end

------------------------------------------------------------------------------
function SandStormEvent()
	local iPlayerID = Game.GetActivePlayer();
	local pActivePlayer = Players[iPlayerID];
	local terrainType =(TerrainTypes.TERRAIN_DESERT);
	local terrainTypeB = nil;
	local targetPlot = GetRandomPlotType(terrainType, terrainTypeB);
	local iX = targetPlot:GetX();
	local iY = targetPlot:GetY();
	local iUnitsHit = 0
	local pUnitA = targetPlot:GetUnit();
		if (pUnitA ~= nil) then
			local iUnitPlayer = pUnitA:GetOwner();
			local iDamageRand = math.random(1, 100);
			pUnitA:ChangeDamage(iDamageRand,iUnitPlayer);
			iUnitsHit = iUnitsHit + 1
		end
	
		for i = 0, 5 do
			local adjPlot = Map.PlotDirection(iX, iY, i)
			if adjPlot then
				local pUnit = adjPlot:GetUnit();
				if (pUnit ~= nil) then
					local iUnitPlayer = pUnit:GetOwner();
					local iDamageRand = math.random(1, 100);
					pUnit:ChangeDamage(iDamageRand,iUnitPlayer);
					iUnitsHit = iUnitsHit + 1
				end
			end
		end

	if iUnitsHit > 0 then
		text = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_SUMMARY_SANDSTORMA", iUnitsHit);
	else
		text = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_SUMMARY_SANDSTORMB");
	end

	if (pActivePlayer:IsHuman()) then
		if ( targetPlot:IsRevealed(pActivePlayer:GetTeam()) ) then
			heading = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_SANDSTORM");
			pActivePlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, text, heading, iX, iY);
		end
	end
end
------------------------------------------------------------------------------
function ForestFire()
	local iPlayerID = Game.GetActivePlayer();
	local pActivePlayer = Players[iPlayerID];
	local featureType =(FeatureTypes.FEATURE_FOREST);
	local featureTypeB = (FeatureTypes.FEATURE_JUNGLE);
	local targetPlot = GetRandomPlotFeature(featureType, featureTypeB);
	local iX = targetPlot:GetX();
	local iY = targetPlot:GetY();
	targetPlot:SetFeatureType(FeatureTypes.NO_FEATURE, -1);
	targetPlot:SetResourceType(-1);
	targetPlot:SetImprovementPillaged(true);
	targetPlot:SetImprovementType(GameInfoTypes["IMPROVEMENT_BURN"]);
	local pUnit = targetPlot:GetUnit();
		if (pUnit ~= nil) then
			local iUnitPlayer = pUnit:GetOwner();
			local iDamageRand = math.random(1, 90);
			pUnit:ChangeDamage(iDamageRand,iUnitPlayer);
		end
	if (pActivePlayer:IsHuman()) then
		if ( targetPlot:IsRevealed(pActivePlayer:GetTeam()) ) then
			text = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_SUMMARY_FORESTFIRE");
			heading = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_FORESTFIRE");
			pActivePlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, text, heading, iX, iY);
		end
	end
end

---------------------------------------------------------------------------------------
function HeavyRain()
	local iPlayerID = Game.GetActivePlayer();
	local pActivePlayer = Players[iPlayerID];
	if not pActivePlayer:IsHuman() then return end
	local targetCity = GetRandomCity();
	local iX = targetCity:GetX();
	local iY = targetCity:GetY();
	local pCityName = targetCity:GetName();
	local cityID = targetCity:GetID();
	local targetPlot = Map.GetPlot(iX, iY);
	targetCity:ChangeBaseYieldRateFromTerrain(YieldTypes.YIELD_FOOD, 3);
	local iTurn = Game.GetGameTurn(); 
	local iRainTurn = (iTurn + 3);
	SetPersistentProperty("RainTurn", iRainTurn);
	SetPersistentProperty("RainCity", cityID);
	SetPersistentProperty("RainPlayer", iPlayerID);
	if (pActivePlayer:IsHuman()) then
		if ( targetPlot:IsRevealed(pActivePlayer:GetTeam()) ) then
			text = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_SUMMARY_RAIN", pCityName);
			heading = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_RAIN");
			pActivePlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, text, heading, iX, iY);
		end
	end
end
---------------------------------------------------------------------------------------
function HardDrought()
	local iPlayerID = Game.GetActivePlayer();
	local pActivePlayer = Players[iPlayerID];
	if not pActivePlayer:IsHuman() then return end
	--local targetCity = GetRandomCity();
	local targetCity = pActivePlayer:GetCapitalCity();
	local iX = targetCity:GetX();
	local iY = targetCity:GetY();
	local pCityName = targetCity:GetName();
	local cityID = targetCity:GetID();
	local targetPlot = Map.GetPlot(iX, iY);
	local iTurn = Game.GetGameTurn(); 
	local iDrougthTurn = (iTurn + 3);

	targetCity:ChangeBaseYieldRateFromTerrain(YieldTypes.YIELD_FOOD, -2);
	SetPersistentProperty("DroughtTurn", iDroughtTurn);
	SetPersistentProperty("DroughtCity", cityID);
	SetPersistentProperty("DroughtPlayer", iPlayerID);
	if (pActivePlayer:IsHuman()) then
		if ( targetPlot:IsRevealed(pActivePlayer:GetTeam()) ) then
			text = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_SUMMARY_DROUGHT", pCityName);
			heading = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_DROUGHT");
			pActivePlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, text, heading, iX, iY);
		end
	end
end
------------------------------------------------------------------------------------------
function Hurricane()
	local iNextCane = GetPersistentProperty("HNextHurricane");
	if iNextCane == 0 then return end
	local iPlayerID = Game.GetActivePlayer();
	local pActivePlayer = Players[iPlayerID];
	local startPlot = GetRandomOceanPlot();
	local iX = startPlot:GetX();
	local iY = startPlot:GetY();
	local iHurricaneTurn = math.random(3,15);
	
	SetPersistentProperty("HurricaneTurn", iHurricaneTurn);
	SetPersistentProperty("HurrPlotX", iX);
	SetPersistentProperty("HurrPlotY", iY);
	
	startPlot:SetImprovementType(GameInfoTypes["IMPROVEMENT_HURRICANE"]);
	local iNextCane = 0
	SetPersistentProperty("HNextHurricane", iNextCane);
	g_ThisGameTurn = iHurricaneTurn;
	print("hTurn1", iHurricaneTurn, "plot1", iX, iY);
	if (pActivePlayer:IsHuman()) then
		if ( startPlot:IsRevealed(pActivePlayer:GetTeam()) ) then
			text = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_SUMMARY_HURRICANE");
			heading = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_HURRICANE");
			pActivePlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, text, heading, iX, iY);
		end
	end
end

------------------------------------------------------------------------------------------