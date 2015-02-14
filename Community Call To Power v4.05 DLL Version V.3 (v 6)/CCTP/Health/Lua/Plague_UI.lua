-- Plague_UI
-- Author: FramedArchitecture
-- DateCreated: 3/1/2013
--------------------------------------------------------------------
include ("Plague_SaveData.lua");
--------------------------------------------------------------------
-- Global Function Defines
--------------------------------------------------------------------
PlayerClass				= getmetatable(Players[0]).__index
LuaEvents.Player		= LuaEvents.Player		or function(player)	 end
LuaEvents.City			= LuaEvents.City		or function(city)	 end
--------------------------------------------------------------------
-- Local Variables
--------------------------------------------------------------------
local gHandicap				= (PreGame.GetHandicap(0) > 0) and PreGame.GetHandicap(0) or 1;
local gFreshWaterValue		= GameDefines["PLAGUE_BASE_FRESHWATER_HEALTH"] - gHandicap;
local gUnHappyHealth		= GameDefines["PLAGUE_BASE_UNHAPPY_HEALTH"] + gHandicap;
local gPlagueCityAdjUnit	= GameDefines["PLAGUE_CITY_ADJ_DISEASE_UNIT"];
local gTourismEra			= GameInfoTypes["ERA_MEDIEVAL"];
local condition				= "YieldType = 'YIELD_HEALTH'"
local healthYieldType		= GameInfo.Yields["YIELD_HEALTH"].Type
--------------------------------------------------------------------
-- Functions for UI
--------------------------------------------------------------------
function PlayerClass.GetCivHealthIndex(pPlayer)
	local iCivHealthIndex = 0
	local iTraitModifier = GetTraitMod(pPlayer);
	local iTechModifier = GetTechMod(pPlayer);
	local iPolicyModifier = GetPolicyMod(pPlayer);
	local iUnHappyPenalty = 0 
	local iDifficultyPenalty = 0
	local iTradeModifier = GetTradeRouteMod(pPlayer)

	if pPlayer:IsGoldenAge() then
		iUnHappyPenalty = (2 * gUnHappyHealth)
	elseif pPlayer:IsEmpireUnhappy() then
		iUnHappyPenalty = -gUnHappyHealth
	elseif pPlayer:IsEmpireVeryUnhappy() then
		iUnHappyPenalty = -(2 * gUnHappyHealth)
	end

	iCivHealthIndex = iTraitModifier + iTechModifier + iPolicyModifier + iTradeModifier + iUnHappyPenalty

	if (iCivHealthIndex < 0) then
		iDifficultyPenalty = -gHandicap
		iCivHealthIndex = iCivHealthIndex + iDifficultyPenalty
	end

	return iCivHealthIndex, iTraitModifier, iTechModifier, iPolicyModifier, iTradeModifier, iUnHappyPenalty, iDifficultyPenalty
end
LuaEvents.Player.Add( PlayerClass.GetCivHealthIndex )
--------------------------------------------------------------------
function GetCityHealthIndex(pCity)
	if pCity:IsResistance() or pCity:IsRazing() then
		return 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	else
		local iCityHealthIndex = 0
		local iCivHealthMod = ( Players[pCity:GetOwner()]:GetCivHealthIndex() / 100 )
		local iPop = -math.ceil( math.log( gHandicap * pCity:GetPopulation() ) )
		local iWater = GetWaterMod(pCity);
		local iTourism = 0; 
		local iBuilding = GetBuildingHealthMod(pCity);
		local iSpecialist = GetSpecialistHealthMod(pCity);
		local iResource = GetResourceHealthMod(pCity);
		local iImproved = GetImprovementHealthMod(pCity);
		local iFeature = GetFeatureHealthMod(pCity);
		local iProcess = GetProcessHealthMod(pCity);
		local iDisease = GetDiseaseMod(pCity);
		local iBelief = GetBeliefMod(pCity);

		if GetCurrentEra() > gTourismEra then
			iTourism = pCity:GetBaseTourism(); 
			if iTourism < 5 then 
				iTourism = 1
			elseif iTourism <= 60 then
				iTourism = -math.floor(iTourism / 6) 
			elseif iTourism > 60 then
				iTourism = -10
			end
		end

		iCityHealthIndex = iPop + iWater + iTourism + iBuilding + iSpecialist + iResource + iImproved + iFeature + iProcess + iDisease + iBelief
	
		if (iCivHealthMod ~= 0) then
			iCivHealthMod = math.ceil(math.abs(iCityHealthIndex) * iCivHealthMod)
			iCityHealthIndex = iCityHealthIndex + iCivHealthMod
		end
		return iCityHealthIndex, iPop, iWater, iTourism, iBuilding, iSpecialist, iResource, iImproved, iFeature, iProcess, iDisease, iBelief, iCivHealthMod
	end
end
LuaEvents.City.Add( GetCityHealthIndex )
--------------------------------------------------------------------
function GetHealthTooltip(pCity, bCondensed)
	local strHealthToolTip = "";
	local strTotal = "";

	if (not OptionsManager.IsNoBasicHelp() and not bCondensed) then
		strHealthToolTip = strHealthToolTip .. Locale.ConvertTextKey("TXT_KEY_PM_HEALTH_HELP_INFO");
		strHealthToolTip = strHealthToolTip .. "[NEWLINE][NEWLINE]";
	end

	local iCityHealthIndex, 
			iHealthFromPop, 
			iHealthFromWater, 
			iHealthFromTourism, 
			iHealthFromBuildings,
			iHealthFromSpecialists, 
			iHealthFromResources,
			iHealthFromImprovements,
			iHealthFromFeatures, 
			iHealthFromProcesses,
			iHealthFromDiseased, 
			iHealthFromBelief,
			iCivHealthMod = GetCityHealthIndex(pCity);

	local bFirst = true;
	-- Health from Population
	if (iHealthFromPop ~= 0) then
		-- Spacing
		if (bFirst) then
			bFirst = false;
		else
			strHealthToolTip = strHealthToolTip .. "[NEWLINE]";
		end

		if iHealthFromPop < 0 then 
			strTotal = Locale.ConvertTextKey("TXT_KEY_PM_DISEASE_FROM_POP", iHealthFromPop)
		else
			strTotal = Locale.ConvertTextKey("TXT_KEY_PM_HEALTH_FROM_POP", iHealthFromPop)
		end
		strHealthToolTip = strHealthToolTip .. "[ICON_BULLET]" .. strTotal;
	end

	-- Health from Tourism
	if (iHealthFromTourism ~= 0) then
		-- Spacing
		if (bFirst) then
			bFirst = false;
		else
			strHealthToolTip = strHealthToolTip .. "[NEWLINE]";
		end

		if iHealthFromTourism < 0 then 
			strTotal = Locale.ConvertTextKey("TXT_KEY_PM_DISEASE_FROM_TOURISM", iHealthFromTourism)
		else
			strTotal = Locale.ConvertTextKey("TXT_KEY_PM_HEALTH_FROM_TOURISM", iHealthFromTourism)
		end
		strHealthToolTip = strHealthToolTip .. "[ICON_BULLET]" .. strTotal;
	end

	-- Health from Buildings
	if (iHealthFromBuildings ~= 0) then
		-- Spacing
		if (bFirst) then
			bFirst = false;
		else
			strHealthToolTip = strHealthToolTip .. "[NEWLINE]";
		end

		if iHealthFromBuildings < 0 then 
			strTotal = Locale.ConvertTextKey("TXT_KEY_PM_DISEASE_FROM_BUILDINGS", iHealthFromBuildings)
		else
			strTotal = Locale.ConvertTextKey("TXT_KEY_PM_HEALTH_FROM_BUILDINGS", iHealthFromBuildings)
		end
		strHealthToolTip = strHealthToolTip .. "[ICON_BULLET]" .. strTotal;
	end
	
	-- Health from Specialists
	if (iHealthFromSpecialists ~= 0) then
		-- Spacing
		if (bFirst) then
			bFirst = false;
		else
			strHealthToolTip = strHealthToolTip .. "[NEWLINE]";
		end

		strTotal = Locale.ConvertTextKey("TXT_KEY_PM_HEALTH_FROM_SPECIALISTS", iHealthFromSpecialists)
		strHealthToolTip = strHealthToolTip .. "[ICON_BULLET]" .. strTotal;
	end

	-- Health from Resources
	if (iHealthFromResources ~= 0) then
		-- Spacing
		if (bFirst) then
			bFirst = false;
		else
			strHealthToolTip = strHealthToolTip .. "[NEWLINE]";
		end
		
		if iHealthFromResources < 0 then 
			strTotal = Locale.ConvertTextKey("TXT_KEY_PM_DISEASE_FROM_RESOURCES", iHealthFromResources)
		else
			strTotal = Locale.ConvertTextKey("TXT_KEY_PM_HEALTH_FROM_RESOURCES", iHealthFromResources)
		end
		strHealthToolTip = strHealthToolTip .. "[ICON_BULLET]" .. strTotal;
	end

	-- Health from Improvements
	if (iHealthFromImprovements ~= 0) then
		-- Spacing
		if (bFirst) then
			bFirst = false;
		else
			strHealthToolTip = strHealthToolTip .. "[NEWLINE]";
		end
		
		if iHealthFromImprovements < 0 then 
			strTotal = Locale.ConvertTextKey("TXT_KEY_PM_DISEASE_FROM_IMPOVEMENTS", iHealthFromImprovements)
		else
			strTotal = Locale.ConvertTextKey("TXT_KEY_PM_HEALTH_FROM_IMPROVEMENTS", iHealthFromImprovements)
		end
		strHealthToolTip = strHealthToolTip .. "[ICON_BULLET]" .. strTotal;
	end

	-- Health from Access to Freshwater
	if (iHealthFromWater ~= 0) then
		-- Spacing
		if (bFirst) then
			bFirst = false;
		else
			strHealthToolTip = strHealthToolTip .. "[NEWLINE]";
		end
		
		if iHealthFromWater < 0 then 
			strTotal = Locale.ConvertTextKey("TXT_KEY_PM_HEALTH_FROM_NO_WATER", iHealthFromWater)
		else
			strTotal = Locale.ConvertTextKey("TXT_KEY_PM_HEALTH_FROM_WATER", iHealthFromWater)
		end
		strHealthToolTip = strHealthToolTip .. "[ICON_BULLET]" .. strTotal;
	end

	-- Health from Features
	if (iHealthFromFeatures ~= 0) then
		-- Spacing
		if (bFirst) then
			bFirst = false;
		else
			strHealthToolTip = strHealthToolTip .. "[NEWLINE]";
		end
		
		if iHealthFromFeatures < 0 then 
			strTotal = Locale.ConvertTextKey("TXT_KEY_PM_DISEASE_FROM_FEATURES", iHealthFromFeatures)
		else
			strTotal = Locale.ConvertTextKey("TXT_KEY_PM_HEALTH_FROM_FEATURES", iHealthFromFeatures)
		end
		strHealthToolTip = strHealthToolTip .. "[ICON_BULLET]" .. strTotal;
	end

	-- Health from Processes
	if (iHealthFromProcesses ~= 0) then
		-- Spacing
		if (bFirst) then
			bFirst = false;
		else
			strHealthToolTip = strHealthToolTip .. "[NEWLINE]";
		end
		
		if iHealthFromProcesses < 0 then 
			strTotal = Locale.ConvertTextKey("TXT_KEY_PM_DISEASE_FROM_PROCESSES", iHealthFromProcesses)
		else
			strTotal = Locale.ConvertTextKey("TXT_KEY_PM_HEALTH_FROM_PROCESSES", iHealthFromProcesses)
		end
		strHealthToolTip = strHealthToolTip .. "[ICON_BULLET]" .. strTotal;
	end


	-- Health from nearby Diseased Units
	if (iHealthFromDiseased < 0) then
		-- Spacing
		if (bFirst) then
			bFirst = false;
		else
			strHealthToolTip = strHealthToolTip .. "[NEWLINE]";
		end
		strTotal = Locale.ConvertTextKey("TXT_KEY_PM_DISEASE_FROM_UNITS", iHealthFromDiseased)
		strHealthToolTip = strHealthToolTip .. "[ICON_BULLET]" .. strTotal;
	end

	-- Health from Belief
	if (iHealthFromBelief ~= 0) then
		-- Spacing
		if (bFirst) then
			bFirst = false;
		else
			strHealthToolTip = strHealthToolTip .. "[NEWLINE]";
		end
		
		if iHealthFromBelief < 0 then 
			strTotal = Locale.ConvertTextKey("TXT_KEY_PM_DISEASE_FROM_BELIEF", iHealthFromBelief)
		else
			strTotal = Locale.ConvertTextKey("TXT_KEY_PM_HEALTH_FROM_BELIEF", iHealthFromBelief)
		end
		strHealthToolTip = strHealthToolTip .. "[ICON_BULLET]" .. strTotal;
	end

	-- Health from Civ modifier
	if (iCivHealthMod ~= 0) then
		-- Spacing
		if (bFirst) then
			bFirst = false;
		else
			strHealthToolTip = strHealthToolTip .. "[NEWLINE]";
		end
		
		if iCivHealthMod < 0 then 
			strTotal = Locale.ConvertTextKey("TXT_KEY_PM_HEALTH_LOST_CIVMOD", iCivHealthMod)
		else
			strTotal = Locale.ConvertTextKey("TXT_KEY_PM_HEALTH_GAIN_CIVMOD", iCivHealthMod)
		end
		strHealthToolTip = strHealthToolTip .. "[ICON_BULLET]" .. strTotal;
	end

	local strTally;
	if (iCityHealthIndex < 0) then
		strTally = Locale.ConvertTextKey("TXT_KEY_YIELD_TOTAL_NEGATIVE", iCityHealthIndex, "[ICON_HEALTH]");
	else
		strTally = Locale.ConvertTextKey("TXT_KEY_YIELD_TOTAL", iCityHealthIndex, "[ICON_HEALTH]");
	end

	strHealthToolTip = strHealthToolTip .. "[NEWLINE]----------------";
	strHealthToolTip = strHealthToolTip .. "[NEWLINE]" .. strTally;

	return strHealthToolTip;
end
--------------------------------------------------------------------
function IsPlagued(pCity)
	local g_PlagueCities = GetPlagueData();
	if (#g_PlagueCities > 0) then
		local iX, iY = pCity:GetX(), pCity:GetY()
		for _, v in ipairs(g_PlagueCities) do
			if (v.turns > 0) then
				if (iX == v.X) and (iY == v.Y) then
					return true;
				end
			end
		end
	end
	return false;
end
LuaEvents.City.Add( IsPlagued )
--------------------------------------------------------------------
function GetCityRiskString(iHealth)
	local strRisk = "TXT_KEY_CH_RISK_AVERAGE";
	local plagueThreshold = GetEraThresholds();
	local iSickestCity = GetLowestCurrentHealth();
	local iSickCityThreshold = GetSickThreshold();
	
	if (iHealth > plagueThreshold) then
		strRisk = "TXT_KEY_CH_RISK_NONE"
	elseif (iHealth <= plagueThreshold) and (iHealth > 0) then
		strRisk = "TXT_KEY_CH_RISK_LOW"
	elseif (iHealth == iSickestCity) then
		strRisk = "TXT_KEY_CH_RISK_EXTREME"
	elseif (iHealth <= 0) then
		if (iHealth <= iSickCityThreshold) then
			strRisk = "TXT_KEY_CH_RISK_HIGH"
		end
	end
	return strRisk;
end
LuaEvents.City.Add( GetCityRiskString )
--------------------------------------------------------------------
function GetEraThresholds()
	local iEra = GetCurrentEra();
	local pEraType = GameInfo.Eras[iEra].Type  
	if not bHistoricAccuracy then 
		pEraType = GameInfo.Eras["ERA_RENAISSANCE"].Type
	end
	for row in GameInfo.Era_PlagueDefines("EraType='" .. pEraType .. "'") do
		return row.HealthMin, row.MaxRange, row.MaxDuration
	end
end
--------------------------------------------------------------------
function GetWaterMod(pCity)
	local iHealth = 0;

	local bFreshWater = false
	local plot = pCity:Plot();
	if HasAqueduct(pCity) or plot:IsFreshWater() then
		bFreshWater = true
	end
	if bFreshWater then
		iHealth = gFreshWaterValue
	else
		local iPop = pCity:GetPopulation();
		if iPop < 5 then
			iHealth = -iPop
		else
			iHealth = -(math.ceil((iPop - 4) / 2) + 4 )
		end
	end
	return iHealth;
end
--------------------------------------------------------------------
function HasAqueduct(pCity)
	local buildingInfo = GameInfo.Buildings["BUILDING_AQUEDUCT"]
	if buildingInfo then
		return pCity:IsHasBuilding(buildingInfo.ID);
	end
	return false
end
--------------------------------------------------------------------
function GetBuildingHealthMod(pCity)
	local iHealth = 0
	
	for row in GameInfo.Building_YieldChanges(condition) do
		if pCity:IsHasBuilding(GameInfoTypes[row.BuildingType]) then
			iHealth = iHealth + row.Yield
		end
	end

	--increases building health based on policy choices
	local player = Players[pCity:GetOwner()]
	for row in GameInfo.Policy_BuildingClassHealthChanges() do
		local policy = GameInfo.Policies[row.PolicyType]
		if policy and player:HasPolicy(policy.ID) then
			local iYield = row.Yield
			local pClassType = GameInfo.BuildingClasses[row.BuildingClassType].Type
			if pClassType then
				for row in GameInfo.Buildings("BuildingClass='" .. pClassType .. "'") do
					if ( pCity:IsHasBuilding(row.ID) ) then
						iHealth = iHealth + iYield
					end
				end
			end
		end
	end

	return iHealth;
end
--------------------------------------------------------------------
function GetSpecialistHealthMod(pCity)
	local pPlayer = Players[pCity:GetOwner()]
	local iHealth = 0
	local specialist;
	for row in GameInfo.SpecialistYields("YieldType='" .. healthYieldType .. "'") do
		specialist = row.SpecialistType
		local iCount = pCity:GetSpecialistCount( GameInfoTypes[row.SpecialistType] )
		if iCount >  0 then
			iHealth = iHealth + (iCount * row.Yield)
		end
	end
	for row in GameInfo.Policy_SpecialistExtraYields(condition) do
		local iPolicy =  GameInfo.Policies[row.PolicyType];
		local iYield = row.Yield
		if pPlayer:HasPolicy(iPolicy.ID) then 
			local iCount = pCity:GetSpecialistCount( GameInfoTypes[specialist] )
				if iCount >  0 then
					iHealth = iHealth + (iCount * iYield)
				end
			
		end
	end
	for row in GameInfo.Building_SpecialistYieldChanges(condition) do 
		if row.SpecialistType == specialist then
			iBuildingID = GameInfoTypes[row.BuildingType];
			if ( pCity:IsHasBuilding(iBuildingID) ) then
				local iCount = pCity:GetSpecialistCount( GameInfoTypes[specialist] )
				if iCount >  0 then
					iHealth = iHealth + (iCount * row.Yield)
				end
			end
		end
	end
	return iHealth;
end
--------------------------------------------------------------------
function GetHealthFromSpecialist(specialistType)
	for row in GameInfo.SpecialistYields("SpecialistType='" .. specialistType .. "'") do
		if row.YieldType == healthYieldType then
			return row.Yield
		end
	end
	return 0;
end
--------------------------------------------------------------------
function GetResourceHealthMod(pCity)
	local iHealth = 0

	local teamID = Players[pCity:GetOwner()]:GetTeam();
	local n = pCity:GetNumCityPlots() - 1
	for row in GameInfo.Improvement_ResourceType_Yields(condition) do
		for i = 1, n, 1 do
			local plot = pCity:GetCityIndexPlot( i );
			if plot and pCity:IsWorkingPlot( plot ) then
				if plot:GetResourceType(teamID) == GameInfoTypes[row.ResourceType] then
					if plot:GetImprovementType() == GameInfoTypes[row.ImprovementType] then
						iHealth = iHealth + row.Yield
					end
				end
			end
		end
	end
	return iHealth;
end
--------------------------------------------------------------------
function GetImprovementHealthMod(pCity)
	local pPlayer = Players[pCity:GetOwner()];
	local pTeam = Teams[pPlayer:GetTeam()]
	local iHealth = 0
	local n = pCity:GetNumCityPlots() - 1
	for row in GameInfo.Improvement_Yields(condition) do
		for i = 1, n, 1 do
			local plot = pCity:GetCityIndexPlot( i );
			if plot and pCity:IsWorkingPlot( plot ) then
				if plot:GetImprovementType() == GameInfoTypes[row.ImprovementType] then
					
					iHealth = iHealth + row.Yield
				end
			end
		end
	end
	for row in GameInfo.Improvement_TechYieldChanges(condition) do
		for i = 1, n, 1 do
			local plot = pCity:GetCityIndexPlot( i );
			if plot and pCity:IsWorkingPlot( plot ) then
				if plot:GetImprovementType() == GameInfoTypes[row.ImprovementType] then
					local iYield = row.Yield
					local techInfo = GameInfo.Technologies[row.TechType]
					if techInfo then
						if ( pTeam:IsHasTech(techInfo.ID) ) then
							iHealth = iHealth + iYield
						end
					end
				end
			end
		end
	end
	return iHealth;
end
--------------------------------------------------------------------
function GetFeatureHealthMod(pCity)
	local iHealth = 0
	local iX, iY = pCity:GetX(), pCity:GetY()
	for row in GameInfo.Feature_YieldChanges(condition) do
		local featureID = GameInfoTypes[row.FeatureType]
		for i = 0, 5 do
			local adjPlot = Map.PlotDirection(iX, iY, i)
			if adjPlot then
				if (featureID == adjPlot:GetFeatureType()) then
					iHealth = iHealth + row.Yield
				end
			end
		end
	end
	return iHealth;
end
--------------------------------------------------------------------
function GetProcessHealthMod(pCity)
	local iHealth = 0
	for row in GameInfo.Process_ProductionYields() do
		if row.ProcessType == "PROCESS_HEALING"
		then pHealth = row.Yield
		end
	end	
	for process in GameInfo.Processes() do
		local processID = process.ID;
		if process.Type == "PROCESS_HEALING" then
			if pCity:IsProductionProcess(processID) then
			iHealth = iHealth + pHealth
			end
		end
	end
	return iHealth;
	
end
--------------------------------------------------------------------
function GetBeliefMod(pCity)
	local pPlayer = Players[pCity:GetOwner()];
	local iHealth = 0
	if (pPlayer:HasCreatedReligion()) then
		local religionID = pPlayer:GetReligionCreatedByPlayer();
		local locReligion = pCity:GetReligiousMajority();
		if locReligion == religionID then
	
	
			for i,v in ipairs(Game.GetBeliefsInReligion(religionID)) do
				local belief = GameInfo.Beliefs[v];
				if (belief ~= nil) then
					print("belief", belief);
					local beliefType = belief.Type;
					print("beliefType", beliefType);
					for row in GameInfo.Belief_Health() do	
						if row.BeliefType == beliefType then 
							iHealth = iHealth + row.Yield
						end
					end
				end
			end
		end
	end
	return iHealth;
end
--------------------------------------------------------------------
function CalculateHealthYield(plot)
	local iHealth = 0

	local teamID = Game.GetActiveTeam();
	
	if (plot:GetRevealedImprovementType(teamID, false) >= 0) then
		for row in GameInfo.Improvement_Yields(condition) do
			if plot:GetImprovementType() == GameInfoTypes[row.ImprovementType] then
				iHealth = iHealth + row.Yield
			end
		end
	end

	for row in GameInfo.Improvement_ResourceType_Yields(condition) do
		if plot:GetResourceType(teamID) == GameInfoTypes[row.ResourceType] then
			if plot:GetImprovementType() == GameInfoTypes[row.ImprovementType] then
				iHealth = iHealth + row.Yield
			end
		end
	end

	if (plot:GetFeatureType() > -1) then
		if IsAdjacentCity(plot) then
			for row in GameInfo.Feature_YieldChanges(condition) do
				if plot:GetFeatureType() == GameInfoTypes[row.FeatureType] then
					iHealth = iHealth + row.Yield
				end
			end
		end
	end

	return iHealth;
end
--------------------------------------------------------------------
function IsAdjacentCity(plot)
	local iX, iY = plot:GetX(), plot:GetY()
	for i = 0, 5 do
		local adjPlot = Map.PlotDirection(iX, iY, i)
		if adjPlot and adjPlot:IsCity() then
			return true;
		end
	end
	return false;
end
--------------------------------------------------------------------
function GetDiseaseMod(pCity)
	local iX, iY = pCity:GetX(), pCity:GetY()
	local iDiseased = 0
	for i = 0, 5 do
		local adjPlot = Map.PlotDirection(iX, iY, i)
		if adjPlot then
			local adjUnit = adjPlot:GetUnit(0)
			if adjUnit and IsDiseased(adjUnit) then
				iDiseased = iDiseased + 1
			end
		end
	end
	return (iDiseased * gPlagueCityAdjUnit);
end
--------------------------------------------------------------------
function Disease(pUnit, bBoolean)
	pUnit:SetHasPromotion(GameInfo.UnitPromotions.PROMOTION_PLAGUED.ID, bBoolean)
end
--------------------------------------------------------------------
function IsDiseased(pUnit)
	return pUnit:IsHasPromotion(GameInfo.UnitPromotions.PROMOTION_PLAGUED.ID)
end
--------------------------------------------------------------------
function GetTraitType(pPlayer)
	local leaderType = GameInfo.Leaders[pPlayer:GetLeaderType()].Type;
		for row in GameInfo.Leader_Traits( "LeaderType ='" .. leaderType .. "'" ) do
			return GameInfo.Traits[row.TraitType].Type
		end
	return nil;
end
--------------------------------------------------------------------
function GetTraitMod(pPlayer)
	local traitType = GetTraitType(pPlayer)
	if traitType then
		for row in GameInfo.Trait_HealthModifier("TraitType='" .. traitType .. "'") do
			if row.EraPrereq then
				if pPlayer:GetCurrentEra() < GameInfoTypes[row.EraPrereq] then
					return 0;
				end
			end
			return row.HealthModifier
		end
	end
	return 0;
end
--------------------------------------------------------------------
function GetTechMod(pPlayer)
	local pTeam = Teams[pPlayer:GetTeam()]
	local iHealth = 0
	for row in GameInfo.Technology_Health() do
		local iYield = row.Yield
		local techInfo = GameInfo.Technologies[row.TechType]
		if techInfo then
			if ( pTeam:IsHasTech(techInfo.ID) ) then
				iHealth = iHealth + iYield
			end
		end
	end
	return iHealth;
end
--------------------------------------------------------------------
function GetPolicyMod(pPlayer)
	local iHealth = 0
	for row in GameInfo.PolicyBranch_Health() do
		local iYield = row.Yield
		local branchInfo = GameInfo.PolicyBranchTypes[row.PolicyBranchType]
		if branchInfo then
			for row in GameInfo.Policies("PolicyBranchType='" .. branchInfo.Type .. "'") do
				if pPlayer:HasPolicy(row.ID) and not pPlayer:IsPolicyBlocked(row.ID) then 
					iHealth = iHealth + iYield
				end
			end
		end
	end
	
	return iHealth;
end
---------------------------------------------------------------
function GetTradeRouteMod(pPlayer)
	local iHealth = 0
	local routes = pPlayer:GetTradeRoutes()
	
	for i,v in ipairs(routes) do
		if v.FromID ~= v.ToID then
			iHealth = iHealth - 1
		end
	end

	return iHealth;
end
--------------------------------------------------------------------

