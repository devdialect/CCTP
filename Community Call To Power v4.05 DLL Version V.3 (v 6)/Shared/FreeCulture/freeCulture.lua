-- freeCulture
-- Author: Moriboe
-- DateCreated: 12/28/2011
--------------------------------------------------------------
print("Free Culture")
function FreeCulture(iPlayer)
	local buildingID, buildingTime, freeCulture;
	local player = Players[iPlayer];
	if IsValidPlayer(player) then
		for pCity in player:Cities() do
			for row in GameInfo.Building_FreeCulture() do
				-- has wonder?
				buildingID = GameInfo.Buildings[row.BuildingType].ID;
				if pCity:IsHasBuilding(buildingID) then
					-- just built?
					buildingTime = pCity:GetBuildingOriginalTime(buildingID);
					if buildingTime == Game:GetGameTurnYear() then
						-- pick mode
						if row.PerMilUnit then
							freeCulture = row.Culture * player:GetNumMilitaryUnits();
						elseif row.PerPop then
							freeCulture = row.Culture * 
								math.max(pCity:GetPopulation() - row.PopThreshold);
						else
							freeCulture = row.Culture;							
						end
						player:ChangeJONSCulture(freeCulture);
					
					end
				end
			end
		end
	end
end

function IsValidPlayer(player)
	return player ~= nil and player:IsAlive() and not player:IsBarbarian()
end

GameEvents.PlayerDoTurn.Add( FreeCulture );