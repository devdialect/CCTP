-- ReverseEngineering
-- Author: Harald B
-- DateCreated: 2/6/2013 10:19:01 AM
--------------------------------------------------------------
print("Reverse Engineering mod initializing.")

function ReverseEngineering( player )
local pPlayer = Players[player]
if pPlayer:IsAlive() then
local iTeam = pPlayer:GetTeam()
local pTeam = Teams[iTeam]
print("Turn started for ",pPlayer:GetCivilizationShortDescription())
local TookSomething = false		--To prevent more than one tech being reverse-engineered in a given turn

for i=0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
	local pOtherPlayer = Players[i]
	if pOtherPlayer:IsAlive() then
	local iOtherTeam = pOtherPlayer:GetTeam()
	if (not TookSomething) and (not (iTeam == iOtherTeam)) and pTeam:IsHasMet(iOtherTeam) then
		print("Trying to reverse-engineer tech from",pOtherPlayer:GetCivilizationShortDescription())
		local pOtherTeam = Teams[iOtherTeam]
		local BaseChance=1
		if pOtherTeam:IsAllowsOpenBordersToTeam(iTeam) then BaseChance = BaseChance+1 end
		if pOtherTeam:IsHasResearchAgreement(iTeam) then BaseChance = BaseChance+3 end
		-- Note to self: add bonus from number of spies
		--
		for tech in GameInfo.Technologies() do
			if (not TookSomething) and pPlayer:CanResearch(tech.ID) and pOtherTeam:IsHasTech(tech.ID) then
			print("-",tech.Type)
			if 100*math.random() <= BaseChance then
				TookSomething = true
				print("-- Success!")
				pTeam:SetHasTech(tech.ID, true, player, false, true)
			end end	--One for the tech being appropriate, one for the odds
		end
	end end	--One for IsAlive, one for the main If
end

end end	--One for IsAlive, one for the function


GameEvents.PlayerDoTurn.Add(ReverseEngineering)