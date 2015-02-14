if(Game.GetCustomOption("GAMEOPTION_CCTP_EVENTS") == 0) then
	return;
end
-- CustomEvents
-- Author: Gyogen
-- DateCreated: 10/5/2014 9:01:22 AM
--------------------------------------------------------------

include( "EventOptions.lua" );
include( "EventUtils.lua" );
---------------------------------------------------------------

-----------------------------------------------------------
function FreeSettler()
	print("FreeSettler");
	local ebase = BaseSettlerChance;
	local iRandEvent = Game.Rand(100, "Settler check");

		if (iRandEvent > ebase) then 
			return
		end
	
	local pPlayer = GetRandomCIv();
	print("player", pPlayer);
	local targetCity = pPlayer:GetCapitalCity()
	local iX = targetCity:GetX();
	local iY = targetCity:GetY();	
	local iUnitID = GameInfoTypes["UNIT_SETTLER"];

	unit = pPlayer:InitUnit(iUnitID, iX, iY);
	unit:JumpToNearestValidPlot();
	if (pPlayer:IsHuman()) then
		text = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_SUMMARY_FSETTLER"), targetCity:GetName();
		heading = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_FSETTLER");
     	pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, text, heading, iX, iY);
		
	end
end
----------------------------------------------------------
function NewLuxury()
	print("luxury");
	local ebase = BaseLuxuryChance;
	local iRandEvent = Game.Rand(100, "Luxury check");

		if (iRandEvent > ebase) then 
			return
		end
		
	local plot;
	local iW, iH = Map.GetGridSize();
	local x, y;
	local iChance = 0 
	local apPlots = {}
	local lResources = {}
	local lChance = 0;

	for plotLoop = 0, Map.GetNumPlots() - 1, 1 do
		local plot = Map.GetPlotByIndex(plotLoop);
		if ( IsValidFlood(plot) ) then
			apPlots[iChance] = plot;
			iChance = iChance + 1;
    	end
	end

	
	for resource in GameInfo.Resources("ResourceClassType = 'RESOURCECLASS_LUXURY'") do
		lResources[lChance] = resource.ID;
		lChance = lChance + 1;
	end	
	
	if (iChance > 0) then
		pRand = Game.Rand(iChance, "Choosing random plot");
		lRand = Game.Rand(lChance, "Choosing random luxury");
		local plot = apPlots[pRand];
		local iX = plot:GetX();
		local iY = plot:GetY();	
		local pResource = lResources[lRand]
				if IsValidTile(plot, pResource) then
				plot:SetResourceType(pResource, 1);		
				end

		
			local iPlayerID = Game.GetActivePlayer();
			local pPlayer = Players[iPlayerID];
			if (pPlayer:IsHuman()) then
				if plot:IsRevealed(pPlayer:GetTeam()) then
					text = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_SUMMARY_LUXURYDIS"), pResource;
					heading = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_LUXURYDIS");
					pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, text, heading, iX, iY);
				end
			end
	 end
end
----------------------------------------------------------
function MinedMinerals()
	print("mineral");
	local iChance = 0
	local apPlots = {}
	local ebase = BaseDepletionChance;
	local iRandEvent = Game.Rand(100, "Depletion check");

		if (iRandEvent > ebase) then 
			return
		end
	for plotLoop = 0, Map.GetNumPlots() - 1, 1 do
		local plot = Map.GetPlotByIndex(plotLoop);
		if (plot:GetImprovementType() == GameInfo.Improvements[ "IMPROVEMENT_MINE" ]) then
			apPlots[iChance] = plot;
			iChance = iChance + 1;
    	end
	end

	if (iChance > 0) then
			local iRandChoice = Game.Rand(iChance, "Choosing random plot");
			local targetPlot = apPlots[iRandChoice];
			local iX = targetPlot:GetX();
			local iY = targetPlot:GetY();			
			local mResource = targetPlot:GetResourceType();
			local cEra = EraCheck()
			if (mResource ~= NO_RESOURCE) then
				if cEra > 6 then
					targetPlot:SetResourceType(-1);	
				end
			end
	
		
			local iPlayerID = Game.GetActivePlayer();
			local pPlayer = Players[iPlayerID];
				if (pPlayer:IsHuman()) then
					if plot:IsRevealed(pPlayer:GetTeam()) then
						text = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_SUMMARY_MINEDMIN"), mResource;
						heading = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_MINEDMIN");
						pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, text, heading, iX, iY);
					end
				end
	end
end


---------------------------------------------------------------------

------------------------------------------------------------------------------
function GoldEvent()
	print("GoldEvent");
	local ebase = BaseGoldChance;
	local iRandEvent = Game.Rand(100, "Gold check");

		if (iRandEvent > ebase) then 
			return
		end
	
	local gGold = math.random(10,5000);	
	local pPlayer = GetRandomCIv();
	local cGold = pPlayer:GetGold();
	gGold = gGold + cGold
    pPlayer:SetGold(gGold);
	print("pPlayer", pPlayer);
	if (pPlayer:IsHuman()) then
		text = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_SUMMARY_GOLDEVENT"), gGold;
		heading = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_GOLDEVENT");
     	pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, text, heading);
		
	end
end
-------------------------------------------------------------------------
function MeltdownEvent()
	print("MeltdownEvent");
		local apCities = {}
		local iChance = 0;		
		local plot = Map.GetPlot(x, y)
		for iPlayerLoop = 0, GameDefines.MAX_CIV_PLAYERS-1, 1 do
			local player = Players[iPlayerLoop]
			if (player:IsAlive()) then
				for city in player:Cities() do
					if (city:IsHasBuilding(GameInfo.Buildings[ "BUILDING_NUCLEAR_PLANT" ].ID ) == true) then
						apCities[iChance] = city;
						iChance = iChance + 1;
					end
				end
			end
		end
		if (iChance > 0) then
			local iRandChoice = Game.Rand(iChance, "Choosing random city");
			local targetCity = apCities[iRandChoice];
			local iX = targetCity:GetX();
			local iY = targetCity:GetY();
			local plot = Map.GetPlot(iX, iY)
			local eBase = BaseMeltdownChance;
			local iRandEvent = Game.Rand(100, "Meltdown check");
				if iRandEvent <= eBase then
					targetCity:SetNumRealBuilding( GameInfo.Buildings[ "BUILDING_NUCLEAR_PLANT" ].ID , -1 );
					plot:SetFeatureType(FeatureTypes.FEATURE_FALLOUT, -1);
					local pPlayer = Players[targetCity:GetOwner()];
					if (pPlayer:IsHuman()) then
						text = targetCity:GetName(), Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_SUMMARY_MELTDOWNEVNT");
						heading = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_MELTDOWNEVNT");
						pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, text, heading, iX, iY);

							
					end
				end
		end
	
end
-------------------------------------------------------------------------
function BombingEvent()
	local cEra = EraCheck() 
		if (cEra < 6) then return end
	local eBase = BaseBombingChance
	local iRandEvent = Game.Rand(100, "Bombing check");
		if iRandEvent > eBase then 
			return
		end
	local targetCity = GetRandomCity(cCity)
	local iX = targetCity:GetX();
	local iY = targetCity:GetY();
	local iCurrentProduction = ( targetCity:GetProduction() / BomdEffect );
	local bEffect = Game.Rand(iCurrentProduction, "Bombing effect");
	local bProduction = ( targetCity:GetProduction() - bEffect );
	targetCity:ChangeProduction(bProduction);
	local pPlayer = Players[targetCity:GetOwner()];
	if (pPlayer:IsHuman()) then
		text = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_SUMMARY_BOMBEVNT"),targetCity:GetName(), Locale.ConvertTextKey( "TXT_KEY_NOTIFICATION_SUMMARY_BOMBEVNTEFFECT" );
		heading = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_BOMBEVNT");
     	pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, text, heading, iX, iY);
		
	end
end
-------------------------------------------------------------------------
function EmployementBoom()
	local ebase = BaseEmploymentChance;
	local iRandEvent = Game.Rand(100, "Employment check");

		if (iRandEvent > ebase) then 
			return
		end
	local targetCity = GetRandomCity(cCity)
	local iX = targetCity:GetX();
	local iY = targetCity:GetY();
	local iCurrentProduction = ( targetCity:GetProduction() * 2 );
	local bEffect = Game.Rand(iCurrentProduction, "Boom effect");
	targetCity:ChangeProduction(ncity:GetYieldRate(GameInfo.Yields[ "YIELD_PRODUCTION" ].ID)*boomEffect);
	local pPlayer = Players[targetCity:GetOwner()];
	if (pPlayer:IsHuman()) then
		text = targetCity:GetName(), Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_SUMMARY_BOOMNEVNT");
		heading = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_BOOMNEVNT");
     	pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, text, heading, iX, iY);
			
	end
end

-------------------------------------------------------------------------
function GoldCrash()
	print("GoldCrashEvent");
	local ebase = BaseCrashChance;
	local iRandEvent = Game.Rand(100, "Crash check");

		if (iRandEvent > ebase) then 
			return
		end
	
	local pPlayer = GetRandomCIv();

    pPlayer:ChangeGold( - ( pPlayer:GetGold() * ( math.random( 20,50 ) / 100 ) ) );
	print("pPlayer", pPlayer);
	if (pPlayer:IsHuman()) then
		text = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_SUMMARY_GOLDCRASHEVENT"), gGold;
		heading = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_GOLDCRASHEVENT");
     	pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, text, heading);
		
	end
end

-------------------------------------------------------------------------
function BabyBoom()
	print("Babyboom");
	local ebase = BaseBabyBoomChance;
	local iRandEvent = Game.Rand(100, "Crash check");

		if (iRandEvent > ebase) then 
			return
		end
	local targetCity = GetRandomCity(cCity);
	local iX = targetCity:GetX();
		local iY = targetCity:GetY();
	targetCity:ChangePopulation(math.random(1,3), true);
	local pPlayer = Players[targetCity:GetOwner()];
	if (pPlayer:IsHuman()) then
		text = targetCity:GetName(), Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_SUMMARY_BABYBOOM");
		heading = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_BABYBOOM");
     	pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, text, heading, iX, iY);
		
	end
end
---------------------------------------------------------------------------
function ExodusEvent()
	print("Exodus");
	local ebase = BaseExodusChance;
	local iRandEvent = Game.Rand(100, "Crash check");

		if (iRandEvent > ebase) then 
			return
		end

		local targetCity = GetRandomCity(cCity);
		local iX = targetCity:GetX();
		local iY = targetCity:GetY();
		local ePopulation = targetCity:GetPopulation();
		if ePopulation < 7 then
			targetCity:ChangePopulation(- math.random(1,3), true); 
		elseif ePopulation >= 7 then
			local cPop = (ePopulation / 2);
			targetCity:ChangePopulation(- math.random(2,cPop), true);
			local pPlayer = Players[targetCity:GetOwner()];

			if (pPlayer:IsHuman()) then
				text = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_SUMMARY_EXODUS"), targetCity:GetName();
				heading = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_EXODUS");
     			pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, text, heading, iX, iY);

			
			end
		end
end