--------------------------------------------------------------------------------------------------
--Specialists
--------------------------------------------------------------------------------------------------

INSERT INTO Specialists (Type,	       Visible,	              Description,					Strategy,								        GreatPeopleTitle,                         IconAtlas,	    PortraitIndex,  GreatPeopleUnitClass,   GreatPeopleRateChange, Cost) 
SELECT 'SPECIALIST_ENTERTAINER',		1,			'TXT_KEY_SPECIALIST_ENTERTAINER',	  'TXT_KEY_SPECIALIST_ENTERTAINER_STRATEGY',	'TXT_KEY_SPECIALIST_ENTERTAINER_TITLE',   'SPECIALIST_CITIZEN_ATLAS',	0,       'UNITCLASS_ENTERTAINER',            0,             0 UNION ALL
SELECT 'SPECIALIST_ENERGY',		        1,			'TXT_KEY_SPECIALIST_ENERGY',	     'TXT_KEY_SPECIALIST_ENERGY_STRATEGY',	        'TXT_KEY_SPECIALIST_ENERGY_TITLE',        'SPECIALIST_CITIZEN_ATLAS',	0,       'UNITCLASS_ELECTRICIAN',            0,             0 UNION ALL
SELECT 'SPECIALIST_PRIEST',		        1,			'TXT_KEY_SPECIALIST_PRIEST',	     'TXT_KEY_SPECIALIST_PRIEST_STRATEGY',	        'TXT_KEY_SPECIALIST_PRIEST_TITLE',        'SPECIALIST_CITIZEN_ATLAS',	2,       'UNITCLASS_PROPHET',                0,             0 UNION ALL
SELECT 'SPECIALIST_INTELLECTUAL',		1,			'TXT_KEY_SPECIALIST_INTELLECTUAL',	 'TXT_KEY_SPECIALIST_INTELLECTUAL_STRATEGY',	'TXT_KEY_SPECIALIST_INTELLECTUAL_TITLE',  'SPECIALIST_CITIZEN_ATLAS',	0,       'UNITCLASS_INTELLECTUAL',           0,             0 UNION ALL
SELECT 'SPECIALIST_LABORER',		    1,			'TXT_KEY_SPECIALIST_LABORER',	     'TXT_KEY_SPECIALIST_LABORER_STRATEGY',	        'TXT_KEY_SPECIALIST_LABORER_TITLE',       'SPECIALIST_CITIZEN_ATLAS',	4,       'UNITCLASS_LABORERX',              0,             0 UNION ALL
SELECT 'SPECIALIST_ENVIRONMENT',		1,			'TXT_KEY_SPECIALIST_ENVIRONMENT',	  'TXT_KEY_SPECIALIST_ENVIRONMENT_STRATEGY',	'TXT_KEY_SPECIALIST_ENVIRONMENT_TITLE',   'SPECIALIST_CITIZEN_ATLAS',	4,       'UNITCLASS_ENVIRONMENT',            0,             0 UNION ALL
SELECT 'SPECIALIST_TRANSCEND',		    1,			'TXT_KEY_SPECIALIST_TRANSCEND',	     'TXT_KEY_SPECIALIST_TRANSCEND_STRATEGY',	    'TXT_KEY_SPECIALIST_TRANSCEND_TITLE',     'SPECIALIST_CITIZEN_ATLAS',	0,       'UNITCLASS_TRANSCEND',              0,             0 UNION ALL
SELECT 'SPECIALIST_JUDGE',		        1,			'TXT_KEY_SPECIALIST_JUDGE',	         'TXT_KEY_SPECIALIST_JUDGE_STRATEGY',	        'TXT_KEY_SPECIALIST_JUDGE_TITLE',         'SPECIALIST_CITIZEN_ATLAS',	0,       'UNITCLASS_INTELLECTUAL',           0,             0 UNION ALL

SELECT 'SPECIALIST_GUIDE',		        1,			'TXT_KEY_SPECIALIST_GUIDE',	         'TXT_KEY_SPECIALIST_GUIDE_STRATEGY',	        'TXT_KEY_SPECIALIST_GUIDE_TITLE',         'SPECIALIST_CITIZEN_ATLAS',	1,       'UNITCLASS_GUIDE',            0,             0;

--------------------------------------------------------------------------------------------------
--New Yields
--------------------------------------------------------------------------------------------------
INSERT INTO Yields (Type,	Description,				IconString,			MinCity,	AIWeightPercent)
SELECT 'YIELD_ENERGY',	'TXT_KEY_YIELD_ENERGY',	    '[ICON_POWER3]',	0,			100  UNION ALL
SELECT 'YIELD_HAPPY',	'TXT_KEY_YIELD_ENERGY',	    '[ICON_POWER3]',	0,			100  UNION ALL
SELECT 'YIELD_ECO',		'TXT_KEY_YIELD_ENERGY',	    '[ICON_POWER3]',	0,			100  UNION ALL
SELECT 'YIELD_LABOR',	'TXT_KEY_YIELD_MANPOWER',	'[ICON_RES_MANPOWER]',	    0,			100;

--------------------------------------------------------------------------------------------------
--ResourceClass
--------------------------------------------------------------------------------------------------
INSERT INTO ResourceClasses (Type,	UniqueRange)
SELECT	'RESOURCECLASS_DUMMY', 0;

--------------------------------------------------------------------------------------------------
--ResourceDummy
--------------------------------------------------------------------------------------------------
INSERT INTO Resources	(Type,					Description,							Civilopedia,								Help,										ResourceClassType)
SELECT					'RESOURCE_OLDYIELD',		'TXT_KEY_RESOURCE_DUMMY',				'TXT_KEY_CIV5_RESOURCE_DUMMY_TEXT',		'TXT_KEY_RESOURCE_DUMMY_HELP',				'RESOURCECLASS_DUMMY' UNION ALL
SELECT					'RESOURCE_HAPPYYIELD',		'TXT_KEY_RESOURCE_DUMMY',				'TXT_KEY_CIV5_RESOURCE_DUMMY_TEXT',		'TXT_KEY_RESOURCE_DUMMY_HELP',				'RESOURCECLASS_DUMMY' UNION ALL
SELECT					'RESOURCE_HAPPYYIELDB',		'TXT_KEY_RESOURCE_DUMMY',				'TXT_KEY_CIV5_RESOURCE_DUMMY_TEXT',		'TXT_KEY_RESOURCE_DUMMY_HELP',				'RESOURCECLASS_DUMMY' UNION ALL
SELECT					'RESOURCE_ENERGYYIELD',		'TXT_KEY_RESOURCE_DUMMY',				'TXT_KEY_CIV5_RESOURCE_DUMMY_TEXT',		'TXT_KEY_RESOURCE_DUMMY_HELP',				'RESOURCECLASS_DUMMY';
--------------------------------------------------------------------------------------------------
---Specialist dummy building
--------------------------------------------------------------------------------------------------
INSERT INTO BuildingClasses (Type,	DefaultBuilding,				NoLimit,			Description)
SELECT					'BUILDINGCLASS_ENERGY_DUMMY',	'BUILDING_ENERGY_DUMMY',	'true',	'TXT_KEY_BUILDING_ENERGY_DUMMY';

INSERT INTO Buildings (Type,	BuildingClass,  Cost,	Description,	Help,    NeverCapture, 	NukeImmune,		UnmoddedHappiness, IconAtlas,  PortraitIndex)
SELECT					'BUILDING_ENERGY_DUMMY',	'BUILDINGCLASS_ENERGY_DUMMY',  -1,  'TXT_KEY_BUILDING_ENERGY_DUMMY',  'TXT_KEY_BUILDING_ENERGY_DUMMY_HELP',  'true',  'true', 2, 'BW_ATLAS_1', 19;
--------------------------------------------------------------------------------------------------
--Specialist Yields
--------------------------------------------------------------------------------------------------
INSERT INTO SpecialistYields (SpecialistType,	YieldType,			Yield) 
SELECT 'SPECIALIST_ENVIRONMENT',				'YIELD_FOOD',	          2 UNION ALL
SELECT 'SPECIALIST_ENVIRONMENT',				'YIELD_PRODUCTION',	      1 UNION ALL
SELECT 'SPECIALIST_ENTERTAINER',				'YIELD_CULTURE',	      1 UNION ALL
SELECT 'SPECIALIST_ENTERTAINER',				'YIELD_HAPPY',	      1 UNION ALL
SELECT 'SPECIALIST_ENERGY',						'YIELD_ENERGY',		      3 UNION ALL
SELECT 'SPECIALIST_PRIEST',						'YIELD_FAITH',		      3 UNION ALL
SELECT 'SPECIALIST_INTELLECTUAL',				'YIELD_GOLDEN_AGE_POINTS',5 UNION ALL
SELECT 'SPECIALIST_TRANSCEND',				    'YIELD_GOLDEN_AGE_POINTS',4 UNION ALL
SELECT 'SPECIALIST_TRANSCEND',				    'YIELD_CULTURE',          4 UNION ALL
SELECT 'SPECIALIST_LABORER',				    'YIELD_LABOR',		      2 UNION ALL
SELECT 'SPECIALIST_ENVIRONMENT',				'YIELD_ECO',		      1 UNION ALL
--SELECT 'SPECIALIST_JUDGE',				'YIELD_ORDER',		      5 UNION ALL
SELECT 'SPECIALIST_JUDGE',				       'YIELD_GOLDEN_AGE_POINTS', 2 UNION ALL
SELECT 'SPECIALIST_GUIDE',						'YIELD_TOURISM',		  3;
--------------------------------------------------------------------------------------------------
--Specialist Flavors
--------------------------------------------------------------------------------------------------
INSERT INTO SpecialistFlavors (SpecialistType,	FlavorType,			Flavor)
SELECT 'SPECIALIST_ENVIRONMENT',				'FLAVOR_GROWTH',    40 UNION ALL
SELECT 'SPECIALIST_ENVIRONMENT',				'FLAVOR_PRODUCTION',10 UNION ALL
SELECT 'SPECIALIST_ENTERTAINER',				'FLAVOR_HAPPINESS', 50 UNION ALL
SELECT 'SPECIALIST_ENTERTAINER',				'FLAVOR_CULTURE',	10 UNION ALL
SELECT 'SPECIALIST_ENERGY',				        'FLAVOR_PRODUCTION',30 UNION ALL
SELECT 'SPECIALIST_ENERGY',				        'FLAVOR_MOBILE',	10 UNION ALL
SELECT 'SPECIALIST_PRIEST',						'FLAVOR_RELIGION',	50 UNION ALL
SELECT 'SPECIALIST_LABORER',					'FLAVOR_PRODUCTION',40 UNION ALL
SELECT 'SPECIALIST_LABORER',					'FLAVOR_MOBILE',	10 UNION ALL
SELECT 'SPECIALIST_GUIDE',						'FLAVOR_GOLD',	    50 UNION ALL
SELECT 'SPECIALIST_GUIDE',						'FLAVOR_CULTURE',	30 UNION ALL
SELECT 'SPECIALIST_GUIDE',						'FLAVOR_DIPLOMACY',	10 UNION ALL
SELECT 'SPECIALIST_INTELLECTUAL',				'FLAVOR_SCIENCE',	10 UNION ALL
SELECT 'SPECIALIST_INTELLECTUAL',				'FLAVOR_CULTURE',	20 UNION ALL
SELECT 'SPECIALIST_TRANSCEND',				    'FLAVOR_CULTURE',	50 UNION ALL
SELECT 'SPECIALIST_INTELLECTUAL',				'FLAVOR_HAPPINESS',	10 UNION ALL
SELECT 'SPECIALIST_JUDGE',				        'FLAVOR_CULTURE',	40 UNION ALL
SELECT 'SPECIALIST_JUDGE',				        'FLAVOR_HAPPINESS',	40 UNION ALL
SELECT 'SPECIALIST_JUDGE',				        'FLAVOR_PRODUCTION',10 UNION ALL

SELECT 'SPECIALIST_PRIEST',						'FLAVOR_GOLD',		10;
--Buildings (Add Preacher specialist slots)
--------------------------------------------------------------------------------------------------
UPDATE PostDefines SET Key = 'ERA_PREHISTORIC' WHERE Name = 'TOURISM_START_ERA';

