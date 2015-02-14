--------------------------------------------------------------------------------------------------
DELETE FROM Resource_YieldChanges WHERE ResourceType = 'RESOURCE_TRUFFLES';
DELETE FROM Resource_YieldChanges WHERE ResourceType = 'RESOURCE_SPICES';
DELETE FROM Resource_YieldChanges WHERE ResourceType = 'RESOURCE_SUGAR';
DELETE FROM Resource_YieldChanges WHERE ResourceType = 'RESOURCE_SILK';
DELETE FROM Resource_YieldChanges WHERE ResourceType = 'RESOURCE_IRON';
DELETE FROM Resource_YieldChanges WHERE ResourceType = 'RESOURCE_HORSE';
DELETE FROM Resource_YieldChanges WHERE ResourceType = 'RESOURCE_COAL';
DELETE FROM Resource_YieldChanges WHERE ResourceType = 'RESOURCE_OIL';
DELETE FROM Resource_YieldChanges WHERE ResourceType = 'RESOURCE_ALUMINUM';
DELETE FROM Resource_YieldChanges WHERE ResourceType = 'RESOURCE_URANIUM';
DELETE FROM Resource_YieldChanges WHERE ResourceType = 'RESOURCE_WHEAT';
DELETE FROM Resource_YieldChanges WHERE ResourceType = 'RESOURCE_SHEEP';
DELETE FROM Resource_YieldChanges WHERE ResourceType = 'RESOURCE_COW';
DELETE FROM Resource_YieldChanges WHERE ResourceType = 'RESOURCE_DEER';
DELETE FROM Resource_YieldChanges WHERE ResourceType = 'RESOURCE_BANANA';
DELETE FROM Resource_YieldChanges WHERE ResourceType = 'RESOURCE_FISH';
DELETE FROM Resource_YieldChanges WHERE ResourceType = 'RESOURCE_WHALE';
DELETE FROM Resource_YieldChanges WHERE ResourceType = 'RESOURCE_PEARLS';
DELETE FROM Resource_YieldChanges WHERE ResourceType = 'RESOURCE_GEMS';
DELETE FROM Resource_YieldChanges WHERE ResourceType = 'RESOURCE_GOLD';
DELETE FROM Resource_YieldChanges WHERE ResourceType = 'RESOURCE_MARBLE';
DELETE FROM Resource_YieldChanges WHERE ResourceType = 'RESOURCE_SILVER';
DELETE FROM Resource_YieldChanges WHERE ResourceType = 'RESOURCE_IVORY';
DELETE FROM Resource_YieldChanges WHERE ResourceType = 'RESOURCE_FUR';
DELETE FROM Resource_YieldChanges WHERE ResourceType = 'RESOURCE_SPICES';
DELETE FROM Resource_YieldChanges WHERE ResourceType = 'RESOURCE_DYE';
DELETE FROM Resource_YieldChanges WHERE ResourceType = 'RESOURCE_FUR';
DELETE FROM Resource_YieldChanges WHERE ResourceType = 'RESOURCE_COTTON';
DELETE FROM Resource_YieldChanges WHERE ResourceType = 'RESOURCE_INCENSE';
DELETE FROM Resource_YieldChanges WHERE ResourceType = 'RESOURCE_WINE';
DELETE FROM Resource_YieldChanges WHERE ResourceType = 'RESOURCE_JEWELRY';
DELETE FROM Resource_YieldChanges WHERE ResourceType = 'RESOURCE_STONE';
DELETE FROM Resource_YieldChanges WHERE ResourceType = 'RESOURCE_PORCELAIN';
DELETE FROM Resource_YieldChanges WHERE ResourceType = 'RESOURCE_CRAB';
DELETE FROM Resource_YieldChanges WHERE ResourceType = 'RESOURCE_CITRUS';
DELETE FROM Resource_YieldChanges WHERE ResourceType = 'RESOURCE_COPPER';
DELETE FROM Resource_YieldChanges WHERE ResourceType = 'RESOURCE_SALT';
----------------------------------------------------------------------------------------------------------------
INSERT INTO Resource_YieldChanges	(ResourceType,			YieldType,				Yield) VALUES
									('RESOURCE_OAK',		'YIELD_PRODUCTION',		1),
									('RESOURCE_TITANIUM',	'YIELD_PRODUCTION',		1),
									('RESOURCE_ALOE_VERA',	'YIELD_GOLD',			1),
									('RESOURCE_MANGANESE',	'YIELD_PRODUCTION',		1),
									('RESOURCE_TIN',		'YIELD_GOLD',			1),
									('RESOURCE_BERRIES',	'YIELD_FOOD',			1),
									('RESOURCE_FLAX',		'YIELD_GOLD',			1),
									('RESOURCE_COCONUT',	'YIELD_FOOD',			1),
									('RESOURCE_RUBBER',		'YIELD_PRODUCTION',		1),
									('RESOURCE_CACAO',		'YIELD_GOLD',			1),
									('RESOURCE_POPPY',		'YIELD_GOLD',			1),
									('RESOURCE_WOOD',		'YIELD_PRODUCTION',		1),
									('RESOURCE_JADE',		'YIELD_GOLD',			1),
									('RESOURCE_AMBER',		'YIELD_GOLD',			1),
									('RESOURCE_TEA',		'YIELD_GOLD',			1),
									('RESOURCE_TOBACCO',	'YIELD_GOLD',			1),
									('RESOURCE_CORN',		'YIELD_FOOD',			1),
									('RESOURCE_BARLEY',		'YIELD_FOOD',			1);
----------------------------------------------------------------------------------------------------------------
INSERT INTO Resource_YieldChanges	(ResourceType,			YieldType,				Yield) VALUES

									('RESOURCE_OLIVES',		'YIELD_FOOD',			1),
									('RESOURCE_PLATINUM',	'YIELD_GOLD',			1),
									('RESOURCE_HONEY',		'YIELD_FOOD',			1),
									('RESOURCE_HONEY',	    'YIELD_GOLD',			1),	
									('RESOURCE_CIGARS',	    'YIELD_GOLD',			1),
									('RESOURCE_BEER',	    'YIELD_GOLD',			1),	
									('RESOURCE_BEER',	    'YIELD_FOOD',			1),
									('RESOURCE_CHOCOLATE',	'YIELD_FOOD',			1),
									('RESOURCE_CHOCOLATE',	'YIELD_GOLD',			1),		
									('RESOURCE_MANUSCRIPT',	'YIELD_GOLD',			1),
									('RESOURCE_FURNITURE',	 'YIELD_GOLD',			1),
									('RESOURCE_PAINTING',	'YIELD_GOLD',			1),
									('RESOURCE_FURNITURE',	 'YIELD_GOLD',			1),
									('RESOURCE_INFUSIONS',	'YIELD_FOOD',			1),
									('RESOURCE_INFUSIONS',	  'YIELD_GOLD',			1),
									('RESOURCE_SQUID',	     'YIELD_FOOD',          1),
                           			('RESOURCE_MANGO',		'YIELD_FOOD',			1);
----------------------------------------------------------------------------------------------------------------
--INSERT INTO Resource_YieldChanges	(ResourceType,			YieldType,				Yield) VALUES
                  	              
								    --('RESOURCE_APPLE',	    'YIELD_FOOD',			1),
									--('RESOURCE_HONEY',	    'YIELD_FOOD',			1),
									--('RESOURCE_HONEY',	    'YIELD_GOLD',			1);	
								    -- ('RESOURCE_AMBERX',	    'YIELD_GOLD',			1),		
								    --('RESOURCE_JADEX',	    'YIELD_GOLD',			1);

INSERT INTO Resource_YieldChanges	(ResourceType,			YieldType,				Yield) VALUES
	                                ('RESOURCE_SULFUR',	    'YIELD_PRODUCTION',		1),
									('RESOURCE_COCA',	    'YIELD_GOLD',			1),
									('RESOURCE_IRON',	    'YIELD_PRODUCTION',		2),
									('RESOURCE_HORSE',	    'YIELD_GOLD',			1),
									('RESOURCE_HORSE',	    'YIELD_PRODUCTION',		1),
									('RESOURCE_COAL',	    'YIELD_PRODUCTION',		2),
									('RESOURCE_OIL',	    'YIELD_GOLD',			1),
									('RESOURCE_OIL',	    'YIELD_PRODUCTION',		1),
									('RESOURCE_ALUMINUM',	'YIELD_PRODUCTION',		2),
									('RESOURCE_URANIUM',	'YIELD_PRODUCTION',		1),
								    ('RESOURCE_URANIUM',	'YIELD_GOLD',			1),
									('RESOURCE_WHEAT',	    'YIELD_FOOD',			1),
	                                ('RESOURCE_COW',	    'YIELD_FOOD',			1),
									('RESOURCE_SHEEP',	    'YIELD_FOOD',			1),
									('RESOURCE_BANANA',	    'YIELD_FOOD',			1),
									('RESOURCE_DEER',	    'YIELD_FOOD',			1),
								    ('RESOURCE_WHALE',	    'YIELD_FOOD',			1),
									('RESOURCE_FISH',	    'YIELD_FOOD',			1),
	                                ('RESOURCE_WHALE',	    'YIELD_PRODUCTION',		1),
									('RESOURCE_PEARLS',	    'YIELD_GOLD',			2),
		                            ('RESOURCE_GEMS',	    'YIELD_GOLD',			1),
									('RESOURCE_GOLD',	    'YIELD_GOLD',			2),
								    ('RESOURCE_SILVER',	    'YIELD_GOLD',			1),
									('RESOURCE_MARBLE',	    'YIELD_GOLD',			1),
	                                ('RESOURCE_IVORY',	    'YIELD_PRODUCTION',		1),
									('RESOURCE_FUR',	    'YIELD_GOLD',			1),
                                    ('RESOURCE_DYE',	    'YIELD_GOLD',			1),
	                                ('RESOURCE_SPICES',	    'YIELD_GOLD',			1),
                                    ('RESOURCE_SILK',	    'YIELD_GOLD',			1),
	                                ('RESOURCE_SUGAR',	    'YIELD_FOOD',			1),
								    ('RESOURCE_COTTON',	    'YIELD_GOLD',			1),
									('RESOURCE_WINE',	    'YIELD_GOLD',			1);
------------------------------------------------------------------------------------------------------------------
INSERT INTO Resource_YieldChanges	(ResourceType,			YieldType,				Yield) VALUES
                                    ('RESOURCE_INCENSE',	'YIELD_GOLD',			1),
	                                ('RESOURCE_STONE',	    'YIELD_PRODUCTION',		1),
                                    ('RESOURCE_JEWELRY',	'YIELD_GOLD',			1),
	                                ('RESOURCE_PORCELAIN',	'YIELD_GOLD',			1),
									('RESOURCE_CRAB',	    'YIELD_FOOD',			1),
									('RESOURCE_CRAB',	    'YIELD_GOLD',			1),
                                    ('RESOURCE_CITRUS',	    'YIELD_FOOD',			1),
	                                ('RESOURCE_COPPER',	    'YIELD_PRODUCTION',		1),
                                    ('RESOURCE_SALT',	    'YIELD_FOOD',			1),
	                                ('RESOURCE_TRUFFLES',	'YIELD_FOOD',			1),
									('RESOURCE_SQUID',	    'YIELD_FOOD',			1),
	                                ('RESOURCE_COFFEE',	    'YIELD_GOLD',			1),
                                    ('RESOURCE_BISON',	    'YIELD_FOOD',			1);
----------------------------------------------------------------------------------------------------------------								
								
								
								
								
								