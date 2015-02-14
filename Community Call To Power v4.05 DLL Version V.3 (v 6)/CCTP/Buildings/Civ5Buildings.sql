
-- Change free BuildingClass from Palace to Chieftain's Hut

UPDATE Civilization_FreeBuildingClasses 
SET BuildingClassType='BUILDINGCLASS_TREE'
WHERE BuildingClassType='BUILDINGCLASS_PALACE';

-- Change PrereqTechs for Palace, Shrine and Monument BuildingClasses:

UPDATE Buildings
SET PrereqTech='TECH_ELITE', Cost= 40
WHERE BuildingClass='BUILDINGCLASS_PALACE';


-- Raise/add Flavors for the Palace to force AI to build it:

UPDATE Building_Flavors
SET Flavor='150'
WHERE BuildingType='BUILDING_PALACE';

INSERT INTO "Building_Flavors" ('BuildingType', 'FlavorType',  'Flavor')
	VALUES	("BUILDING_PALACE", "FLAVOR_PRODUCTION", "150");
INSERT INTO "Building_Flavors" ('BuildingType', 'FlavorType',  'Flavor')
	VALUES	("BUILDING_PALACE", "FLAVOR_EXPANSION", "150");

