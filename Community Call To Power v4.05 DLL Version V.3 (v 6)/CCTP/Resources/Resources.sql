-- Insert SQL Rules Here 
INSERT INTO Resources	(Type,					Description,							Civilopedia,								Help,										ResourceClassType,				ArtDefineTag,						AltArtDefineTag,					ArtDefineTagHeavy,					AltArtDefineTagHeavy,		TechReveal,						PolicyReveal,				TechCityTrade,					TechObsolete,		AIStopTradingEra,	Happiness,	WonderProductionMod,	WonderProductionModObsoleteEra, StartingResourceQuantity,	Normalize,		AITradeModifier,	AIObjective,	PlacementOrder, ConstAppearance,	MinAreaSize,	MinLatitude,	MaxLatitude,	RandApp1,	RandApp2,	RandApp3,	RandApp4,	Player, TilesPer,	MinLandPercent, GroupRange, GroupRand,	ResourceUsage,	PresentOnAllValidPlots, Area,	Hills,	Flatlands,	NoRiverSide,	OnlyMinorCivs,	IconString,					PortraitIndex,	IconAtlas)
SELECT					'RESOURCE_RUBBER',		'TXT_KEY_RESOURCE_RUBBER',				'TXT_KEY_CIV5_RESOURCE_RUBBER_TEXT',		'TXT_KEY_RESOURCE_RUBBER_HELP',				'RESOURCECLASS_LUXURY',			'ART_DEF_RESOURCE_RUBBER',			null,								null,								null,					'TECH_RUBBER',					'POLICY_COMMERCE',			'TECH_CHEMISTRY',				null,				null,				2,			0,						null,							0,							0,				0,					0,				4,				50,					3,				0,				90,				25,			25,			0,			0,			0,		5,			0,				0,			0,			0,				0,						0,		1,		1,			0,				0,				'[ICON_RUBBER]',			18,				'NEW_RESOURCE_ATLAS'    UNION ALL
SELECT					'RESOURCE_COCONUT',		'TXT_KEY_RESOURCE_COCONUT',				'TXT_KEY_CIV5_RESOURCE_COCONUT_TEXT',		'TXT_KEY_RESOURCE_COCONUT_HELP',			'RESOURCECLASS_LUXURY',			'ART_DEF_RESOURCE_COCONUT',			null,								null,								null,					'TECH_ECONOMY_OF_SCALE',		'POLICY_TRADITION',			'TECH_SAILING',					null,				null,				2,			0,						null,							0,							1,				0,					0,				4,				50,					3,				0,				90,				25,			25,			0,			0,			0,		5,			0,				0,			0,			0,				0,						0,		0,		1,			0,				0,				'[ICON_COCONUT]',			19,				'NEW_RESOURCE_ATLAS' 	UNION ALL
SELECT					'RESOURCE_TEA',			'TXT_KEY_RESOURCE_TEA',					'TXT_KEY_CIV5_RESOURCE_TEA_TEXT',			'TXT_KEY_RESOURCE_TEA_HELP',				'RESOURCECLASS_LUXURY',			'ART_DEF_RESOURCE_TEA',				'ART_DEF_RESOURCE_TEA',				null,								null,					'TECH_AGRICULTURAL_REVOLUTION',	'POLICY_EXPLORATION',		'TECH_SAILING',					null,				null,				2,			0,						null,							0,							0,				0,					0,				3,				50,					3,				0,				90,				25,			25,			0,			0,			0,		5,			0,				0,			0,			0,				0,						0,		1,		1,			0,				0,				'[ICON_TEA]',				17,				'NEW_RESOURCE_ATLAS'	UNION ALL
SELECT					'RESOURCE_FLAX',		'TXT_KEY_RESOURCE_FLAX',				'TXT_KEY_CIV5_RESOURCE_FLAX_TEXT',			'TXT_KEY_RESOURCE_FLAX_HELP',				'RESOURCECLASS_BONUS',			'ART_DEF_RESOURCE_FLAX',			null,								null,								null,					'TECH_SCOUTING',				'POLICY_HONOR',				'TECH_POTTERY',					null,				null,				0,			0,						null,							0,							0,				0,					0,				4,				50,					3,				0,				90,				25,			25,			0,			0,			0,		5,			0,				0,			0,			0,				0,						0,		1,		1,			0,				0,				'[ICON_FLAX]',				10,				'NEW_RESOURCE_ATLAS'	UNION ALL
SELECT					'RESOURCE_BERRIES',		'TXT_KEY_RESOURCE_BERRIES',				'TXT_KEY_CIV5_RESOURCE_BERRIES_TEXT',		'TXT_KEY_RESOURCE_BERRIES_HELP',			'RESOURCECLASS_BONUS',			'ART_DEF_RESOURCE_BERRIES',			null,								null,								null,					'TECH_NATUROPATY',				'POLICY_PIETY',				'TECH_NATUROPATY',			    null,				null,				0,			0,						null,							0,							0,				0,					0,				4,				50,					3,				0,				90,				25,			25,			0,			0,			0,		5,			0,				0,			0,			0,				0,						0,		1,		1,			0,				0,				'[ICON_WILDBERRIES]',		16,				'NEW_RESOURCE_ATLAS'	UNION ALL
SELECT					'RESOURCE_CACAO',		'TXT_KEY_RESOURCE_CACAO',				'TXT_KEY_CIV5_RESOURCE_CACAO_TEXT',			'TXT_KEY_RESOURCE_CACAO_HELP',				'RESOURCECLASS_BONUS',			'ART_DEF_RESOURCE_CACAO',			null,								null,								null,					'TECH_SACRIFICE_CULT',			'POLICY_EXPLORATION',		'TECH_SACRIFICE_CULT',			null,				null,				0,			0,						null,							0,							0,				0,					0,				3,				50,					3,				0,				90,				25,			25,			0,			0,			0,		5,			0,				0,			0,			0,				0,						0,		1,		1,			0,				0,				'[ICON_CACAO]',				15,				'NEW_RESOURCE_ATLAS'	UNION ALL
SELECT					'RESOURCE_TIN',			'TXT_KEY_RESOURCE_TIN',					'TXT_KEY_CIV5_RESOURCE_TIN_TEXT',			'TXT_KEY_RESOURCE_TIN_HELP',				'RESOURCECLASS_BONUS',			'ART_DEF_RESOURCE_TIN',				'ART_DEF_RESOURCE_TIN',				null,								null,					'TECH_COPPER_WORKING',			'POLICY_LIBERTY',			'TECH_MINING',					null,				null,				0,			0,						null,							0,							0,				0,					0,				4,				50,					3,				0,				90,				25,			25,			0,			0,			0,		5,			0,				0,			0,			0,				0,						0,		1,		0,			0,				0,				'[ICON_TIN]',				13,				'NEW_RESOURCE_ATLAS'	UNION ALL
SELECT					'RESOURCE_AMBER',		'TXT_KEY_RESOURCE_AMBER',				'TXT_KEY_CIV5_RESOURCE_AMBER_TEXT',			'TXT_KEY_RESOURCE_AMBER_HELP',				'RESOURCECLASS_BONUS',			'ART_DEF_RESOURCE_AMBER',			null,								null,								null,					'TECH_WOOD_CLEARING',			'POLICY_LIBERTY',			'TECH_MINING',					null,				null,				0,			0,						null,							0,							0,				0,					0,				4,				50,					3,				0,				90,				25,			25,			0,			0,			0,		5,			0,				0,			0,			0,				0,						0,		1,		1,			0,				0,				'[ICON_AMBER]',				9,				'NEW_RESOURCE_ATLAS'	UNION ALL
SELECT					'RESOURCE_MANGANESE',	'TXT_KEY_RESOURCE_MANGANESE',			'TXT_KEY_CIV5_RESOURCE_MANGANESE_TEXT',		'TXT_KEY_RESOURCE_MANGANESE_HELP',			'RESOURCECLASS_BONUS',			'ART_DEF_RESOURCE_MANGANESE',		'ART_DEF_RESOURCE_MANGANESE',		null,								null,					'TECH_AGRICULTURAL_SCIENCES',	'POLICY_COMMERCE',			'TECH_METAL_CASTING',			null,				null,				0,			0,						null,							0,							0,				0,					0,				4,				50,					3,				0,				90,				25,			25,			0,			0,			0,		5,			0,				0,			0,			0,				0,						0,		1,		1,			0,				0,				'[ICON_MANGANESE]',			12,				'NEW_RESOURCE_ATLAS'	UNION ALL
SELECT					'RESOURCE_ALOE_VERA',	'TXT_KEY_RESOURCE_ALOE_VERA',			'TXT_KEY_CIV5_RESOURCE_ALOE_VERA_TEXT',		'TXT_KEY_RESOURCE_ALOE_VERA_HELP',			'RESOURCECLASS_BONUS',			'ART_DEF_RESOURCE_ALOEVERA',		null,								null,								null,					'TECH_AGRICULTURAL_SCIENCES',	'POLICY_PIETY',				'TECH_POTTERY',					null,				null,				0,			0,						null,							0,							0,				0,					0,				4,				50,					3,				0,				90,				25,			25,			0,			0,			0,		5,			0,				0,			0,			0,				0,						0,		1,		1,			0,				0,				'[ICON_ALOEVERA]',			8,				'NEW_RESOURCE_ATLAS'	UNION ALL
SELECT					'RESOURCE_TITANIUM',	'TXT_KEY_RESOURCE_TITANIUM',			'TXT_KEY_CIV5_RESOURCE_TITANIUM_TEXT',		'TXT_KEY_RESOURCE_TITANIUM_HELP',			'RESOURCECLASS_BONUS',			'ART_DEF_RESOURCE_TITANIUM',		'ART_DEF_RESOURCE_TITANIUM_MARSH',	'ART_DEF_RESOURCE_TITANIUM_HEAVY',	null,					'TECH_METALLURGY',				'POLICY_RATIONALISM',		'TECH_COMBINED_ARMS',			null,				null,				0,			0,						null,							0,							0,				0,					0,				4,				50,					3,				0,				90,				25,			25,			0,			0,			0,		5,			0,				0,			0,			0,				0,						0,		1,		1,			0,				0,				'[ICON_TITANIUM]',			11,				'NEW_RESOURCE_ATLAS'	UNION ALL
SELECT					'RESOURCE_POPPY',		'TXT_KEY_RESOURCE_POPPY',				'TXT_KEY_CIV5_RESOURCE_POPPY_TEXT',			'TXT_KEY_RESOURCE_POPPY_HELP',				'RESOURCECLASS_BONUS',			'ART_DEF_RESOURCE_POPPY',			null,								null,								null,					'TECH_AGRICULTURAL_SCIENCES',	'POLICY_COMMERCE',			'TECH_POTTERY',					null,				null,				0,			0,						null,							0,							0,				0,					0,				3,				50,					3,				0,				90,				25,			25,			0,			0,			0,		5,			0,				0,			0,			0,				0,						0,		0,		1,			0,				0,				'[ICON_POPPY]',				6,				'NEW_RESOURCE_ATLAS'	UNION ALL
SELECT					'RESOURCE_COFFEE',		'TXT_KEY_RESOURCE_COFFEE',				'TXT_KEY_CIV5_RESOURCE_COFFEE_TEXT',		'TXT_KEY_RESOURCE_COFFEE_HELP',				'RESOURCECLASS_BONUS',			'ART_DEF_RESOURCE_COFFEE_BEANS',	'ART_DEF_RESOURCE_COFFEE_BEANS',	null,								null,					'TECH_COFFEE_TRADE',			'POLICY_EXPLORATION',		'TECH_COFFEE_TRADE',			null,				null,				0,			0,						null,							0,							0,				0,					0,				3,				50,					3,				0,				90,				25,			25,			0,			0,			0,		5,			0,				0,			0,			0,				0,						0,		1,		0,			0,				0,				'[ICON_COFFEE]',			14,				'NEW_RESOURCE_ATLAS'	UNION ALL
SELECT					'RESOURCE_WOOD',		'TXT_KEY_RESOURCE_WOOD',				'TXT_KEY_CIV5_RESOURCE_WOOD_TEXT',			'TXT_KEY_RESOURCE_WOOD_HELP',				'RESOURCECLASS_BONUS',			'ART_DEF_RESOURCE_WOOD',			null,								null,								null,					'TECH_WOODWORKING',				'POLICY_EXPLORATION',		'TECH_MASONRY',					null,				null,				0,			0,						null,							0,							1,				0,					0,				3,				50,					3,				0,				90,				25,			25,			0,			0,			0,		5,			0,				0,			0,			0,				0,						0,		1,		1,			0,				0,				'[ICON_EXOTICHARDWOOD]',	2,				'NEW_RESOURCE_ATLAS'	UNION ALL
SELECT					'RESOURCE_OAK',			'TXT_KEY_RESOURCE_OAK',					'TXT_KEY_CIV5_RESOURCE_OAK_TEXT',			'TXT_KEY_RESOURCE_OAK_HELP',				'RESOURCECLASS_BONUS',			'ART_DEF_RESOURCE_OAK',				null,								null,								null,					'TECH_WOODWORKING',				'POLICY_HONOR',				'TECH_POTTERY',					null,				null,				0,			0,						null,							3,							0,				0,					0,				4,				50,					3,				0,				90,				25,			25,			0,			0,			0,		5,			0,				0,			0,			0,				0,						0,		1,		1,			0,				0,				'[ICON_OAK]',				7,				'NEW_RESOURCE_ATLAS'	UNION ALL
SELECT					'RESOURCE_MANGO',		'TXT_KEY_RESOURCE_MANGO',				'TXT_KEY_CIV5_RESOURCE_MANGO_TEXT',			'TXT_KEY_RESOURCE_MANGO_HELP',				'RESOURCECLASS_BONUS',			'ART_DEF_RESOURCE_MANGO',			null,								null,								null,					'TECH_FRUITS',					'POLICY_TRADITION',			'TECH_SAILING',					null,				null,				0,			0,						null,							0,							1,				0,					0,				4,				50,					3,				0,				90,				25,			25,			0,			0,			0,		5,			0,				0,			0,			0,				0,						0,		0,		1,			0,				0,				'[ICON_MANGO]',				3,				'NEW_RESOURCE_ATLAS'	UNION ALL
SELECT					'RESOURCE_BARLEY',		'TXT_KEY_RESOURCE_BARLEY',				'TXT_KEY_CIV5_RESOURCE_BARLEY_TEXT',		'TXT_KEY_RESOURCE_BARLEY_HELP',				'RESOURCECLASS_BONUS',			'ART_DEF_RESOURCE_BARLEY',			null,								null,								null,					'TECH_AGRICULTURE',				'POLICY_TRADITION',			'TECH_POTTERY',					null,				null,				0,			0,						null,							0,							0,				0,					0,				4,				50,					3,				0,				90,				25,			25,			0,			0,			0,		5,			0,				0,			0,			0,				0,						0,		1,		1,			0,				0,				'[ICON_BARLEY]',			4,				'NEW_RESOURCE_ATLAS'	UNION ALL
SELECT					'RESOURCE_CORN',		'TXT_KEY_RESOURCE_CORN',				'TXT_KEY_CIV5_RESOURCE_CORN_TEXT',			'TXT_KEY_RESOURCE_CORN_HELP',				'RESOURCECLASS_BONUS',			'ART_DEF_RESOURCE_CORN',			null,								null,								null,					'TECH_AGRICULTURE',				'POLICY_TRADITION',			'TECH_POTTERY',					null,				null,				0,			0,						null,							0,							0,				0,					0,				4,				50,					3,				0,				90,				25,			25,			0,			0,			0,		5,			0,				0,			0,			0,				0,						0,		1,		1,			0,				0,				'[ICON_CORN]',				21,				'NEW_RESOURCE_ATLAS'	UNION ALL
SELECT					'RESOURCE_TOBACCO',		'TXT_KEY_RESOURCE_TOBACCO',				'TXT_KEY_CIV5_RESOURCE_TOBACCO_TEXT',		'TXT_KEY_RESOURCE_TOBACCO_HELP',			'RESOURCECLASS_BONUS',			'ART_DEF_RESOURCE_TOBACCO',			null,								null,								null,					'TECH_TOBACCO_TRADING',			'POLICY_COMMERCE',			'TECH_POTTERY',					null,				null,				0,			0,						null,							0,							0,				0,					0,				3,				50,					3,				0,				90,				25,			25,			0,			0,			0,		5,			0,				0,			0,			0,				0,						0,		0,		1,			0,				0,				'[ICON_TOBACCO]',			5,				'NEW_RESOURCE_ATLAS'	UNION ALL
SELECT					'RESOURCE_HONEY',	    'TXT_KEY_RESOURCE_HONEY',		 	    'TXT_KEY_CIV5_RESOURCE_HONEY_TEXT',			'TXT_KEY_RESOURCE_HONEY_HELP',				'RESOURCECLASS_LUXURY',			'ART_DEF_RESOURCE_HONEY',			null,				                null,								null,					'TECH_CEREMONIAL_DANCE',		'POLICY_HONOR',	        'TECH_CEREMONIAL_DANCE',			null,				null,				2,			0,						null,							0,							0,				0,					0,				3,				50,					3,				0,				90,				25,			25,			0,			0,			0,		5,			0,				0,			0,			0,				0,						0,		1,		1,			0,				0,				'[ICON_RES_HONEY]',			0,				'HONEY_ATLAS'			UNION ALL
SELECT					'RESOURCE_JADE',		'TXT_KEY_RESOURCE_JADE',				'TXT_KEY_CIV5_RESOURCE_JADE_TEXT',			'TXT_KEY_RESOURCE_JADE_HELP',				'RESOURCECLASS_BONUS',			'ART_DEF_RESOURCE_JADE',			'ART_DEF_RESOURCE_JADE',			null,								null,					'TECH_RAW_MATERIALS',			'POLICY_COMMERCE',			'TECH_MASONRY',					null,				null,				0,			0,						null,							0,							0,				0,					0,				3,				50,					3,				0,				90,				25,			25,			0,			0,			0,		5,			0,				0,			0,			0,				0,						0,		1,		1,			0,				0,				'[ICON_JADE]',				20,				'NEW_RESOURCE_ATLAS';

