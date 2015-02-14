-- Rejunglestation
-- original Author: FramedArchitecture, adjusted by Gilgamesch
-- DateCreated: 11/9/2012
--------------------------------------------------------------
local gRejungleTech			= "TECH_FERTILIZER"
local gJungleResources		= {}	
local gResourceChance		= 7
local iRejungleInitialized	= nil

function OnTechResearched(iTeam, iTech, iChange)
	if iRejungleInitialized == 0 then
		if (iTech == GameInfoTypes[gRejungleTech]) then
			iRejungleInitialized = 1
		end
	end
end
GameEvents.TeamTechResearched.Add(OnTechResearched);

function OnPlayerTurn(iPlayer)
	if (iPlayer > 0) then return end
	if (iRejungleInitialized == 1) then PlantJungle() end
end
GameEvents.PlayerDoTurn.Add(OnPlayerTurn)

function PlantJungle()
	local iChange = 0
	for plotLoop = 0, Map.GetNumPlots() - 1, 1 do
		local plot = Map.GetPlotByIndex(plotLoop);
		if IsValidRejungle(plot) then
			plot:SetImprovementType(-1);
			plot:SetFeatureType(FeatureTypes.FEATURE_JUNGLE, -1);
			if ( math.random(1, 100) <= gResourceChance ) then
				local resourceID = GameInfo.Resources[ gJungleResources[math.random(#gJungleResources)] ].ID
				if resourceID then
					plot:SetResourceType(resourceID, 1);
				end
			end
			iChange = iChange + 1;
		end
	end
	--print ("Jungle Planted: " .. tostring(iChange));
end

function IsValidRejungle(plot)
	local plotType = plot:GetPlotType();
	local terrainType = plot:GetTerrainType();
	local featureType = plot:GetFeatureType();
	local improvementType = plot:GetImprovementType();
	if plotType == PlotTypes.PLOT_OCEAN then return false end
	if plotType == PlotTypes.PLOT_MOUNTAIN then return false end
    if plot:IsCity() then return false end
	if ( terrainType == TerrainTypes.TERRAIN_PLAINS or terrainType == TerrainTypes.TERRAIN_SNOW ) then return false end
	if ( improvementType == GameInfoTypes["IMPROVEMENT_PLANT_JUNGLE"] ) then return true end
	return false;
end

function InitializeRejungle()
	if (iRejungleInitialized == nil) then
		local techType = GameInfoTypes[gRejungleTech]
		if techType then
			iRejungleInitialized = 0
			for iPlayerLoop = 0, GameDefines.MAX_CIV_PLAYERS-1, 1 do
				if Teams[Players[iPlayerLoop]:GetTeam()]:IsHasTech(techType) then	
					iRejungleInitialized = 1
					break;
				end
			end
			for row in GameInfo.Resource_FeatureBooleans( "FeatureType = 'FEATURE_JUNGLE'" ) do
				table.insert(gJungleResources, row.ResourceType)
			end
			print("-- Rejunglestation Initialized --")
		end
	end
end
InitializeRejungle();