-- 1 Coffee --------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_StrategicView (StrategicViewType, TileType, Asset)
VALUES	('ART_DEF_RESOURCE_COFFEE_BEANS', 'Resource', 'Art/Resources/Coffee/SV_CoffeeBean.dds');

INSERT INTO ArtDefine_LandmarkTypes (Type, LandmarkType, FriendlyName)
VALUES	('ART_DEF_RESOURCE_COFFEE_BEANS', 'Resource', 'Coffee Tree');

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour)
VALUES	('Any', 'Any', 0.9399999976158142, 'ART_DEF_IMPROVEMENT_NONE', 'SNAPSHOT', 'ART_DEF_RESOURCE_COFFEE_BEANS', 'Art/Resources/Coffee/Resource_Coffee.fxsxml', 1);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour)
VALUES	('Ancient', 'UnderConstruction', 0.9599999785423279, 'ART_DEF_IMPROVEMENT_PLANTATION', 'SNAPSHOT', 'ART_DEF_RESOURCE_COFFEE_BEANS', 'Art/Resources/Coffee/HB_Plantation_MID_Coffee.fxsxml', 1);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour)
VALUES	('Ancient', 'Constructed', 0.9599999785423279, 'ART_DEF_IMPROVEMENT_PLANTATION', 'SNAPSHOT', 'ART_DEF_RESOURCE_COFFEE_BEANS', 'Art/Resources/Coffee/Plantation_MID_Coffee.fxsxml', 1);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour)
VALUES	('Ancient', 'Pillaged', 0.9599999785423279, 'ART_DEF_IMPROVEMENT_PLANTATION', 'SNAPSHOT', 'ART_DEF_RESOURCE_COFFEE_BEANS', 'Art/Resources/Coffee/PL_Plantation_MID_Coffee.fxsxml', 1);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour)
VALUES	('Industrial', 'UnderConstruction', 0.9599999785423279, 'ART_DEF_IMPROVEMENT_PLANTATION', 'SNAPSHOT', 'ART_DEF_RESOURCE_COFFEE_BEANS', 'Art/Resources/Coffee/HB_Plantation_IND_Coffee.fxsxml', 1);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour)
VALUES	('Industrial', 'Constructed', 0.9599999785423279, 'ART_DEF_IMPROVEMENT_PLANTATION', 'SNAPSHOT', 'ART_DEF_RESOURCE_COFFEE_BEANS', 'Art/Resources/Coffee/Plantation_IND_coffee.fxsxml', 1);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour)
VALUES	('Industrial', 'Pillaged', 0.9599999785423279, 'ART_DEF_IMPROVEMENT_PLANTATION', 'SNAPSHOT', 'ART_DEF_RESOURCE_COFFEE_BEANS', 'Art/Resources/Coffee/PL_Plantation_IND_Coffee.fxsxml', 1);
-- 2 Titanium ---------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_LandmarkTypes (Type, LandmarkType, FriendlyName)
VALUES ('ART_DEF_RESOURCE_TITANIUM', 'Resource', 'Titanium');

INSERT INTO ArtDefine_StrategicView (StrategicViewType, TileType, Asset)
VALUES ('ART_DEF_RESOURCE_TITANIUM','Resource','Art/Resources/Titanium/SV_Titanium.dds');

INSERT INTO ArtDefine_LandmarkTypes (Type, LandmarkType, FriendlyName)
VALUES ('ART_DEF_RESOURCE_TITANIUM_HEAVY', 'Resource', 'Titanium Heavy');

INSERT INTO ArtDefine_LandmarkTypes (Type, LandmarkType, FriendlyName)
VALUES ('ART_DEF_RESOURCE_TITANIUM_HEAVY_MARSH', 'Resource', 'Titanium Heavy Marsh');

INSERT INTO ArtDefine_LandmarkTypes (Type, LandmarkType, FriendlyName)
VALUES ('ART_DEF_RESOURCE_TITANIUM_MARSH', 'Resource', 'Titanium Marsh');

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech)
VALUES ('Ancient','UnderConstruction','1','ART_DEF_IMPROVEMENT_MINE','SNAPSHOT','ART_DEF_RESOURCE_TITANIUM','Art/Resources/Titanium/HB_MED_Mine_Titanium.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech)
VALUES ('Ancient','Constructed','1','ART_DEF_IMPROVEMENT_MINE','SNAPSHOT','ART_DEF_RESOURCE_TITANIUM','Art/Resources/Titanium/MED_Mine_Titanium.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech)
VALUES ('Ancient','Pillaged','1','ART_DEF_IMPROVEMENT_MINE','SNAPSHOT','ART_DEF_RESOURCE_TITANIUM','Art/Resources/Titanium/PL_MED_Mine_Titanium.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech)
VALUES ('Industrial','UnderConstruction','1','ART_DEF_IMPROVEMENT_MINE','SNAPSHOT','ART_DEF_RESOURCE_TITANIUM','Art/Resources/Titanium/HB_IND_Mine_Titanium.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech) 
VALUES ('Industrial','Constructed','1','ART_DEF_IMPROVEMENT_MINE','SNAPSHOT','ART_DEF_RESOURCE_TITANIUM','Art/Resources/Titanium/IND_Mine_Titanium.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech) 
VALUES ('Industrial','Pillaged','1','ART_DEF_IMPROVEMENT_MINE','SNAPSHOT','ART_DEF_RESOURCE_TITANIUM','Art/Resources/Titanium/PL_IND_Mine_Titanium.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech) 
VALUES ('Any','Any','1','ART_DEF_IMPROVEMENT_NONE','SNAPSHOT','ART_DEF_RESOURCE_TITANIUM','Art/Resources/Titanium/Titanium.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech)
VALUES ('Ancient','UnderConstruction','1','ART_DEF_IMPROVEMENT_MINE','SNAPSHOT','ART_DEF_RESOURCE_TITANIUM_HEAVY','Art/Resources/Titanium/HB_MED_Mine_Titanium_Heavy.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech)
VALUES ('Ancient','Constructed','1','ART_DEF_IMPROVEMENT_MINE','SNAPSHOT','ART_DEF_RESOURCE_TITANIUM_HEAVY','Art/Resources/Titanium/MED_Mine_Titanium_Heavy.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech)
VALUES ('Ancient','Pillaged','1','ART_DEF_IMPROVEMENT_MINE','SNAPSHOT','ART_DEF_RESOURCE_TITANIUM_HEAVY','Art/Resources/Titanium/PL_MED_Mine_Titanium_Heavy.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech) 
VALUES ('Industrial','UnderConstruction','1','ART_DEF_IMPROVEMENT_MINE','SNAPSHOT','ART_DEF_RESOURCE_TITANIUM_HEAVY','Art/Resources/Titanium/HB_IND_Mine_Titanium_Heavy.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech) 
VALUES ('Industrial','Constructed','1','ART_DEF_IMPROVEMENT_MINE','SNAPSHOT','ART_DEF_RESOURCE_TITANIUM_HEAVY','Art/Resources/Titanium/IND_Mine_Titanium_Heavy.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech)
VALUES ('Industrial','Pillaged','1','ART_DEF_IMPROVEMENT_MINE','SNAPSHOT','ART_DEF_RESOURCE_TITANIUM_HEAVY','Art/Resources/Titanium/PL_IND_Mine_Titanium_Heavy.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech)
VALUES ('Any','Any','1','ART_DEF_IMPROVEMENT_NONE','SNAPSHOT','ART_DEF_RESOURCE_TITANIUM_HEAVY','Art/Resources/Titanium/Titanium_Heavy.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech)
VALUES ('Ancient','UnderConstruction','1','ART_DEF_IMPROVEMENT_MINE','SNAPSHOT','ART_DEF_RESOURCE_TITANIUM_HEAVY_MARSH','Art/Resources/Titanium/HB_MED_Mine_Titanium_Heavy.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech)
VALUES ('Ancient','Constructed','1','ART_DEF_IMPROVEMENT_MINE','SNAPSHOT','ART_DEF_RESOURCE_TITANIUM_HEAVY_MARSH','Art/Resources/Titanium/MED_Mine_Titanium_Heavy.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech)
VALUES ('Ancient','Pillaged','1','ART_DEF_IMPROVEMENT_MINE','SNAPSHOT','ART_DEF_RESOURCE_TITANIUM_HEAVY_MARSH','Art/Resources/Titanium/PL_MED_Mine_Titanium_Heavy.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech)
VALUES ('Industrial','UnderConstruction','1','ART_DEF_IMPROVEMENT_MINE','SNAPSHOT','ART_DEF_RESOURCE_TITANIUM_HEAVY_MARSH','Art/Resources/Titanium/HB_IND_Mine_Titanium_Heavy.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech)
VALUES ('Industrial','Constructed','1','ART_DEF_IMPROVEMENT_MINE','SNAPSHOT','ART_DEF_RESOURCE_TITANIUM_HEAVY_MARSH','Art/Resources/Titanium/IND_Mine_Titanium_Heavy.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech)
VALUES ('Industrial','Pillaged','1','ART_DEF_IMPROVEMENT_MINE','SNAPSHOT','ART_DEF_RESOURCE_TITANIUM_HEAVY_MARSH','Art/Resources/Titanium/PL_IND_Mine_Titanium_Heavy.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech)
VALUES ('Any','Any','1','ART_DEF_IMPROVEMENT_NONE','SNAPSHOT','ART_DEF_RESOURCE_TITANIUM_HEAVY_MARSH','Art/Resources/Titanium/Titanium_Heavy_marsh.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech)
VALUES ('Ancient','UnderConstruction','1','ART_DEF_IMPROVEMENT_MINE','SNAPSHOT','ART_DEF_RESOURCE_TITANIUM_MARSH','Art/Resources/Titanium/HB_MED_Mine_Titanium.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech)
VALUES ('Ancient','Constructed','1','ART_DEF_IMPROVEMENT_MINE','SNAPSHOT','ART_DEF_RESOURCE_TITANIUM_MARSH','Art/Resources/Titanium/MED_Mine_Titanium.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech) 
VALUES ('Ancient','Pillaged','1','ART_DEF_IMPROVEMENT_MINE','SNAPSHOT','ART_DEF_RESOURCE_TITANIUM_MARSH','Art/Resources/Titanium/PL_MED_Mine_Titanium.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech)
VALUES ('Industrial','UnderConstruction','1','ART_DEF_IMPROVEMENT_MINE','SNAPSHOT','ART_DEF_RESOURCE_TITANIUM_MARSH','Art/Resources/Titanium/HB_IND_Mine_Titanium.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech)
VALUES ('Industrial','Constructed','1','ART_DEF_IMPROVEMENT_MINE','SNAPSHOT','ART_DEF_RESOURCE_TITANIUM_MARSH','Art/Resources/Titanium/IND_Mine_Titanium.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech)
VALUES ('Industrial','Pillaged','1','ART_DEF_IMPROVEMENT_MINE','SNAPSHOT','ART_DEF_RESOURCE_TITANIUM_MARSH','Art/Resources/Titanium/PL_IND_Mine_Titanium.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech) 
VALUES ('Any','Any','1','ART_DEF_IMPROVEMENT_NONE','SNAPSHOT','ART_DEF_RESOURCE_TITANIUM_MARSH','Art/Resources/Titanium/Titanium_marsh.fxsxml','1',null);
-- 3 Poppy ----------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_LandmarkTypes (Type, LandmarkType, FriendlyName)
VALUES ('ART_DEF_RESOURCE_POPPY','Resource','Poppy');

INSERT INTO ArtDefine_StrategicView (StrategicViewType, TileType, Asset)
VALUES ('ART_DEF_RESOURCE_POPPY','Resource','Art/Resources/Poppy/SV_Poppy.dds');

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech) 
VALUES ('Any','Any','0.9399999976158142','ART_DEF_IMPROVEMENT_NONE','SNAPSHOT','ART_DEF_RESOURCE_POPPY','Art/Resources/Poppy/MAX_File/Resource_Poppy.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech) 
VALUES ('Ancient','UnderConstruction','0.9599999785423279','ART_DEF_IMPROVEMENT_PLANTATION','SNAPSHOT','ART_DEF_RESOURCE_POPPY','Art/Resources/Poppy/HB_Plantation_MID_Poppy.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech) 
VALUES ('Ancient','Constructed','0.9599999785423279','ART_DEF_IMPROVEMENT_PLANTATION','SNAPSHOT','ART_DEF_RESOURCE_POPPY','Art/Resources/Poppy/Plantation_MID_Poppy.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech) 
VALUES ('Ancient','Pillaged','0.9599999785423279','ART_DEF_IMPROVEMENT_PLANTATION','SNAPSHOT','ART_DEF_RESOURCE_POPPY','Art/Resources/Poppy/PL_Plantation_MID_Poppy.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech) 
VALUES ('Industrial','UnderConstruction','0.9599999785423279','ART_DEF_IMPROVEMENT_PLANTATION','SNAPSHOT','ART_DEF_RESOURCE_POPPY','Art/Resources/Poppy/HB_Plantation_IND_Poppy.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech) 
VALUES ('Industrial','Constructed','0.9599999785423279','ART_DEF_IMPROVEMENT_PLANTATION','SNAPSHOT','ART_DEF_RESOURCE_POPPY','Art/Resources/Poppy/Plantation_IND_Poppy.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech) 
VALUES ('Industrial','Pillaged','0.9599999785423279','ART_DEF_IMPROVEMENT_PLANTATION','SNAPSHOT','ART_DEF_RESOURCE_POPPY','Art/Resources/Poppy/PL_Plantation_IND_Poppy.fxsxml','1',null);
-- 4 Tobacco -------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_LandmarkTypes (Type, LandmarkType, FriendlyName)
VALUES ('ART_DEF_RESOURCE_TOBACCO','Resource','Tobacco');

INSERT INTO ArtDefine_StrategicView (StrategicViewType, TileType, Asset)
VALUES ('ART_DEF_RESOURCE_TOBACCO','Resource','Art/Resources/Tobacco/SV_Tobacco.dds');

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech) 
VALUES ('Any','Any','0.9800000190734863','ART_DEF_IMPROVEMENT_NONE','SNAPSHOT','ART_DEF_RESOURCE_TOBACCO','Art/Resources/Tobacco/Resource_Tobacco.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech) 
VALUES ('Ancient','UnderConstruction','0.9599999785423279','ART_DEF_IMPROVEMENT_PLANTATION','SNAPSHOT','ART_DEF_RESOURCE_TOBACCO','Art/Resources/Tobacco/HB_Plantation_MID_Tobacco.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech) 
VALUES ('Ancient','Constructed','0.9599999785423279','ART_DEF_IMPROVEMENT_PLANTATION','SNAPSHOT','ART_DEF_RESOURCE_TOBACCO','Art/Resources/Tobacco/Plantation_MID_Tobacco.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech) 
VALUES ('Ancient','Pillaged','0.9599999785423279','ART_DEF_IMPROVEMENT_PLANTATION','SNAPSHOT','ART_DEF_RESOURCE_TOBACCO','Art/Resources/Tobacco/PL_Plantation_MID_Tobacco.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech) 
VALUES ('Industrial','UnderConstruction','0.9599999785423279','ART_DEF_IMPROVEMENT_PLANTATION','SNAPSHOT','ART_DEF_RESOURCE_TOBACCO','Art/Resources/Tobacco/HB_Plantation_IND_Tobacco.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech) 
VALUES ('Industrial','Constructed','0.9599999785423279','ART_DEF_IMPROVEMENT_PLANTATION','SNAPSHOT','ART_DEF_RESOURCE_TOBACCO','Art/Resources/Tobacco/Plantation_IND_Tobacco.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech) 
VALUES ('Industrial','Pillaged','0.9599999785423279','ART_DEF_IMPROVEMENT_PLANTATION','SNAPSHOT','ART_DEF_RESOURCE_TOBACCO','Art/Resources/Tobacco/PL_Plantation_IND_Tobacco.fxsxml','1',null);
-- 5 Tin ----------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_LandmarkTypes (Type, LandmarkType, FriendlyName)
VALUES ('ART_DEF_RESOURCE_TIN','Resource','Tin');

INSERT INTO ArtDefine_StrategicView (StrategicViewType, TileType, Asset)
VALUES ('ART_DEF_RESOURCE_TIN','Resource','Art/Resources/Tin/SV_Tin.dds');

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech)
VALUES ('Any','Any','1','ART_DEF_IMPROVEMENT_NONE','SNAPSHOT','ART_DEF_RESOURCE_TIN','Art/Resources/Tin/Tin.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech)
VALUES ('Ancient','UnderConstruction','1','ART_DEF_IMPROVEMENT_MINE','SNAPSHOT','ART_DEF_RESOURCE_TIN','Art/Resources/Tin/HB_MED_Tin_Mine.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech)
VALUES ('Ancient','Constructed','1','ART_DEF_IMPROVEMENT_MINE','SNAPSHOT','ART_DEF_RESOURCE_TIN','Art/Resources/Tin/MED_Mine_Tin.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech)
VALUES ('Ancient','Pillaged','1','ART_DEF_IMPROVEMENT_MINE','SNAPSHOT','ART_DEF_RESOURCE_TIN','Art/Resources/Tin/PL_MED_Mine_Tin.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech)
VALUES ('Industrial','UnderConstruction','1','ART_DEF_IMPROVEMENT_MINE','SNAPSHOT','ART_DEF_RESOURCE_TIN','Art/Resources/Tin/HB_IND_Tin_Mine.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech)
VALUES ('Industrial','Constructed','1','ART_DEF_IMPROVEMENT_MINE','SNAPSHOT','ART_DEF_RESOURCE_TIN','Art/Resources/Tin/IND_Mine_Tin.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech) 
VALUES ('Industrial','Pillaged','1','ART_DEF_IMPROVEMENT_MINE','SNAPSHOT','ART_DEF_RESOURCE_TIN','Art/Resources/Tin/PL_MED_Mine_Tin.fxsxml','1',null);
-- 6 Aloe Vera -----------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_LandmarkTypes (Type, LandmarkType, FriendlyName)
VALUES ('ART_DEF_RESOURCE_ALOEVERA','Resource','Aloe Vera');

INSERT INTO ArtDefine_StrategicView (StrategicViewType, TileType, Asset)
VALUES ('ART_DEF_RESOURCE_ALOEVERA','Resource','Art/Resources/Aloe Vera/SV_Aloevera.dds');

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech) 
VALUES ('Any','Any','0.9399999976158142','ART_DEF_IMPROVEMENT_NONE','SNAPSHOT','ART_DEF_RESOURCE_ALOEVERA','Art/Resources/Aloe Vera/Resource_Aloevera.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech) 
VALUES ('Ancient','UnderConstruction','0.9599999785423279','ART_DEF_IMPROVEMENT_PLANTATION','SNAPSHOT','ART_DEF_RESOURCE_ALOEVERA','Art/Resources/Aloe Vera/HB_Plantation_MID_Aloevera.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech) 
VALUES ('Ancient','Constructed','0.9599999785423279','ART_DEF_IMPROVEMENT_PLANTATION','SNAPSHOT','ART_DEF_RESOURCE_ALOEVERA','Art/Resources/Aloe Vera/Plantation_MID_Aloevera.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech)  
VALUES ('Ancient','Pillaged','0.9599999785423279','ART_DEF_IMPROVEMENT_PLANTATION','SNAPSHOT','ART_DEF_RESOURCE_ALOEVERA','Art/Resources/Aloe Vera/PL_Plantation_MID_Aloevera.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech) 
VALUES ('Industrial','UnderConstruction','0.9599999785423279','ART_DEF_IMPROVEMENT_PLANTATION','SNAPSHOT','ART_DEF_RESOURCE_ALOEVERA','Art/Resources/Aloe Vera/HB_Plantation_IND_Aloevera.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech) 
VALUES ('Industrial','Constructed','0.9599999785423279','ART_DEF_IMPROVEMENT_PLANTATION','SNAPSHOT','ART_DEF_RESOURCE_ALOEVERA','Art/Resources/Aloe Vera/Plantation_IND_Aloevera.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech) 
VALUES ('Industrial','Pillaged','0.9599999785423279','ART_DEF_IMPROVEMENT_PLANTATION','SNAPSHOT','ART_DEF_RESOURCE_ALOEVERA','Art/Resources/Aloe Vera/PL_Plantation_IND_Aloevera.fxsxml','1',null);
-- 7 Amber ---------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_LandmarkTypes (Type, LandmarkType, FriendlyName)
VALUES ('ART_DEF_RESOURCE_AMBER','Resource','Amber');

INSERT INTO ArtDefine_StrategicView (StrategicViewType, TileType, Asset)
VALUES ('ART_DEF_RESOURCE_AMBER','Resource','Art/Resources/Amber/SV_Amber.dds');

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech) 
VALUES ('Any','Any','1','ART_DEF_IMPROVEMENT_NONE','SNAPSHOT','ART_DEF_RESOURCE_AMBER','Art/Resources/Amber/Amber.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech) 
VALUES ('Ancient','UnderConstruction','1','ART_DEF_IMPROVEMENT_MINE','SNAPSHOT','ART_DEF_RESOURCE_AMBER','Art/Resources/Amber/HB_MED_Amber_Mine.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech) 
VALUES ('Ancient','Constructed','1','ART_DEF_IMPROVEMENT_MINE','SNAPSHOT','ART_DEF_RESOURCE_AMBER','Art/Resources/Amber/MED_Mine_Amber.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech) 
VALUES ('Ancient','Pillaged','1','ART_DEF_IMPROVEMENT_MINE','SNAPSHOT','ART_DEF_RESOURCE_AMBER','Art/Resources/Amber/PL_MED_Mine_Amber.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech)  
VALUES ('Industrial','UnderConstruction','1','ART_DEF_IMPROVEMENT_MINE','SNAPSHOT','ART_DEF_RESOURCE_AMBER','Art/Resources/Amber/HB_IND_Amber_Mine.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech) 
VALUES ('Industrial','Constructed','1','ART_DEF_IMPROVEMENT_MINE','SNAPSHOT','ART_DEF_RESOURCE_AMBER','Art/Resources/Amber/IND_Mine_Amber.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech)  
VALUES ('Industrial','Pillaged','1','ART_DEF_IMPROVEMENT_MINE','SNAPSHOT','ART_DEF_RESOURCE_AMBER','Art/Resources/Amber/PL_MED_Mine_Amber.fxsxml','1',null);
-- 8 Manganese --------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_LandmarkTypes (Type, LandmarkType, FriendlyName)
VALUES ('ART_DEF_RESOURCE_MANGANESE','Resource','Manganese');

INSERT INTO ArtDefine_StrategicView (StrategicViewType, TileType, Asset)
VALUES ('ART_DEF_RESOURCE_MANGANESE','Resource','Art/Resources/Manganese/SV_Manganese.dds');

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech)  
VALUES ('Ancient','UnderConstruction','1','ART_DEF_IMPROVEMENT_MINE','SNAPSHOT','ART_DEF_RESOURCE_MANGANESE','Art/Resources/Manganese/HB_MED_Mine_Manganese.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech)  
VALUES ('Ancient','Constructed','1','ART_DEF_IMPROVEMENT_MINE','SNAPSHOT','ART_DEF_RESOURCE_MANGANESE','Art/Resources/Manganese/MED_Mine_Manganese.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech)  
VALUES ('Ancient','Pillaged','1','ART_DEF_IMPROVEMENT_MINE','SNAPSHOT','ART_DEF_RESOURCE_MANGANESE','Art/Resources/Manganese/PL_MED_Mine_Manganese.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech)  
VALUES ('Industrial','UnderConstruction','1','ART_DEF_IMPROVEMENT_MINE','SNAPSHOT','ART_DEF_RESOURCE_MANGANESE','Art/Resources/Manganese/HB_IND_Mine_Manganese.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech)  
VALUES ('Industrial','Constructed','1','ART_DEF_IMPROVEMENT_MINE','SNAPSHOT','ART_DEF_RESOURCE_MANGANESE','Art/Resources/Manganese/IND_Mine_Manganese.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech)  
VALUES ('Industrial','Pillaged','1','ART_DEF_IMPROVEMENT_MINE','SNAPSHOT','ART_DEF_RESOURCE_MANGANESE','Art/Resources/Manganese/PL_IND_Mine_Manganese.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech)  
VALUES ('Any','Any','1','ART_DEF_IMPROVEMENT_NONE','SNAPSHOT','ART_DEF_RESOURCE_MANGANESE','Art/Resources/Manganese/Manganese.fxsxml','1',null);
-- 9 Wood -------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_LandmarkTypes (Type, LandmarkType, FriendlyName)
VALUES ('ART_DEF_RESOURCE_WOOD','Resource','Exotic Hardwood');

INSERT INTO ArtDefine_StrategicView (StrategicViewType, TileType, Asset)
VALUES ('ART_DEF_RESOURCE_WOOD','Resource','Art/Resources/Wood/SV_Wood.dds');

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech) 
VALUES ('Any','Any','1','ART_DEF_IMPROVEMENT_NONE','SNAPSHOT','ART_DEF_RESOURCE_WOOD','Art/Resources/Wood/Resource_Wood.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech) 
VALUES ('Ancient','UnderConstruction','1','ART_DEF_IMPROVEMENT_PLANTATION','SNAPSHOT','ART_DEF_RESOURCE_WOOD','Art/Resources/Wood/HB_Plantation_MID_Wood.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech) 
VALUES ('Ancient','Constructed','1','ART_DEF_IMPROVEMENT_PLANTATION','SNAPSHOT','ART_DEF_RESOURCE_WOOD','Art/Resources/Wood/Plantation_MID_Wood.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech) 
VALUES ('Ancient','Pillaged','1','ART_DEF_IMPROVEMENT_PLANTATION','SNAPSHOT','ART_DEF_RESOURCE_WOOD','Art/Resources/Wood/PL_Plantation_MID_Wood.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech) 
VALUES ('Industrial','UnderConstruction','1','ART_DEF_IMPROVEMENT_PLANTATION','SNAPSHOT','ART_DEF_RESOURCE_WOOD','Art/Resources/Wood/HB_Plantation_IND_Wood.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech) 
VALUES ('Industrial','Constructed','1','ART_DEF_IMPROVEMENT_PLANTATION','SNAPSHOT','ART_DEF_RESOURCE_WOOD','Art/Resources/Wood/Plantation_IND_Wood.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech) 
VALUES ('Industrial','Pillaged','1','ART_DEF_IMPROVEMENT_PLANTATION','SNAPSHOT','ART_DEF_RESOURCE_WOOD','Art/Resources/Wood/PL_Plantation_IND_Wood.fxsxml','1',null);
-- 10 Oak ---------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_LandmarkTypes (Type, LandmarkType, FriendlyName)
VALUES ('ART_DEF_RESOURCE_OAK','Resource','Oak');

INSERT INTO ArtDefine_StrategicView (StrategicViewType, TileType, Asset)
VALUES ('ART_DEF_RESOURCE_OAK','Resource','Art/Resources/Oak/SV_Oak.dds');

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech) 
VALUES ('Any','Any','1','ART_DEF_IMPROVEMENT_NONE','SNAPSHOT','ART_DEF_RESOURCE_OAK','Art/Resources/Oak/Resource_Oak.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech) 
VALUES ('Ancient','UnderConstruction','1','ART_DEF_IMPROVEMENT_PLANTATION','SNAPSHOT','ART_DEF_RESOURCE_OAK','Art/Resources/Oak/HB_Plantation_MID_Oak.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech) 
VALUES ('Ancient','Constructed','1','ART_DEF_IMPROVEMENT_PLANTATION','SNAPSHOT','ART_DEF_RESOURCE_OAK','Art/Resources/Oak/Plantation_MID_Oak.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech) 
VALUES ('Ancient','Pillaged','1','ART_DEF_IMPROVEMENT_PLANTATION','SNAPSHOT','ART_DEF_RESOURCE_OAK','Art/Resources/Oak/PL_Plantation_MID_Oak.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech) 
VALUES ('Industrial','UnderConstruction','1','ART_DEF_IMPROVEMENT_PLANTATION','SNAPSHOT','ART_DEF_RESOURCE_OAK','Art/Resources/Oak/HB_Plantation_IND_Oak.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech) 
VALUES ('Industrial','Constructed','1','ART_DEF_IMPROVEMENT_PLANTATION','SNAPSHOT','ART_DEF_RESOURCE_OAK','Art/Resources/Oak/Plantation_IND_Oak.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech) 
VALUES ('Industrial','Pillaged','1','ART_DEF_IMPROVEMENT_PLANTATION','SNAPSHOT','ART_DEF_RESOURCE_OAK','Art/Resources/Oak/PL_Plantation_IND_Oak.fxsxml','1',null);
-- 11 Berries ---------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_LandmarkTypes (Type, LandmarkType, FriendlyName)
VALUES ('ART_DEF_RESOURCE_BERRIES','Resource','Berries');

INSERT INTO ArtDefine_StrategicView (StrategicViewType, TileType, Asset)
VALUES ('ART_DEF_RESOURCE_BERRIES','Resource','Art/Resources/Berries/SV_Berries.dds');

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech) 
VALUES ('Any','Any','1','ART_DEF_IMPROVEMENT_NONE','SNAPSHOT','ART_DEF_RESOURCE_BERRIES','Art/Resources/Berries/Resource_Berries.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech) 
VALUES ('Ancient','UnderConstruction','1','ART_DEF_IMPROVEMENT_PLANTATION','SNAPSHOT','ART_DEF_RESOURCE_BERRIES','Art/Resources/Berries/HB_Plantation_MID_Berries.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech) 
VALUES ('Ancient','Constructed','1','ART_DEF_IMPROVEMENT_PLANTATION','SNAPSHOT','ART_DEF_RESOURCE_BERRIES','Art/Resources/Berries/Plantation_MID_Berries.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech) 
VALUES ('Ancient','Pillaged','1','ART_DEF_IMPROVEMENT_PLANTATION','SNAPSHOT','ART_DEF_RESOURCE_BERRIES','Art/Resources/Berries/PL_Plantation_MID_Berries.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech) 
VALUES ('Industrial','UnderConstruction','1','ART_DEF_IMPROVEMENT_PLANTATION','SNAPSHOT','ART_DEF_RESOURCE_BERRIES','Art/Resources/Berries/HB_Plantation_IND_Berries.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech) 
VALUES ('Industrial','Constructed','1','ART_DEF_IMPROVEMENT_PLANTATION','SNAPSHOT','ART_DEF_RESOURCE_BERRIES','Art/Resources/Berries/Plantation_IND_Berries.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech) 
VALUES ('Industrial','Pillaged','1','ART_DEF_IMPROVEMENT_PLANTATION','SNAPSHOT','ART_DEF_RESOURCE_BERRIES','Art/Resources/Berries/PL_Plantation_IND_Berries.fxsxml','1',null);
-- 12 Mango ---------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_LandmarkTypes (Type, LandmarkType, FriendlyName)
VALUES	('ART_DEF_RESOURCE_MANGO', 'Resource', 'Mango Trees');

INSERT INTO ArtDefine_StrategicView (StrategicViewType, TileType, Asset)
VALUES ('ART_DEF_RESOURCE_MANGO','Resource','Art/Resources/Mango/SV_Mango.dds');

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour)
VALUES	('Any', 'Any', 0.9399999976158142, 'ART_DEF_IMPROVEMENT_NONE', 'SNAPSHOT', 'ART_DEF_RESOURCE_MANGO', 'Art/Resources/Mango/Resource_Mango.fxsxml', 1);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour)
VALUES	('Ancient', 'UnderConstruction', 0.9599999785423279, 'ART_DEF_IMPROVEMENT_PLANTATION', 'SNAPSHOT', 'ART_DEF_RESOURCE_MANGO', 'Art/Resources/Mango/HB_Plantation_MID_Mango.fxsxml', 1);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour)
VALUES	('Ancient', 'Constructed', 0.9599999785423279, 'ART_DEF_IMPROVEMENT_PLANTATION', 'SNAPSHOT', 'ART_DEF_RESOURCE_MANGO', 'Art/Resources/Mango/Plantation_MID_Mango.fxsxml', 1);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour)
VALUES	('Ancient', 'Pillaged', 0.9599999785423279, 'ART_DEF_IMPROVEMENT_PLANTATION', 'SNAPSHOT', 'ART_DEF_RESOURCE_MANGO', 'Art/Resources/Mango/PL_Plantation_MID_Mango.fxsxml', 1);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour)
VALUES	('Industrial', 'UnderConstruction', 0.9599999785423279, 'ART_DEF_IMPROVEMENT_PLANTATION', 'SNAPSHOT', 'ART_DEF_RESOURCE_MANGO', 'Art/Resources/Mango/HB_Plantation_IND_Mango.fxsxml', 1);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour)
VALUES	('Industrial', 'Constructed', 0.9599999785423279, 'ART_DEF_IMPROVEMENT_PLANTATION', 'SNAPSHOT', 'ART_DEF_RESOURCE_MANGO', 'Art/Resources/Mango/Plantation_IND_Mango.fxsxml', 1);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour)
VALUES	('Industrial', 'Pillaged', 0.9599999785423279, 'ART_DEF_IMPROVEMENT_PLANTATION', 'SNAPSHOT', 'ART_DEF_RESOURCE_MANGO', 'Art/Resources/Mango/PL_Plantation_IND_Mango.fxsxml', 1);
-- 13 Flax ---------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_LandmarkTypes (Type, LandmarkType, FriendlyName)
VALUES ('ART_DEF_RESOURCE_FLAX','Resource','Flax');

INSERT INTO ArtDefine_StrategicView (StrategicViewType, TileType, Asset)
VALUES ('ART_DEF_RESOURCE_FLAX','Resource','Art/Resources/Flax/SV_Flax.dds');

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech) 
VALUES ('Any','Any','0.9399999976158142','ART_DEF_IMPROVEMENT_NONE','SNAPSHOT','ART_DEF_RESOURCE_FLAX','Art/Resources/Flax/Resource_Flax.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech) 
VALUES ('Ancient','UnderConstruction','0.9599999785423279','ART_DEF_IMPROVEMENT_PLANTATION','SNAPSHOT','ART_DEF_RESOURCE_FLAX','Art/Resources/Flax/HB_Plantation_MID_Flax.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech) 
VALUES ('Ancient','Constructed','0.9599999785423279','ART_DEF_IMPROVEMENT_PLANTATION','SNAPSHOT','ART_DEF_RESOURCE_FLAX','Art/Resources/Flax/Plantation_MID_Flax.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech) 
VALUES ('Ancient','Pillaged','0.9599999785423279','ART_DEF_IMPROVEMENT_PLANTATION','SNAPSHOT','ART_DEF_RESOURCE_FLAX','Art/Resources/Flax/PL_Plantation_MID_Flax.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech) 
VALUES ('Industrial','UnderConstruction','0.9599999785423279','ART_DEF_IMPROVEMENT_PLANTATION','SNAPSHOT','ART_DEF_RESOURCE_FLAX','Art/Resources/Flax/HB_Plantation_IND_Flax.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech) 
VALUES ('Industrial','Constructed','0.9599999785423279','ART_DEF_IMPROVEMENT_PLANTATION','SNAPSHOT','ART_DEF_RESOURCE_FLAX','Art/Resources/Flax/Plantation_IND_Flax.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech) 
VALUES ('Industrial','Pillaged','0.9599999785423279','ART_DEF_IMPROVEMENT_PLANTATION','SNAPSHOT','ART_DEF_RESOURCE_FLAX','Art/Resources/Flax/PL_Plantation_IND_Flax.fxsxml','1',null);
-- 14 Cacao ---------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_LandmarkTypes (Type, LandmarkType, FriendlyName)
VALUES ('ART_DEF_RESOURCE_CACAO','Resource','Cacao Trees');

INSERT INTO ArtDefine_StrategicView (StrategicViewType, TileType, Asset)
VALUES ('ART_DEF_RESOURCE_CACAO','Resource','Art/Resources/Cacao/SV_Cacao.dds');

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech) 
VALUES ('Any','Any','0.9399999976158142','ART_DEF_IMPROVEMENT_NONE','SNAPSHOT','ART_DEF_RESOURCE_CACAO','Art/Resources/Cacao/Cacao.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech) 
VALUES ('Ancient','UnderConstruction','0.9599999785423279','ART_DEF_IMPROVEMENT_PLANTATION','SNAPSHOT','ART_DEF_RESOURCE_CACAO','Art/Resources/Cacao/Plantation_MID_Cacao_HB.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech) 
VALUES ('Ancient','Constructed','0.9599999785423279','ART_DEF_IMPROVEMENT_PLANTATION','SNAPSHOT','ART_DEF_RESOURCE_CACAO','Art/Resources/Cacao/Plantation_MID_Cacao.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech)  
VALUES ('Ancient','Pillaged','0.9599999785423279','ART_DEF_IMPROVEMENT_PLANTATION','SNAPSHOT','ART_DEF_RESOURCE_CACAO','Art/Resources/Cacao/Plantation_MID_Cacao_PIL.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech) 
VALUES ('Industrial','UnderConstruction','0.9599999785423279','ART_DEF_IMPROVEMENT_PLANTATION','SNAPSHOT','ART_DEF_RESOURCE_CACAO','Art/Resources/Cacao/Plantation_IND_Cacao_HB.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech) 
VALUES ('Industrial','Constructed','0.9599999785423279','ART_DEF_IMPROVEMENT_PLANTATION','SNAPSHOT','ART_DEF_RESOURCE_CACAO','Art/Resources/Cacao/Plantation_IND_Cacao.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech) 
VALUES ('Industrial','Pillaged','0.9599999785423279','ART_DEF_IMPROVEMENT_PLANTATION','SNAPSHOT','ART_DEF_RESOURCE_CACAO','Art/Resources/Cacao/Plantation_IND_Cacao_PIL.fxsxml','1',null);
-- 15 Barley ---------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_LandmarkTypes (Type, LandmarkType, FriendlyName)
VALUES ('ART_DEF_RESOURCE_BARLEY','Resource','Barley');

INSERT INTO ArtDefine_StrategicView (StrategicViewType, TileType, Asset)
VALUES ('ART_DEF_RESOURCE_BARLEY','Resource','Art/Resources/Barley/SV_Barley.dds');

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech) 
VALUES ('Any','Any','0.9800000190734863','ART_DEF_IMPROVEMENT_NONE','SNAPSHOT','ART_DEF_RESOURCE_BARLEY','Art/Resources/Barley/Resource_Barley.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech) 
VALUES ('Ancient','UnderConstruction','0.9599999785423279','ART_DEF_IMPROVEMENT_PLANTATION','SNAPSHOT','ART_DEF_RESOURCE_BARLEY','Art/Resources/Barley/HB_Plantation_MID_Barley.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech) 
VALUES ('Ancient','Constructed','0.9599999785423279','ART_DEF_IMPROVEMENT_PLANTATION','SNAPSHOT','ART_DEF_RESOURCE_BARLEY','Art/Resources/Barley/Plantation_MID_Barley.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech) 
VALUES ('Ancient','Pillaged','0.9599999785423279','ART_DEF_IMPROVEMENT_PLANTATION','SNAPSHOT','ART_DEF_RESOURCE_BARLEY','Art/Resources/Barley/PL_Plantation_MID_Barley.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech) 
VALUES ('Industrial','UnderConstruction','0.9599999785423279','ART_DEF_IMPROVEMENT_PLANTATION','SNAPSHOT','ART_DEF_RESOURCE_BARLEY','Art/Resources/Barley/HB_Plantation_IND_Barley.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech) 
VALUES ('Industrial','Constructed','0.9599999785423279','ART_DEF_IMPROVEMENT_PLANTATION','SNAPSHOT','ART_DEF_RESOURCE_BARLEY','Art/Resources/Barley/Plantation_IND_Barley.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech) 
VALUES ('Industrial','Pillaged','0.9599999785423279','ART_DEF_IMPROVEMENT_PLANTATION','SNAPSHOT','ART_DEF_RESOURCE_BARLEY','Art/Resources/Barley/PL_Plantation_IND_Barley.fxsxml','1',null);
-- 16 Tea ---------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_LandmarkTypes (Type, LandmarkType, FriendlyName)
VALUES ('ART_DEF_RESOURCE_TEA','Resource','Tea');

INSERT INTO ArtDefine_StrategicView (StrategicViewType, TileType, Asset)
VALUES ('ART_DEF_RESOURCE_TEA','Resource','Art/Resources/Tea/SV_Tea.dds');

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech) 
VALUES ('Any','Any','0.7399999976158142','ART_DEF_IMPROVEMENT_NONE','SNAPSHOT','ART_DEF_RESOURCE_TEA','Art/Resources/Tea/Resource_Tea.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech) 
VALUES ('Ancient','UnderConstruction','0.7599999785423279','ART_DEF_IMPROVEMENT_PLANTATION','SNAPSHOT','ART_DEF_RESOURCE_TEA','Art/Resources/Tea/HB_Plantation_MID_Tea.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech) 
VALUES ('Ancient','Constructed','0.7599999785423279','ART_DEF_IMPROVEMENT_PLANTATION','SNAPSHOT','ART_DEF_RESOURCE_TEA','Art/Resources/Tea/Plantation_MID_Tea.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech) 
VALUES ('Ancient','Pillaged','0.7599999785423279','ART_DEF_IMPROVEMENT_PLANTATION','SNAPSHOT','ART_DEF_RESOURCE_TEA','Art/Resources/Tea/PL_Plantation_MID_Tea.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech) 
VALUES ('Industrial','UnderConstruction','0.7599999785423279','ART_DEF_IMPROVEMENT_PLANTATION','SNAPSHOT','ART_DEF_RESOURCE_TEA','Art/Resources/Tea/HB_Plantation_IND_Tea.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech) 
VALUES ('Industrial','Constructed','0.7599999785423279','ART_DEF_IMPROVEMENT_PLANTATION','SNAPSHOT','ART_DEF_RESOURCE_TEA','Art/Resources/Tea/Plantation_IND_Tea.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech) 
VALUES ('Industrial','Pillaged','0.7599999785423279','ART_DEF_IMPROVEMENT_PLANTATION','SNAPSHOT','ART_DEF_RESOURCE_TEA','Art/Resources/Tea/PL_Plantation_IND_Tea.fxsxml','1',null);
-- 17 Coconut -------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_LandmarkTypes (Type, LandmarkType, FriendlyName)
VALUES ('ART_DEF_RESOURCE_COCONUT','Resource','Coconut');

INSERT INTO ArtDefine_StrategicView (StrategicViewType, TileType, Asset)
VALUES ('ART_DEF_RESOURCE_COCONUT','Resource','Art/Resources/Coconut/SV_Coconut.dds');

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech) 
VALUES ('Any','Any','1','ART_DEF_IMPROVEMENT_NONE','SNAPSHOT','ART_DEF_RESOURCE_COCONUT','Art/Resources/Coconut/Resource_Coconut.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech) 
VALUES ('Ancient','UnderConstruction','1','ART_DEF_IMPROVEMENT_PLANTATION','SNAPSHOT','ART_DEF_RESOURCE_COCONUT','Art/Resources/Coconut/HB_Plantation_MID_Coconut.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech) 
VALUES ('Ancient','Constructed','1','ART_DEF_IMPROVEMENT_PLANTATION','SNAPSHOT','ART_DEF_RESOURCE_COCONUT','Art/Resources/Coconut/Plantation_MID_Coconut.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech) 
VALUES ('Ancient','Pillaged','1','ART_DEF_IMPROVEMENT_PLANTATION','SNAPSHOT','ART_DEF_RESOURCE_COCONUT','Art/Resources/Coconut/PL_Plantation_MID_Coconut.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech) 
VALUES ('Industrial','UnderConstruction','1','ART_DEF_IMPROVEMENT_PLANTATION','SNAPSHOT','ART_DEF_RESOURCE_COCONUT','Art/Resources/Coconut/HB_Plantation_IND_Coconut.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech) 
VALUES ('Industrial','Constructed','1','ART_DEF_IMPROVEMENT_PLANTATION','SNAPSHOT','ART_DEF_RESOURCE_COCONUT','Art/Resources/Coconut/Plantation_IND_Coconut.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech) 
VALUES ('Industrial','Pillaged','1','ART_DEF_IMPROVEMENT_PLANTATION','SNAPSHOT','ART_DEF_RESOURCE_COCONUT','Art/Resources/Coconut/PL_Plantation_IND_Coconut.fxsxml','1',null);
-- 18 Rubber -------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_LandmarkTypes (Type, LandmarkType, FriendlyName)
VALUES ('ART_DEF_RESOURCE_RUBBER','Resource','Rubber');

INSERT INTO ArtDefine_StrategicView (StrategicViewType, TileType, Asset)
VALUES ('ART_DEF_RESOURCE_RUBBER','Resource','Art/Resources/Rubber/SV_Rubber.dds');

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech) 
VALUES ('Any','Any','1','ART_DEF_IMPROVEMENT_NONE','SNAPSHOT','ART_DEF_RESOURCE_RUBBER','Art/Resources/Rubber/Resource_Rubber.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech) 
VALUES ('Ancient','UnderConstruction','1','ART_DEF_IMPROVEMENT_PLANTATION','SNAPSHOT','ART_DEF_RESOURCE_RUBBER','Art/Resources/Rubber/HB_Plantation_MID_Rubber.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech) 
VALUES ('Ancient','Constructed','1','ART_DEF_IMPROVEMENT_PLANTATION','SNAPSHOT','ART_DEF_RESOURCE_RUBBER','Art/Resources/Rubber/Plantation_MID_Rubber.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech) 
VALUES ('Ancient','Pillaged','1','ART_DEF_IMPROVEMENT_PLANTATION','SNAPSHOT','ART_DEF_RESOURCE_RUBBER','Art/Resources/Rubber/PL_Plantation_MID_Rubber.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech) 
VALUES ('Industrial','UnderConstruction','1','ART_DEF_IMPROVEMENT_PLANTATION','SNAPSHOT','ART_DEF_RESOURCE_RUBBER','Art/Resources/Rubber/HB_Plantation_IND_Rubber.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech) 
VALUES ('Industrial','Constructed','1','ART_DEF_IMPROVEMENT_PLANTATION','SNAPSHOT','ART_DEF_RESOURCE_RUBBER','Art/Resources/Rubber/Plantation_IND_Rubber.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech) 
VALUES ('Industrial','Pillaged','1','ART_DEF_IMPROVEMENT_PLANTATION','SNAPSHOT','ART_DEF_RESOURCE_RUBBER','Art/Resources/Rubber/PL_Plantation_IND_Rubber.fxsxml','1',null);
-- 19 Jade -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_LandmarkTypes (Type, LandmarkType, FriendlyName)
VALUES ('ART_DEF_RESOURCE_LUBORIC', 'Resource', 'Jade') ;

INSERT INTO ArtDefine_StrategicView (StrategicViewType, TileType, Asset)
VALUES ('ART_DEF_RESOURCE_LUBORIC','Resource','Art/Resources/Jade/SV_Jade.dds');

INSERT INTO ArtDefine_Landmarks (Era,State,Scale,ImprovementType,LayoutHandler,ResourceType,Model,TerrainContour)
VALUES ('Any','Any',1.0,'ART_DEF_IMPROVEMENT_NONE','SNAPSHOT','ART_DEF_RESOURCE_LUBORIC','Art/Resources/Jade/luboric.fxsxml',1) ;

INSERT INTO ArtDefine_Landmarks (Era,State,Scale,ImprovementType,LayoutHandler,ResourceType,Model,TerrainContour)
VALUES ('Ancient','UnderConstruction',1.0,'ART_DEF_IMPROVEMENT_MINE','SNAPSHOT','ART_DEF_RESOURCE_LUBORIC','Art/Resources/Jade/hb_med_luboric_mine.fxsxml',1) ;

INSERT INTO ArtDefine_Landmarks (Era,State,Scale,ImprovementType,LayoutHandler,ResourceType,Model,TerrainContour)
VALUES ('Ancient','Constructed',1.0,'ART_DEF_IMPROVEMENT_MINE','SNAPSHOT','ART_DEF_RESOURCE_LUBORIC','Art/Resources/Jade/med_mine_luboric.fxsxml',1) ;

INSERT INTO ArtDefine_Landmarks (Era,State,Scale,ImprovementType,LayoutHandler,ResourceType,Model,TerrainContour)
VALUES ('Ancient','Pillaged',1.0,'ART_DEF_IMPROVEMENT_MINE','SNAPSHOT','ART_DEF_RESOURCE_LUBORIC','Art/Resources/Jade/pl_med_mine_luboric.fxsxml',1) ;

INSERT INTO ArtDefine_Landmarks (Era,State,Scale,ImprovementType,LayoutHandler,ResourceType,Model,TerrainContour)
VALUES ('Industrial','UnderConstruction',1.0,'ART_DEF_IMPROVEMENT_MINE','SNAPSHOT','ART_DEF_RESOURCE_LUBORIC','Art/Resources/Jade/hb_ind_luboric_mine.fxsxml',1) ;

INSERT INTO ArtDefine_Landmarks (Era,State,Scale,ImprovementType,LayoutHandler,ResourceType,Model,TerrainContour)
VALUES ('Industrial','Constructed',1.0,'ART_DEF_IMPROVEMENT_MINE','SNAPSHOT','ART_DEF_RESOURCE_LUBORIC','Art/Resources/Jade/ind_mine_luboric.fxsxml',1) ;

INSERT INTO ArtDefine_Landmarks (Era,State,Scale,ImprovementType,LayoutHandler,ResourceType,Model,TerrainContour)
VALUES ('Industrial','Pillaged',1.0,'ART_DEF_IMPROVEMENT_MINE','SNAPSHOT','ART_DEF_RESOURCE_LUBORIC','Art/Resources/Jade/pl_ind_mine_luboric.fxsxml',1) ;
-- 20 Corn -----------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_LandmarkTypes (Type, LandmarkType, FriendlyName)
VALUES ('ART_DEF_RESOURCE_CORN','Resource','Corn');

INSERT INTO ArtDefine_StrategicView (StrategicViewType, TileType, Asset)
VALUES ('ART_DEF_RESOURCE_CORN','Resource','Art/Resources/Corn/SV_Corn.dds');

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech) 
VALUES ('Any','Any','0.9399999976158142','ART_DEF_IMPROVEMENT_NONE','SNAPSHOT','ART_DEF_RESOURCE_CORN','Art/Resources/Corn/Resource_Corn.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech) 
VALUES ('Ancient','UnderConstruction','0.9599999785423279','ART_DEF_IMPROVEMENT_PLANTATION','SNAPSHOT','ART_DEF_RESOURCE_CORN','Art/Resources/Corn/HB_Plantation_MID_Corn.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech) 
VALUES ('Ancient','Constructed','0.9599999785423279','ART_DEF_IMPROVEMENT_PLANTATION','SNAPSHOT','ART_DEF_RESOURCE_CORN','Art/Resources/Corn/Plantation_MID_Corn.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech)  
VALUES ('Ancient','Pillaged','0.9599999785423279','ART_DEF_IMPROVEMENT_PLANTATION','SNAPSHOT','ART_DEF_RESOURCE_CORN','Art/Resources/Corn/PL_Plantation_MID_Corn.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech) 
VALUES ('Industrial','UnderConstruction','0.9599999785423279','ART_DEF_IMPROVEMENT_PLANTATION','SNAPSHOT','ART_DEF_RESOURCE_CORN','Art/Resources/Corn/HB_Plantation_IND_Corn.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech) 
VALUES ('Industrial','Constructed','0.9599999785423279','ART_DEF_IMPROVEMENT_PLANTATION','SNAPSHOT','ART_DEF_RESOURCE_CORN','Art/Resources/Corn/Plantation_IND_Corn.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech) 
VALUES ('Industrial','Pillaged','0.9599999785423279','ART_DEF_IMPROVEMENT_PLANTATION','SNAPSHOT','ART_DEF_RESOURCE_CORN','Art/Resources/Corn/PL_Plantation_IND_Corn.fxsxml','1',null);

-- Olives --------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_StrategicView (StrategicViewType, TileType, Asset)
	VALUES	('ART_DEF_RESOURCE_OLIVES', 'Resource', 'SV_Olives.dds');

INSERT INTO ArtDefine_LandmarkTypes (Type, LandmarkType, FriendlyName)
	VALUES	('ART_DEF_RESOURCE_OLIVES', 'Resource', 'Olives');

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour)
	VALUES	('Any', 'Any', 0.9399999976158142, 'ART_DEF_IMPROVEMENT_NONE', 'SNAPSHOT', 'ART_DEF_RESOURCE_OLIVES', 'Resource_Spice.fxsxml', 1);
INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour)
	VALUES	('Ancient', 'UnderConstruction', 0.9599999785423279, 'ART_DEF_IMPROVEMENT_PLANTATION', 'SNAPSHOT', 'ART_DEF_RESOURCE_OLIVES', 'HB_Plantation_MID_Spice.fxsxml', 1);
INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour)
	VALUES	('Ancient', 'Constructed', 0.9599999785423279, 'ART_DEF_IMPROVEMENT_PLANTATION', 'SNAPSHOT', 'ART_DEF_RESOURCE_OLIVES', 'Plantation_MID_Spice.fxsxml', 1);
INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour)
	VALUES	('Ancient', 'Pillaged', 0.9599999785423279, 'ART_DEF_IMPROVEMENT_PLANTATION', 'SNAPSHOT', 'ART_DEF_RESOURCE_OLIVES', 'PL_Plantation_MID_Spice.fxsxml', 1);
INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour)
	VALUES	('Industrial', 'UnderConstruction', 0.9599999785423279, 'ART_DEF_IMPROVEMENT_PLANTATION', 'SNAPSHOT', 'ART_DEF_RESOURCE_OLIVES', 'HB_Plantation_IND_Spice.fxsxml', 1);
INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour)
	VALUES	('Industrial', 'Constructed', 0.9599999785423279, 'ART_DEF_IMPROVEMENT_PLANTATION', 'SNAPSHOT', 'ART_DEF_RESOURCE_OLIVES', 'Plantation_IND_Spice.fxsxml', 1);
INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour)
	VALUES	('Industrial', 'Pillaged', 0.9599999785423279, 'ART_DEF_IMPROVEMENT_PLANTATION', 'SNAPSHOT', 'ART_DEF_RESOURCE_OLIVES', 'PL_Plantation_IND_Spice.fxsxml', 1);

-- Platinum --------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_StrategicView (StrategicViewType, TileType, Asset)
	VALUES	('ART_DEF_RESOURCE_PLATINUM', 'Resource', 'SV_Platinum.dds');

INSERT INTO ArtDefine_LandmarkTypes (Type, LandmarkType, FriendlyName)
	VALUES	('ART_DEF_RESOURCE_PLATINUM', 'Resource', 'Platinum');

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour)
	VALUES	('Any', 'Any', 1, 'ART_DEF_IMPROVEMENT_NONE', 'SNAPSHOT', 'ART_DEF_RESOURCE_PLATINUM', 'Aluminum.fxsxml', 1);
INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour)
	VALUES	('Ancient', 'UnderConstruction', 1, 'ART_DEF_IMPROVEMENT_MINE', 'SNAPSHOT', 'ART_DEF_RESOURCE_PLATINUM', 'HB_MED_Mine_Aluminum.fxsxml', 1);
INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour)
	VALUES	('Ancient', 'Constructed', 1, 'ART_DEF_IMPROVEMENT_MINE', 'SNAPSHOT', 'ART_DEF_RESOURCE_PLATINUM', 'MED_Mine_Aluminum.fxsxml', 1);
INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour)
	VALUES	('Ancient', 'Pillaged', 1, 'ART_DEF_IMPROVEMENT_MINE', 'SNAPSHOT', 'ART_DEF_RESOURCE_PLATINUM', 'PL_MED_Mine_Aluminum.fxsxml', 1);
INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour)
	VALUES	('Industrial', 'UnderConstruction', 1, 'ART_DEF_IMPROVEMENT_MINE', 'SNAPSHOT', 'ART_DEF_RESOURCE_PLATINUM', 'HB_IND_Mine_Aluminum.fxsxml', 1);
INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour)
	VALUES	('Industrial', 'Constructed', 1, 'ART_DEF_IMPROVEMENT_MINE', 'SNAPSHOT', 'ART_DEF_RESOURCE_PLATINUM', 'IND_Mine_Aluminum.fxsxml', 1);
INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour)
	VALUES	('Industrial', 'Pillaged', 1, 'ART_DEF_IMPROVEMENT_MINE', 'SNAPSHOT', 'ART_DEF_RESOURCE_PLATINUM', 'PL_IND_Mine_Aluminum.fxsxml', 1);


-- Sulfur --------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_StrategicView (StrategicViewType, TileType, Asset)
	VALUES	('ART_DEF_RESOURCE_SULFUR', 'Resource', 'SV_Sulfur.dds');

INSERT INTO ArtDefine_LandmarkTypes (Type, LandmarkType, FriendlyName)
	VALUES	('ART_DEF_RESOURCE_SULFUR', 'Resource', 'Sulfur');

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour)
	VALUES	('Any', 'Any', 1, 'ART_DEF_IMPROVEMENT_NONE', 'SNAPSHOT', 'ART_DEF_RESOURCE_SULFUR', 'Art/Resources/Amber/Amber.fxsxml', 1);
INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour)
	VALUES	('Ancient', 'UnderConstruction', 1, 'ART_DEF_IMPROVEMENT_MINE', 'SNAPSHOT', 'ART_DEF_RESOURCE_SULFUR', 'Art/Resources/Amber/HB_MED_Amber_Mine.fxsxml', 1);
INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour)
	VALUES	('Ancient', 'Constructed', 1, 'ART_DEF_IMPROVEMENT_MINE', 'SNAPSHOT', 'ART_DEF_RESOURCE_SULFUR', 'Art/Resources/Amber/MED_Mine_Amber.fxsxml', 1);
INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour)
	VALUES	('Ancient', 'Pillaged', 1, 'ART_DEF_IMPROVEMENT_MINE', 'SNAPSHOT', 'ART_DEF_RESOURCE_SULFUR', 'Art/Resources/Amber/PL_MED_Mine_Amber.fxsxml', 1);
INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour)
	VALUES	('Industrial', 'UnderConstruction', 1, 'ART_DEF_IMPROVEMENT_MINE', 'SNAPSHOT', 'ART_DEF_RESOURCE_SULFUR', 'Art/Resources/Amber/HB_IND_Amber_Mine.fxsxml', 1);
INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour)
	VALUES	('Industrial', 'Constructed', 1, 'ART_DEF_IMPROVEMENT_MINE', 'SNAPSHOT', 'ART_DEF_RESOURCE_SULFUR', 'Art/Resources/Amber/IND_Mine_Amber.fxsxml', 1);
INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour)
	VALUES	('Industrial', 'Pillaged', 1, 'ART_DEF_IMPROVEMENT_MINE', 'SNAPSHOT', 'ART_DEF_RESOURCE_SULFUR', 'Art/Resources/Amber/PL_IND_Mine_Amber.fxsxml', 1);