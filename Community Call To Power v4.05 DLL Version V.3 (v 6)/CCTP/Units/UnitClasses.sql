DROP TABLE IF EXISTS UnitClasses;
CREATE TABLE UnitClasses ('ID' integer primary key autoincrement , 
							'Type' text  not null unique , 
							'Description' text , 
							'MaxGlobalInstances' integer default '-1' , 
							'MaxTeamInstances' integer default '-1' , 
							'MaxPlayerInstances' integer default '-1' , 
							'InstanceCostModifier' integer default 0 , 
							'DefaultUnit' text );
INSERT INTO UnitClasses (	Type, 										Description, 								MaxGlobalInstances,	MaxTeamInstances,	MaxPlayerInstances,	InstanceCostModifier, 	DefaultUnit)
-- Worker & Settler Units
SELECT						'UNITCLASS_SETTLER',						'TXT_KEY_UNIT_SETTLER',						-1,					-1,					-1,					0,						'UNIT_SETTLER'						UNION ALL
SELECT						'UNITCLASS_WORKER',							'TXT_KEY_UNIT_WORKER',						-1,					-1,					-1,					0,						'UNIT_WORKER'						UNION ALL
SELECT						'UNITCLASS_WORKBOAT',						'TXT_KEY_UNIT_WORK_BOAT',					-1,					-1,					-1,					0,						'UNIT_WORKBOAT'						UNION ALL
-- Added for BNW
SELECT						'UNITCLASS_WRITER',						    'TXT_KEY_UNIT_WRITER',						-1,					-1,					-1,					0,						'UNIT_WRITER'						UNION ALL
SELECT						'UNITCLASS_MOUNTED_SCOUT',				    'TXT_KEY_UNIT_MOUNTED_SCOUT',				-1,					-1,					-1,					0,						'UNIT_MOUNTED_SCOUT'				UNION ALL
SELECT						'UNITCLASS_CARAVAN',					    'TXT_KEY_UNIT_CARAVAN',						-1,					-1,					-1,					0,						'UNIT_CARAVAN'						UNION ALL
SELECT						'UNITCLASS_CARGO_SHIP',						'TXT_KEY_UNIT_CARGO_SHIP',					-1,					-1,					-1,					0,						'UNIT_CARGO_SHIP'				    UNION ALL
SELECT						'UNITCLASS_MUSICIAN',						'TXT_KEY_UNIT_MUSICIAN',					-1,					-1,					-1,					0,					    'UNIT_MUSICIAN'						UNION ALL
SELECT						'UNITCLASS_ARCHAEOLOGIST',					'TXT_KEY_UNIT_ARCHAEOLOGIST',				-1,					-1,					-1,					0,				        'UNIT_ARCHAEOLOGIST'				UNION ALL
SELECT						'UNITCLASS_BAZOOKA',						'TXT_KEY_UNIT_BAZOOKA',					    -1,					-1,					-1,					0,						'UNIT_BAZOOKA'						UNION ALL
SELECT						'UNITCLASS_XCOM_SQUAD',						'TXT_KEY_UNIT_XCOM_SQUAD',					-1,					-1,					-1,					0,						'UNIT_XCOM_SQUAD'					UNION ALL
SELECT						'UNITCLASS_FOREIGNLEGION',					'TXT_KEY_UNIT_FOREIGNLEGION',				-1,					-1,					-1,					0,					    'UNIT_MUSICIAN'						UNION ALL
SELECT						'UNITCLASS_RAILROAD_GUN',					'TXT_KEY_UNIT_RAILROAD_GUN',				-1,					-1,					-1,					0,					    'UNIT_RAILROAD_GUN'					UNION ALL

SELECT						'UNITCLASS_CAVEMAN',					    'TXT_KEY_UNIT_CAVEMAN',				        -1,					15,					15,					0,					    'UNIT_CAVEMAN'					    UNION ALL
SELECT						'UNITCLASS_FIRE_EATER',					    'TXT_KEY_UNIT_FIRE_EATER',				    -1,					-1,					-1,					0,					    'UNIT_FIRE_EATER'					UNION ALL
SELECT						'UNITCLASS_SAVAGE',					        'TXT_KEY_UNIT_SAVAGE',				        -1,					-1,					-1,					0,					    'UNIT_SAVAGE'				        UNION ALL
SELECT						'UNITCLASS_KNIGHT_TEMPLAR',					 'TXT_KEY_UNIT_KNIGHT_TEMPLAR',			    -1,					-1,					-1,					0,					    'UNIT_KNIGHT_TEMPLAR'		        UNION ALL
SELECT						'UNITCLASS_RAMMBOCK',					      'TXT_KEY_UNIT_RAMMBOCK',			        -1,					-1,					-1,					0,					    'UNIT_RAMMBOCK'		                UNION ALL
SELECT						'UNITCLASS_SIEGE_TOWER',					  'TXT_KEY_UNIT_SIEGE_TOWER',			    -1,					-1,					-1,					0,					    'UNIT_SIEGE_TOWER'		            UNION ALL
SELECT						'UNITCLASS_ZWILLE',					         'TXT_KEY_UNIT_ZWILLE',			            -1,					-1,					-1,					0,					    'UNIT_ZWILLE'		                UNION ALL
SELECT						'UNITCLASS_LABORER',					     'TXT_KEY_UNIT_LABORER',			        -1,					-1,					 3,					0,					    'UNIT_LABORER'		                UNION ALL
SELECT						'UNITCLASS_GALLEYX',					     'TXT_KEY_UNIT_GALLEYX',			        -1,					-1,					-1,					0,					    'UNIT_GALLEYX'		                UNION ALL
SELECT						'UNITCLASS_SHAMAN',					         'TXT_KEY_UNIT_SHAMAN',			            -1,					-1,					-1,					0,					    'UNIT_SHAMAN'		                UNION ALL
--SELECT						'UNITCLASS_CARGO_AIR',					     'TXT_KEY_UNIT_CARGO_AIR',			        -1,					-1,					-1,					0,					    'UNIT_CARGO_AIR'		            UNION ALL
SELECT						'UNITCLASS_PROTECTED_CRUISER',		'TXT_KEY_UNIT_PROTECTED_CRUISER',			        -1,					-1,					-1,					0,					    'UNIT_PROTECTED_CRUISER'		    UNION ALL
SELECT						'UNITCLASS_UAV',					         'TXT_KEY_UNIT_UAV',			            -1,					-1,					-1,					0,					    'UNIT_UAV'		                   UNION ALL
SELECT						'UNITCLASS_EXPLORER',					     'TXT_KEY_UNIT_EXPLORER',			        -1,					-1,					-1,					0,					    'UNIT_EXPLORER'		                UNION ALL
SELECT						'UNITCLASS_LIKTOR',					         'TXT_KEY_UNIT_LIKTOR',			            -1,					-1,					-1,					0,					    'UNIT_LIKTOR'		                UNION ALL
SELECT						'UNITCLASS_SPION',					         'TXT_KEY_UNIT_SPION',			            -1,					-1,					-1,					0,					    'UNIT_SPION'		                UNION ALL
SELECT						'UNITCLASS_LAND_IRONCLAD',					 'TXT_KEY_UNIT_LAND_IRONCLAD',			    -1,					-1,					-1,					0,					    'UNIT_LAND_IRONCLAD'		        UNION ALL
SELECT						'UNITCLASS_BARBARIAN_AXMANX',			     'TXT_KEY_UNIT_BARBARIAN_AXMANX',			-1,					-1,					-1,					0,					    'UNIT_BARBARIAN_AXMANX'		        UNION ALL
SELECT						'UNITCLASS_LANDSKNECHT',			     'TXT_KEY_UNIT_LANDSKNECHT',			        -1,					-1,					-1,					0,					    'UNIT_LANDSKNECHT'		            UNION ALL
SELECT						'UNITCLASS_SIEGE',			                 'TXT_KEY_UNIT_SIEGE',			            -1,					-1,					-1,					0,					    'UNIT_SIEGE'		                UNION ALL


-- Land Units
SELECT						'UNITCLASS_ARCHER',							'TXT_KEY_UNIT_ARCHER',						-1,					-1,					-1,					0,						'UNIT_ARCHER'						UNION ALL
SELECT						'UNITCLASS_ARTILLERY',						'TXT_KEY_UNIT_ARTILLERY',					-1,					-1,					-1,					0,						'UNIT_ARTILLERY'					UNION ALL
SELECT						'UNITCLASS_ANTI_AIRCRAFT_GUN',				'Anti-Aircraft Guns',						-1,					-1,					-1,					0,						'UNIT_ANTI_AIRCRAFT_GUN'			UNION ALL
SELECT						'UNITCLASS_ANTI_TANK_GUN',					'Anti-Tank Guns',							-1,					-1,					-1,					0,						'UNIT_ANTI_TANK_GUN'				UNION ALL
SELECT						'UNITCLASS_BEAM_JUMPER',					'TXT_KEY_UNIT_BEAM_JUMPER',					-1,					-1,					-1,					0,						'UNIT_BEAM_JUMPER'					UNION ALL
SELECT						'UNITCLASS_CANNON',							'TXT_KEY_UNIT_CANNON',						-1,					-1,					-1,					0,						'UNIT_CANNON'						UNION ALL
SELECT						'UNITCLASS_CATAPULT',						'TXT_KEY_UNIT_CATAPULT',					-1,					-1,					-1,					0,						'UNIT_CATAPULT'						UNION ALL
SELECT						'UNITCLASS_CAVALRY',						'TXT_KEY_UNIT_CAVALRY',						-1,					-1,					-1,					0,						'UNIT_CAVALRY'						UNION ALL
SELECT						'UNITCLASS_CHARIOT_ARCHER',					'Chariot Archers',							-1,					-1,					-1,					0,						'UNIT_CHARIOT_ARCHER'				UNION ALL
SELECT						'UNITCLASS_COMBAT_CONTROLLER',				'TXT_KEY_UNIT_COMBAT_CONTROLLER',			-1,					-1,					-1,					0,						'UNIT_COMBAT_CONTROLLER'			UNION ALL
SELECT						'UNITCLASS_COMPOSITE_BOWMAN',				'TXT_KEY_UNIT_COMPOSITE_BOWMAN',			-1,					-1,					-1,					0,						'UNIT_COMPOSITE_BOWMAN'				UNION ALL
SELECT						'UNITCLASS_CROSSBOWMAN',					'TXT_KEY_UNIT_CROSSBOWMAN',					-1,					-1,					-1,					0,						'UNIT_CROSSBOWMAN'					UNION ALL
SELECT						'UNITCLASS_CYBERNETIC_MARAUDER',			'TXT_KEY_UNIT_CYBERNETIC_MARAUDER',			-1,					-1,					-1,					0,						'UNIT_CYBERNETIC_MARAUDER'			UNION ALL
SELECT						'UNITCLASS_FUSION_DREADNOUGHT',				'TXT_KEY_UNIT_FUSION_DREADNOUGHT',			-1,					-1,					-1,					0,						'UNIT_FUSION_DREADNOUGHT'			UNION ALL
SELECT						'UNITCLASS_FUSION_TANK',					'TXT_KEY_UNIT_FUSION_TANK',					-1,					-1,					-1,					0,						'UNIT_FUSION_TANK'					UNION ALL
SELECT						'UNITCLASS_GALLEASS',						'TXT_KEY_UNIT_GALLEASS',					-1,					-1,					-1,					0,						'UNIT_GALLEASS'						UNION ALL
SELECT						'UNITCLASS_GATLINGGUN',						'TXT_KEY_UNIT_GATLINGGUN',					-1,					-1,					-1,					0,						'UNIT_GATLINGGUN'					UNION ALL
SELECT						'UNITCLASS_GAUSS_TANK',						'TXT_KEY_UNIT_GAUSS_TANK',					-1,					-1,					-1,					0,						'UNIT_GAUSS_TANK'					UNION ALL
SELECT						'UNITCLASS_GREAT_WAR_INFANTRY',				'TXT_KEY_UNIT_GREAT_WAR_INFANTRY',			-1,					-1,					-1,					0,						'UNIT_GREAT_WAR_INFANTRY'			UNION ALL
SELECT						'UNITCLASS_HEAVY_ISOTOPE_PROJECTOR',		'TXT_KEY_UNIT_HEAVY_ISOTOPE_PROJECTOR',		-1,					-1,					-1,					0,						'UNIT_HEAVY_ISOTOPE_PROJECTOR'		UNION ALL
SELECT						'UNITCLASS_HORSEMAN',						'Horsemen',									-1,					-1,					-1,					0,						'UNIT_HORSEMAN'						UNION ALL
SELECT						'UNITCLASS_HUNTER_KILLER',					'TXT_KEY_UNIT_HUNTER_KILLER',				-1,					-1,					-1,					0,						'UNIT_HUNTER_KILLER'				UNION ALL
SELECT						'UNITCLASS_INFANTRY',						'TXT_KEY_UNIT_INFANTRY',					-1,					-1,					-1,					0,						'UNIT_INFANTRY'						UNION ALL
SELECT						'UNITCLASS_KNIGHT',							'TXT_KEY_UNIT_KNIGHT',						-1,					-1,					-1,					0,						'UNIT_KNIGHT'						UNION ALL
SELECT						'UNITCLASS_LANCER',							'Lancers',									-1,					-1,					-1,					0,						'UNIT_LANCER'						UNION ALL
SELECT						'UNITCLASS_LEAP_INFANTRY',					'TXT_KEY_UNIT_LEAP_INFANTRY',				-1,					-1,					-1,					0,						'UNIT_LEAP_INFANTRY'				UNION ALL
SELECT						'UNITCLASS_LONGSWORDSMAN',					'Longswordsmen',							-1,					-1,					-1,					0,						'UNIT_LONGSWORDSMAN'				UNION ALL
SELECT						'UNITCLASS_MACHINE_GUN',					'TXT_KEY_UNIT_MACHINE_GUN',					-1,					-1,					-1,					0,						'UNIT_MACHINE_GUN'					UNION ALL
SELECT						'UNITCLASS_MARINE',							'TXT_KEY_UNIT_MARINE',						-1,					-1,					-1,					0,						'UNIT_MARINE'						UNION ALL
SELECT						'UNITCLASS_MASS_DRIVER_ARTILLERY',			'TXT_KEY_UNIT_MASS_DRIVER_ARTILLERY',		-1,					-1,					-1,					0,						'UNIT_MASS_DRIVER_ARTILLERY'		UNION ALL
SELECT						'UNITCLASS_MECH',							'TXT_KEY_UNIT_MECH',						-1,					-1,					-1,					0,						'UNIT_MECH'							UNION ALL
SELECT						'UNITCLASS_MECHANIZED_INFANTRY',			'TXT_KEY_UNIT_MECHANIZED_INFANTRY',			-1,					-1,					-1,					0,						'UNIT_MECHANIZED_INFANTRY'			UNION ALL
SELECT						'UNITCLASS_MICRO_UAV_TEAM',					'TXT_KEY_UNIT_MICRO_UAV_TEAM',				-1,					-1,					-1,					0,						'UNIT_MICRO_UAV_TEAM'				UNION ALL
SELECT						'UNITCLASS_MISSILE_SQUAD',					'TXT_KEY_UNIT_MISSILE_SQUAD',				-1,					-1,					-1,					0,						'UNIT_MISSILE_SQUAD'				UNION ALL
SELECT						'UNITCLASS_MOBILE_SAM',						'TXT_KEY_UNIT_MOBILE_SAM',					-1,					-1,					-1,					0,						'UNIT_MOBILE_SAM'					UNION ALL
SELECT						'UNITCLASS_MODERN_ARMOR',					'TXT_KEY_UNIT_MODERN_ARMOR',				-1,					-1,					-1,					0,						'UNIT_MODERN_ARMOR'					UNION ALL
SELECT						'UNITCLASS_MUSKETMAN',						'TXT_KEY_UNIT_MUSKETMAN',					-1,					-1,					-1,					0,						'UNIT_MUSKETMAN'					UNION ALL
SELECT						'UNITCLASS_PARATROOPER',					'TXT_KEY_UNIT_PARATROOPER',					-1,					-1,					-1,					0,						'UNIT_PARATROOPER'					UNION ALL
SELECT						'UNITCLASS_PARTICLE_GRID_AIR_DEFENSE',		'TXT_KEY_UNIT_PARTICLE_GRID_AIR_DEFENSE',	-1,					-1,					-1,					0,						'UNIT_PARTICLE_GRID_AIR_DEFENSE'	UNION ALL
SELECT						'UNITCLASS_PIKEMAN',						'TXT_KEY_UNIT_PIKEMAN',						-1,					-1,					-1,					0,						'UNIT_PIKEMAN'						UNION ALL
SELECT						'UNITCLASS_POWERED_INFANTRY',				'TXT_KEY_UNIT_POWERED_INFANTRY',			-1,					-1,					-1,					0,						'UNIT_POWERED_INFANTRY'				UNION ALL
SELECT						'UNITCLASS_RIFLEMAN',						'TXT_KEY_UNIT_RIFLEMAN',					-1,					-1,					-1,					0,						'UNIT_RIFLEMAN'						UNION ALL
SELECT						'UNITCLASS_ROCKET_ARTILLERY',				'Rocket Artillery',							-1,					-1,					-1,					0,						'UNIT_ROCKET_ARTILLERY'				UNION ALL
SELECT						'UNITCLASS_SCOUT',							'TXT_KEY_UNIT_SCOUT',						-1,					-1,					-1,					0,						'UNIT_SCOUT'						UNION ALL
SELECT						'UNITCLASS_SPEARMAN',						'TXT_KEY_UNIT_SPEARMAN',					-1,					-1,					-1,					0,						'UNIT_SPEARMAN'						UNION ALL
SELECT						'UNITCLASS_SWORDSMAN',						'TXT_KEY_UNIT_SWORDSMAN',					-1,					-1,					-1,					0,						'UNIT_SWORDSMAN'					UNION ALL
SELECT						'UNITCLASS_TACTICAL_LASER_AIR_DEFENSE',		'TXT_KEY_UNIT_TACTICAL_LASER_AIR_DEFENSE',	-1,					-1,					-1,					0,						'UNIT_TACTICAL_LASER_AIR_DEFENSE'	UNION ALL
SELECT						'UNITCLASS_TANK',							'TXT_KEY_UNIT_TANK',						-1,					-1,					-1,					0,						'UNIT_TANK'							UNION ALL
SELECT						'UNITCLASS_TREBUCHET',						'TXT_KEY_UNIT_TREBUCHET',					-1,					-1,					-1,					0,						'UNIT_TREBUCHET'					UNION ALL
SELECT						'UNITCLASS_WARRIOR',						'TXT_KEY_UNIT_WARRIOR',						-1,					-1,					-1,					0,						'UNIT_WARRIOR'						UNION ALL
SELECT						'UNITCLASS_WWI_TANK',						'TXT_KEY_UNIT_WWI_TANK',					-1,					-1,					-1,					0,						'UNIT_WWI_TANK'						UNION ALL

-- Sea Units
SELECT						'UNITCLASS_BATTLESHIP',						'TXT_KEY_UNIT_BATTLESHIP',					-1,					-1,					-1,					0,						'UNIT_BATTLESHIP'					UNION ALL
SELECT						'UNITCLASS_CARAVEL',						'TXT_KEY_UNIT_CARAVEL',						-1,					-1,					-1,					0,						'UNIT_CARAVEL'						UNION ALL
SELECT						'UNITCLASS_CARRIER',						'TXT_KEY_UNIT_CARRIER',						-1,					-1,					-1,					0,						'UNIT_CARRIER'						UNION ALL
SELECT						'UNITCLASS_CGX_CRUISER',					'TXT_KEY_UNIT_CGX_CRUISER',					-1,					-1,					-1,					0,						'UNIT_CGX_CRUISER'					UNION ALL
SELECT						'UNITCLASS_DDX_DESTROYER',					'TXT_KEY_UNIT_DDX_DESTROYER',				-1,					-1,					-1,					0,						'UNIT_DDX_DESTROYER'				UNION ALL
SELECT						'UNITCLASS_DESTROYER',						'TXT_KEY_UNIT_DESTROYER',					-1,					-1,					-1,					0,						'UNIT_DESTROYER'					UNION ALL
SELECT						'UNITCLASS_FRIGATE',						'TXT_KEY_UNIT_FRIGATE',						-1,					-1,					-1,					0,						'UNIT_FRIGATE'						UNION ALL
SELECT						'UNITCLASS_FUSION_SUPERCARRIER',			'TXT_KEY_UNIT_FUSION_SUPERCARRIER',			-1,					-1,					-1,					0,						'UNIT_FUSION_SUPERCARRIER'			UNION ALL
SELECT						'UNITCLASS_GALLEY',							'TXT_KEY_UNIT_GALLEY',						-1,					-1,					-1,					0,						'NONE'								UNION ALL
SELECT						'UNITCLASS_IRONCLAD',						'TXT_KEY_UNIT_IRONCLAD',					-1,					-1,					-1,					0,						'UNIT_IRONCLAD'						UNION ALL
SELECT						'UNITCLASS_MISSILE_CRUISER',				'TXT_KEY_UNIT_MISSILE_CRUISER',				-1,					-1,					-1,					0,						'UNIT_MISSILE_CRUISER'				UNION ALL
SELECT						'UNITCLASS_NUCLEAR_SUBMARINE',				'TXT_KEY_UNIT_NUCLEAR_SUBMARINE',			-1,					-1,					-1,					0,						'UNIT_NUCLEAR_SUBMARINE'			UNION ALL
SELECT						'UNITCLASS_PLASMA_DESTROYER',				'TXT_KEY_UNIT_PLASMA_DESTROYER',			-1,					-1,					-1,					0,						'UNIT_PLASMA_DESTROYER'				UNION ALL
SELECT						'UNITCLASS_PRIVATEER',						'TXT_KEY_UNIT_PRIVATEER',					-1,					-1,					-1,					0,						'UNIT_PRIVATEER'					UNION ALL
SELECT						'UNITCLASS_STEALTH_GUNSHIP',				'TXT_KEY_UNIT_STEALTH_GUNSHIP',				-1,					-1,					-1,					0,						'UNIT_STEALTH_GUNSHIP'				UNION ALL
SELECT						'UNITCLASS_STEALTH_SUBMARINE',				'TXT_KEY_UNIT_STEALTH_SUBMARINE',			-1,					-1,					-1,					0,						'UNIT_STEALTH_SUBMARINE'			UNION ALL
SELECT						'UNITCLASS_SUBMARINE',						'TXT_KEY_UNIT_SUBMARINE',					-1,					-1,					-1,					0,						'UNIT_SUBMARINE'					UNION ALL
SELECT						'UNITCLASS_SUBMERSIBLE_CARRIER',			'TXT_KEY_UNIT_SUBMERSIBLE_CARRIER',			-1,					-1,					-1,					0,						'UNIT_SUBMERSIBLE_CARRIER'			UNION ALL
SELECT						'UNITCLASS_SUPERCARRIER',					'TXT_KEY_UNIT_SUPERCARRIER',				-1,					-1,					-1,					0,						'UNIT_SUPERCARRIER'					UNION ALL
SELECT						'UNITCLASS_SUPERCAVITATING_SUBMARINE',		'TXT_KEY_UNIT_SUPERCAVITATING_SUBMARINE',	-1,					-1,					-1,					0,						'UNIT_SUPERCAVITATING_SUBMARINE'	UNION ALL
SELECT						'UNITCLASS_TRIREME',						'TXT_KEY_UNIT_TRIREME',						-1,					-1,					-1,					0,						'UNIT_TRIREME'						UNION ALL

-- Air Units
SELECT						'UNITCLASS_AIRSHIP',						'TXT_KEY_UNIT_AIRSHIP',						-1,					-1,					-1,					0,						'UNIT_AIRSHIP'						UNION ALL
SELECT						'UNITCLASS_SKY_FORTRESS',					'TXT_KEY_UNIT_SKY_FORTRESS',						-1,					-1,					-1,					0,						'UNIT_SKY_FORTRESS'						UNION ALL

SELECT						'UNITCLASS_BOMBER',							'TXT_KEY_UNIT_BOMBER',						-1,					-1,					-1,					0,						'UNIT_BOMBER'						UNION ALL
SELECT						'UNITCLASS_FIGHTER',						'TXT_KEY_UNIT_FIGHTER',						-1,					-1,					-1,					0,						'UNIT_FIGHTER'						UNION ALL
SELECT						'UNITCLASS_HYPERSONIC_BOMBER',				'TXT_KEY_UNIT_HYPERSONIC_BOMBER',			-1,					-1,					-1,					0,						'UNIT_HYPERSONIC_BOMBER'			UNION ALL
SELECT						'UNITCLASS_HELICOPTER_GUNSHIP',				'Helicopter Gunships',						-1,					-1,					-1,					0,						'UNIT_HELICOPTER_GUNSHIP'			UNION ALL
SELECT						'UNITCLASS_HYPERSONIC_INTERCEPTOR',			'TXT_KEY_UNIT_HYPERSONIC_INTERCEPTOR',		-1,					-1,					-1,					0,						'UNIT_HYPERSONIC_INTERCEPTOR'		UNION ALL
SELECT						'UNITCLASS_JET_FIGHTER',					'TXT_KEY_UNIT_JET_FIGHTER',					-1,					-1,					-1,					0,						'UNIT_JET_FIGHTER'					UNION ALL
SELECT						'UNITCLASS_SPACE_BOMBER',					'TXT_KEY_UNIT_SPACE_BOMBER',				-1,					-1,					-1,					0,						'UNIT_SPACE_BOMBER'					UNION ALL
SELECT						'UNITCLASS_SPACE_FIGHTER',					'TXT_KEY_UNIT_SPACE_FIGHTER',				-1,					-1,					-1,					0,						'UNIT_SPACE_FIGHTER'				UNION ALL
SELECT						'UNITCLASS_STEALTH_BOMBER',					'TXT_KEY_UNIT_STEALTH_BOMBER',				-1,					-1,					-1,					0,						'UNIT_STEALTH_BOMBER'				UNION ALL
SELECT						'UNITCLASS_STEALTH_FIGHTER',				'TXT_KEY_UNIT_STEALTH_FIGHTER',				-1,					-1,					-1,					0,						'UNIT_STEALTH_FIGHTER'				UNION ALL
SELECT						'UNITCLASS_TRIPLANE',						'TXT_KEY_UNIT_TRIPLANE',					-1,					-1,					-1,					0,						'UNIT_TRIPLANE'						UNION ALL
SELECT						'UNITCLASS_UNMANNED_AIRCRAFT',				'TXT_KEY_UNIT_UNMANNED_AIRCRAFT',			-1,					-1,					-1,					0,						'UNIT_UNMANNED_AIRCRAFT'			UNION ALL
SELECT						'UNITCLASS_WWI_BOMBER',						'TXT_KEY_UNIT_WWI_BOMBER',					-1,					-1,					-1,					0,						'UNIT_WWI_BOMBER'					UNION ALL

-- Missiles
SELECT						'UNITCLASS_ATOMIC_BOMB',					'Atomic Bomb',								-1,					-1,					-1,					0,						'UNIT_ATOMIC_BOMB'					UNION ALL
SELECT						'UNITCLASS_GUIDED_MISSILE',					'TXT_KEY_UNIT_GUIDED_MISSILE',				-1,					-1,					-1,					0,						'UNIT_GUIDED_MISSILE'				UNION ALL
SELECT						'UNITCLASS_HYPERSONIC_CRUISE_MISSILE',		'TXT_KEY_UNIT_HYPERSONIC_CRUISE_MISSILE',	-1,					-1,					-1,					0,						'UNIT_HYPERSONIC_CRUISE_MISSILE'	UNION ALL
SELECT						'UNITCLASS_NUCLEAR_MISSILE',				'TXT_KEY_UNIT_NUCLEAR_MISSILE',				-1,					-1,					-1,					0,						'UNIT_NUCLEAR_MISSILE'				UNION ALL
SELECT						'UNITCLASS_ORBITAL_STRIKE_MISSILE',			'TXT_KEY_UNIT_ORBITAL_STRIKE_MISSILE',		-1,					-1,					-1,					0,						'UNIT_ORBITAL_STRIKE_MISSILE'		UNION ALL

-- Great People & Misc
SELECT						'UNITCLASS_ARTIST',							'TXT_KEY_UNIT_GREAT_ARTIST',				-1,					-1,					-1,					0,						'UNIT_ARTIST'						UNION ALL
SELECT						'UNITCLASS_CIVIL_ENGINEER',					'TXT_KEY_UNIT_CIVIL_ENGINEER',				-1,					-1,					-1,					0,						'UNIT_CIVIL_ENGINEER'				UNION ALL
SELECT						'UNITCLASS_ENGINEER',						'TXT_KEY_UNIT_GREAT_ENGINEER',				-1,					-1,					-1,					0,						'UNIT_ENGINEER'						UNION ALL
SELECT						'UNITCLASS_GREAT_ADMIRAL',					'TXT_KEY_UNIT_GREAT_ADMIRAL',				-1,					-1,					-1,					0,						'UNIT_GREAT_ADMIRAL'				UNION ALL
SELECT						'UNITCLASS_GREAT_GENERAL',					'TXT_KEY_UNIT_GREAT_GENERAL',				-1,					-1,					-1,					0,						'UNIT_GREAT_GENERAL'				UNION ALL
SELECT						'UNITCLASS_INQUISITOR',						'TXT_KEY_UNIT_INQUISITOR',					-1,					-1,					-1,					0,						'UNIT_INQUISITOR'					UNION ALL
SELECT						'UNITCLASS_MERCHANT',						'TXT_KEY_UNIT_GREAT_MERCHANT',				-1,					-1,					-1,					0,						'UNIT_MERCHANT'						UNION ALL
SELECT						'UNITCLASS_MISSIONARY',						'TXT_KEY_UNIT_MISSIONARY',					-1,					-1,					-1,					0,						'UNIT_MISSIONARY'					UNION ALL
SELECT						'UNITCLASS_PROPHET',						'TXT_KEY_UNIT_PROPHET',						-1,					-1,					-1,					0,						'UNIT_PROPHET'						UNION ALL
SELECT						'UNITCLASS_SCIENTIST',						'TXT_KEY_UNIT_GREAT_SCIENTIST',				-1,					-1,					-1,					0,						'UNIT_SCIENTIST'					UNION ALL

-- Space Units
SELECT						'UNITCLASS_SS_COCKPIT',						'TXT_KEY_SS_COCKPIT',						 -1,				-1,					1,					0,						'UNIT_SS_COCKPIT'					UNION ALL
SELECT						'UNITCLASS_SS_BOOSTER',						'TXT_KEY_SS_BOOSTER',						 -1,				-1,					3,					0,						'UNIT_SS_BOOSTER'					UNION ALL
SELECT						'UNITCLASS_SS_ENGINE',						'TXT_KEY_SS_ENGINE',						 -1,				-1,					1,					0,						'UNIT_SS_ENGINE'					UNION ALL
SELECT						'UNITCLASS_SS_STASIS_CHAMBER',				'TXT_KEY_SS_STASIS_CHAMBER',				 -1,				-1,					1,					0,						'UNIT_SS_STASIS_CHAMBER';


