INSERT INTO ArtDefine_UnitInfos (Type, DamageStates, Formation)
SELECT	'ART_DEF_UNIT_CAVEMAN',			1,	'Barbarian'		UNION ALL
SELECT	'ART_DEF_UNIT_FIRE_EATER',			1,	'UnFormed'		UNION ALL
SELECT	'ART_DEF_UNIT_SAVAGE',				1,	'Barbarian'		UNION ALL
SELECT	'ART_DEF_UNIT_LABORER',			1,	'LooseCivilian';

INSERT INTO ArtDefine_UnitInfoMemberInfos (UnitInfoType, UnitMemberInfoType, NumMembers)
SELECT	'ART_DEF_UNIT_CAVEMAN',			'ART_DEF_UNIT_MEMBER_BARBARIAN_EURO_ALPHA',			6	UNION ALL
SELECT	'ART_DEF_UNIT_FIRE_EATER',			'ART_DEF_UNIT_MEMBER_FIRE_EATER',			10   UNION ALL
SELECT	'ART_DEF_UNIT_SAVAGE',				'ART_DEF_UNIT_MEMBER_SAVAGE',				6   UNION ALL
SELECT	'ART_DEF_UNIT_LABORER',			'ART_DEF_UNIT_MEMBER_WORKER_EURO',				8;


INSERT INTO ArtDefine_UnitMemberCombats (UnitMemberType, EnableActions,																												DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_FIRE_EATER',		'Idle Attack RunCharge AttackCity Bombard Death BombardDefend Run Fortify CombatReady Walk AttackCharge',												null,			null,		12.0,			  0.35,		   null,		 null,				 null,	   null,		  null,		   null,		null,			   null,			  null,		   null,		null,		  null,			null,			null,		  null,			1,					 1,					  null,				   null,				   1,					  null,				    1,				null,						null,			     null,				 null,			     null,						       null,						  null		  UNION ALL
SELECT	'ART_DEF_UNIT_MEMBER_SAVAGE',			'Idle Attack RunCharge AttackCity Death BombardDefend Run Fortify CombatReady Walk AttackCharge',														null,			null,		12.0,			 0.35,		   null,		 null,				 null,	   null,		  null,		   null,		null,			   null,			  null,		   null,		null,		  null,			null,			null,		  8.0,			1,					 null,				   null,			   null,				   null,					  null,				    1,				null,						null,			     null,				 null,			     null,						       null,						  null;

INSERT INTO ArtDefine_UnitMemberCombatWeapons (UnitMemberType, "Index", SubIndex, ID,			VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_FIRE_EATER',						 0,		0,		  null,			0.0,				 0.0,				  null,			 null,					 null,			   	  null,		  null,			  null,	   	 null,						 null,			  null,				 null,					null,		  null,			'FLAMING_ARROW',			'ARROW'		 UNION ALL
SELECT	'ART_DEF_UNIT_MEMBER_SAVAGE',							 0,		0,		  null,			10.0,				 20.0,				  null,			 null,					 null,			   	  null,		  null,			  null,	   	 null,						 null,			  null,				 null,					null,			  null,			'BLUNT',		'BLUNT';

INSERT INTO ArtDefine_UnitMemberInfos (Type,    Scale,		 ZOffset,    Domain,       Model,																	MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_FIRE_EATER',		  0.135,		0,		  null,			'Scout_Mongol.fxsxml',			'CLOTH',			'FLESH'		 UNION ALL
SELECT	'ART_DEF_UNIT_MEMBER_SAVAGE',			  0.17,			0,		  null,			'civ5_celwa1.fxsxml',				'CLOTH',			'FLESH';

INSERT INTO ArtDefine_StrategicView (StrategicViewType, TileType, Asset)
SELECT	'ART_DEF_UNIT_CAVEMAN',			'Unit',		'sv_caveman.dds'		UNION ALL
SELECT	'ART_DEF_UNIT_FIRE_EATER',			'Unit',		'sv_fireeater.dds'		UNION ALL
SELECT	'ART_DEF_UNIT_SAVAGE',				'Unit',		'sv_savage.dds'		UNION ALL
SELECT	'ART_DEF_UNIT_LABORER',			'Unit',		'sv_worker.dds';