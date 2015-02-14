-- Author: FramedArchitecture
-- DateCreated: 2/2/2014 3:24:45 PM
--------------------------------------------------------------
local GPCultureBuildingID = -1;
local GPCultureBonus = 0;
local improvements = {};
local greatworks = {};
local insert = table.insert
local remove = table.remove
local bFire = false
--------------------------------------------------------------
function OnPlayerDoTurn(playerID)
	local player = Players[playerID]
	if playerID ~= 63 then return end
	UpdateGreatWorks(true);
end
GameEvents.PlayerDoTurn.Add( OnPlayerDoTurn )
--------------------------------------------------------------
function OnImprovementComplete(playerID, x, y, improvementID)
	bFire = not bFire
	if not bFire then return end

	local player = Players[playerID];
	if player:CountNumBuildings(GPCultureBuildingID) < 1 then return end

	if IsGPImprovement(improvementID) then 
		player:ChangeJONSCulture(GPCultureBonus)
	end
end
GameEvents.BuildFinished.Add( OnImprovementComplete )
--------------------------------------------------------------
function OnTurnDirty()
	UpdateGreatWorks(false);
end
GameEvents.CityCaptureComplete.Add(OnTurnDirty);
Events.SerialEventCityDestroyed.Add(OnTurnDirty);
--------------------------------------------------------------
function UpdateGreatWorks(bRefresh)
	for _,v in ipairs(greatworks) do
		local player = Players[v.playerID]
		if bRefresh then
			if player:CountNumBuildings(GPCultureBuildingID) == 1 then
				player:ChangeJONSCulture(GPCultureBonus * (player:GetNumGreatWorks() - v.num))
			end
		end
		v.num = player:GetNumGreatWorks();
	end
end
--------------------------------------------------------------
function IsGPImprovement(improvementID)
	for _, v in ipairs(improvements) do
		if GameInfoTypes[v] == improvementID then 
			return true;
		end
	end
	return false;
end
--------------------------------------------------------------
function Init()
	for row in GameInfo.Buildings("CulturePerGP > 0") do
		GPCultureBuildingID = row.ID
		GPCultureBonus = row.CulturePerGP
		break;
	end

	for row in GameInfo.Improvements("CreatedByGreatPerson = 1") do
		insert(improvements, row.Type);
	end

	for i = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
		local player = Players[i];
		if player and player:IsAlive() then
			insert(greatworks, {playerID = i, num = player:GetNumGreatWorks()});
		end
	end
end
--------------------------------------------------------------
Init();
