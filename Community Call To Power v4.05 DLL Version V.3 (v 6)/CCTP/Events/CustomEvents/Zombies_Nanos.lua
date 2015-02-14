if(Game.GetCustomOption("GAMEOPTION_CCTP_EVENTS") == 0) then
	return;
end

-- Zombies
-- Author: gyogen
-- DateCreated: 11/12/2014 6:57:08 AM
--------------------------------------------------------------
include( "EventUtils.lua" );
include( "EventOptions.lua" );

function RaiseZombies(pPlayer, iZedChoice)
		local pTeam = Teams[pPlayer:GetTeam()];
	if (pPlayer:IsHuman()) then
		if iOneTime == nil then iOneTime = 0 end
			local iNumPlayers,
			iMaxPlayers = GetNumAllPlayers();

		if iNumPlayers < iMaxPlayers then
			if iOneTime == 0 then
			
				--if (pTeam:IsHasTech(GameInfoTypes["TECH_BIO_WARFARE"])) then
					local iLeader = (GameInfo.Leaders["LEADER_ZOMBIE"].ID);
					local iCiv = (GameInfo.Civilizations["CIVILIZATION_ZOMBIE"].ID);
					Game.AddPlayer(iZed, iLeader, iCiv)
					local targetCity = GetRandomPlayerCity(pPlayer)
					local otherPlayer = Players[iZed];
					local iNumZeds = math.random(2, 6);
					local iX = targetCity:GetX();
					local iY = targetCity:GetY();
					local zedUnit = GetZedEraUnit();
					for z = 1, iNumZeds do
					unit = otherPlayer:InitUnit(zedUnit, iX, iY);
					unit:JumpToNearestValidPlot();
					end
					iOneTime = 1
					local team2 = Teams[ otherPlayer:GetTeam() ]
					for iPlayerLoop = 0, GameDefines.MAX_CIV_PLAYERS-1, 1 do
						local pPlayer = Players[iPlayerLoop];
						if pPlayer:IsAlive() then
							local player = Players[iPlayerLoop];
							local team1 = Teams[player:GetTeam()];
							if player ~= otherPlayer then
							team1:DeclareWar( otherPlayer:GetTeam() )
							team1:SetPermanentWarPeace( otherPlayer:GetTeam(), true)
							team2:SetPermanentWarPeace( player:GetTeam(), true)
							--CityLostToOther(targetCity, otherPlayer)
							end
						end
					end
					if iZedChoice == 1 then
					text = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_SUMMARY_ZEDHORDEA");
					elseif iZedChoice == 2 then
					text = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_SUMMARY_ZEDHORDEB");
					elseif iZedChoice == 3 then
					text = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_SUMMARY_ZEDHORDEC");
					end
					heading = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_ZEDHORDE");
					pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, text, heading, iX, iY);
			end
		end
	end
end

--Zombie Spread
-----------------------------------------------------------------------------
local g_infoAboutUnit = {}
	local function OnCanSaveUnit(iPlayer, iUnit)
--fires for both combat and non-combat death (disband, settler settled, etc)
--for combat death, fires right before and after OnUnitKilledInCombat; use this to capture unit data before death
	local unit = Players[iPlayer]:GetUnitByID(iUnit)
	local unitTypeID = unit and unit:GetUnitType()
	g_infoAboutUnit.x = unit:GetX()
	g_infoAboutUnit.y = unit:GetY()
	g_infoAboutUnit.damage = unit:GetDamage()
--etc...
	return false
end
GameEvents.CanSaveUnit.Add(OnCanSaveUnit)

local function OnUnitKilledInCombat(iKillerPlayer, iKilledPlayer, unitTypeID)
--always right after OnCanSaveUnit if attacker or defender died
	local iX = g_infoAboutUnit.x
	local iY = g_infoAboutUnit.y
	local pKiller = Players[iKillerPlayer];
	local zedUnit = GetZedEraUnit();
	if pKiller:GetCivilizationType() == GameInfo.Civilizations["CIVILIZATION_ZOMBIE"].ID then
		local iMaxZeds = MaxZeds();
		local iTotalUnits = pKiller:GetNumUnits();
		if iTotalUnits <= iMaxZeds then
			pKiller:InitUnit(zedUnit, iX, iY);
			--zedUnit:JumpToNearestValidPlot();
		end
	end
end
GameEvents.UnitKilledInCombat.Add(OnUnitKilledInCombat)

-------------------------------------------------------------------------------------------------------





function InitZombiePlayer()
	
	local iZombiePlayer
	for iZomPlayer = 1, GameDefines.MAX_PLAYERS - 1 do
		if PreGame.GetSlotStatus(iZomPlayer) == SlotStatus.SS_OBSERVER then
			iZombiePlayer = iZomPlayer
			break
		end
	end
	iZed  = iZombiePlayer
	print("zombie", iZed);
end
InitZombiePlayer()
--------------------------------------------------------
function MaxZeds()
	local worldSize = GameInfo.Worlds[ PreGame.GetWorldSize() ];
	if worldSize == GameInfo.Worlds["WORLDSIZE_DUEL"] then
		maxZeds = 5
	elseif worldSize == GameInfo.Worlds["WORLDSIZE_TINY"] then
		maxZeds = 10
	elseif worldSize == GameInfo.Worlds["WORLDSIZE_DUEL"] then
		maxZeds = 15
	elseif worldSize == GameInfo.Worlds["WORLDSIZE_SMALL"] then
		maxZeds = 15
	elseif worldSize == GameInfo.Worlds["WORLDSIZE_STANDARD"] then
		maxZeds = 20
	elseif worldSize == GameInfo.Worlds["WORLDSIZE_LARGE"] then
		maxZeds = 20
	elseif worldSize == GameInfo.Worlds["WORLDSIZE_HUGE"] then
		maxZeds = 25
	end

	return maxZeds;
end

function NanoStart(pPlayer, iX, iY)
	for i = 0, 5 do
			local adjPlot = Map.PlotDirection(iX, iY, i)
			if adjPlot then
				if ( not adjPlot:IsWater() ) then 
					startPlot = adjPlot
					break
				end
			end
	end

	if (startPlot:GetFeatureType() == featureType) or  (startPlot:GetFeatureType() == featureTypeB)then
	startPlot:SetFeatureType(FeatureTypes.NO_FEATURE, -1);
	end
	startPlot:SetImprovementType(GameInfoTypes["IMPROVEMENT_GREY_GOO"]);
	startPlot:SetResourceType(-1);	
	local iNanoActive = 1
	SetPersistentProperty("NanoActive", iNanoActive);
	SetPersistentProperty("NanoPlotX", iX);
	SetPersistentProperty("NanoPlotY", iY);
	local iNanoEvent = 0
	SetPersistentProperty("NanoEvent", iNanoEvent);
end

function NanoSpread(iPlayer)
	local pActivePlayer = Players[iPlayer];
	if not pActivePlayer:IsHuman() then return end
	local iNanoActive = GetPersistentProperty("NanoActive") or -1
	local iX = GetPersistentProperty("NanoPlotX") or -1
	local iY = GetPersistentProperty("NanoPlotY") or -1
	local featureType =(FeatureTypes.FEATURE_FOREST);
	local featureTypeB = (FeatureTypes.FEATURE_JUNGLE); 
	local nextPlot = {}
	local iDirectChance = 0;
	local plot = Map.GetPlot(iX, iY);
	if iNanoActive ~= 1 then return end

	if iNanoActive == 1 then
		for i = 0, 5 do
			local adjPlot = Map.PlotDirection(iX, iY, i)
			if adjPlot then
				if( not adjPlot:IsCity()) and ( not adjPlot:IsWater() ) then 

					nextPlot[iDirectChance] = adjPlot;
					iDirectChance = iDirectChance + 1;
				end
			end
		end

		if iDirectChance > 0 then
			local iRandDirect = Game.Rand(iDirectChance, "choose direction");
			targetPlot = nextPlot[iRandDirect];
			
		end
		local iX = targetPlot:GetX();
		local iY = targetPlot:GetY();

		SetPersistentProperty("NanoPlotX", iX);
		SetPersistentProperty("NanoPlotY", iY);
		if (targetPlot:GetFeatureType() == featureType) or  (targetPlot:GetFeatureType() == featureTypeB)then
		targetPlot:SetFeatureType(FeatureTypes.NO_FEATURE, -1);
		end
		targetPlot:SetResourceType(-1);	
		targetPlot:SetImprovementType(GameInfoTypes["IMPROVEMENT_GREY_GOO"]);
	end
end
GameEvents.PlayerDoTurn.Add(NanoSpread)

function NanoStop(iPlotX, iPlotY, iOwner, iOldImprovement, iNewImprovement)
	local iNanoImprove = GameInfoTypes["IMPROVEMENT_NANO"]
	local iGreyGoo = GameInfoTypes["IMPROVEMENT_GREY_GOO"]
	print ("iOldImprovement",iOldImprovement, "iNewImprovement", iNewImprovement);
	print ("iNanoImprove",iNanoImprove, "iGreyGoo", iGreyGoo);
	if (iNewImprovement == iNanoImprove) then
		
		print("nanoscrub");
		local iX = iPlotX
		local iY = iPlotY
		local plot = Map.GetPlot(iX, iY);
			
				plot:SetImprovementType(-1);

				for i = 0, 5 do
					local adjPlot = Map.PlotDirection(iX, iY, i)
					if adjPlot then
						if (plot:GetImprovementType() == GameInfo.Improvements[ "IMPROVEMENT_GREY_GOO" ]) then
							plot:SetImprovementType(-1);
						end
					end
				end
				local iNanoActive = 0
				local iNanoEvent = 1
				SetPersistentProperty("NanoActive", iNanoActive);
				SetPersistentProperty("NanoEvent", iNanoEvent);
	end
end

GameEvents.TileImprovementChanged.Add(NanoStop)