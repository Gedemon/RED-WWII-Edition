--------------------------------------------------------------
-- R.E.D. WW2 Edition New Units
-- Assault guns, Heavy Assault guns 
--------------------------------------------------------------

--------------------------------------------------------------
-- Heavy Assault Gun 
--------------------------------------------------------------

-- KV-2
INSERT INTO "Units" ('Type', 'Description', 'Civilopedia', 'Strategy', 'Help', 'Requirements', 'Combat', 'RangedCombat', 'Cost', 'Moves', 'Immobile', 'Range', 'BaseSightRange', 'Class', 'Special', 'Capture', 'CombatClass', 'Domain', 'CivilianAttackPriority', 'DefaultUnitAI', 'Food', 'NoBadGoodies', 'RivalTerritory', 'MilitarySupport', 'MilitaryProduction', 'Pillage', 'Found', 'FoundAbroad', 'CultureBombRadius', 'GoldenAgeTurns', 'IgnoreBuildingDefense', 'PrereqResources', 'Mechanized', 'Suicide', 'CaptureWhileEmbarked', 'PrereqTech', 'ObsoleteTech', 'GoodyHutUpgradeUnitClass', 'HurryCostModifier', 'AdvancedStartCost', 'MinAreaSize', 'AirUnitCap', 'NukeDamageLevel', 'WorkRate', 'NumFreeTechs', 'RushBuilding', 'BaseHurry', 'HurryMultiplier', 'BaseGold', 'NumGoldPerEra', 'SpreadReligion', 'IsReligious', 'CombatLimit', 'RangeAttackOnlyInDomain', 'RangeAttackIgnoreLOS', 'RangedCombatLimit', 'XPValueAttack', 'XPValueDefense', 'SpecialCargo', 'DomainCargo', 'Conscription', 'ExtraMaintenanceCost', 'NoMaintenance', 'Unhappiness', 'UnitArtInfo', 'UnitArtInfoCulturalVariation', 'UnitArtInfoEraVariation', 'ProjectPrereq', 'SpaceshipProject', 'LeaderPromotion', 'LeaderExperience', 'DontShowYields', 'ShowInPedia', 'MoveRate', 'UnitFlagIconOffset', 'PortraitIndex', 'IconAtlas', 'UnitFlagAtlas')
	SELECT	("UNIT_ASSAULT_GUN_KV2"), ("TXT_KEY_UNIT_ASSAULT_GUN_KV2"), "Civilopedia", "Strategy", "Help", "Requirements", "Combat", "RangedCombat", "Cost", "Moves", "Immobile", "Range", "BaseSightRange", "Class", "Special", "Capture", "CombatClass", "Domain", "CivilianAttackPriority", "DefaultUnitAI", "Food", "NoBadGoodies", "RivalTerritory", "MilitarySupport", "MilitaryProduction", "Pillage", "Found", "FoundAbroad", "CultureBombRadius", "GoldenAgeTurns", "IgnoreBuildingDefense", "PrereqResources", "Mechanized", "Suicide", "CaptureWhileEmbarked", "PrereqTech", "ObsoleteTech", "GoodyHutUpgradeUnitClass", "HurryCostModifier", "AdvancedStartCost", "MinAreaSize", "AirUnitCap", "NukeDamageLevel", "WorkRate", "NumFreeTechs", "RushBuilding", "BaseHurry", "HurryMultiplier", "BaseGold", "NumGoldPerEra", "SpreadReligion", "IsReligious", "CombatLimit", "RangeAttackOnlyInDomain", "RangeAttackIgnoreLOS", "RangedCombatLimit", "XPValueAttack", "XPValueDefense", "SpecialCargo", "DomainCargo", "Conscription", "ExtraMaintenanceCost", "NoMaintenance", "Unhappiness",
			("ART_DEF_UNIT_ASSAULT_GUN_KV2"), "UnitArtInfoCulturalVariation", "UnitArtInfoEraVariation", ("PROJECT_KV2"), "SpaceshipProject", "LeaderPromotion", "LeaderExperience", "DontShowYields", "ShowInPedia", "MoveRate", "UnitFlagIconOffset", "PortraitIndex", "IconAtlas", "UnitFlagAtlas"
	FROM "Units" WHERE (Type = "UNIT_OLD_HEAVY_ASSAULT_GUN");
INSERT INTO "Language_en_US" ( 'Tag', 'Text' )
	VALUES ( 'TXT_KEY_UNIT_ASSAULT_GUN_KV2', 'KV-2' );
INSERT INTO "Unit_AITypes" ('UnitType', 'UnitAIType')
	SELECT ("UNIT_ASSAULT_GUN_KV2"), "UnitAIType"
	FROM "Unit_AITypes" WHERE (UnitType = "UNIT_OLD_HEAVY_ASSAULT_GUN");
INSERT INTO "Unit_ClassUpgrades" ('UnitType', 'UnitClassType')
	SELECT ("UNIT_ASSAULT_GUN_KV2"), "UnitClassType"
	FROM "Unit_ClassUpgrades" WHERE (UnitType = "UNIT_OLD_HEAVY_ASSAULT_GUN");
INSERT INTO "Civilization_UnitClassOverrides" ( 'CivilizationType', 'UnitClassType', 'UnitType' )
	VALUES ( 'CIVILIZATION_RUSSIA', 'UNITCLASS_OLD_HEAVY_ASSAULT_GUN', 'UNIT_ASSAULT_GUN_KV2' );
INSERT INTO "Unit_Flavors" ('UnitType', 'FlavorType', 'Flavor')
	SELECT ("UNIT_ASSAULT_GUN_KV2"), "FlavorType", "Flavor"
	FROM "Unit_Flavors" WHERE (UnitType = "UNIT_OLD_HEAVY_ASSAULT_GUN");
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	SELECT ("UNIT_ASSAULT_GUN_KV2"), "PromotionType"
	FROM "Unit_FreePromotions" WHERE (UnitType = "UNIT_OLD_HEAVY_ASSAULT_GUN");
INSERT INTO "Unit_ResourceQuantityRequirements" ('UnitType', 'ResourceType', 'Cost')
	SELECT ("UNIT_ASSAULT_GUN_KV2"), "ResourceType", "Cost"
	FROM "Unit_ResourceQuantityRequirements" WHERE (UnitType = "UNIT_OLD_HEAVY_ASSAULT_GUN");
-----------