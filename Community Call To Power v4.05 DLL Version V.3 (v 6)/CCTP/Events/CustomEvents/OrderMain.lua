if(Game.GetCustomOption("GAMEOPTION_CCTP_ORDER") == 0) then
	return;
end

-- OrderMain
-- Author: gyogen
-- DateCreated: 11/9/2014 6:55:10 PM
--------------------------------------------------------------
include( "OrderControl.lua" );
include( "EventUtils.lua" );
include( "EventOptions.lua" );
include( "TriggeredEvents.lua" );

function CityOrderControl(iPlayer)
	local pPlayer = Players[iPlayer];
	local numCities = pPlayer:GetNumCities();
	local iTolalOrder = 0
	for pCity in pPlayer:Cities() do
		local iCityOrder = GetCityOrder(pCity);
		iTolalOrder = iTolalOrder + iCityOrder;
		print("cityorder", iCityOrder);
		if (iCityOrder < 0 and iCityOrder >= -5) then 
			DoLowCrime(pPlayer, pCity, iCityOrder)
		elseif (iCityOrder >= -15 and iCityOrder < -5) then 
			DoMedCrime(pPlayer, pCity, iCityOrder)
		elseif (iCityOrder < -15) then 
			DoHighCrime(pPlayer, pCity, iCityOrder)
		end
	end
	local iOrderEraMod = GetEraModifier(pPlayer);
	local iEraConversion = ((iOrderEraMod - 20) * -1)
	iTolalOrder = (iTolalOrder / numCities);
	print("iTolalOrder", iTolalOrder);
	if (iTolalOrder > (50 + iEraConversion)) then
		DoPoliceState(pPlayer, iTolalOrder)
	elseif (iTolalOrder < -5) then
		DoNoGoldenAge(pPlayer)
	elseif (iTolalOrder < -10) then
		DoCivDisorder(pPlayer, iTolalOrder)
	end
	
end
GameEvents.PlayerDoTurn.Add(CityOrderControl)
---------------------------------------------------------------
function DoLowCrime(pPlayer, pCity, iCityOrder)
	local iX = pCity:GetX();
	local iY = pCity:GetY();
	local cityName = pCity:GetName();
	local iOrderModifier = (iCityOrder * -1)
	local iLCChance = (BaseCrimeChance *  iOrderModifier);
	local randDie = Game.Rand(200, "Rand Die");

	if iLCChance > randDie then
		local iPilfer = math.random(5, 25);
		local crimeChoice = math.random(1, 3)
		print("crime", crimeChoice)
		local pGetResource,
			  iNumResource  = GetRandomStratResource(pPlayer);
		if iNumResource == 0 then crimeChoice = 1 end
		if crimeChoice == 1 then
			pPlayer:ChangeGold(-iPilfer);
			text = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_SUMMARY_PILFER", cityName, iPilfer);
			heading = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_PILFER");
		elseif crimeChoice == 2 then
			
			local iPilfer = 1
			pPlayer:ChangeNumResourceTotal(pResource.ID, -iPilfer);
			text = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_SUMMARY_PILFERRES", cityName, iPilfer, resName);
			heading = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_PILFER");
		elseif crimeChoice == 3 then
			local iCurProd = pCity:GetProduction();
			local iPilfer = math.ceil(iCurProd / 4)
			pCity:ChangeProduction(iPilfer);
			text = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_SUMMARY_PILFERPROD", cityName, iPilfer);
			heading = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_PILFER");
			
		end
		pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, text, heading, iX, iY);
	end
end
--------------------------------------------------------------------
function DoMedCrime(pPlayer, pCity, iCityOrder)
	local iX = pCity:GetX();
	local iY = pCity:GetY();
	local cityName = pCity:GetName();
	local iOrderModifier = (iCityOrder * -1)
	local iLCChance = (BaseCrimeChance *  iOrderModifier);
	local randDie = Game.Rand(200, "Rand Die");

	if iLCChance < randDie then
		local iPilfer = math.random(20, 50);
		local crimeChoice = math.random(1, 5)
		print("crime", crimeChoice)
		local pGetResource,
			  iNumResource  = GetRandomStratResource(pPlayer);
		if iNumResource == 0 then crimeChoice = math.random(3, 5) end
		if crimeChoice == 1 then
			pPlayer:ChangeGold(-iPilfer);
			text = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_SUMMARY_PILFER", cityName, iPilfer);
			heading = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_PILFER");
		elseif crimeChoice == 2 then
			local iPilfer = math.ceil(iNumResource / 4)
				if iPilfer < 0 then iPilfer = 1 end
			pPlayer:ChangeNumResourceTotal(pResource.ID, -iPilfer);
			text = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_SUMMARY_PILFERRES", cityName, iPilfer, resName);
			heading = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_PILFER");
		elseif crimeChoice == 3 then
			local iCurProd = pCity:GetProduction();
			local iPilfer = math.ceil(iCurProd / 3)
			pCity:ChangeProduction(iPilfer);
			text = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_SUMMARY_PILFERPROD", cityName, iPilfer);
			heading = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_PILFER");
		elseif crimeChoice == 4 then
			local targetPlot = GetRandomImprovement(pPlayer);
			if targetPlot ~= nil then
				local iX = targetPlot:GetX();
				local iY = targetPlot:GetY();
				targetPlot:SetImprovementPillaged(true);
				text = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_SUMMARY_PILFERIMP", cityName);
				heading = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_PILFER");
			end
		elseif crimeChoice == 5 then
			pCity:ChangeBaseYieldRateFromBuildings(YieldTypes.YIELD_SCIENCE, -2);
			text = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_SUMMARY_PILFERSCI", cityName);
			heading = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_PILFER");
		end
		pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, text, heading, iX, iY);
	end
end
--------------------------------------------------------------------
function DoHighCrime(pPlayer, pCity, iCityOrder)
 	local iX = pCity:GetX();
	local iY = pCity:GetY();
	local cityName = pCity:GetName();
	local iOrderModifier = (iCityOrder * -1)
	local iLCChance = (BaseCrimeChance *  iOrderModifier);
	local randDie = Game.Rand(200, "Rand Die");
	if iCityOrder < -20 then 
		local randRevolt = Game.Rand(300, "Revolt chance");
		local otherPlayer = Players[63];
		
		if baseRevoltOdds > randRevolt then
			if (not pCity:IsCapital()) then 
				CityLostToOther(pCity, otherPlayer)
				InvalidateCity()
				text = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_SUMMARY_PILFERREV", cityName, iPilfer);
				heading = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_PILFERREV");
				pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, text, heading, iX, iY);
				return
			end
		end
	end
	if iLCChance < randDie then
		local iPilfer = math.random(40, 100);
		local crimeChoice = math.random(1, 7)
		print("crime", crimeChoice)
		local pGetResource,
			  iNumResource  = GetRandomStratResource(pPlayer);
		if iNumResource == 0 then crimeChoice = math.random(3, 5) end
		
		if crimeChoice == 1 then
			pPlayer:ChangeGold(-iPilfer);
			text = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_SUMMARY_PILFER", cityName, iPilfer);
			heading = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_PILFER");
		elseif crimeChoice == 2 then
			local iPilfer = math.ceil(iNumResource / 3)
				if iPilfer < 0 then iPilfer = 1 end
			pPlayer:ChangeNumResourceTotal(pResource.ID, -iPilfer);
			text = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_SUMMARY_PILFERRES", cityName, iPilfer, resName);
			heading = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_PILFER");
		elseif crimeChoice == 3 then
			local iCurProd = pCity:GetProduction();
			local iPilfer = math.ceil(iCurProd / 2)
			pCity:ChangeProduction(iPilfer);
			text = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_SUMMARY_PILFERPROD", cityName, iPilfer);
			heading = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_PILFER");
		elseif crimeChoice == 4 then
			local targetPlot = GetRandomImprovement(pPlayer);
			if targetPlot ~= nil then
				local iX = targetPlot:GetX();
				local iY = targetPlot:GetY();
				targetPlot:SetImprovementPillaged(true);
				text = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_SUMMARY_PILFERIMP", cityName);
				heading = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_PILFER");
			end
		elseif crimeChoice == 5 then
			pCity:ChangeBaseYieldRateFromBuildings(YieldTypes.YIELD_SCIENCE, -5);
			text = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_SUMMARY_PILFERSCI", cityName);
			heading = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_PILFER");
		elseif crimeChoice == 6 then
			local iPopLot = math.ceil(pCity:GetPopulation() / 5);
			local randKill = math.random(1, iPopLot);
			pCity:ChangePopulation(-randKill);
			text = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_SUMMARY_PILFERMUR", cityName, randKill);
			heading = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_PILFER");
		elseif crimeChoice == 7 then
			local targetBuilding = GetRandBuilding(pCity);
			print("buikld2", targetBuilding);
			if targetBuilding == nil then return end
			local targetBuildingType = targetBuilding.Type;
			local buildingName = Locale.ConvertTextKey(targetBuilding.Description);
			print("name", strBuildingName);
			pCity:SetNumRealBuilding(GameInfoTypes[targetBuildingType], -1);
			text = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_SUMMARY_PILFERARS", cityName, buildingName);
			heading = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_PILFER");
		end
		pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, text, heading, iX, iY);
	end
 end
--------------------------------------------------------------------

function DoPoliceState(pPlayer, iTolalOrder)
	local iRevChance = Game.Rand(500, "rev chance");
	local spUnit = ""
	if baseCivRevOdds < iRevChance then 
		local iCurrEra = pPlayer:GetCurrentEra();
		if iCurrEra == 0 then
		spUnit = GameInfoTypes["UNIT_CAVEMAN"];
		elseif iCurrEra == 1 then
		spUnit = GameInfoTypes["UNIT_WARRIOR"];
		elseif iCurrEra == 2 then
		spUnit = GameInfoTypes["UNIT_SWORDSMAN"];
		elseif iCurrEra == 3 then
		spUnit = GameInfoTypes["UNIT_LONGSWORDSMAN"];
		elseif iCurrEra == 4 then
		spUnit = GameInfoTypes["UNIT_LANCER"];
		elseif iCurrEra == 5 then
		spUnit = GameInfoTypes["UNIT_RIFLEMAN"];
		elseif iCurrEra == 6 then
		spUnit = GameInfoTypes["UNIT_INFANTRY"];
		elseif iCurrEra == 7 then
		spUnit = GameInfoTypes["UNIT_INFANTRY"];
		elseif iCurrEra == 8 then
		spUnit = GameInfoTypes["UNIT_LEAP_INFANTRY"];
		end
		evntType = 1
		DoPolStateRevolution(pPlayer, spUnit, evntType)
	end
end
--------------------------------------------------------------------
function DoNoGoldenAge(pPlayer)
	local gaProgress = pPlayer:GetGoldenAgeProgressMeter();
		pPlayer:ChangeGoldenAgeProgressMeter(-gaProgress);
end
--------------------------------------------------------------------
function DoCivDisorder(pPlayer, iTolalOrder)
	if (iTolalOrder < -10 and iTolalOrder > -20) then
		local iOrderModifier = (iTolalOrder * -1)
		local iCorpChance = (BaseCrimeChance *  iOrderModifier);
		local randDie = Game.Rand(200, "Rand Die");

		if iLCChance < randDie then
			local iPilfer = math.random(40, 100);
		end
	elseif iTolalOrder < -30 then
		local iRevChance = Game.Rand(500, "rev chance");
		local spUnit = ""
		if baseCivRevOdds < iRevChance then 
			local iCurrEra = pPlayer:GetCurrentEra();
			if iCurrEra == 0 then
			spUnit = GameInfoTypes["UNIT_CAVEMAN"];
			elseif iCurrEra == 1 then
			spUnit = GameInfoTypes["UNIT_WARRIOR"];
			elseif iCurrEra == 2 then
			spUnit = GameInfoTypes["UNIT_SWORDSMAN"];
			elseif iCurrEra == 3 then
			spUnit = GameInfoTypes["UNIT_LONGSWORDSMAN"];
			elseif iCurrEra == 4 then
			spUnit = GameInfoTypes["UNIT_LANCER"];
			elseif iCurrEra == 5 then
			spUnit = GameInfoTypes["UNIT_RIFLEMAN"];
			elseif iCurrEra == 6 then
			spUnit = GameInfoTypes["UNIT_INFANTRY"];
			elseif iCurrEra == 7 then
			spUnit = GameInfoTypes["UNIT_INFANTRY"];
			elseif iCurrEra == 8 then
			spUnit = GameInfoTypes["UNIT_LEAP_INFANTRY"];
			end
			evntType = 2
			DoPolStateRevolution(pPlayer, spUnit, evntType)
		end

	end
end
---------------------------------------------------------------------