-- Reforestation
-- Author: FramedArchitecture
-- DateCreated: 11/9/2012
--------------------------------------------------------------
local gReforestTech			= "TECH_FERTILIZER"
local gForestResources		= {}	
local gResourceChance		= 7
local iReforestInitialized	= nil

function OnTechResearched(iTeam, iTech, iChange)
	if iReforestInitialized == 0 then
		if (iTech == GameInfoTypes[gReforestTech]) then
			iReforestInitialized = 1
		end
	end
end
GameEvents.TeamTechResearched.Add(OnTechResearched);

function OnPlayerTurn(iPlayer)
	if (iPlayer > 0) then return end
	if (iReforestInitialized == 1) then PlantForest() end
end
GameEvents.PlayerDoTurn.Add(OnPlayerTurn)

function PlantForest()
	local iChange = 0
	for plotLoop = 0, Map.GetNumPlots() - 1, 1 do
		local plot = Map.GetPlotByIndex(plotLoop);
		if IsValidReforest(plot) then
			plot:SetImprovementType(-1);
			plot:SetFeatureType(FeatureTypes.FEATURE_FOREST, -1);
			if ( math.random(1, 100) <= gResourceChance ) then
				local resourceID = GameInfo.Resources[ gForestResources[math.random(#gForestResources)] ].ID
				if resourceID then
					plot:SetResourceType(resourceID, 1);
				end
			end
			iChange = iChange + 1;
		end
	end
	--print ("Forests Planted: " .. tostring(iChange));
end

function IsValidReforest(plot)
	local plotType = plot:GetPlotType();
	local terrainType = plot:GetTerrainType();
	local featureType = plot:GetFeatureType();
	local improvementType = plot:GetImprovementType();
	if plotType == PlotTypes.PLOT_OCEAN then return false end
	if plotType == PlotTypes.PLOT_MOUNTAIN then return false end
    if plot:IsCity() then return false end
	if ( terrainType == TerrainTypes.TERRAIN_PLAINS or terrainType == TerrainTypes.TERRAIN_SNOW ) then return false end
	if ( improvementType == GameInfoTypes["IMPROVEMENT_PLANT_FOREST"] ) then return true end
	return false;
end

function InitializeReforest()
	if (iReforestInitialized == nil) then
		local techType = GameInfoTypes[gReforestTech]
		if techType then
			iReforestInitialized = 0
			for iPlayerLoop = 0, GameDefines.MAX_CIV_PLAYERS-1, 1 do
				if Teams[Players[iPlayerLoop]:GetTeam()]:IsHasTech(techType) then	
					iReforestInitialized = 1
					break;
				end
			end
			for row in GameInfo.Resource_FeatureBooleans( "FeatureType = 'FEATURE_FOREST'" ) do
				table.insert(gForestResources, row.ResourceType)
			end
			print("-- Reforestation Initialized --")
		end
	end
end
InitializeReforest();