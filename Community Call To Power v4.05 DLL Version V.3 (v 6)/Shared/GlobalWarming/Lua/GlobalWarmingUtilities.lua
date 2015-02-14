-- GlobalWarmingUtilities
-- Author: FramedArchitecture
-- DateCreated: 11/9/2012
--------------------------------------------------------------
include("GlobalWarmingOptions.lua")

--Warming Index Functions
function GetGlobalWarmingIndex()

	local gWarming = 0

	local fPopulation = 0
	local fBuilding = 0
	local fTech = 0
	local fFallout = 0
	local fOil = 0
	local fMines = 1
	local fForest = 1
	local fIce = 1
	local fSpecialist = 0
	
	local iFallout, iOil, iMines, iForest, iIce = CountWarmingPlots();
	local iGlobalArea = Map.GetNumPlots()

	if ( WarmingPopulation ) then
		local iPopulation = Game.GetTotalPopulation()
		local kGrowth = 1.5
		fPopulation = math.ceil( ( math.log(iPopulation) ) ^ kGrowth )
		print("fPopulation: " ..fPopulation)
	end

	if ( WarmingBuildings ) then
		fBuilding = CountWarmingBuildings()
		print("fBuilding: " ..fBuilding)
	end

	if ( WarmingTechs ) then
		fTech = CountWarmingTechs()
		print("fTech: " ..fTech)
	end

	if ( WarmingFallout ) then
		fFallout = iFallout * 4
		print("fFallout: " ..fFallout)
	end

	if ( WarmingOil ) then
		fOil = math.ceil( iOil * 1.5 )
		print("fOil: " ..fOil)
	end

	if ( WarmingMines ) then
		local iMiningArea = iMines/Map.GetLandPlots()
		if ( iMiningArea > 0 ) then
			fMines = 1 + iMiningArea
			print("fMines: " ..fMines)
		end
	end

	if ( CoolingForest ) then
		local iForestCover = iForest/iGlobalArea
		if ( iForestCover > 0 ) then
			fForest = 1 - iForestCover 
			print("fForest: " ..fForest)
		end
	end

	if ( CoolingIce ) then
		local iAlbedo = iIce/iGlobalArea
		if ( iAlbedo > 0 ) then
			fIce =  1 - iAlbedo
			print("fIce: " ..fIce)
		end
	end

	if ( EcoSpecialist ) then
		fSpecialist = CountSpecialists()
		print("fSpecialist: " ..fSpecialist)
	end

	gWarming = math.floor( (fPopulation + fBuilding + fTech + fFallout + fOil + fSpecialist) * fMines * fForest * fIce )

	if ( WorldSizeVariable ) then
		local iWorldSize = GameInfo.Worlds[ Map.GetWorldSize() ].AdvancedStartPointsMod
		local worldVariable = iWorldSize / 100 
			gWarming = math.floor( gWarming * worldVariable )
	end

	if ( GameSpeedVariable ) then
		local iGameSpeed = GameInfo.GameSpeeds[ Game.GetGameSpeedType() ].GrowthPercent
		local speedVariable = ( ( 1/ iGameSpeed ) * 100 )
			gWarming = math.floor( gWarming * speedVariable )
	end

	if ( gWarming < 1 ) then
		gWarming = 0
	elseif ( gWarming > 90 ) then
		gWarming = 90
	end

	return gWarming;
end

function CountWarmingPlots()

	local iFallout = 0
	local iOil = 0
	local iMines = 0
	local iForest = 0
	local iIce = 0

	for plotLoop = 0, Map.GetNumPlots() - 1, 1 do
		local plot = Map.GetPlotByIndex(plotLoop);
		local featureType = plot:GetFeatureType();
		local improvementType = plot:GetImprovementType();
		local terrainType = plot:GetTerrainType();

		if ( featureType == FeatureTypes.FEATURE_FALLOUT ) then
			iFallout = iFallout + 1;
		elseif ( improvementType == GameInfoTypes["IMPROVEMENT_OFFSHORE_PLATFORM"] or improvementType == GameInfoTypes["IMPROVEMENT_WELL"] ) then
			iOil = iOil + 1;
    	elseif ( improvementType == GameInfoTypes["IMPROVEMENT_MANUFACTORY"] or improvementType == GameInfoTypes["IMPROVEMENT_MINE"] or improvementType == GameInfoTypes["IMPROVEMENT_QUARRY"] ) then
			iMines = iMines + 1;
		elseif ( featureType == FeatureTypes.FEATURE_FOREST or featureType == FeatureTypes.FEATURE_JUNGLE ) then
			iForest = iForest + 1;
    	elseif ( featureType == FeatureTypes.FEATURE_ICE or terrainType == TerrainTypes.TERRAIN_SNOW ) then
			iIce = iIce + 1;
		end

	end

	--print ("Fallout Count: " .. tostring(iFallout));
	--print ("Oil Well Count: " .. tostring(iOil));
	--print ("Mine Count: " .. tostring(iMines));
	--print ("Forest Count: " .. tostring(iForest));
	--print ("Ice Count: " .. tostring(iIce));

	return iFallout, iOil, iMines, iForest, iIce
end

function CountWarmingBuildings()

	local iBuildingEffect = 0
	
	local iWarmBuildings = 0
	local iCoolBuildings = 0

	for iPlayerLoop = 0, GameDefines.MAX_CIV_PLAYERS-1, 1 do
		local player = Players[iPlayerLoop]

		if (player:IsAlive()) then

			for _, v in ipairs(WarmingBuildings) do
			local building = GameInfo.Buildings[v]
				if building then
					iWarmBuildings = iWarmBuildings + player:CountNumBuildings(building.ID)
				end
			end

			for _, v in ipairs(CoolingBuildings) do
			local building = GameInfo.Buildings[v]
				if building then
					iCoolBuildings = iCoolBuildings + player:CountNumBuildings(building.ID)
				end
			end

		end
	end

	iBuildingEffect = iWarmBuildings - iCoolBuildings
	
	return iBuildingEffect;
end

function CountWarmingTechs()

	local iTechEffect = 0
	
	local iWarmTechs = 0
	local iCoolTechs = 0

	for iPlayerLoop = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
		local player = Players[iPlayerLoop]
	
		if (player:IsAlive()) then

			for i, v in ipairs(WarmingTechnologies) do
			local tech = GameInfo.Technologies[v]
				if (tech ~= nil) then
				local techID = tech.ID
				local pTeam = Teams[player:GetTeam()]	
					if ( pTeam:IsHasTech(techID) ) then
						iWarmTechs = iWarmTechs + 1
					end
				end
			end

			for i, v in ipairs(CoolingTechnologies) do
			local tech = GameInfo.Technologies[v]
				if (tech ~= nil) then
				local techID = tech.ID
				local pTeam = Teams[player:GetTeam()]	
					if ( pTeam:IsHasTech(techID) ) then
						iCoolTechs = iCoolTechs + 1
					end
				end
			end

		end
	end
	--print("iWarmTechs " ..iWarmTechs)
	--print("iCoolTechs " ..iCoolTechs)
	
	iTechEffect = iWarmTechs - iCoolTechs

	return iTechEffect;
end

function CountSpecialists()
local ecoYieldType = GameInfo.Yields["YIELD_ECO"].Type 
local iSpecialistEffect = 0
local iEcospec = 0

	for iPlayerLoop = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
		local player = Players[iPlayerLoop]
			
		if (player:IsAlive()) then
	
			for pSpecialistInfo in GameInfo.Specialists() do	
				if (pSpecialistInfo.Type == "SPECIALIST_ENVIRONMENT") then
					for pCity in player:Cities() do	
						local iCount = pCity:GetSpecialistCount( GameInfoTypes[pSpecialistInfo.Type] )
						if iCount >  0 then
							for row in GameInfo.SpecialistYields() do
								if row.YieldType == ecoYieldType then
									print("yield", row.Yield);
									iEcospec = iEcospec + (iCount * row.Yield)
							
								end
						 
							end			
						end					
					end			
				end
			end
		end
	end
	iSpecialistEffect = iEcospec * -1
	print("iSpecialistEffect " ..iSpecialistEffect)
	return 	iSpecialistEffect;
end	
--Global Warming Events
function HurricaneEvent()
	
		local apCities = {}
		local iCounter = 0;

		for iPlayerLoop = 0, GameDefines.MAX_CIV_PLAYERS-1, 1 do
			local player = Players[iPlayerLoop]
			if (player:IsAlive()) then
				for city in player:Cities() do
					if ( city:IsCoastal() ) then
						apCities[iCounter] = city;
						iCounter = iCounter + 1;
					end
				end
			end
		end
		
		if (iCounter > 0) then
			local iRandChoice = Game.Rand(iCounter, "Choosing random city");
			local targetCity = apCities[iRandChoice];
			local iX = targetCity:GetX();
			local iY = targetCity:GetY();	
			local cityPop = targetCity:GetPopulation()

				if ( cityPop > 25 ) then
					targetCity:ChangePopulation(-12, true)
				elseif ( cityPop > 15 ) then
					targetCity:ChangePopulation(-8, true)
				elseif ( cityPop > 5 ) then
					targetCity:ChangePopulation(-4, true)
				elseif ( cityPop > 1 ) then
					targetCity:ChangePopulation(-1, true)
				else 
					return;
				end
		
		-- Notification
			local text;
			local heading;
			local pPlayer = Players[Game.GetActivePlayer()];
			if ( pPlayer ~= nil ) then
				text = Locale.ConvertTextKey("TXT_KEY_GW_HURRICANE", targetCity:GetName());
				heading = Locale.ConvertTextKey("TXT_KEY_GW_HURRICANE_SHORT");
     			pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, text, heading, iX, iY); 
			end

		end
end

function CoastalFlood()

		local apPlots = {}
		local iCounter = 0;
		
		for plotLoop = 0, Map.GetNumPlots() - 1, 1 do
			local plot = Map.GetPlotByIndex(plotLoop);
			if ( IsValidFlood(plot) ) then
				apPlots[iCounter] = plot;
				iCounter = iCounter + 1;
    		end
		end
	
		if (iCounter > 0) then
			local iRandChoice = Game.Rand(iCounter, "Choosing random plot");
			local targetPlot = apPlots[iRandChoice];
			local iX = targetPlot:GetX();
			local iY = targetPlot:GetY();	
			
			targetPlot:SetImprovementType(-1);
			targetPlot:SetFeatureType(FeatureTypes.FEATURE_MARSH, -1)
			targetPlot:SetTerrainType(TerrainTypes.TERRAIN_GRASS, false, true)
			
			if ( DestroyResource ) then
				local player = Players[targetPlot:GetOwner()];
				local pActivePlayer = Players[Game.GetActivePlayer()];
				local iResourceID = targetPlot:GetResourceType(Game.GetActiveTeam())
				
				if ( iResourceID ~= -1 ) then
					targetPlot:SetResourceType(-1);
					if ( player == pActivePlayer ) then
						local text;
						local heading;
						text = Locale.ConvertTextKey("TXT_KEY_GW_LOST_RESOURCE", GameInfo.Resources[iResourceID].Description);
						heading = Locale.ConvertTextKey("TXT_KEY_GW_LOST_RESOURCE_SHORT");
     					pActivePlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, text, heading, iX, iY); 
					end
				end
			end
				
		iCounter = 0

		-- Notification
			local text;
			local heading;
			local player = Players[Game.GetActivePlayer()];
			if ( player ~= nil ) then
				if ( targetPlot:IsRevealed(player:GetTeam()) ) then
					text = Locale.ConvertTextKey("TXT_KEY_GW_FLOOD");
					heading = Locale.ConvertTextKey("TXT_KEY_GW_FLOOD_SHORT");
     				player:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, text, heading, iX, iY); 
				end
			end

		end
end

function LandWarm()

		local apPlots = {}
		local iCounter = 0;
		
		for plotLoop = 0, Map.GetNumPlots() - 1, 1 do
			local plot = Map.GetPlotByIndex(plotLoop);
			if ( IsValidWarm(plot) ) then
				apPlots[iCounter] = plot;
				iCounter = iCounter + 1;
    		end
		end
	
		if (iCounter > 0) then
			local iRandChoice = Game.Rand(iCounter, "Choosing random plot");
			local targetPlot = apPlots[iRandChoice];
			local iX = targetPlot:GetX();
			local iY = targetPlot:GetY();	
			local terrainType = targetPlot:GetTerrainType();

			if ( terrainType == TerrainTypes.TERRAIN_TUNDRA  ) then
				targetPlot:SetImprovementType(-1);
				targetPlot:SetFeatureType(FeatureTypes.NO_FEATURE, -1);
				targetPlot:SetTerrainType(TerrainTypes.TERRAIN_GRASS, false, true)
				
			elseif ( terrainType == TerrainTypes.TERRAIN_GRASS  ) then
				targetPlot:SetImprovementType(-1);
				targetPlot:SetFeatureType(FeatureTypes.NO_FEATURE, -1);
				targetPlot:SetTerrainType(TerrainTypes.TERRAIN_PLAINS, false, true)

			elseif ( terrainType == TerrainTypes.TERRAIN_PLAINS  ) then
				targetPlot:SetImprovementType(-1);
				targetPlot:SetFeatureType(FeatureTypes.NO_FEATURE, -1);
				targetPlot:SetTerrainType(TerrainTypes.TERRAIN_DESERT, false, true)
			
			end

			if ( DestroyResource ) then
				local player = Players[targetPlot:GetOwner()];
				local pActivePlayer = Players[Game.GetActivePlayer()];
				local iResourceID = targetPlot:GetResourceType(Game.GetActiveTeam())
				
				if ( iResourceID ~= -1 ) then
					targetPlot:SetResourceType(-1);
					if ( player == pActivePlayer ) then
						local text;
						local heading;
						text = Locale.ConvertTextKey("TXT_KEY_GW_LOST_RESOURCE", GameInfo.Resources[iResourceID].Description);
						heading = Locale.ConvertTextKey("TXT_KEY_GW_LOST_RESOURCE_SHORT");
     					pActivePlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, text, heading, iX, iY); 
					end
				end
			end

		-- Notification
			local text;
			local heading;
			local player = Players[Game.GetActivePlayer()];
			if ( player ~= nil ) then
				if ( targetPlot:IsRevealed(player:GetTeam()) ) then
					text = Locale.ConvertTextKey("TXT_KEY_GW_LAND");
					heading = Locale.ConvertTextKey("TXT_KEY_GW_LAND_SHORT");
     				player:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, text, heading, iX, iY); 
				end
			end

		end
end

function IceMelt()

		local apPlots = {}
		local iCounter = 0;
		
		for plotLoop = 0, Map.GetNumPlots() - 1, 1 do
			local plot = Map.GetPlotByIndex(plotLoop);
			if ( IsValidMelt(plot) ) then
				apPlots[iCounter] = plot;
				iCounter = iCounter + 1;
    		end
		end
	
		if (iCounter > 0) then
			local iRandChoice = Game.Rand(iCounter, "Choosing random plot");
			local targetPlot = apPlots[iRandChoice];
			local iX = targetPlot:GetX();
			local iY = targetPlot:GetY();	

			if ( targetPlot:GetFeatureType() == FeatureTypes.FEATURE_ICE ) then
				targetPlot:SetFeatureType(FeatureTypes.NO_FEATURE, -1);
			else
				targetPlot:SetImprovementType(-1);
				targetPlot:SetTerrainType(TerrainTypes.TERRAIN_TUNDRA, false, true)
			end
				
			if ( DestroyResource ) then
				local player = Players[targetPlot:GetOwner()];
				local pActivePlayer = Players[Game.GetActivePlayer()];
				local iResourceID = targetPlot:GetResourceType(Game.GetActiveTeam())
				
				if ( iResourceID ~= -1 ) then
					targetPlot:SetResourceType(-1);
					if ( player == pActivePlayer ) then
						local text;
						local heading;
						text = Locale.ConvertTextKey("TXT_KEY_GW_LOST_RESOURCE", GameInfo.Resources[iResourceID].Description);
						heading = Locale.ConvertTextKey("TXT_KEY_GW_LOST_RESOURCE_SHORT");
     					pActivePlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, text, heading, iX, iY); 
					end
				end
			end
				
		iCounter = 0

		-- Notification
			local text;
			local heading;
			local player = Players[Game.GetActivePlayer()];
			if ( player ~= nil ) then
				if ( targetPlot:IsRevealed(player:GetTeam()) ) then
					text = Locale.ConvertTextKey("TXT_KEY_GW_MELT");
					heading = Locale.ConvertTextKey("TXT_KEY_GW_MELT_SHORT");
     				player:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, text, heading, iX, iY); 
				end
			end

		end
end

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

function IsValidWarm(plot)

	local plotType = plot:GetPlotType();
	local terrainType = plot:GetTerrainType();
	local featureType = plot:GetFeatureType();

	if ( plotType == PlotTypes.PLOT_MOUNTAIN ) then
		return false;
	elseif ( plotType == PlotTypes.PLOT_OCEAN ) then
		return false;
	elseif ( plot:IsAdjacentToShallowWater() ) then
		return false;
	end

    if ( plot:IsCity() ) then
		return false;
	end

	if (featureType > 5 ) then
		return false; 
	end

	if ( terrainType == TerrainTypes.TERRAIN_GRASS or terrainType == TerrainTypes.TERRAIN_PLAINS or terrainType == TerrainTypes.TERRAIN_TUNDRA ) then
		return true;
	end

	return false;
end

function IsValidMelt(plot)

	local plotType = plot:GetPlotType();
	local terrainType = plot:GetTerrainType();
	local featureType = plot:GetFeatureType();

	if ( featureType == FeatureTypes.FEATURE_ICE ) then
		return true;
	end

	if ( plotType == PlotTypes.PLOT_MOUNTAIN ) then
		return false;
	elseif ( plotType == PlotTypes.PLOT_OCEAN ) then
		return false;
	end

    if ( plot:IsCity() ) then
		return false;
	end
	
	if (featureType > 5 ) then
		return false; 
	end

	if ( terrainType == TerrainTypes.TERRAIN_SNOW ) then
		return true;
	end

	return false;
end