--------------------------------------------------------------------------------------------------
--GameOptions
--------------------------------------------------------------------------------------------------
INSERT INTO GameOptions (Type,			Description,								Help,											SupportsMultiplayer)	
SELECT 'GAMEOPTION_OCEAN_CITIES_EARLY',	'TXT_KEY_GAMEOPTION_OCEAN_CITIES_EARLY',	'TXT_KEY_GAMEOPTION_OCEAN_CITIES_EARLY_HELP',	0;
--------------------------------------------------------------------------------------------------
--Improvement Art
--------------------------------------------------------------------------------------------------
INSERT INTO Improvements (Type,		Permanent,	GraphicalOnly,	AllowsWalkWater, Description,						Help,								Civilopedia,							ArtDefineTag)
SELECT 'IMPROVEMENT_OCEAN_CITY',	1,			1,				1,				'TXT_KEY_IMPROVEMENT_OCEAN_CITY',	'TXT_KEY_IMPROVEMENT_OCEAN_CITY',	'TXT_KEY_IMPROVEMENT_OCEAN_CITY_PEDIA',	'ART_DEF_IMPROVEMENT_OCEAN_CITY';

UPDATE Improvements SET ArtDefineTag = 'ART_DEF_IMPROVEMENT_FORT' WHERE Type = 'IMPROVEMENT_CITADEL';

INSERT INTO ArtDefine_LandmarkTypes (Type,	LandmarkType,	FriendlyName)
SELECT 'ART_DEF_IMPROVEMENT_OCEAN_CITY',	'Improvement',	'OceanCity';

INSERT INTO ArtDefine_Landmarks (ImprovementType,	Scale,	State,			Era,		LayoutHandler,	ResourceType,			Model,						TerrainContour)
SELECT 'ART_DEF_IMPROVEMENT_OCEAN_CITY',			0.9,	'Constructed',	'Any',		'SNAPSHOT',		'ART_DEF_RESOURCE_ALL',	'ArcologyTest2.fxsxml',		1 UNION ALL
SELECT 'ART_DEF_IMPROVEMENT_OCEAN_CITY',			0.9,	'Pillaged',		'Any',		'SNAPSHOT',		'ART_DEF_RESOURCE_ALL',	'ArcologyTest2_PL.fxsxml',	1;
--------------------------------------------------------------------------------------------------
--Buildings
--------------------------------------------------------------------------------------------------
INSERT INTO BuildingClasses (Type,		DefaultBuilding,			MaxPlayerInstances,	Description)
SELECT 'BUILDINGCLASS_AC_OCEAN_CITY',	'BUILDING_AC_OCEAN_CITY',	-1,					'TXT_KEY_BUILDING_AC_OCEAN_CITY';

INSERT INTO Buildings (Type,		BuildingClass,					NukeModifier,	ConquestProb,	Cost,	IconAtlas,				PortraitIndex,	Description,						Help,									Strategy,								Civilopedia,							ArtDefineTag,					MinAreaSize) 
SELECT 'BUILDING_AC_OCEAN_CITY',	'BUILDINGCLASS_AC_OCEAN_CITY',	-20,			100,			-1,		'AC_OCEAN_CITY_ATLAS',	0,				'TXT_KEY_BUILDING_AC_OCEAN_CITY',	'TXT_KEY_BUILDING_AC_OCEAN_CITY_HELP',	'TXT_KEY_BUILDING_AC_OCEAN_CITY_HELP',	'TXT_KEY_BUILDING_AC_OCEAN_CITY_PEDIA',	'ART_DEF_BUILDING_WATERMILL',	-1;

INSERT INTO Building_DomainFreeExperiences (BuildingType,		DomainType,			Experience)
SELECT 'BUILDING_AC_OCEAN_CITY',								'DOMAIN_SEA',		15;

INSERT INTO Building_DomainProductionModifiers (BuildingType,	DomainType,			Modifier) 
SELECT 'BUILDING_AC_OCEAN_CITY',								'DOMAIN_SEA',		15;

INSERT INTO Building_SeaPlotYieldChanges (BuildingType,			YieldType,			Yield) 
SELECT 'BUILDING_AC_OCEAN_CITY',								'YIELD_FOOD',		1;

INSERT INTO Building_SeaResourceYieldChanges (BuildingType,		YieldType,			Yield) 
SELECT 'BUILDING_AC_OCEAN_CITY',								'YIELD_GOLD',		1;
--------------------------------------------------------------------------------------------------
--Policy workaround
--------------------------------------------------------------------------------------------------
INSERT INTO Policy_BuildingClassYieldChanges (PolicyType,	BuildingClassType,				YieldType,			YieldChange) 
SELECT 'POLICY_MARITIME_INFRASTRUCTURE',					'BUILDINGCLASS_AC_OCEAN_CITY',	'YIELD_PRODUCTION',	3;
--------------------------------------------------------------------------------------------------
--Icon Atlas 
--------------------------------------------------------------------------------------------------
INSERT INTO IconTextureAtlases (Atlas,	IconSize,	IconsPerRow,	IconsPerColumn,	Filename)
SELECT 'AC_OCEAN_CITY_ATLAS',			256,		1,				1,				'AC_OceanCityAtlas256.dds' UNION ALL
SELECT 'AC_OCEAN_CITY_ATLAS',			128,		1,				1,				'AC_OceanCityAtlas128.dds' UNION ALL
SELECT 'AC_OCEAN_CITY_ATLAS',			80,			1,				1,				'AC_OceanCityAtlas80.dds' UNION ALL
SELECT 'AC_OCEAN_CITY_ATLAS',			64,			1,				1,				'AC_OceanCityAtlas64.dds' UNION ALL
SELECT 'AC_OCEAN_CITY_ATLAS',			45,			1,				1,				'AC_OceanCityAtlas45.dds';
--------------------------------------------------------------------------------------------------
--Buildings (Workaround for Coastal Buildings)
-------------------------------------------------------------------------------------------------- 
ALTER TABLE Buildings ADD COLUMN OceanCityWater boolean DEFAULT 0;
UPDATE Buildings SET Water = 0, OceanCityWater = 1 WHERE Water = 1;

CREATE TRIGGER OceanCityMod01
AFTER INSERT ON Buildings
WHEN NEW.Water = 1
BEGIN
	UPDATE Buildings
    SET Water = 0, OceanCityWater = 1
    WHERE Water = 1;
END;