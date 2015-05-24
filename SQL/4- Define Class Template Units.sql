/*

	R.E.D. WWII Edition
	Class template units configuration file
	by Gedemon (2013)

	
	Text are searched in corresponding tables based on UnitKey.
	So those unit initialization files should be loaded after all other tables are filled.
*/


-----------------------------------------------
-- Fill the initialization table
-----------------------------------------------

INSERT INTO UnitConfiguration
	(		UnitKey,			CivKey,		Var,	Name,					fxsxml,						Template,			Nb,		Form,				Scl,	Cbt,	Rgcbt,	Cst,	Mvt,	Imb,	Rng,	Mat,	Pers,	Fuel,	Flag,	Icon,	IcAtl,				FlagAtl,			Sv,				Embark  	)
--		Key Name							Variation						Model file										Figures						Scale			RangedCombat	Move			Range			Pers	FuelCons.		IconIndex					FlagAtlas							Embarked 
--								Nation Name			Unit Name											Template Unit				Formation					Combat			Cost			Immobile		Mat						FlagIndex		IconAtlas								SV Icon

SELECT	'SPECIAL_FORCES',		NULL,		'',		'Special Forces',		'Paratrooper_Generic_v3',	'INFANTRY',			10,		NULL,				NULL,	32,		35,		500,	3,		NULL,	1,		1,		30,		0,		12,		NULL,	NULL,				'WW2_UNIT_FLAGS',	NULL,			NULL	UNION ALL
SELECT	'MECHANIZED_INFANTRY',	NULL,		'',		'Mechanized Infantry',	NULL,						'INFANTRY',			NULL,	'MechInfantry',		NULL,	38,		NULL,	300,	4,		NULL,	NULL,	7,		15,		2,		2,		NULL,	NULL,				'WW2_UNIT_FLAGS',	NULL,			NULL	UNION ALL
SELECT	'LIGHT_TANK',			NULL,		'',		'Light Tank',			'LightTank_Generic',		'TANK',				NULL,	NULL,				0.11,	40,		NULL,	300,	5,		NULL,	NULL,	12,		10,		3,		1,		9,		'WW2_UNIT_ICONS',	'WW2_UNIT_FLAGS',	NULL,			NULL	UNION ALL
SELECT	'CRUISER_TANK',			NULL,		'',		'Cruiser Tank',			'LightTank_Generic',		'TANK',				NULL,	NULL,				NULL,	40,		NULL,	375,	6,		NULL,	NULL,	15,		4,		4,		1,		NULL,	NULL,				'WW2_UNIT_FLAGS',	NULL,			NULL	UNION ALL
SELECT	'LIGHT_INFANTRY_TANK',	NULL,		'',		'Light Infantry Tank',	'LightTank_Generic',		'TANK',				NULL,	NULL,				NULL,	42,		NULL,	300,	3,		NULL,	NULL,	14,		8,		4,		1,		9,		'WW2_UNIT_ICONS',	'WW2_UNIT_FLAGS',	NULL,			NULL	UNION ALL
SELECT	'INFANTRY_TANK',		NULL,		'',		'Infantry Tank',		NULL,						'TANK',				NULL,	NULL,				NULL,	60,		NULL,	375,	2,		NULL,	NULL,	18,		4,		6,		NULL,	NULL,	NULL,				NULL,				NULL,			NULL	UNION ALL
SELECT	'HEAVY_TANK',			NULL,		'',		'Heavy Tank',			'HeavyTank_Generic',		'TANK',				2,		'TwoBigGuns',		NULL,	65,		NULL,	600,	3,		NULL,	NULL,	35,		2,		10,		1,		39,		NULL,				'WW2_UNIT_FLAGS',	NULL,			NULL	UNION ALL
SELECT	'MAIN_BATTLE_TANK',		NULL,		'',		'Main Battle Tank',		'HeavyTank_Generic',		'TANK',				NULL,	NULL,				NULL,	85,		NULL,	420,	6,		NULL,	NULL,	20,		2,		8,		1,		NULL,	NULL,				'WW2_UNIT_FLAGS',	NULL,			NULL	UNION ALL
SELECT	'SUPER_HEAVY_TANK',		NULL,		'',		'Super Heavy Tank',		'HeavyTank_Generic',		'TANK',				1,		'TwoBigGuns',		0.16,	120,	NULL,	950,	2,		NULL,	NULL,	50,		2,		25,		1,		39,		NULL,				'WW2_UNIT_FLAGS',	NULL,			NULL	UNION ALL
SELECT	'LIGHT_TANK_DESTROYER',	NULL,		'',		'Light Tank Destroyer',	'TankDestroyer_Generic',	'TANK',				NULL,	NULL,				NULL,	35,		65,		270,	4,		NULL,	1,		7,		10,		3,		13,		4,		'WW2_UNIT_ICONS',	'WW2_UNIT_FLAGS',	NULL,			NULL	UNION ALL
SELECT	'TANK_DESTROYER',		NULL,		'',		'Tank Destroyer',		'TankDestroyer_Generic',	'TANK',				NULL,	NULL,				NULL,	50,		85,		375,	3,		NULL,	NULL,	12,		4,		5,		13,		0,		'WW2_UNIT_ICONS',	'WW2_UNIT_FLAGS',	NULL,			NULL	UNION ALL
SELECT	'HEAVY_TANK_DESTROYER',	NULL,		'',		'Heavy Tank Destroyer',	'TankDestroyer_Generic',	'TANK',				2,		'TwoBigGuns',		NULL,	85,		125,	650,	2,		NULL,	NULL,	28,		2,		10,		13,		0,		'WW2_UNIT_ICONS',	'WW2_UNIT_FLAGS',	NULL,			NULL	UNION ALL
SELECT	'ASSAULT_GUN',			NULL,		'',		'Assault Gun',			'TankDestroyer_Generic',	'TANK',				NULL,	NULL,				NULL,	50,		NULL,	375,	3,		NULL,	NULL,	18,		2,		5,		29,		0,		'WW2_UNIT_ICONS',	'WW2_UNIT_FLAGS',	NULL,			NULL	UNION ALL
SELECT	'HEAVY_ASSAULT_GUN',	NULL,		'',		'Heavy Assault Gun',	'TankDestroyer_Generic',	'TANK',				2,		'TwoBigGuns',		NULL,	80,		NULL,	660,	2,		NULL,	NULL,	38,		2,		10,		29,		2,		'WW2_UNIT_ICONS',	'WW2_UNIT_FLAGS',	NULL,			NULL	UNION ALL
SELECT	'MOBILE_ARTILLERY',		NULL,		'',		'Mobile Artillery',		NULL,						'ARTILLERY',		NULL,	NULL,				0.11,	16,		30,		340,	4,		NULL,	1,		14,		10,		3,		14,		4,		'WW2_UNIT_ICONS',	'WW2_UNIT_FLAGS',	NULL,			NULL	UNION ALL
SELECT	'MOBILE_AA_GUN',		NULL,		'',		'Mobile AA Gun',		'AntiAircraftGun_Generic',	'ANTI_AIRCRAFT_GUN',NULL,	NULL,				NULL,	16,		40,		325,	4,		NULL,	NULL,	14,		10,		3,		23,		14,		'WW2_UNIT_ICONS',	'WW2_UNIT_FLAGS',	NULL,			NULL	UNION ALL
SELECT	'NAVY_FIGHTER',			NULL,		'',		'Navy Fighter',			NULL,						'FIGHTER',			NULL,	NULL,				NULL,	NULL,	36,		395,	NULL,	NULL,	10,		NULL,	NULL,	NULL,	NULL,	NULL,	NULL,				NULL,				NULL,			1		UNION ALL
SELECT	'FIGHTER_BOMBER',		NULL,		'',		'Fighter-Bomber',		'Fighter_Generic',			'FIGHTER',			NULL,	NULL,				NULL,	NULL,	40,		375,	NULL,	NULL,	10,		NULL,	NULL,	NULL,	NULL,	8,		'WW2_UNIT_ICONS',	NULL,				NULL,			NULL	UNION ALL
SELECT	'HEAVY_FIGHTER',		NULL,		'',		'Heavy Fighter',		NULL,						'FIGHTER',			3,		'HeavyFighterWing',	NULL,	NULL,	45,		390,	NULL,	NULL,	12,		19,		NULL,	8,		NULL,	3,		'WW2_UNIT_ICONS',	NULL,				NULL,			NULL	UNION ALL
SELECT	'JET_FIGHTER',			NULL,		'',		'Jet Fighter',			NULL,						'FIGHTER',			NULL,	NULL,				NULL,	NULL,	70,		450,	NULL,	NULL,	12,		20,		NULL,	12,		NULL,	NULL,	NULL,				NULL,				NULL,			NULL	UNION ALL
SELECT	'ATTACK_AIRCRAFT',		NULL,		'',		'Attack Aircraft',		'AttackAircraft_Generic',	'BOMBER',			6,		'FighterDiamond',	0.07,	NULL,	30,		350,	NULL,	NULL,	8,		12,		NULL,	5,		NULL,	5,		'WW2_UNIT_ICONS',	NULL,				NULL,			NULL	UNION ALL
SELECT	'LIGHT_BOMBER',			NULL,		'',		'Light Bomber',			NULL,						'BOMBER',			NULL,	'HeavyFighterWing',	NULL,	NULL,	40,		400,	NULL,	NULL,	12,		20,		NULL,	8,		NULL,	1,		'WW2_UNIT_ICONS',	NULL,				NULL,			NULL	UNION ALL
SELECT	'NAVY_BOMBER',			NULL,		'',		'Navy Bomber',			'AttackAircraft_Generic',	'BOMBER',			6,		'FighterDiamond',	0.07,	NULL,	30,		370,	NULL,	NULL,	8,		14,		NULL,	5,		NULL,	5,		'WW2_UNIT_ICONS',	NULL,				NULL,			1		UNION ALL
SELECT	'NAVY_LIGHT_BOMBER',	NULL,		'',		'Navy Light Bomber',	'AttackAircraft_Generic',	'BOMBER',			NULL,	'HeavyFighterWing',	NULL,	NULL,	40,		465,	NULL,	NULL,	12,		21,		NULL,	8,		NULL,	1,		'WW2_UNIT_ICONS',	NULL,				NULL,			1		UNION ALL
SELECT	'TORPEDO_BOMBER',		NULL,		'',		'Torpedo Bomber',		'AttackAircraft_Generic',	'BOMBER',			6,		'FighterDiamond',	0.07,	NULL,	30,		375,	NULL,	NULL,	8,		14,		NULL,	5,		NULL,	5,		'WW2_UNIT_ICONS',	NULL,				NULL,			1		UNION ALL
SELECT	'FAST_BOMBER',			NULL,		'',		'Fast Bomber',			NULL,						'BOMBER',			NULL,	'HeavyFighterWing',	NULL,	NULL,	40,		420,	NULL,	NULL,	12,		20,		NULL,	8,		NULL,	1,		'WW2_UNIT_ICONS',	NULL,				NULL,			NULL	UNION ALL
SELECT	'JET_BOMBER',			NULL,		'',		'Jet Bomber',			NULL,						'BOMBER',			NULL,	NULL,				NULL,	NULL,	45,		525,	NULL,	NULL,	14,		25,		NULL,	15,		NULL,	1,		'WW2_UNIT_ICONS',	NULL,				NULL,			NULL	UNION ALL
SELECT	'HEAVY_BOMBER',			NULL,		'',		'Heavy Bomber',			'Bomber_Generic',			'BOMBER',			NULL,	NULL,				NULL,	NULL,	70,		500,	NULL,	NULL,	16,		30,		NULL,	15,		NULL,	42,		NULL,				NULL,				NULL,			NULL	UNION ALL
SELECT	'CRUISER',				NULL,		'',		'Cruiser',				'Cruiser_Generic',			'BATTLESHIP',		NULL,	NULL,				0.105,	45,		30,		435,	6,		NULL,	NULL,	18,		5,		8,		NULL,	10,		'WW2_UNIT_ICONS',	NULL,				NULL,			NULL	UNION ALL
SELECT	'HEAVY_CRUISER',		NULL,		'',		'Heavy Cruiser',		NULL,						'BATTLESHIP',		NULL,	NULL,				NULL,	50,		36,		485,	5,		NULL,	NULL,	20,		6,		10,		NULL,	10,		'WW2_UNIT_ICONS',	NULL,				NULL,			NULL	UNION ALL
SELECT	'DREADNOUGHT',			NULL,		'',		'Dreadnought',			'Dreadnought_Generic',		'BATTLESHIP',		NULL,	NULL,				0.10,	50,		36,		525,	4,		NULL,	NULL,	25,		8,		15,		NULL,	10,		NULL,				NULL,				NULL,			NULL;--	UNION ALL


-----------------------------------------------
-- Make ArtDefine_UnitMemberCombats 
-----------------------------------------------

-- Works for single or multiple figures, with Var being '' in case of single (or first) figure
INSERT OR REPLACE INTO ArtDefine_UnitMemberCombats (UnitMemberType, EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
	SELECT	'ART_DEF_UNIT_MEMBER_' || UnitKey || Var, EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, 
			MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
	FROM ArtDefine_UnitMemberCombats JOIN UnitConfiguration ON  (UnitMemberType = 'ART_DEF_UNIT_MEMBER_' || UnitConfiguration.Template);
	

-----------------------------------------------
-- Make ArtDefine_UnitMemberCombatWeapons 
-----------------------------------------------

INSERT OR REPLACE INTO ArtDefine_UnitMemberCombatWeapons (UnitMemberType, "Index", SubIndex, "ID", VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag, MissTargetSlopRadius)
	SELECT 'ART_DEF_UNIT_MEMBER_' || UnitKey || Var, "Index", SubIndex, ArtDefine_UnitMemberCombatWeapons.ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag, MissTargetSlopRadius
	FROM ArtDefine_UnitMemberCombatWeapons JOIN UnitConfiguration ON (UnitMemberType = 'ART_DEF_UNIT_MEMBER_' || UnitConfiguration.Template);
		
	
-----------------------------------------------
-- Make ArtDefine_UnitMemberInfos 
-----------------------------------------------

-- Use default scale
INSERT OR REPLACE INTO ArtDefine_UnitMemberInfos (Type, Scale, ZOffset, Domain, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag)
	SELECT	'ART_DEF_UNIT_MEMBER_' || UnitKey || Var, Scale, ZOffset, Domain, 
			UnitConfiguration.fxsxml || '.fxsxml', MaterialTypeTag, MaterialTypeSoundOverrideTag
	FROM ArtDefine_UnitMemberInfos JOIN UnitConfiguration ON (Type = 'ART_DEF_UNIT_MEMBER_' || UnitConfiguration.Template AND UnitConfiguration.Scl ISNULL AND UnitConfiguration.fxsxml NOT NULL);

-- Use custom scale
INSERT OR REPLACE INTO ArtDefine_UnitMemberInfos (Type, Scale, ZOffset, Domain, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag)
	SELECT	'ART_DEF_UNIT_MEMBER_' || UnitKey || Var, Scl, ZOffset, Domain, 
			UnitConfiguration.fxsxml || '.fxsxml', MaterialTypeTag, MaterialTypeSoundOverrideTag
	FROM ArtDefine_UnitMemberInfos JOIN UnitConfiguration ON (Type = 'ART_DEF_UNIT_MEMBER_' || UnitConfiguration.Template AND UnitConfiguration.Scl NOT NULL AND UnitConfiguration.fxsxml NOT NULL);
	
-- Use template fsxml
INSERT OR REPLACE INTO ArtDefine_UnitMemberInfos (Type, Scale, ZOffset, Domain, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag)
	SELECT	'ART_DEF_UNIT_MEMBER_' || UnitKey || Var, Scale, ZOffset, Domain, 
			Model, MaterialTypeTag, MaterialTypeSoundOverrideTag
	FROM ArtDefine_UnitMemberInfos JOIN UnitConfiguration ON (Type = 'ART_DEF_UNIT_MEMBER_' || UnitConfiguration.Template AND UnitConfiguration.fxsxml ISNULL);



-----------------------------------------------
-- Make ArtDefine_UnitInfoMemberInfos 
-----------------------------------------------

-- Remove previous entries, if any
DELETE FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType IN (SELECT 'ART_DEF_UNIT_' || UnitKey FROM UnitConfiguration);

-- Use default number of member
INSERT OR REPLACE INTO ArtDefine_UnitInfoMemberInfos (UnitInfoType, UnitMemberInfoType, NumMembers)
	SELECT	'ART_DEF_UNIT_' || UnitKey, 'ART_DEF_UNIT_MEMBER_' || UnitKey || Var, NumMembers
	FROM ArtDefine_UnitInfoMemberInfos JOIN UnitConfiguration ON (UnitConfiguration.Nb ISNULL AND UnitInfoType = 'ART_DEF_UNIT_' || UnitConfiguration.Template);

-- Use custom number of member
INSERT OR REPLACE INTO ArtDefine_UnitInfoMemberInfos (UnitInfoType, UnitMemberInfoType, NumMembers)
	SELECT	'ART_DEF_UNIT_' || UnitKey, 'ART_DEF_UNIT_MEMBER_' || UnitKey || Var, Nb
	FROM UnitConfiguration WHERE (UnitConfiguration.Nb NOT NULL);
	


---------------------------------------------------------
-- Keep only the first entry in config table for each unit type
---------------------------------------------------------

DELETE FROM UnitConfiguration
	WHERE   var <> '';
	

---------------------------------------------------------
-- Make ArtDefine_UnitInfos from remaining unique entries
---------------------------------------------------------

-- Use default formation
INSERT OR REPLACE INTO ArtDefine_UnitInfos (Type,DamageStates,Formation)
	SELECT	'ART_DEF_UNIT_' || UnitKey, DamageStates, Formation
	FROM ArtDefine_UnitInfos JOIN UnitConfiguration
		ON 'ART_DEF_UNIT_' || UnitConfiguration.Template = Type AND UnitConfiguration.Form ISNULL;

-- Use custom formation
INSERT OR REPLACE INTO ArtDefine_UnitInfos (Type,DamageStates,Formation)
	SELECT	'ART_DEF_UNIT_' || UnitKey, DamageStates, Form
	FROM ArtDefine_UnitInfos JOIN UnitConfiguration 
		ON 'ART_DEF_UNIT_' || UnitConfiguration.Template = Type AND UnitConfiguration.Form NOT NULL;


---------------------------------------------------------
-- Unit statistics: First copy all value from base template
---------------------------------------------------------

INSERT INTO Units (Type, Description, Civilopedia, Strategy, Help, Requirements,
					 Combat, RangedCombat, Cost, Moves, Immobile, Range, BaseSightRange, Class, Special, Capture, CombatClass, Domain, CivilianAttackPriority, DefaultUnitAI, Food, NoBadGoodies, RivalTerritory, MilitarySupport, MilitaryProduction, Pillage, Found, FoundAbroad, CultureBombRadius, GoldenAgeTurns, IgnoreBuildingDefense, PrereqResources, Mechanized, Suicide, CaptureWhileEmbarked, PrereqTech, ObsoleteTech, GoodyHutUpgradeUnitClass, HurryCostModifier, AdvancedStartCost, MinAreaSize, AirUnitCap, NukeDamageLevel, WorkRate, NumFreeTechs, RushBuilding, BaseHurry, HurryMultiplier, BaseGold, NumGoldPerEra, SpreadReligion, CombatLimit, RangeAttackOnlyInDomain, RangeAttackIgnoreLOS, RangedCombatLimit, XPValueAttack, XPValueDefense, SpecialCargo, DomainCargo, Conscription, ExtraMaintenanceCost, NoMaintenance, Unhappiness,
					 UnitArtInfo, UnitArtInfoCulturalVariation, UnitArtInfoEraVariation, ProjectPrereq, SpaceshipProject, LeaderPromotion, LeaderExperience, DontShowYields, ShowInPedia, MoveRate, 
					 UnitFlagIconOffset, PortraitIndex, IconAtlas, UnitFlagAtlas, Materiel, Personnel, FuelConsumption, KeyName)
	SELECT	'UNIT_' || UnitKey, Description, Civilopedia, Strategy, Help, Requirements,
					 Combat, RangedCombat, Cost, Moves, Immobile, Range, BaseSightRange, Class, Special, Capture, CombatClass, Domain, CivilianAttackPriority, DefaultUnitAI, Food, NoBadGoodies, RivalTerritory, MilitarySupport, MilitaryProduction, Pillage, Found, FoundAbroad, CultureBombRadius, GoldenAgeTurns, IgnoreBuildingDefense, PrereqResources, Mechanized, Suicide, CaptureWhileEmbarked, PrereqTech, ObsoleteTech, GoodyHutUpgradeUnitClass, HurryCostModifier, AdvancedStartCost, MinAreaSize, AirUnitCap, NukeDamageLevel, WorkRate, NumFreeTechs, RushBuilding, BaseHurry, HurryMultiplier, BaseGold, NumGoldPerEra, SpreadReligion, CombatLimit, RangeAttackOnlyInDomain, RangeAttackIgnoreLOS, RangedCombatLimit, XPValueAttack, XPValueDefense, SpecialCargo, DomainCargo, Conscription, ExtraMaintenanceCost, NoMaintenance, Unhappiness,
			'ART_DEF_UNIT_' || UnitKey, UnitArtInfoCulturalVariation, UnitArtInfoEraVariation, ProjectPrereq, SpaceshipProject, LeaderPromotion, LeaderExperience, DontShowYields, ShowInPedia, MoveRate, 
					 UnitFlagIconOffset, PortraitIndex, IconAtlas, UnitFlagAtlas, Materiel, Personnel, FuelConsumption, UnitKey
	FROM Units JOIN UnitConfiguration ON  (Type = 'UNIT_' || UnitConfiguration.Template);


---------------------------------------------------------
-- Then update each value that is specific to the new template
---------------------------------------------------------

-- Template units define their own classes...
INSERT INTO UnitClasses (Type, Description, MaxGlobalInstances, MaxTeamInstances, MaxPlayerInstances, InstanceCostModifier, DefaultUnit)
	SELECT 'UNITCLASS_' || UnitKey, Description, MaxGlobalInstances, MaxTeamInstances, MaxPlayerInstances, InstanceCostModifier, 'UNIT_' || UnitKey
	FROM UnitClasses JOIN UnitConfiguration ON (Type = 'UNITCLASS_' || UnitConfiguration.Template);
			
UPDATE UnitClasses SET Description = (SELECT Tag FROM Language_en_US WHERE 'TXT_KEY_' || UnitClasses.DefaultUnit = Tag)
			WHERE EXISTS	   (SELECT Tag FROM Language_en_US WHERE 'TXT_KEY_' || UnitClasses.DefaultUnit = Tag);
			
UPDATE UnitClasses SET Description = (SELECT Name FROM UnitConfiguration WHERE 'UNITCLASS_' || UnitConfiguration.UnitKey = UnitClasses.Type)
			WHERE NOT EXISTS   (SELECT Tag FROM Language_en_US WHERE 'TXT_KEY_' || UnitClasses.DefaultUnit = Tag)
			AND EXISTS (SELECT Name FROM UnitConfiguration WHERE 'UNITCLASS_' || UnitConfiguration.UnitKey = UnitClasses.Type AND Name NOT NULL);
	
-- Class
UPDATE Units SET Class = (SELECT 'UNITCLASS_' || UnitKey FROM UnitConfiguration WHERE 'UNIT_' || UnitKey = Type)
			WHERE EXISTS (SELECT 'UNITCLASS_' || UnitKey FROM UnitConfiguration WHERE 'UNIT_' || UnitKey = Type) ;

-- Combat
UPDATE Units SET Combat = (SELECT Cbt FROM UnitConfiguration WHERE 'UNIT_' || UnitConfiguration.UnitKey = Units.Type AND UnitConfiguration.Cbt NOT NULL)
			WHERE EXISTS  (SELECT Cbt FROM UnitConfiguration WHERE 'UNIT_' || UnitConfiguration.UnitKey = Units.Type AND UnitConfiguration.Cbt NOT NULL);

-- Ranged Combat
UPDATE Units SET RangedCombat = (SELECT Rgcbt FROM UnitConfiguration WHERE 'UNIT_' || UnitConfiguration.UnitKey = Units.Type AND UnitConfiguration.Rgcbt NOT NULL)
			WHERE EXISTS        (SELECT Rgcbt FROM UnitConfiguration WHERE 'UNIT_' || UnitConfiguration.UnitKey = Units.Type AND UnitConfiguration.Rgcbt NOT NULL);

-- Cost
UPDATE Units SET Cost =  (SELECT Cst FROM UnitConfiguration WHERE 'UNIT_' || UnitConfiguration.UnitKey = Units.Type AND UnitConfiguration.Cst NOT NULL)
			WHERE EXISTS (SELECT Cst FROM UnitConfiguration WHERE 'UNIT_' || UnitConfiguration.UnitKey = Units.Type AND UnitConfiguration.Cst NOT NULL);

-- Moves
UPDATE Units SET Moves = (SELECT Mvt FROM UnitConfiguration WHERE 'UNIT_' || UnitConfiguration.UnitKey = Units.Type AND UnitConfiguration.Mvt NOT NULL)
			WHERE EXISTS (SELECT Mvt FROM UnitConfiguration WHERE 'UNIT_' || UnitConfiguration.UnitKey = Units.Type AND UnitConfiguration.Mvt NOT NULL);

-- Immobile
UPDATE Units SET Immobile = (SELECT Imb FROM UnitConfiguration WHERE 'UNIT_' || UnitConfiguration.UnitKey = Units.Type AND UnitConfiguration.Imb NOT NULL)
			WHERE EXISTS    (SELECT Imb FROM UnitConfiguration WHERE 'UNIT_' || UnitConfiguration.UnitKey = Units.Type AND UnitConfiguration.Imb NOT NULL);
				
-- Range
UPDATE Units SET Range = (SELECT Rng FROM UnitConfiguration WHERE 'UNIT_' || UnitConfiguration.UnitKey = Units.Type AND UnitConfiguration.Rng NOT NULL)
			WHERE EXISTS (SELECT Rng FROM UnitConfiguration WHERE 'UNIT_' || UnitConfiguration.UnitKey = Units.Type AND UnitConfiguration.Rng NOT NULL);
					
-- UnitFlagIconOffset
UPDATE Units SET UnitFlagIconOffset = (SELECT Flag FROM UnitConfiguration WHERE 'UNIT_' || UnitConfiguration.UnitKey = Units.Type AND UnitConfiguration.Flag NOT NULL)
			WHERE EXISTS			  (SELECT Flag FROM UnitConfiguration WHERE 'UNIT_' || UnitConfiguration.UnitKey = Units.Type AND UnitConfiguration.Flag NOT NULL);
					
-- PortraitIndex
UPDATE Units SET PortraitIndex = (SELECT Icon FROM UnitConfiguration WHERE 'UNIT_' || UnitConfiguration.UnitKey = Units.Type AND UnitConfiguration.Icon NOT NULL)
			WHERE EXISTS		 (SELECT Icon FROM UnitConfiguration WHERE 'UNIT_' || UnitConfiguration.UnitKey = Units.Type AND UnitConfiguration.Icon NOT NULL);
					
-- IconAtlas
UPDATE Units SET IconAtlas = (SELECT IcAtl FROM UnitConfiguration WHERE 'UNIT_' || UnitConfiguration.UnitKey = Units.Type AND UnitConfiguration.IcAtl NOT NULL)
			WHERE EXISTS	 (SELECT IcAtl FROM UnitConfiguration WHERE 'UNIT_' || UnitConfiguration.UnitKey = Units.Type AND UnitConfiguration.IcAtl NOT NULL);
					
-- UnitFlagAtlas
UPDATE Units SET UnitFlagAtlas = (SELECT FlagAtl FROM UnitConfiguration WHERE 'UNIT_' || UnitConfiguration.UnitKey = Units.Type AND UnitConfiguration.FlagAtl NOT NULL)
			WHERE EXISTS		 (SELECT FlagAtl FROM UnitConfiguration WHERE 'UNIT_' || UnitConfiguration.UnitKey = Units.Type AND UnitConfiguration.FlagAtl NOT NULL);

-- Can Embark
UPDATE Units SET Special = (SELECT 'SPECIALUNIT_EMBARKED' FROM UnitConfiguration WHERE 'UNIT_' || UnitConfiguration.UnitKey = Units.Type AND UnitConfiguration.Embark = 1)
			WHERE EXISTS   (SELECT 'SPECIALUNIT_EMBARKED' FROM UnitConfiguration WHERE 'UNIT_' || UnitConfiguration.UnitKey = Units.Type AND UnitConfiguration.Embark = 1);

-- Materiel / HP
UPDATE Units SET Materiel = (SELECT Mat FROM UnitConfiguration WHERE 'UNIT_' || UnitConfiguration.UnitKey = Units.Type AND UnitConfiguration.Mat  NOT NULL)
			WHERE EXISTS	(SELECT Mat FROM UnitConfiguration WHERE 'UNIT_' || UnitConfiguration.UnitKey = Units.Type AND UnitConfiguration.Mat  NOT NULL);

-- Personnel / HP
UPDATE Units SET Personnel = (SELECT Pers FROM UnitConfiguration WHERE 'UNIT_' || UnitConfiguration.UnitKey = Units.Type AND UnitConfiguration.Pers  NOT NULL)
			WHERE EXISTS	 (SELECT Pers FROM UnitConfiguration WHERE 'UNIT_' || UnitConfiguration.UnitKey = Units.Type AND UnitConfiguration.Pers  NOT NULL);
			
-- Fuel consumption
UPDATE Units SET FuelConsumption = (SELECT Fuel FROM UnitConfiguration WHERE 'UNIT_' || UnitConfiguration.UnitKey = Units.Type AND UnitConfiguration.Fuel  NOT NULL)
			WHERE EXISTS	 (SELECT Fuel FROM UnitConfiguration WHERE 'UNIT_' || UnitConfiguration.UnitKey = Units.Type AND UnitConfiguration.Fuel  NOT NULL);

-- Description
UPDATE Units SET Description = (SELECT Tag FROM Language_en_US WHERE 'TXT_KEY_UNIT_' || Units.KeyName = Tag)
			WHERE EXISTS	   (SELECT Tag FROM Language_en_US WHERE 'TXT_KEY_UNIT_' || Units.KeyName = Tag);
			
UPDATE Units SET Description = (SELECT Name FROM UnitConfiguration WHERE 'UNIT_' || UnitConfiguration.UnitKey = Units.Type)
			WHERE NOT EXISTS   (SELECT Tag FROM Language_en_US WHERE 'TXT_KEY_UNIT_' || Units.KeyName = Tag)
			AND EXISTS (SELECT Name FROM UnitConfiguration WHERE 'UNIT_' || UnitConfiguration.UnitKey = Units.Type AND Name NOT NULL);

-- Civilopedia
UPDATE Units SET Civilopedia = (SELECT Tag FROM Language_en_US WHERE 'TXT_KEY_UNIT_PEDIA_' || Units.KeyName  = Tag)
			WHERE EXISTS	   (SELECT Tag FROM Language_en_US WHERE 'TXT_KEY_UNIT_PEDIA_' || Units.KeyName  = Tag);

-- Strategy
UPDATE Units SET Strategy = (SELECT Tag FROM Language_en_US WHERE 'TXT_KEY_UNIT_' || Units.KeyName || '_STRATEGY'  = Tag)
			WHERE EXISTS	(SELECT Tag FROM Language_en_US WHERE 'TXT_KEY_UNIT_' || Units.KeyName || '_STRATEGY'  = Tag);

-- Help
UPDATE Units SET Help =  (SELECT Tag FROM Language_en_US WHERE 'TXT_KEY_UNIT_HELP_' || Units.KeyName  = Tag)
			WHERE EXISTS (SELECT Tag FROM Language_en_US WHERE 'TXT_KEY_UNIT_HELP_' || Units.KeyName  = Tag);

---------------------------------------------------------
-- Fill secondary tables
---------------------------------------------------------
	
INSERT OR REPLACE INTO Unit_AITypes (UnitType, UnitAIType)
	SELECT 'UNIT_' || UnitKey, UnitAIType
	FROM Unit_AITypes JOIN UnitConfiguration ON  (UnitType= 'UNIT_' || UnitConfiguration.Template);
	
INSERT OR REPLACE INTO Unit_Flavors (UnitType, FlavorType, Flavor)
	SELECT 'UNIT_' || UnitKey, FlavorType, Flavor
	FROM Unit_Flavors JOIN UnitConfiguration ON  (UnitType= 'UNIT_' || UnitConfiguration.Template);
	
-- first set the free promotion from master template...
INSERT INTO Unit_FreePromotions (UnitType, PromotionType)
	SELECT 'UNIT_' || UnitKey, PromotionType
	FROM Unit_FreePromotions JOIN UnitConfiguration ON (UnitType= 'UNIT_' || UnitConfiguration.Template);

-- then replace the master template FreePromotion if there is one specific to the class
REPLACE INTO Unit_FreePromotions (UnitType, PromotionType)
	SELECT 'UNIT_' || UnitKey, 'PROMOTION_' || UnitKey
	FROM UnitPromotions JOIN UnitConfiguration ON (UnitPromotions.Type = 'PROMOTION_' || UnitConfiguration.UnitKey);

INSERT INTO Unit_ResourceQuantityRequirements (UnitType, ResourceType, Cost)
	SELECT 'UNIT_' || UnitKey, ResourceType, Cost
	FROM Unit_ResourceQuantityRequirements JOIN UnitConfiguration ON  (UnitType= 'UNIT_' || UnitConfiguration.Template);

INSERT OR REPLACE INTO ArtDefine_StrategicView (StrategicViewType, TileType, Asset)
	SELECT 'ART_DEF_UNIT_' || UnitKey, TileType, Asset
	FROM ArtDefine_StrategicView JOIN UnitConfiguration ON  (StrategicViewType = 'ART_DEF_UNIT_' || UnitConfiguration.Template);	

INSERT INTO Civilization_UnitClassOverrides (CivilizationType, UnitClassType, UnitType)
	SELECT 'CIVILIZATION_' || CivKey, UnitClassType, 'UNIT_' || UnitKey
	FROM Civilization_UnitClassOverrides JOIN UnitConfiguration ON UnitType = 'UNIT_' || UnitConfiguration.Template AND UnitConfiguration.CivKey NOT NULL;
	

--------------------------------------------------------------
-- Update flavors
--------------------------------------------------------------

--INSERT OR REPLACE INTO Unit_Flavors (UnitType, FlavorType, Flavor)	VALUES ('UNIT_PARATROOPER',			'FLAVOR_AIR',			3);
--INSERT OR REPLACE INTO Unit_Flavors (UnitType, FlavorType, Flavor)	VALUES ('UNIT_PARATROOPER',			'FLAVOR_DEFENSE',		7);
--INSERT OR REPLACE INTO Unit_Flavors (UnitType, FlavorType, Flavor)	VALUES ('UNIT_PARATROOPER',			'FLAVOR_OFFENSE',		14);

INSERT OR REPLACE INTO Unit_Flavors (UnitType, FlavorType, Flavor)	VALUES ('UNIT_SPECIAL_FORCES',		'FLAVOR_AIR',			3);
INSERT OR REPLACE INTO Unit_Flavors (UnitType, FlavorType, Flavor)	VALUES ('UNIT_SPECIAL_FORCES',		'FLAVOR_DEFENSE',		7);
INSERT OR REPLACE INTO Unit_Flavors (UnitType, FlavorType, Flavor)	VALUES ('UNIT_SPECIAL_FORCES',		'FLAVOR_OFFENSE',		7);
INSERT OR REPLACE INTO Unit_Flavors (UnitType, FlavorType, Flavor)	VALUES ('UNIT_SPECIAL_FORCES',		'FLAVOR_RECON',			10);

INSERT OR REPLACE INTO Unit_Flavors (UnitType, FlavorType, Flavor)	VALUES ('UNIT_HEAVY_TANK',			'FLAVOR_DEFENSE',		10);
INSERT OR REPLACE INTO Unit_Flavors (UnitType, FlavorType, Flavor)	VALUES ('UNIT_HEAVY_TANK',			'FLAVOR_OFFENSE',		16);
INSERT OR REPLACE INTO Unit_Flavors (UnitType, FlavorType, Flavor)	VALUES ('UNIT_HEAVY_TANK',			'FLAVOR_MOBILE',		8);

INSERT OR REPLACE INTO Unit_Flavors (UnitType, FlavorType, Flavor)	VALUES ('UNIT_LIGHT_TANK',			'FLAVOR_DEFENSE',		7);
INSERT OR REPLACE INTO Unit_Flavors (UnitType, FlavorType, Flavor)	VALUES ('UNIT_LIGHT_TANK',			'FLAVOR_OFFENSE',		10);
INSERT OR REPLACE INTO Unit_Flavors (UnitType, FlavorType, Flavor)	VALUES ('UNIT_LIGHT_TANK',			'FLAVOR_MOBILE',		10);
INSERT OR REPLACE INTO Unit_Flavors (UnitType, FlavorType, Flavor)	VALUES ('UNIT_LIGHT_TANK',			'FLAVOR_RECON',			4);

INSERT OR REPLACE INTO Unit_Flavors (UnitType, FlavorType, Flavor)	VALUES ('UNIT_CRUISER_TANK',		'FLAVOR_DEFENSE',		4);
INSERT OR REPLACE INTO Unit_Flavors (UnitType, FlavorType, Flavor)	VALUES ('UNIT_CRUISER_TANK',		'FLAVOR_OFFENSE',		12);
INSERT OR REPLACE INTO Unit_Flavors (UnitType, FlavorType, Flavor)	VALUES ('UNIT_CRUISER_TANK',		'FLAVOR_MOBILE',		12);
INSERT OR REPLACE INTO Unit_Flavors (UnitType, FlavorType, Flavor)	VALUES ('UNIT_CRUISER_TANK',		'FLAVOR_RECON',			8);

INSERT OR REPLACE INTO Unit_Flavors (UnitType, FlavorType, Flavor)	VALUES ('UNIT_MECHANIZED_INFANTRY',	'FLAVOR_DEFENSE',		12);
INSERT OR REPLACE INTO Unit_Flavors (UnitType, FlavorType, Flavor)	VALUES ('UNIT_MECHANIZED_INFANTRY',	'FLAVOR_OFFENSE',		12);
INSERT OR REPLACE INTO Unit_Flavors (UnitType, FlavorType, Flavor)	VALUES ('UNIT_MECHANIZED_INFANTRY',	'FLAVOR_MOBILE',		4);

INSERT OR REPLACE INTO Unit_Flavors (UnitType, FlavorType, Flavor)	VALUES ('UNIT_INFANTRY_TANK',		'FLAVOR_DEFENSE',		12);
INSERT OR REPLACE INTO Unit_Flavors (UnitType, FlavorType, Flavor)	VALUES ('UNIT_INFANTRY_TANK',		'FLAVOR_OFFENSE',		12);
INSERT OR REPLACE INTO Unit_Flavors (UnitType, FlavorType, Flavor)	VALUES ('UNIT_INFANTRY_TANK',		'FLAVOR_MOBILE',		0);

INSERT OR REPLACE INTO Unit_Flavors (UnitType, FlavorType, Flavor)	VALUES ('UNIT_LIGHT_INFANTRY_TANK',	'FLAVOR_DEFENSE',		11);
INSERT OR REPLACE INTO Unit_Flavors (UnitType, FlavorType, Flavor)	VALUES ('UNIT_LIGHT_INFANTRY_TANK',	'FLAVOR_OFFENSE',		11);
INSERT OR REPLACE INTO Unit_Flavors (UnitType, FlavorType, Flavor)	VALUES ('UNIT_LIGHT_INFANTRY_TANK',	'FLAVOR_MOBILE',		2);

INSERT OR REPLACE INTO Unit_Flavors (UnitType, FlavorType, Flavor)	VALUES ('UNIT_SUPER_HEAVY_TANK',	'FLAVOR_DEFENSE',		4);
INSERT OR REPLACE INTO Unit_Flavors (UnitType, FlavorType, Flavor)	VALUES ('UNIT_SUPER_HEAVY_TANK',	'FLAVOR_OFFENSE',		18);
INSERT OR REPLACE INTO Unit_Flavors (UnitType, FlavorType, Flavor)	VALUES ('UNIT_SUPER_HEAVY_TANK',	'FLAVOR_MOBILE',		1);

INSERT OR REPLACE INTO Unit_Flavors (UnitType, FlavorType, Flavor)	VALUES ('UNIT_LIGHT_TANK_DESTROYER','FLAVOR_DEFENSE',		14);
INSERT OR REPLACE INTO Unit_Flavors (UnitType, FlavorType, Flavor)	VALUES ('UNIT_LIGHT_TANK_DESTROYER','FLAVOR_OFFENSE',		2);
INSERT OR REPLACE INTO Unit_Flavors (UnitType, FlavorType, Flavor)	VALUES ('UNIT_LIGHT_TANK_DESTROYER','FLAVOR_MOBILE',		0);

INSERT OR REPLACE INTO Unit_Flavors (UnitType, FlavorType, Flavor)	VALUES ('UNIT_TANK_DESTROYER',		'FLAVOR_DEFENSE',		16);
INSERT OR REPLACE INTO Unit_Flavors (UnitType, FlavorType, Flavor)	VALUES ('UNIT_TANK_DESTROYER',		'FLAVOR_OFFENSE',		2);
INSERT OR REPLACE INTO Unit_Flavors (UnitType, FlavorType, Flavor)	VALUES ('UNIT_TANK_DESTROYER',		'FLAVOR_MOBILE',		0);

INSERT OR REPLACE INTO Unit_Flavors (UnitType, FlavorType, Flavor)	VALUES ('UNIT_HEAVY_TANK_DESTROYER','FLAVOR_DEFENSE',		18);
INSERT OR REPLACE INTO Unit_Flavors (UnitType, FlavorType, Flavor)	VALUES ('UNIT_HEAVY_TANK_DESTROYER','FLAVOR_OFFENSE',		2);
INSERT OR REPLACE INTO Unit_Flavors (UnitType, FlavorType, Flavor)	VALUES ('UNIT_HEAVY_TANK_DESTROYER','FLAVOR_MOBILE',		0);

INSERT OR REPLACE INTO Unit_Flavors (UnitType, FlavorType, Flavor)	VALUES ('UNIT_ASSAULT_GUN',			'FLAVOR_DEFENSE',		2);
INSERT OR REPLACE INTO Unit_Flavors (UnitType, FlavorType, Flavor)	VALUES ('UNIT_ASSAULT_GUN',			'FLAVOR_OFFENSE',		16);
INSERT OR REPLACE INTO Unit_Flavors (UnitType, FlavorType, Flavor)	VALUES ('UNIT_ASSAULT_GUN',			'FLAVOR_MOBILE',		0);

INSERT OR REPLACE INTO Unit_Flavors (UnitType, FlavorType, Flavor)	VALUES ('UNIT_HEAVY_ASSAULT_GUN',	'FLAVOR_DEFENSE',		2);
INSERT OR REPLACE INTO Unit_Flavors (UnitType, FlavorType, Flavor)	VALUES ('UNIT_HEAVY_ASSAULT_GUN',	'FLAVOR_OFFENSE',		18);
INSERT OR REPLACE INTO Unit_Flavors (UnitType, FlavorType, Flavor)	VALUES ('UNIT_HEAVY_ASSAULT_GUN',	'FLAVOR_MOBILE',		0);

INSERT OR REPLACE INTO Unit_Flavors (UnitType, FlavorType, Flavor)	VALUES ('UNIT_MOBILE_ARTILLERY',	'FLAVOR_MOBILE',		8);

INSERT OR REPLACE INTO Unit_Flavors (UnitType, FlavorType, Flavor)	VALUES ('UNIT_MOBILE_AA_GUN',		'FLAVOR_MOBILE',		8);

-----------------------------------------------
-- Handle special cases
-----------------------------------------------
-- Set Unit AI for Paratrooper
UPDATE Units SET DefaultUnitAI = 'UNITAI_PARADROP' WHERE 'UNIT_PARATROOPER' = Type;

-- Set Unit AI for Special Forces
UPDATE Units SET DefaultUnitAI = 'UNITAI_PARADROP' WHERE 'SPECIAL_FORCES' = Type;

-----------------------------------------------
-- Clear UnitConfiguration for next step
-----------------------------------------------

DELETE FROM UnitConfiguration;

