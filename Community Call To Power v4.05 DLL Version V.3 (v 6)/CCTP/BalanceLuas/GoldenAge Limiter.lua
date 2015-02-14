-- GoldenAge Limiter
-- Author: Gyogen
-- DateCreated: 10/18/2014 8:04:37 PM
--------------------------------------------------------------
g_GATimer = {};
--------------------------------------------------------------



---------------------------------------------------------------
function GALimiter(iPlayer)
	local iCurrTurn = Game.GetGameTurn();
	local iLimiter = 0;
	local pPlayer = Players[iPlayer];
	local gaProgress = pPlayer:GetGoldenAgeProgressMeter();
	local gaThreshold = pPlayer:GetGoldenAgeProgressThreshold();
	
	print(pPlayer, iPlayer);
	print (gaProgress, gaThreshold, exHappiness);
	if g_GATimer[iPlayer] == nil then g_GATimer[iPlayer] = 0; end
	if g_GATimer[iPlayer] > iCurrTurn then 
		iLimiter = gaProgress
		pPlayer:ChangeGoldenAgeProgressMeter(-iLimiter);
		local gaProgressB = pPlayer:GetGoldenAgeProgressMeter()
		print("progreesb", iLimiter, gaProgressB);
		
	end
	print ("after", gaProgress, gaThreshold);
end


GameEvents.PlayerDoTurn.Add(GALimiter)
----------------------------------------------------------------
function GoldenAgeTimer(iPlayer)
local pPlayer = Players[iPlayer];
local iCurrTurn = Game.GetGameTurn();
	if pPlayer:IsGoldenAge() then
		local gaTurns = pPlayer:GetGoldenAgeTurns();
		g_GATimer[iPlayer] = iCurrTurn + (gaTurns + 25);
	end
	print(pPlayer, g_GATimer[iPlayer]);
end


GameEvents.PlayerDoTurn.Add(GoldenAgeTimer)
-----------------------------------------------------------------
function InitLimiter()
	for iPlayerLoop = 0, GameDefines.MAX_CIV_PLAYERS-1, 1 do
		
		g_GATimer[iPlayerLoop] = 10
	end
end
------------------------------------------------------------------
InitLimiter()