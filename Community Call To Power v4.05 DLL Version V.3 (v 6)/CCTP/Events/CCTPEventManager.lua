-- Event Manager
-- Author: FiresForever
-- DateCreated: 27/08/2012
--------------------------------------------------------------

include( "CustomNotification.lua" );
include( "APSPlotEvents.lua" );


LuaEvents.NotificationAddin({ name = "TreeGrowthForest", type = "CNOTIFICATION_TREEGROWTHFOREST" })
LuaEvents.NotificationAddin({ name = "TreeGrowthJungle", type = "CNOTIFICATION_TREEGROWTHJUNGLE" })

function CCTP_APTS_Events()
	print ("Start CCTP APTS Events")
	-- Lets run the plot based events
	plotEvents()

end
Events.ActivePlayerTurnStart.Add(CCTP_APTS_Events);

