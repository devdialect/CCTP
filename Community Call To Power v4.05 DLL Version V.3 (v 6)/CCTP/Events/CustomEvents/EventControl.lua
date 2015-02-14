if(Game.GetCustomOption("GAMEOPTION_CCTP_EVENTS") == 0) then
	return;
end
-- EventControl
-- Author: Gyogen
-- DateCreated: 10/6/2014 6:01:41 PM
--------------------------------------------------------------

include( "EventOptions.lua" );
include( "CivEvents.lua" );
include( "TriggeredEvents.lua" );
include( "EventUtils.lua");
include( "WeatherEvents.lua");
include("Serializer.lua");
--------------------------------------------------------------------
MapModData.g_Properties		= MapModData.g_Properties or {}
g_Properties				= MapModData.g_Properties;

local g_SaveData = Modding.OpenSaveData();
local g_HoldTurn;
local g_LastEvent;
local g_GoDecision;
------------------------------------------------------
--Random Event Check
------------------------------------------------------
function RandomEvents(iPlayer)
	local pPlayer = Players[iPlayer];
	print("event started")	
	local iTurn = Game.GetGameTurn();
	local Echeck = 0;
	local eventType	
	
	if ( iEventCoolDown == iTurn ) then	
		Echeck = 1;	
		iEventCoolDown = iTurn + (math.random(BaseCooldownTurnsMin, BaseCooldownTurnsMax));
		print("cooldown", iCoolDown)
	end
	if Echeck == 1 then
		CheckForEvents();
	end
	
end			

	
GameEvents.PlayerDoTurn.Add(RandomEvents)

-------------------------------------------------------------------
--Decision Event Check 
-------------------------------------------------------------------
function DecisionCheck()
	
	local playerID = 0
	local pPlayer = Players[playerID];
	local pTeam = Teams[pPlayer:GetTeam()];
	local iCurrEra = EraCheck();
	local iTurn = Game.GetGameTurn();
	if iTurn == 10 then
		DecisionEvent1(playerID)
	end
	if ( iDecisionCoolDown == iTurn ) then	
		Dcheck = 1;	
		if g_HoldTurn == 1 then
			iDecisionCoolDown = iTurn + 1;
			g_HoldTurn = -1;
		else
			iDecisionCoolDown = iTurn + DecisionCoolDownTurns;
		end
		print("iDecisionCoolDown", iDecisionCoolDown, "g_HoldTurn", g_HoldTurn);

	end
	if Dcheck == 1 then

		
		print("iCurrera", iCurrEra, "dPick", g_GoDecision);
		if iCurrEra == 0 then
			if g_GoDecision == 1 then 
				DecisionEvent4(playerID)
				g_GoDecision = 2
			elseif g_GoDecision == 2 then 
				DecisionEvent5(playerID)
				g_GoDecision = 3
			elseif g_GoDecision == 3 then 
				DecisionEvent22(playerID)
				g_GoDecision = 4
			elseif g_GoDecision == 4 then 
				DecisionEvent31(playerID)
				g_GoDecision = 5
			elseif g_GoDecision == 5 then 
				DecisionEvent40(playerID)
				g_GoDecision = 6
			elseif g_GoDecision == 6 then 
				local unitType = GameInfoTypes["UNIT_SCOUT"];
				local sctUnit = PlayerHasUnit(pPlayer, unitType);
				if sctUnit == nil then
				g_HoldTurn = 1
				 return
				 end
				DecisionEvent49(playerID, sctUnit)
				g_GoDecision = 90
			end
		elseif iCurrEra == 1  then
			if g_GoDecision == 90 then g_GoDecision = 1 end
			if g_GoDecision == 1 then 
				DecisionEvent6(playerID)
				g_GoDecision = 2
			elseif g_GoDecision == 2 then 
				DecisionEvent14(playerID)
				g_GoDecision = 3
			elseif g_GoDecision == 3 then 
				if (pTeam:IsHasTech(GameInfoTypes["TECH_TRAPPING"])) then
					DecisionEvent23(playerID)
					g_GoDecision = 4
				else
				g_HoldTurn = 1
				 return
				 
				end
			elseif g_GoDecision == 4 then 
				DecisionEvent32(playerID)
				g_GoDecision = 5
			elseif g_GoDecision == 5 then 
				DecisionEvent41(playerID)
				g_GoDecision = 6
			elseif g_GoDecision == 6 then 
				local targetCity = nil
				for pCity in pPlayer:Cities() do
					if (pCity:IsHasBuilding(GameInfo.Buildings["BUILDING_AQUEDUCT"].ID) == false) then
						targetCity = pCity
						break
					end
				end
				if targetCity ~= nil then
				DecisionEvent50(playerID, targetCity)
				
				g_GoDecision = 91
				else
				g_HoldTurn = 1
				return
				end
			end	
		elseif iCurrEra == 2  then
		if g_GoDecision == 91 then g_GoDecision = 1 end
			if g_GoDecision == 1 then 
				DecisionEvent15(playerID)
				g_GoDecision = 3	
			elseif g_GoDecision == 2 then 
				local playerReligion = pPlayer:GetReligionCreatedByPlayer();
				if playerReligion ~= nil then
					DecisionEvent7(playerID)
					g_GoDecision = 2
				else
				g_HoldTurn = 1
				return
				end
			elseif g_GoDecision == 3 then 
				DecisionEvent24(playerID)
				g_GoDecision = 4
			elseif g_GoDecision == 4 then 
				DecisionEvent33(playerID)
				g_GoDecision = 5
			elseif g_GoDecision == 5 then 
				DecisionEvent42(playerID)
				g_GoDecision = 6
			elseif g_GoDecision == 6 then 
				DecisionEvent51(playerID)
				g_GoDecision = 92				
			end

		elseif iCurrEra == 3  then
		if g_GoDecision == 92 then g_GoDecision = 1 end
			if g_GoDecision == 1 then 
				DecisionEvent8(playerID)
				g_GoDecision = 2
			elseif g_GoDecision == 2 then 
				DecisionEvent16(playerID)
				g_GoDecision = 3
			elseif g_GoDecision == 3 then 
				local playerReligion = pPlayer:GetReligionCreatedByPlayer();
				if playerReligion ~= nil then
					DecisionEvent25(playerID)
					g_GoDecision = 4
				else
				g_HoldTurn = 1
				return
				end

			elseif g_GoDecision == 4 then 
				DecisionEvent34(playerID)
				g_GoDecision = 5
			elseif g_GoDecision == 5 then 
				DecisionEvent43(playerID)
				g_GoDecision = 6
			elseif g_GoDecision == 6 then 
				DecisionEvent52(playerID)
				g_GoDecision = 93
			end			
		elseif iCurrEra == 4  then
		if g_GoDecision == 93 then g_GoDecision = 1 end
			if g_GoDecision == 1 then 
				DecisionEvent9(playerID)
				g_GoDecision = 2
			elseif g_GoDecision == 2 then 
				DecisionEvent17(playerID)
				g_GoDecision = 3
			elseif g_GoDecision == 3 then 
				DecisionEvent53(playerID)
				g_GoDecision = 4
			elseif g_GoDecision == 4 then 
				DecisionEvent35(playerID)
				g_GoDecision = 5
			elseif g_GoDecision == 5 then 
				local unitType = GameInfoTypes["UNIT_GERERAL"];
				local genUnit = PlayerHasUnit(pPlayer, unitType);
				if genUnit ~= nil then
				DecisionEvent44(playerID)
				
				g_GoDecision = 6
				else
				g_HoldTurn = 1
				return
				end
			elseif g_GoDecision == 6 then 
				if pPlayer:IsPolicyBranchUnlocked(GameInfoTypes.POLICY_BRANCH_SLAVERY) then	
					DecisionEvent26(playerID)
					g_GoDecision = 94
				else
				g_HoldTurn = 1
				return
				end	
			end
		elseif iCurrEra == 5  then
		if g_GoDecision == 94 then g_GoDecision = 1 end
			
			if g_GoDecision == 1 then 
				DecisionEvent10(playerID)
				g_GoDecision = 2
			elseif g_GoDecision == 2 then 
				DecisionEvent18(playerID)
				g_GoDecision = 3
			
			elseif g_GoDecision == 3 then 
				DecisionEvent36(playerID)
				g_GoDecision = 4
			elseif g_GoDecision == 4 then 
				DecisionEvent45(playerID)
				g_GoDecision = 5
			elseif g_GoDecision == 5 then 
				if (pTeam:IsHasTech(GameInfoTypes["TECH_RAILROAD"])) then
					DecisionEvent54(playerID)
					g_GoDecision = 6
				else
				g_HoldTurn = 1
				return
				end
				elseif g_GoDecision == 6 then 
				local pupCity = GetPlayerPuppet(pPlayer);
				if pupCity ~= nil then
					DecisionEvent27(playerID)
					g_GoDecision = 95
				else
				g_HoldTurn = 1
				return
				end
			end	
				
		elseif iCurrEra == 6  then
		if g_GoDecision == 95 then g_GoDecision = 1 end
		
			if g_GoDecision == 1 then 
				DecisionEvent11(playerID)
				g_GoDecision = 2
			elseif g_GoDecision == 2 then 
				local iNumMills = pPlayer:GetImprovementCount(GameInfoTypes["IMPROVEMENT_LUMBERMILL"]);
				if iNumMills > 4 then
				DecisionEvent19(playerID)
				
				g_GoDecision = 3
				else
				g_HoldTurn = 1
				return
				end
			elseif g_GoDecision == 3 then 
				DecisionEvent28(playerID)
				g_GoDecision = 4
			elseif g_GoDecision == 4 then 
				DecisionEvent37(playerID)
				g_GoDecision = 5
			
			elseif g_GoDecision == 5 then 
				
					DecisionEvent55(playerID)
					g_GoDecision = 6
			elseif g_GoDecision == 6 then 
				local iWars = NumPlayersAtWar();
				local numPlayers = NumPlayers();
				if iWars > (numPlayers / 2) then
				DecisionEvent46(playerID, iWars)
				g_GoDecision = 96
				else
				g_HoldTurn = 1
				return
				end
			end				
		elseif iCurrEra == 7  then
		if g_GoDecision == 96 then g_GoDecision = 1 end
			if g_GoDecision == 1 then 
				DecisionEvent12(playerID)
				g_GoDecision = 2
			
			elseif g_GoDecision == 2 then 
				DecisionEvent29(playerID)
				g_GoDecision = 3
			elseif g_GoDecision == 3 then 
				DecisionEvent38(playerID)
				g_GoDecision = 4
				elseif g_GoDecision == 4 then 
				DecisionEvent47(playerID)
				g_GoDecision = 5
			elseif g_GoDecision == 5 then 
				local iUranium = GameInfoTypes["RESOURCE_URANIUM"];
				local iUraniumTotal = pPlayer:GetNumResourceTotal(iUranium, true);
				if iUraniumTotal > 2 then
				DecisionEvent20(playerID)
				
				g_GoDecision = 97
				else
				g_HoldTurn = 1
				return
				end
			end	
		elseif iCurrEra == 8  then
			if g_GoDecision == 7 then return end
			if g_GoDecision == 97 then g_GoDecision = 1 end
		
			if g_GoDecision == 1 then 
				DecisionEvent13(playerID)
				g_GoDecision = 2
			elseif g_GoDecision == 2 then 
				DecisionEvent21(playerID)
				g_GoDecision = 3
			elseif g_GoDecision == 3 then 
				DecisionEvent30(playerID)
				g_GoDecision = 4
			elseif g_GoDecision == 4 then 
				DecisionEvent39(playerID)
				g_GoDecision = 5
			elseif g_GoDecision == 5 then 
				DecisionEvent48(playerID)
				g_GoDecision = 6
				
			elseif g_GoDecision == 6 then 
				DecisionEvent56(playerID)
				g_GoDecision = 7
			end	
		end
		SetPersistentProperty("g_HoldTurn", g_HoldTurn);
		SetPersistentProperty("g_GoDecision", g_GoDecision);
	end
end

Events.ActivePlayerTurnEnd.Add(DecisionCheck)
-------------------------------------------------------------------
--Era Event Check
-------------------------------------------------------------------
function EraEvent(eraID, playerID)
	print('eraevent');
	local eEventChance = EraEventChance;
	local eEraProb = Game.Rand(100, "Random Die");
	local player = Players[playerID];
	local iHighEra = HighestEra();
	if eEraProb < eEventChance then
		if finalEraEvent == 1 then return end
		if eraID == iHighEra then
		
			if eraID == 1  then
				print("hold");
			elseif eraID == 2  then
				ClasEvent()
			elseif eraID == 3  then
				MedEvent()
			elseif eraID == 4  then
				RenEvent()
			elseif eraID == 5  then
				IndEvent()
			elseif eraID == 6  then
				ModEvent()
			elseif eraID == 7  then
				PmodEvent()
			elseif eraID == 8  then
				FutEvent()
			end
			
		end
		
	end
end
Events.SerialEventEraChanged.Add(EraEvent)
-------------------------------------------------------------------
--Policy Event Check
-------------------------------------------------------------------
function OnPolicyAdoptedEvent(playerID, policyID)
	print("policy Event");
	if policyID == -1 then return end
	local newPolicy = GameInfo.Policies[policyID];
	local pPlayer = Players[playerID];
	local eEventChance = PolicyEventChance;
	local eEraProb = Game.Rand(100, "Random Die");
	
	if eEraProb < eEventChance then
		if newPolicy == GameInfo.Policies["POLICY_TRIBAL_KINGSHIPX"] then
			pEvent1(pPlayer, newPolicy)
		elseif newPolicy == GameInfo.Policies["POLICY_CULTURAL_DIPLOMACY"] then
			pEvent2(pPlayer, newPolicy)
		
		elseif newPolicy == GameInfo.Policies["POLICY_CCTP1"] then
			pEvent3(pPlayer, newPolicy)
		
		elseif newPolicy == GameInfo.Policies["POLICY_CCTP1"] then
			pEvent3(pPlayer, newPolicy)
		end
	end
end

GameEvents.PlayerAdoptPolicy.Add(OnPolicyAdoptedEvent);
-------------------------------------------------------------------


-------------------------------------------------------------------
--Various Events
-------------------------------------------------------------------
function GPExpended(iPlayer, iUnit, iUnitType, iX, iY)
	print("GP Expended");
	local pPlayer = Players[iPlayer];
	local eEventChance = VariousEventChance;
	local eEraProb = Game.Rand(100, "Random Die");
	if eEraProb < eEventChance then
		GPEvent(pPlayer, iUnit, iX, iY)
	end
end

GameEvents.GreatPersonExpended.Add(GPExpended)
-------------------------------------------------------------------
--function CityConversionEvent(iPlayer, eReligion)
	--local iRandChance = Game.Rand(150, "Chance");
	--if iRandChance < 25 then
	--	local pPlayer = Players[iPlayer];
	--	local playerReligion = pPlayer:GetReligionCreatedByPlayer();
		--if playerReligion ~= nil then
		--	if eReligion ~= playerReligion then
		--		DecisionEvent25(iPlayer)
		--	end
	--	end
	--end
--end
--GameEvents.CityConvertsReligion.Add(CityConversionEvent)   
-------------------------------------------------------------------
function CheckForEvents()
	print("checking");
	local iEventDice = EventDice();
	local eProb = EventProb;
	local iNanoEvent = GetPersistentProperty("NanoEvent") or -1
	if g_LastEvent == nil then g_LastEvent = -1 end
	if (iEventDice < eProb) then
		repeat	
		EventChoice = math.random(1,19);
		if EventChoice == 1 then
			FloodEvent()
		elseif EventChoice == 2 then
			TornadoEvent()
		elseif EventChoice == 3 then
			BlizzardEvent()
		elseif EventChoice == 4 then
			SandStormEvent()
		elseif EventChoice == 5 then
			ForestFire()
		elseif EventChoice == 6 then
			HeavyRain()
		elseif EventChoice == 7 then
			HardDrought()
		elseif EventChoice == 8 then
			Hurricane()
		elseif EventChoice == 9 then
			FreeSettler()
		elseif EventChoice == 10 then
			NewLuxury()
		elseif EventChoice == 11 then
			MinedMinerals()
		elseif EventChoice == 12 then
			GoldEvent()
		elseif EventChoice == 13 then
			MeltdownEvent()
		elseif EventChoice == 14 then
			BombingEvent()
		elseif EventChoice == 15 then
			EmployementBoom()
		elseif EventChoice == 16 then
			GoldCrash()
		elseif EventChoice == 17 then
			BabyBoom()
		elseif EventChoice == 18 then
			ExodusEvent()
		elseif EventChoice == 19 then
			if iNanoEvent == 1 then
				local pPlayer = Players[0];
				local targetCity = GetRandomPlayerCityNotCap(pPlayer)
				local iX = targetCity:GetX();
				local iY = targetCity:GetY();	
				NanoStart(pPlayer, iX, iY)
			end
		end
		until EventChoice ~= g_LastEvent
		g_LastEvent = EventChoice;
		SetPersistentProperty("g_LastEvent", g_LastEvent);
		
	end
end
------------------------------------------------------------------
function EventDice()

local iEventChance = BaseEventDice;

	local iPlayerID = Game.GetActivePlayer();
	local pPlayer = Players[iPlayerID];
	local eratype = pPlayer:GetCurrentEra();
	print("era", eratype);
	if eratype == 1 then eramod = 10;
	elseif eratype == 2 then eramod = 20;
	elseif eratype == 3 then eramod = 25;
	elseif eratype == 4 then eramod = 30;
	elseif eratype == 5 then eramod = 35;
	elseif eratype == 6 then eramod = 40;
	elseif eratype == 7 then eramod = 45;
	elseif eratype == 8 then eramod = 50;
	else eramod = 0;
	end
	iEventChance = iEventChance - eramod;
	iEventDice = Game.Rand(iEventChance, "Random Die");
	print("iEventDice", iEventDice);
return iEventDice;
end
---------------------------------------------------------------
--------------------------------------------------------------------
function GetPersistentTable(name)
	if (g_Properties[name] == nil) then
		g_Properties[name] = g_SaveData.GetValue(name);
	end
	return g_Properties[name];
end
--------------------------------------------------------------------
function SetPersistentTable(name, t)
    g_SaveData.SetValue(name, serialize(t))
	g_Properties[name] = t;
end
--------------------------------------------------------------------

--------------------------------------------------------------------
function GetPersistentProperty(name)
	if (g_Properties[name] == nil) then
		g_Properties[name] = g_SaveData.GetValue(name);
	end
	return g_Properties[name];
end
--------------------------------------------------------------------
function SetPersistentProperty(name, value)
	g_SaveData.SetValue(name, value);
	g_Properties[name] = value;
end
--------------------------------------------------------------------









function InitCooldownTurns()
	local iSpeed = GameInfo.GameSpeeds[Game.GetGameSpeedType()];
	if iSpeed == GameInfo.GameSpeeds['GAMESPEED_MARATHON'] then
		DecisionCoolDownTurns = 25
	elseif iSpeed == GameInfo.GameSpeeds['GAMESPEED_EPIC'] then
		DecisionCoolDownTurns = 20
	elseif iSpeed == GameInfo.GameSpeeds['GAMESPEED_STANDARD'] then
		DecisionCoolDownTurns = 20
	elseif iSpeed == GameInfo.GameSpeeds['GAMESPEED_QUICK'] then
		DecisionCoolDownTurns = 15
	elseif iSpeed == GameInfo.GameSpeeds['GAMESPEED_EPIC'] then
		DecisionCoolDownTurns = 15
	end
	print("decision turns", DecisionCoolDownTurns);
	local gameTurn = Game.GetGameTurn();
	g_HoldTurn = GetPersistentProperty("g_HoldTurn") or -1
	g_LastEvent = GetPersistentProperty("g_LastEvent") or -1
	g_GoDecision = GetPersistentProperty("g_GoDecision") or 1
	 iEventCoolDown = gameTurn + (math.random(BaseCooldownTurnsMin, BaseCooldownTurnsMax));
	print("eventturn", iEventCoolDown);
	iDecisionCoolDown = gameTurn + DecisionCoolDownTurns;
	print("iDecisionCoolDown", iDecisionCoolDown);
	finalEraEvent = 0;
	iLastEvent = 0;
	
end
------------------------------------------------------------

InitCooldownTurns()
