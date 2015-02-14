INSERT INTO ArtDefine_UnitInfos (Type, DamageStates, Formation)
SELECT	'ART_DEF_UNIT_XENO_TITAN',			3,	'Barbarian'		UNION ALL
SELECT	'ART_DEF_UNIT_BARBALIEN',			1,	'Barbarian'		UNION ALL
SELECT	'ART_DEF_UNIT_AEGIS',				3,	'Barbarian'		UNION ALL
SELECT	'ART_DEF_UNIT_BEMARINE',			1,	'LooseCivilian'		UNION ALL
SELECT	'ART_DEF_UNIT_RANGED_MARINE',		1,	'ThreeBigGuns'		UNION ALL
SELECT	'ART_DEF_UNIT_BECAVALRY',			1,	'ThreeBigGuns'		UNION ALL
SELECT	'ART_DEF_UNIT_NAVAL_FIGHTER',		3,	'FighterWing'		UNION ALL
SELECT	'ART_DEF_UNIT_AIR_FIGHTER',			1,	'FighterWing'		UNION ALL
SELECT	'ART_DEF_UNIT_NAVAL_CARRIER',			1,	'UnFormed'		UNION ALL
SELECT	'ART_DEF_UNIT_RAPTOR_BUG',			1,	'UnFormed'		UNION ALL
SELECT	'ART_DEF_UNIT_BOMBARDIER_BUG',			1,	'TwoBigGuns'		UNION ALL
SELECT	'ART_DEF_UNIT_SIEGE',			1,	'TwoBigGuns'		UNION ALL
SELECT	'ART_DEF_UNIT_SEA_DRAGON',			1,	'TwoBigGuns'		UNION ALL
SELECT	'ART_DEF_UNIT_KRAKEN',			1,	'Barbarian'		UNION ALL
SELECT	'ART_DEF_UNIT_SIEGE_WORM',			1,	'Barbarian'		UNION ALL
SELECT	'ART_DEF_UNIT_BATTLESUIT',			3,	'DefaultMelee'		UNION ALL
SELECT	'ART_DEF_UNIT_LEV_TANK',			3,	'ThreeBigGuns'		UNION ALL
SELECT	'ART_DEF_UNIT_LEV_DESTROYER',			3,	'ThreeBigGuns'		UNION ALL
SELECT	'ART_DEF_UNIT_XENO_SWARM',			1,	'Barbarian'		UNION ALL
SELECT	'ART_DEF_UNIT_XENO_CAVALRY',			1,	'ThreeBigGuns'		UNION ALL
SELECT	'ART_DEF_UNIT_ROCKTOPUS',			1,	'ThreeBigGuns'		UNION ALL
SELECT	'ART_DEF_UNIT_CNDR',			1,	'ThreeBigGuns'		UNION ALL
SELECT	'ART_DEF_UNIT_CARVR',			1,	'ThreeBigGuns'		UNION ALL
SELECT	'ART_DEF_UNIT_SABR',			1,	'ThreeBigGuns'		UNION ALL
SELECT	'ART_DEF_UNIT_ANGEL',			3,	'TwoBigGuns'		UNION ALL
		
SELECT	'ART_DEF_UNIT_ALIEN_FLYER',			3,	'FighterWing';

INSERT INTO ArtDefine_UnitInfoMemberInfos (UnitInfoType, UnitMemberInfoType, NumMembers)
SELECT	'ART_DEF_UNIT_XENO_TITAN',			'ART_DEF_UNIT_MEMBER_XENO_TITAN',			1	UNION ALL
SELECT	'ART_DEF_UNIT_BARBALIEN',			'ART_DEF_UNIT_MEMBER_BARBALIEN',			2   UNION ALL
SELECT	'ART_DEF_UNIT_AEGIS',				'ART_DEF_UNIT_MEMBER_AEGIS',				1   UNION ALL
SELECT	'ART_DEF_UNIT_BEMARINE',			'ART_DEF_UNIT_MEMBER_BEMARINE',				6   UNION ALL
SELECT	'ART_DEF_UNIT_RANGED_MARINE',		'ART_DEF_UNIT_MEMBER_RANGED_MARINE',		3   UNION ALL
SELECT	'ART_DEF_UNIT_BECAVALRY',			'ART_DEF_UNIT_MEMBER_CAVALRY01',			3   UNION ALL
SELECT	'ART_DEF_UNIT_SIEGE',				'ART_DEF_UNIT_MEMBER_SIEGE01',				2   UNION ALL
SELECT	'ART_DEF_UNIT_NAVAL_FIGHTER',		'ART_DEF_UNIT_MEMBER_NAVAL_FIGHTER01',		1   UNION ALL
SELECT	'ART_DEF_UNIT_AIR_FIGHTER',			'ART_DEF_UNIT_MEMBER_AIR_FIGHTER01',		2   UNION ALL
SELECT	'ART_DEF_UNIT_NAVAL_CARRIER',		'ART_DEF_UNIT_MEMBER_NAVAL_CARRIER02',		1   UNION ALL
SELECT	'ART_DEF_UNIT_RAPTOR_BUG',			'ART_DEF_UNIT_MEMBER_RAPTOR_BUG',			1   UNION ALL
SELECT	'ART_DEF_UNIT_BOMBARDIER_BUG',			'ART_DEF_UNIT_MEMBER_BOMBARDIER_BUG',			2   UNION ALL
SELECT	'ART_DEF_UNIT_SEA_DRAGON',			'ART_DEF_UNIT_MEMBER_SEA_DRAGON',			1   UNION ALL
SELECT	'ART_DEF_UNIT_KRAKEN',			'ART_DEF_UNIT_MEMBER_KRAKEN',			1   UNION ALL
SELECT	'ART_DEF_UNIT_SIEGE_WORM',			'ART_DEF_UNIT_MEMBER_SIEGE_WORM',			1   UNION ALL
SELECT	'ART_DEF_UNIT_BATTLESUIT',			'ART_DEF_UNIT_MEMBER_BATTLESUIT_GUARD',			1   UNION ALL
SELECT	'ART_DEF_UNIT_LEV_TANK',			'ART_DEF_UNIT_MEMBER_LEV_TANK',			1   UNION ALL
SELECT	'ART_DEF_UNIT_LEV_DESTROYER',			'ART_DEF_UNIT_MEMBER_LEV_DESTROYER',			1   UNION ALL
SELECT	'ART_DEF_UNIT_XENO_SWARM',			'ART_DEF_UNIT_MEMBER_BARBALIEN',			1   UNION ALL
SELECT	'ART_DEF_UNIT_XENO_CAVALRY',			'ART_DEF_UNIT_MEMBER_XENO_CAVALRY',			3   UNION ALL
SELECT	'ART_DEF_UNIT_ROCKTOPUS',			'ART_DEF_UNIT_MEMBER_ROCKTAPUS',			1   UNION ALL
SELECT	'ART_DEF_UNIT_CNDR',			'ART_DEF_UNIT_MEMBER_CNDR',			3   UNION ALL
SELECT	'ART_DEF_UNIT_CARVR',			'ART_DEF_UNIT_MEMBER_CARVR',			1   UNION ALL
SELECT	'ART_DEF_UNIT_SABR',			'ART_DEF_UNIT_MEMBER_SABR',			1   UNION ALL
SELECT	'ART_DEF_UNIT_ANGEL',			'ART_DEF_UNIT_MEMBER_ANGEL',			1   UNION ALL

SELECT	'ART_DEF_UNIT_ALIEN_FLYER',			'ART_DEF_UNIT_MEMBER_ALIEN_FLYER',  2;

INSERT INTO ArtDefine_UnitMemberCombats (UnitMemberType, EnableActions,																												DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_XENO_TITAN',		'Idle Attack RunCharge AttackCity Death BombardDefend Run Fortify CombatReady Walk AttackCharge',		null,			null,		null,			 null,		   65.0,		 null,				 null,	   null,		  null,		   null,		null,			   null,			  null,		   null,		null,		  null,			null,			null,		  null,			1,					 null,				   null,			   1,				   null,					  null,				    1,				null,						null,			     null,				 null,			     null,						       null,						  null		  UNION ALL
SELECT	'ART_DEF_UNIT_MEMBER_BARBALIEN',		'Idle Attack RunCharge AttackCity Death BombardDefend Run Fortify CombatReady Walk AttackCharge',		null,			null,		null,			 null,		   null,		 null,				 null,	   null,		  null,		   null,		null,			   null,			  null,		   null,		null,		  null,			null,			null,		  null,			1,					 null,				   null,			   1,				   null,					  null,				    1,				null,						null,			     null,				 null,			     null,						       null,						  null		  UNION ALL
SELECT	'ART_DEF_UNIT_MEMBER_AEGIS',			'Idle Attack RunCharge AttackCity Death BombardDefend Run Fortify CombatReady Walk AttackCharge',																																	null,			null,		null,			 null,		   null,		 null,				 null,	   null,		  null,		   null,		null,			   null,			  null,		   null,		null,		  null,			null,			null,		  null,			1,					 null,				   null,			   1,				   null,					  null,				    1,				null,						null,			     null,				 null,			     null,						       null,						  null		  UNION ALL
SELECT	'ART_DEF_UNIT_MEMBER_BEMARINE',			'Idle Attack RunCharge AttackCity Death BombardDefend Run Fortify CombatReady Walk AttackCharge',																													null,			null,		null,			 null,		   null,		 null,				 null,	   null,		  null,		   null,		null,			   null,			  null,		   null,		null,		  null,			null,			null,		  null,			1,					 null,				   null,			   1,				   null,					  null,				    1,				null,						null,			     null,				 null,			     null,						       null,						  null		  UNION ALL
SELECT	'ART_DEF_UNIT_MEMBER_RANGED_MARINE',	'Idle Attack RunCharge AttackCity Death BombardDefend Run Fortify CombatReady Walk AttackCharge',																													null,			null,		null,			 null,		   null,		 null,				 null,	   null,		  null,		   null,		null,			   null,			  null,		   null,		null,		  null,			null,			null,		  null,			1,					 1,						 null,			   1,				   1,					  null,				    1,				null,						null,			     null,				 null,			     null,						       null,						  null		  UNION ALL
SELECT	'ART_DEF_UNIT_MEMBER_CAVALRY01',		'Idle Attack RunCharge AttackCity Death BombardDefend Run Fortify CombatReady Walk AttackCharge',																														null,			null,		null,			 null,		   13.0,		 null,				 null,	   null,		  null,		   null,		null,			   null,			  null,		   null,		null,		  null,			null,			null,		  null,			1,					 1,						 null,			   1,				   1,					  null,				    1,				null,						null,			     null,				 null,			     null,						       null,						  null		  UNION ALL
SELECT	'ART_DEF_UNIT_MEMBER_SIEGE01',			'Idle Attack RunCharge AttackCity Death BombardDefend Run Fortify CombatReady Walk AttackCharge',																															null,			null,		null,			 null,		   14.5,		 200,				 null,	   null,		  null,		   null,		null,			   null,			  null,		   null,		null,		  null,			null,			null,		  null,			1,					 1,						 null,			   1,				   1,					  null,				    1,				null,						null,			     null,				 null,			     null,						       null,						  null		  UNION ALL
SELECT	'ART_DEF_UNIT_MEMBER_NAVAL_FIGHTER01',	'Idle Attack RunCharge AttackCity Death BombardDefend Run Fortify CombatReady Walk AttackCharge',																													null,			null,		null,			 null,		   14.5,		 200,				 null,	   null,		  null,		   null,		null,			   null,			  null,		   null,		null,		  null,			null,			null,		  null,			1,					 1,						 null,			   1,				   1,					  null,				    1,				null,						null,			     null,				 null,			     null,						       null,						  null		  UNION ALL
SELECT	'ART_DEF_UNIT_MEMBER_AIR_FIGHTER01',	'Idle Attack RunCharge AttackCity Death BombardDefend Run Fortify CombatReady Walk AttackCharge',																													null,			null,		null,			 null,		   135.0,		 200,				 2.0,	   null,		  0.25,		   0.5,		    null,			   null,			  null,		   null,		null,		  null,			null,			null,		  null,			1,					 1,						 null,			   1,				   1,					  null,				    1,				null,						null,			     null,				 null,			     null,						       null,						  null		  UNION ALL
SELECT	'ART_DEF_UNIT_MEMBER_NAVAL_CARRIER02',	'Idle Attack RunCharge AttackCity Death BombardDefend Run Fortify CombatReady Walk AttackCharge',																											null,			null,		null,			 null,		   14.5,		 null,				 null,	   null,		  null,		   null,	    null,			   null,			  null,		   null,		null,		  null,			null,			null,		  null,			1,					 null,						 1,			   null,			 null,					  null,				    null,				1,						null,			     null,				 null,			     null,						       null,						  null		  UNION ALL
SELECT	'ART_DEF_UNIT_MEMBER_RAPTOR_BUG',		'Idle Attack RunCharge AttackCity Death BombardDefend Run Fortify CombatReady Walk AttackCharge',																								null,			null,		null,			 null,		   null,		 null,				 null,	   null,		  null,		  null,		    null,			   null,			  null,		   null,		null,		  null,			null,			null,		  null,			null,				 null,					null,			   null,			 null,					  null,				    null,			null,						null,			     null,				 null,			     null,						       null,						  null		  UNION ALL
SELECT	'ART_DEF_UNIT_MEMBER_BOMBARDIER_BUG',	'Idle Attack RunCharge AttackCity Death BombardDefend Run Fortify CombatReady Walk AttackCharge',																							null,			null,		null,			 null,		   null,		 null,				 null,	   null,		  null,		  null,		    null,			   null,			  null,		   null,		null,		  null,			null,			null,		  null,			1,						 1,					null,			   1,				 null,					  null,				    null,			null,						null,			     null,				 null,			     null,						       null,						  null		  UNION ALL
SELECT	'ART_DEF_UNIT_MEMBER_SEA_DRAGON',		'Idle Attack RunCharge AttackCity Death BombardDefend Run Fortify CombatReady Walk AttackCharge',																						    					null,			null,		null,			 null,		   null,		 null,				 null,	   null,		  null,		  null,		    null,			   null,			  null,		   null,		null,		  null,			null,			null,		  null,			1,						 1,					null,			  null,				 null,					  null,				    null,			null,						null,			     null,				 null,			     null,						       null,						  null		  UNION ALL
SELECT	'ART_DEF_UNIT_MEMBER_KRAKEN',			'Idle Attack RunCharge AttackCity Death BombardDefend Run Fortify CombatReady Walk AttackCharge',																												null,			null,		null,			 null,		   null,		 null,				 null,	   null,		  null,		  null,		    null,			   null,			  null,		   null,		null,		  null,			null,			null,		  null,			1,					null,					null,			  null,				 null,					  null,				    null,			null,						null,			     null,				 null,			     null,						       null,						  null		  UNION ALL
SELECT	'ART_DEF_UNIT_MEMBER_SIEGE_WORM',		'Idle Attack RunCharge AttackCity Death BombardDefend Run Fortify CombatReady Walk AttackCharge',																											null,			null,		null,			 null,		   null,		 null,				 null,	   null,		  null,		  null,		    null,			   null,			  null,		   null,		null,		  null,			null,			null,		  null,			null,				null,					null,			  null,				 null,					  null,				    null,			null,						null,			     null,				 null,			     null,						       null,						  null		  UNION ALL
SELECT	'ART_DEF_UNIT_MEMBER_BATTLESUIT_GUARD',	'Idle Attack RunCharge AttackCity Death BombardDefend Run Fortify CombatReady Walk AttackCharge',																										null,			null,		null,			 null,		   null,		 null,				 null,	   null,		  null,		  null,		    null,			   null,			  null,		   null,		null,		  null,			null,			null,		  null,			1,					null,					null,			  null,				 null,					  null,				    1,			null,						null,			     null,				 null,			     null,						       null,						  null		  UNION ALL
SELECT	'ART_DEF_UNIT_MEMBER_LEV_TANK',			'Idle Attack RunCharge AttackCity Death BombardDefend Run Fortify CombatReady Walk AttackCharge',																												null,			null,		null,			 null,		   null,		 null,				 null,	   null,		  null,		  null,		    null,			   null,			  null,		   null,		null,		  null,			null,			null,		  null,			1,					1,						null,			  null,				 null,					  null,				    1,			null,						null,			     null,				 null,			     null,						       null,						  null		  UNION ALL
SELECT	'ART_DEF_UNIT_MEMBER_LEV_DESTROYER',	'Idle Attack RunCharge AttackCity Death BombardDefend Run Fortify CombatReady Walk AttackCharge',																												null,			null,		null,			 null,		   21.0,		 null,				 null,	   null,		  null,		  null,		    null,			   null,			  null,		   null,		null,		  null,			null,			null,		  null,			1,					1,						null,			  null,				 null,					  null,				    1,			null,						null,			     null,				 null,			     null,						       null,						  null		  UNION ALL
SELECT	'ART_DEF_UNIT_MEMBER_XENO_CAVALRY',		'Idle Attack RunCharge AttackCity Death BombardDefend Run Fortify CombatReady Walk AttackCharge',																									null,			null,		null,			 null,		   13.0,		 null,				 null,	   null,		  null,		  null,		    null,			   null,			  null,		   null,		null,		  null,			null,			null,		  null,			1,					null,					null,			  null,				 null,					  null,				    1,			null,						null,			     null,				 null,			     null,						       null,						  null		  UNION ALL
SELECT	'ART_DEF_UNIT_MEMBER_ROCKTAPUS',		'Idle Attack RunCharge AttackCity Death BombardDefend Run Fortify CombatReady Walk AttackCharge',																									null,			null,		null,			 null,		   null,		 null,				 null,	   null,		  null,		  null,		    null,			   null,			  null,		   null,		null,		  null,			null,			null,		  null,			1,					null,					null,			  null,				 null,					  null,				    1,			null,						null,			     null,				 null,			     null,						       null,						  null		  UNION ALL
SELECT	'ART_DEF_UNIT_MEMBER_CNDR',				'Idle Attack RunCharge AttackCity Death BombardDefend Run Fortify CombatReady Walk AttackCharge',																											null,			null,		null,			 null,		   null,		 null,				 null,	   null,		  null,		  null,		    null,			   null,			  null,		   null,		null,		  null,			null,			null,		  null,			1,					null,					null,			  null,				 null,					  null,				    1,			null,						null,			     null,				 null,			     null,						       null,						  null		  UNION ALL
SELECT	'ART_DEF_UNIT_MEMBER_CARVR',			'Idle Attack RunCharge AttackCity Death BombardDefend Run Fortify CombatReady Walk AttackCharge',																														null,			null,		null,			 null,		   null,		 null,				 null,	   null,		  null,		  null,		    null,			   null,			  null,		   null,		null,		  null,			null,			null,		  null,			1,					null,					null,			  null,				 null,					  null,				    1,			null,						null,			     null,				 null,			     null,						       null,						  null		  UNION ALL
SELECT	'ART_DEF_UNIT_MEMBER_SABR',				'Idle Attack RunCharge AttackCity Death BombardDefend Run Fortify CombatReady Walk AttackCharge',																															null,			null,		null,			 null,		   21.0,		 235,				 null,	   null,		  null,		  null,		    null,			   null,			  null,		   null,		null,		  null,			null,			null,		  null,			1,					null,					null,			  null,				 null,					  null,				    1,			null,						null,			     null,				 null,			     null,						       null,						  null		  UNION ALL
SELECT	'ART_DEF_UNIT_MEMBER_ANGEL',			'Idle Attack RunCharge AttackCity Death BombardDefend Run Fortify CombatReady Walk AttackCharge',																										null,			null,		null,			 null,		   20.0,		 null,				 null,	   null,		  null,		  null,		    null,			   null,			  null,		   null,		null,		  null,			null,			null,		  null,			1,					1,						null,			  1,				 null,					  null,				    1,			null,						null,			     null,				 null,			     null,						       null,						  null		  UNION ALL
SELECT	'ART_DEF_UNIT_MEMBER_ALIEN_FLYER',		'Idle Attack AttackSurfaceToAir CombatReady',																							null,			null,		null,			 null,		   7.0,			 null,				 null,	   null,		  null,		   null,		null,			   null,			  null,		   null,		null,		  null,			null,			null,		  null,			1,					 1,					   null,			   1,			       null,					  null,				    1,				null,						null,			     null,				 null,			     null,						       null,						  null;


INSERT INTO ArtDefine_UnitMemberCombatWeapons (UnitMemberType, "Index", SubIndex, ID,			VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_XENO_TITAN',						 0,		0,		  null,			50.0,				 100.0,				  null,			 null,					 null,				  null,		  null,			  null,		 null,						 null,			  null,				 null,					null,		  null,			'METAL',			'BLUNT'		 UNION ALL
SELECT	'ART_DEF_UNIT_MEMBER_BARBALIEN',						 0,		0,		  null,			null,				 null,				  null,			 null,					 null,			   	  null,		  null,			  null,	   	 null,						 null,			  null,				 null,					null,		  null,			'METAL',			'CLAW'		 UNION ALL
SELECT	'ART_DEF_UNIT_MEMBER_AEGIS',							 0,		0,		  null,			null,				 null,				  4.0,			 null,					 null,			   	  null,		  null,			  17.0,	   	 null,						 null,			  null,				 null,					1,			  null,			'EXPLOSIVE',		'LASERLG'	 UNION ALL
SELECT	'ART_DEF_UNIT_MEMBER_BEMARINE',							 0,		0,		  null,			null,				 null,				  null,			 null,					 null,			   	  null,		  null,			  15.0,	   	 null,						 null,			  null,				 null,					null,		  null,			'BULLET',			'BULLET'		 UNION ALL
SELECT	'ART_DEF_UNIT_MEMBER_RANGED_MARINE',					 0,		0,		  null,			null,				 null,				  4.0,			 null,					 null,			   	  null,		  null,			  15.0,	   	 null,						 null,			  null,				 null,					1,			  null,			'BULLETHC',		'BULLETHC'	 UNION ALL
SELECT	'ART_DEF_UNIT_MEMBER_CAVALRY01',						 0,		0,		  null,			25.0,				 50.0,				  4.0,			 null,					 null,			   	  null,		  null,			  15.0,	   	 null,						 null,			  null,				 null,					1,			  null,			'EXPLOSIVE',		'BULLETHC'	 UNION ALL
SELECT	'ART_DEF_UNIT_MEMBER_SIEGE01',							 0,		0,		  null,			25.0,				 50.0,				  4.0,			 null,					 null,			   	  null,		  null,			  15.0,	   	 null,						 null,			  null,				 null,					1,			  null,			'BULLETHC',		'BULLET'	 UNION ALL
SELECT	'ART_DEF_UNIT_MEMBER_NAVAL_FIGHTER01',					 0,		0,		  null,			25.0,				 40.0,				  4.0,			 null,					 null,			   	  null,		  null,			  14.0,	   	 null,						 null,			  null,				 null,					1,			  null,			'EXPLOSIVE',		'BULLETHC'	 UNION ALL
SELECT	'ART_DEF_UNIT_MEMBER_AIR_FIGHTER01',					 0,		0,		  'PROJECTILE',	1.0,				 1.0,				  3.0,			 null,					 null,			   	  null,		  null,			  18.0,	   	 null,						 null,			  null,				 null,					1,			  null,			'BULLET',		'BULLETHC'	 UNION ALL
SELECT	'ART_DEF_UNIT_MEMBER_NAVAL_CARRIER02',					 0,		0,		  'PROJECTILE',	25.0,				 50.0,				  null,			 null,					 null,			   	  null,		  null,			  15.0,	   	 null,						 null,			  null,				 null,					1,			  null,			'EXPLOSIVE',		'EXPLOSION200POUND'	 UNION ALL
SELECT	'ART_DEF_UNIT_MEMBER_RAPTOR_BUG',						 0,		0,		  null,			null,				 null,				  null,			 null,					 null,			   	  null,		  null,			  null,	   	 null,						 null,			  null,				 null,					null,			  null,			'METAL',		'CLAW'	 UNION ALL
SELECT	'ART_DEF_UNIT_MEMBER_BOMBARDIER_BUG',					 0,		0,		 null,			25.0,				 50.0,				  null,			 null,					 null,			   	  null,		  null,			  null,	   	 null,						 null,			  null,				 null,					null,			  null,			'METAL',		'ACID'	 UNION ALL
SELECT	'ART_DEF_UNIT_MEMBER_SEA_DRAGON',						 0,		0,		 null,			25.0,				 50.0,				  5.0,			 null,					 null,			   	  null,		  null,			  null,	   	 null,						 null,			  null,				 null,					null,			  null,			'BLUNT',		'BLUNT'	 UNION ALL
SELECT	'ART_DEF_UNIT_MEMBER_KRAKEN',							 0,		0,		 null,			25.0,				 50.0,				  5.0,			 null,					 null,			   	  null,		  null,			  17.0,	   	 null,						 null,			  null,				 null,					1,			  null,			'EXPLOSIVE',		'BLUNT'	 UNION ALL
SELECT	'ART_DEF_UNIT_MEMBER_SIEGE_WORM',						 0,		0,		 null,			null,				 null,				  null,			 null,					 null,			   	  null,		  null,			  null,	   	 null,						 null,			  null,				 null,					null,			  null,			'BLUNT',		'BLUNT'	 UNION ALL
SELECT	'ART_DEF_UNIT_MEMBER_BATTLESUIT_GUARD',					 0,		0,		 null,			null,				 null,				  4.0,			 null,					 null,			   	  null,		  null,			  null,	   	 null,						 null,			  null,				 null,					null,			  null,			'EXPLOSIVE',		'LASERLG'	 UNION ALL
SELECT	'ART_DEF_UNIT_MEMBER_LEV_TANK',							 0,		0,		 null,			25.0,				 50.0,				  4.0,			 null,					 null,			   	  null,		  0.07,			  17.0,	   	 null,						 null,			  null,				 null,					1,			  null,			'EXPLOSIVE',		'EXPLOSION200POUND'	 UNION ALL
SELECT	'ART_DEF_UNIT_MEMBER_LEV_DESTROYER',					 0,		0,		 null,			25.0,				 50.0,				  4.0,			 null,					 null,			   	  null,		  0.1,			  17.0,	   	 null,						 null,			  null,				 null,					1,			  null,			'EXPLOSIVE',		'EXPLOSION200POUND'	 UNION ALL
SELECT	'ART_DEF_UNIT_MEMBER_XENO_CAVALRY',						 0,		0,		 null,			null,				 null,				  4.0,			 null,					 null,			   	  null,		  null,			  null,	   	 null,						 null,			  null,				 null,					1,			  null,			'EXPLOSIVE',		'LASERSM'	 UNION ALL
SELECT	'ART_DEF_UNIT_MEMBER_ROCKTAPUS',						 0,		0,		 null,			null,				 null,				  4.0,			 null,					 null,			   	  null,		  null,			  null,	   	 null,						 null,			  null,				 null,					1,			  null,			'EXPLOSIVE',		'ACID'	 UNION ALL
SELECT	'ART_DEF_UNIT_MEMBER_CNDR',								 0,		0,		 null,			null,				 null,				  4.0,			 null,					 null,			   	  null,		  null,			  null,	   	 null,						 null,			  null,				 null,					1,			  null,			'EXPLOSIVE',		'BULLET'	 UNION ALL
SELECT	'ART_DEF_UNIT_MEMBER_CARVR',							 0,		0,		 null,			null,				 null,				  4.0,			 null,					 null,			   	  null,		  null,			  null,	   	 null,						 null,			  null,				 null,					1,			  null,			'EXPLOSIVE',		'LASERLG'	 UNION ALL
SELECT	'ART_DEF_UNIT_MEMBER_SABR',								 0,		0,		 null,			null,				 null,				  3.7,			 null,					 null,			   	  null,		  0.1,			  null,	   	 null,						 null,			  null,				 null,					null,			  null,			'BULLETHC',		'LASERLG'	 UNION ALL
SELECT	'ART_DEF_UNIT_MEMBER_ANGEL',							 0,		0,		 null,			1.0,				 1.0,				  4.0,			 null,					 null,			   	  null,		  0.11,			  25.0,	   	 null,						 null,			  null,				 null,					null,			  null,			'BULLETHC',		'LASERLG'	 UNION ALL


SELECT	'ART_DEF_UNIT_MEMBER_ALIEN_FLYER',						 0,		0,		  'PROJECTILE',	25.0,				 50.0,				  3,			 null,					 null,				  null,		  null,		      20.0,		 null,						 null,			  null,				 null,					1,		      null,			'EXPLOSIVE',		'EXPLOSION200POUND';

INSERT INTO ArtDefine_UnitMemberInfos (Type,    Scale,		 ZOffset,    Domain,       Model,															 MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_XENO_TITAN',		  0.11,			0,		  null,			'xenos_titan.fxsxml',											'METAL',			'EXOSKELETON'		 UNION ALL
SELECT	'ART_DEF_UNIT_MEMBER_BARBALIEN',		  0.11,			0,		  null,			'Assets/Units/Barbalien/Barbalien/Barbalien.fxsxml',			'METAL',			'EXOSKELETON'		 UNION ALL
SELECT	'ART_DEF_UNIT_MEMBER_AEGIS',			  0.06,			0,		  null,			'assets/Units/_Purity Units/Aegis/Aegis.fxsxml',				'METAL',			'METALLG'			 UNION ALL
SELECT	'ART_DEF_UNIT_MEMBER_BEMARINE',			  0.1414,		0,		  null,			'Marine01.fxsxml',												'CLOTH',			'FLESH'				 UNION ALL
SELECT	'ART_DEF_UNIT_MEMBER_RANGED_MARINE',	  0.1414,		0,		  null,			'RangedMarine01.fxsxml',										'CLOTH',			'FLESH'			 UNION ALL
SELECT	'ART_DEF_UNIT_MEMBER_CAVALRY01',			 0.13,		0,		  null,			'Assets/Units/Cavalry/Cavalry01/Cavalry01.fxsxml',				'METAL',			'METAL'			 UNION ALL
SELECT	'ART_DEF_UNIT_MEMBER_SIEGE01',				 0.13,		0,		  null,			'Assets/Units/Siege/Siege01/Siege01.fxsxml',					'METAL',			'METAL'			 UNION ALL
SELECT	'ART_DEF_UNIT_MEMBER_NAVAL_FIGHTER01',		 0.15,		0,		  null,			'Assets/Units/Naval_Fighter/Naval_Fighter01/Naval_Fighter01.fxsxml',	'METAL',			'METAL'			 UNION ALL
SELECT	'ART_DEF_UNIT_MEMBER_AIR_FIGHTER01',		 0.09,		0,		  null,			'Assets/Units/Air_Fighter/Air_Fighter01.fxsxml',	'METAL',			'METAL'			 UNION ALL
SELECT	'ART_DEF_UNIT_MEMBER_NAVAL_CARRIER02',		 0.17,		0,		  null,			'Assets/Units/Naval_Carrier/Naval_Carrier02/Naval_Carrier02.fxsxml',	'METAL',			'METALLG'			 UNION ALL
SELECT	'ART_DEF_UNIT_MEMBER_RAPTOR_BUG',			 0.14,		0,		  null,			'Raptor_Bug.fxsxml',											'METAL',			'EXOSKELETON'			 UNION ALL
SELECT	'ART_DEF_UNIT_MEMBER_BOMBARDIER_BUG',			 0.12,		0,		  null,			'Bombardier_Bug.fxsxml',									'EXOSKELETON',			'EXOSKELETON'			 UNION ALL
SELECT	'ART_DEF_UNIT_MEMBER_SEA_DRAGON',			 0.11,		0,		  null,			'Assets/Units/Barbalien/Sea_Collossus/Sea_Colossus.fxsxml',		'FLESH',			'FLESH'			 UNION ALL
SELECT	'ART_DEF_UNIT_MEMBER_KRAKEN',			 0.05,		0,		  null,			'Assets/Units/Barbalien/Kraken/Kraken.fxsxml',						'METAL',			'FLESH'			 UNION ALL
SELECT	'ART_DEF_UNIT_MEMBER_SIEGE_WORM',			 0.15,		0,		  null,			'Assets/Units/Barbalien/Siege_Worm/Siege_Worm.fxsxml',			'FLESH',			'FLESH'			 UNION ALL
SELECT	'ART_DEF_UNIT_MEMBER_BATTLESUIT_GUARD',			 0.150,		0,		  null,			'Battlesuit_Guard.fxsxml',									'METALSM',			'METALLG'			 UNION ALL
SELECT	'ART_DEF_UNIT_MEMBER_LEV_TANK',					 0.08,		0,		  null,			'Lev_Tank.fxsxml',									'METALSM',			'METALLG'			 UNION ALL
SELECT	'ART_DEF_UNIT_MEMBER_LEV_DESTROYER',					 0.11,		0,		  null,			'Lev_Destroyer.fxsxml',									'METALSM',			'METALLG'			 UNION ALL
SELECT	'ART_DEF_UNIT_MEMBER_XENO_CAVALRY',					 0.14,		0,		  null,		'assets/Units/_Harmony Units/Units/Xenocavalry/Xenocavalry.fxsxml',	'METALSM',		'EXOSKELETON'			 UNION ALL
SELECT	'ART_DEF_UNIT_MEMBER_ROCKTAPUS',					 0.04,		0,		  null,		'Ground_Rocktopus.fxsxml',									'METAL',		'FLESH'			 UNION ALL
SELECT	'ART_DEF_UNIT_MEMBER_CNDR',					 0.17,		0,		  null,		'CNDR.fxsxml',									'METAL',		'METALSM'			 UNION ALL
SELECT	'ART_DEF_UNIT_MEMBER_CARVR',					 0.14,		0,		  null,		'CARVR.fxsxml',									'METAL',		'METALLG'			 UNION ALL
SELECT	'ART_DEF_UNIT_MEMBER_SABR',					 0.10,		0,		  null,		'SABR.fxsxml',									'METAL',		'METALLG'			 UNION ALL
SELECT	'ART_DEF_UNIT_MEMBER_ANGEL',					 0.075,		0,		  null,		'assets/Units/_Supremacy Units/Angel/Angel.fxsxml',									'METAL',		'METALLG'			 UNION ALL





SELECT	'ART_DEF_UNIT_MEMBER_ALIEN_FLYER',		0.135,		0,		  null,			'Assets/Units/Barbalien/Alien_Flyer/Alien_flyer.fxsxml',		'METAL',	    	'EXOSKELETON';

INSERT INTO ArtDefine_StrategicView (StrategicViewType, TileType, Asset)
SELECT	'ART_DEF_UNIT_XENO_TITAN',			'Unit',		'SV_Infantry.dds'		UNION ALL
SELECT	'ART_DEF_UNIT_BARBALIEN',			'Unit',		'SV_Infantry.dds'		UNION ALL
SELECT	'ART_DEF_UNIT_AEGIS',				'Unit',		'SV_Infantry.dds'		UNION ALL
SELECT	'ART_DEF_UNIT_BEMARINE',			'Unit',		'SV_Infantry.dds'		UNION ALL
SELECT	'ART_DEF_UNIT_RANGED_MARINE',				'Unit',		'SV_Infantry.dds'		UNION ALL
SELECT	'ART_DEF_UNIT_BECAVALRY',				'Unit',		'SV_Infantry.dds'		UNION ALL
SELECT	'ART_DEF_UNIT_SIEGE',				'Unit',		'SV_Infantry.dds'		UNION ALL
SELECT	'ART_DEF_UNIT_NAVAL_FIGHTER',				'Unit',		'SV_Infantry.dds'		UNION ALL
SELECT	'ART_DEF_UNIT_AIR_FIGHTER',				'Unit',		'SV_Infantry.dds'		UNION ALL
SELECT	'ART_DEF_UNIT_NAVAL_CARRIER',				'Unit',		'SV_Infantry.dds'		UNION ALL
SELECT	'ART_DEF_UNIT_RAPTOR_BUG',				'Unit',		'SV_Infantry.dds'		UNION ALL
SELECT	'ART_DEF_UNIT_BOMBARDIER_BUG',				'Unit',		'SV_Infantry.dds'		UNION ALL
SELECT	'ART_DEF_UNIT_SEA_DRAGON',				'Unit',		'SV_Infantry.dds'		UNION ALL
SELECT	'ART_DEF_UNIT_KRAKEN',				'Unit',		'SV_Infantry.dds'		UNION ALL
SELECT	'ART_DEF_UNIT_SIEGE_WORM',				'Unit',		'SV_Infantry.dds'		UNION ALL
SELECT	'ART_DEF_UNIT_BATTLESUIT',				'Unit',		'SV_Infantry.dds'		UNION ALL
SELECT	'ART_DEF_UNIT_LEV_TANK',				'Unit',		'SV_Infantry.dds'		UNION ALL
SELECT	'ART_DEF_UNIT_LEV_DESTROYER',				'Unit',		'SV_Infantry.dds'		UNION ALL
SELECT	'ART_DEF_UNIT_XENO_SWARM',				'Unit',		'SV_Infantry.dds'		UNION ALL
SELECT	'ART_DEF_UNIT_XENO_CAVALRY',				'Unit',		'SV_Infantry.dds'		UNION ALL
SELECT	'ART_DEF_UNIT_ROCKTOPUS',				'Unit',		'SV_Infantry.dds'		UNION ALL
SELECT	'ART_DEF_UNIT_CNDR',				'Unit',		'SV_Infantry.dds'		UNION ALL
SELECT	'ART_DEF_UNIT_CARVR',				'Unit',		'SV_Infantry.dds'		UNION ALL
SELECT	'ART_DEF_UNIT_SABR',				'Unit',		'SV_Infantry.dds'		UNION ALL
SELECT	'ART_DEF_UNIT_ANGEL',				'Unit',		'SV_Infantry.dds'		UNION ALL




SELECT	'ART_DEF_UNIT_ALIEN_FLYER',			'Unit',		'SV_Infantry.dds';