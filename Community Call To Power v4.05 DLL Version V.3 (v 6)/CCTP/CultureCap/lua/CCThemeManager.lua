if(Game.GetCustomOption("GAMEOPTION_CULTURALCAPITALS") == 0) then
	return;
end

-- CCThemeManager
-- Author: Moaf
-- DateCreated: 1/23/2011 7:26:33 PM
--------------------------------------------------------------

include("MoafsUtils");

local g_theme = nil;
local g_electedPlayerId = nil;
local g_electedCityId = nil;
local g_evals = nil;

local g_checkUnitKill = false;
local g_foodOnKillMod = nil;
local g_cultureOnKillMod = nil;
local g_productionOnKillMod = nil;

-- ======================================================
-- TM_Load
-- ======================================================
-- Gets called when loading the mod
function TM_Load(playerId, cityId)
	dosetCacheState(0);
	g_electedPlayerId = playerId;
	g_electedCityId = cityId;
	g_theme = doload("cc_chosenTheme");
	g_evals = doload("cc_chosenThemeEvals");

	g_checkUnitKill = doload("cc_checkUnitKill") or false;
	g_foodOnKillMod = doload("cc_foodOnKillMod");
	g_cultureOnKillMod = doload("cc_cultureOnKillMod");
	g_productionOnKillMod = doload("cc_productionOnKillMod");
end

-- ======================================================
-- TM_SetChosenTheme
-- ======================================================
-- sets variables and applies the bonuses
function TM_SetChosenTheme(playerId, cityId, theme, evals)
	if((playerId == nil) or (cityId == nil) or (theme == nil)) then
		print("###ERROR### (CCThemeManager::TM_SetChosenTheme) Nil value detected");
		return;
	end
	
	g_electedPlayerId = playerId;
	g_electedCityId = cityId;
	g_theme = theme;
	g_evals = evals;

	TM_ApplyBonuses();
end


-- ======================================================
-- TM_ApplyBonuses
-- ======================================================
-- applies all bonuses for the chosen theme
function TM_ApplyBonuses()
	for key, value in pairs(g_theme.ccBonuses) do
		local bonus = value;
		local eval = g_evals[key];

		TM_ApplyBonus(bonus, eval);
	end
end

-- ======================================================
-- TM_ApplyBonus
-- ======================================================
-- Applies a single bonus
function TM_ApplyBonus(bonus, eval)
	local ctx = GameInfo.CCContextTypes[bonus.Context];
	local cType = ctx.Type;
	local cTable1 = ctx.ContextRefTable1;
	local cTable2 = ctx.ContextRefTable2;
	local cRef1 = bonus.ContextRefType1;
	local cRef2 = bonus.ContextRefType2;

	local electedPlayer, electedCity = GetPlayerCity(g_electedPlayerId, g_electedCityId);

	-- ## CITY SCOPE
	if(cType == "CITY_CHANGECULTURERATEMODIFIER") then
		electedCity:ChangeCultureRateModifier(eval);
	elseif(cType == "CITY_CHANGEBASEYIELDRATEFROMMISC") then
		if(TM_Assert(cTable1, cRef1)) then
			electedCity:ChangeBaseYieldRateFromMisc(GameInfo[cTable1][cRef1].ID, eval);
		end
	elseif(cType == "CITY_CHANGEBASEYIELDRATEFROMTERRAIN") then
		if(TM_Assert(cTable1, cRef1)) then
			electedCity:ChangeBaseYieldRateFromTerrain(GameInfo[cTable1][cRef1].ID, eval);
		end
	elseif(cType == "CITY_CHANGEWONDERPRODUCTIONMODIFIER") then
		electedCity:ChangeWonderProductionModifier(eval);
	elseif(cType == "CITY_ADDBUILDING") then
		if(TM_Assert(cTable1, cRef1)) then
			electedCity:SetNumRealBuilding(GameInfo[cTable1][cRef1].ID, 1); 
		end
	elseif(cType == "CITY_CHANGEPOPULATION") then
		electedCity:ChangePopulation(eval, true);
	elseif(cType == "CITY_HEALCITY") then
		electedCity:SetDamage(0);
	elseif(cType == "CITY_CREATEGREATPERSON") then
		if(TM_Assert(cTable1, cRef1)) then
			for i = 1, eval do
				electedCity:CreateGreatGeneral(GameInfo[cTable1][cRef1].ID);
			end
		end
	elseif(cType == "CITY_CREATEFREEUNIT") then
		if(TM_Assert(cTable1, cRef1)) then
			for i = 1, eval do
				electedPlayer:AddFreeUnit(GameInfo[cTable1][cRef1].ID, electedCity:GetID());
			end
		end

	elseif(cType == "CITY_CHANGEFOOD") then
		electedCity:ChangeFood(eval);
	elseif(cType == "CITY_CHANGECULTURE") then
		electedCity:ChangeJONSCultureStored(eval);
	elseif(cType == "CITY_CHANGEPRODUCTION") then
		electedCity:ChangeProduction(eval);
	
	elseif(cType == "CITY_CHANGEFOODONKILL") then
		checkUnitKill = dosave("cc_checkUnitKill", true);
		foodOnKillMod = dosave("cc_foodOnKillMod", eval);
	elseif(cType == "CITY_CHANGECULTUREONKILL") then
		checkUnitKill = dosave("cc_checkUnitKill", true);
		cultureOnKillMod = dosave("cc_cultureOnKillMod", eval);
	elseif(cType == "CITY_CHANGEPRODUCTIONONKILL") then
		checkUnitKill = dosave("cc_checkUnitKill", true);
		productionOnKillMod = dosave("cc_productionOnKillMod", eval);
	elseif(cType == "CITY_SETRESOURCE") then
		TM_SetResourceForCity(electedCity, GameInfo[cTable1][cRef1], eval);

	-- ## PLAYER SCOPE
	elseif(cType == "PLAYER_CHANGENUMFREEPOLICIES") then
		electedPlayer:ChangeNumFreePolicies(eval);
	elseif(cType == "PLAYER_CHANGEGOLD") then
		electedPlayer:ChangeGold(eval);

	-- ## UNIT SCOPE
	elseif(cType == "UNIT_CHANGEEXPERIENCE") then
		electedCity:GetGarrisonedUnit():ChangeExperience(eval);
	
	else
		print("##ERROR## CONTEXT TYPE "..cType.." NOT FOUND!");
		return;
	end

end

function TM_GetAvailableResourcePlots(city, resource)
	local plots = {};

	local cityX = city:GetX();
	local cityY = city:GetY();

	local citySize = 3; -- todo: find value that defines the city size in xml files

	for x = -citySize, citySize, 1 do
		for y = -citySize, citySize, 1 do
			plot = Map.GetPlotXY(cityX, cityY, x, y);
			if(plot ~= nil) then
				local plotX = plot:GetX();
				local plotY = plot:GetY();
				if(plotX ~= cityX) and (plotY ~= cityY) and
					(Map.PlotDistance(cityX, cityY, plotX, plotY) <= citySize) and
					(plot:GetOwner() == city:GetOwner()) and
					(plot:GetNumResource() < 1) and plot:CanHaveResource(resource, true)
						then
					table.insert(plots, plot);
				end
			end
		end
	end

	return plots;
end

function TM_SetResourceForCity(city, resource, eval)
	local plots = TM_GetAvailableResourcePlots(city, resource);
	plot = GetRandomElement(plots, nil, 1);
	if(plot ~= nil) then
		plot:SetResourceType(resource.ID, eval);
	end
end

-- ======================================================
-- TM_Assert
-- ======================================================
-- Checks if the tables and entities given by the xml-data do exist
function TM_Assert(cTable, cRef)
	if(cTable == nil) or(cRef == nil) then
		print("##ERROR## Nil Values not allowed!");
		return false;
	end
	if(GameInfo[cTable] == nil) then
		print("##ERROR## Table "..cTable.." not found in GameInfo!");
		return false;
	end
	if(GameInfo[cTable][cRef] == nil) then
		print("##ERROR## Row "..cRef.." not found in Table "..cTable.."!");
		return false;
	end

	return true;
end

-- ======================================================
-- TM_CCEnded
-- ======================================================
-- gets called when the cultural capital ended;
-- removes all temporary bonuses
function TM_CCEnded()
	if(g_theme == nil) then
		return;
	end

	TM_RemoveTemporaryBonuses();

	g_theme = dosave("cc_chosenTheme", nil);
	g_evals =	dosave("cc_chosenThemeEvals", nil);
	g_electedPlayerId = nil;
	g_electedCityId = nil;
end

-- ======================================================
-- TM_RemoveTemporaryBonuses
-- ======================================================
-- removes all temporary bonuses
function TM_RemoveTemporaryBonuses()
	local player, city = GetPlayerCity(g_electedPlayerId, g_electedCityId);
	local cityAlive = (city ~= nil);
	local playerAlive = ((player ~= nil) and (player:IsAlive()));
	for key, value in pairs(g_theme.ccBonuses) do
		if(value.IsTemporary) then
			local bonus = value;
			local eval = g_evals[key];

			TM_RemoveBonus(bonus, eval, playerAlive, cityAlive);
		end
	end
end

-- ======================================================
-- TM_RemoveBonus
-- ======================================================
-- removes a single bonus
function TM_RemoveBonus(bonus, eval, playerAlive, cityAlive)
	local ctx = GameInfo.CCContextTypes[bonus.Context];
	local cType = ctx.Type;
	local cTable1 = ctx.ContextRefTable1;
	local cTable2 = ctx.ContextRefTable2;
	local cRef1 = bonus.ContextRefType1;
	local cRef2 = bonus.ContextRefType2;
	local playerAlive = playerAlive or true;
	local cityAlive = cityAlive or true;

	local electedPlayer, electedCity = GetPlayerCity(g_electedPlayerId, g_electedCityId);

	-- ## CITY SCOPE
	-- always check if the city is still existent
	if(cityAlive and (cType == "CITY_CHANGECULTURERATEMODIFIER")) then
		electedCity:ChangeCultureRateModifier(-eval);
	elseif(cityAlive and (cType == "CITY_CHANGEBASEYIELDRATEFROMMISC")) then
		if(TM_Assert(cTable1, cRef1)) then
			electedCity:ChangeBaseYieldRateFromMisc(GameInfo[cTable1][cRef1].ID, -eval);
		end
	elseif(cityAlive and (cType == "CITY_CHANGEBASEYIELDRATEFROMTERRAIN")) then
		if(TM_Assert(cTable1, cRef1)) then
			electedCity:ChangeBaseYieldRateFromTerrain(GameInfo[cTable1][cRef1].ID, -eval);
		end
	elseif(cityAlive and (cType == "CITY_CHANGEWONDERPRODUCTIONMODIFIER")) then
		electedCity:ChangeWonderProductionModifier(-eval);
	elseif(cityAlive and (cType == "CITY_ADDBUILDING")) then
		if(TM_Assert(cTable1, cRef1)) then
			electedCity:SetNumRealBuilding(GameInfo[cTable1][cRef1].ID, 0); 
		end
	elseif(cityAlive and (cType == "CITY_CHANGEPOPULATION")) then
		electedCity:ChangePopulation(-math.min(electedCity:GetPopulation() - 1, eval), true);
	elseif(cityAlive and (cType == "CITY_CHANGEFOOD")) then
		electedCity:ChangeFood(-eval);
	elseif(cityAlive and (cType == "CITY_CHANGECULTURE")) then
		electedCity:ChangeJONSCultureStored(-eval);
	elseif(cityAlive and (cType == "CITY_CHANGEPRODUCTION")) then
		electedCity:ChangeProduction(-eval);
	elseif(cityAlive and ((cType == "CITY_CHANGEFOODONKILL") or (cType == "CITY_CHANGECULTUREONKILL") or (cType == "CITY_CHANGEPRODUCTIONONKILL"))) then
		g_checkUnitKill = dosave("cc_checkUnitKill", false);
		g_foodOnKillMod = dosave("cc_foodOnKillMod", nil);
		g_cultureOnKillMod = dosave("cc_cultureOnKillMod", nil);
		g_productionOnKillMod = dosave("cc_productionOnKillMod", nil);

	-- ## PLAYER SCOPE
	elseif(playerAlive and (cType == "PLAYER_CHANGEGOLD")) then
		electedPlayer:ChangeGold(-eval);

	-- ## UNIT SCOPE

	else
		print("##ERROR## CONTEXT TYPE "..cType.." NOT FOUND!");
		return;
	end

end

-- ======================================================
-- Methods that get called in main file triggered by corresponding events
-- ======================================================
function TM_RunCombatSim(iAttackingPlayer, iAttackingUnit, iAttackingUnitDamage, iAttackingUnitFinalDamage, iAttackingUnitMaxHitPoints, iDefendingPlayer, iDefendingUnit, iDefendingUnitDamage, iDefendingUnitFinalDamage, iDefendingUnitMaxHitPoints)
	--print("TM_RUNCOMBATSIM");
	-- doesnt get triggered by event
end

function TM_EndCombatSim(iAttackingPlayer, iAttackingUnit, iAttackingUnitDamage, iAttackingUnitFinalDamage, iAttackingUnitMaxHitPoints, iDefendingPlayer, iDefendingUnit, iDefendingUnitDamage, iDefendingUnitFinalDamage, iDefendingUnitMaxHitPoints)
	--print("TM_ENDCOMBATSIM");
	-- doesnt get triggered by event
end

function TM_UnitSetDamage(playerId, unitId, iDamage, iPreviousDamage)
	if((g_electedCityId ~= nil) and g_checkUnitKill) then
		local player = Players[playerId];
		local unit = player:GetUnitByID(unitId);
		local team = Teams[player:GetTeam()];
		local plot = unit:GetPlot();
		local plotOwnerId = plot:GetOwner();
		local electedPlayer, electedCity = GetPlayerCity(g_electedPlayerId, g_electedCityId);

		if(
				(team:IsAtWar(electedPlayer:GetTeam())) and
				(plotOwnerId == electedPlayer:GetID()) and -- unit is in borders
				unit:IsCombatUnit() and
				(unit:GetMaxHitPoints() <= (unit:GetDamage() + iDamage)) -- unit has been killed in action (not by disbanding etc)
			) then
			local str = unit:GetBaseCombatStrength();
			if(g_foodOnKillMod ~= nil) then
				local value = math.max(1, g_foodOnKillMod * str);
				electedCity:ChangeFood(value);
			end
			if(g_cultureOnKillMod ~= nil) then
				local value = math.max(1, g_cultureOnKillMod * str);
				electedCity:ChangeJONSCultureStored(value);
			end
			if(g_productionOnKillMod ~= nil) then
				local value = math.max(1, g_productionOnKillMod * str);
				electedCity:ChangeProduction(value);
			end
		end
	end
end