
UPDATE Units
SET PrereqTech='TECH_TRIBAL_WARRIOR', Cost= 20
WHERE TYPE='UNIT_BARBARIAN_WARRIOR';



INSERT INTO Units
		(Class,						 Type,  			Combat,  Cost, Moves,  CombatClass,			 Domain, 		DefaultUnitAI, 		Description, 			 Strategy, 							Help, 						MilitarySupport, MilitaryProduction, Pillage, 	ObsoleteTech, 			AdvancedStartCost, XPValueAttack, XPValueDefense,  UnitArtInfo, 						UnitFlagAtlas,		UnitFlagIconOffset, IconAtlas, 			PortraitIndex, MoveRate) VALUES

		  ('UNITCLASS_WARRIOR', 'UNIT_BARBARIAN_CAVEMAN', 	5,		 20,	1,	 'UNITCOMBAT_MELEE',	'DOMAIN_LAND',	'UNITAI_ATTACK',	'TXT_KEY_UNIT_CAVEMAN',	'TXT_KEY_UNIT_CAVEMAN_STRATEGY',	'TXT_KEY_UNIT_HELP_CAVEMAN',	'true',			'true',				'true',		'TECH_BRONZE_WORKING',   10,				3,				2,		'ART_DEF_UNIT_BARBARIAN_EURO',	'FLAG_ATLAS_PRE',		 0,                 'UNIT_ATLAS_PRE',       0,      'HEAVY_BIPED');



INSERT INTO Civilization_UnitClassOverrides (CivilizationType, UnitClassType, UnitType) VALUES ('CIVILIZATION_BARBARIAN', 'UNITCLASS_WARRIOR', 'UNIT_BARBARIAN_CAVEMAN');


INSERT INTO Unit_ClassUpgrades (UnitType, UnitClassType) VALUES ('UNIT_BARBARIAN_CAVEMAN', 'UNITCLASS_WARRIOR');

INSERT INTO Unit_Flavors (UnitType, FlavorType, Flavor) VALUES ('UNIT_BARBARIAN_CAVEMAN', 'FLAVOR_OFFENSE', 4);
INSERT INTO Unit_Flavors (UnitType, FlavorType, Flavor) VALUES ('UNIT_BARBARIAN_CAVEMAN', 'FLAVOR_DEFENSE', 2);









