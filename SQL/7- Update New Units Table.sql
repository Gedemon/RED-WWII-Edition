/*

	R.E.D. WWII Edition
	Units configuration file
	by Gedemon (2013)

	Last table.

	It use the info stocked in the UnitConfiguration table to make all the entries on the various unit tables.
	When a model is used multiple times, it will be added once in table with unique ID, only the required table will be updated.

*/


-----------------------------------------------
-- Make ArtDefine_UnitMemberCombats 
-----------------------------------------------

-- Works for single or multiple figures, with Var being '' in case of single (or first) figure
INSERT OR REPLACE INTO ArtDefine_UnitMemberCombats (UnitMemberType, EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
	SELECT	'ART_DEF_UNIT_MEMBER_' || UnitKey || Var, EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, 
			MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
	FROM ArtDefine_UnitMemberCombats JOIN UnitConfiguration ON  (UnitMemberType = 'ART_DEF_UNIT_MEMBER_' || UnitConfiguration.Template AND Var <> '_LTD');
	
-- Last to die (var = '_LTD')
INSERT OR REPLACE INTO ArtDefine_UnitMemberCombats (UnitMemberType, EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation, LastToDie)
	SELECT	'ART_DEF_UNIT_MEMBER_' || UnitKey || Var, EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax,
			TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale,	TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack,
			HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance,
			OnlyTurnInMovementActions, RushAttackFormation, 1
	FROM ArtDefine_UnitMemberCombats JOIN UnitConfiguration ON  (UnitMemberType = 'ART_DEF_UNIT_MEMBER_' || UnitConfiguration.Template AND Var = '_LTD');

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
	FROM ArtDefine_UnitMemberInfos INNER JOIN UnitConfiguration ON (Type = 'ART_DEF_UNIT_MEMBER_' || UnitConfiguration.Template AND UnitConfiguration.Scl ISNULL);

-- Use custom scale
INSERT OR REPLACE INTO ArtDefine_UnitMemberInfos (Type, Scale, ZOffset, Domain, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag)
	SELECT	'ART_DEF_UNIT_MEMBER_' || UnitKey || Var, Scl, ZOffset, Domain, 
			UnitConfiguration.fxsxml || '.fxsxml', MaterialTypeTag, MaterialTypeSoundOverrideTag
	FROM ArtDefine_UnitMemberInfos INNER JOIN UnitConfiguration ON (Type = 'ART_DEF_UNIT_MEMBER_' || UnitConfiguration.Template AND UnitConfiguration.Scl NOT NULL);



-----------------------------------------------
-- Make ArtDefine_UnitInfoMemberInfos 
-----------------------------------------------

-- Remove previous entries, if any
DELETE FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType IN (SELECT 'ART_DEF_UNIT_' || UnitKey FROM UnitConfiguration);

-- Use default number of member
INSERT INTO ArtDefine_UnitInfoMemberInfos (UnitInfoType, UnitMemberInfoType, NumMembers)
	SELECT	'ART_DEF_UNIT_' || UnitKey, 'ART_DEF_UNIT_MEMBER_' || UnitKey || Var, NumMembers
	FROM ArtDefine_UnitInfoMemberInfos INNER JOIN UnitConfiguration ON (UnitConfiguration.Nb ISNULL AND UnitInfoType = 'ART_DEF_UNIT_' || UnitConfiguration.Template);

-- Use custom number of member
INSERT INTO ArtDefine_UnitInfoMemberInfos (UnitInfoType, UnitMemberInfoType, NumMembers)
	SELECT	'ART_DEF_UNIT_' || UnitKey, 'ART_DEF_UNIT_MEMBER_' || UnitKey || Var, Nb
	FROM UnitConfiguration WHERE (UnitConfiguration.Nb NOT NULL);
	


---------------------------------------------------------
-- Keep only the entry pointing to the template's statistic in config table for each unit type
---------------------------------------------------------

DELETE FROM UnitConfiguration
	WHERE   Var <> '';



---------------------------------------------------------
-- Make ArtDefine_UnitInfos from remaining unique entries
---------------------------------------------------------

-- Use default formation
INSERT INTO ArtDefine_UnitInfos (Type,DamageStates,Formation)
	SELECT	'ART_DEF_UNIT_' || UnitKey, DamageStates, Formation
	FROM ArtDefine_UnitInfos INNER JOIN UnitConfiguration
		ON 'ART_DEF_UNIT_' || UnitConfiguration.Template = Type AND UnitConfiguration.Form ISNULL;

-- Use custom formation
INSERT INTO ArtDefine_UnitInfos (Type,DamageStates,Formation)
	SELECT	'ART_DEF_UNIT_' || UnitKey, DamageStates, Form
	FROM ArtDefine_UnitInfos INNER JOIN UnitConfiguration 
		ON 'ART_DEF_UNIT_' || UnitConfiguration.Template = Type AND UnitConfiguration.Form NOT NULL;


---------------------------------------------------------
-- Unit statistics: First copy all value from template
---------------------------------------------------------

INSERT INTO Units (Type, Description, Civilopedia, Strategy, Help, Requirements,
					 Combat, RangedCombat, Cost, Moves, Immobile, Range, BaseSightRange, Class, Special, Capture, CombatClass, Domain, CivilianAttackPriority, DefaultUnitAI, Food, NoBadGoodies, RivalTerritory, MilitarySupport, MilitaryProduction, Pillage, Found, FoundAbroad, CultureBombRadius, GoldenAgeTurns, IgnoreBuildingDefense, PrereqResources, Mechanized, Suicide, CaptureWhileEmbarked, PrereqTech, ObsoleteTech, GoodyHutUpgradeUnitClass, HurryCostModifier, AdvancedStartCost, MinAreaSize, AirUnitCap, NukeDamageLevel, WorkRate, NumFreeTechs, RushBuilding, BaseHurry, HurryMultiplier, BaseGold, NumGoldPerEra, SpreadReligion, CombatLimit, RangeAttackOnlyInDomain, RangeAttackIgnoreLOS, RangedCombatLimit, XPValueAttack, XPValueDefense, SpecialCargo, DomainCargo, Conscription, ExtraMaintenanceCost, NoMaintenance, Unhappiness,
					 UnitArtInfo, UnitArtInfoCulturalVariation, UnitArtInfoEraVariation, ProjectPrereq, SpaceshipProject, LeaderPromotion, LeaderExperience, DontShowYields, ShowInPedia, MoveRate, 
					 UnitFlagIconOffset, PortraitIndex, IconAtlas, UnitFlagAtlas, Materiel, Personnel, FuelConsumption, KeyName)
	SELECT	'UNIT_' || UnitKey, Description, Civilopedia, Strategy, Help, Requirements,
					 Combat, RangedCombat, Cost, Moves, Immobile, Range, BaseSightRange, Class, Special, Capture, CombatClass, Domain, CivilianAttackPriority, DefaultUnitAI, Food, NoBadGoodies, RivalTerritory, MilitarySupport, MilitaryProduction, Pillage, Found, FoundAbroad, CultureBombRadius, GoldenAgeTurns, IgnoreBuildingDefense, PrereqResources, Mechanized, Suicide, CaptureWhileEmbarked, PrereqTech, ObsoleteTech, GoodyHutUpgradeUnitClass, HurryCostModifier, AdvancedStartCost, MinAreaSize, AirUnitCap, NukeDamageLevel, WorkRate, NumFreeTechs, RushBuilding, BaseHurry, HurryMultiplier, BaseGold, NumGoldPerEra, SpreadReligion, CombatLimit, RangeAttackOnlyInDomain, RangeAttackIgnoreLOS, RangedCombatLimit, XPValueAttack, XPValueDefense, SpecialCargo, DomainCargo, Conscription, ExtraMaintenanceCost, NoMaintenance, Unhappiness,
			'ART_DEF_UNIT_' || UnitKey, UnitArtInfoCulturalVariation, UnitArtInfoEraVariation, ProjectPrereq, SpaceshipProject, LeaderPromotion, LeaderExperience, DontShowYields, ShowInPedia, MoveRate, 
					 UnitFlagIconOffset, PortraitIndex, IconAtlas, UnitFlagAtlas, Materiel, Personnel, FuelConsumption, UnitKey
	FROM Units INNER JOIN UnitConfiguration ON  (Type = 'UNIT_' || UnitConfiguration.Template);


---------------------------------------------------------
-- Then update each value that is specific to the new unit
---------------------------------------------------------

-- Combat
UPDATE Units SET Combat = Combat + (SELECT Cbt FROM UnitConfiguration WHERE 'UNIT_' || UnitConfiguration.UnitKey = Units.Type AND UnitConfiguration.Cbt NOT NULL)
			WHERE EXISTS  (SELECT Cbt FROM UnitConfiguration WHERE 'UNIT_' || UnitConfiguration.UnitKey = Units.Type AND UnitConfiguration.Cbt NOT NULL);

-- Ranged Combat
UPDATE Units SET RangedCombat = RangedCombat + (SELECT Rgcbt FROM UnitConfiguration WHERE 'UNIT_' || UnitConfiguration.UnitKey = Units.Type AND UnitConfiguration.Rgcbt NOT NULL)
			WHERE EXISTS        (SELECT Rgcbt FROM UnitConfiguration WHERE 'UNIT_' || UnitConfiguration.UnitKey = Units.Type AND UnitConfiguration.Rgcbt NOT NULL);

-- Cost
UPDATE Units SET Cost = Cost + (SELECT Cst FROM UnitConfiguration WHERE 'UNIT_' || UnitConfiguration.UnitKey = Units.Type AND UnitConfiguration.Cst NOT NULL)
			WHERE EXISTS (SELECT Cst FROM UnitConfiguration WHERE 'UNIT_' || UnitConfiguration.UnitKey = Units.Type AND UnitConfiguration.Cst NOT NULL);

-- Moves
UPDATE Units SET Moves = Moves + (SELECT Mvt FROM UnitConfiguration WHERE 'UNIT_' || UnitConfiguration.UnitKey = Units.Type AND UnitConfiguration.Mvt NOT NULL)
			WHERE EXISTS (SELECT Mvt FROM UnitConfiguration WHERE 'UNIT_' || UnitConfiguration.UnitKey = Units.Type AND UnitConfiguration.Mvt NOT NULL);

-- Immobile
UPDATE Units SET Immobile = (SELECT Imb FROM UnitConfiguration WHERE 'UNIT_' || UnitConfiguration.UnitKey = Units.Type AND UnitConfiguration.Imb NOT NULL)
			WHERE EXISTS    (SELECT Imb FROM UnitConfiguration WHERE 'UNIT_' || UnitConfiguration.UnitKey = Units.Type AND UnitConfiguration.Imb NOT NULL);
				
-- Range
UPDATE Units SET Range = Range + (SELECT Rng FROM UnitConfiguration WHERE 'UNIT_' || UnitConfiguration.UnitKey = Units.Type AND UnitConfiguration.Rng NOT NULL)
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
UPDATE Units SET Materiel = Materiel + (SELECT Mat FROM UnitConfiguration WHERE 'UNIT_' || UnitConfiguration.UnitKey = Units.Type AND UnitConfiguration.Mat  NOT NULL)
			WHERE EXISTS	(SELECT Mat FROM UnitConfiguration WHERE 'UNIT_' || UnitConfiguration.UnitKey = Units.Type AND UnitConfiguration.Mat  NOT NULL);

-- Personnel / HP
UPDATE Units SET Personnel = Personnel + (SELECT Pers FROM UnitConfiguration WHERE 'UNIT_' || UnitConfiguration.UnitKey = Units.Type AND UnitConfiguration.Pers  NOT NULL)
			WHERE EXISTS	 (SELECT Pers FROM UnitConfiguration WHERE 'UNIT_' || UnitConfiguration.UnitKey = Units.Type AND UnitConfiguration.Pers  NOT NULL);

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
	
INSERT INTO Unit_AITypes (UnitType, UnitAIType)
	SELECT 'UNIT_' || UnitKey, UnitAIType
	FROM Unit_AITypes INNER JOIN UnitConfiguration ON  (UnitType= 'UNIT_' || UnitConfiguration.Template);
	
INSERT INTO Unit_Flavors (UnitType, FlavorType, Flavor)
	SELECT 'UNIT_' || UnitKey, FlavorType, Flavor
	FROM Unit_Flavors INNER JOIN UnitConfiguration ON  (UnitType= 'UNIT_' || UnitConfiguration.Template);
	
-- first set the free promotion from class template...
INSERT INTO Unit_FreePromotions (UnitType, PromotionType)
	SELECT 'UNIT_' || UnitKey, PromotionType
	FROM Unit_FreePromotions JOIN UnitConfiguration ON (UnitType= 'UNIT_' || UnitConfiguration.Template);

-- then replace the class template FreePromotion if there is one specific to the unit
REPLACE INTO Unit_FreePromotions (UnitType, PromotionType)
	SELECT 'UNIT_' || UnitKey, 'PROMOTION_' || UnitKey
	FROM UnitPromotions JOIN UnitConfiguration ON (UnitPromotions.Type = 'PROMOTION_' || UnitConfiguration.UnitKey);

INSERT INTO Unit_ResourceQuantityRequirements (UnitType, ResourceType, Cost)
	SELECT 'UNIT_' || UnitKey, ResourceType, Cost
	FROM Unit_ResourceQuantityRequirements INNER JOIN UnitConfiguration ON  (UnitType= 'UNIT_' || UnitConfiguration.Template);

INSERT INTO ArtDefine_StrategicView (StrategicViewType, TileType, Asset)
	SELECT 'ART_DEF_UNIT_' || UnitKey, TileType, Asset
	FROM ArtDefine_StrategicView INNER JOIN UnitConfiguration ON  (StrategicViewType = 'ART_DEF_UNIT_' || UnitConfiguration.Template);	

INSERT INTO Civilization_UnitClassOverrides (CivilizationType, UnitClassType, UnitType)
	SELECT 'CIVILIZATION_' || CivKey, Units.Class, 'UNIT_' || UnitKey
	FROM Units INNER JOIN UnitConfiguration ON Type = 'UNIT_' || UnitConfiguration.UnitKey AND UnitConfiguration.CivKey NOT NULL;

	
-----------------------------------------------
-- Fill Projects table 
-----------------------------------------------

-- Cost based on unit's cost and English text exist
INSERT OR REPLACE INTO Projects (Type, Description, Help, Civilopedia, Strategy, MaxGlobalInstances, MaxTeamInstances, Cost, IconAtlas, PortraitIndex)
	SELECT 'PROJECT_' || UnitKey, 'TXT_KEY_PROJECT_' || UnitKey, 'TXT_KEY_PROJECT_' || UnitKey || '_DESC', Units.Civilopedia, Units.Strategy, -1, 1, ROUND(Units.Cost*0.75), Units.IconAtlas, Units.PortraitIndex
	FROM Units INNER JOIN UnitConfiguration ON (Units.Type = 'UNIT_' || UnitConfiguration.UnitKey AND UnitConfiguration.ProjCst ISNULL)
	WHERE EXISTS (SELECT Tag FROM Language_en_US WHERE 'TXT_KEY_PROJECT_' || UnitConfiguration.UnitKey  = Tag);
	
-- Cost based on unit's cost and English text does not exist
INSERT OR REPLACE INTO Projects (Type, Description, Help, Civilopedia, Strategy, MaxGlobalInstances, MaxTeamInstances, Cost, IconAtlas, PortraitIndex)
	SELECT 'PROJECT_' || UnitKey, Units.Description || ' design', 'Allow the construction of ' || Units.Description || '.[NEWLINE]----------------[NEWLINE]{'|| Units.Help ||'}', Units.Civilopedia, Units.Strategy, -1, 1, ROUND(Units.Cost*0.75), Units.IconAtlas, Units.PortraitIndex
	FROM Units INNER JOIN UnitConfiguration ON (Units.Type = 'UNIT_' || UnitConfiguration.UnitKey AND UnitConfiguration.ProjCst ISNULL)
	WHERE NOT EXISTS (SELECT Tag FROM Language_en_US WHERE 'TXT_KEY_PROJECT_' || UnitConfiguration.UnitKey  = Tag);

-- Specific cost factor and English text exist
INSERT OR REPLACE INTO Projects (Type, Description, Help, Civilopedia, Strategy, MaxGlobalInstances, MaxTeamInstances, Cost, IconAtlas, PortraitIndex)
	SELECT 'PROJECT_' || UnitKey, 'TXT_KEY_PROJECT_' || UnitKey, 'TXT_KEY_PROJECT_' || UnitKey || '_DESC', Units.Civilopedia, Units.Strategy, -1, 1, ROUND(Units.Cost*UnitConfiguration.ProjCst), Units.IconAtlas, Units.PortraitIndex
	FROM Units INNER JOIN UnitConfiguration ON (Units.Type = 'UNIT_' || UnitConfiguration.UnitKey AND UnitConfiguration.ProjCst NOT NULL)
	WHERE EXISTS (SELECT Tag FROM Language_en_US WHERE 'TXT_KEY_PROJECT_' || UnitConfiguration.UnitKey  = Tag);

-- Specific cost factor and English text does not exist
INSERT OR REPLACE INTO Projects (Type, Description, Help, Civilopedia, Strategy, MaxGlobalInstances, MaxTeamInstances, Cost, IconAtlas, PortraitIndex)
	SELECT 'PROJECT_' || UnitKey, Units.Description || ' design', 'Allow the construction of ' || Units.Description || '.[NEWLINE]----------------[NEWLINE]{'|| Units.Help ||'}', Units.Civilopedia, Units.Strategy, -1, 1, ROUND(Units.Cost*UnitConfiguration.ProjCst), Units.IconAtlas, Units.PortraitIndex
	FROM Units INNER JOIN UnitConfiguration ON (Units.Type = 'UNIT_' || UnitConfiguration.UnitKey AND UnitConfiguration.ProjCst NOT NULL)
	WHERE NOT EXISTS (SELECT Tag FROM Language_en_US WHERE 'TXT_KEY_PROJECT_' || UnitConfiguration.UnitKey  = Tag);


INSERT OR REPLACE INTO Project_Flavors (ProjectType, FlavorType, Flavor)
	SELECT 'PROJECT_' || UnitKey, Unit_Flavors.FlavorType, Unit_Flavors.Flavor
	FROM Unit_Flavors INNER JOIN UnitConfiguration ON Unit_Flavors.UnitType = 'UNIT_' || UnitConfiguration.UnitKey;


-----------------------------------------------
-- Delete UnitConfiguration table
-----------------------------------------------

--DROP TABLE UnitConfiguration;
