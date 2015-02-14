if(Game.GetCustomOption("GAMEOPTION_CCTP_ORDER") == 0) then
	return;
end
-- OrderControl
-- Author: gyogen(modified from Framed Architect's code)
-- DateCreated: 11/9/2014 4:30:57 PM
--------------------------------------------------------------
PlayerClass				= getmetatable(Players[0]).__index
LuaEvents.Player		= LuaEvents.Player		or function(player)	 end
LuaEvents.City			= LuaEvents.City		or function(city)	 end
local gCrimeHandicap				= (PreGame.GetHandicap(0) > 0) and PreGame.GetHandicap(0) or 1;
local condition				= "YieldType = 'YIELD_ORDER'"
local gOrderTourismEra		= GameInfoTypes["ERA_MEDIEVAL"];
local gOrderUnHappy			= GameDefines["ORDER_UNHAPPY_MOD"] + gCrimeHandicap;
local orderYieldType		= GameInfo.Yields["YIELD_ORDER"].Type
-------------------------------------------------------------------------------------------
function PlayerClass.GetCivOrderIndex(pPlayer)
	if(Game.GetCustomOption("GAMEOPTION_CCTP_ORDER") == 0) then
	return 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	end
	local g_OrderIndex = 0
	local iOrderTechModifier = GetTechOrder(pPlayer);
	local iOrderPolicyModifier = GetPolicyOrder(pPlayer);
	local iCivOrderModifier = GetCivOrderMod(pPlayer);
	local iUnHappyOrderPenalty = 0 
	local iDifficultyPenalty = 0
	
		if pPlayer:IsGoldenAge() then
			iUnHappyOrderPenalty = (2 * gOrderUnHappy)
		elseif pPlayer:IsEmpireUnhappy() then
			iUnHappyOrderPenalty = -gOrderUnHappy
		elseif pPlayer:IsEmpireVeryUnhappy() then
			iUnHappyOrderPenalty = -(2 * gOrderUnHappy)
		else iUnHappyOrderPenalty = 0
		end
	g_OrderIndex = iOrderTechModifier + iOrderPolicyModifier + iCivOrderModifier + iUnHappyOrderPenalty 

	if (g_OrderIndex < 0) then
		iDifficultyPenalty = -gCrimeHandicap
		g_OrderIndex = g_OrderIndex + iDifficultyPenalty
	end

	return g_OrderIndex, iOrderTechModifier, iOrderPolicyModifier, iCivOrderModifier, iUnHappyOrderPenalty, iDifficultyPenalty
end
LuaEvents.Player.Add( PlayerClass.GetCivOrderIndex )
--------------------------------------------------------------------------------------------
function GetCityOrder(pCity)
	citaDam = pCity:GetDamage();
	print("CITYDAMAGE", citaDam);
	if(Game.GetCustomOption("GAMEOPTION_CCTP_ORDER") == 0) then
	return 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	end
	if pCity:IsResistance() or pCity:IsRazing() then
		return 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	else
		local pPlayer = Players[pCity:GetOwner()]
		local iCityOrder = 0
		local iPopOrder = -math.ceil( math.log( gCrimeHandicap * pCity:GetPopulation() ) )
		local iTourismOrder = 0; 
		local iBuildingOrder = GetBuildingOrderMod(pCity);
		local iSpecialistOrder = GetSpecialistOrderMod(pCity);
		local iImprovedOrder = GetImprovementOrderMod(pCity);
		local iProcessOrder = GetProcessOrderMod(pCity);
		local iGarrisonOrder = GetGarrisonOrderMod(pCity);
		local iDecisionOrder = GetDecisionOrderMod(pPlayer);
		local iUnHappyCityPenalty = 0; 
		local g_OrderIndex = pPlayer:GetCivOrderIndex();
		local iCityOrderModifier = (g_OrderIndex / 100) 
		local iEraModifier = GetEraModifier(pPlayer);

		if pPlayer:GetCurrentEra() > gOrderTourismEra then
			iTourismOrder = pCity:GetBaseTourism(); 
			if iTourismOrder < 5 then 
				iTourismOrder = 1
			elseif iTourismOrder <= 60 then
				iTourismOrder = -math.floor(iTourismOrder / 6) 
			elseif iTourismOrder > 60 then
				iTourismOrder = -10
			end
		else iTourismOrder = 0
		end
		if pCity:GetLocalHappiness() > 5 then
			iUnHappyCityPenalty = (2 * gOrderUnHappy)
		elseif pCity:GetLocalHappiness() < -5 then
			iUnHappyCityPenalty = -gOrderUnHappy
		elseif pCity:GetLocalHappiness() < -10 then
			iUnHappyCityPenalty = -(2 * gOrderUnHappy)
		else iUnHappyCityPenalty = 0
		end
		

		iCityOrder = iPopOrder + iTourismOrder + iBuildingOrder + iSpecialistOrder + iImprovedOrder + iProcessOrder + iGarrisonOrder + iDecisionOrder + iUnHappyCityPenalty + iEraModifier

		if (iCityOrderModifier ~= 0) then
			iCityOrderModifier = math.ceil(math.abs(iCityOrder) * iCityOrderModifier)
			iCityOrder = iCityOrder + iCityOrderModifier
		end
		
		return iCityOrder, iPopOrder, iTourismOrder, iBuildingOrder, iSpecialistOrder, iImprovedOrder, iProcessOrder, iGarrisonOrder, iDecisionOrder, iUnHappyCityPenalty, iEraModifier
	end

end
LuaEvents.City.Add( GetCityOrder )
--------------------------------------------------------------------
function IsCrime(pCity)
	if(Game.GetCustomOption("GAMEOPTION_CCTP_ORDER") == 0) then
	return false
	end
	local iCrimeIndex = GetCityOrder(pCity)
		if iCrimeIndex < 0 then
			return true
		end
	return false;
end
LuaEvents.City.Add( IsCrime )
--------------------------------------------------------------------
function GetOrderTooltip(pCity, bCondensed)
	if(Game.GetCustomOption("GAMEOPTION_CCTP_ORDER") == 0) then
	strOrderToolTip = strOrderToolTip .. Locale.ConvertTextKey("TXT_KEY_NO_ORDER_INFO");
	strOrderToolTip = strOrderToolTip .. "[NEWLINE][NEWLINE]";
	return
	end
	local strOrderToolTip = "";
	local strOrderTotal = "";

	if (not OptionsManager.IsNoBasicHelp() and not bCondensed) then
		strOrderToolTip = strOrderToolTip .. Locale.ConvertTextKey("TXT_KEY_PM_ORDER_HELP_INFO");
		strOrderToolTip = strOrderToolTip .. "[NEWLINE][NEWLINE]";
	end

		local iCityOrder, 
			iPopOrder,  
			iTourismOrder, 
			iBuildingOrder,
			iSpecialistOrder, 
			iImprovedOrder,
			iProcessOrder,
			iGarrisonOrder,
			iDecisionOrder,
			iUnHappyCityPenalty,
			iEraModifier = GetCityOrder(pCity);
	local bOrderFirst = true;
	-- Order from Pop
	if (iPopOrder ~= 0) then
		-- Spacing
		if (bOrderFirst) then
			bOrderFirst = false;
		else
			strOrderToolTip = strOrderToolTip .. "[NEWLINE]";
		end

		if iPopOrder < 0 then 
			strOrderTotal = Locale.ConvertTextKey("TXT_KEY_PM_DISORDER_FROM_POP", iPopOrder)
		else
			strOrderTotal = Locale.ConvertTextKey("TXT_KEY_PM_ORDER_FROM_POP", iPopOrder)
		end
		strOrderToolTip = strOrderToolTip .. "[ICON_BULLET]" .. strOrderTotal;
	end

	-- Order from Tourism
	if (iTourismOrder ~= 0) then
		-- Spacing
		if (bOrderFirst) then
			bOrderFirst = false;
		else
			strOrderToolTip = strOrderToolTip .. "[NEWLINE]";
		end

		if iTourismOrder < 0 then 
			strOrderTotal = Locale.ConvertTextKey("TXT_KEY_PM_DISORDER_FROM_TOURISM", iTourismOrder)
		else
			strOrderTotal = Locale.ConvertTextKey("TXT_KEY_PM_ORDER_FROM_TOURISM", iTourismOrder)
		end
		strOrderToolTip = strOrderToolTip .. "[ICON_BULLET]" .. strOrderTotal;
	end

	-- ORDER from Buildings
	if (iBuildingOrder ~= 0) then
		-- Spacing
		if (bOrderFirst) then
			bOrderFirst = false;
		else
			strOrderToolTip = strOrderToolTip .. "[NEWLINE]";
		end

		if iBuildingOrder < 0 then 
			strOrderTotal = Locale.ConvertTextKey("TXT_KEY_PM_DISORDER_FROM_BUILDINGS", iBuildingOrder)
		else
			strOrderTotal = Locale.ConvertTextKey("TXT_KEY_PM_ORDER_FROM_BUILDINGS", iBuildingOrder)
		end
		strOrderToolTip = strOrderToolTip .. "[ICON_BULLET]" .. strOrderTotal;
	end
	
	-- ORDER from Specialists
	if (iSpecialistOrder ~= 0) then
		-- Spacing
		if (bOrderFirst) then
			bOrderFirst = false;
		else
			strOrderToolTip = strOrderToolTip .. "[NEWLINE]";
		end

		strOrderTotal = Locale.ConvertTextKey("TXT_KEY_PM_ORDER_FROM_SPECIALISTS", iSpecialistOrder)
		strOrderToolTip = strOrderToolTip .. "[ICON_BULLET]" .. strOrderTotal;
	end

	-- ORDER from Improvements
	if (iImprovedOrder ~= 0) then
		-- Spacing
		if (bOrderFirst) then
			bOrderFirst = false;
		else
			strOrderToolTip = strOrderToolTip .. "[NEWLINE]";
		end
		
		if iImprovedOrder < 0 then 
			strOrderTotal = Locale.ConvertTextKey("TXT_KEY_PM_DISORDER_FROM_IMPOVEMENTS", iImprovedOrder)
		else
			strOrderTotal = Locale.ConvertTextKey("TXT_KEY_PM_ORDER_FROM_IMPROVEMENTS", iImprovedOrder)
		end
		strOrderToolTip = strOrderToolTip .. "[ICON_BULLET]" .. strOrderTotal;
	end


	-- ORDER from Processes
	if (iProcessOrder ~= 0) then
		-- Spacing
		if (bOrderFirst) then
			bOrderFirst = false;
		else
			strOrderToolTip = strOrderToolTip .. "[NEWLINE]";
		end
		
		if iProcessOrder < 0 then 
			strOrderTotal = Locale.ConvertTextKey("TXT_KEY_PM_DISORDER_FROM_PROCESSES", iProcessOrder)
		else
			strOrderTotal = Locale.ConvertTextKey("TXT_KEY_PM_ORDER_FROM_PROCESSES", iProcessOrder)
		end
		strOrderToolTip = strOrderToolTip .. "[ICON_BULLET]" .. strOrderTotal;
	end
	-- ORDER from Garrison
	if (iGarrisonOrder ~= 0) then
		-- Spacing
		if (bOrderFirst) then
			bOrderFirst = false;
		else
			strOrderToolTip = strOrderToolTip .. "[NEWLINE]";
		end
		
		if iGarrisonOrder > 0 then 
		
			strOrderTotal = Locale.ConvertTextKey("TXT_KEY_PM_ORDER_FROM_GARRISON", iGarrisonOrder)
		end
		strOrderToolTip = strOrderToolTip .. "[ICON_BULLET]" .. strOrderTotal;
	end
	-- ORDER from decisions
	if (iDecisionOrder ~= 0) then
		-- Spacing
		if (bOrderFirst) then
			bOrderFirst = false;
		else
			strOrderToolTip = strOrderToolTip .. "[NEWLINE]";
		end
		
		if iDecisionOrder < 0 then 
			strOrderTotal = Locale.ConvertTextKey("TXT_KEY_PM_DISORDER_FROM_TERRAIN", iDecisionOrder)
		else
			strOrderTotal = Locale.ConvertTextKey("TXT_KEY_PM_ORDER_FROM_TERRAIN", iDecisionOrder)
		end
		strOrderToolTip = strOrderToolTip .. "[ICON_BULLET]" .. strOrderTotal;
	end
	-- ORDER from Unhappy modifier
	if (iUnHappyCityPenalty ~= 0) then
		-- Spacing
		if (bOrderFirst) then
			bOrderFirst = false;
		else
			strOrderToolTip = strOrderToolTip .. "[NEWLINE]";
		end
		
		if iUnHappyCityPenalty < 0 then 
			strOrderTotal = Locale.ConvertTextKey("TXT_KEY_PM_DISORDER_FROM_UNHAPPY", iUnHappyCityPenalty)
		else
			strOrderTotal = Locale.ConvertTextKey("TXT_KEY_PM_ORDER_FROM_UNHAPPY", iUnHappyCityPenalty)
		end
		strOrderToolTip = strOrderToolTip .. "[ICON_BULLET]" .. strOrderTotal;
	end

		-- ORDER from Era modifier
	if (iEraModifier ~= 0) then
		-- Spacing
		if (bOrderFirst) then
			bOrderFirst = false;
		else
			strOrderToolTip = strOrderToolTip .. "[NEWLINE]";
		end
		
		if iEraModifier > 0 then 
			strOrderTotal = Locale.ConvertTextKey("TXT_KEY_PM_ORDER_FROM_ERA", iEraModifier)
		end
		strOrderToolTip = strOrderToolTip .. "[ICON_BULLET]" .. strOrderTotal;
	end
	local strTally;
	if (iCityOrder < 0) then
		strTally = Locale.ConvertTextKey("TXT_KEY_YIELD_TOTAL_NEGATIVE", iCityOrder, "[ICON_ORDER]");
	else
		strTally = Locale.ConvertTextKey("TXT_KEY_YIELD_TOTAL", iCityOrder, "[ICON_ORDER]");
	end

	strOrderToolTip = strOrderToolTip .. "[NEWLINE]----------------";
	strOrderToolTip = strOrderToolTip .. "[NEWLINE]" .. strTally;

	return strOrderToolTip;
end
-----------------------------------------------------------------
function GetEraModifier(pPlayer)
	local iCurrEra = pPlayer:GetCurrentEra();
	local iEraModifier
	if iCurrEra == 0 then
		iEraModifier = 0
	elseif iCurrEra == 1 then
		iEraModifier = 5
	elseif iCurrEra == 2 then
		iEraModifier = 12
	elseif iCurrEra == 3 then
		iEraModifier = 10
	elseif iCurrEra == 4 then
		iEraModifier = 8
	elseif iCurrEra == 5 then
		iEraModifier = 5
	elseif iCurrEra == 6 then
		iEraModifier = 3
	elseif iCurrEra == 7 then
		iEraModifier = 2
	elseif iCurrEra == 8 then
		iEraModifier = 0
	end
	return iEraModifier;
end
--------------------------------------------------------------------	
function GetBuildingOrderMod(pCity)
	local iOrder = 0
	
	for row in GameInfo.Building_YieldChanges(condition) do
		if pCity:IsHasBuilding(GameInfoTypes[row.BuildingType]) then
			iOrder = iOrder + row.Yield
		end
	end

	--increases building health based on policy choices
	local player = Players[pCity:GetOwner()]
	for row in GameInfo.Policy_BuildingClassOrderChanges() do
		local policy = GameInfo.Policies[row.PolicyType]
		if policy and player:HasPolicy(policy.ID) then
			local iYield = row.Yield
			local pClassType = GameInfo.BuildingClasses[row.BuildingClassType].Type
			if pClassType then
				for row in GameInfo.Buildings("BuildingClass='" .. pClassType .. "'") do
					if ( pCity:IsHasBuilding(row.ID) ) then
						iOrder = iOrder + iYield
					end
				end
			end
		end
	end

	return iOrder;
end
--------------------------------------------------------------------
--------------------------------------------------------------------
function GetSpecialistOrderMod(pCity)
	local iOrder = 0
	for row in GameInfo.SpecialistYields("YieldType='" .. orderYieldType .. "'") do
		local iCount = pCity:GetSpecialistCount( GameInfoTypes[row.SpecialistType] )
		if iCount >  0 then
			iOrder = iOrder + (iCount * row.Yield)
		end
	end
	return iOrder;
end
--------------------------------------------------------------------
function GetOrderFromSpecialist(specialistType)
	for row in GameInfo.SpecialistYields("SpecialistType='" .. specialistType .. "'") do
		if row.YieldType == orderYieldType then
			return row.Yield
		end
	end
	return 0;
end
--------------------------------------------------------------------
function GetImprovementOrderMod(pCity)
	local iOrder = 0
	
	local n = pCity:GetNumCityPlots() - 1
	for row in GameInfo.Improvement_Yields(condition) do
		for i = 1, n, 1 do
			local plot = pCity:GetCityIndexPlot( i );
			if plot and pCity:IsWorkingPlot( plot ) then
				if plot:GetImprovementType() == GameInfoTypes[row.ImprovementType] then
					iOrder = iOrder + row.Yield
				end
			end
		end
	end
	return iOrder;
end
--------------------------------------------------------------------
function GetProcessOrderMod(pCity)
	local iOrder = 0
	for row in GameInfo.Process_ProductionYields() do
		if row.ProcessType == "PROCESS_ORDER"
		then processOrder = row.Yield
		end
	end	
	for process in GameInfo.Processes() do
		local processID = process.ID;
		if process.Type == "PROCESS_ORDER" then
			if pCity:IsProductionProcess(processID) then
			iOrder = iOrder + processOrder
			print("processOrder", processOrder);
			print("iOrder", iOrder);
			end
		end
	end
	return iOrder;
	
end
-----------------------------------------------------------------
function GetGarrisonOrderMod(pCity)
	local iOrder = 0
	if (pCity:GetGarrisonedUnit() ~= nil) then
		iOrder = 1
	end
	return iOrder;
end
--------------------------------------------------------------------
function GetTechOrder(pPlayer)
	local pTeam = Teams[pPlayer:GetTeam()]
	local iOrder = 0
	for row in GameInfo.Technology_Order() do
		local iYield = row.Yield
		local techInfo = GameInfo.Technologies[row.TechType]
		if techInfo then
			if ( pTeam:IsHasTech(techInfo.ID) ) then
				iOrder = iOrder + iYield
			end
		end
	end
	return iOrder;
end
--------------------------------------------------------------------
function GetPolicyOrder(pPlayer)
	local iOrder = 0
	for row in GameInfo.PolicyBranch_Order() do
		local iYield = row.Yield
		local branchInfo = GameInfo.PolicyBranchTypes[row.PolicyBranchType]
		if branchInfo then
			for row in GameInfo.Policies("PolicyBranchType='" .. branchInfo.Type .. "'") do
				if pPlayer:HasPolicy(row.ID) and not pPlayer:IsPolicyBlocked(row.ID) then 
					iOrder = iOrder + iYield
				end
			end
		end
	end
	return iOrder;
end
--------------------------------------------------------------------
function GetDecisionOrderMod(pPlayer)
	local iResOrderID = GameInfoTypes["RESOURCE_ORDER"];
	iOrder = pPlayer:GetNumResourceTotal(iResOrderID, true);
	return iOrder;
end
---------------------------------------------------------------------
function GetCivOrderMod(pPlayer)
	local iResOrderID = GameInfoTypes["RESOURCE_CIV_ORDER"];
	iOrder = pPlayer:GetNumResourceTotal(iResOrderID, true);
	return iOrder;
end
----------------------------------------------------------------------
function AiOrderControl(iPlayer)
	local g_AiOrder
	local pPlayer = Players[iPlayer]
	local pTeam = Teams[pPlayer:GetTeam()];
	if (pPlayer:IsHuman() or pTeam:IsAtWar()) then return
	end

	for pCity in pPlayer:Cities() do
		local iCityOrder = GetCityOrder(pCity);

		if iCityOrder < -10 then
			g_AiOrder = 1
			pCity:PushOrder (OrderTypes.ORDER_MAINTAIN, GameInfo.Processes["PROCESS_ORDER"].ID, -1, 0, false, false);
		elseif (iCityOrder > 0 and g_AiOrder == 1) then
			pCity:ChooseProduction();
		end
	end
end


