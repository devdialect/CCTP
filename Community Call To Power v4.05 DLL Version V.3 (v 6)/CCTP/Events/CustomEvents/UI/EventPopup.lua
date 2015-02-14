if(Game.GetCustomOption("GAMEOPTION_CCTP_EVENTS") == 0) then
	ContextPtr:SetHide(true)
	return;
end
-- EventPopup
-- Author: Gyogen
-- DateCreated: 10/19/2014 12:46:40 PM
--------------------------------------------------------------

include("IconSupport")
include("EventControl.lua")
include( "EventUtils.lua" );
include( "EventOptions.lua" );
include( "TriggeredEvents.lua" );
include( "TurnChecks.lua" );
include( "Zombies_Nanos.lua" );


-------------------------------------------------------------------------------------------
function StarveCheck()
	local playerID = Game.GetActivePlayer();
	local pPlayer = Players[playerID];

	local iStarveCities = 0
	for pCity in pPlayer:Cities() do
		if pCity:FoodDifferenceTimes100() < 0 then
		iStarveCities = iStarveCities + 1
		end
		print("istarve", iStarveCities);
	end
	if iStarveCities == nil then iStarveCities = 0 end
	if iStarveCities > 1 then
	   print("starve");
		DecisionEvent2(playerID, iStarveCities)
		return
	end
end
Events.ActivePlayerTurnStart.Add(StarveCheck)
-------------------------------------------------------------------------

-------------------------------------------------------------------------------------------
function DecisionEvent1(playerID)
	local pPlayer = Players[playerID];
	local numCities = pPlayer:GetNumCities();
	print("start");
	 ContextPtr:SetHide(false)
	Controls.Description:LocalizeAndSetText("TXT_KEY_DESCRIP1");
    Controls.EventImage:SetTexture("Festival.dds")
	Controls.FirstChoice:LocalizeAndSetText("TXT_KEY_CHOICE_JAN_ONE");
	Controls.SecondChoice:LocalizeAndSetText("TXT_KEY_CHOICE_JAN_TWO");
	Controls.ThirdChoice:LocalizeAndSetText("TXT_KEY_CHOICE_JAN_THREE");
	Controls.Choice1:LocalizeAndSetText("TXT_KEY_BUTTON_JAN_ONE");
	Controls.FirstResult:LocalizeAndSetText("TXT_KEY_RESULT_JAN_ONE");
	Controls.Choice2:LocalizeAndSetText("TXT_KEY_BUTTON_JAN_TWO");
	Controls.SecondResult:LocalizeAndSetText("TXT_KEY_RESULT_JAN_TWO");
	Controls.Choice3:LocalizeAndSetText("TXT_KEY_BUTTON_JAN_THREE");
	Controls.ThirdResult:LocalizeAndSetText("TXT_KEY_RESULT_JAN_THREE");
	function OnChoice1(playerID)
		local iPop = pPlayer:GetTotalPopulation();	
		
		pPlayer:ChangeGold(-(iPop * 10))	
		pPlayer:ChangeExtraHappinessPerCity(3);
		for pCity in pPlayer:Cities() do	
			local iCurrProd = pCity:GetProductionNeeded();
			print("prod", iCurrProd);
			pCity:SetProduction(iCurrProd - (iCurrProd/ 2));
			local iCurrProd = pCity:GetProduction();
			print("prod2", iCurrProd);
		end
		ContextPtr:SetHide(true)
		
	
	end
	Controls.Choice1:RegisterCallback(Mouse.eLClick, OnChoice1)
	function OnChoice2(playerID)
		local iPop = pPlayer:GetTotalPopulation();	
		local numCities = pPlayer:GetNumCities()	
		pPlayer:ChangeGold(-(iPop * 2))	
		pPlayer:ChangeExtraHappinessPerCity(1 / numCities);
		ContextPtr:SetHide(true)
		
	end
	Controls.Choice2:RegisterCallback(Mouse.eLClick, OnChoice2)
	function OnChoice3(playerID)
		pPlayer:ChangeExtraHappinessPerCity(-1 / numCities);
		for pCity in pPlayer:Cities() do
			local iCurrProd = pCity:GetProductionNeeded();
			pCity:ChangeProduction(iCurrProd + (iCurrProd * 2));
		end
		ContextPtr:SetHide(true)
		if (pPlayer:IsHuman()) then
			text = Locale.ConvertTextKey( "TXT_KEY_NOTIFICATION_SUMMARY_JANBAD");
			heading = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_JANBAD");
     		pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, text, heading);
		end

	end
	Controls.Choice3:RegisterCallback(Mouse.eLClick, OnChoice3)


end
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
function DecisionEvent2(playerID, iStarveCities)
	local pPlayer = Players[playerID];
	local numCities = pPlayer:GetNumCities();
	print("start2");
	 ContextPtr:SetHide(false)
	print("starve", iStarveCities);
	Controls.Description:LocalizeAndSetText("TXT_KEY_DESCRIP_STARVE", iStarveCities);
    Controls.EventImage:SetTexture("famine.dds")
	Controls.FirstChoice:LocalizeAndSetText("TXT_KEY_CHOICE_STARVE_ONE");
	Controls.SecondChoice:LocalizeAndSetText("TXT_KEY_CHOICE_STARVE_TWO");
	Controls.ThirdChoice:LocalizeAndSetText("TXT_KEY_CHOICE_STARVE_THREE");
	Controls.Choice1:LocalizeAndSetText("TXT_KEY_BUTTON_STARVE_ONE");
	Controls.FirstResult:LocalizeAndSetText("TXT_KEY_RESULT_STARVE_ONE");
	Controls.Choice2:LocalizeAndSetText("TXT_KEY_BUTTON_STARVE_TWO");
	Controls.SecondResult:LocalizeAndSetText("TXT_KEY_RESULT_STARVE_TWO");
	Controls.Choice3:LocalizeAndSetText("TXT_KEY_BUTTON_STARVE_THREE");
	Controls.ThirdResult:LocalizeAndSetText("TXT_KEY_RESULT_STARVE_THREE");
	function OnChoice1(playerID)
		for pCity in pPlayer:Cities() do
			if pCity:FoodDifferenceTimes100() < 0 then
				local iFoodNeeded = (pCity:GetPopulation() - (pCity:GetFood() / 2));
				pCity:ChangeFood(iFoodNeeded * 4)
			end
		end 
		pPlayer:ChangeGold(-(iStarveCities * 25))	 
	
	ContextPtr:SetHide(true)
	end
	Controls.Choice1:RegisterCallback(Mouse.eLClick, OnChoice1)
	function OnChoice2(playerID)
		local iTotOverPop = 0
		for pCity in pPlayer:Cities() do
			local iOverPop = (pCity:GetPopulation() - (pCity:GetFood() / 2));
			pCity:ChangePopulation(-iOverPop)
			iTotOverPop = iTotOverPop + iOverPop
		end
		local iResourceID = GameInfoTypes["RESOURCE_MANPOWER"];
		pPlayer:ChangeNumResourceTotal(iResourceID, iTotOverPop)
		pPlayer:ChangeExtraHappinessPerCity(-10  / numCities);
		ContextPtr:SetHide(true)
	end
	Controls.Choice2:RegisterCallback(Mouse.eLClick, OnChoice2)
	function OnChoice3(playerID)
		
	ContextPtr:SetHide(true)
	end
	Controls.Choice3:RegisterCallback(Mouse.eLClick, OnChoice3)

end
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
function DecisionEvent3(playerID)
	local pPlayer = Players[playerID];	
	local numCities = pPlayer:GetNumCities();
	print("HARVEST");
	 ContextPtr:SetHide(false)
	local iNumCities = pPlayer:GetNumCities();
	local iFoodBonus = (math.random(2, 6) * iNumCities);
	local iFoodProfit =  (math.random(2, 10) * iFoodBonus);
	Controls.Description:LocalizeAndSetText("TXT_KEY_DESCRIP_HARVEST", iFoodBonus);
    Controls.EventImage:SetTexture("The_Harvest.dds")
	Controls.FirstChoice:LocalizeAndSetText("TXT_KEY_CHOICE_HARVEST_ONE");
	Controls.SecondChoice:LocalizeAndSetText("TXT_KEY_CHOICE_HARVEST_TWO");
	Controls.ThirdChoice:LocalizeAndSetText("TXT_KEY_CHOICE_HARVEST_THREE");
	Controls.Choice1:LocalizeAndSetText("TXT_KEY_BUTTON_HARVEST_ONE");
	Controls.FirstResult:LocalizeAndSetText("TXT_KEY_RESULT_HARVEST_ONE");
	Controls.Choice2:LocalizeAndSetText("TXT_KEY_BUTTON_HARVEST_TWO");
	Controls.SecondResult:LocalizeAndSetText("TXT_KEY_RESULT_HARVEST_TWO");
	Controls.Choice3:LocalizeAndSetText("TXT_KEY_BUTTON_HARVEST_THREE");
	Controls.ThirdResult:LocalizeAndSetText("TXT_KEY_RESULT_HARVEST_THREE", iFoodProfit);

	function OnChoice1(playerID)
		local iDistribute = (iFoodBonus / iNumCities);
		for pCity in pPlayer:Cities() do			
				pCity:ChangeFood(iDistribute)
			
		end 
		pPlayer:ChangeExtraHappinessPerCity(2);
	ContextPtr:SetHide(true)
	end
	Controls.Choice1:RegisterCallback(Mouse.eLClick, OnChoice1)
	function OnChoice2(playerID)
		pPlayer:ChangeExtraHappinessPerCity(2 / numCities)
		pPlayer:ChangeFaith(2);
		ContextPtr:SetHide(true)
	end
	Controls.Choice2:RegisterCallback(Mouse.eLClick, OnChoice2)
	function OnChoice3(playerID)
		pPlayer:ChangeGold(iFoodProfit)
		pPlayer:ChangeExtraHappinessPerCity(-1 / numCities)
	ContextPtr:SetHide(true)
	end
	Controls.Choice3:RegisterCallback(Mouse.eLClick, OnChoice3)

end
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
function DecisionEvent4(playerID)
	goDecn = 0;
	local pPlayer = Players[playerID];	
	print("DRAGON");
	 ContextPtr:SetHide(false)
	Controls.Description:LocalizeAndSetText("TXT_KEY_DESCRIP_DRAGON");

    Controls.EventImage:SetTexture("dragon.dds")
	Controls.FirstChoice:LocalizeAndSetText("TXT_KEY_CHOICE_DRAGON_ONE");
	Controls.SecondChoice:LocalizeAndSetText("TXT_KEY_CHOICE_DRAGON_TWO");
	Controls.ThirdChoice:LocalizeAndSetText("TXT_KEY_CHOICE_DRAGON_THREE");
	Controls.Choice1:LocalizeAndSetText("TXT_KEY_BUTTON_DRAGON_ONE");
	Controls.FirstResult:LocalizeAndSetText("TXT_KEY_RESULT_DRAGON_ONE");
	Controls.Choice2:LocalizeAndSetText("TXT_KEY_BUTTON_DRAGON_TWO");
	Controls.SecondResult:LocalizeAndSetText("TXT_KEY_RESULT_DRAGON_TWO");
	Controls.Choice3:LocalizeAndSetText("TXT_KEY_BUTTON_DRAGON_THREE");
	Controls.ThirdResult:LocalizeAndSetText("TXT_KEY_RESULT_DRAGON_THREE");
	function OnChoice1(playerID)
		local iSciMod = math.ceil(pPlayer:GetScience() / 4);
		local pCity = GetRandomPlayerCity(pPlayer);
		pPlayer:ChangeFaith(50)
		pPlayer:ChangeJONSCulture(25)	
		pCity:ChangeBaseYieldRateFromBuildings(YieldTypes.YIELD_SCIENCE, -iSciMod)		
	 
		
	ContextPtr:SetHide(true)
	end
	Controls.Choice1:RegisterCallback(Mouse.eLClick, OnChoice1)
	function OnChoice2(playerID)
		local iSciMod = math.ceil(pPlayer:GetScience() / 10);
		local pCity = GetRandomPlayerCity(pPlayer);
		pPlayer:ChangeJONSCulture(75)
		pCity:ChangeBaseYieldRateFromBuildings(YieldTypes.YIELD_SCIENCE, -iSciMod);
		ContextPtr:SetHide(true)
	end
	Controls.Choice2:RegisterCallback(Mouse.eLClick, OnChoice2)
	function OnChoice3(playerID)
		local iFaithMod= math.ceil(pPlayer:GetFaith() / 4)
		pPlayer:ChangeFaith(-iFaithMod)
		pPlayer:ChooseTech(1);

	ContextPtr:SetHide(true)
	end
	Controls.Choice3:RegisterCallback(Mouse.eLClick, OnChoice3)
	
end
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
function DecisionEvent5(playerID)
	goDecn = 0;
	local pPlayer = Players[playerID];
	local pCity = pPlayer:GetCapitalCity();	
	print("TRIBE");
	 ContextPtr:SetHide(false)
	Controls.Description:LocalizeAndSetText("TXT_KEY_DESCRIP_TRIBE");

    Controls.EventImage:SetTexture("Tribe1.dds")
	Controls.FirstChoice:LocalizeAndSetText("TXT_KEY_CHOICE_TRIBE_ONE");
	Controls.SecondChoice:LocalizeAndSetText("TXT_KEY_CHOICE_TRIBE_TWO");
	Controls.ThirdChoice:LocalizeAndSetText("TXT_KEY_CHOICE_TRIBE_THREE");
	Controls.Choice1:LocalizeAndSetText("TXT_KEY_BUTTON_TRIBE_ONE");
	Controls.FirstResult:LocalizeAndSetText("TXT_KEY_RESULT_TRIBE_ONE");
	Controls.Choice2:LocalizeAndSetText("TXT_KEY_BUTTON_TRIBE_TWO");
	Controls.SecondResult:LocalizeAndSetText("TXT_KEY_RESULT_TRIBE_TWO");
	Controls.Choice3:LocalizeAndSetText("TXT_KEY_BUTTON_TRIBE_THREE");
	Controls.ThirdResult:LocalizeAndSetText("TXT_KEY_RESULT_TRIBE_THREE");
	function OnChoice1(playerID)
		pCity:ChangeBaseYieldRateFromBuildings(YieldTypes.YIELD_FAITH, 2)	
		pCity:ChangeBaseYieldRateFromBuildings(YieldTypes.YIELD_SCIENCE, -2);
		
	ContextPtr:SetHide(true)
	end
	Controls.Choice1:RegisterCallback(Mouse.eLClick, OnChoice1)
	function OnChoice2(playerID)
		pCity:ChangeBaseYieldRateFromBuildings(YieldTypes.YIELD_FAITH, -2)	
		pCity:ChangeBaseYieldRateFromBuildings(YieldTypes.YIELD_SCIENCE, 2);
		ContextPtr:SetHide(true)
	end
	Controls.Choice2:RegisterCallback(Mouse.eLClick, OnChoice2)
	function OnChoice3(playerID)
		local comExper = pPlayer:GetCombatExperience();
		if comExper < 0 then comExper = 4 end
		local iComMod = math.ceil(comExper / 4);
		pPlayer:ChangeCombatExperience(iComMod)
		pCity:ChangeJONSCulturePerTurnFromBuildings(-2)
	ContextPtr:SetHide(true)
	end
	Controls.Choice3:RegisterCallback(Mouse.eLClick, OnChoice3)

end


-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
function DecisionEvent6(playerID)
	local pPlayer = Players[playerID];
	local pCity = pPlayer:GetCapitalCity();	
	local numCities = pPlayer:GetNumCities();
	print("TREASURY");
	 ContextPtr:SetHide(false)
	Controls.Description:LocalizeAndSetText("TXT_KEY_DESCRIP_TREASURY");

    Controls.EventImage:SetTexture("Taxes.dds")
	Controls.FirstChoice:LocalizeAndSetText("TXT_KEY_CHOICE_TREASURY_ONE");
	Controls.SecondChoice:LocalizeAndSetText("TXT_KEY_CHOICE_TREASURY_TWO");
	Controls.ThirdChoice:LocalizeAndSetText("TXT_KEY_CHOICE_TREASURY_THREE");
	Controls.Choice1:LocalizeAndSetText("TXT_KEY_BUTTON_TREASURY_ONE");
	Controls.FirstResult:LocalizeAndSetText("TXT_KEY_RESULT_TREASURY_ONE");
	Controls.Choice2:LocalizeAndSetText("TXT_KEY_BUTTON_TREASURY_TWO");
	Controls.SecondResult:LocalizeAndSetText("TXT_KEY_RESULT_TREASURY_TWO");
	Controls.Choice3:LocalizeAndSetText("TXT_KEY_BUTTON_TREASURY_THREE");
	Controls.ThirdResult:LocalizeAndSetText("TXT_KEY_RESULT_TREASURY_THREE");
	function OnChoice1(playerID)
		local iRecourceCount = 0
		for resource in GameInfo.Resources() do
			local iResource = resource.ID;
			
			if( Game.GetResourceUsageType( iResource ) == ResourceUsageTypes.RESOURCEUSAGE_LUXURY ) then
				iAvailable = pPlayer:GetNumResourceAvailable( iResource);
				iRecourceCount = iRecourceCount + iAvailable;
			end
		end
		if iRecourceCount > 0 then
			pPlayer:ChangeGold(iRecourceCount)
			pPlayer:ChangeExtraHappinessPerCity(-5 / numCities);
		end
	ContextPtr:SetHide(true)
	end
	Controls.Choice1:RegisterCallback(Mouse.eLClick, OnChoice1)
	function OnChoice2(playerID)
		local iGarrisoned = 0;
		for pCity in pPlayer:Cities() do
			local garrisonedUnit = pCity:GetGarrisonedUnit();
			if garrisonedUnit ~= nil then
				iGarrisoned = iGarrisoned + 1
			end
		end

		if iGarrisoned > 0 then
			pPlayer:ChangeGold(iGarrisoned)
			pPlayer:ChangeExtraHappinessPerCity(-3 / numCities);
		end
	ContextPtr:SetHide(true)
	end
	Controls.Choice2:RegisterCallback(Mouse.eLClick, OnChoice2)
	function OnChoice3(playerID)
	ContextPtr:SetHide(true)
	end
	Controls.Choice3:RegisterCallback(Mouse.eLClick, OnChoice3)
end


-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
function DecisionEvent7(playerID)
	local pPlayer = Players[playerID];
	local capCity = pPlayer:GetCapitalCity();	
	local numCities = pPlayer:GetNumCities()
	local iRelCit = (numCities * 5)
	local playerReligion = pPlayer:GetReligionCreatedByPlayer();
	print("prel", playerReligion);
	local iFollowers = GetFollowers(pPlayer,playerReligion);
	local iTithe = (iFollowers * 2);
	print("HOLYEMPIRE");
	 ContextPtr:SetHide(false)
	Controls.Description:LocalizeAndSetText("TXT_KEY_DESCRIP_HOLYEMPIRE");

    Controls.EventImage:SetTexture("Taxes.dds");
	Controls.FirstChoice:LocalizeAndSetText("TXT_KEY_CHOICE_HOLYEMPIRE_ONE");
	Controls.SecondChoice:LocalizeAndSetText("TXT_KEY_CHOICE_HOLYEMPIRE_TWO");
	Controls.ThirdChoice:LocalizeAndSetText("TXT_KEY_CHOICE_HOLYEMPIRE_THREE");
	Controls.Choice1:LocalizeAndSetText("TXT_KEY_BUTTON_HOLYEMPIRE_ONE");
	Controls.FirstResult:LocalizeAndSetText("TXT_KEY_RESULT_HOLYEMPIRE_ONE", iRelCit);
	Controls.Choice2:LocalizeAndSetText("TXT_KEY_BUTTON_HOLYEMPIRE_TWO");
	Controls.SecondResult:LocalizeAndSetText("TXT_KEY_RESULT_HOLYEMPIRE_TWO");
	Controls.Choice3:LocalizeAndSetText("TXT_KEY_BUTTON_HOLYEMPIRE_THREE");
	Controls.ThirdResult:LocalizeAndSetText("TXT_KEY_RESULT_HOLYEMPIRE_THREE", iTithe);
	function OnChoice1(playerID)
		local eReligion = GameInfo.Religions[playerReligion];
		print("rel", eReligion);
		for pCity in pPlayer:Cities() do			
			pCity:AdoptReligionFully(GameInfoTypes[eReligion]);
			pPlayer:ChangeGold(-iRelCit);
		end 
		
	ContextPtr:SetHide(true)
	end
	Controls.Choice1:RegisterCallback(Mouse.eLClick, OnChoice1)
	function OnChoice2(playerID)
		InitUnitFromCity(capCity, GameInfoTypes.UNIT_PROPHET, 2)
		pPlayer:ChangeGold(-20);
		ContextPtr:SetHide(true)
	end
	Controls.Choice2:RegisterCallback(Mouse.eLClick, OnChoice2)
	function OnChoice3(playerID)
		pPlayer:ChangeGold(iTithe)
		pPlayer:ChangeExtraHappinessPerCity(-5 / numCities)
	ContextPtr:SetHide(true)
	end
	Controls.Choice3:RegisterCallback(Mouse.eLClick, OnChoice3)
end


-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
function DecisionEvent8(playerID)
	local pPlayer = Players[playerID];
	print("PEASANTS");
	 ContextPtr:SetHide(false)
	Controls.Description:LocalizeAndSetText("TXT_KEY_DESCRIP_PEASANTS");
    Controls.EventImage:SetTexture("peasant.dds");
	Controls.FirstChoice:LocalizeAndSetText("TXT_KEY_CHOICE_PEASANTS_ONE");
	Controls.SecondChoice:LocalizeAndSetText("TXT_KEY_CHOICE_PEASANTS_TWO");
	Controls.ThirdChoice:LocalizeAndSetText("TXT_KEY_CHOICE_PEASANTS_THREE");
	Controls.Choice1:LocalizeAndSetText("TXT_KEY_BUTTON_PEASANTS_ONE");
	Controls.FirstResult:LocalizeAndSetText("TXT_KEY_RESULT_PEASANTS_ONE");
	Controls.Choice2:LocalizeAndSetText("TXT_KEY_BUTTON_PEASANTS_TWO");
	Controls.SecondResult:LocalizeAndSetText("TXT_KEY_RESULT_PEASANTS_TWO");
	Controls.Choice3:LocalizeAndSetText("TXT_KEY_BUTTON_PEASANTS_THREE");
	Controls.ThirdResult:LocalizeAndSetText("TXT_KEY_RESULT_PEASANTS_THREE");
	function OnChoice1(playerID)
		for pCity in pPlayer:Cities() do
			pCity:ChangeBaseYieldRateFromBuildings(YieldTypes.YIELD_FOOD, 2)
			pCity:ChangeBaseYieldRateFromBuildings(YieldTypes.YIELD_PRODUCTION, -2)
		end
	ContextPtr:SetHide(true)
	end
	Controls.Choice1:RegisterCallback(Mouse.eLClick, OnChoice1)
	function OnChoice2(playerID)
		for pCity in pPlayer:Cities() do
			pCity:ChangeBaseYieldRateFromBuildings(YieldTypes.YIELD_FOOD, -2)
			pCity:ChangeBaseYieldRateFromBuildings(YieldTypes.YIELD_PRODUCTION, 2)
		end
		ContextPtr:SetHide(true)
	end
	Controls.Choice2:RegisterCallback(Mouse.eLClick, OnChoice2)
	function OnChoice3(playerID)
	
	ContextPtr:SetHide(true)
	end
	Controls.Choice3:RegisterCallback(Mouse.eLClick, OnChoice3)
end

-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
function DecisionEvent9(playerID)
	local pPlayer = Players[playerID];
	local capCity = pPlayer:GetCapitalCity();
	print("ART");
	 ContextPtr:SetHide(false)
	Controls.Description:LocalizeAndSetText("TXT_KEY_DESCRIP_ARTMOVE");
    Controls.EventImage:SetTexture("school-of-athens2.dds");
	Controls.FirstChoice:LocalizeAndSetText("TXT_KEY_CHOICE_ARTMOVE_ONE");
	Controls.SecondChoice:LocalizeAndSetText("TXT_KEY_CHOICE_ARTMOVE_TWO");
	Controls.ThirdChoice:LocalizeAndSetText("TXT_KEY_CHOICE_ARTMOVE_THREE");
	Controls.Choice1:LocalizeAndSetText("TXT_KEY_BUTTON_ARTMOVE_ONE");
	Controls.FirstResult:LocalizeAndSetText("TXT_KEY_RESULT_ARTMOVE_ONE");
	Controls.Choice2:LocalizeAndSetText("TXT_KEY_BUTTON_ARTMOVE_TWO");
	Controls.SecondResult:LocalizeAndSetText("TXT_KEY_RESULT_ARTMOVE_TWO");
	Controls.Choice3:LocalizeAndSetText("TXT_KEY_BUTTON_ARTMOVE_THREE");
	Controls.ThirdResult:LocalizeAndSetText("TXT_KEY_RESULT_ARTMOVE_THREE");
	function OnChoice1(playerID)
		InitUnitFromCity(capCity, GameInfoTypes.UNIT_ARTIST, 1)
		InitUnitFromCity(capCity, GameInfoTypes.UNIT_MUSICIAN, 1)
		pPlayer:ChangeGold(-40);
	ContextPtr:SetHide(true)
	end
	Controls.Choice1:RegisterCallback(Mouse.eLClick, OnChoice1)
	function OnChoice2(playerID)
		capCity:ChangeBaseYieldRateFromBuildings(YieldTypes.YIELD_SCIENCE, 2)
		pPlayer:ChangeGold(-100);
	
		ContextPtr:SetHide(true)
	end
	Controls.Choice2:RegisterCallback(Mouse.eLClick, OnChoice2)
	function OnChoice3(playerID)
		for pCity in pPlayer:Cities() do
			if(pCity:IsHasBuilding(GameInfo.Buildings["BUILDING_SCHOOL"].ID) == false) then
				pCity:SetNumRealBuilding(GameInfo.Buildings["BUILDING_SCHOOL"].ID, 1);
			end
		end
		pPlayer:ChangeGold(-250);
	ContextPtr:SetHide(true)
	end
	Controls.Choice3:RegisterCallback(Mouse.eLClick, OnChoice3)
end
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
function DecisionEvent10(playerID)
	local pPlayer = Players[playerID];
	local capCity = pPlayer:GetCapitalCity();
	print("Indust");
	 ContextPtr:SetHide(false)
	Controls.Description:LocalizeAndSetText("TXT_KEY_DESCRIP_INDUST");
    Controls.EventImage:SetTexture("industrial revolutiuon.dds");
	Controls.FirstChoice:LocalizeAndSetText("TXT_KEY_CHOICE_INDUST_ONE");
	Controls.SecondChoice:LocalizeAndSetText("TXT_KEY_CHOICE_INDUST_TWO");
	Controls.ThirdChoice:LocalizeAndSetText("TXT_KEY_CHOICE_INDUST_THREE");
	Controls.Choice1:LocalizeAndSetText("TXT_KEY_BUTTON_INDUST_ONE");
	Controls.FirstResult:LocalizeAndSetText("TXT_KEY_RESULT_INDUST_ONE");
	Controls.Choice2:LocalizeAndSetText("TXT_KEY_BUTTON_INDUST_TWO");
	Controls.SecondResult:LocalizeAndSetText("TXT_KEY_RESULT_INDUST_TWO");
	Controls.Choice3:LocalizeAndSetText("TXT_KEY_BUTTON_INDUST_THREE");
	Controls.ThirdResult:LocalizeAndSetText("TXT_KEY_RESULT_INDUST_THREE");
	function OnChoice1(playerID)
		for pCity in pPlayer:Cities() do
			pCity:ChangeBaseYieldRateFromBuildings(YieldTypes.YIELD_HEALTH, -2)
			pCity:ChangeBaseYieldRateFromBuildings(YieldTypes.YIELD_PRODUCTION, 5)
		end
	ContextPtr:SetHide(true)
	end
	Controls.Choice1:RegisterCallback(Mouse.eLClick, OnChoice1)
	function OnChoice2(playerID)
		for pCity in pPlayer:Cities() do
			pCity:ChangeBaseYieldRateFromBuildings(YieldTypes.YIELD_HEALTH, 5)
			pCity:ChangeBaseYieldRateFromBuildings(YieldTypes.YIELD_PRODUCTION, -2)
		end
	
		ContextPtr:SetHide(true)
	end
	Controls.Choice2:RegisterCallback(Mouse.eLClick, OnChoice2)
	function OnChoice3(playerID)
		for pCity in pPlayer:Cities() do
			pCity:ChangeBaseYieldRateFromBuildings(YieldTypes.YIELD_HEALTH, 1)
			pCity:ChangeBaseYieldRateFromBuildings(YieldTypes.YIELD_PRODUCTION, 1)
		end
		pPlayer:ChangeGold(-250);
	ContextPtr:SetHide(true)
	end
	Controls.Choice3:RegisterCallback(Mouse.eLClick, OnChoice3)
end

-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
function DecisionEvent11(playerID)
	local pPlayer = Players[playerID];
	local capCity = pPlayer:GetCapitalCity();
	local iBomb = Game.Rand(100, "Bomb Chance");
	local iterrorchance = 100
	print("Terror");
	 ContextPtr:SetHide(false)
	Controls.Description:LocalizeAndSetText("TXT_KEY_DESCRIP_TERROR");
    Controls.EventImage:SetTexture("terror.dds");
	Controls.FirstChoice:LocalizeAndSetText("TXT_KEY_CHOICE_TERROR_ONE");
	Controls.SecondChoice:LocalizeAndSetText("TXT_KEY_CHOICE_TERROR_TWO");
	Controls.ThirdChoice:LocalizeAndSetText("TXT_KEY_CHOICE_TERROR_THREE");
	Controls.Choice1:LocalizeAndSetText("TXT_KEY_BUTTON_TERROR_ONE");
	Controls.FirstResult:LocalizeAndSetText("TXT_KEY_RESULT_TERROR_ONE");
	Controls.Choice2:LocalizeAndSetText("TXT_KEY_BUTTON_TERROR_TWO");
	Controls.SecondResult:LocalizeAndSetText("TXT_KEY_RESULT_TERROR_TWO");
	Controls.Choice3:LocalizeAndSetText("TXT_KEY_BUTTON_TERROR_THREE");
	Controls.ThirdResult:LocalizeAndSetText("TXT_KEY_RESULT_TERROR_THREE");
	print("test2");
	function OnChoice1(playerID)
		for pCity in pPlayer:Cities() do
			if(pCity:IsHasBuilding(GameInfo.Buildings["BUILDING_POLICE_STATION"].ID) == false) then
				pCity:SetNumRealBuilding(GameInfo.Buildings["BUILDING_POLICE_STATION"].ID, 1);
			end
		end
		pPlayer:ChangeGold(-400);
		iterrorchance = 95
	ContextPtr:SetHide(true)
		if iterrorchance < iBomb then 
		TerrorBomb(pPlayer)
		end
	end
	Controls.Choice1:RegisterCallback(Mouse.eLClick, OnChoice1)
	print("test2");
	function OnChoice2(playerID)
		local iTourism = pPlayer:GetTourism();
		if iTourism == nil then iTourism = 4 end
		local iTourismMod = math.ceil(iTourism / 4)
		capCity:ChangeBaseYieldRateFromBuildings(YieldTypes.YIELD_TOURISM, - iTourismMod)
		iterrorchance = 75	
		ContextPtr:SetHide(true)
		if iterrorchance < iBomb then 
		TerrorBomb(pPlayer)
		end
	end
	Controls.Choice2:RegisterCallback(Mouse.eLClick, OnChoice2)
	print("test3");
	function OnChoice3(playerID)
		iterrorchance = 45
		ContextPtr:SetHide(true)
		if iterrorchance < iBomb then 
		TerrorBomb(pPlayer)
		end
	end
	Controls.Choice3:RegisterCallback(Mouse.eLClick, OnChoice3)
	
	
end

-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
function DecisionEvent12(playerID)
	local pPlayer = Players[playerID];
	print("Social");
	 ContextPtr:SetHide(false)
	Controls.Description:LocalizeAndSetText("TXT_KEY_DESCRIP_SOCIAL");
    Controls.EventImage:SetTexture("social.dds");
	Controls.FirstChoice:LocalizeAndSetText("TXT_KEY_CHOICE_SOCIAL_ONE");
	Controls.SecondChoice:LocalizeAndSetText("TXT_KEY_CHOICE_SOCIAL_TWO");
	Controls.ThirdChoice:LocalizeAndSetText("TXT_KEY_CHOICE_SOCIAL_THREE");
	Controls.Choice1:LocalizeAndSetText("TXT_KEY_BUTTON_SOCIAL_ONE");
	Controls.FirstResult:LocalizeAndSetText("TXT_KEY_RESULT_SOCIAL_ONE");
	Controls.Choice2:LocalizeAndSetText("TXT_KEY_BUTTON_SOCIAL_TWO");
	Controls.SecondResult:LocalizeAndSetText("TXT_KEY_RESULT_SOCIAL_TWO");
	Controls.Choice3:LocalizeAndSetText("TXT_KEY_BUTTON_SOCIAL_THREE");
	Controls.ThirdResult:LocalizeAndSetText("TXT_KEY_RESULT_SOCIAL_THREE");
	function OnChoice1(playerID)
		local pTeamID = pPlayer:GetTeam();
		local pTeam = Teams[pTeamID];
		local pTeamTechs = pTeam:GetTeamTechs();
		pPlayer:ChangeNumFreeTenets(1)
		local iTech = pPlayer:GetCurrentResearch();
		local techProgress = pPlayer:GetResearchCost(iTech);
		pTeamTechs:ChangeResearchProgress(iTech, -100 , pPlayer)
	ContextPtr:SetHide(true)
		
	end
	Controls.Choice1:RegisterCallback(Mouse.eLClick, OnChoice1)
	function OnChoice2(playerID)
		for pCity in pPlayer:Cities() do
			if(pCity:IsHasBuilding(GameInfo.Buildings["BUILDING_STADIUM"].ID) == false) then
				pCity:SetNumRealBuilding(GameInfo.Buildings["BUILDING_STADIUM"].ID, 1);
			end
		end
		pPlayer:ChangeGold(-500);
		ContextPtr:SetHide(true)
		
	end
	Controls.Choice2:RegisterCallback(Mouse.eLClick, OnChoice2)
	function OnChoice3(playerID)
		local iResourceID = GameInfoTypes["RESOURCE_MANPOWER"];
		pPlayer:ChangeNumResourceTotal(iResourceID, 10)
		local irevoltchance = Game.Rand(100, "Revolt");
		if irevoltchance >30 then
			pPlayer:ChangeExtraHappinessPerCity(-15  / numCities);
		else
			CitizenRevolt(pPlayer)
		end
		ContextPtr:SetHide(true)
		
	end
	Controls.Choice3:RegisterCallback(Mouse.eLClick, OnChoice3)
	
	
end

-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
function DecisionEvent13(playerID)
	local pPlayer = Players[playerID];
	local capCity = pPlayer:GetCapitalCity();
	print("MARSBASE");
	 ContextPtr:SetHide(false)
	Controls.Description:LocalizeAndSetText("TXT_KEY_DESCRIP_MARSBASE");
    Controls.EventImage:SetTexture("marscolony.dds");
	Controls.FirstChoice:LocalizeAndSetText("TXT_KEY_CHOICE_MARSBASE_ONE");
	Controls.SecondChoice:LocalizeAndSetText("TXT_KEY_CHOICE_MARSBASE_TWO");
	Controls.ThirdChoice:LocalizeAndSetText("TXT_KEY_CHOICE_MARSBASE_THREE");
	Controls.Choice1:LocalizeAndSetText("TXT_KEY_BUTTON_MARSBASE_ONE");
	Controls.FirstResult:LocalizeAndSetText("TXT_KEY_RESULT_MARSBASE_ONE");
	Controls.Choice2:LocalizeAndSetText("TXT_KEY_BUTTON_MARSBASE_TWO");
	Controls.SecondResult:LocalizeAndSetText("TXT_KEY_RESULT_MARSBASE_TWO");
	Controls.Choice3:LocalizeAndSetText("TXT_KEY_BUTTON_MARSBASE_THREE");
	Controls.ThirdResult:LocalizeAndSetText("TXT_KEY_RESULT_MARSBASE_THREE");
	function OnChoice1(playerID)
		for pResource in GameInfo.Resources() do
			local iResourceLoop = pResource.ID;
			if (Game.GetResourceUsageType(iResourceLoop) == ResourceUsageTypes.RESOURCEUSAGE_STRATEGIC) then
				iNumTotal = pPlayer:GetNumResourceTotal(iResourceLoop, true);
				if iNumTotal > 0 then
					if pResource.Type ~= "RESOURCE_HORSE" then					
					pPlayer:ChangeNumResourceTotal(iResourceLoop, 25);
					end
				end
			end
		end
		pPlayer:ChangeGold(-1000);
	ContextPtr:SetHide(true)
		
	end
	Controls.Choice1:RegisterCallback(Mouse.eLClick, OnChoice1)
	function OnChoice2(playerID)
		capCity:ChangeBaseYieldRateFromBuildings(YieldTypes.YIELD_SCIENCE, 50)
		pPlayer:ChangeGold(-1200);
		ContextPtr:SetHide(true)
		
	end
	Controls.Choice2:RegisterCallback(Mouse.eLClick, OnChoice2)
	function OnChoice3(playerID)
		local iNumColonists = 0
		for pCity in pPlayer:Cities() do
			local iLocalPop = pCity:GetPopulation();
			if iLocalPop >= 6 then
				pCity:ChangePopulation(-2)
				iNumColonists = iNumColonists + 1;
			end
		end

		if iNumColonists > 0 then
		capCity:ChangeBaseYieldRateFromBuildings(YieldTypes.YIELD_GOLD, (iNumColonists * 5))	
		ContextPtr:SetHide(true)
		end
	end
	Controls.Choice3:RegisterCallback(Mouse.eLClick, OnChoice3)
	
	
end
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
function DecisionEvent14(playerID)
	local pPlayer = Players[playerID];
	local numCities = pPlayer:GetNumCities()
	print("Tribal");
	 ContextPtr:SetHide(false)
	Controls.Description:LocalizeAndSetText("TXT_KEY_DESCRIP_TRIBAL");
    Controls.EventImage:SetTexture("Tribal.dds");
	Controls.FirstChoice:LocalizeAndSetText("TXT_KEY_CHOICE_TRIBAL_ONE");
	Controls.SecondChoice:LocalizeAndSetText("TXT_KEY_CHOICE_TRIBAL_TWO");
	Controls.ThirdChoice:LocalizeAndSetText("TXT_KEY_CHOICE_TRIBAL_THREE");
	Controls.Choice1:LocalizeAndSetText("TXT_KEY_BUTTON_TRIBAL_ONE");
	Controls.FirstResult:LocalizeAndSetText("TXT_KEY_RESULT_TRIBAL_ONE");
	Controls.Choice2:LocalizeAndSetText("TXT_KEY_BUTTON_TRIBAL_TWO");
	Controls.SecondResult:LocalizeAndSetText("TXT_KEY_RESULT_TRIBAL_TWO");
	Controls.Choice3:LocalizeAndSetText("TXT_KEY_BUTTON_TRIBAL_THREE");
	Controls.ThirdResult:LocalizeAndSetText("TXT_KEY_RESULT_TRIBAL_THREE");
	function OnChoice1(playerID)
		pPlayer:ChangeJONSCulture(25)
		pPlayer:ChangeGold(-10);
	ContextPtr:SetHide(true)
		
	end
	Controls.Choice1:RegisterCallback(Mouse.eLClick, OnChoice1)
	function OnChoice2(playerID)
		pPlayer:ChangeJONSCulture(15)
		pPlayer:ChangeExtraHappinessPerCity(-4 / numCities)
		ContextPtr:SetHide(true)
		
	end
	Controls.Choice2:RegisterCallback(Mouse.eLClick, OnChoice2)
	function OnChoice3(playerID)
		local iCultureChance = Game.Rand(100, "Plus Minus");
		local iCultureChange = math.random(1,20);
		if iCultureChance > 50 then 
			pPlayer:ChangeJONSCulture(iCultureChange);
		else
			pPlayer:ChangeJONSCulture(-iCultureChange);
		end
		ContextPtr:SetHide(true)
	end
	Controls.Choice3:RegisterCallback(Mouse.eLClick, OnChoice3)
	
	
end
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
function DecisionEvent15(playerID)
	local pPlayer = Players[playerID];
	print("BARBS");
	 ContextPtr:SetHide(false)
	Controls.Description:LocalizeAndSetText("TXT_KEY_DESCRIP_BARBS");
    Controls.EventImage:SetTexture("Barbs.dds");
	Controls.FirstChoice:LocalizeAndSetText("TXT_KEY_CHOICE_BARBS_ONE");
	Controls.SecondChoice:LocalizeAndSetText("TXT_KEY_CHOICE_BARBS_TWO");
	Controls.ThirdChoice:LocalizeAndSetText("TXT_KEY_CHOICE_BARBS_THREE");
	Controls.Choice1:LocalizeAndSetText("TXT_KEY_BUTTON_BARBS_ONE");
	Controls.FirstResult:LocalizeAndSetText("TXT_KEY_RESULT_BARBS_ONE");
	Controls.Choice2:LocalizeAndSetText("TXT_KEY_BUTTON_BARBS_TWO");
	Controls.SecondResult:LocalizeAndSetText("TXT_KEY_RESULT_BARBS_TWO");
	Controls.Choice3:LocalizeAndSetText("TXT_KEY_BUTTON_BARBS_THREE");
	Controls.ThirdResult:LocalizeAndSetText("TXT_KEY_RESULT_BARBS_THREE");
	function OnChoice1(playerID)
		pPlayer:ChangeGold(-100);
	ContextPtr:SetHide(true)
		
	end
	Controls.Choice1:RegisterCallback(Mouse.eLClick, OnChoice1)
	function OnChoice2(playerID)
		pPlayer:ChangeGold(-25);
		local iBarbAttack = Game.Rand(100, "Bard Attack");
		if iBarbAttack < 25 then
			BarbAttack(pPlayer)
		end
		ContextPtr:SetHide(true)
		
	end
	Controls.Choice2:RegisterCallback(Mouse.eLClick, OnChoice2)
	function OnChoice3(playerID)
		BarbAttack(pPlayer)
		ContextPtr:SetHide(true)
	end
	Controls.Choice3:RegisterCallback(Mouse.eLClick, OnChoice3)
	
	
end
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
function DecisionEvent16(playerID)
	local pPlayer = Players[playerID];
	local pMinorChoice = GetRandomMinor();
	local pMinorID = pMinorChoice.ID
	local sCsName = pMinorChoice:GetName();
	print("DiploMarr");
	 ContextPtr:SetHide(false)
	Controls.Description:LocalizeAndSetText("TXT_KEY_DESCRIP_DIPLOMARR", sCsName);
    Controls.EventImage:SetTexture("DiploMarr.dds");
	Controls.FirstChoice:LocalizeAndSetText("TXT_KEY_CHOICE_DIPLOMARR_ONE");
	Controls.SecondChoice:LocalizeAndSetText("TXT_KEY_CHOICE_DIPLOMARR_TWO");
	Controls.ThirdChoice:LocalizeAndSetText("TXT_KEY_CHOICE_DIPLOMARR_THREE");
	Controls.Choice1:LocalizeAndSetText("TXT_KEY_BUTTON_DIPLOMARR_ONE");
	Controls.FirstResult:LocalizeAndSetText("TXT_KEY_RESULT_DIPLOMARR_ONE");
	Controls.Choice2:LocalizeAndSetText("TXT_KEY_BUTTON_DIPLOMARR_TWO");
	Controls.SecondResult:LocalizeAndSetText("TXT_KEY_RESULT_DIPLOMARR_TWO");
	Controls.Choice3:LocalizeAndSetText("TXT_KEY_BUTTON_DIPLOMARR_THREE");
	Controls.ThirdResult:LocalizeAndSetText("TXT_KEY_RESULT_DIPLOMARR_THREE");
	function OnChoice1(playerID)
		pPlayer:ChangeMinorCivFriendshipWithMajor(pMinorID, 100);
		pPlayer:ChangeGold(-50);
	ContextPtr:SetHide(true)
		
	end
	Controls.Choice1:RegisterCallback(Mouse.eLClick, OnChoice1)
	function OnChoice2(playerID)
		pPlayer:ChangeMinorCivFriendshipWithMajor(pMinorID, 20);
		pPlayer:ChangeGold(-25);
		ContextPtr:SetHide(true)
		
	end
	Controls.Choice2:RegisterCallback(Mouse.eLClick, OnChoice2)
	function OnChoice3(playerID)
		pPlayer:ChangeMinorCivFriendshipWithMajor(pMinorID, -25);
		local iRandIncite = Game.Rand(100, "Incite Chance");
		if iRandIncite > 17 then
		pPlayer:ChangeMinorCivFriendshipWithMajor(pMinorID, -100);
		ContextPtr:SetHide(true)
		end
	end
	Controls.Choice3:RegisterCallback(Mouse.eLClick, OnChoice3)
	
	
end
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
function DecisionEvent17(playerID)
	local pPlayer = Players[playerID];
	print("Sanitation");
	 ContextPtr:SetHide(false)
	Controls.Description:LocalizeAndSetText("TXT_KEY_DESCRIP_SANIT");
    Controls.EventImage:SetTexture("TwoRats.dds");
	Controls.FirstChoice:LocalizeAndSetText("TXT_KEY_CHOICE_SANIT_ONE");
	Controls.SecondChoice:LocalizeAndSetText("TXT_KEY_CHOICE_SANIT_TWO");
	Controls.ThirdChoice:LocalizeAndSetText("TXT_KEY_CHOICE_SANIT_THREE");
	Controls.Choice1:LocalizeAndSetText("TXT_KEY_BUTTON_SANIT_ONE");
	Controls.FirstResult:LocalizeAndSetText("TXT_KEY_RESULT_SANIT_ONE");
	Controls.Choice2:LocalizeAndSetText("TXT_KEY_BUTTON_SANIT_TWO");
	Controls.SecondResult:LocalizeAndSetText("TXT_KEY_RESULT_SANIT_TWO");
	Controls.Choice3:LocalizeAndSetText("TXT_KEY_BUTTON_SANIT_THREE");
	Controls.ThirdResult:LocalizeAndSetText("TXT_KEY_RESULT_SANIT_THREE");
	function OnChoice1(playerID)
		for pCity in pPlayer:Cities() do
			if(pCity:IsHasBuilding(GameInfo.Buildings["BUILDING_SEWER_SYSTEM"].ID) == false) then
				pCity:SetNumRealBuilding(GameInfo.Buildings["BUILDING_SEWER_SYSTEM"].ID, 1);
			end
		end
		pPlayer:ChangeGold(-500);
	ContextPtr:SetHide(true)
		
	end
	Controls.Choice1:RegisterCallback(Mouse.eLClick, OnChoice1)
	function OnChoice2(playerID)
		for pCity in pPlayer:Cities() do
			pCity:ChangeBaseYieldRateFromBuildings(YieldTypes.YIELD_HEALTH, 2)
		end
		pPlayer:ChangeGold(-100);
		ContextPtr:SetHide(true)
		
	end
	Controls.Choice2:RegisterCallback(Mouse.eLClick, OnChoice2)
	function OnChoice3(playerID)
		for pCity in pPlayer:Cities() do
			pCity:ChangeBaseYieldRateFromBuildings(YieldTypes.YIELD_HEALTH, -2)
		end
		pPlayer:ChangeGold(100);
	end
	Controls.Choice3:RegisterCallback(Mouse.eLClick, OnChoice3)
	
	
end
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
function DecisionEvent18(playerID)
	local pPlayer = Players[playerID];
	local otherPlayer = GetRandomOtherPlayer(pPlayer);
	local otherName = otherPlayer:GetName();
	print("COVERT");
	 ContextPtr:SetHide(false)
	Controls.Description:LocalizeAndSetText("TXT_KEY_DESCRIP_COVERT", otherName);
    Controls.EventImage:SetTexture("covert.dds");
	Controls.FirstChoice:LocalizeAndSetText("TXT_KEY_CHOICE_COVERT_ONE");
	Controls.SecondChoice:LocalizeAndSetText("TXT_KEY_CHOICE_COVERT_TWO");
	Controls.ThirdChoice:LocalizeAndSetText("TXT_KEY_CHOICE_COVERT_THREE");
	Controls.Choice1:LocalizeAndSetText("TXT_KEY_BUTTON_COVERT_ONE");
	Controls.FirstResult:LocalizeAndSetText("TXT_KEY_RESULT_COVERT_ONE");
	Controls.Choice2:LocalizeAndSetText("TXT_KEY_BUTTON_COVERT_TWO");
	Controls.SecondResult:LocalizeAndSetText("TXT_KEY_RESULT_COVERT_TWO");
	Controls.Choice3:LocalizeAndSetText("TXT_KEY_BUTTON_COVERT_THREE");
	Controls.ThirdResult:LocalizeAndSetText("TXT_KEY_RESULT_COVERT_THREE");
	function OnChoice1(playerID)
		local killUnit = {}
		local killChance = 0
		for unit in otherPlayer:Units() do
			killUnit[killChance] = unit
			killChance = killChance + 1
		end
		for i = 1, 3 do
			killUnit[i]:Kill();
		end
		local randCatch = Game.Rand(100, "rand catch");
		if randCatch < 20 then
			playerAction = 1
			CivReaction(pPlayer, otherPlayer, playerAction)
		else
			text = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_SUMMARY_COVERTSUC"), mResource;
			heading = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_COVERTSUC");
			pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, text, heading);
	ContextPtr:SetHide(true)
		end
	end
	Controls.Choice1:RegisterCallback(Mouse.eLClick, OnChoice1)
	function OnChoice2(playerID)
		local diploChance = Game.Rand(100, "Diplo");
		if diploChance > 15 then
			text = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_SUMMARY_DIPLOSUC"), mResource;
			heading = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_DIPLOSUC");
			pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, text, heading);
		else
			playerAction = 2
			CivReaction(pPlayer, otherPlayer, playerAction)
		end
		ContextPtr:SetHide(true)
		
	end
	Controls.Choice2:RegisterCallback(Mouse.eLClick, OnChoice2)
	function OnChoice3(playerID)
		local randChance = Game.Rand(100, "rand");
		if randChance > 20 then
		playerAction = 3
		CivReaction(pPlayer, otherPlayer, playerAction)
		end
	end
	Controls.Choice3:RegisterCallback(Mouse.eLClick, OnChoice3)
	
	
end
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
function DecisionEvent19(playerID)
	local pPlayer = Players[playerID];
	local numCities = pPlayer:GetNumCities()
	local improveType = GameInfoTypes["IMPROVEMENT_LUMBERMILL"]
	local iNumMills = pPlayer:GetImprovementCount(GameInfoTypes["IMPROVEMENT_LUMBERMILL"]);
	print("mills", iNumMills);
	local numKill = math.ceil(iNumMills / 2);	
		print("protest");
		 ContextPtr:SetHide(false)
		Controls.Description:LocalizeAndSetText("TXT_KEY_DESCRIP_PROTEST");
	    Controls.EventImage:SetTexture("forest.dds");
		Controls.FirstChoice:LocalizeAndSetText("TXT_KEY_CHOICE_PROTEST_ONE");
		Controls.SecondChoice:LocalizeAndSetText("TXT_KEY_CHOICE_PROTEST_TWO");
		Controls.ThirdChoice:LocalizeAndSetText("TXT_KEY_CHOICE_PROTEST_THREE");
		Controls.Choice1:LocalizeAndSetText("TXT_KEY_BUTTON_PROTEST_ONE");
		Controls.FirstResult:LocalizeAndSetText("TXT_KEY_RESULT_PROTEST_ONE", numKill);
		Controls.Choice2:LocalizeAndSetText("TXT_KEY_BUTTON_PROTEST_TWO");
		Controls.SecondResult:LocalizeAndSetText("TXT_KEY_RESULT_PROTEST_TWO");
		Controls.Choice3:LocalizeAndSetText("TXT_KEY_BUTTON_PROTEST_THREE");
		Controls.ThirdResult:LocalizeAndSetText("TXT_KEY_RESULT_PROTEST_THREE");
		function OnChoice1(playerID)
			
			pPlayer:ChangeExtraHappinessPerCity(4)
			DestroyImprovement(pPlayer, improveType, numKill)
		ContextPtr:SetHide(true)
		
		end
		Controls.Choice1:RegisterCallback(Mouse.eLClick, OnChoice1)
		function OnChoice2(playerID)
			for pCity in pPlayer:Cities() do
				local n = pCity:GetNumCityPlots() - 1
				for i = 1, n, 1 do
				local plot = pCity:GetCityIndexPlot( i );
					if plot then
						if plot:GetImprovementType() == improveType then
							plot:SetImprovementType(-1);
							break
						end
					end
				end
			end
			pPlayer:ChangeExtraHappinessPerCity(3 / numCities)
		ContextPtr:SetHide(true)
		
		end
		Controls.Choice2:RegisterCallback(Mouse.eLClick, OnChoice2)
		function OnChoice3(playerID)
			pPlayer:ChangeExtraHappinessPerCity(-2)
			for pCity in pPlayer:Cities() do
				local n = pCity:GetNumCityPlots() - 1
				for i = 1, n, 1 do
				local plot = pCity:GetCityIndexPlot( i );
					if plot then
						local plotType = plot:GetPlotType();
						local plotimrove = plot:GetImprovementType();
						if (plotType == PlotTypes.PLOT_FOREST) and (plotimrove == -1) then
							plot:SetImprovementType(GameInfoTypes["IMPROVEMENT_LUMBERMILL"]);
							break
						end
					end
				end
			end

		ContextPtr:SetHide(true)	
		end
		Controls.Choice3:RegisterCallback(Mouse.eLClick, OnChoice3)
	
	
end
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
function DecisionEvent20(playerID)
	local pPlayer = Players[playerID];
	local iUranium = GameInfoTypes["RESOURCE_URANIUM"];
	local iUraniumTotal = pPlayer:GetNumResourceTotal(iUranium, true)
	local iUraniumCut = math.ceil(iUraniumTotal / 3)
		print("Nuclear");
		 ContextPtr:SetHide(false)
		Controls.Description:LocalizeAndSetText("TXT_KEY_DESCRIP_NUCLEAR");
	    Controls.EventImage:SetTexture("nuclear.dds");
		Controls.FirstChoice:LocalizeAndSetText("TXT_KEY_CHOICE_NUCLEAR_ONE");
		Controls.SecondChoice:LocalizeAndSetText("TXT_KEY_CHOICE_NUCLEAR_TWO");
		Controls.ThirdChoice:LocalizeAndSetText("TXT_KEY_CHOICE_NUCLEAR_THREE");
		Controls.Choice1:LocalizeAndSetText("TXT_KEY_BUTTON_NUCLEAR_ONE");
		Controls.FirstResult:LocalizeAndSetText("TXT_KEY_RESULT_NUCLEAR_ONE", iUraniumCut);
		Controls.Choice2:LocalizeAndSetText("TXT_KEY_BUTTON_NUCLEAR_TWO");
		Controls.SecondResult:LocalizeAndSetText("TXT_KEY_RESULT_NUCLEAR_TWO", iUraniumCut);
		Controls.Choice3:LocalizeAndSetText("TXT_KEY_BUTTON_NUCLEAR_THREE");
		Controls.ThirdResult:LocalizeAndSetText("TXT_KEY_RESULT_NUCLEAR_THREE");
		function OnChoice1(playerID)
			pPlayer:ChangeNumResourceTotal(iUranium, -iUraniumCut)
			for iCS = GameDefines.MAX_MAJOR_CIVS, GameDefines.MAX_CIV_PLAYERS-1, 1 do
				local pCS = Players[iCS]
				if pCS:IsEverAlive() then
					pPlayer:ChangeMinorCivFriendshipWithMajor(pCS.ID, 65);
				end
			end

		ContextPtr:SetHide(true)
		
		end
		Controls.Choice1:RegisterCallback(Mouse.eLClick, OnChoice1)
		function OnChoice2(playerID)
			pPlayer:ChangeNumResourceTotal(iUranium, iUraniumCut)
			for iCS = GameDefines.MAX_MAJOR_CIVS, GameDefines.MAX_CIV_PLAYERS-1, 1 do
				local pCS = Players[iCS]
				if pCS:IsEverAlive() then
					pPlayer:ChangeMinorCivFriendshipWithMajor(pCS.ID, -65);
				end
			end
		ContextPtr:SetHide(true)
		
		end
		Controls.Choice2:RegisterCallback(Mouse.eLClick, OnChoice2)
		function OnChoice3(playerID)
			local iRandChance = Game.Rand(100, "chance");
			if iRandChance <= 20 then
				for iCS = GameDefines.MAX_MAJOR_CIVS, GameDefines.MAX_CIV_PLAYERS-1, 1 do
					local pCS = Players[iCS]
					if pCS:IsEverAlive() then
						pPlayer:ChangeMinorCivFriendshipWithMajor(pCS.ID, -25);
					end
				end
			end
		ContextPtr:SetHide(true)	
		end
		Controls.Choice3:RegisterCallback(Mouse.eLClick, OnChoice3)
	
	
end
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
function DecisionEvent21(playerID)
	local pPlayer = Players[playerID];

		print("asteroid");
		 ContextPtr:SetHide(false)
		Controls.Description:LocalizeAndSetText("TXT_KEY_DESCRIP_ASTEROID");
	    Controls.EventImage:SetTexture("nuclear.dds");
		Controls.FirstChoice:LocalizeAndSetText("TXT_KEY_CHOICE_ASTEROID_ONE");
		Controls.SecondChoice:LocalizeAndSetText("TXT_KEY_CHOICE_ASTEROID_TWO");
		Controls.ThirdChoice:LocalizeAndSetText("TXT_KEY_CHOICE_ASTEROID_THREE");
		Controls.Choice1:LocalizeAndSetText("TXT_KEY_BUTTON_ASTEROID_ONE");
		Controls.FirstResult:LocalizeAndSetText("TXT_KEY_RESULT_ASTEROID_ONE");
		Controls.Choice2:LocalizeAndSetText("TXT_KEY_BUTTON_ASTEROID_TWO");
		Controls.SecondResult:LocalizeAndSetText("TXT_KEY_RESULT_ASTEROID_TWO");
		Controls.Choice3:LocalizeAndSetText("TXT_KEY_BUTTON_ASTEROID_THREE");
		Controls.ThirdResult:LocalizeAndSetText("TXT_KEY_RESULT_ASTEROID_THREE");
		function OnChoice1(playerID)
			local iRandImpact = Game.Rand(100, "Impact chance");
			if iRandImpact > 85 then
			AstroidStrike(pPlayer)
			else
				text = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_SUMMARY_ASTGOOD"), gGold;
				heading = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_ASTGOOD");
				pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, text, heading);
		ContextPtr:SetHide(true)
			end
		end
		Controls.Choice1:RegisterCallback(Mouse.eLClick, OnChoice1)
		function OnChoice2(playerID)
			local iRandImpact = Game.Rand(100, "Impact chance");
			if iRandImpact > 70 then
			AstroidStrike(pPlayer)
			else
				text = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_SUMMARY_ASTGOOD"), gGold;
				heading = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_ASTGOOD");
				pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, text, heading);	
		ContextPtr:SetHide(true)
			end
		end
		Controls.Choice2:RegisterCallback(Mouse.eLClick, OnChoice2)
		function OnChoice3(playerID)
			local iRandImpact = Game.Rand(100, "Impact chance");
			if iRandImpact > 65 then
				local iRandResult = Game.Rand(100, "Impact type");
				print("impact", iRandImpact, iRandResult);
				if iRandResult >50 then
					MultiAstroidStrike(pPlayer)
				else
					AstroidStrike(pPlayer)
				end
			else
				text = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_SUMMARY_ASTGOOD"), gGold;
				heading = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_ASTGOOD");
				pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, text, heading);
			end
		ContextPtr:SetHide(true)	
		end
		Controls.Choice3:RegisterCallback(Mouse.eLClick, OnChoice3)
	
	
end
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
function DecisionEvent22(playerID)
	local pPlayer = Players[playerID];
	local capCity = pPlayer:GetCapitalCity();
	local cityState = GetCityStateNearestToCity(capCity);
	if cityState == nil then return end
	local capName = capCity:GetName();
	local csName = cityState:GetName();
	local cityStateID = cityState.ID
		print("EXILES");
		 ContextPtr:SetHide(false)
		Controls.Description:LocalizeAndSetText("TXT_KEY_DESCRIP_EXILES", csName, capName);
	    Controls.EventImage:SetTexture("exiles.dds");
		Controls.FirstChoice:LocalizeAndSetText("TXT_KEY_CHOICE_EXILES_ONE");
		Controls.SecondChoice:LocalizeAndSetText("TXT_KEY_CHOICE_EXILES_TWO");
		Controls.ThirdChoice:LocalizeAndSetText("TXT_KEY_CHOICE_EXILES_THREE");
		Controls.Choice1:LocalizeAndSetText("TXT_KEY_BUTTON_EXILES_ONE");
		Controls.FirstResult:LocalizeAndSetText("TXT_KEY_RESULT_EXILES_ONE", csName);
		Controls.Choice2:LocalizeAndSetText("TXT_KEY_BUTTON_EXILES_TWO");
		Controls.SecondResult:LocalizeAndSetText("TXT_KEY_RESULT_EXILES_TWO", csName);
		Controls.Choice3:LocalizeAndSetText("TXT_KEY_BUTTON_EXILES_THREE");
		Controls.ThirdResult:LocalizeAndSetText("TXT_KEY_RESULT_EXILES_THREE");
		function OnChoice1(playerID)
			capCity:ChangePopulation(2, true);
			pPlayer:ChangeMinorCivFriendshipWithMajor(cityStateID, -25);

		ContextPtr:SetHide(true)
			
		end
		Controls.Choice1:RegisterCallback(Mouse.eLClick, OnChoice1)
		function OnChoice2(playerID)
			pPlayer:ChangeMinorCivFriendshipWithMajor(cityStateID, 25);
			local iPillageChance = Game.Rand(100, "Pillage chance");
			if iPillageChance < 20 then
				local n = capCity:GetNumCityPlots() - 1
				for i = 1, n, 1 do
					local plot = capCity:GetCityIndexPlot( i );
					if (plot:GetImprovementType() ~= NO_IMPROVEMENT) then
						plot:SetImprovementPillaged(true);
						break
					end
				end
			end
		ContextPtr:SetHide(true)
			
		end
		Controls.Choice2:RegisterCallback(Mouse.eLClick, OnChoice2)
		function OnChoice3(playerID)
			local iSlaveChance = Game.Rand(100, "Slave chance");
			if iSlaveChance > 35 then
				local iResourceID = GameInfoTypes["RESOURCE_MANPOWER"];
				pPlayer:ChangeNumResourceTotal(iResourceID, 2);
			else 
				local pOtherPlayer = Players[63];
				local iX = capCity:GetX();
				local iY = capCity:GetY();
				for i = 1, iNum do
					unit = pOtherPlayer:InitUnit(GameInfoTypes["UNIT_CAVEMAN"], (iX + 1), iY);
					unit:JumpToNearestValidPlot();	
				end
			end
		ContextPtr:SetHide(true)	
		end
		Controls.Choice3:RegisterCallback(Mouse.eLClick, OnChoice3)
	
	
end
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
function DecisionEvent23(playerID)
	local pPlayer = Players[playerID];
	local targetCity = GetRandomPlayerCity(pPlayer);
	local targetName = targetCity:GetName();
	local cityID = targetCity:GetID();
	local iTurn = Game.GetGameTurn(); 
	local g_FarmChoice = 0;
	local g_FarmTurn = (iTurn + 10);
		print("FarmHarass");
		 ContextPtr:SetHide(false)
		Controls.Description:LocalizeAndSetText("TXT_KEY_DESCRIP_FARMHARASS");
	    Controls.EventImage:SetTexture("wolves.dds");
		Controls.FirstChoice:LocalizeAndSetText("TXT_KEY_CHOICE_FARMHARASS_ONE");
		Controls.SecondChoice:LocalizeAndSetText("TXT_KEY_CHOICE_FARMHARASS_TWO");
		Controls.ThirdChoice:LocalizeAndSetText("TXT_KEY_CHOICE_FARMHARASS_THREE");
		Controls.Choice1:LocalizeAndSetText("TXT_KEY_BUTTON_FARMHARASS_ONE");
		Controls.FirstResult:LocalizeAndSetText("TXT_KEY_RESULT_FARMHARASS_ONE");
		Controls.Choice2:LocalizeAndSetText("TXT_KEY_BUTTON_FARMHARASS_TWO");
		Controls.SecondResult:LocalizeAndSetText("TXT_KEY_RESULT_FARMHARASS_TWO");
		Controls.Choice3:LocalizeAndSetText("TXT_KEY_BUTTON_FARMHARASS_THREE");
		Controls.ThirdResult:LocalizeAndSetText("TXT_KEY_RESULT_FARMHARASS_THREE");
		function OnChoice1(playerID)
			pPlayer:ChangeGold(-80);
			targetCity:ChangeBaseYieldRateFromBuildings(YieldTypes.YIELD_GOLD, 3);
			targetCity:ChangeBaseYieldRateFromBuildings(YieldTypes.YIELD_FOOD, 2);
			g_FarmChoice = 1
			SetPersistentProperty("FarmCoice", g_FarmChoice);
			SetPersistentProperty("FarmCity", cityID);
			SetPersistentProperty("FarmPlayer", iPlayerID);
			SetPersistentProperty("FarmTurn", g_FarmTurn);
		ContextPtr:SetHide(true)
			
		end
		Controls.Choice1:RegisterCallback(Mouse.eLClick, OnChoice1)
		function OnChoice2(playerID)
			targetCity:ChangeBaseYieldRateFromBuildings(YieldTypes.YIELD_GOLD, 2);
			targetCity:ChangeBaseYieldRateFromBuildings(YieldTypes.YIELD_FOOD, 3);
			g_FarmChoice = 2
			SetPersistentProperty("FarmCoice", g_FarmChoice);
			SetPersistentTable("FarmCity", targetCity)
			SetPersistentProperty("FarmTurn", g_FarmTurn);
		ContextPtr:SetHide(true)
			
		end
		Controls.Choice2:RegisterCallback(Mouse.eLClick, OnChoice2)
		function OnChoice3(playerID)
			targetCity:ChangeBaseYieldRateFromBuildings(YieldTypes.YIELD_FOOD, -4);
			g_FarmChoice = 3
			SetPersistentProperty("FarmCoice", g_FarmChoice);
			SetPersistentTable("FarmCity", targetCity)
			SetPersistentProperty("FarmTurn", g_FarmTurn);
		ContextPtr:SetHide(true)	
		end
		Controls.Choice3:RegisterCallback(Mouse.eLClick, OnChoice3)
	
	
end
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
function DecisionEvent24(playerID)
	local pPlayer = Players[playerID];
	local targetCity = GetRandomPlayerPortCity(pPlayer);
	if targetCity == nil then return end
	local iX = targetCity:GetX();
	local iY = targetCity:GetY();
	local otherCiv = GetRandomOtherPlayer(pPlayer);
	local otherCivName = otherCiv:GetName();
		print("Naval");
		 ContextPtr:SetHide(false)
		Controls.Description:LocalizeAndSetText("TXT_KEY_DESCRIP_NAVAL", otherCivName);
	    Controls.EventImage:SetTexture("Gall.dds");
		Controls.FirstChoice:LocalizeAndSetText("TXT_KEY_CHOICE_NAVAL_ONE");
		Controls.SecondChoice:LocalizeAndSetText("TXT_KEY_CHOICE_NAVAL_TWO");
		Controls.ThirdChoice:LocalizeAndSetText("TXT_KEY_CHOICE_NAVAL_THREE");
		Controls.Choice1:LocalizeAndSetText("TXT_KEY_BUTTON_NAVAL_ONE");
		Controls.FirstResult:LocalizeAndSetText("TXT_KEY_RESULT_NAVAL_ONE");
		Controls.Choice2:LocalizeAndSetText("TXT_KEY_BUTTON_NAVAL_TWO");
		Controls.SecondResult:LocalizeAndSetText("TXT_KEY_RESULT_NAVAL_TWO");
		Controls.Choice3:LocalizeAndSetText("TXT_KEY_BUTTON_NAVAL_THREE");
		Controls.ThirdResult:LocalizeAndSetText("TXT_KEY_RESULT_NAVAL_THREE");
		function OnChoice1(playerID)
			pPlayer:ChangeGold(-150)
			pPlayer:InitUnit(GameInfoTypes["UNIT_GALLEASS"], iX, iY);
		ContextPtr:SetHide(true)
			
		end
		Controls.Choice1:RegisterCallback(Mouse.eLClick, OnChoice1)
		function OnChoice2(playerID)
			pPlayer:InitUnit(GameInfoTypes["UNIT_VENETIAN_GALLEASS"], iX, iY);
			otherCiv:DoForceDenounce(pPlayer);
		ContextPtr:SetHide(true)
			
		end
		Controls.Choice2:RegisterCallback(Mouse.eLClick, OnChoice2)
		function OnChoice3(playerID)
		
		ContextPtr:SetHide(true)	
		end
		Controls.Choice3:RegisterCallback(Mouse.eLClick, OnChoice3)
	
	
end
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
function DecisionEvent25(playerID)
	local pPlayer = Players[playerID];
	local targetCity = pPlayer:GetCapitalCity();
	local iTurn = Game.GetGameTurn(); 
	local g_ChurchTurn = (iTurn + 25);
		print("ChuchDef");
		 ContextPtr:SetHide(false)
		Controls.Description:LocalizeAndSetText("TXT_KEY_DESCRIP_CHURCHDEF");
	    Controls.EventImage:SetTexture("churchdef.dds");
		Controls.FirstChoice:LocalizeAndSetText("TXT_KEY_CHOICE_CHURCHDEF_ONE");
		Controls.SecondChoice:LocalizeAndSetText("TXT_KEY_CHOICE_CHURCHDEF_TWO");
		Controls.ThirdChoice:LocalizeAndSetText("TXT_KEY_CHOICE_CHURCHDEF_THREE");
		Controls.Choice1:LocalizeAndSetText("TXT_KEY_BUTTON_CHURCHDEF_ONE");
		Controls.FirstResult:LocalizeAndSetText("TXT_KEY_RESULT_CHURCHDEF_ONE");
		Controls.Choice2:LocalizeAndSetText("TXT_KEY_BUTTON_CHURCHDEF_TWO");
		Controls.SecondResult:LocalizeAndSetText("TXT_KEY_RESULT_CHURCHDEF_TWO");
		Controls.Choice3:LocalizeAndSetText("TXT_KEY_BUTTON_CHURCHDEF_THREE");
		Controls.ThirdResult:LocalizeAndSetText("TXT_KEY_RESULT_CHURCHDEF_THREE");
		function OnChoice1(playerID)
			pPlayer:ChangeExtraHappinessPerCity(-2);
			g_ChurchAction = 1
			SetPersistentProperty("ChurchTurns", g_ChurchTurn);
			SetPersistentProperty("g_ChurchAction", g_ChurchAction);
		ContextPtr:SetHide(true)
			
		end
		Controls.Choice1:RegisterCallback(Mouse.eLClick, OnChoice1)
		function OnChoice2(playerID)
			targetCity:ChangeBaseYieldRateFromBuildings(YieldTypes.YIELD_GOLD, -1);
			targetCity:ChangeBaseYieldRateFromBuildings(YieldTypes.YIELD_FAITH, 3);
		ContextPtr:SetHide(true)
			
		end
		Controls.Choice2:RegisterCallback(Mouse.eLClick, OnChoice2)
		function OnChoice3(playerID)
		
		ContextPtr:SetHide(true)	
		end
		Controls.Choice3:RegisterCallback(Mouse.eLClick, OnChoice3)
	
	
end
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
function DecisionEvent26(playerID)
	local pPlayer = Players[playerID];
	local numCities = pPlayer:GetNumCities();
	local capCity = pPlayer:GetCapitalCity();
		print("AntiSlave");
		 ContextPtr:SetHide(false)
		Controls.Description:LocalizeAndSetText("TXT_KEY_DESCRIP_ANTISLAVE");
	    Controls.EventImage:SetTexture("slavemr.dds");
		Controls.FirstChoice:LocalizeAndSetText("TXT_KEY_CHOICE_ANTISLAVE_ONE");
		Controls.SecondChoice:LocalizeAndSetText("TXT_KEY_CHOICE_ANTISLAVE_TWO");
		Controls.ThirdChoice:LocalizeAndSetText("TXT_KEY_CHOICE_ANTISLAVE_THREE");
		Controls.Choice1:LocalizeAndSetText("TXT_KEY_BUTTON_ANTISLAVE_ONE");
		Controls.FirstResult:LocalizeAndSetText("TXT_KEY_RESULT_ANTISLAVE_ONE");
		Controls.Choice2:LocalizeAndSetText("TXT_KEY_BUTTON_ANTISLAVE_TWO");
		Controls.SecondResult:LocalizeAndSetText("TXT_KEY_RESULT_ANTISLAVE_TWO");
		Controls.Choice3:LocalizeAndSetText("TXT_KEY_BUTTON_ANTISLAVE_THREE");
		Controls.ThirdResult:LocalizeAndSetText("TXT_KEY_RESULT_ANTISLAVE_THREE");
		function OnChoice1(playerID)
			pPlayer:SetPolicyBranchUnlocked(GameInfo.PolicyBranchTypes["POLICY_BRANCH_SLAVERY"].ID, false);
			for pCity in pPlayer:Cities() do
				if(pCity:IsHasBuilding(GameInfo.Buildings["BUILDING_SKLAVENMARKT"].ID)) then
				pCity:SetNumRealBuilding(GameInfo.Buildings["BUILDING_SKLAVENMARKT"].ID, -1);
				pCity:ChangePopulation(2)
				end
			end
			pPlayer:ChangeExtraHappinessPerCity(5);
		ContextPtr:SetHide(true)
			
		end
		Controls.Choice1:RegisterCallback(Mouse.eLClick, OnChoice1)
		function OnChoice2(playerID)
			local randCities = math.random(1, (numCities / 2));
			local apCities = {}
			local iChance = 0;
			if (pPlayer:IsAlive()) then
				for city in pPlayer:Cities() do
					apCities[iChance] = city;
					iChance = iChance + 1;
				end
			end
			if (iChance > 0) then	
				for i = 1, randCities do
					targetCity = apCities[i];
					if(targetCity:IsHasBuilding(GameInfo.Buildings["BUILDING_SKLAVENMARKT"].ID)) then
						targetCity:SetNumRealBuilding(GameInfo.Buildings["BUILDING_SKLAVENMARKT"].ID, -1);
						targetCity:ChangeProduction(-3)
					end
				end
			end
			pPlayer:ChangeExtraHappinessPerCity(3);
		ContextPtr:SetHide(true)
			
		end
		Controls.Choice2:RegisterCallback(Mouse.eLClick, OnChoice2)
		function OnChoice3(playerID)
			local spUnit = GameInfoTypes["UNIT_LONGSWORDSMAN"];
			pPlayer:ChangeExtraHappinessPerCity(-3);
			local iResourceID = GameInfoTypes["RESOURCE_MANPOWER"];
			pPlayer:ChangeNumResourceTotal(iResourceID, 10)
			capCity:ChangeBaseYieldRateFromBuildings(YieldTypes.YIELD_GOLD, 3);
			local randReaction = Game.Rand(200, "reaction");
			if randReaction < 15 then
				CityRevolt(pPlayer, spUnit)
			elseif (randReaction >15 and randReaction < 50) then
				CitizenProtest(pPlayer)
			end
		ContextPtr:SetHide(true)	
		end
		Controls.Choice3:RegisterCallback(Mouse.eLClick, OnChoice3)
	
	
end
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
function DecisionEvent27(playerID)
	local pPlayer = Players[playerID];
	local numCities = pPlayer:GetNumCities();
	local csCity = GetPlayerPuppet(pPlayer);
	local ownerID = csCity:GetOriginalOwner();
	local otherPlayer = Players[ownerID];
	local csName = csCity:GetName();
		print("freepuppet");
		 ContextPtr:SetHide(false)
		Controls.Description:LocalizeAndSetText("TXT_KEY_DESCRIP_FREEPUPPET", csName);
	    Controls.EventImage:SetTexture("csenvoy.dds");
		Controls.FirstChoice:LocalizeAndSetText("TXT_KEY_CHOICE_FREEPUPPET_ONE");
		Controls.SecondChoice:LocalizeAndSetText("TXT_KEY_CHOICE_FREEPUPPET_TWO");
		Controls.ThirdChoice:LocalizeAndSetText("TXT_KEY_CHOICE_FREEPUPPET_THREE");
		Controls.Choice1:LocalizeAndSetText("TXT_KEY_BUTTON_FREEPUPPET_ONE");
		Controls.FirstResult:LocalizeAndSetText("TXT_KEY_RESULT_FREEPUPPET_ONE", csName);
		Controls.Choice2:LocalizeAndSetText("TXT_KEY_BUTTON_FREEPUPPET_TWO");
		Controls.SecondResult:LocalizeAndSetText("TXT_KEY_RESULT_FREEPUPPET_TWO");
		Controls.Choice3:LocalizeAndSetText("TXT_KEY_BUTTON_FREEPUPPET_THREE");
		Controls.ThirdResult:LocalizeAndSetText("TXT_KEY_RESULT_FREEPUPPET_THREE");
		function OnChoice1(playerID)
			pPlayer:ChangeExtraHappinessPerCity(10 / numCities);
			pPlayer:ChangeJONSCulturePerTurnForFree(5);
			otherPlayer:DoMinorLiberationByMajor(playerID)
			CityLostToOther(csCity, otherPlayer)
		ContextPtr:SetHide(true)
			
		end
		Controls.Choice1:RegisterCallback(Mouse.eLClick, OnChoice1)
		function OnChoice2(playerID)
			csCity:SetOccupied(true);
			csCity:ChangeResistanceTurns(10)
			InvalidateCity()
			local iX = csCity:GetX();
			local iY = csCity:GetY(); 
			local csPop = csCity:GetPopulation()
			if csPop >4 then csCity:ChangePopulation(-3) end
			local barbUnit = GameInfoTypes["UNIT_RIFLEMAN"];
			local numBarbs = 3;
			local iX = iX +1
			SpawnBarbs(barbUnit, iX, iY, numBarbs)
		ContextPtr:SetHide(true)
			
		end
		Controls.Choice2:RegisterCallback(Mouse.eLClick, OnChoice2)
		function OnChoice3(playerID)
			csCity:DoTask(TaskTypes.TASK_ANNEX_PUPPET, -1, -1, -1)
			local revChance = Game.Rand(100, "chance");
			if revChance <7 then 
				local iX = csCity:GetX();
				local iY = csCity:GetY(); 
				local iX = iX +1
				local barbUnit = GameInfoTypes["UNIT_RIFLEMAN"];
				local numBarbs = 2;
				SpawnBarbs(barbUnit, iX, iY, numBarbs)
			end
		ContextPtr:SetHide(true)	
		end
		Controls.Choice3:RegisterCallback(Mouse.eLClick, OnChoice3)
	
	
end
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
function DecisionEvent28(playerID)
	local pPlayer = Players[playerID];
		print("military");
		 ContextPtr:SetHide(false)
		Controls.Description:LocalizeAndSetText("TXT_KEY_DESCRIP_MILITARY");
	    Controls.EventImage:SetTexture("military.dds");
		Controls.FirstChoice:LocalizeAndSetText("TXT_KEY_CHOICE_MILITARY_ONE");
		Controls.SecondChoice:LocalizeAndSetText("TXT_KEY_CHOICE_MILITARY_TWO");
		Controls.ThirdChoice:LocalizeAndSetText("TXT_KEY_CHOICE_MILITARY_THREE");
		Controls.Choice1:LocalizeAndSetText("TXT_KEY_BUTTON_MILITARY_ONE");
		Controls.FirstResult:LocalizeAndSetText("TXT_KEY_RESULT_MILITARY_ONE");
		Controls.Choice2:LocalizeAndSetText("TXT_KEY_BUTTON_MILITARY_TWO");
		Controls.SecondResult:LocalizeAndSetText("TXT_KEY_RESULT_MILITARY_TWO");
		Controls.Choice3:LocalizeAndSetText("TXT_KEY_BUTTON_MILITARY_THREE");
		Controls.ThirdResult:LocalizeAndSetText("TXT_KEY_RESULT_MILITARY_THREE");
		function OnChoice1(playerID)
			for unit in pPlayer:Units() do
				strength = unit:GetBaseCombatStrength();
				unit:SetBaseCombatStrength(strength + 1)
			end
			pPlayer:ChangeGold(-500)
		ContextPtr:SetHide(true)
		end
		Controls.Choice1:RegisterCallback(Mouse.eLClick, OnChoice1)
		function OnChoice2(playerID)
			pPlayer.ChangeGarrisonedCityRangeStrikeModifier(1)
			pPlayer:ChangeGold(-350)
		ContextPtr:SetHide(true)
		end
		Controls.Choice2:RegisterCallback(Mouse.eLClick, OnChoice2)
		function OnChoice3(playerID)
			local currExp = pPlayer:GetCombatExperience();
			local adjExp = math.ceil(currExp * .10);
			pPlayer:ChangeCombatExperience(-adjExp);
		ContextPtr:SetHide(true)	
		end
		Controls.Choice3:RegisterCallback(Mouse.eLClick, OnChoice3)
	
	
end
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
function DecisionEvent29(playerID)
	local pPlayer = Players[playerID];
		print("Designdrug");
		 ContextPtr:SetHide(false)
		Controls.Description:LocalizeAndSetText("TXT_KEY_DESCRIP_DESIGNDRUG");
	    Controls.EventImage:SetTexture("ddrug.dds");
		Controls.FirstChoice:LocalizeAndSetText("TXT_KEY_CHOICE_DESIGNDRUG_ONE");
		Controls.SecondChoice:LocalizeAndSetText("TXT_KEY_CHOICE_DESIGNDRUG_TWO");
		Controls.ThirdChoice:LocalizeAndSetText("TXT_KEY_CHOICE_DESIGNDRUG_THREE");
		Controls.Choice1:LocalizeAndSetText("TXT_KEY_BUTTON_DESIGNDRUG_ONE");
		Controls.FirstResult:LocalizeAndSetText("TXT_KEY_RESULT_DESIGNDRUG_ONE");
		Controls.Choice2:LocalizeAndSetText("TXT_KEY_BUTTON_DESIGNDRUG_TWO");
		Controls.SecondResult:LocalizeAndSetText("TXT_KEY_RESULT_DESIGNDRUG_TWO");
		Controls.Choice3:LocalizeAndSetText("TXT_KEY_BUTTON_DESIGNDRUG_THREE");
		Controls.ThirdResult:LocalizeAndSetText("TXT_KEY_RESULT_DESIGNDRUG_THREE");
		function OnChoice1(playerID)
			pPlayer:ChangeExtraHappinessPerCity(-4);
		ContextPtr:SetHide(true)
		end
		Controls.Choice1:RegisterCallback(Mouse.eLClick, OnChoice1)
		function OnChoice2(playerID)
			pPlayer:ChangeExtraHappinessPerCity(-2);
			for pCity in pPlayer:Cities() do
			pCity:ChangeBaseYieldRateFromBuildings(YieldTypes.YIELD_HEALTH, 2);
			end
		ContextPtr:SetHide(true)
		end
		Controls.Choice2:RegisterCallback(Mouse.eLClick, OnChoice2)
		function OnChoice3(playerID)
			for pCity in pPlayer:Cities() do
			pCity:ChangeBaseYieldRateFromBuildings(YieldTypes.YIELD_GOLD, 10);
			pCity:ChangeBaseYieldRateFromBuildings(YieldTypes.YIELD_HEALTH, - 3);
			pCity:ChangeProduction(-3)
			end
			pPlayer:ChangeExtraHappinessPerCity(4);
			local iDrugTurn = 8
			DesignDrugEffect(pPlayer)
		ContextPtr:SetHide(true)	
		end
		Controls.Choice3:RegisterCallback(Mouse.eLClick, OnChoice3)
	
	
end
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
function DecisionEvent30(playerID)
	if(Game.GetCustomOption("GAMEOPTION_CCTP_ORDER") == 0) then return end
	local pPlayer = Players[playerID];
	local iResOrderID = GameInfoTypes["RESOURCE_ORDER"];
		print("OPPrison");
		 ContextPtr:SetHide(false)
		Controls.Description:LocalizeAndSetText("TXT_KEY_DESCRIP_OPPRISION");
	    Controls.EventImage:SetTexture("Pencol.dds");
		Controls.FirstChoice:LocalizeAndSetText("TXT_KEY_CHOICE_OPPRISION_ONE");
		Controls.SecondChoice:LocalizeAndSetText("TXT_KEY_CHOICE_OPPRISION_TWO");
		Controls.ThirdChoice:LocalizeAndSetText("TXT_KEY_CHOICE_OPPRISION_THREE");
		Controls.Choice1:LocalizeAndSetText("TXT_KEY_BUTTON_OPPRISION_ONE");
		Controls.FirstResult:LocalizeAndSetText("TXT_KEY_RESULT_OPPRISION_ONE");
		Controls.Choice2:LocalizeAndSetText("TXT_KEY_BUTTON_OPPRISION_TWO");
		Controls.SecondResult:LocalizeAndSetText("TXT_KEY_RESULT_OPPRISION_TWO");
		Controls.Choice3:LocalizeAndSetText("TXT_KEY_BUTTON_OPPRISION_THREE");
		Controls.ThirdResult:LocalizeAndSetText("TXT_KEY_RESULT_OPPRISION_THREE");
	  	function OnChoice1(playerID)
			pPlayer:ChangeGold(-1500);
			pPlayer:ChangeNumResourceTotal(iResOrderID, 20);
	
		ContextPtr:SetHide(true)
		end
		Controls.Choice1:RegisterCallback(Mouse.eLClick, OnChoice1)
		function OnChoice2(playerID)
			pPlayer:ChangeExtraHappinessPerCity(-2);
			pPlayer:ChangeNumResourceTotal(iResOrderID, 20);
			
		ContextPtr:SetHide(true)
		end
		Controls.Choice2:RegisterCallback(Mouse.eLClick, OnChoice2)
		function OnChoice3(playerID)
			
		ContextPtr:SetHide(true)	
		end
		Controls.Choice3:RegisterCallback(Mouse.eLClick, OnChoice3)
	
	
end
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
function DecisionEvent31(playerID)
	local pPlayer = Players[playerID];
	local capCity = pPlayer:GetCapitalCity();
		print("DinoBone");
		 ContextPtr:SetHide(false)
		Controls.Description:LocalizeAndSetText("TXT_KEY_DESCRIP_DINOBONE");
	    Controls.EventImage:SetTexture("DinoMyth.dds");
		Controls.FirstChoice:LocalizeAndSetText("TXT_KEY_CHOICE_DINOBONE_ONE");
		Controls.SecondChoice:LocalizeAndSetText("TXT_KEY_CHOICE_DINOBONE_TWO");
		Controls.ThirdChoice:LocalizeAndSetText("TXT_KEY_CHOICE_DINOBONE_THREE");
		Controls.Choice1:LocalizeAndSetText("TXT_KEY_BUTTON_DINOBONE_ONE");
		Controls.FirstResult:LocalizeAndSetText("TXT_KEY_RESULT_DINOBONE_ONE");
		Controls.Choice2:LocalizeAndSetText("TXT_KEY_BUTTON_DINOBONE_TWO");
		Controls.SecondResult:LocalizeAndSetText("TXT_KEY_RESULT_DINOBONE_TWO");
		Controls.Choice3:LocalizeAndSetText("TXT_KEY_BUTTON_DINOBONE_THREE");
		Controls.ThirdResult:LocalizeAndSetText("TXT_KEY_RESULT_DINOBONE_THREE");
		function OnChoice1(playerID)
			capCity:ChangeBaseYieldRateFromBuildings(YieldTypes.YIELD_SCIENCE, -2)
			capCity:ChangeBaseYieldRateFromBuildings(YieldTypes.YIELD_FAITH, 2)
		ContextPtr:SetHide(true)
		end
		Controls.Choice1:RegisterCallback(Mouse.eLClick, OnChoice1)
		function OnChoice2(playerID)
			capCity:ChangeBaseYieldRateFromBuildings(YieldTypes.YIELD_SCIENCE, 2)
			capCity:ChangeBaseYieldRateFromBuildings(YieldTypes.YIELD_FAITH, -2)
		ContextPtr:SetHide(true)
		end
		Controls.Choice2:RegisterCallback(Mouse.eLClick, OnChoice2)
		function OnChoice3(playerID)
			local currExp = pPlayer:GetCombatExperience();
			local adjExp = math.ceil(currExp * .20);
			pPlayer:ChangeCombatExperience(adjExp);
		ContextPtr:SetHide(true)	
		end
		Controls.Choice3:RegisterCallback(Mouse.eLClick, OnChoice3)
	
	
end
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
function DecisionEvent32(playerID)
	print("LawCode");
	if(Game.GetCustomOption("GAMEOPTION_CCTP_ORDER") == 0) then return end
	local pPlayer = Players[playerID];
	local iResOrderID = GameInfoTypes["RESOURCE_ORDER"];
		 ContextPtr:SetHide(false)
		Controls.Description:LocalizeAndSetText("TXT_KEY_DESCRIP_LAWCODE");
	    Controls.EventImage:SetTexture("laws.dds");
		Controls.FirstChoice:LocalizeAndSetText("TXT_KEY_CHOICE_LAWCODE_ONE");
		Controls.SecondChoice:LocalizeAndSetText("TXT_KEY_CHOICE_LAWCODE_TWO");
		Controls.ThirdChoice:LocalizeAndSetText("TXT_KEY_CHOICE_LAWCODE_THREE");
		Controls.Choice1:LocalizeAndSetText("TXT_KEY_BUTTON_LAWCODE_ONE");
		Controls.FirstResult:LocalizeAndSetText("TXT_KEY_RESULT_LAWCODE_ONE");
		Controls.Choice2:LocalizeAndSetText("TXT_KEY_BUTTON_LAWCODE_TWO");
		Controls.SecondResult:LocalizeAndSetText("TXT_KEY_RESULT_LAWCODE_TWO");
		Controls.Choice3:LocalizeAndSetText("TXT_KEY_BUTTON_LAWCODE_THREE");
		Controls.ThirdResult:LocalizeAndSetText("TXT_KEY_RESULT_LAWCODE_THREE");
		function OnChoice1(playerID)
			pPlayer:ChangeExtraHappinessPerCity(-1);
			pPlayer:ChangeNumResourceTotal(iResOrderID, 3);
		ContextPtr:SetHide(true)
		end
		Controls.Choice1:RegisterCallback(Mouse.eLClick, OnChoice1)
		function OnChoice2(playerID)
			pPlayer:ChangeExtraHappinessPerCity(1);
			pPlayer:ChangeNumResourceTotal(iResOrderID, 3);
		ContextPtr:SetHide(true)
		end
		Controls.Choice2:RegisterCallback(Mouse.eLClick, OnChoice2)
		function OnChoice3(playerID)
			local iDisOrderChance = Game.Rand(100, "d CHance");
			if iDisOrderChance < 5 then
				pPlayer:ChangeNumResourceTotal(iResOrderID, -2);
			end
		ContextPtr:SetHide(true)	
		end
		Controls.Choice3:RegisterCallback(Mouse.eLClick, OnChoice3)
	
end
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
function DecisionEvent33(playerID)
	print("magistrates");
	if(Game.GetCustomOption("GAMEOPTION_CCTP_ORDER") == 0) then return end
	local pPlayer = Players[playerID];
	local iResOrderID = GameInfoTypes["RESOURCE_ORDER"];
		 ContextPtr:SetHide(false)
		Controls.Description:LocalizeAndSetText("TXT_KEY_DESCRIP_MGSTRTS");
	    Controls.EventImage:SetTexture("arxaiapolice.dds");
		Controls.FirstChoice:LocalizeAndSetText("TXT_KEY_CHOICE_MGSTRTS_ONE");
		Controls.SecondChoice:LocalizeAndSetText("TXT_KEY_CHOICE_MGSTRTS_TWO");
		Controls.ThirdChoice:LocalizeAndSetText("TXT_KEY_CHOICE_MGSTRTS_THREE");
		Controls.Choice1:LocalizeAndSetText("TXT_KEY_BUTTON_MGSTRTS_ONE");
		Controls.FirstResult:LocalizeAndSetText("TXT_KEY_RESULT_MGSTRTS_ONE");
		Controls.Choice2:LocalizeAndSetText("TXT_KEY_BUTTON_MGSTRTS_TWO");
		Controls.SecondResult:LocalizeAndSetText("TXT_KEY_RESULT_MGSTRTS_TWO");
		Controls.Choice3:LocalizeAndSetText("TXT_KEY_BUTTON_MGSTRTS_THREE");
		Controls.ThirdResult:LocalizeAndSetText("TXT_KEY_RESULT_MGSTRTS_THREE");
		function OnChoice1(playerID)
			pPlayer:ChangeGold(-150);
			pPlayer:ChangeNumResourceTotal(iResOrderID, 3);
		ContextPtr:SetHide(true)
		end
		Controls.Choice1:RegisterCallback(Mouse.eLClick, OnChoice1)
		function OnChoice2(playerID)
			pPlayer:ChangeGold(-20);
			pPlayer:ChangeNumResourceTotal(iResOrderID, 1);
		ContextPtr:SetHide(true)
		end
		Controls.Choice2:RegisterCallback(Mouse.eLClick, OnChoice2)
		function OnChoice3(playerID)
			
		ContextPtr:SetHide(true)	
		end
		Controls.Choice3:RegisterCallback(Mouse.eLClick, OnChoice3)
	
end
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
function DecisionEvent34(playerID)
	print("Night Watch");
	if(Game.GetCustomOption("GAMEOPTION_CCTP_ORDER") == 0) then return end
	local pPlayer = Players[playerID];
	local iResOrderID = GameInfoTypes["RESOURCE_ORDER"];
	local capCity = pPlayer:GetCapitalCity();
		 ContextPtr:SetHide(false)
		Controls.Description:LocalizeAndSetText("TXT_KEY_DESCRIP_NGHTWTCH");
	    Controls.EventImage:SetTexture("Nightwatch.dds");
		Controls.FirstChoice:LocalizeAndSetText("TXT_KEY_CHOICE_NGHTWTCH_ONE");
		Controls.SecondChoice:LocalizeAndSetText("TXT_KEY_CHOICE_NGHTWTCH_TWO");
		Controls.ThirdChoice:LocalizeAndSetText("TXT_KEY_CHOICE_NGHTWTCH_THREE");
		Controls.Choice1:LocalizeAndSetText("TXT_KEY_BUTTON_NGHTWTCH_ONE");
		Controls.FirstResult:LocalizeAndSetText("TXT_KEY_RESULT_NGHTWTCH_ONE");
		Controls.Choice2:LocalizeAndSetText("TXT_KEY_BUTTON_NGHTWTCH_TWO");
		Controls.SecondResult:LocalizeAndSetText("TXT_KEY_RESULT_NGHTWTCH_TWO");
		Controls.Choice3:LocalizeAndSetText("TXT_KEY_BUTTON_NGHTWTCH_THREE");
		Controls.ThirdResult:LocalizeAndSetText("TXT_KEY_RESULT_NGHTWTCH_THREE");
		function OnChoice1(playerID)
			capCity:ChangeBaseYieldRateFromBuildings(YieldTypes.YIELD_GOLD, 2);
			pPlayer:ChangeNumResourceTotal(iResOrderID, -2);
			pPlayer:ChangeExtraHappinessPerCity(-3);
		ContextPtr:SetHide(true)
		end
		Controls.Choice1:RegisterCallback(Mouse.eLClick, OnChoice1)
		function OnChoice2(playerID)
			capCity:ChangeBaseYieldRateFromBuildings(YieldTypes.YIELD_GOLD, -1);
			pPlayer:ChangeNumResourceTotal(iResOrderID, 1);
		ContextPtr:SetHide(true)
		end
		Controls.Choice2:RegisterCallback(Mouse.eLClick, OnChoice2)
		function OnChoice3(playerID)
			pPlayer:ChangeNumResourceTotal(iResOrderID, 3);
			pPlayer:ChangeExtraHappinessPerCity(-4);
		ContextPtr:SetHide(true)	
		end
		Controls.Choice3:RegisterCallback(Mouse.eLClick, OnChoice3)
	
end
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
function DecisionEvent35(playerID)
	print("ChurshState");
	if(Game.GetCustomOption("GAMEOPTION_CCTP_ORDER") == 0) then return end
	local pPlayer = Players[playerID];
	local iResOrderID = GameInfoTypes["RESOURCE_ORDER"];
	local capCity = pPlayer:GetCapitalCity();
		 ContextPtr:SetHide(false)
		Controls.Description:LocalizeAndSetText("TXT_KEY_DESCRIP_CHRCHST");
	    Controls.EventImage:SetTexture("Council.dds");
		Controls.FirstChoice:LocalizeAndSetText("TXT_KEY_CHOICE_CHRCHST_ONE");
		Controls.SecondChoice:LocalizeAndSetText("TXT_KEY_CHOICE_CHRCHST_TWO");
		Controls.ThirdChoice:LocalizeAndSetText("TXT_KEY_CHOICE_CHRCHST_THREE");
		Controls.Choice1:LocalizeAndSetText("TXT_KEY_BUTTON_CHRCHST_ONE");
		Controls.FirstResult:LocalizeAndSetText("TXT_KEY_RESULT_CHRCHST_ONE");
		Controls.Choice2:LocalizeAndSetText("TXT_KEY_BUTTON_CHRCHST_TWO");
		Controls.SecondResult:LocalizeAndSetText("TXT_KEY_RESULT_CHRCHST_TWO");
		Controls.Choice3:LocalizeAndSetText("TXT_KEY_BUTTON_CHRCHST_THREE");
		Controls.ThirdResult:LocalizeAndSetText("TXT_KEY_RESULT_CHRCHST_THREE");
		function OnChoice1(playerID)
			capCity:ChangeBaseYieldRateFromBuildings(YieldTypes.YIELD_FAITH, 5);
			pPlayer:ChangeNumResourceTotal(iResOrderID, -2);
		ContextPtr:SetHide(true)
		end
		Controls.Choice1:RegisterCallback(Mouse.eLClick, OnChoice1)
		function OnChoice2(playerID)
			capCity:ChangeBaseYieldRateFromBuildings(YieldTypes.YIELD_FAITH, 1);
			pPlayer:ChangeNumResourceTotal(iResOrderID, 2);
		ContextPtr:SetHide(true)
		end
		Controls.Choice2:RegisterCallback(Mouse.eLClick, OnChoice2)
		function OnChoice3(playerID)
			pPlayer:ChangeNumResourceTotal(iResOrderID, 4);
			capCity:ChangeBaseYieldRateFromBuildings(YieldTypes.YIELD_FAITH, -2);
			pPlayer:ChangeJONSCulture(-100);
		ContextPtr:SetHide(true)	
		end
		Controls.Choice3:RegisterCallback(Mouse.eLClick, OnChoice3)
	
end
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
function DecisionEvent36(playerID)
	print("Prisoners");
	if(Game.GetCustomOption("GAMEOPTION_CCTP_ORDER") == 0) then return end
	local pPlayer = Players[playerID];
	local iResOrderID = GameInfoTypes["RESOURCE_ORDER"];
	local capCity = pPlayer:GetCapitalCity();
		 ContextPtr:SetHide(false)
		Controls.Description:LocalizeAndSetText("TXT_KEY_DESCRIP_PRISONERS");
	    Controls.EventImage:SetTexture("chaingang.dds");
		Controls.FirstChoice:LocalizeAndSetText("TXT_KEY_CHOICE_PRISONERS_ONE");
		Controls.SecondChoice:LocalizeAndSetText("TXT_KEY_CHOICE_PRISONERS_TWO");
		Controls.ThirdChoice:LocalizeAndSetText("TXT_KEY_CHOICE_PRISONERS_THREE");
		Controls.Choice1:LocalizeAndSetText("TXT_KEY_BUTTON_PRISONERS_ONE");
		Controls.FirstResult:LocalizeAndSetText("TXT_KEY_RESULT_PRISONERS_ONE");
		Controls.Choice2:LocalizeAndSetText("TXT_KEY_BUTTON_PRISONERS_TWO");
		Controls.SecondResult:LocalizeAndSetText("TXT_KEY_RESULT_PRISONERS_TWO");
		Controls.Choice3:LocalizeAndSetText("TXT_KEY_BUTTON_PRISONERS_THREE");
		Controls.ThirdResult:LocalizeAndSetText("TXT_KEY_RESULT_PRISONERS_THREE");
		function OnChoice1(playerID)
			pPlayer:ChangeJONSCulturePerTurnForFree(2);
			pPlayer:ChangeNumResourceTotal(iResOrderID, -2);
			pPlayer:ChangeExtraHappinessPerCity(2);
		ContextPtr:SetHide(true)
		end
		Controls.Choice1:RegisterCallback(Mouse.eLClick, OnChoice1)
		function OnChoice2(playerID)
			local iResourceID = GameInfoTypes["RESOURCE_MANPOWER"];
			pPlayer:ChangeNumResourceTotal(iResourceID, 8)
			pPlayer:ChangeJONSCulturePerTurnForFree(-2);
			pPlayer:ChangeNumResourceTotal(iResOrderID, -2);
		ContextPtr:SetHide(true)
		end
		Controls.Choice2:RegisterCallback(Mouse.eLClick, OnChoice2)
		function OnChoice3(playerID)
			pPlayer:ChangeNumResourceTotal(iResOrderID, 5);
			pPlayer:ChangeExtraHappinessPerCity(-2);
			pPlayer:ChangeJONSCulturePerTurnForFree(-3);
		ContextPtr:SetHide(true)	
		end
		Controls.Choice3:RegisterCallback(Mouse.eLClick, OnChoice3)
	
end
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
function DecisionEvent37(playerID)
	print("worldHUnger");
	if(Game.GetCustomOption("GAMEOPTION_CCTP_ORDER") == 0) then return end
	local pPlayer = Players[playerID];
	local capCity = pPlayer:GetCapitalCity();
		 ContextPtr:SetHide(false)
		Controls.Description:LocalizeAndSetText("TXT_KEY_DESCRIP_WHUNGER");
	    Controls.EventImage:SetTexture("famine.dds");
		Controls.FirstChoice:LocalizeAndSetText("TXT_KEY_CHOICE_WHUNGER_ONE");
		Controls.SecondChoice:LocalizeAndSetText("TXT_KEY_CHOICE_WHUNGER_TWO");
		Controls.ThirdChoice:LocalizeAndSetText("TXT_KEY_CHOICE_WHUNGER_THREE");
		Controls.Choice1:LocalizeAndSetText("TXT_KEY_BUTTON_WHUNGER_ONE");
		Controls.FirstResult:LocalizeAndSetText("TXT_KEY_RESULT_WHUNGER_ONE");
		Controls.Choice2:LocalizeAndSetText("TXT_KEY_BUTTON_WHUNGER_TWO");
		Controls.SecondResult:LocalizeAndSetText("TXT_KEY_RESULT_WHUNGER_TWO");
		Controls.Choice3:LocalizeAndSetText("TXT_KEY_BUTTON_WHUNGER_THREE");
		Controls.ThirdResult:LocalizeAndSetText("TXT_KEY_RESULT_WHUNGER_THREE");
		function OnChoice1(playerID)
			for pCity in pPlayer:Cities() do
				local iCurrentFood = pCity:GetFood();
				print("food", iCurrentFood);
				local iLocalPop = math.floor(pCity:GetPopulation());
				local iFoodNeeded = math.floor(iCurrentFood - (iLocalPop * 2));
				print("needed", iFoodNeeded);
				if  iCurrentFood > iFoodNeeded then
					local iFoodDiff = (iCurrentFood - iFoodNeeded);
					local iFoodDistb = (iFoodDiff / 2)
					print("ditb", iFoodDistb);
					pCity:ChangeFood(-iFoodDistb);
				end
			end
			pPlayer:ChangeJONSCulture(200);
			pPlayer:ChangeExtraHappinessPerCity(5);
		ContextPtr:SetHide(true)
		end
		Controls.Choice1:RegisterCallback(Mouse.eLClick, OnChoice1)
		function OnChoice2(playerID)
			pPlayer:ChangeJONSCulture(200);
			pPlayer:ChangeGold(-150);
		ContextPtr:SetHide(true)
		end
		Controls.Choice2:RegisterCallback(Mouse.eLClick, OnChoice2)
		function OnChoice3(playerID)
			pPlayer:ChangeJONSCulture(-100);
		ContextPtr:SetHide(true)	
		end
		Controls.Choice3:RegisterCallback(Mouse.eLClick, OnChoice3)
	
end
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
function DecisionEvent38(playerID)
	print("zombie");
	local pPlayer = Players[playerID];
	local iZedChoice
		 ContextPtr:SetHide(false)
		Controls.Description:LocalizeAndSetText("TXT_KEY_DESCRIP_ZEDS");
	    Controls.EventImage:SetTexture("biowar.dds");
		Controls.FirstChoice:LocalizeAndSetText("TXT_KEY_CHOICE_ZEDS_ONE");
		Controls.SecondChoice:LocalizeAndSetText("TXT_KEY_CHOICE_ZEDS_TWO");
		Controls.ThirdChoice:LocalizeAndSetText("TXT_KEY_CHOICE_ZEDS_THREE");
		Controls.Choice1:LocalizeAndSetText("TXT_KEY_BUTTON_ZEDS_ONE");
		Controls.FirstResult:LocalizeAndSetText("TXT_KEY_RESULT_ZEDS_ONE");
		Controls.Choice2:LocalizeAndSetText("TXT_KEY_BUTTON_ZEDS_TWO");
		Controls.SecondResult:LocalizeAndSetText("TXT_KEY_RESULT_ZEDS_TWO");
		Controls.Choice3:LocalizeAndSetText("TXT_KEY_BUTTON_ZEDS_THREE");
		Controls.ThirdResult:LocalizeAndSetText("TXT_KEY_RESULT_ZEDS_THREE");
		function OnChoice1(playerID)
			pPlayer:ChangeGold(-150);
			iZedChoice = 1;
			RaiseZombies(pPlayer, iZedChoice)
		ContextPtr:SetHide(true)
		end
		Controls.Choice1:RegisterCallback(Mouse.eLClick, OnChoice1)
		function OnChoice2(playerID)
			local pTeamID = pPlayer:GetTeam();
			local pTeam = Teams[pTeamID];
			local pTeamTechs = pTeam:GetTeamTechs();
			local iTech = pPlayer:GetCurrentResearch();
			local techProgress = pPlayer:GetResearchCost(iTech);
			pTeamTechs:ChangeResearchProgress(iTech, -100 , pPlayer)
			iZedChoice = 2;
			RaiseZombies(pPlayer, iZedChoice)
		ContextPtr:SetHide(true)
		end
		Controls.Choice2:RegisterCallback(Mouse.eLClick, OnChoice2)
		function OnChoice3(playerID)
			pPlayer:ChangeJONSCulture(100);
			iZedChoice = 3;
			RaiseZombies(pPlayer, iZedChoice)
		ContextPtr:SetHide(true)	
		end
		Controls.Choice3:RegisterCallback(Mouse.eLClick, OnChoice3)
	
end
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
function DecisionEvent39(playerID)
	print("Solar storm");
	local pPlayer = Players[playerID];
		 ContextPtr:SetHide(false)
		Controls.Description:LocalizeAndSetText("TXT_KEY_DESCRIP_SOLARSTRM");
	    Controls.EventImage:SetTexture("solar-flare.dds");
		Controls.FirstChoice:LocalizeAndSetText("TXT_KEY_CHOICE_SOLARSTRM_ONE");
		Controls.SecondChoice:LocalizeAndSetText("TXT_KEY_CHOICE_SOLARSTRM_TWO");
		Controls.ThirdChoice:LocalizeAndSetText("TXT_KEY_CHOICE_SOLARSTRM_THREE");
		Controls.Choice1:LocalizeAndSetText("TXT_KEY_BUTTON_SOLARSTRM_ONE");
		Controls.FirstResult:LocalizeAndSetText("TXT_KEY_RESULT_SOLARSTRM_ONE");
		Controls.Choice2:LocalizeAndSetText("TXT_KEY_BUTTON_SOLARSTRM_TWO");
		Controls.SecondResult:LocalizeAndSetText("TXT_KEY_RESULT_SOLARSTRM_TWO");
		Controls.Choice3:LocalizeAndSetText("TXT_KEY_BUTTON_SOLARSTRM_THREE");
		Controls.ThirdResult:LocalizeAndSetText("TXT_KEY_RESULT_SOLARSTRM_THREE");
		function OnChoice1(playerID)
			pPlayer:ChangeGold(-1000);
			local pTeamID = pPlayer:GetTeam();
			local pTeam = Teams[pTeamID];
			local pTeamTechs = pTeam:GetTeamTechs();
			local iTech = pPlayer:GetCurrentResearch();
			local techProgress = pPlayer:GetResearchCost(iTech);
			pTeamTechs:ChangeResearchProgress(iTech, -300 , pPlayer)
		ContextPtr:SetHide(true)
		end
		Controls.Choice1:RegisterCallback(Mouse.eLClick, OnChoice1)
		function OnChoice2(playerID)
			pPlayer:ChangeGold(-2000);
		ContextPtr:SetHide(true)
		end
		Controls.Choice2:RegisterCallback(Mouse.eLClick, OnChoice2)
		function OnChoice3(playerID)
			local iStormChance = Game.Rand(100, "storm");
			if iStormChance < 23 then
				local iResourceID = GameInfoTypes["RESOURCE_ELECTRICITY"];
				local iResourceTotal = pPlayer:GetNumResourceTotal(iResourceID, true);
				local iStormEffect = math.ceil(iResourceTotal / 3);
				pPlayer:ChangeNumResourceTotal(iResourceID, -iStormEffect)
				text = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_SUMMARY_SOLARSTRM"), iStormEffect;
				heading = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_SOLARSTRM");
				pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, text, heading);
			end
		ContextPtr:SetHide(true)	
		end
		Controls.Choice3:RegisterCallback(Mouse.eLClick, OnChoice3)
	
end
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
function DecisionEvent40(playerID)
	print("EarthQuake");
	local pPlayer = Players[playerID];
	local pCity = GetRandomPlayerCity(pPlayer);
	local targetName = targetCity:GetName();
	local iQuakeChoice
		 ContextPtr:SetHide(false)
		Controls.Description:LocalizeAndSetText("TXT_KEY_DESCRIP_EQUAKE", targetName);
	    Controls.EventImage:SetTexture("Tepeyollotl.dds");
		Controls.FirstChoice:LocalizeAndSetText("TXT_KEY_CHOICE_EQUAKE_ONE");
		Controls.SecondChoice:LocalizeAndSetText("TXT_KEY_CHOICE_EQUAKE_TWO");
		Controls.ThirdChoice:LocalizeAndSetText("TXT_KEY_CHOICE_EQUAKE_THREE");
		Controls.Choice1:LocalizeAndSetText("TXT_KEY_BUTTON_EQUAKE_ONE");
		Controls.FirstResult:LocalizeAndSetText("TXT_KEY_RESULT_EQUAKE_ONE");
		Controls.Choice2:LocalizeAndSetText("TXT_KEY_BUTTON_EQUAKE_TWO");
		Controls.SecondResult:LocalizeAndSetText("TXT_KEY_RESULT_EQUAKE_TWO");
		Controls.Choice3:LocalizeAndSetText("TXT_KEY_BUTTON_EQUAKE_THREE");
		Controls.ThirdResult:LocalizeAndSetText("TXT_KEY_RESULT_EQUAKE_THREE");
		function OnChoice1(playerID)
			pCity:ChangePopulation(-1)
			iQuakeChoice = 1
			DoQuakeResult(pPlayer, pCity, iQuakeChoice)
		ContextPtr:SetHide(true)
		end
		Controls.Choice1:RegisterCallback(Mouse.eLClick, OnChoice1)
		function OnChoice2(playerID)
			local iProductionPerTurn = pCity:GetCurrentProductionDifferenceTimes100(false, false) / 100;
			pCity:ChangeProduction(-iProductionPerTurn);
			iQuakeChoice = 2
			DoQuakeResult(pPlayer, pCity, iQuakeChoice)
		ContextPtr:SetHide(true)	
		end
		Controls.Choice2:RegisterCallback(Mouse.eLClick, OnChoice2)
		function OnChoice3(playerID)
			iQuakeChoice = 3
			DoQuakeResult(pPlayer, pCity, iQuakeChoice)
		ContextPtr:SetHide(true)	
		end
		Controls.Choice3:RegisterCallback(Mouse.eLClick, OnChoice3)
	
end
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
function DecisionEvent41(playerID)
	print("irrigation");
	local pPlayer = Players[playerID];
		 ContextPtr:SetHide(false)
		Controls.Description:LocalizeAndSetText("TXT_KEY_DESCRIP_IRRIGATION");
	    Controls.EventImage:SetTexture("irrigataion.dds");
		Controls.FirstChoice:LocalizeAndSetText("TXT_KEY_CHOICE_IRRIGATION_ONE");
		Controls.SecondChoice:LocalizeAndSetText("TXT_KEY_CHOICE_IRRIGATION_TWO");
		Controls.ThirdChoice:LocalizeAndSetText("TXT_KEY_CHOICE_IRRIGATION_THREE");
		Controls.Choice1:LocalizeAndSetText("TXT_KEY_BUTTON_IRRIGATION_ONE");
		Controls.FirstResult:LocalizeAndSetText("TXT_KEY_RESULT_IRRIGATION_ONE");
		Controls.Choice2:LocalizeAndSetText("TXT_KEY_BUTTON_IRRIGATION_TWO");
		Controls.SecondResult:LocalizeAndSetText("TXT_KEY_RESULT_IRRIGATION_TWO");
		Controls.Choice3:LocalizeAndSetText("TXT_KEY_BUTTON_IRRIGATION_THREE");
		Controls.ThirdResult:LocalizeAndSetText("TXT_KEY_RESULT_IRRIGATION_THREE");
		function OnChoice1(playerID)
			pPlayer:ChangeGold(-150);
			for pCity in pPlayer:Cities() do
				pCity:ChangeBaseYieldRateFromBuildings(YieldTypes.YIELD_FOOD, 3);
				end
		ContextPtr:SetHide(true)
		end
		Controls.Choice1:RegisterCallback(Mouse.eLClick, OnChoice1)
		function OnChoice2(playerID)
			pPlayer:ChangeJONSCulture(-100);
			for pCity in pPlayer:Cities() do
			pCity:ChangeBaseYieldRateFromBuildings(YieldTypes.YIELD_FOOD, 2);
			end
		ContextPtr:SetHide(true)	 
		end
		Controls.Choice2:RegisterCallback(Mouse.eLClick, OnChoice2)
		function OnChoice3(playerID)
			local randCatch = Game.Rand(100, "caught");
			if randCatch < 50 then
				for pCity in pPlayer:Cities() do
				pCity:ChangeBaseYieldRateFromBuildings(YieldTypes.YIELD_FOOD, 1);
				end
			else
				local pOtherCiv = GetRandomOtherPlayer(pPlayer);
				for pCity in pOtherCiv:Cities() do
				pCity:ChangeBaseYieldRateFromBuildings(YieldTypes.YIELD_FOOD, 2);
				end
				text = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_SUMMARY_IRR");
				heading = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_IRR");
				pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, text, heading);
			end
		ContextPtr:SetHide(true)	
		end
		Controls.Choice3:RegisterCallback(Mouse.eLClick, OnChoice3)
	
end
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
function DecisionEvent42(playerID)
	print("KIDNAP");
	local pPlayer = Players[playerID];
	local numCities = pPlayer:GetNumCities();
		 ContextPtr:SetHide(false)
		Controls.Description:LocalizeAndSetText("TXT_KEY_DESCRIP_KIDNAP");
	    Controls.EventImage:SetTexture("kidnap.dds");
		Controls.FirstChoice:LocalizeAndSetText("TXT_KEY_CHOICE_KIDNAP_ONE");
		Controls.SecondChoice:LocalizeAndSetText("TXT_KEY_CHOICE_KIDNAP_TWO");
		Controls.ThirdChoice:LocalizeAndSetText("TXT_KEY_CHOICE_KIDNAP_THREE");
		Controls.Choice1:LocalizeAndSetText("TXT_KEY_BUTTON_KIDNAP_ONE");
		Controls.FirstResult:LocalizeAndSetText("TXT_KEY_RESULT_KIDNAP_ONE");
		Controls.Choice2:LocalizeAndSetText("TXT_KEY_BUTTON_KIDNAP_TWO");
		Controls.SecondResult:LocalizeAndSetText("TXT_KEY_RESULT_KIDNAP_TWO");
		Controls.Choice3:LocalizeAndSetText("TXT_KEY_BUTTON_KIDNAP_THREE");
		Controls.ThirdResult:LocalizeAndSetText("TXT_KEY_RESULT_KIDNAP_THREE");
		function OnChoice1(playerID)
			pPlayer:ChangeGold(-125);
			pPlayer:ChangeExtraHappinessPerCity(4  / numCities);
		ContextPtr:SetHide(true)
		end
		Controls.Choice1:RegisterCallback(Mouse.eLClick, OnChoice1)
		function OnChoice2(playerID)
			KillBarbsInTerr(playerID)
			local randDie = Game.Rand(100, "die");
			if randDie < 1 then
				text = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_SUMMARY_KIDNAPN");
				heading = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_KIDNAPN");
				pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, text, heading);
			else
				pPlayer:ChangeExtraHappinessPerCity(-3  / numCities);
			end
			if randDie > 87 then
				local numKill = math.random(1,2);
				for i =1, numKill do
				pUnit = RandomUnit(pPlayer);
				pUnit:Kill();
				end
			end
		ContextPtr:SetHide(true)	 
		end
		Controls.Choice2:RegisterCallback(Mouse.eLClick, OnChoice2)
		function OnChoice3(playerID)
			pPlayer:ChangeExtraHappinessPerCity(-4  / numCities);
		ContextPtr:SetHide(true)	
		end
		Controls.Choice3:RegisterCallback(Mouse.eLClick, OnChoice3)
	
end
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
function DecisionEvent43(playerID)
	print("GUILD");
	local pPlayer = Players[playerID];
	local numCities = pPlayer:GetNumCities();
		 ContextPtr:SetHide(false)
		Controls.Description:LocalizeAndSetText("TXT_KEY_DESCRIP_GUILD");
	    Controls.EventImage:SetTexture("guilds.dds");
		Controls.FirstChoice:LocalizeAndSetText("TXT_KEY_CHOICE_GUILD_ONE");
		Controls.SecondChoice:LocalizeAndSetText("TXT_KEY_CHOICE_GUILD_TWO");
		Controls.ThirdChoice:LocalizeAndSetText("TXT_KEY_CHOICE_GUILD_THREE");
		Controls.Choice1:LocalizeAndSetText("TXT_KEY_BUTTON_GUILD_ONE");
		Controls.FirstResult:LocalizeAndSetText("TXT_KEY_RESULT_GUILD_ONE");
		Controls.Choice2:LocalizeAndSetText("TXT_KEY_BUTTON_GUILD_TWO");
		Controls.SecondResult:LocalizeAndSetText("TXT_KEY_RESULT_GUILD_TWO");
		Controls.Choice3:LocalizeAndSetText("TXT_KEY_BUTTON_GUILD_THREE");
		Controls.ThirdResult:LocalizeAndSetText("TXT_KEY_RESULT_GUILD_THREE");
		function OnChoice1(playerID)
			for pCity in pPlayer:Cities() do
			pCity:ChangeBaseYieldRateFromBuildings(YieldTypes.YIELD_GOLD, -1);
			pCity:ChangeBaseYieldRateFromBuildings(YieldTypes.YIELD_PRODUCTION, 2)
			pCity:ChangeJONSCulturePerTurnFromBuildings(-1)
			end
		ContextPtr:SetHide(true)
		end
		Controls.Choice1:RegisterCallback(Mouse.eLClick, OnChoice1)
		function OnChoice2(playerID)
			for pCity in pPlayer:Cities() do
			pCity:ChangeBaseYieldRateFromBuildings(YieldTypes.YIELD_GOLD, -1);
			pCity:ChangeBaseYieldRateFromBuildings(YieldTypes.YIELD_PRODUCTION, -1)
			pCity:ChangeJONSCulturePerTurnFromBuildings(2)
			end
		ContextPtr:SetHide(true)	 
		end
		Controls.Choice2:RegisterCallback(Mouse.eLClick, OnChoice2)
		function OnChoice3(playerID)
			for pCity in pPlayer:Cities() do
			pCity:ChangeBaseYieldRateFromBuildings(YieldTypes.YIELD_GOLD, 2);
			pCity:ChangeBaseYieldRateFromBuildings(YieldTypes.YIELD_PRODUCTION, -1)
			pCity:ChangeJONSCulturePerTurnFromBuildings(-1)
			end
		ContextPtr:SetHide(true)	
		end
		Controls.Choice3:RegisterCallback(Mouse.eLClick, OnChoice3)
	
end
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
function DecisionEvent44(playerID)
	print("GENPLOT");
	local pPlayer = Players[playerID];
	local unitType = GameInfo.Units["UNIT_GERERAL"]
	local genUnit = PlayerHasUnit(pPlayer, unitType)
		 ContextPtr:SetHide(false)
		Controls.Description:LocalizeAndSetText("TXT_KEY_DESCRIP_GENPLOT");
	    Controls.EventImage:SetTexture("coup.dds");
		Controls.FirstChoice:LocalizeAndSetText("TXT_KEY_CHOICE_GENPLOT_ONE");
		Controls.SecondChoice:LocalizeAndSetText("TXT_KEY_CHOICE_GENPLOT_TWO");
		Controls.ThirdChoice:LocalizeAndSetText("TXT_KEY_CHOICE_GENPLOT_THREE");
		Controls.Choice1:LocalizeAndSetText("TXT_KEY_BUTTON_GENPLOT_ONE");
		Controls.FirstResult:LocalizeAndSetText("TXT_KEY_RESULT_GENPLOT_ONE");
		Controls.Choice2:LocalizeAndSetText("TXT_KEY_BUTTON_GENPLOT_TWO");
		Controls.SecondResult:LocalizeAndSetText("TXT_KEY_RESULT_GENPLOT_TWO");
		Controls.Choice3:LocalizeAndSetText("TXT_KEY_BUTTON_GENPLOT_THREE");
		Controls.ThirdResult:LocalizeAndSetText("TXT_KEY_RESULT_GENPLOT_THREE");
		function OnChoice1(playerID)
			genUnit:Kill();
		ContextPtr:SetHide(true)
		end
		Controls.Choice1:RegisterCallback(Mouse.eLClick, OnChoice1)
		function OnChoice2(playerID)
			pPlayer:ChangeGold(-350);
		ContextPtr:SetHide(true)	 
		end
		Controls.Choice2:RegisterCallback(Mouse.eLClick, OnChoice2)
		function OnChoice3(playerID)
			local randCoup = Game.Rand(200, "Coup");
			if randCoup < 35 then 
				MilitaryCoup(pPlayer, genUnit)
			end
		ContextPtr:SetHide(true)	
		end
		Controls.Choice3:RegisterCallback(Mouse.eLClick, OnChoice3)
	
end
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
function DecisionEvent45(playerID)
	print("MinSteal");
	local pPlayer = Players[playerID];
	local iResOrderID = GameInfoTypes["RESOURCE_CIV_ORDER"];
		ContextPtr:SetHide(false)
		Controls.Description:LocalizeAndSetText("TXT_KEY_DESCRIP_MINSTEAL");
	    Controls.EventImage:SetTexture("ministers.dds");
		Controls.FirstChoice:LocalizeAndSetText("TXT_KEY_CHOICE_MINSTEAL_ONE");
		Controls.SecondChoice:LocalizeAndSetText("TXT_KEY_CHOICE_MINSTEAL_TWO");
		Controls.ThirdChoice:LocalizeAndSetText("TXT_KEY_CHOICE_MINSTEAL_THREE");
		Controls.Choice1:LocalizeAndSetText("TXT_KEY_BUTTON_MINSTEAL_ONE");
		Controls.FirstResult:LocalizeAndSetText("TXT_KEY_RESULT_MINSTEAL_ONE");
		Controls.Choice2:LocalizeAndSetText("TXT_KEY_BUTTON_MINSTEAL_TWO");
		Controls.SecondResult:LocalizeAndSetText("TXT_KEY_RESULT_MINSTEAL_TWO");
		Controls.Choice3:LocalizeAndSetText("TXT_KEY_BUTTON_MINSTEAL_THREE");
		Controls.ThirdResult:LocalizeAndSetText("TXT_KEY_RESULT_MINSTEAL_THREE");
		function OnChoice1(playerID)
			pPlayer:ChangeNumResourceTotal(iResourceID, 2);
			pPlayer:ChangeGold(-50);
		ContextPtr:SetHide(true)
		end
		Controls.Choice1:RegisterCallback(Mouse.eLClick, OnChoice1)
		function OnChoice2(playerID)
			pPlayer:ChangeNumResourceTotal(iResourceID, -4);
			pPlayer:ChangeGold(250);
		ContextPtr:SetHide(true)	 
		end
		Controls.Choice2:RegisterCallback(Mouse.eLClick, OnChoice2)
		function OnChoice3(playerID)
			pPlayer:ChangeNumResourceTotal(iResourceID, 4);
			pPlayer:ChangeGold(500);
			pPlayer:ChangeJONSCulture(-250);
		ContextPtr:SetHide(true)	
		end
		Controls.Choice3:RegisterCallback(Mouse.eLClick, OnChoice3)
	
end
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
function DecisionEvent46(playerID, iWars)
	print("Wars", iWars);
	local pPlayer = Players[playerID];
		ContextPtr:SetHide(false)
		Controls.Description:LocalizeAndSetText("TXT_KEY_DESCRIP_WARS", iWars);
	    Controls.EventImage:SetTexture("summit.dds");
		Controls.FirstChoice:LocalizeAndSetText("TXT_KEY_CHOICE_WARS_ONE");
		Controls.SecondChoice:LocalizeAndSetText("TXT_KEY_CHOICE_WARS_TWO");
		Controls.ThirdChoice:LocalizeAndSetText("TXT_KEY_CHOICE_WARS_THREE");
		Controls.Choice1:LocalizeAndSetText("TXT_KEY_BUTTON_WARS_ONE");
		Controls.FirstResult:LocalizeAndSetText("TXT_KEY_RESULT_WARS_ONE");
		Controls.Choice2:LocalizeAndSetText("TXT_KEY_BUTTON_WARS_TWO");
		Controls.SecondResult:LocalizeAndSetText("TXT_KEY_RESULT_WARS_TWO");
		Controls.Choice3:LocalizeAndSetText("TXT_KEY_BUTTON_WARS_THREE");
		Controls.ThirdResult:LocalizeAndSetText("TXT_KEY_RESULT_WARS_THREE");
		function OnChoice1(playerID)
			local iTalksMod = 25;
			DoPeaceTalks(pPlayer, iTalksMod);
		ContextPtr:SetHide(true)
		end
		Controls.Choice1:RegisterCallback(Mouse.eLClick, OnChoice1)
		function OnChoice2(playerID)
			local iTalksMod = -25;
			DoPeaceTalks(pPlayer, iTalksMod);
		ContextPtr:SetHide(true)	 
		end
		Controls.Choice2:RegisterCallback(Mouse.eLClick, OnChoice2)
		function OnChoice3(playerID)
			local iTalksMod = 0;
			DoPeaceTalks(pPlayer, iTalksMod);
		ContextPtr:SetHide(true)	
		end
		Controls.Choice3:RegisterCallback(Mouse.eLClick, OnChoice3)
	
end
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
function DecisionEvent47(playerID)
	print("OilCollapse");
	local pPlayer = Players[playerID];
	local iOil= GameInfoTypes["RESOURCE_OIL"];
	local iOilTotal = pPlayer:GetNumResourceTotal(iOil, true);
		ContextPtr:SetHide(false)
		Controls.Description:LocalizeAndSetText("TXT_KEY_DESCRIP_OILCOLLAPSE");
	    Controls.EventImage:SetTexture("oilwell.dds");
		Controls.FirstChoice:LocalizeAndSetText("TXT_KEY_CHOICE_OILCOLLAPSE_ONE");
		Controls.SecondChoice:LocalizeAndSetText("TXT_KEY_CHOICE_OILCOLLAPSE_TWO");
		Controls.ThirdChoice:LocalizeAndSetText("TXT_KEY_CHOICE_OILCOLLAPSE_THREE");
		Controls.Choice1:LocalizeAndSetText("TXT_KEY_BUTTON_OILCOLLAPSE_ONE");
		Controls.FirstResult:LocalizeAndSetText("TXT_KEY_RESULT_OILCOLLAPSE_ONE");
		Controls.Choice2:LocalizeAndSetText("TXT_KEY_BUTTON_OILCOLLAPSE_TWO");
		Controls.SecondResult:LocalizeAndSetText("TXT_KEY_RESULT_OILCOLLAPSE_TWO");
		Controls.Choice3:LocalizeAndSetText("TXT_KEY_BUTTON_OILCOLLAPSE_THREE");
		Controls.ThirdResult:LocalizeAndSetText("TXT_KEY_RESULT_OILCOLLAPSE_THREE");
		function OnChoice1(playerID)
			local pTeamID = pPlayer:GetTeam();
			local pTeam = Teams[pTeamID];
			local pTeamTechs = pTeam:GetTeamTechs();
			local iTech = pPlayer:GetCurrentResearch();
			local techProgress = pPlayer:GetResearchCost(iTech);
			pTeamTechs:ChangeResearchProgress(iTech, -techProgress , pPlayer);
			local iOilBonus = (iOilTotal / 2);
			pPlayer:ChangeNumResourceTotal(iOil, iOilBonus);
		ContextPtr:SetHide(true)
		end
		Controls.Choice1:RegisterCallback(Mouse.eLClick, OnChoice1)
		function OnChoice2(playerID)
			pPlayer:ChangeGold(-2000);
			local iNumNewResource = 3;
			AddNewResource(playerID, iOil, iNumNewResource);
		ContextPtr:SetHide(true)	 
		end
		Controls.Choice2:RegisterCallback(Mouse.eLClick, OnChoice2)
		function OnChoice3(playerID)
			local iRandCollapse = Game.Rand(100, "collapse");
			if iRandCollapse < 50 then
			local iOilLoss = math.ceil(iOilTotal / 1.8);
			pPlayer:ChangeNumResourceTotal(iOil, iOilLoss);	
			end
		ContextPtr:SetHide(true)	
		end
		Controls.Choice3:RegisterCallback(Mouse.eLClick, OnChoice3)
	
end
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
function DecisionEvent48(playerID)
	print("WeatherControl");
	local pPlayer = Players[playerID];
	local targetCity = GetRandomPlayerPortCity(pPlayer);
	local iX = targetCity:GetX();
	local iY = targetCity:GetY();
	local targetName = targetCity:GetName();
		ContextPtr:SetHide(false)
		Controls.Description:LocalizeAndSetText("TXT_KEY_DESCRIP_WCONTROL", targetName);
	    Controls.EventImage:SetTexture("Hurr.dds");
		Controls.FirstChoice:LocalizeAndSetText("TXT_KEY_CHOICE_WCONTROL_ONE");
		Controls.SecondChoice:LocalizeAndSetText("TXT_KEY_CHOICE_WCONTROL_TWO");
		Controls.ThirdChoice:LocalizeAndSetText("TXT_KEY_CHOICE_WCONTROL_THREE");
		Controls.Choice1:LocalizeAndSetText("TXT_KEY_BUTTON_WCONTROL_ONE");
		Controls.FirstResult:LocalizeAndSetText("TXT_KEY_RESULT_WCONTROL_ONE");
		Controls.Choice2:LocalizeAndSetText("TXT_KEY_BUTTON_WCONTROL_TWO");
		Controls.SecondResult:LocalizeAndSetText("TXT_KEY_RESULT_WCONTROL_TWO");
		Controls.Choice3:LocalizeAndSetText("TXT_KEY_BUTTON_WCONTROL_THREE");
		Controls.ThirdResult:LocalizeAndSetText("TXT_KEY_RESULT_WCONTROL_THREE");
		function OnChoice1(playerID)
			local iControlOdds = Game.Rand(100, "chance");
			if iControlOdds > 100 then
				text = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_SUMMARY_WCONTROLGOOD");
				heading = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_WCONTROLGOOD");
				pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, text, heading, iX, iY);
			else
				local iDammod = 25
				local PopDamage = true
				local iWeatherChoice = 1
				DoHurricane(pPlayer, targetCity, iDammod, PopDamage, iWeatherChoice)
			end
		ContextPtr:SetHide(true)
		end
		Controls.Choice1:RegisterCallback(Mouse.eLClick, OnChoice1)
		function OnChoice2(playerID)
			local iControlOdds = Game.Rand(100, "chance");
			if iControlOdds < 60 then
				text = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_SUMMARY_WCONTROLGOOD");
				heading = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_WCONTROLGOOD");
				pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, text, heading, iX, iY);
			else
				local iDammod = 25
				local PopDamage = false
				local iWeatherChoice = 2
				DoHurricane(pPlayer, targetCity, iDammod, PopDamage, iWeatherChoice)
			end
		ContextPtr:SetHide(true)	 
		end
		Controls.Choice2:RegisterCallback(Mouse.eLClick, OnChoice2)
		function OnChoice3(playerID)
			 local iDammod = 0
			 local PopDamage = false
			 local iWeatherChoice = 3
			 DoHurricane(pPlayer, targetCity, iDammod, PopDamage, iWeatherChoice)
		ContextPtr:SetHide(true)	
		end
		Controls.Choice3:RegisterCallback(Mouse.eLClick, OnChoice3)
	
end
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
function DecisionEvent49(playerID, unit)
	print("LostTribe");
	local pPlayer = Players[playerID];
	local iTribeOdds = Game.Rand(100, "tribe");
	local capCity = pPlayer:GetCapitalCity();
	local iX = unit:GetX();
	local iY = unit:GetY();
		ContextPtr:SetHide(false)
		Controls.Description:LocalizeAndSetText("TXT_KEY_DESCRIP_LOSTRIBE");
	    Controls.EventImage:SetTexture("neolithic.dds");
		Controls.FirstChoice:LocalizeAndSetText("TXT_KEY_CHOICE_LOSTRIBE_ONE");
		Controls.SecondChoice:LocalizeAndSetText("TXT_KEY_CHOICE_LOSTRIBE_TWO");
		Controls.ThirdChoice:LocalizeAndSetText("TXT_KEY_CHOICE_LOSTRIBE_THREE");
		Controls.Choice1:LocalizeAndSetText("TXT_KEY_BUTTON_LOSTRIBE_ONE");
		Controls.FirstResult:LocalizeAndSetText("TXT_KEY_RESULT_LOSTRIBE_ONE");
		Controls.Choice2:LocalizeAndSetText("TXT_KEY_BUTTON_LOSTRIBE_TWO");
		Controls.SecondResult:LocalizeAndSetText("TXT_KEY_RESULT_LOSTRIBE_TWO");
		Controls.Choice3:LocalizeAndSetText("TXT_KEY_BUTTON_LOSTRIBE_THREE");
		Controls.ThirdResult:LocalizeAndSetText("TXT_KEY_RESULT_LOSTRIBE_THREE");
		function OnChoice1(playerID)
			if iTribeOdds > 35 then 
				InitUnitFromCity(capCity, GameInfoTypes.UNIT_SETTLER, 1);
			else
			unit:Kill();
			text = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_SUMMARY_TRIBEUNITA");
			heading = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_TRIBEUNITA");
			pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, text, heading, iX, iY);
			end
		ContextPtr:SetHide(true)
		end
		Controls.Choice1:RegisterCallback(Mouse.eLClick, OnChoice1)
		function OnChoice2(playerID)
			if iTribeOdds > 25 then 
				pPlayer:ChangeGold(-25);
				InitUnitFromCity(capCity, GameInfoTypes.UNIT_WARRIOR, 1);
			else
			unit:Kill();
			text = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_SUMMARY_TRIBEUNITB");
			heading = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_TRIBEUNITB");
			pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, text, heading, iX, iY);
			end
		ContextPtr:SetHide(true)	 
		end
		Controls.Choice2:RegisterCallback(Mouse.eLClick, OnChoice2)
		function OnChoice3(playerID)
			if iTribeOdds > 35 then 
				local iResourceID = GameInfoTypes["RESOURCE_MANPOWER"];
				pPlayer:ChangeNumResourceTotal(iResourceID, 3)
			end
			if iTribeOdds > 85 then
				
				unit:Kill();
				text = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_SUMMARY_TRIBEUNIT");
				heading = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_TRIBEUNIT");
				pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, text, heading, iX, iY);
			end
		ContextPtr:SetHide(true)	
		end
		Controls.Choice3:RegisterCallback(Mouse.eLClick, OnChoice3)
	
end
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
function DecisionEvent50(playerID, targetCity)
	print("Bad Water");
	local pPlayer = Players[playerID];
	local iX = targetCity:GetX();
	local iY = targetCity:GetY();
	local targetName = targetCity:GetName();
	local iTargetPop = targetCity:GetPopulation();
	local iToDie = math.ceil(iTargetPop / 3);
	local pTeam = Teams[pPlayer:GetTeam()];
	local iAquaCost = 150;
	if (pTeam:IsHasTech(GameInfoTypes["TECH_ENGINEERING"])) then
		iAquaCost = 75;
	end
		ContextPtr:SetHide(false)
		Controls.Description:LocalizeAndSetText("TXT_KEY_DESCRIP_BADWATER", targetName);
	    Controls.EventImage:SetTexture("well.dds");
		Controls.FirstChoice:LocalizeAndSetText("TXT_KEY_CHOICE_BADWATER_ONE");
		Controls.SecondChoice:LocalizeAndSetText("TXT_KEY_CHOICE_BADWATER_TWO");
		Controls.ThirdChoice:LocalizeAndSetText("TXT_KEY_CHOICE_BADWATER_THREE");
		Controls.Choice1:LocalizeAndSetText("TXT_KEY_BUTTON_BADWATER_ONE");
		Controls.FirstResult:LocalizeAndSetText("TXT_KEY_RESULT_BADWATER_ONE", iAquaCost);
		Controls.Choice2:LocalizeAndSetText("TXT_KEY_BUTTON_BADWATER_TWO");
		Controls.SecondResult:LocalizeAndSetText("TXT_KEY_RESULT_BADWATER_TWO");
		Controls.Choice3:LocalizeAndSetText("TXT_KEY_BUTTON_BADWATER_THREE");
		Controls.ThirdResult:LocalizeAndSetText("TXT_KEY_RESULT_BADWATER_THREE", iToDie);
		function OnChoice1(playerID)
			pPlayer:ChangeGold(-iAquaCost);
			targetCity:SetNumRealBuilding(GameInfo.Buildings["BUILDING_AQUEDUCT"].ID, 1);
		ContextPtr:SetHide(true)
		end
		Controls.Choice1:RegisterCallback(Mouse.eLClick, OnChoice1)
		function OnChoice2(playerID)
			local randDie = Game.Rand(100, "die");
			if randDie > 45 then 
				text = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_SUMMARY_BADWATER");
				heading = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_BADWATER");
				pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, text, heading, iX, iY);
			else
				targetCity:ChangePopulation(-iToDie);
				text = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_SUMMARY_BADWATERB", iToDie);
				heading = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_BADWATERB");
				pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, text, heading, iX, iY);
			end
		ContextPtr:SetHide(true)	 
		end
		Controls.Choice2:RegisterCallback(Mouse.eLClick, OnChoice2)
		function OnChoice3(playerID)
			targetCity:ChangePopulation(-iToDie);
			City:ChangeHealRate(75)
		ContextPtr:SetHide(true)	
		end
		Controls.Choice3:RegisterCallback(Mouse.eLClick, OnChoice3)
	
end
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
function DecisionEvent51(playerID)
	print("Forum");
	local pPlayer = Players[playerID];
	local capCity = pPlayer:GetCapitalCity();
	local civAdj = pPlayer:GetCivilizationAdjectiveKey()
		ContextPtr:SetHide(false)
		Controls.Description:LocalizeAndSetText("TXT_KEY_DESCRIP_FORUM", civAdj);
	    Controls.EventImage:SetTexture("senate.dds");
		Controls.FirstChoice:LocalizeAndSetText("TXT_KEY_CHOICE_FORUM_ONE");
		Controls.SecondChoice:LocalizeAndSetText("TXT_KEY_CHOICE_FORUM_TWO");
		Controls.ThirdChoice:LocalizeAndSetText("TXT_KEY_CHOICE_FORUM_THREE");
		Controls.Choice1:LocalizeAndSetText("TXT_KEY_BUTTON_FORUM_ONE");
		Controls.FirstResult:LocalizeAndSetText("TXT_KEY_RESULT_FORUM_ONE");
		Controls.Choice2:LocalizeAndSetText("TXT_KEY_BUTTON_FORUM_TWO");
		Controls.SecondResult:LocalizeAndSetText("TXT_KEY_RESULT_FORUM_TWO");
		Controls.Choice3:LocalizeAndSetText("TXT_KEY_BUTTON_FORUM_THREE");
		Controls.ThirdResult:LocalizeAndSetText("TXT_KEY_RESULT_FORUM_THREE");
		function OnChoice1(playerID)
			local randDie = Game.Rand(100, "die");
			if randDie < 40 then
				CityRiot(pPlayer, capCity)
			end
		ContextPtr:SetHide(true)
		end
		Controls.Choice1:RegisterCallback(Mouse.eLClick, OnChoice1)
		function OnChoice2(playerID)
			local iNUmUnits = pPlayer:GetNumUnits();
			local iChanceLost = math.ceil(iNUmUnits / 4);
			local iUnitsLost = math.random(1, iChanceLost);
			local randDie = Game.Rand(100, "die");
			local defectCiv,
				  defectID = GetRandomOtherPlayer(pPlayer);
			local otherCivName = defectCiv:GetName();
			local iPlayerForName = defectID
			if randDie < 40 then
				for i = 1, iUnitsLost do
				unit = RandomUnitNotGarrisoned(pPlayer);
					if unit ~= nil then
						ChangeOwner(unit, defectID, iPlayerForName)
					end
				end
			end
			text = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_SUMMARY_FORUMB", iUnitsLost, otherCivName);
			heading = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_FORUMB");
			pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, text, heading);
		ContextPtr:SetHide(true)	 
		end
		Controls.Choice2:RegisterCallback(Mouse.eLClick, OnChoice2)
		function OnChoice3(playerID)
			local iResOrderID = GameInfoTypes["RESOURCE_CIV_ORDER"];
			pPlayer:ChangeNumResourceTotal(iResOrderID, -6);
		ContextPtr:SetHide(true)	
		end
		Controls.Choice3:RegisterCallback(Mouse.eLClick, OnChoice3)
	
end
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
function DecisionEvent52(playerID)
	print("DarkAge");
	local pPlayer = Players[playerID];
	
		ContextPtr:SetHide(false)
		Controls.Description:LocalizeAndSetText("TXT_KEY_DESCRIP_DARKAGE");
	    Controls.EventImage:SetTexture("libfire.dds");
		Controls.FirstChoice:LocalizeAndSetText("TXT_KEY_CHOICE_DARKAGE_ONE");
		Controls.SecondChoice:LocalizeAndSetText("TXT_KEY_CHOICE_DARKAGE_TWO");
		Controls.ThirdChoice:LocalizeAndSetText("TXT_KEY_CHOICE_DARKAGE_THREE");
		Controls.Choice1:LocalizeAndSetText("TXT_KEY_BUTTON_DARKAGE_ONE");
		Controls.FirstResult:LocalizeAndSetText("TXT_KEY_RESULT_DARKAGE_ONE");
		Controls.Choice2:LocalizeAndSetText("TXT_KEY_BUTTON_DARKAGE_TWO");
		Controls.SecondResult:LocalizeAndSetText("TXT_KEY_RESULT_DARKAGE_TWO");
		Controls.Choice3:LocalizeAndSetText("TXT_KEY_BUTTON_DARKAGE_THREE");
		Controls.ThirdResult:LocalizeAndSetText("TXT_KEY_RESULT_DARKAGE_THREE");
		function OnChoice1(playerID)
			local iDarkAgeTurn = 10
			local plusYield = 1
			DoDarkAge(pPlayer, iDarkAgeTurn, plusYield)
		ContextPtr:SetHide(true)
		end
		Controls.Choice1:RegisterCallback(Mouse.eLClick, OnChoice1)
		function OnChoice2(playerID)
			local iDarkAgeTurn = 5
			local plusYield = nil
			DoDarkAge(pPlayer, iDarkAgeTurn, plusYield)
		ContextPtr:SetHide(true)	 
		end
		Controls.Choice2:RegisterCallback(Mouse.eLClick, OnChoice2)
		function OnChoice3(playerID)
			pPlayer:ChangeGold(-200);
			local iDarkAgeTurn = 2
			local plusYield = nil
			DoDarkAge(pPlayer, iDarkAgeTurn, plusYield)
		ContextPtr:SetHide(true)	
		end
		Controls.Choice3:RegisterCallback(Mouse.eLClick, OnChoice3)
	
end
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
function DecisionEvent53(playerID)
	print("Enlighten");
	local pPlayer = Players[playerID];
	local capCity = pPlayer:GetCapitalCity();
		ContextPtr:SetHide(false)
		Controls.Description:LocalizeAndSetText("TXT_KEY_DESCRIP_ENLIGHT");
	    Controls.EventImage:SetTexture("Enlightenment.dds");
		Controls.FirstChoice:LocalizeAndSetText("TXT_KEY_CHOICE_ENLIGHT_ONE");
		Controls.SecondChoice:LocalizeAndSetText("TXT_KEY_CHOICE_ENLIGHT_TWO");
		Controls.ThirdChoice:LocalizeAndSetText("TXT_KEY_CHOICE_ENLIGHT_THREE");
		Controls.Choice1:LocalizeAndSetText("TXT_KEY_BUTTON_ENLIGHT_ONE");
		Controls.FirstResult:LocalizeAndSetText("TXT_KEY_RESULT_ENLIGHT_ONE");
		Controls.Choice2:LocalizeAndSetText("TXT_KEY_BUTTON_ENLIGHT_TWO");
		Controls.SecondResult:LocalizeAndSetText("TXT_KEY_RESULT_ENLIGHT_TWO");
		Controls.Choice3:LocalizeAndSetText("TXT_KEY_BUTTON_ENLIGHT_THREE");
		Controls.ThirdResult:LocalizeAndSetText("TXT_KEY_RESULT_ENLIGHT_THREE");
		function OnChoice1(playerID)
			InitUnitFromCity(capCity, GameInfoTypes.UNIT_ARTIST, 1)
		ContextPtr:SetHide(true)
		end
		Controls.Choice1:RegisterCallback(Mouse.eLClick, OnChoice1)
		function OnChoice2(playerID)
			InitUnitFromCity(capCity, GameInfoTypes.UNIT_SCIENTIST, 1)
		ContextPtr:SetHide(true)	 
		end
		Controls.Choice2:RegisterCallback(Mouse.eLClick, OnChoice2)
		function OnChoice3(playerID)
			InitUnitFromCity(capCity, GameInfoTypes.UNIT_PROPHET, 1)
		ContextPtr:SetHide(true)	
		end
		Controls.Choice3:RegisterCallback(Mouse.eLClick, OnChoice3)
	
end
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
function DecisionEvent54(playerID)
	print("NatStrike");
	local pPlayer = Players[playerID];
	local numCities = pPlayer:GetNumCities();
		ContextPtr:SetHide(false)
		Controls.Description:LocalizeAndSetText("TXT_KEY_DESCRIP_NATLSTRIKE");
	    Controls.EventImage:SetTexture("strike.dds");
		Controls.FirstChoice:LocalizeAndSetText("TXT_KEY_CHOICE_NATLSTRIKE_ONE");
		Controls.SecondChoice:LocalizeAndSetText("TXT_KEY_CHOICE_NATLSTRIKE_TWO");
		Controls.ThirdChoice:LocalizeAndSetText("TXT_KEY_CHOICE_NATLSTRIKE_THREE");
		Controls.Choice1:LocalizeAndSetText("TXT_KEY_BUTTON_NATLSTRIKE_ONE");
		Controls.FirstResult:LocalizeAndSetText("TXT_KEY_RESULT_NATLSTRIKE_ONE");
		Controls.Choice2:LocalizeAndSetText("TXT_KEY_BUTTON_NATLSTRIKE_TWO");
		Controls.SecondResult:LocalizeAndSetText("TXT_KEY_RESULT_NATLSTRIKE_TWO");
		Controls.Choice3:LocalizeAndSetText("TXT_KEY_BUTTON_NATLSTRIKE_THREE");
		Controls.ThirdResult:LocalizeAndSetText("TXT_KEY_RESULT_NATLSTRIKE_THREE");
		function OnChoice1(playerID)
			pPlayer:ChangeGold(-500);
		ContextPtr:SetHide(true)
		end
		Controls.Choice1:RegisterCallback(Mouse.eLClick, OnChoice1)
		function OnChoice2(playerID)
			pPlayer:ChangeExtraHappinessPerCity(-8 / numCities);
			local iRandDie = Game.Rand(500, "DIe");
			if iRandDie < 500 then 
				DoRailStrike(pPlayer)
			else
			text = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_SUMMARY_NATSTRIKE");
			heading = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_NATSTRIKE");
			pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, text, heading);
			end
		ContextPtr:SetHide(true)	 
		end
		Controls.Choice2:RegisterCallback(Mouse.eLClick, OnChoice2)
		function OnChoice3(playerID)
			for pCity in pPlayer:Cities() do
				pCity:ChangeProduction(-2)
				pCity:ChangeBaseYieldRateFromBuildings(YieldTypes.YIELD_GOLD, -2)	
			end
			local iStrikeTurns = math.random(2,6)
			SetPersistentProperty("StrikeTurns", iStrikeTurns);
		ContextPtr:SetHide(true)	
		end
		Controls.Choice3:RegisterCallback(Mouse.eLClick, OnChoice3)
	
end
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
function DecisionEvent55(playerID)
	print("ECOCOLLAPSE");
	local pPlayer = Players[playerID];

		ContextPtr:SetHide(false)
		Controls.Description:LocalizeAndSetText("TXT_KEY_DESCRIP_ECOCOLLAPSE");
	    Controls.EventImage:SetTexture("crash.dds");
		Controls.FirstChoice:LocalizeAndSetText("TXT_KEY_CHOICE_ECOCOLLAPSE_ONE");
		Controls.SecondChoice:LocalizeAndSetText("TXT_KEY_CHOICE_ECOCOLLAPSE_TWO");
		Controls.ThirdChoice:LocalizeAndSetText("TXT_KEY_CHOICE_ECOCOLLAPSE_THREE");
		Controls.Choice1:LocalizeAndSetText("TXT_KEY_BUTTON_ECOCOLLAPSE_ONE");
		Controls.FirstResult:LocalizeAndSetText("TXT_KEY_RESULT_ECOCOLLAPSE_ONE");
		Controls.Choice2:LocalizeAndSetText("TXT_KEY_BUTTON_ECOCOLLAPSE_TWO");
		Controls.SecondResult:LocalizeAndSetText("TXT_KEY_RESULT_ECOCOLLAPSE_TWO");
		Controls.Choice3:LocalizeAndSetText("TXT_KEY_BUTTON_ECOCOLLAPSE_THREE");
		Controls.ThirdResult:LocalizeAndSetText("TXT_KEY_RESULT_ECOCOLLAPSE_THREE");
		function OnChoice1(playerID)
			pPlayer:ChangeGold(-2000);
		ContextPtr:SetHide(true)
		end
		Controls.Choice1:RegisterCallback(Mouse.eLClick, OnChoice1)
		function OnChoice2(playerID)
			local capCity = pPlayer:GetCapitalCity();
			capCity:ChangeBaseYieldRateFromBuildings(YieldTypes.YIELD_GOLD, -10)	
		ContextPtr:SetHide(true)	 
		end
		Controls.Choice2:RegisterCallback(Mouse.eLClick, OnChoice2)
		function OnChoice3(playerID)
			local iCrashDie = Game.Rand(300, "die");
			if iCrashDie < 100 then
				local icivGold = pPlayer:GetGold();
				local iCrash = ( icivGold * ( math.random( 35,65 ) / 100 ) ); 
				pPlayer:ChangeGold(-iCrash);
				text = targetCity:GetName(), Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_SUMMARY_ECOCOLLAPSE");
				heading = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_ECOCOLLAPSE");
     			pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, text, heading);
			end
		ContextPtr:SetHide(true)	
		end
		Controls.Choice3:RegisterCallback(Mouse.eLClick, OnChoice3)
	
end
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
function DecisionEvent56(playerID)
	print("Nanobots");
	local pPlayer = Players[playerID];
	local targetCity = GetRandomPlayerCityNotCap(pPlayer)
	local iX = targetCity:GetX();
	local iY = targetCity:GetY();	
		ContextPtr:SetHide(false)
		Controls.Description:LocalizeAndSetText("TXT_KEY_DESCRIP_NANOBOTS");
	    Controls.EventImage:SetTexture("nano.dds");
		Controls.FirstChoice:LocalizeAndSetText("TXT_KEY_CHOICE_NANOBOTS_ONE");
		Controls.SecondChoice:LocalizeAndSetText("TXT_KEY_CHOICE_NANOBOTS_TWO");
		Controls.ThirdChoice:LocalizeAndSetText("TXT_KEY_CHOICE_NANOBOTS_THREE");
		Controls.Choice1:LocalizeAndSetText("TXT_KEY_BUTTON_NANOBOTS_ONE");
		Controls.FirstResult:LocalizeAndSetText("TXT_KEY_RESULT_NANOBOTS_ONE");
		Controls.Choice2:LocalizeAndSetText("TXT_KEY_BUTTON_NANOBOTS_TWO");
		Controls.SecondResult:LocalizeAndSetText("TXT_KEY_RESULT_NANOBOTS_TWO");
		Controls.Choice3:LocalizeAndSetText("TXT_KEY_BUTTON_NANOBOTS_THREE");
		Controls.ThirdResult:LocalizeAndSetText("TXT_KEY_RESULT_NANOBOTS_THREE");
		function OnChoice1(playerID)
			pPlayer:ChangeGold(-5000);
			NanoStart(pPlayer, iX, iY)
			text = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_SUMMARY_NANOBOTS");
				heading = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_NANOBOTS");
     			pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, text, heading, iX, iY);
				
		ContextPtr:SetHide(true)
		end
		Controls.Choice1:RegisterCallback(Mouse.eLClick, OnChoice1)
		function OnChoice2(playerID)
			local pTeamID = pPlayer:GetTeam();
			local pTeam = Teams[pTeamID];
			local pTeamTechs = pTeam:GetTeamTechs();
			local iTech = pPlayer:GetCurrentResearch();
			local techProgress = pPlayer:GetResearchCost(iTech);
			pTeamTechs:ChangeResearchProgress(iTech, -200 , pPlayer)
			NanoStart(pPlayer, iX, iY)
			text = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_SUMMARY_NANOBOTSB");
				heading = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_NANOBOTS");
     			pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, text, heading, iX, iY);
		ContextPtr:SetHide(true)	 
		end
		Controls.Choice2:RegisterCallback(Mouse.eLClick, OnChoice2)
		function OnChoice3(playerID)
				local pTeamID = pPlayer:GetTeam();
				local pTeam = Teams[pTeamID];
				local pTeamTechs = pTeam:GetTeamTechs();
				local iTech = pPlayer:GetCurrentResearch();
				local techProgress = pPlayer:GetResearchCost(iTech);
				pTeamTechs:ChangeResearchProgress(iTech, 100 , pPlayer)
				NanoStart(pPlayer, iX, iY)
				text = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_SUMMARY_NANOBOTSC");
				heading = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_NANOBOTS");
     			pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, text, heading, iX, iY);
		
		ContextPtr:SetHide(true)	
		end
		Controls.Choice3:RegisterCallback(Mouse.eLClick, OnChoice3)
	
end
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------




function Init()
 ContextPtr:SetHide(true)
print("inti");
goDecn = 0;
end
Init()
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
IconHookup(23, 80, "CIV_COLOR_ATLAS", Controls.DialogTopIcon)