--------------------------------------------------------------------------------------------------
--Improvements 
--------------------------------------------------------------------------------------------------
INSERT INTO Improvements (Type,		DestroyedWhenPillaged,	OutsideBorders,	Description,						Help,											Civilopedia,									ArtDefineTag,						IconAtlas,			PortraitIndex)
SELECT 'IMPROVEMENT_PLANT_FOREST',	1,						1,				'TXT_KEY_IMPROVEMENT_PLANT_FOREST',	'TXT_KEY_CIV5_IMPROVEMENTS_PLANT_FOREST_HELP',	'TXT_KEY_CIV5_IMPROVEMENTS_PLANT_FOREST_TEXT',	'ART_DEF_IMPROVEMENT_PLANT_FOREST',	'REFOREST_ATLAS',	0;

--------------------------------------------------------------------------------------------------
--Improvement Yields
--------------------------------------------------------------------------------------------------
INSERT INTO Improvement_Yields (ImprovementType,		YieldType,				Yield)
SELECT 'IMPROVEMENT_PLANT_FOREST',						'YIELD_PRODUCTION',		1;

--------------------------------------------------------------------------------------------------
--Improvement Terrains
--------------------------------------------------------------------------------------------------
INSERT INTO Improvement_ValidTerrains (ImprovementType,	TerrainType)
SELECT 'IMPROVEMENT_PLANT_FOREST',						'TERRAIN_GRASS' UNION ALL
SELECT 'IMPROVEMENT_PLANT_FOREST',						'TERRAIN_TUNDRA';

--------------------------------------------------------------------------------------------------
--Improvement Features
--------------------------------------------------------------------------------------------------
INSERT INTO Improvement_ValidFeatures (ImprovementType,	FeatureType)
SELECT 'IMPROVEMENT_PLANT_FOREST',						'FEATURE_FOREST' UNION ALL
SELECT 'IMPROVEMENT_PLANT_FOREST',						'FEATURE_MARSH';

--------------------------------------------------------------------------------------------------
--Builds 
--------------------------------------------------------------------------------------------------
INSERT INTO Builds (Type,	PrereqTech,				Time,	ImprovementType,			Description,			Help,							Recommendation,				EntityEvent,				HotKey,		OrderPriority,	IconAtlas,						IconIndex)
SELECT 'BUILD_FOREST',		'TECH_FERTILIZER',		500,	'IMPROVEMENT_PLANT_FOREST',	'TXT_KEY_BUILD_FOREST',	'TXT_KEY_BUILD_FOREST_HELP',	'TXT_KEY_BUILD_FOREST_REC',	'ENTITY_EVENT_IRRIGATE',	'KB_F',		37,				'UNIT_ACTION_REFOREST_ATLAS',	0;

--------------------------------------------------------------------------------------------------
--Build Features 
--------------------------------------------------------------------------------------------------
INSERT INTO BuildFeatures (BuildType,	FeatureType,		PrereqTech,				Time,   Production,	Remove)
SELECT 'BUILD_FOREST',					'FEATURE_FOREST',	'TECH_FERTILIZER',		700,	40,			1 UNION ALL
SELECT 'BUILD_FOREST',					'FEATURE_MARSH',	'TECH_FERTILIZER',		700,	0,			1;

--------------------------------------------------------------------------------------------------
--Unit Builds 
--------------------------------------------------------------------------------------------------
INSERT INTO Unit_Builds (UnitType,	BuildType)
SELECT 'UNIT_WORKER',				'BUILD_FOREST' UNION ALL
SELECT 'UNIT_CIVIL_ENGINEER',		'BUILD_FOREST';

--------------------------------------------------------------------------------------------------
--Icon Atlas 
--------------------------------------------------------------------------------------------------
INSERT INTO IconTextureAtlases (Atlas,	IconSize,	IconsPerRow,	IconsPerColumn,	Filename)
SELECT 'REFOREST_ATLAS',				256,		1,				1,				'ForestAtlas256.dds' UNION ALL
SELECT 'REFOREST_ATLAS',				64,			1,				1,				'ForestAtlas64.dds' UNION ALL
SELECT 'UNIT_ACTION_REFOREST_ATLAS',	64,			8,				8,				'UnitAction64_Forest.dds' UNION ALL
SELECT 'UNIT_ACTION_REFOREST_ATLAS',	45,			8,				8,				'UnitAction45_Forest.dds';

--------------------------------------------------------------------------------------------------
--Artdefines
-------------------------------------------------------------------------------------------------- 
INSERT INTO ArtDefine_StrategicView (StrategicViewType, TileType,			Asset)
SELECT 'ART_DEF_IMPROVEMENT_PLANT_FOREST',				'Improvement',		'SV_PlantForest.dds';

INSERT INTO ArtDefine_LandmarkTypes (Type,				LandmarkType,		FriendlyName)
SELECT 'ART_DEF_IMPROVEMENT_PLANT_FOREST',				'Improvement',		'PlantForest';

INSERT INTO ArtDefine_Landmarks (Era,	State,					Scale,	ImprovementType,					LayoutHandler,	ResourceType,				Model,								TerrainContour)
SELECT 'Any',							'UnderConstruction',	0.86,	'ART_DEF_IMPROVEMENT_PLANT_FOREST', 'SNAPSHOT',		'ART_DEF_RESOURCE_NONE',	'HB_Plantation_MID_Incense.fxsxml', 1 UNION ALL
SELECT 'Any',							'Constructed',			0.86,	'ART_DEF_IMPROVEMENT_PLANT_FOREST', 'SNAPSHOT',		'ART_DEF_RESOURCE_NONE',	'Plantation_MID_Incense.fxsxml',	1 UNION ALL
SELECT 'Any',							'Pillaged',				0.86,	'ART_DEF_IMPROVEMENT_PLANT_FOREST', 'SNAPSHOT',		'ART_DEF_RESOURCE_NONE',	'PL_Plantation_MID_Incense.fxsxml', 1;