if(Game.GetCustomOption("GAMEOPTION_CCTP_EVENTS") == 0) then
	return;
end
-- TaxMain
-- Author: gyogen
-- DateCreated: 11/28/2014 8:09:29 PM
--------------------------------------------------------------
include( "EventSaveData.lua");
include( "TriggeredEvents.lua" );
include( "EventUtils.lua" );
local g_TaxRevolt;

function AddTaxIncome(iPlayer)
	
	local pTaxPlayer = Players[iPlayer];
	local iTaxes = GameInfoTypes["RESOURCE_TAXES"];
	if iTaxes == nil then iTaxes = 0 end
	local iTaxIncome = pTaxPlayer:GetNumResourceTotal(iTaxes);
	pTaxPlayer:ChangeGold(iTaxIncome);
end
GameEvents.PlayerDoTurn.Add(AddTaxIncome)

function TaxEffects(iPlayer)
	local pTaxPlayer = Players[iPlayer];
	local numCities = pTaxPlayer:GetNumCities();
	local iHappMod = 0
	if pTaxPlayer:IsHuman() then
		local iTaxHapp = GetPersistentProperty("TaxHapp") or 0
		
		pTaxPlayer:ChangeExtraHappinessPerCity(-iTaxHapp);
		local iTaxRate = GetPersistentProperty("fTax") or 0
		local iTaxRate = math.ceil(iTaxRate * 100);
		print("iTaxRate", iTaxRate);
		if iTaxRate <= 10 then
			iHappMod = 2;
		elseif iTaxRate >10 and iTaxRate <=25 then
			iHappMod = 0;
		elseif iTaxRate >25 and iTaxRate <=40 then
			iHappMod = ((iTaxRate / 10) * -1);
		elseif iTaxRate >40 then
			iHappMod = ((iTaxRate / 5) * -1);
			local iTeaParty = Game.Rand(300, "revolt");
			local iTeaParty = iTeaParty + iTaxRate;
			if iTeaParty > 270 then
				TaxRevolt(pTaxPlayer, iTaxRate);
			end
		end
		iTaxHapp = (iHappMod / numCities)
		pTaxPlayer:ChangeExtraHappinessPerCity(iTaxHapp);
		SetPersistentProperty("TaxHapp", iTaxHapp);
	end
end
GameEvents.PlayerDoTurn.Add(TaxEffects)


function TaxRevolt(pTaxPlayer, iTaxRate)
	if g_TaxRevolt > 0 then return end
	if iTaxRate < 50 then
		local pCity = GetRandomPlayerCity(pTaxPlayer);
		CityRiot(pTaxPlayer, pCity);
		g_TaxRevolt = (Game.GetGameTurn() + 5);
		SetPersistentProperty("TaxRevolt", g_TaxRevolt);
	elseif (iTaxRate >= 50) and  (iTaxRate < 70)  then
		local iRevoltChance = Game.Rand(200, "chance");
		if iRevoltChance > 170 then 
			local spUnit = RandomUnit(pTaxPlayer)
			CityRevolt(pTaxPlayer, spUnit)
			g_TaxRevolt = (Game.GetGameTurn() + 5);
			SetPersistentProperty("TaxRevolt", g_TaxRevolt);
		else
			DoTeaParty(pTaxPlayer);
			g_TaxRevolt = (Game.GetGameTurn() + 8);
			SetPersistentProperty("TaxRevolt", g_TaxRevolt);
		end
	elseif iTaxRate >= 70 then
		
		print("taxrev", g_TaxRevolt)
		local iRevoltChance = Game.Rand(200, "chance");
		if iRevoltChance > 180 then 
			local spUnit = PlayersStrongestUnit(pTaxPlayer, true, "UNITCOMBAT_MELEE");
			DoTaxRevolt(pTaxPlayer, spUnit);
			g_TaxRevolt = (Game.GetGameTurn() + 30);
			SetPersistentProperty("TaxRevolt", g_TaxRevolt);
		else
			DoTeaParty(pTaxPlayer);
			g_TaxRevolt = (Game.GetGameTurn() + 8);
			SetPersistentProperty("TaxRevolt", g_TaxRevolt);
		end
	end

end	

function TaxRevoltCheck()
	if g_TaxRevolt < 0 then return end
	local iTurn = Game.GetGameTurn();
	if g_TaxRevolt == iTurn then
	g_TaxRevolt = -1
	SetPersistentProperty("TaxRevolt", g_TaxRevolt);	
	end
end
GameEvents.PlayerDoTurn.Add(TaxRevoltCheck)	

function AiTaxControl(iPlayer)
	local pAiPlayer = Players[iPlayer];
	if pAiPlayer:IsHuman() then return end
	local pAiTeam = Teams[pAiPlayer:GetTeam()];
	local iAiGoldPerTurn = pAiPlayer:CalculateGoldRate();
	local iAiCurrentGold = pAiPlayer:GetGold();
	local iAiHapp = pAiPlayer:GetHappiness()
	local iAiNumCities = pAiPlayer:GetNumCities();
	local iTaxes = GameInfoTypes["RESOURCE_TAXES"];
	if (pAiTeam:IsHasTech(GameInfoTypes["TECH_TAXES"])) then
		local iAiCurrTaxes =  pAiPlayer:GetNumResourceTotal(iTaxes);
		pAiPlayer:ChangeNumResourceTotal(iTaxes, -iAiCurrTaxes);
		if (pAiTeam:IsAtWar()) then
			if ( iAiCurrentGold < 20 ) or ( iAiGoldPerTurn < 5 ) then
				if iAiGoldPerTurn < 0 then
					aiTaxBase = math.ceil(iAiGoldPerTurn + 20);
				else
					aiTaxBase = math.ceil(20 - iAiGoldPerTurn);
				end
				pAiPlayer:ChangeNumResourceTotal(iTaxes, aiTaxBase);
			end
		elseif iAiGoldPerTurn < 1 then 
			if iAiGoldPerTurn < 0 then
					aiTaxBase = math.ceil(iAiGoldPerTurn + 10);
				else
					aiTaxBase = math.ceil(10 - iAiGoldPerTurn);
				end
				pAiPlayer:ChangeNumResourceTotal(iTaxes, aiTaxBase);
		end
	end
end
GameEvents.PlayerDoTurn.Add(AiTaxControl)

function TaxInit()

g_TaxRevolt = GetPersistentProperty("TaxRevolt") or -1	
end

TaxInit()