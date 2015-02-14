-- HeroesLogic
-- Author: S
-- DateCreated: 11/3/2012 9:33:22 PM
--------------------------------------------------------------

function updateHeroesCombatStrength()
	--local pPlayer = Players[ Game.GetActivePlayer() ]
	for i,player in pairs(Players) do
		local combat_str = 10--(10*player:GetCurrentEra())+10
		if (player:GetCurrentEra()==GameInfoTypes.ERA_PREHISTORIC) then combat_str = 7
		elseif (player:GetCurrentEra()==GameInfoTypes.ERA_ANCIENT) then combat_str = 9
		elseif (player:GetCurrentEra()==GameInfoTypes.ERA_CLASSICAL) then combat_str = 13
		elseif (player:GetCurrentEra()==GameInfoTypes.ERA_MEDIEVAL) then combat_str = 18
		elseif (player:GetCurrentEra()==GameInfoTypes.ERA_RENAISSANCE) then combat_str = 25
		elseif (player:GetCurrentEra()==GameInfoTypes.ERA_INDUSTRIAL) then combat_str = 34
		elseif (player:GetCurrentEra()==GameInfoTypes.ERA_MODERN) then combat_str = 60
		elseif (player:GetCurrentEra()==GameInfoTypes.ERA_POSTMODERN) then combat_str = 70
		elseif (player:GetCurrentEra()==GameInfoTypes.ERA_FUTURE) then combat_str = 120
		else combat_str = 10 end

		for unit in player:Units() do
			local iUnit = unit:GetID();
			if (unit:GetUnitType()==GameInfoTypes.UNIT_GREAT_GENERAL) then
				unit:SetBaseCombatStrength(combat_str)
			end
		end

	end
end

Events.ActivePlayerTurnStart.Add(updateHeroesCombatStrength)
Events.SerialEventEraChanged.Add(updateHeroesCombatStrength)
Events.SerialEventUnitCreated.Add(updateHeroesCombatStrength)
print("Heros!")