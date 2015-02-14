if(Game.GetCustomOption("GAMEOPTION_CCTP_EVENTS") == 0) then
	return;
end
-- TriggeredEvents
-- Author: Gyogen
-- DateCreated: 10/9/2014 9:51:07 AM
--------------------------------------------------------------
include( "EventOptions.lua" );
include( "EventUtils.lua" );
--------------------------------------------------------------
---------Era Events---------------
--------------------------------------------------------------


--------------------------------------------------------------
function ClasEvent()
	print('ClasEvent');
	local iPlayerID = Game.GetActivePlayer();
	local pPlayer = Players[iPlayerID];
	local pTeamID = pPlayer:GetTeam();
	local pTeam = Teams[pTeamID];
	local pTeamTechs = pTeam:GetTeamTechs();

	local randoutcome = Game.Rand(100, "Choosing good or bad");
	if randoutcome < 50 then
		gochoice = 1
	elseif randoutcome > 49 then
		gochoice = 2
	end

	if gochoice == 1 then
		local randTechID = GetRandomTech(pPlayer, pTeam);
		pTeam:SetHasTech (randTechID, true);
		pPlayer:ChooseTech(1);
		if randTechID ~= nil then
			if (pPlayer:IsHuman()) then
				text = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_SUMMARY_CLASSICALGOOD");
				heading = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_CLASSICALGOOD");
     			pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, text, heading);
			end
			return
		end
	elseif gochoice == 2 then
		local iTech = pPlayer:GetCurrentResearch();
		local techProgress = pPlayer:GetResearchCost(iTech);
			if techProgress > 0 then
				iRand = math.random(1,(techProgress / 2));
				pTeamTechs:ChangeResearchProgress(iTech, -iRand , pPlayer)
			end
			if (pPlayer:IsHuman()) then
			text = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_SUMMARY_CLASSICALBAD");
			heading = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_CLASSICALBAD");
     		pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, text, heading);
			end
			return
	end
end
--------------------------------------------------------------
function MedEvent()
	print('MedEvent');
	local iPlayerID = Game.GetActivePlayer();
	local pPlayer = Players[iPlayerID];
	local targetCity = GetRandomPlayerCity(pPlayer);
	local iX = targetCity:GetX();
	local iY = targetCity:GetY();
	local ePop = targetCity:GetPopulation();
	local randoutcome = Game.Rand(100, "Choosing good or bad");
	if randoutcome < 50 then
		gochoice = 1
	elseif randoutcome > 49 then
		gochoice = 2
	end

	if gochoice == 1 then	
		local pBarbPlayer = Players[63];
		if pPlayer:IsPolicyBranchUnlocked(GameInfoTypes.POLICY_BRANCH_SLAVERY) then	
			if ePop > 1 then
				targetCity:ChangePopulation(- 1);
				unit = pBarbPlayer:InitUnit(GameInfoTypes["UNIT_SWORDSMAN"], iX, iY);
				unit:JumpToNearestValidPlot();
				if not city:IsPuppet() and not city:IsCapital()
				and not city:IsOccupied() then
				targetCity:SetOccupied(true);
				InvalidateCity()
				end
			end
			
			if (pPlayer:IsHuman()) then
				text = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_SUMMARY_MEDBAD"), targetCity:GetName();
				heading = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_MEDBAD");
     			pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, text, heading, iX, iY);
				
			end
			return
		end
	elseif gochoice == 2 then
		if pPlayer:IsPolicyBranchUnlocked(GameInfoTypes.POLICY_BRANCH_LIBERTY) then
			InitUnitFromCity(targetCity, GameInfoTypes.UNIT_SWORDSMAN, 2)
			if (pPlayer:IsHuman()) then
				text = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_SUMMARY_MEDGOOD"), targetCity:GetName();
				heading = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_RECRUIT");
     			pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, text, heading, iX, iY);
				
			end
		end
		return
	end
end
--------------------------------------------------------------
function RenEvent()
	print('RenEvent');
	local iPlayerID = Game.GetActivePlayer();
	local pPlayer = Players[iPlayerID];
	local targetCity = GetRandomPlayerCity(pPlayer);
	local iX = targetCity:GetX();
	local iY = targetCity:GetY();
	local turns = math.random(3,10);
	local randoutcome = Game.Rand(100, "Choosing good or bad");
	if randoutcome < 50 then
		gochoice = 1
	elseif randoutcome > 49 then
		gochoice = 2
	end

	if gochoice == 1 then	
		if pPlayer:IsPolicyBranchUnlocked(GameInfoTypes.POLICY_BRANCH_AESTHETICS) then
			InitUnitFromCity(targetCity, GameInfoTypes.UNIT_ARTIST, 2)
			targetCity:SetWeLoveTheKingDayCounter(turns);
			if (pPlayer:IsHuman()) then
				text = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_SUMMARY_RENGOOD"), targetCity:GetName();
				heading = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_RENGOOD");
     			pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, text, heading, iX, iY);
			end
			return
		end
	elseif gochoice == 2 then
		if pPlayer:IsPolicyBranchUnlocked(GameInfoTypes.POLICY_BRANCH_PIETY) then
			local irandanarchy = math.random(2,4);
			local iranddamage = math.random(10,30);
			local targetName = targetCity:GetName()
			targetCity:ChangeResistanceTurns(5)
			targetCity:SetDamage(iranddamage);
			if (pPlayer:IsHuman()) then
				text = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_SUMMARY_RENBADA", targetName);
				heading = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_RENBADA");
     			pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, text, heading, iX, iY);
				
			end
		end
		return
	end
end
--------------------------------------------------------------
function IndEvent()
	print('IndEvent');
	local iPlayerID = Game.GetActivePlayer();
	local pPlayer = Players[iPlayerID];
	

	local randoutcome = Game.Rand(100, "Choosing good or bad");
	if randoutcome < 50 then
		gochoice = 1
	elseif randoutcome > 49 then
		gochoice = 2
	end

	if gochoice == 1 then
		for city in pPlayer:Cities() do
			local prodNeeded = city:GetProductionNeeded(); 
			if prodNeeded > 0 then
				city:SetProduction(prodNeeded);
			end
		end
		if (pPlayer:IsHuman()) then
			text = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_SUMMARY_INDGOOD");
			heading = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_INDGOOD");
     		pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, text, heading);
			return
		end
	

	elseif gochoice == 2 then
		local pCity = GetRandomPlayerCity(pPlayer);
		local prodNeeded = pCity:GetProductionNeeded(); 
		if prodNeeded > 0 then
			pCity:SetProduction(-prodNeeded);
			if (pPlayer:IsHuman()) then
				text = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_SUMMARY_INDBAD"), pCity:GetName();
				heading = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_INDBAD");
     			pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, text, heading);
			end
		end
		return
	end
end
--------------------------------------------------------------
function ModEvent()
	print('ModEvent');
	local iPlayerID = Game.GetActivePlayer();
	local pPlayer = Players[iPlayerID];
	local pOtherPlayer = GetRandomCIv();
	local team1 = Teams[ pOtherPlayer:GetTeam() ]
	local team2 = Teams[ pPlayer:GetTeam() ]

	local randoutcome = Game.Rand(100, "Choosing good or bad");
	if randoutcome < 50 then
		gochoice = 1
	elseif randoutcome > 49 then
		gochoice = 2
	end

	if gochoice == 1 then
		if CanDeclareWar(team1, team2) then
			team1:DeclareWar( pPlayer:GetTeam() )
			if (pPlayer:IsHuman()) then
				text = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_SUMMARY_MODBAD"), pOtherPlayer:GetName();
				heading = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_MODBAD");
     			pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, text, heading);
			end
			return
		end
	

	elseif gochoice == 2 then
		pPlayer:ChangeNumFreePolicies(2);
		if (pPlayer:IsHuman()) then
			text = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_SUMMARY_MODGOOD");
			heading = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_MODGOOD");
     		pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, text, heading);
		end
		return
	end
end
--------------------------------------------------------------
function PmodEvent()
	print('PmodEvent');
	local iPlayerID = Game.GetActivePlayer();
	local pPlayer = Players[iPlayerID];
	local pResource;	
	local iNumReward;
	local iNumTotal;

	local randoutcome = Game.Rand(100, "Choosing good or bad");
	if randoutcome < 50 then
		gochoice = 1
	elseif randoutcome > 49 then
		gochoice = 2
	end

	if gochoice == 1 then
		for pResource in GameInfo.Resources() do
			local iResourceLoop = pResource.ID;
			if (Game.GetResourceUsageType(iResourceLoop) == ResourceUsageTypes.RESOURCEUSAGE_STRATEGIC) then
				iNumTotal = pPlayer:GetNumResourceTotal(iResourceLoop, true);
				if iNumTotal > 0 then
					local iNumReward = (iNumTotal * 2)
					pPlayer:ChangeNumResourceTotal(iResourceLoop, iNumReward);
				end
			end
		end
			if (pPlayer:IsHuman()) then
				text = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_SUMMARY_PMODGOOD");
				heading = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_PMODGOOD");
     			pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, text, heading);
				return
			end



	elseif gochoice == 2 then
		for pResource in GameInfo.Resources() do
			local iResourceLoop = pResource.ID;
			if (Game.GetResourceUsageType(iResourceLoop) == ResourceUsageTypes.RESOURCEUSAGE_STRATEGIC) then
				iNumTotal = pPlayer:GetNumResourceTotal(iResourceLoop, true);
				if iNumTotal > 0 then
					local iNumReward = Game.Rand((iNumTotal / 2), "Resource loss");
					pPlayer:ChangeNumResourceTotal(iResourceLoop, -iNumReward);
				end
			end
		end
		if (pPlayer:IsHuman()) then
			text = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_SUMMARY_PMODBAD");
			heading = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_PMODBAD");
     		pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, text, heading);
		end
		return
	end
end
--------------------------------------------------------------
function FutEvent()
	print('FutEvent');
	local iPlayerID = Game.GetActivePlayer();
	local pPlayer = Players[iPlayerID];
	local targetCity = GetRandomPlayerCity(pPlayer);
	local iX = targetCity:GetX();
	local iY = targetCity:GetY();
	local plot = Map.GetPlot(iX, iY)

	local randoutcome = Game.Rand(100, "Choosing good or bad");
	if randoutcome < 50 then
		gochoice = 1
	elseif randoutcome > 49 then
		gochoice = 2
	end
	print("choice", gochoice);
	if gochoice == 1 then
		plot:SetFeatureType(FeatureTypes.FEATURE_FALLOUT, -1);
		if (pPlayer:IsHuman()) then
			text = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_SUMMARY_FUTBAD"), targetCity:GetName();
			heading = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_FUTBAD");
     		pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, text, heading, iX, iY);
			return
		end
	
	elseif gochoice == 2 then
		InitUnitFromCity(targetCity, GameInfoTypes.UNIT_XCOM_SQUAD, 5)
		if (pPlayer:IsHuman()) then
			text = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_SUMMARY_FUTGOOD"), targetCity:GetName(), Locale.ConvertTextKey( "TXT_KEY_NOTIFICATION_SUMMARY_FUTGOODB" );
			heading = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_FUTGOOD");
     		pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, text, heading, iX, iY);
		end
		
		return
	end
	finalEraEvent = 1
end
--------------------------------------------------------------
---------Policy Events---------------
--------------------------------------------------------------
function pEvent1(pPlayer, newPolicy)
	print("policy1 go");
	local pCapitalCity = pPlayer:GetCapitalCity();
	local iX = pCapitalCity:GetX();
	local iY = pCapitalCity:GetY();
	local randoutcome = Game.Rand(100, "Choosing good or bad");
	if randoutcome < 50 then
		gochoice = 1
	elseif randoutcome > 49 then
		gochoice = 2
	end	
	if gochoice == 1 then	
		
		local iUnit = PlayersStrongestUnit(pPlayer, true, "UNITCOMBAT_MELEE");
		unit = pPlayer:InitUnit(iUnit, pCapitalCity:GetX(), pCapitalCity:GetY())
		unit:JumpToNearestValidPlot();	
		if (pPlayer:IsHuman()) then
			text = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_SUMMARY_PVENT1GOOD"), pCapitalCity;
			heading = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_PVENT2GOOD");
     		pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, text, heading, iX, iY);
			return
		end			
	
	elseif gochoice == 2 then
		local pOtherPlayer = Players[63];
		local iNum = math.random(1,3);
		for i = 1, iNum do
			unit = pOtherPlayer:InitUnit(GameInfoTypes["UNIT_SWORDSMAN"], (iX + 1), iY);
			unit:JumpToNearestValidPlot();	
		end
		if (pPlayer:IsHuman()) then
			text = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_SUMMARY_PVENT2GOOD"), pCapitalCity, Locale.ConvertTextKey( "TXT_KEY_NOTIFICATION_SUMMARY_PVENT1BAD" );
			heading = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_PVENT1BAD");
     		pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, text, heading, iX, iY);
		end	
		return
	end
end
----------------------------------------------------------------
function pEvent2(pPlayer, newPolicy)
	print("policy2 go");
	local pCity = GetRandomPlayerCity(pPlayer);
	local pCSCity = GetCityStateNearestToCity(pCity);
	local pCityStateCity = pCSCity:GetCityByID(cityIndex)
	local pCityStateName = pCityStateCity:GetName()
	local iX = pCityStateCity:GetX();
	local iY = pCityStateCity:GetY();
	print(pCityStateCity:GetName())
	if (pCSCity == nil) then return end
	print("nearest", pCSCity);
	local randoutcome = Game.Rand(100, "Choosing good or bad");
	if randoutcome < 50 then
		gochoice = 1
		print("gochoice", gochoice);
	elseif randoutcome > 49 then
		gochoice = 2
		print("gochoice", gochoice);
	end	

	if gochoice == 1 then	
		print("chose1");
		local pCityStateCity = pCSCity:GetCityByID(cityIndex)
		local pCityStateName = pCityStateCity:GetName()
		local iX = pCityStateCity:GetX();
		local iY = pCityStateCity:GetY();
		print(pCityStateCity:GetName())
				
    	if pCityStateCity ~= nil then
			pPlayer:AcquireCity(pCityStateCity)
			if pCityStateCity:GetResistanceTurns() > 0 then
				pCityStateCity:ChangeResistanceTurns(-pCityStateCity:GetResistanceTurns())
			end
			pCityStateCity:SetPuppet(false)
			if pCityStateCity:IsRazing() then
				pCityStateCity:DoTask(TaskTypes.TASK_UNRAZE, -1, -1, -1)
			end	

			if pCityStateCity:IsOccupied() then
				pCityStateCity:SetOccupied(false)
			end
			InvalidateCity();
			print("testing");

			if (pPlayer:IsHuman()) then
				text = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_SUMMARY_PVENT2GOOD"), pCityStateName, Locale.ConvertTextKey( "TXT_KEY_NOTIFICATION_SUMMARY_PVENT2GOODB" );
				heading = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_PVENT2GOOD");
     			pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, text, heading, iX, iY);
				
			end	
			return
		end
	
	elseif gochoice == 2 then	
		print("chose2");
		pCSCity:ChangeMinorCivFriendshipWithMajor(pPlayer:GetID(), -60)
		if (pPlayer:IsHuman()) then
			text = Locale.ConvertTextKey( "TXT_KEY_NOTIFICATION_SUMMARY_PVENT2BAD"), pCityStateName, Locale.ConvertTextKey( "TXT_KEY_NOTIFICATION_SUMMARY_PVENT2BADB" );
			heading = Locale.ConvertTextKey("TXT_KEY_NOTIFICATIONPVENT2BAD");
     		pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, text, heading, iX, iY);
		end
		return	
	end
end
---------------------------------------------------------------
function pEvent3(pPlayer, newPolicy)

	local randoutcome = Game.Rand(100, "Choosing good or bad");
	if randoutcome < 50 then
		gochoice = 1
		print("gochoice", gochoice);
	elseif randoutcome > 49 then
		gochoice = 2
		print("gochoice", gochoice);
	end	

	if gochoice == 1 then
		if pPlayer ~= nil then
			for unit in pPlayer:Units() do
				local iExperience = unit:GetExperience();
				if(unit:GetUnitCombatType() ~= -1 or unit:CanNuke()) then
					local extraExp = iExperience + GameRand(iExperience, "getting boost");
					unit:SetExperience(extraExp);
				end			
			end
			if (pPlayer:IsHuman()) then
				text = Locale.ConvertTextKey( "TXT_KEY_NOTIFICATION_SUMMARY_PVENT3GOOD");
				heading = Locale.ConvertTextKey("TXT_KEY_NOTIFICATIONPVENT3GOOD");
     			pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, text, heading);
			end
		end

	elseif gochoice == 2 then
		local unit = RandomUnit(pPlayer);
		local iX = unit:GetX();
		local iY = unit:GetY();
		unit:Kill();
		
		if (pPlayer:IsHuman()) then
			text = Locale.ConvertTextKey( "TXT_KEY_NOTIFICATION_SUMMARY_PVENT3BAD");
			heading = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_PVENT3BAD");
     		pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, text, heading, iX, iY);
		end
	end
end

--------------------------------------------------------------------
--Various Events
--------------------------------------------------------------------
function GPEvent(pPlayer, iUnit, iX, iY)
	local pPlot = Map.GetPlot(iX, iY);
	local randoutcome = Game.Rand(100, "Choosing good or bad");
	if randoutcome < 50 then
		gochoice = 1
		print("gochoice", gochoice);
	elseif randoutcome > 49 then
		gochoice = 2
		print("gochoice", gochoice);
	end	
	if gochoice == 1 then
		unit = pPlayer:InitUnit(iUnit, iX, iY); 
		unit:JumpToNearestValidPlot();
		if (pPlayer:IsHuman()) then
			text = Locale.ConvertTextKey( "TXT_KEY_NOTIFICATION_SUMMARY_GPEVENTGOOD");
			heading = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_GPEVENTGOOD");
     		pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, text, heading, iX, iY);
		end

	elseif gochoice == 2 then
		pPlot:SetImprovementType(-1);

		if (pPlayer:IsHuman()) then
			text = Locale.ConvertTextKey( "TXT_KEY_NOTIFICATION_SUMMARY_GPEVENTBAD");
			heading = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_GPEVENTBAD");
     		pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, text, heading, iX, iY);
		end
	end
end
----------------------------------------------------------------------
function TerrorBomb(pPlayer)
print("TBomd");
	local targetCity = GetRandomPlayerCity(pPlayer)
	local iX = targetCity:GetX();
	local iY = targetCity:GetY();
	local plot = Map.GetPlot(iX, iY)
	plot:SetFeatureType(FeatureTypes.FEATURE_FALLOUT, -1);
	if (pPlayer:IsHuman()) then
		text = targetCity:GetName(), Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_SUMMARY_TERRORBOMB");
		heading = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_TERRORBOMB");
		pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, text, heading, iX, iY);				
	end
end
------------------------------------------------------------------------
function CitizenRevolt(pPlayer)
	local targetCity = GetRandomPlayerCity(pPlayer);
	local iX = targetCity:GetX();
	local iY = targetCity:GetY();
	local ePop = targetCity:GetPopulation();
	local pBarbPlayer = Players[63];
			if ePop > 3 then
				targetCity:ChangePopulation(- 3);
				unit = pBarbPlayer:InitUnit(GameInfoTypes["UNIT_MECH"], iX, iY, 3);
				unit:JumpToNearestValidPlot();
				if not city:IsPuppet() and not city:IsCapital()
				and not city:IsOccupied() then
				targetCity:SetOccupied(true);
				InvalidateCity()
				end
				
				if (pPlayer:IsHuman()) then
				text = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_SUMMARY_CITREVOLT");
				heading = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_CITREVOLT");
				pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, text, heading, iX, iY);				
				end
			end
end
-----------------------------------------------------------------------
function BarbAttack(pPlayer)
	local targetCity = GetRandomPlayerCity(pPlayer);
	local iX = targetCity:GetX();
	local iY = targetCity:GetY();
	local pBarbPlayer = Players[63];
		for i = 1, 4 do
		pBarbPlayer:InitUnit(GameInfoTypes["UNIT_SPEARMAN"], (iX + 1), iY)
		end
end
------------------------------------------------------------------------
function CivReaction(pPlayer, otherPlayer, playerAction)
	local team1 = Teams[ otherPlayer:GetTeam() ]
	local team2 = Teams[ pPlayer:GetTeam() ]
	local civReaction = Game.Rand(200, "civreaction");
	if civReaction < 30 then
		if CanDeclareWar(team1, team2) then
			team1:DeclareWar(team2);
		end
		if playerAction == 1 then
			text = targetCity:GetName(), Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_SUMMARY_CITREACT");
			heading = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_CITREACT");
			pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, text, heading);	
		elseif playerAction == 2 then
			text = targetCity:GetName(), Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_SUMMARY_CITREACTD2");
			heading = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_CITREACTD");
			pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, text, heading);	
		end
	elseif civReaction >30 and civReaction < 45 then
		otherPlayer:DoForceDenounce(pPlayer);
		if playerAction == 1 then
			text = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_SUMMARY_CITREACT1");
			heading = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_CITREACT1");
			pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, text, heading);	
		elseif playerAction == 2 then
			text = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_SUMMARY_CITREACTD2");
			heading = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_CITREACTD2");
			pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, text, heading);	
		end
	end
end
---------------------------------------------------------------------------
function AstroidStrike(pPlayer)
	if (pPlayer:GetNumCities() <= 1) then return end
	local targetCity = GetRandomPlayerCityNotCap(pPlayer);
	local iX = targetCity:GetX();
	local iY = targetCity:GetY();	
	
	local n = targetCity:GetNumCityPlots() - 1	
	for i = 1, n, 1 do
		local plot = targetCity:GetCityIndexPlot( i );
		if (plot:GetImprovementType() ~= NO_IMPROVEMENT) then
		plot:SetImprovementType(-1);
		plot:SetResourceType(-1);
		plot:SetFeatureType(FeatureTypes.FEATURE_FALLOUT, -1);
		end
	end
	local plot = Map.GetPlot(iX, iY);
	playerId = pPlayer:GetID();
	plot:SetFeatureType(FeatureTypes.FEATURE_FALLOUT, -1);
	targetCity:Kill()
	Events.SerialEventCityDestroyed(ToHexFromGrid(Vector2(iX, iY)), playerID, targetCity:GetID(), -1)
	Events.SerialEventGameDataDirty();
	--plot:NukeExplosion();
	
	

	text = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_SUMMARY_ASTBAD");
	heading = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_ASTBAD");
	pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, text, heading, iX, iY);		
end
----------------------------------------------------------------------------------
function MultiAstroidStrike(pPlayer)
	local iNumPlots = Map.GetNumPlots()
	print("size", iNumPlots);
	local iImpactMod = (iNumPlots / 50);
	local iNumImpacts = math.random(10,iImpactMod);
	
	for i = 1, iNumImpacts do
		local targetPlot = GetRandomPlot();
		if (targetPlot:GetImprovementType() ~= NO_IMPROVEMENT) then
			targetPlot:SetImprovementType(-1);
		end
		local plotUnit = targetPlot:GetUnit();
		if plotUnit ~= nil then
			plotUnit:Kill();
		end
		local plotCity = targetPlot:GetPlotCity();
		if plotCity ~= nil then
			plotCity:SetPopulation((plotCity:GetPopulation()) / 1.5);
			plotCity:SetDamage(80);
			local prod = plotCity:GetProductionNeeded();
			plotCity:SetProduction(-prod);
		end
		targetPlot:SetFeatureType(FeatureTypes.FEATURE_FALLOUT, -1);
	end
	text = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_SUMMARY_ASTBAD2");
	heading = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_ASTBAD");
	pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, text, heading);
end
---------------------------------------------------------------------------------
function CityRevolt(pPlayer, spUnit)
	local numCities = pPlayer:GetNumCities();
	local capCity = pPlayer:GetCapitalCity();
	local iRandHigh = (numCities / 2);
	if iRandHigh < 1 then return end

	local randCities = math.random(1, iRandHigh);
	local apCities = {}
	local iChance = 0;
	local otherPlayer = Players[63];
	if (pPlayer:IsAlive()) then
		for city in pPlayer:Cities() do
			if city == capCity then
				apCities[999] = city;
			else
				apCities[iChance] = city;
				iChance = iChance + 1;
			end
		end
	end

	if (iChance > 0) then	
		print("cities", iChance);
		print("randcities", randCities);
		for i = 1, randCities do
			local iRandChoice = Game.Rand(iChance, "Choosing random city");
			targetCity = apCities[iRandChoice];
				CityLostToOther(targetCity, otherPlayer)
				local iX = targetCity:GetX();
				local iY = targetCity:GetY();
				unit = otherPlayer:InitUnit(spUnit, iX, iY);
				unit:JumpToNearestValidPlot();
				text = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_SUMMARY_CITYREVOLT");
				heading = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_CITYREVOLT");
				pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, text, heading, iX, iY);
		end
	end
end
--------------------------------------------------------------------------
function DoPolStateRevolution(pPlayer, spUnit, evntType)
	local numCities = pPlayer:GetNumCities();
	local capCity = pPlayer:GetCapitalCity();
	local iHighRand = math.ceil(numCities / 2);
	local randCities = math.random(1, iHighRand);
	local apCities = {}
	local iChance = 0;
	local otherPlayer = Players[63];
	if (pPlayer:IsAlive()) then
		for city in pPlayer:Cities() do
			if city == capCity then
				apCities[999] = city;
			else
				apCities[iChance] = city;
				iChance = iChance + 1;
			end
		end
	end

	if (iChance > 0) then	
		print("cities", iChance);
		print("randcities", randCities);
		for i = 1, randCities do
			local iRandChoice = Game.Rand(iChance, "Choosing random city");
			targetCity = apCities[iRandChoice];
				CityLostToOther(targetCity, otherPlayer)
				local iX = targetCity:GetX();
				local iY = targetCity:GetY();
				unit = otherPlayer:InitUnit(spUnit, iX, iY);
				unit:JumpToNearestValidPlot();
				if evntType == 1 then
					text = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_SUMMARY_PSREVOLT");
					heading = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_PSREVOLT");
				elseif evntType == 2 then
					text = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_SUMMARY_CRIMEREVOLT");
					heading = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_CRIMEREVOLT");
				end
				pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, text, heading, iX, iY);
		end
	end
end
-------------------------------------------------------------------------
function DoQuakeResult(pPlayer, pCity, iQuakeChoice)
	local iX = pCity:GetX();
	local iY = pCity:GetY();
	local iQuakeRoll = Game.Rand(100, "quake roll");
	local currPop = pCity:GetPopulation();
	local iPopRisk = math.ceil(currPop / 3);
	if iPopRisk <1 then iPopRisk = 1 end
	local iQUakeKill = math.random(1, iPopRisk);
	if iQuakeRoll > 65 then 
		text = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_SUMMARY_QUAKEGOOD");
		heading = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_QUAKEGOOD");
	else
		if iQuakeChoice == 1 then
			pCity:ChangePopulation(-iQUakeKill);
			pCity:SetDamage(100);
			text = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_SUMMARY_QUAKEBADA", iQUakeKill);
			heading = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_QUAKEBADA");
		elseif iQuakeChoice == 2 then
			pCity:SetDamage(100);
			text = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_SUMMARY_QUAKEBADB");
			heading = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_QUAKEBAD");
		elseif iQuakeChoice == 3 then
			pCity:ChangePopulation(-iQUakeKill);
			pCity:SetDamage(150);
			text = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_SUMMARY_QUAKEBADC", iQUakeKill);
			heading = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_QUAKEBAD");
		end
		pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, text, heading, iX, iY);
	end
end
----------------------------------------------------------------------------
function MilitaryCoup(pPlayer, genUnit)
	
	local otherPlayer = Players[63]
	local iPlayerForName = 63
	local iTotalUnits = pPlayer:GetNumUnits();
	local iCoupPoss = (iTotalUnits / 2);
	local iNumCoup = math.random(1, iCoupPoss);
	print("nums", iTotalUnits, iCoupPoss, iNumCoup); 
	ChangeOwner(genUnit, iPlayerForName, iPlayerForName)
	for i = 1, iNumCoup do
		pUnit = RandomUnitNotInCap(pPlayer);
		ChangeOwner(pUnit, iPlayerForName, iPlayerForName)
	end
	text = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_SUMMARY_MILCOUP", iNumCoup);
	heading = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_MILCOUP");
	pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, text, heading);
end
---------------------------------------------------------------------------------
function DoPeaceTalks(pPlayer, iTalksMod)
	local iRandTalks = Game.Rand(100, "talks");
	local iTalkOutcome = (iRandTalks + iTalksMod)

	if iTalkOutcome > 50 then
		for iPlayerLoop = 0, GameDefines.MAX_CIV_PLAYERS-1, 1 do
			local onePlayer = Players[iPlayerLoop]
			if (onePlayer:IsAlive()) then
				local pOneTeamID = onePlayer:GetTeam();
				local pOneTeam = Teams[pOneTeamID];
				for iPlayerLoopTwo = 0, GameDefines.MAX_CIV_PLAYERS-1, 1 do
					if iPlayerLoopTwo ~= iPlayerLoop then
						local TwoPlayer = Players[iPlayerLoopTwo]
						local pTwoTeamID = TwoPlayer:GetTeam();
						local pTwoTeam = Teams[pTwoTeamID];
						if pOneTeam:IsAtWar( pTwoTeamID ) then 
							pOneTeam:MakePeace(pTwoTeamID)
						end
					end
				end
			end
		end
		text = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_SUMMARY_WARGOOD");
		heading = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_WARGOOD");
		pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, text, heading);
	
	elseif iTalkOutcome < 50 then
		for i, player in pairs(Players) do
			local onePlayer = Players[i]
			if (onePlayer:IsAlive() and not onePlayer:IsMinorCiv()) then
				local pOneTeamID = onePlayer:GetTeam();
				local pOneTeam = Teams[pOneTeamID];
				for v, player in pairs(Players) do
					if v ~= i then
						local TwoPlayer = Players[v]
						local pTwoTeamID = TwoPlayer:GetTeam();
						local pTwoTeam = Teams[pTwoTeamID];
						if not (pOneTeam:IsAtWar( pTwoTeamID )) then 
							if CanDeclareWar(pOneTeam, pTwoTeam) and not TwoPlayer:IsMinorCiv() then
							pOneTeam:DeclareWar(pTwoTeamID)
							end
						end
					end
				end
			end
		end
		text = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_SUMMARY_WARBAD");
		heading = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_WARBAD");
		pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, text, heading);
	end
end
-------------------------------------------------------------------------
function  DoHurricane(pPlayer, targetCity, iDammod, PopDamage, iWeatherChoice)
	local iX = targetCity:GetX();
	local iY = targetCity:GetY();	
	local iTotPop = targetCity:GetPopulation();
	local iPopMod = math.ceil(iTotPop / 2);
	local iPopDown = math.random(1, iPopMod);
	local n = targetCity:GetNumCityPlots() - 1	
	local iBase = (50 + iDammod);
	local iNUmBuildings = targetCity:GetNumBuildings();
	local iBuildingsDown = math.ceil(iNUmBuildings * (iDammod / 100));
	for i = 1, n, 1 do
		local plot = targetCity:GetCityIndexPlot( i );
		if (plot:GetImprovementType() ~= NO_IMPROVEMENT) then
			local dRand = 1 + Game.Rand(100, "Random Destruction");
				if dRand < iBase then
				plot:SetImprovementPillaged(true);
				end
		end
	end
	for i = 1, iBuildingsDown do
		local targetBuilding = GetRandBuilding(targetCity);
		print("buikld2", targetBuilding);
		if targetBuilding == nil then return end
		local targetBuildingType = targetBuilding.Type;
		local buildingName = Locale.ConvertTextKey(targetBuilding.Description);
		print("name", strBuildingName);
		targetCity:SetNumRealBuilding(GameInfoTypes[targetBuildingType], -1);
	end
	print("popdown", iPopDown);
	if PopDamage ~= false then 
		targetCity:ChangePopulation(-iPopDown);
	end
	targetCity:SetDamage(80 + (iDammod * 3));
	if iWeatherChoice == 1 then
		text = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_SUMMARY_WEATHERONE", iPopDown);
	elseif iWeatherChoice == 2 then
		text = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_SUMMARY_WEATHERTWO");
	elseif iWeatherChoice == 3 then
		text = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_SUMMARY_WEATHERTHREE");
	end
		heading = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_WEATHERONE");
		pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, text, heading, iX, iY);
end
----------------------------------------------------------------------------------
function CityRiot(pPlayer, pCity)
	local iX = pCity:GetX();
	local iY = pCity:GetY();
	local unit = pCity:GetGarrisonedUnit();
	pCity:ChangeResistanceTurns(5);
	pCity:SetDamage(100);
	if unit ~= nil then
		unit:Kill();
	text = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_SUMMARY_CITYRIOT");
	else
	text = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_SUMMARY_CITYRIOTB");
	end
	heading = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_CITYRIOT");
	pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, text, heading, iX, iY);
end
--------------------------------------------------------------------------
function DoTaxRevolt(pPlayer, spUnit)
	local numCities = pPlayer:GetNumCities();
	local capCity = pPlayer:GetCapitalCity();
	local iHighRand = math.ceil(numCities / 2);
	local randCities = math.random(1, iHighRand);
	local apCities = {}
	local iChance = 0;
	local otherPlayer = Players[63];
	if (pPlayer:IsAlive()) then
		for city in pPlayer:Cities() do
			if city == capCity then
				apCities[999] = city;
			else
				apCities[iChance] = city;
				iChance = iChance + 1;
			end
		end
	end

	if (iChance > 0) then	
		print("cities", iChance);
		print("randcities", randCities);
		for i = 1, randCities do
			local iRandChoice = Game.Rand(iChance, "Choosing random city");
			targetCity = apCities[iRandChoice];
				CityLostToOther(targetCity, otherPlayer)
				local iX = targetCity:GetX();
				local iY = targetCity:GetY();
				unit = otherPlayer:InitUnit(spUnit, iX, iY);
				unit:JumpToNearestValidPlot();
				
				text = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_SUMMARY_TAXREVOLT");
				heading = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_TAXREVOLT");
				pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, text, heading, iX, iY);
		end
	end
end
------------------------------------------------------------------------------
function DoTeaParty(pPlayer)
	local iRandLuxury,
		  targetPlot = GetRandomLuxury(pPlayer);
	local pResource = GameInfo.Resources[iRandLuxury];
	local luxuryName = pResource.Description;
	local iX = targetPlot:GetX();
	local iY = targetPlot:GetY();
	targetPlot:SetResourceType(-1);	

	text = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_SUMMARY_TEAPARTY", luxuryName);
	heading = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_TEAPARTY");
	pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, text, heading, iX, iY);
end
--------------------------------------------------------------------------------
function DoRailStrike(pPlayer)
	
	for pCity in pPlayer:Cities() do
		local iDie = Game.Rand(100, "die");
		if iDie < 65 then
			pCity:ChangeResistanceTurns(4);
			pCity:SetDamage(100);
		end
	end

	text = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_SUMMARY_RAILSTRK");
	heading = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_RAILSTRK");
	pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, text, heading);
end
---------------------------------------------------------------------------------
