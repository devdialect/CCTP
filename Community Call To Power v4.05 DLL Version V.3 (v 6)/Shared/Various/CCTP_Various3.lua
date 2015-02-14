------Provides a Technology when the named Policy is adopted------

GameEvents.PlayerAdoptPolicy.Add(
function(iPlayer, policyID)
local player = Players[iPlayer];
local pTeam = Teams[player:GetTeam()];
local iTechIndex = GameInfoTypes["TECH_CTTPDUMMYTECH4"];
if policyID == GameInfo.Policies["POLICY_IMPERIAL_CULTX"].ID then
pTeam:SetHasTech(iTechIndex, true)
end
end) 