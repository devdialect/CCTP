INSERT INTO Yields (Type,	Description,				IconString,			MinCity,	AIWeightPercent)
SELECT 'YIELD_ORDER',		'TXT_KEY_YIELD_ORDER',		'[ICON_ORDER]',	0,			100;

-----------------------------------------------------------------------------------------------------
--Font Mapping
----------------------------------------------------------------------------------------------------- 
INSERT INTO IconFontTextures (IconFontTexture,	IconFontTextureFile)
SELECT 'ICON_FONT_TEXTURE_ORDER',				'Order-FontIcons';

INSERT INTO IconFontMapping (IconName,	IconFontTexture,				IconMapping)
--SELECT 'ICON_ORDER',					'ICON_FONT_TEXTURE_ORDER',		1 UNION ALL
SELECT 'ICON_DISORDER',					'ICON_FONT_TEXTURE_ORDER',		2;

-----------------------------------------------------------------------------------------------------
--Text
----------------------------------------------------------------------------------------------------- 
INSERT INTO Language_en_US	(Tag,								Text)
SELECT  'TXT_KEY_YIELD_ORDER', 'Represents the level of crime and order';

--------------------------------------------------------------------------------------------------
--Building Yield Changes
--------------------------------------------------------------------------------------------------
INSERT INTO Building_YieldChanges (BuildingType,			YieldType,				Yield)
SELECT 'BUILDING_THEO',					     'YIELD_ORDER',			 2 UNION ALL
SELECT 'BUILDING_COURTHOUSE',				 'YIELD_ORDER',			 2 UNION ALL
SELECT 'BUILDING_RCOURT',				     'YIELD_ORDER',			 4 UNION ALL
SELECT 'BUILDING_FEUDAL',				     'YIELD_ORDER',			 2 UNION ALL
SELECT 'BUILDING_IMPERIALER_GERICHTSHOF',	 'YIELD_ORDER',			 2 UNION ALL
SELECT 'BUILDING_BANK',				         'YIELD_ORDER',			-2 UNION ALL
SELECT 'BUILDING_CORP',				         'YIELD_ORDER',			 1 UNION ALL
SELECT 'BUILDING_SCULT',				     'YIELD_ORDER',			 2 UNION ALL
SELECT 'BUILDING_HANDLER',				     'YIELD_ORDER',			-2 UNION ALL
SELECT 'BUILDING_CATAL',				     'YIELD_ORDER',			 2 UNION ALL
SELECT 'BUILDING_TAXCOLLECTOR',				 'YIELD_ORDER',			-3 UNION ALL
SELECT 'BUILDING_CONSTABLE',				 'YIELD_ORDER',			 4 UNION ALL
SELECT 'BUILDING_ALCATRAZ',				     'YIELD_ORDER',			 8 UNION ALL
SELECT 'BUILDING_PRISON',				     'YIELD_ORDER',			 4 UNION ALL
SELECT 'BUILDING_KGB',				         'YIELD_ORDER',			 8 UNION ALL
SELECT 'BUILDING_DPOLICY',				     'YIELD_ORDER',			 5 UNION ALL
SELECT 'BUILDING_CYROPRISON',				 'YIELD_ORDER',			 5 UNION ALL
SELECT 'BUILDING_LCAMP',				     'YIELD_ORDER',			 2 UNION ALL
SELECT 'BUILDING_RPARLIAMENT',				 'YIELD_ORDER',			 5 UNION ALL
SELECT 'BUILDING_CYBER_COMMANDO',		     'YIELD_ORDER',			 5 UNION ALL
SELECT 'BUILDING_FCOURTS',				     'YIELD_ORDER',			 4 UNION ALL
SELECT 'BUILDING_SECPOLICY',				 'YIELD_ORDER',			 3 UNION ALL
SELECT 'BUILDING_FCOURTS',				     'YIELD_ORDER',			 4 UNION ALL
SELECT 'BUILDING_FCOURTS',				     'YIELD_ORDER',			 4 UNION ALL
SELECT 'BUILDING_FCOURTS',				     'YIELD_ORDER',			 4 UNION ALL
SELECT 'BUILDING_FCOURTS',				     'YIELD_ORDER',			 4;

-----------------------------------------------------------------------------------------------------
--Defines
-----------------------------------------------------------------------------------------------------
INSERT INTO Defines (Name,						Value)

SELECT 'ORDER_UNHAPPY_MOD',			2;

-----------------------------------------------------------------------------------------------------
--Tables
-----------------------------------------------------------------------------------------------------
CREATE TABLE Policy_BuildingClassOrderChanges (PolicyType TEXT DEFAULT NULL, BuildingClassType TEXT DEFAULT NULL, Yield INTEGER DEFAULT 0);
CREATE TABLE Technology_Order (TechType TEXT DEFAULT NULL, Yield INTEGER DEFAULT 0);
CREATE TABLE PolicyBranch_Order (PolicyBranchType TEXT DEFAULT NULL, Yield INTEGER DEFAULT 0);


INSERT INTO Policy_BuildingClassOrderChanges (PolicyType, BuildingClassType, Yield)
SELECT 'POLICY_BRANCH_RATIONALISM',		'BUILDINGCLASS_POLICE_STATION',			1;	

INSERT INTO Technology_Order (TechType,	Yield)
SELECT 'TECH_PIRACY',		                -3  UNION ALL
SELECT 'TECH_SLAVERY',		                -1  UNION ALL
SELECT 'TECH_GERECHTIGKEIT',		         1  UNION ALL
SELECT 'TECH_TAXES',		                -2  UNION ALL
SELECT 'TECH_LUXUS_TRADE',		            -2  UNION ALL
SELECT 'TECH_FEUDALISM',		            -2  UNION ALL
SELECT 'TECH_JOLLY_ROGERS',		            -4  UNION ALL
SELECT 'TECH_BANKING',		                -3  UNION ALL
SELECT 'TECH_SACRIFICE_CULT',		        -2  UNION ALL
SELECT 'TECH_CORPORATION',		             1  UNION ALL
SELECT 'TECH_SOCIAL_STRUCTURE',		         1  UNION ALL
SELECT 'TECH_SURVIVAL',		                -2  UNION ALL
SELECT 'TECH_WARFARE',		                -2  UNION ALL
SELECT 'TECH_CULTURAL_IDENTITY',		     1  UNION ALL
SELECT 'TECH_TRADING',		                -2  UNION ALL
SELECT 'TECH_HONORCODEX',		             3  UNION ALL
SELECT 'TECH_MERCHANTS',		            -2  UNION ALL
SELECT 'TECH_CIVIL_SERVICE',		         3  UNION ALL
SELECT 'TECH_CARGO',		                -2  UNION ALL
SELECT 'TECH_FASICM',		                -5  UNION ALL
SELECT 'TECH_TREASURE_FLEET',		        -4  UNION ALL
SELECT 'TECH_JUSTICE',		                 5  UNION ALL
SELECT 'TECH_SOCIAL_CONTRACT',		         2  UNION ALL
SELECT 'TECH_TOTAL',		                 3  UNION ALL
SELECT 'TECH_GERECHTIGKEIT',		         1  UNION ALL
SELECT 'TECH_GERECHTIGKEIT',		         1  UNION ALL
SELECT 'TECH_GERECHTIGKEIT',		         1  UNION ALL
SELECT 'TECH_GERECHTIGKEIT',		         1  UNION ALL
SELECT 'TECH_GERECHTIGKEIT',		         1  UNION ALL
SELECT 'TECH_GERECHTIGKEIT',		         1  UNION ALL
SELECT 'TECH_GERECHTIGKEIT',		         1  UNION ALL
SELECT 'TECH_GERECHTIGKEIT',		         1  UNION ALL
SELECT 'TECH_GERECHTIGKEIT',		         1  UNION ALL
SELECT 'TECH_GERECHTIGKEIT',		         1  UNION ALL
SELECT 'TECH_GOVERNMENT',		             2;

INSERT INTO PolicyBranch_Order (PolicyBranchType,	Yield)
SELECT 'POLICY_BRANCH_ORDER',					1;

--ResourceDummy
--------------------------------------------------------------------------------------------------
INSERT INTO Resources	(Type,					Description,							Civilopedia,								Help,										ResourceClassType)
SELECT					'RESOURCE_TAXES',		'TXT_KEY_RESOURCE_DUMMY',				'TXT_KEY_CIV5_RESOURCE_DUMMY_TEXT',		'TXT_KEY_RESOURCE_DUMMY_HELP',				'RESOURCECLASS_DUMMY' UNION ALL
SELECT					'RESOURCE_ORDER',		'TXT_KEY_RESOURCE_DUMMY',				'TXT_KEY_CIV5_RESOURCE_DUMMY_TEXT',		'TXT_KEY_RESOURCE_DUMMY_HELP',				'RESOURCECLASS_DUMMY' UNION ALL
SELECT					'RESOURCE_CIV_ORDER',		'TXT_KEY_RESOURCE_DUMMY',				'TXT_KEY_CIV5_RESOURCE_DUMMY_TEXT',		'TXT_KEY_RESOURCE_DUMMY_HELP',				'RESOURCECLASS_DUMMY';

INSERT INTO Processes (Type,	  Description,			 Help,						Strategy,							 TechPrereq,		 IconAtlas,			PortraitIndex)
SELECT	'PROCESS_ORDER', 'TXT_KEY_PROCESS_ORDER', 'TXT_KEY_PROCESS_ORDER_HELP', ' TXT_KEY_PROCESS_ORDER_STRATEGY',		'TECH_GOVERNMENT',		'CITIZEN_ATLAS',	 5;

INSERT INTO Process_Flavors (ProcessType,  FlavorType,  Flavor)
SELECT 'PROCESS_ORDER',  'FLAVOR_GROWTH', 5;

INSERT INTO Process_ProductionYields (ProcessType,  YieldType,  Yield)
SELECT 'PROCESS_ORDER',  'YIELD_ORDER', 50;



INSERT INTO Improvements (Type,  Description,  Civilopedia, ArtDefineTag, Water, PortraitIndex, IconAtlas )
SELECT 'IMPROVEMENT_HURRICANE', 'TXT_KEY_IMPROVEMENT_HURRICANE', 'TXT_KEY_IMPROVEMENT_HURRICANE_TEXT', 'ART_DEF_IMPROVEMENT_HURRICANE', 1, 36, 'TERRAIN_ATLAS' UNION ALL
SELECT 'IMPROVEMENT_GREY_GOO', 'TXT_KEY_IMPROVEMENT_GREY_GOO', 'TXT_KEY_IMPROVEMENT_GREY_GOO_TEXT', 'ART_DEF_IMPROVEMENT_GREY_GOO', 1, 36, 'TERRAIN_ATLAS' UNION ALL
SELECT 'IMPROVEMENT_BURN', 'TXT_KEY_IMPROVEMENT_BURN', 'TXT_KEY_IMPROVEMENT_BURN_TEXT', 'ART_DEF_IMPROVEMENT_BURN', 1, 36, 'TERRAIN_ATLAS';


INSERT INTO ArtDefine_LandmarkTypes (Type, LandmarkType, FriendlyName)
SELECT	'ART_DEF_IMPROVEMENT_HURRICANE', 'Improvement', 'Hurricane'	UNION ALL
SELECT	'ART_DEF_IMPROVEMENT_GREY_GOO', 'Improvement', 'NanoBots'	UNION ALL
SELECT	'ART_DEF_IMPROVEMENT_BURN', 'Improvement', 'Burn';

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model)
SELECT	'Any', 'Any', 1.0, 'ART_DEF_IMPROVEMENT_HURRICANE', 'SNAPSHOT', 'ART_DEF_RESOURCE_ALL', 'Hurricane.fxsxml' UNION ALL
SELECT	'Any', 'Any', 1.0, 'ART_DEF_IMPROVEMENT_GREY_GOO', 'SNAPSHOT', 'ART_DEF_RESOURCE_ALL', 'GreyGoo.fxsxml' UNION ALL
SELECT	'Any', 'Any', 1.0, 'ART_DEF_IMPROVEMENT_BURN', 'SNAPSHOT', 'ART_DEF_RESOURCE_ALL', 'forest_burn.fxsxml';



