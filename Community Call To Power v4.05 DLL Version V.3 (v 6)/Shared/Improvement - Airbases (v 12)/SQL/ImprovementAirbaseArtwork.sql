INSERT INTO ArtDefine_LandmarkTypes(Type, LandmarkType, FriendlyName)
SELECT 'ART_DEF_IMPROVEMENT_AIRBASE', 'Improvement', 'Airbase';

INSERT INTO ArtDefine_Landmarks(Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour)
SELECT 'Any', 'UnderConstruction', 1.0,  'ART_DEF_IMPROVEMENT_AIRBASE', 'SNAPSHOT', 'ART_DEF_RESOURCE_ALL', 'Airfield_Era1_HB.fxsxml', 1 UNION ALL
SELECT 'Any', 'Constructed',       1.0,  'ART_DEF_IMPROVEMENT_AIRBASE', 'SNAPSHOT', 'ART_DEF_RESOURCE_ALL', 'Airfield_Era1.fxsxml',    1 UNION ALL
SELECT 'Any', 'Pillaged',          1.0,  'ART_DEF_IMPROVEMENT_AIRBASE', 'SNAPSHOT', 'ART_DEF_RESOURCE_ALL', 'Airfield_Era1_PL.fxsxml', 1;

INSERT INTO ArtDefine_Landmarks(Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech)
SELECT 'Any', 'UnderConstruction', 1.25, 'ART_DEF_IMPROVEMENT_AIRBASE', 'SNAPSHOT', 'ART_DEF_RESOURCE_ALL', 'Airfield_Era2_HB.fxsxml', 1, 'TECH_RADAR' UNION ALL
SELECT 'Any', 'Constructed',       1.25, 'ART_DEF_IMPROVEMENT_AIRBASE', 'SNAPSHOT', 'ART_DEF_RESOURCE_ALL', 'Airfield_Era2.fxsxml',    1, 'TECH_RADAR' UNION ALL
SELECT 'Any', 'Pillaged',          1.25, 'ART_DEF_IMPROVEMENT_AIRBASE', 'SNAPSHOT', 'ART_DEF_RESOURCE_ALL', 'Airfield_Era2_PL.fxsxml', 1, 'TECH_RADAR';

INSERT INTO ArtDefine_StrategicView(StrategicViewType, TileType, Asset)
SELECT 'ART_DEF_IMPROVEMENT_AIRBASE', 'Improvement', 'SV_Airbase.dds';