--------------------------------------------------------------
-- R.E.D. WW2 Edition New Units
-- Fighters, Fighter-Bombers, Heavy-Fighters
--------------------------------------------------------------


--------------------------------------------------------------
-- FIGHTERS
--------------------------------------------------------------

-- remove vanilla Zero
DELETE FROM "Unit_AITypes" WHERE UnitType = 'UNIT_JAPANESE_ZERO';
DELETE FROM "Unit_ClassUpgrades" WHERE UnitType = 'UNIT_JAPANESE_ZERO';
DELETE FROM "Unit_Flavors" WHERE UnitType = 'UNIT_JAPANESE_ZERO';
DELETE FROM "Unit_FreePromotions" WHERE UnitType = 'UNIT_JAPANESE_ZERO';
DELETE FROM "Unit_ResourceQuantityRequirements" WHERE UnitType = 'UNIT_JAPANESE_ZERO';
-- we re-add it with fighter data somewhere below...
	

-- PZL P.24 (Greece)
INSERT INTO "Units" ('Type', 'Description', 'Civilopedia', 'Strategy', 'Help', 'Requirements', 'Combat', 'RangedCombat', 'Cost', 'Moves', 'Immobile', 'Range', 'BaseSightRange', 'Class', 'Special', 'Capture', 'CombatClass', 'Domain', 'CivilianAttackPriority', 'DefaultUnitAI', 'Food', 'NoBadGoodies', 'RivalTerritory', 'MilitarySupport', 'MilitaryProduction', 'Pillage', 'Found', 'FoundAbroad', 'CultureBombRadius', 'GoldenAgeTurns', 'IgnoreBuildingDefense', 'PrereqResources', 'Mechanized', 'Suicide', 'CaptureWhileEmbarked', 'PrereqTech', 'ObsoleteTech', 'GoodyHutUpgradeUnitClass', 'HurryCostModifier', 'AdvancedStartCost', 'MinAreaSize', 'AirUnitCap', 'NukeDamageLevel', 'WorkRate', 'NumFreeTechs', 'RushBuilding', 'BaseHurry', 'HurryMultiplier', 'BaseGold', 'NumGoldPerEra', 'SpreadReligion', 'IsReligious', 'CombatLimit', 'RangeAttackOnlyInDomain', 'RangeAttackIgnoreLOS', 'RangedCombatLimit', 'XPValueAttack', 'XPValueDefense', 'SpecialCargo', 'DomainCargo', 'Conscription', 'ExtraMaintenanceCost', 'NoMaintenance', 'Unhappiness', 'UnitArtInfo', 'UnitArtInfoCulturalVariation', 'UnitArtInfoEraVariation', 'ProjectPrereq', 'SpaceshipProject', 'LeaderPromotion', 'LeaderExperience', 'DontShowYields', 'ShowInPedia', 'MoveRate', 'UnitFlagIconOffset', 'PortraitIndex', 'IconAtlas', 'UnitFlagAtlas')
	SELECT	("UNIT_FIGHTER_P24"), ("TXT_KEY_UNIT_FIGHTER_P24"), "Civilopedia", "Strategy", "Help", "Requirements", "Combat", "RangedCombat", "Cost", "Moves", "Immobile", "Range", "BaseSightRange", "Class", "Special", "Capture", "CombatClass", "Domain", "CivilianAttackPriority", "DefaultUnitAI", "Food", "NoBadGoodies", "RivalTerritory", "MilitarySupport", "MilitaryProduction", "Pillage", "Found", "FoundAbroad", "CultureBombRadius", "GoldenAgeTurns", "IgnoreBuildingDefense", "PrereqResources", "Mechanized", "Suicide", "CaptureWhileEmbarked", "PrereqTech", "ObsoleteTech", "GoodyHutUpgradeUnitClass", "HurryCostModifier", "AdvancedStartCost", "MinAreaSize", "AirUnitCap", "NukeDamageLevel", "WorkRate", "NumFreeTechs", "RushBuilding", "BaseHurry", "HurryMultiplier", "BaseGold", "NumGoldPerEra", "SpreadReligion", "IsReligious", "CombatLimit", "RangeAttackOnlyInDomain", "RangeAttackIgnoreLOS", "RangedCombatLimit", "XPValueAttack", "XPValueDefense", "SpecialCargo", "DomainCargo", "Conscription", "ExtraMaintenanceCost", "NoMaintenance", "Unhappiness",
			("ART_DEF_UNIT_FIGHTER_P24"), "UnitArtInfoCulturalVariation", "UnitArtInfoEraVariation", "ProjectPrereq", "SpaceshipProject", "LeaderPromotion", "LeaderExperience", "DontShowYields", "ShowInPedia", "MoveRate", "UnitFlagIconOffset", "PortraitIndex", "IconAtlas", "UnitFlagAtlas"
	FROM "Units" WHERE (Type = "UNIT_OLD_FIGHTER");
INSERT INTO "Language_en_US" ( 'Tag', 'Text' )
	VALUES ( 'TXT_KEY_UNIT_FIGHTER_P24', 'PZL P.24' );
INSERT INTO "Unit_AITypes" ('UnitType', 'UnitAIType')
	SELECT ("UNIT_FIGHTER_P24"), "UnitAIType"
	FROM "Unit_AITypes" WHERE (UnitType = "UNIT_OLD_FIGHTER");
INSERT INTO "Unit_ClassUpgrades" ('UnitType', 'UnitClassType')
	SELECT ("UNIT_FIGHTER_P24"), "UnitClassType"
	FROM "Unit_ClassUpgrades" WHERE (UnitType = "UNIT_OLD_FIGHTER");
INSERT INTO "Civilization_UnitClassOverrides" ( 'CivilizationType', 'UnitClassType', 'UnitType' )
	VALUES ( 'CIVILIZATION_GREECE', 'UNITCLASS_OLD_FIGHTER', 'UNIT_FIGHTER_P24' );
INSERT INTO "Unit_Flavors" ('UnitType', 'FlavorType', 'Flavor')
	SELECT ("UNIT_FIGHTER_P24"), "FlavorType", "Flavor"
	FROM "Unit_Flavors" WHERE (UnitType = "UNIT_OLD_FIGHTER");
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	SELECT ("UNIT_FIGHTER_P24"), "PromotionType"
	FROM "Unit_FreePromotions" WHERE (UnitType = "UNIT_OLD_FIGHTER");
INSERT INTO "Unit_ResourceQuantityRequirements" ('UnitType', 'ResourceType', 'Cost')
	SELECT ("UNIT_FIGHTER_P24"), "ResourceType", "Cost"
	FROM "Unit_ResourceQuantityRequirements" WHERE (UnitType = "UNIT_OLD_FIGHTER");
-----------

-- PZL P.11
INSERT INTO "Units" ('Type', 'Description', 'Civilopedia', 'Strategy', 'Help', 'Requirements', 'Combat', 'RangedCombat', 'Cost', 'Moves', 'Immobile', 'Range', 'BaseSightRange', 'Class', 'Special', 'Capture', 'CombatClass', 'Domain', 'CivilianAttackPriority', 'DefaultUnitAI', 'Food', 'NoBadGoodies', 'RivalTerritory', 'MilitarySupport', 'MilitaryProduction', 'Pillage', 'Found', 'FoundAbroad', 'CultureBombRadius', 'GoldenAgeTurns', 'IgnoreBuildingDefense', 'PrereqResources', 'Mechanized', 'Suicide', 'CaptureWhileEmbarked', 'PrereqTech', 'ObsoleteTech', 'GoodyHutUpgradeUnitClass', 'HurryCostModifier', 'AdvancedStartCost', 'MinAreaSize', 'AirUnitCap', 'NukeDamageLevel', 'WorkRate', 'NumFreeTechs', 'RushBuilding', 'BaseHurry', 'HurryMultiplier', 'BaseGold', 'NumGoldPerEra', 'SpreadReligion', 'IsReligious', 'CombatLimit', 'RangeAttackOnlyInDomain', 'RangeAttackIgnoreLOS', 'RangedCombatLimit', 'XPValueAttack', 'XPValueDefense', 'SpecialCargo', 'DomainCargo', 'Conscription', 'ExtraMaintenanceCost', 'NoMaintenance', 'Unhappiness', 'UnitArtInfo', 'UnitArtInfoCulturalVariation', 'UnitArtInfoEraVariation', 'ProjectPrereq', 'SpaceshipProject', 'LeaderPromotion', 'LeaderExperience', 'DontShowYields', 'ShowInPedia', 'MoveRate', 'UnitFlagIconOffset', 'PortraitIndex', 'IconAtlas', 'UnitFlagAtlas')
	SELECT	("UNIT_FIGHTER_P11"), ("TXT_KEY_UNIT_FIGHTER_P11"), "Civilopedia", "Strategy", "Help", "Requirements", "Combat", "RangedCombat", "Cost", "Moves", "Immobile", "Range", "BaseSightRange", "Class", "Special", "Capture", "CombatClass", "Domain", "CivilianAttackPriority", "DefaultUnitAI", "Food", "NoBadGoodies", "RivalTerritory", "MilitarySupport", "MilitaryProduction", "Pillage", "Found", "FoundAbroad", "CultureBombRadius", "GoldenAgeTurns", "IgnoreBuildingDefense", "PrereqResources", "Mechanized", "Suicide", "CaptureWhileEmbarked", "PrereqTech", "ObsoleteTech", "GoodyHutUpgradeUnitClass", "HurryCostModifier", "AdvancedStartCost", "MinAreaSize", "AirUnitCap", "NukeDamageLevel", "WorkRate", "NumFreeTechs", "RushBuilding", "BaseHurry", "HurryMultiplier", "BaseGold", "NumGoldPerEra", "SpreadReligion", "IsReligious", "CombatLimit", "RangeAttackOnlyInDomain", "RangeAttackIgnoreLOS", "RangedCombatLimit", "XPValueAttack", "XPValueDefense", "SpecialCargo", "DomainCargo", "Conscription", "ExtraMaintenanceCost", "NoMaintenance", "Unhappiness",
			("ART_DEF_UNIT_FIGHTER_P11"), "UnitArtInfoCulturalVariation", "UnitArtInfoEraVariation", "ProjectPrereq", "SpaceshipProject", "LeaderPromotion", "LeaderExperience", "DontShowYields", "ShowInPedia", "MoveRate", "UnitFlagIconOffset", "PortraitIndex", "IconAtlas", "UnitFlagAtlas"
	FROM "Units" WHERE (Type = "UNIT_OLD_FIGHTER");
INSERT INTO "Language_en_US" ( 'Tag', 'Text' )
	VALUES ( 'TXT_KEY_UNIT_FIGHTER_P11', 'PZL P.11' );
INSERT INTO "Unit_AITypes" ('UnitType', 'UnitAIType')
	SELECT ("UNIT_FIGHTER_P11"), "UnitAIType"
	FROM "Unit_AITypes" WHERE (UnitType = "UNIT_OLD_FIGHTER");
INSERT INTO "Unit_ClassUpgrades" ('UnitType', 'UnitClassType')
	SELECT ("UNIT_FIGHTER_P11"), "UnitClassType"
	FROM "Unit_ClassUpgrades" WHERE (UnitType = "UNIT_OLD_FIGHTER");
--INSERT INTO "Civilization_UnitClassOverrides" ( 'CivilizationType', 'UnitClassType', 'UnitType' )
--	VALUES ( 'CIVILIZATION_POLAND', 'UNITCLASS_OLD_FIGHTER', 'UNIT_FIGHTER_P11' );
INSERT INTO "Unit_Flavors" ('UnitType', 'FlavorType', 'Flavor')
	SELECT ("UNIT_FIGHTER_P11"), "FlavorType", "Flavor"
	FROM "Unit_Flavors" WHERE (UnitType = "UNIT_OLD_FIGHTER");
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	SELECT ("UNIT_FIGHTER_P11"), "PromotionType"
	FROM "Unit_FreePromotions" WHERE (UnitType = "UNIT_OLD_FIGHTER");
INSERT INTO "Unit_ResourceQuantityRequirements" ('UnitType', 'ResourceType', 'Cost')
	SELECT ("UNIT_FIGHTER_P11"), "ResourceType", "Cost"
	FROM "Unit_ResourceQuantityRequirements" WHERE (UnitType = "UNIT_OLD_FIGHTER");
-----------

-- I16
INSERT INTO "Units" ('Type', 'Description', 'Civilopedia', 'Strategy', 'Help', 'Requirements', 'Combat', 'RangedCombat', 'Cost', 'Moves', 'Immobile', 'Range', 'BaseSightRange', 'Class', 'Special', 'Capture', 'CombatClass', 'Domain', 'CivilianAttackPriority', 'DefaultUnitAI', 'Food', 'NoBadGoodies', 'RivalTerritory', 'MilitarySupport', 'MilitaryProduction', 'Pillage', 'Found', 'FoundAbroad', 'CultureBombRadius', 'GoldenAgeTurns', 'IgnoreBuildingDefense', 'PrereqResources', 'Mechanized', 'Suicide', 'CaptureWhileEmbarked', 'PrereqTech', 'ObsoleteTech', 'GoodyHutUpgradeUnitClass', 'HurryCostModifier', 'AdvancedStartCost', 'MinAreaSize', 'AirUnitCap', 'NukeDamageLevel', 'WorkRate', 'NumFreeTechs', 'RushBuilding', 'BaseHurry', 'HurryMultiplier', 'BaseGold', 'NumGoldPerEra', 'SpreadReligion', 'IsReligious', 'CombatLimit', 'RangeAttackOnlyInDomain', 'RangeAttackIgnoreLOS', 'RangedCombatLimit', 'XPValueAttack', 'XPValueDefense', 'SpecialCargo', 'DomainCargo', 'Conscription', 'ExtraMaintenanceCost', 'NoMaintenance', 'Unhappiness', 'UnitArtInfo', 'UnitArtInfoCulturalVariation', 'UnitArtInfoEraVariation', 'ProjectPrereq', 'SpaceshipProject', 'LeaderPromotion', 'LeaderExperience', 'DontShowYields', 'ShowInPedia', 'MoveRate', 'UnitFlagIconOffset', 'PortraitIndex', 'IconAtlas', 'UnitFlagAtlas')
	SELECT	("UNIT_FIGHTER_I16"), ("TXT_KEY_UNIT_FIGHTER_I16"), "Civilopedia", "Strategy", "Help", "Requirements", "Combat", "RangedCombat", "Cost", "Moves", "Immobile", "Range", "BaseSightRange", "Class", "Special", "Capture", "CombatClass", "Domain", "CivilianAttackPriority", "DefaultUnitAI", "Food", "NoBadGoodies", "RivalTerritory", "MilitarySupport", "MilitaryProduction", "Pillage", "Found", "FoundAbroad", "CultureBombRadius", "GoldenAgeTurns", "IgnoreBuildingDefense", "PrereqResources", "Mechanized", "Suicide", "CaptureWhileEmbarked", "PrereqTech", "ObsoleteTech", "GoodyHutUpgradeUnitClass", "HurryCostModifier", "AdvancedStartCost", "MinAreaSize", "AirUnitCap", "NukeDamageLevel", "WorkRate", "NumFreeTechs", "RushBuilding", "BaseHurry", "HurryMultiplier", "BaseGold", "NumGoldPerEra", "SpreadReligion", "IsReligious", "CombatLimit", "RangeAttackOnlyInDomain", "RangeAttackIgnoreLOS", "RangedCombatLimit", "XPValueAttack", "XPValueDefense", "SpecialCargo", "DomainCargo", "Conscription", "ExtraMaintenanceCost", "NoMaintenance", "Unhappiness",
			("ART_DEF_UNIT_FIGHTER_I16"), "UnitArtInfoCulturalVariation", "UnitArtInfoEraVariation", "ProjectPrereq", "SpaceshipProject", "LeaderPromotion", "LeaderExperience", "DontShowYields", "ShowInPedia", "MoveRate", "UnitFlagIconOffset", "PortraitIndex", "IconAtlas", "UnitFlagAtlas"
	FROM "Units" WHERE (Type = "UNIT_OLD_FIGHTER");
INSERT INTO "Language_en_US" ( 'Tag', 'Text' )
	VALUES ( 'TXT_KEY_UNIT_FIGHTER_I16', 'Polikarpov I-16' );
INSERT INTO "Unit_AITypes" ('UnitType', 'UnitAIType')
	SELECT ("UNIT_FIGHTER_I16"), "UnitAIType"
	FROM "Unit_AITypes" WHERE (UnitType = "UNIT_OLD_FIGHTER");
INSERT INTO "Unit_ClassUpgrades" ('UnitType', 'UnitClassType')
	SELECT ("UNIT_FIGHTER_I16"), "UnitClassType"
	FROM "Unit_ClassUpgrades" WHERE (UnitType = "UNIT_OLD_FIGHTER");
INSERT INTO "Civilization_UnitClassOverrides" ( 'CivilizationType', 'UnitClassType', 'UnitType' )
	VALUES ( 'CIVILIZATION_RUSSIA', 'UNITCLASS_OLD_FIGHTER', 'UNIT_FIGHTER_I16' );
INSERT INTO "Unit_Flavors" ('UnitType', 'FlavorType', 'Flavor')
	SELECT ("UNIT_FIGHTER_I16"), "FlavorType", "Flavor"
	FROM "Unit_Flavors" WHERE (UnitType = "UNIT_OLD_FIGHTER");
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	SELECT ("UNIT_FIGHTER_I16"), "PromotionType"
	FROM "Unit_FreePromotions" WHERE (UnitType = "UNIT_OLD_FIGHTER");
INSERT INTO "Unit_ResourceQuantityRequirements" ('UnitType', 'ResourceType', 'Cost')
	SELECT ("UNIT_FIGHTER_I16"), "ResourceType", "Cost"
	FROM "Unit_ResourceQuantityRequirements" WHERE (UnitType = "UNIT_OLD_FIGHTER");
-----------

-- CR.42
INSERT INTO "Units" ('Type', 'Description', 'Civilopedia', 'Strategy', 'Help', 'Requirements', 'Combat', 'RangedCombat', 'Cost', 'Moves', 'Immobile', 'Range', 'BaseSightRange', 'Class', 'Special', 'Capture', 'CombatClass', 'Domain', 'CivilianAttackPriority', 'DefaultUnitAI', 'Food', 'NoBadGoodies', 'RivalTerritory', 'MilitarySupport', 'MilitaryProduction', 'Pillage', 'Found', 'FoundAbroad', 'CultureBombRadius', 'GoldenAgeTurns', 'IgnoreBuildingDefense', 'PrereqResources', 'Mechanized', 'Suicide', 'CaptureWhileEmbarked', 'PrereqTech', 'ObsoleteTech', 'GoodyHutUpgradeUnitClass', 'HurryCostModifier', 'AdvancedStartCost', 'MinAreaSize', 'AirUnitCap', 'NukeDamageLevel', 'WorkRate', 'NumFreeTechs', 'RushBuilding', 'BaseHurry', 'HurryMultiplier', 'BaseGold', 'NumGoldPerEra', 'SpreadReligion', 'IsReligious', 'CombatLimit', 'RangeAttackOnlyInDomain', 'RangeAttackIgnoreLOS', 'RangedCombatLimit', 'XPValueAttack', 'XPValueDefense', 'SpecialCargo', 'DomainCargo', 'Conscription', 'ExtraMaintenanceCost', 'NoMaintenance', 'Unhappiness', 'UnitArtInfo', 'UnitArtInfoCulturalVariation', 'UnitArtInfoEraVariation', 'ProjectPrereq', 'SpaceshipProject', 'LeaderPromotion', 'LeaderExperience', 'DontShowYields', 'ShowInPedia', 'MoveRate', 'UnitFlagIconOffset', 'PortraitIndex', 'IconAtlas', 'UnitFlagAtlas')
	SELECT	("UNIT_FIGHTER_CR42"), ("TXT_KEY_UNIT_FIGHTER_CR42"), "Civilopedia", "Strategy", "Help", "Requirements", "Combat", "RangedCombat", "Cost", "Moves", "Immobile", "Range", "BaseSightRange", "Class", "Special", "Capture", "CombatClass", "Domain", "CivilianAttackPriority", "DefaultUnitAI", "Food", "NoBadGoodies", "RivalTerritory", "MilitarySupport", "MilitaryProduction", "Pillage", "Found", "FoundAbroad", "CultureBombRadius", "GoldenAgeTurns", "IgnoreBuildingDefense", "PrereqResources", "Mechanized", "Suicide", "CaptureWhileEmbarked", "PrereqTech", "ObsoleteTech", "GoodyHutUpgradeUnitClass", "HurryCostModifier", "AdvancedStartCost", "MinAreaSize", "AirUnitCap", "NukeDamageLevel", "WorkRate", "NumFreeTechs", "RushBuilding", "BaseHurry", "HurryMultiplier", "BaseGold", "NumGoldPerEra", "SpreadReligion", "IsReligious", "CombatLimit", "RangeAttackOnlyInDomain", "RangeAttackIgnoreLOS", "RangedCombatLimit", "XPValueAttack", "XPValueDefense", "SpecialCargo", "DomainCargo", "Conscription", "ExtraMaintenanceCost", "NoMaintenance", "Unhappiness",
			("ART_DEF_UNIT_FIGHTER_CR42"), "UnitArtInfoCulturalVariation", "UnitArtInfoEraVariation", "ProjectPrereq", "SpaceshipProject", "LeaderPromotion", "LeaderExperience", "DontShowYields", "ShowInPedia", "MoveRate", "UnitFlagIconOffset", "PortraitIndex", "IconAtlas", "UnitFlagAtlas"
	FROM "Units" WHERE (Type = "UNIT_OLD_FIGHTER");
INSERT INTO "Language_en_US" ( 'Tag', 'Text' )
	VALUES ( 'TXT_KEY_UNIT_FIGHTER_CR42', 'Fiat CR.42 Falco' );
INSERT INTO "Unit_AITypes" ('UnitType', 'UnitAIType')
	SELECT ("UNIT_FIGHTER_CR42"), "UnitAIType"
	FROM "Unit_AITypes" WHERE (UnitType = "UNIT_OLD_FIGHTER");
INSERT INTO "Unit_ClassUpgrades" ('UnitType', 'UnitClassType')
	SELECT ("UNIT_FIGHTER_CR42"), "UnitClassType"
	FROM "Unit_ClassUpgrades" WHERE (UnitType = "UNIT_OLD_FIGHTER");
INSERT INTO "Civilization_UnitClassOverrides" ( 'CivilizationType', 'UnitClassType', 'UnitType' )
	VALUES ( 'CIVILIZATION_ROME', 'UNITCLASS_OLD_FIGHTER', 'UNIT_FIGHTER_CR42' );
INSERT INTO "Unit_Flavors" ('UnitType', 'FlavorType', 'Flavor')
	SELECT ("UNIT_FIGHTER_CR42"), "FlavorType", "Flavor"
	FROM "Unit_Flavors" WHERE (UnitType = "UNIT_OLD_FIGHTER");
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	SELECT ("UNIT_FIGHTER_CR42"), "PromotionType"
	FROM "Unit_FreePromotions" WHERE (UnitType = "UNIT_OLD_FIGHTER");
INSERT INTO "Unit_ResourceQuantityRequirements" ('UnitType', 'ResourceType', 'Cost')
	SELECT ("UNIT_FIGHTER_CR42"), "ResourceType", "Cost"
	FROM "Unit_ResourceQuantityRequirements" WHERE (UnitType = "UNIT_OLD_FIGHTER");
-----------

-- MS.406
INSERT INTO "Units" ('Type', 'Description', 'Civilopedia', 'Strategy', 'Help', 'Requirements', 'Combat', 'RangedCombat', 'Cost', 'Moves', 'Immobile', 'Range', 'BaseSightRange', 'Class', 'Special', 'Capture', 'CombatClass', 'Domain', 'CivilianAttackPriority', 'DefaultUnitAI', 'Food', 'NoBadGoodies', 'RivalTerritory', 'MilitarySupport', 'MilitaryProduction', 'Pillage', 'Found', 'FoundAbroad', 'CultureBombRadius', 'GoldenAgeTurns', 'IgnoreBuildingDefense', 'PrereqResources', 'Mechanized', 'Suicide', 'CaptureWhileEmbarked', 'PrereqTech', 'ObsoleteTech', 'GoodyHutUpgradeUnitClass', 'HurryCostModifier', 'AdvancedStartCost', 'MinAreaSize', 'AirUnitCap', 'NukeDamageLevel', 'WorkRate', 'NumFreeTechs', 'RushBuilding', 'BaseHurry', 'HurryMultiplier', 'BaseGold', 'NumGoldPerEra', 'SpreadReligion', 'IsReligious', 'CombatLimit', 'RangeAttackOnlyInDomain', 'RangeAttackIgnoreLOS', 'RangedCombatLimit', 'XPValueAttack', 'XPValueDefense', 'SpecialCargo', 'DomainCargo', 'Conscription', 'ExtraMaintenanceCost', 'NoMaintenance', 'Unhappiness', 'UnitArtInfo', 'UnitArtInfoCulturalVariation', 'UnitArtInfoEraVariation', 'ProjectPrereq', 'SpaceshipProject', 'LeaderPromotion', 'LeaderExperience', 'DontShowYields', 'ShowInPedia', 'MoveRate', 'UnitFlagIconOffset', 'PortraitIndex', 'IconAtlas', 'UnitFlagAtlas')
	SELECT	("UNIT_FIGHTER_MS406"), ("TXT_KEY_UNIT_FIGHTER_MS406"), "Civilopedia", "Strategy", "Help", "Requirements", "Combat", "RangedCombat", "Cost", "Moves", "Immobile", "Range", "BaseSightRange", "Class", "Special", "Capture", "CombatClass", "Domain", "CivilianAttackPriority", "DefaultUnitAI", "Food", "NoBadGoodies", "RivalTerritory", "MilitarySupport", "MilitaryProduction", "Pillage", "Found", "FoundAbroad", "CultureBombRadius", "GoldenAgeTurns", "IgnoreBuildingDefense", "PrereqResources", "Mechanized", "Suicide", "CaptureWhileEmbarked", "PrereqTech", "ObsoleteTech", "GoodyHutUpgradeUnitClass", "HurryCostModifier", "AdvancedStartCost", "MinAreaSize", "AirUnitCap", "NukeDamageLevel", "WorkRate", "NumFreeTechs", "RushBuilding", "BaseHurry", "HurryMultiplier", "BaseGold", "NumGoldPerEra", "SpreadReligion", "IsReligious", "CombatLimit", "RangeAttackOnlyInDomain", "RangeAttackIgnoreLOS", "RangedCombatLimit", "XPValueAttack", "XPValueDefense", "SpecialCargo", "DomainCargo", "Conscription", "ExtraMaintenanceCost", "NoMaintenance", "Unhappiness",
			("ART_DEF_UNIT_FIGHTER_MS406"), "UnitArtInfoCulturalVariation", "UnitArtInfoEraVariation", ("PROJECT_MS406"), "SpaceshipProject", "LeaderPromotion", "LeaderExperience", "DontShowYields", "ShowInPedia", "MoveRate", "UnitFlagIconOffset", "PortraitIndex", "IconAtlas", "UnitFlagAtlas"
	FROM "Units" WHERE (Type = "UNIT_OLD_FIGHTER");
INSERT INTO "Language_en_US" ( 'Tag', 'Text' )
	VALUES ( 'TXT_KEY_UNIT_FIGHTER_MS406', 'Morane-Saulnier MS.406' );
INSERT INTO "Unit_AITypes" ('UnitType', 'UnitAIType')
	SELECT ("UNIT_FIGHTER_MS406"), "UnitAIType"
	FROM "Unit_AITypes" WHERE (UnitType = "UNIT_OLD_FIGHTER");
INSERT INTO "Unit_ClassUpgrades" ('UnitType', 'UnitClassType')
	SELECT ("UNIT_FIGHTER_MS406"), "UnitClassType"
	FROM "Unit_ClassUpgrades" WHERE (UnitType = "UNIT_OLD_FIGHTER");
INSERT INTO "Civilization_UnitClassOverrides" ( 'CivilizationType', 'UnitClassType', 'UnitType' )
	VALUES ( 'CIVILIZATION_FRANCE', 'UNITCLASS_OLD_FIGHTER', 'UNIT_FIGHTER_MS406' );
INSERT INTO "Unit_Flavors" ('UnitType', 'FlavorType', 'Flavor')
	SELECT ("UNIT_FIGHTER_MS406"), "FlavorType", "Flavor"
	FROM "Unit_Flavors" WHERE (UnitType = "UNIT_OLD_FIGHTER");
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	SELECT ("UNIT_FIGHTER_MS406"), "PromotionType"
	FROM "Unit_FreePromotions" WHERE (UnitType = "UNIT_OLD_FIGHTER");
INSERT INTO "Unit_ResourceQuantityRequirements" ('UnitType', 'ResourceType', 'Cost')
	SELECT ("UNIT_FIGHTER_MS406"), "ResourceType", "Cost"
	FROM "Unit_ResourceQuantityRequirements" WHERE (UnitType = "UNIT_OLD_FIGHTER");
-----------

-- Hawk-75 (France Import)
INSERT INTO "Units" ('Type', 'Description', 'Civilopedia', 'Strategy', 'Help', 'Requirements', 'Combat', 'RangedCombat', 'Cost', 'Moves', 'Immobile', 'Range', 'BaseSightRange', 'Class', 'Special', 'Capture', 'CombatClass', 'Domain', 'CivilianAttackPriority', 'DefaultUnitAI', 'Food', 'NoBadGoodies', 'RivalTerritory', 'MilitarySupport', 'MilitaryProduction', 'Pillage', 'Found', 'FoundAbroad', 'CultureBombRadius', 'GoldenAgeTurns', 'IgnoreBuildingDefense', 'PrereqResources', 'Mechanized', 'Suicide', 'CaptureWhileEmbarked', 'PrereqTech', 'ObsoleteTech', 'GoodyHutUpgradeUnitClass', 'HurryCostModifier', 'AdvancedStartCost', 'MinAreaSize', 'AirUnitCap', 'NukeDamageLevel', 'WorkRate', 'NumFreeTechs', 'RushBuilding', 'BaseHurry', 'HurryMultiplier', 'BaseGold', 'NumGoldPerEra', 'SpreadReligion', 'IsReligious', 'CombatLimit', 'RangeAttackOnlyInDomain', 'RangeAttackIgnoreLOS', 'RangedCombatLimit', 'XPValueAttack', 'XPValueDefense', 'SpecialCargo', 'DomainCargo', 'Conscription', 'ExtraMaintenanceCost', 'NoMaintenance', 'Unhappiness', 'UnitArtInfo', 'UnitArtInfoCulturalVariation', 'UnitArtInfoEraVariation', 'ProjectPrereq', 'SpaceshipProject', 'LeaderPromotion', 'LeaderExperience', 'DontShowYields', 'ShowInPedia', 'MoveRate', 'UnitFlagIconOffset', 'PortraitIndex', 'IconAtlas', 'UnitFlagAtlas')
	SELECT	("UNIT_FIGHTER_HAWK75"), ("TXT_KEY_UNIT_FIGHTER_HAWK75"), "Civilopedia", "Strategy", "Help", "Requirements", "Combat", "RangedCombat", "Cost", "Moves", "Immobile", "Range", "BaseSightRange", "Class", "Special", "Capture", "CombatClass", "Domain", "CivilianAttackPriority", "DefaultUnitAI", "Food", "NoBadGoodies", "RivalTerritory", "MilitarySupport", "MilitaryProduction", "Pillage", "Found", "FoundAbroad", "CultureBombRadius", "GoldenAgeTurns", "IgnoreBuildingDefense", "PrereqResources", "Mechanized", "Suicide", "CaptureWhileEmbarked", "PrereqTech", "ObsoleteTech", "GoodyHutUpgradeUnitClass", "HurryCostModifier", "AdvancedStartCost", "MinAreaSize", "AirUnitCap", "NukeDamageLevel", "WorkRate", "NumFreeTechs", "RushBuilding", "BaseHurry", "HurryMultiplier", "BaseGold", "NumGoldPerEra", "SpreadReligion", "IsReligious", "CombatLimit", "RangeAttackOnlyInDomain", "RangeAttackIgnoreLOS", "RangedCombatLimit", "XPValueAttack", "XPValueDefense", "SpecialCargo", "DomainCargo", "Conscription", "ExtraMaintenanceCost", "NoMaintenance", "Unhappiness",
			("ART_DEF_UNIT_FIGHTER_HAWK75"), "UnitArtInfoCulturalVariation", "UnitArtInfoEraVariation", "ProjectPrereq", "SpaceshipProject", "LeaderPromotion", "LeaderExperience", "DontShowYields", "ShowInPedia", "MoveRate", "UnitFlagIconOffset", "PortraitIndex", "IconAtlas", "UnitFlagAtlas"
	FROM "Units" WHERE (Type = "UNIT_FIGHTER");
INSERT INTO "Language_en_US" ( 'Tag', 'Text' )
	VALUES ( 'TXT_KEY_UNIT_FIGHTER_HAWK75', 'Curtiss Hawk-75' );
INSERT INTO "Unit_AITypes" ('UnitType', 'UnitAIType')
	SELECT ("UNIT_FIGHTER_HAWK75"), "UnitAIType"
	FROM "Unit_AITypes" WHERE (UnitType = "UNIT_FIGHTER");
INSERT INTO "Unit_ClassUpgrades" ('UnitType', 'UnitClassType')
	SELECT ("UNIT_FIGHTER_HAWK75"), "UnitClassType"
	FROM "Unit_ClassUpgrades" WHERE (UnitType = "UNIT_FIGHTER");
--INSERT INTO "Civilization_UnitClassOverrides" ( 'CivilizationType', 'UnitClassType', 'UnitType' )
--	VALUES ( 'CIVILIZATION_FRANCE', 'UNITCLASS_FIGHTER', 'UNIT_FIGHTER_HAWK75' );
INSERT INTO "Unit_Flavors" ('UnitType', 'FlavorType', 'Flavor')
	SELECT ("UNIT_FIGHTER_HAWK75"), "FlavorType", "Flavor"
	FROM "Unit_Flavors" WHERE (UnitType = "UNIT_FIGHTER");
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	SELECT ("UNIT_FIGHTER_HAWK75"), "PromotionType"
	FROM "Unit_FreePromotions" WHERE (UnitType = "UNIT_FIGHTER");
INSERT INTO "Unit_ResourceQuantityRequirements" ('UnitType', 'ResourceType', 'Cost')
	SELECT ("UNIT_FIGHTER_HAWK75"), "ResourceType", "Cost"
	FROM "Unit_ResourceQuantityRequirements" WHERE (UnitType = "UNIT_FIGHTER");
-----------

-- Spitfire (Civ4 default model)
INSERT INTO "Units" ('Type', 'Description', 'Civilopedia', 'Strategy', 'Help', 'Requirements', 'Combat', 'RangedCombat', 'Cost', 'Moves', 'Immobile', 'Range', 'BaseSightRange', 'Class', 'Special', 'Capture', 'CombatClass', 'Domain', 'CivilianAttackPriority', 'DefaultUnitAI', 'Food', 'NoBadGoodies', 'RivalTerritory', 'MilitarySupport', 'MilitaryProduction', 'Pillage', 'Found', 'FoundAbroad', 'CultureBombRadius', 'GoldenAgeTurns', 'IgnoreBuildingDefense', 'PrereqResources', 'Mechanized', 'Suicide', 'CaptureWhileEmbarked', 'PrereqTech', 'ObsoleteTech', 'GoodyHutUpgradeUnitClass', 'HurryCostModifier', 'AdvancedStartCost', 'MinAreaSize', 'AirUnitCap', 'NukeDamageLevel', 'WorkRate', 'NumFreeTechs', 'RushBuilding', 'BaseHurry', 'HurryMultiplier', 'BaseGold', 'NumGoldPerEra', 'SpreadReligion', 'IsReligious', 'CombatLimit', 'RangeAttackOnlyInDomain', 'RangeAttackIgnoreLOS', 'RangedCombatLimit', 'XPValueAttack', 'XPValueDefense', 'SpecialCargo', 'DomainCargo', 'Conscription', 'ExtraMaintenanceCost', 'NoMaintenance', 'Unhappiness', 'UnitArtInfo', 'UnitArtInfoCulturalVariation', 'UnitArtInfoEraVariation', 'ProjectPrereq', 'SpaceshipProject', 'LeaderPromotion', 'LeaderExperience', 'DontShowYields', 'ShowInPedia', 'MoveRate', 'UnitFlagIconOffset', 'PortraitIndex', 'IconAtlas', 'UnitFlagAtlas')
	SELECT	("UNIT_FIGHTER_CIV4"), ("TXT_KEY_UNIT_FIGHTER_CIV4"), "Civilopedia", "Strategy", "Help", "Requirements", "Combat", "RangedCombat", "Cost", "Moves", "Immobile", "Range", "BaseSightRange", "Class", "Special", "Capture", "CombatClass", "Domain", "CivilianAttackPriority", "DefaultUnitAI", "Food", "NoBadGoodies", "RivalTerritory", "MilitarySupport", "MilitaryProduction", "Pillage", "Found", "FoundAbroad", "CultureBombRadius", "GoldenAgeTurns", "IgnoreBuildingDefense", "PrereqResources", "Mechanized", "Suicide", "CaptureWhileEmbarked", "PrereqTech", "ObsoleteTech", "GoodyHutUpgradeUnitClass", "HurryCostModifier", "AdvancedStartCost", "MinAreaSize", "AirUnitCap", "NukeDamageLevel", "WorkRate", "NumFreeTechs", "RushBuilding", "BaseHurry", "HurryMultiplier", "BaseGold", "NumGoldPerEra", "SpreadReligion", "IsReligious", "CombatLimit", "RangeAttackOnlyInDomain", "RangeAttackIgnoreLOS", "RangedCombatLimit", "XPValueAttack", "XPValueDefense", "SpecialCargo", "DomainCargo", "Conscription", "ExtraMaintenanceCost", "NoMaintenance", "Unhappiness",
			("ART_DEF_UNIT_FIGHTER_CIV4"), "UnitArtInfoCulturalVariation", "UnitArtInfoEraVariation", "ProjectPrereq", "SpaceshipProject", "LeaderPromotion", "LeaderExperience", "DontShowYields", "ShowInPedia", "MoveRate", "UnitFlagIconOffset", "PortraitIndex", "IconAtlas", "UnitFlagAtlas"
	FROM "Units" WHERE (Type = "UNIT_FIGHTER");
INSERT INTO "Language_en_US" ( 'Tag', 'Text' )
	VALUES ( 'TXT_KEY_UNIT_FIGHTER_CIV4', 'Spitfire' );
INSERT INTO "Unit_AITypes" ('UnitType', 'UnitAIType')
	SELECT ("UNIT_FIGHTER_CIV4"), "UnitAIType"
	FROM "Unit_AITypes" WHERE (UnitType = "UNIT_FIGHTER");
INSERT INTO "Unit_ClassUpgrades" ('UnitType', 'UnitClassType')
	SELECT ("UNIT_FIGHTER_CIV4"), "UnitClassType"
	FROM "Unit_ClassUpgrades" WHERE (UnitType = "UNIT_FIGHTER");
--INSERT INTO "Civilization_UnitClassOverrides" ( 'CivilizationType', 'UnitClassType', 'UnitType' )
--	VALUES ( 'CIVILIZATION_INDIA', 'UNITCLASS_FIGHTER', 'UNIT_FIGHTER_CIV4' );
INSERT INTO "Unit_Flavors" ('UnitType', 'FlavorType', 'Flavor')
	SELECT ("UNIT_FIGHTER_CIV4"), "FlavorType", "Flavor"
	FROM "Unit_Flavors" WHERE (UnitType = "UNIT_FIGHTER");
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	SELECT ("UNIT_FIGHTER_CIV4"), "PromotionType"
	FROM "Unit_FreePromotions" WHERE (UnitType = "UNIT_FIGHTER");
INSERT INTO "Unit_ResourceQuantityRequirements" ('UnitType', 'ResourceType', 'Cost')
	SELECT ("UNIT_FIGHTER_CIV4"), "ResourceType", "Cost"
	FROM "Unit_ResourceQuantityRequirements" WHERE (UnitType = "UNIT_FIGHTER");
-----------

-- P-40 Warhawk (America)
INSERT INTO "Units" ('Type', 'Description', 'Civilopedia', 'Strategy', 'Help', 'Requirements', 'Combat', 'RangedCombat', 'Cost', 'Moves', 'Immobile', 'Range', 'BaseSightRange', 'Class', 'Special', 'Capture', 'CombatClass', 'Domain', 'CivilianAttackPriority', 'DefaultUnitAI', 'Food', 'NoBadGoodies', 'RivalTerritory', 'MilitarySupport', 'MilitaryProduction', 'Pillage', 'Found', 'FoundAbroad', 'CultureBombRadius', 'GoldenAgeTurns', 'IgnoreBuildingDefense', 'PrereqResources', 'Mechanized', 'Suicide', 'CaptureWhileEmbarked', 'PrereqTech', 'ObsoleteTech', 'GoodyHutUpgradeUnitClass', 'HurryCostModifier', 'AdvancedStartCost', 'MinAreaSize', 'AirUnitCap', 'NukeDamageLevel', 'WorkRate', 'NumFreeTechs', 'RushBuilding', 'BaseHurry', 'HurryMultiplier', 'BaseGold', 'NumGoldPerEra', 'SpreadReligion', 'IsReligious', 'CombatLimit', 'RangeAttackOnlyInDomain', 'RangeAttackIgnoreLOS', 'RangedCombatLimit', 'XPValueAttack', 'XPValueDefense', 'SpecialCargo', 'DomainCargo', 'Conscription', 'ExtraMaintenanceCost', 'NoMaintenance', 'Unhappiness', 'UnitArtInfo', 'UnitArtInfoCulturalVariation', 'UnitArtInfoEraVariation', 'ProjectPrereq', 'SpaceshipProject', 'LeaderPromotion', 'LeaderExperience', 'DontShowYields', 'ShowInPedia', 'MoveRate', 'UnitFlagIconOffset', 'PortraitIndex', 'IconAtlas', 'UnitFlagAtlas')
	SELECT	("UNIT_FIGHTER_P40"), ("TXT_KEY_UNIT_FIGHTER_P40"), "Civilopedia", "Strategy", "Help", "Requirements", "Combat", "RangedCombat", "Cost", "Moves", "Immobile", "Range", "BaseSightRange", "Class", "Special", "Capture", "CombatClass", "Domain", "CivilianAttackPriority", "DefaultUnitAI", "Food", "NoBadGoodies", "RivalTerritory", "MilitarySupport", "MilitaryProduction", "Pillage", "Found", "FoundAbroad", "CultureBombRadius", "GoldenAgeTurns", "IgnoreBuildingDefense", "PrereqResources", "Mechanized", "Suicide", "CaptureWhileEmbarked", "PrereqTech", "ObsoleteTech", "GoodyHutUpgradeUnitClass", "HurryCostModifier", "AdvancedStartCost", "MinAreaSize", "AirUnitCap", "NukeDamageLevel", "WorkRate", "NumFreeTechs", "RushBuilding", "BaseHurry", "HurryMultiplier", "BaseGold", "NumGoldPerEra", "SpreadReligion", "IsReligious", "CombatLimit", "RangeAttackOnlyInDomain", "RangeAttackIgnoreLOS", "RangedCombatLimit", "XPValueAttack", "XPValueDefense", "SpecialCargo", "DomainCargo", "Conscription", "ExtraMaintenanceCost", "NoMaintenance", "Unhappiness",
			("ART_DEF_UNIT_FIGHTER_P40"), "UnitArtInfoCulturalVariation", "UnitArtInfoEraVariation", ("PROJECT_P40"), "SpaceshipProject", "LeaderPromotion", "LeaderExperience", "DontShowYields", "ShowInPedia", "MoveRate", "UnitFlagIconOffset", "PortraitIndex", "IconAtlas", "UnitFlagAtlas"
	FROM "Units" WHERE (Type = "UNIT_FIGHTER");
INSERT INTO "Language_en_US" ( 'Tag', 'Text' )
	VALUES ( 'TXT_KEY_UNIT_FIGHTER_P40', 'P-40 Warhawk' );
INSERT INTO "Unit_AITypes" ('UnitType', 'UnitAIType')
	SELECT ("UNIT_FIGHTER_P40"), "UnitAIType"
	FROM "Unit_AITypes" WHERE (UnitType = "UNIT_FIGHTER");
INSERT INTO "Unit_ClassUpgrades" ('UnitType', 'UnitClassType')
	SELECT ("UNIT_FIGHTER_P40"), "UnitClassType"
	FROM "Unit_ClassUpgrades" WHERE (UnitType = "UNIT_FIGHTER");
INSERT INTO "Civilization_UnitClassOverrides" ( 'CivilizationType', 'UnitClassType', 'UnitType' )
	VALUES ( 'CIVILIZATION_AMERICA', 'UNITCLASS_FIGHTER', 'UNIT_FIGHTER_P40' );
INSERT INTO "Unit_Flavors" ('UnitType', 'FlavorType', 'Flavor')
	SELECT ("UNIT_FIGHTER_P40"), "FlavorType", "Flavor"
	FROM "Unit_Flavors" WHERE (UnitType = "UNIT_FIGHTER");
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	SELECT ("UNIT_FIGHTER_P40"), "PromotionType"
	FROM "Unit_FreePromotions" WHERE (UnitType = "UNIT_FIGHTER");
INSERT INTO "Unit_ResourceQuantityRequirements" ('UnitType', 'ResourceType', 'Cost')
	SELECT ("UNIT_FIGHTER_P40"), "ResourceType", "Cost"
	FROM "Unit_ResourceQuantityRequirements" WHERE (UnitType = "UNIT_FIGHTER");
-----------

-- P-40N China
INSERT INTO "Units" ('Type', 'Description', 'Civilopedia', 'Strategy', 'Help', 'Requirements', 'Combat', 'RangedCombat', 'Cost', 'Moves', 'Immobile', 'Range', 'BaseSightRange', 'Class', 'Special', 'Capture', 'CombatClass', 'Domain', 'CivilianAttackPriority', 'DefaultUnitAI', 'Food', 'NoBadGoodies', 'RivalTerritory', 'MilitarySupport', 'MilitaryProduction', 'Pillage', 'Found', 'FoundAbroad', 'CultureBombRadius', 'GoldenAgeTurns', 'IgnoreBuildingDefense', 'PrereqResources', 'Mechanized', 'Suicide', 'CaptureWhileEmbarked', 'PrereqTech', 'ObsoleteTech', 'GoodyHutUpgradeUnitClass', 'HurryCostModifier', 'AdvancedStartCost', 'MinAreaSize', 'AirUnitCap', 'NukeDamageLevel', 'WorkRate', 'NumFreeTechs', 'RushBuilding', 'BaseHurry', 'HurryMultiplier', 'BaseGold', 'NumGoldPerEra', 'SpreadReligion', 'IsReligious', 'CombatLimit', 'RangeAttackOnlyInDomain', 'RangeAttackIgnoreLOS', 'RangedCombatLimit', 'XPValueAttack', 'XPValueDefense', 'SpecialCargo', 'DomainCargo', 'Conscription', 'ExtraMaintenanceCost', 'NoMaintenance', 'Unhappiness', 'UnitArtInfo', 'UnitArtInfoCulturalVariation', 'UnitArtInfoEraVariation', 'ProjectPrereq', 'SpaceshipProject', 'LeaderPromotion', 'LeaderExperience', 'DontShowYields', 'ShowInPedia', 'MoveRate', 'UnitFlagIconOffset', 'PortraitIndex', 'IconAtlas', 'UnitFlagAtlas')
	SELECT	("UNIT_FIGHTER_P40N_CHINA"), ("TXT_KEY_UNIT_FIGHTER_P40N_CHINA"), "Civilopedia", "Strategy", "Help", "Requirements", "Combat", "RangedCombat", "Cost", "Moves", "Immobile", "Range", "BaseSightRange", "Class", "Special", "Capture", "CombatClass", "Domain", "CivilianAttackPriority", "DefaultUnitAI", "Food", "NoBadGoodies", "RivalTerritory", "MilitarySupport", "MilitaryProduction", "Pillage", "Found", "FoundAbroad", "CultureBombRadius", "GoldenAgeTurns", "IgnoreBuildingDefense", "PrereqResources", "Mechanized", "Suicide", "CaptureWhileEmbarked", "PrereqTech", "ObsoleteTech", "GoodyHutUpgradeUnitClass", "HurryCostModifier", "AdvancedStartCost", "MinAreaSize", "AirUnitCap", "NukeDamageLevel", "WorkRate", "NumFreeTechs", "RushBuilding", "BaseHurry", "HurryMultiplier", "BaseGold", "NumGoldPerEra", "SpreadReligion", "IsReligious", "CombatLimit", "RangeAttackOnlyInDomain", "RangeAttackIgnoreLOS", "RangedCombatLimit", "XPValueAttack", "XPValueDefense", "SpecialCargo", "DomainCargo", "Conscription", "ExtraMaintenanceCost", "NoMaintenance", "Unhappiness",
			("ART_DEF_UNIT_FIGHTER_P40N_CHINA"), "UnitArtInfoCulturalVariation", "UnitArtInfoEraVariation", "ProjectPrereq", "SpaceshipProject", "LeaderPromotion", "LeaderExperience", "DontShowYields", "ShowInPedia", "MoveRate", "UnitFlagIconOffset", "PortraitIndex", "IconAtlas", "UnitFlagAtlas"
	FROM "Units" WHERE (Type = "UNIT_FIGHTER");
INSERT INTO "Language_en_US" ( 'Tag', 'Text' )
	VALUES ( 'TXT_KEY_UNIT_FIGHTER_P40N_CHINA', 'P-40 Warhawk' );
INSERT INTO "Unit_AITypes" ('UnitType', 'UnitAIType')
	SELECT ("UNIT_FIGHTER_P40N_CHINA"), "UnitAIType"
	FROM "Unit_AITypes" WHERE (UnitType = "UNIT_FIGHTER");
INSERT INTO "Unit_ClassUpgrades" ('UnitType', 'UnitClassType')
	SELECT ("UNIT_FIGHTER_P40N_CHINA"), "UnitClassType"
	FROM "Unit_ClassUpgrades" WHERE (UnitType = "UNIT_FIGHTER");
INSERT INTO "Civilization_UnitClassOverrides" ( 'CivilizationType', 'UnitClassType', 'UnitType' )
	VALUES ( 'CIVILIZATION_CHINA', 'UNITCLASS_FIGHTER', 'UNIT_FIGHTER_P40N_CHINA' );
INSERT INTO "Unit_Flavors" ('UnitType', 'FlavorType', 'Flavor')
	SELECT ("UNIT_FIGHTER_P40N_CHINA"), "FlavorType", "Flavor"
	FROM "Unit_Flavors" WHERE (UnitType = "UNIT_FIGHTER");
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	SELECT ("UNIT_FIGHTER_P40N_CHINA"), "PromotionType"
	FROM "Unit_FreePromotions" WHERE (UnitType = "UNIT_FIGHTER");
INSERT INTO "Unit_ResourceQuantityRequirements" ('UnitType', 'ResourceType', 'Cost')
	SELECT ("UNIT_FIGHTER_P40N_CHINA"), "ResourceType", "Cost"
	FROM "Unit_ResourceQuantityRequirements" WHERE (UnitType = "UNIT_FIGHTER");
-----------

-- LaGG-3 Egypt
INSERT INTO "Units" ('Type', 'Description', 'Civilopedia', 'Strategy', 'Help', 'Requirements', 'Combat', 'RangedCombat', 'Cost', 'Moves', 'Immobile', 'Range', 'BaseSightRange', 'Class', 'Special', 'Capture', 'CombatClass', 'Domain', 'CivilianAttackPriority', 'DefaultUnitAI', 'Food', 'NoBadGoodies', 'RivalTerritory', 'MilitarySupport', 'MilitaryProduction', 'Pillage', 'Found', 'FoundAbroad', 'CultureBombRadius', 'GoldenAgeTurns', 'IgnoreBuildingDefense', 'PrereqResources', 'Mechanized', 'Suicide', 'CaptureWhileEmbarked', 'PrereqTech', 'ObsoleteTech', 'GoodyHutUpgradeUnitClass', 'HurryCostModifier', 'AdvancedStartCost', 'MinAreaSize', 'AirUnitCap', 'NukeDamageLevel', 'WorkRate', 'NumFreeTechs', 'RushBuilding', 'BaseHurry', 'HurryMultiplier', 'BaseGold', 'NumGoldPerEra', 'SpreadReligion', 'IsReligious', 'CombatLimit', 'RangeAttackOnlyInDomain', 'RangeAttackIgnoreLOS', 'RangedCombatLimit', 'XPValueAttack', 'XPValueDefense', 'SpecialCargo', 'DomainCargo', 'Conscription', 'ExtraMaintenanceCost', 'NoMaintenance', 'Unhappiness', 'UnitArtInfo', 'UnitArtInfoCulturalVariation', 'UnitArtInfoEraVariation', 'ProjectPrereq', 'SpaceshipProject', 'LeaderPromotion', 'LeaderExperience', 'DontShowYields', 'ShowInPedia', 'MoveRate', 'UnitFlagIconOffset', 'PortraitIndex', 'IconAtlas', 'UnitFlagAtlas')
	SELECT	("UNIT_FIGHTER_LAGG3_EGYPT"), ("TXT_KEY_UNIT_FIGHTER_LAGG3_EGYPT"), "Civilopedia", "Strategy", "Help", "Requirements", "Combat", "RangedCombat", "Cost", "Moves", "Immobile", "Range", "BaseSightRange", "Class", "Special", "Capture", "CombatClass", "Domain", "CivilianAttackPriority", "DefaultUnitAI", "Food", "NoBadGoodies", "RivalTerritory", "MilitarySupport", "MilitaryProduction", "Pillage", "Found", "FoundAbroad", "CultureBombRadius", "GoldenAgeTurns", "IgnoreBuildingDefense", "PrereqResources", "Mechanized", "Suicide", "CaptureWhileEmbarked", "PrereqTech", "ObsoleteTech", "GoodyHutUpgradeUnitClass", "HurryCostModifier", "AdvancedStartCost", "MinAreaSize", "AirUnitCap", "NukeDamageLevel", "WorkRate", "NumFreeTechs", "RushBuilding", "BaseHurry", "HurryMultiplier", "BaseGold", "NumGoldPerEra", "SpreadReligion", "IsReligious", "CombatLimit", "RangeAttackOnlyInDomain", "RangeAttackIgnoreLOS", "RangedCombatLimit", "XPValueAttack", "XPValueDefense", "SpecialCargo", "DomainCargo", "Conscription", "ExtraMaintenanceCost", "NoMaintenance", "Unhappiness",
			("ART_DEF_UNIT_FIGHTER_LAGG3_EGYPT"), "UnitArtInfoCulturalVariation", "UnitArtInfoEraVariation", "ProjectPrereq", "SpaceshipProject", "LeaderPromotion", "LeaderExperience", "DontShowYields", "ShowInPedia", "MoveRate", "UnitFlagIconOffset", "PortraitIndex", "IconAtlas", "UnitFlagAtlas"
	FROM "Units" WHERE (Type = "UNIT_FIGHTER");
INSERT INTO "Language_en_US" ( 'Tag', 'Text' )
	VALUES ( 'TXT_KEY_UNIT_FIGHTER_LAGG3_EGYPT', 'Lavochkin LaGG-3' );
INSERT INTO "Unit_AITypes" ('UnitType', 'UnitAIType')
	SELECT ("UNIT_FIGHTER_LAGG3_EGYPT"), "UnitAIType"
	FROM "Unit_AITypes" WHERE (UnitType = "UNIT_FIGHTER");
INSERT INTO "Unit_ClassUpgrades" ('UnitType', 'UnitClassType')
	SELECT ("UNIT_FIGHTER_LAGG3_EGYPT"), "UnitClassType"
	FROM "Unit_ClassUpgrades" WHERE (UnitType = "UNIT_FIGHTER");
--INSERT INTO "Civilization_UnitClassOverrides" ( 'CivilizationType', 'UnitClassType', 'UnitType' )
--	VALUES ( 'CIVILIZATION_EGYPT', 'UNITCLASS_FIGHTER', 'UNIT_FIGHTER_LAGG3_EGYPT' );
INSERT INTO "Unit_Flavors" ('UnitType', 'FlavorType', 'Flavor')
	SELECT ("UNIT_FIGHTER_LAGG3_EGYPT"), "FlavorType", "Flavor"
	FROM "Unit_Flavors" WHERE (UnitType = "UNIT_FIGHTER");
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	SELECT ("UNIT_FIGHTER_LAGG3_EGYPT"), "PromotionType"
	FROM "Unit_FreePromotions" WHERE (UnitType = "UNIT_FIGHTER");
INSERT INTO "Unit_ResourceQuantityRequirements" ('UnitType', 'ResourceType', 'Cost')
	SELECT ("UNIT_FIGHTER_LAGG3_EGYPT"), "ResourceType", "Cost"
	FROM "Unit_ResourceQuantityRequirements" WHERE (UnitType = "UNIT_FIGHTER");
-----------

-- Spitfire Greece
INSERT INTO "Units" ('Type', 'Description', 'Civilopedia', 'Strategy', 'Help', 'Requirements', 'Combat', 'RangedCombat', 'Cost', 'Moves', 'Immobile', 'Range', 'BaseSightRange', 'Class', 'Special', 'Capture', 'CombatClass', 'Domain', 'CivilianAttackPriority', 'DefaultUnitAI', 'Food', 'NoBadGoodies', 'RivalTerritory', 'MilitarySupport', 'MilitaryProduction', 'Pillage', 'Found', 'FoundAbroad', 'CultureBombRadius', 'GoldenAgeTurns', 'IgnoreBuildingDefense', 'PrereqResources', 'Mechanized', 'Suicide', 'CaptureWhileEmbarked', 'PrereqTech', 'ObsoleteTech', 'GoodyHutUpgradeUnitClass', 'HurryCostModifier', 'AdvancedStartCost', 'MinAreaSize', 'AirUnitCap', 'NukeDamageLevel', 'WorkRate', 'NumFreeTechs', 'RushBuilding', 'BaseHurry', 'HurryMultiplier', 'BaseGold', 'NumGoldPerEra', 'SpreadReligion', 'IsReligious', 'CombatLimit', 'RangeAttackOnlyInDomain', 'RangeAttackIgnoreLOS', 'RangedCombatLimit', 'XPValueAttack', 'XPValueDefense', 'SpecialCargo', 'DomainCargo', 'Conscription', 'ExtraMaintenanceCost', 'NoMaintenance', 'Unhappiness', 'UnitArtInfo', 'UnitArtInfoCulturalVariation', 'UnitArtInfoEraVariation', 'ProjectPrereq', 'SpaceshipProject', 'LeaderPromotion', 'LeaderExperience', 'DontShowYields', 'ShowInPedia', 'MoveRate', 'UnitFlagIconOffset', 'PortraitIndex', 'IconAtlas', 'UnitFlagAtlas')
	SELECT	("UNIT_FIGHTER_SPITFIRE_GREECE"), ("TXT_KEY_UNIT_FIGHTER_SPITFIRE_GREECE"), "Civilopedia", "Strategy", "Help", "Requirements", "Combat", "RangedCombat", "Cost", "Moves", "Immobile", "Range", "BaseSightRange", "Class", "Special", "Capture", "CombatClass", "Domain", "CivilianAttackPriority", "DefaultUnitAI", "Food", "NoBadGoodies", "RivalTerritory", "MilitarySupport", "MilitaryProduction", "Pillage", "Found", "FoundAbroad", "CultureBombRadius", "GoldenAgeTurns", "IgnoreBuildingDefense", "PrereqResources", "Mechanized", "Suicide", "CaptureWhileEmbarked", "PrereqTech", "ObsoleteTech", "GoodyHutUpgradeUnitClass", "HurryCostModifier", "AdvancedStartCost", "MinAreaSize", "AirUnitCap", "NukeDamageLevel", "WorkRate", "NumFreeTechs", "RushBuilding", "BaseHurry", "HurryMultiplier", "BaseGold", "NumGoldPerEra", "SpreadReligion", "IsReligious", "CombatLimit", "RangeAttackOnlyInDomain", "RangeAttackIgnoreLOS", "RangedCombatLimit", "XPValueAttack", "XPValueDefense", "SpecialCargo", "DomainCargo", "Conscription", "ExtraMaintenanceCost", "NoMaintenance", "Unhappiness",
			("ART_DEF_UNIT_FIGHTER_SPITFIRE_GREECE"), "UnitArtInfoCulturalVariation", "UnitArtInfoEraVariation", "ProjectPrereq", "SpaceshipProject", "LeaderPromotion", "LeaderExperience", "DontShowYields", "ShowInPedia", "MoveRate", "UnitFlagIconOffset", "PortraitIndex", "IconAtlas", "UnitFlagAtlas"
	FROM "Units" WHERE (Type = "UNIT_FIGHTER");
INSERT INTO "Language_en_US" ( 'Tag', 'Text' )
	VALUES ( 'TXT_KEY_UNIT_FIGHTER_SPITFIRE_GREECE', 'Spitfire' );
INSERT INTO "Unit_AITypes" ('UnitType', 'UnitAIType')
	SELECT ("UNIT_FIGHTER_SPITFIRE_GREECE"), "UnitAIType"
	FROM "Unit_AITypes" WHERE (UnitType = "UNIT_FIGHTER");
INSERT INTO "Unit_ClassUpgrades" ('UnitType', 'UnitClassType')
	SELECT ("UNIT_FIGHTER_SPITFIRE_GREECE"), "UnitClassType"
	FROM "Unit_ClassUpgrades" WHERE (UnitType = "UNIT_FIGHTER");
INSERT INTO "Civilization_UnitClassOverrides" ( 'CivilizationType', 'UnitClassType', 'UnitType' )
	VALUES ( 'CIVILIZATION_GREECE', 'UNITCLASS_FIGHTER', 'UNIT_FIGHTER_SPITFIRE_GREECE' );
INSERT INTO "Unit_Flavors" ('UnitType', 'FlavorType', 'Flavor')
	SELECT ("UNIT_FIGHTER_SPITFIRE_GREECE"), "FlavorType", "Flavor"
	FROM "Unit_Flavors" WHERE (UnitType = "UNIT_FIGHTER");
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	SELECT ("UNIT_FIGHTER_SPITFIRE_GREECE"), "PromotionType"
	FROM "Unit_FreePromotions" WHERE (UnitType = "UNIT_FIGHTER");
INSERT INTO "Unit_ResourceQuantityRequirements" ('UnitType', 'ResourceType', 'Cost')
	SELECT ("UNIT_FIGHTER_SPITFIRE_GREECE"), "ResourceType", "Cost"
	FROM "Unit_ResourceQuantityRequirements" WHERE (UnitType = "UNIT_FIGHTER");
-----------

-- Yak-9
INSERT INTO "Units" ('Type', 'Description', 'Civilopedia', 'Strategy', 'Help', 'Requirements', 'Combat', 'RangedCombat', 'Cost', 'Moves', 'Immobile', 'Range', 'BaseSightRange', 'Class', 'Special', 'Capture', 'CombatClass', 'Domain', 'CivilianAttackPriority', 'DefaultUnitAI', 'Food', 'NoBadGoodies', 'RivalTerritory', 'MilitarySupport', 'MilitaryProduction', 'Pillage', 'Found', 'FoundAbroad', 'CultureBombRadius', 'GoldenAgeTurns', 'IgnoreBuildingDefense', 'PrereqResources', 'Mechanized', 'Suicide', 'CaptureWhileEmbarked', 'PrereqTech', 'ObsoleteTech', 'GoodyHutUpgradeUnitClass', 'HurryCostModifier', 'AdvancedStartCost', 'MinAreaSize', 'AirUnitCap', 'NukeDamageLevel', 'WorkRate', 'NumFreeTechs', 'RushBuilding', 'BaseHurry', 'HurryMultiplier', 'BaseGold', 'NumGoldPerEra', 'SpreadReligion', 'IsReligious', 'CombatLimit', 'RangeAttackOnlyInDomain', 'RangeAttackIgnoreLOS', 'RangedCombatLimit', 'XPValueAttack', 'XPValueDefense', 'SpecialCargo', 'DomainCargo', 'Conscription', 'ExtraMaintenanceCost', 'NoMaintenance', 'Unhappiness', 'UnitArtInfo', 'UnitArtInfoCulturalVariation', 'UnitArtInfoEraVariation', 'ProjectPrereq', 'SpaceshipProject', 'LeaderPromotion', 'LeaderExperience', 'DontShowYields', 'ShowInPedia', 'MoveRate', 'UnitFlagIconOffset', 'PortraitIndex', 'IconAtlas', 'UnitFlagAtlas')
	SELECT	("UNIT_FIGHTER_YAK9"), ("TXT_KEY_UNIT_FIGHTER_YAK9"), "Civilopedia", "Strategy", "Help", "Requirements", "Combat", "RangedCombat", "Cost", "Moves", "Immobile", "Range", "BaseSightRange", "Class", "Special", "Capture", "CombatClass", "Domain", "CivilianAttackPriority", "DefaultUnitAI", "Food", "NoBadGoodies", "RivalTerritory", "MilitarySupport", "MilitaryProduction", "Pillage", "Found", "FoundAbroad", "CultureBombRadius", "GoldenAgeTurns", "IgnoreBuildingDefense", "PrereqResources", "Mechanized", "Suicide", "CaptureWhileEmbarked", "PrereqTech", "ObsoleteTech", "GoodyHutUpgradeUnitClass", "HurryCostModifier", "AdvancedStartCost", "MinAreaSize", "AirUnitCap", "NukeDamageLevel", "WorkRate", "NumFreeTechs", "RushBuilding", "BaseHurry", "HurryMultiplier", "BaseGold", "NumGoldPerEra", "SpreadReligion", "IsReligious", "CombatLimit", "RangeAttackOnlyInDomain", "RangeAttackIgnoreLOS", "RangedCombatLimit", "XPValueAttack", "XPValueDefense", "SpecialCargo", "DomainCargo", "Conscription", "ExtraMaintenanceCost", "NoMaintenance", "Unhappiness",
			("ART_DEF_UNIT_FIGHTER_YAK9"), "UnitArtInfoCulturalVariation", "UnitArtInfoEraVariation", "ProjectPrereq", "SpaceshipProject", "LeaderPromotion", "LeaderExperience", "DontShowYields", "ShowInPedia", "MoveRate", "UnitFlagIconOffset", "PortraitIndex", "IconAtlas", "UnitFlagAtlas"
	FROM "Units" WHERE (Type = "UNIT_FIGHTER");
INSERT INTO "Language_en_US" ( 'Tag', 'Text' )
	VALUES ( 'TXT_KEY_UNIT_FIGHTER_YAK9', 'Yakovlev Yak-9' );
INSERT INTO "Unit_AITypes" ('UnitType', 'UnitAIType')
	SELECT ("UNIT_FIGHTER_YAK9"), "UnitAIType"
	FROM "Unit_AITypes" WHERE (UnitType = "UNIT_FIGHTER");
INSERT INTO "Unit_ClassUpgrades" ('UnitType', 'UnitClassType')
	SELECT ("UNIT_FIGHTER_YAK9"), "UnitClassType"
	FROM "Unit_ClassUpgrades" WHERE (UnitType = "UNIT_FIGHTER");
--INSERT INTO "Civilization_UnitClassOverrides" ( 'CivilizationType', 'UnitClassType', 'UnitType' )
--	VALUES ( 'CIVILIZATION_RUSSIA', 'UNITCLASS_FIGHTER', 'UNIT_FIGHTER_YAK9' );
INSERT INTO "Unit_Flavors" ('UnitType', 'FlavorType', 'Flavor')
	SELECT ("UNIT_FIGHTER_YAK9"), "FlavorType", "Flavor"
	FROM "Unit_Flavors" WHERE (UnitType = "UNIT_FIGHTER");
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	SELECT ("UNIT_FIGHTER_YAK9"), "PromotionType"
	FROM "Unit_FreePromotions" WHERE (UnitType = "UNIT_FIGHTER");
INSERT INTO "Unit_ResourceQuantityRequirements" ('UnitType', 'ResourceType', 'Cost')
	SELECT ("UNIT_FIGHTER_YAK9"), "ResourceType", "Cost"
	FROM "Unit_ResourceQuantityRequirements" WHERE (UnitType = "UNIT_FIGHTER");
-----------

-- Lagg-3
INSERT INTO "Units" ('Type', 'Description', 'Civilopedia', 'Strategy', 'Help', 'Requirements', 'Combat', 'RangedCombat', 'Cost', 'Moves', 'Immobile', 'Range', 'BaseSightRange', 'Class', 'Special', 'Capture', 'CombatClass', 'Domain', 'CivilianAttackPriority', 'DefaultUnitAI', 'Food', 'NoBadGoodies', 'RivalTerritory', 'MilitarySupport', 'MilitaryProduction', 'Pillage', 'Found', 'FoundAbroad', 'CultureBombRadius', 'GoldenAgeTurns', 'IgnoreBuildingDefense', 'PrereqResources', 'Mechanized', 'Suicide', 'CaptureWhileEmbarked', 'PrereqTech', 'ObsoleteTech', 'GoodyHutUpgradeUnitClass', 'HurryCostModifier', 'AdvancedStartCost', 'MinAreaSize', 'AirUnitCap', 'NukeDamageLevel', 'WorkRate', 'NumFreeTechs', 'RushBuilding', 'BaseHurry', 'HurryMultiplier', 'BaseGold', 'NumGoldPerEra', 'SpreadReligion', 'IsReligious', 'CombatLimit', 'RangeAttackOnlyInDomain', 'RangeAttackIgnoreLOS', 'RangedCombatLimit', 'XPValueAttack', 'XPValueDefense', 'SpecialCargo', 'DomainCargo', 'Conscription', 'ExtraMaintenanceCost', 'NoMaintenance', 'Unhappiness', 'UnitArtInfo', 'UnitArtInfoCulturalVariation', 'UnitArtInfoEraVariation', 'ProjectPrereq', 'SpaceshipProject', 'LeaderPromotion', 'LeaderExperience', 'DontShowYields', 'ShowInPedia', 'MoveRate', 'UnitFlagIconOffset', 'PortraitIndex', 'IconAtlas', 'UnitFlagAtlas')
	SELECT	("UNIT_FIGHTER_LAGG3"), ("TXT_KEY_UNIT_FIGHTER_LAGG3"), "Civilopedia", "Strategy", "Help", "Requirements", "Combat", "RangedCombat", "Cost", "Moves", "Immobile", "Range", "BaseSightRange", "Class", "Special", "Capture", "CombatClass", "Domain", "CivilianAttackPriority", "DefaultUnitAI", "Food", "NoBadGoodies", "RivalTerritory", "MilitarySupport", "MilitaryProduction", "Pillage", "Found", "FoundAbroad", "CultureBombRadius", "GoldenAgeTurns", "IgnoreBuildingDefense", "PrereqResources", "Mechanized", "Suicide", "CaptureWhileEmbarked", "PrereqTech", "ObsoleteTech", "GoodyHutUpgradeUnitClass", "HurryCostModifier", "AdvancedStartCost", "MinAreaSize", "AirUnitCap", "NukeDamageLevel", "WorkRate", "NumFreeTechs", "RushBuilding", "BaseHurry", "HurryMultiplier", "BaseGold", "NumGoldPerEra", "SpreadReligion", "IsReligious", "CombatLimit", "RangeAttackOnlyInDomain", "RangeAttackIgnoreLOS", "RangedCombatLimit", "XPValueAttack", "XPValueDefense", "SpecialCargo", "DomainCargo", "Conscription", "ExtraMaintenanceCost", "NoMaintenance", "Unhappiness",
			("ART_DEF_UNIT_FIGHTER_LAGG3"), "UnitArtInfoCulturalVariation", "UnitArtInfoEraVariation", ("PROJECT_LAGG3"), "SpaceshipProject", "LeaderPromotion", "LeaderExperience", "DontShowYields", "ShowInPedia", "MoveRate", "UnitFlagIconOffset", "PortraitIndex", "IconAtlas", "UnitFlagAtlas"
	FROM "Units" WHERE (Type = "UNIT_FIGHTER");
INSERT INTO "Language_en_US" ( 'Tag', 'Text' )
	VALUES ( 'TXT_KEY_UNIT_FIGHTER_LAGG3', 'Lavochkin LaGG-3' );
INSERT INTO "Unit_AITypes" ('UnitType', 'UnitAIType')
	SELECT ("UNIT_FIGHTER_LAGG3"), "UnitAIType"
	FROM "Unit_AITypes" WHERE (UnitType = "UNIT_FIGHTER");
INSERT INTO "Unit_ClassUpgrades" ('UnitType', 'UnitClassType')
	SELECT ("UNIT_FIGHTER_LAGG3"), "UnitClassType"
	FROM "Unit_ClassUpgrades" WHERE (UnitType = "UNIT_FIGHTER");
INSERT INTO "Civilization_UnitClassOverrides" ( 'CivilizationType', 'UnitClassType', 'UnitType' )
	VALUES ( 'CIVILIZATION_RUSSIA', 'UNITCLASS_FIGHTER', 'UNIT_FIGHTER_LAGG3' );
INSERT INTO "Unit_Flavors" ('UnitType', 'FlavorType', 'Flavor')
	SELECT ("UNIT_FIGHTER_LAGG3"), "FlavorType", "Flavor"
	FROM "Unit_Flavors" WHERE (UnitType = "UNIT_FIGHTER");
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	SELECT ("UNIT_FIGHTER_LAGG3"), "PromotionType"
	FROM "Unit_FreePromotions" WHERE (UnitType = "UNIT_FIGHTER");
INSERT INTO "Unit_ResourceQuantityRequirements" ('UnitType', 'ResourceType', 'Cost')
	SELECT ("UNIT_FIGHTER_LAGG3"), "ResourceType", "Cost"
	FROM "Unit_ResourceQuantityRequirements" WHERE (UnitType = "UNIT_FIGHTER");
-----------

-- G-50
INSERT INTO "Units" ('Type', 'Description', 'Civilopedia', 'Strategy', 'Help', 'Requirements', 'Combat', 'RangedCombat', 'Cost', 'Moves', 'Immobile', 'Range', 'BaseSightRange', 'Class', 'Special', 'Capture', 'CombatClass', 'Domain', 'CivilianAttackPriority', 'DefaultUnitAI', 'Food', 'NoBadGoodies', 'RivalTerritory', 'MilitarySupport', 'MilitaryProduction', 'Pillage', 'Found', 'FoundAbroad', 'CultureBombRadius', 'GoldenAgeTurns', 'IgnoreBuildingDefense', 'PrereqResources', 'Mechanized', 'Suicide', 'CaptureWhileEmbarked', 'PrereqTech', 'ObsoleteTech', 'GoodyHutUpgradeUnitClass', 'HurryCostModifier', 'AdvancedStartCost', 'MinAreaSize', 'AirUnitCap', 'NukeDamageLevel', 'WorkRate', 'NumFreeTechs', 'RushBuilding', 'BaseHurry', 'HurryMultiplier', 'BaseGold', 'NumGoldPerEra', 'SpreadReligion', 'IsReligious', 'CombatLimit', 'RangeAttackOnlyInDomain', 'RangeAttackIgnoreLOS', 'RangedCombatLimit', 'XPValueAttack', 'XPValueDefense', 'SpecialCargo', 'DomainCargo', 'Conscription', 'ExtraMaintenanceCost', 'NoMaintenance', 'Unhappiness', 'UnitArtInfo', 'UnitArtInfoCulturalVariation', 'UnitArtInfoEraVariation', 'ProjectPrereq', 'SpaceshipProject', 'LeaderPromotion', 'LeaderExperience', 'DontShowYields', 'ShowInPedia', 'MoveRate', 'UnitFlagIconOffset', 'PortraitIndex', 'IconAtlas', 'UnitFlagAtlas')
	SELECT	("UNIT_FIGHTER_G50"), ("TXT_KEY_UNIT_FIGHTER_G50"), "Civilopedia", "Strategy", "Help", "Requirements", "Combat", "RangedCombat", "Cost", "Moves", "Immobile", "Range", "BaseSightRange", "Class", "Special", "Capture", "CombatClass", "Domain", "CivilianAttackPriority", "DefaultUnitAI", "Food", "NoBadGoodies", "RivalTerritory", "MilitarySupport", "MilitaryProduction", "Pillage", "Found", "FoundAbroad", "CultureBombRadius", "GoldenAgeTurns", "IgnoreBuildingDefense", "PrereqResources", "Mechanized", "Suicide", "CaptureWhileEmbarked", "PrereqTech", "ObsoleteTech", "GoodyHutUpgradeUnitClass", "HurryCostModifier", "AdvancedStartCost", "MinAreaSize", "AirUnitCap", "NukeDamageLevel", "WorkRate", "NumFreeTechs", "RushBuilding", "BaseHurry", "HurryMultiplier", "BaseGold", "NumGoldPerEra", "SpreadReligion", "IsReligious", "CombatLimit", "RangeAttackOnlyInDomain", "RangeAttackIgnoreLOS", "RangedCombatLimit", "XPValueAttack", "XPValueDefense", "SpecialCargo", "DomainCargo", "Conscription", "ExtraMaintenanceCost", "NoMaintenance", "Unhappiness",
			("ART_DEF_UNIT_FIGHTER_G50"), "UnitArtInfoCulturalVariation", "UnitArtInfoEraVariation", ("PROJECT_G50"), "SpaceshipProject", "LeaderPromotion", "LeaderExperience", "DontShowYields", "ShowInPedia", "MoveRate", "UnitFlagIconOffset", "PortraitIndex", "IconAtlas", "UnitFlagAtlas"
	FROM "Units" WHERE (Type = "UNIT_FIGHTER");
INSERT INTO "Language_en_US" ( 'Tag', 'Text' )
	VALUES ( 'TXT_KEY_UNIT_FIGHTER_G50', 'Fiat G.50 Freccia' );
INSERT INTO "Unit_AITypes" ('UnitType', 'UnitAIType')
	SELECT ("UNIT_FIGHTER_G50"), "UnitAIType"
	FROM "Unit_AITypes" WHERE (UnitType = "UNIT_FIGHTER");
INSERT INTO "Unit_ClassUpgrades" ('UnitType', 'UnitClassType')
	SELECT ("UNIT_FIGHTER_G50"), "UnitClassType"
	FROM "Unit_ClassUpgrades" WHERE (UnitType = "UNIT_FIGHTER");
INSERT INTO "Civilization_UnitClassOverrides" ( 'CivilizationType', 'UnitClassType', 'UnitType' )
	VALUES ( 'CIVILIZATION_ROME', 'UNITCLASS_FIGHTER', 'UNIT_FIGHTER_G50' );
INSERT INTO "Unit_Flavors" ('UnitType', 'FlavorType', 'Flavor')
	SELECT ("UNIT_FIGHTER_G50"), "FlavorType", "Flavor"
	FROM "Unit_Flavors" WHERE (UnitType = "UNIT_FIGHTER");
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	SELECT ("UNIT_FIGHTER_G50"), "PromotionType"
	FROM "Unit_FreePromotions" WHERE (UnitType = "UNIT_FIGHTER");
INSERT INTO "Unit_ResourceQuantityRequirements" ('UnitType', 'ResourceType', 'Cost')
	SELECT ("UNIT_FIGHTER_G50"), "ResourceType", "Cost"
	FROM "Unit_ResourceQuantityRequirements" WHERE (UnitType = "UNIT_FIGHTER");
-----------

-- MB 152
INSERT INTO "Units" ('Type', 'Description', 'Civilopedia', 'Strategy', 'Help', 'Requirements', 'Combat', 'RangedCombat', 'Cost', 'Moves', 'Immobile', 'Range', 'BaseSightRange', 'Class', 'Special', 'Capture', 'CombatClass', 'Domain', 'CivilianAttackPriority', 'DefaultUnitAI', 'Food', 'NoBadGoodies', 'RivalTerritory', 'MilitarySupport', 'MilitaryProduction', 'Pillage', 'Found', 'FoundAbroad', 'CultureBombRadius', 'GoldenAgeTurns', 'IgnoreBuildingDefense', 'PrereqResources', 'Mechanized', 'Suicide', 'CaptureWhileEmbarked', 'PrereqTech', 'ObsoleteTech', 'GoodyHutUpgradeUnitClass', 'HurryCostModifier', 'AdvancedStartCost', 'MinAreaSize', 'AirUnitCap', 'NukeDamageLevel', 'WorkRate', 'NumFreeTechs', 'RushBuilding', 'BaseHurry', 'HurryMultiplier', 'BaseGold', 'NumGoldPerEra', 'SpreadReligion', 'IsReligious', 'CombatLimit', 'RangeAttackOnlyInDomain', 'RangeAttackIgnoreLOS', 'RangedCombatLimit', 'XPValueAttack', 'XPValueDefense', 'SpecialCargo', 'DomainCargo', 'Conscription', 'ExtraMaintenanceCost', 'NoMaintenance', 'Unhappiness', 'UnitArtInfo', 'UnitArtInfoCulturalVariation', 'UnitArtInfoEraVariation', 'ProjectPrereq', 'SpaceshipProject', 'LeaderPromotion', 'LeaderExperience', 'DontShowYields', 'ShowInPedia', 'MoveRate', 'UnitFlagIconOffset', 'PortraitIndex', 'IconAtlas', 'UnitFlagAtlas')
	SELECT	("UNIT_FIGHTER_MB152"), ("TXT_KEY_UNIT_FIGHTER_MB152"), "Civilopedia", "Strategy", "Help", "Requirements", "Combat", "RangedCombat", "Cost", "Moves", "Immobile", "Range", "BaseSightRange", "Class", "Special", "Capture", "CombatClass", "Domain", "CivilianAttackPriority", "DefaultUnitAI", "Food", "NoBadGoodies", "RivalTerritory", "MilitarySupport", "MilitaryProduction", "Pillage", "Found", "FoundAbroad", "CultureBombRadius", "GoldenAgeTurns", "IgnoreBuildingDefense", "PrereqResources", "Mechanized", "Suicide", "CaptureWhileEmbarked", "PrereqTech", "ObsoleteTech", "GoodyHutUpgradeUnitClass", "HurryCostModifier", "AdvancedStartCost", "MinAreaSize", "AirUnitCap", "NukeDamageLevel", "WorkRate", "NumFreeTechs", "RushBuilding", "BaseHurry", "HurryMultiplier", "BaseGold", "NumGoldPerEra", "SpreadReligion", "IsReligious", "CombatLimit", "RangeAttackOnlyInDomain", "RangeAttackIgnoreLOS", "RangedCombatLimit", "XPValueAttack", "XPValueDefense", "SpecialCargo", "DomainCargo", "Conscription", "ExtraMaintenanceCost", "NoMaintenance", "Unhappiness",
			("ART_DEF_UNIT_FIGHTER_MB152"), "UnitArtInfoCulturalVariation", "UnitArtInfoEraVariation", ("PROJECT_MB152"), "SpaceshipProject", "LeaderPromotion", "LeaderExperience", "DontShowYields", "ShowInPedia", "MoveRate", "UnitFlagIconOffset", "PortraitIndex", "IconAtlas", "UnitFlagAtlas"
	FROM "Units" WHERE (Type = "UNIT_FIGHTER");
INSERT INTO "Language_en_US" ( 'Tag', 'Text' )
	VALUES ( 'TXT_KEY_UNIT_FIGHTER_MB152', 'Bloch MB.152' );
INSERT INTO "Unit_AITypes" ('UnitType', 'UnitAIType')
	SELECT ("UNIT_FIGHTER_MB152"), "UnitAIType"
	FROM "Unit_AITypes" WHERE (UnitType = "UNIT_FIGHTER");
INSERT INTO "Unit_ClassUpgrades" ('UnitType', 'UnitClassType')
	SELECT ("UNIT_FIGHTER_MB152"), "UnitClassType"
	FROM "Unit_ClassUpgrades" WHERE (UnitType = "UNIT_FIGHTER");
INSERT INTO "Civilization_UnitClassOverrides" ( 'CivilizationType', 'UnitClassType', 'UnitType' )
	VALUES ( 'CIVILIZATION_FRANCE', 'UNITCLASS_FIGHTER', 'UNIT_FIGHTER_MB152' );
INSERT INTO "Unit_Flavors" ('UnitType', 'FlavorType', 'Flavor')
	SELECT ("UNIT_FIGHTER_MB152"), "FlavorType", "Flavor"
	FROM "Unit_Flavors" WHERE (UnitType = "UNIT_FIGHTER");
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	SELECT ("UNIT_FIGHTER_MB152"), "PromotionType"
	FROM "Unit_FreePromotions" WHERE (UnitType = "UNIT_FIGHTER");
INSERT INTO "Unit_ResourceQuantityRequirements" ('UnitType', 'ResourceType', 'Cost')
	SELECT ("UNIT_FIGHTER_MB152"), "ResourceType", "Cost"
	FROM "Unit_ResourceQuantityRequirements" WHERE (UnitType = "UNIT_FIGHTER");
-----------

-- Bf109 Spain
INSERT INTO "Units" ('Type', 'Description', 'Civilopedia', 'Strategy', 'Help', 'Requirements', 'Combat', 'RangedCombat', 'Cost', 'Moves', 'Immobile', 'Range', 'BaseSightRange', 'Class', 'Special', 'Capture', 'CombatClass', 'Domain', 'CivilianAttackPriority', 'DefaultUnitAI', 'Food', 'NoBadGoodies', 'RivalTerritory', 'MilitarySupport', 'MilitaryProduction', 'Pillage', 'Found', 'FoundAbroad', 'CultureBombRadius', 'GoldenAgeTurns', 'IgnoreBuildingDefense', 'PrereqResources', 'Mechanized', 'Suicide', 'CaptureWhileEmbarked', 'PrereqTech', 'ObsoleteTech', 'GoodyHutUpgradeUnitClass', 'HurryCostModifier', 'AdvancedStartCost', 'MinAreaSize', 'AirUnitCap', 'NukeDamageLevel', 'WorkRate', 'NumFreeTechs', 'RushBuilding', 'BaseHurry', 'HurryMultiplier', 'BaseGold', 'NumGoldPerEra', 'SpreadReligion', 'IsReligious', 'CombatLimit', 'RangeAttackOnlyInDomain', 'RangeAttackIgnoreLOS', 'RangedCombatLimit', 'XPValueAttack', 'XPValueDefense', 'SpecialCargo', 'DomainCargo', 'Conscription', 'ExtraMaintenanceCost', 'NoMaintenance', 'Unhappiness', 'UnitArtInfo', 'UnitArtInfoCulturalVariation', 'UnitArtInfoEraVariation', 'ProjectPrereq', 'SpaceshipProject', 'LeaderPromotion', 'LeaderExperience', 'DontShowYields', 'ShowInPedia', 'MoveRate', 'UnitFlagIconOffset', 'PortraitIndex', 'IconAtlas', 'UnitFlagAtlas')
	SELECT	("UNIT_FIGHTER_BF109_SPAIN"), ("TXT_KEY_UNIT_FIGHTER_BF109_SPAIN"), "Civilopedia", "Strategy", "Help", "Requirements", "Combat", "RangedCombat", "Cost", "Moves", "Immobile", "Range", "BaseSightRange", "Class", "Special", "Capture", "CombatClass", "Domain", "CivilianAttackPriority", "DefaultUnitAI", "Food", "NoBadGoodies", "RivalTerritory", "MilitarySupport", "MilitaryProduction", "Pillage", "Found", "FoundAbroad", "CultureBombRadius", "GoldenAgeTurns", "IgnoreBuildingDefense", "PrereqResources", "Mechanized", "Suicide", "CaptureWhileEmbarked", "PrereqTech", "ObsoleteTech", "GoodyHutUpgradeUnitClass", "HurryCostModifier", "AdvancedStartCost", "MinAreaSize", "AirUnitCap", "NukeDamageLevel", "WorkRate", "NumFreeTechs", "RushBuilding", "BaseHurry", "HurryMultiplier", "BaseGold", "NumGoldPerEra", "SpreadReligion", "IsReligious", "CombatLimit", "RangeAttackOnlyInDomain", "RangeAttackIgnoreLOS", "RangedCombatLimit", "XPValueAttack", "XPValueDefense", "SpecialCargo", "DomainCargo", "Conscription", "ExtraMaintenanceCost", "NoMaintenance", "Unhappiness",
			("ART_DEF_UNIT_FIGHTER_BF109_SPAIN"), "UnitArtInfoCulturalVariation", "UnitArtInfoEraVariation", "ProjectPrereq", "SpaceshipProject", "LeaderPromotion", "LeaderExperience", "DontShowYields", "ShowInPedia", "MoveRate", "UnitFlagIconOffset", "PortraitIndex", "IconAtlas", "UnitFlagAtlas"
	FROM "Units" WHERE (Type = "UNIT_FIGHTER");
INSERT INTO "Language_en_US" ( 'Tag', 'Text' )
	VALUES ( 'TXT_KEY_UNIT_FIGHTER_BF109_SPAIN', 'Messerschmitt BF-109' );
INSERT INTO "Unit_AITypes" ('UnitType', 'UnitAIType')
	SELECT ("UNIT_FIGHTER_BF109_SPAIN"), "UnitAIType"
	FROM "Unit_AITypes" WHERE (UnitType = "UNIT_FIGHTER");
INSERT INTO "Unit_ClassUpgrades" ('UnitType', 'UnitClassType')
	SELECT ("UNIT_FIGHTER_BF109_SPAIN"), "UnitClassType"
	FROM "Unit_ClassUpgrades" WHERE (UnitType = "UNIT_FIGHTER");
--INSERT INTO "Civilization_UnitClassOverrides" ( 'CivilizationType', 'UnitClassType', 'UnitType' )
--	VALUES ( 'CIVILIZATION_SPAIN', 'UNITCLASS_FIGHTER', 'UNIT_FIGHTER_BF109_SPAIN' );
INSERT INTO "Unit_Flavors" ('UnitType', 'FlavorType', 'Flavor')
	SELECT ("UNIT_FIGHTER_BF109_SPAIN"), "FlavorType", "Flavor"
	FROM "Unit_Flavors" WHERE (UnitType = "UNIT_FIGHTER");
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	SELECT ("UNIT_FIGHTER_BF109_SPAIN"), "PromotionType"
	FROM "Unit_FreePromotions" WHERE (UnitType = "UNIT_FIGHTER");
INSERT INTO "Unit_ResourceQuantityRequirements" ('UnitType', 'ResourceType', 'Cost')
	SELECT ("UNIT_FIGHTER_BF109_SPAIN"), "ResourceType", "Cost"
	FROM "Unit_ResourceQuantityRequirements" WHERE (UnitType = "UNIT_FIGHTER");
-----------

-- BF-109 E
INSERT INTO "Units" ('Type', 'Description', 'Civilopedia', 'Strategy', 'Help', 'Requirements', 'Combat', 'RangedCombat', 'Cost', 'Moves', 'Immobile', 'Range', 'BaseSightRange', 'Class', 'Special', 'Capture', 'CombatClass', 'Domain', 'CivilianAttackPriority', 'DefaultUnitAI', 'Food', 'NoBadGoodies', 'RivalTerritory', 'MilitarySupport', 'MilitaryProduction', 'Pillage', 'Found', 'FoundAbroad', 'CultureBombRadius', 'GoldenAgeTurns', 'IgnoreBuildingDefense', 'PrereqResources', 'Mechanized', 'Suicide', 'CaptureWhileEmbarked', 'PrereqTech', 'ObsoleteTech', 'GoodyHutUpgradeUnitClass', 'HurryCostModifier', 'AdvancedStartCost', 'MinAreaSize', 'AirUnitCap', 'NukeDamageLevel', 'WorkRate', 'NumFreeTechs', 'RushBuilding', 'BaseHurry', 'HurryMultiplier', 'BaseGold', 'NumGoldPerEra', 'SpreadReligion', 'IsReligious', 'CombatLimit', 'RangeAttackOnlyInDomain', 'RangeAttackIgnoreLOS', 'RangedCombatLimit', 'XPValueAttack', 'XPValueDefense', 'SpecialCargo', 'DomainCargo', 'Conscription', 'ExtraMaintenanceCost', 'NoMaintenance', 'Unhappiness', 'UnitArtInfo', 'UnitArtInfoCulturalVariation', 'UnitArtInfoEraVariation', 'ProjectPrereq', 'SpaceshipProject', 'LeaderPromotion', 'LeaderExperience', 'DontShowYields', 'ShowInPedia', 'MoveRate', 'UnitFlagIconOffset', 'PortraitIndex', 'IconAtlas', 'UnitFlagAtlas')
	SELECT	("UNIT_FIGHTER_BF109"), ("TXT_KEY_UNIT_FIGHTER_BF109"), "Civilopedia", "Strategy", "Help", "Requirements", "Combat", "RangedCombat", "Cost", "Moves", "Immobile", "Range", "BaseSightRange", "Class", "Special", "Capture", "CombatClass", "Domain", "CivilianAttackPriority", "DefaultUnitAI", "Food", "NoBadGoodies", "RivalTerritory", "MilitarySupport", "MilitaryProduction", "Pillage", "Found", "FoundAbroad", "CultureBombRadius", "GoldenAgeTurns", "IgnoreBuildingDefense", "PrereqResources", "Mechanized", "Suicide", "CaptureWhileEmbarked", "PrereqTech", "ObsoleteTech", "GoodyHutUpgradeUnitClass", "HurryCostModifier", "AdvancedStartCost", "MinAreaSize", "AirUnitCap", "NukeDamageLevel", "WorkRate", "NumFreeTechs", "RushBuilding", "BaseHurry", "HurryMultiplier", "BaseGold", "NumGoldPerEra", "SpreadReligion", "IsReligious", "CombatLimit", "RangeAttackOnlyInDomain", "RangeAttackIgnoreLOS", "RangedCombatLimit", "XPValueAttack", "XPValueDefense", "SpecialCargo", "DomainCargo", "Conscription", "ExtraMaintenanceCost", "NoMaintenance", "Unhappiness",
			("ART_DEF_UNIT_FIGHTER_BF109"), "UnitArtInfoCulturalVariation", "UnitArtInfoEraVariation", "ProjectPrereq", "SpaceshipProject", "LeaderPromotion", "LeaderExperience", "DontShowYields", "ShowInPedia", "MoveRate", "UnitFlagIconOffset", "PortraitIndex", "IconAtlas", "UnitFlagAtlas"
	FROM "Units" WHERE (Type = "UNIT_FIGHTER_B");
INSERT INTO "Language_en_US" ( 'Tag', 'Text' )
	VALUES ( 'TXT_KEY_UNIT_FIGHTER_BF109', 'Messerschmitt BF-109E' );
INSERT INTO "Unit_AITypes" ('UnitType', 'UnitAIType')
	SELECT ("UNIT_FIGHTER_BF109"), "UnitAIType"
	FROM "Unit_AITypes" WHERE (UnitType = "UNIT_FIGHTER_B");
INSERT INTO "Unit_ClassUpgrades" ('UnitType', 'UnitClassType')
	SELECT ("UNIT_FIGHTER_BF109"), "UnitClassType"
	FROM "Unit_ClassUpgrades" WHERE (UnitType = "UNIT_FIGHTER_B");
INSERT INTO "Civilization_UnitClassOverrides" ( 'CivilizationType', 'UnitClassType', 'UnitType' )
	VALUES ( 'CIVILIZATION_GERMANY', 'UNITCLASS_FIGHTER_B', 'UNIT_FIGHTER_BF109' );
INSERT INTO "Unit_Flavors" ('UnitType', 'FlavorType', 'Flavor')
	SELECT ("UNIT_FIGHTER_BF109"), "FlavorType", "Flavor"
	FROM "Unit_Flavors" WHERE (UnitType = "UNIT_FIGHTER_B");
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	SELECT ("UNIT_FIGHTER_BF109"), "PromotionType"
	FROM "Unit_FreePromotions" WHERE (UnitType = "UNIT_FIGHTER_B");
INSERT INTO "Unit_ResourceQuantityRequirements" ('UnitType', 'ResourceType', 'Cost')
	SELECT ("UNIT_FIGHTER_BF109"), "ResourceType", "Cost"
	FROM "Unit_ResourceQuantityRequirements" WHERE (UnitType = "UNIT_FIGHTER_B");
-----------

-- ZERO
INSERT INTO "Units" ('Type', 'Description', 'Civilopedia', 'Strategy', 'Help', 'Requirements', 'Combat', 'RangedCombat', 'Cost', 'Moves', 'Immobile', 'Range', 'BaseSightRange', 'Class', 'Special', 'Capture', 'CombatClass', 'Domain', 'CivilianAttackPriority', 'DefaultUnitAI', 'Food', 'NoBadGoodies', 'RivalTerritory', 'MilitarySupport', 'MilitaryProduction', 'Pillage', 'Found', 'FoundAbroad', 'CultureBombRadius', 'GoldenAgeTurns', 'IgnoreBuildingDefense', 'PrereqResources', 'Mechanized', 'Suicide', 'CaptureWhileEmbarked', 'PrereqTech', 'ObsoleteTech', 'GoodyHutUpgradeUnitClass', 'HurryCostModifier', 'AdvancedStartCost', 'MinAreaSize', 'AirUnitCap', 'NukeDamageLevel', 'WorkRate', 'NumFreeTechs', 'RushBuilding', 'BaseHurry', 'HurryMultiplier', 'BaseGold', 'NumGoldPerEra', 'SpreadReligion', 'IsReligious', 'CombatLimit', 'RangeAttackOnlyInDomain', 'RangeAttackIgnoreLOS', 'RangedCombatLimit', 'XPValueAttack', 'XPValueDefense', 'SpecialCargo', 'DomainCargo', 'Conscription', 'ExtraMaintenanceCost', 'NoMaintenance', 'Unhappiness', 'UnitArtInfo', 'UnitArtInfoCulturalVariation', 'UnitArtInfoEraVariation', 'ProjectPrereq', 'SpaceshipProject', 'LeaderPromotion', 'LeaderExperience', 'DontShowYields', 'ShowInPedia', 'MoveRate', 'UnitFlagIconOffset', 'PortraitIndex', 'IconAtlas', 'UnitFlagAtlas')
	SELECT	("UNIT_JAPANESE_ZERO"), ("TXT_KEY_UNIT_FIGHTER_ZERO"), "Civilopedia", "Strategy", "Help", "Requirements", "Combat", "RangedCombat", "Cost", "Moves", "Immobile", "Range", "BaseSightRange", "Class", "Special", "Capture", "CombatClass", "Domain", "CivilianAttackPriority", "DefaultUnitAI", "Food", "NoBadGoodies", "RivalTerritory", "MilitarySupport", "MilitaryProduction", "Pillage", "Found", "FoundAbroad", "CultureBombRadius", "GoldenAgeTurns", "IgnoreBuildingDefense", "PrereqResources", "Mechanized", "Suicide", "CaptureWhileEmbarked", "PrereqTech", "ObsoleteTech", "GoodyHutUpgradeUnitClass", "HurryCostModifier", "AdvancedStartCost", "MinAreaSize", "AirUnitCap", "NukeDamageLevel", "WorkRate", "NumFreeTechs", "RushBuilding", "BaseHurry", "HurryMultiplier", "BaseGold", "NumGoldPerEra", "SpreadReligion", "IsReligious", "CombatLimit", "RangeAttackOnlyInDomain", "RangeAttackIgnoreLOS", "RangedCombatLimit", "XPValueAttack", "XPValueDefense", "SpecialCargo", "DomainCargo", "Conscription", "ExtraMaintenanceCost", "NoMaintenance", "Unhappiness",
			("ART_DEF_UNIT_U_JAPANESE_ZERO"), "UnitArtInfoCulturalVariation", "UnitArtInfoEraVariation", "ProjectPrereq", "SpaceshipProject", "LeaderPromotion", "LeaderExperience", "DontShowYields", "ShowInPedia", "MoveRate", "UnitFlagIconOffset", "PortraitIndex", "IconAtlas", "UnitFlagAtlas"
	FROM "Units" WHERE (Type = "UNIT_FIGHTER_B");
INSERT INTO "Language_en_US" ( 'Tag', 'Text' )
	VALUES ( 'TXT_KEY_UNIT_FIGHTER_ZERO', 'Mitsubishi A6M Zero' );
INSERT INTO "Unit_AITypes" ('UnitType', 'UnitAIType')
	SELECT ("UNIT_JAPANESE_ZERO"), "UnitAIType"
	FROM "Unit_AITypes" WHERE (UnitType = "UNIT_FIGHTER_B");
INSERT INTO "Unit_ClassUpgrades" ('UnitType', 'UnitClassType')
	SELECT ("UNIT_JAPANESE_ZERO"), "UnitClassType"
	FROM "Unit_ClassUpgrades" WHERE (UnitType = "UNIT_FIGHTER_B");
INSERT INTO "Civilization_UnitClassOverrides" ( 'CivilizationType', 'UnitClassType', 'UnitType' )
	VALUES ( 'CIVILIZATION_JAPAN', 'UNITCLASS_FIGHTER_B', 'UNIT_JAPANESE_ZERO' );
INSERT INTO "Unit_Flavors" ('UnitType', 'FlavorType', 'Flavor')
	SELECT ("UNIT_JAPANESE_ZERO"), "FlavorType", "Flavor"
	FROM "Unit_Flavors" WHERE (UnitType = "UNIT_FIGHTER_B");
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	SELECT ("UNIT_JAPANESE_ZERO"), "PromotionType"
	FROM "Unit_FreePromotions" WHERE (UnitType = "UNIT_FIGHTER_B");
INSERT INTO "Unit_ResourceQuantityRequirements" ('UnitType', 'ResourceType', 'Cost')
	SELECT ("UNIT_JAPANESE_ZERO"), "ResourceType", "Cost"
	FROM "Unit_ResourceQuantityRequirements" WHERE (UnitType = "UNIT_FIGHTER_B");
-----------

-- Lavochkin La-5
INSERT INTO "Units" ('Type', 'Description', 'Civilopedia', 'Strategy', 'Help', 'Requirements', 'Combat', 'RangedCombat', 'Cost', 'Moves', 'Immobile', 'Range', 'BaseSightRange', 'Class', 'Special', 'Capture', 'CombatClass', 'Domain', 'CivilianAttackPriority', 'DefaultUnitAI', 'Food', 'NoBadGoodies', 'RivalTerritory', 'MilitarySupport', 'MilitaryProduction', 'Pillage', 'Found', 'FoundAbroad', 'CultureBombRadius', 'GoldenAgeTurns', 'IgnoreBuildingDefense', 'PrereqResources', 'Mechanized', 'Suicide', 'CaptureWhileEmbarked', 'PrereqTech', 'ObsoleteTech', 'GoodyHutUpgradeUnitClass', 'HurryCostModifier', 'AdvancedStartCost', 'MinAreaSize', 'AirUnitCap', 'NukeDamageLevel', 'WorkRate', 'NumFreeTechs', 'RushBuilding', 'BaseHurry', 'HurryMultiplier', 'BaseGold', 'NumGoldPerEra', 'SpreadReligion', 'IsReligious', 'CombatLimit', 'RangeAttackOnlyInDomain', 'RangeAttackIgnoreLOS', 'RangedCombatLimit', 'XPValueAttack', 'XPValueDefense', 'SpecialCargo', 'DomainCargo', 'Conscription', 'ExtraMaintenanceCost', 'NoMaintenance', 'Unhappiness', 'UnitArtInfo', 'UnitArtInfoCulturalVariation', 'UnitArtInfoEraVariation', 'ProjectPrereq', 'SpaceshipProject', 'LeaderPromotion', 'LeaderExperience', 'DontShowYields', 'ShowInPedia', 'MoveRate', 'UnitFlagIconOffset', 'PortraitIndex', 'IconAtlas', 'UnitFlagAtlas')
	SELECT	("UNIT_FIGHTER_LA5"), ("TXT_KEY_UNIT_FIGHTER_LA5"), "Civilopedia", "Strategy", "Help", "Requirements", "Combat", "RangedCombat", "Cost", "Moves", "Immobile", "Range", "BaseSightRange", "Class", "Special", "Capture", "CombatClass", "Domain", "CivilianAttackPriority", "DefaultUnitAI", "Food", "NoBadGoodies", "RivalTerritory", "MilitarySupport", "MilitaryProduction", "Pillage", "Found", "FoundAbroad", "CultureBombRadius", "GoldenAgeTurns", "IgnoreBuildingDefense", "PrereqResources", "Mechanized", "Suicide", "CaptureWhileEmbarked", "PrereqTech", "ObsoleteTech", "GoodyHutUpgradeUnitClass", "HurryCostModifier", "AdvancedStartCost", "MinAreaSize", "AirUnitCap", "NukeDamageLevel", "WorkRate", "NumFreeTechs", "RushBuilding", "BaseHurry", "HurryMultiplier", "BaseGold", "NumGoldPerEra", "SpreadReligion", "IsReligious", "CombatLimit", "RangeAttackOnlyInDomain", "RangeAttackIgnoreLOS", "RangedCombatLimit", "XPValueAttack", "XPValueDefense", "SpecialCargo", "DomainCargo", "Conscription", "ExtraMaintenanceCost", "NoMaintenance", "Unhappiness",
			("ART_DEF_UNIT_FIGHTER_LA5"), "UnitArtInfoCulturalVariation", "UnitArtInfoEraVariation", ("PROJECT_LA5"), "SpaceshipProject", "LeaderPromotion", "LeaderExperience", "DontShowYields", "ShowInPedia", "MoveRate", "UnitFlagIconOffset", "PortraitIndex", "IconAtlas", "UnitFlagAtlas"
	FROM "Units" WHERE (Type = "UNIT_FIGHTER_B");
INSERT INTO "Language_en_US" ( 'Tag', 'Text' )
	VALUES ( 'TXT_KEY_UNIT_FIGHTER_LA5', 'Lavochkin La-5' );
INSERT INTO "Unit_AITypes" ('UnitType', 'UnitAIType')
	SELECT ("UNIT_FIGHTER_LA5"), "UnitAIType"
	FROM "Unit_AITypes" WHERE (UnitType = "UNIT_FIGHTER_B");
INSERT INTO "Unit_ClassUpgrades" ('UnitType', 'UnitClassType')
	SELECT ("UNIT_FIGHTER_LA5"), "UnitClassType"
	FROM "Unit_ClassUpgrades" WHERE (UnitType = "UNIT_FIGHTER_B");
INSERT INTO "Civilization_UnitClassOverrides" ( 'CivilizationType', 'UnitClassType', 'UnitType' )
	VALUES ( 'CIVILIZATION_RUSSIA', 'UNITCLASS_FIGHTER_B', 'UNIT_FIGHTER_LA5' );
INSERT INTO "Unit_Flavors" ('UnitType', 'FlavorType', 'Flavor')
	SELECT ("UNIT_FIGHTER_LA5"), "FlavorType", "Flavor"
	FROM "Unit_Flavors" WHERE (UnitType = "UNIT_FIGHTER_B");
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	SELECT ("UNIT_FIGHTER_LA5"), "PromotionType"
	FROM "Unit_FreePromotions" WHERE (UnitType = "UNIT_FIGHTER_B");
INSERT INTO "Unit_ResourceQuantityRequirements" ('UnitType', 'ResourceType', 'Cost')
	SELECT ("UNIT_FIGHTER_LA5"), "ResourceType", "Cost"
	FROM "Unit_ResourceQuantityRequirements" WHERE (UnitType = "UNIT_FIGHTER_B");
-----------

-- Spitfire Mk II England
INSERT INTO "Units" ('Type', 'Description', 'Civilopedia', 'Strategy', 'Help', 'Requirements', 'Combat', 'RangedCombat', 'Cost', 'Moves', 'Immobile', 'Range', 'BaseSightRange', 'Class', 'Special', 'Capture', 'CombatClass', 'Domain', 'CivilianAttackPriority', 'DefaultUnitAI', 'Food', 'NoBadGoodies', 'RivalTerritory', 'MilitarySupport', 'MilitaryProduction', 'Pillage', 'Found', 'FoundAbroad', 'CultureBombRadius', 'GoldenAgeTurns', 'IgnoreBuildingDefense', 'PrereqResources', 'Mechanized', 'Suicide', 'CaptureWhileEmbarked', 'PrereqTech', 'ObsoleteTech', 'GoodyHutUpgradeUnitClass', 'HurryCostModifier', 'AdvancedStartCost', 'MinAreaSize', 'AirUnitCap', 'NukeDamageLevel', 'WorkRate', 'NumFreeTechs', 'RushBuilding', 'BaseHurry', 'HurryMultiplier', 'BaseGold', 'NumGoldPerEra', 'SpreadReligion', 'IsReligious', 'CombatLimit', 'RangeAttackOnlyInDomain', 'RangeAttackIgnoreLOS', 'RangedCombatLimit', 'XPValueAttack', 'XPValueDefense', 'SpecialCargo', 'DomainCargo', 'Conscription', 'ExtraMaintenanceCost', 'NoMaintenance', 'Unhappiness', 'UnitArtInfo', 'UnitArtInfoCulturalVariation', 'UnitArtInfoEraVariation', 'ProjectPrereq', 'SpaceshipProject', 'LeaderPromotion', 'LeaderExperience', 'DontShowYields', 'ShowInPedia', 'MoveRate', 'UnitFlagIconOffset', 'PortraitIndex', 'IconAtlas', 'UnitFlagAtlas')
	SELECT	("UNIT_FIGHTER_SPITFIRE"), ("TXT_KEY_UNIT_FIGHTER_SPITFIRE"), "Civilopedia", "Strategy", "Help", "Requirements", "Combat", "RangedCombat", "Cost", "Moves", "Immobile", "Range", "BaseSightRange", "Class", "Special", "Capture", "CombatClass", "Domain", "CivilianAttackPriority", "DefaultUnitAI", "Food", "NoBadGoodies", "RivalTerritory", "MilitarySupport", "MilitaryProduction", "Pillage", "Found", "FoundAbroad", "CultureBombRadius", "GoldenAgeTurns", "IgnoreBuildingDefense", "PrereqResources", "Mechanized", "Suicide", "CaptureWhileEmbarked", "PrereqTech", "ObsoleteTech", "GoodyHutUpgradeUnitClass", "HurryCostModifier", "AdvancedStartCost", "MinAreaSize", "AirUnitCap", "NukeDamageLevel", "WorkRate", "NumFreeTechs", "RushBuilding", "BaseHurry", "HurryMultiplier", "BaseGold", "NumGoldPerEra", "SpreadReligion", "IsReligious", "CombatLimit", "RangeAttackOnlyInDomain", "RangeAttackIgnoreLOS", "RangedCombatLimit", "XPValueAttack", "XPValueDefense", "SpecialCargo", "DomainCargo", "Conscription", "ExtraMaintenanceCost", "NoMaintenance", "Unhappiness",
			("ART_DEF_UNIT_FIGHTER_SPITFIRE"), "UnitArtInfoCulturalVariation", "UnitArtInfoEraVariation", "ProjectPrereq", "SpaceshipProject", "LeaderPromotion", "LeaderExperience", "DontShowYields", "ShowInPedia", "MoveRate", "UnitFlagIconOffset", "PortraitIndex", "IconAtlas", "UnitFlagAtlas"
	FROM "Units" WHERE (Type = "UNIT_FIGHTER_B");
INSERT INTO "Language_en_US" ( 'Tag', 'Text' )
	VALUES ( 'TXT_KEY_UNIT_FIGHTER_SPITFIRE', 'Spitfire Mk II' );
INSERT INTO "Unit_AITypes" ('UnitType', 'UnitAIType')
	SELECT ("UNIT_FIGHTER_SPITFIRE"), "UnitAIType"
	FROM "Unit_AITypes" WHERE (UnitType = "UNIT_FIGHTER_B");
INSERT INTO "Unit_ClassUpgrades" ('UnitType', 'UnitClassType')
	SELECT ("UNIT_FIGHTER_SPITFIRE"), "UnitClassType"
	FROM "Unit_ClassUpgrades" WHERE (UnitType = "UNIT_FIGHTER_B");
INSERT INTO "Civilization_UnitClassOverrides" ( 'CivilizationType', 'UnitClassType', 'UnitType' )
	VALUES ( 'CIVILIZATION_ENGLAND', 'UNITCLASS_FIGHTER_B', 'UNIT_FIGHTER_SPITFIRE' );
INSERT INTO "Unit_Flavors" ('UnitType', 'FlavorType', 'Flavor')
	SELECT ("UNIT_FIGHTER_SPITFIRE"), "FlavorType", "Flavor"
	FROM "Unit_Flavors" WHERE (UnitType = "UNIT_FIGHTER_B");
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	SELECT ("UNIT_FIGHTER_SPITFIRE"), "PromotionType"
	FROM "Unit_FreePromotions" WHERE (UnitType = "UNIT_FIGHTER_B");
INSERT INTO "Unit_ResourceQuantityRequirements" ('UnitType', 'ResourceType', 'Cost')
	SELECT ("UNIT_FIGHTER_SPITFIRE"), "ResourceType", "Cost"
	FROM "Unit_ResourceQuantityRequirements" WHERE (UnitType = "UNIT_FIGHTER_B");
-----------

-- Lavochkin La-5 v2
INSERT INTO "Units" ('Type', 'Description', 'Civilopedia', 'Strategy', 'Help', 'Requirements', 'Combat', 'RangedCombat', 'Cost', 'Moves', 'Immobile', 'Range', 'BaseSightRange', 'Class', 'Special', 'Capture', 'CombatClass', 'Domain', 'CivilianAttackPriority', 'DefaultUnitAI', 'Food', 'NoBadGoodies', 'RivalTerritory', 'MilitarySupport', 'MilitaryProduction', 'Pillage', 'Found', 'FoundAbroad', 'CultureBombRadius', 'GoldenAgeTurns', 'IgnoreBuildingDefense', 'PrereqResources', 'Mechanized', 'Suicide', 'CaptureWhileEmbarked', 'PrereqTech', 'ObsoleteTech', 'GoodyHutUpgradeUnitClass', 'HurryCostModifier', 'AdvancedStartCost', 'MinAreaSize', 'AirUnitCap', 'NukeDamageLevel', 'WorkRate', 'NumFreeTechs', 'RushBuilding', 'BaseHurry', 'HurryMultiplier', 'BaseGold', 'NumGoldPerEra', 'SpreadReligion', 'IsReligious', 'CombatLimit', 'RangeAttackOnlyInDomain', 'RangeAttackIgnoreLOS', 'RangedCombatLimit', 'XPValueAttack', 'XPValueDefense', 'SpecialCargo', 'DomainCargo', 'Conscription', 'ExtraMaintenanceCost', 'NoMaintenance', 'Unhappiness', 'UnitArtInfo', 'UnitArtInfoCulturalVariation', 'UnitArtInfoEraVariation', 'ProjectPrereq', 'SpaceshipProject', 'LeaderPromotion', 'LeaderExperience', 'DontShowYields', 'ShowInPedia', 'MoveRate', 'UnitFlagIconOffset', 'PortraitIndex', 'IconAtlas', 'UnitFlagAtlas')
	SELECT	("UNIT_FIGHTER_LA5_V2"), ("TXT_KEY_UNIT_FIGHTER_LA5_V2"), "Civilopedia", "Strategy", "Help", "Requirements", "Combat", "RangedCombat", "Cost", "Moves", "Immobile", "Range", "BaseSightRange",  "Class", "Special", "Capture", "CombatClass", "Domain", "CivilianAttackPriority", "DefaultUnitAI", "Food", "NoBadGoodies", "RivalTerritory", "MilitarySupport", "MilitaryProduction", "Pillage", "Found", "FoundAbroad", "CultureBombRadius", "GoldenAgeTurns", "IgnoreBuildingDefense", "PrereqResources", "Mechanized", "Suicide", "CaptureWhileEmbarked", "PrereqTech", "ObsoleteTech", "GoodyHutUpgradeUnitClass", "HurryCostModifier", "AdvancedStartCost", "MinAreaSize", "AirUnitCap", "NukeDamageLevel", "WorkRate", "NumFreeTechs", "RushBuilding", "BaseHurry", "HurryMultiplier", "BaseGold", "NumGoldPerEra", "SpreadReligion", "IsReligious", "CombatLimit", "RangeAttackOnlyInDomain", "RangeAttackIgnoreLOS", "RangedCombatLimit", "XPValueAttack", "XPValueDefense", "SpecialCargo", "DomainCargo", "Conscription", "ExtraMaintenanceCost", "NoMaintenance", "Unhappiness",
			("ART_DEF_UNIT_FIGHTER_LA5_V2"), "UnitArtInfoCulturalVariation", "UnitArtInfoEraVariation", ("PROJECT_LA5_V2"), "SpaceshipProject", "LeaderPromotion", "LeaderExperience", "DontShowYields", "ShowInPedia", "MoveRate", "UnitFlagIconOffset", "PortraitIndex", "IconAtlas", "UnitFlagAtlas"
	FROM "Units" WHERE (Type = "UNIT_FIGHTER_C");
INSERT INTO "Language_en_US" ( 'Tag', 'Text' )
	VALUES ( 'TXT_KEY_UNIT_FIGHTER_LA5_V2', 'Lavochkin La-5 FN' );
INSERT INTO "Unit_AITypes" ('UnitType', 'UnitAIType')
	SELECT ("UNIT_FIGHTER_LA5_V2"), "UnitAIType"
	FROM "Unit_AITypes" WHERE (UnitType = "UNIT_FIGHTER_C");
INSERT INTO "Unit_ClassUpgrades" ('UnitType', 'UnitClassType')
	SELECT ("UNIT_FIGHTER_LA5_V2"), "UnitClassType"
	FROM "Unit_ClassUpgrades" WHERE (UnitType = "UNIT_FIGHTER_C");
INSERT INTO "Civilization_UnitClassOverrides" ( 'CivilizationType', 'UnitClassType', 'UnitType' )
	VALUES ( 'CIVILIZATION_RUSSIA', 'UNITCLASS_FIGHTER_C', 'UNIT_FIGHTER_LA5_V2' );
INSERT INTO "Unit_Flavors" ('UnitType', 'FlavorType', 'Flavor')
	SELECT ("UNIT_FIGHTER_LA5_V2"), "FlavorType", "Flavor"
	FROM "Unit_Flavors" WHERE (UnitType = "UNIT_FIGHTER_C");
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	SELECT ("UNIT_FIGHTER_LA5_V2"), "PromotionType"
	FROM "Unit_FreePromotions" WHERE (UnitType = "UNIT_FIGHTER_C");
INSERT INTO "Unit_ResourceQuantityRequirements" ('UnitType', 'ResourceType', 'Cost')
	SELECT ("UNIT_FIGHTER_LA5_V2"), "ResourceType", "Cost"
	FROM "Unit_ResourceQuantityRequirements" WHERE (UnitType = "UNIT_FIGHTER_C");
-----------

-- Spitfire MK V
INSERT INTO "Units" ('Type', 'Description', 'Civilopedia', 'Strategy', 'Help', 'Requirements', 'Combat', 'RangedCombat', 'Cost', 'Moves', 'Immobile', 'Range', 'BaseSightRange', 'Class', 'Special', 'Capture', 'CombatClass', 'Domain', 'CivilianAttackPriority', 'DefaultUnitAI', 'Food', 'NoBadGoodies', 'RivalTerritory', 'MilitarySupport', 'MilitaryProduction', 'Pillage', 'Found', 'FoundAbroad', 'CultureBombRadius', 'GoldenAgeTurns', 'IgnoreBuildingDefense', 'PrereqResources', 'Mechanized', 'Suicide', 'CaptureWhileEmbarked', 'PrereqTech', 'ObsoleteTech', 'GoodyHutUpgradeUnitClass', 'HurryCostModifier', 'AdvancedStartCost', 'MinAreaSize', 'AirUnitCap', 'NukeDamageLevel', 'WorkRate', 'NumFreeTechs', 'RushBuilding', 'BaseHurry', 'HurryMultiplier', 'BaseGold', 'NumGoldPerEra', 'SpreadReligion', 'IsReligious', 'CombatLimit', 'RangeAttackOnlyInDomain', 'RangeAttackIgnoreLOS', 'RangedCombatLimit', 'XPValueAttack', 'XPValueDefense', 'SpecialCargo', 'DomainCargo', 'Conscription', 'ExtraMaintenanceCost', 'NoMaintenance', 'Unhappiness', 'UnitArtInfo', 'UnitArtInfoCulturalVariation', 'UnitArtInfoEraVariation', 'ProjectPrereq', 'SpaceshipProject', 'LeaderPromotion', 'LeaderExperience', 'DontShowYields', 'ShowInPedia', 'MoveRate', 'UnitFlagIconOffset', 'PortraitIndex', 'IconAtlas', 'UnitFlagAtlas')
	SELECT	("UNIT_FIGHTER_SPITFIRE_MKV"), ("TXT_KEY_UNIT_FIGHTER_SPITFIRE_MKV"), "Civilopedia", "Strategy", "Help", "Requirements", "Combat", "RangedCombat", "Cost", "Moves", "Immobile", "Range", "BaseSightRange",  "Class", "Special", "Capture", "CombatClass", "Domain", "CivilianAttackPriority", "DefaultUnitAI", "Food", "NoBadGoodies", "RivalTerritory", "MilitarySupport", "MilitaryProduction", "Pillage", "Found", "FoundAbroad", "CultureBombRadius", "GoldenAgeTurns", "IgnoreBuildingDefense", "PrereqResources", "Mechanized", "Suicide", "CaptureWhileEmbarked", "PrereqTech", "ObsoleteTech", "GoodyHutUpgradeUnitClass", "HurryCostModifier", "AdvancedStartCost", "MinAreaSize", "AirUnitCap", "NukeDamageLevel", "WorkRate", "NumFreeTechs", "RushBuilding", "BaseHurry", "HurryMultiplier", "BaseGold", "NumGoldPerEra", "SpreadReligion", "IsReligious", "CombatLimit", "RangeAttackOnlyInDomain", "RangeAttackIgnoreLOS", "RangedCombatLimit", "XPValueAttack", "XPValueDefense", "SpecialCargo", "DomainCargo", "Conscription", "ExtraMaintenanceCost", "NoMaintenance", "Unhappiness",
			("ART_DEF_UNIT_FIGHTER_SPITFIRE_MKV"), "UnitArtInfoCulturalVariation", "UnitArtInfoEraVariation", ("PROJECT_SPITFIRE_V"), "SpaceshipProject", "LeaderPromotion", "LeaderExperience", "DontShowYields", "ShowInPedia", "MoveRate", "UnitFlagIconOffset", "PortraitIndex", "IconAtlas", "UnitFlagAtlas"
	FROM "Units" WHERE (Type = "UNIT_FIGHTER_C");
INSERT INTO "Language_en_US" ( 'Tag', 'Text' )
	VALUES ( 'TXT_KEY_UNIT_FIGHTER_SPITFIRE_MKV', 'Spitfire MK V' );
INSERT INTO "Unit_AITypes" ('UnitType', 'UnitAIType')
	SELECT ("UNIT_FIGHTER_SPITFIRE_MKV"), "UnitAIType"
	FROM "Unit_AITypes" WHERE (UnitType = "UNIT_FIGHTER_C");
INSERT INTO "Unit_ClassUpgrades" ('UnitType', 'UnitClassType')
	SELECT ("UNIT_FIGHTER_SPITFIRE_MKV"), "UnitClassType"
	FROM "Unit_ClassUpgrades" WHERE (UnitType = "UNIT_FIGHTER_C");
INSERT INTO "Civilization_UnitClassOverrides" ( 'CivilizationType', 'UnitClassType', 'UnitType' )
	VALUES ( 'CIVILIZATION_ENGLAND', 'UNITCLASS_FIGHTER_C', 'UNIT_FIGHTER_SPITFIRE_MKV' );
INSERT INTO "Unit_Flavors" ('UnitType', 'FlavorType', 'Flavor')
	SELECT ("UNIT_FIGHTER_SPITFIRE_MKV"), "FlavorType", "Flavor"
	FROM "Unit_Flavors" WHERE (UnitType = "UNIT_FIGHTER_C");
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	SELECT ("UNIT_FIGHTER_SPITFIRE_MKV"), "PromotionType"
	FROM "Unit_FreePromotions" WHERE (UnitType = "UNIT_FIGHTER_C");
INSERT INTO "Unit_ResourceQuantityRequirements" ('UnitType', 'ResourceType', 'Cost')
	SELECT ("UNIT_FIGHTER_SPITFIRE_MKV"), "ResourceType", "Cost"
	FROM "Unit_ResourceQuantityRequirements" WHERE (UnitType = "UNIT_FIGHTER_C");
-----------

-- Bf-109F
INSERT INTO "Units" ('Type', 'Description', 'Civilopedia', 'Strategy', 'Help', 'Requirements', 'Combat', 'RangedCombat', 'Cost', 'Moves', 'Immobile', 'Range', 'BaseSightRange', 'Class', 'Special', 'Capture', 'CombatClass', 'Domain', 'CivilianAttackPriority', 'DefaultUnitAI', 'Food', 'NoBadGoodies', 'RivalTerritory', 'MilitarySupport', 'MilitaryProduction', 'Pillage', 'Found', 'FoundAbroad', 'CultureBombRadius', 'GoldenAgeTurns', 'IgnoreBuildingDefense', 'PrereqResources', 'Mechanized', 'Suicide', 'CaptureWhileEmbarked', 'PrereqTech', 'ObsoleteTech', 'GoodyHutUpgradeUnitClass', 'HurryCostModifier', 'AdvancedStartCost', 'MinAreaSize', 'AirUnitCap', 'NukeDamageLevel', 'WorkRate', 'NumFreeTechs', 'RushBuilding', 'BaseHurry', 'HurryMultiplier', 'BaseGold', 'NumGoldPerEra', 'SpreadReligion', 'IsReligious', 'CombatLimit', 'RangeAttackOnlyInDomain', 'RangeAttackIgnoreLOS', 'RangedCombatLimit', 'XPValueAttack', 'XPValueDefense', 'SpecialCargo', 'DomainCargo', 'Conscription', 'ExtraMaintenanceCost', 'NoMaintenance', 'Unhappiness', 'UnitArtInfo', 'UnitArtInfoCulturalVariation', 'UnitArtInfoEraVariation', 'ProjectPrereq', 'SpaceshipProject', 'LeaderPromotion', 'LeaderExperience', 'DontShowYields', 'ShowInPedia', 'MoveRate', 'UnitFlagIconOffset', 'PortraitIndex', 'IconAtlas', 'UnitFlagAtlas')
	SELECT	("UNIT_FIGHTER_BF109_F"), ("TXT_KEY_UNIT_FIGHTER_BF109_F"), "Civilopedia", "Strategy", "Help", "Requirements", "Combat", "RangedCombat", "Cost", "Moves", "Immobile", "Range", "BaseSightRange", "Class", "Special", "Capture", "CombatClass", "Domain", "CivilianAttackPriority", "DefaultUnitAI", "Food", "NoBadGoodies", "RivalTerritory", "MilitarySupport", "MilitaryProduction", "Pillage", "Found", "FoundAbroad", "CultureBombRadius", "GoldenAgeTurns", "IgnoreBuildingDefense", "PrereqResources", "Mechanized", "Suicide", "CaptureWhileEmbarked", "PrereqTech", "ObsoleteTech", "GoodyHutUpgradeUnitClass", "HurryCostModifier", "AdvancedStartCost", "MinAreaSize", "AirUnitCap", "NukeDamageLevel", "WorkRate", "NumFreeTechs", "RushBuilding", "BaseHurry", "HurryMultiplier", "BaseGold", "NumGoldPerEra", "SpreadReligion", "IsReligious", "CombatLimit", "RangeAttackOnlyInDomain", "RangeAttackIgnoreLOS", "RangedCombatLimit", "XPValueAttack", "XPValueDefense", "SpecialCargo", "DomainCargo", "Conscription", "ExtraMaintenanceCost", "NoMaintenance", "Unhappiness",
			("ART_DEF_UNIT_FIGHTER_BF109_F"), "UnitArtInfoCulturalVariation", "UnitArtInfoEraVariation", ("PROJECT_BF109F"), "SpaceshipProject", "LeaderPromotion", "LeaderExperience", "DontShowYields", "ShowInPedia", "MoveRate", "UnitFlagIconOffset", "PortraitIndex", "IconAtlas", "UnitFlagAtlas"
	FROM "Units" WHERE (Type = "UNIT_FIGHTER_C");
INSERT INTO "Language_en_US" ( 'Tag', 'Text' )
	VALUES ( 'TXT_KEY_UNIT_FIGHTER_BF109_F', 'Messerschmitt BF-109F' );
INSERT INTO "Unit_AITypes" ('UnitType', 'UnitAIType')
	SELECT ("UNIT_FIGHTER_BF109_F"), "UnitAIType"
	FROM "Unit_AITypes" WHERE (UnitType = "UNIT_FIGHTER_C");
INSERT INTO "Unit_ClassUpgrades" ('UnitType', 'UnitClassType')
	SELECT ("UNIT_FIGHTER_BF109_F"), "UnitClassType"
	FROM "Unit_ClassUpgrades" WHERE (UnitType = "UNIT_FIGHTER_C");
INSERT INTO "Civilization_UnitClassOverrides" ( 'CivilizationType', 'UnitClassType', 'UnitType' )
	VALUES ( 'CIVILIZATION_GERMANY', 'UNITCLASS_FIGHTER_C', 'UNIT_FIGHTER_BF109_F' );
INSERT INTO "Unit_Flavors" ('UnitType', 'FlavorType', 'Flavor')
	SELECT ("UNIT_FIGHTER_BF109_F"), "FlavorType", "Flavor"
	FROM "Unit_Flavors" WHERE (UnitType = "UNIT_FIGHTER_C");
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	SELECT ("UNIT_FIGHTER_BF109_F"), "PromotionType"
	FROM "Unit_FreePromotions" WHERE (UnitType = "UNIT_FIGHTER_C");
INSERT INTO "Unit_ResourceQuantityRequirements" ('UnitType', 'ResourceType', 'Cost')
	SELECT ("UNIT_FIGHTER_BF109_F"), "ResourceType", "Cost"
	FROM "Unit_ResourceQuantityRequirements" WHERE (UnitType = "UNIT_FIGHTER_C");
-----------

-- Lavochkin La-7
INSERT INTO "Units" ('Type', 'Description', 'Civilopedia', 'Strategy', 'Help', 'Requirements', 'Combat', 'RangedCombat', 'Cost', 'Moves', 'Immobile', 'Range', 'BaseSightRange', 'Class', 'Special', 'Capture', 'CombatClass', 'Domain', 'CivilianAttackPriority', 'DefaultUnitAI', 'Food', 'NoBadGoodies', 'RivalTerritory', 'MilitarySupport', 'MilitaryProduction', 'Pillage', 'Found', 'FoundAbroad', 'CultureBombRadius', 'GoldenAgeTurns', 'IgnoreBuildingDefense', 'PrereqResources', 'Mechanized', 'Suicide', 'CaptureWhileEmbarked', 'PrereqTech', 'ObsoleteTech', 'GoodyHutUpgradeUnitClass', 'HurryCostModifier', 'AdvancedStartCost', 'MinAreaSize', 'AirUnitCap', 'NukeDamageLevel', 'WorkRate', 'NumFreeTechs', 'RushBuilding', 'BaseHurry', 'HurryMultiplier', 'BaseGold', 'NumGoldPerEra', 'SpreadReligion', 'IsReligious', 'CombatLimit', 'RangeAttackOnlyInDomain', 'RangeAttackIgnoreLOS', 'RangedCombatLimit', 'XPValueAttack', 'XPValueDefense', 'SpecialCargo', 'DomainCargo', 'Conscription', 'ExtraMaintenanceCost', 'NoMaintenance', 'Unhappiness', 'UnitArtInfo', 'UnitArtInfoCulturalVariation', 'UnitArtInfoEraVariation', 'ProjectPrereq', 'SpaceshipProject', 'LeaderPromotion', 'LeaderExperience', 'DontShowYields', 'ShowInPedia', 'MoveRate', 'UnitFlagIconOffset', 'PortraitIndex', 'IconAtlas', 'UnitFlagAtlas')
	SELECT	("UNIT_FIGHTER_LA7"), ("TXT_KEY_UNIT_FIGHTER_LA7"), "Civilopedia", "Strategy", "Help", "Requirements", "Combat", "RangedCombat", "Cost", "Moves", "Immobile", "Range", "BaseSightRange",  "Class", "Special", "Capture", "CombatClass", "Domain", "CivilianAttackPriority", "DefaultUnitAI", "Food", "NoBadGoodies", "RivalTerritory", "MilitarySupport", "MilitaryProduction", "Pillage", "Found", "FoundAbroad", "CultureBombRadius", "GoldenAgeTurns", "IgnoreBuildingDefense", "PrereqResources", "Mechanized", "Suicide", "CaptureWhileEmbarked", "PrereqTech", "ObsoleteTech", "GoodyHutUpgradeUnitClass", "HurryCostModifier", "AdvancedStartCost", "MinAreaSize", "AirUnitCap", "NukeDamageLevel", "WorkRate", "NumFreeTechs", "RushBuilding", "BaseHurry", "HurryMultiplier", "BaseGold", "NumGoldPerEra", "SpreadReligion", "IsReligious", "CombatLimit", "RangeAttackOnlyInDomain", "RangeAttackIgnoreLOS", "RangedCombatLimit", "XPValueAttack", "XPValueDefense", "SpecialCargo", "DomainCargo", "Conscription", "ExtraMaintenanceCost", "NoMaintenance", "Unhappiness",
			("ART_DEF_UNIT_FIGHTER_LA7"), "UnitArtInfoCulturalVariation", "UnitArtInfoEraVariation", ("PROJECT_LA7"), "SpaceshipProject", "LeaderPromotion", "LeaderExperience", "DontShowYields", "ShowInPedia", "MoveRate", "UnitFlagIconOffset", "PortraitIndex", "IconAtlas", "UnitFlagAtlas"
	FROM "Units" WHERE (Type = "UNIT_FIGHTER_D");
INSERT INTO "Language_en_US" ( 'Tag', 'Text' )
	VALUES ( 'TXT_KEY_UNIT_FIGHTER_LA7', 'Lavochkin La-7' );
INSERT INTO "Unit_AITypes" ('UnitType', 'UnitAIType')
	SELECT ("UNIT_FIGHTER_LA7"), "UnitAIType"
	FROM "Unit_AITypes" WHERE (UnitType = "UNIT_FIGHTER_D");
INSERT INTO "Unit_ClassUpgrades" ('UnitType', 'UnitClassType')
	SELECT ("UNIT_FIGHTER_LA7"), "UnitClassType"
	FROM "Unit_ClassUpgrades" WHERE (UnitType = "UNIT_FIGHTER_D");
INSERT INTO "Civilization_UnitClassOverrides" ( 'CivilizationType', 'UnitClassType', 'UnitType' )
	VALUES ( 'CIVILIZATION_RUSSIA', 'UNITCLASS_FIGHTER_D', 'UNIT_FIGHTER_LA7' );
INSERT INTO "Unit_Flavors" ('UnitType', 'FlavorType', 'Flavor')
	SELECT ("UNIT_FIGHTER_LA7"), "FlavorType", "Flavor"
	FROM "Unit_Flavors" WHERE (UnitType = "UNIT_FIGHTER_D");
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	SELECT ("UNIT_FIGHTER_LA7"), "PromotionType"
	FROM "Unit_FreePromotions" WHERE (UnitType = "UNIT_FIGHTER_D");
INSERT INTO "Unit_ResourceQuantityRequirements" ('UnitType', 'ResourceType', 'Cost')
	SELECT ("UNIT_FIGHTER_LA7"), "ResourceType", "Cost"
	FROM "Unit_ResourceQuantityRequirements" WHERE (UnitType = "UNIT_FIGHTER_D");
-----------

-- Spitfire Mk IX
INSERT INTO "Units" ('Type', 'Description', 'Civilopedia', 'Strategy', 'Help', 'Requirements', 'Combat', 'RangedCombat', 'Cost', 'Moves', 'Immobile', 'Range', 'BaseSightRange', 'Class', 'Special', 'Capture', 'CombatClass', 'Domain', 'CivilianAttackPriority', 'DefaultUnitAI', 'Food', 'NoBadGoodies', 'RivalTerritory', 'MilitarySupport', 'MilitaryProduction', 'Pillage', 'Found', 'FoundAbroad', 'CultureBombRadius', 'GoldenAgeTurns', 'IgnoreBuildingDefense', 'PrereqResources', 'Mechanized', 'Suicide', 'CaptureWhileEmbarked', 'PrereqTech', 'ObsoleteTech', 'GoodyHutUpgradeUnitClass', 'HurryCostModifier', 'AdvancedStartCost', 'MinAreaSize', 'AirUnitCap', 'NukeDamageLevel', 'WorkRate', 'NumFreeTechs', 'RushBuilding', 'BaseHurry', 'HurryMultiplier', 'BaseGold', 'NumGoldPerEra', 'SpreadReligion', 'IsReligious', 'CombatLimit', 'RangeAttackOnlyInDomain', 'RangeAttackIgnoreLOS', 'RangedCombatLimit', 'XPValueAttack', 'XPValueDefense', 'SpecialCargo', 'DomainCargo', 'Conscription', 'ExtraMaintenanceCost', 'NoMaintenance', 'Unhappiness', 'UnitArtInfo', 'UnitArtInfoCulturalVariation', 'UnitArtInfoEraVariation', 'ProjectPrereq', 'SpaceshipProject', 'LeaderPromotion', 'LeaderExperience', 'DontShowYields', 'ShowInPedia', 'MoveRate', 'UnitFlagIconOffset', 'PortraitIndex', 'IconAtlas', 'UnitFlagAtlas')
	SELECT	("UNIT_FIGHTER_SPITFIRE_MKIX"), ("TXT_KEY_UNIT_FIGHTER_SPITFIRE_MKIX"), "Civilopedia", "Strategy", "Help", "Requirements", "Combat", "RangedCombat", "Cost", "Moves", "Immobile", "Range", "BaseSightRange", "Class", "Special", "Capture", "CombatClass", "Domain", "CivilianAttackPriority", "DefaultUnitAI", "Food", "NoBadGoodies", "RivalTerritory", "MilitarySupport", "MilitaryProduction", "Pillage", "Found", "FoundAbroad", "CultureBombRadius", "GoldenAgeTurns", "IgnoreBuildingDefense", "PrereqResources", "Mechanized", "Suicide", "CaptureWhileEmbarked", "PrereqTech", "ObsoleteTech", "GoodyHutUpgradeUnitClass", "HurryCostModifier", "AdvancedStartCost", "MinAreaSize", "AirUnitCap", "NukeDamageLevel", "WorkRate", "NumFreeTechs", "RushBuilding", "BaseHurry", "HurryMultiplier", "BaseGold", "NumGoldPerEra", "SpreadReligion", "IsReligious", "CombatLimit", "RangeAttackOnlyInDomain", "RangeAttackIgnoreLOS", "RangedCombatLimit", "XPValueAttack", "XPValueDefense", "SpecialCargo", "DomainCargo", "Conscription", "ExtraMaintenanceCost", "NoMaintenance", "Unhappiness",
			("ART_DEF_UNIT_FIGHTER_SPITFIRE_MKIX"), "UnitArtInfoCulturalVariation", "UnitArtInfoEraVariation", ("PROJECT_SPITFIRE_IX"), "SpaceshipProject", "LeaderPromotion", "LeaderExperience", "DontShowYields", "ShowInPedia", "MoveRate", "UnitFlagIconOffset", "PortraitIndex", "IconAtlas", "UnitFlagAtlas"
	FROM "Units" WHERE (Type = "UNIT_FIGHTER_D");
INSERT INTO "Language_en_US" ( 'Tag', 'Text' )
	VALUES ( 'TXT_KEY_UNIT_FIGHTER_SPITFIRE_MKIX', 'Spitfire Mk IX' );
INSERT INTO "Unit_AITypes" ('UnitType', 'UnitAIType')
	SELECT ("UNIT_FIGHTER_SPITFIRE_MKIX"), "UnitAIType"
	FROM "Unit_AITypes" WHERE (UnitType = "UNIT_FIGHTER_D");
INSERT INTO "Unit_ClassUpgrades" ('UnitType', 'UnitClassType')
	SELECT ("UNIT_FIGHTER_SPITFIRE_MKIX"), "UnitClassType"
	FROM "Unit_ClassUpgrades" WHERE (UnitType = "UNIT_FIGHTER_D");
INSERT INTO "Civilization_UnitClassOverrides" ( 'CivilizationType', 'UnitClassType', 'UnitType' )
	VALUES ( 'CIVILIZATION_ENGLAND', 'UNITCLASS_FIGHTER_D', 'UNIT_FIGHTER_SPITFIRE_MKIX' );
INSERT INTO "Unit_Flavors" ('UnitType', 'FlavorType', 'Flavor')
	SELECT ("UNIT_FIGHTER_SPITFIRE_MKIX"), "FlavorType", "Flavor"
	FROM "Unit_Flavors" WHERE (UnitType = "UNIT_FIGHTER_D");
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	SELECT ("UNIT_FIGHTER_SPITFIRE_MKIX"), "PromotionType"
	FROM "Unit_FreePromotions" WHERE (UnitType = "UNIT_FIGHTER_D");
INSERT INTO "Unit_ResourceQuantityRequirements" ('UnitType', 'ResourceType', 'Cost')
	SELECT ("UNIT_FIGHTER_SPITFIRE_MKIX"), "ResourceType", "Cost"
	FROM "Unit_ResourceQuantityRequirements" WHERE (UnitType = "UNIT_FIGHTER_D");
-----------

-- BF109G
INSERT INTO "Units" ('Type', 'Description', 'Civilopedia', 'Strategy', 'Help', 'Requirements', 'Combat', 'RangedCombat', 'Cost', 'Moves', 'Immobile', 'Range', 'BaseSightRange', 'Class', 'Special', 'Capture', 'CombatClass', 'Domain', 'CivilianAttackPriority', 'DefaultUnitAI', 'Food', 'NoBadGoodies', 'RivalTerritory', 'MilitarySupport', 'MilitaryProduction', 'Pillage', 'Found', 'FoundAbroad', 'CultureBombRadius', 'GoldenAgeTurns', 'IgnoreBuildingDefense', 'PrereqResources', 'Mechanized', 'Suicide', 'CaptureWhileEmbarked', 'PrereqTech', 'ObsoleteTech', 'GoodyHutUpgradeUnitClass', 'HurryCostModifier', 'AdvancedStartCost', 'MinAreaSize', 'AirUnitCap', 'NukeDamageLevel', 'WorkRate', 'NumFreeTechs', 'RushBuilding', 'BaseHurry', 'HurryMultiplier', 'BaseGold', 'NumGoldPerEra', 'SpreadReligion', 'IsReligious', 'CombatLimit', 'RangeAttackOnlyInDomain', 'RangeAttackIgnoreLOS', 'RangedCombatLimit', 'XPValueAttack', 'XPValueDefense', 'SpecialCargo', 'DomainCargo', 'Conscription', 'ExtraMaintenanceCost', 'NoMaintenance', 'Unhappiness', 'UnitArtInfo', 'UnitArtInfoCulturalVariation', 'UnitArtInfoEraVariation', 'ProjectPrereq', 'SpaceshipProject', 'LeaderPromotion', 'LeaderExperience', 'DontShowYields', 'ShowInPedia', 'MoveRate', 'UnitFlagIconOffset', 'PortraitIndex', 'IconAtlas', 'UnitFlagAtlas')
	SELECT	("UNIT_FIGHTER_BF109_G"), ("TXT_KEY_UNIT_FIGHTER_BF109_G"), "Civilopedia", "Strategy", "Help", "Requirements", "Combat", "RangedCombat", "Cost", "Moves", "Immobile", "Range", "BaseSightRange", "Class", "Special", "Capture", "CombatClass", "Domain", "CivilianAttackPriority", "DefaultUnitAI", "Food", "NoBadGoodies", "RivalTerritory", "MilitarySupport", "MilitaryProduction", "Pillage", "Found", "FoundAbroad", "CultureBombRadius", "GoldenAgeTurns", "IgnoreBuildingDefense", "PrereqResources", "Mechanized", "Suicide", "CaptureWhileEmbarked", "PrereqTech", "ObsoleteTech", "GoodyHutUpgradeUnitClass", "HurryCostModifier", "AdvancedStartCost", "MinAreaSize", "AirUnitCap", "NukeDamageLevel", "WorkRate", "NumFreeTechs", "RushBuilding", "BaseHurry", "HurryMultiplier", "BaseGold", "NumGoldPerEra", "SpreadReligion", "IsReligious", "CombatLimit", "RangeAttackOnlyInDomain", "RangeAttackIgnoreLOS", "RangedCombatLimit", "XPValueAttack", "XPValueDefense", "SpecialCargo", "DomainCargo", "Conscription", "ExtraMaintenanceCost", "NoMaintenance", "Unhappiness",
			("ART_DEF_UNIT_FIGHTER_BF109_G"), "UnitArtInfoCulturalVariation", "UnitArtInfoEraVariation", ("PROJECT_BF109G"), "SpaceshipProject", "LeaderPromotion", "LeaderExperience", "DontShowYields", "ShowInPedia", "MoveRate", "UnitFlagIconOffset", "PortraitIndex", "IconAtlas", "UnitFlagAtlas"
	FROM "Units" WHERE (Type = "UNIT_FIGHTER_D");
INSERT INTO "Language_en_US" ( 'Tag', 'Text' )
	VALUES ( 'TXT_KEY_UNIT_FIGHTER_BF109_G', 'Messerschmitt BF-109G' );
INSERT INTO "Unit_AITypes" ('UnitType', 'UnitAIType')
	SELECT ("UNIT_FIGHTER_BF109_G"), "UnitAIType"
	FROM "Unit_AITypes" WHERE (UnitType = "UNIT_FIGHTER_D");
INSERT INTO "Unit_ClassUpgrades" ('UnitType', 'UnitClassType')
	SELECT ("UNIT_FIGHTER_BF109_G"), "UnitClassType"
	FROM "Unit_ClassUpgrades" WHERE (UnitType = "UNIT_FIGHTER_D");
INSERT INTO "Civilization_UnitClassOverrides" ( 'CivilizationType', 'UnitClassType', 'UnitType' )
	VALUES ( 'CIVILIZATION_GERMANY', 'UNITCLASS_FIGHTER_D', 'UNIT_FIGHTER_BF109_G' );
INSERT INTO "Unit_Flavors" ('UnitType', 'FlavorType', 'Flavor')
	SELECT ("UNIT_FIGHTER_BF109_G"), "FlavorType", "Flavor"
	FROM "Unit_Flavors" WHERE (UnitType = "UNIT_FIGHTER_D");
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	SELECT ("UNIT_FIGHTER_BF109_G"), "PromotionType"
	FROM "Unit_FreePromotions" WHERE (UnitType = "UNIT_FIGHTER_D");
INSERT INTO "Unit_ResourceQuantityRequirements" ('UnitType', 'ResourceType', 'Cost')
	SELECT ("UNIT_FIGHTER_BF109_G"), "ResourceType", "Cost"
	FROM "Unit_ResourceQuantityRequirements" WHERE (UnitType = "UNIT_FIGHTER_D");
-----------

-- D-520
INSERT INTO "Units" ('Type', 'Description', 'Civilopedia', 'Strategy', 'Help', 'Requirements', 'Combat', 'RangedCombat', 'Cost', 'Moves', 'Immobile', 'Range', 'BaseSightRange', 'Class', 'Special', 'Capture', 'CombatClass', 'Domain', 'CivilianAttackPriority', 'DefaultUnitAI', 'Food', 'NoBadGoodies', 'RivalTerritory', 'MilitarySupport', 'MilitaryProduction', 'Pillage', 'Found', 'FoundAbroad', 'CultureBombRadius', 'GoldenAgeTurns', 'IgnoreBuildingDefense', 'PrereqResources', 'Mechanized', 'Suicide', 'CaptureWhileEmbarked', 'PrereqTech', 'ObsoleteTech', 'GoodyHutUpgradeUnitClass', 'HurryCostModifier', 'AdvancedStartCost', 'MinAreaSize', 'AirUnitCap', 'NukeDamageLevel', 'WorkRate', 'NumFreeTechs', 'RushBuilding', 'BaseHurry', 'HurryMultiplier', 'BaseGold', 'NumGoldPerEra', 'SpreadReligion', 'IsReligious', 'CombatLimit', 'RangeAttackOnlyInDomain', 'RangeAttackIgnoreLOS', 'RangedCombatLimit', 'XPValueAttack', 'XPValueDefense', 'SpecialCargo', 'DomainCargo', 'Conscription', 'ExtraMaintenanceCost', 'NoMaintenance', 'Unhappiness', 'UnitArtInfo', 'UnitArtInfoCulturalVariation', 'UnitArtInfoEraVariation', 'ProjectPrereq', 'SpaceshipProject', 'LeaderPromotion', 'LeaderExperience', 'DontShowYields', 'ShowInPedia', 'MoveRate', 'UnitFlagIconOffset', 'PortraitIndex', 'IconAtlas', 'UnitFlagAtlas')
	SELECT	("UNIT_FIGHTER_D520"), ("TXT_KEY_UNIT_FIGHTER_D520"), "Civilopedia", "Strategy", "Help", "Requirements", "Combat", "RangedCombat", "Cost", "Moves", "Immobile", "Range", "BaseSightRange",  "Class", "Special", "Capture", "CombatClass", "Domain", "CivilianAttackPriority", "DefaultUnitAI", "Food", "NoBadGoodies", "RivalTerritory", "MilitarySupport", "MilitaryProduction", "Pillage", "Found", "FoundAbroad", "CultureBombRadius", "GoldenAgeTurns", "IgnoreBuildingDefense", "PrereqResources", "Mechanized", "Suicide", "CaptureWhileEmbarked", "PrereqTech", "ObsoleteTech", "GoodyHutUpgradeUnitClass", "HurryCostModifier", "AdvancedStartCost", "MinAreaSize", "AirUnitCap", "NukeDamageLevel", "WorkRate", "NumFreeTechs", "RushBuilding", "BaseHurry", "HurryMultiplier", "BaseGold", "NumGoldPerEra", "SpreadReligion", "IsReligious", "CombatLimit", "RangeAttackOnlyInDomain", "RangeAttackIgnoreLOS", "RangedCombatLimit", "XPValueAttack", "XPValueDefense", "SpecialCargo", "DomainCargo", "Conscription", "ExtraMaintenanceCost", "NoMaintenance", "Unhappiness",
			("ART_DEF_UNIT_FIGHTER_D520"), "UnitArtInfoCulturalVariation", "UnitArtInfoEraVariation", ("PROJECT_FIGHTER_D520"), "SpaceshipProject", "LeaderPromotion", "LeaderExperience", "DontShowYields", "ShowInPedia", "MoveRate", "UnitFlagIconOffset", "PortraitIndex", "IconAtlas", "UnitFlagAtlas"
	FROM "Units" WHERE (Type = "UNIT_FIGHTER_2");
INSERT INTO "Language_en_US" ( 'Tag', 'Text' )
	VALUES ( 'TXT_KEY_UNIT_FIGHTER_D520', 'Dewoitine D.520' );
INSERT INTO "Unit_AITypes" ('UnitType', 'UnitAIType')
	SELECT ("UNIT_FIGHTER_D520"), "UnitAIType"
	FROM "Unit_AITypes" WHERE (UnitType = "UNIT_FIGHTER_2");
INSERT INTO "Unit_ClassUpgrades" ('UnitType', 'UnitClassType')
	SELECT ("UNIT_FIGHTER_D520"), "UnitClassType"
	FROM "Unit_ClassUpgrades" WHERE (UnitType = "UNIT_FIGHTER_2");
INSERT INTO "Civilization_UnitClassOverrides" ( 'CivilizationType', 'UnitClassType', 'UnitType' )
	VALUES ( 'CIVILIZATION_FRANCE', 'UNITCLASS_FIGHTER_2', 'UNIT_FIGHTER_D520' );
INSERT INTO "Unit_Flavors" ('UnitType', 'FlavorType', 'Flavor')
	SELECT ("UNIT_FIGHTER_D520"), "FlavorType", "Flavor"
	FROM "Unit_Flavors" WHERE (UnitType = "UNIT_FIGHTER_2");
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	SELECT ("UNIT_FIGHTER_D520"), "PromotionType"
	FROM "Unit_FreePromotions" WHERE (UnitType = "UNIT_FIGHTER_2");
INSERT INTO "Unit_ResourceQuantityRequirements" ('UnitType', 'ResourceType', 'Cost')
	SELECT ("UNIT_FIGHTER_D520"), "ResourceType", "Cost"
	FROM "Unit_ResourceQuantityRequirements" WHERE (UnitType = "UNIT_FIGHTER_2");
-----------

-- FW190
INSERT INTO "Units" ('Type', 'Description', 'Civilopedia', 'Strategy', 'Help', 'Requirements', 'Combat', 'RangedCombat', 'Cost', 'Moves', 'Immobile', 'Range', 'BaseSightRange', 'Class', 'Special', 'Capture', 'CombatClass', 'Domain', 'CivilianAttackPriority', 'DefaultUnitAI', 'Food', 'NoBadGoodies', 'RivalTerritory', 'MilitarySupport', 'MilitaryProduction', 'Pillage', 'Found', 'FoundAbroad', 'CultureBombRadius', 'GoldenAgeTurns', 'IgnoreBuildingDefense', 'PrereqResources', 'Mechanized', 'Suicide', 'CaptureWhileEmbarked', 'PrereqTech', 'ObsoleteTech', 'GoodyHutUpgradeUnitClass', 'HurryCostModifier', 'AdvancedStartCost', 'MinAreaSize', 'AirUnitCap', 'NukeDamageLevel', 'WorkRate', 'NumFreeTechs', 'RushBuilding', 'BaseHurry', 'HurryMultiplier', 'BaseGold', 'NumGoldPerEra', 'SpreadReligion', 'IsReligious', 'CombatLimit', 'RangeAttackOnlyInDomain', 'RangeAttackIgnoreLOS', 'RangedCombatLimit', 'XPValueAttack', 'XPValueDefense', 'SpecialCargo', 'DomainCargo', 'Conscription', 'ExtraMaintenanceCost', 'NoMaintenance', 'Unhappiness', 'UnitArtInfo', 'UnitArtInfoCulturalVariation', 'UnitArtInfoEraVariation', 'ProjectPrereq', 'SpaceshipProject', 'LeaderPromotion', 'LeaderExperience', 'DontShowYields', 'ShowInPedia', 'MoveRate', 'UnitFlagIconOffset', 'PortraitIndex', 'IconAtlas', 'UnitFlagAtlas')
	SELECT	("UNIT_FIGHTER_FW190"), ("TXT_KEY_UNIT_FIGHTER_FW190"), "Civilopedia", "Strategy", "Help", "Requirements", "Combat", "RangedCombat", "Cost", "Moves", "Immobile", "Range", "BaseSightRange", "Class", "Special", "Capture", "CombatClass", "Domain", "CivilianAttackPriority", "DefaultUnitAI", "Food", "NoBadGoodies", "RivalTerritory", "MilitarySupport", "MilitaryProduction", "Pillage", "Found", "FoundAbroad", "CultureBombRadius", "GoldenAgeTurns", "IgnoreBuildingDefense", "PrereqResources", "Mechanized", "Suicide", "CaptureWhileEmbarked", "PrereqTech", "ObsoleteTech", "GoodyHutUpgradeUnitClass", "HurryCostModifier", "AdvancedStartCost", "MinAreaSize", "AirUnitCap", "NukeDamageLevel", "WorkRate", "NumFreeTechs", "RushBuilding", "BaseHurry", "HurryMultiplier", "BaseGold", "NumGoldPerEra", "SpreadReligion", "IsReligious", "CombatLimit", "RangeAttackOnlyInDomain", "RangeAttackIgnoreLOS", "RangedCombatLimit", "XPValueAttack", "XPValueDefense", "SpecialCargo", "DomainCargo", "Conscription", "ExtraMaintenanceCost", "NoMaintenance", "Unhappiness",
			("ART_DEF_UNIT_FIGHTER_FW190"), "UnitArtInfoCulturalVariation", "UnitArtInfoEraVariation", ("PROJECT_FW190"), "SpaceshipProject", "LeaderPromotion", "LeaderExperience", "DontShowYields", "ShowInPedia", "MoveRate", "UnitFlagIconOffset", "PortraitIndex", "IconAtlas", "UnitFlagAtlas"
	FROM "Units" WHERE (Type = "UNIT_FIGHTER_3");
INSERT INTO "Language_en_US" ( 'Tag', 'Text' )
	VALUES ( 'TXT_KEY_UNIT_FIGHTER_FW190', 'Focke-Wulf Fw 190' );
INSERT INTO "Unit_AITypes" ('UnitType', 'UnitAIType')
	SELECT ("UNIT_FIGHTER_FW190"), "UnitAIType"
	FROM "Unit_AITypes" WHERE (UnitType = "UNIT_FIGHTER_3");
INSERT INTO "Unit_ClassUpgrades" ('UnitType', 'UnitClassType')
	SELECT ("UNIT_FIGHTER_FW190"), "UnitClassType"
	FROM "Unit_ClassUpgrades" WHERE (UnitType = "UNIT_FIGHTER_3");
INSERT INTO "Civilization_UnitClassOverrides" ( 'CivilizationType', 'UnitClassType', 'UnitType' )
	VALUES ( 'CIVILIZATION_GERMANY', 'UNITCLASS_FIGHTER_3', 'UNIT_FIGHTER_FW190' );
INSERT INTO "Unit_Flavors" ('UnitType', 'FlavorType', 'Flavor')
	SELECT ("UNIT_FIGHTER_FW190"), "FlavorType", "Flavor"
	FROM "Unit_Flavors" WHERE (UnitType = "UNIT_FIGHTER_3");
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	SELECT ("UNIT_FIGHTER_FW190"), "PromotionType"
	FROM "Unit_FreePromotions" WHERE (UnitType = "UNIT_FIGHTER_3");
INSERT INTO "Unit_ResourceQuantityRequirements" ('UnitType', 'ResourceType', 'Cost')
	SELECT ("UNIT_FIGHTER_FW190"), "ResourceType", "Cost"
	FROM "Unit_ResourceQuantityRequirements" WHERE (UnitType = "UNIT_FIGHTER_3");
-----------

-- G-55
INSERT INTO "Units" ('Type', 'Description', 'Civilopedia', 'Strategy', 'Help', 'Requirements', 'Combat', 'RangedCombat', 'Cost', 'Moves', 'Immobile', 'Range', 'BaseSightRange', 'Class', 'Special', 'Capture', 'CombatClass', 'Domain', 'CivilianAttackPriority', 'DefaultUnitAI', 'Food', 'NoBadGoodies', 'RivalTerritory', 'MilitarySupport', 'MilitaryProduction', 'Pillage', 'Found', 'FoundAbroad', 'CultureBombRadius', 'GoldenAgeTurns', 'IgnoreBuildingDefense', 'PrereqResources', 'Mechanized', 'Suicide', 'CaptureWhileEmbarked', 'PrereqTech', 'ObsoleteTech', 'GoodyHutUpgradeUnitClass', 'HurryCostModifier', 'AdvancedStartCost', 'MinAreaSize', 'AirUnitCap', 'NukeDamageLevel', 'WorkRate', 'NumFreeTechs', 'RushBuilding', 'BaseHurry', 'HurryMultiplier', 'BaseGold', 'NumGoldPerEra', 'SpreadReligion', 'IsReligious', 'CombatLimit', 'RangeAttackOnlyInDomain', 'RangeAttackIgnoreLOS', 'RangedCombatLimit', 'XPValueAttack', 'XPValueDefense', 'SpecialCargo', 'DomainCargo', 'Conscription', 'ExtraMaintenanceCost', 'NoMaintenance', 'Unhappiness', 'UnitArtInfo', 'UnitArtInfoCulturalVariation', 'UnitArtInfoEraVariation', 'ProjectPrereq', 'SpaceshipProject', 'LeaderPromotion', 'LeaderExperience', 'DontShowYields', 'ShowInPedia', 'MoveRate', 'UnitFlagIconOffset', 'PortraitIndex', 'IconAtlas', 'UnitFlagAtlas')
	SELECT	("UNIT_FIGHTER_G55"), ("TXT_KEY_UNIT_FIGHTER_G55"), "Civilopedia", "Strategy", "Help", "Requirements", "Combat", "RangedCombat", "Cost", "Moves", "Immobile", "Range", "BaseSightRange", "Class", "Special", "Capture", "CombatClass", "Domain", "CivilianAttackPriority", "DefaultUnitAI", "Food", "NoBadGoodies", "RivalTerritory", "MilitarySupport", "MilitaryProduction", "Pillage", "Found", "FoundAbroad", "CultureBombRadius", "GoldenAgeTurns", "IgnoreBuildingDefense", "PrereqResources", "Mechanized", "Suicide", "CaptureWhileEmbarked", "PrereqTech", "ObsoleteTech", "GoodyHutUpgradeUnitClass", "HurryCostModifier", "AdvancedStartCost", "MinAreaSize", "AirUnitCap", "NukeDamageLevel", "WorkRate", "NumFreeTechs", "RushBuilding", "BaseHurry", "HurryMultiplier", "BaseGold", "NumGoldPerEra", "SpreadReligion", "IsReligious", "CombatLimit", "RangeAttackOnlyInDomain", "RangeAttackIgnoreLOS", "RangedCombatLimit", "XPValueAttack", "XPValueDefense", "SpecialCargo", "DomainCargo", "Conscription", "ExtraMaintenanceCost", "NoMaintenance", "Unhappiness",
			("ART_DEF_UNIT_FIGHTER_G55"), "UnitArtInfoCulturalVariation", "UnitArtInfoEraVariation", ("PROJECT_G55"), "SpaceshipProject", "LeaderPromotion", "LeaderExperience", "DontShowYields", "ShowInPedia", "MoveRate", "UnitFlagIconOffset", "PortraitIndex", "IconAtlas", "UnitFlagAtlas"
	FROM "Units" WHERE (Type = "UNIT_FIGHTER_3");
INSERT INTO "Language_en_US" ( 'Tag', 'Text' )
	VALUES ( 'TXT_KEY_UNIT_FIGHTER_G55', 'Fiat G.55 Centauro' );
INSERT INTO "Unit_AITypes" ('UnitType', 'UnitAIType')
	SELECT ("UNIT_FIGHTER_G55"), "UnitAIType"
	FROM "Unit_AITypes" WHERE (UnitType = "UNIT_FIGHTER_3");
INSERT INTO "Unit_ClassUpgrades" ('UnitType', 'UnitClassType')
	SELECT ("UNIT_FIGHTER_G55"), "UnitClassType"
	FROM "Unit_ClassUpgrades" WHERE (UnitType = "UNIT_FIGHTER_3");
INSERT INTO "Civilization_UnitClassOverrides" ( 'CivilizationType', 'UnitClassType', 'UnitType' )
	VALUES ( 'CIVILIZATION_ROME', 'UNITCLASS_FIGHTER_3', 'UNIT_FIGHTER_G55' );
INSERT INTO "Unit_Flavors" ('UnitType', 'FlavorType', 'Flavor')
	SELECT ("UNIT_FIGHTER_G55"), "FlavorType", "Flavor"
	FROM "Unit_Flavors" WHERE (UnitType = "UNIT_FIGHTER_3");
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	SELECT ("UNIT_FIGHTER_G55"), "PromotionType"
	FROM "Unit_FreePromotions" WHERE (UnitType = "UNIT_FIGHTER_3");
INSERT INTO "Unit_ResourceQuantityRequirements" ('UnitType', 'ResourceType', 'Cost')
	SELECT ("UNIT_FIGHTER_G55"), "ResourceType", "Cost"
	FROM "Unit_ResourceQuantityRequirements" WHERE (UnitType = "UNIT_FIGHTER_3");
-----------

-- P-51
INSERT INTO "Units" ('Type', 'Description', 'Civilopedia', 'Strategy', 'Help', 'Requirements', 'Combat', 'RangedCombat', 'Cost', 'Moves', 'Immobile', 'Range', 'BaseSightRange', 'Class', 'Special', 'Capture', 'CombatClass', 'Domain', 'CivilianAttackPriority', 'DefaultUnitAI', 'Food', 'NoBadGoodies', 'RivalTerritory', 'MilitarySupport', 'MilitaryProduction', 'Pillage', 'Found', 'FoundAbroad', 'CultureBombRadius', 'GoldenAgeTurns', 'IgnoreBuildingDefense', 'PrereqResources', 'Mechanized', 'Suicide', 'CaptureWhileEmbarked', 'PrereqTech', 'ObsoleteTech', 'GoodyHutUpgradeUnitClass', 'HurryCostModifier', 'AdvancedStartCost', 'MinAreaSize', 'AirUnitCap', 'NukeDamageLevel', 'WorkRate', 'NumFreeTechs', 'RushBuilding', 'BaseHurry', 'HurryMultiplier', 'BaseGold', 'NumGoldPerEra', 'SpreadReligion', 'IsReligious', 'CombatLimit', 'RangeAttackOnlyInDomain', 'RangeAttackIgnoreLOS', 'RangedCombatLimit', 'XPValueAttack', 'XPValueDefense', 'SpecialCargo', 'DomainCargo', 'Conscription', 'ExtraMaintenanceCost', 'NoMaintenance', 'Unhappiness', 'UnitArtInfo', 'UnitArtInfoCulturalVariation', 'UnitArtInfoEraVariation', 'ProjectPrereq', 'SpaceshipProject', 'LeaderPromotion', 'LeaderExperience', 'DontShowYields', 'ShowInPedia', 'MoveRate', 'UnitFlagIconOffset', 'PortraitIndex', 'IconAtlas', 'UnitFlagAtlas')
	SELECT	("UNIT_FIGHTER_P51"), ("TXT_KEY_UNIT_FIGHTER_P51"), "Civilopedia", "Strategy", "Help", "Requirements", "Combat", "RangedCombat", "Cost", "Moves", "Immobile", "Range", "BaseSightRange", "Class", "Special", "Capture", "CombatClass", "Domain", "CivilianAttackPriority", "DefaultUnitAI", "Food", "NoBadGoodies", "RivalTerritory", "MilitarySupport", "MilitaryProduction", "Pillage", "Found", "FoundAbroad", "CultureBombRadius", "GoldenAgeTurns", "IgnoreBuildingDefense", "PrereqResources", "Mechanized", "Suicide", "CaptureWhileEmbarked", "PrereqTech", "ObsoleteTech", "GoodyHutUpgradeUnitClass", "HurryCostModifier", "AdvancedStartCost", "MinAreaSize", "AirUnitCap", "NukeDamageLevel", "WorkRate", "NumFreeTechs", "RushBuilding", "BaseHurry", "HurryMultiplier", "BaseGold", "NumGoldPerEra", "SpreadReligion", "IsReligious", "CombatLimit", "RangeAttackOnlyInDomain", "RangeAttackIgnoreLOS", "RangedCombatLimit", "XPValueAttack", "XPValueDefense", "SpecialCargo", "DomainCargo", "Conscription", "ExtraMaintenanceCost", "NoMaintenance", "Unhappiness",
			("ART_DEF_UNIT_FIGHTER_P51"), "UnitArtInfoCulturalVariation", "UnitArtInfoEraVariation", ("PROJECT_P51"), "SpaceshipProject", "LeaderPromotion", "LeaderExperience", "DontShowYields", "ShowInPedia", "MoveRate", "UnitFlagIconOffset", "PortraitIndex", "IconAtlas", "UnitFlagAtlas"
	FROM "Units" WHERE (Type = "UNIT_FIGHTER_3");
INSERT INTO "Language_en_US" ( 'Tag', 'Text' )
	VALUES ( 'TXT_KEY_UNIT_FIGHTER_P51', 'P-51 Mustang' );
INSERT INTO "Unit_AITypes" ('UnitType', 'UnitAIType')
	SELECT ("UNIT_FIGHTER_P51"), "UnitAIType"
	FROM "Unit_AITypes" WHERE (UnitType = "UNIT_FIGHTER_3");
INSERT INTO "Unit_ClassUpgrades" ('UnitType', 'UnitClassType')
	SELECT ("UNIT_FIGHTER_P51"), "UnitClassType"
	FROM "Unit_ClassUpgrades" WHERE (UnitType = "UNIT_FIGHTER_3");
INSERT INTO "Civilization_UnitClassOverrides" ( 'CivilizationType', 'UnitClassType', 'UnitType' )
	VALUES ( 'CIVILIZATION_AMERICA', 'UNITCLASS_FIGHTER_3', 'UNIT_FIGHTER_P51' );
INSERT INTO "Unit_Flavors" ('UnitType', 'FlavorType', 'Flavor')
	SELECT ("UNIT_FIGHTER_P51"), "FlavorType", "Flavor"
	FROM "Unit_Flavors" WHERE (UnitType = "UNIT_FIGHTER_3");
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	SELECT ("UNIT_FIGHTER_P51"), "PromotionType"
	FROM "Unit_FreePromotions" WHERE (UnitType = "UNIT_FIGHTER_3");
INSERT INTO "Unit_ResourceQuantityRequirements" ('UnitType', 'ResourceType', 'Cost')
	SELECT ("UNIT_FIGHTER_P51"), "ResourceType", "Cost"
	FROM "Unit_ResourceQuantityRequirements" WHERE (UnitType = "UNIT_FIGHTER_3");
-----------

-- P-36 Hawk
INSERT INTO "Units" ('Type', 'Description', 'Civilopedia', 'Strategy', 'Help', 'Requirements', 'Combat', 'RangedCombat', 'Cost', 'Moves', 'Immobile', 'Range', 'BaseSightRange', 'Class', 'Special', 'Capture', 'CombatClass', 'Domain', 'CivilianAttackPriority', 'DefaultUnitAI', 'Food', 'NoBadGoodies', 'RivalTerritory', 'MilitarySupport', 'MilitaryProduction', 'Pillage', 'Found', 'FoundAbroad', 'CultureBombRadius', 'GoldenAgeTurns', 'IgnoreBuildingDefense', 'PrereqResources', 'Mechanized', 'Suicide', 'CaptureWhileEmbarked', 'PrereqTech', 'ObsoleteTech', 'GoodyHutUpgradeUnitClass', 'HurryCostModifier', 'AdvancedStartCost', 'MinAreaSize', 'AirUnitCap', 'NukeDamageLevel', 'WorkRate', 'NumFreeTechs', 'RushBuilding', 'BaseHurry', 'HurryMultiplier', 'BaseGold', 'NumGoldPerEra', 'SpreadReligion', 'IsReligious', 'CombatLimit', 'RangeAttackOnlyInDomain', 'RangeAttackIgnoreLOS', 'RangedCombatLimit', 'XPValueAttack', 'XPValueDefense', 'SpecialCargo', 'DomainCargo', 'Conscription', 'ExtraMaintenanceCost', 'NoMaintenance', 'Unhappiness', 'UnitArtInfo', 'UnitArtInfoCulturalVariation', 'UnitArtInfoEraVariation', 'ProjectPrereq', 'SpaceshipProject', 'LeaderPromotion', 'LeaderExperience', 'DontShowYields', 'ShowInPedia', 'MoveRate', 'UnitFlagIconOffset', 'PortraitIndex', 'IconAtlas', 'UnitFlagAtlas')
	SELECT	("UNIT_FIGHTER_P36"), ("TXT_KEY_UNIT_FIGHTER_P36"), "Civilopedia", "Strategy", "Help", "Requirements", "Combat", "RangedCombat", "Cost", "Moves", "Immobile", "Range", "BaseSightRange", "Class", "Special", "Capture", "CombatClass", "Domain", "CivilianAttackPriority", "DefaultUnitAI", "Food", "NoBadGoodies", "RivalTerritory", "MilitarySupport", "MilitaryProduction", "Pillage", "Found", "FoundAbroad", "CultureBombRadius", "GoldenAgeTurns", "IgnoreBuildingDefense", "PrereqResources", "Mechanized", "Suicide", "CaptureWhileEmbarked", "PrereqTech", "ObsoleteTech", "GoodyHutUpgradeUnitClass", "HurryCostModifier", "AdvancedStartCost", "MinAreaSize", "AirUnitCap", "NukeDamageLevel", "WorkRate", "NumFreeTechs", "RushBuilding", "BaseHurry", "HurryMultiplier", "BaseGold", "NumGoldPerEra", "SpreadReligion", "IsReligious", "CombatLimit", "RangeAttackOnlyInDomain", "RangeAttackIgnoreLOS", "RangedCombatLimit", "XPValueAttack", "XPValueDefense", "SpecialCargo", "DomainCargo", "Conscription", "ExtraMaintenanceCost", "NoMaintenance", "Unhappiness",
			("ART_DEF_UNIT_FIGHTER_P36"), "UnitArtInfoCulturalVariation", "UnitArtInfoEraVariation", "ProjectPrereq", "SpaceshipProject", "LeaderPromotion", "LeaderExperience", "DontShowYields", "ShowInPedia", "MoveRate", "UnitFlagIconOffset", "PortraitIndex", "IconAtlas", "UnitFlagAtlas"
	FROM "Units" WHERE (Type = "UNIT_FIGHTER");
INSERT INTO "Language_en_US" ( 'Tag', 'Text' )
	VALUES ( 'TXT_KEY_UNIT_FIGHTER_P36', 'P-36 Hawk' );
INSERT INTO "Unit_AITypes" ('UnitType', 'UnitAIType')
	SELECT ("UNIT_FIGHTER_P36"), "UnitAIType"
	FROM "Unit_AITypes" WHERE (UnitType = "UNIT_FIGHTER");
INSERT INTO "Unit_ClassUpgrades" ('UnitType', 'UnitClassType')
	SELECT ("UNIT_FIGHTER_P36"), "UnitClassType"
	FROM "Unit_ClassUpgrades" WHERE (UnitType = "UNIT_FIGHTER");
INSERT INTO "Civilization_UnitClassOverrides" ( 'CivilizationType', 'UnitClassType', 'UnitType' )
	VALUES ( 'CIVILIZATION_AMERICA', 'UNITCLASS_FIGHTER', 'UNIT_FIGHTER_P36' );
INSERT INTO "Unit_Flavors" ('UnitType', 'FlavorType', 'Flavor')
	SELECT ("UNIT_FIGHTER_P36"), "FlavorType", "Flavor"
	FROM "Unit_Flavors" WHERE (UnitType = "UNIT_FIGHTER");
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	SELECT ("UNIT_FIGHTER_P36"), "PromotionType"
	FROM "Unit_FreePromotions" WHERE (UnitType = "UNIT_FIGHTER");
INSERT INTO "Unit_ResourceQuantityRequirements" ('UnitType', 'ResourceType', 'Cost')
	SELECT ("UNIT_FIGHTER_P36"), "ResourceType", "Cost"
	FROM "Unit_ResourceQuantityRequirements" WHERE (UnitType = "UNIT_FIGHTER");
-----------

-- Macchi C.202 Folgore
INSERT INTO "Units" ('Type', 'Description', 'Civilopedia', 'Strategy', 'Help', 'Requirements', 'Combat', 'RangedCombat', 'Cost', 'Moves', 'Immobile', 'Range', 'BaseSightRange', 'Class', 'Special', 'Capture', 'CombatClass', 'Domain', 'CivilianAttackPriority', 'DefaultUnitAI', 'Food', 'NoBadGoodies', 'RivalTerritory', 'MilitarySupport', 'MilitaryProduction', 'Pillage', 'Found', 'FoundAbroad', 'CultureBombRadius', 'GoldenAgeTurns', 'IgnoreBuildingDefense', 'PrereqResources', 'Mechanized', 'Suicide', 'CaptureWhileEmbarked', 'PrereqTech', 'ObsoleteTech', 'GoodyHutUpgradeUnitClass', 'HurryCostModifier', 'AdvancedStartCost', 'MinAreaSize', 'AirUnitCap', 'NukeDamageLevel', 'WorkRate', 'NumFreeTechs', 'RushBuilding', 'BaseHurry', 'HurryMultiplier', 'BaseGold', 'NumGoldPerEra', 'SpreadReligion', 'IsReligious', 'CombatLimit', 'RangeAttackOnlyInDomain', 'RangeAttackIgnoreLOS', 'RangedCombatLimit', 'XPValueAttack', 'XPValueDefense', 'SpecialCargo', 'DomainCargo', 'Conscription', 'ExtraMaintenanceCost', 'NoMaintenance', 'Unhappiness', 'UnitArtInfo', 'UnitArtInfoCulturalVariation', 'UnitArtInfoEraVariation', 'ProjectPrereq', 'SpaceshipProject', 'LeaderPromotion', 'LeaderExperience', 'DontShowYields', 'ShowInPedia', 'MoveRate', 'UnitFlagIconOffset', 'PortraitIndex', 'IconAtlas', 'UnitFlagAtlas')
	SELECT	("UNIT_FIGHTER_C202_FOLGORE"), ("TXT_KEY_UNIT_FIGHTER_C202_FOLGORE"), "Civilopedia", "Strategy", "Help", "Requirements", "Combat", "RangedCombat", "Cost", "Moves", "Immobile", "Range", "BaseSightRange", "Class", "Special", "Capture", "CombatClass", "Domain", "CivilianAttackPriority", "DefaultUnitAI", "Food", "NoBadGoodies", "RivalTerritory", "MilitarySupport", "MilitaryProduction", "Pillage", "Found", "FoundAbroad", "CultureBombRadius", "GoldenAgeTurns", "IgnoreBuildingDefense", "PrereqResources", "Mechanized", "Suicide", "CaptureWhileEmbarked", "PrereqTech", "ObsoleteTech", "GoodyHutUpgradeUnitClass", "HurryCostModifier", "AdvancedStartCost", "MinAreaSize", "AirUnitCap", "NukeDamageLevel", "WorkRate", "NumFreeTechs", "RushBuilding", "BaseHurry", "HurryMultiplier", "BaseGold", "NumGoldPerEra", "SpreadReligion", "IsReligious", "CombatLimit", "RangeAttackOnlyInDomain", "RangeAttackIgnoreLOS", "RangedCombatLimit", "XPValueAttack", "XPValueDefense", "SpecialCargo", "DomainCargo", "Conscription", "ExtraMaintenanceCost", "NoMaintenance", "Unhappiness",
			("ART_DEF_UNIT_FIGHTER_C202_FOLGORE"), "UnitArtInfoCulturalVariation", "UnitArtInfoEraVariation", ("PROJECT_MC202"), "SpaceshipProject", "LeaderPromotion", "LeaderExperience", "DontShowYields", "ShowInPedia", "MoveRate", "UnitFlagIconOffset", "PortraitIndex", "IconAtlas", "UnitFlagAtlas"
	FROM "Units" WHERE (Type = "UNIT_FIGHTER_2");
INSERT INTO "Language_en_US" ( 'Tag', 'Text' )
	VALUES ( 'TXT_KEY_UNIT_FIGHTER_C202_FOLGORE', 'Macchi C.202 Folgore' );
INSERT INTO "Unit_AITypes" ('UnitType', 'UnitAIType')
	SELECT ("UNIT_FIGHTER_C202_FOLGORE"), "UnitAIType"
	FROM "Unit_AITypes" WHERE (UnitType = "UNIT_FIGHTER_2");
INSERT INTO "Unit_ClassUpgrades" ('UnitType', 'UnitClassType')
	SELECT ("UNIT_FIGHTER_C202_FOLGORE"), "UnitClassType"
	FROM "Unit_ClassUpgrades" WHERE (UnitType = "UNIT_FIGHTER_2");
INSERT INTO "Civilization_UnitClassOverrides" ( 'CivilizationType', 'UnitClassType', 'UnitType' )
	VALUES ( 'CIVILIZATION_ROME', 'UNITCLASS_FIGHTER_2', 'UNIT_FIGHTER_C202_FOLGORE' );
INSERT INTO "Unit_Flavors" ('UnitType', 'FlavorType', 'Flavor')
	SELECT ("UNIT_FIGHTER_C202_FOLGORE"), "FlavorType", "Flavor"
	FROM "Unit_Flavors" WHERE (UnitType = "UNIT_FIGHTER_2");
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	SELECT ("UNIT_FIGHTER_C202_FOLGORE"), "PromotionType"
	FROM "Unit_FreePromotions" WHERE (UnitType = "UNIT_FIGHTER_2");
INSERT INTO "Unit_ResourceQuantityRequirements" ('UnitType', 'ResourceType', 'Cost')
	SELECT ("UNIT_FIGHTER_C202_FOLGORE"), "ResourceType", "Cost"
	FROM "Unit_ResourceQuantityRequirements" WHERE (UnitType = "UNIT_FIGHTER_2");
-----------

-- Yak-7
INSERT INTO "Units" ('Type', 'Description', 'Civilopedia', 'Strategy', 'Help', 'Requirements', 'Combat', 'RangedCombat', 'Cost', 'Moves', 'Immobile', 'Range', 'BaseSightRange', 'Class', 'Special', 'Capture', 'CombatClass', 'Domain', 'CivilianAttackPriority', 'DefaultUnitAI', 'Food', 'NoBadGoodies', 'RivalTerritory', 'MilitarySupport', 'MilitaryProduction', 'Pillage', 'Found', 'FoundAbroad', 'CultureBombRadius', 'GoldenAgeTurns', 'IgnoreBuildingDefense', 'PrereqResources', 'Mechanized', 'Suicide', 'CaptureWhileEmbarked', 'PrereqTech', 'ObsoleteTech', 'GoodyHutUpgradeUnitClass', 'HurryCostModifier', 'AdvancedStartCost', 'MinAreaSize', 'AirUnitCap', 'NukeDamageLevel', 'WorkRate', 'NumFreeTechs', 'RushBuilding', 'BaseHurry', 'HurryMultiplier', 'BaseGold', 'NumGoldPerEra', 'SpreadReligion', 'IsReligious', 'CombatLimit', 'RangeAttackOnlyInDomain', 'RangeAttackIgnoreLOS', 'RangedCombatLimit', 'XPValueAttack', 'XPValueDefense', 'SpecialCargo', 'DomainCargo', 'Conscription', 'ExtraMaintenanceCost', 'NoMaintenance', 'Unhappiness', 'UnitArtInfo', 'UnitArtInfoCulturalVariation', 'UnitArtInfoEraVariation', 'ProjectPrereq', 'SpaceshipProject', 'LeaderPromotion', 'LeaderExperience', 'DontShowYields', 'ShowInPedia', 'MoveRate', 'UnitFlagIconOffset', 'PortraitIndex', 'IconAtlas', 'UnitFlagAtlas')
	SELECT	("UNIT_FIGHTER_YAK7"), ("TXT_KEY_UNIT_FIGHTER_YAK7"), "Civilopedia", "Strategy", "Help", "Requirements", "Combat", "RangedCombat", "Cost", "Moves", "Immobile", "Range", "BaseSightRange", "Class", "Special", "Capture", "CombatClass", "Domain", "CivilianAttackPriority", "DefaultUnitAI", "Food", "NoBadGoodies", "RivalTerritory", "MilitarySupport", "MilitaryProduction", "Pillage", "Found", "FoundAbroad", "CultureBombRadius", "GoldenAgeTurns", "IgnoreBuildingDefense", "PrereqResources", "Mechanized", "Suicide", "CaptureWhileEmbarked", "PrereqTech", "ObsoleteTech", "GoodyHutUpgradeUnitClass", "HurryCostModifier", "AdvancedStartCost", "MinAreaSize", "AirUnitCap", "NukeDamageLevel", "WorkRate", "NumFreeTechs", "RushBuilding", "BaseHurry", "HurryMultiplier", "BaseGold", "NumGoldPerEra", "SpreadReligion", "IsReligious", "CombatLimit", "RangeAttackOnlyInDomain", "RangeAttackIgnoreLOS", "RangedCombatLimit", "XPValueAttack", "XPValueDefense", "SpecialCargo", "DomainCargo", "Conscription", "ExtraMaintenanceCost", "NoMaintenance", "Unhappiness",
			("ART_DEF_UNIT_FIGHTER_YAK7"), "UnitArtInfoCulturalVariation", "UnitArtInfoEraVariation", ("PROJECT_YAK7"), "SpaceshipProject", "LeaderPromotion", "LeaderExperience", "DontShowYields", "ShowInPedia", "MoveRate", "UnitFlagIconOffset", "PortraitIndex", "IconAtlas", "UnitFlagAtlas"
	FROM "Units" WHERE (Type = "UNIT_FIGHTER_2");
INSERT INTO "Language_en_US" ( 'Tag', 'Text' )
	VALUES ( 'TXT_KEY_UNIT_FIGHTER_YAK7', 'Yak-7' );
INSERT INTO "Unit_AITypes" ('UnitType', 'UnitAIType')
	SELECT ("UNIT_FIGHTER_YAK7"), "UnitAIType"
	FROM "Unit_AITypes" WHERE (UnitType = "UNIT_FIGHTER_2");
INSERT INTO "Unit_ClassUpgrades" ('UnitType', 'UnitClassType')
	SELECT ("UNIT_FIGHTER_YAK7"), "UnitClassType"
	FROM "Unit_ClassUpgrades" WHERE (UnitType = "UNIT_FIGHTER_2");
INSERT INTO "Civilization_UnitClassOverrides" ( 'CivilizationType', 'UnitClassType', 'UnitType' )
	VALUES ( 'CIVILIZATION_RUSSIA', 'UNITCLASS_FIGHTER_2', 'UNIT_FIGHTER_YAK7' );
INSERT INTO "Unit_Flavors" ('UnitType', 'FlavorType', 'Flavor')
	SELECT ("UNIT_FIGHTER_YAK7"), "FlavorType", "Flavor"
	FROM "Unit_Flavors" WHERE (UnitType = "UNIT_FIGHTER_2");
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	SELECT ("UNIT_FIGHTER_YAK7"), "PromotionType"
	FROM "Unit_FreePromotions" WHERE (UnitType = "UNIT_FIGHTER_2");
INSERT INTO "Unit_ResourceQuantityRequirements" ('UnitType', 'ResourceType', 'Cost')
	SELECT ("UNIT_FIGHTER_YAK7"), "ResourceType", "Cost"
	FROM "Unit_ResourceQuantityRequirements" WHERE (UnitType = "UNIT_FIGHTER_2");
-----------


--------------------------------------------------------------
-- HEAVY FIGHTERS
--------------------------------------------------------------


-- Potez 630
INSERT INTO "Units" ('Type', 'Description', 'Civilopedia', 'Strategy', 'Help', 'Requirements', 'Combat', 'RangedCombat', 'Cost', 'Moves', 'Immobile', 'Range', 'BaseSightRange', 'Class', 'Special', 'Capture', 'CombatClass', 'Domain', 'CivilianAttackPriority', 'DefaultUnitAI', 'Food', 'NoBadGoodies', 'RivalTerritory', 'MilitarySupport', 'MilitaryProduction', 'Pillage', 'Found', 'FoundAbroad', 'CultureBombRadius', 'GoldenAgeTurns', 'IgnoreBuildingDefense', 'PrereqResources', 'Mechanized', 'Suicide', 'CaptureWhileEmbarked', 'PrereqTech', 'ObsoleteTech', 'GoodyHutUpgradeUnitClass', 'HurryCostModifier', 'AdvancedStartCost', 'MinAreaSize', 'AirUnitCap', 'NukeDamageLevel', 'WorkRate', 'NumFreeTechs', 'RushBuilding', 'BaseHurry', 'HurryMultiplier', 'BaseGold', 'NumGoldPerEra', 'SpreadReligion', 'IsReligious', 'CombatLimit', 'RangeAttackOnlyInDomain', 'RangeAttackIgnoreLOS', 'RangedCombatLimit', 'XPValueAttack', 'XPValueDefense', 'SpecialCargo', 'DomainCargo', 'Conscription', 'ExtraMaintenanceCost', 'NoMaintenance', 'Unhappiness', 'UnitArtInfo', 'UnitArtInfoCulturalVariation', 'UnitArtInfoEraVariation', 'ProjectPrereq', 'SpaceshipProject', 'LeaderPromotion', 'LeaderExperience', 'DontShowYields', 'ShowInPedia', 'MoveRate', 'UnitFlagIconOffset', 'PortraitIndex', 'IconAtlas', 'UnitFlagAtlas')
	SELECT	("UNIT_FIGHTER_POTEZ630"), ("TXT_KEY_UNIT_FIGHTER_POTEZ630"), "Civilopedia", "Strategy", "Help", "Requirements", "Combat", "RangedCombat", "Cost", "Moves", "Immobile", "Range", "BaseSightRange", "Class", "Special", "Capture", "CombatClass", "Domain", "CivilianAttackPriority", "DefaultUnitAI", "Food", "NoBadGoodies", "RivalTerritory", "MilitarySupport", "MilitaryProduction", "Pillage", "Found", "FoundAbroad", "CultureBombRadius", "GoldenAgeTurns", "IgnoreBuildingDefense", "PrereqResources", "Mechanized", "Suicide", "CaptureWhileEmbarked", "PrereqTech", "ObsoleteTech", "GoodyHutUpgradeUnitClass", "HurryCostModifier", "AdvancedStartCost", "MinAreaSize", "AirUnitCap", "NukeDamageLevel", "WorkRate", "NumFreeTechs", "RushBuilding", "BaseHurry", "HurryMultiplier", "BaseGold", "NumGoldPerEra", "SpreadReligion", "IsReligious", "CombatLimit", "RangeAttackOnlyInDomain", "RangeAttackIgnoreLOS", "RangedCombatLimit", "XPValueAttack", "XPValueDefense", "SpecialCargo", "DomainCargo", "Conscription", "ExtraMaintenanceCost", "NoMaintenance", "Unhappiness",
			("ART_DEF_UNIT_FIGHTER_POTEZ630"), "UnitArtInfoCulturalVariation", "UnitArtInfoEraVariation", "ProjectPrereq", "SpaceshipProject", "LeaderPromotion", "LeaderExperience", "DontShowYields", "ShowInPedia", "MoveRate", "UnitFlagIconOffset", "PortraitIndex", "IconAtlas", "UnitFlagAtlas"
	FROM "Units" WHERE (Type = "UNIT_HEAVY_FIGHTER");
INSERT INTO "Language_en_US" ( 'Tag', 'Text' )
	VALUES ( 'TXT_KEY_UNIT_FIGHTER_POTEZ630', 'Potez 630' );
INSERT INTO "Unit_AITypes" ('UnitType', 'UnitAIType')
	SELECT ("UNIT_FIGHTER_POTEZ630"), "UnitAIType"
	FROM "Unit_AITypes" WHERE (UnitType = "UNIT_HEAVY_FIGHTER");
INSERT INTO "Unit_ClassUpgrades" ('UnitType', 'UnitClassType')
	SELECT ("UNIT_FIGHTER_POTEZ630"), "UnitClassType"
	FROM "Unit_ClassUpgrades" WHERE (UnitType = "UNIT_HEAVY_FIGHTER");
INSERT INTO "Civilization_UnitClassOverrides" ( 'CivilizationType', 'UnitClassType', 'UnitType' )
	VALUES ( 'CIVILIZATION_FRANCE', 'UNITCLASS_HEAVY_FIGHTER', 'UNIT_FIGHTER_POTEZ630' );
INSERT INTO "Unit_Flavors" ('UnitType', 'FlavorType', 'Flavor')
	SELECT ("UNIT_FIGHTER_POTEZ630"), "FlavorType", "Flavor"
	FROM "Unit_Flavors" WHERE (UnitType = "UNIT_HEAVY_FIGHTER");
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	SELECT ("UNIT_FIGHTER_POTEZ630"), "PromotionType"
	FROM "Unit_FreePromotions" WHERE (UnitType = "UNIT_HEAVY_FIGHTER");
INSERT INTO "Unit_ResourceQuantityRequirements" ('UnitType', 'ResourceType', 'Cost')
	SELECT ("UNIT_FIGHTER_POTEZ630"), "ResourceType", "Cost"
	FROM "Unit_ResourceQuantityRequirements" WHERE (UnitType = "UNIT_HEAVY_FIGHTER");
-----------

-- Westland Whirlwind
INSERT INTO "Units" ('Type', 'Description', 'Civilopedia', 'Strategy', 'Help', 'Requirements', 'Combat', 'RangedCombat', 'Cost', 'Moves', 'Immobile', 'Range', 'BaseSightRange', 'Class', 'Special', 'Capture', 'CombatClass', 'Domain', 'CivilianAttackPriority', 'DefaultUnitAI', 'Food', 'NoBadGoodies', 'RivalTerritory', 'MilitarySupport', 'MilitaryProduction', 'Pillage', 'Found', 'FoundAbroad', 'CultureBombRadius', 'GoldenAgeTurns', 'IgnoreBuildingDefense', 'PrereqResources', 'Mechanized', 'Suicide', 'CaptureWhileEmbarked', 'PrereqTech', 'ObsoleteTech', 'GoodyHutUpgradeUnitClass', 'HurryCostModifier', 'AdvancedStartCost', 'MinAreaSize', 'AirUnitCap', 'NukeDamageLevel', 'WorkRate', 'NumFreeTechs', 'RushBuilding', 'BaseHurry', 'HurryMultiplier', 'BaseGold', 'NumGoldPerEra', 'SpreadReligion', 'IsReligious', 'CombatLimit', 'RangeAttackOnlyInDomain', 'RangeAttackIgnoreLOS', 'RangedCombatLimit', 'XPValueAttack', 'XPValueDefense', 'SpecialCargo', 'DomainCargo', 'Conscription', 'ExtraMaintenanceCost', 'NoMaintenance', 'Unhappiness', 'UnitArtInfo', 'UnitArtInfoCulturalVariation', 'UnitArtInfoEraVariation', 'ProjectPrereq', 'SpaceshipProject', 'LeaderPromotion', 'LeaderExperience', 'DontShowYields', 'ShowInPedia', 'MoveRate', 'UnitFlagIconOffset', 'PortraitIndex', 'IconAtlas', 'UnitFlagAtlas')
	SELECT	("UNIT_FIGHTER_WHIRLWIND"), ("TXT_KEY_UNIT_FIGHTER_WHIRLWIND"), "Civilopedia", "Strategy", "Help", "Requirements", "Combat", "RangedCombat", "Cost", "Moves", "Immobile", "Range", "BaseSightRange", "Class", "Special", "Capture", "CombatClass", "Domain", "CivilianAttackPriority", "DefaultUnitAI", "Food", "NoBadGoodies", "RivalTerritory", "MilitarySupport", "MilitaryProduction", "Pillage", "Found", "FoundAbroad", "CultureBombRadius", "GoldenAgeTurns", "IgnoreBuildingDefense", "PrereqResources", "Mechanized", "Suicide", "CaptureWhileEmbarked", "PrereqTech", "ObsoleteTech", "GoodyHutUpgradeUnitClass", "HurryCostModifier", "AdvancedStartCost", "MinAreaSize", "AirUnitCap", "NukeDamageLevel", "WorkRate", "NumFreeTechs", "RushBuilding", "BaseHurry", "HurryMultiplier", "BaseGold", "NumGoldPerEra", "SpreadReligion", "IsReligious", "CombatLimit", "RangeAttackOnlyInDomain", "RangeAttackIgnoreLOS", "RangedCombatLimit", "XPValueAttack", "XPValueDefense", "SpecialCargo", "DomainCargo", "Conscription", "ExtraMaintenanceCost", "NoMaintenance", "Unhappiness",
			("ART_DEF_UNIT_FIGHTER_WHIRLWIND"), "UnitArtInfoCulturalVariation", "UnitArtInfoEraVariation", ("PROJECT_WHIRLWIND"), "SpaceshipProject", "LeaderPromotion", "LeaderExperience", "DontShowYields", "ShowInPedia", "MoveRate", "UnitFlagIconOffset", "PortraitIndex", "IconAtlas", "UnitFlagAtlas"
	FROM "Units" WHERE (Type = "UNIT_HEAVY_FIGHTER");
INSERT INTO "Language_en_US" ( 'Tag', 'Text' )
	VALUES ( 'TXT_KEY_UNIT_FIGHTER_WHIRLWIND', 'Westland Whirlwind' );
INSERT INTO "Unit_AITypes" ('UnitType', 'UnitAIType')
	SELECT ("UNIT_FIGHTER_WHIRLWIND"), "UnitAIType"
	FROM "Unit_AITypes" WHERE (UnitType = "UNIT_HEAVY_FIGHTER");
INSERT INTO "Unit_ClassUpgrades" ('UnitType', 'UnitClassType')
	SELECT ("UNIT_FIGHTER_WHIRLWIND"), "UnitClassType"
	FROM "Unit_ClassUpgrades" WHERE (UnitType = "UNIT_HEAVY_FIGHTER");
INSERT INTO "Civilization_UnitClassOverrides" ( 'CivilizationType', 'UnitClassType', 'UnitType' )
	VALUES ( 'CIVILIZATION_ENGLAND', 'UNITCLASS_HEAVY_FIGHTER', 'UNIT_FIGHTER_WHIRLWIND' );
INSERT INTO "Unit_Flavors" ('UnitType', 'FlavorType', 'Flavor')
	SELECT ("UNIT_FIGHTER_WHIRLWIND"), "FlavorType", "Flavor"
	FROM "Unit_Flavors" WHERE (UnitType = "UNIT_HEAVY_FIGHTER");
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	SELECT ("UNIT_FIGHTER_WHIRLWIND"), "PromotionType"
	FROM "Unit_FreePromotions" WHERE (UnitType = "UNIT_HEAVY_FIGHTER");
INSERT INTO "Unit_ResourceQuantityRequirements" ('UnitType', 'ResourceType', 'Cost')
	SELECT ("UNIT_FIGHTER_WHIRLWIND"), "ResourceType", "Cost"
	FROM "Unit_ResourceQuantityRequirements" WHERE (UnitType = "UNIT_HEAVY_FIGHTER");
-----------

-- Messerschmitt Bf 110
INSERT INTO "Units" ('Type', 'Description', 'Civilopedia', 'Strategy', 'Help', 'Requirements', 'Combat', 'RangedCombat', 'Cost', 'Moves', 'Immobile', 'Range', 'BaseSightRange', 'Class', 'Special', 'Capture', 'CombatClass', 'Domain', 'CivilianAttackPriority', 'DefaultUnitAI', 'Food', 'NoBadGoodies', 'RivalTerritory', 'MilitarySupport', 'MilitaryProduction', 'Pillage', 'Found', 'FoundAbroad', 'CultureBombRadius', 'GoldenAgeTurns', 'IgnoreBuildingDefense', 'PrereqResources', 'Mechanized', 'Suicide', 'CaptureWhileEmbarked', 'PrereqTech', 'ObsoleteTech', 'GoodyHutUpgradeUnitClass', 'HurryCostModifier', 'AdvancedStartCost', 'MinAreaSize', 'AirUnitCap', 'NukeDamageLevel', 'WorkRate', 'NumFreeTechs', 'RushBuilding', 'BaseHurry', 'HurryMultiplier', 'BaseGold', 'NumGoldPerEra', 'SpreadReligion', 'IsReligious', 'CombatLimit', 'RangeAttackOnlyInDomain', 'RangeAttackIgnoreLOS', 'RangedCombatLimit', 'XPValueAttack', 'XPValueDefense', 'SpecialCargo', 'DomainCargo', 'Conscription', 'ExtraMaintenanceCost', 'NoMaintenance', 'Unhappiness', 'UnitArtInfo', 'UnitArtInfoCulturalVariation', 'UnitArtInfoEraVariation', 'ProjectPrereq', 'SpaceshipProject', 'LeaderPromotion', 'LeaderExperience', 'DontShowYields', 'ShowInPedia', 'MoveRate', 'UnitFlagIconOffset', 'PortraitIndex', 'IconAtlas', 'UnitFlagAtlas')
	SELECT	("UNIT_FIGHTER_BF110"), ("TXT_KEY_UNIT_FIGHTER_BF110"), "Civilopedia", "Strategy", "Help", "Requirements", "Combat", "RangedCombat", "Cost", "Moves", "Immobile", "Range", "BaseSightRange", "Class", "Special", "Capture", "CombatClass", "Domain", "CivilianAttackPriority", "DefaultUnitAI", "Food", "NoBadGoodies", "RivalTerritory", "MilitarySupport", "MilitaryProduction", "Pillage", "Found", "FoundAbroad", "CultureBombRadius", "GoldenAgeTurns", "IgnoreBuildingDefense", "PrereqResources", "Mechanized", "Suicide", "CaptureWhileEmbarked", "PrereqTech", "ObsoleteTech", "GoodyHutUpgradeUnitClass", "HurryCostModifier", "AdvancedStartCost", "MinAreaSize", "AirUnitCap", "NukeDamageLevel", "WorkRate", "NumFreeTechs", "RushBuilding", "BaseHurry", "HurryMultiplier", "BaseGold", "NumGoldPerEra", "SpreadReligion", "IsReligious", "CombatLimit", "RangeAttackOnlyInDomain", "RangeAttackIgnoreLOS", "RangedCombatLimit", "XPValueAttack", "XPValueDefense", "SpecialCargo", "DomainCargo", "Conscription", "ExtraMaintenanceCost", "NoMaintenance", "Unhappiness",
			("ART_DEF_UNIT_FIGHTER_BF110"), "UnitArtInfoCulturalVariation", "UnitArtInfoEraVariation", ("PROJECT_BF110"), "SpaceshipProject", "LeaderPromotion", "LeaderExperience", "DontShowYields", "ShowInPedia", "MoveRate", "UnitFlagIconOffset", "PortraitIndex", "IconAtlas", "UnitFlagAtlas"
	FROM "Units" WHERE (Type = "UNIT_HEAVY_FIGHTER");
INSERT INTO "Language_en_US" ( 'Tag', 'Text' )
	VALUES ( 'TXT_KEY_UNIT_FIGHTER_BF110', 'Messerschmitt Bf 110' );
INSERT INTO "Unit_AITypes" ('UnitType', 'UnitAIType')
	SELECT ("UNIT_FIGHTER_BF110"), "UnitAIType"
	FROM "Unit_AITypes" WHERE (UnitType = "UNIT_HEAVY_FIGHTER");
INSERT INTO "Unit_ClassUpgrades" ('UnitType', 'UnitClassType')
	SELECT ("UNIT_FIGHTER_BF110"), "UnitClassType"
	FROM "Unit_ClassUpgrades" WHERE (UnitType = "UNIT_HEAVY_FIGHTER");
INSERT INTO "Civilization_UnitClassOverrides" ( 'CivilizationType', 'UnitClassType', 'UnitType' )
	VALUES ( 'CIVILIZATION_GERMANY', 'UNITCLASS_HEAVY_FIGHTER', 'UNIT_FIGHTER_BF110' );
INSERT INTO "Unit_Flavors" ('UnitType', 'FlavorType', 'Flavor')
	SELECT ("UNIT_FIGHTER_BF110"), "FlavorType", "Flavor"
	FROM "Unit_Flavors" WHERE (UnitType = "UNIT_HEAVY_FIGHTER");
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	SELECT ("UNIT_FIGHTER_BF110"), "PromotionType"
	FROM "Unit_FreePromotions" WHERE (UnitType = "UNIT_HEAVY_FIGHTER");
INSERT INTO "Unit_ResourceQuantityRequirements" ('UnitType', 'ResourceType', 'Cost')
	SELECT ("UNIT_FIGHTER_BF110"), "ResourceType", "Cost"
	FROM "Unit_ResourceQuantityRequirements" WHERE (UnitType = "UNIT_HEAVY_FIGHTER");
-----------

-- Messerschmitt Bf 110 F4
INSERT INTO "Units" ('Type', 'Description', 'Civilopedia', 'Strategy', 'Help', 'Requirements', 'Combat', 'RangedCombat', 'Cost', 'Moves', 'Immobile', 'Range', 'BaseSightRange', 'Class', 'Special', 'Capture', 'CombatClass', 'Domain', 'CivilianAttackPriority', 'DefaultUnitAI', 'Food', 'NoBadGoodies', 'RivalTerritory', 'MilitarySupport', 'MilitaryProduction', 'Pillage', 'Found', 'FoundAbroad', 'CultureBombRadius', 'GoldenAgeTurns', 'IgnoreBuildingDefense', 'PrereqResources', 'Mechanized', 'Suicide', 'CaptureWhileEmbarked', 'PrereqTech', 'ObsoleteTech', 'GoodyHutUpgradeUnitClass', 'HurryCostModifier', 'AdvancedStartCost', 'MinAreaSize', 'AirUnitCap', 'NukeDamageLevel', 'WorkRate', 'NumFreeTechs', 'RushBuilding', 'BaseHurry', 'HurryMultiplier', 'BaseGold', 'NumGoldPerEra', 'SpreadReligion', 'IsReligious', 'CombatLimit', 'RangeAttackOnlyInDomain', 'RangeAttackIgnoreLOS', 'RangedCombatLimit', 'XPValueAttack', 'XPValueDefense', 'SpecialCargo', 'DomainCargo', 'Conscription', 'ExtraMaintenanceCost', 'NoMaintenance', 'Unhappiness', 'UnitArtInfo', 'UnitArtInfoCulturalVariation', 'UnitArtInfoEraVariation', 'ProjectPrereq', 'SpaceshipProject', 'LeaderPromotion', 'LeaderExperience', 'DontShowYields', 'ShowInPedia', 'MoveRate', 'UnitFlagIconOffset', 'PortraitIndex', 'IconAtlas', 'UnitFlagAtlas')
	SELECT	("UNIT_FIGHTER_BF110_F4"), ("TXT_KEY_UNIT_FIGHTER_BF110_F4"), "Civilopedia", "Strategy", "Help", "Requirements", "Combat", "RangedCombat", "Cost", "Moves", "Immobile", "Range", "BaseSightRange", "Class", "Special", "Capture", "CombatClass", "Domain", "CivilianAttackPriority", "DefaultUnitAI", "Food", "NoBadGoodies", "RivalTerritory", "MilitarySupport", "MilitaryProduction", "Pillage", "Found", "FoundAbroad", "CultureBombRadius", "GoldenAgeTurns", "IgnoreBuildingDefense", "PrereqResources", "Mechanized", "Suicide", "CaptureWhileEmbarked", "PrereqTech", "ObsoleteTech", "GoodyHutUpgradeUnitClass", "HurryCostModifier", "AdvancedStartCost", "MinAreaSize", "AirUnitCap", "NukeDamageLevel", "WorkRate", "NumFreeTechs", "RushBuilding", "BaseHurry", "HurryMultiplier", "BaseGold", "NumGoldPerEra", "SpreadReligion", "IsReligious", "CombatLimit", "RangeAttackOnlyInDomain", "RangeAttackIgnoreLOS", "RangedCombatLimit", "XPValueAttack", "XPValueDefense", "SpecialCargo", "DomainCargo", "Conscription", "ExtraMaintenanceCost", "NoMaintenance", "Unhappiness",
			("ART_DEF_UNIT_FIGHTER_BF110_F4"), "UnitArtInfoCulturalVariation", "UnitArtInfoEraVariation", ("PROJECT_BF110F4"), "SpaceshipProject", "LeaderPromotion", "LeaderExperience", "DontShowYields", "ShowInPedia", "MoveRate", "UnitFlagIconOffset", "PortraitIndex", "IconAtlas", "UnitFlagAtlas"
	FROM "Units" WHERE (Type = "UNIT_HEAVY_FIGHTER_B");
INSERT INTO "Language_en_US" ( 'Tag', 'Text' )
	VALUES ( 'TXT_KEY_UNIT_FIGHTER_BF110_F4', 'Messerschmitt Bf 110 F4' );
INSERT INTO "Unit_AITypes" ('UnitType', 'UnitAIType')
	SELECT ("UNIT_FIGHTER_BF110_F4"), "UnitAIType"
	FROM "Unit_AITypes" WHERE (UnitType = "UNIT_HEAVY_FIGHTER_B");
INSERT INTO "Unit_ClassUpgrades" ('UnitType', 'UnitClassType')
	SELECT ("UNIT_FIGHTER_BF110_F4"), "UnitClassType"
	FROM "Unit_ClassUpgrades" WHERE (UnitType = "UNIT_HEAVY_FIGHTER_B");
INSERT INTO "Civilization_UnitClassOverrides" ( 'CivilizationType', 'UnitClassType', 'UnitType' )
	VALUES ( 'CIVILIZATION_GERMANY', 'UNITCLASS_HEAVY_FIGHTER_B', 'UNIT_FIGHTER_BF110_F4' );
INSERT INTO "Unit_Flavors" ('UnitType', 'FlavorType', 'Flavor')
	SELECT ("UNIT_FIGHTER_BF110_F4"), "FlavorType", "Flavor"
	FROM "Unit_Flavors" WHERE (UnitType = "UNIT_HEAVY_FIGHTER_B");
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	SELECT ("UNIT_FIGHTER_BF110_F4"), "PromotionType"
	FROM "Unit_FreePromotions" WHERE (UnitType = "UNIT_HEAVY_FIGHTER_B");
INSERT INTO "Unit_ResourceQuantityRequirements" ('UnitType', 'ResourceType', 'Cost')
	SELECT ("UNIT_FIGHTER_BF110_F4"), "ResourceType", "Cost"
	FROM "Unit_ResourceQuantityRequirements" WHERE (UnitType = "UNIT_HEAVY_FIGHTER_B");
-----------

-- Junkers Ju 88C
INSERT INTO "Units" ('Type', 'Description', 'Civilopedia', 'Strategy', 'Help', 'Requirements', 'Combat', 'RangedCombat', 'Cost', 'Moves', 'Immobile', 'Range', 'BaseSightRange', 'Class', 'Special', 'Capture', 'CombatClass', 'Domain', 'CivilianAttackPriority', 'DefaultUnitAI', 'Food', 'NoBadGoodies', 'RivalTerritory', 'MilitarySupport', 'MilitaryProduction', 'Pillage', 'Found', 'FoundAbroad', 'CultureBombRadius', 'GoldenAgeTurns', 'IgnoreBuildingDefense', 'PrereqResources', 'Mechanized', 'Suicide', 'CaptureWhileEmbarked', 'PrereqTech', 'ObsoleteTech', 'GoodyHutUpgradeUnitClass', 'HurryCostModifier', 'AdvancedStartCost', 'MinAreaSize', 'AirUnitCap', 'NukeDamageLevel', 'WorkRate', 'NumFreeTechs', 'RushBuilding', 'BaseHurry', 'HurryMultiplier', 'BaseGold', 'NumGoldPerEra', 'SpreadReligion', 'IsReligious', 'CombatLimit', 'RangeAttackOnlyInDomain', 'RangeAttackIgnoreLOS', 'RangedCombatLimit', 'XPValueAttack', 'XPValueDefense', 'SpecialCargo', 'DomainCargo', 'Conscription', 'ExtraMaintenanceCost', 'NoMaintenance', 'Unhappiness', 'UnitArtInfo', 'UnitArtInfoCulturalVariation', 'UnitArtInfoEraVariation', 'ProjectPrereq', 'SpaceshipProject', 'LeaderPromotion', 'LeaderExperience', 'DontShowYields', 'ShowInPedia', 'MoveRate', 'UnitFlagIconOffset', 'PortraitIndex', 'IconAtlas', 'UnitFlagAtlas')
	SELECT	("UNIT_FIGHTER_JU88C"), ("TXT_KEY_UNIT_FIGHTER_JU88C"), "Civilopedia", "Strategy", "Help", "Requirements", "Combat", "RangedCombat", "Cost", "Moves", "Immobile", "Range", "BaseSightRange", "Class", "Special", "Capture", "CombatClass", "Domain", "CivilianAttackPriority", "DefaultUnitAI", "Food", "NoBadGoodies", "RivalTerritory", "MilitarySupport", "MilitaryProduction", "Pillage", "Found", "FoundAbroad", "CultureBombRadius", "GoldenAgeTurns", "IgnoreBuildingDefense", "PrereqResources", "Mechanized", "Suicide", "CaptureWhileEmbarked", "PrereqTech", "ObsoleteTech", "GoodyHutUpgradeUnitClass", "HurryCostModifier", "AdvancedStartCost", "MinAreaSize", "AirUnitCap", "NukeDamageLevel", "WorkRate", "NumFreeTechs", "RushBuilding", "BaseHurry", "HurryMultiplier", "BaseGold", "NumGoldPerEra", "SpreadReligion", "IsReligious", "CombatLimit", "RangeAttackOnlyInDomain", "RangeAttackIgnoreLOS", "RangedCombatLimit", "XPValueAttack", "XPValueDefense", "SpecialCargo", "DomainCargo", "Conscription", "ExtraMaintenanceCost", "NoMaintenance", "Unhappiness",
			("ART_DEF_UNIT_FIGHTER_JU88C"), "UnitArtInfoCulturalVariation", "UnitArtInfoEraVariation", ("PROJECT_JU88"), "SpaceshipProject", "LeaderPromotion", "LeaderExperience", "DontShowYields", "ShowInPedia", "MoveRate", "UnitFlagIconOffset", "PortraitIndex", "IconAtlas", "UnitFlagAtlas"
	FROM "Units" WHERE (Type = "UNIT_HEAVY_FIGHTER_2");
INSERT INTO "Language_en_US" ( 'Tag', 'Text' )
	VALUES ( 'TXT_KEY_UNIT_FIGHTER_JU88C', 'Junkers Ju 88C' );
INSERT INTO "Unit_AITypes" ('UnitType', 'UnitAIType')
	SELECT ("UNIT_FIGHTER_JU88C"), "UnitAIType"
	FROM "Unit_AITypes" WHERE (UnitType = "UNIT_HEAVY_FIGHTER_2");
INSERT INTO "Unit_ClassUpgrades" ('UnitType', 'UnitClassType')
	SELECT ("UNIT_FIGHTER_JU88C"), "UnitClassType"
	FROM "Unit_ClassUpgrades" WHERE (UnitType = "UNIT_HEAVY_FIGHTER_2");
INSERT INTO "Civilization_UnitClassOverrides" ( 'CivilizationType', 'UnitClassType', 'UnitType' )
	VALUES ( 'CIVILIZATION_GERMANY', 'UNITCLASS_HEAVY_FIGHTER_2', 'UNIT_FIGHTER_JU88C' );
INSERT INTO "Unit_Flavors" ('UnitType', 'FlavorType', 'Flavor')
	SELECT ("UNIT_FIGHTER_JU88C"), "FlavorType", "Flavor"
	FROM "Unit_Flavors" WHERE (UnitType = "UNIT_HEAVY_FIGHTER_2");
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	SELECT ("UNIT_FIGHTER_JU88C"), "PromotionType"
	FROM "Unit_FreePromotions" WHERE (UnitType = "UNIT_HEAVY_FIGHTER_2");
INSERT INTO "Unit_ResourceQuantityRequirements" ('UnitType', 'ResourceType', 'Cost')
	SELECT ("UNIT_FIGHTER_JU88C"), "ResourceType", "Cost"
	FROM "Unit_ResourceQuantityRequirements" WHERE (UnitType = "UNIT_HEAVY_FIGHTER_2");
-----------

-- Bristol Beaufighter
INSERT INTO "Units" ('Type', 'Description', 'Civilopedia', 'Strategy', 'Help', 'Requirements', 'Combat', 'RangedCombat', 'Cost', 'Moves', 'Immobile', 'Range', 'BaseSightRange', 'Class', 'Special', 'Capture', 'CombatClass', 'Domain', 'CivilianAttackPriority', 'DefaultUnitAI', 'Food', 'NoBadGoodies', 'RivalTerritory', 'MilitarySupport', 'MilitaryProduction', 'Pillage', 'Found', 'FoundAbroad', 'CultureBombRadius', 'GoldenAgeTurns', 'IgnoreBuildingDefense', 'PrereqResources', 'Mechanized', 'Suicide', 'CaptureWhileEmbarked', 'PrereqTech', 'ObsoleteTech', 'GoodyHutUpgradeUnitClass', 'HurryCostModifier', 'AdvancedStartCost', 'MinAreaSize', 'AirUnitCap', 'NukeDamageLevel', 'WorkRate', 'NumFreeTechs', 'RushBuilding', 'BaseHurry', 'HurryMultiplier', 'BaseGold', 'NumGoldPerEra', 'SpreadReligion', 'IsReligious', 'CombatLimit', 'RangeAttackOnlyInDomain', 'RangeAttackIgnoreLOS', 'RangedCombatLimit', 'XPValueAttack', 'XPValueDefense', 'SpecialCargo', 'DomainCargo', 'Conscription', 'ExtraMaintenanceCost', 'NoMaintenance', 'Unhappiness', 'UnitArtInfo', 'UnitArtInfoCulturalVariation', 'UnitArtInfoEraVariation', 'ProjectPrereq', 'SpaceshipProject', 'LeaderPromotion', 'LeaderExperience', 'DontShowYields', 'ShowInPedia', 'MoveRate', 'UnitFlagIconOffset', 'PortraitIndex', 'IconAtlas', 'UnitFlagAtlas')
	SELECT	("UNIT_FIGHTER_BEAUFIGHTER"), ("TXT_KEY_UNIT_FIGHTER_BEAUFIGHTER"), "Civilopedia", "Strategy", "Help", "Requirements", "Combat", "RangedCombat", "Cost", "Moves", "Immobile", "Range", "BaseSightRange", "Class", "Special", "Capture", "CombatClass", "Domain", "CivilianAttackPriority", "DefaultUnitAI", "Food", "NoBadGoodies", "RivalTerritory", "MilitarySupport", "MilitaryProduction", "Pillage", "Found", "FoundAbroad", "CultureBombRadius", "GoldenAgeTurns", "IgnoreBuildingDefense", "PrereqResources", "Mechanized", "Suicide", "CaptureWhileEmbarked", "PrereqTech", "ObsoleteTech", "GoodyHutUpgradeUnitClass", "HurryCostModifier", "AdvancedStartCost", "MinAreaSize", "AirUnitCap", "NukeDamageLevel", "WorkRate", "NumFreeTechs", "RushBuilding", "BaseHurry", "HurryMultiplier", "BaseGold", "NumGoldPerEra", "SpreadReligion", "IsReligious", "CombatLimit", "RangeAttackOnlyInDomain", "RangeAttackIgnoreLOS", "RangedCombatLimit", "XPValueAttack", "XPValueDefense", "SpecialCargo", "DomainCargo", "Conscription", "ExtraMaintenanceCost", "NoMaintenance", "Unhappiness",
			("ART_DEF_UNIT_FIGHTER_BEAUFIGHTER"), "UnitArtInfoCulturalVariation", "UnitArtInfoEraVariation", ("PROJECT_BEAUFIGHTER"), "SpaceshipProject", "LeaderPromotion", "LeaderExperience", "DontShowYields", "ShowInPedia", "MoveRate", "UnitFlagIconOffset", "PortraitIndex", "IconAtlas", "UnitFlagAtlas"
	FROM "Units" WHERE (Type = "UNIT_HEAVY_FIGHTER_2");
INSERT INTO "Language_en_US" ( 'Tag', 'Text' )
	VALUES ( 'TXT_KEY_UNIT_FIGHTER_BEAUFIGHTER', 'Bristol Beaufighter' );
INSERT INTO "Unit_AITypes" ('UnitType', 'UnitAIType')
	SELECT ("UNIT_FIGHTER_BEAUFIGHTER"), "UnitAIType"
	FROM "Unit_AITypes" WHERE (UnitType = "UNIT_HEAVY_FIGHTER_2");
INSERT INTO "Unit_ClassUpgrades" ('UnitType', 'UnitClassType')
	SELECT ("UNIT_FIGHTER_BEAUFIGHTER"), "UnitClassType"
	FROM "Unit_ClassUpgrades" WHERE (UnitType = "UNIT_HEAVY_FIGHTER_2");
INSERT INTO "Civilization_UnitClassOverrides" ( 'CivilizationType', 'UnitClassType', 'UnitType' )
	VALUES ( 'CIVILIZATION_ENGLAND', 'UNITCLASS_HEAVY_FIGHTER_2', 'UNIT_FIGHTER_BEAUFIGHTER' );
INSERT INTO "Unit_Flavors" ('UnitType', 'FlavorType', 'Flavor')
	SELECT ("UNIT_FIGHTER_BEAUFIGHTER"), "FlavorType", "Flavor"
	FROM "Unit_Flavors" WHERE (UnitType = "UNIT_HEAVY_FIGHTER_2");
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	SELECT ("UNIT_FIGHTER_BEAUFIGHTER"), "PromotionType"
	FROM "Unit_FreePromotions" WHERE (UnitType = "UNIT_HEAVY_FIGHTER_2");
INSERT INTO "Unit_ResourceQuantityRequirements" ('UnitType', 'ResourceType', 'Cost')
	SELECT ("UNIT_FIGHTER_BEAUFIGHTER"), "ResourceType", "Cost"
	FROM "Unit_ResourceQuantityRequirements" WHERE (UnitType = "UNIT_HEAVY_FIGHTER_2");
-----------

-- P-38
INSERT INTO "Units" ('Type', 'Description', 'Civilopedia', 'Strategy', 'Help', 'Requirements', 'Combat', 'RangedCombat', 'Cost', 'Moves', 'Immobile', 'Range', 'BaseSightRange', 'Class', 'Special', 'Capture', 'CombatClass', 'Domain', 'CivilianAttackPriority', 'DefaultUnitAI', 'Food', 'NoBadGoodies', 'RivalTerritory', 'MilitarySupport', 'MilitaryProduction', 'Pillage', 'Found', 'FoundAbroad', 'CultureBombRadius', 'GoldenAgeTurns', 'IgnoreBuildingDefense', 'PrereqResources', 'Mechanized', 'Suicide', 'CaptureWhileEmbarked', 'PrereqTech', 'ObsoleteTech', 'GoodyHutUpgradeUnitClass', 'HurryCostModifier', 'AdvancedStartCost', 'MinAreaSize', 'AirUnitCap', 'NukeDamageLevel', 'WorkRate', 'NumFreeTechs', 'RushBuilding', 'BaseHurry', 'HurryMultiplier', 'BaseGold', 'NumGoldPerEra', 'SpreadReligion', 'IsReligious', 'CombatLimit', 'RangeAttackOnlyInDomain', 'RangeAttackIgnoreLOS', 'RangedCombatLimit', 'XPValueAttack', 'XPValueDefense', 'SpecialCargo', 'DomainCargo', 'Conscription', 'ExtraMaintenanceCost', 'NoMaintenance', 'Unhappiness', 'UnitArtInfo', 'UnitArtInfoCulturalVariation', 'UnitArtInfoEraVariation', 'ProjectPrereq', 'SpaceshipProject', 'LeaderPromotion', 'LeaderExperience', 'DontShowYields', 'ShowInPedia', 'MoveRate', 'UnitFlagIconOffset', 'PortraitIndex', 'IconAtlas', 'UnitFlagAtlas')
	SELECT	("UNIT_FIGHTER_P38"), ("TXT_KEY_UNIT_FIGHTER_P38"), "Civilopedia", "Strategy", "Help", "Requirements", "Combat", "RangedCombat", "Cost", "Moves", "Immobile", "Range", "BaseSightRange", "Class", "Special", "Capture", "CombatClass", "Domain", "CivilianAttackPriority", "DefaultUnitAI", "Food", "NoBadGoodies", "RivalTerritory", "MilitarySupport", "MilitaryProduction", "Pillage", "Found", "FoundAbroad", "CultureBombRadius", "GoldenAgeTurns", "IgnoreBuildingDefense", "PrereqResources", "Mechanized", "Suicide", "CaptureWhileEmbarked", "PrereqTech", "ObsoleteTech", "GoodyHutUpgradeUnitClass", "HurryCostModifier", "AdvancedStartCost", "MinAreaSize", "AirUnitCap", "NukeDamageLevel", "WorkRate", "NumFreeTechs", "RushBuilding", "BaseHurry", "HurryMultiplier", "BaseGold", "NumGoldPerEra", "SpreadReligion", "IsReligious", "CombatLimit", "RangeAttackOnlyInDomain", "RangeAttackIgnoreLOS", "RangedCombatLimit", "XPValueAttack", "XPValueDefense", "SpecialCargo", "DomainCargo", "Conscription", "ExtraMaintenanceCost", "NoMaintenance", "Unhappiness",
			("ART_DEF_UNIT_FIGHTER_P38"), "UnitArtInfoCulturalVariation", "UnitArtInfoEraVariation", ("PROJECT_P38"), "SpaceshipProject", "LeaderPromotion", "LeaderExperience", "DontShowYields", "ShowInPedia", "MoveRate", "UnitFlagIconOffset", "PortraitIndex", "IconAtlas", "UnitFlagAtlas"
	FROM "Units" WHERE (Type = "UNIT_HEAVY_FIGHTER_2");
INSERT INTO "Language_en_US" ( 'Tag', 'Text' )
	VALUES ( 'TXT_KEY_UNIT_FIGHTER_P38', 'P-38 Lightning' );
INSERT INTO "Unit_AITypes" ('UnitType', 'UnitAIType')
	SELECT ("UNIT_FIGHTER_P38"), "UnitAIType"
	FROM "Unit_AITypes" WHERE (UnitType = "UNIT_HEAVY_FIGHTER_2");
INSERT INTO "Unit_ClassUpgrades" ('UnitType', 'UnitClassType')
	SELECT ("UNIT_FIGHTER_P38"), "UnitClassType"
	FROM "Unit_ClassUpgrades" WHERE (UnitType = "UNIT_HEAVY_FIGHTER_2");
INSERT INTO "Civilization_UnitClassOverrides" ( 'CivilizationType', 'UnitClassType', 'UnitType' )
	VALUES ( 'CIVILIZATION_AMERICA', 'UNITCLASS_HEAVY_FIGHTER_2', 'UNIT_FIGHTER_P38' );
INSERT INTO "Unit_Flavors" ('UnitType', 'FlavorType', 'Flavor')
	SELECT ("UNIT_FIGHTER_P38"), "FlavorType", "Flavor"
	FROM "Unit_Flavors" WHERE (UnitType = "UNIT_HEAVY_FIGHTER_2");
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	SELECT ("UNIT_FIGHTER_P38"), "PromotionType"
	FROM "Unit_FreePromotions" WHERE (UnitType = "UNIT_HEAVY_FIGHTER_2");
INSERT INTO "Unit_ResourceQuantityRequirements" ('UnitType', 'ResourceType', 'Cost')
	SELECT ("UNIT_FIGHTER_P38"), "ResourceType", "Cost"
	FROM "Unit_ResourceQuantityRequirements" WHERE (UnitType = "UNIT_HEAVY_FIGHTER_2");
-----------

-- Heinkel He 219
INSERT INTO "Units" ('Type', 'Description', 'Civilopedia', 'Strategy', 'Help', 'Requirements', 'Combat', 'RangedCombat', 'Cost', 'Moves', 'Immobile', 'Range', 'BaseSightRange', 'Class', 'Special', 'Capture', 'CombatClass', 'Domain', 'CivilianAttackPriority', 'DefaultUnitAI', 'Food', 'NoBadGoodies', 'RivalTerritory', 'MilitarySupport', 'MilitaryProduction', 'Pillage', 'Found', 'FoundAbroad', 'CultureBombRadius', 'GoldenAgeTurns', 'IgnoreBuildingDefense', 'PrereqResources', 'Mechanized', 'Suicide', 'CaptureWhileEmbarked', 'PrereqTech', 'ObsoleteTech', 'GoodyHutUpgradeUnitClass', 'HurryCostModifier', 'AdvancedStartCost', 'MinAreaSize', 'AirUnitCap', 'NukeDamageLevel', 'WorkRate', 'NumFreeTechs', 'RushBuilding', 'BaseHurry', 'HurryMultiplier', 'BaseGold', 'NumGoldPerEra', 'SpreadReligion', 'IsReligious', 'CombatLimit', 'RangeAttackOnlyInDomain', 'RangeAttackIgnoreLOS', 'RangedCombatLimit', 'XPValueAttack', 'XPValueDefense', 'SpecialCargo', 'DomainCargo', 'Conscription', 'ExtraMaintenanceCost', 'NoMaintenance', 'Unhappiness', 'UnitArtInfo', 'UnitArtInfoCulturalVariation', 'UnitArtInfoEraVariation', 'ProjectPrereq', 'SpaceshipProject', 'LeaderPromotion', 'LeaderExperience', 'DontShowYields', 'ShowInPedia', 'MoveRate', 'UnitFlagIconOffset', 'PortraitIndex', 'IconAtlas', 'UnitFlagAtlas')
	SELECT	("UNIT_FIGHTER_HE219"), ("TXT_KEY_UNIT_FIGHTER_HE219"), "Civilopedia", "Strategy", "Help", "Requirements", "Combat", "RangedCombat", "Cost", "Moves", "Immobile", "Range", "BaseSightRange", "Class", "Special", "Capture", "CombatClass", "Domain", "CivilianAttackPriority", "DefaultUnitAI", "Food", "NoBadGoodies", "RivalTerritory", "MilitarySupport", "MilitaryProduction", "Pillage", "Found", "FoundAbroad", "CultureBombRadius", "GoldenAgeTurns", "IgnoreBuildingDefense", "PrereqResources", "Mechanized", "Suicide", "CaptureWhileEmbarked", "PrereqTech", "ObsoleteTech", "GoodyHutUpgradeUnitClass", "HurryCostModifier", "AdvancedStartCost", "MinAreaSize", "AirUnitCap", "NukeDamageLevel", "WorkRate", "NumFreeTechs", "RushBuilding", "BaseHurry", "HurryMultiplier", "BaseGold", "NumGoldPerEra", "SpreadReligion", "IsReligious", "CombatLimit", "RangeAttackOnlyInDomain", "RangeAttackIgnoreLOS", "RangedCombatLimit", "XPValueAttack", "XPValueDefense", "SpecialCargo", "DomainCargo", "Conscription", "ExtraMaintenanceCost", "NoMaintenance", "Unhappiness",
			("ART_DEF_UNIT_FIGHTER_HE219"), "UnitArtInfoCulturalVariation", "UnitArtInfoEraVariation", ("PROJECT_HE219"), "SpaceshipProject", "LeaderPromotion", "LeaderExperience", "DontShowYields", "ShowInPedia", "MoveRate", "UnitFlagIconOffset", "PortraitIndex", "IconAtlas", "UnitFlagAtlas"
	FROM "Units" WHERE (Type = "UNIT_HEAVY_FIGHTER_3");
INSERT INTO "Language_en_US" ( 'Tag', 'Text' )
	VALUES ( 'TXT_KEY_UNIT_FIGHTER_HE219', 'Heinkel He 219' );
INSERT INTO "Unit_AITypes" ('UnitType', 'UnitAIType')
	SELECT ("UNIT_FIGHTER_HE219"), "UnitAIType"
	FROM "Unit_AITypes" WHERE (UnitType = "UNIT_HEAVY_FIGHTER_3");
INSERT INTO "Unit_ClassUpgrades" ('UnitType', 'UnitClassType')
	SELECT ("UNIT_FIGHTER_HE219"), "UnitClassType"
	FROM "Unit_ClassUpgrades" WHERE (UnitType = "UNIT_HEAVY_FIGHTER_3");
INSERT INTO "Civilization_UnitClassOverrides" ( 'CivilizationType', 'UnitClassType', 'UnitType' )
	VALUES ( 'CIVILIZATION_GERMANY', 'UNITCLASS_HEAVY_FIGHTER_3', 'UNIT_FIGHTER_HE219' );
INSERT INTO "Unit_Flavors" ('UnitType', 'FlavorType', 'Flavor')
	SELECT ("UNIT_FIGHTER_HE219"), "FlavorType", "Flavor"
	FROM "Unit_Flavors" WHERE (UnitType = "UNIT_HEAVY_FIGHTER_3");
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	SELECT ("UNIT_FIGHTER_HE219"), "PromotionType"
	FROM "Unit_FreePromotions" WHERE (UnitType = "UNIT_HEAVY_FIGHTER_3");
INSERT INTO "Unit_ResourceQuantityRequirements" ('UnitType', 'ResourceType', 'Cost')
	SELECT ("UNIT_FIGHTER_HE219"), "ResourceType", "Cost"
	FROM "Unit_ResourceQuantityRequirements" WHERE (UnitType = "UNIT_HEAVY_FIGHTER_3");
-----------