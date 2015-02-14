-- Message on religion founding
-- Author: Machiavelli
-- DateCreated: 6/2/2014 8:36:06 PM
--------------------------------------------------------------
-- Prints a message to fire turner when a religion is founded
function MessageOnReligionFounding(founderID, iX, iY, eOldReligion, eNewReligion)
	local founder = Players[founderID];

	print(founder.GetName() .. " has founded a religion.");
end
LuaEvents.ReligionFoundedEvent.Add(MessageOnReligionFounding);