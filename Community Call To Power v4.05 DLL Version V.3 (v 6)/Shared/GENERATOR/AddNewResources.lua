-- Resource Generator V4.0
-- Author: Deep_Blue
--------------------------------------------------------------
include("ResNewGenerator.lua")

function PlaceModResources()
	
	
	
	OnMapResourceGenerator("RESOURCE_BISON", {"TERRAIN_TUNDRA", "TERRAIN_SNOW"} );
	OnMapResourceGenerator("RESOURCE_TEA", {"TERRAIN_DESERT", "TERRAIN_TUNDRA", "TERRAIN_SNOW"} );
	OnMapResourceGenerator("RESOURCE_FLAX", {"TERRAIN_DESERT", "TERRAIN_SNOW"} );
	OnMapResourceGenerator("RESOURCE_MANGO", {"TERRAIN_TUNDRA", "TERRAIN_SNOW"} );
	OnMapResourceGenerator("RESOURCE_BERRIES", {"TERRAIN_TUNDRA", "TERRAIN_SNOW"} );
	OnMapResourceGenerator("RESOURCE_BARLEY", {"TERRAIN_TUNDRA", "TERRAIN_SNOW"} );
	OnMapResourceGenerator("RESOURCE_CACAO", {"TERRAIN_TUNDRA", "TERRAIN_SNOW"} );
	OnMapResourceGenerator("RESOURCE_TIN");
	OnMapResourceGenerator("RESOURCE_TOBACCO", {"TERRAIN_DESERT", "TERRAIN_TUNDRA", "TERRAIN_SNOW"} );
	OnMapResourceGenerator("RESOURCE_AMBER", {"TERRAIN_DESERT", "TERRAIN_SNOW"} );
	OnMapResourceGenerator("RESOURCE_MANGANESE");
	OnMapResourceGenerator("RESOURCE_ALOE_VERA", {"TERRAIN_TUNDRA", "TERRAIN_SNOW"} );
	OnMapResourceGenerator("RESOURCE_TITANIUM");
	OnMapResourceGenerator("RESOURCE_POPPY", {"TERRAIN_TUNDRA", "TERRAIN_SNOW"} );
	OnMapResourceGenerator("RESOURCE_COFFEE", {"TERRAIN_DESERT", "TERRAIN_TUNDRA", "TERRAIN_SNOW"} );
	OnMapResourceGenerator("RESOURCE_WOOD", {"TERRAIN_DESERT", "TERRAIN_SNOW"} );
	OnMapResourceGenerator("RESOURCE_OAK", {"TERRAIN_DESERT", "TERRAIN_SNOW"} );
	OnMapResourceGenerator("RESOURCE_JADE");
	OnMapResourceGenerator("RESOURCE_RUBBER", {"TERRAIN_TUNDRA","TERRAIN_DESERT", "TERRAIN_SNOW"} );
	OnMapResourceGenerator("RESOURCE_COCONUT", {"TERRAIN_TUNDRA", "TERRAIN_SNOW"} );
	OnMapResourceGenerator("RESOURCE_OLIVES", {"TERRAIN_TUNDRA", "TERRAIN_SNOW"} );
	OnMapResourceGenerator("RESOURCE_PLATINUM");
	OnMapResourceGenerator("RESOURCE_SQUID");
	OnMapResourceGenerator("RESOURCE_HONEY", {"TERRAIN_SNOW"} );
	OnMapResourceGenerator("RESOURCE_CORN", {"TERRAIN_DESERT", "TERRAIN_TUNDRA", "TERRAIN_SNOW"} );
	OnMapResourceGenerator("RESOURCE_SULFUR");
	
end

--[[ 

this function will automatically spread the resource on the map according to:
1) map size
2) number of civilizations in the game
3) Pre-game resource options (sparse,standard,..)
4) defined terrain&feature Booleans in resource xml file.
You can add as many resources as you want, example:
OnMapResourceGenerator("RESOURCE_MyResource1");
OnMapResourceGenerator("RESOURCE_MyResource2");

Advanced Options: 
----------------
you can use additional option with the function:

OnMapResourceGenerator("RESOURCE_MyResource" , Excludes )

Excludes is a table containing any Terrain or feature you do not want, put them in any order but 
they must have exact Type string in Civ5Terrains.xml and Civ5Features.xml otherwise they will be igonred.

Example:

OnMapResourceGenerator("RESOURCE_COPPER" , {"TERRAIN_DESERT", "TERRAIN_PLAINS"} )

--]]