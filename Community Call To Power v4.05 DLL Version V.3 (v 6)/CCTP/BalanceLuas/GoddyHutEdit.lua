-- GoddyHutEdit
-- Author: Gyogen
-- DateCreated: 10/13/2014 12:51:02 PM
--------------------------------------------------------------
function GoodyHutEdit(pPlayer)
	local iPlayer = Game.GetActivePlayer();
	local pPlayer = Players[iPlayer];
	local settlerUnit =  GameInfo.Units["UNIT_SETTLER"].ID;
	local scoutUnit =  GameInfo.Units["UNIT_SCOUT"].ID;
	print(settlerUnit, scoutUnit);

	if pPlayer:CanTrain(settlerUnit) then
		goodySettler = 'UNITCLASS_SETTLER'
	else 
		goodySettler = 'UNITCLASS_CAVEMAN'
	end

	if pPlayer:CanTrain(scoutUnit) then
		goodyScout = 'UNITCLASS_SCOUT'
	else
		goodyScout = 'UNITCLASS_CAVEMAN'
	end

	local tquery = {"UPDATE GoodyHuts SET UnitClass = '".. goodySettler .."' WHERE Type = 'GOODY_SETTLER'",	
	"UPDATE GoodyHuts SET UnitClass = '".. goodyScout .."' WHERE Type = 'GOODY_SCOUT'"
	}

	for i, iQuery in pairs(tquery) do
		print ("Changing GoodyHuts");
		for result in DB.Query(iQuery) do
		end
	end

end
-----------------------------------------------------------------------
function CheckGoodyHitsOnLoad (arg0, currPlayer)
	print("Goody Started");
	local empty = "";
	for _, pPlayer in pairs(Players) do
		if (pPlayer:IsAlive()) then
			if (pPlayer:IsHuman()) then
				GoodyHutEdit(pPlayer)
			end
		end
	end
end

-----------------------------------------------------------------------
GameEvents.PlayerDoTurn.Add(GoodyHutEdit)
Events.LoadScreenClose.Add(CheckGoodyHitsOnLoad)