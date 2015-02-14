if(Game.GetCustomOption("GAMEOPTION_CCTP_EVENTS") == 0) then
	return;
end
-- TurnChecks
-- Author: gyogen
-- DateCreated: 11/7/2014 10:52:08 AM
--------------------------------------------------------------
include( "EventUtils.lua");




function FarmTurnCheck(iPlayer)
	local iFarmTurn = GetPersistentProperty("FarmTurn") or -1
	local iFarmChoice = GetPersistentProperty("FarmCoice") or -1
	local cityPlayerID = GetPersistentProperty("FarmPlayer") or -1
	if cityPlayerID == -1 then return end
	local pCityPlayer = Players[cityPlayerID]
	local iCityID = GetPersistentProperty("FarmCity");
	local pCity =  pCityPlayer:GetCityByID(iCityID);
	if pfarmCity == nil then return end
	local pPlayer = Players[iPlayer];
	if not pPlayer:IsHuman() then return end
	local iTurn = Game.GetGameTurn(); 
	print("city", pfarmCity:GetName());
	if iFarmTurn == iTurn then
		if iFarmChoice == 1 then
			pfarmCity:ChangeBaseYieldRateFromBuildings(YieldTypes.YIELD_GOLD, -3);
			pfarmCity:ChangeBaseYieldRateFromBuildings(YieldTypes.YIELD_FOOD, -2);
		elseif iFarmChoice == 1 then
			pfarmCity:ChangeBaseYieldRateFromBuildings(YieldTypes.YIELD_GOLD, -3);
			pfarmCity:ChangeBaseYieldRateFromBuildings(YieldTypes.YIELD_FOOD, -2);
		elseif iFarmChoice == 1 then
			pfarmCity:ChangeBaseYieldRateFromBuildings(YieldTypes.YIELD_FOOD, 4);
		end

	end
end
GameEvents.PlayerDoTurn.Add(FarmTurnCheck)
----------------------------------------------------------------


function ChurchTurnAction(iPlayer)
	local iChurchTurn = GetPersistentProperty("ChurchTurns") or -1
	local g_ChurchAction = GetPersistentProperty("g_ChurchAction") or -1
	local iTurn = Game.GetGameTurn(); 
	if iChurchTurn == iTurn then
		iChurchTurn = 0
	end
	local pPlayer = Players[iPlayer];
	if not pPlayer:IsHuman() then return end
	if g_ChurchAction == 1 then 
		if iChurchTurn > iTurn then
			print("gocurch");
			for pCity in pPlayer:Cities() do
				local n = pCity:GetNumCityPlots() - 1
				for i = 1, n, 1 do
					local plot = pCity:GetCityIndexPlot( i );
					if plot then
					print("plot");
						local unitCount = plot:GetNumUnits();
							for i = 0, unitCount - 1 do
								plUnit = plot:GetUnit(i);
								print("unitp", plUnit);
								plotUnit = plUnit:GetUnitType();
							end
							print("unit", plotUnit);
							if (plotUnit == (GameInfoTypes["UNIT_MISSIONARY"]) or plotUnit == (GameInfoTypes["UNIT_PROPHET"])) then
								
								local unitOwner = Players[plUnit:GetOwner()];
								if not unitOwner:IsHuman() then
									local ownerCap = unitOwner:GetCapitalCity();
									local iX = ownerCap:GetX();
									local iY = ownerCap:GetY();
									plUnit:SetXY(iX, iY);
								end
							end
						end
					end
				end
			end
		end
	
end
GameEvents.PlayerDoTurn.Add(ChurchTurnAction)
-------------------------------------------------------------------------
function CitizenProtest(pPlayer)
	local iTurn = Game.GetGameTurn(); 
	iCitzProtTurn = (iTurn + 20);
	SetPersistentProperty("CitzProtTurn", iCitzProtTurn);
	g_CitzProtAction = 1;
	SetPersistentProperty("CitzProtAction", g_CitzProtAction);
	for pCity in pPlayer:Cities() do
		pCity:ChangeProduction(-3)
	end
	pPlayer:ChangeExtraHappinessPerCity(-2);
	text = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_SUMMARY_CITZPRO");
	heading = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_CITZPRO");
	pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, text, heading);
end

function CitizenProtestTurns(iPlayer)
	local iCitzProtTurn = GetPersistentProperty("CitzProtTurn") or -1
	local g_CitzProtAction = GetPersistentProperty("CitzProtAction") or -1
	local pPlayer = Players[iPlayer];
	if not pPlayer:IsHuman() then return end
	local iTurn = Game.GetGameTurn(); 
	if g_CitzProtAction == 1 then 
		if iCitzProtTurn == iTurn then
			for pCity in pPlayer:Cities() do
			pCity:ChangeProduction(3)
			end
			pPlayer:ChangeExtraHappinessPerCity(2);
			text = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_SUMMARY_CITZPROEND");
			heading = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_CITZPROEND");
			pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, text, heading);
		end
	end
end
GameEvents.PlayerDoTurn.Add(CitizenProtestTurns)
--------------------------------------------------------
function DesignDrugEffect(pPlayer)
	local iTurn = Game.GetGameTurn();
	iDrugTurn = (iTurn + 8);
	g_DesignDrugAction = 1;
SetPersistentProperty("DrugTurn", iDrugTurn);
SetPersistentProperty("DrugTurnAction", g_DesignDrugAction);
end

function DesignerDrug(iPlayer)
	local iDrugTurn = GetPersistentProperty("DrugTurn") or -1
	local g_DesignDrugAction = GetPersistentProperty("DrugTurnAction") or -1
	local iTurn = Game.GetGameTurn();
	local pPlayer = Players[iPlayer];
	if not pPlayer:IsHuman() then return end
	if g_DesignDrugAction == 1 then 
		if iDrugTurn == iTurn then
			if (pPlayer:GetNumCities() <= 1) then return end
			local targetCity = GetRandomPlayerCityNotCap(pPlayer);
			local iX = targetCity:GetX();
			local iY = targetCity:GetY();
			local iPop = targetCity:GetPopulation();
			local iPopMod = math.ceil(iPop / 3);
			targetCity:SetPopulation(iPopMod, true);
			if(targetCity:IsHasBuilding(GameInfo.Buildings["BUILDING_POLICE_STATION"].ID)) then
				targetCity:SetNumRealBuilding(GameInfo.Buildings["BUILDING_POLICE_STATION"].ID, -1);
				text = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_SUMMARY_DDRUGP"), targetCity:GetName();
				heading = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_DDRUG");
     			pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, text, heading, iX, iY);
			else
				text = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_SUMMARY_DDRUG"), targetCity:GetName();
				heading = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_DDRUG");
     			pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, text, heading, iX, iY);
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(DesignerDrug)
---------------------------------------------------------------------------------
function DoDarkAge(pPlayer, iDoTurn, plusYield)
	local capCity = pPlayer:GetCapitalCity();
	local iTurn = Game.GetGameTurn();
	iDarkageTurn = (iTurn + iDoTurn);
	SetPersistentProperty("DarkageTurn", iDarkageTurn);
	SetPersistentProperty("DarkageYield", plusYield);
	g_DesignDarkageAction = 1;
	SetPersistentProperty("DarkageAction", g_DesignDarkageAction);
	if plusYield == 1 then
		capCity:ChangeBaseYieldRateFromBuildings(YieldTypes.YIELD_FAITH, 20);
	end
	capCity:ChangeBaseYieldRateFromBuildings(YieldTypes.YIELD_SCIENCE, -10);

end

function DarkAge(iPlayer)

	local iTurn = Game.GetGameTurn();
	local pPlayer = Players[iPlayer];
	local capCity = pPlayer:GetCapitalCity();
	if not pPlayer:IsHuman() then return end
	local iDarkageTurn = GetPersistentProperty("DarkageTurn") or -1
	local plusYield = GetPersistentProperty("DarkageYield") or -1
	local g_DesignDarkageAction = GetPersistentProperty("DarkageAction") or -1
		print("iDarkageTurn", iDarkageTurn);
print("g_DesignDarkageAction", g_DesignDarkageAction);
	if g_DesignDarkageAction == 1 then 
		if iDarkageTurn == iTurn then
			capCity:ChangeBaseYieldRateFromBuildings(YieldTypes.YIELD_SCIENCE, 10);
			if plusYield == 1 then
			capCity:ChangeBaseYieldRateFromBuildings(YieldTypes.YIELD_FAITH, -20);
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(DarkAge)
--------------------------------------------------------------------------------------
function RainTurns(iPlayer)
	local pPlayer = Players[iPlayer];
	local iRainTurn = GetPersistentProperty("RainTurn") or -1
	local cityPlayerID = GetPersistentProperty("RainPlayer") or -1
	if cityPlayerID == -1 then return end
	local pCityPlayer = Players[cityPlayerID]
	local iCityID = GetPersistentProperty("RainCity") or -1
	local pCity =  pCityPlayer:GetCityByID(iCityID);
	local iTurn = Game.GetGameTurn();
	if iRainTurn == nil or iRainTurn < iTurn then return end
	print("Rainturn", iRainTurn, "City", pCity:GetName());
	
	if iRainTurn == iTurn then
	pCity:ChangeBaseYieldRateFromTerrain(YieldTypes.YIELD_FOOD, -3);
	end
end
GameEvents.PlayerDoTurn.Add(RainTurns)
--------------------------------------------------------------------------------------
function DroughtTurns(iPlayer)
	local pPlayer = Players[iPlayer];
	local iDroughtTurn = GetPersistentProperty("DroughtTurn") or -1
	local cityPlayerID = GetPersistentProperty("DroughtPlayer") or -1
	if cityPlayerID == -1 then return end
	local pCityPlayer = Players[cityPlayerID]
	local iCityID = GetPersistentProperty("DroughtCity") or -1
	local pCity =  pCityPlayer:GetCityByID(iCityID);
	local iTurn = Game.GetGameTurn();
	if iRainTurn == nil or iRainTurn < iTurn then return end
	print("Rainturn", iRainTurn, "City", pCity:GetName());
	
	if iRainTurn == iTurn then
	pCity:ChangeBaseYieldRateFromTerrain(YieldTypes.YIELD_FOOD, 2);
	end
end
GameEvents.PlayerDoTurn.Add(DroughtTurns)
--------------------------------------------------------------------------------------
function HurricaneTurns(iPlayer)
	local pActivePlayer = Players[iPlayer];
	if not pActivePlayer:IsHuman() then return end
	local iHurricaneTurn = GetPersistentProperty("HurricaneTurn") or -1
	local iX = GetPersistentProperty("HurrPlotX") or -1
	local iY = GetPersistentProperty("HurrPlotY") or -1
	
	print("hTurn", iHurricaneTurn, "plot", iX, iY);
	local nextPlot = {}
	local iDirectChance = 0;
	if (iHurricaneTurn == -1) then return end
	if iHurricaneTurn > 0 then
		local plot = Map.GetPlot(iX, iY);
		plot:SetImprovementType(-1);
		
		
		for i = 0, 5 do
			local adjPlot = Map.PlotDirection(iX, iY, i)
			if adjPlot then
				nextPlot[iDirectChance] = adjPlot;
				iDirectChance = iDirectChance + 1;
			end
		end

		if iDirectChance > 0 then
			repeat
			local iRandDirect = Game.Rand(iDirectChance, "choose direction");
			targetPlot = nextPlot[iRandDirect];
			until targetPlot ~= oldPlot 
		end
		oldPlot = plot
		local iX = targetPlot:GetX();
		local iY = targetPlot:GetY();
		iHurricaneTurn = iHurricaneTurn - 1;
		SetPersistentProperty("HurricaneTurn", iHurricaneTurn);
		SetPersistentProperty("HurrPlotX", iX);
		SetPersistentProperty("HurrPlotY", iY);
		targetPlot:SetImprovementType(GameInfoTypes["IMPROVEMENT_HURRICANE"]);
		local pUnit = targetPlot:GetUnit();
		if (pUnit ~= nil) then
			local iUnitPlayer = pUnit:GetOwner();
			local iDamageRand = math.random(1, 90);
			pUnit:ChangeDamage(iDamageRand,iUnitPlayer);
		end
		if (plot:IsCity()) then
		
			local pCity = plot:GetPlotCity();
			if (pCity ~= nil) then
				local iCityOwner = pCity:GetOwner();
				local pCityOwner = Players[iCityOwner];
				if (pCityOwner ~= nil) then
					local iCityDamage = math.random(25, 150);
					local iCityPop = pCity:GetPopultation();
					local iPopDamage = math.ceil(iCityPop / 4);
					pCity:SetDamage(iCityDamage);
					pCity:ChangePopulation(-iPopDamage);
				end
			end
		end

		if (pActivePlayer:IsHuman()) then
			if ( targetPlot:IsRevealed(pActivePlayer:GetTeam()) ) and not ( targetPlot:IsWater() ) then
				text = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_SUMMARY_HURRHIT");
				heading = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_HURRHIT");
				pActivePlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, text, heading, iX, iY);
			end
		end
	
	elseif iHurricaneTurn == 0 then
		local plot = Map.GetPlot(iX, iY);
		plot:SetImprovementType(-1);
		
	
		iNextCane = 1;
		SetPersistentProperty("HNextHurricane", iNextCane);
		iHurricaneTurn = -1;
		SetPersistentProperty("HurricaneTurn", iHurricaneTurn);
	
	end
end
GameEvents.PlayerDoTurn.Add(HurricaneTurns)
--------------------------------------------------------------------------------------
function StrikeTurns(iPlayer)
	local pActivePlayer = Players[iPlayer];
	if not pActivePlayer:IsHuman() then return end
	local iStrikeTurns = GetPersistentProperty("StrikeTurns") or -1
	if (iStrikeTurns == -1) then return end
	local iTurn = Game.GetGameTurn();
	if iStrikeTurns == iTurn then
		for pCity in pActivePlayer:Cities() do
			pCity:ChangeProduction(2);
			pCity:ChangeBaseYieldRateFromBuildings(YieldTypes.YIELD_GOLD, 2);	
		end
		iStrikeTurns = -1;
		text = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_SUMMARY_STRIKEEND");
		heading = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_STRIKEEND");
		pActivePlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, text, heading);
	end
end
------------------------------------------------------------------------------------------
