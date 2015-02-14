-- Delete Existing Table
DROP TABLE IF EXISTS Technology_Flavors;
-- Create New Table
CREATE TABLE Technology_Flavors ('TechType' text , 
								 'FlavorType' text , 
								 'Flavor' integer , foreign key (TechType) references Technologies(Type), foreign key (FlavorType) references Flavors(Type));
-- Polulate Table
INSERT INTO Technology_Flavors (	TechType,									FlavorType,									Flavor)
--New Entries for Neo--overworked
--Summary
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_HEAT_TREATMENT',					        'FLAVOR_INFRASTRUCTURE',					 9							UNION ALL
SELECT								'TECH_HEAT_TREATMENT',					        'FLAVOR_PRODUCTION',				         8                           UNION ALL
SELECT								'TECH_HEAT_TREATMENT',					        'FLAVOR_GOLD',					             6							UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_MEGAFAUNA',					            'FLAVOR_INFRASTRUCTURE',					 9							UNION ALL
SELECT								'TECH_MEGAFAUNA',					            'FLAVOR_GROWTH',				             5                           UNION ALL
SELECT								'TECH_MEGAFAUNA',					            'FLAVOR_TILE_IMPROVEMENT',					10							UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_FOREST_FARMING',					        'FLAVOR_INFRASTRUCTURE',					10							UNION ALL
SELECT								'TECH_FOREST_FARMING',					        'FLAVOR_GROWTH',				            10                           UNION ALL
SELECT								'TECH_FOREST_FARMING',					        'FLAVOR_GOLD',					             7							UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_HERDING',					                'FLAVOR_TILE_IMPROVEMENT',					 7							UNION ALL
SELECT								'TECH_HERDING',					                'FLAVOR_WONDER',				            20                           UNION ALL
SELECT								'TECH_HERDING',					                'FLAVOR_GOLD',					            10							UNION ALL
SELECT								'TECH_HERDING',					                'FLAVOR_CULTURE',					         6							UNION ALL
SELECT								'TECH_HERDING',					                'FLAVOR_GREAT_PEOPLE',					     6							UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_TIPI',					                'FLAVOR_TILE_IMPROVEMENT',				    11                           UNION ALL
SELECT								'TECH_TIPI',					                'FLAVOR_GOLD',					             5							UNION ALL
SELECT								'TECH_TIPI',					                'FLAVOR_INFRASTRUCTURE',					 9							UNION ALL
SELECT								'TECH_TIPI',					                'FLAVOR_GROWTH',					         5							UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_SIMPLE_WOOD_WORKING',					    'FLAVOR_WONDER',				            25                           UNION ALL
SELECT								'TECH_SIMPLE_WOOD_WORKING',					    'FLAVOR_GOLD',					             8							UNION ALL
SELECT								'TECH_SIMPLE_WOOD_WORKING',					    'FLAVOR_INFRASTRUCTURE',					 9							UNION ALL
SELECT								'TECH_SIMPLE_WOOD_WORKING',					    'FLAVOR_CULTURE',					         5							UNION ALL
SELECT								'TECH_SIMPLE_WOOD_WORKING',					    'FLAVOR_GREAT_PEOPLE',					     6							UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_CORPORATION',					            'FLAVOR_WONDER',					        25							UNION ALL
SELECT								'TECH_CORPORATION',					            'FLAVOR_HAPPINESS',					         6							UNION ALL
SELECT								'TECH_CORPORATION',					            'FLAVOR_CULTURE',					         6							UNION ALL
SELECT								'TECH_CORPORATION',					            'FLAVOR_GREAT_PEOPLE',					     6							UNION ALL
SELECT								'TECH_CORPORATION',					            'FLAVOR_GOLD',					             5							UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_SURVIVAL',					            'FLAVOR_TILE_IMPROVEMENT',					10							UNION ALL
SELECT								'TECH_SURVIVAL',					            'FLAVOR_INFRASTRUCTURE',					10							UNION ALL
SELECT								'TECH_SURVIVAL',					            'FLAVOR_CULTURE',					        11							UNION ALL
SELECT								'TECH_SURVIVAL',					            'FLAVOR_GOLD',					             9							UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_CHOPPING',					            'FLAVOR_TILE_IMPROVEMENT',					8							UNION ALL
SELECT								'TECH_CHOPPING',					            'FLAVOR_INFRASTRUCTURE',					10							UNION ALL
SELECT								'TECH_CHOPPING',					            'FLAVOR_CULTURE',					         7							UNION ALL
SELECT								'TECH_CHOPPING',					            'FLAVOR_WONDER',					        25							UNION ALL
SELECT								'TECH_CHOPPING',					            'FLAVOR_RELIGION',					         7						    UNION ALL
SELECT								'TECH_CHOPPING',					            'FLAVOR_GREAT_PEOPLE',					     6						    UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_HARPOONING',					            'FLAVOR_TILE_IMPROVEMENT',				    11							UNION ALL
SELECT								'TECH_HARPOONING',					            'FLAVOR_GROWTH',					         8							UNION ALL
SELECT								'TECH_HARPOONING',					            'FLAVOR_INFRASTRUCTURE',					10						    UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_CHIEFTAIN',					            'FLAVOR_WONDER',				             25							UNION ALL
SELECT								'TECH_CHIEFTAIN',					            'FLAVOR_CULTURE',					          7							UNION ALL
SELECT								'TECH_CHIEFTAIN',					            'FLAVOR_GOLD',					             10						    UNION ALL
SELECT								'TECH_CHIEFTAIN',					            'FLAVOR_GREAT_PEOPLE',					      6						    UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_NIMROD',					                'FLAVOR_WONDER',				             25							UNION ALL
SELECT								'TECH_NIMROD',					                'FLAVOR_CULTURE',					          6						    UNION ALL
SELECT								'TECH_NIMROD',					                'FLAVOR_PRODUCTION',					      6						    UNION ALL
SELECT								'TECH_NIMROD',					                'FLAVOR_EXPANSION',					         151						    UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_AXT',					                    'FLAVOR_OFFENSE',				             12							UNION ALL
SELECT								'TECH_AXT',					                    'FLAVOR_DEFENSE',					         10						    UNION ALL
SELECT								'TECH_AXT',					                    'FLAVOR_PRODUCTION',					      6						    UNION ALL
SELECT								'TECH_AXT',					                    'FLAVOR_RANGED',					         13						    UNION ALL
SELECT								'TECH_AXT',					                    'FLAVOR_MOBILE',					         10					        UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_APOLLO',					                'FLAVOR_WONDER',					         30					        UNION ALL
SELECT								'TECH_APOLLO',					                'FLAVOR_GROWTH',					         152					        UNION ALL
SELECT								'TECH_APOLLO',					                'FLAVOR_INFRASTRUCTURE',					 10						    UNION ALL
SELECT								'TECH_APOLLO',					                'FLAVOR_GREAT_PEOPLE',					      7					        UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_ANIMISM',					                'FLAVOR_WONDER',					         27					        UNION ALL
SELECT								'TECH_ANIMISM',					                'FLAVOR_INFRASTRUCTURE',					  6				            UNION ALL
SELECT								'TECH_ANIMISM',					                'FLAVOR_CULTURE',					          7						    UNION ALL
SELECT								'TECH_ANIMISM',					                'FLAVOR_GREAT_PEOPLE',					      7					        UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_POISON_CRAFTING',					        'FLAVOR_GROWTH',					          9					        UNION ALL
SELECT								'TECH_POISON_CRAFTING',					        'FLAVOR_INFRASTRUCTURE',					  6				            UNION ALL
SELECT								'TECH_POISON_CRAFTING',					        'FLAVOR_GOLD',					              7						    UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_STONE_BUILDINGS',					        'FLAVOR_GREAT_PEOPLE',					      7				            UNION ALL
SELECT								'TECH_STONE_BUILDINGS',					        'FLAVOR_CULTURE',					          8				            UNION ALL
SELECT								'TECH_STONE_BUILDINGS',					        'FLAVOR_GOLD',					             10						    UNION ALL
SELECT								'TECH_STONE_BUILDINGS',					        'FLAVOR_WONDER',					         30			                UNION ALL
SELECT								'TECH_STONE_BUILDINGS',					        'FLAVOR_RELIGION',					          9						    UNION ALL
SELECT								'TECH_STONE_BUILDINGS',					        'FLAVOR_PRODUCTION',					      7						    UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_HEALING',					                'FLAVOR_GROWTH',					         10						    UNION ALL
SELECT								'TECH_HEALING',					                'FLAVOR_INFRASTRUCTURE',					  5			                UNION ALL
SELECT								'TECH_HEALING',					                'FLAVOR_GREAT_PEOPLE',					      5						    UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_ORGANIC_FARMING',					        'FLAVOR_GROWTH',					         12						    UNION ALL
SELECT								'TECH_ORGANIC_FARMING',					        'FLAVOR_INFRASTRUCTURE',					 10			                UNION ALL
SELECT								'TECH_ORGANIC_FARMING',					        'FLAVOR_TILE_IMPROVEMENT',					  6						    UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_SMELTING',					            'FLAVOR_WONDER',					         30					    UNION ALL
SELECT								'TECH_SMELTING',					            'FLAVOR_PRODUCTION',					     153			                UNION ALL
SELECT								'TECH_SMELTING',					            'FLAVOR_TILE_IMPROVEMENT',					  9						    UNION ALL
SELECT								'TECH_SMELTING',					            'FLAVOR_GOLD',					             10						    UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_PIRACY',					                'FLAVOR_GROWTH',					         -5			                UNION ALL
SELECT								'TECH_PIRACY',					                'FLAVOR_HAPPINESS',					         -5						    UNION ALL
SELECT								'TECH_PIRACY',					                'FLAVOR_CULTURE',					          8						    UNION ALL
SELECT								'TECH_PIRACY',					                'FLAVOR_TILE_IMPROVEMENT',					 154						    UNION ALL
SELECT								'TECH_PIRACY',					                'FLAVOR_PRODUCTION',					     10						    UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_ARISTOCRACYX',					        'FLAVOR_WONDER',					         30						UNION ALL
SELECT								'TECH_ARISTOCRACYX',					        'FLAVOR_CULTURE',					         16					    UNION ALL
SELECT								'TECH_ARISTOCRACYX',					        'FLAVOR_RELIGION',					         12						UNION ALL
SELECT								'TECH_ARISTOCRACYX',					        'FLAVOR_GOLD',					              5					    UNION ALL
SELECT								'TECH_ARISTOCRACYX',					        'FLAVOR_TILE_IMPROVEMENT',					  9						UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_PIETY',					                'FLAVOR_WONDER',					         30					    UNION ALL
SELECT								'TECH_PIETY',					                'FLAVOR_RELIGION',					         16						UNION ALL
SELECT								'TECH_PIETY',					                'FLAVOR_CULTURE',					         155					    UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_HERITAGE',					            'FLAVOR_WONDER',					         30					    UNION ALL
SELECT								'TECH_HERITAGE',					            'FLAVOR_RELIGION',					         16						UNION ALL
SELECT								'TECH_HERITAGE',					            'FLAVOR_CULTURE',					         156					    UNION ALL
SELECT								'TECH_HERITAGE',					            'FLAVOR_HAPPINESS',					          9						UNION ALL
SELECT								'TECH_HERITAGE',					            'FLAVOR_SCIENCE',					         10					    UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_TATTOO',					                'FLAVOR_CULTURE',					         12					    UNION ALL
SELECT								'TECH_TATTOO',					                'FLAVOR_GREAT_PEOPLE',					      7						UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_ANCIENT_MACHINERY',					    'FLAVOR_WONDER',					         30						UNION ALL
SELECT								'TECH_ANCIENT_MACHINERY',					    'FLAVOR_CULTURE',					         12					    UNION ALL
SELECT								'TECH_ANCIENT_MACHINERY',					    'FLAVOR_PRODUCTION',					      9						UNION ALL
SELECT								'TECH_ANCIENT_MACHINERY',					    'FLAVOR_SCIENCE',					         14					    UNION ALL
SELECT								'TECH_ANCIENT_MACHINERY',					    'FLAVOR_TILE_IMPROVEMENT',					  9				        UNION ALL
SELECT								'TECH_ANCIENT_MACHINERY',					    'FLAVOR_I_SEA_TRADE_ROUTE',					 20					    UNION ALL
SELECT								'TECH_ANCIENT_MACHINERY',					    'FLAVOR_I_LAND_TRADE_ROUTE',			     20				        UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_COMMERCE',					            'FLAVOR_GOLD',					             17					    UNION ALL
SELECT								'TECH_COMMERCE',					            'FLAVOR_TILE_IMPROVEMENT',					  8				        UNION ALL
SELECT								'TECH_COMMERCE',					            'FLAVOR_GREAT_PEOPLE',					      7					    UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_PATRONAGEX',					            'FLAVOR_GOLD',					             17					    UNION ALL
SELECT								'TECH_PATRONAGEX',					            'FLAVOR_WONDER',					         30				        UNION ALL
SELECT								'TECH_PATRONAGEX',					            'FLAVOR_GREAT_PEOPLE',					      7					    UNION ALL
SELECT								'TECH_PATRONAGEX',					            'FLAVOR_HAPPINESS',					         10				        UNION ALL
SELECT								'TECH_PATRONAGEX',					            'FLAVOR_CULTURE',					         17					    UNION ALL
SELECT								'TECH_PATRONAGEX',					            'FLAVOR_RELIGION',					         157					    UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_CARAVAN_TRAIN',					        'FLAVOR_I_LAND_TRADE_ROUTE',			     25				        UNION ALL
SELECT								'TECH_CARAVAN_TRAIN',					        'FLAVOR_GOLD',					             18				        UNION ALL
SELECT								'TECH_CARAVAN_TRAIN',					        'FLAVOR_TILE_IMPROVEMENT',					  7					    UNION ALL
SELECT								'TECH_CARAVAN_TRAIN',					        'FLAVOR_I_TRADE_DESTINATION',			     158					    UNION ALL
SELECT								'TECH_CARAVAN_TRAIN',					        'FLAVOR_I_TRADE_ORIGIN',			         159					    UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_ATHLETICS',					            'FLAVOR_HAPPINESS',					         13					    UNION ALL
SELECT								'TECH_ATHLETICS',					            'FLAVOR_GROWTH',			                  8					    UNION ALL
SELECT								'TECH_ATHLETICS',					            'FLAVOR_MILITARY_TRAINING',			         160					    UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_GERECHTIGKEIT',					        'FLAVOR_CULTURE',					          5					    UNION ALL
SELECT								'TECH_GERECHTIGKEIT',					        'FLAVOR_TILE_IMPROVEMENT',			         161				        UNION ALL
SELECT								'TECH_GERECHTIGKEIT',					        'FLAVOR_PRODUCTION',			             12					    UNION ALL
SELECT								'TECH_GERECHTIGKEIT',					        'FLAVOR_INFRASTRUCTURE',			         162				        UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_ARCHIMEDES',					            'FLAVOR_CULTURE',					          9					    UNION ALL
SELECT								'TECH_ARCHIMEDES',					            'FLAVOR_WONDER',			                 30				        UNION ALL
SELECT								'TECH_ARCHIMEDES',					            'FLAVOR_SCIENCE',			                 17					    UNION ALL
SELECT								'TECH_ARCHIMEDES',					            'FLAVOR_GREAT_PEOPLE',			              9				        UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_ORTHOGRAPHY',					            'FLAVOR_CULTURE',					         11					    UNION ALL
SELECT								'TECH_ORTHOGRAPHY',					            'FLAVOR_WONDER',			                 30				        UNION ALL
SELECT								'TECH_ORTHOGRAPHY',					            'FLAVOR_SCIENCE',			                 19					    UNION ALL
SELECT								'TECH_ORTHOGRAPHY',					            'FLAVOR_GREAT_PEOPLE',			             11				        UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_ANCIENT_MEDICINE',					    'FLAVOR_GROWTH',					         163					    UNION ALL
SELECT								'TECH_ANCIENT_MEDICINE',					    'FLAVOR_TILE_IMPROVEMENT',			         10				        UNION ALL
SELECT								'TECH_ANCIENT_MEDICINE',					    'FLAVOR_SCIENCE',			                  8					    UNION ALL
SELECT								'TECH_ANCIENT_MEDICINE',					    'FLAVOR_GREAT_PEOPLE',			              9				        UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_CONCRETE',					            'FLAVOR_TILE_IMPROVEMENT',			         10				        UNION ALL
SELECT								'TECH_CONCRETE',					            'FLAVOR_GOLD',			                     10					    UNION ALL
SELECT								'TECH_CONCRETE',					            'FLAVOR_GREAT_PEOPLE',			              7				        UNION ALL
SELECT								'TECH_CONCRETE',					            'FLAVOR_CULTURE',			                  7				        UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_PAPER_MILL',					            'FLAVOR_GOLD',			                      7				    UNION ALL
SELECT								'TECH_PAPER_MILL',					            'FLAVOR_PRODUCTION',			              7				        UNION ALL
SELECT								'TECH_PAPER_MILL',					            'FLAVOR_SCIENCE',			                 164				        UNION ALL
SELECT								'TECH_PAPER_MILL',					            'FLAVOR_INFRASTRUCTURE',			         165				        UNION ALL
SELECT								'TECH_PAPER_MILL',					            'FLAVOR_TILE_IMPROVEMENT',			         166				        UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_WATERWORKING',					        'FLAVOR_GROWTH',			                  7				        UNION ALL
SELECT								'TECH_WATERWORKING',					        'FLAVOR_NAVAL_GROWTH',			             167				        UNION ALL
SELECT								'TECH_WATERWORKING',					        'FLAVOR_NAVAL_TILE_IMPROVEMENT',			 168				        UNION ALL
SELECT								'TECH_WATERWORKING',					        'FLAVOR_INFRASTRUCTURE',			         10				        UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_MOUNTAINEERING',					        'FLAVOR_CULTURE',			                 11				        UNION ALL
SELECT								'TECH_MOUNTAINEERING',					        'FLAVOR_DIPLOMACY',			                 10				        UNION ALL
SELECT								'TECH_MOUNTAINEERING',					        'FLAVOR_TILE_IMPROVEMENT',			         10				        UNION ALL
SELECT								'TECH_MOUNTAINEERING',					        'FLAVOR_INFRASTRUCTURE',			         10				        UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_AQUAPONICS',					            'FLAVOR_GROWTH',			                 169				        UNION ALL
SELECT								'TECH_AQUAPONICS',					            'FLAVOR_EXPANSION',			                 10				        UNION ALL
SELECT								'TECH_AQUAPONICS',					            'FLAVOR_TILE_IMPROVEMENT',			         121				        UNION ALL
SELECT								'TECH_AQUAPONICS',					            'FLAVOR_INFRASTRUCTURE',			         122				        UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_DRYLAND',					                'FLAVOR_GROWTH',			                 123				        UNION ALL
SELECT								'TECH_DRYLAND',					                'FLAVOR_GOLD',			                     10				        UNION ALL
SELECT								'TECH_DRYLAND',					                'FLAVOR_TILE_IMPROVEMENT',			         124				        UNION ALL
SELECT								'TECH_DRYLAND',					                'FLAVOR_INFRASTRUCTURE',			         125				        UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_STONES',					                'FLAVOR_WONDER',			                 30				        UNION ALL
SELECT								'TECH_STONES',					                'FLAVOR_GOLD',			                     10				        UNION ALL
SELECT								'TECH_STONES',					                'FLAVOR_TILE_IMPROVEMENT',			         11				        UNION ALL
SELECT								'TECH_STONES',					                'FLAVOR_CULTURE',			                  7				        UNION ALL
SELECT								'TECH_STONES',					                'FLAVOR_PRODUCTION',			             10				        UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_HERALDRY',					            'FLAVOR_DIPLOMACY',			                 126				        UNION ALL
SELECT								'TECH_HERALDRY',					            'FLAVOR_GOLD',			                     10				        UNION ALL
SELECT								'TECH_HERALDRY',					            'FLAVOR_TILE_IMPROVEMENT',			         16				        UNION ALL
SELECT								'TECH_HERALDRY',					            'FLAVOR_DEFENSE',			                 25				        UNION ALL
SELECT								'TECH_HERALDRY',					            'FLAVOR_CITY_DEFENSE',			             10				        UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_PERSPECTIVE',					            'FLAVOR_GOLD',			                      8				        UNION ALL
SELECT								'TECH_PERSPECTIVE',					            'FLAVOR_TILE_IMPROVEMENT',			         10				        UNION ALL
SELECT								'TECH_PERSPECTIVE',					            'FLAVOR_DIPLOMACY',			                 127				        UNION ALL
SELECT								'TECH_PERSPECTIVE',					            'FLAVOR_ESPIONAGE',			                 25				        UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_AQUA_FARMING',					        'FLAVOR_GROWTH',			                 14				        UNION ALL
SELECT								'TECH_AQUA_FARMING',					        'FLAVOR_NAVAL_GROWTH',			             20			            UNION ALL
SELECT								'TECH_AQUA_FARMING',					        'FLAVOR_NAVAL_TILE_IMPROVEMENT',			 128				        UNION ALL
SELECT								'TECH_AQUA_FARMING',					        'FLAVOR_INFRASTRUCTURE',			         11				        UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_SNOW',					                'FLAVOR_PRODUCTION',			              8				        UNION ALL
SELECT								'TECH_SNOW',					                'FLAVOR_GOLD',			                     18			            UNION ALL
SELECT								'TECH_SNOW',					                'FLAVOR_WONDER',			                 30				        UNION ALL
SELECT								'TECH_SNOW',					                'FLAVOR_INFRASTRUCTURE',			         13				        UNION ALL
SELECT								'TECH_SNOW',					                'FLAVOR_GREAT_PEOPLE',			              9				        UNION ALL
SELECT								'TECH_SNOW',					                'FLAVOR_I_LAND_TRADE_ROUTE',			     129				        UNION ALL
SELECT								'TECH_SNOW',					                'FLAVOR_I_SEA_TRADE_ROUTE',			         111				        UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_CONVERSATION',					        'FLAVOR_WONDER',			                 30				        UNION ALL
SELECT								'TECH_CONVERSATION',					        'FLAVOR_CULTURE',			                 112				        UNION ALL
SELECT								'TECH_CONVERSATION',					        'FLAVOR_RELIGION',			                 12				        UNION ALL
SELECT								'TECH_CONVERSATION',					        'FLAVOR_GREAT_PEOPLE',			              9				        UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_REPRESENTATIVE_DEMOCRACY',		        'FLAVOR_WONDER',			                 30				        UNION ALL
SELECT								'TECH_REPRESENTATIVE_DEMOCRACY',			    'FLAVOR_CULTURE',			                 20				        UNION ALL
SELECT								'TECH_REPRESENTATIVE_DEMOCRACY',			    'FLAVOR_GREAT_PEOPLE',			             10				        UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_DEISM',		                            'FLAVOR_WONDER',			                 30				        UNION ALL
SELECT								'TECH_DEISM',			                        'FLAVOR_CULTURE',			                 11				        UNION ALL
SELECT								'TECH_DEISM',			                        'FLAVOR_GREAT_PEOPLE',			              9				        UNION ALL
SELECT								'TECH_DEISM',			                        'FLAVOR_GOLD',			                     113			            UNION ALL
SELECT								'TECH_DEISM',			                        'FLAVOR_TILE_IMPROVEMENT',			         10		                UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_LIBERALISM',			                    'FLAVOR_CULTURE',			                 11				        UNION ALL
SELECT								'TECH_LIBERALISM',			                    'FLAVOR_DIPLOMACY',			                  9				        UNION ALL
SELECT								'TECH_LIBERALISM',			                    'FLAVOR_GOLD',			                     114			            UNION ALL
SELECT								'TECH_LIBERALISM',			                    'FLAVOR_HAPPINESS',			                 10		                UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_ASTARIA',			                        'FLAVOR_CULTURE',			                 13				        UNION ALL
SELECT								'TECH_ASTARIA',			                        'FLAVOR_WONDER',			                 30				        UNION ALL
SELECT								'TECH_ASTARIA',			                        'FLAVOR_PRODUCTION',			              8		                UNION ALL
SELECT								'TECH_ASTARIA',			                        'FLAVOR_HAPPINESS',			                 10		                UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_WATERWORLD',			                    'FLAVOR_GROWTH',			                 10				        UNION ALL
SELECT								'TECH_WATERWORLD',			                    'FLAVOR_GOLD',			                     10				        UNION ALL
SELECT								'TECH_WATERWORLD',			                    'FLAVOR_NAVAL_GROWTH',			             16	                    UNION ALL
SELECT								'TECH_WATERWORLD',			                    'FLAVOR_NAVAL_TILE_IMPROVEMENT',			 16		                UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_ENLIGHTED_ABSOLUTISM',			        'FLAVOR_SCIENCE',			                  7				        UNION ALL
SELECT								'TECH_ENLIGHTED_ABSOLUTISM',			        'FLAVOR_GOLD',			                      7				        UNION ALL
SELECT								'TECH_ENLIGHTED_ABSOLUTISM',			        'FLAVOR_PRODUCTION',			              7                     UNION ALL
SELECT								'TECH_ENLIGHTED_ABSOLUTISM',			        'FLAVOR_RELIGION',			                  7		                UNION ALL
SELECT								'TECH_ENLIGHTED_ABSOLUTISM',			        'FLAVOR_CULTURE',			                  7                     UNION ALL
SELECT								'TECH_ENLIGHTED_ABSOLUTISM',			        'FLAVOR_HAPPINESS',			                  7		                UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_BOTANY',			                        'FLAVOR_CULTURE',			                 115                     UNION ALL
SELECT								'TECH_BOTANY',			                        'FLAVOR_HAPPINESS',			                 10		                UNION ALL
SELECT								'TECH_BOTANY',			                        'FLAVOR_GREAT_PEOPLE',			             10                     UNION ALL
SELECT								'TECH_BOTANY',			                        'FLAVOR_TILE_IMPROVEMENT',			         10	                    UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_AGROFORESTRY',			                'FLAVOR_GROWTH',			                 116                     UNION ALL
SELECT								'TECH_AGROFORESTRY',			                'FLAVOR_INFRASTRUCTURE',			         10                     UNION ALL
SELECT								'TECH_AGROFORESTRY',			                'FLAVOR_TILE_IMPROVEMENT',			         17	                    UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_HERMETIC',			                    'FLAVOR_CULTURE',			                 12                     UNION ALL
SELECT								'TECH_HERMETIC',			                    'FLAVOR_WONDER',			                 30                     UNION ALL
SELECT								'TECH_HERMETIC',			                    'FLAVOR_TILE_IMPROVEMENT',			         10	                    UNION ALL
SELECT								'TECH_HERMETIC',			                    'FLAVOR_GOLD',			                      8                     UNION ALL
SELECT								'TECH_HERMETIC',			                    'FLAVOR_PRODUCTION',			              7	                    UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_PROPULSION',			                    'FLAVOR_WONDER',			                 30                     UNION ALL
SELECT								'TECH_PROPULSION',			                    'FLAVOR_TILE_IMPROVEMENT',			         10	                    UNION ALL
SELECT								'TECH_PROPULSION',			                    'FLAVOR_GOLD',			                     117                     UNION ALL
SELECT								'TECH_PROPULSION',			                    'FLAVOR_PRODUCTION',			             118	                    UNION ALL
SELECT								'TECH_PROPULSION',			                    'FLAVOR_SCIENCE',			                 10                     UNION ALL
SELECT								'TECH_PROPULSION',			                    'FLAVOR_GREAT_PEOPLE',			             12	                    UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_TOTAL',			                        'FLAVOR_WONDER',			                 10	                    UNION ALL
SELECT								'TECH_TOTAL',			                        'FLAVOR_HAPPINESS',			                 11                     UNION ALL
SELECT								'TECH_TOTAL',			                        'FLAVOR_CULTURE',			                 20	                    UNION ALL
SELECT								'TECH_TOTAL',			                        'FLAVOR_SCIENCE',			                 12                     UNION ALL
SELECT								'TECH_TOTAL',			                        'FLAVOR_GREAT_PEOPLE',			             12	                    UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_JOURNALISM',			                    'FLAVOR_HAPPINESS',			                 18                     UNION ALL
SELECT								'TECH_JOURNALISM',			                    'FLAVOR_TILE_IMPROVEMENT',			         10                     UNION ALL
SELECT								'TECH_JOURNALISM',			                    'FLAVOR_GREAT_PEOPLE',			             12	                    UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_AUTOMATA',			                    'FLAVOR_WONDER',			                 30                     UNION ALL
SELECT								'TECH_AUTOMATA',			                    'FLAVOR_CULTURE',			                 10                     UNION ALL
SELECT								'TECH_AUTOMATA',			                    'FLAVOR_GREAT_PEOPLE',			             12	                    UNION ALL
SELECT								'TECH_AUTOMATA',			                    'FLAVOR_CITY_DEFENSE',			             20                     UNION ALL
SELECT								'TECH_AUTOMATA',			                    'FLAVOR_TILE_IMPROVEMENT',			         18                     UNION ALL
SELECT								'TECH_AUTOMATA',			                    'FLAVOR_PRODUCTION',			              8                     UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_OIL_COMPANIES',			                'FLAVOR_MOBILE',			                 12	                    UNION ALL
SELECT								'TECH_OIL_COMPANIES',			                'FLAVOR_GOLD',			                     119                     UNION ALL
SELECT								'TECH_OIL_COMPANIES',			                'FLAVOR_TILE_IMPROVEMENT',			         10                     UNION ALL
SELECT								'TECH_OIL_COMPANIES',			                'FLAVOR_PRODUCTION',			             13                     UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_MODERN_SANITATION',			            'FLAVOR_GROWTH',			                 20	                    UNION ALL
SELECT								'TECH_MODERN_SANITATION',			            'FLAVOR_HAPPINESS',			                 110                     UNION ALL
SELECT								'TECH_MODERN_SANITATION',			            'FLAVOR_EXPANSION',			                 10                     UNION ALL
SELECT								'TECH_MODERN_SANITATION',			            'FLAVOR_INFRASTRUCTURE',			         12                     UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_HEALTHSYSTEM',			                'FLAVOR_GROWTH',			                 22	                    UNION ALL
SELECT								'TECH_HEALTHSYSTEM',			                'FLAVOR_HAPPINESS',			                 315                     UNION ALL
SELECT								'TECH_HEALTHSYSTEM',			                'FLAVOR_SCIENCE',			                 13                     UNION ALL
SELECT								'TECH_HEALTHSYSTEM',			                'FLAVOR_INFRASTRUCTURE',			         12                     UNION ALL
SELECT								'TECH_HEALTHSYSTEM',			                'FLAVOR_WONDER',			                 30                     UNION ALL
SELECT								'TECH_HEALTHSYSTEM',			                'FLAVOR_GREAT_PEOPLE',			             12                     UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_MODERN_SPORTS',			                'FLAVOR_HAPPINESS',			                 16                     UNION ALL
SELECT								'TECH_MODERN_SPORTS',			                'FLAVOR_CULTURE',			                 16                     UNION ALL
SELECT								'TECH_MODERN_SPORTS',			                'FLAVOR_WONDER',			                 30                     UNION ALL
SELECT								'TECH_MODERN_SPORTS',			                'FLAVOR_GREAT_PEOPLE',			             12                     UNION ALL
SELECT								'TECH_MODERN_SPORTS',			                'FLAVOR_GOLD',			                      8                     UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_PESTICIDE',			                    'FLAVOR_CULTURE',			                 16                     UNION ALL
SELECT								'TECH_PESTICIDE',			                    'FLAVOR_WONDER',			                 30                     UNION ALL
SELECT								'TECH_PESTICIDE',			                    'FLAVOR_GREAT_PEOPLE',			             12                     UNION ALL
SELECT								'TECH_PESTICIDE',			                    'FLAVOR_INFRASTRUCTURE',			         10                     UNION ALL
SELECT								'TECH_PESTICIDE',			                    'FLAVOR_TILE_IMPROVEMENT',			         10                     UNION ALL
SELECT								'TECH_PESTICIDE',			                    'FLAVOR_GROWTH',			                 10                     UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_DURCHBRUCH',			                    'FLAVOR_WONDER',			                 30                     UNION ALL
SELECT								'TECH_DURCHBRUCH',			                    'FLAVOR_GREAT_PEOPLE',			             12                     UNION ALL
SELECT								'TECH_DURCHBRUCH',			                    'FLAVOR_PRODUCTION',			             10                     UNION ALL
SELECT								'TECH_DURCHBRUCH',			                    'FLAVOR_TILE_IMPROVEMENT',			         10                     UNION ALL
SELECT								'TECH_DURCHBRUCH',			                    'FLAVOR_SCIENCE',			                 18                     UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_CAVALRY_RAIDS',			                'FLAVOR_GREAT_PEOPLE',			             12                     UNION ALL
SELECT								'TECH_CAVALRY_RAIDS',			                'FLAVOR_PRODUCTION',			             10                     UNION ALL
SELECT								'TECH_CAVALRY_RAIDS',			                'FLAVOR_OFFENSE',			                 20                     UNION ALL
SELECT								'TECH_CAVALRY_RAIDS',			                'FLAVOR_MILITARY_TRAINING',			         311                     UNION ALL
SELECT								'TECH_CAVALRY_RAIDS',			                'FLAVOR_RECON',			                     25                     UNION ALL
SELECT								'TECH_CAVALRY_RAIDS',			                'FLAVOR_CULTURE',			                 14                     UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_LANDSHIPS',			                    'FLAVOR_OFFENSE',			                 35                     UNION ALL
SELECT								'TECH_LANDSHIPS',			                    'FLAVOR_MILITARY_TRAINING',			         312                     UNION ALL
SELECT								'TECH_LANDSHIPS',			                    'FLAVOR_RECON',			                     35                     UNION ALL
SELECT								'TECH_LANDSHIPS',			                    'FLAVOR_DEFENSE',			                 20                     UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_PROPAGANDA',			                    'FLAVOR_HAPPINESS',			                 10                     UNION ALL
SELECT								'TECH_PROPAGANDA',			                    'FLAVOR_CULTURE',			                 16                     UNION ALL
SELECT								'TECH_PROPAGANDA',			                    'FLAVOR_WONDER',			                 30                     UNION ALL
SELECT								'TECH_PROPAGANDA',			                    'FLAVOR_GREAT_PEOPLE',			              8                     UNION ALL
SELECT								'TECH_PROPAGANDA',			                    'FLAVOR_RELIGION',			                  8                     UNION ALL
SELECT								'TECH_PROPAGANDA',			                    'FLAVOR_INFRASTRUCTURE',			          9                     UNION ALL
SELECT								'TECH_PROPAGANDA',			                    'FLAVOR_TILE_IMPROVEMENT',			          9                     UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------










































SELECT								'TECH_TRIBE',					                'FLAVOR_EXPANSION',				             8                           ;


INSERT INTO Technology_Flavors (	TechType,									FlavorType,									Flavor)
--New Entries for Neo--overworked
--Summary
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_TRIBE',					                'FLAVOR_WONDER',					        20							UNION ALL
SELECT								'TECH_TRIBE',					                'FLAVOR_PRODUCTION',				         9                           UNION ALL
SELECT								'TECH_TRIBE',					                'FLAVOR_MOBILE',					         8							UNION ALL
SELECT								'TECH_TRIBE',					                'FLAVOR_EXPANSION',				             8                           UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_DOMESTIFICATION',					        'FLAVOR_TILE_IMPROVEMENT',					13							UNION ALL
SELECT								'TECH_DOMESTIFICATION',					        'FLAVOR_PRODUCTION',				         9                           UNION ALL
SELECT								'TECH_DOMESTIFICATION',					        'FLAVOR_INFRASTRUCTURE',					 8							UNION ALL
SELECT								'TECH_DOMESTIFICATION',					        'FLAVOR_EXPANSION',				             8                           UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_CLAN',					                'FLAVOR_WONDER',					        20							UNION ALL
SELECT								'TECH_CLAN',					                'FLAVOR_RELIGION',				             7                           UNION ALL
SELECT								'TECH_CLAN',					                'FLAVOR_CULTURE',					         6							UNION ALL
SELECT								'TECH_CLAN',					                'FLAVOR_GREAT_PEOPLE',				         7                          UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_FLINTSTONES',					            'FLAVOR_GREAT_PEOPLE',					     7							UNION ALL
SELECT								'TECH_FLINTSTONES',					            'FLAVOR_CULTURE',					         7							UNION ALL
SELECT								'TECH_FLINTSTONES',					            'FLAVOR_GOLD',					             6							UNION ALL
SELECT								'TECH_FLINTSTONES',					            'FLAVOR_PRODUCTION',				        10                           UNION ALL
SELECT								'TECH_FLINTSTONES',					            'FLAVOR_WONDER',					        20							UNION ALL
--SELECT								'TECH_FLINTSTONES',					            'FLAVOR_RELIGION',				             7                           UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_COMPOSITE_TOOLS',					        'FLAVOR_GREAT_PEOPLE',					     7							UNION ALL
SELECT								'TECH_COMPOSITE_TOOLS',					        'FLAVOR_RELIGION',				             8                           UNION ALL
SELECT								'TECH_COMPOSITE_TOOLS',					        'FLAVOR_WONDER',					        20							UNION ALL
SELECT								'TECH_COMPOSITE_TOOLS',					        'FLAVOR_CULTURE',				             9                           UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_SLINGER',						            'FLAVOR_MILITARY_TRAINING',				    11							UNION ALL
SELECT								'TECH_SLINGER',						            'FLAVOR_RANGED',				            20							UNION ALL
SELECT								'TECH_SLINGER',						            'FLAVOR_EXPANSION',				            10							UNION ALL
SELECT								'TECH_SLINGER',						            'FLAVOR_OFFENSE',				         	313							UNION ALL
SELECT								'TECH_SLINGER',						            'FLAVOR_DEFENSE',				         	10							UNION ALL
SELECT								'TECH_SLINGER',						            'FLAVOR_PRODUCTION',					    12							UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_PICTOGRAMS',						         'FLAVOR_GREAT_PEOPLE',				        11							UNION ALL
SELECT								'TECH_PICTOGRAMS',						         'FLAVOR_RELIGION',				             7							UNION ALL
SELECT								'TECH_PICTOGRAMS',						         'FLAVOR_CULTURE',				         	 7							UNION ALL
SELECT								'TECH_PICTOGRAMS',						         'FLAVOR_TILE_IMPROVEMENT',				    10							UNION ALL
SELECT								'TECH_PICTOGRAMS',						         'FLAVOR_WONDER',				            20					        UNION ALL
SELECT								'TECH_PICTOGRAMS',						         'FLAVOR_PRODUCTION',					     9							UNION ALL
------------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_AQUACULTURE',						        'FLAVOR_GREAT_PEOPLE',						 5							UNION ALL
SELECT								'TECH_AQUACULTURE',						        'FLAVOR_RELIGION',						     6							UNION ALL
SELECT								'TECH_AQUACULTURE',						        'FLAVOR_CULTURE',			                 7							UNION ALL
SELECT								'TECH_AQUACULTURE',						        'FLAVOR_NAVAL',								314							UNION ALL
SELECT								'TECH_AQUACULTURE',						        'FLAVOR_NAVAL_TILE_IMPROVEMENT',			10							UNION ALL
SELECT								'TECH_AQUACULTURE',						        'FLAVOR_NAVAL_GROWTH',						316							UNION ALL
SELECT								'TECH_AQUACULTURE',						        'FLAVOR_GROWTH',						    10							UNION ALL
SELECT								'TECH_AQUACULTURE',						        'FLAVOR_WONDER',						    20							UNION ALL
------------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_WAYFINDING',						        'FLAVOR_PRODUCTION',						11							UNION ALL
SELECT								'TECH_WAYFINDING',						        'FLAVOR_WONDER',							20							UNION ALL
SELECT								'TECH_WAYFINDING',						        'FLAVOR_NAVAL_RECON',					    317							UNION ALL
SELECT								'TECH_WAYFINDING',						        'FLAVOR_NAVAL',								318							UNION ALL
SELECT								'TECH_WAYFINDING',						        'FLAVOR_EXPANSION',						    10							UNION ALL
SELECT								'TECH_WAYFINDING',						        'FLAVOR_MOBILE',						    11							UNION ALL
SELECT								'TECH_WAYFINDING',						        'FLAVOR_OFFENSE',						    10							UNION ALL
SELECT								'TECH_WAYFINDING',						        'FLAVOR_DEFENSE',						     8							UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_NUMMER',						        'FLAVOR_SCIENCE',				         	 8							UNION ALL
SELECT								'TECH_NUMMER',						        'FLAVOR_GROWTH',				         	 8							UNION ALL
SELECT								'TECH_NUMMER',						        'FLAVOR_CULTURE',				         	 7					        UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_COOKING',						        'FLAVOR_GOLD',				                 7							UNION ALL
SELECT								'TECH_COOKING',						        'FLAVOR_TILE_IMPROVEMENT',				     9							UNION ALL
SELECT								'TECH_COOKING',						        'FLAVOR_SCIENCE',				         	10							UNION ALL
SELECT								'TECH_COOKING',						        'FLAVOR_GROWTH',				         	10							UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_NATUROPATY',						    'FLAVOR_TILE_IMPROVEMENT',					9							UNION ALL
SELECT								'TECH_NATUROPATY',						    'FLAVOR_EXPANSION',				            10							UNION ALL
SELECT								'TECH_NATUROPATY',						    'FLAVOR_WONDER',				         	20							UNION ALL
SELECT								'TECH_NATUROPATY',						    'FLAVOR_GROWTH',				         	11							UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_GILGA',						         'FLAVOR_WONDER',				            20							UNION ALL
SELECT								'TECH_GILGA',						         'FLAVOR_GOLD',				                 7							UNION ALL
SELECT								'TECH_GILGA',						         'FLAVOR_TILE_IMPROVEMENT',				    10							UNION ALL
SELECT								'TECH_GILGA',						         'FLAVOR_GROWTH',				         	10							UNION ALL
SELECT								'TECH_GILGA',						         'FLAVOR_PRODUCTION',					     6							UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_PROMETHEUS',						    'FLAVOR_INFRASTRUCTURE',					10							UNION ALL
SELECT								'TECH_PROMETHEUS',						    'FLAVOR_TILE_IMPROVEMENT',					20							UNION ALL
SELECT								'TECH_PROMETHEUS',						    'FLAVOR_EXPANSION',				            10							UNION ALL
SELECT								'TECH_PROMETHEUS',						    'FLAVOR_SCIENCE',				         	5							UNION ALL
SELECT								'TECH_PROMETHEUS',						    'FLAVOR_GROWTH',				         	5							UNION ALL
SELECT								'TECH_PROMETHEUS',							'FLAVOR_HAPPINESS',							5							UNION ALL
SELECT								'TECH_PROMETHEUS',							'FLAVOR_CULTURE',							5;
----------------------------------------------------------------------------------------------------------------------------------------------------------------


INSERT INTO Technology_Flavors (	TechType,									FlavorType,									Flavor)
--New Entries for Neo--overworked
--Summary
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_STRASSE',					             'FLAVOR_CULTURE',				             6                          UNION ALL
SELECT								'TECH_STRASSE',					             'FLAVOR_GOLD',				                 7                          UNION ALL
SELECT								'TECH_STRASSE',					             'FLAVOR_TILE_IMPROVEMENT',					17							UNION ALL
SELECT								'TECH_STRASSE',					             'FLAVOR_PRODUCTION',				        10                          UNION ALL
SELECT								'TECH_STRASSE',					             'FLAVOR_INFRASTRUCTURE',					319							UNION ALL
SELECT								'TECH_STRASSE',					             'FLAVOR_EXPANSION',				        320                           UNION ALL
SELECT								'TECH_STRASSE',					             'FLAVOR_WONDER',				            20                           UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_LUNAR',						         'FLAVOR_CULTURE',				         	10							UNION ALL
SELECT								'TECH_LUNAR',						         'FLAVOR_GREAT_PEOPLE',				         8							UNION ALL
SELECT								'TECH_LUNAR',						         'FLAVOR_RELIGION',				            10					        UNION ALL
SELECT								'TECH_LUNAR',						         'FLAVOR_WONDER',					        20							UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_CROP_FARMING',						 'FLAVOR_EXPANSION',				        10							UNION ALL
SELECT								'TECH_CROP_FARMING',						 'FLAVOR_CULTURE',				         	 6							UNION ALL
SELECT								'TECH_CROP_FARMING',						 'FLAVOR_GROWTH',				         	321							UNION ALL
SELECT								'TECH_CROP_FARMING',						 'FLAVOR_WONDER',				         	10					        UNION ALL
SELECT								'TECH_CROP_FARMING',						 'FLAVOR_TILE_IMPROVEMENT',					322							UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_CEREMONIAL_DANCE',					 'FLAVOR_HAPPINESS',				        10							UNION ALL
SELECT								'TECH_CEREMONIAL_DANCE',					 'FLAVOR_RELIGION',				            10							UNION ALL
SELECT								'TECH_CEREMONIAL_DANCE',					 'FLAVOR_EXPANSION',				        13							UNION ALL
SELECT								'TECH_CEREMONIAL_DANCE',					 'FLAVOR_TILE_IMPROVEMENT',				    11							UNION ALL
SELECT								'TECH_CEREMONIAL_DANCE',					 'FLAVOR_OFFENSE',				         	12							UNION ALL
SELECT								'TECH_CEREMONIAL_DANCE',				     'FLAVOR_DEFENSE',				         	10					        UNION ALL
SELECT								'TECH_CEREMONIAL_DANCE',				     'FLAVOR_MOBILE',					        11							UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_CULTURAL_IDENTITY',				     'FLAVOR_GREAT_PEOPLE',				        13							UNION ALL
SELECT								'TECH_CULTURAL_IDENTITY',					 'FLAVOR_WONDER',				         	20							UNION ALL
SELECT								'TECH_CULTURAL_IDENTITY',				     'FLAVOR_CULTURE',				         	12							UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_TIME',						         'FLAVOR_HAPPINESS',				         8							UNION ALL
SELECT								'TECH_TIME',						         'FLAVOR_PRODUCTION',				        10							UNION ALL
SELECT								'TECH_TIME',						         'FLAVOR_WONDER',				         	20							UNION ALL
SELECT								'TECH_TIME',						         'FLAVOR_CULTURE',				         	14							UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_MICROLITHS',						     'FLAVOR_RELIGION',				             8							UNION ALL
SELECT								'TECH_MICROLITHS',						     'FLAVOR_GREAT_PEOPLE',				         7							UNION ALL
SELECT								'TECH_MICROLITHS',						     'FLAVOR_WONDER',				         	20							UNION ALL
SELECT								'TECH_MICROLITHS',						     'FLAVOR_CULTURE',				         	10							UNION ALL
SELECT								'TECH_MICROLITHS',						     'FLAVOR_PRODUCTION',				         6							UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_HIERARCHY',						     'FLAVOR_WONDER',				         	29							UNION ALL
SELECT								'TECH_HIERARCHY',						     'FLAVOR_CULTURE',				         	13							UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_ORNAMENTAL_CARVING',					 'FLAVOR_TILE_IMPROVEMENT',					323							UNION ALL
SELECT								'TECH_ORNAMENTAL_CARVING',				     'FLAVOR_INFRASTRUCTURE',				    324							UNION ALL
SELECT								'TECH_ORNAMENTAL_CARVING',					 'FLAVOR_CULTURE',							10;
----------------------------------------------------------------------------------------------------------------------------------------------------------------


INSERT INTO Technology_Flavors (	TechType,									FlavorType,									Flavor)
--New Entries for Neo--overworked
--Summary
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_MYTHOLOGY',					        'FLAVOR_GREAT_PEOPLE',				         8                           UNION ALL
SELECT								'TECH_MYTHOLOGY',					        'FLAVOR_CULTURE',					        10							UNION ALL
SELECT								'TECH_MYTHOLOGY',					        'FLAVOR_RELIGION',				            326                           UNION ALL
SELECT								'TECH_MYTHOLOGY',					        'FLAVOR_WONDER',				            20                           UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_INCAFARM',						    'FLAVOR_EXPANSION',				            11							UNION ALL
SELECT								'TECH_INCAFARM',						    'FLAVOR_PRODUCTION',				        10							UNION ALL
SELECT								'TECH_INCAFARM',						    'FLAVOR_GROWTH',				         	327							UNION ALL
SELECT								'TECH_INCAFARM',						    'FLAVOR_GOLD',				                 7					        UNION ALL
SELECT								'TECH_INCAFARM',						    'FLAVOR_TILE_IMPROVEMENT',					14							UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_ELITE',						        'FLAVOR_TILE_IMPROVEMENT',				    25							UNION ALL
SELECT								'TECH_ELITE',						        'FLAVOR_CULTURE',				            25							UNION ALL
SELECT								'TECH_ELITE',						        'FLAVOR_WONDER',				            25							UNION ALL
SELECT								'TECH_ELITE',						        'FLAVOR_EXPANSION',				            25							UNION ALL
SELECT								'TECH_ELITE',						        'FLAVOR_SCIENCE',				         	25							UNION ALL
SELECT								'TECH_ELITE',						        'FLAVOR_GROWTH',				         	25							UNION ALL
SELECT								'TECH_ELITE',						        'FLAVOR_GOLD',				                25					        UNION ALL
SELECT								'TECH_ELITE',						        'FLAVOR_PRODUCTION',					    25							UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_MUSIK_INSTRUMENTE',				    'FLAVOR_RELIGION',				             8							UNION ALL
SELECT								'TECH_MUSIK_INSTRUMENTE',				    'FLAVOR_CULTURE',				         	 8							UNION ALL
SELECT								'TECH_MUSIK_INSTRUMENTE',				    'FLAVOR_GREAT_PEOPLE',				        12							UNION ALL
SELECT								'TECH_MUSIK_INSTRUMENTE',					'FLAVOR_SCIENCE',				         	 6					        UNION ALL
SELECT								'TECH_MUSIK_INSTRUMENTE',					'FLAVOR_WONDER',					        20							UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_IMPERIALISM',						    'FLAVOR_TILE_IMPROVEMENT',					10							UNION ALL
SELECT								'TECH_IMPERIALISM',						    'FLAVOR_GOLD',				         	    9							UNION ALL
SELECT								'TECH_IMPERIALISM',						    'FLAVOR_CITY_DEFENSE',				        10							UNION ALL
SELECT								'TECH_IMPERIALISM',							'FLAVOR_HAPPINESS',							 8							UNION ALL
SELECT								'TECH_IMPERIALISM',							'FLAVOR_CULTURE',							10;
----------------------------------------------------------------------------------------------------------------------------------------------------------------


INSERT INTO Technology_Flavors (	TechType,									FlavorType,									Flavor)
--New Entries for Neo--overworked
--Summary
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_POST',					           'FLAVOR_I_LAND_TRADE_ROUTE',					328							UNION ALL
SELECT								'TECH_POST',					           'FLAVOR_I_SEA_TRADE_ROUTE',				    329                           UNION ALL
SELECT								'TECH_POST',					           'FLAVOR_TILE_IMPROVEMENT',					10							UNION ALL
SELECT								'TECH_POST',					           'FLAVOR_GOLD',				                12                           UNION ALL
SELECT								'TECH_POST',					           'FLAVOR_HAPPINESS',					        10							UNION ALL
SELECT								'TECH_POST',					           'FLAVOR_GREAT_PEOPLE',				         7                           UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_ENTERTAINMENT',					   'FLAVOR_EXPANSION',				            10							UNION ALL
SELECT								'TECH_ENTERTAINMENT',					   'FLAVOR_SCIENCE',				         	 5							UNION ALL
SELECT								'TECH_ENTERTAINMENT',					   'FLAVOR_GROWTH',				         	    222							UNION ALL
SELECT								'TECH_ENTERTAINMENT',					   'FLAVOR_CULTURE',				             7					        UNION ALL
SELECT								'TECH_ENTERTAINMENT',					   'FLAVOR_HAPPINESS',					        19							UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_RELIGIOUS_ORDERS',				   'FLAVOR_RELIGION',				            13							UNION ALL
SELECT								'TECH_RELIGIOUS_ORDERS',				   'FLAVOR_CULTURE',				         	10							UNION ALL
SELECT								'TECH_RELIGIOUS_ORDERS',				   'FLAVOR_WONDER',				         	    20							UNION ALL
SELECT								'TECH_RELIGIOUS_ORDERS',				   'FLAVOR_GREAT_PEOPLE',				         8					        UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_MUSIKNOTEN',						    'FLAVOR_CULTURE',				            13							UNION ALL
SELECT								'TECH_MUSIKNOTEN',						    'FLAVOR_RELIGION',				         	12							UNION ALL
SELECT								'TECH_MUSIKNOTEN',						    'FLAVOR_GREAT_PEOPLE',				         8							UNION ALL
SELECT								'TECH_MUSIKNOTEN',						    'FLAVOR_GOLD',				         	     8					        UNION ALL
SELECT								'TECH_MUSIKNOTEN',						    'FLAVOR_WONDER',					        20							UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_ZIFFERN',						        'FLAVOR_RELIGION',					        10							UNION ALL
SELECT								'TECH_ZIFFERN',						        'FLAVOR_WONDER',				            20							UNION ALL
SELECT								'TECH_ZIFFERN',						        'FLAVOR_SCIENCE',				         	223							UNION ALL
SELECT								'TECH_ZIFFERN',						        'FLAVOR_CULTURE',				         	 8							UNION ALL
SELECT								'TECH_ZIFFERN',							    'FLAVOR_GREAT_PEOPLE',					     8;
----------------------------------------------------------------------------------------------------------------------------------------------------------------


INSERT INTO Technology_Flavors (	TechType,									FlavorType,									Flavor)
--New Entries for Neo--overworked
--Summary
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_ALCHEMY',					             'FLAVOR_TILE_IMPROVEMENT',					224							UNION ALL
SELECT								'TECH_ALCHEMY',					             'FLAVOR_GOLD',					            225							UNION ALL
SELECT								'TECH_ALCHEMY',					             'FLAVOR_PRODUCTION',				        13                           UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_CHROM',						         'FLAVOR_CULTURE',				             6							UNION ALL
SELECT								'TECH_CHROM',						         'FLAVOR_DEFENSE',				         	12							UNION ALL
SELECT								'TECH_CHROM',						         'FLAVOR_TILE_IMPROVEMENT',				    226					        UNION ALL
SELECT								'TECH_CHROM',						         'FLAVOR_CITY_DEFENSE',					    14							UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_MERCHANTS',						     'FLAVOR_TILE_IMPROVEMENT',				    227					        UNION ALL
SELECT								'TECH_MERCHANTS',						     'FLAVOR_WONDER',				            20							UNION ALL
SELECT								'TECH_MERCHANTS',						     'FLAVOR_CULTURE',				         	10							UNION ALL
SELECT								'TECH_MERCHANTS',						     'FLAVOR_I_LAND_TRADE_ROUTE',				228							UNION ALL
SELECT								'TECH_MERCHANTS',						     'FLAVOR_GOLD',				                20					        UNION ALL
SELECT								'TECH_MERCHANTS',						     'FLAVOR_I_SEA_TRADE_ROUTE',			    229							UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_CHURCH_ARCHITECTURE',					'FLAVOR_RELIGION',				         	13							UNION ALL
SELECT								'TECH_CHURCH_ARCHITECTURE',					'FLAVOR_GREAT_PEOPLE',				        10							UNION ALL
SELECT								'TECH_CHURCH_ARCHITECTURE',					'FLAVOR_CULTURE',				         	12					        UNION ALL
SELECT								'TECH_CHURCH_ARCHITECTURE',					'FLAVOR_WONDER',					        20							UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_MILITARY_ENGINEERING',				'FLAVOR_TILE_IMPROVEMENT',					230							UNION ALL
SELECT								'TECH_MILITARY_ENGINEERING',				'FLAVOR_NAVAL_TILE_IMPROVEMENT',		    10							UNION ALL
SELECT								'TECH_MILITARY_ENGINEERING',				'FLAVOR_MOBILE',				         	 8							UNION ALL
SELECT								'TECH_MILITARY_ENGINEERING',				'FLAVOR_PRODUCTION',				        10							UNION ALL
SELECT								'TECH_MILITARY_ENGINEERING',				'FLAVOR_WONDER',							20							UNION ALL
SELECT								'TECH_MILITARY_ENGINEERING',				'FLAVOR_CULTURE',							 9;
----------------------------------------------------------------------------------------------------------------------------------------------------------------


INSERT INTO Technology_Flavors (	TechType,									FlavorType,									Flavor)
--New Entries for Neo--overworked
--Summary
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_EPISTEMOLOGY',					    'FLAVOR_TILE_IMPROVEMENT',					10							UNION ALL
SELECT								'TECH_EPISTEMOLOGY',					    'FLAVOR_SCIENCE',				             8                           UNION ALL
SELECT								'TECH_EPISTEMOLOGY',					    'FLAVOR_GOLD',					            10							UNION ALL
SELECT								'TECH_EPISTEMOLOGY',					    'FLAVOR_CULTURE',				            10                           UNION ALL
SELECT								'TECH_EPISTEMOLOGY',					    'FLAVOR_WONDER',				            20                           UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_INNATISM',						    'FLAVOR_DIPLOMACY',				            10							UNION ALL
SELECT								'TECH_INNATISM',						    'FLAVOR_CULTURE',				         	10							UNION ALL
SELECT								'TECH_INNATISM',						    'FLAVOR_RELIGION',				         	12							UNION ALL
SELECT								'TECH_INNATISM',						    'FLAVOR_GREAT_PEOPLE',				        10					        UNION ALL
SELECT								'TECH_INNATISM',						    'FLAVOR_WONDER',					        20							UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_MECHANICAL_ADVANTAGE',				'FLAVOR_CULTURE',				            12							UNION ALL
SELECT								'TECH_MECHANICAL_ADVANTAGE',				'FLAVOR_RELIGION',				         	10							UNION ALL
SELECT								'TECH_MECHANICAL_ADVANTAGE',				'FLAVOR_WONDER',				         	20							UNION ALL
SELECT								'TECH_MECHANICAL_ADVANTAGE',			    'FLAVOR_PRODUCTION',					    231							UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_ABSOLUTISM',						    'FLAVOR_WONDER',				         	20							UNION ALL
SELECT								'TECH_ABSOLUTISM',						    'FLAVOR_CULTURE',				         	232							UNION ALL
SELECT								'TECH_ABSOLUTISM',						    'FLAVOR_RELIGION',				         	12335					        UNION ALL
SELECT								'TECH_ABSOLUTISM',						    'FLAVOR_GREAT_PEOPLE',					    10							UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_WARSHIPS',						    'FLAVOR_OFFENSE',					        20							UNION ALL
SELECT								'TECH_WARSHIPS',						    'FLAVOR_DEFENSE',				            234							UNION ALL
SELECT								'TECH_WARSHIPS',						    'FLAVOR_WONDER',				         	20							UNION ALL
SELECT								'TECH_WARSHIPS',						    'FLAVOR_GOLD',				         	    10							UNION ALL
SELECT								'TECH_WARSHIPS',							'FLAVOR_NAVAL',							    25							UNION ALL
SELECT								'TECH_WARSHIPS',							'FLAVOR_NAVAL_RECON',					    30;
----------------------------------------------------------------------------------------------------------------------------------------------------------------



INSERT INTO Technology_Flavors (	TechType,									FlavorType,									Flavor)
--New Entries for Neo--overworked
--Summary
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_TREASURE_FLEET',					    'FLAVOR_I_SEA_TRADE_ROUTE',					        20							UNION ALL
SELECT								'TECH_TREASURE_FLEET',					    'FLAVOR_I_LAND_TRADE_ROUTE',				        20                           UNION ALL
SELECT								'TECH_TREASURE_FLEET',					    'FLAVOR_GOLD',					                    235							UNION ALL
SELECT								'TECH_TREASURE_FLEET',					    'FLAVOR_WONDER',				                    20                           UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_EXPLORATIONA',						'FLAVOR_I_SEA_TRADE_ROUTE',				            20							UNION ALL
SELECT								'TECH_EXPLORATIONA',						'FLAVOR_I_LAND_TRADE_ROUTE',				        20							UNION ALL
SELECT								'TECH_EXPLORATIONA',						'FLAVOR_WONDER',				         	        20							UNION ALL
SELECT								'TECH_EXPLORATIONA',						'FLAVOR_CULTURE',				                    10					        UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_LINE_OF_BATTLE',						'FLAVOR_TILE_IMPROVEMENT',				            236							UNION ALL
SELECT								'TECH_LINE_OF_BATTLE',						'FLAVOR_PRODUCTION',				         	    13							UNION ALL
SELECT								'TECH_LINE_OF_BATTLE',						'FLAVOR_WONDER',				         	        20							UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_MARS',						       'FLAVOR_GREAT_PEOPLE',				                10							UNION ALL
SELECT								'TECH_MARS',						       'FLAVOR_RELIGION',				                    237							UNION ALL
SELECT								'TECH_MARS',						       'FLAVOR_CULTURE',				         	        12							UNION ALL
SELECT								'TECH_MARS',						       'FLAVOR_WONDER',				         	            20							UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_DYNASTY',						       'FLAVOR_TILE_IMPROVEMENT',				            238							UNION ALL
SELECT								'TECH_DYNASTY',						       'FLAVOR_CULTURE',				         	        10							UNION ALL
SELECT								'TECH_DYNASTY',						       'FLAVOR_WONDER',				         	            20							UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_CANNON',						       'FLAVOR_MOBILE',					                    239							UNION ALL
SELECT								'TECH_CANNON',						       'FLAVOR_EXPANSION',				                    240							UNION ALL
SELECT								'TECH_CANNON',						       'FLAVOR_RANGED',				         	            30							UNION ALL
SELECT								'TECH_CANNON',						       'FLAVOR_OFFENSE',				         	        35							UNION ALL
SELECT								'TECH_CANNON',							   'FLAVOR_DEFENSE',							        25							UNION ALL
SELECT								'TECH_CANNON',							   'FLAVOR_MILITARY_TRAINING',							20                          UNION ALL
SELECT								'TECH_CANNON',							   'FLAVOR_PRODUCTION',							        10;
----------------------------------------------------------------------------------------------------------------------------------------------------------------


INSERT INTO Technology_Flavors (	TechType,									FlavorType,									Flavor)
--New Entries for Neo--overworked
--Summary
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_DRYDOCK',					           'FLAVOR_NAVAL',					            25							UNION ALL
SELECT								'TECH_DRYDOCK',					           'FLAVOR_PRODUCTION',				            11                           UNION ALL
SELECT								'TECH_DRYDOCK',					           'FLAVOR_NAVAL_RECON',					    20							UNION ALL
SELECT								'TECH_DRYDOCK',					           'FLAVOR_EXPANSION',				            10                           UNION ALL
SELECT								'TECH_DRYDOCK',					           'FLAVOR_OFFENSE',				            240                           UNION ALL
SELECT								'TECH_DRYDOCK',					           'FLAVOR_DEFENSE',				            10                           UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_MICROSCOPE',						   'FLAVOR_SCIENCE',				         	20							UNION ALL
SELECT								'TECH_MICROSCOPE',						   'FLAVOR_TILE_IMPROVEMENT',				    241					        UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_LABOR',						        'FLAVOR_SCIENCE',				         	20							UNION ALL
SELECT								'TECH_LABOR',						        'FLAVOR_GROWTH',				         	20							UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_SOCIAL_CONTRACT',						'FLAVOR_CULTURE',				            10							UNION ALL
SELECT								'TECH_SOCIAL_CONTRACT',						'FLAVOR_GREAT_PEOPLE',				         9							UNION ALL
SELECT								'TECH_SOCIAL_CONTRACT',						'FLAVOR_WONDER',				         	20							UNION ALL
SELECT								'TECH_SOCIAL_CONTRACT',						'FLAVOR_TILE_IMPROVEMENT',				    10					        UNION ALL
SELECT								'TECH_SOCIAL_CONTRACT',						'FLAVOR_GOLD',					             8							UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_ICARUS',						        'FLAVOR_EXPANSION',				            13							UNION ALL
SELECT								'TECH_ICARUS',						        'FLAVOR_OFFENSE',				         	13							UNION ALL
SELECT								'TECH_ICARUS',						        'FLAVOR_DEFENSE',				         	10							UNION ALL
SELECT								'TECH_ICARUS',						        'FLAVOR_MOBILE',				            20					        UNION ALL
SELECT								'TECH_ICARUS',						        'FLAVOR_PRODUCTION',					    242							UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_SULFUR',						         'FLAVOR_EXPANSION',				        19							UNION ALL
SELECT								'TECH_SULFUR',						         'FLAVOR_DEFENSE',				         	20							UNION ALL
SELECT								'TECH_SULFUR',						         'FLAVOR_OFFENSE',				         	25							UNION ALL
SELECT								'TECH_SULFUR',						         'FLAVOR_TILE_IMPROVEMENT',				    23					        UNION ALL
SELECT								'TECH_SULFUR',						         'FLAVOR_PRODUCTION',					    17							UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_NAVAL_WARFARE',						 'FLAVOR_MOBILE',					        35							UNION ALL
SELECT								'TECH_NAVAL_WARFARE',						 'FLAVOR_TILE_IMPROVEMENT',					11							UNION ALL
SELECT								'TECH_NAVAL_WARFARE',						 'FLAVOR_EXPANSION',				        243							UNION ALL
SELECT								'TECH_NAVAL_WARFARE',						 'FLAVOR_SCIENCE',				         	10							UNION ALL
SELECT								'TECH_NAVAL_WARFARE',						 'FLAVOR_GROWTH',				         	244							UNION ALL
SELECT								'TECH_NAVAL_WARFARE',					     'FLAVOR_HAPPINESS',						10							UNION ALL
SELECT								'TECH_NAVAL_WARFARE',					     'FLAVOR_CULTURE',							10;
----------------------------------------------------------------------------------------------------------------------------------------------------------------




INSERT INTO Technology_Flavors (	TechType,									FlavorType,									Flavor)
--New Entries for Neo--overworked
--Summary
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_SKY_FORTRESS',					     'FLAVOR_AIR',					            30							UNION ALL
SELECT								'TECH_SKY_FORTRESS',					     'FLAVOR_AIR_CARRIER',				        25                           UNION ALL
SELECT								'TECH_SKY_FORTRESS',					     'FLAVOR_ANTIAIR',					        20							UNION ALL
SELECT								'TECH_SKY_FORTRESS',					     'FLAVOR_EXPANSION',				        245                           UNION ALL
SELECT								'TECH_SKY_FORTRESS',					     'FLAVOR_OFFENSE',				            20                           UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_CIVIL_DEFENSE',						 'FLAVOR_MOBILE',				            11							UNION ALL
SELECT								'TECH_CIVIL_DEFENSE',						 'FLAVOR_CULTURE',				         	 8							UNION ALL
SELECT								'TECH_CIVIL_DEFENSE',						 'FLAVOR_WONDER',				         	20							UNION ALL
SELECT								'TECH_CIVIL_DEFENSE',						 'FLAVOR_GREAT_PEOPLE',				         9					        UNION ALL
SELECT								'TECH_CIVIL_DEFENSE',						 'FLAVOR_PRODUCTION',					    14							UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_THE_GRAND_IDEA',						 'FLAVOR_MOBILE',				            12							UNION ALL
SELECT								'TECH_THE_GRAND_IDEA',						 'FLAVOR_SCIENCE',				         	10							UNION ALL
SELECT								'TECH_THE_GRAND_IDEA',						 'FLAVOR_TILE_IMPROVEMENT',				    12							UNION ALL
SELECT								'TECH_THE_GRAND_IDEA',						 'FLAVOR_GREAT_PEOPLE',				         8					        UNION ALL
SELECT								'TECH_THE_GRAND_IDEA',						 'FLAVOR_PRODUCTION',					    246							UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_ANALOG_COMPUTATION',				     'FLAVOR_WONDER',				            20							UNION ALL
SELECT								'TECH_ANALOG_COMPUTATION',				     'FLAVOR_SCIENCE',				         	11							UNION ALL
SELECT								'TECH_ANALOG_COMPUTATION',				     'FLAVOR_CULTURE',				         	 8							UNION ALL
SELECT								'TECH_ANALOG_COMPUTATION',				     'FLAVOR_GREAT_PEOPLE',				         8					        UNION ALL
SELECT								'TECH_ANALOG_COMPUTATION',				     'FLAVOR_PRODUCTION',					    10							UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_ENVIRONMENTAL_ECONOMICS',				 'FLAVOR_TILE_IMPROVEMENT',					20							UNION ALL
SELECT								'TECH_ENVIRONMENTAL_ECONOMICS',				 'FLAVOR_GOLD',				                25							UNION ALL
SELECT								'TECH_ENVIRONMENTAL_ECONOMICS',				 'FLAVOR_CULTURE',				         	11							UNION ALL
SELECT								'TECH_ENVIRONMENTAL_ECONOMICS',				 'FLAVOR_WONDER',				         	20							UNION ALL
SELECT								'TECH_ENVIRONMENTAL_ECONOMICS',				 'FLAVOR_HAPPINESS',					    10							UNION ALL
SELECT								'TECH_ENVIRONMENTAL_ECONOMICS',				 'FLAVOR_INFRASTRUCTURE',				    247;
----------------------------------------------------------------------------------------------------------------------------------------------------------------





INSERT INTO Technology_Flavors (	TechType,									FlavorType,									Flavor)
--New Entries for Neo--
--Summary
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_EINSTEIN',					'FLAVOR_TILE_IMPROVEMENT',					17							UNION ALL
SELECT								'TECH_EINSTEIN',					'FLAVOR_PRODUCTION',				        16                           UNION ALL
SELECT								'TECH_EINSTEIN',					'FLAVOR_HAPPINESS',					        10							UNION ALL
SELECT								'TECH_EINSTEIN',					'FLAVOR_EXPANSION',				            248                           UNION ALL
SELECT								'TECH_EINSTEIN',					'FLAVOR_WONDER',				            20                           UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_QUANTUM_PHYSICS',						         'FLAVOR_EXPANSION',				        11							UNION ALL
SELECT								'TECH_QUANTUM_PHYSICS',						         'FLAVOR_SCIENCE',				         	10							UNION ALL
SELECT								'TECH_QUANTUM_PHYSICS',						         'FLAVOR_GROWTH',				         	12							UNION ALL
SELECT								'TECH_QUANTUM_PHYSICS',						         'FLAVOR_TILE_IMPROVEMENT',				    249					        UNION ALL
SELECT								'TECH_QUANTUM_PHYSICS',						         'FLAVOR_PRODUCTION',					    14							UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_GRAVITON_THEORY',						         'FLAVOR_EXPANSION',				        120							UNION ALL
SELECT								'TECH_GRAVITON_THEORY',						         'FLAVOR_SCIENCE',				         	10							UNION ALL
SELECT								'TECH_GRAVITON_THEORY',						         'FLAVOR_GROWTH',				         	121							UNION ALL
SELECT								'TECH_GRAVITON_THEORY',						         'FLAVOR_GOLD',				                10					        UNION ALL
SELECT								'TECH_GRAVITON_THEORY',						         'FLAVOR_PRODUCTION',					    122							UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_EXPEDITIONARY_SCIENCE',						     'FLAVOR_EXPANSION',				        13							UNION ALL
SELECT								'TECH_EXPEDITIONARY_SCIENCE',						     'FLAVOR_SCIENCE',				         	11							UNION ALL
SELECT								'TECH_EXPEDITIONARY_SCIENCE',						     'FLAVOR_GROWTH',				         	12							UNION ALL
SELECT								'TECH_EXPEDITIONARY_SCIENCE',						     'FLAVOR_SCIENCE',				         	10					        UNION ALL
SELECT								'TECH_EXPEDITIONARY_SCIENCE',						     'FLAVOR_PRODUCTION',					    10							UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_SPECIALIZED_TRAINING',						    'FLAVOR_TILE_IMPROVEMENT',					11							UNION ALL
SELECT								'TECH_SPECIALIZED_TRAINING',						    'FLAVOR_EXPANSION',				            123							UNION ALL
SELECT								'TECH_SPECIALIZED_TRAINING',						    'FLAVOR_SCIENCE',				         	10							UNION ALL
SELECT								'TECH_SPECIALIZED_TRAINING',						    'FLAVOR_GROWTH',				         	124							UNION ALL
SELECT								'TECH_SPECIALIZED_TRAINING',							'FLAVOR_HAPPINESS',							10							UNION ALL
SELECT								'TECH_SPECIALIZED_TRAINING',							'FLAVOR_CULTURE',							10;
----------------------------------------------------------------------------------------------------------------------------------------------------------------





INSERT INTO Technology_Flavors (	TechType,									FlavorType,									Flavor)
--New Entries for Neo--
--Summary
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_ECOLOGICAL_ENGINEERING',					'FLAVOR_TILE_IMPROVEMENT',					17							UNION ALL
SELECT								'TECH_ECOLOGICAL_ENGINEERING',					'FLAVOR_PRODUCTION',				        16                           UNION ALL
SELECT								'TECH_ECOLOGICAL_ENGINEERING',					'FLAVOR_HAPPINESS',					        10							UNION ALL
SELECT								'TECH_ECOLOGICAL_ENGINEERING',					'FLAVOR_EXPANSION',				            130                           UNION ALL
SELECT								'TECH_ECOLOGICAL_ENGINEERING',					'FLAVOR_WONDER',				            20                           UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_MIND_MACHINE_INTERFACE',				    'FLAVOR_EXPANSION',				            11							UNION ALL
SELECT								'TECH_MIND_MACHINE_INTERFACE',				    'FLAVOR_SCIENCE',				         	10							UNION ALL
SELECT								'TECH_MIND_MACHINE_INTERFACE',				    'FLAVOR_GROWTH',				         	12							UNION ALL
SELECT								'TECH_MIND_MACHINE_INTERFACE',				    'FLAVOR_TILE_IMPROVEMENT',				    133					        UNION ALL
SELECT								'TECH_MIND_MACHINE_INTERFACE',				    'FLAVOR_PRODUCTION',					    14							UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_APPLIED_GRAVITONICS',						'FLAVOR_EXPANSION',				            131							UNION ALL
SELECT								'TECH_APPLIED_GRAVITONICS',						'FLAVOR_SCIENCE',				         	10							UNION ALL
SELECT								'TECH_APPLIED_GRAVITONICS',						'FLAVOR_GROWTH',				         	134							UNION ALL
SELECT								'TECH_APPLIED_GRAVITONICS',					    'FLAVOR_GOLD',				                10					        UNION ALL
SELECT								'TECH_APPLIED_GRAVITONICS',						'FLAVOR_PRODUCTION',					    132							UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_INDUSTRIAL_ECONOMICS',				    'FLAVOR_I_LAND_TRADE_ROUTE',				25							UNION ALL
SELECT								'TECH_INDUSTRIAL_ECONOMICS',				    'FLAVOR_I_SEA_TRADE_ROUTE',				    25							UNION ALL
SELECT								'TECH_INDUSTRIAL_ECONOMICS',				    'FLAVOR_EXPANSION',				            13							UNION ALL
SELECT								'TECH_INDUSTRIAL_ECONOMICS',				    'FLAVOR_SCIENCE',				         	11							UNION ALL
SELECT								'TECH_INDUSTRIAL_ECONOMICS',				    'FLAVOR_GROWTH',				         	12							UNION ALL
SELECT								'TECH_INDUSTRIAL_ECONOMICS',				    'FLAVOR_SCIENCE',				         	10					        UNION ALL
SELECT								'TECH_INDUSTRIAL_ECONOMICS',				    'FLAVOR_PRODUCTION',					    10							UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_DATA_ENCRPYTION',						    'FLAVOR_TILE_IMPROVEMENT',					11							UNION ALL
SELECT								'TECH_DATA_ENCRPYTION',						    'FLAVOR_EXPANSION',				            135							UNION ALL
SELECT								'TECH_DATA_ENCRPYTION',						    'FLAVOR_SCIENCE',				         	10							UNION ALL
SELECT								'TECH_DATA_ENCRPYTION',						    'FLAVOR_GROWTH',				         	136							UNION ALL
SELECT								'TECH_DATA_ENCRPYTION',							'FLAVOR_HAPPINESS',							10							UNION ALL
SELECT								'TECH_DATA_ENCRPYTION',							'FLAVOR_CULTURE',							10;
----------------------------------------------------------------------------------------------------------------------------------------------------------------





INSERT INTO Technology_Flavors (	TechType,									FlavorType,									Flavor)
--New Entries for Neo--
--Summary--overworked
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_TECHNOCRACY',					           'FLAVOR_TILE_IMPROVEMENT',					12							UNION ALL
SELECT								'TECH_TECHNOCRACY',					           'FLAVOR_GREAT_PEOPLE',				        10                           UNION ALL
SELECT								'TECH_TECHNOCRACY',					           'FLAVOR_HAPPINESS',					        12							UNION ALL
SELECT								'TECH_TECHNOCRACY',					           'FLAVOR_INFRASTRUCTURE',				        10                           UNION ALL
SELECT								'TECH_TECHNOCRACY',					           'FLAVOR_WONDER',				                20                           UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_INFERNAL_COMBUSTION',					   'FLAVOR_SCIENCE',				         	17							UNION ALL
SELECT								'TECH_INFERNAL_COMBUSTION',					   'FLAVOR_SPACESHIP',				         	100							UNION ALL
SELECT								'TECH_INFERNAL_COMBUSTION',					   'FLAVOR_TILE_IMPROVEMENT',				    10					        UNION ALL
SELECT								'TECH_INFERNAL_COMBUSTION',					   'FLAVOR_PRODUCTION',					        14							UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_PRE_SENTIENT_ALGORITHMS',				   'FLAVOR_WONDER',				                20							UNION ALL
SELECT								'TECH_PRE_SENTIENT_ALGORITHMS',				   'FLAVOR_SCIENCE',				         	13							UNION ALL
SELECT								'TECH_PRE_SENTIENT_ALGORITHMS',				   'FLAVOR_ESPIONAGE',				         	35							UNION ALL
SELECT								'TECH_PRE_SENTIENT_ALGORITHMS',				   'FLAVOR_GREAT_PEOPLE',				        12					        UNION ALL
SELECT								'TECH_PRE_SENTIENT_ALGORITHMS',				   'FLAVOR_HAPPINESS',					        137							UNION ALL
-------------------------------------------need adjusting---------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_SUBTERRANEAN_EXPLORATION',						     'FLAVOR_EXPANSION',				        13							UNION ALL
SELECT								'TECH_SUBTERRANEAN_EXPLORATION',						     'FLAVOR_SCIENCE',				         	11							UNION ALL
SELECT								'TECH_SUBTERRANEAN_EXPLORATION',						     'FLAVOR_GROWTH',				         	12							UNION ALL
SELECT								'TECH_SUBTERRANEAN_EXPLORATION',						     'FLAVOR_SCIENCE',				         	10					        UNION ALL
SELECT								'TECH_SUBTERRANEAN_EXPLORATION',						     'FLAVOR_PRODUCTION',					    10							UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_VERTICAL_INTEGRATION',					'FLAVOR_MOBILE',				            35							UNION ALL
SELECT								'TECH_VERTICAL_INTEGRATION',				    'FLAVOR_GOLD',				         	    20							UNION ALL
SELECT								'TECH_VERTICAL_INTEGRATION',				    'FLAVOR_I_LAND_TRADE_ROUTE',			    40					        UNION ALL
SELECT								'TECH_VERTICAL_INTEGRATION',				    'FLAVOR_I_SEA_TRADE_ROUTE',			        40							UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_SOCIAL_PSYCHOLOGY',						'FLAVOR_EXPANSION',				            13							UNION ALL
SELECT								'TECH_SOCIAL_PSYCHOLOGY',						'FLAVOR_HAPPINESS',				         	20							UNION ALL
SELECT								'TECH_SOCIAL_PSYCHOLOGY',						'FLAVOR_GROWTH',				         	12							UNION ALL
SELECT								'TECH_SOCIAL_PSYCHOLOGY',						'FLAVOR_GREAT_PEOPLE',				        16					        UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_NOBLESSE_OBLIGE',						     'FLAVOR_TILE_IMPROVEMENT',				    139							UNION ALL
SELECT								'TECH_NOBLESSE_OBLIGE',						     'FLAVOR_GOLD',				         	    139							UNION ALL
SELECT								'TECH_NOBLESSE_OBLIGE',						     'FLAVOR_I_LAND_TRADE_ROUTE',				35							UNION ALL
SELECT								'TECH_NOBLESSE_OBLIGE',						     'FLAVOR_I_SEA_TRADE_ROUTE',				35					        UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_GOSPEL_OF_WEALTH',						 'FLAVOR_GOLD',				                20							UNION ALL
SELECT								'TECH_GOSPEL_OF_WEALTH',						 'FLAVOR_I_LAND_TRADE_ROUTE',				35							UNION ALL
SELECT								'TECH_GOSPEL_OF_WEALTH',						 'FLAVOR_I_LAND_TRADE_ROUTE',				35							UNION ALL
SELECT								'TECH_GOSPEL_OF_WEALTH',						 'FLAVOR_TILE_IMPROVEMENT',				    13					        UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_NEURAL_GRAFTING',						     'FLAVOR_EXPANSION',				        13							UNION ALL
SELECT								'TECH_NEURAL_GRAFTING',						     'FLAVOR_SCIENCE',				         	11							UNION ALL
SELECT								'TECH_NEURAL_GRAFTING',						     'FLAVOR_GROWTH',				         	12							UNION ALL
SELECT								'TECH_NEURAL_GRAFTING',						     'FLAVOR_GREAT_PEOPLE',				        10					        UNION ALL
SELECT								'TECH_NEURAL_GRAFTING',						     'FLAVOR_PRODUCTION',					    10							UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_DOCTRINE_INITIATIVE',						 'FLAVOR_I_LAND_TRADE_ROUTE',				25							UNION ALL
SELECT								'TECH_DOCTRINE_INITIATIVE',						 'FLAVOR_I_SEA_TRADE_ROUTE',				25							UNION ALL
SELECT								'TECH_DOCTRINE_INITIATIVE',						 'FLAVOR_WONDER',				            20							UNION ALL
SELECT								'TECH_DOCTRINE_INITIATIVE',						 'FLAVOR_SCIENCE',				         	12							UNION ALL
SELECT								'TECH_DOCTRINE_INITIATIVE',						 'FLAVOR_GROWTH',				         	10							UNION ALL
SELECT								'TECH_DOCTRINE_INITIATIVE',						 'FLAVOR_INFRASTRUCTURE',				    10					        UNION ALL
SELECT								'TECH_DOCTRINE_INITIATIVE',						 'FLAVOR_PRODUCTION',					    10							UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_PLANETARY_NETWORKS',						    'FLAVOR_GREAT_PEOPLE',					14							UNION ALL
SELECT								'TECH_PLANETARY_NETWORKS',						    'FLAVOR_EXPANSION',				        140							UNION ALL
SELECT								'TECH_PLANETARY_NETWORKS',						    'FLAVOR_SCIENCE',				        18							UNION ALL
SELECT								'TECH_PLANETARY_NETWORKS',						    'FLAVOR_GOLD',				            14							UNION ALL
SELECT								'TECH_PLANETARY_NETWORKS',							'FLAVOR_GROWTH',					    14							UNION ALL
SELECT								'TECH_PLANETARY_NETWORKS',							'FLAVOR_WONDER',					    20;
----------------------------------------------------------------------------------------------------------------------------------------------------------------


INSERT INTO Technology_Flavors (	TechType,									FlavorType,									Flavor)
--New Entries for Neo--
--Summary
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_FUEL_CELLS',					'FLAVOR_TILE_IMPROVEMENT',					17							UNION ALL
SELECT								'TECH_FUEL_CELLS',					'FLAVOR_PRODUCTION',				        16                           UNION ALL
SELECT								'TECH_FUEL_CELLS',					'FLAVOR_HAPPINESS',					        10							UNION ALL
SELECT								'TECH_FUEL_CELLS',					'FLAVOR_EXPANSION',				            141                           UNION ALL
SELECT								'TECH_FUEL_CELLS',					'FLAVOR_WONDER',				            20                           UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_WIRELESS_POWER',					'FLAVOR_TILE_IMPROVEMENT',					17							UNION ALL
SELECT								'TECH_WIRELESS_POWER',					'FLAVOR_PRODUCTION',				        16                           UNION ALL
SELECT								'TECH_WIRELESS_POWER',					'FLAVOR_HAPPINESS',					        10							UNION ALL
SELECT								'TECH_WIRELESS_POWER',					'FLAVOR_EXPANSION',				            142                           UNION ALL
SELECT								'TECH_WIRELESS_POWER',					'FLAVOR_WONDER',				            20                           UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_HOMO_SUPERIOR',					'FLAVOR_TILE_IMPROVEMENT',					17							UNION ALL
SELECT								'TECH_HOMO_SUPERIOR',					'FLAVOR_PRODUCTION',				        16                           UNION ALL
SELECT								'TECH_HOMO_SUPERIOR',					'FLAVOR_HAPPINESS',					        10							UNION ALL
SELECT								'TECH_HOMO_SUPERIOR',					'FLAVOR_EXPANSION',				            143                           UNION ALL
SELECT								'TECH_HOMO_SUPERIOR',					'FLAVOR_WONDER',				            20                           UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_BIOMACHINERY',					'FLAVOR_TILE_IMPROVEMENT',					17							UNION ALL
SELECT								'TECH_BIOMACHINERY',					'FLAVOR_PRODUCTION',				        16                           UNION ALL
SELECT								'TECH_BIOMACHINERY',					'FLAVOR_HAPPINESS',					        10							UNION ALL
SELECT								'TECH_BIOMACHINERY',					'FLAVOR_EXPANSION',				            144                           UNION ALL
SELECT								'TECH_BIOMACHINERY',					'FLAVOR_WONDER',				            20                           UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_SUPER_TENSILE_SOLIDS',					'FLAVOR_TILE_IMPROVEMENT',					17							UNION ALL
SELECT								'TECH_SUPER_TENSILE_SOLIDS',					'FLAVOR_PRODUCTION',				        16                           UNION ALL
SELECT								'TECH_SUPER_TENSILE_SOLIDS',					'FLAVOR_HAPPINESS',					        10							UNION ALL
SELECT								'TECH_SUPER_TENSILE_SOLIDS',					'FLAVOR_EXPANSION',				            145                           UNION ALL
SELECT								'TECH_SUPER_TENSILE_SOLIDS',					'FLAVOR_WONDER',				            20                           UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_BEAMEN',					'FLAVOR_TILE_IMPROVEMENT',					17							UNION ALL
SELECT								'TECH_BEAMEN',					'FLAVOR_PRODUCTION',				        16                           UNION ALL
SELECT								'TECH_BEAMEN',					'FLAVOR_HAPPINESS',					        10							UNION ALL
SELECT								'TECH_BEAMEN',					'FLAVOR_EXPANSION',				            146                           UNION ALL
SELECT								'TECH_BEAMEN',					'FLAVOR_WONDER',				            20                           UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_HIGH_ENERGY_CHEMISTRY',					'FLAVOR_TILE_IMPROVEMENT',					17							UNION ALL
SELECT								'TECH_HIGH_ENERGY_CHEMISTRY',					'FLAVOR_PRODUCTION',				        16                           UNION ALL
SELECT								'TECH_HIGH_ENERGY_CHEMISTRY',					'FLAVOR_HAPPINESS',					        10							UNION ALL
SELECT								'TECH_HIGH_ENERGY_CHEMISTRY',					'FLAVOR_EXPANSION',				            810                           UNION ALL
SELECT								'TECH_HIGH_ENERGY_CHEMISTRY',					'FLAVOR_WONDER',				            20                           UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_NANOMINIATURIZATION',					'FLAVOR_TILE_IMPROVEMENT',					17							UNION ALL
SELECT								'TECH_NANOMINIATURIZATION',					'FLAVOR_PRODUCTION',				        16                           UNION ALL
SELECT								'TECH_NANOMINIATURIZATION',					'FLAVOR_HAPPINESS',					        10							UNION ALL
SELECT								'TECH_NANOMINIATURIZATION',					'FLAVOR_EXPANSION',				            821                           UNION ALL
SELECT								'TECH_NANOMINIATURIZATION',					'FLAVOR_WONDER',				            20                           UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_SPACE_MINING',					'FLAVOR_TILE_IMPROVEMENT',					17							UNION ALL
SELECT								'TECH_SPACE_MINING',					'FLAVOR_PRODUCTION',				        16                           UNION ALL
SELECT								'TECH_SPACE_MINING',					'FLAVOR_HAPPINESS',					        10							UNION ALL
SELECT								'TECH_SPACE_MINING',					'FLAVOR_EXPANSION',				            147                           UNION ALL
SELECT								'TECH_SPACE_MINING',					'FLAVOR_WONDER',				            20;

-----------------------------------------------------------------------------------------------------------------------------------------------------------------

------------------stopped here due double entries, makes me crazy(



-----------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO Technology_Flavors (	TechType,									FlavorType,									Flavor)
--ANCIENT ERA--overworked
--SETTLER
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_TOOL_SPECIALIZATION',					'FLAVOR_TILE_IMPROVEMENT',					17							UNION ALL
SELECT								'TECH_TOOL_SPECIALIZATION',					'FLAVOR_PRODUCTION',				        16                           UNION ALL
SELECT								'TECH_TOOL_SPECIALIZATION',					'FLAVOR_HAPPINESS',					        10							UNION ALL
SELECT								'TECH_TOOL_SPECIALIZATION',					'FLAVOR_EXPANSION',				            148                           UNION ALL
SELECT								'TECH_TOOL_SPECIALIZATION',					'FLAVOR_WONDER',				            20                           UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_WEAVER',						         'FLAVOR_EXPANSION',				        11							UNION ALL
SELECT								'TECH_WEAVER',						         'FLAVOR_SCIENCE',				         	10							UNION ALL
SELECT								'TECH_WEAVER',						         'FLAVOR_GROWTH',				         	12							UNION ALL
SELECT								'TECH_WEAVER',						         'FLAVOR_TILE_IMPROVEMENT',				    149					        UNION ALL
SELECT								'TECH_WEAVER',						         'FLAVOR_PRODUCTION',					    14							UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_AQUA',						         'FLAVOR_EXPANSION',				        170						UNION ALL
SELECT								'TECH_AQUA',						         'FLAVOR_SCIENCE',				         	10							UNION ALL
SELECT								'TECH_AQUA',						         'FLAVOR_GROWTH',				         	171							UNION ALL
SELECT								'TECH_AQUA',						         'FLAVOR_GOLD',				                10					        UNION ALL
SELECT								'TECH_AQUA',						         'FLAVOR_PRODUCTION',					    172							UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_FRESHWATER',						     'FLAVOR_EXPANSION',				        13							UNION ALL
SELECT								'TECH_FRESHWATER',						     'FLAVOR_SCIENCE',				         	11							UNION ALL
SELECT								'TECH_FRESHWATER',						     'FLAVOR_GROWTH',				         	12							UNION ALL
SELECT								'TECH_FRESHWATER',						     'FLAVOR_SCIENCE',				         	10					        UNION ALL
SELECT								'TECH_FRESHWATER',						     'FLAVOR_PRODUCTION',					    10							UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_GATHERING',						    'FLAVOR_TILE_IMPROVEMENT',					11							UNION ALL
SELECT								'TECH_GATHERING',						    'FLAVOR_EXPANSION',				            173							UNION ALL
SELECT								'TECH_GATHERING',						    'FLAVOR_SCIENCE',				         	10							UNION ALL
SELECT								'TECH_GATHERING',						    'FLAVOR_GROWTH',				         	174							UNION ALL
SELECT								'TECH_GATHERING',							'FLAVOR_HAPPINESS',							10							UNION ALL
SELECT								'TECH_GATHERING',							'FLAVOR_CULTURE',							10;
----------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO Technology_Flavors (	TechType,									FlavorType,									Flavor)
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_WOOD_CLEARING',						'FLAVOR_TILE_IMPROVEMENT',					11							UNION ALL
SELECT								'TECH_WOOD_CLEARING',						'FLAVOR_OFFENSE',				         	13							UNION ALL
SELECT								'TECH_WOOD_CLEARING',						'FLAVOR_DEFENSE',				         	13							UNION ALL
SELECT								'TECH_WOOD_CLEARING',						'FLAVOR_PRODUCTION',					    10							UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_FIRE',						        'FLAVOR_TILE_IMPROVEMENT',					11							UNION ALL
SELECT								'TECH_FIRE',						        'FLAVOR_EXPANSION',				         	13							UNION ALL
SELECT								'TECH_FIRE',						        'FLAVOR_SCIENCE',				         	11							UNION ALL
SELECT								'TECH_FIRE',						        'FLAVOR_GROWTH',				         	12							UNION ALL
SELECT								'TECH_FIRE',					            'FLAVOR_MOBILE',                            10							UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_HUNTING',					            'FLAVOR_GROWTH',							11							UNION ALL
SELECT								'TECH_HUNTING',					            'FLAVOR_MOBILE',                            12							UNION ALL
SELECT								'TECH_HUNTING',						        'FLAVOR_TILE_IMPROVEMENT',					11							UNION ALL
SELECT								'TECH_HUNTING',						        'FLAVOR_EXPANSION',				            10							UNION ALL
SELECT								'TECH_HUNTING',						        'FLAVOR_SCIENCE',				         	10;
----------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO Technology_Flavors (	TechType,									FlavorType,									Flavor)
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_SHELTER',					            'FLAVOR_MOBILE',                            10							UNION ALL
SELECT								'TECH_SHELTER',						        'FLAVOR_EXPANSION',				         	175							UNION ALL
SELECT								'TECH_SHELTER',				                'FLAVOR_GROWTH',                            10							UNION ALL
SELECT								'TECH_SHELTER',						        'FLAVOR_SCIENCE',                           10							UNION ALL
SELECT								'TECH_SHELTER',					            'FLAVOR_CULTURE',							10							UNION ALL
SELECT								'TECH_SHELTER',						        'FLAVOR_HAPPINESS',				         	10							UNION ALL
SELECT								'TECH_SHELTER',					            'FLAVOR_WONDER',							10							UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_SCOUTING',						     'FLAVOR_GROWTH',				         	12							UNION ALL
SELECT								'TECH_SCOUTING',					        'FLAVOR_HAPPINESS',							13							UNION ALL
SELECT								'TECH_SCOUTING',					        'FLAVOR_OFFENSE',                           11							UNION ALL
SELECT								'TECH_SCOUTING',						    'FLAVOR_EXPANSION',				         	12							UNION ALL
SELECT								'TECH_SCOUTING',						    'FLAVOR_SCIENCE',				         	10							UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_SPORTS',					            'FLAVOR_HAPPINESS',							13							UNION ALL
SELECT								'TECH_SPORTS',						        'FLAVOR_EXPANSION',				         	12							UNION ALL
SELECT								'TECH_SPORTS',						        'FLAVOR_WONDER',				         	12							UNION ALL
SELECT								'TECH_SPORTS',						        'FLAVOR_CULTURE',				            10;
----------------------------------------------------------------------------------------------------------------------------------------------------------------


INSERT INTO Technology_Flavors (	TechType,									FlavorType,									Flavor)
SELECT								'TECH_TOOLS',					            'FLAVOR_EXPANSION',					        10							UNION ALL
SELECT								'TECH_TOOLS',					            'FLAVOR_SCIENCE',                           10							UNION ALL
SELECT								'TECH_TOOLS',						        'FLAVOR_GROWTH',				            10						    UNION ALL
SELECT								'TECH_TOOLS',					            'FLAVOR_PRODUCTION',					    176							UNION ALL
SELECT								'TECH_TOOLS',					            'FLAVOR_WONDER',                            20							UNION ALL
SELECT								'TECH_TOOLS',						        'FLAVOR_TILE_IMPROVEMENT',				    177							UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_CARAVANS',					        'FLAVOR_EXPANSION',					         178				 			UNION ALL
SELECT								'TECH_CARAVANS',					        'FLAVOR_GOLD',                               25							UNION ALL
SELECT								'TECH_CARAVANS',						    'FLAVOR_MOBILE',				             25							UNION ALL
SELECT								'TECH_CARAVANS',						    'FLAVOR_HAPPINESS',				             11							UNION ALL
SELECT								'TECH_CARAVANS',					        'FLAVOR_GROWTH',                             180							UNION ALL
SELECT								'TECH_CARAVANS',						    'FLAVOR_PRODUCTION',				         181							UNION ALL
SELECT								'TECH_CARAVANS',						    'FLAVOR_SCIENCE',				             10							UNION ALL
SELECT								'TECH_CARAVANS',					        'FLAVOR_I_LAND_TRADE_ROUTE',			 25;	
----------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO Technology_Flavors (	TechType,									FlavorType,									Flavor)
SELECT							    'TECH_RAW_MATERIALS',					    'FLAVOR_EXPANSION',					          11						  	UNION ALL
SELECT								'TECH_RAW_MATERIALS',					    'FLAVOR_PRODUCTION',                          12							UNION ALL
SELECT								'TECH_RAW_MATERIALS',					    'FLAVOR_WONDER',				              12							UNION ALL
SELECT								'TECH_RAW_MATERIALS',					    'FLAVOR_TILE_IMPROVEMENT',		              11							UNION ALL
SELECT								'TECH_RAW_MATERIALS',					    'FLAVOR_SCIENCE',		                      10							UNION ALL
SELECT								'TECH_RAW_MATERIALS',                       'FLAVOR_PRODUCTION',                          22							UNION ALL

----------------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT							    'TECH_FARMERS_MARKETS',					    'FLAVOR_GROWTH',					          25						  	UNION ALL
SELECT								'TECH_FARMERS_MARKETS',						'FLAVOR_WONDER',				              20							UNION ALL
SELECT								'TECH_FARMERS_MARKETS',						'FLAVOR_EXPANSION',		                      182							UNION ALL
SELECT								'TECH_FARMERS_MARKETS',						'FLAVOR_SCIENCE',				              10							UNION ALL
SELECT								'TECH_FARMERS_MARKETS',						'FLAVOR_PRODUCTION',		                  10							UNION ALL

----------------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT								'TECH_FARMERS_MARKETS',                    'FLAVOR_GROWTH',                               18							UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT								'TECH_LANGUAGE',						    'FLAVOR_SCIENCE',				              183							UNION ALL
SELECT								'TECH_LANGUAGE',						    'FLAVOR_EXPANSION',		                      184							UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT								'TECH_AGRICULTURE',							'FLAVOR_GROWTH',						    	185						UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT								'TECH_CALENDAR',							'FLAVOR_WONDER',							14							UNION ALL
SELECT								'TECH_CALENDAR',							'FLAVOR_RELIGION',							20							UNION ALL
SELECT								'TECH_CALENDAR',							'FLAVOR_HAPPINESS',							14							UNION ALL
SELECT								'TECH_CALENDAR',							'FLAVOR_CULTURE',							11							UNION ALL
SELECT								'TECH_CALENDAR',							'FLAVOR_SCIENCE',							12							UNION ALL
SELECT								'TECH_CALENDAR',							'FLAVOR_OFFENSE',							11							UNION ALL
SELECT								'TECH_CALENDAR',							'FLAVOR_EXPANSION',							12;
----------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO Technology_Flavors (	TechType,									FlavorType,									Flavor)
SELECT								'TECH_ANIMAL_HUSBANDRY',					'FLAVOR_GROWTH',							12							UNION ALL
SELECT								'TECH_ANIMAL_HUSBANDRY',					'FLAVOR_MOBILE',							18							UNION ALL
SELECT								'TECH_ANIMAL_HUSBANDRY',					'FLAVOR_PRODUCTION',						14							UNION ALL
SELECT								'TECH_ANIMAL_HUSBANDRY',					'FLAVOR_TILE_IMPROVEMENT',					13							UNION ALL
SELECT								'TECH_ANIMAL_HUSBANDRY',					'FLAVOR_OFFENSE',						    14							UNION ALL
SELECT								'TECH_ANIMAL_HUSBANDRY',					'FLAVOR_GOLD',					            10							UNION ALL
SELECT								'TECH_ANIMAL_HUSBANDRY',					'FLAVOR_I_LAND_TRADE_ROUTE',			    186							UNION ALL

----------------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT								'TECH_MINING',								'FLAVOR_PRODUCTION',						20							UNION ALL
SELECT								'TECH_MINING',								'FLAVOR_TILE_IMPROVEMENT',					25							UNION ALL
SELECT								'TECH_MINING',								'FLAVOR_WONDER',						    20							UNION ALL
SELECT								'TECH_MINING',								'FLAVOR_EXPANSION',					        187							UNION ALL
SELECT								'TECH_MINING',								'FLAVOR_HAPPINESS',						    10							UNION ALL
SELECT								'TECH_MINING',								'FLAVOR_SCIENCE',					        10							UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT								'TECH_POTTERY',								'FLAVOR_WONDER',							12							UNION ALL
SELECT								'TECH_POTTERY',								'FLAVOR_INFRASTRUCTURE',					12							UNION ALL
SELECT								'TECH_POTTERY',								'FLAVOR_GROWTH',							22							UNION ALL
SELECT								'TECH_POTTERY',								'FLAVOR_PRODUCTION',					    188							UNION ALL
SELECT								'TECH_POTTERY',								'FLAVOR_SCIENCE',							10;
----------------------------------------------------------------------------------------------------------------------------------------------------------------


INSERT INTO Technology_Flavors (	TechType,									FlavorType,									Flavor)
----------------------------------------------------------------------------------------------------------------------------------------------------------------

--NOMAD
SELECT								'TECH_SACRIFICE_CULT',						'FLAVOR_GROWTH',							189							UNION ALL
SELECT								'TECH_SACRIFICE_CULT',						'FLAVOR_EXPANSION',							190							UNION ALL
SELECT								'TECH_SACRIFICE_CULT',						'FLAVOR_CULTURE',						    194							UNION ALL
SELECT								'TECH_SACRIFICE_CULT',						'FLAVOR_RELIGION',						    191							UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------

--NOMAD
SELECT								'TECH_MONARCHY',						    'FLAVOR_GROWTH',							12							UNION ALL
SELECT								'TECH_MONARCHY',						    'FLAVOR_EXPANSION',							11							UNION ALL
SELECT								'TECH_MONARCHY',						    'FLAVOR_CULTURE',						    192							UNION ALL
SELECT								'TECH_MONARCHY',						    'FLAVOR_INFRASTRUCTURE',				    10							UNION ALL
SELECT								'TECH_MONARCHY',						    'FLAVOR_RELIGION',						    193							UNION ALL
SELECT								'TECH_MONARCHY',							'FLAVOR_WONDER',							20							UNION ALL
SELECT								'TECH_MONARCHY',							'FLAVOR_HAPPINESS',							10							UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT								'TECH_THE_WHEEL',							'FLAVOR_GROWTH',							195							UNION ALL
SELECT								'TECH_THE_WHEEL',							'FLAVOR_EXPANSION',							196							UNION ALL
SELECT								'TECH_THE_WHEEL',							'FLAVOR_PRODUCTION',						197							UNION ALL
SELECT								'TECH_THE_WHEEL',							'FLAVOR_INFRASTRUCTURE',					16							UNION ALL
SELECT								'TECH_THE_WHEEL',							'FLAVOR_GOLD',								12							UNION ALL
SELECT								'TECH_THE_WHEEL',							'FLAVOR_SCIENCE',					        198							UNION ALL
SELECT								'TECH_THE_WHEEL',							'FLAVOR_WONDER',							20							UNION ALL
SELECT								'TECH_THE_WHEEL',							'FLAVOR_HAPPINESS',							10							UNION ALL
SELECT								'TECH_THE_WHEEL',							'FLAVOR_I_LAND_TRADE_ROUTE',			    11995;
--NOMAD
----------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO Technology_Flavors (	TechType,									FlavorType,									Flavor)

----------------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT								'TECH_MASONRY',								'FLAVOR_CITY_DEFENSE',						16							UNION ALL
SELECT								'TECH_MASONRY',								'FLAVOR_TILE_IMPROVEMENT',					410							UNION ALL
SELECT								'TECH_MASONRY',								'FLAVOR_SCIENCE',							10							UNION ALL
SELECT								'TECH_MASONRY',								'FLAVOR_PRODUCTION',						411							UNION ALL
SELECT								'TECH_MASONRY',								'FLAVOR_WONDER',							20							UNION ALL
SELECT								'TECH_MASONRY',								'FLAVOR_INFRASTRUCTURE',					10							UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------

--NOMAD
SELECT								'TECH_MIDAS',								'FLAVOR_GOLD',								25							UNION ALL
SELECT								'TECH_MIDAS',								'FLAVOR_INFRASTRUCTURE',					10							UNION ALL
SELECT								'TECH_MIDAS',								'FLAVOR_I_LAND_TRADE_ROUTE',		        20							UNION ALL
SELECT								'TECH_MIDAS',								'FLAVOR_PRODUCTION',					    10							UNION ALL
SELECT								'TECH_MIDAS',								'FLAVOR_WONDER',							20							UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT								'TECH_FRUITS',						     'FLAVOR_EXPANSION',				         	13							UNION ALL
SELECT								'TECH_FRUITS',						     'FLAVOR_SCIENCE',				         	11							UNION ALL
SELECT								'TECH_FRUITS',						     'FLAVOR_GROWTH',				         	12							UNION ALL
SELECT								'TECH_FRUITS',							 'FLAVOR_TILE_IMPROVEMENT',					412;	
--NOMAD
----------------------------------------------------------------------------------------------------------------------------------------------------------------


INSERT INTO Technology_Flavors (	TechType,									FlavorType,									Flavor)

----------------------------------------------------------------------
SELECT								'TECH_FISHING',						        'FLAVOR_NAVAL',								413							UNION ALL
SELECT								'TECH_FISHING',						        'FLAVOR_NAVAL_TILE_IMPROVEMENT',			10							UNION ALL
SELECT								'TECH_FISHING',						        'FLAVOR_NAVAL_GROWTH',						414							UNION ALL
SELECT								'TECH_FISHING',						        'FLAVOR_GROWTH',						    20							UNION ALL
SELECT								'TECH_FISHING',						        'FLAVOR_WONDER',						    10							UNION ALL
-----------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_FISH_MARKETS',						'FLAVOR_NAVAL',								415							UNION ALL
SELECT								'TECH_FISH_MARKETS',						'FLAVOR_NAVAL_TILE_IMPROVEMENT',			20							UNION ALL
SELECT								'TECH_FISH_MARKETS',						'FLAVOR_NAVAL_GROWTH',						416							UNION ALL
SELECT								'TECH_FISH_MARKETS',						'FLAVOR_GROWTH',						    417							UNION ALL
SELECT								'TECH_FISH_MARKETS',						'FLAVOR_WONDER',						    20							UNION ALL
SELECT								'TECH_FISH_MARKETS',						'FLAVOR_GOLD',						        10							UNION ALL
SELECT								'TECH_FISH_MARKETS',						'FLAVOR_INFRASTRUCTURE',				    10							UNION ALL
--NOMAD
-----------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_SOCIAL_STRUCTURE',					'FLAVOR_GOLD',								20							UNION ALL
SELECT								'TECH_SOCIAL_STRUCTURE',					'FLAVOR_GROWTH',							50							UNION ALL
SELECT								'TECH_SOCIAL_STRUCTURE',					'FLAVOR_EXPANSION',					       100							UNION ALL
SELECT								'TECH_SOCIAL_STRUCTURE',					'FLAVOR_HAPPINESS',							20							UNION ALL
SELECT								'TECH_SOCIAL_STRUCTURE',					'FLAVOR_SCIENCE',							50							UNION ALL
-----------------------------------------------------------------------------------------------------------------------------------------
--NOMAD
SELECT								'TECH_WARFARE',								'FLAVOR_DEFENSE',						   14							UNION ALL
SELECT								'TECH_WARFARE',								'FLAVOR_MILITARY_TRAINING',			       418							UNION ALL
SELECT								'TECH_WARFARE',								'FLAVOR_OFFENSE',						   18							UNION ALL
SELECT								'TECH_WARFARE',								'FLAVOR_EXPANSION',			               11							UNION ALL
SELECT								'TECH_WARFARE',								'FLAVOR_PRODUCTION',					   10;
-----------------------------------------------------------------------------------------------------------------------------------------
--NOMAD
INSERT INTO Technology_Flavors (	TechType,									FlavorType,									Flavor)
-----------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_LEADERSHIP',							'FLAVOR_DEFENSE',						   419							UNION ALL
SELECT								'TECH_LEADERSHIP',							'FLAVOR_EXPANSION',			               20							UNION ALL
SELECT								'TECH_LEADERSHIP',							'FLAVOR_GROWTH',						   10							UNION ALL
SELECT								'TECH_LEADERSHIP',							'FLAVOR_WONDER',			               20							UNION ALL
SELECT								'TECH_LEADERSHIP',							'FLAVOR_SCIENCE',						   11							UNION ALL
SELECT								'TECH_LEADERSHIP',							'FLAVOR_PRODUCTION',			           420							UNION ALL
SELECT								'TECH_LEADERSHIP',							'FLAVOR_CULTURE',			               421							UNION ALL
--NOMAD
-----------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_COPPER_WORKING',						'FLAVOR_TILE_IMPROVEMENT',				   20							UNION ALL
SELECT								'TECH_COPPER_WORKING',						'FLAVOR_WONDER',			               20							UNION ALL
SELECT								'TECH_COPPER_WORKING',						'FLAVOR_PRODUCTION',					   422							UNION ALL
SELECT								'TECH_COPPER_WORKING',						'FLAVOR_SCIENCE',			               11							UNION ALL
SELECT								'TECH_COPPER_WORKING',						'FLAVOR_GOLD',					           10							UNION ALL
SELECT								'TECH_COPPER_WORKING',						'FLAVOR_OFFENSE',					       423							UNION ALL
SELECT								'TECH_COPPER_WORKING',						'FLAVOR_DEFENSE',			               424							UNION ALL
SELECT								'TECH_COPPER_WORKING',						'FLAVOR_MILITARY_TRAINING',				   425;
--NOMAD
-----------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO Technology_Flavors (	TechType,									FlavorType,									Flavor)
-----------------------------------------------------------------------------------------------------------------------------------------
--NOMAD
SELECT								'TECH_TRIBAL_WARRIOR',					    'FLAVOR_OFFENSE',							20							UNION ALL
SELECT								'TECH_TRIBAL_WARRIOR',					    'FLAVOR_DEFENSE',							20							UNION ALL
SELECT								'TECH_TRIBAL_WARRIOR',					    'FLAVOR_MILITARY_TRAINING',					20							UNION ALL
SELECT								'TECH_TRIBAL_WARRIOR',					    'FLAVOR_PRODUCTION',					    10							UNION ALL
SELECT								'TECH_TRIBAL_WARRIOR',					    'FLAVOR_EXPANSION',					        426							UNION ALL
SELECT								'TECH_TRIBAL_WARRIOR',					    'FLAVOR_MOBILE',					        10							UNION ALL
-----------------------------------------------------------------------------------------------------------------------------------------
--NOMAD
SELECT								'TECH_SAILING',								'FLAVOR_NAVAL',								427						    UNION ALL
SELECT								'TECH_SAILING',								'FLAVOR_NAVAL_TILE_IMPROVEMENT',			20							UNION ALL
SELECT								'TECH_SAILING',								'FLAVOR_NAVAL_GROWTH',						12							UNION ALL
SELECT								'TECH_SAILING',								'FLAVOR_GROWTH',			                10							UNION ALL
SELECT								'TECH_SAILING',								'FLAVOR_EXPANSION',						    428							UNION ALL
SELECT								'TECH_SAILING',								'FLAVOR_HAPPINESS',			                10							UNION ALL
SELECT								'TECH_SAILING',								'FLAVOR_NAVAL_RECON',						429;
-----------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO Technology_Flavors (	TechType,									FlavorType,									Flavor)
-----------------------------------------------------------------------------------------------------------------------------------------
--NOMAD
SELECT								'TECH_SHIPBUILDING',						'FLAVOR_OFFENSE',						    430							UNION ALL
SELECT								'TECH_SHIPBUILDING',						'FLAVOR_DEFENSE',						    431							UNION ALL
SELECT								'TECH_SHIPBUILDING',						'FLAVOR_NAVAL',								25							UNION ALL
SELECT								'TECH_SHIPBUILDING',						'FLAVOR_NAVAL_RECON',						25							UNION ALL
SELECT								'TECH_SHIPBUILDING',						'FLAVOR_WONDER',							20						UNION ALL
SELECT								'TECH_SHIPBUILDING',						'FLAVOR_EXPANSION',						    20							UNION ALL
SELECT								'TECH_SHIPBUILDING',					    'FLAVOR_I_SEA_TRADE_ROUTE',			        25							UNION ALL
-----------------------------------------------------------------------------------------------------------------------------------------
--NOMAD
SELECT								'TECH_ECONOMY_OF_SCALE',					'FLAVOR_GOLD',								10							UNION ALL
SELECT								'TECH_ECONOMY_OF_SCALE',					'FLAVOR_GROWTH',							10							UNION ALL
SELECT								'TECH_ECONOMY_OF_SCALE',					'FLAVOR_TILE_IMPROVEMENT',					25							UNION ALL
SELECT								'TECH_ECONOMY_OF_SCALE',					'FLAVOR_HAPPINESS',							20							UNION ALL
SELECT								'TECH_ECONOMY_OF_SCALE',					'FLAVOR_INFRASTRUCTURE',					432							UNION ALL
SELECT								'TECH_ECONOMY_OF_SCALE',					'FLAVOR_EXPANSION',							10							UNION ALL
SELECT								'TECH_ECONOMY_OF_SCALE',					'FLAVOR_PRODUCTION',					    10							UNION ALL
SELECT								'TECH_ECONOMY_OF_SCALE',					'FLAVOR_SCIENCE',							10;
-----------------------------------------------------------------------------------------------------------------------------------------
--NOMAD
INSERT INTO Technology_Flavors (	TechType,									FlavorType,									Flavor)
-----------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_ARGONAUTEN',						'FLAVOR_I_LAND_TRADE_ROUTE',                25							UNION ALL
SELECT								'TECH_ARGONAUTEN',						'FLAVOR_GOLD',								25							UNION ALL
SELECT								'TECH_ARGONAUTEN',						'FLAVOR_INFRASTRUCTURE',					10							UNION ALL
SELECT								'TECH_ARGONAUTEN',						'FLAVOR_NAVAL_GROWTH',					    25							UNION ALL
SELECT								'TECH_ARGONAUTEN',						'FLAVOR_PRODUCTION',					    10							UNION ALL
SELECT								'TECH_ARGONAUTEN',						'FLAVOR_WONDER',							433							UNION ALL
SELECT								'TECH_ARGONAUTEN',					    'FLAVOR_I_SEA_TRADE_ROUTE',			        50							UNION ALL
-----------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_TRADING',								'FLAVOR_TILE_IMPROVEMENT',					434							UNION ALL
SELECT								'TECH_TRADING',								'FLAVOR_GOLD',								25							UNION ALL
SELECT								'TECH_TRADING',								'FLAVOR_INFRASTRUCTURE',					10							UNION ALL
SELECT								'TECH_TRADING',								'FLAVOR_GREAT_PEOPLE',					    25							UNION ALL
SELECT								'TECH_TRADING',								'FLAVOR_PRODUCTION',					    435							UNION ALL
SELECT								'TECH_TRADING',								'FLAVOR_WONDER',							20							UNION ALL
SELECT								'TECH_TRADING',					            'FLAVOR_I_LAND_TRADE_ROUTE',			    50							UNION ALL
--NOMAD
-----------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_FERMENTATION',						'FLAVOR_HAPPINESS',							12							UNION ALL
SELECT								'TECH_FERMENTATION',						'FLAVOR_GROWTH',							12							UNION ALL
SELECT								'TECH_FERMENTATION',						'FLAVOR_TILE_IMPROVEMENT',					11							UNION ALL
SELECT								'TECH_FERMENTATION',						'FLAVOR_EXPANSION',							12;
-----------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO Technology_Flavors (	TechType,									FlavorType,									Flavor)
-----------------------------------------------------------------------------------------------------------------------------------------
--NOMAD
-----------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_TRAPPING',							'FLAVOR_GOLD',								10							UNION ALL
SELECT								'TECH_TRAPPING',							'FLAVOR_GROWTH',							436							UNION ALL
SELECT								'TECH_TRAPPING',							'FLAVOR_SCIENCE',					        10							UNION ALL
SELECT								'TECH_TRAPPING',							'FLAVOR_HAPPINESS',							16							UNION ALL
SELECT								'TECH_TRAPPING',							'FLAVOR_TILE_IMPROVEMENT',					437							UNION ALL
SELECT								'TECH_TRAPPING',							'FLAVOR_WONDER',							20							UNION ALL
-----------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_ARCHERY',								'FLAVOR_RANGED',							25						    UNION ALL
SELECT								'TECH_ARCHERY',								'FLAVOR_OFFENSE',							20							UNION ALL
SELECT								'TECH_ARCHERY',								'FLAVOR_DEFENSE',							25							UNION ALL
SELECT								'TECH_ARCHERY',								'FLAVOR_MOBILE',							438							UNION ALL
SELECT								'TECH_ARCHERY',								'FLAVOR_MILITARY_TRAINING',				    20							UNION ALL
SELECT								'TECH_ARCHERY',								'FLAVOR_WONDER',							20							UNION ALL
SELECT								'TECH_ARCHERY',								'FLAVOR_EXPANSION',				            20							UNION ALL
SELECT								'TECH_ARCHERY',								'FLAVOR_CULTURE',							10                          UNION ALL
SELECT								'TECH_ARCHERY',								'FLAVOR_NUKE',							    10;
-----------------------------------------------------------------------------------------------------------------------------------------
--NOMAD

INSERT INTO Technology_Flavors (	TechType,									FlavorType,									Flavor)
-----------------------------------------------------------------------------------------------------------------------------------------
--NOMAD
-----------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_GLAS',							   'FLAVOR_GOLD',								10							UNION ALL
SELECT								'TECH_GLAS',							    'FLAVOR_GROWTH',							439							UNION ALL
SELECT								'TECH_GLAS',							    'FLAVOR_SCIENCE',					        10							UNION ALL
SELECT								'TECH_GLAS',							   'FLAVOR_HAPPINESS',							16							UNION ALL
SELECT								'TECH_GLAS',							   'FLAVOR_TILE_IMPROVEMENT',					440							UNION ALL
SELECT								'TECH_GLAS',						     	'FLAVOR_WONDER',							20							UNION ALL
-----------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_BRONZE_WORKING',						'FLAVOR_DEFENSE',							20							UNION ALL
SELECT								'TECH_BRONZE_WORKING',						'FLAVOR_TILE_IMPROVEMENT',					25							UNION ALL
SELECT								'TECH_BRONZE_WORKING',						'FLAVOR_PRODUCTION',						10							UNION ALL
SELECT								'TECH_BRONZE_WORKING',						'FLAVOR_OFFENSE',							441							UNION ALL
SELECT								'TECH_BRONZE_WORKING',						'FLAVOR_MILITARY_TRAINING',					442							UNION ALL
SELECT								'TECH_BRONZE_WORKING',						'FLAVOR_WONDER',							20							UNION ALL
SELECT								'TECH_BRONZE_WORKING',						'FLAVOR_EXPANSION',							443							UNION ALL
SELECT								'TECH_BRONZE_WORKING',						'FLAVOR_GOLD',							    10							UNION ALL
SELECT								'TECH_BRONZE_WORKING',						'FLAVOR_NUKE',							    10							UNION ALL
-----------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_MILITARY_TRAINING',					'FLAVOR_NUKE',							    10							UNION ALL
SELECT								'TECH_MILITARY_TRAINING',					'FLAVOR_OFFENSE',							25							UNION ALL
SELECT								'TECH_MILITARY_TRAINING',					'FLAVOR_DEFENSE',							25							UNION ALL
SELECT								'TECH_MILITARY_TRAINING',					'FLAVOR_MILITARY_TRAINING',					20							UNION ALL
SELECT								'TECH_MILITARY_TRAINING',					'FLAVOR_MOBILE',							20							UNION ALL
SELECT								'TECH_MILITARY_TRAINING',					'FLAVOR_WONDER',							20							UNION ALL
SELECT								'TECH_MILITARY_TRAINING',					'FLAVOR_EXPANSION',					        444;
--NOMAD
-----------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO Technology_Flavors (	TechType,									FlavorType,									Flavor)
-----------------------------------------------------------------------------------------------------------------------------------------
--SPIRIT
-----------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_BUDDA',						        'FLAVOR_WONDER',							20							UNION ALL
SELECT								'TECH_BUDDA',						        'FLAVOR_HAPPINESS',						    12							UNION ALL
SELECT								'TECH_BUDDA',						        'FLAVOR_RELIGION',						    445							UNION ALL
SELECT								'TECH_BUDDA',						        'FLAVOR_GREAT_PEOPLE',					    12							UNION ALL
SELECT								'TECH_BUDDA',						        'FLAVOR_CULTURE',	                        12							UNION ALL
-----------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_SPIRITUALITY',						  'FLAVOR_WONDER',							20							UNION ALL
SELECT								'TECH_SPIRITUALITY',						  'FLAVOR_HAPPINESS',						12							UNION ALL
SELECT								'TECH_SPIRITUALITY',						  'FLAVOR_RELIGION',						446							UNION ALL
SELECT								'TECH_SPIRITUALITY',						  'FLAVOR_GREAT_PEOPLE',					12							UNION ALL
SELECT								'TECH_SPIRITUALITY',						  'FLAVOR_CULTURE',	                        12							UNION ALL
-----------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_SCULPTURE',						     'FLAVOR_WONDER',							20							UNION ALL
SELECT								'TECH_SCULPTURE',						     'FLAVOR_HAPPINESS',						12							UNION ALL
SELECT								'TECH_SCULPTURE',						     'FLAVOR_CULTURE',							447							UNION ALL
-----------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_SHAMANISM',						      'FLAVOR_OFFENSE',							10							UNION ALL
SELECT								'TECH_SHAMANISM',						      'FLAVOR_RELIGION',						448							UNION ALL
SELECT								'TECH_SHAMANISM',						      'FLAVOR_CULTURE',							10							UNION ALL
SELECT								'TECH_SHAMANISM',						      'FLAVOR_SCIENCE',							10							UNION ALL
SELECT								'TECH_SHAMANISM',						      'FLAVOR_WONDER',							20							UNION ALL
SELECT								'TECH_SHAMANISM',						      'FLAVOR_HAPPINESS',						10							UNION ALL
-----------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_FOLKLORE',							'FLAVOR_WONDER',							20							UNION ALL
SELECT								'TECH_FOLKLORE',							'FLAVOR_RELIGION',							10							UNION ALL
SELECT								'TECH_FOLKLORE',							'FLAVOR_CULTURE',							449							UNION ALL
SELECT								'TECH_FOLKLORE',							'FLAVOR_HAPPINESS',							10							UNION ALL
SELECT								'TECH_FOLKLORE',							'FLAVOR_SCIENCE',							10							UNION ALL
-----------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_MUMMIFICATION',						'FLAVOR_WONDER',							20							UNION ALL
SELECT								'TECH_MUMMIFICATION',						'FLAVOR_RELIGION',							450							UNION ALL
SELECT								'TECH_MUMMIFICATION',						'FLAVOR_CULTURE',							451;

INSERT INTO Technology_Flavors (	TechType,									FlavorType,									Flavor)

-----------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_RITUALS',						        'FLAVOR_OFFENSE',							12							UNION ALL
SELECT								'TECH_RITUALS',						        'FLAVOR_RELIGION',							13							UNION ALL
SELECT								'TECH_RITUALS',						        'FLAVOR_CULTURE',							13							UNION ALL
SELECT								'TECH_RITUALS',						        'FLAVOR_SCIENCE',							11							UNION ALL
-----------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_ART',						            'FLAVOR_WONDER',							14							UNION ALL
SELECT								'TECH_ART',						            'FLAVOR_HAPPINESS',							11							UNION ALL
SELECT								'TECH_ART',						            'FLAVOR_CULTURE',							14							UNION ALL
-----------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_IDOLS',						        'FLAVOR_RELIGION',							452							UNION ALL
SELECT								'TECH_IDOLS',						        'FLAVOR_HAPPINESS',							10							UNION ALL
SELECT								'TECH_IDOLS',						        'FLAVOR_CULTURE',							453							UNION ALL
SELECT								'TECH_IDOLS',						        'FLAVOR_WONDER',                            20							UNION ALL
-----------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_ORAL_TRADITION',						'FLAVOR_HAPPINESS',							10							UNION ALL
SELECT								'TECH_ORAL_TRADITION',						'FLAVOR_CULTURE',							454							UNION ALL
SELECT								'TECH_ORAL_TRADITION',						'FLAVOR_GREAT_PEOPLE',						455							UNION ALL
SELECT								'TECH_ORAL_TRADITION',						'FLAVOR_WONDER',							20							UNION ALL
SELECT								'TECH_ORAL_TRADITION',						'FLAVOR_SCIENCE',							10							UNION ALL
SELECT								'TECH_ORAL_TRADITION',						'FLAVOR_RELIGION',						    10							UNION ALL
-----------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_CEREMONIAL_BURIAL',					'FLAVOR_CULTURE',							20							UNION ALL
SELECT								'TECH_CEREMONIAL_BURIAL',					'FLAVOR_RELIGION',							20							UNION ALL
SELECT								'TECH_CEREMONIAL_BURIAL',					'FLAVOR_WONDER',							20							UNION ALL
SELECT								'TECH_CEREMONIAL_BURIAL',					'FLAVOR_HAPPINESS',							10							UNION ALL
SELECT								'TECH_CEREMONIAL_BURIAL',					'FLAVOR_EXPANSION',							10							UNION ALL
SELECT								'TECH_CEREMONIAL_BURIAL',					'FLAVOR_GREAT_PEOPLE',						456;
-----------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO Technology_Flavors (	TechType,									FlavorType,									Flavor)
-----------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_GREAT_MONUMENTS',						'FLAVOR_WONDER',							20							UNION ALL
SELECT								'TECH_GREAT_MONUMENTS',						'FLAVOR_CULTURE',							457							UNION ALL
SELECT								'TECH_GREAT_MONUMENTS',						'FLAVOR_PRODUCTION',						458							UNION ALL
SELECT								'TECH_GREAT_MONUMENTS',						'FLAVOR_SCIENCE',							10							UNION ALL
SELECT								'TECH_GREAT_MONUMENTS',						'FLAVOR_HAPPINESS',							10							UNION ALL
SELECT								'TECH_GREAT_MONUMENTS',						'FLAVOR_RELIGION',							459							UNION ALL
-----------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_MYSTICISM',							'FLAVOR_RELIGION',							20							UNION ALL
SELECT								'TECH_MYSTICISM',							'FLAVOR_HAPPINESS',							10							UNION ALL
SELECT								'TECH_MYSTICISM',							'FLAVOR_SCIENCE',					        10							UNION ALL
SELECT								'TECH_MYSTICISM',							'FLAVOR_WONDER',							12							UNION ALL
SELECT								'TECH_MYSTICISM',							'FLAVOR_GREAT_PEOPLE',						10							UNION ALL
SELECT								'TECH_MYSTICISM',							'FLAVOR_CULTURE',							10							UNION ALL
-----------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_MEDITATION',							'FLAVOR_WONDER',							20							UNION ALL
SELECT								'TECH_MEDITATION',							'FLAVOR_RELIGION',							25							UNION ALL
SELECT								'TECH_MEDITATION',							'FLAVOR_SCIENCE',							460							UNION ALL
SELECT								'TECH_MEDITATION',							'FLAVOR_CULTURE',							10;
-----------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO Technology_Flavors (	TechType,									FlavorType,									Flavor)
-----------------------------------------------------------------------------------------------------------------------------------------
--CLASSICAL ERA--
--NUMBER THEORY---overworked
-----------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_TAXES',						        'FLAVOR_GREAT_PEOPLE',					     8							UNION ALL
SELECT								'TECH_TAXES',						        'FLAVOR_PRODUCTION',						10							UNION ALL
SELECT								'TECH_TAXES',						        'FLAVOR_INFRASTRUCTURE',					10							UNION ALL
SELECT								'TECH_TAXES',						        'FLAVOR_GOLD',							    25							UNION ALL
SELECT								'TECH_TAXES',						        'FLAVOR_WONDER',							20							UNION ALL
-----------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_CARTOGRAPHY',						    'FLAVOR_GOLD',							     8							UNION ALL
SELECT								'TECH_CARTOGRAPHY',						    'FLAVOR_CULTURE',						     7							UNION ALL
SELECT								'TECH_CARTOGRAPHY',						    'FLAVOR_MOBILE',							461							UNION ALL
SELECT								'TECH_CARTOGRAPHY',						    'FLAVOR_NAVAL',							    462							UNION ALL
SELECT								'TECH_CARTOGRAPHY',						    'FLAVOR_GREAT_PEOPLE',						 8							UNION ALL
SELECT								'TECH_CARTOGRAPHY',						    'FLAVOR_EXPANSION',							463							UNION ALL
SELECT								'TECH_CARTOGRAPHY',						    'FLAVOR_WONDER',							20							UNION ALL
-----------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_MAXIMUS',						        'FLAVOR_HAPPINESS',							25							UNION ALL
SELECT								'TECH_MAXIMUS',						        'FLAVOR_CULTURE',							10							UNION ALL
SELECT								'TECH_MAXIMUS',							    'FLAVOR_WONDER',							20							UNION ALL
SELECT								'TECH_MAXIMUS',							    'FLAVOR_EXPANSION',							20							UNION ALL
SELECT								'TECH_MAXIMUS',							    'FLAVOR_INFRASTRUCTURE',					20							UNION ALL
SELECT								'TECH_MAXIMUS',							    'FLAVOR_GROWTH',							464							UNION ALL						
-----------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_VASALAGE',							'FLAVOR_GOLD',								10							UNION ALL
SELECT								'TECH_VASALAGE',							'FLAVOR_WONDER',							20							UNION ALL
SELECT								'TECH_VASALAGE',							'FLAVOR_CULTURE',							 9							UNION ALL
SELECT								'TECH_VASALAGE',							'FLAVOR_EXPANSION',							465							UNION ALL
SELECT								'TECH_VASALAGE',							'FLAVOR_TILE_IMPROVEMENT',				    466;
-----------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO Technology_Flavors (	TechType,									FlavorType,									Flavor)
-----------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_CASTE_SYSTEM',						'FLAVOR_CULTURE',							467							UNION ALL
SELECT								'TECH_CASTE_SYSTEM',						'FLAVOR_DIPLOMACY',							20							UNION ALL
SELECT								'TECH_CASTE_SYSTEM',						'FLAVOR_RELIGION',							10							UNION ALL
SELECT								'TECH_CASTE_SYSTEM',						'FLAVOR_WONDER',							20							UNION ALL
SELECT								'TECH_CASTE_SYSTEM',						'FLAVOR_EXPANSION',							10							UNION ALL
SELECT								'TECH_CASTE_SYSTEM',						'FLAVOR_HAPPINESS',							10							UNION ALL
-----------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_SLAVERY',						        'FLAVOR_PRODUCTION',						25							UNION ALL
SELECT								'TECH_SLAVERY',						        'FLAVOR_GOLD',							    468							UNION ALL
SELECT								'TECH_SLAVERY',						        'FLAVOR_EXPANSION',							469							UNION ALL
SELECT								'TECH_SLAVERY',						        'FLAVOR_WONDER',							20							UNION ALL
-----------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_LODGING',						        'FLAVOR_INFRASTRUCTURE',					470							UNION ALL
SELECT								'TECH_LODGING',						        'FLAVOR_GOLD',							    25							UNION ALL
SELECT								'TECH_LODGING',						        'FLAVOR_EXPANSION',							471							UNION ALL
SELECT								'TECH_LODGING',						        'FLAVOR_HAPPINESS',							472							UNION ALL
SELECT								'TECH_LODGING',						        'FLAVOR_CULTURE',							10							UNION ALL
SELECT								'TECH_LODGING',						        'FLAVOR_WONDER',							20;

-----------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO Technology_Flavors (	TechType,									FlavorType,									Flavor)
-----------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_CALCULUS',							'FLAVOR_WONDER',							20							UNION ALL
SELECT								'TECH_CALCULUS',							'FLAVOR_SCIENCE',							25							UNION ALL
SELECT								'TECH_CALCULUS',							'FLAVOR_CULTURE',							10							UNION ALL
SELECT								'TECH_CALCULUS',							'FLAVOR_RELIGION',							10							UNION ALL
SELECT								'TECH_CALCULUS',							'FLAVOR_EXPANSION',							10							UNION ALL
-----------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_CARRIAGES',							'FLAVOR_HAPPINESS',							18							UNION ALL
SELECT								'TECH_CARRIAGES',							'FLAVOR_OFFENSE',							11							UNION ALL
SELECT								'TECH_CARRIAGES',							'FLAVOR_RANGED',							14							UNION ALL
SELECT								'TECH_CARRIAGES',							'FLAVOR_MOBILE',							14							UNION ALL
SELECT								'TECH_CARRIAGES',							'FLAVOR_DEFENSE',							13							UNION ALL
-----------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_HORSEBACK_RIDING',					'FLAVOR_I_LAND_TRADE_ROUTE',				20							UNION ALL
SELECT								'TECH_HORSEBACK_RIDING',					'FLAVOR_I_SEA_TRADE_ROUTE',				473							UNION ALL							
SELECT								'TECH_HORSEBACK_RIDING',					'FLAVOR_MOBILE',							20							UNION ALL
SELECT								'TECH_HORSEBACK_RIDING',					'FLAVOR_OFFENSE',							474							UNION ALL							
SELECT								'TECH_HORSEBACK_RIDING',					'FLAVOR_TILE_IMPROVEMENT',					11;
-----------------------------------------------------------------------------------------------------------------------------------------




INSERT INTO Technology_Flavors (	TechType,									FlavorType,									Flavor)
-----------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_MATHEMATICS',							'FLAVOR_WONDER',							20							UNION ALL
SELECT								'TECH_MATHEMATICS',							'FLAVOR_RELIGION',							10							UNION ALL
SELECT								'TECH_MATHEMATICS',							'FLAVOR_CULTURE',							10							UNION ALL
SELECT								'TECH_MATHEMATICS',							'FLAVOR_SCIENCE',							25							UNION ALL
SELECT								'TECH_MATHEMATICS',							'FLAVOR_EXPANSION',							10							UNION ALL
SELECT								'TECH_MATHEMATICS',							'FLAVOR_GROWTH',							10							UNION ALL
SELECT								'TECH_MATHEMATICS',							'FLAVOR_PRODUCTION',						10							UNION ALL
SELECT								'TECH_MATHEMATICS',							'FLAVOR_DIPLOMACY',							475							UNION ALL
-----------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_CURRENCY',							'FLAVOR_GOLD',								25							UNION ALL
SELECT								'TECH_CURRENCY',							'FLAVOR_HAPPINESS',							476							UNION ALL
SELECT								'TECH_CURRENCY',							'FLAVOR_WONDER',							20							UNION ALL
SELECT								'TECH_CURRENCY',							'FLAVOR_PRODUCTION',						10							UNION ALL
SELECT								'TECH_CURRENCY',							'FLAVOR_SCIENCE',							10							UNION ALL
SELECT								'TECH_CURRENCY',							'FLAVOR_I_LAND_TRADE_ROUTE',			    477;
-----------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO Technology_Flavors (	TechType,									FlavorType,									Flavor)
-----------------------------------------------------------------------------------------------------------------------------------------
--ALPHABET---overworked
-----------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_DEMOCRACY',							'FLAVOR_CULTURE',						    10	 						UNION ALL
SELECT								'TECH_DEMOCRACY',							'FLAVOR_SCIENCE',							10							UNION ALL
SELECT								'TECH_DEMOCRACY',							'FLAVOR_WONDER',							20							UNION ALL
SELECT								'TECH_DEMOCRACY',							'FLAVOR_DIPLOMACY',							10							UNION ALL
SELECT								'TECH_DEMOCRACY',							'FLAVOR_HAPPINESS',							10							UNION ALL
SELECT								'TECH_DEMOCRACY',							'FLAVOR_GREAT_PEOPLE',						478							UNION ALL
-----------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_DUALISM',							     'FLAVOR_RELIGION',						    25							UNION ALL
SELECT								'TECH_DUALISM',							     'FLAVOR_WONDER',						    20							UNION ALL
SELECT								'TECH_DUALISM',							     'FLAVOR_SCIENCE',						    10							UNION ALL	
-----------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_CUNEIFORM',							'FLAVOR_EXPANSION',						    10							UNION ALL
SELECT								'TECH_CUNEIFORM',							'FLAVOR_GROWTH',						    10							UNION ALL
SELECT								'TECH_CUNEIFORM',							'FLAVOR_CULTURE',						    10							UNION ALL
SELECT								'TECH_CUNEIFORM',							'FLAVOR_SCIENCE',							25							UNION ALL
SELECT								'TECH_CUNEIFORM',							'FLAVOR_WONDER',							20							UNION ALL
SELECT								'TECH_CUNEIFORM',							'FLAVOR_DIPLOMACY',							10							UNION ALL
SELECT								'TECH_CUNEIFORM',							'FLAVOR_GOLD',							    10							UNION ALL
SELECT								'TECH_CUNEIFORM',							'FLAVOR_PRODUCTION',						10;
-----------------------------------------------------------------------------------------------------------------------------------------				

INSERT INTO Technology_Flavors (	TechType,									FlavorType,									Flavor)
-----------overworked------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_RELIGIOUS_WORK',						'FLAVOR_CULTURE',							479							UNION ALL
SELECT								'TECH_RELIGIOUS_WORK',						'FLAVOR_WONDER',							20							UNION ALL
SELECT								'TECH_RELIGIOUS_WORK',						'FLAVOR_HAPPINESS',							10							UNION ALL
SELECT								'TECH_RELIGIOUS_WORK',						'FLAVOR_RELIGION',							25							UNION ALL
SELECT								'TECH_RELIGIOUS_WORK',						'FLAVOR_GREAT_PEOPLE',						 8							UNION ALL
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_CHRONOS',							    'FLAVOR_CULTURE',							10							UNION ALL
SELECT								'TECH_CHRONOS',							    'FLAVOR_RELIGION',						    480							UNION ALL
SELECT								'TECH_CHRONOS',							    'FLAVOR_GREAT_PEOPLE',						 7							UNION ALL
SELECT								'TECH_CHRONOS',							    'FLAVOR_SCIENCE',					        481							UNION ALL
SELECT								'TECH_CHRONOS',							    'FLAVOR_WONDER',					        20;
--------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO Technology_Flavors (	TechType,									FlavorType,									Flavor)
-----------------overworked---------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_CLERGY',							    'FLAVOR_RELIGION',							25							UNION ALL
SELECT								'TECH_CLERGY',							    'FLAVOR_WONDER',							20							UNION ALL
SELECT								'TECH_CLERGY',							    'FLAVOR_CULTURE',							16						UNION ALL
SELECT								'TECH_CLERGY',					            'FLAVOR_HAPPINESS',					        10							UNION ALL
SELECT								'TECH_CLERGY',							    'FLAVOR_GREAT_PEOPLE',					     9;
--------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO Technology_Flavors (	TechType,									FlavorType,									Flavor)
----------------overworked----------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_HOLY_ORDERS',							'FLAVOR_RELIGION',						    20							UNION ALL
SELECT								'TECH_HOLY_ORDERS',							'FLAVOR_HAPPINESS',						    10							UNION ALL
SELECT								'TECH_HOLY_ORDERS',							'FLAVOR_TILE_IMPROVEMENT',					10							UNION ALL
SELECT								'TECH_HOLY_ORDERS',							'FLAVOR_WONDER',					        25							UNION ALL
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_CONSULATES',							'FLAVOR_CULTURE',							482							UNION ALL
SELECT								'TECH_CONSULATES',							'FLAVOR_RELIGION',						    10							UNION ALL
SELECT								'TECH_CONSULATES',							'FLAVOR_DIPLOMACY',					        25							UNION ALL
SELECT								'TECH_CONSULATES',							'FLAVOR_WONDER',					        20							UNION ALL
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_WRITING',								'FLAVOR_SCIENCE',							25							UNION ALL
SELECT								'TECH_WRITING',								'FLAVOR_WONDER',							20							UNION ALL
SELECT								'TECH_WRITING',								'FLAVOR_DIPLOMACY',							483							UNION ALL
SELECT								'TECH_WRITING',								'FLAVOR_EXPANSION',							10							UNION ALL
SELECT								'TECH_WRITING',								'FLAVOR_GROWTH',							10							UNION ALL
SELECT								'TECH_WRITING',								'FLAVOR_PRODUCTION',						10							UNION ALL
SELECT								'TECH_WRITING',								'FLAVOR_CULTURE',							10							UNION ALL
SELECT								'TECH_WRITING',								'FLAVOR_GOLD',					            10;

INSERT INTO Technology_Flavors (	TechType,									FlavorType,									Flavor)
---------overworked-----------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_PHILOSOPHY',							'FLAVOR_GREAT_PEOPLE',						11							UNION ALL
SELECT								'TECH_PHILOSOPHY',							'FLAVOR_SCIENCE',							18							UNION ALL
SELECT								'TECH_PHILOSOPHY',							'FLAVOR_CULTURE',							16							UNION ALL
SELECT								'TECH_PHILOSOPHY',							'FLAVOR_RELIGION',							11							UNION ALL
SELECT								'TECH_PHILOSOPHY',							'FLAVOR_WONDER',							20							UNION ALL
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_POETRY',								'FLAVOR_WONDER',							20							UNION ALL
SELECT								'TECH_POETRY',								'FLAVOR_CULTURE',							11							UNION ALL
SELECT								'TECH_POETRY',								'FLAVOR_GOLD',								10							UNION ALL
SELECT								'TECH_POETRY',								'FLAVOR_GREAT_PEOPLE',					     9							UNION ALL
SELECT								'TECH_POETRY',								'FLAVOR_RELIGION',					        484							UNION ALL
SELECT								'TECH_POETRY',								'FLAVOR_EXPANSION',					         9							UNION ALL
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_PRIESTHOOD',							'FLAVOR_GREAT_PEOPLE',						10							UNION ALL
SELECT								'TECH_PRIESTHOOD',							'FLAVOR_RELIGION',							25							UNION ALL
SELECT								'TECH_PRIESTHOOD',							'FLAVOR_GOLD',								10							UNION ALL
SELECT								'TECH_PRIESTHOOD',							'FLAVOR_WONDER',							20							UNION ALL
SELECT								'TECH_PRIESTHOOD',							'FLAVOR_CULTURE',							10							UNION ALL
SELECT								'TECH_PRIESTHOOD',							'FLAVOR_HAPPINESS',							14;

INSERT INTO Technology_Flavors (	TechType,									FlavorType,									Flavor)
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_CODE_OF_LAWS',						'FLAVOR_HAPPINESS',							485							UNION ALL
SELECT								'TECH_CODE_OF_LAWS',						'FLAVOR_EXPANSION',							20							UNION ALL
SELECT								'TECH_CODE_OF_LAWS',						'FLAVOR_GROWTH',							486							UNION ALL
SELECT								'TECH_CODE_OF_LAWS',						'FLAVOR_WONDER',							20							UNION ALL
SELECT								'TECH_CODE_OF_LAWS',						'FLAVOR_SCIENCE',							10							UNION ALL
SELECT								'TECH_CODE_OF_LAWS',						'FLAVOR_PRODUCTION',						10							UNION ALL
--ARTISANS---overworked
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_ADVOCADI_DIABOLI',					'FLAVOR_GREAT_PEOPLE',				        10							UNION ALL
SELECT								'TECH_ADVOCADI_DIABOLI',				    'FLAVOR_EXPANSION',							10							UNION ALL
SELECT								'TECH_ADVOCADI_DIABOLI',				    'FLAVOR_GROWTH',							10							UNION ALL
SELECT								'TECH_ADVOCADI_DIABOLI',					'FLAVOR_WONDER',							20							UNION ALL
SELECT								'TECH_ADVOCADI_DIABOLI',					'FLAVOR_HAPPINESS',					        10							UNION ALL
SELECT								'TECH_ADVOCADI_DIABOLI',					'FLAVOR_SCIENCE',				            10							UNION ALL
SELECT								'TECH_ADVOCADI_DIABOLI',					'FLAVOR_CULTURE',				            10							UNION ALL
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_HEROISM',						        'FLAVOR_OFFENSE',							487							UNION ALL
SELECT								'TECH_HEROISM',						        'FLAVOR_DEFENSE',							188							UNION ALL
SELECT								'TECH_HEROISM',						        'FLAVOR_WONDER',							20							UNION ALL
SELECT								'TECH_HEROISM',						        'FLAVOR_TILE_IMPROVEMENT',					12							UNION ALL
SELECT								'TECH_HEROISM',					            'FLAVOR_MILITARY_TRAINING',				    17							UNION ALL
SELECT								'TECH_HEROISM',					            'FLAVOR_NUKE',				                10							UNION ALL
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_GOVERNMENT',						    'FLAVOR_DEFENSE',				            10							UNION ALL
SELECT								'TECH_GOVERNMENT',						    'FLAVOR_CITY_DEFENSE',						10							UNION ALL
SELECT								'TECH_GOVERNMENT',						    'FLAVOR_TILE_IMPROVEMENT',				    10							UNION ALL
SELECT								'TECH_GOVERNMENT',						    'FLAVOR_GREAT_PEOPLE',						12							UNION ALL
SELECT								'TECH_GOVERNMENT',						    'FLAVOR_EXPANSION',						    16							UNION ALL
SELECT								'TECH_GOVERNMENT',						    'FLAVOR_GOLD',							    14							UNION ALL
SELECT								'TECH_GOVERNMENT',						    'FLAVOR_HAPPINESS',						    14							UNION ALL
SELECT								'TECH_GOVERNMENT',						    'FLAVOR_WONDER',						    20							UNION ALL
SELECT								'TECH_GOVERNMENT',						    'FLAVOR_CULTURE',						    11;
--------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO Technology_Flavors (	TechType,									FlavorType,									Flavor)
-------overworked--------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_FORTIFICATION',						 'FLAVOR_RANGED',							25							UNION ALL
SELECT								'TECH_FORTIFICATION',						 'FLAVOR_OFFENSE',							489							UNION ALL
SELECT								'TECH_FORTIFICATION',					     'FLAVOR_DEFENSE',							18							UNION ALL
SELECT								'TECH_FORTIFICATION',					     'FLAVOR_MILITARY_TRAINING',				13							UNION ALL
SELECT								'TECH_FORTIFICATION',						 'FLAVOR_WONDER',						    12							UNION ALL
SELECT								'TECH_FORTIFICATION',						 'FLAVOR_CITY_DEFENSE',						20						    UNION ALL
SELECT								'TECH_FORTIFICATION',					     'FLAVOR_TILE_IMPROVEMENT',					12							UNION ALL
SELECT								'TECH_FORTIFICATION',					     'FLAVOR_NUKE',					            10							UNION ALL
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_SANITATION',					         'FLAVOR_GROWTH',				            25							UNION ALL
SELECT								'TECH_SANITATION',						     'FLAVOR_HAPPINESS',					    13							UNION ALL
SELECT								'TECH_SANITATION',						     'FLAVOR_SCIENCE',						    10						    UNION ALL	
SELECT								'TECH_SANITATION',					         'FLAVOR_EXPANSION',					    12							UNION ALL
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_SIEGE_WARFARE',					      'FLAVOR_RANGED',				            25						    UNION ALL
SELECT								'TECH_SIEGE_WARFARE',					      'FLAVOR_PRODUCTION',				         9						    UNION ALL
SELECT								'TECH_SIEGE_WARFARE',						  'FLAVOR_MILITARY_TRAINING',				490							UNION ALL
SELECT								'TECH_SIEGE_WARFARE',						  'FLAVOR_OFFENSE',							20						    UNION ALL	
SELECT								'TECH_SIEGE_WARFARE',				          'FLAVOR_DEFENSE',				            13						    UNION ALL
SELECT								'TECH_SIEGE_WARFARE',				          'FLAVOR_NUKE',				            10						    UNION ALL
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_CONSTRUCTION',						'FLAVOR_WONDER',							20							UNION ALL
SELECT								'TECH_CONSTRUCTION',						'FLAVOR_DEFENSE',							10							UNION ALL
SELECT								'TECH_CONSTRUCTION',						'FLAVOR_CITY_DEFENSE',					    491							UNION ALL
SELECT								'TECH_CONSTRUCTION',						'FLAVOR_HAPPINESS',							20							UNION ALL
SELECT								'TECH_CONSTRUCTION',						'FLAVOR_PRODUCTION',						11							UNION ALL
SELECT								'TECH_CONSTRUCTION',						'FLAVOR_GOLD',								11							UNION ALL
SELECT								'TECH_CONSTRUCTION',						'FLAVOR_EXPANSION',							14							UNION ALL
SELECT								'TECH_CONSTRUCTION',						'FLAVOR_TILE_IMPROVEMENT',					13;
--------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO Technology_Flavors (	TechType,									FlavorType,									Flavor)
----overworked------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_WOODWORKING',							'FLAVOR_RANGED',							18							UNION ALL
SELECT								'TECH_WOODWORKING',							'FLAVOR_OFFENSE',							16							UNION ALL
SELECT								'TECH_WOODWORKING',							'FLAVOR_DEFENSE',							13							UNION ALL
SELECT								'TECH_WOODWORKING',							'FLAVOR_PRODUCTION',					    20	                        UNION ALL
SELECT								'TECH_WOODWORKING',							'FLAVOR_TILE_IMPROVEMENT',					492	                        UNION ALL
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_PUBLIC_WORKS',						'FLAVOR_PRODUCTION',						10							UNION ALL
SELECT								'TECH_PUBLIC_WORKS',						'FLAVOR_HAPPINESS',							14							UNION ALL
SELECT								'TECH_PUBLIC_WORKS',						'FLAVOR_GROWTH',							14							UNION ALL
SELECT								'TECH_PUBLIC_WORKS',						'FLAVOR_WONDER',							20							UNION ALL
SELECT								'TECH_PUBLIC_WORKS',						'FLAVOR_CULTURE',							16							UNION ALL
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_DIVISION_OF_LABOR',					'FLAVOR_PRODUCTION',						20							UNION ALL
SELECT								'TECH_DIVISION_OF_LABOR',					'FLAVOR_GOLD',								 8							UNION ALL
SELECT								'TECH_DIVISION_OF_LABOR',					'FLAVOR_INFRASTRUCTURE',					12							UNION ALL
SELECT								'TECH_DIVISION_OF_LABOR',					'FLAVOR_OFFENSE',							11							UNION ALL
SELECT								'TECH_DIVISION_OF_LABOR',					'FLAVOR_GROWTH',							13							UNION ALL
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_IRON_WORKING',						'FLAVOR_OFFENSE',							22							UNION ALL
SELECT								'TECH_IRON_WORKING',						'FLAVOR_DEFENSE',							13							UNION ALL
SELECT								'TECH_IRON_WORKING',						'FLAVOR_WONDER',							12							UNION ALL
SELECT								'TECH_IRON_WORKING',						'FLAVOR_TILE_IMPROVEMENT',			        12							UNION ALL
SELECT								'TECH_IRON_WORKING',						'FLAVOR_PRODUCTION',						493							UNION ALL
SELECT								'TECH_IRON_WORKING',						'FLAVOR_NUKE',						        10							UNION ALL
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_OPTICS',								'FLAVOR_I_LAND_TRADE_ROUTE',			    494							UNION ALL
SELECT								'TECH_OPTICS',								'FLAVOR_I_SEA_TRADE_ROUTE',					495							UNION ALL
SELECT								'TECH_OPTICS',								'FLAVOR_WONDER',							20							UNION ALL
SELECT								'TECH_OPTICS',								'FLAVOR_GOLD',							    12							UNION ALL
SELECT								'TECH_OPTICS',								'FLAVOR_NAVAL',								12							UNION ALL
SELECT								'TECH_OPTICS',								'FLAVOR_SCIENCE',							14							UNION ALL
SELECT								'TECH_OPTICS',								'FLAVOR_NAVAL_GROWTH',						16;
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
--MEDIEVAL ERA--
INSERT INTO Technology_Flavors (	TechType,									FlavorType,									Flavor)
--MEDIEVAL ERA--
--EXOTIC GOODS---overworked
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_CARGO',			                    'FLAVOR_GOLD',						        496							UNION ALL
SELECT								'TECH_CARGO',			                    'FLAVOR_I_LAND_TRADE_ROUTE',			    25							UNION ALL
SELECT								'TECH_CARGO',			                    'FLAVOR_I_SEA_TRADE_ROUTE',			        25							UNION ALL
SELECT								'TECH_CARGO',			                    'FLAVOR_EXPANSION',						    10							UNION ALL
SELECT								'TECH_CARGO',			                    'FLAVOR_HAPPINESS',					        12							UNION ALL
SELECT								'TECH_CARGO',			                    'FLAVOR_WONDER',							20							UNION ALL
SELECT								'TECH_CARGO',			                    'FLAVOR_DEFENSE',					         8							UNION ALL
SELECT								'TECH_CARGO',			                    'FLAVOR_CITY_DEFENSE',					    10							UNION ALL
SELECT								'TECH_CARGO',			                    'FLAVOR_CULTURE',						     5							UNION ALL
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_LUXUS_TRADE',			               'FLAVOR_WONDER',						       20							UNION ALL
SELECT								'TECH_LUXUS_TRADE',			               'FLAVOR_GOLD',					           12							UNION ALL
SELECT								'TECH_LUXUS_TRADE',			               'FLAVOR_GROWTH',							   497							UNION ALL
SELECT								'TECH_LUXUS_TRADE',			               'FLAVOR_RELIGION',						    9							UNION ALL
SELECT								'TECH_LUXUS_TRADE',			               'FLAVOR_CITY_DEFENSE',					   10							UNION ALL
SELECT								'TECH_LUXUS_TRADE',			               'FLAVOR_CULTURE',						    7							UNION ALL
SELECT								'TECH_LUXUS_TRADE',			               'FLAVOR_I_LAND_TRADE_ROUTE',				   20							UNION ALL
SELECT								'TECH_LUXUS_TRADE',			               'FLAVOR_I_SEA_TRADE_ROUTE',				   20							UNION ALL
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_CIGARS',			                  'FLAVOR_WONDER',						       20							UNION ALL
SELECT								'TECH_CIGARS',			                  'FLAVOR_PRODUCTION',					        7							UNION ALL
SELECT								'TECH_CIGARS',			                  'FLAVOR_EXPANSION',						   498							UNION ALL
SELECT								'TECH_CIGARS',			                  'FLAVOR_GOLD',					           12							UNION ALL
SELECT								'TECH_CIGARS',			                  'FLAVOR_HAPPINESS',						   25							UNION ALL
SELECT								'TECH_CIGARS',			                  'FLAVOR_GROWTH',							   499							UNION ALL
SELECT								'TECH_CIGARS',			                  'FLAVOR_CULTURE',							    6							UNION ALL
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_RUBBER',					           'FLAVOR_WONDER',					            20							UNION ALL
SELECT								'TECH_RUBBER',				               'FLAVOR_CULTURE',						     6							UNION ALL
SELECT								'TECH_RUBBER',					           'FLAVOR_GOLD',					             7							UNION ALL
SELECT								'TECH_RUBBER',				               'FLAVOR_RELIGION',						     7							UNION ALL
SELECT								'TECH_RUBBER',					           'FLAVOR_TILE_IMPROVEMENT',					520							UNION ALL
SELECT								'TECH_RUBBER',				               'FLAVOR_INFRASTRUCTURE',						10							UNION ALL
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_LUXURY_GOODS',			            'FLAVOR_EXPANSION',						    521							UNION ALL
SELECT								'TECH_LUXURY_GOODS',			            'FLAVOR_TILE_IMPROVEMENT',					522							UNION ALL
SELECT								'TECH_LUXURY_GOODS',			            'FLAVOR_HAPPINESS',						    25							UNION ALL
SELECT								'TECH_LUXURY_GOODS',			            'FLAVOR_GROWTH',							523							UNION ALL
SELECT								'TECH_LUXURY_GOODS',			            'FLAVOR_WONDER',						    20							UNION ALL
SELECT								'TECH_LUXURY_GOODS',			            'FLAVOR_PRODUCTION',					     7							UNION ALL
SELECT								'TECH_LUXURY_GOODS',			            'FLAVOR_GOLD',						        10							UNION ALL
SELECT								'TECH_LUXURY_GOODS',			            'FLAVOR_CITY_DEFENSE',						 9							UNION ALL
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_AGRICULTURAL_ENGINEERING',			'FLAVOR_WONDER',							20							UNION ALL
SELECT								'TECH_AGRICULTURAL_ENGINEERING',			'FLAVOR_TILE_IMPROVEMENT',					10							UNION ALL
SELECT								'TECH_AGRICULTURAL_ENGINEERING',			'FLAVOR_PRODUCTION',						12							UNION ALL
SELECT								'TECH_AGRICULTURAL_ENGINEERING',			'FLAVOR_GROWTH',							524							UNION ALL
SELECT								'TECH_AGRICULTURAL_ENGINEERING',			'FLAVOR_SCIENCE',							10							UNION ALL
SELECT								'TECH_AGRICULTURAL_ENGINEERING',			'FLAVOR_CULTURE',					         5							UNION ALL
SELECT								'TECH_AGRICULTURAL_ENGINEERING',			'FLAVOR_INFRASTRUCTURE',				    10							UNION ALL
SELECT								'TECH_AGRICULTURAL_ENGINEERING',			'FLAVOR_HAPPINESS',							 8							UNION ALL
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_CRAFTSMAN',				            'FLAVOR_TILE_IMPROVEMENT',				    11							UNION ALL
SELECT								'TECH_CRAFTSMAN',				            'FLAVOR_HAPPINESS',				            11							UNION ALL
SELECT								'TECH_CRAFTSMAN',				            'FLAVOR_CULTURE',				             9							UNION ALL
SELECT								'TECH_CRAFTSMAN',				            'FLAVOR_RELIGION',							 8							UNION ALL
SELECT								'TECH_CRAFTSMAN',				            'FLAVOR_WONDER',					        20							UNION ALL
SELECT								'TECH_CRAFTSMAN',				            'FLAVOR_PRODUCTION',						16							UNION ALL
SELECT								'TECH_CRAFTSMAN',				            'FLAVOR_MILITARY_TRAINING',				    525							UNION ALL
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_TOBACCO_TRADING',				       'FLAVOR_HAPPINESS',							10							UNION ALL
SELECT								'TECH_TOBACCO_TRADING',				       'FLAVOR_PRODUCTION',							12							UNION ALL
SELECT								'TECH_TOBACCO_TRADING',				       'FLAVOR_INFRASTRUCTURE',					    10							UNION ALL
SELECT								'TECH_TOBACCO_TRADING',				       'FLAVOR_GOLD',								10							UNION ALL
SELECT								'TECH_TOBACCO_TRADING',				       'FLAVOR_TILE_IMPROVEMENT',					526;
--------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO Technology_Flavors (	TechType,									FlavorType,									Flavor)
-------overworked-------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_AGRICULTURAL_REVOLUTION',				'FLAVOR_WONDER',							20							UNION ALL
SELECT								'TECH_AGRICULTURAL_REVOLUTION',				'FLAVOR_GOLD',								12							UNION ALL
SELECT								'TECH_AGRICULTURAL_REVOLUTION',				'FLAVOR_TILE_IMPROVEMENT',					527							UNION ALL
SELECT								'TECH_AGRICULTURAL_REVOLUTION',				'FLAVOR_PRODUCTION',						12							UNION ALL
SELECT								'TECH_AGRICULTURAL_REVOLUTION',				'FLAVOR_GROWTH',							25							UNION ALL
SELECT								'TECH_AGRICULTURAL_REVOLUTION',				'FLAVOR_CULTURE',						     9							UNION ALL
SELECT								'TECH_AGRICULTURAL_REVOLUTION',				'FLAVOR_GREAT_PEOPLE',						 9							UNION ALL
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_COFFEE_TRADE',						'FLAVOR_GOLD',								13							UNION ALL
SELECT								'TECH_COFFEE_TRADE',						'FLAVOR_TILE_IMPROVEMENT',					12							UNION ALL
SELECT								'TECH_COFFEE_TRADE',						'FLAVOR_SCIENCE',							14							UNION ALL
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_TRADE_FAIRS',							'FLAVOR_GOLD',								20							UNION ALL
SELECT								'TECH_TRADE_FAIRS',							'FLAVOR_WONDER',							20							UNION ALL
SELECT								'TECH_TRADE_FAIRS',							'FLAVOR_GROWTH',							12							UNION ALL
SELECT								'TECH_TRADE_FAIRS',							'FLAVOR_PRODUCTION',						11							UNION ALL
SELECT								'TECH_TRADE_FAIRS',							'FLAVOR_TILE_IMPROVEMENT',					13							UNION ALL
SELECT								'TECH_TRADE_FAIRS',							'FLAVOR_I_LAND_TRADE_ROUTE',				20							UNION ALL
SELECT								'TECH_TRADE_FAIRS',							'FLAVOR_I_SEA_TRADE_ROUTE',					20							UNION ALL
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_BONDS',								'FLAVOR_WONDER',							20							UNION ALL
SELECT								'TECH_BONDS',								'FLAVOR_GOLD',								24							UNION ALL
SELECT								'TECH_BONDS',								'FLAVOR_CULTURE',							 9							UNION ALL
SELECT								'TECH_BONDS',								'FLAVOR_GREAT_PEOPLE',						10							UNION ALL
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_METALLURGY',							'FLAVOR_SCIENCE',							 5							UNION ALL
SELECT								'TECH_METALLURGY',							'FLAVOR_WONDER',							20							UNION ALL
SELECT								'TECH_METALLURGY',							'FLAVOR_CULTURE',							 6							UNION ALL
SELECT								'TECH_METALLURGY',							'FLAVOR_GREAT_PEOPLE',						 6							UNION ALL
SELECT								'TECH_METALLURGY',							'FLAVOR_OFFENSE',							12							UNION ALL
SELECT								'TECH_METALLURGY',							'FLAVOR_DEFENSE',							14							UNION ALL
SELECT								'TECH_METALLURGY',							'FLAVOR_PRODUCTION',						12							UNION ALL
SELECT								'TECH_METALLURGY',							'FLAVOR_GOLD',								11							UNION ALL
SELECT								'TECH_METALLURGY',							'FLAVOR_TILE_IMPROVEMENT',					12							UNION ALL
SELECT								'TECH_METALLURGY',							'FLAVOR_NUKE',					            10							UNION ALL
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_CIVIL_SERVICE',						'FLAVOR_WONDER',							20							UNION ALL
SELECT								'TECH_CIVIL_SERVICE',						'FLAVOR_GROWTH',							14							UNION ALL
SELECT								'TECH_CIVIL_SERVICE',						'FLAVOR_PRODUCTION',						11							UNION ALL
SELECT								'TECH_CIVIL_SERVICE',						'FLAVOR_GOLD',								11							UNION ALL
SELECT								'TECH_CIVIL_SERVICE',						'FLAVOR_SCIENCE',							11							UNION ALL
SELECT								'TECH_CIVIL_SERVICE',						'FLAVOR_CULTURE',							 8							UNION ALL
SELECT								'TECH_CIVIL_SERVICE',						'FLAVOR_GREAT_PEOPLE',						 8							UNION ALL
SELECT								'TECH_CIVIL_SERVICE',						'FLAVOR_TILE_IMPROVEMENT',					11;
--------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO Technology_Flavors (	TechType,									FlavorType,									Flavor)
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
--MEDIEVAL UNIVERSITY---overworked
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_HONORCODEX',				            'FLAVOR_GOLD',							     9							UNION ALL
SELECT								'TECH_HONORCODEX',				            'FLAVOR_CULTURE',							10							UNION ALL
SELECT								'TECH_HONORCODEX',				            'FLAVOR_WONDER',							20							UNION ALL
SELECT								'TECH_HONORCODEX',				            'FLAVOR_GREAT_PEOPLE',					     9							UNION ALL
SELECT								'TECH_HONORCODEX',				            'FLAVOR_RELIGION',							25							UNION ALL
SELECT								'TECH_HONORCODEX',				            'FLAVOR_CITY_DEFENSE',					    14							UNION ALL
SELECT								'TECH_HONORCODEX',				            'FLAVOR_DEFENSE',							10							UNION ALL
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_APOSTASY',				            'FLAVOR_CULTURE',							527							UNION ALL
SELECT								'TECH_APOSTASY',				            'FLAVOR_WONDER',							20							UNION ALL
SELECT								'TECH_APOSTASY',				            'FLAVOR_GREAT_PEOPLE',						11							UNION ALL
SELECT								'TECH_APOSTASY',				            'FLAVOR_RELIGION',							25							UNION ALL
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_HERESY',						        'FLAVOR_RELIGION',							20							UNION ALL
SELECT								'TECH_HERESY',						        'FLAVOR_WONDER',							18							UNION ALL
SELECT								'TECH_HERESY',						        'FLAVOR_GREAT_PEOPLE',						12							UNION ALL
SELECT								'TECH_HERESY',						        'FLAVOR_HAPPINESS',							 9							UNION ALL
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_MARTIAL_ARTS',						'FLAVOR_CULTURE',							 7							UNION ALL
SELECT								'TECH_MARTIAL_ARTS',						'FLAVOR_WONDER',							20							UNION ALL
SELECT								'TECH_MARTIAL_ARTS',						'FLAVOR_MILITARY_TRAINING',					16							UNION ALL
SELECT								'TECH_MARTIAL_ARTS',						'FLAVOR_OFFENSE',							12							UNION ALL
SELECT								'TECH_MARTIAL_ARTS',						'FLAVOR_DEFENSE',							12							UNION ALL
SELECT								'TECH_MARTIAL_ARTS',						'FLAVOR_NUKE',							    10							UNION ALL
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_ACOUSTICS_ENGINEERING',				'FLAVOR_GREAT_PEOPLE',						12							UNION ALL
SELECT								'TECH_ACOUSTICS_ENGINEERING',				'FLAVOR_CULTURE',							20							UNION ALL
SELECT								'TECH_ACOUSTICS_ENGINEERING',				'FLAVOR_WONDER',							20							UNION ALL
SELECT								'TECH_ACOUSTICS_ENGINEERING',				'FLAVOR_HAPPINESS',							14							UNION ALL
SELECT								'TECH_ACOUSTICS_ENGINEERING',				'FLAVOR_RELIGION',							528							UNION ALL
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_SACRED_ART',				            'FLAVOR_GREAT_PEOPLE',						12							UNION ALL
SELECT								'TECH_SACRED_ART',				            'FLAVOR_CULTURE',							20							UNION ALL
SELECT								'TECH_SACRED_ART',				            'FLAVOR_WONDER',							20							UNION ALL
SELECT								'TECH_SACRED_ART',				            'FLAVOR_HAPPINESS',							11							UNION ALL
SELECT								'TECH_SACRED_ART',				            'FLAVOR_RELIGION',							20							UNION ALL
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_CARNIVAL',				            'FLAVOR_GREAT_PEOPLE',						529							UNION ALL
SELECT								'TECH_CARNIVAL',				            'FLAVOR_CULTURE',							823							UNION ALL
SELECT								'TECH_CARNIVAL',				            'FLAVOR_WONDER',							20							UNION ALL
SELECT								'TECH_CARNIVAL',				            'FLAVOR_HAPPINESS',							16							UNION ALL
SELECT								'TECH_CARNIVAL',				            'FLAVOR_RELIGION',							530							UNION ALL
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_RELIGIOUS_STUDIES',				     'FLAVOR_CULTURE',							 6							UNION ALL
SELECT								'TECH_RELIGIOUS_STUDIES',				     'FLAVOR_WONDER',							20							UNION ALL
SELECT								'TECH_RELIGIOUS_STUDIES',				     'FLAVOR_TILE_IMPROVEMENT',					11							UNION ALL
SELECT								'TECH_RELIGIOUS_STUDIES',				     'FLAVOR_RELIGION',							25							UNION ALL
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_CRUSADE',				                 'FLAVOR_TILE_IMPROVEMENT',				     8							UNION ALL
SELECT								'TECH_CRUSADE',				                 'FLAVOR_MILITARY_TRAINING',				18							UNION ALL
SELECT								'TECH_CRUSADE',				                 'FLAVOR_WONDER',							20							UNION ALL
SELECT								'TECH_CRUSADE',				                 'FLAVOR_DEFENSE',							18							UNION ALL
SELECT								'TECH_CRUSADE',				                 'FLAVOR_RELIGION',							12							UNION ALL
SELECT								'TECH_CRUSADE',				                 'FLAVOR_OFFENSE',							14                          UNION ALL
SELECT								'TECH_CRUSADE',				                 'FLAVOR_NUKE',							    10;
--------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO Technology_Flavors (	TechType,									FlavorType,									Flavor)
---------overworked-----------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_LITERATURE',							'FLAVOR_CULTURE',							22							UNION ALL
SELECT								'TECH_LITERATURE',							'FLAVOR_GREAT_PEOPLE',						11							UNION ALL
SELECT								'TECH_LITERATURE',							'FLAVOR_HAPPINESS',							14							UNION ALL
SELECT								'TECH_LITERATURE',							'FLAVOR_WONDER',							20							UNION ALL
SELECT								'TECH_LITERATURE',							'FLAVOR_GROWTH',							 5							UNION ALL
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_FEUDALISM',							'FLAVOR_OFFENSE',							20							UNION ALL
SELECT								'TECH_FEUDALISM',							'FLAVOR_WONDER',							20							UNION ALL
SELECT								'TECH_FEUDALISM',							'FLAVOR_DEFENSE',							18							UNION ALL
SELECT								'TECH_FEUDALISM',							'FLAVOR_TILE_IMPROVEMENT',					11							UNION ALL
SELECT								'TECH_FEUDALISM',							'FLAVOR_CITY_DEFENSE',						14							UNION ALL
SELECT								'TECH_FEUDALISM',							'FLAVOR_MILITARY_TRAINING',					11							UNION ALL
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_CHIVALRY',							'FLAVOR_OFFENSE',							25							UNION ALL
SELECT								'TECH_CHIVALRY',							'FLAVOR_MOBILE',							20							UNION ALL
SELECT								'TECH_CHIVALRY',							'FLAVOR_CITY_DEFENSE',						16							UNION ALL
SELECT								'TECH_CHIVALRY',							'FLAVOR_WONDER',							20							UNION ALL
SELECT								'TECH_CHIVALRY',							'FLAVOR_TILE_IMPROVEMENT',					12							UNION ALL
SELECT								'TECH_CHIVALRY',							'FLAVOR_NUKE',							    10							UNION ALL
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_FUNDAMENTALISM',						'FLAVOR_GREAT_PEOPLE',						 8							UNION ALL
SELECT								'TECH_FUNDAMENTALISM',						'FLAVOR_CULTURE',							 7							UNION ALL
SELECT								'TECH_FUNDAMENTALISM',						'FLAVOR_WONDER',							14							UNION ALL
SELECT								'TECH_FUNDAMENTALISM',						'FLAVOR_GOLD',								12							UNION ALL
SELECT								'TECH_FUNDAMENTALISM',						'FLAVOR_HAPPINESS',							14							UNION ALL
SELECT								'TECH_FUNDAMENTALISM',						'FLAVOR_RELIGION',							14							UNION ALL
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_DRAMA',								'FLAVOR_RELIGION',							 9							UNION ALL
SELECT								'TECH_DRAMA',								'FLAVOR_TILE_IMPROVEMENT',					10							UNION ALL
SELECT								'TECH_DRAMA',								'FLAVOR_WONDER',							20							UNION ALL
SELECT								'TECH_DRAMA',								'FLAVOR_EXPANSION',							14							UNION ALL
SELECT								'TECH_DRAMA',								'FLAVOR_HAPPINESS',							20							UNION ALL
SELECT								'TECH_DRAMA',								'FLAVOR_CULTURE',							14							UNION ALL
SELECT								'TECH_DRAMA',								'FLAVOR_GREAT_PEOPLE',						12							UNION ALL
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_ACOUSTICS',							'FLAVOR_CULTURE',							20							UNION ALL
SELECT								'TECH_ACOUSTICS',							'FLAVOR_WONDER',							14							UNION ALL
SELECT								'TECH_ACOUSTICS',							'FLAVOR_GREAT_PEOPLE',						11							UNION ALL
SELECT								'TECH_ACOUSTICS',							'FLAVOR_TILE_IMPROVEMENT',					10							UNION ALL
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_THEOLOGY',							'FLAVOR_TILE_IMPROVEMENT',					10							UNION ALL
SELECT								'TECH_THEOLOGY',							'FLAVOR_CULTURE',						    10							UNION ALL
SELECT								'TECH_THEOLOGY',							'FLAVOR_RELIGION',							24							UNION ALL
SELECT								'TECH_THEOLOGY',							'FLAVOR_GREAT_PEOPLE',						11							UNION ALL
SELECT								'TECH_THEOLOGY',							'FLAVOR_WONDER',							20;
--------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO Technology_Flavors (	TechType,									FlavorType,									Flavor)
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
--EMPIRICISM---overworked
--SELECT								'TECH_CLOCKWORK',							'FLAVOR_MACHINERY',							12							UNION ALL
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_PAPER',							    'FLAVOR_TILE_IMPROVEMENT',					12							UNION ALL
SELECT								'TECH_PAPER',							    'FLAVOR_PRODUCTION',						 9							UNION ALL
SELECT								'TECH_PAPER',							    'FLAVOR_INFRASTRUCTURE',					530							UNION ALL
SELECT								'TECH_PAPER',							    'FLAVOR_HAPPINESS',					         5							UNION ALL
SELECT								'TECH_PAPER',							    'FLAVOR_SCIENCE',					        25							UNION ALL
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_INVENTION',							'FLAVOR_TILE_IMPROVEMENT',					10							UNION ALL
SELECT								'TECH_INVENTION',							'FLAVOR_CULTURE',							12							UNION ALL
SELECT								'TECH_INVENTION',							'FLAVOR_PRODUCTION',						17							UNION ALL
SELECT								'TECH_INVENTION',							'FLAVOR_RELIGION',					         9							UNION ALL
SELECT								'TECH_INVENTION',							'FLAVOR_WONDER',					        20							UNION ALL
SELECT								'TECH_INVENTION',							'FLAVOR_GREAT_PEOPLE',					    11							UNION ALL
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_JOLLY_ROGERS',					    'FLAVOR_EXPANSION',							531							UNION ALL
SELECT								'TECH_JOLLY_ROGERS',						'FLAVOR_PRODUCTION',						10							UNION ALL
SELECT								'TECH_JOLLY_ROGERS',						'FLAVOR_MILITARY_TRAINING',					532							UNION ALL
SELECT								'TECH_JOLLY_ROGERS',						'FLAVOR_WONDER',					        20							UNION ALL
SELECT								'TECH_JOLLY_ROGERS',						'FLAVOR_DEFENSE',					        533							UNION ALL
SELECT								'TECH_JOLLY_ROGERS',						'FLAVOR_OFFENSE',					        534							UNION ALL
SELECT								'TECH_JOLLY_ROGERS',						'FLAVOR_NAVAL_RECON',					    535							UNION ALL
SELECT								'TECH_JOLLY_ROGERS',						'FLAVOR_NAVAL',					            536;
--------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO Technology_Flavors (	TechType,									FlavorType,									Flavor)
-------------overworked-------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_MECHANICS',							'FLAVOR_GREAT_PEOPLE',						 9							UNION ALL
SELECT								'TECH_MECHANICS',							'FLAVOR_HAPPINESS',							12							UNION ALL
SELECT								'TECH_MECHANICS',							'FLAVOR_RELIGION',							14							UNION ALL
SELECT								'TECH_MECHANICS',							'FLAVOR_WONDER',							20							UNION ALL
SELECT								'TECH_MECHANICS',							'FLAVOR_CULTURE',							16							UNION ALL
SELECT								'TECH_MECHANICS',							'FLAVOR_PRODUCTION',						12							UNION ALL
SELECT								'TECH_MECHANICS',							'FLAVOR_SCIENCE',						    10							UNION ALL
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_SANITARY_ENGINEERING',				'FLAVOR_GREAT_PEOPLE',						 8							UNION ALL
SELECT								'TECH_SANITARY_ENGINEERING',				'FLAVOR_EXPANSION',							20							UNION ALL
SELECT								'TECH_SANITARY_ENGINEERING',				'FLAVOR_WONDER',							20							UNION ALL
SELECT								'TECH_SANITARY_ENGINEERING',				'FLAVOR_GROWTH',							25							UNION ALL
SELECT								'TECH_SANITARY_ENGINEERING',				'FLAVOR_HAPPINESS',						   537							UNION ALL
SELECT								'TECH_SANITARY_ENGINEERING',				'FLAVOR_SCIENCE',						    538							UNION ALL
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_MECHANIC_ARTS',				        'FLAVOR_TILE_IMPROVEMENT',				     8							UNION ALL
SELECT								'TECH_MECHANIC_ARTS',				        'FLAVOR_DEFENSE',							10							UNION ALL
SELECT								'TECH_MECHANIC_ARTS',				        'FLAVOR_CITY_DEFENSE',						10							UNION ALL
SELECT								'TECH_MECHANIC_ARTS',				        'FLAVOR_GREAT_PEOPLE',						 8							UNION ALL
SELECT								'TECH_MECHANIC_ARTS',				        'FLAVOR_RELIGION',							539							UNION ALL
SELECT								'TECH_MECHANIC_ARTS',				        'FLAVOR_WONDER',							20							UNION ALL
SELECT								'TECH_MECHANIC_ARTS',				        'FLAVOR_PRODUCTION',						540							UNION ALL
SELECT								'TECH_MECHANIC_ARTS',				        'FLAVOR_MILITARY_TRAINING',					541							UNION ALL
SELECT								'TECH_MECHANIC_ARTS',				        'FLAVOR_CULTURE',					        10;	
--------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO Technology_Flavors (	TechType,									FlavorType,									Flavor)
--------overworked------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_ENGINEERING',							'FLAVOR_MILITARY_TRAINING',					12							UNION ALL
SELECT								'TECH_ENGINEERING',							'FLAVOR_RELIGION',						    11							UNION ALL
SELECT								'TECH_ENGINEERING',							'FLAVOR_GREAT_PEOPLE',						11							UNION ALL
SELECT								'TECH_ENGINEERING',							'FLAVOR_PRODUCTION',						11							UNION ALL
SELECT								'TECH_ENGINEERING',							'FLAVOR_TILE_IMPROVEMENT',					16							UNION ALL
SELECT								'TECH_ENGINEERING',							'FLAVOR_INFRASTRUCTURE',					14							UNION ALL
SELECT								'TECH_ENGINEERING',							'FLAVOR_WONDER',							20							UNION ALL
SELECT								'TECH_ENGINEERING',							'FLAVOR_EXPANSION',							12							UNION ALL
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_METAL_CASTING',						'FLAVOR_PRODUCTION',						18							UNION ALL
SELECT								'TECH_METAL_CASTING',						'FLAVOR_RANGED',							16							UNION ALL
SELECT								'TECH_METAL_CASTING',						'FLAVOR_OFFENSE',							11							UNION ALL
SELECT								'TECH_METAL_CASTING',						'FLAVOR_DEFENSE',							13							UNION ALL
SELECT								'TECH_METAL_CASTING',						'FLAVOR_NUKE',							    10							UNION ALL
SELECT								'TECH_METAL_CASTING',						'FLAVOR_RELIGION',							 7							UNION ALL
SELECT								'TECH_METAL_CASTING',						'FLAVOR_WONDER',							20							UNION ALL
SELECT								'TECH_METAL_CASTING',						'FLAVOR_CULTURE',							 6							UNION ALL
SELECT								'TECH_METAL_CASTING',						'FLAVOR_GREAT_PEOPLE',						 8							UNION ALL
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_MACHINERY',							'FLAVOR_GOLD',								17							UNION ALL
SELECT								'TECH_MACHINERY',							'FLAVOR_TILE_IMPROVEMENT',					11							UNION ALL
SELECT								'TECH_MACHINERY',							'FLAVOR_PRODUCTION',						11							UNION ALL
SELECT								'TECH_MACHINERY',							'FLAVOR_INFRASTRUCTURE',					14							UNION ALL
SELECT								'TECH_MACHINERY',							'FLAVOR_DEFENSE',							13							UNION ALL
SELECT								'TECH_MACHINERY',							'FLAVOR_WONDER',							20							UNION ALL
SELECT								'TECH_MACHINERY',							'FLAVOR_CULTURE',					         7							UNION ALL
SELECT								'TECH_MACHINERY',							'FLAVOR_RELIGION',							 7							UNION ALL
SELECT								'TECH_MACHINERY',							'FLAVOR_GREAT_PEOPLE',						 9							UNION ALL
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_COMPASS',								'FLAVOR_MOBILE',						    14							UNION ALL
SELECT								'TECH_COMPASS',								'FLAVOR_GREAT_PEOPLE',			             9							UNION ALL
SELECT								'TECH_COMPASS',								'FLAVOR_PRODUCTION',						 8							UNION ALL
SELECT								'TECH_COMPASS',								'FLAVOR_GOLD',								14							UNION ALL
SELECT								'TECH_COMPASS',								'FLAVOR_NAVAL_TILE_IMPROVEMENT',			12							UNION ALL
SELECT								'TECH_COMPASS',								'FLAVOR_NAVAL',								12							UNION ALL
SELECT								'TECH_COMPASS',								'FLAVOR_WATER_CONNECTION',					18							UNION ALL
SELECT								'TECH_COMPASS',								'FLAVOR_SCIENCE',							19							UNION ALL
SELECT								'TECH_COMPASS',								'FLAVOR_WONDER',							20;
--------------------------------------------------------------------------------------------------------------------------------------------------------------------


INSERT INTO Technology_Flavors (	TechType,									FlavorType,									Flavor)
-----------overworked------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_RUDDER',								'FLAVOR_I_LAND_TRADE_ROUTE',				542							UNION ALL
SELECT								'TECH_RUDDER',								'FLAVOR_I_SEA_TRADE_ROUTE',					543						UNION ALL
SELECT								'TECH_RUDDER',								'FLAVOR_NAVAL',								25							UNION ALL
SELECT								'TECH_RUDDER',								'FLAVOR_NAVAL_RECON',						544						UNION ALL
SELECT								'TECH_RUDDER',						        'FLAVOR_OFFENSE',							545						UNION ALL
SELECT								'TECH_RUDDER',						        'FLAVOR_DEFENSE',							546							UNION ALL
SELECT								'TECH_RUDDER',						        'FLAVOR_EXPANSION',							547							UNION ALL
SELECT								'TECH_RUDDER',						        'FLAVOR_WONDER',							20						UNION ALL
SELECT								'TECH_RUDDER',						        'FLAVOR_NUKE',							    10						UNION ALL
-----------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_PHYSICS',								'FLAVOR_NUKE',							    10							UNION ALL
SELECT								'TECH_PHYSICS',								'FLAVOR_OFFENSE',							548							UNION ALL
SELECT								'TECH_PHYSICS',								'FLAVOR_WONDER',							20							UNION ALL
SELECT								'TECH_PHYSICS',								'FLAVOR_SCIENCE',							549							UNION ALL
SELECT								'TECH_PHYSICS',								'FLAVOR_GREAT_PEOPLE',						550							UNION ALL
SELECT								'TECH_PHYSICS',								'FLAVOR_PRODUCTION',					    20							UNION ALL
SELECT								'TECH_PHYSICS',								'FLAVOR_CULTURE',						    25							UNION ALL
-----------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_SIEGE_ENGINES',						'FLAVOR_RANGED',							16							UNION ALL
SELECT								'TECH_SIEGE_ENGINES',						'FLAVOR_OFFENSE',							18							UNION ALL
SELECT								'TECH_SIEGE_ENGINES',						'FLAVOR_DEFENSE',							12							UNION ALL
SELECT								'TECH_SIEGE_ENGINES',						'FLAVOR_MILITARY_TRAINING',					551							UNION ALL
SELECT								'TECH_SIEGE_ENGINES',						'FLAVOR_EXPANSION',					        552                          UNION ALL
SELECT								'TECH_SIEGE_ENGINES',						'FLAVOR_NUKE',					            10;
-----------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO Technology_Flavors (	TechType,									FlavorType,									Flavor)
-----------------------------------------------------------------------------------------------------------------------------------------
--RENAISSANCE ERA--
--HOMO UNIVERSALIS-overworked
-----------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_FASICM',			                    'FLAVOR_GREAT_PEOPLE',						10							UNION ALL
SELECT								'TECH_FASICM',				                'FLAVOR_GROWTH',							10							UNION ALL
SELECT								'TECH_FASICM',			                    'FLAVOR_CULTURE',							 8							UNION ALL
SELECT								'TECH_FASICM',			                    'FLAVOR_WONDER',							20							UNION ALL
SELECT								'TECH_FASICM',			                    'FLAVOR_NUKE',							    10							UNION ALL
-----------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_RELIGIOUS_NATINALISM',				'FLAVOR_CULTURE',							553							UNION ALL
SELECT								'TECH_RELIGIOUS_NATINALISM',			    'FLAVOR_HAPPINESS',							10							UNION ALL
SELECT								'TECH_RELIGIOUS_NATINALISM',				'FLAVOR_SCIENCE',							10							UNION ALL
SELECT								'TECH_RELIGIOUS_NATINALISM',			    'FLAVOR_RELIGION',							25							UNION ALL
SELECT								'TECH_RELIGIOUS_NATINALISM',			    'FLAVOR_WONDER',							20							UNION ALL
-----------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_POLITICS',						   'FLAVOR_CULTURE',							554							UNION ALL
SELECT								'TECH_POLITICS',						   'FLAVOR_HAPPINESS',							10							UNION ALL
SELECT								'TECH_POLITICS',						   'FLAVOR_GOLD',								10							UNION ALL
SELECT								'TECH_POLITICS',						   'FLAVOR_SCIENCE',							10							UNION ALL
SELECT								'TECH_POLITICS',						   'FLAVOR_WONDER',							    20							UNION ALL
-----------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_HUMANISM',							'FLAVOR_SCIENCE',							12							UNION ALL
SELECT								'TECH_HUMANISM',							'FLAVOR_WONDER',							20							UNION ALL
SELECT								'TECH_HUMANISM',							'FLAVOR_CULTURE',					        11							UNION ALL
SELECT								'TECH_HUMANISM',							'FLAVOR_HAPPINESS',					        10							UNION ALL
-----------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_AESTHETICS',							'FLAVOR_RELIGION',							18							UNION ALL
SELECT								'TECH_AESTHETICS',							'FLAVOR_WONDER',							20							UNION ALL
SELECT								'TECH_AESTHETICS',							'FLAVOR_CULTURE',					        20							UNION ALL
-----------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_PSYCHOLOGY',						    'FLAVOR_GREAT_PEOPLE',						 7							UNION ALL
SELECT								'TECH_PSYCHOLOGY',						    'FLAVOR_SCIENCE',							25							UNION ALL
SELECT								'TECH_PSYCHOLOGY',						    'FLAVOR_WONDER',							20							UNION ALL
-----------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_REFORMATION',							'FLAVOR_GREAT_PEOPLE',					    10							UNION ALL
SELECT								'TECH_REFORMATION',							'FLAVOR_TILE_IMPROVEMENT',					12							UNION ALL
SELECT								'TECH_REFORMATION',						    'FLAVOR_RELIGION',							20							UNION ALL
SELECT								'TECH_REFORMATION',						    'FLAVOR_CULTURE',							16							UNION ALL
SELECT								'TECH_REFORMATION',						    'FLAVOR_WONDER',							20							UNION ALL
SELECT								'TECH_REFORMATION',						    'FLAVOR_HAPPINESS',							16							UNION ALL
-----------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_SCHOOLING',							'FLAVOR_GREAT_PEOPLE',					     8							UNION ALL
SELECT								'TECH_SCHOOLING',							'FLAVOR_CULTURE',					         6							UNION ALL
SELECT								'TECH_SCHOOLING',							'FLAVOR_GOLD',					             5							UNION ALL
SELECT								'TECH_SCHOOLING',							'FLAVOR_WONDER',					        20							UNION ALL
SELECT								'TECH_SCHOOLING',							'FLAVOR_SCIENCE',					        25							UNION ALL
-----------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_SOCIAL_CLASSES',					    'FLAVOR_RELIGION',							8							UNION ALL
SELECT								'TECH_SOCIAL_CLASSES',					    'FLAVOR_GREAT_PEOPLE',						12							UNION ALL
SELECT								'TECH_SOCIAL_CLASSES',					    'FLAVOR_CULTURE',							16							UNION ALL
SELECT								'TECH_SOCIAL_CLASSES',					    'FLAVOR_WONDER',							18							UNION ALL
SELECT								'TECH_SOCIAL_CLASSES',					    'FLAVOR_HAPPINESS',							14							UNION ALL
-----------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_GUILDS',								'FLAVOR_GREAT_PEOPLE',						 7							UNION ALL
SELECT								'TECH_GUILDS',								'FLAVOR_CULTURE',							5							UNION ALL
SELECT								'TECH_GUILDS',								'FLAVOR_GOLD',								130							UNION ALL
SELECT								'TECH_GUILDS',								'FLAVOR_WONDER',							12							UNION ALL
SELECT								'TECH_GUILDS',								'FLAVOR_TILE_IMPROVEMENT',					12							UNION ALL
-----------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_BANKING',								'FLAVOR_I_SEA_TRADE_ROUTE',					25							UNION ALL
SELECT								'TECH_BANKING',								'FLAVOR_I_LAND_TRADE_ROUTE',				25							UNION ALL
SELECT								'TECH_BANKING',								'FLAVOR_GOLD',								35							UNION ALL
SELECT								'TECH_BANKING',								'FLAVOR_EXPANSION',							12							UNION ALL
SELECT								'TECH_BANKING',								'FLAVOR_GREAT_PEOPLE',						11							UNION ALL
SELECT								'TECH_BANKING',								'FLAVOR_WONDER',							20;
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO Technology_Flavors (	TechType,									FlavorType,									Flavor)
SELECT								'TECH_CONSTITUTION',						'FLAVOR_GREAT_PEOPLE',						12							UNION ALL
SELECT								'TECH_CONSTITUTION',						'FLAVOR_CULTURE',							13							UNION ALL
SELECT								'TECH_CONSTITUTION',						'FLAVOR_HAPPINESS',							 9							UNION ALL
SELECT								'TECH_CONSTITUTION',						'FLAVOR_GOLD',								11							UNION ALL
SELECT								'TECH_CONSTITUTION',						'FLAVOR_SCIENCE',							10							UNION ALL
SELECT								'TECH_CONSTITUTION',						'FLAVOR_DIPLOMACY',							18							UNION ALL
SELECT								'TECH_CONSTITUTION',						'FLAVOR_WONDER',							20							UNION ALL
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_EDUCATION',							'FLAVOR_GREAT_PEOPLE',						11							UNION ALL
SELECT								'TECH_EDUCATION',							'FLAVOR_SCIENCE',							35							UNION ALL
SELECT								'TECH_EDUCATION',							'FLAVOR_WONDER',							20							UNION ALL
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_PRINTING_PRESS',						'FLAVOR_RELIGION',							 6							UNION ALL
SELECT								'TECH_PRINTING_PRESS',						'FLAVOR_WONDER',							20							UNION ALL
SELECT								'TECH_PRINTING_PRESS',						'FLAVOR_CULTURE',							16							UNION ALL
SELECT								'TECH_PRINTING_PRESS',						'FLAVOR_GREAT_PEOPLE',						12							UNION ALL
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_ARCHITECTURE',						'FLAVOR_PRODUCTION',						554							UNION ALL
SELECT								'TECH_ARCHITECTURE',						'FLAVOR_GREAT_PEOPLE',						11							UNION ALL
SELECT								'TECH_ARCHITECTURE',						'FLAVOR_RELIGION',							 8							UNION ALL
SELECT								'TECH_ARCHITECTURE',						'FLAVOR_WONDER',							20							UNION ALL
SELECT								'TECH_ARCHITECTURE',						'FLAVOR_INFRASTRUCTURE',					10							UNION ALL
SELECT								'TECH_ARCHITECTURE',						'FLAVOR_CULTURE',							14							UNION ALL
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_ECONOMICS',							'FLAVOR_SCIENCE',							 6							UNION ALL
SELECT								'TECH_ECONOMICS',							'FLAVOR_CULTURE',							 8							UNION ALL
SELECT								'TECH_ECONOMICS',							'FLAVOR_GOLD',								28							UNION ALL
SELECT								'TECH_ECONOMICS',							'FLAVOR_WONDER',							20							UNION ALL
SELECT								'TECH_ECONOMICS',							'FLAVOR_GREAT_PEOPLE',						 8							UNION ALL
SELECT								'TECH_ECONOMICS',							'FLAVOR_TILE_IMPROVEMENT',					555							UNION ALL
SELECT								'TECH_ECONOMICS',							'FLAVOR_I_SEA_TRADE_ROUTE',					25						UNION ALL
SELECT								'TECH_ECONOMICS',							'FLAVOR_I_LAND_TRADE_ROUTE',				25;
-----------------------------------------------------------------------------------------------------------------------------------------------------------------

--GEOCENTRISM--overworked
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO Technology_Flavors (	TechType,									FlavorType,									Flavor)
SELECT								'TECH_REALISM',						        'FLAVOR_GOLD',						        18							UNION ALL
SELECT								'TECH_REALISM',						        'FLAVOR_I_LAND_TRADE_ROUTE',				 8							UNION ALL
SELECT								'TECH_REALISM',						        'FLAVOR_WONDER',							20							UNION ALL
SELECT								'TECH_REALISM',						        'FLAVOR_GREAT_PEOPLE',						 8							UNION ALL
SELECT								'TECH_REALISM',						        'FLAVOR_I_SEA_TRADE_ROUTE',					 8							UNION ALL
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_JURISPRUDENCE',						'FLAVOR_HAPPINESS',							11							UNION ALL
SELECT								'TECH_JURISPRUDENCE',						'FLAVOR_CULTURE',							12							UNION ALL
SELECT								'TECH_JURISPRUDENCE',						'FLAVOR_GOLD',						        556							UNION ALL
SELECT								'TECH_JURISPRUDENCE',						'FLAVOR_TILE_IMPROVEMENT',					10							UNION ALL
SELECT								'TECH_JURISPRUDENCE',						'FLAVOR_WONDER',							20							UNION ALL
SELECT								'TECH_JURISPRUDENCE',						'FLAVOR_SCIENCE',							 9							UNION ALL
SELECT								'TECH_JURISPRUDENCE',						'FLAVOR_GREAT_PEOPLE',						 8							UNION ALL
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_MERCANTILISM',						'FLAVOR_GOLD',						        18							UNION ALL
SELECT								'TECH_MERCANTILISM',						'FLAVOR_NAVAL',								10							UNION ALL
SELECT								'TECH_MERCANTILISM',						'FLAVOR_WONDER',							18							UNION ALL
SELECT								'TECH_MERCANTILISM',						'FLAVOR_I_LAND_TRADE_ROUTE',				10							UNION ALL
SELECT								'TECH_MERCANTILISM',						'FLAVOR_I_SEA_TRADE_ROUTE',					10							UNION ALL
SELECT								'TECH_MERCANTILISM',						'FLAVOR_HAPPINESS',							11							UNION ALL
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT							    'TECH_ROMANTICISM',							'FLAVOR_GOLD',							     6							UNION ALL
SELECT							    'TECH_ROMANTICISM',							'FLAVOR_WONDER',							20							UNION ALL
SELECT							    'TECH_ROMANTICISM',							'FLAVOR_CULTURE',							557							UNION ALL
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT							    'TECH_HELIOCENTRISM',						'FLAVOR_GREAT_PEOPLE',						 9							UNION ALL
SELECT							    'TECH_HELIOCENTRISM',						'FLAVOR_SCIENCE',							 6							UNION ALL
SELECT							    'TECH_HELIOCENTRISM',						'FLAVOR_INFRASTRUCTURE',				    10							UNION ALL
SELECT							    'TECH_HELIOCENTRISM',						'FLAVOR_WONDER',							18							UNION ALL
SELECT							    'TECH_HELIOCENTRISM',					    'FLAVOR_TILE_IMPROVEMENT',					12							UNION ALL
SELECT							    'TECH_HELIOCENTRISM',					    'FLAVOR_CULTURE',							12							UNION ALL
SELECT							    'TECH_HELIOCENTRISM',					    'FLAVOR_DIPLOMACY',							30							UNION ALL
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_POSEIDON',							'FLAVOR_WONDER',						    20							UNION ALL
SELECT								'TECH_POSEIDON',							'FLAVOR_OFFENSE',							12							UNION ALL
SELECT								'TECH_POSEIDON',							'FLAVOR_CULTURE',							7							UNION ALL
SELECT								'TECH_POSEIDON',							'FLAVOR_GREAT_PEOPLE',						5							UNION ALL
SELECT								'TECH_POSEIDON',							'FLAVOR_MILITARY_TRAINING',					25							UNION ALL
SELECT								'TECH_POSEIDON',							'FLAVOR_NAVAL',								558							UNION ALL
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT							    'TECH_NAVAL_TACTICS',						'FLAVOR_WONDER',							18							UNION ALL
SELECT							    'TECH_NAVAL_TACTICS',						'FLAVOR_NAVAL_RECON',					    16							UNION ALL
SELECT							    'TECH_NAVAL_TACTICS',						'FLAVOR_CULTURE',							11							UNION ALL
SELECT							    'TECH_NAVAL_TACTICS',						'FLAVOR_NAVAL',							    20							UNION ALL
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_ASTRONOMY',							'FLAVOR_WONDER',						    20							UNION ALL
SELECT								'TECH_ASTRONOMY',							'FLAVOR_SCIENCE',							16							UNION ALL
SELECT								'TECH_ASTRONOMY',							'FLAVOR_GREAT_PEOPLE',						11							UNION ALL
SELECT								'TECH_ASTRONOMY',							'FLAVOR_NAVAL',								12							UNION ALL
SELECT								'TECH_ASTRONOMY',							'FLAVOR_MOBILE',							20							UNION ALL
SELECT								'TECH_ASTRONOMY',							'FLAVOR_EXPANSION',							10							UNION ALL
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_ENLIGHTENMENT',						'FLAVOR_DIPLOMACY',						    14							UNION ALL
SELECT								'TECH_ENLIGHTENMENT',						'FLAVOR_GREAT_PEOPLE',						16							UNION ALL
SELECT								'TECH_ENLIGHTENMENT',						'FLAVOR_SCIENCE',							18							UNION ALL
SELECT								'TECH_ENLIGHTENMENT',						'FLAVOR_WONDER',							20							UNION ALL
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_EVANGELISM',							'FLAVOR_CULTURE',							 8							UNION ALL
SELECT								'TECH_EVANGELISM',							'FLAVOR_HAPPINESS',							 9							UNION ALL
SELECT								'TECH_EVANGELISM',							'FLAVOR_GOLD',								12							UNION ALL
SELECT								'TECH_EVANGELISM',							'FLAVOR_WONDER',							20							UNION ALL
SELECT								'TECH_EVANGELISM',							'FLAVOR_RELIGION',							35							UNION ALL
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_NAVIGATION',							'FLAVOR_MOBILE',						    558							UNION ALL
SELECT								'TECH_NAVIGATION',							'FLAVOR_OFFENSE',							20							UNION ALL
SELECT								'TECH_NAVIGATION',							'FLAVOR_DEFENSE',							559							UNION ALL
SELECT								'TECH_NAVIGATION',							'FLAVOR_NAVAL_RECON',						25							UNION ALL
SELECT								'TECH_NAVIGATION',							'FLAVOR_NAVAL',								30;
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO Technology_Flavors (	TechType,									FlavorType,									Flavor)
SELECT								'TECH_OCEAN_PIONEERING',					'FLAVOR_CULTURE',					         8				    UNION ALL
SELECT								'TECH_OCEAN_PIONEERING',					'FLAVOR_HAPPINESS',			                 7							UNION ALL
SELECT								'TECH_OCEAN_PIONEERING',					'FLAVOR_DEFENSE',							 9						    UNION ALL
SELECT								'TECH_OCEAN_PIONEERING',					'FLAVOR_WATER_CONNECTION',					40					    UNION ALL
SELECT								'TECH_OCEAN_PIONEERING',					'FLAVOR_GREAT_PEOPLE',			            10							UNION ALL
SELECT								'TECH_OCEAN_PIONEERING',					'FLAVOR_GOLD',								14						    UNION ALL
SELECT								'TECH_OCEAN_PIONEERING',					'FLAVOR_NAVAL_TILE_IMPROVEMENT',			18							UNION ALL
SELECT								'TECH_OCEAN_PIONEERING',					'FLAVOR_WONDER',							20						    UNION ALL
SELECT								'TECH_OCEAN_PIONEERING',					'FLAVOR_PRODUCTION',						11						    UNION ALL
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_INTERNATIONAL_TRADE',					'FLAVOR_GROWTH',							16							UNION ALL
SELECT								'TECH_INTERNATIONAL_TRADE',					'FLAVOR_PRODUCTION',						12							UNION ALL
SELECT								'TECH_INTERNATIONAL_TRADE',					'FLAVOR_SCIENCE',							12							UNION ALL
SELECT								'TECH_INTERNATIONAL_TRADE',					'FLAVOR_GOLD',								16							UNION ALL
SELECT								'TECH_INTERNATIONAL_TRADE',					'FLAVOR_TILE_IMPROVEMENT',					16							UNION ALL
SELECT								'TECH_INTERNATIONAL_TRADE',					'FLAVOR_I_SEA_TRADE_ROUTE',					20							UNION ALL
SELECT								'TECH_INTERNATIONAL_TRADE',					'FLAVOR_I_LAND_TRADE_ROUTE',				20							UNION ALL
SELECT								'TECH_INTERNATIONAL_TRADE',					'FLAVOR_INFRASTRUCTURE',					10							UNION ALL
-----------------------------------------------------------------------------------------------------------------------------------------------------------------

--ALCHEMY---overworked

-----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_JUSTICE',					            'FLAVOR_GREAT_PEOPLE',					     9							UNION ALL
SELECT								'TECH_JUSTICE',					            'FLAVOR_PRODUCTION',					    11							UNION ALL
SELECT								'TECH_JUSTICE',					            'FLAVOR_RELIGION',							12							UNION ALL
SELECT								'TECH_JUSTICE',					            'FLAVOR_WONDER',							25							UNION ALL
SELECT								'TECH_JUSTICE',					            'FLAVOR_TILE_IMPROVEMENT',					11							UNION ALL
SELECT								'TECH_JUSTICE',					            'FLAVOR_CULTURE',					        10							UNION ALL
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_ARES',				                'FLAVOR_GREAT_PEOPLE',					    12							UNION ALL
SELECT								'TECH_ARES',				                'FLAVOR_WONDER',							20							UNION ALL
SELECT								'TECH_ARES',				                'FLAVOR_DEFENSE',					        560							UNION ALL
SELECT								'TECH_ARES',				                'FLAVOR_OFFENSE',							561							UNION ALL
SELECT								'TECH_ARES',				                'FLAVOR_TILE_IMPROVEMENT',				    11							UNION ALL
SELECT								'TECH_ARES',				                'FLAVOR_MILITARY_TRAINING',					562							UNION ALL
SELECT								'TECH_ARES',				                'FLAVOR_NUKE',					            10							UNION ALL
SELECT								'TECH_ARES',				                'FLAVOR_PRODUCTION',					    10							UNION ALL
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_BATTLEFIELD_MEDICINE',				'FLAVOR_WONDER',					        20							UNION ALL
SELECT								'TECH_BATTLEFIELD_MEDICINE',				'FLAVOR_CULTURE',					         7							UNION ALL
SELECT								'TECH_BATTLEFIELD_MEDICINE',				'FLAVOR_GREAT_PEOPLE',					     9							UNION ALL
SELECT								'TECH_BATTLEFIELD_MEDICINE',				'FLAVOR_GROWTH',					        563							UNION ALL
SELECT								'TECH_BATTLEFIELD_MEDICINE',				'FLAVOR_DEFENSE',					        564							UNION ALL
SELECT								'TECH_BATTLEFIELD_MEDICINE',				'FLAVOR_OFFENSE',							565							UNION ALL
SELECT								'TECH_BATTLEFIELD_MEDICINE',				'FLAVOR_MOBILE',							566							UNION ALL
SELECT								'TECH_BATTLEFIELD_MEDICINE',				'FLAVOR_MILITARY_TRAINING',					567							UNION ALL
SELECT								'TECH_BATTLEFIELD_MEDICINE',				'FLAVOR_NUKE',					            10							UNION ALL
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_CHEMICAL_REVOLUTION',					'FLAVOR_PRODUCTION',					    11							UNION ALL
SELECT								'TECH_CHEMICAL_REVOLUTION',					'FLAVOR_GREAT_PEOPLE',						12							UNION ALL
SELECT								'TECH_CHEMICAL_REVOLUTION',					'FLAVOR_TILE_IMPROVEMENT',				    14							UNION ALL
SELECT								'TECH_CHEMICAL_REVOLUTION',					'FLAVOR_SCIENCE',					        18							UNION ALL
SELECT								'TECH_CHEMICAL_REVOLUTION',					'FLAVOR_GROWTH',							22							UNION ALL
SELECT								'TECH_CHEMICAL_REVOLUTION',					'FLAVOR_WONDER',							20							UNION ALL
SELECT								'TECH_CHEMICAL_REVOLUTION',					'FLAVOR_HAPPINESS',					        12							UNION ALL
SELECT								'TECH_CHEMICAL_REVOLUTION',					'FLAVOR_CULTURE',					        11							UNION ALL
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_STEEL',								'FLAVOR_WONDER',							20						UNION ALL
SELECT								'TECH_STEEL',								'FLAVOR_CULTURE',					     	 8							UNION ALL
SELECT								'TECH_STEEL',								'FLAVOR_TILE_IMPROVEMENT',					18							UNION ALL
SELECT								'TECH_STEEL',								'FLAVOR_GOLD',								11							UNION ALL
SELECT								'TECH_STEEL',								'FLAVOR_PRODUCTION',						22							UNION ALL
SELECT								'TECH_STEEL',								'FLAVOR_NUKE',							    10							UNION ALL
SELECT								'TECH_STEEL',								'FLAVOR_RANGED',							11							UNION ALL
SELECT								'TECH_STEEL',								'FLAVOR_MOBILE',							22							UNION ALL
SELECT								'TECH_STEEL',								'FLAVOR_OFFENSE',							18							UNION ALL
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_BLAST_FURNACE',						'FLAVOR_GREAT_PEOPLE',						 9							UNION ALL
SELECT								'TECH_BLAST_FURNACE',						'FLAVOR_WONDER',							20							UNION ALL
SELECT								'TECH_BLAST_FURNACE',						'FLAVOR_CULTURE',					        10							UNION ALL
SELECT								'TECH_BLAST_FURNACE',						'FLAVOR_PRODUCTION',						26							UNION ALL
SELECT								'TECH_BLAST_FURNACE',						'FLAVOR_GOLD',								12							UNION ALL
SELECT								'TECH_BLAST_FURNACE',						'FLAVOR_TILE_IMPROVEMENT',					16							UNION ALL
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_GUNPOWDER',							'FLAVOR_MOBILE',							18							UNION ALL
SELECT								'TECH_GUNPOWDER',							'FLAVOR_GREAT_PEOPLE',					     9							UNION ALL
SELECT								'TECH_GUNPOWDER',							'FLAVOR_CULTURE',							 9							UNION ALL
SELECT								'TECH_GUNPOWDER',							'FLAVOR_DEFENSE',							18							UNION ALL
SELECT								'TECH_GUNPOWDER',							'FLAVOR_TILE_IMPROVEMENT',					11							UNION ALL
SELECT								'TECH_GUNPOWDER',							'FLAVOR_GOLD',								11							UNION ALL
SELECT								'TECH_GUNPOWDER',							'FLAVOR_OFFENSE',							20							UNION ALL
SELECT								'TECH_GUNPOWDER',							'FLAVOR_NUKE',							    10							UNION ALL
SELECT								'TECH_GUNPOWDER',							'FLAVOR_WONDER',							12							UNION ALL
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_CHEMISTRY',							'FLAVOR_PRODUCTION',						16							UNION ALL
SELECT								'TECH_CHEMISTRY',							'FLAVOR_TILE_IMPROVEMENT',					13							UNION ALL
SELECT								'TECH_CHEMISTRY',							'FLAVOR_GOLD',							    17							UNION ALL
SELECT								'TECH_CHEMISTRY',							'FLAVOR_INFRASTRUCTURE',					12							UNION ALL
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_FERTILIZER',							'FLAVOR_PRODUCTION',					    13							UNION ALL
SELECT								'TECH_FERTILIZER',							'FLAVOR_GOLD',							    12							UNION ALL
SELECT								'TECH_FERTILIZER',							'FLAVOR_GREAT_PEOPLE',					     9						UNION ALL
SELECT								'TECH_FERTILIZER',							'FLAVOR_INFRASTRUCTURE',					12							UNION ALL
SELECT								'TECH_FERTILIZER',							'FLAVOR_TILE_IMPROVEMENT',					19							UNION ALL
SELECT								'TECH_FERTILIZER',							'FLAVOR_GROWTH',							22;
-----------------------------------------------------------------------------------------------------------------------------------------------------------------



--INDUSTRIAL ERA--
--INDUSTRIAL REVOLUTION--overworked
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO Technology_Flavors (	TechType,									FlavorType,									Flavor)
SELECT								'TECH_GOLDENDAWN',					        'FLAVOR_CULTURE',						    11							UNION ALL
SELECT								'TECH_GOLDENDAWN',				            'FLAVOR_GREAT_PEOPLE',					    12							UNION ALL
SELECT								'TECH_GOLDENDAWN',				            'FLAVOR_HAPPINESS',					        12							UNION ALL
SELECT								'TECH_GOLDENDAWN',					        'FLAVOR_GOLD',						        10							UNION ALL
SELECT								'TECH_GOLDENDAWN',				            'FLAVOR_WONDER',					        20							UNION ALL
SELECT								'TECH_GOLDENDAWN',			                'FLAVOR_CULTURE',					        567							UNION ALL
SELECT								'TECH_GOLDENDAWN',			                'FLAVOR_SCIENCE',					        12							UNION ALL
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_TUNNEL',					           'FLAVOR_GOLD',						        10							UNION ALL
SELECT								'TECH_TUNNEL',				               'FLAVOR_INFRASTRUCTURE',					    568							UNION ALL
SELECT								'TECH_TUNNEL',			                   'FLAVOR_PRODUCTION',					        569							UNION ALL
SELECT								'TECH_TUNNEL',			                   'FLAVOR_TILE_IMPROVEMENT',				    19							UNION ALL
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_RAILWAY_COMPANY',						'FLAVOR_I_LAND_TRADE_ROUTE',				25							UNION ALL
SELECT								'TECH_RAILWAY_COMPANY',						'FLAVOR_I_SEA_TRADE_ROUTE',				    25							UNION ALL
SELECT								'TECH_RAILWAY_COMPANY',						'FLAVOR_GOLD',				                570							UNION ALL
SELECT								'TECH_RAILWAY_COMPANY',						'FLAVOR_GREAT_PEOPLE',				        10							UNION ALL
SELECT								'TECH_RAILWAY_COMPANY',						'FLAVOR_WONDER',						    20							UNION ALL
SELECT								'TECH_RAILWAY_COMPANY',						'FLAVOR_HAPPINESS',						    16							UNION ALL
SELECT								'TECH_RAILWAY_COMPANY',				        'FLAVOR_TILE_IMPROVEMENT',					12							UNION ALL
SELECT								'TECH_RAILWAY_COMPANY',				        'FLAVOR_CULTURE',					        11							UNION ALL
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_PHOTOGRAPHY',					        'FLAVOR_GOLD',						        14						UNION ALL
SELECT								'TECH_PHOTOGRAPHY',					        'FLAVOR_GREAT_PEOPLE',						10							UNION ALL
SELECT								'TECH_PHOTOGRAPHY',					        'FLAVOR_INFRASTRUCTURE',				    12							UNION ALL
SELECT								'TECH_PHOTOGRAPHY',					        'FLAVOR_WONDER',						    20							UNION ALL
SELECT								'TECH_PHOTOGRAPHY',					        'FLAVOR_HAPPINESS',						    11							UNION ALL
SELECT								'TECH_PHOTOGRAPHY',				            'FLAVOR_TILE_IMPROVEMENT',					14							UNION ALL
SELECT								'TECH_PHOTOGRAPHY',			                'FLAVOR_CULTURE',					        11							UNION ALL
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_TELEGRAPH',				            'FLAVOR_HAPPINESS',					        16							UNION ALL
SELECT								'TECH_TELEGRAPH',					        'FLAVOR_GOLD',						        12							UNION ALL
SELECT								'TECH_TELEGRAPH',				            'FLAVOR_WONDER',					        20							UNION ALL
SELECT								'TECH_TELEGRAPH',			                'FLAVOR_CULTURE',					        570							UNION ALL
SELECT								'TECH_TELEGRAPH',			                'FLAVOR_GREAT_PEOPLE',					    10							UNION ALL
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_STEAM_POWER',							'FLAVOR_I_LAND_TRADE_ROUTE',			    25							UNION ALL
SELECT								'TECH_STEAM_POWER',							'FLAVOR_I_SEA_TRADE_ROUTE',				    25							UNION ALL
SELECT								'TECH_STEAM_POWER',							'FLAVOR_WONDER',						    20							UNION ALL
SELECT								'TECH_STEAM_POWER',							'FLAVOR_CULTURE',						    10							UNION ALL
SELECT								'TECH_STEAM_POWER',							'FLAVOR_RELIGION',					         8							UNION ALL
SELECT								'TECH_STEAM_POWER',							'FLAVOR_GOLD',						        12							UNION ALL
SELECT								'TECH_STEAM_POWER',							'FLAVOR_GREAT_PEOPLE',					    10							UNION ALL
SELECT								'TECH_STEAM_POWER',							'FLAVOR_INFRASTRUCTURE',				    12							UNION ALL
SELECT								'TECH_STEAM_POWER',							'FLAVOR_PRODUCTION',						16							UNION ALL
SELECT								'TECH_STEAM_POWER',							'FLAVOR_TILE_IMPROVEMENT',					12							UNION ALL
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_DYNAMITE',							'FLAVOR_WONDER',					        20							UNION ALL
SELECT								'TECH_DYNAMITE',							'FLAVOR_CULTURE',						    13							UNION ALL
SELECT								'TECH_DYNAMITE',							'FLAVOR_RELIGION',						     9							UNION ALL
SELECT								'TECH_DYNAMITE',							'FLAVOR_HAPPINESS',						    13							UNION ALL
SELECT								'TECH_DYNAMITE',							'FLAVOR_GREAT_PEOPLE',						10							UNION ALL
SELECT								'TECH_DYNAMITE',							'FLAVOR_INFRASTRUCTURE',				    13							UNION ALL
SELECT								'TECH_DYNAMITE',							'FLAVOR_TILE_IMPROVEMENT',					30							UNION ALL
SELECT								'TECH_DYNAMITE',							'FLAVOR_PRODUCTION',						14							UNION ALL
SELECT								'TECH_DYNAMITE',							'FLAVOR_NUKE',						        10							UNION ALL
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_INDUSTRIALIZATION',					'FLAVOR_WONDER',						    20							UNION ALL
SELECT								'TECH_INDUSTRIALIZATION',					'FLAVOR_I_LAND_TRADE_ROUTE',				12							UNION ALL
SELECT								'TECH_INDUSTRIALIZATION',					'FLAVOR_I_SEA_TRADE_ROUTE',					12							UNION ALL
SELECT								'TECH_INDUSTRIALIZATION',					'FLAVOR_GREAT_PEOPLE',				        10							UNION ALL
SELECT								'TECH_INDUSTRIALIZATION',					'FLAVOR_CULTURE',					        10							UNION ALL
SELECT								'TECH_INDUSTRIALIZATION',					'FLAVOR_PRODUCTION',						35							UNION ALL
SELECT								'TECH_INDUSTRIALIZATION',					'FLAVOR_GOLD',								20							UNION ALL
SELECT								'TECH_INDUSTRIALIZATION',					'FLAVOR_TILE_IMPROVEMENT',					16							UNION ALL
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_REPLACEABLE_PARTS',					'FLAVOR_MILITARY_TRAINING',					16							UNION ALL
SELECT								'TECH_REPLACEABLE_PARTS',					'FLAVOR_SCIENCE',						    13							UNION ALL
SELECT								'TECH_REPLACEABLE_PARTS',					'FLAVOR_HAPPINESS',							12							UNION ALL
SELECT								'TECH_REPLACEABLE_PARTS',					'FLAVOR_GREAT_PEOPLE',						13							UNION ALL
SELECT								'TECH_REPLACEABLE_PARTS',					'FLAVOR_OFFENSE',							16							UNION ALL
SELECT								'TECH_REPLACEABLE_PARTS',					'FLAVOR_DEFENSE',							12							UNION ALL
SELECT								'TECH_REPLACEABLE_PARTS',					'FLAVOR_PRODUCTION',						16							UNION ALL
SELECT								'TECH_REPLACEABLE_PARTS',					'FLAVOR_CITY_DEFENSE',						16							UNION ALL
SELECT								'TECH_REPLACEABLE_PARTS',					'FLAVOR_WONDER',							12							UNION ALL
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_RAILROAD',							'FLAVOR_MOBILE',					        20							UNION ALL
SELECT								'TECH_RAILROAD',							'FLAVOR_OFFENSE',						    19							UNION ALL
SELECT								'TECH_RAILROAD',							'FLAVOR_DEFENSE',							12							UNION ALL
SELECT								'TECH_RAILROAD',							'FLAVOR_GREAT_PEOPLE',					    11							UNION ALL
SELECT								'TECH_RAILROAD',							'FLAVOR_CULTURE',							11							UNION ALL
SELECT								'TECH_RAILROAD',							'FLAVOR_INFRASTRUCTURE',					20							UNION ALL
SELECT								'TECH_RAILROAD',							'FLAVOR_PRODUCTION',						14							UNION ALL
SELECT								'TECH_RAILROAD',							'FLAVOR_WONDER',							12							UNION ALL
SELECT								'TECH_RAILROAD',							'FLAVOR_HAPPINESS',							12							UNION ALL
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_CORPORATIONS',						'FLAVOR_WONDER',							20							UNION ALL
SELECT								'TECH_CORPORATIONS',						'FLAVOR_GROWTH',					        11							UNION ALL
SELECT								'TECH_CORPORATIONS',						'FLAVOR_GREAT_PEOPLE',					    10							UNION ALL
SELECT								'TECH_CORPORATIONS',						'FLAVOR_HAPPINESS',					        10							UNION ALL
SELECT								'TECH_CORPORATIONS',						'FLAVOR_GOLD',								40							UNION ALL
SELECT								'TECH_CORPORATIONS',						'FLAVOR_TILE_IMPROVEMENT',					16							UNION ALL
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_INDUSTRIAL_PROCESSES',				'FLAVOR_SCIENCE',							18							UNION ALL
SELECT								'TECH_INDUSTRIAL_PROCESSES',				'FLAVOR_WONDER',						    20							UNION ALL
SELECT								'TECH_INDUSTRIAL_PROCESSES',				'FLAVOR_GREAT_PEOPLE',						12							UNION ALL
SELECT								'TECH_INDUSTRIAL_PROCESSES',				'FLAVOR_GROWTH',							18							UNION ALL
SELECT								'TECH_INDUSTRIAL_PROCESSES',				'FLAVOR_PRODUCTION',						14							UNION ALL
SELECT								'TECH_INDUSTRIAL_PROCESSES',				'FLAVOR_GOLD',								20							UNION ALL
SELECT								'TECH_INDUSTRIAL_PROCESSES',				'FLAVOR_TILE_IMPROVEMENT',					18							UNION ALL
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_REFINING',							'FLAVOR_GREAT_PEOPLE',						 8							UNION ALL
SELECT								'TECH_REFINING',							'FLAVOR_INFRASTRUCTURE',					12							UNION ALL
SELECT								'TECH_REFINING',							'FLAVOR_PRODUCTION',						16							UNION ALL
SELECT								'TECH_REFINING',							'FLAVOR_GOLD',								18							UNION ALL
SELECT								'TECH_REFINING',							'FLAVOR_TILE_IMPROVEMENT',					16;
-----------------------------------------------------------------------------------------------------------------------------------------------------------------

--SCIENCE--overworked
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO Technology_Flavors (	TechType,									FlavorType,									Flavor)
SELECT								'TECH_URLAUB',					            'FLAVOR_GREAT_PEOPLE',					     8							UNION ALL
SELECT								'TECH_URLAUB',					            'FLAVOR_TILE_IMPROVEMENT',					10							UNION ALL
SELECT								'TECH_URLAUB',					            'FLAVOR_DIPLOMACY',					        10							UNION ALL
SELECT								'TECH_URLAUB',					            'FLAVOR_CULTURE',					        25							UNION ALL
SELECT								'TECH_URLAUB',						        'FLAVOR_WONDER',						    20							UNION ALL
SELECT								'TECH_URLAUB',						        'FLAVOR_HAPPINESS',					        20							UNION ALL
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_LOGISTIC',					        'FLAVOR_WONDER',				            20							UNION ALL
SELECT								'TECH_LOGISTIC',					        'FLAVOR_GREAT_PEOPLE',				        9							UNION ALL
SELECT								'TECH_LOGISTIC',					        'FLAVOR_GOLD',						        570							UNION ALL
SELECT								'TECH_LOGISTIC',					        'FLAVOR_I_SEA_TRADE_ROUTE',				    25							UNION ALL
SELECT								'TECH_LOGISTIC',					        'FLAVOR_I_LAND_TRADE_ROUTE',				25							UNION ALL
SELECT								'TECH_LOGISTIC',					        'FLAVOR_EXPANSION',						    20							UNION ALL
SELECT								'TECH_LOGISTIC',					        'FLAVOR_INFRASTRUCTURE',					13							UNION ALL
SELECT								'TECH_LOGISTIC',					        'FLAVOR_OFFENSE',					        10							UNION ALL
SELECT								'TECH_LOGISTIC',						    'FLAVOR_PRODUCTION',						18							UNION ALL
SELECT								'TECH_LOGISTIC',						    'FLAVOR_SCIENCE',					        13							UNION ALL
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_ENERGY_BUILDINGS',					'FLAVOR_PRODUCTION',						25							UNION ALL
SELECT								'TECH_ENERGY_BUILDINGS',					'FLAVOR_GREAT_PEOPLE',					     8							UNION ALL
SELECT								'TECH_ENERGY_BUILDINGS',					'FLAVOR_EXPANSION',						    20							UNION ALL
SELECT								'TECH_ENERGY_BUILDINGS',					'FLAVOR_INFRASTRUCTURE',					572							UNION ALL
SELECT								'TECH_ENERGY_BUILDINGS',					'FLAVOR_OFFENSE',					        20							UNION ALL
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_THERMODYNAMICS',					    'FLAVOR_EXPANSION',						    20							UNION ALL
SELECT								'TECH_THERMODYNAMICS',					    'FLAVOR_INFRASTRUCTURE',					13							UNION ALL
SELECT								'TECH_THERMODYNAMICS',					    'FLAVOR_OFFENSE',					        18							UNION ALL
SELECT								'TECH_THERMODYNAMICS',						'FLAVOR_PRODUCTION',						18							UNION ALL
SELECT								'TECH_THERMODYNAMICS',						'FLAVOR_TILE_IMPROVEMENT',					10							UNION ALL
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_NATIONAL_ARTS', 					    'FLAVOR_TILE_IMPROVEMENT',					10							UNION ALL
SELECT								'TECH_NATIONAL_ARTS', 						'FLAVOR_SCIENCE',						     9							UNION ALL
SELECT								'TECH_NATIONAL_ARTS', 						'FLAVOR_GREAT_PEOPLE',					    10							UNION ALL
SELECT								'TECH_NATIONAL_ARTS', 					    'FLAVOR_CULTURE',					        20							UNION ALL
SELECT								'TECH_NATIONAL_ARTS', 						'FLAVOR_WONDER',						    20							UNION ALL
SELECT								'TECH_NATIONAL_ARTS', 						'FLAVOR_RELIGION',					        824							UNION ALL
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_TOURISTIC',					        'FLAVOR_GREAT_PEOPLE',					    10							UNION ALL
SELECT								'TECH_TOURISTIC',						    'FLAVOR_SCIENCE',						    10							UNION ALL
SELECT								'TECH_TOURISTIC',						    'FLAVOR_TILE_IMPROVEMENT',					10							UNION ALL
SELECT								'TECH_TOURISTIC',					        'FLAVOR_GOLD',					            10							UNION ALL
SELECT								'TECH_TOURISTIC',					        'FLAVOR_CULTURE',					        25							UNION ALL
SELECT								'TECH_TOURISTIC',						    'FLAVOR_WONDER',						    20							UNION ALL
SELECT								'TECH_TOURISTIC',						    'FLAVOR_HAPPINESS',					        20							UNION ALL
-----------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_MOTORIZED_TRANSPORTATIONS',		  'FLAVOR_EXPANSION',					        25							UNION ALL
SELECT								'TECH_MOTORIZED_TRANSPORTATIONS',		  'FLAVOR_PRODUCTION',						    25							UNION ALL
SELECT								'TECH_MOTORIZED_TRANSPORTATIONS',		  'FLAVOR_OFFENSE',					            20							UNION ALL
SELECT								'TECH_MOTORIZED_TRANSPORTATIONS',		  'FLAVOR_DEFENSE',					            20							UNION ALL
SELECT								'TECH_MOTORIZED_TRANSPORTATIONS',		  'FLAVOR_AIR',						            20							UNION ALL
SELECT								'TECH_MOTORIZED_TRANSPORTATIONS',		  'FLAVOR_NAVAL',						        10							UNION ALL
SELECT								'TECH_MOTORIZED_TRANSPORTATIONS',		  'FLAVOR_NUKE',						        10							UNION ALL
-----------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_SKYSCRAPER', 		                  'FLAVOR_GREAT_PEOPLE',					    10							UNION ALL
SELECT								'TECH_SKYSCRAPER', 		                  'FLAVOR_DIPLOMACY',						     9							UNION ALL
SELECT								'TECH_SKYSCRAPER', 		                  'FLAVOR_I_SEA_TRADE_ROUTE',				    10							UNION ALL
SELECT								'TECH_SKYSCRAPER', 		                  'FLAVOR_I_LAND_TRADE_ROUTE',				    10							UNION ALL
SELECT								'TECH_SKYSCRAPER', 		                  'FLAVOR_CULTURE',					            20							UNION ALL
SELECT								'TECH_SKYSCRAPER', 		                  'FLAVOR_WONDER',						        20							UNION ALL
SELECT								'TECH_SKYSCRAPER', 		                  'FLAVOR_GOLD',						        20							UNION ALL
-----------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_CRIMINOLOGY',		                  'FLAVOR_CITY_DEFENSE',					    10							UNION ALL
SELECT								'TECH_CRIMINOLOGY',		                  'FLAVOR_WONDER',					            20							UNION ALL
SELECT								'TECH_CRIMINOLOGY',			              'FLAVOR_ESPIONAGE',						    35							UNION ALL
SELECT								'TECH_CRIMINOLOGY',			              'FLAVOR_PRODUCTION',						     5							UNION ALL
SELECT								'TECH_CRIMINOLOGY',			              'FLAVOR_GREAT_PEOPLE',						 6							UNION ALL
SELECT								'TECH_CRIMINOLOGY',			              'FLAVOR_INFRASTRUCTURE',						10							UNION ALL
SELECT								'TECH_CRIMINOLOGY',		                  'FLAVOR_SCIENCE',					            16							UNION ALL
SELECT								'TECH_CRIMINOLOGY',			              'FLAVOR_HAPPINESS',						    22							UNION ALL
SELECT								'TECH_CRIMINOLOGY',			              'FLAVOR_DIPLOMACY',						    25							UNION ALL
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_MACRO_ENGINEERING', 		          'FLAVOR_WONDER',					            20							UNION ALL
SELECT								'TECH_MACRO_ENGINEERING', 		          'FLAVOR_PRODUCTION',					        28							UNION ALL
SELECT								'TECH_MACRO_ENGINEERING', 		          'FLAVOR_GREAT_PEOPLE',						 8						UNION ALL
SELECT								'TECH_MACRO_ENGINEERING', 		          'FLAVOR_INFRASTRUCTURE',						20							UNION ALL
SELECT								'TECH_MACRO_ENGINEERING', 		          'FLAVOR_TILE_IMPROVEMENT',					20							UNION ALL
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_EXPLORATIONX',		              'FLAVOR_WONDER',					            20							UNION ALL
SELECT								'TECH_EXPLORATIONX',		              'FLAVOR_GREAT_PEOPLE',					     8							UNION ALL
SELECT								'TECH_EXPLORATIONX',		              'FLAVOR_I_SEA_TRADE_ROUTE',					25							UNION ALL
SELECT								'TECH_EXPLORATIONX',		              'FLAVOR_I_LAND_TRADE_ROUTE',					25							UNION ALL
SELECT								'TECH_EXPLORATIONX',		              'FLAVOR_HAPPINESS',						    20							UNION ALL
SELECT								'TECH_EXPLORATIONX',		              'FLAVOR_CULTURE',						        20							UNION ALL
SELECT								'TECH_EXPLORATIONX',		              'FLAVOR_EXPANSION',					        20							UNION ALL
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_MEDICINE',		                  'FLAVOR_WONDER',						        20							UNION ALL
SELECT								'TECH_MEDICINE',		                  'FLAVOR_PRODUCTION',						     5							UNION ALL
SELECT								'TECH_MEDICINE',		                  'FLAVOR_INFRASTRUCTURE',					     9							UNION ALL
SELECT								'TECH_MEDICINE',		                  'FLAVOR_SCIENCE',						        25							UNION ALL
SELECT								'TECH_MEDICINE',		                  'FLAVOR_GROWTH',						        25							UNION ALL
SELECT								'TECH_MEDICINE',		                  'FLAVOR_EXPANSION',					        20;
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO Technology_Flavors (	TechType,									FlavorType,									Flavor)
SELECT								'TECH_ARCHAEOLOGY',							'FLAVOR_TILE_IMPROVEMENT',					20							UNION ALL
SELECT								'TECH_ARCHAEOLOGY',							'FLAVOR_ARCHAEOLOGY',					   100							UNION ALL
SELECT								'TECH_ARCHAEOLOGY',							'FLAVOR_CULTURE',							28							UNION ALL
SELECT								'TECH_ARCHAEOLOGY',							'FLAVOR_WONDER',							12							UNION ALL
SELECT								'TECH_ARCHAEOLOGY',							'FLAVOR_GREAT_PEOPLE',						14							UNION ALL
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_BIOLOGY',								'FLAVOR_GOLD',							    10							UNION ALL
SELECT								'TECH_BIOLOGY',								'FLAVOR_PRODUCTION',					    10							UNION ALL
SELECT								'TECH_BIOLOGY',								'FLAVOR_GROWTH',							18							UNION ALL
SELECT								'TECH_BIOLOGY',								'FLAVOR_TILE_IMPROVEMENT',					20							UNION ALL
SELECT								'TECH_BIOLOGY',								'FLAVOR_OFFENSE',							12							UNION ALL
SELECT								'TECH_BIOLOGY',								'FLAVOR_SCIENCE',							14							UNION ALL
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_PHARMACEUTICALS',						'FLAVOR_GREAT_PEOPLE',					    10							UNION ALL
SELECT								'TECH_PHARMACEUTICALS',						'FLAVOR_HAPPINESS',							20							UNION ALL
SELECT								'TECH_PHARMACEUTICALS',						'FLAVOR_WONDER',							20							UNION ALL
SELECT								'TECH_PHARMACEUTICALS',						'FLAVOR_TILE_IMPROVEMENT',					10							UNION ALL
SELECT								'TECH_PHARMACEUTICALS',						'FLAVOR_SCIENCE',							24							UNION ALL
SELECT								'TECH_PHARMACEUTICALS',						'FLAVOR_GROWTH',						    30							UNION ALL
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_SCIENTIFIC_THEORY',					'FLAVOR_GREAT_PEOPLE',						11							UNION ALL
SELECT								'TECH_SCIENTIFIC_THEORY',					'FLAVOR_SCIENCE',							32							UNION ALL
SELECT								'TECH_SCIENTIFIC_THEORY',					'FLAVOR_WONDER',							22							UNION ALL
SELECT								'TECH_SCIENTIFIC_THEORY',					'FLAVOR_TILE_IMPROVEMENT',					22							UNION ALL
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_ELECTRICITY',							'FLAVOR_GREAT_PEOPLE',						 8							UNION ALL
SELECT								'TECH_ELECTRICITY',							'FLAVOR_GROWTH',						     6							UNION ALL
SELECT								'TECH_ELECTRICITY',							'FLAVOR_WONDER',							20							UNION ALL
SELECT								'TECH_ELECTRICITY',							'FLAVOR_PRODUCTION',						32							UNION ALL
SELECT								'TECH_ELECTRICITY',							'FLAVOR_SCIENCE',							24							UNION ALL
SELECT								'TECH_ELECTRICITY',							'FLAVOR_TILE_IMPROVEMENT',					28							UNION ALL
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_REFRIGERATION',						'FLAVOR_GOLD',			                    10							UNION ALL
SELECT								'TECH_REFRIGERATION',						'FLAVOR_PRODUCTION',						10							UNION ALL
SELECT								'TECH_REFRIGERATION',						'FLAVOR_INFRASTRUCTURE',			        573							UNION ALL
SELECT								'TECH_REFRIGERATION',						'FLAVOR_NAVAL_TILE_IMPROVEMENT',			28							UNION ALL
SELECT								'TECH_REFRIGERATION',						'FLAVOR_GROWTH',							30;
-----------------------------------------------------------------------------------------------------------------------------------------

--MILITARY RESEARCH--overworkerd
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO Technology_Flavors (	TechType,									FlavorType,									Flavor)
SELECT								'TECH_LANDSHIPS',							'FLAVOR_NUKE',							    10							UNION ALL
SELECT								'TECH_LANDSHIPS',							'FLAVOR_DEFENSE',							25						    UNION ALL
SELECT								'TECH_LANDSHIPS',							'FLAVOR_OFFENSE',							25							UNION ALL
SELECT								'TECH_LANDSHIPS',							'FLAVOR_MOBILE',							25						    UNION ALL
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_SCORCHED_EARTH',					   'FLAVOR_OFFENSE',							25							UNION ALL
SELECT								'TECH_SCORCHED_EARTH',					   'FLAVOR_MOBILE',					            574							UNION ALL
SELECT								'TECH_SCORCHED_EARTH',					   'FLAVOR_DEFENSE',							10							UNION ALL
SELECT								'TECH_SCORCHED_EARTH',					   'FLAVOR_MILITARY_TRAINING',					575							UNION ALL
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_ZEPPELIN',							'FLAVOR_ANTIAIR',							35							UNION ALL
SELECT								'TECH_ZEPPELIN',							'FLAVOR_DEFENSE',							25						    UNION ALL
SELECT								'TECH_ZEPPELIN',							'FLAVOR_OFFENSE',							25							UNION ALL
SELECT								'TECH_ZEPPELIN',							'FLAVOR_MOBILE',							25						    UNION ALL
SELECT								'TECH_ZEPPELIN',							'FLAVOR_RANGED',							25							UNION ALL
SELECT								'TECH_ZEPPELIN',							'FLAVOR_NUKE',							    10							UNION ALL
SELECT								'TECH_ZEPPELIN',							'FLAVOR_AIR_CARRIER',						50							UNION ALL
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_SECRET_AGENCY',					   'FLAVOR_GREAT_PEOPLE',						 8							UNION ALL
SELECT								'TECH_SECRET_AGENCY',					   'FLAVOR_WONDER',							    18							UNION ALL
SELECT								'TECH_SECRET_AGENCY',					   'FLAVOR_ESPIONAGE',							35							UNION ALL
SELECT								'TECH_SECRET_AGENCY',					   'FLAVOR_MILITARY_TRAINING',					576							UNION ALL
SELECT								'TECH_SECRET_AGENCY',					   'FLAVOR_NUKE',					            10							UNION ALL
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_WAR_GAMES',							'FLAVOR_WONDER',							20						    UNION ALL
SELECT								'TECH_WAR_GAMES',							'FLAVOR_DEFENSE',							25						    UNION ALL
SELECT								'TECH_WAR_GAMES',							'FLAVOR_OFFENSE',							25							UNION ALL
SELECT								'TECH_WAR_GAMES',							'FLAVOR_MOBILE',							25						    UNION ALL
SELECT								'TECH_WAR_GAMES',							'FLAVOR_RANGED',							25							UNION ALL
SELECT								'TECH_WAR_GAMES',							'FLAVOR_MILITARY_TRAINING',					20							UNION ALL
SELECT								'TECH_WAR_GAMES',							'FLAVOR_NUKE',					            10							UNION ALL
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_AVIATION',							'FLAVOR_ANTIAIR',							50							UNION ALL
SELECT								'TECH_AVIATION',							'FLAVOR_DEFENSE',							25						    UNION ALL
SELECT								'TECH_AVIATION',							'FLAVOR_OFFENSE',							25							UNION ALL
SELECT								'TECH_AVIATION',							'FLAVOR_MOBILE',							35						    UNION ALL
SELECT								'TECH_AVIATION',							'FLAVOR_RANGED',							25							UNION ALL
SELECT								'TECH_AVIATION',							'FLAVOR_NUKE',							    10							UNION ALL
SELECT								'TECH_AVIATION',							'FLAVOR_WONDER',							577							UNION ALL
-----------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_MANEUVER_WARFARE',					'FLAVOR_WONDER',					        20							UNION ALL
SELECT								'TECH_MANEUVER_WARFARE',					'FLAVOR_NUKE',					            10							UNION ALL
SELECT								'TECH_MANEUVER_WARFARE',					'FLAVOR_OFFENSE',							25							UNION ALL
SELECT								'TECH_MANEUVER_WARFARE',					'FLAVOR_MOBILE',							25						    UNION ALL
SELECT								'TECH_MANEUVER_WARFARE',					'FLAVOR_RANGED',							25							UNION ALL
SELECT								'TECH_MANEUVER_WARFARE',					'FLAVOR_MILITARY_TRAINING',					20							UNION ALL
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_RIFLING',								'FLAVOR_GREAT_PEOPLE',						 8							UNION ALL
SELECT								'TECH_RIFLING',								'FLAVOR_WONDER',							20							UNION ALL
SELECT								'TECH_RIFLING',								'FLAVOR_SCIENCE',							 9							UNION ALL
SELECT								'TECH_RIFLING',								'FLAVOR_PRODUCTION',						 8							UNION ALL
SELECT								'TECH_RIFLING',								'FLAVOR_DEFENSE',							18							UNION ALL
SELECT								'TECH_RIFLING',								'FLAVOR_OFFENSE',							22							UNION ALL
SELECT								'TECH_RIFLING',								'FLAVOR_MOBILE',							18							UNION ALL
SELECT								'TECH_RIFLING',								'FLAVOR_NUKE',							    10							UNION ALL
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_SHELLS',								'FLAVOR_GREAT_PEOPLE',						 7							UNION ALL
SELECT								'TECH_SHELLS',								'FLAVOR_WONDER',							20							UNION ALL
SELECT								'TECH_SHELLS',								'FLAVOR_MILITARY_TRAINING',					16							UNION ALL
SELECT								'TECH_SHELLS',								'FLAVOR_CULTURE',							 8							UNION ALL
SELECT								'TECH_SHELLS',								'FLAVOR_NUKE',							    10							UNION ALL
SELECT								'TECH_SHELLS',								'FLAVOR_RANGED',							18							UNION ALL
SELECT								'TECH_SHELLS',								'FLAVOR_OFFENSE',							16							UNION ALL
SELECT								'TECH_SHELLS',								'FLAVOR_DEFENSE',							20							UNION ALL
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_NAVAL_ARMOR',							'FLAVOR_PRODUCTION',						578							UNION ALL
SELECT								'TECH_NAVAL_ARMOR',							'FLAVOR_NAVAL_RECON',						50							UNION ALL
SELECT								'TECH_NAVAL_ARMOR',							'FLAVOR_NUKE',						        10							UNION ALL
SELECT								'TECH_NAVAL_ARMOR',							'FLAVOR_NAVAL',								45							UNION ALL
SELECT								'TECH_NAVAL_ARMOR',							'FLAVOR_MILITARY_TRAINING',					18							UNION ALL
SELECT								'TECH_NAVAL_ARMOR',							'FLAVOR_NUKE',						        10							UNION ALL
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_MILITARY_TRADITION',					'FLAVOR_WONDER',							20							UNION ALL
SELECT								'TECH_MILITARY_TRADITION',					'FLAVOR_SCIENCE',							 9							UNION ALL
SELECT								'TECH_MILITARY_TRADITION',					'FLAVOR_GREAT_PEOPLE',					     8							UNION ALL
SELECT								'TECH_MILITARY_TRADITION',					'FLAVOR_RECON',					            30							UNION ALL
SELECT								'TECH_MILITARY_TRADITION',					'FLAVOR_MOBILE',							18							UNION ALL
SELECT								'TECH_MILITARY_TRADITION',					'FLAVOR_OFFENSE',							20							UNION ALL
SELECT								'TECH_MILITARY_TRADITION',					'FLAVOR_MILITARY_TRAINING',					579							UNION ALL
SELECT								'TECH_MILITARY_TRADITION',					'FLAVOR_NUKE',					            10							UNION ALL
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_MILITARY_SCIENCE',					'FLAVOR_WONDER',					        20							UNION ALL
SELECT								'TECH_MILITARY_SCIENCE',					'FLAVOR_HAPPINESS',							12							UNION ALL
SELECT								'TECH_MILITARY_SCIENCE',					'FLAVOR_TILE_IMPROVEMENT',					10							UNION ALL
SELECT								'TECH_MILITARY_SCIENCE',					'FLAVOR_GREAT_PEOPLE',						 8							UNION ALL
SELECT								'TECH_MILITARY_SCIENCE',					'FLAVOR_PRODUCTION',						 6							UNION ALL
SELECT								'TECH_MILITARY_SCIENCE',					'FLAVOR_MILITARY_TRAINING',					26							UNION ALL
SELECT								'TECH_MILITARY_SCIENCE',					'FLAVOR_WONDER',							14							UNION ALL
SELECT								'TECH_MILITARY_SCIENCE',					'FLAVOR_NUKE',							    10;
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO Technology_Flavors (	TechType,									FlavorType,									Flavor)
--SELECT								'TECH_BOMBARD',								'FLAVOR_CITY_DEFENSE',						50							UNION ALL
--SELECT								'TECH_BOMBARD',								'FLAVOR_RANGED',							24							UNION ALL
--SELECT								'TECH_BOMBARD',								'FLAVOR_OFFENSE',							20							UNION ALL
--SELECT								'TECH_BOMBARD',								'FLAVOR_DEFENSE',							18							UNION ALL
--SELECT								'TECH_BOMBARD',								'FLAVOR_NUKE',							    10							UNION ALL
-----------------------------------------------------------------------------------------------------------------------------------------


-- ELECTRICAL PHENOMENA       !!Stopped adding ai nuke flavor here!!!!!!
-----------------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT								'TECH_GAMBLE', 		                    'FLAVOR_CULTURE',					            20							UNION ALL
SELECT								'TECH_GAMBLE', 		                    'FLAVOR_WONDER',						        20							UNION ALL
SELECT								'TECH_GAMBLE', 		                       'FLAVOR_GOLD',						        20							UNION ALL
SELECT								'TECH_GAMBLE', 						  	  'FLAVOR_HAPPINESS',							20							UNION ALL
SELECT								'TECH_GAMBLE', 								'FLAVOR_EXPANSION',							18							UNION ALL

-----------------------------------------------------------------------------------------------------------------------------------------------------------------



SELECT								'TECH_MASS_MEDIA',						    'FLAVOR_CULTURE',							20							UNION ALL
SELECT								'TECH_MASS_MEDIA',							'FLAVOR_HAPPINESS',							20							UNION ALL
SELECT								'TECH_MASS_MEDIA',							'FLAVOR_EXPANSION',							18							UNION ALL
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_MASS_TRANSIT',					    'FLAVOR_GOLD',						       17							UNION ALL
SELECT								'TECH_MASS_TRANSIT',					    'FLAVOR_WONDER',						   20							UNION ALL
SELECT								'TECH_MASS_TRANSIT',						'FLAVOR_I_SEA_TRADE_ROUTE',				   25							UNION ALL
SELECT								'TECH_MASS_TRANSIT',					    'FLAVOR_I_LAND_TRADE_ROUTE',			   25							UNION ALL
SELECT								'TECH_MASS_TRANSIT',						'FLAVOR_GREAT_PEOPLE',					   12							UNION ALL
SELECT								'TECH_MASS_TRANSIT',					    'FLAVOR_NAVAL',							   22							UNION ALL
SELECT								'TECH_MASS_TRANSIT',						'FLAVOR_AIR',							   22							UNION ALL
SELECT								'TECH_MASS_TRANSIT',						'FLAVOR_MOBILE',						   22							UNION ALL
SELECT								'TECH_MASS_TRANSIT',					    'FLAVOR_EXPANSION',						   20							UNION ALL
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_TREIBSTOFF',					        'FLAVOR_GOLD',						       13							UNION ALL
SELECT								'TECH_TREIBSTOFF',					        'FLAVOR_PRODUCTION',					   16							UNION ALL
SELECT								'TECH_TREIBSTOFF',						    'FLAVOR_I_SEA_TRADE_ROUTE',				   25							UNION ALL
SELECT								'TECH_TREIBSTOFF',					        'FLAVOR_I_LAND_TRADE_ROUTE',			   25							UNION ALL
SELECT								'TECH_TREIBSTOFF',						    'FLAVOR_SCIENCE',					       10							UNION ALL
SELECT								'TECH_TREIBSTOFF',					        'FLAVOR_INFRASTRUCTURE',			       580							UNION ALL
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_ENVIRONMENT',  						'FLAVOR_PRODUCTION',						26							UNION ALL
SELECT								'TECH_ENVIRONMENT',  						'FLAVOR_INFRASTRUCTURE',				   20							UNION ALL
SELECT								'TECH_ENVIRONMENT',  						'FLAVOR_MOBILE',						   20							UNION ALL
SELECT								'TECH_ENVIRONMENT',  					    'FLAVOR_TILE_IMPROVEMENT',				  	20;
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO Technology_Flavors (	TechType,									FlavorType,									Flavor)
SELECT								'TECH_ECO_SYSTEM',  						'FLAVOR_PRODUCTION',				       20							UNION ALL
SELECT								'TECH_ECO_SYSTEM',  						'FLAVOR_SCIENCE',						   20							UNION ALL
SELECT								'TECH_ECO_SYSTEM', 					        'FLAVOR_TILE_IMPROVEMENT',				   20						    UNION ALL
SELECT								'TECH_ECO_SYSTEM',  						'FLAVOR_WONDER',						   18							UNION ALL
SELECT								'TECH_ECO_SYSTEM',   						'FLAVOR_INFRASTRUCTURE',				   20							UNION ALL
-----------------------------------------------------------------------------------------------------------------------------------------------------------------


SELECT								'TECH_MOTION_PICTURES',  					'FLAVOR_CULTURE',				           20							UNION ALL
SELECT								'TECH_MOTION_PICTURES',  					'FLAVOR_WONDER',						   20							UNION ALL
SELECT								'TECH_MOTION_PICTURES', 					'FLAVOR_HAPPINESS',				  	       14						    UNION ALL
SELECT								'TECH_MOTION_PICTURES',  					'FLAVOR_GREAT_PEOPLE',					   16							UNION ALL
-----------------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT								'TECH_WORLD_PROJECTS',  					'FLAVOR_DIPLOMACY',				           25							UNION ALL
SELECT								'TECH_WORLD_PROJECTS', 						'FLAVOR_WONDER',				           20							UNION ALL
SELECT								'TECH_WORLD_PROJECTS',  					'FLAVOR_CULTURE',				           20							UNION ALL
SELECT								'TECH_WORLD_PROJECTS', 						'FLAVOR_HAPPINESS',				           16							UNION ALL
-----------------------------------------------------------------------------------------------------------------------------------------------------------------

	-- AERODYNAMICS--overworked
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_SPACE_TOURISM', 					    'FLAVOR_PRODUCTION',				       20							UNION ALL
SELECT								'TECH_SPACE_TOURISM', 						'FLAVOR_WONDER',				           30							UNION ALL
SELECT								'TECH_SPACE_TOURISM', 					    'FLAVOR_SCIENCE',				           25							UNION ALL
SELECT								'TECH_SPACE_TOURISM',						'FLAVOR_SPACESHIP',				           100							UNION ALL
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_CITYSCAPE',  					        'FLAVOR_GREAT_PEOPLE',				       12							UNION ALL
SELECT								'TECH_CITYSCAPE', 						    'FLAVOR_I_SEA_TRADE_ROUTE',				   581							UNION ALL
SELECT								'TECH_CITYSCAPE',  					        'FLAVOR_I_LAND_TRADE_ROUTE',		       582							UNION ALL
SELECT								'TECH_CITYSCAPE',  					        'FLAVOR_PRODUCTION',				       10							UNION ALL
SELECT								'TECH_CITYSCAPE', 						    'FLAVOR_WONDER',				           20							UNION ALL
SELECT								'TECH_CITYSCAPE',  					        'FLAVOR_CULTURE',				           583							UNION ALL
SELECT								'TECH_CITYSCAPE',						    'FLAVOR_GOLD',				               25							UNION ALL
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_SPACE_RESEARCH', 					    'FLAVOR_GREAT_PEOPLE',				       584							UNION ALL
SELECT								'TECH_SPACE_RESEARCH', 					    'FLAVOR_PRODUCTION',				       20							UNION ALL
SELECT								'TECH_SPACE_RESEARCH', 						'FLAVOR_WONDER',				           20							UNION ALL
SELECT								'TECH_SPACE_RESEARCH', 					    'FLAVOR_SCIENCE',				           25							UNION ALL
SELECT								'TECH_SPACE_RESEARCH',						'FLAVOR_SPACESHIP',				           75							UNION ALL
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_SONAR',        				        'FLAVOR_NAVAL',				               25							UNION ALL
SELECT								'TECH_SONAR',         						'FLAVOR_SCIENCE',				           20							UNION ALL
SELECT								'TECH_SONAR',         					    'FLAVOR_MOBILE',				           35							UNION ALL
SELECT								'TECH_SONAR',        						'FLAVOR_NAVAL_TILE_IMPROVEMENT',		   25							UNION ALL
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_OPPENHEIM',        				    'FLAVOR_CULTURE',				           585							UNION ALL
SELECT								'TECH_OPPENHEIM',         				    'FLAVOR_WONDER',				           20							UNION ALL
SELECT								'TECH_OPPENHEIM',        				    'FLAVOR_GREAT_PEOPLE',				       12							UNION ALL
SELECT								'TECH_OPPENHEIM',         				    'FLAVOR_SCIENCE',				           20							UNION ALL
SELECT								'TECH_OPPENHEIM',         					'FLAVOR_GOLD',				               10							UNION ALL
SELECT								'TECH_OPPENHEIM',        				    'FLAVOR_NUKE',				               13							UNION ALL
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_PLANETARY_NETWORKS',  			    'FLAVOR_GREAT_PEOPLE',				       12							UNION ALL
SELECT								'TECH_PLANETARY_NETWORKS', 				    'FLAVOR_WONDER',				           20							UNION ALL
SELECT								'TECH_PLANETARY_NETWORKS',  			    'FLAVOR_I_LAND_TRADE_ROUTE',			   25							UNION ALL
SELECT								'TECH_PLANETARY_NETWORKS', 				    'FLAVOR_I_SEA_TRADE_ROUTE',				   25							UNION ALL
SELECT								'TECH_PLANETARY_NETWORKS',  				'FLAVOR_SCIENCE',				           18							UNION ALL
SELECT								'TECH_PLANETARY_NETWORKS',				    'FLAVOR_GOLD',				               16							UNION ALL
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_BIOENGINEERING',        				'FLAVOR_GREAT_PEOPLE',				       14							UNION ALL
SELECT								'TECH_BIOENGINEERING',        				'FLAVOR_TILE_IMPROVEMENT',				   10							UNION ALL
SELECT								'TECH_BIOENGINEERING',        				'FLAVOR_WONDER',				           20							UNION ALL
SELECT								'TECH_BIOENGINEERING',        				'FLAVOR_GOLD',				               586							UNION ALL
SELECT								'TECH_BIOENGINEERING',         			    'FLAVOR_SCIENCE',				           587							UNION ALL
SELECT								'TECH_BIOENGINEERING',         			    'FLAVOR_CULTURE',		                   12							UNION ALL
SELECT								'TECH_BIOENGINEERING',        			    'FLAVOR_GROWTH',				           20							UNION ALL
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_CONSUMERISM', 				        'FLAVOR_WONDER',				           20							UNION ALL
SELECT								'TECH_CONSUMERISM',  			            'FLAVOR_I_LAND_TRADE_ROUTE',			   25							UNION ALL
SELECT								'TECH_CONSUMERISM', 				        'FLAVOR_I_SEA_TRADE_ROUTE',				   25							UNION ALL
SELECT								'TECH_CONSUMERISM',  				        'FLAVOR_GREAT_PEOPLE',				       12							UNION ALL
SELECT								'TECH_CONSUMERISM',				            'FLAVOR_GOLD',				               20							UNION ALL
SELECT								'TECH_CONSUMERISM',  				        'FLAVOR_HAPPINESS',				           12							UNION ALL
SELECT								'TECH_CONSUMERISM',				            'FLAVOR_CULTURE',				           13;



-- unsorted...
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO Technology_Flavors (	TechType,									FlavorType,									Flavor)
SELECT								'TECH_ADVANCED_FLIGHT',                      'FLAVOR_I_LAND_TRADE_ROUTE',             25							UNION ALL
SELECT								'TECH_ADVANCED_FLIGHT',                      'FLAVOR_I_LAND_TRADE_ROUTE',             25							UNION ALL
SELECT								'TECH_ADVANCED_FLIGHT',                      'FLAVOR_AIR',                            25							UNION ALL
SELECT								'TECH_ADVANCED_FLIGHT',                      'FLAVOR_ANTIAIR',                        588							UNION ALL
SELECT								'TECH_ADVANCED_FLIGHT',                      'FLAVOR_OFFENSE',                        20							UNION ALL
SELECT								'TECH_ADVANCED_FLIGHT',                      'FLAVOR_MOBILE',                         45							UNION ALL
SELECT								'TECH_ADVANCED_FLIGHT',                      'FLAVOR_DEFENSE',                        589							UNION ALL

-----------------------------------------------------------------------------------------------------------------------------------------------------------------


SELECT								'TECH_BALLISTICS','FLAVOR_OFFENSE',20							UNION ALL
SELECT								'TECH_BALLISTICS','FLAVOR_ANTIAIR',590							UNION ALL
SELECT								'TECH_BALLISTICS','FLAVOR_DEFENSE',20							UNION ALL
-----------------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT								'TECH_COMBUSTION','FLAVOR_OFFENSE',591							UNION ALL
SELECT								'TECH_COMBUSTION','FLAVOR_MOBILE',12							UNION ALL
SELECT								'TECH_COMBUSTION','FLAVOR_NAVAL',592							UNION ALL
-----------------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT								'TECH_PLASTIC','FLAVOR_DEFENSE',20							UNION ALL
SELECT								'TECH_PLASTIC','FLAVOR_SCIENCE',593							UNION ALL
SELECT								'TECH_PLASTIC','FLAVOR_SPACESHIP',594							UNION ALL
-----------------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT								'TECH_ELECTRONICS','FLAVOR_NAVAL',20							UNION ALL
SELECT								'TECH_ELECTRONICS','FLAVOR_OFFENSE',595							UNION ALL
SELECT								'TECH_ELECTRONICS','FLAVOR_AIR_CARRIER',596							UNION ALL
-----------------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT								'TECH_RADAR','FLAVOR_AIR',25							UNION ALL
SELECT								'TECH_RADAR','FLAVOR_ANTIAIR',620							UNION ALL
-----------------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT								'TECH_COMBINED_ARMS','FLAVOR_OFFENSE',20							UNION ALL
SELECT								'TECH_COMBINED_ARMS','FLAVOR_MOBILE',20							UNION ALL
SELECT								'TECH_COMBINED_ARMS','FLAVOR_DEFENSE',621							UNION ALL
-----------------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT								'TECH_ATOMIC_THEORY','FLAVOR_NUKE',35							UNION ALL
SELECT								'TECH_ATOMIC_THEORY','FLAVOR_OFFENSE',20							UNION ALL
-----------------------------------------------------------------------------------------------------------------------------------------------------------------


SELECT								'TECH_ECOLOGY','FLAVOR_PRODUCTION',18							UNION ALL
-----------------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT								'TECH_COMPUTERS','FLAVOR_AIR',622							UNION ALL
SELECT								'TECH_COMPUTERS','FLAVOR_NAVAL',623							UNION ALL
SELECT								'TECH_COMPUTERS','FLAVOR_NUKE',624							UNION ALL
-----------------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT								'TECH_TELECOM','FLAVOR_WONDER',625							UNION ALL
SELECT								'TECH_TELECOM','FLAVOR_DEFENSE',626							UNION ALL
-----------------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT								'TECH_ROCKETRY','FLAVOR_RANGED',20							UNION ALL
SELECT								'TECH_ROCKETRY','FLAVOR_AIR',627							UNION ALL
SELECT								'TECH_ROCKETRY','FLAVOR_MOBILE',628							UNION ALL
SELECT								'TECH_ROCKETRY','FLAVOR_SPACESHIP',40							UNION ALL
-----------------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT								'TECH_LASERS','FLAVOR_OFFENSE',629							UNION ALL
SELECT								'TECH_LASERS','FLAVOR_MOBILE',630							UNION ALL
SELECT								'TECH_LASERS','FLAVOR_AIR',631							UNION ALL
-----------------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT								'TECH_NUCLEAR_FISSION','FLAVOR_NUKE',40							UNION ALL
SELECT								'TECH_NUCLEAR_FISSION','FLAVOR_OFFENSE',632							UNION ALL
SELECT								'TECH_NUCLEAR_FISSION','FLAVOR_PRODUCTION',20							UNION ALL
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_GLOBALIZATION','FLAVOR_CULTURE',17							UNION ALL
SELECT								'TECH_GLOBALIZATION','FLAVOR_GREAT_PEOPLE',632							UNION ALL
SELECT								'TECH_GLOBALIZATION','FLAVOR_I_LAND_TRADE_ROUTE',25							UNION ALL
SELECT								'TECH_GLOBALIZATION','FLAVOR_I_LAND_TRADE_ROUTE',25							UNION ALL
SELECT								'TECH_GLOBALIZATION','FLAVOR_WONDER',30							UNION ALL
SELECT								'TECH_GLOBALIZATION','FLAVOR_DIPLOMACY',60							UNION ALL
-----------------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT								'TECH_ROBOTICS','FLAVOR_NAVAL',14							UNION ALL
SELECT								'TECH_ROBOTICS','FLAVOR_SPACESHIP',35							UNION ALL
-----------------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT								'TECH_SATELLITES','FLAVOR_SCIENCE',16							UNION ALL
SELECT								'TECH_SATELLITES','FLAVOR_WONDER',12							UNION ALL
SELECT								'TECH_SATELLITES','FLAVOR_SPACESHIP',20							UNION ALL
-----------------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT								'TECH_STEALTH','FLAVOR_AIR',20							UNION ALL
-----------------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT								'TECH_MOBILE_TACTICS','FLAVOR_MOBILE',20							UNION ALL
SELECT								'TECH_MOBILE_TACTICS','FLAVOR_DEFENSE',20							UNION ALL
-----------------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT								'TECH_ADVANCED_BALLISTICS','FLAVOR_NUKE',20							UNION ALL
SELECT								'TECH_ADVANCED_BALLISTICS','FLAVOR_SPACESHIP',20							UNION ALL
-----------------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT								'TECH_PARTICLE_PHYSICS','FLAVOR_SPACESHIP',30							UNION ALL
-----------------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT								'TECH_NUCLEAR_FUSION','FLAVOR_OFFENSE',25							UNION ALL
SELECT								'TECH_NUCLEAR_FUSION','FLAVOR_NUKE',634							UNION ALL
-----------------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT								'TECH_NANOTECHNOLOGY','FLAVOR_SPACESHIP',30							UNION ALL
-----------------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT								'TECH_FUTURE_TECH','FLAVOR_SCIENCE',20;
-----------------------------------------------------------------------------------------------------------------------------------------------------------------

--SELECT								'TECH_HERDING','FLAVOR_GROWTH',20							UNION ALL
-----------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO Technology_Flavors (	TechType,									FlavorType,									Flavor)
--SELECT								'TECH_APOTHECARY','FLAVOR_GROWTH',12							UNION ALL
--SELECT								'TECH_APOTHECARY','FLAVOR_GOLD',14							UNION ALL
--SELECT								'TECH_APOTHECARY','FLAVOR_SCIENCE',18							UNION ALL

SELECT								'TECH_LIVESTOCK_DISTRIBUTION','FLAVOR_GROWTH',20							UNION ALL
SELECT								'TECH_LIVESTOCK_DISTRIBUTION','FLAVOR_PRODUCTION',14							UNION ALL
SELECT								'TECH_LIVESTOCK_DISTRIBUTION','FLAVOR_GOLD',13							UNION ALL

SELECT								'TECH_STONE_MASONS','FLAVOR_PRODUCTION',19							UNION ALL
SELECT								'TECH_STONE_MASONS','FLAVOR_GOLD',13							UNION ALL
SELECT								'TECH_STONE_MASONS','FLAVOR_SCIENCE',12							UNION ALL

SELECT								'TECH_REPLACEABLE_PARTS','FLAVOR_PRODUCTION',16							UNION ALL

SELECT								'TECH_COMBUSTION','FLAVOR_PRODUCTION',19							UNION ALL
SELECT								'TECH_COMBUSTION','FLAVOR_TILE_IMPROVEMENT',12							UNION ALL
SELECT								'TECH_COMBUSTION','FLAVOR_MILITARY_TRAINING',16							UNION ALL

SELECT								'TECH_TORPEDOES','FLAVOR_NAVAL',25							UNION ALL
SELECT								'TECH_TORPEDOES','FLAVOR_NAVAL_RECON',18							UNION ALL

SELECT								'TECH_FLIGHT','FLAVOR_OFFENSE',18							UNION ALL
SELECT								'TECH_FLIGHT','FLAVOR_DEFENSE',635							UNION ALL
SELECT								'TECH_FLIGHT','FLAVOR_MILITARY_TRAINING',16							UNION ALL
SELECT								'TECH_FLIGHT','FLAVOR_PRODUCTION',12							UNION ALL

SELECT								'TECH_TRACKED_VEHICLES','FLAVOR_OFFENSE',25							UNION ALL
SELECT								'TECH_TRACKED_VEHICLES','FLAVOR_DEFENSE',636							UNION ALL
SELECT								'TECH_TRACKED_VEHICLES','FLAVOR_MOBILE',17							UNION ALL

SELECT								'TECH_SUBMERSIBLES','FLAVOR_NAVAL',25							UNION ALL
SELECT								'TECH_SUBMERSIBLES','FLAVOR_NAVAL_RECON',17							UNION ALL

SELECT								'TECH_BIG_GUNS_DOCTRINE','FLAVOR_NAVAL',35							UNION ALL

SELECT								'TECH_RADAR','FLAVOR_DEFENSE',18							UNION ALL

SELECT								'TECH_BLITZKRIEG','FLAVOR_MOBILE',45							UNION ALL
SELECT								'TECH_BLITZKRIEG','FLAVOR_OFFENSE',55							UNION ALL

SELECT								'TECH_ALGEBRA','FLAVOR_WONDER',13							UNION ALL
SELECT								'TECH_ALGEBRA','FLAVOR_SCIENCE',637							UNION ALL
SELECT								'TECH_ALGEBRA','FLAVOR_GREAT_PEOPLE',12							UNION ALL

--------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_AGRICULTURAL_SCIENCES',                    'FLAVOR_GROWTH',                 30							UNION ALL
SELECT								'TECH_AGRICULTURAL_SCIENCES',                    'FLAVOR_PRODUCTION',             638							UNION ALL
SELECT								'TECH_AGRICULTURAL_SCIENCES',                    'FLAVOR_GOLD',                   639							UNION ALL
SELECT								'TECH_AGRICULTURAL_SCIENCES',                    'FLAVOR_HAPPINESS',              13							UNION ALL
SELECT								'TECH_AGRICULTURAL_SCIENCES',                    'FLAVOR_TILE_IMPROVEMENT',       20							UNION ALL
SELECT								'TECH_AGRICULTURAL_SCIENCES',                    'FLAVOR_INFRASTRUCTURE',         640							UNION ALL
SELECT								'TECH_AGRICULTURAL_SCIENCES',                    'FLAVOR_SCIENCE',                641							UNION ALL
--------------------------------------------------------------------------------------------------------------------------------------
SELECT								'TECH_PENICILIN','FLAVOR_MILITARY_TRAINING',12							UNION ALL
SELECT								'TECH_PENICILIN','FLAVOR_OFFENSE',13							UNION ALL
SELECT								'TECH_PENICILIN','FLAVOR_DEFENSE',14							UNION ALL

SELECT								'TECH_TELEPHONE','FLAVOR_GOLD',16							UNION ALL
SELECT								'TECH_TELEPHONE','FLAVOR_WONDER',13							UNION ALL
SELECT								'TECH_TELEPHONE','FLAVOR_SCIENCE',13							UNION ALL
SELECT								'TECH_TELEPHONE','FLAVOR_TILE_IMPROVEMENT',11							UNION ALL

SELECT								'TECH_PLASTIC','FLAVOR_HAPPINESS',17							UNION ALL

SELECT								'TECH_POLYTHEISM','FLAVOR_CULTURE',21							UNION ALL
SELECT								'TECH_POLYTHEISM','FLAVOR_WONDER',642							UNION ALL

SELECT								'TECH_MONOTHEISM','FLAVOR_WONDER',13							UNION ALL
SELECT								'TECH_MONOTHEISM','FLAVOR_CULTURE',16							UNION ALL
SELECT								'TECH_MONOTHEISM','FLAVOR_HAPPINESS',20							UNION ALL

--SELECT								--'TECH_HERBAL_SCIENCE','FLAVOR_SCIENCE',18							UNION ALL
--SELECT								--'TECH_HERBAL_SCIENCE','FLAVOR_GOLD',12							UNION ALL
--SELECT								--'TECH_BUREAUCRACY','FLAVOR_GOLD',25							UNION ALL

SELECT								'TECH_NATIONALISM','FLAVOR_HAPPINESS',14							UNION ALL
SELECT								'TECH_NATIONALISM','FLAVOR_TILE_IMPROVEMENT',13							UNION ALL
SELECT								'TECH_NATIONALISM','FLAVOR_CULTURE',13							UNION ALL
SELECT								'TECH_NATIONALISM','FLAVOR_SCIENCE',13							UNION ALL

SELECT								'TECH_MARXISM','FLAVOR_TILE_IMPROVEMENT',10							UNION ALL
SELECT								'TECH_MARXISM','FLAVOR_CULTURE',20							UNION ALL
SELECT								'TECH_MARXISM','FLAVOR_WONDER',13							UNION ALL

SELECT								'TECH_RADIO','FLAVOR_HAPPINESS',25							UNION ALL
SELECT								'TECH_RADIO','FLAVOR_CULTURE',32							UNION ALL
SELECT								'TECH_RADIO','FLAVOR_TILE_IMPROVEMENT',11							UNION ALL

SELECT								'TECH_SOCIALISM','FLAVOR_WONDER',20						UNION ALL
SELECT								'TECH_SOCIALISM','FLAVOR_CULTURE',12							UNION ALL
SELECT								'TECH_SOCIALISM','FLAVOR_ESPIONAGE',18							UNION ALL
SELECT								'TECH_SOCIALISM','FLAVOR_GREAT_PEOPLE',11							UNION ALL
SELECT								'TECH_SOCIALISM','FLAVOR_HAPPINESS',13							UNION ALL
SELECT								'TECH_SOCIALISM','FLAVOR_DIPLOMACY',10							UNION ALL
SELECT								'TECH_SOCIALISM','FLAVOR_INFRASTRUCTURE',12							UNION ALL
SELECT								'TECH_SOCIALISM','FLAVOR_TILE_IMPROVEMENT',12							UNION ALL



SELECT								'TECH_ECOLOGY','FLAVOR_HAPPINESS',30;

