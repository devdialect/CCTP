-- Plague_Main
-- Author: FramedArchitecture
-- DateCreated: 3/1/2013
--------------------------------------------------------------------
-- Credits: Pazyryk for Save Handler
--------------------------------------------------------------------
include ("Plague_Options.lua");
include ("Plague_SaveData.lua");
include ("Plague_UI.lua");
include( "FaithSpecialist.lua" );
--------------------------------------------------------------------
-- Local Variables
--------------------------------------------------------------------
local print					= bDisablePrint and function() end or print
local bHistoricAccuracy		= bHistoricAccuracy		
local bWorldSizeVariable	= bWorldSizeVariable		
local bSpeedVariable		= bSpeedVariable		
local bAbandonCity			= bAbandonCity			
--------------------------------------------------------------------
local gHandicap				= PreGame.GetHandicap(0);
local academyID				= GameInfoTypes["IMPROVEMENT_ACADEMY"];
local gPlagueChance			= GameDefines["PLAGUE_BASE_INIT_THRESHOLD"] + gHandicap;
local gPlagueDuration		= GameDefines["PLAGUE_BASE_DURATION_TURNS"] + gHandicap;
local gPlagueCooldown		= GameDefines["PLAGUE_BASE_COOLDOWN_TURNS"] - gHandicap;
local gPropagateChance		= GameDefines["PLAGUE_BASE_PROPAGATE_THRESHOLD"] + gHandicap;
local gPlagueDeathChance	= GameDefines["PLAGUE_CITY_BASE_DEATH_THRESHOLD"] + gHandicap;
local gPlagueCityHeal		= GameDefines["PLAGUE_CITY_BASE_HEALING_MALUS"] + gHandicap;
local gPlagueAoEDamage		= GameDefines["PLAGUE_CITY_BASE_AOE_DAMAGE"] + gHandicap;
local gPlagueTradeRouteMod	= GameDefines["PLAGUE_CITY_TRADE_RANGE_MOD"];
local gPlagueTradeLocalMod	= GameDefines["PLAGUE_CITY_TRADE_LOCAL_MOD"];
local gPlagueInfluenceMod	= GameDefines["PLAGUE_BASE_INFLUENCE_MOD"];
local gPlagueBorderMod		= GameDefines["PLAGUE_BASE_BORDER_PERMEABILITY"];
local gSabotageChance		= GameDefines["PLAGUE_BASE_SPY_SABOTAGE_THRESHOLD"];
local gPlagueDurationMod	= GameInfo.GameSpeeds[ PreGame.GetGameSpeed() ].GrowthPercent / 100
local gPlagueRangeMod		= GameInfo.Worlds[ PreGame.GetWorldSize() ].ResearchPercent / 100
local gPlagueHealthMod		= (gHandicap < 5) and 0 or 1
local gCityHealthList		= {}
local bHealthIndexDirty		= false;
local lastUpdateTurn		= -1;
--------------------------------------------------------------------
-- Plague Functions
--------------------------------------------------------------------
function UpdatePlagueStatus(iPlayer)
	--updates cached city health list
	if Game.GetGameTurn() ~= lastUpdateTurn then
		bHealthIndexDirty = true;
	end
	if not gCityHealthList or bHealthIndexDirty then
		UpdateCityHealthList();
	end

	if (iPlayer > 0) then return end
	--converts surplus city health into food
	ConvertSurplusHealth();

	--timer for begin game and between plague events
	local iCooldownTimer = GetCoolDownTimer();
	if (iCooldownTimer > 0) then SetCoolDownTimer(iCooldownTimer - 1) return end
	
	--the main decision branch for plague events
	local iPlagueTimer = GetPlagueTimer();
	if (iPlagueTimer > 0) then
		DoPlagueEvent();
	elseif (iPlagueTimer == 0) then
		EndPlagueEvent();
	else
		InitPlagueEvent();
	end

end
GameEvents.PlayerDoTurn.Add( UpdatePlagueStatus );
--------------------------------------------------------------------
function UpdateCityHealthList()
	gCityHealthList	= {};
	for _, pPlayer in pairs(Players) do
		if pPlayer and pPlayer:IsAlive() then
			for pCity in pPlayer:Cities() do
				local iHealth = GetCityHealthIndex(pCity);
				table.insert(gCityHealthList, {health = iHealth, city = pCity});
			end
		end
	end
	-- sort names by health index
    table.sort(gCityHealthList, function(x,y) return (x.health < y.health) end)
    
	--used for DiploCorner UI
	local threshold = gCityHealthList[math.ceil(#gCityHealthList / 3)].health or -20
	SetSickThreshold(threshold);
	SetLowestCurrentHealth(gCityHealthList[1].health)

	lastUpdateTurn = Game.GetGameTurn();
	bHealthIndexDirty = false;
end
--------------------------------------------------------------------
function InitPlagueEvent()
	if g_UpdatePlagueData then
		g_PlagueCities = GetPlagueData(); 
		g_UpdatePlagueData = false
	end

	local pPlagueCity = nil
	local iEraHealth, iEraRange, iEraDuration = GetEraThresholds()
	local iRand = math.random(1,100)
	print("init roll",iRand,gPlagueChance)
	if (iRand <= gPlagueChance) then 
		--only cities meeting health threshold can spawn a plague
		local iMinHealth = gCityHealthList[1].health
		if (iMinHealth > iEraHealth) then return end
		local iTargetCities = 0
		for _,v in ipairs(gCityHealthList) do
			if v.health == iMinHealth then
				iTargetCities = iTargetCities + 1
			else
				break;
			end
		end
		print("Target Cities:",iTargetCities)
		if iTargetCities > 0 then
			pPlagueCity = gCityHealthList[math.random(iTargetCities)].city
		end
	elseif IsEspionageEra() then
		pPlagueCity = GetSpyPlagueTarget();
	end
	
	if pPlagueCity then
		local iX, iY = pPlagueCity:GetX(), pPlagueCity:GetY()
		if bSpeedVariable then 
			iEraDuration = math.floor(iEraDuration * gPlagueDurationMod)
		end
		--plagued cities heal slower
		pPlagueCity:ChangeHealRate(-gPlagueCityHeal);

		table.insert(g_PlagueCities, { X = iX, Y = iY, turns = iEraDuration })
		SavePlagueData();

		print("Plague city, turns:", pPlagueCity:GetName(), iEraDuration)
		
		--sets the overall event timer
		SetPlagueTimer(gPlagueDuration);

		--save for sabotage ability
		if not IsEverPlagued(pPlagueCity:GetOwner()) then
			SetEverPlagued(pPlagueCity:GetOwner(), true)
		end
		--notification
		local sText;
		local sHeading = Locale.ConvertTextKey("TXT_KEY_PLAGUE_BEGIN_SHORT");
		if (pPlagueCity:Plot():IsRevealed(Players[Game.GetActivePlayer()]:GetTeam(), false)) then
			sText = Locale.ConvertTextKey("TXT_KEY_PLAGUE_BEGIN", pPlagueCity:GetName());
		else
			sText = Locale.ConvertTextKey("TXT_KEY_PLAGUE_BEGIN_UNSEEN");
		end
		Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, sText, sHeading, iX, iY);
	end
end
--------------------------------------------------------------------
function GetSpyPlagueTarget()
	local pTargetCity = nil
	local sabotageTargets = {}
	for iPlayerLoop = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
        local pPlayer = Players[iPlayerLoop]
        if pPlayer and pPlayer:IsAlive() then
			if IsEverPlagued(iPlayerLoop) then
				local spies = pPlayer:GetEspionageSpies();
				if #spies > 0 then
					for i,v in ipairs(spies) do
						if (v.State == "TXT_KEY_SPY_STATE_SURVEILLANCE") or
						   (v.State == "TXT_KEY_SPY_STATE_GATHERING_INTEL") then
							local pCity = Map.GetPlot(v.CityX, v.CityY):GetPlotCity();
							if pCity then
								local iBonus = 0
								if		(v.Rank == "TXT_KEY_SPY_RANK_1")	then iBonus = 2
								elseif	(v.Rank == "TXT_KEY_SPY_RANK_2")	then iBonus = 3 end
								
								local iRand = math.random(1,100)
								if (iRand <= (gSabotageChance + iBonus)) then
									table.insert(sabotageTargets, {city = pCity, saboteur = iPlayerLoop})
								end
							end
						end
					end
				end
			end
        end
    end
	print("sabotageTargets:", #sabotageTargets)
	if #sabotageTargets > 0 then
		local i = math.random(#sabotageTargets)
		pTargetCity = sabotageTargets[i].city
		if pTargetCity then
			-- Notification
			local bNotify = false
			local sText;
			local sHeading = Locale.ConvertTextKey("TXT_KEY_PLAGUE_SPY_SABOTAGE_SHORT");
			local iSaboteur = sabotageTargets[i].saboteur
			if (pTargetCity:GetOwner() == Game.GetActivePlayer()) then
				sText = Locale.ConvertTextKey("TXT_KEY_PLAGUE_SPY_SABOTAGE_US");
				bNotify = true
			elseif (iSaboteur == Game.GetActivePlayer()) then
				sText = Locale.ConvertTextKey("TXT_KEY_PLAGUE_SPY_SABOTAGE_THEM", pTargetCity:GetName());
				bNotify = true
			end
			if bNotify then 
				Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, sText, sHeading, pTargetCity:GetX(), pTargetCity:GetY());
			end
			print(pTargetCity:GetName() .. " sabotaged by " .. Players[iSaboteur]:GetName())
		end
	end
	return pTargetCity
end
--------------------------------------------------------------------
function DoPlagueEvent()
	if g_UpdatePlagueData then
		g_PlagueCities = GetPlagueData(); 
		g_UpdatePlagueData = false
	end

	local iPlaguedCities = 0
	if #g_PlagueCities > 0 then
		--set all variables
		local iEraHealth, iEraRange, iEraDuration = GetEraThresholds();
		iEraHealth = iEraHealth + gPlagueHealthMod
		if bWorldSizeVariable then
			iEraRange = math.ceil(iEraRange * gPlagueRangeMod)
		end
		if bSpeedVariable then 
			iEraDuration = math.floor(iEraDuration * gPlagueDurationMod)
		end
		--traverse array from end so new entries won't proc effects
		for i = #g_PlagueCities, 1, -1 do
			local plagueCity = g_PlagueCities[i]
			local iX = plagueCity.X
			local iY = plagueCity.Y
			if not iX or not iY then 
				table.remove (g_PlagueCities, i)
			else
				local pCity = Map.GetPlot(iX, iY):GetPlotCity();
				if pCity then
					local iTurns = plagueCity.turns
					--only cities with an active timer are affected
					if (iTurns > 0) then
						iPlaguedCities = iPlaguedCities + 1
						--spread increases with era, but chance of citizen death decreases	
						local iRand = math.random(1,100)
						local iCurrentEra = GetCurrentEra();
						local iEraPropagate = gPropagateChance + iCurrentEra
						local iEraDeath = gPlagueDeathChance - iCurrentEra
						print(pCity:GetName(),"propagate rolls:",iRand,iEraPropagate,iEraDeath)
						if (iRand < iEraPropagate) then
							PropagatePlague(iX, iY, iEraHealth, iEraRange, iEraDuration);
						end
						if (iRand < iEraDeath) then
							KillPopulation(pCity);
						end
						DiseaseUnits(pCity);
						--decrement city timer
						plagueCity.turns = (iTurns - 1);
					--on plague end reset city health
					elseif (iTurns == 0) then
						pCity:ChangeHealRate(gPlagueCityHeal);
						plagueCity.turns = (iTurns - 1);
					end
				else 
					--remove nil cities from array
					table.remove (g_PlagueCities, i)
				end
			end
		end
		SavePlagueData();
	end
	--decrement event timer
	SetPlagueTimer(GetPlagueTimer() - 1);

	print("Current plagued cities: " .. iPlaguedCities)
	print("Turns 'til next plague event: " .. GetPlagueTimer())
end
--------------------------------------------------------------------
function KillPopulation(pCity)
	local bNotify = false
	local bAbandon = false
	local cityName = pCity:GetName();
	local iX, iY = pCity:GetX(), pCity:GetY();

	if pCity:IsCapital() and (pCity:GetPopulation() > 3) then
		pCity:ChangePopulation(-1, true);
		bNotify = true
	elseif not pCity:IsCapital() then
		if (pCity:GetPopulation() > 1) then
			pCity:ChangePopulation(-1, true);
			bNotify = true
		elseif bAbandonCity and (pCity:GetPopulation() == 1) then
			Players[pCity:GetOwner()]:Disband(pCity);
			bNotify = true
			bAbandon = true
		end
	end
	-- Notification
	if bNotify and (pCity:GetOwner() == Game.GetActivePlayer()) then
		local sText;
		if bAbandon then
			sText = Locale.ConvertTextKey("TXT_KEY_PLAGUE_DEATH_ABANDON", cityName);
		else
			sText = Locale.ConvertTextKey("TXT_KEY_PLAGUE_DEATH", cityName);
		end
		local sHeading = Locale.ConvertTextKey("TXT_KEY_PLAGUE_DEATH_SHORT");
    	Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes.NOTIFICATION_STARVING, sText, sHeading, iX, iY);
	end
end
--------------------------------------------------------------------
function DiseaseUnits(pCity)
	local iX, iY = pCity:GetX(), pCity:GetY();
	local iPercent = ( gPlagueAoEDamage / 100 )
	--affected city unit
	local pUnit = Map.GetPlot(iX, iY):GetUnit(0)
	if pUnit then
		SetAoEDamage(pUnit, iPercent);
		Disease(pUnit, true);
	end
	--city adjacent units
	for i = 0, 5 do
		local adjPlot = Map.PlotDirection(iX, iY, i)
		if adjPlot then
			local adjUnit = adjPlot:GetUnit(0)
			if adjUnit then
				if not IsDiseased(adjUnit) then
					Disease(adjUnit, true);
				end
				SetAoEDamage(adjUnit, iPercent);
			end
		end
	end
end
--------------------------------------------------------------------
function SetAoEDamage(pUnit, iPercent)
	local iMaxHP = pUnit:GetMaxHitPoints()
	local iChange = math.floor( iMaxHP * iPercent )
	local iNewDamage = pUnit:GetDamage() + iChange
	--cannot be killed by aoe damage
	if ( iNewDamage > iMaxHP ) then
		iNewDamage = iMaxHP - 2
	end
	pUnit:SetDamage(iNewDamage)
end
--------------------------------------------------------------------
function PropagatePlague(iX, iY, iHealth, iRange, iDuration)
	local pSourceCity = Map.GetPlot(iX, iY):GetPlotCity();
	local iSourceCityOwner = pSourceCity:GetOwner();
	local targetCities = {}
	for _,v in ipairs(gCityHealthList) do
		local pTargetCity = v.city
		local iTargetHealth = v.health
		if (iTargetHealth <= iHealth) then
			local iTargetX = pTargetCity:GetX();
			local iTargetY = pTargetCity:GetY();
			local iTargetDist = Map.PlotDistance(iX, iY, iTargetX, iTargetY)
			if iTargetDist > 0 then
				--only cities that haven't yet been plagued this event cycle
				if not IsWasPlagued(pTargetCity) then
					local bTradeRoute = false					
					local iTargetCityOwner = pTargetCity:GetOwner();
					if iSourceCityOwner ~= iTargetCityOwner then
						--cities with international routes reduces effective distance
						if IsInternationalTradeRoute(pSourceCity, pTargetCity) then
							iTargetDist = math.ceil(iTargetDist * gPlagueTradeRouteMod)
							local bTradeRoute = true
						end
						--if source player is influential on target player then effective distance decreased
						if Players[iSourceCityOwner]:GetInfluenceLevel(iTargetCityOwner) > 2 then
							iTargetDist = math.ceil(iTargetDist * gPlagueInfluenceMod)
						end
						--no open borders increases effective distance
						if not IsOpenBorders(iSourceCityOwner, iTargetCityOwner) then
							iTargetDist = math.floor(iTargetDist * gPlagueBorderMod) 
						end
					end
					--local connected cities reduces effective distance
					if iSourceCityOwner == iTargetCityOwner then
						if pTargetCity:IsCapital() or IsConnected(iSourceCityOwner, pSourceCity, pTargetCity) then
							iTargetDist = math.ceil(iTargetDist * gPlagueTradeLocalMod) 
						end
					end
					if (iTargetDist <= iRange) or bTradeRoute then
						--weighted value for each eligible target city
						local iValue = iTargetDist + iTargetHealth
						table.insert(targetCities, {value = iValue, health = iTargetHealth, city = pTargetCity})
					end
				end
			end
		else
			break;
		end
	end
	print(pSourceCity:GetName(),"#targetCities:",#targetCities)
	if #targetCities > 0 then
		local pPlagueCity = nil
		local iPlagueCityHealth = 0
		if (#targetCities == 1) then
			pPlagueCity = targetCities[1].city
			iPlagueCityHealth = targetCities[1].health
		elseif (#targetCities > 1) then
			table.sort(targetCities, function(x,y) return (x.value < y.value) end)
			local minValue = targetCities[1].value
			local bestCities = 0
			for _, v in ipairs (targetCities) do
				if v.value == minValue then
					bestCities = bestCities + 1
				else
					break;
				end
			end
			local i = math.random(bestCities);
			pPlagueCity = targetCities[i].city
			iPlagueCityHealth = targetCities[i].health
		end

		if pPlagueCity then
			local iCityX = pPlagueCity:GetX();
			local iCityY = pPlagueCity:GetY();
			local iPlagueTurns = iDuration
			--duration adjust for health
			if iPlagueCityHealth > 3 then
				iPlagueTurns = (iPlagueTurns - 2) > 0 and (iPlagueTurns - 2) or 1
			elseif iPlagueCityHealth > 0 then
				iPlagueTurns = (iPlagueTurns - 1) > 0 and (iPlagueTurns - 1) or 1
			elseif iPlagueCityHealth < -1 then
				iPlagueTurns = iPlagueTurns + 1
			elseif iPlagueCityHealth < -4 then
				iPlagueTurns = iPlagueTurns + 2
			end
			--plagued cities heal slower
			pPlagueCity:ChangeHealRate(-gPlagueCityHeal);
			table.insert(g_PlagueCities, { X = iCityX, Y = iCityY, turns = iPlagueTurns })

			--save for espionage ability
			if not IsEverPlagued(pPlagueCity:GetOwner()) then
				SetEverPlagued(pPlagueCity:GetOwner(), true)
			end
			print(pPlagueCity:GetName() .. " is now PLAGUED.")
			-- Notification
			if (pPlagueCity:GetOwner() == Game.GetActivePlayer()) then
				local sText = Locale.ConvertTextKey("TXT_KEY_PLAGUE_SPREAD", pPlagueCity:GetName(), iPlagueTurns);
				local sHeading = Locale.ConvertTextKey("TXT_KEY_PLAGUE_SPREAD_SHORT");
				Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, sText, sHeading, iCityX, iCityY);
			end
		end
	end
end
--------------------------------------------------------------------
function IsWasPlagued(pCity)
	if g_UpdatePlagueData then
		g_PlagueCities = GetPlagueData(); 
		g_UpdatePlagueData = false
	end
	local iX, iY = pCity:GetX(), pCity:GetY()
	for _, v in ipairs(g_PlagueCities) do
		if (iX == v.X) and (iY == v.Y) then
			return true;
		end
	end
	return false;
end
--------------------------------------------------------------------
function IsInternationalTradeRoute(pSourceCity, pTargetCity)
	local bTargetTradeRoute = Players[pTargetCity:GetOwner()]:GetInternationalTradeRouteTotal(pTargetCity, pSourceCity, true, true) > 0;
	local bSourceTradeRoute = Players[pSourceCity:GetOwner()]:GetInternationalTradeRouteTotal(pSourceCity, pTargetCity, true, true) > 0;
	return bTargetTradeRoute or bSourceTradeRoute
end
--------------------------------------------------------------------
function IsConnected(iPlayer, pCity1, pCity2)
	local pPlayer = Players[iPlayer]
	return pPlayer:IsCapitalConnectedToCity(pCity1) and pPlayer:IsCapitalConnectedToCity(pCity2);
end
--------------------------------------------------------------------
function IsOpenBorders(iPlayer1, iPlayer2)
	local pPlayer = Players[iPlayer1]
	return pPlayer:IsPlayerHasOpenBorders(iPlayer2) or pPlayer:IsPlayerHasOpenBordersAutomatically(iPlayer2);
end
--------------------------------------------------------------------
function EndPlagueEvent()
	if g_UpdatePlagueData then
		g_PlagueCities = GetPlagueData(); 
		g_UpdatePlagueData = false
	end
	for i = #g_PlagueCities, 1, -1 do
		if (g_PlagueCities[i].turns >= 0) then
			local pCity = Map.GetPlot(g_PlagueCities[i].X, g_PlagueCities[i].Y):GetPlotCity();
			if pCity then pCity:ChangeHealRate(gPlagueCityHeal) end
		end
		table.remove(g_PlagueCities, i);
	end
	--removes malus promotions
	for _, pPlayer in pairs(Players) do
		if pPlayer and pPlayer:IsAlive() then
			for pUnit in pPlayer:Units() do
				if pUnit and IsDiseased(pUnit) then 
					Disease(pUnit, false) 
				end
			end
		end
	end
	--reset globals
	SetPlagueTimer(-1);
	SetCoolDownTimer(gPlagueCooldown);
	SavePlagueData();

	-- notification
	local sHeading = Locale.ConvertTextKey("TXT_KEY_PLAGUE_ENDED_SHORT");
	local sText = Locale.ConvertTextKey("TXT_KEY_PLAGUE_ENDED");
	Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, sText, sHeading, -1, -1);
end
---------------------------------------------------------------------
function ConvertSurplusHealth()
	--traverse array from end to catch positive health
	for i = #gCityHealthList, 1, -1 do
		local iHealth = gCityHealthList[i].health
		local pCity = gCityHealthList[i].city
		if iHealth > 0 then
			--health cannot force city growth
			--cities with negative food cannot grow from health
			if (pCity:GrowthThreshold() > iHealth) and (pCity:FoodDifference() > 0) then
				pCity:ChangeFood(iHealth);
			end
		else 
			break;
		end
	end
end
--------------------------------------------------------------------
local bFire = false
--------------------------------------------------------------------
function OnPlagueCure(iPlayer, iX, iY, improvementID)
	if (improvementID ~= academyID) then return end
	bFire = not bFire
	if not bFire then return end
	if g_UpdatePlagueData then
		g_PlagueCities = GetPlagueData(); 
		g_UpdatePlagueData = false
	end
	if (#g_PlagueCities == 0) then return end
	local iCured = 0
	for i, v in ipairs(g_PlagueCities) do
		local plagueCity = g_PlagueCities[i]
		local pCity = Map.GetPlot(plagueCity.X, plagueCity.Y):GetPlotCity();
		if pCity and (pCity:GetOwner() == iPlayer) then
			pCity:ChangeHealRate(gPlagueCityHeal);
			plagueCity.turns = -1
			iCured = iCured + 1
		end
	end
	if (iCured > 0) then
		SavePlagueData();
		if (iPlayer == Game.GetActivePlayer()) then 
			local popupInfo = {Data1 = 500,Type = ButtonPopupTypes.BUTTONPOPUP_TEXT,Text = Locale.ConvertTextKey("TXT_KEY_PLAGUE_CURED", iCured)}
			UI.AddPopup(popupInfo);
		end
	end
end
GameEvents.BuildFinished.Add( OnPlagueCure )
--------------------------------------------------------------------
function OnPlagueCityDestroyed(hexPos)
	if g_UpdatePlagueData then
		g_PlagueCities = GetPlagueData(); 
		g_UpdatePlagueData = false
	end
	if (#g_PlagueCities < 1) then return end
	local iX, iY = ToGridFromHex( hexPos.x, hexPos.y )
	for i, v in ipairs(g_PlagueCities) do
		if (iX == v.X) and (iY == v.Y) then
			table.remove(g_PlagueCities, i);
			SavePlagueData();
			break;
		end
	end
end
Events.SerialEventCityDestroyed.Add( OnPlagueCityDestroyed );
--------------------------------------------------------------------
function UpdateGlobalEra(iEra, iPlayer)
	local iCurrentEra = GetCurrentEra();
	if (iCurrentEra < iEra) then 
		 SetCurrentEra(iEra);
	end
	local bEspionageEra = IsEspionageEra();
	if not bEspionageEra then
		local eraInfo = GameInfo.Eras[iEra]
		if	eraInfo.SpiesGrantedForPlayer > 0 or
			eraInfo.SpiesGrantedForEveryone > 0 then
			SetIsEspionageEra(true);
		end
	end
end
Events.SerialEventEraChanged.Add( UpdateGlobalEra );
--------------------------------------------------------------------
function MakeHealthIndexDirty()
	bHealthIndexDirty = true;
end
--------------------------------------------------------------------
Events.SerialEventCityCaptured.Add( MakeHealthIndexDirty );
Events.SerialEventCityCreated.Add( MakeHealthIndexDirty );
Events.SerialEventCityDestroyed.Add( MakeHealthIndexDirty );
-------------------------------------------------------------------
-- Initialize
-------------------------------------------------------------------
function Initialize()
	if not IsInitialized() then
		local iEra = PreGame.GetEra()
		SetCurrentEra(iEra)
		if	GameInfo.Eras[iEra].SpiesGrantedForPlayer > 0 or
			GameInfo.Eras[iEra].SpiesGrantedForEveryone > 0 then
			SetIsEspionageEra(true);
		end
		SetCoolDownTimer( 40-(PreGame.GetGameSpeed()*5) )
		SavePlagueData();
		SetInitialized(true);
	end
	MakeHealthIndexDirty();
	g_PlagueCities = GetPlagueData(); 
	
	print("+--Health & Plague (BNW) Loaded--+")
end
Initialize();