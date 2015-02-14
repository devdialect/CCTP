--------------------------------------------------------------
-- Emigration Mod v5
-- Authors: killmeplease
--------------------------------------------------------------
include( "CustomNotification.lua" );
include( "Prosperity" );
include( "ScriptDataManager" );
--------------------------------------------------------------
LuaEvents.NotificationAddin({ name = "Emigration", type = "CNOTIFICATION_EMIGRATION"})
LuaEvents.NotificationAddin({ name = "Immigration", type = "CNOTIFICATION_IMMIGRATION"})
-- const factors
local iEmigrationDice	= GameInfo.GameSpeeds[PreGame.GetGameSpeed()].GrowthPercent;	-- emigration probability is linked to growth speed
local CooldownTurns		= math.floor(GameInfo.EmigrationSettings["CooldownTurns"].Value * iEmigrationDice / 100 + .5);	-- min turns between two emigrations from one city
local iDistanceLogBase 	= GameInfo.EmigrationSettings["DistanceFactorLogBase"].Value;
local AutocracyModifier = GameInfo.EmigrationSettings["AutocracyModifier"].Value / 100;	-- applied to emigration probability
local OrderModifier		= GameInfo.EmigrationSettings["OrderModifier"].Value / 100;	-- reduces city's weight on immigration
-- variables
local notifications = {};	-- list of notifications to be shown on a player's turn (cant show on PlayerDoTurn because of error)
--------------------------------------------------------------
-- FUNCTIONS
--------------------------------------------------------------
function GetProsperityRating(player)
	print("updating prosperity rating");
	local team = Teams[player:GetTeam()];
	local prosperityRating = {};	-- list of the cities of the world ordered by prosperity: {prosp, city}
	for n, host in pairs(Players) do
		if IsValid(host) and MetAndNoWar(player, host) then
			local macroProsp = GetMacroProsperity(host);
			for city in host:Cities() do
				if not city:IsRazing() and not city:IsResistance() and not city:IsBlockaded() and city:FoodDifference() >= 0 then
					local prosp = GetLocalProsperity(city) + macroProsp;
					table.insert(prosperityRating, {prosp = prosp, city = city});
				end
			end
		end
	end
	table.sort(prosperityRating, function(c1, c2) return c1.prosp > c2.prosp end);	-- sort cities by prosperity in descending order
	return prosperityRating;
end
--------------------------------------------------------------
function MetAndNoWar(playerA, playerB)
	if playerA == playerB then
		return true;
	end
	local teamA = Teams[playerA:GetTeam()];
	local teamB = playerB:GetTeam();	-- id
	return teamA:IsHasMet(teamB) and not teamA:IsAtWar(teamB);
end
--------------------------------------------------------------
function Migration(iPlayer)		-- executed at the start of an each player's turn
	local player = Players[iPlayer];
	if player:IsMinorCiv() then
		return;
	end
	if player:GetTotalPopulation() - player:GetNumCities() == 0 then	-- no spare citizens to emigrate
		return;
	end
	--print("=== check " .. GetPlayerName(player) .. " - turn " .. Game.GetGameTurn());
	local destList = GetProsperityRating(player);
	if # destList < 2 then	-- # returns number of elements
		return;
	end

	local currentEraType = GameInfo.Eras("ID = " .. player:GetCurrentEra())().Type;
	--print("current era = " .. currentEraType);
	local EraModifier = GameInfo.EmigrationEraModifiers("EraType = '" .. currentEraType .. "'")().EmigrationModifier / 100;
	--print("era modifier = " .. EraModifier);
	local maxDist = GameInfo.EmigrationEraModifiers("EraType = '" .. currentEraType .. "'")().MaxDistance;
	--print("era max distance = " .. maxDist);
	local maxProsp = destList[1].prosp;
	--print("maxProsp = " .. maxProsp .. " for the " .. destList[1].city:GetName());

	for n, rec in ipairs(destList) do
		local city = rec.city;
		local owner = Players[city:GetOwner()];
		local modData = AccessData(city:Plot(), "Emigration");
		local lastEmigrationTurn = (modData.lastEmigrationTurn or "?");
		--print("test city " .. city:GetName() .. "  " .. rec.prosp .. " / " .. lastEmigrationTurn);
		if owner == player and n > 1 and (Game.GetGameTurn() > (modData.lastEmigrationTurn or -100) + CooldownTurns) then
			local maxDiff = maxProsp - rec.prosp;
			--print("maxDiff = "..maxDiff);
			-- determine emigration probability
			local emigrationProb = maxDiff * log2(city:GetPopulation());	-- no emigration from size 1 cities
			emigrationProb = emigrationProb * EraModifier;
			if player:IsPolicyBranchUnlocked(GameInfoTypes.POLICY_BRANCH_AUTOCRACY) then
				--print(" - has autocracy");
				emigrationProb = emigrationProb * AutocracyModifier;
			end
			-- test if an emigration should occur
			local roll = Map.Rand(iEmigrationDice, "Emigration");
			--print("***** Emigration probability for "..city:GetName().." = "..emigrationProb);
			--print("roll = "..roll.." of "..iEmigrationDice);
			if roll < emigrationProb then
				-- determine a destination city and send an emigrant
				--print("determine destination city");
				local destCity = GetDestinationCity(destList, n - 1, maxDist);
				if destCity ~= nil then
					--print("destination city is "..destCity:GetName());
					MoveCitizen(city, destCity);
				end
			end
		end
	end
end
--------------------------------------------------------------
function GetDestinationCity(data, numBetterCities, maxDist)
	-- generate a city-specific weights (considering distance)
	local weights = {};
	local fromCity = data[numBetterCities + 1].city;
	local fromProsp = data[numBetterCities + 1].prosp;
	local fromX = fromCity:GetX();
	local fromY = fromCity:GetY();
	local sumWgt = 0;
	--print(" - num better cities = " .. numBetterCities);
	for i = 1, numBetterCities do
		local toCity = data[i].city;
		local toPlayer = Players[toCity:GetOwner()];
		local dist = iDistanceLogBase;
		local hasSoL = hasSOL(toPlayer);
		local wgt = 0;
		local dprosp = data[i].prosp - fromProsp;
		--print(toCity:GetName() .. " delta prosp = " .. dprosp);
		--if hasSoL then
		--	print(" - " .. toCity:GetName() .. "'s owner has SoL");
		--end
		if fromCity:GetOwner() ~= toCity:GetOwner() and not hasSoL then	-- calc dist if its a foreign city and its owner doesnt have SoL
			dist = Map.PlotDistance(fromX, fromY, toCity:GetX(), toCity:GetY());
			--print(" - distance to " .. toCity:GetName() .. " = "..dist);
		end
		if dist <= maxDist then
			wgt = dprosp * 10 / LogN(dist, iDistanceLogBase);	-- a normalized weight with the distance applied
			--print(" - wgt with distance applied = " .. wgt);	
		--else
			--print("   " .. toCity:GetName() .. " is too far and wont be considered");
		end
		--print("   check for Order..");
		if toPlayer:IsPolicyBranchUnlocked(GameInfoTypes.POLICY_BRANCH_ORDER) then
			--print(" - has order. diminish weight by " .. OrderModifier);
			wgt = wgt * OrderModifier;
		--else
		--	print(" - no order");
		end
		wgt = wgt * wgt;
		sumWgt = sumWgt + wgt;
		weights[i] = wgt;
		--print(toCity:GetName() .. " weight = " .. wgt);
	end
	local roll = Map.Rand(sumWgt, "Emigration - Determine dest city roll");
	--print("dest city roll = " .. roll);
	local accWgt = 0;
	for i = 1, numBetterCities do
		accWgt = accWgt + weights[i];
		if roll < accWgt then
			return data[i].city;
		end
	end
	--print("no city chosen");
	return nil;
end
--------------------------------------------------------------
function MoveCitizen(fromCity, toCity)
	fromCity:SetPopulation(fromCity:GetPopulation() - 1, true);	--decrease population in a source city
	toCity:SetPopulation(toCity:GetPopulation() + 1, true);	-- increase population in a destination city
	-- cooldown
	local modData = AccessData(fromCity:Plot(), "Emigration");
	modData.lastEmigrationTurn = Game.GetGameTurn();
	SaveData(fromCity:Plot());
	--print("last emigration turn saved ("..modData.lastEmigrationTurn..")");

	-- create a notification to the player:
	local fromPlayer= Players[fromCity:GetOwner()];
	local toPlayer = Players[toCity:GetOwner()];
	if fromPlayer:IsHuman() and fromPlayer ~= toPlayer then	-- show only in case of foreign emigration
		local destination = GetPlayerName(toPlayer);
		--local summary = "A [ICON_CITIZEN] citizen from " .. fromCity:GetName() .. " left for the " .. destination;
		print("creating a notification");
		local smr = Locale.ConvertTextKey("TXT_KEY_EMIGRATION_SUMMARY", fromCity:GetName(), destination);
		local txt = Locale.ConvertTextKey("TXT_KEY_EMIGRATION_TEXT", destination);
		table.insert(notifications, { type = "Emigration", text = txt, summary = smr, city = fromCity });
	elseif toPlayer:IsHuman() then
		local source = fromCity:GetName();
		--if fromPlayer ~= toPlayer then
			--source = "the " .. GetPlayerName(fromPlayer);
		--end
		--local summary = "A [ICON_CITIZEN] citizen from " .. source .. " came to " .. toCity:GetName();
		local smr = Locale.ConvertTextKey("TXT_KEY_IMMIGRATION_SUMMARY", source, toCity:GetName());
		local txt = Locale.ConvertTextKey("TXT_KEY_IMMIGRATION_TEXT", source);
		table.insert(notifications, { type = "Immigration", text = txt, summary = smr, city = toCity });
	end
end
--------------------------------------------------------------
function NewTurn()
	-- show notifications on active player's turn
	for _, msg in pairs(notifications) do
		CustomNotification(msg.type, msg.text, msg.summary, 0, msg.city, 0, 0);
	end
	notifications = {};
end
--------------------------------------------------------------
Events.ActivePlayerTurnStart.Add( NewTurn );
GameEvents.PlayerDoTurn.Add( Migration );
--------------------------------------------------------------
-- Utility Functions
--------------------------------------------------------------
function IsValid(player)	-- this player is in game
	return player ~= nil and player:IsAlive();
end
--------------------------------------------------------------
function GetPlayerName(player)	-- get player's name for notification
	if player:IsMinorCiv() then
		local minorCivType = player:GetMinorCivType();
		local minorCivInfo = GameInfo.MinorCivilizations[minorCivType];
		return Locale.ConvertTextKey(minorCivInfo.Description);
	end
	local iCivType = player:GetCivilizationType();
	local civInfo = GameInfo.Civilizations[iCivType];			
	return Locale.ConvertTextKey(civInfo.Description);	
end
--------------------------------------------------------------
function hasSOL(player)
	return player:GetBuildingClassCount(GameInfoTypes.BUILDINGCLASS_STATUE_OF_LIBERTY) > 0;
end
--------------------------------------------------------------
function log2(n)
local _n = 2
local x = 1
    if (_n < n) then
        repeat
            x = x + 1
            _n = _n + _n
        until (_n >= n)
    elseif (_n > n) then
        if (n == 1) then
            return 0
        else
            return nil
        end
    end 
    if (_n > n) then
        return x-1
    else
        return x
    end 
end
--------------------------------------------------------------