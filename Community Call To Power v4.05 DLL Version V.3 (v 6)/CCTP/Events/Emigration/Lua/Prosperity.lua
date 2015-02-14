-- Prosperity
-- Author: killmeplease
-- DateCreated: 5/6/2013 7:34:55 AM
--------------------------------------------------------------
include( "ScriptDataUtils" );
--------------------------------------------------------------
--	PROSPERITY FUNCTIONS
--------------------------------------------------------------
function GetProsperityFromProductiveness(city)
	local prosp = 0;
	-- add sum of city's yields (food, production, gold, science)
	for i = 0, 3, 1 do
		prosp = prosp + city:GetYieldRateTimes100(i);
	end
	prosp = prosp / 100;					
	prosp = prosp + city:GetJONSCulturePerTurn();	-- add culture per turn
	prosp = prosp + city:GetGreatPeopleRate();		-- add great people points
	prosp = prosp + city:GetFaithPerTurn();			-- add faith
	prosp = prosp + city:GetBaseTourism();			-- add tourism
	prosp = prosp / city:GetPopulation();		-- calc average per citizen
	--local WealthFactor 		= GameInfo.EmigrationSettings["WealthFactor"].Value / 100;
	--prosp = prosp * WealthFactor;
	prosp = LogN(prosp, 1.5);
	return prosp;
end
--------------------------------------------------------------
function GetProsperityFromLocalHappiness(city)
	local LocalHappinessFactor 	= GameInfo.EmigrationSettings["LocalHappinessFactor"].Value / 100;
	local prosp = (city:GetLocalHappiness() - city:GetPopulation()) * LocalHappinessFactor;
	return prosp;
end
--------------------------------------------------------------
function GetLocalProsperity(city)
	local prosp = 0;
	prosp = prosp + GetProsperityFromProductiveness(city);
	prosp = prosp + GetProsperityFromLocalHappiness(city);
	return prosp;
end
--------------------------------------------------------------
function GetProsperityFromHappiness(player)
	local HappinessFactor 	= GameInfo.EmigrationSettings["HappinessFactor"].Value / 100;
	local prosp = player:GetExcessHappiness() * HappinessFactor;
	if player:IsEmpireVeryUnhappy() then
		prosp = prosp - 2;
	elseif player:IsEmpireUnhappy() then
		prosp = prosp - 1;
	end
	return prosp;
end
--------------------------------------------------------------
function GetProsperityFromCulture(player)
	local PoliciesFactor 	= GameInfo.EmigrationSettings["PoliciesFactor"].Value / 100;
	return player:GetNumPolicies() * PoliciesFactor;
end
--------------------------------------------------------------
function GetProsperityFromFreedom(player)
	if player:IsPolicyBranchUnlocked(GameInfoTypes.POLICY_BRANCH_FREEDOM) then
		return  GameInfo.EmigrationSettings["FreedomBonus"].Value;
	end
	return 0;
end
--------------------------------------------------------------
function GetMacroProsperity(player)	
	local fromHappiness = GetProsperityFromHappiness(player);
	local fromCulture = GetProsperityFromCulture(player);
	local fromFreedom = GetProsperityFromFreedom(player);
	return fromHappiness + fromCulture + fromFreedom;
end
--------------------------------------------------------------
function GetProsperity(city)	-- local + macro prosperity
	local player = Players[city:GetOwner()];
	return GetLocalProsperity(city) + GetMacroProsperity(player);
end
--------------------------------------------------------------
-- CITYVIEW PROSPERITY TOOLTIP
--------------------------------------------------------------
function GetProsperityTooltip(pCity)

	local player = Players[pCity:GetOwner()];
	local prospTips = {};

	-- Prosperity from Empire Happiness
	local prosp = GetProsperityFromHappiness(player);
	if prosp < 0 then
		table.insert(prospTips, "[ICON_BULLET][COLOR_WARNING_TEXT]" .. Locale.ConvertTextKey("TXT_KEY_PROSPERITY_FROM_HAPPINESS", prosp) .. "[ENDCOLOR]");
	else
		table.insert(prospTips, "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_PROSPERITY_FROM_HAPPINESS", prosp));
	end
	
	-- Prosperity from Local Happiness
	prosp = GetProsperityFromLocalHappiness(pCity);
	if prosp < 0 then
		table.insert(prospTips, "[ICON_BULLET][COLOR_WARNING_TEXT]" .. Locale.ConvertTextKey("TXT_KEY_PROSPERITY_FROM_LOCAL_HAPPINESS", prosp) .. "[ENDCOLOR]");
	else
		table.insert(prospTips, "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_PROSPERITY_FROM_LOCAL_HAPPINESS", prosp));
	end

	-- Prosperity from Productiveness
	prosp = GetProsperityFromProductiveness(pCity);
	table.insert(prospTips, "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_PROSPERITY_FROM_PRODUCTIVENESS", prosp));

	-- Prosperity from Culture
	prosp = GetProsperityFromCulture(player);
	if prosp > 0 then
		table.insert(prospTips, "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_PROSPERITY_FROM_POLICIES", prosp));
	end

	-- Prosperity from Freedom
	prosp = GetProsperityFromFreedom(player);
	if prosp > 0 then
		table.insert(prospTips, "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_PROSPERITY_FROM_FREEDOM", prosp));
	end
	
	-- Breakdown
	table.insert(prospTips, "----------------");
	prosp = GetProsperity(pCity);
	table.insert(prospTips, Locale.ConvertTextKey("TXT_KEY_PROSPERITY_TOTAL", prosp));

	-- no emigration turns
	local iEmigrationDice = GameInfo.GameSpeeds[PreGame.GetGameSpeed()].GrowthPercent;
	local CooldownTurns	= math.floor(GameInfo.EmigrationSettings["CooldownTurns"].Value * iEmigrationDice / 100 + .5);
	local lastEmigrationTurn = GetSavedValue(pCity:Plot(), "Emigration", "lastEmigrationTurn") or -100;
	--print("emigration turn: " .. lastEmigrationTurn);
	local turnsGone = Game.GetGameTurn() - lastEmigrationTurn;
	--print("turns gone: " .. turnsGone);
	local safeTurns = CooldownTurns - turnsGone;
	--print("safe turns: " .. safeTurns);
	if safeTurns > 0 then
		table.insert(prospTips, Locale.ConvertTextKey("TXT_KEY_EMIGRATION_SAFE_TURNS", safeTurns));
	end

	return table.concat(prospTips, "[NEWLINE]");
end
--------------------------------------------------------------
function LogN(arg, base)
	return math.log(arg)/math.log(base);
end
--------------------------------------------------------------