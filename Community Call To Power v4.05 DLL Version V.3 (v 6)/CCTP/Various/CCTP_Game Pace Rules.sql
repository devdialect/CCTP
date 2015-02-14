-- Insert SQL Rules Here
--TECHNOLOGY COST BY TIER & ERA
/*
Base costs for Tier 1 in each Era are( or will be) set in Technologies.sql. 
Base of 20(Ancient) Classical Base is 50(250% more than Ancient),  Medieval is 150(300% more than Classical), Renaissance is 450(300% more than Medieval), Industrial is 1350(300% more than Renaissance), 
Modern is 5512.5(300% more than Industrial), Digital is 19293.75(350% more than Modern), Information is 77175(300% more than Digital).

Here we adjust each Tier to reflect a gradiant system. Each Tier is currently(Feel free to tweak it) increased by 20% per Tier, so Tier 2 is 20% more than Tier 1, Tier 3 is 40% more so on so on.
*/

--Future Tier 5
UPDATE Technologies
SET Cost = Round(42525 * 1.75, 0) WHERE Tier = 5 AND Era = 'ERA_FUTURE';
--Future Tier 4
UPDATE Technologies
SET Cost = Round(42525 * 1.6, 0) WHERE Tier = 4 AND Era = 'ERA_FUTURE';
--Future Tier 3
UPDATE Technologies
SET Cost = Round(42525 * 1.4, 0) WHERE Tier = 3 AND Era = 'ERA_FUTURE';
--Future Tier 2
UPDATE Technologies
SET Cost = Round(42525 * 1.2, 0) WHERE Tier = 2 AND Era = 'ERA_FUTURE';
--Future Tier 1
UPDATE Technologies
SET Cost = Round(42525 * 1.0, 0) WHERE Tier = 1 AND Era = 'ERA_FUTURE';

--Digital Tier 6
UPDATE Technologies
SET Cost = Round(14175 * 2.0, 0) WHERE Tier = 6 AND Era = 'ERA_POSTMODERN';
--Digital Tier 5
UPDATE Technologies
SET Cost = Round(14175 * 1.8, 0) WHERE Tier = 5 AND Era = 'ERA_POSTMODERN';
--Digital Tier 4
UPDATE Technologies
SET Cost = Round(14175 * 1.6, 0) WHERE Tier = 4 AND Era = 'ERA_POSTMODERN';
--Digital Tier 3
UPDATE Technologies
SET Cost = Round(14175 * 1.4, 0) WHERE Tier = 3 AND Era = 'ERA_POSTMODERN';
--Digital Tier 2
UPDATE Technologies
SET Cost = Round(14175 * 1.2, 0) WHERE Tier = 2 AND Era = 'ERA_POSTMODERN';
--Digital Tier 1
UPDATE Technologies
SET Cost = Round(14175 * 1.0, 0) WHERE Tier = 1 AND Era = 'ERA_POSTMODERN';

--Modern Tier 4
UPDATE Technologies
SET Cost = Round(4050 * 1.6, 0) WHERE Tier = 4 AND Era = 'ERA_MODERN';
--Modern Tier 3
UPDATE Technologies
SET Cost = Round(4050 * 1.4, 0) WHERE Tier = 3 AND Era = 'ERA_MODERN';
--Modern Tier 2
UPDATE Technologies
SET Cost = Round(4050 * 1.2, 0) WHERE Tier = 2 AND Era = 'ERA_MODERN';
--Modern Tier 1
UPDATE Technologies
SET Cost = Round(4050 * 1.0, 0) WHERE Tier = 1 AND Era = 'ERA_MODERN';

--Industrial Tier 6
UPDATE Technologies
SET Cost = Round(1350 * 2.0, 0) WHERE Tier = 6 AND Era = 'ERA_INDUSTRIAL';
--Industrial Tier 5
UPDATE Technologies
SET Cost = Round(1350 * 1.8, 0) WHERE Tier = 5 AND Era = 'ERA_INDUSTRIAL';
--Industrial Tier 4
UPDATE Technologies
SET Cost = Round(1150 * 1.6, 0) WHERE Tier = 4 AND Era = 'ERA_INDUSTRIAL';
--Industrial Tier 3
UPDATE Technologies
SET Cost = Round(1150 * 1.2, 0) WHERE Tier = 3 AND Era = 'ERA_INDUSTRIAL';
--Industrial Tier 2
UPDATE Technologies
SET Cost = Round(1150 * 1.1, 0) WHERE Tier = 2 AND Era = 'ERA_INDUSTRIAL';
--Industrial Tier 1
UPDATE Technologies
SET Cost = Round(1150 * 1.0, 0) WHERE Tier = 1 AND Era = 'ERA_INDUSTRIAL';

--Renaissance Tier 5
UPDATE Technologies
SET Cost = Round(Cost * 1.8, 0) WHERE Tier = 5 AND Era = 'ERA_RENAISSANCE';
--Renaissance Tier 4
UPDATE Technologies
SET Cost = Round(Cost * 1.6, 0) WHERE Tier = 4 AND Era = 'ERA_RENAISSANCE';
--Renaissance Tier 3
UPDATE Technologies
SET Cost = Round(Cost * 1.4, 0) WHERE Tier = 3 AND Era = 'ERA_RENAISSANCE';
--Renaissance Tier 2
UPDATE Technologies
SET Cost = Round(Cost * 1.2, 0) WHERE Tier = 2 AND Era = 'ERA_RENAISSANCE';
--Renaissance Tier 1
UPDATE Technologies
SET Cost = Round(Cost * 1.0, 0) WHERE Tier = 1 AND Era = 'ERA_RENAISSANCE';

--Medieval Tier 4
UPDATE Technologies
SET Cost = Round(Cost * 1.6, 0) WHERE Tier = 4 AND Era = 'ERA_MEDIEVAL';
--Medieval Tier 3
UPDATE Technologies
SET Cost = Round(Cost * 1.4, 0) WHERE Tier = 3 AND Era = 'ERA_MEDIEVAL';
--Medieval Tier 2
UPDATE Technologies
SET Cost = Round(Cost * 1.2, 0) WHERE Tier = 2 AND Era = 'ERA_MEDIEVAL';
--Medieval Tier 1
UPDATE Technologies
SET Cost = Round(Cost * 1.0, 0) WHERE Tier = 1 AND Era = 'ERA_MEDIEVAL';

--Classical Tier 5
UPDATE Technologies
SET Cost = Round(Cost * 1.8, 0) WHERE Tier = 5 AND Era = 'ERA_CLASSICAL';
--Classical Tier 4
UPDATE Technologies
SET Cost = Round(Cost * 1.6, 0) WHERE Tier = 4 AND Era = 'ERA_CLASSICAL';
--Classical Tier 3
UPDATE Technologies
SET Cost = Round(Cost * 1.4, 0) WHERE Tier = 3 AND Era = 'ERA_CLASSICAL';
--Classical Tier 2
UPDATE Technologies
SET Cost = Round(Cost * 1.2, 0) WHERE Tier = 2 AND Era = 'ERA_CLASSICAL';
--Classical Tier 1
UPDATE Technologies
SET Cost = Round(Cost * 1.0, 0) WHERE Tier = 1 AND Era = 'ERA_CLASSICAL';

--Ancient Tier 5
UPDATE Technologies
SET Cost = Round(Cost * 1.8, 0) WHERE Tier = 5 AND Era = 'ERA_ANCIENT';
--Ancient Tier 4
UPDATE Technologies
SET Cost = Round(Cost * 1.6, 0) WHERE Tier = 4 AND Era = 'ERA_ANCIENT';
--Ancient Tier 3
UPDATE Technologies
SET Cost = Round(Cost * 1.4, 0) WHERE Tier = 3 AND Era = 'ERA_ANCIENT';
--Ancient Tier 2
UPDATE Technologies
SET Cost = Round(Cost * 1.2, 0) WHERE Tier = 2 AND Era = 'ERA_ANCIENT';
--Ancient Tier 1
UPDATE Technologies
SET Cost = Round(Cost * 1.0, 0) WHERE Tier = 1 AND Era = 'ERA_ANCIENT';

--BUILDING COST

--Nano
UPDATE Buildings
SET Cost = Cost * 3.8
WHERE ( PrereqTech IN ( SELECT Type FROM Technologies WHERE Era = 'ERA_FUTURE' ) );

--Digital
UPDATE Buildings
SET Cost = Cost * 3.2
WHERE ( PrereqTech IN ( SELECT Type FROM Technologies WHERE Era = 'ERA_POSTMODERN' ) );

--Modern
UPDATE Buildings
SET Cost = Cost -- was * 3.0
WHERE ( PrereqTech IN ( SELECT Type FROM Technologies WHERE Era = 'ERA_MODERN' ) );


--UNIT COST
--Nano
UPDATE Units
SET Cost = Cost * 2.6
WHERE ( PrereqTech IN ( SELECT Type FROM Technologies WHERE Era = 'ERA_FUTURE' ) );

--Digital
UPDATE Units
SET Cost = Cost * 2.07
WHERE ( PrereqTech IN ( SELECT Type FROM Technologies WHERE Era = 'ERA_POSTMODERN' ) );

--Modern
UPDATE Units
SET Cost = Cost -- WAS * 2.69
WHERE ( PrereqTech IN ( SELECT Type FROM Technologies WHERE Era = 'ERA_MODERN' ) );


--BUILDING MAINTENANCE

--Nano
UPDATE Buildings
SET GoldMaintenance = GoldMaintenance * 4.6
WHERE ( PrereqTech IN ( SELECT Type FROM Technologies WHERE Era = 'ERA_FUTURE' ) );

--Digital
UPDATE Buildings
SET GoldMaintenance = GoldMaintenance * 3.6
WHERE ( PrereqTech IN ( SELECT Type FROM Technologies WHERE Era = 'ERA_POSTMODERN' ) );

--Modern
UPDATE Buildings
SET GoldMaintenance = GoldMaintenance * 1.5 -- was * 3.15
WHERE ( PrereqTech IN ( SELECT Type FROM Technologies WHERE Era = 'ERA_MODERN' ) );

--Industrial
UPDATE Buildings
SET GoldMaintenance = GoldMaintenance * 1.5 -- 30% Increase
WHERE ( PrereqTech IN ( SELECT Type FROM Technologies WHERE Era = 'ERA_INDUSTRIAL' ) );

--Renaissance
UPDATE Buildings
SET GoldMaintenance = GoldMaintenance * 1.5 -- 30% Increase
WHERE ( PrereqTech IN ( SELECT Type FROM Technologies WHERE Era = 'ERA_RENAISSANCE' ) );

--Medieval
UPDATE Buildings
SET GoldMaintenance = GoldMaintenance * 1.5 -- 20% Increase
WHERE ( PrereqTech IN ( SELECT Type FROM Technologies WHERE Era = 'ERA_MEDIEVAL' ) );

-- Classical
UPDATE Buildings
SET GoldMaintenance = GoldMaintenance * 1.2 -- 20% Increase
WHERE ( PrereqTech IN ( SELECT Type FROM Technologies WHERE Era = 'ERA_CLASSICAL' ) );

--Ancient
UPDATE Buildings
SET GoldMaintenance = GoldMaintenance * 1.1 -- 10% Increase
WHERE ( PrereqTech IN ( SELECT Type FROM Technologies WHERE Era = 'ERA_ANCIENT' ) );

--Goody Huts only Ancient Techs
UPDATE Technologies
SET GoodyTech = 0
WHERE Era IN ('ERA_CLASSICAL', 'ERA_MEDIEVAL', 'ERA_RENAISSANCE', 'ERA_INDUSTRIAL', 'ERA_MODERN', 'ERA_POSTMODERN', 'ERA_FUTURE');

-- Game Options
UPDATE GameOptions SET "Default" = 1 WHERE Type = 'GAMEOPTION_POLICY_SAVING';
UPDATE GameOptions SET "Default" = 1 WHERE Type = 'GAMEOPTION_PROMOTION_SAVING';

-- Gamespeeds Adjustments 
DELETE FROM GameSpeeds WHERE Type IN ('GAMESPEED_MARATHON','GAMESPEED_EPIC','GAMESPEED_STANDARD','GAMESPEED_QUICK');
--
INSERT INTO GameSpeeds		(ID, Type,					Description,					Help,								DealDuration,	GrowthPercent,	TrainPercent,	ConstructPercent,  LeaguePercent,	CreatePercent,	ResearchPercent,	GoldPercent,	GoldGiftMod,	BuildPercent,	ImprovementPercent, GreatPeoplePercent, CulturePercent, FaithPercent,	BarbPercent,	FeatureProductionPercent,	UnitDiscoverPercent,	UnitHurryPercent,	UnitTradePercent,	GoldenAgePercent,	HurryPercent,	InflationPercent,	InflationOffset,	ReligiousPressureAdjacentCity,	VictoryDelayPercent,	MinorCivElectionFreqMod,	OpinionDurationPercent, SpyRatePercent, PeaceDealDuration,	RelationshipDuration,	PortraitIndex,	IconAtlas)
				 
				 SELECT		 0,	 'GAMESPEED_MARATHON',	'TXT_KEY_GAMESPEED_MARATHON',	'TXT_KEY_GAMESPEED_MARATHON_HELP',	90,				450,			200,			200,	              200,			200,			450,				185,			67,				200,			350,				200,				300,			275,			150,			225,						375,					375,				300,				200,				100,			5,					-330,				2,								300,					300,						300,					100,			30,					150,					0,				'GAMESPEED_ATLAS'		UNION ALL
				 SELECT		 1,	 'GAMESPEED_EPIC',		'TXT_KEY_GAMESPEED_EPIC',		'TXT_KEY_GAMESPEED_EPIC_HELP',	    45,				225,			135,			135,	              135,			150,			225,				135,			75,				150,			225,				150,				188,			188,			150,			150,						188,					188,				150,				125,				100,			10,					-169,				4,								150,					150,						150,					100,			15,					75,						1,				'GAMESPEED_ATLAS'		UNION ALL
				 SELECT		 2,	 'GAMESPEED_STANDARD',	'TXT_KEY_GAMESPEED_STANDARD',	'TXT_KEY_GAMESPEED_STANDARD_HELP',	30,				115,			90,				80,		              100,			85,				100,				100,			100,	        100,			100,				100,				120,			120,			100,			100,						125,					95,					100,				100,				95,				20,					-112,				6,								100,					100,						100,					100,			10,					50,						2,				'GAMESPEED_ATLAS'		UNION ALL
				 SELECT		 3,	 'GAMESPEED_QUICK',		'TXT_KEY_GAMESPEED_QUICK',		'TXT_KEY_GAMESPEED_QUICK_HELP',     25,				84,				67,				67,		              67,			67,				90,					75,				125,			67,				84,					67,					84,				84,				67,				67,							84,						84,					67,					80,					100,			35,					-90,				9,								67,						67,							67,						30,				10,					50,						3,				'GAMESPEED_ATLAS';

-- Calender Adjustment
DROP TABLE IF EXISTS GameSpeed_Turns;
CREATE TABLE GameSpeed_Turns (  'GameSpeedType' text , 
								'MonthIncrement' integer , 
								'TurnsPerIncrement' integer , foreign key (GameSpeedType) references GameSpeeds(Type));
-- Crawl
INSERT INTO GameSpeed_Turns (GameSpeedType,			MonthIncrement,	TurnsPerIncrement)
--SELECT						'GAMESPEED_MARATHON',	2000,			40				     UNION ALL -- Pre
SELECT						'GAMESPEED_MARATHON',	1600,			40				     UNION ALL -- Pre
SELECT						'GAMESPEED_MARATHON',	880,			65				     UNION ALL -- Ancient
SELECT						'GAMESPEED_MARATHON',	420,			110					 UNION ALL -- Classical
SELECT						'GAMESPEED_MARATHON',	120,			190					 UNION ALL -- Medieval
SELECT						'GAMESPEED_MARATHON',	60,				180					 UNION ALL -- Renassiance
SELECT						'GAMESPEED_MARATHON',	24,				201					 UNION ALL -- Industrial
SELECT						'GAMESPEED_MARATHON',	12,				229					 UNION ALL -- Modern
SELECT						'GAMESPEED_MARATHON',	6,				160					 UNION ALL -- Post Modern
SELECT						'GAMESPEED_MARATHON',	3,				264					 UNION ALL -- Future
SELECT						'GAMESPEED_MARATHON',	1,				996					 UNION ALL -- Future

-- Slow
SELECT						'GAMESPEED_EPIC',		800,			60					 UNION ALL -- Ancient bout 3200 years(4000BC - 800BC) - Complete
SELECT						'GAMESPEED_EPIC',		470,			140					 UNION ALL -- Classical about 1400 Years(800BC - 600AD) - Complete
SELECT						'GAMESPEED_EPIC',		180,			160				 UNION ALL -- Medieval about 900 years(600AD - 1500AD) - Complete
SELECT						'GAMESPEED_EPIC',		120,			60					 UNION ALL -- Renassiance about 250 years (1500AD - 1750AD) - Complete
SELECT						'GAMESPEED_EPIC',		60,				90					 UNION ALL -- Industrial about 150 years (1750 - 1900) - Inprogress
SELECT						'GAMESPEED_EPIC',		24,				80					 UNION ALL -- Modern about 100 years (1900 - 2000)
SELECT						'GAMESPEED_EPIC',		12,				100					 UNION ALL -- Post Modern about 100 Years (2000 - 2100)
SELECT						'GAMESPEED_EPIC',		1,				910					 UNION ALL -- Future about 400 years (2100 - 2500)
-- Normal
SELECT						'GAMESPEED_STANDARD',	800,			60					 UNION ALL -- Ancient 1000bc
SELECT						'GAMESPEED_STANDARD',	800,			75					 UNION ALL -- Classical 750bc
SELECT						'GAMESPEED_STANDARD',	300,			60					 UNION ALL -- Medieval 1300
SELECT						'GAMESPEED_STANDARD',	240,			25					 UNION ALL -- Renassiance 1700
SELECT						'GAMESPEED_STANDARD',	120,			50					 UNION ALL -- Industrial 1875
SELECT						'GAMESPEED_STANDARD',	60,				60					 UNION ALL -- Modern 1987.5
SELECT						'GAMESPEED_STANDARD',	12,				100					 UNION ALL -- Post Modern 2012.5
SELECT						'GAMESPEED_STANDARD',	1,				520					 UNION ALL -- Future
-- Fast
SELECT						'GAMESPEED_QUICK',		800,			60					 UNION ALL -- Ancient
SELECT						'GAMESPEED_QUICK',		1200,			50					 UNION ALL -- Classical
SELECT						'GAMESPEED_QUICK',		480,			30					 UNION ALL -- Medieval
SELECT						'GAMESPEED_QUICK',		360,			20					 UNION ALL -- Renassiance
SELECT						'GAMESPEED_QUICK',		240,			30					 UNION ALL -- Industrial
SELECT						'GAMESPEED_QUICK',		120,			25					 UNION ALL -- Modern
SELECT						'GAMESPEED_QUICK',		60,				40					 UNION ALL -- Post Modern
SELECT						'GAMESPEED_QUICK',		24,				65					 UNION ALL	   -- Future
SELECT						'GAMESPEED_QUICK',		12,				10;					    	   -- Future