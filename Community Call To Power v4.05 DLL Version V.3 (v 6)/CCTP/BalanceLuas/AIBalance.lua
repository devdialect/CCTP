-- AIBalance
-- Author: Gyogen
-- DateCreated: 11/6/2014 8:07:32 PM
--------------------------------------------------------------
local g_GoldUp
function AiGoldBalance(iPlayer)
	
	local pPlayer = Players[iPlayer];
	local pTeam = Teams[pPlayer:GetTeam()];
	if (pPlayer:IsHuman() or pTeam:IsAtWar()) then return
	end
	local iGoldPerTurn = pPlayer:CalculateGoldRate();
	local iCurrentGold = pPlayer:GetGold();
	print("gold", iCurrentGold);
	if iGoldPerTurn < 0 then
		g_GoldUp = 1
		if (pTeam:IsHasTech(GameInfoTypes["TECH_GUILDS"])) then
			for pCity in pPlayer:Cities() do
				pCity:PushOrder (OrderTypes.ORDER_MAINTAIN, GameInfo.Processes["PROCESS_WEALTH"].ID, -1, 0, false, false);
			end
		elseif (pTeam:IsHasTech(GameInfoTypes["TECH_NUMMER"])) then
			for pCity in pPlayer:Cities() do
				pCity:PushOrder (OrderTypes.ORDER_MAINTAIN, GameInfo.Processes["PROCESS_CREATION<"].ID, -1, 0, false, false);
			end
		else
			for pCity in pPlayer:Cities() do
				pCity:PushOrder (OrderTypes.ORDER_MAINTAIN, GameInfo.Processes["PROCESS_NOBUILD"].ID, -1, 0, false, false);
			end
		end
	elseif (iGoldPerTurn > 0 and g_GoldUp == 1) then
		g_GoldUp = 0
		for pCity in pPlayer:Cities() do
			pCity:ChooseProduction();
		end
	end

end
GameEvents.PlayerDoTurn.Add(AiGoldBalance)

