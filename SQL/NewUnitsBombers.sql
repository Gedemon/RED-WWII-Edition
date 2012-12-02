--------------------------------------------------------------
-- R.E.D. WW2 Edition New Units
-- Attack Aircrafts, Fast Bombers, Bombers, Heavy Bombers
--------------------------------------------------------------


-- remove vanilla B-17
--DELETE FROM "Units" WHERE Type = 'UNIT_AMERICAN_B17'; -- removed from default unit to free ID
DELETE FROM "Unit_AITypes" WHERE UnitType = 'UNIT_AMERICAN_B17';
DELETE FROM "Unit_ClassUpgrades" WHERE UnitType = 'UNIT_AMERICAN_B17';
DELETE FROM "Unit_Flavors" WHERE UnitType = 'UNIT_AMERICAN_B17';
DELETE FROM "Unit_FreePromotions" WHERE UnitType = 'UNIT_AMERICAN_B17';
DELETE FROM "Unit_ResourceQuantityRequirements" WHERE UnitType = 'UNIT_AMERICAN_B17';
-- we re-add it with heavy bombers data somewhere below...

--------------------------------------------------------------
-- ATTACK AIRCRAFTS
--------------------------------------------------------------


-- Bomber Fairey Battle (Greece)
INSERT INTO "Units" ('Type', 'Description', 'Civilopedia', 'Strategy', 'Help', 'Requirements', 'Combat', 'RangedCombat', 'Cost', 'Moves', 'Immobile', 'Range', 'BaseSightRange', 'Class', 'Special', 'Capture', 'CombatClass', 'Domain', 'CivilianAttackPriority', 'DefaultUnitAI', 'Food', 'NoBadGoodies', 'RivalTerritory', 'MilitarySupport', 'MilitaryProduction', 'Pillage', 'Found', 'FoundAbroad', 'CultureBombRadius', 'GoldenAgeTurns', 'IgnoreBuildingDefense', 'PrereqResources', 'Mechanized', 'Suicide', 'CaptureWhileEmbarked', 'PrereqTech', 'ObsoleteTech', 'GoodyHutUpgradeUnitClass', 'HurryCostModifier', 'AdvancedStartCost', 'MinAreaSize', 'AirUnitCap', 'NukeDamageLevel', 'WorkRate', 'NumFreeTechs', 'RushBuilding', 'BaseHurry', 'HurryMultiplier', 'BaseGold', 'NumGoldPerEra', 'SpreadReligion', 'IsReligious', 'CombatLimit', 'RangeAttackOnlyInDomain', 'RangeAttackIgnoreLOS', 'RangedCombatLimit', 'XPValueAttack', 'XPValueDefense', 'SpecialCargo', 'DomainCargo', 'Conscription', 'ExtraMaintenanceCost', 'NoMaintenance', 'Unhappiness', 'UnitArtInfo', 'UnitArtInfoCulturalVariation', 'UnitArtInfoEraVariation', 'ProjectPrereq', 'SpaceshipProject', 'LeaderPromotion', 'LeaderExperience', 'DontShowYields', 'ShowInPedia', 'MoveRate', 'UnitFlagIconOffset', 'PortraitIndex', 'IconAtlas', 'UnitFlagAtlas')
	SELECT	("UNIT_BOMBER_FAIREY"), ("TXT_KEY_UNIT_BOMBER_FAIREY"), "Civilopedia", "Strategy", "Help", "Requirements", "Combat", "RangedCombat", "Cost", "Moves", "Immobile", "Range", "BaseSightRange", "Class", "Special", "Capture", "CombatClass", "Domain", "CivilianAttackPriority", "DefaultUnitAI", "Food", "NoBadGoodies", "RivalTerritory", "MilitarySupport", "MilitaryProduction", "Pillage", "Found", "FoundAbroad", "CultureBombRadius", "GoldenAgeTurns", "IgnoreBuildingDefense", "PrereqResources", "Mechanized", "Suicide", "CaptureWhileEmbarked", "PrereqTech", "ObsoleteTech", "GoodyHutUpgradeUnitClass", "HurryCostModifier", "AdvancedStartCost", "MinAreaSize", "AirUnitCap", "NukeDamageLevel", "WorkRate", "NumFreeTechs", "RushBuilding", "BaseHurry", "HurryMultiplier", "BaseGold", "NumGoldPerEra", "SpreadReligion", "IsReligious", "CombatLimit", "RangeAttackOnlyInDomain", "RangeAttackIgnoreLOS", "RangedCombatLimit", "XPValueAttack", "XPValueDefense", "SpecialCargo", "DomainCargo", "Conscription", "ExtraMaintenanceCost", "NoMaintenance", "Unhappiness",
			("ART_DEF_UNIT_BOMBER_FAIREY"), "UnitArtInfoCulturalVariation", "UnitArtInfoEraVariation", ("PROJECT_ATTACK_AIRCRAFT"), "SpaceshipProject", "LeaderPromotion", "LeaderExperience", "DontShowYields", "ShowInPedia", "MoveRate", "UnitFlagIconOffset", "PortraitIndex", "IconAtlas", "UnitFlagAtlas"
	FROM "Units" WHERE (Type = "UNIT_ATTACK_AIRCRAFT");
INSERT INTO "Language_en_US" ( 'Tag', 'Text' )
	VALUES ( 'TXT_KEY_UNIT_BOMBER_FAIREY', 'Fairey Battle' );
INSERT INTO "Unit_AITypes" ('UnitType', 'UnitAIType')
	SELECT ("UNIT_BOMBER_FAIREY"), "UnitAIType"
	FROM "Unit_AITypes" WHERE (UnitType = "UNIT_ATTACK_AIRCRAFT");
INSERT INTO "Unit_ClassUpgrades" ('UnitType', 'UnitClassType')
	SELECT ("UNIT_BOMBER_FAIREY"), "UnitClassType"
	FROM "Unit_ClassUpgrades" WHERE (UnitType = "UNIT_ATTACK_AIRCRAFT");
INSERT INTO "Civilization_UnitClassOverrides" ( 'CivilizationType', 'UnitClassType', 'UnitType' )
	VALUES ( 'CIVILIZATION_GREECE', 'UNITCLASS_ATTACK_AIRCRAFT', 'UNIT_BOMBER_FAIREY' );
INSERT INTO "Unit_Flavors" ('UnitType', 'FlavorType', 'Flavor')
	SELECT ("UNIT_BOMBER_FAIREY"), "FlavorType", "Flavor"
	FROM "Unit_Flavors" WHERE (UnitType = "UNIT_ATTACK_AIRCRAFT");
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	SELECT ("UNIT_BOMBER_FAIREY"), "PromotionType"
	FROM "Unit_FreePromotions" WHERE (UnitType = "UNIT_ATTACK_AIRCRAFT");
INSERT INTO "Unit_ResourceQuantityRequirements" ('UnitType', 'ResourceType', 'Cost')
	SELECT ("UNIT_BOMBER_FAIREY"), "ResourceType", "Cost"
	FROM "Unit_ResourceQuantityRequirements" WHERE (UnitType = "UNIT_ATTACK_AIRCRAFT");
-----------

-- Bomber IL2
INSERT INTO "Units" ('Type', 'Description', 'Civilopedia', 'Strategy', 'Help', 'Requirements', 'Combat', 'RangedCombat', 'Cost', 'Moves', 'Immobile', 'Range', 'BaseSightRange', 'Class', 'Special', 'Capture', 'CombatClass', 'Domain', 'CivilianAttackPriority', 'DefaultUnitAI', 'Food', 'NoBadGoodies', 'RivalTerritory', 'MilitarySupport', 'MilitaryProduction', 'Pillage', 'Found', 'FoundAbroad', 'CultureBombRadius', 'GoldenAgeTurns', 'IgnoreBuildingDefense', 'PrereqResources', 'Mechanized', 'Suicide', 'CaptureWhileEmbarked', 'PrereqTech', 'ObsoleteTech', 'GoodyHutUpgradeUnitClass', 'HurryCostModifier', 'AdvancedStartCost', 'MinAreaSize', 'AirUnitCap', 'NukeDamageLevel', 'WorkRate', 'NumFreeTechs', 'RushBuilding', 'BaseHurry', 'HurryMultiplier', 'BaseGold', 'NumGoldPerEra', 'SpreadReligion', 'IsReligious', 'CombatLimit', 'RangeAttackOnlyInDomain', 'RangeAttackIgnoreLOS', 'RangedCombatLimit', 'XPValueAttack', 'XPValueDefense', 'SpecialCargo', 'DomainCargo', 'Conscription', 'ExtraMaintenanceCost', 'NoMaintenance', 'Unhappiness', 'UnitArtInfo', 'UnitArtInfoCulturalVariation', 'UnitArtInfoEraVariation', 'ProjectPrereq', 'SpaceshipProject', 'LeaderPromotion', 'LeaderExperience', 'DontShowYields', 'ShowInPedia', 'MoveRate', 'UnitFlagIconOffset', 'PortraitIndex', 'IconAtlas', 'UnitFlagAtlas')
	SELECT	("UNIT_BOMBER_IL2"), ("TXT_KEY_UNIT_BOMBER_IL2"), "Civilopedia", "Strategy", "Help", "Requirements", "Combat", "RangedCombat" + 10, "Cost", "Moves", "Immobile", "Range", "BaseSightRange", "Class", "Special", "Capture", "CombatClass", "Domain", "CivilianAttackPriority", "DefaultUnitAI", "Food", "NoBadGoodies", "RivalTerritory", "MilitarySupport", "MilitaryProduction", "Pillage", "Found", "FoundAbroad", "CultureBombRadius", "GoldenAgeTurns", "IgnoreBuildingDefense", "PrereqResources", "Mechanized", "Suicide", "CaptureWhileEmbarked", "PrereqTech", "ObsoleteTech", "GoodyHutUpgradeUnitClass", "HurryCostModifier", "AdvancedStartCost", "MinAreaSize", "AirUnitCap", "NukeDamageLevel", "WorkRate", "NumFreeTechs", "RushBuilding", "BaseHurry", "HurryMultiplier", "BaseGold", "NumGoldPerEra", "SpreadReligion", "IsReligious", "CombatLimit", "RangeAttackOnlyInDomain", "RangeAttackIgnoreLOS", "RangedCombatLimit", "XPValueAttack", "XPValueDefense", "SpecialCargo", "DomainCargo", "Conscription", "ExtraMaintenanceCost", "NoMaintenance", "Unhappiness",
			("ART_DEF_UNIT_BOMBER_IL2"), "UnitArtInfoCulturalVariation", "UnitArtInfoEraVariation", ("PROJECT_IL2"), "SpaceshipProject", "LeaderPromotion", "LeaderExperience", "DontShowYields", "ShowInPedia", "MoveRate", "UnitFlagIconOffset", "PortraitIndex", "IconAtlas", "UnitFlagAtlas"
	FROM "Units" WHERE (Type = "UNIT_ATTACK_AIRCRAFT");
INSERT INTO "Language_en_US" ( 'Tag', 'Text' )
	VALUES ( 'TXT_KEY_UNIT_BOMBER_IL2', 'IL-2 Shturmovik' );
INSERT INTO "Unit_AITypes" ('UnitType', 'UnitAIType')
	SELECT ("UNIT_BOMBER_IL2"), "UnitAIType"
	FROM "Unit_AITypes" WHERE (UnitType = "UNIT_ATTACK_AIRCRAFT");
INSERT INTO "Unit_ClassUpgrades" ('UnitType', 'UnitClassType')
	SELECT ("UNIT_BOMBER_IL2"), "UnitClassType"
	FROM "Unit_ClassUpgrades" WHERE (UnitType = "UNIT_ATTACK_AIRCRAFT");
INSERT INTO "Civilization_UnitClassOverrides" ( 'CivilizationType', 'UnitClassType', 'UnitType' )
	VALUES ( 'CIVILIZATION_RUSSIA', 'UNITCLASS_ATTACK_AIRCRAFT', 'UNIT_BOMBER_IL2' );
INSERT INTO "Unit_Flavors" ('UnitType', 'FlavorType', 'Flavor')
	SELECT ("UNIT_BOMBER_IL2"), "FlavorType", "Flavor"
	FROM "Unit_Flavors" WHERE (UnitType = "UNIT_ATTACK_AIRCRAFT");
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	SELECT ("UNIT_BOMBER_IL2"), "PromotionType"
	FROM "Unit_FreePromotions" WHERE (UnitType = "UNIT_ATTACK_AIRCRAFT");
INSERT INTO "Unit_ResourceQuantityRequirements" ('UnitType', 'ResourceType', 'Cost')
	SELECT ("UNIT_BOMBER_IL2"), "ResourceType", "Cost"
	FROM "Unit_ResourceQuantityRequirements" WHERE (UnitType = "UNIT_ATTACK_AIRCRAFT");
-----------

-- Bomber LN 401
INSERT INTO "Units" ('Type', 'Description', 'Civilopedia', 'Strategy', 'Help', 'Requirements', 'Combat', 'RangedCombat', 'Cost', 'Moves', 'Immobile', 'Range', 'BaseSightRange', 'Class', 'Special', 'Capture', 'CombatClass', 'Domain', 'CivilianAttackPriority', 'DefaultUnitAI', 'Food', 'NoBadGoodies', 'RivalTerritory', 'MilitarySupport', 'MilitaryProduction', 'Pillage', 'Found', 'FoundAbroad', 'CultureBombRadius', 'GoldenAgeTurns', 'IgnoreBuildingDefense', 'PrereqResources', 'Mechanized', 'Suicide', 'CaptureWhileEmbarked', 'PrereqTech', 'ObsoleteTech', 'GoodyHutUpgradeUnitClass', 'HurryCostModifier', 'AdvancedStartCost', 'MinAreaSize', 'AirUnitCap', 'NukeDamageLevel', 'WorkRate', 'NumFreeTechs', 'RushBuilding', 'BaseHurry', 'HurryMultiplier', 'BaseGold', 'NumGoldPerEra', 'SpreadReligion', 'IsReligious', 'CombatLimit', 'RangeAttackOnlyInDomain', 'RangeAttackIgnoreLOS', 'RangedCombatLimit', 'XPValueAttack', 'XPValueDefense', 'SpecialCargo', 'DomainCargo', 'Conscription', 'ExtraMaintenanceCost', 'NoMaintenance', 'Unhappiness', 'UnitArtInfo', 'UnitArtInfoCulturalVariation', 'UnitArtInfoEraVariation', 'ProjectPrereq', 'SpaceshipProject', 'LeaderPromotion', 'LeaderExperience', 'DontShowYields', 'ShowInPedia', 'MoveRate', 'UnitFlagIconOffset', 'PortraitIndex', 'IconAtlas', 'UnitFlagAtlas')
	SELECT	("UNIT_BOMBER_LN401"), ("TXT_KEY_UNIT_BOMBER_LN401"), "Civilopedia", "Strategy", "Help", "Requirements", "Combat", "RangedCombat", "Cost", "Moves", "Immobile", "Range", "BaseSightRange", "Class", "Special", "Capture", "CombatClass", "Domain", "CivilianAttackPriority", "DefaultUnitAI", "Food", "NoBadGoodies", "RivalTerritory", "MilitarySupport", "MilitaryProduction", "Pillage", "Found", "FoundAbroad", "CultureBombRadius", "GoldenAgeTurns", "IgnoreBuildingDefense", "PrereqResources", "Mechanized", "Suicide", "CaptureWhileEmbarked", "PrereqTech", "ObsoleteTech", "GoodyHutUpgradeUnitClass", "HurryCostModifier", "AdvancedStartCost", "MinAreaSize", "AirUnitCap", "NukeDamageLevel", "WorkRate", "NumFreeTechs", "RushBuilding", "BaseHurry", "HurryMultiplier", "BaseGold", "NumGoldPerEra", "SpreadReligion", "IsReligious", "CombatLimit", "RangeAttackOnlyInDomain", "RangeAttackIgnoreLOS", "RangedCombatLimit", "XPValueAttack", "XPValueDefense", "SpecialCargo", "DomainCargo", "Conscription", "ExtraMaintenanceCost", "NoMaintenance", "Unhappiness",
			("ART_DEF_UNIT_BOMBER_LN401"), "UnitArtInfoCulturalVariation", "UnitArtInfoEraVariation", ("PROJECT_ATTACK_AIRCRAFT"), "SpaceshipProject", "LeaderPromotion", "LeaderExperience", "DontShowYields", "ShowInPedia", "MoveRate", "UnitFlagIconOffset", "PortraitIndex", "IconAtlas", "UnitFlagAtlas"
	FROM "Units" WHERE (Type = "UNIT_ATTACK_AIRCRAFT");
INSERT INTO "Language_en_US" ( 'Tag', 'Text' )
	VALUES ( 'TXT_KEY_UNIT_BOMBER_LN401', 'Loire-Nieuport LN.401' );
INSERT INTO "Unit_AITypes" ('UnitType', 'UnitAIType')
	SELECT ("UNIT_BOMBER_LN401"), "UnitAIType"
	FROM "Unit_AITypes" WHERE (UnitType = "UNIT_ATTACK_AIRCRAFT");
INSERT INTO "Unit_ClassUpgrades" ('UnitType', 'UnitClassType')
	SELECT ("UNIT_BOMBER_LN401"), "UnitClassType"
	FROM "Unit_ClassUpgrades" WHERE (UnitType = "UNIT_ATTACK_AIRCRAFT");
INSERT INTO "Civilization_UnitClassOverrides" ( 'CivilizationType', 'UnitClassType', 'UnitType' )
	VALUES ( 'CIVILIZATION_FRANCE', 'UNITCLASS_ATTACK_AIRCRAFT', 'UNIT_BOMBER_LN401' );
INSERT INTO "Unit_Flavors" ('UnitType', 'FlavorType', 'Flavor')
	SELECT ("UNIT_BOMBER_LN401"), "FlavorType", "Flavor"
	FROM "Unit_Flavors" WHERE (UnitType = "UNIT_ATTACK_AIRCRAFT");
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	SELECT ("UNIT_BOMBER_LN401"), "PromotionType"
	FROM "Unit_FreePromotions" WHERE (UnitType = "UNIT_ATTACK_AIRCRAFT");
INSERT INTO "Unit_ResourceQuantityRequirements" ('UnitType', 'ResourceType', 'Cost')
	SELECT ("UNIT_BOMBER_LN401"), "ResourceType", "Cost"
	FROM "Unit_ResourceQuantityRequirements" WHERE (UnitType = "UNIT_ATTACK_AIRCRAFT");
-----------

-- Bomber BA 65
INSERT INTO "Units" ('Type', 'Description', 'Civilopedia', 'Strategy', 'Help', 'Requirements', 'Combat', 'RangedCombat', 'Cost', 'Moves', 'Immobile', 'Range', 'BaseSightRange', 'Class', 'Special', 'Capture', 'CombatClass', 'Domain', 'CivilianAttackPriority', 'DefaultUnitAI', 'Food', 'NoBadGoodies', 'RivalTerritory', 'MilitarySupport', 'MilitaryProduction', 'Pillage', 'Found', 'FoundAbroad', 'CultureBombRadius', 'GoldenAgeTurns', 'IgnoreBuildingDefense', 'PrereqResources', 'Mechanized', 'Suicide', 'CaptureWhileEmbarked', 'PrereqTech', 'ObsoleteTech', 'GoodyHutUpgradeUnitClass', 'HurryCostModifier', 'AdvancedStartCost', 'MinAreaSize', 'AirUnitCap', 'NukeDamageLevel', 'WorkRate', 'NumFreeTechs', 'RushBuilding', 'BaseHurry', 'HurryMultiplier', 'BaseGold', 'NumGoldPerEra', 'SpreadReligion', 'IsReligious', 'CombatLimit', 'RangeAttackOnlyInDomain', 'RangeAttackIgnoreLOS', 'RangedCombatLimit', 'XPValueAttack', 'XPValueDefense', 'SpecialCargo', 'DomainCargo', 'Conscription', 'ExtraMaintenanceCost', 'NoMaintenance', 'Unhappiness', 'UnitArtInfo', 'UnitArtInfoCulturalVariation', 'UnitArtInfoEraVariation', 'ProjectPrereq', 'SpaceshipProject', 'LeaderPromotion', 'LeaderExperience', 'DontShowYields', 'ShowInPedia', 'MoveRate', 'UnitFlagIconOffset', 'PortraitIndex', 'IconAtlas', 'UnitFlagAtlas')
	SELECT	("UNIT_BOMBER_BA65"), ("TXT_KEY_UNIT_BOMBER_BA65"), "Civilopedia", "Strategy", "Help", "Requirements", "Combat", "RangedCombat", "Cost", "Moves", "Immobile", "Range", "BaseSightRange", "Class", "Special", "Capture", "CombatClass", "Domain", "CivilianAttackPriority", "DefaultUnitAI", "Food", "NoBadGoodies", "RivalTerritory", "MilitarySupport", "MilitaryProduction", "Pillage", "Found", "FoundAbroad", "CultureBombRadius", "GoldenAgeTurns", "IgnoreBuildingDefense", "PrereqResources", "Mechanized", "Suicide", "CaptureWhileEmbarked", "PrereqTech", "ObsoleteTech", "GoodyHutUpgradeUnitClass", "HurryCostModifier", "AdvancedStartCost", "MinAreaSize", "AirUnitCap", "NukeDamageLevel", "WorkRate", "NumFreeTechs", "RushBuilding", "BaseHurry", "HurryMultiplier", "BaseGold", "NumGoldPerEra", "SpreadReligion", "IsReligious", "CombatLimit", "RangeAttackOnlyInDomain", "RangeAttackIgnoreLOS", "RangedCombatLimit", "XPValueAttack", "XPValueDefense", "SpecialCargo", "DomainCargo", "Conscription", "ExtraMaintenanceCost", "NoMaintenance", "Unhappiness",
			("ART_DEF_UNIT_BOMBER_BA65"), "UnitArtInfoCulturalVariation", "UnitArtInfoEraVariation", ("PROJECT_ATTACK_AIRCRAFT"), "SpaceshipProject", "LeaderPromotion", "LeaderExperience", "DontShowYields", "ShowInPedia", "MoveRate", "UnitFlagIconOffset", "PortraitIndex", "IconAtlas", "UnitFlagAtlas"
	FROM "Units" WHERE (Type = "UNIT_ATTACK_AIRCRAFT");
INSERT INTO "Language_en_US" ( 'Tag', 'Text' )
	VALUES ( 'TXT_KEY_UNIT_BOMBER_BA65', 'Breda Ba.65' );
INSERT INTO "Unit_AITypes" ('UnitType', 'UnitAIType')
	SELECT ("UNIT_BOMBER_BA65"), "UnitAIType"
	FROM "Unit_AITypes" WHERE (UnitType = "UNIT_ATTACK_AIRCRAFT");
INSERT INTO "Unit_ClassUpgrades" ('UnitType', 'UnitClassType')
	SELECT ("UNIT_BOMBER_BA65"), "UnitClassType"
	FROM "Unit_ClassUpgrades" WHERE (UnitType = "UNIT_ATTACK_AIRCRAFT");
INSERT INTO "Civilization_UnitClassOverrides" ( 'CivilizationType', 'UnitClassType', 'UnitType' )
	VALUES ( 'CIVILIZATION_ROME', 'UNITCLASS_ATTACK_AIRCRAFT', 'UNIT_BOMBER_BA65' );
INSERT INTO "Unit_Flavors" ('UnitType', 'FlavorType', 'Flavor')
	SELECT ("UNIT_BOMBER_BA65"), "FlavorType", "Flavor"
	FROM "Unit_Flavors" WHERE (UnitType = "UNIT_ATTACK_AIRCRAFT");
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	SELECT ("UNIT_BOMBER_BA65"), "PromotionType"
	FROM "Unit_FreePromotions" WHERE (UnitType = "UNIT_ATTACK_AIRCRAFT");
INSERT INTO "Unit_ResourceQuantityRequirements" ('UnitType', 'ResourceType', 'Cost')
	SELECT ("UNIT_BOMBER_BA65"), "ResourceType", "Cost"
	FROM "Unit_ResourceQuantityRequirements" WHERE (UnitType = "UNIT_ATTACK_AIRCRAFT");
-----------

-- Bomber Ju-87
INSERT INTO "Units" ('Type', 'Description', 'Civilopedia', 'Strategy', 'Help', 'Requirements', 'Combat', 'RangedCombat', 'Cost', 'Moves', 'Immobile', 'Range', 'BaseSightRange', 'Class', 'Special', 'Capture', 'CombatClass', 'Domain', 'CivilianAttackPriority', 'DefaultUnitAI', 'Food', 'NoBadGoodies', 'RivalTerritory', 'MilitarySupport', 'MilitaryProduction', 'Pillage', 'Found', 'FoundAbroad', 'CultureBombRadius', 'GoldenAgeTurns', 'IgnoreBuildingDefense', 'PrereqResources', 'Mechanized', 'Suicide', 'CaptureWhileEmbarked', 'PrereqTech', 'ObsoleteTech', 'GoodyHutUpgradeUnitClass', 'HurryCostModifier', 'AdvancedStartCost', 'MinAreaSize', 'AirUnitCap', 'NukeDamageLevel', 'WorkRate', 'NumFreeTechs', 'RushBuilding', 'BaseHurry', 'HurryMultiplier', 'BaseGold', 'NumGoldPerEra', 'SpreadReligion', 'IsReligious', 'CombatLimit', 'RangeAttackOnlyInDomain', 'RangeAttackIgnoreLOS', 'RangedCombatLimit', 'XPValueAttack', 'XPValueDefense', 'SpecialCargo', 'DomainCargo', 'Conscription', 'ExtraMaintenanceCost', 'NoMaintenance', 'Unhappiness', 'UnitArtInfo', 'UnitArtInfoCulturalVariation', 'UnitArtInfoEraVariation', 'ProjectPrereq', 'SpaceshipProject', 'LeaderPromotion', 'LeaderExperience', 'DontShowYields', 'ShowInPedia', 'MoveRate', 'UnitFlagIconOffset', 'PortraitIndex', 'IconAtlas', 'UnitFlagAtlas')
	SELECT	("UNIT_BOMBER_JU87"), ("TXT_KEY_UNIT_BOMBER_JU87"), "Civilopedia", "Strategy", "Help", "Requirements", "Combat", "RangedCombat", "Cost", "Moves", "Immobile", "Range", "BaseSightRange", "Class", "Special", "Capture", "CombatClass", "Domain", "CivilianAttackPriority", "DefaultUnitAI", "Food", "NoBadGoodies", "RivalTerritory", "MilitarySupport", "MilitaryProduction", "Pillage", "Found", "FoundAbroad", "CultureBombRadius", "GoldenAgeTurns", "IgnoreBuildingDefense", "PrereqResources", "Mechanized", "Suicide", "CaptureWhileEmbarked", "PrereqTech", "ObsoleteTech", "GoodyHutUpgradeUnitClass", "HurryCostModifier", "AdvancedStartCost", "MinAreaSize", "AirUnitCap", "NukeDamageLevel", "WorkRate", "NumFreeTechs", "RushBuilding", "BaseHurry", "HurryMultiplier", "BaseGold", "NumGoldPerEra", "SpreadReligion", "IsReligious", "CombatLimit", "RangeAttackOnlyInDomain", "RangeAttackIgnoreLOS", "RangedCombatLimit", "XPValueAttack", "XPValueDefense", "SpecialCargo", "DomainCargo", "Conscription", "ExtraMaintenanceCost", "NoMaintenance", "Unhappiness",
			("ART_DEF_UNIT_BOMBER_JU87"), "UnitArtInfoCulturalVariation", "UnitArtInfoEraVariation", "ProjectPrereq", "SpaceshipProject", "LeaderPromotion", "LeaderExperience", "DontShowYields", "ShowInPedia", "MoveRate", "UnitFlagIconOffset", "PortraitIndex", "IconAtlas", "UnitFlagAtlas"
	FROM "Units" WHERE (Type = "UNIT_ATTACK_AIRCRAFT");
INSERT INTO "Language_en_US" ( 'Tag', 'Text' )
	VALUES ( 'TXT_KEY_UNIT_BOMBER_JU87', 'Junkers Ju 87 Stuka' );
INSERT INTO "Unit_AITypes" ('UnitType', 'UnitAIType')
	SELECT ("UNIT_BOMBER_JU87"), "UnitAIType"
	FROM "Unit_AITypes" WHERE (UnitType = "UNIT_ATTACK_AIRCRAFT");
INSERT INTO "Unit_ClassUpgrades" ('UnitType', 'UnitClassType')
	SELECT ("UNIT_BOMBER_JU87"), "UnitClassType"
	FROM "Unit_ClassUpgrades" WHERE (UnitType = "UNIT_ATTACK_AIRCRAFT");
INSERT INTO "Civilization_UnitClassOverrides" ( 'CivilizationType', 'UnitClassType', 'UnitType' )
	VALUES ( 'CIVILIZATION_GERMANY', 'UNITCLASS_ATTACK_AIRCRAFT', 'UNIT_BOMBER_JU87' );
INSERT INTO "Unit_Flavors" ('UnitType', 'FlavorType', 'Flavor')
	SELECT ("UNIT_BOMBER_JU87"), "FlavorType", "Flavor"
	FROM "Unit_Flavors" WHERE (UnitType = "UNIT_ATTACK_AIRCRAFT");
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	SELECT ("UNIT_BOMBER_JU87"), "PromotionType"
	FROM "Unit_FreePromotions" WHERE (UnitType = "UNIT_ATTACK_AIRCRAFT");
INSERT INTO "Unit_ResourceQuantityRequirements" ('UnitType', 'ResourceType', 'Cost')
	SELECT ("UNIT_BOMBER_JU87"), "ResourceType", "Cost"
	FROM "Unit_ResourceQuantityRequirements" WHERE (UnitType = "UNIT_ATTACK_AIRCRAFT");
-----------

-- Bomber Aichi
INSERT INTO "Units" ('Type', 'Description', 'Civilopedia', 'Strategy', 'Help', 'Requirements', 'Combat', 'RangedCombat', 'Cost', 'Moves', 'Immobile', 'Range', 'BaseSightRange', 'Class', 'Special', 'Capture', 'CombatClass', 'Domain', 'CivilianAttackPriority', 'DefaultUnitAI', 'Food', 'NoBadGoodies', 'RivalTerritory', 'MilitarySupport', 'MilitaryProduction', 'Pillage', 'Found', 'FoundAbroad', 'CultureBombRadius', 'GoldenAgeTurns', 'IgnoreBuildingDefense', 'PrereqResources', 'Mechanized', 'Suicide', 'CaptureWhileEmbarked', 'PrereqTech', 'ObsoleteTech', 'GoodyHutUpgradeUnitClass', 'HurryCostModifier', 'AdvancedStartCost', 'MinAreaSize', 'AirUnitCap', 'NukeDamageLevel', 'WorkRate', 'NumFreeTechs', 'RushBuilding', 'BaseHurry', 'HurryMultiplier', 'BaseGold', 'NumGoldPerEra', 'SpreadReligion', 'IsReligious', 'CombatLimit', 'RangeAttackOnlyInDomain', 'RangeAttackIgnoreLOS', 'RangedCombatLimit', 'XPValueAttack', 'XPValueDefense', 'SpecialCargo', 'DomainCargo', 'Conscription', 'ExtraMaintenanceCost', 'NoMaintenance', 'Unhappiness', 'UnitArtInfo', 'UnitArtInfoCulturalVariation', 'UnitArtInfoEraVariation', 'ProjectPrereq', 'SpaceshipProject', 'LeaderPromotion', 'LeaderExperience', 'DontShowYields', 'ShowInPedia', 'MoveRate', 'UnitFlagIconOffset', 'PortraitIndex', 'IconAtlas', 'UnitFlagAtlas')
	SELECT	("UNIT_BOMBER_AICHI"), ("TXT_KEY_UNIT_BOMBER_AICHI"), "Civilopedia", "Strategy", "Help", "Requirements", "Combat", "RangedCombat", "Cost", "Moves", "Immobile", "Range", "BaseSightRange", "Class", "Special", "Capture", "CombatClass", "Domain", "CivilianAttackPriority", "DefaultUnitAI", "Food", "NoBadGoodies", "RivalTerritory", "MilitarySupport", "MilitaryProduction", "Pillage", "Found", "FoundAbroad", "CultureBombRadius", "GoldenAgeTurns", "IgnoreBuildingDefense", "PrereqResources", "Mechanized", "Suicide", "CaptureWhileEmbarked", "PrereqTech", "ObsoleteTech", "GoodyHutUpgradeUnitClass", "HurryCostModifier", "AdvancedStartCost", "MinAreaSize", "AirUnitCap", "NukeDamageLevel", "WorkRate", "NumFreeTechs", "RushBuilding", "BaseHurry", "HurryMultiplier", "BaseGold", "NumGoldPerEra", "SpreadReligion", "IsReligious", "CombatLimit", "RangeAttackOnlyInDomain", "RangeAttackIgnoreLOS", "RangedCombatLimit", "XPValueAttack", "XPValueDefense", "SpecialCargo", "DomainCargo", "Conscription", "ExtraMaintenanceCost", "NoMaintenance", "Unhappiness",
			("ART_DEF_UNIT_BOMBER_AICHI"), "UnitArtInfoCulturalVariation", "UnitArtInfoEraVariation", "ProjectPrereq", "SpaceshipProject", "LeaderPromotion", "LeaderExperience", "DontShowYields", "ShowInPedia", "MoveRate", "UnitFlagIconOffset", "PortraitIndex", "IconAtlas", "UnitFlagAtlas"
	FROM "Units" WHERE (Type = "UNIT_ATTACK_AIRCRAFT");
INSERT INTO "Language_en_US" ( 'Tag', 'Text' )
	VALUES ( 'TXT_KEY_UNIT_BOMBER_AICHI', 'Aichi D3A "Val"' );
INSERT INTO "Unit_AITypes" ('UnitType', 'UnitAIType')
	SELECT ("UNIT_BOMBER_AICHI"), "UnitAIType"
	FROM "Unit_AITypes" WHERE (UnitType = "UNIT_ATTACK_AIRCRAFT");
INSERT INTO "Unit_ClassUpgrades" ('UnitType', 'UnitClassType')
	SELECT ("UNIT_BOMBER_AICHI"), "UnitClassType"
	FROM "Unit_ClassUpgrades" WHERE (UnitType = "UNIT_ATTACK_AIRCRAFT");
INSERT INTO "Civilization_UnitClassOverrides" ( 'CivilizationType', 'UnitClassType', 'UnitType' )
	VALUES ( 'CIVILIZATION_JAPAN', 'UNITCLASS_ATTACK_AIRCRAFT', 'UNIT_BOMBER_AICHI' );
INSERT INTO "Unit_Flavors" ('UnitType', 'FlavorType', 'Flavor')
	SELECT ("UNIT_BOMBER_AICHI"), "FlavorType", "Flavor"
	FROM "Unit_Flavors" WHERE (UnitType = "UNIT_ATTACK_AIRCRAFT");
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	SELECT ("UNIT_BOMBER_AICHI"), "PromotionType"
	FROM "Unit_FreePromotions" WHERE (UnitType = "UNIT_ATTACK_AIRCRAFT");
INSERT INTO "Unit_ResourceQuantityRequirements" ('UnitType', 'ResourceType', 'Cost')
	SELECT ("UNIT_BOMBER_AICHI"), "ResourceType", "Cost"
	FROM "Unit_ResourceQuantityRequirements" WHERE (UnitType = "UNIT_ATTACK_AIRCRAFT");
-----------

--------------------------------------------------------------
-- FAST BOMBERS
--------------------------------------------------------------

-- Bomber PZL.37 Los
INSERT INTO "Units" ('Type', 'Description', 'Civilopedia', 'Strategy', 'Help', 'Requirements', 'Combat', 'RangedCombat', 'Cost', 'Moves', 'Immobile', 'Range', 'BaseSightRange', 'Class', 'Special', 'Capture', 'CombatClass', 'Domain', 'CivilianAttackPriority', 'DefaultUnitAI', 'Food', 'NoBadGoodies', 'RivalTerritory', 'MilitarySupport', 'MilitaryProduction', 'Pillage', 'Found', 'FoundAbroad', 'CultureBombRadius', 'GoldenAgeTurns', 'IgnoreBuildingDefense', 'PrereqResources', 'Mechanized', 'Suicide', 'CaptureWhileEmbarked', 'PrereqTech', 'ObsoleteTech', 'GoodyHutUpgradeUnitClass', 'HurryCostModifier', 'AdvancedStartCost', 'MinAreaSize', 'AirUnitCap', 'NukeDamageLevel', 'WorkRate', 'NumFreeTechs', 'RushBuilding', 'BaseHurry', 'HurryMultiplier', 'BaseGold', 'NumGoldPerEra', 'SpreadReligion', 'IsReligious', 'CombatLimit', 'RangeAttackOnlyInDomain', 'RangeAttackIgnoreLOS', 'RangedCombatLimit', 'XPValueAttack', 'XPValueDefense', 'SpecialCargo', 'DomainCargo', 'Conscription', 'ExtraMaintenanceCost', 'NoMaintenance', 'Unhappiness', 'UnitArtInfo', 'UnitArtInfoCulturalVariation', 'UnitArtInfoEraVariation', 'ProjectPrereq', 'SpaceshipProject', 'LeaderPromotion', 'LeaderExperience', 'DontShowYields', 'ShowInPedia', 'MoveRate', 'UnitFlagIconOffset', 'PortraitIndex', 'IconAtlas', 'UnitFlagAtlas')
	SELECT	("UNIT_BOMBER_PZL37"), ("TXT_KEY_UNIT_BOMBER_PZL37"), "Civilopedia", "Strategy", "Help", "Requirements", "Combat", "RangedCombat", "Cost", "Moves", "Immobile", "Range", "BaseSightRange", "Class", "Special", "Capture", "CombatClass", "Domain", "CivilianAttackPriority", "DefaultUnitAI", "Food", "NoBadGoodies", "RivalTerritory", "MilitarySupport", "MilitaryProduction", "Pillage", "Found", "FoundAbroad", "CultureBombRadius", "GoldenAgeTurns", "IgnoreBuildingDefense", "PrereqResources", "Mechanized", "Suicide", "CaptureWhileEmbarked", "PrereqTech", "ObsoleteTech", "GoodyHutUpgradeUnitClass", "HurryCostModifier", "AdvancedStartCost", "MinAreaSize", "AirUnitCap", "NukeDamageLevel", "WorkRate", "NumFreeTechs", "RushBuilding", "BaseHurry", "HurryMultiplier", "BaseGold", "NumGoldPerEra", "SpreadReligion", "IsReligious", "CombatLimit", "RangeAttackOnlyInDomain", "RangeAttackIgnoreLOS", "RangedCombatLimit", "XPValueAttack", "XPValueDefense", "SpecialCargo", "DomainCargo", "Conscription", "ExtraMaintenanceCost", "NoMaintenance", "Unhappiness",
			("ART_DEF_UNIT_BOMBER_PZL37"), "UnitArtInfoCulturalVariation", "UnitArtInfoEraVariation", "ProjectPrereq", "SpaceshipProject", "LeaderPromotion", "LeaderExperience", "DontShowYields", "ShowInPedia", "MoveRate", "UnitFlagIconOffset", "PortraitIndex", "IconAtlas", "UnitFlagAtlas"
	FROM "Units" WHERE (Type = "UNIT_FAST_BOMBER");
INSERT INTO "Language_en_US" ( 'Tag', 'Text' )
	VALUES ( 'TXT_KEY_UNIT_BOMBER_PZL37', 'PZL.37 Los' );
INSERT INTO "Unit_AITypes" ('UnitType', 'UnitAIType')
	SELECT ("UNIT_BOMBER_PZL37"), "UnitAIType"
	FROM "Unit_AITypes" WHERE (UnitType = "UNIT_FAST_BOMBER");
INSERT INTO "Unit_ClassUpgrades" ('UnitType', 'UnitClassType')
	SELECT ("UNIT_BOMBER_PZL37"), "UnitClassType"
	FROM "Unit_ClassUpgrades" WHERE (UnitType = "UNIT_FAST_BOMBER");
--INSERT INTO "Civilization_UnitClassOverrides" ( 'CivilizationType', 'UnitClassType', 'UnitType' )
--	VALUES ( 'CIVILIZATION_POLAND', 'UNITCLASS_FAST_BOMBER', 'UNIT_BOMBER_PZL37' );
INSERT INTO "Unit_Flavors" ('UnitType', 'FlavorType', 'Flavor')
	SELECT ("UNIT_BOMBER_PZL37"), "FlavorType", "Flavor"
	FROM "Unit_Flavors" WHERE (UnitType = "UNIT_FAST_BOMBER");
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	SELECT ("UNIT_BOMBER_PZL37"), "PromotionType"
	FROM "Unit_FreePromotions" WHERE (UnitType = "UNIT_FAST_BOMBER");
INSERT INTO "Unit_ResourceQuantityRequirements" ('UnitType', 'ResourceType', 'Cost')
	SELECT ("UNIT_BOMBER_PZL37"), "ResourceType", "Cost"
	FROM "Unit_ResourceQuantityRequirements" WHERE (UnitType = "UNIT_FAST_BOMBER");
-----------

-- Bomber Ju-88A
INSERT INTO "Units" ('Type', 'Description', 'Civilopedia', 'Strategy', 'Help', 'Requirements', 'Combat', 'RangedCombat', 'Cost', 'Moves', 'Immobile', 'Range', 'BaseSightRange', 'Class', 'Special', 'Capture', 'CombatClass', 'Domain', 'CivilianAttackPriority', 'DefaultUnitAI', 'Food', 'NoBadGoodies', 'RivalTerritory', 'MilitarySupport', 'MilitaryProduction', 'Pillage', 'Found', 'FoundAbroad', 'CultureBombRadius', 'GoldenAgeTurns', 'IgnoreBuildingDefense', 'PrereqResources', 'Mechanized', 'Suicide', 'CaptureWhileEmbarked', 'PrereqTech', 'ObsoleteTech', 'GoodyHutUpgradeUnitClass', 'HurryCostModifier', 'AdvancedStartCost', 'MinAreaSize', 'AirUnitCap', 'NukeDamageLevel', 'WorkRate', 'NumFreeTechs', 'RushBuilding', 'BaseHurry', 'HurryMultiplier', 'BaseGold', 'NumGoldPerEra', 'SpreadReligion', 'IsReligious', 'CombatLimit', 'RangeAttackOnlyInDomain', 'RangeAttackIgnoreLOS', 'RangedCombatLimit', 'XPValueAttack', 'XPValueDefense', 'SpecialCargo', 'DomainCargo', 'Conscription', 'ExtraMaintenanceCost', 'NoMaintenance', 'Unhappiness', 'UnitArtInfo', 'UnitArtInfoCulturalVariation', 'UnitArtInfoEraVariation', 'ProjectPrereq', 'SpaceshipProject', 'LeaderPromotion', 'LeaderExperience', 'DontShowYields', 'ShowInPedia', 'MoveRate', 'UnitFlagIconOffset', 'PortraitIndex', 'IconAtlas', 'UnitFlagAtlas')
	SELECT	("UNIT_BOMBER_JU88"), ("TXT_KEY_UNIT_BOMBER_JU88"), "Civilopedia", "Strategy", "Help", "Requirements", "Combat", "RangedCombat", "Cost", "Moves", "Immobile", "Range", "BaseSightRange", "Class", "Special", "Capture", "CombatClass", "Domain", "CivilianAttackPriority", "DefaultUnitAI", "Food", "NoBadGoodies", "RivalTerritory", "MilitarySupport", "MilitaryProduction", "Pillage", "Found", "FoundAbroad", "CultureBombRadius", "GoldenAgeTurns", "IgnoreBuildingDefense", "PrereqResources", "Mechanized", "Suicide", "CaptureWhileEmbarked", "PrereqTech", "ObsoleteTech", "GoodyHutUpgradeUnitClass", "HurryCostModifier", "AdvancedStartCost", "MinAreaSize", "AirUnitCap", "NukeDamageLevel", "WorkRate", "NumFreeTechs", "RushBuilding", "BaseHurry", "HurryMultiplier", "BaseGold", "NumGoldPerEra", "SpreadReligion", "IsReligious", "CombatLimit", "RangeAttackOnlyInDomain", "RangeAttackIgnoreLOS", "RangedCombatLimit", "XPValueAttack", "XPValueDefense", "SpecialCargo", "DomainCargo", "Conscription", "ExtraMaintenanceCost", "NoMaintenance", "Unhappiness",
			("ART_DEF_UNIT_BOMBER_JU88"), "UnitArtInfoCulturalVariation", "UnitArtInfoEraVariation", "ProjectPrereq", "SpaceshipProject", "LeaderPromotion", "LeaderExperience", "DontShowYields", "ShowInPedia", "MoveRate", "UnitFlagIconOffset", "PortraitIndex", "IconAtlas", "UnitFlagAtlas"
	FROM "Units" WHERE (Type = "UNIT_FAST_BOMBER");
INSERT INTO "Language_en_US" ( 'Tag', 'Text' )
	VALUES ( 'TXT_KEY_UNIT_BOMBER_JU88', 'Junkers Ju 88A' );
INSERT INTO "Unit_AITypes" ('UnitType', 'UnitAIType')
	SELECT ("UNIT_BOMBER_JU88"), "UnitAIType"
	FROM "Unit_AITypes" WHERE (UnitType = "UNIT_FAST_BOMBER");
INSERT INTO "Unit_ClassUpgrades" ('UnitType', 'UnitClassType')
	SELECT ("UNIT_BOMBER_JU88"), "UnitClassType"
	FROM "Unit_ClassUpgrades" WHERE (UnitType = "UNIT_FAST_BOMBER");
INSERT INTO "Civilization_UnitClassOverrides" ( 'CivilizationType', 'UnitClassType', 'UnitType' )
	VALUES ( 'CIVILIZATION_GERMANY', 'UNITCLASS_FAST_BOMBER', 'UNIT_BOMBER_JU88' );
INSERT INTO "Unit_Flavors" ('UnitType', 'FlavorType', 'Flavor')
	SELECT ("UNIT_BOMBER_JU88"), "FlavorType", "Flavor"
	FROM "Unit_Flavors" WHERE (UnitType = "UNIT_FAST_BOMBER");
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	SELECT ("UNIT_BOMBER_JU88"), "PromotionType"
	FROM "Unit_FreePromotions" WHERE (UnitType = "UNIT_FAST_BOMBER");
INSERT INTO "Unit_ResourceQuantityRequirements" ('UnitType', 'ResourceType', 'Cost')
	SELECT ("UNIT_BOMBER_JU88"), "ResourceType", "Cost"
	FROM "Unit_ResourceQuantityRequirements" WHERE (UnitType = "UNIT_FAST_BOMBER");
-----------

-- Bomber Amiot-350
INSERT INTO "Units" ('Type', 'Description', 'Civilopedia', 'Strategy', 'Help', 'Requirements', 'Combat', 'RangedCombat', 'Cost', 'Moves', 'Immobile', 'Range', 'BaseSightRange', 'Class', 'Special', 'Capture', 'CombatClass', 'Domain', 'CivilianAttackPriority', 'DefaultUnitAI', 'Food', 'NoBadGoodies', 'RivalTerritory', 'MilitarySupport', 'MilitaryProduction', 'Pillage', 'Found', 'FoundAbroad', 'CultureBombRadius', 'GoldenAgeTurns', 'IgnoreBuildingDefense', 'PrereqResources', 'Mechanized', 'Suicide', 'CaptureWhileEmbarked', 'PrereqTech', 'ObsoleteTech', 'GoodyHutUpgradeUnitClass', 'HurryCostModifier', 'AdvancedStartCost', 'MinAreaSize', 'AirUnitCap', 'NukeDamageLevel', 'WorkRate', 'NumFreeTechs', 'RushBuilding', 'BaseHurry', 'HurryMultiplier', 'BaseGold', 'NumGoldPerEra', 'SpreadReligion', 'IsReligious', 'CombatLimit', 'RangeAttackOnlyInDomain', 'RangeAttackIgnoreLOS', 'RangedCombatLimit', 'XPValueAttack', 'XPValueDefense', 'SpecialCargo', 'DomainCargo', 'Conscription', 'ExtraMaintenanceCost', 'NoMaintenance', 'Unhappiness', 'UnitArtInfo', 'UnitArtInfoCulturalVariation', 'UnitArtInfoEraVariation', 'ProjectPrereq', 'SpaceshipProject', 'LeaderPromotion', 'LeaderExperience', 'DontShowYields', 'ShowInPedia', 'MoveRate', 'UnitFlagIconOffset', 'PortraitIndex', 'IconAtlas', 'UnitFlagAtlas')
	SELECT	("UNIT_BOMBER_AMIOT350"), ("TXT_KEY_UNIT_BOMBER_AMIOT350"), "Civilopedia", "Strategy", "Help", "Requirements", "Combat", "RangedCombat", "Cost", "Moves", "Immobile", "Range", "BaseSightRange", "Class", "Special", "Capture", "CombatClass", "Domain", "CivilianAttackPriority", "DefaultUnitAI", "Food", "NoBadGoodies", "RivalTerritory", "MilitarySupport", "MilitaryProduction", "Pillage", "Found", "FoundAbroad", "CultureBombRadius", "GoldenAgeTurns", "IgnoreBuildingDefense", "PrereqResources", "Mechanized", "Suicide", "CaptureWhileEmbarked", "PrereqTech", "ObsoleteTech", "GoodyHutUpgradeUnitClass", "HurryCostModifier", "AdvancedStartCost", "MinAreaSize", "AirUnitCap", "NukeDamageLevel", "WorkRate", "NumFreeTechs", "RushBuilding", "BaseHurry", "HurryMultiplier", "BaseGold", "NumGoldPerEra", "SpreadReligion", "IsReligious", "CombatLimit", "RangeAttackOnlyInDomain", "RangeAttackIgnoreLOS", "RangedCombatLimit", "XPValueAttack", "XPValueDefense", "SpecialCargo", "DomainCargo", "Conscription", "ExtraMaintenanceCost", "NoMaintenance", "Unhappiness",
			("ART_DEF_UNIT_BOMBER_AMIOT350"), "UnitArtInfoCulturalVariation", "UnitArtInfoEraVariation", "ProjectPrereq", "SpaceshipProject", "LeaderPromotion", "LeaderExperience", "DontShowYields", "ShowInPedia", "MoveRate", "UnitFlagIconOffset", "PortraitIndex", "IconAtlas", "UnitFlagAtlas"
	FROM "Units" WHERE (Type = "UNIT_FAST_BOMBER");
INSERT INTO "Language_en_US" ( 'Tag', 'Text' )
	VALUES ( 'TXT_KEY_UNIT_BOMBER_AMIOT350', 'Amiot 350' );
INSERT INTO "Unit_AITypes" ('UnitType', 'UnitAIType')
	SELECT ("UNIT_BOMBER_AMIOT350"), "UnitAIType"
	FROM "Unit_AITypes" WHERE (UnitType = "UNIT_FAST_BOMBER");
INSERT INTO "Unit_ClassUpgrades" ('UnitType', 'UnitClassType')
	SELECT ("UNIT_BOMBER_AMIOT350"), "UnitClassType"
	FROM "Unit_ClassUpgrades" WHERE (UnitType = "UNIT_FAST_BOMBER");
INSERT INTO "Civilization_UnitClassOverrides" ( 'CivilizationType', 'UnitClassType', 'UnitType' )
	VALUES ( 'CIVILIZATION_FRANCE', 'UNITCLASS_FAST_BOMBER', 'UNIT_BOMBER_AMIOT350' );
INSERT INTO "Unit_Flavors" ('UnitType', 'FlavorType', 'Flavor')
	SELECT ("UNIT_BOMBER_AMIOT350"), "FlavorType", "Flavor"
	FROM "Unit_Flavors" WHERE (UnitType = "UNIT_FAST_BOMBER");
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	SELECT ("UNIT_BOMBER_AMIOT350"), "PromotionType"
	FROM "Unit_FreePromotions" WHERE (UnitType = "UNIT_FAST_BOMBER");
INSERT INTO "Unit_ResourceQuantityRequirements" ('UnitType', 'ResourceType', 'Cost')
	SELECT ("UNIT_BOMBER_AMIOT350"), "ResourceType", "Cost"
	FROM "Unit_ResourceQuantityRequirements" WHERE (UnitType = "UNIT_FAST_BOMBER");
-----------

-- SM.79 Sparviero
INSERT INTO "Units" ('Type', 'Description', 'Civilopedia', 'Strategy', 'Help', 'Requirements', 'Combat', 'RangedCombat', 'Cost', 'Moves', 'Immobile', 'Range', 'BaseSightRange', 'Class', 'Special', 'Capture', 'CombatClass', 'Domain', 'CivilianAttackPriority', 'DefaultUnitAI', 'Food', 'NoBadGoodies', 'RivalTerritory', 'MilitarySupport', 'MilitaryProduction', 'Pillage', 'Found', 'FoundAbroad', 'CultureBombRadius', 'GoldenAgeTurns', 'IgnoreBuildingDefense', 'PrereqResources', 'Mechanized', 'Suicide', 'CaptureWhileEmbarked', 'PrereqTech', 'ObsoleteTech', 'GoodyHutUpgradeUnitClass', 'HurryCostModifier', 'AdvancedStartCost', 'MinAreaSize', 'AirUnitCap', 'NukeDamageLevel', 'WorkRate', 'NumFreeTechs', 'RushBuilding', 'BaseHurry', 'HurryMultiplier', 'BaseGold', 'NumGoldPerEra', 'SpreadReligion', 'IsReligious', 'CombatLimit', 'RangeAttackOnlyInDomain', 'RangeAttackIgnoreLOS', 'RangedCombatLimit', 'XPValueAttack', 'XPValueDefense', 'SpecialCargo', 'DomainCargo', 'Conscription', 'ExtraMaintenanceCost', 'NoMaintenance', 'Unhappiness', 'UnitArtInfo', 'UnitArtInfoCulturalVariation', 'UnitArtInfoEraVariation', 'ProjectPrereq', 'SpaceshipProject', 'LeaderPromotion', 'LeaderExperience', 'DontShowYields', 'ShowInPedia', 'MoveRate', 'UnitFlagIconOffset', 'PortraitIndex', 'IconAtlas', 'UnitFlagAtlas')
	SELECT	("UNIT_BOMBER_SM79"), ("TXT_KEY_UNIT_BOMBER_SM79"), "Civilopedia", "Strategy", "Help", "Requirements", "Combat", "RangedCombat", "Cost", "Moves", "Immobile", "Range", "BaseSightRange", "Class", "Special", "Capture", "CombatClass", "Domain", "CivilianAttackPriority", "DefaultUnitAI", "Food", "NoBadGoodies", "RivalTerritory", "MilitarySupport", "MilitaryProduction", "Pillage", "Found", "FoundAbroad", "CultureBombRadius", "GoldenAgeTurns", "IgnoreBuildingDefense", "PrereqResources", "Mechanized", "Suicide", "CaptureWhileEmbarked", "PrereqTech", "ObsoleteTech", "GoodyHutUpgradeUnitClass", "HurryCostModifier", "AdvancedStartCost", "MinAreaSize", "AirUnitCap", "NukeDamageLevel", "WorkRate", "NumFreeTechs", "RushBuilding", "BaseHurry", "HurryMultiplier", "BaseGold", "NumGoldPerEra", "SpreadReligion", "IsReligious", "CombatLimit", "RangeAttackOnlyInDomain", "RangeAttackIgnoreLOS", "RangedCombatLimit", "XPValueAttack", "XPValueDefense", "SpecialCargo", "DomainCargo", "Conscription", "ExtraMaintenanceCost", "NoMaintenance", "Unhappiness",
			("ART_DEF_UNIT_BOMBER_SM79"), "UnitArtInfoCulturalVariation", "UnitArtInfoEraVariation", "ProjectPrereq", "SpaceshipProject", "LeaderPromotion", "LeaderExperience", "DontShowYields", "ShowInPedia", "MoveRate", "UnitFlagIconOffset", "PortraitIndex", "IconAtlas", "UnitFlagAtlas"
	FROM "Units" WHERE (Type = "UNIT_FAST_BOMBER");
INSERT INTO "Language_en_US" ( 'Tag', 'Text' )
	VALUES ( 'TXT_KEY_UNIT_BOMBER_SM79', 'SM.79 Sparviero' );
INSERT INTO "Unit_AITypes" ('UnitType', 'UnitAIType')
	SELECT ("UNIT_BOMBER_SM79"), "UnitAIType"
	FROM "Unit_AITypes" WHERE (UnitType = "UNIT_FAST_BOMBER");
INSERT INTO "Unit_ClassUpgrades" ('UnitType', 'UnitClassType')
	SELECT ("UNIT_BOMBER_SM79"), "UnitClassType"
	FROM "Unit_ClassUpgrades" WHERE (UnitType = "UNIT_FAST_BOMBER");
INSERT INTO "Civilization_UnitClassOverrides" ( 'CivilizationType', 'UnitClassType', 'UnitType' )
	VALUES ( 'CIVILIZATION_ROME', 'UNITCLASS_FAST_BOMBER', 'UNIT_BOMBER_SM79' );
INSERT INTO "Unit_Flavors" ('UnitType', 'FlavorType', 'Flavor')
	SELECT ("UNIT_BOMBER_SM79"), "FlavorType", "Flavor"
	FROM "Unit_Flavors" WHERE (UnitType = "UNIT_FAST_BOMBER");
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	SELECT ("UNIT_BOMBER_SM79"), "PromotionType"
	FROM "Unit_FreePromotions" WHERE (UnitType = "UNIT_FAST_BOMBER");
INSERT INTO "Unit_ResourceQuantityRequirements" ('UnitType', 'ResourceType', 'Cost')
	SELECT ("UNIT_BOMBER_SM79"), "ResourceType", "Cost"
	FROM "Unit_ResourceQuantityRequirements" WHERE (UnitType = "UNIT_FAST_BOMBER");
-----------

-- Bomber Pe-2
INSERT INTO "Units" ('Type', 'Description', 'Civilopedia', 'Strategy', 'Help', 'Requirements', 'Combat', 'RangedCombat', 'Cost', 'Moves', 'Immobile', 'Range', 'BaseSightRange', 'Class', 'Special', 'Capture', 'CombatClass', 'Domain', 'CivilianAttackPriority', 'DefaultUnitAI', 'Food', 'NoBadGoodies', 'RivalTerritory', 'MilitarySupport', 'MilitaryProduction', 'Pillage', 'Found', 'FoundAbroad', 'CultureBombRadius', 'GoldenAgeTurns', 'IgnoreBuildingDefense', 'PrereqResources', 'Mechanized', 'Suicide', 'CaptureWhileEmbarked', 'PrereqTech', 'ObsoleteTech', 'GoodyHutUpgradeUnitClass', 'HurryCostModifier', 'AdvancedStartCost', 'MinAreaSize', 'AirUnitCap', 'NukeDamageLevel', 'WorkRate', 'NumFreeTechs', 'RushBuilding', 'BaseHurry', 'HurryMultiplier', 'BaseGold', 'NumGoldPerEra', 'SpreadReligion', 'IsReligious', 'CombatLimit', 'RangeAttackOnlyInDomain', 'RangeAttackIgnoreLOS', 'RangedCombatLimit', 'XPValueAttack', 'XPValueDefense', 'SpecialCargo', 'DomainCargo', 'Conscription', 'ExtraMaintenanceCost', 'NoMaintenance', 'Unhappiness', 'UnitArtInfo', 'UnitArtInfoCulturalVariation', 'UnitArtInfoEraVariation', 'ProjectPrereq', 'SpaceshipProject', 'LeaderPromotion', 'LeaderExperience', 'DontShowYields', 'ShowInPedia', 'MoveRate', 'UnitFlagIconOffset', 'PortraitIndex', 'IconAtlas', 'UnitFlagAtlas')
	SELECT	("UNIT_BOMBER_PE2"), ("TXT_KEY_UNIT_BOMBER_PE2"), "Civilopedia", "Strategy", "Help", "Requirements", "Combat", "RangedCombat", "Cost", "Moves", "Immobile", "Range", "BaseSightRange", "Class", "Special", "Capture", "CombatClass", "Domain", "CivilianAttackPriority", "DefaultUnitAI", "Food", "NoBadGoodies", "RivalTerritory", "MilitarySupport", "MilitaryProduction", "Pillage", "Found", "FoundAbroad", "CultureBombRadius", "GoldenAgeTurns", "IgnoreBuildingDefense", "PrereqResources", "Mechanized", "Suicide", "CaptureWhileEmbarked", "PrereqTech", "ObsoleteTech", "GoodyHutUpgradeUnitClass", "HurryCostModifier", "AdvancedStartCost", "MinAreaSize", "AirUnitCap", "NukeDamageLevel", "WorkRate", "NumFreeTechs", "RushBuilding", "BaseHurry", "HurryMultiplier", "BaseGold", "NumGoldPerEra", "SpreadReligion", "IsReligious", "CombatLimit", "RangeAttackOnlyInDomain", "RangeAttackIgnoreLOS", "RangedCombatLimit", "XPValueAttack", "XPValueDefense", "SpecialCargo", "DomainCargo", "Conscription", "ExtraMaintenanceCost", "NoMaintenance", "Unhappiness",
			("ART_DEF_UNIT_BOMBER_PE2"), "UnitArtInfoCulturalVariation", "UnitArtInfoEraVariation", "ProjectPrereq", "SpaceshipProject", "LeaderPromotion", "LeaderExperience", "DontShowYields", "ShowInPedia", "MoveRate", "UnitFlagIconOffset", "PortraitIndex", "IconAtlas", "UnitFlagAtlas"
	FROM "Units" WHERE (Type = "UNIT_FAST_BOMBER");
INSERT INTO "Language_en_US" ( 'Tag', 'Text' )
	VALUES ( 'TXT_KEY_UNIT_BOMBER_PE2', 'Petlyakov Pe-2' );
INSERT INTO "Unit_AITypes" ('UnitType', 'UnitAIType')
	SELECT ("UNIT_BOMBER_PE2"), "UnitAIType"
	FROM "Unit_AITypes" WHERE (UnitType = "UNIT_FAST_BOMBER");
INSERT INTO "Unit_ClassUpgrades" ('UnitType', 'UnitClassType')
	SELECT ("UNIT_BOMBER_PE2"), "UnitClassType"
	FROM "Unit_ClassUpgrades" WHERE (UnitType = "UNIT_FAST_BOMBER");
INSERT INTO "Civilization_UnitClassOverrides" ( 'CivilizationType', 'UnitClassType', 'UnitType' )
	VALUES ( 'CIVILIZATION_RUSSIA', 'UNITCLASS_FAST_BOMBER', 'UNIT_BOMBER_PE2' );
INSERT INTO "Unit_Flavors" ('UnitType', 'FlavorType', 'Flavor')
	SELECT ("UNIT_BOMBER_PE2"), "FlavorType", "Flavor"
	FROM "Unit_Flavors" WHERE (UnitType = "UNIT_FAST_BOMBER");
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	SELECT ("UNIT_BOMBER_PE2"), "PromotionType"
	FROM "Unit_FreePromotions" WHERE (UnitType = "UNIT_FAST_BOMBER");
INSERT INTO "Unit_ResourceQuantityRequirements" ('UnitType', 'ResourceType', 'Cost')
	SELECT ("UNIT_BOMBER_PE2"), "ResourceType", "Cost"
	FROM "Unit_ResourceQuantityRequirements" WHERE (UnitType = "UNIT_FAST_BOMBER");
-----------

-- Bomber G4M3
INSERT INTO "Units" ('Type', 'Description', 'Civilopedia', 'Strategy', 'Help', 'Requirements', 'Combat', 'RangedCombat', 'Cost', 'Moves', 'Immobile', 'Range', 'BaseSightRange', 'Class', 'Special', 'Capture', 'CombatClass', 'Domain', 'CivilianAttackPriority', 'DefaultUnitAI', 'Food', 'NoBadGoodies', 'RivalTerritory', 'MilitarySupport', 'MilitaryProduction', 'Pillage', 'Found', 'FoundAbroad', 'CultureBombRadius', 'GoldenAgeTurns', 'IgnoreBuildingDefense', 'PrereqResources', 'Mechanized', 'Suicide', 'CaptureWhileEmbarked', 'PrereqTech', 'ObsoleteTech', 'GoodyHutUpgradeUnitClass', 'HurryCostModifier', 'AdvancedStartCost', 'MinAreaSize', 'AirUnitCap', 'NukeDamageLevel', 'WorkRate', 'NumFreeTechs', 'RushBuilding', 'BaseHurry', 'HurryMultiplier', 'BaseGold', 'NumGoldPerEra', 'SpreadReligion', 'IsReligious', 'CombatLimit', 'RangeAttackOnlyInDomain', 'RangeAttackIgnoreLOS', 'RangedCombatLimit', 'XPValueAttack', 'XPValueDefense', 'SpecialCargo', 'DomainCargo', 'Conscription', 'ExtraMaintenanceCost', 'NoMaintenance', 'Unhappiness', 'UnitArtInfo', 'UnitArtInfoCulturalVariation', 'UnitArtInfoEraVariation', 'ProjectPrereq', 'SpaceshipProject', 'LeaderPromotion', 'LeaderExperience', 'DontShowYields', 'ShowInPedia', 'MoveRate', 'UnitFlagIconOffset', 'PortraitIndex', 'IconAtlas', 'UnitFlagAtlas')
	SELECT	("UNIT_BOMBER_G4M3"), ("TXT_KEY_UNIT_BOMBER_G4M3"), "Civilopedia", "Strategy", "Help", "Requirements", "Combat", "RangedCombat", "Cost", "Moves", "Immobile", "Range", "BaseSightRange", "Class", "Special", "Capture", "CombatClass", "Domain", "CivilianAttackPriority", "DefaultUnitAI", "Food", "NoBadGoodies", "RivalTerritory", "MilitarySupport", "MilitaryProduction", "Pillage", "Found", "FoundAbroad", "CultureBombRadius", "GoldenAgeTurns", "IgnoreBuildingDefense", "PrereqResources", "Mechanized", "Suicide", "CaptureWhileEmbarked", "PrereqTech", "ObsoleteTech", "GoodyHutUpgradeUnitClass", "HurryCostModifier", "AdvancedStartCost", "MinAreaSize", "AirUnitCap", "NukeDamageLevel", "WorkRate", "NumFreeTechs", "RushBuilding", "BaseHurry", "HurryMultiplier", "BaseGold", "NumGoldPerEra", "SpreadReligion", "IsReligious", "CombatLimit", "RangeAttackOnlyInDomain", "RangeAttackIgnoreLOS", "RangedCombatLimit", "XPValueAttack", "XPValueDefense", "SpecialCargo", "DomainCargo", "Conscription", "ExtraMaintenanceCost", "NoMaintenance", "Unhappiness",
			("ART_DEF_UNIT_BOMBER_G4M3"), "UnitArtInfoCulturalVariation", "UnitArtInfoEraVariation", "ProjectPrereq", "SpaceshipProject", "LeaderPromotion", "LeaderExperience", "DontShowYields", "ShowInPedia", "MoveRate", "UnitFlagIconOffset", "PortraitIndex", "IconAtlas", "UnitFlagAtlas"
	FROM "Units" WHERE (Type = "UNIT_FAST_BOMBER");
INSERT INTO "Language_en_US" ( 'Tag', 'Text' )
	VALUES ( 'TXT_KEY_UNIT_BOMBER_G4M3', 'Mitsubishi G4M' );
INSERT INTO "Unit_AITypes" ('UnitType', 'UnitAIType')
	SELECT ("UNIT_BOMBER_G4M3"), "UnitAIType"
	FROM "Unit_AITypes" WHERE (UnitType = "UNIT_FAST_BOMBER");
INSERT INTO "Unit_ClassUpgrades" ('UnitType', 'UnitClassType')
	SELECT ("UNIT_BOMBER_G4M3"), "UnitClassType"
	FROM "Unit_ClassUpgrades" WHERE (UnitType = "UNIT_FAST_BOMBER");
INSERT INTO "Civilization_UnitClassOverrides" ( 'CivilizationType', 'UnitClassType', 'UnitType' )
	VALUES ( 'CIVILIZATION_JAPAN', 'UNITCLASS_FAST_BOMBER', 'UNIT_BOMBER_G4M3' );
INSERT INTO "Unit_Flavors" ('UnitType', 'FlavorType', 'Flavor')
	SELECT ("UNIT_BOMBER_G4M3"), "FlavorType", "Flavor"
	FROM "Unit_Flavors" WHERE (UnitType = "UNIT_FAST_BOMBER");
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	SELECT ("UNIT_BOMBER_G4M3"), "PromotionType"
	FROM "Unit_FreePromotions" WHERE (UnitType = "UNIT_FAST_BOMBER");
INSERT INTO "Unit_ResourceQuantityRequirements" ('UnitType', 'ResourceType', 'Cost')
	SELECT ("UNIT_BOMBER_G4M3"), "ResourceType", "Cost"
	FROM "Unit_ResourceQuantityRequirements" WHERE (UnitType = "UNIT_FAST_BOMBER");
-----------

-- Bomber Tupolev Tu-2
INSERT INTO "Units" ('Type', 'Description', 'Civilopedia', 'Strategy', 'Help', 'Requirements', 'Combat', 'RangedCombat', 'Cost', 'Moves', 'Immobile', 'Range', 'BaseSightRange', 'Class', 'Special', 'Capture', 'CombatClass', 'Domain', 'CivilianAttackPriority', 'DefaultUnitAI', 'Food', 'NoBadGoodies', 'RivalTerritory', 'MilitarySupport', 'MilitaryProduction', 'Pillage', 'Found', 'FoundAbroad', 'CultureBombRadius', 'GoldenAgeTurns', 'IgnoreBuildingDefense', 'PrereqResources', 'Mechanized', 'Suicide', 'CaptureWhileEmbarked', 'PrereqTech', 'ObsoleteTech', 'GoodyHutUpgradeUnitClass', 'HurryCostModifier', 'AdvancedStartCost', 'MinAreaSize', 'AirUnitCap', 'NukeDamageLevel', 'WorkRate', 'NumFreeTechs', 'RushBuilding', 'BaseHurry', 'HurryMultiplier', 'BaseGold', 'NumGoldPerEra', 'SpreadReligion', 'IsReligious', 'CombatLimit', 'RangeAttackOnlyInDomain', 'RangeAttackIgnoreLOS', 'RangedCombatLimit', 'XPValueAttack', 'XPValueDefense', 'SpecialCargo', 'DomainCargo', 'Conscription', 'ExtraMaintenanceCost', 'NoMaintenance', 'Unhappiness', 'UnitArtInfo', 'UnitArtInfoCulturalVariation', 'UnitArtInfoEraVariation', 'ProjectPrereq', 'SpaceshipProject', 'LeaderPromotion', 'LeaderExperience', 'DontShowYields', 'ShowInPedia', 'MoveRate', 'UnitFlagIconOffset', 'PortraitIndex', 'IconAtlas', 'UnitFlagAtlas')
	SELECT	("UNIT_BOMBER_TU2"), ("TXT_KEY_UNIT_BOMBER_TU2"), "Civilopedia", "Strategy", "Help", "Requirements", "Combat", "RangedCombat", "Cost", "Moves", "Immobile", "Range", "BaseSightRange", "Class", "Special", "Capture", "CombatClass", "Domain", "CivilianAttackPriority", "DefaultUnitAI", "Food", "NoBadGoodies", "RivalTerritory", "MilitarySupport", "MilitaryProduction", "Pillage", "Found", "FoundAbroad", "CultureBombRadius", "GoldenAgeTurns", "IgnoreBuildingDefense", "PrereqResources", "Mechanized", "Suicide", "CaptureWhileEmbarked", "PrereqTech", "ObsoleteTech", "GoodyHutUpgradeUnitClass", "HurryCostModifier", "AdvancedStartCost", "MinAreaSize", "AirUnitCap", "NukeDamageLevel", "WorkRate", "NumFreeTechs", "RushBuilding", "BaseHurry", "HurryMultiplier", "BaseGold", "NumGoldPerEra", "SpreadReligion", "IsReligious", "CombatLimit", "RangeAttackOnlyInDomain", "RangeAttackIgnoreLOS", "RangedCombatLimit", "XPValueAttack", "XPValueDefense", "SpecialCargo", "DomainCargo", "Conscription", "ExtraMaintenanceCost", "NoMaintenance", "Unhappiness",
			("ART_DEF_UNIT_BOMBER_TU2"), "UnitArtInfoCulturalVariation", "UnitArtInfoEraVariation", ("PROJECT_BOMBER_TU2"), "SpaceshipProject", "LeaderPromotion", "LeaderExperience", "DontShowYields", "ShowInPedia", "MoveRate", "UnitFlagIconOffset", "PortraitIndex", "IconAtlas", "UnitFlagAtlas"
	FROM "Units" WHERE (Type = "UNIT_FAST_BOMBER_2");
INSERT INTO "Language_en_US" ( 'Tag', 'Text' )
	VALUES ( 'TXT_KEY_UNIT_BOMBER_TU2', 'Tupolev Tu-2' );
INSERT INTO "Unit_AITypes" ('UnitType', 'UnitAIType')
	SELECT ("UNIT_BOMBER_TU2"), "UnitAIType"
	FROM "Unit_AITypes" WHERE (UnitType = "UNIT_FAST_BOMBER_2");
INSERT INTO "Unit_ClassUpgrades" ('UnitType', 'UnitClassType')
	SELECT ("UNIT_BOMBER_TU2"), "UnitClassType"
	FROM "Unit_ClassUpgrades" WHERE (UnitType = "UNIT_FAST_BOMBER_2");
INSERT INTO "Civilization_UnitClassOverrides" ( 'CivilizationType', 'UnitClassType', 'UnitType' )
	VALUES ( 'CIVILIZATION_RUSSIA', 'UNITCLASS_FAST_BOMBER_2', 'UNIT_BOMBER_TU2' );
INSERT INTO "Unit_Flavors" ('UnitType', 'FlavorType', 'Flavor')
	SELECT ("UNIT_BOMBER_TU2"), "FlavorType", "Flavor"
	FROM "Unit_Flavors" WHERE (UnitType = "UNIT_FAST_BOMBER_2");
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	SELECT ("UNIT_BOMBER_TU2"), "PromotionType"
	FROM "Unit_FreePromotions" WHERE (UnitType = "UNIT_FAST_BOMBER_2");
INSERT INTO "Unit_ResourceQuantityRequirements" ('UnitType', 'ResourceType', 'Cost')
	SELECT ("UNIT_BOMBER_TU2"), "ResourceType", "Cost"
	FROM "Unit_ResourceQuantityRequirements" WHERE (UnitType = "UNIT_FAST_BOMBER_2");
-----------

-- De Havilland Mosquito
INSERT INTO "Units" ('Type', 'Description', 'Civilopedia', 'Strategy', 'Help', 'Requirements', 'Combat', 'RangedCombat', 'Cost', 'Moves', 'Immobile', 'Range', 'BaseSightRange', 'Class', 'Special', 'Capture', 'CombatClass', 'Domain', 'CivilianAttackPriority', 'DefaultUnitAI', 'Food', 'NoBadGoodies', 'RivalTerritory', 'MilitarySupport', 'MilitaryProduction', 'Pillage', 'Found', 'FoundAbroad', 'CultureBombRadius', 'GoldenAgeTurns', 'IgnoreBuildingDefense', 'PrereqResources', 'Mechanized', 'Suicide', 'CaptureWhileEmbarked', 'PrereqTech', 'ObsoleteTech', 'GoodyHutUpgradeUnitClass', 'HurryCostModifier', 'AdvancedStartCost', 'MinAreaSize', 'AirUnitCap', 'NukeDamageLevel', 'WorkRate', 'NumFreeTechs', 'RushBuilding', 'BaseHurry', 'HurryMultiplier', 'BaseGold', 'NumGoldPerEra', 'SpreadReligion', 'IsReligious', 'CombatLimit', 'RangeAttackOnlyInDomain', 'RangeAttackIgnoreLOS', 'RangedCombatLimit', 'XPValueAttack', 'XPValueDefense', 'SpecialCargo', 'DomainCargo', 'Conscription', 'ExtraMaintenanceCost', 'NoMaintenance', 'Unhappiness', 'UnitArtInfo', 'UnitArtInfoCulturalVariation', 'UnitArtInfoEraVariation', 'ProjectPrereq', 'SpaceshipProject', 'LeaderPromotion', 'LeaderExperience', 'DontShowYields', 'ShowInPedia', 'MoveRate', 'UnitFlagIconOffset', 'PortraitIndex', 'IconAtlas', 'UnitFlagAtlas')
	SELECT	("UNIT_BOMBER_MOSQUITO"), ("TXT_KEY_UNIT_BOMBER_MOSQUITO"), "Civilopedia", "Strategy", "Help", "Requirements", "Combat", "RangedCombat", "Cost", "Moves", "Immobile", "Range", "BaseSightRange", "Class", "Special", "Capture", "CombatClass", "Domain", "CivilianAttackPriority", "DefaultUnitAI", "Food", "NoBadGoodies", "RivalTerritory", "MilitarySupport", "MilitaryProduction", "Pillage", "Found", "FoundAbroad", "CultureBombRadius", "GoldenAgeTurns", "IgnoreBuildingDefense", "PrereqResources", "Mechanized", "Suicide", "CaptureWhileEmbarked", "PrereqTech", "ObsoleteTech", "GoodyHutUpgradeUnitClass", "HurryCostModifier", "AdvancedStartCost", "MinAreaSize", "AirUnitCap", "NukeDamageLevel", "WorkRate", "NumFreeTechs", "RushBuilding", "BaseHurry", "HurryMultiplier", "BaseGold", "NumGoldPerEra", "SpreadReligion", "IsReligious", "CombatLimit", "RangeAttackOnlyInDomain", "RangeAttackIgnoreLOS", "RangedCombatLimit", "XPValueAttack", "XPValueDefense", "SpecialCargo", "DomainCargo", "Conscription", "ExtraMaintenanceCost", "NoMaintenance", "Unhappiness",
			("ART_DEF_UNIT_BOMBER_MOSQUITO"), "UnitArtInfoCulturalVariation", "UnitArtInfoEraVariation", ("PROJECT_BOMBER_MOSQUITO"), "SpaceshipProject", "LeaderPromotion", "LeaderExperience", "DontShowYields", "ShowInPedia", "MoveRate", "UnitFlagIconOffset", "PortraitIndex", "IconAtlas", "UnitFlagAtlas"
	FROM "Units" WHERE (Type = "UNIT_FAST_BOMBER_2");
INSERT INTO "Language_en_US" ( 'Tag', 'Text' )
	VALUES ( 'TXT_KEY_UNIT_BOMBER_MOSQUITO', 'De Havilland Mosquito' );
INSERT INTO "Unit_AITypes" ('UnitType', 'UnitAIType')
	SELECT ("UNIT_BOMBER_MOSQUITO"), "UnitAIType"
	FROM "Unit_AITypes" WHERE (UnitType = "UNIT_FAST_BOMBER_2");
INSERT INTO "Unit_ClassUpgrades" ('UnitType', 'UnitClassType')
	SELECT ("UNIT_BOMBER_MOSQUITO"), "UnitClassType"
	FROM "Unit_ClassUpgrades" WHERE (UnitType = "UNIT_FAST_BOMBER_2");
INSERT INTO "Civilization_UnitClassOverrides" ( 'CivilizationType', 'UnitClassType', 'UnitType' )
	VALUES ( 'CIVILIZATION_ENGLAND', 'UNITCLASS_FAST_BOMBER_2', 'UNIT_BOMBER_MOSQUITO' );
INSERT INTO "Unit_Flavors" ('UnitType', 'FlavorType', 'Flavor')
	SELECT ("UNIT_BOMBER_MOSQUITO"), "FlavorType", "Flavor"
	FROM "Unit_Flavors" WHERE (UnitType = "UNIT_FAST_BOMBER_2");
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	SELECT ("UNIT_BOMBER_MOSQUITO"), "PromotionType"
	FROM "Unit_FreePromotions" WHERE (UnitType = "UNIT_FAST_BOMBER_2");
INSERT INTO "Unit_ResourceQuantityRequirements" ('UnitType', 'ResourceType', 'Cost')
	SELECT ("UNIT_BOMBER_MOSQUITO"), "ResourceType", "Cost"
	FROM "Unit_ResourceQuantityRequirements" WHERE (UnitType = "UNIT_FAST_BOMBER_2");
-----------

--------------------------------------------------------------
-- BOMBERS
--------------------------------------------------------------

-- Bomber (Civ4 default model)
INSERT INTO "Units" ('Type', 'Description', 'Civilopedia', 'Strategy', 'Help', 'Requirements', 'Combat', 'RangedCombat', 'Cost', 'Moves', 'Immobile', 'Range', 'BaseSightRange', 'Class', 'Special', 'Capture', 'CombatClass', 'Domain', 'CivilianAttackPriority', 'DefaultUnitAI', 'Food', 'NoBadGoodies', 'RivalTerritory', 'MilitarySupport', 'MilitaryProduction', 'Pillage', 'Found', 'FoundAbroad', 'CultureBombRadius', 'GoldenAgeTurns', 'IgnoreBuildingDefense', 'PrereqResources', 'Mechanized', 'Suicide', 'CaptureWhileEmbarked', 'PrereqTech', 'ObsoleteTech', 'GoodyHutUpgradeUnitClass', 'HurryCostModifier', 'AdvancedStartCost', 'MinAreaSize', 'AirUnitCap', 'NukeDamageLevel', 'WorkRate', 'NumFreeTechs', 'RushBuilding', 'BaseHurry', 'HurryMultiplier', 'BaseGold', 'NumGoldPerEra', 'SpreadReligion', 'IsReligious', 'CombatLimit', 'RangeAttackOnlyInDomain', 'RangeAttackIgnoreLOS', 'RangedCombatLimit', 'XPValueAttack', 'XPValueDefense', 'SpecialCargo', 'DomainCargo', 'Conscription', 'ExtraMaintenanceCost', 'NoMaintenance', 'Unhappiness', 'UnitArtInfo', 'UnitArtInfoCulturalVariation', 'UnitArtInfoEraVariation', 'ProjectPrereq', 'SpaceshipProject', 'LeaderPromotion', 'LeaderExperience', 'DontShowYields', 'ShowInPedia', 'MoveRate', 'UnitFlagIconOffset', 'PortraitIndex', 'IconAtlas', 'UnitFlagAtlas')
	SELECT	("UNIT_BOMBER_CIV4"), ("TXT_KEY_UNIT_BOMBER_CIV4"), "Civilopedia", "Strategy", "Help", "Requirements", "Combat", "RangedCombat", "Cost", "Moves", "Immobile", "Range", "BaseSightRange", "Class", "Special", "Capture", "CombatClass", "Domain", "CivilianAttackPriority", "DefaultUnitAI", "Food", "NoBadGoodies", "RivalTerritory", "MilitarySupport", "MilitaryProduction", "Pillage", "Found", "FoundAbroad", "CultureBombRadius", "GoldenAgeTurns", "IgnoreBuildingDefense", "PrereqResources", "Mechanized", "Suicide", "CaptureWhileEmbarked", "PrereqTech", "ObsoleteTech", "GoodyHutUpgradeUnitClass", "HurryCostModifier", "AdvancedStartCost", "MinAreaSize", "AirUnitCap", "NukeDamageLevel", "WorkRate", "NumFreeTechs", "RushBuilding", "BaseHurry", "HurryMultiplier", "BaseGold", "NumGoldPerEra", "SpreadReligion", "IsReligious", "CombatLimit", "RangeAttackOnlyInDomain", "RangeAttackIgnoreLOS", "RangedCombatLimit", "XPValueAttack", "XPValueDefense", "SpecialCargo", "DomainCargo", "Conscription", "ExtraMaintenanceCost", "NoMaintenance", "Unhappiness",
			("ART_DEF_UNIT_BOMBER_CIV4"), "UnitArtInfoCulturalVariation", "UnitArtInfoEraVariation", "ProjectPrereq", "SpaceshipProject", "LeaderPromotion", "LeaderExperience", "DontShowYields", "ShowInPedia", "MoveRate", "UnitFlagIconOffset", "PortraitIndex", "IconAtlas", "UnitFlagAtlas"
	FROM "Units" WHERE (Type = "UNIT_BOMBER");
INSERT INTO "Language_en_US" ( 'Tag', 'Text' )
	VALUES ( 'TXT_KEY_UNIT_BOMBER_CIV4', 'Bomber' );
INSERT INTO "Unit_AITypes" ('UnitType', 'UnitAIType')
	SELECT ("UNIT_BOMBER_CIV4"), "UnitAIType"
	FROM "Unit_AITypes" WHERE (UnitType = "UNIT_BOMBER");
INSERT INTO "Unit_ClassUpgrades" ('UnitType', 'UnitClassType')
	SELECT ("UNIT_BOMBER_CIV4"), "UnitClassType"
	FROM "Unit_ClassUpgrades" WHERE (UnitType = "UNIT_BOMBER");
--INSERT INTO "Civilization_UnitClassOverrides" ( 'CivilizationType', 'UnitClassType', 'UnitType' )
--	VALUES ( 'CIVILIZATION_XXXXX', 'UNITCLASS_BOMBER', 'UNIT_BOMBER_CIV4' );
INSERT INTO "Unit_Flavors" ('UnitType', 'FlavorType', 'Flavor')
	SELECT ("UNIT_BOMBER_CIV4"), "FlavorType", "Flavor"
	FROM "Unit_Flavors" WHERE (UnitType = "UNIT_BOMBER");
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	SELECT ("UNIT_BOMBER_CIV4"), "PromotionType"
	FROM "Unit_FreePromotions" WHERE (UnitType = "UNIT_BOMBER");
INSERT INTO "Unit_ResourceQuantityRequirements" ('UnitType', 'ResourceType', 'Cost')
	SELECT ("UNIT_BOMBER_CIV4"), "ResourceType", "Cost"
	FROM "Unit_ResourceQuantityRequirements" WHERE (UnitType = "UNIT_BOMBER");
-----------

-- Bomber B-25 Mitchell
INSERT INTO "Units" ('Type', 'Description', 'Civilopedia', 'Strategy', 'Help', 'Requirements', 'Combat', 'RangedCombat', 'Cost', 'Moves', 'Immobile', 'Range', 'BaseSightRange', 'Class', 'Special', 'Capture', 'CombatClass', 'Domain', 'CivilianAttackPriority', 'DefaultUnitAI', 'Food', 'NoBadGoodies', 'RivalTerritory', 'MilitarySupport', 'MilitaryProduction', 'Pillage', 'Found', 'FoundAbroad', 'CultureBombRadius', 'GoldenAgeTurns', 'IgnoreBuildingDefense', 'PrereqResources', 'Mechanized', 'Suicide', 'CaptureWhileEmbarked', 'PrereqTech', 'ObsoleteTech', 'GoodyHutUpgradeUnitClass', 'HurryCostModifier', 'AdvancedStartCost', 'MinAreaSize', 'AirUnitCap', 'NukeDamageLevel', 'WorkRate', 'NumFreeTechs', 'RushBuilding', 'BaseHurry', 'HurryMultiplier', 'BaseGold', 'NumGoldPerEra', 'SpreadReligion', 'IsReligious', 'CombatLimit', 'RangeAttackOnlyInDomain', 'RangeAttackIgnoreLOS', 'RangedCombatLimit', 'XPValueAttack', 'XPValueDefense', 'SpecialCargo', 'DomainCargo', 'Conscription', 'ExtraMaintenanceCost', 'NoMaintenance', 'Unhappiness', 'UnitArtInfo', 'UnitArtInfoCulturalVariation', 'UnitArtInfoEraVariation', 'ProjectPrereq', 'SpaceshipProject', 'LeaderPromotion', 'LeaderExperience', 'DontShowYields', 'ShowInPedia', 'MoveRate', 'UnitFlagIconOffset', 'PortraitIndex', 'IconAtlas', 'UnitFlagAtlas')
	SELECT	("UNIT_BOMBER_B25MITCHELL"), ("TXT_KEY_UNIT_BOMBER_B25MITCHELL"), "Civilopedia", "Strategy", "Help", "Requirements", "Combat", "RangedCombat", "Cost", "Moves", "Immobile", "Range", "BaseSightRange", "Class", "Special", "Capture", "CombatClass", "Domain", "CivilianAttackPriority", "DefaultUnitAI", "Food", "NoBadGoodies", "RivalTerritory", "MilitarySupport", "MilitaryProduction", "Pillage", "Found", "FoundAbroad", "CultureBombRadius", "GoldenAgeTurns", "IgnoreBuildingDefense", "PrereqResources", "Mechanized", "Suicide", "CaptureWhileEmbarked", "PrereqTech", "ObsoleteTech", "GoodyHutUpgradeUnitClass", "HurryCostModifier", "AdvancedStartCost", "MinAreaSize", "AirUnitCap", "NukeDamageLevel", "WorkRate", "NumFreeTechs", "RushBuilding", "BaseHurry", "HurryMultiplier", "BaseGold", "NumGoldPerEra", "SpreadReligion", "IsReligious", "CombatLimit", "RangeAttackOnlyInDomain", "RangeAttackIgnoreLOS", "RangedCombatLimit", "XPValueAttack", "XPValueDefense", "SpecialCargo", "DomainCargo", "Conscription", "ExtraMaintenanceCost", "NoMaintenance", "Unhappiness",
			("ART_DEF_UNIT_BOMBER_B25MITCHELL"), "UnitArtInfoCulturalVariation", "UnitArtInfoEraVariation", ("PROJECT_B25"), "SpaceshipProject", "LeaderPromotion", "LeaderExperience", "DontShowYields", "ShowInPedia", "MoveRate", "UnitFlagIconOffset", "PortraitIndex", "IconAtlas", "UnitFlagAtlas"
	FROM "Units" WHERE (Type = "UNIT_BOMBER");
INSERT INTO "Language_en_US" ( 'Tag', 'Text' )
	VALUES ( 'TXT_KEY_UNIT_BOMBER_B25MITCHELL', 'B-25 Mitchell' );
INSERT INTO "Unit_AITypes" ('UnitType', 'UnitAIType')
	SELECT ("UNIT_BOMBER_B25MITCHELL"), "UnitAIType"
	FROM "Unit_AITypes" WHERE (UnitType = "UNIT_BOMBER");
INSERT INTO "Unit_ClassUpgrades" ('UnitType', 'UnitClassType')
	SELECT ("UNIT_BOMBER_B25MITCHELL"), "UnitClassType"
	FROM "Unit_ClassUpgrades" WHERE (UnitType = "UNIT_BOMBER");
INSERT INTO "Civilization_UnitClassOverrides" ( 'CivilizationType', 'UnitClassType', 'UnitType' )
	VALUES ( 'CIVILIZATION_AMERICA', 'UNITCLASS_BOMBER', 'UNIT_BOMBER_B25MITCHELL' );
INSERT INTO "Unit_Flavors" ('UnitType', 'FlavorType', 'Flavor')
	SELECT ("UNIT_BOMBER_B25MITCHELL"), "FlavorType", "Flavor"
	FROM "Unit_Flavors" WHERE (UnitType = "UNIT_BOMBER");
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	SELECT ("UNIT_BOMBER_B25MITCHELL"), "PromotionType"
	FROM "Unit_FreePromotions" WHERE (UnitType = "UNIT_BOMBER");
INSERT INTO "Unit_ResourceQuantityRequirements" ('UnitType', 'ResourceType', 'Cost')
	SELECT ("UNIT_BOMBER_B25MITCHELL"), "ResourceType", "Cost"
	FROM "Unit_ResourceQuantityRequirements" WHERE (UnitType = "UNIT_BOMBER");
-----------

-- Bomber B-25 china
INSERT INTO "Units" ('Type', 'Description', 'Civilopedia', 'Strategy', 'Help', 'Requirements', 'Combat', 'RangedCombat', 'Cost', 'Moves', 'Immobile', 'Range', 'BaseSightRange', 'Class', 'Special', 'Capture', 'CombatClass', 'Domain', 'CivilianAttackPriority', 'DefaultUnitAI', 'Food', 'NoBadGoodies', 'RivalTerritory', 'MilitarySupport', 'MilitaryProduction', 'Pillage', 'Found', 'FoundAbroad', 'CultureBombRadius', 'GoldenAgeTurns', 'IgnoreBuildingDefense', 'PrereqResources', 'Mechanized', 'Suicide', 'CaptureWhileEmbarked', 'PrereqTech', 'ObsoleteTech', 'GoodyHutUpgradeUnitClass', 'HurryCostModifier', 'AdvancedStartCost', 'MinAreaSize', 'AirUnitCap', 'NukeDamageLevel', 'WorkRate', 'NumFreeTechs', 'RushBuilding', 'BaseHurry', 'HurryMultiplier', 'BaseGold', 'NumGoldPerEra', 'SpreadReligion', 'IsReligious', 'CombatLimit', 'RangeAttackOnlyInDomain', 'RangeAttackIgnoreLOS', 'RangedCombatLimit', 'XPValueAttack', 'XPValueDefense', 'SpecialCargo', 'DomainCargo', 'Conscription', 'ExtraMaintenanceCost', 'NoMaintenance', 'Unhappiness', 'UnitArtInfo', 'UnitArtInfoCulturalVariation', 'UnitArtInfoEraVariation', 'ProjectPrereq', 'SpaceshipProject', 'LeaderPromotion', 'LeaderExperience', 'DontShowYields', 'ShowInPedia', 'MoveRate', 'UnitFlagIconOffset', 'PortraitIndex', 'IconAtlas', 'UnitFlagAtlas')
	SELECT	("UNIT_BOMBER_B25_CHINA"), ("TXT_KEY_UNIT_BOMBER_B25_CHINA"), "Civilopedia", "Strategy", "Help", "Requirements", "Combat", "RangedCombat", "Cost", "Moves", "Immobile", "Range", "BaseSightRange", "Class", "Special", "Capture", "CombatClass", "Domain", "CivilianAttackPriority", "DefaultUnitAI", "Food", "NoBadGoodies", "RivalTerritory", "MilitarySupport", "MilitaryProduction", "Pillage", "Found", "FoundAbroad", "CultureBombRadius", "GoldenAgeTurns", "IgnoreBuildingDefense", "PrereqResources", "Mechanized", "Suicide", "CaptureWhileEmbarked", "PrereqTech", "ObsoleteTech", "GoodyHutUpgradeUnitClass", "HurryCostModifier", "AdvancedStartCost", "MinAreaSize", "AirUnitCap", "NukeDamageLevel", "WorkRate", "NumFreeTechs", "RushBuilding", "BaseHurry", "HurryMultiplier", "BaseGold", "NumGoldPerEra", "SpreadReligion", "IsReligious", "CombatLimit", "RangeAttackOnlyInDomain", "RangeAttackIgnoreLOS", "RangedCombatLimit", "XPValueAttack", "XPValueDefense", "SpecialCargo", "DomainCargo", "Conscription", "ExtraMaintenanceCost", "NoMaintenance", "Unhappiness",
			("ART_DEF_UNIT_BOMBER_B25_CHINA"), "UnitArtInfoCulturalVariation", "UnitArtInfoEraVariation", "ProjectPrereq", "SpaceshipProject", "LeaderPromotion", "LeaderExperience", "DontShowYields", "ShowInPedia", "MoveRate", "UnitFlagIconOffset", "PortraitIndex", "IconAtlas", "UnitFlagAtlas"
	FROM "Units" WHERE (Type = "UNIT_BOMBER");
INSERT INTO "Language_en_US" ( 'Tag', 'Text' )
	VALUES ( 'TXT_KEY_UNIT_BOMBER_B25_CHINA', 'B-25 Mitchell' );
INSERT INTO "Unit_AITypes" ('UnitType', 'UnitAIType')
	SELECT ("UNIT_BOMBER_B25_CHINA"), "UnitAIType"
	FROM "Unit_AITypes" WHERE (UnitType = "UNIT_BOMBER");
INSERT INTO "Unit_ClassUpgrades" ('UnitType', 'UnitClassType')
	SELECT ("UNIT_BOMBER_B25_CHINA"), "UnitClassType"
	FROM "Unit_ClassUpgrades" WHERE (UnitType = "UNIT_BOMBER");
INSERT INTO "Civilization_UnitClassOverrides" ( 'CivilizationType', 'UnitClassType', 'UnitType' )
	VALUES ( 'CIVILIZATION_CHINA', 'UNITCLASS_BOMBER', 'UNIT_BOMBER_B25_CHINA' );
INSERT INTO "Unit_Flavors" ('UnitType', 'FlavorType', 'Flavor')
	SELECT ("UNIT_BOMBER_B25_CHINA"), "FlavorType", "Flavor"
	FROM "Unit_Flavors" WHERE (UnitType = "UNIT_BOMBER");
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	SELECT ("UNIT_BOMBER_B25_CHINA"), "PromotionType"
	FROM "Unit_FreePromotions" WHERE (UnitType = "UNIT_BOMBER");
INSERT INTO "Unit_ResourceQuantityRequirements" ('UnitType', 'ResourceType', 'Cost')
	SELECT ("UNIT_BOMBER_B25_CHINA"), "ResourceType", "Cost"
	FROM "Unit_ResourceQuantityRequirements" WHERE (UnitType = "UNIT_BOMBER");
-----------

-- Bomber B-24 Egypt
INSERT INTO "Units" ('Type', 'Description', 'Civilopedia', 'Strategy', 'Help', 'Requirements', 'Combat', 'RangedCombat', 'Cost', 'Moves', 'Immobile', 'Range', 'BaseSightRange', 'Class', 'Special', 'Capture', 'CombatClass', 'Domain', 'CivilianAttackPriority', 'DefaultUnitAI', 'Food', 'NoBadGoodies', 'RivalTerritory', 'MilitarySupport', 'MilitaryProduction', 'Pillage', 'Found', 'FoundAbroad', 'CultureBombRadius', 'GoldenAgeTurns', 'IgnoreBuildingDefense', 'PrereqResources', 'Mechanized', 'Suicide', 'CaptureWhileEmbarked', 'PrereqTech', 'ObsoleteTech', 'GoodyHutUpgradeUnitClass', 'HurryCostModifier', 'AdvancedStartCost', 'MinAreaSize', 'AirUnitCap', 'NukeDamageLevel', 'WorkRate', 'NumFreeTechs', 'RushBuilding', 'BaseHurry', 'HurryMultiplier', 'BaseGold', 'NumGoldPerEra', 'SpreadReligion', 'IsReligious', 'CombatLimit', 'RangeAttackOnlyInDomain', 'RangeAttackIgnoreLOS', 'RangedCombatLimit', 'XPValueAttack', 'XPValueDefense', 'SpecialCargo', 'DomainCargo', 'Conscription', 'ExtraMaintenanceCost', 'NoMaintenance', 'Unhappiness', 'UnitArtInfo', 'UnitArtInfoCulturalVariation', 'UnitArtInfoEraVariation', 'ProjectPrereq', 'SpaceshipProject', 'LeaderPromotion', 'LeaderExperience', 'DontShowYields', 'ShowInPedia', 'MoveRate', 'UnitFlagIconOffset', 'PortraitIndex', 'IconAtlas', 'UnitFlagAtlas')
	SELECT	("UNIT_BOMBER_B24_EGYPT"), ("TXT_KEY_UNIT_BOMBER_B24_EGYPT"), "Civilopedia", "Strategy", "Help", "Requirements", "Combat", "RangedCombat", "Cost", "Moves", "Immobile", "Range", "BaseSightRange", "Class", "Special", "Capture", "CombatClass", "Domain", "CivilianAttackPriority", "DefaultUnitAI", "Food", "NoBadGoodies", "RivalTerritory", "MilitarySupport", "MilitaryProduction", "Pillage", "Found", "FoundAbroad", "CultureBombRadius", "GoldenAgeTurns", "IgnoreBuildingDefense", "PrereqResources", "Mechanized", "Suicide", "CaptureWhileEmbarked", "PrereqTech", "ObsoleteTech", "GoodyHutUpgradeUnitClass", "HurryCostModifier", "AdvancedStartCost", "MinAreaSize", "AirUnitCap", "NukeDamageLevel", "WorkRate", "NumFreeTechs", "RushBuilding", "BaseHurry", "HurryMultiplier", "BaseGold", "NumGoldPerEra", "SpreadReligion", "IsReligious", "CombatLimit", "RangeAttackOnlyInDomain", "RangeAttackIgnoreLOS", "RangedCombatLimit", "XPValueAttack", "XPValueDefense", "SpecialCargo", "DomainCargo", "Conscription", "ExtraMaintenanceCost", "NoMaintenance", "Unhappiness",
			("ART_DEF_UNIT_BOMBER_B24_EGYPT"), "UnitArtInfoCulturalVariation", "UnitArtInfoEraVariation", "ProjectPrereq", "SpaceshipProject", "LeaderPromotion", "LeaderExperience", "DontShowYields", "ShowInPedia", "MoveRate", "UnitFlagIconOffset", "PortraitIndex", "IconAtlas", "UnitFlagAtlas"
	FROM "Units" WHERE (Type = "UNIT_BOMBER");
INSERT INTO "Language_en_US" ( 'Tag', 'Text' )
	VALUES ( 'TXT_KEY_UNIT_BOMBER_B24_EGYPT', 'B-24 Liberator' );
INSERT INTO "Unit_AITypes" ('UnitType', 'UnitAIType')
	SELECT ("UNIT_BOMBER_B24_EGYPT"), "UnitAIType"
	FROM "Unit_AITypes" WHERE (UnitType = "UNIT_BOMBER");
INSERT INTO "Unit_ClassUpgrades" ('UnitType', 'UnitClassType')
	SELECT ("UNIT_BOMBER_B24_EGYPT"), "UnitClassType"
	FROM "Unit_ClassUpgrades" WHERE (UnitType = "UNIT_BOMBER");
--INSERT INTO "Civilization_UnitClassOverrides" ( 'CivilizationType', 'UnitClassType', 'UnitType' )
--	VALUES ( 'CIVILIZATION_EGYPT', 'UNITCLASS_BOMBER', 'UNIT_BOMBER_B24_EGYPT' );
INSERT INTO "Unit_Flavors" ('UnitType', 'FlavorType', 'Flavor')
	SELECT ("UNIT_BOMBER_B24_EGYPT"), "FlavorType", "Flavor"
	FROM "Unit_Flavors" WHERE (UnitType = "UNIT_BOMBER");
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	SELECT ("UNIT_BOMBER_B24_EGYPT"), "PromotionType"
	FROM "Unit_FreePromotions" WHERE (UnitType = "UNIT_BOMBER");
INSERT INTO "Unit_ResourceQuantityRequirements" ('UnitType', 'ResourceType', 'Cost')
	SELECT ("UNIT_BOMBER_B24_EGYPT"), "ResourceType", "Cost"
	FROM "Unit_ResourceQuantityRequirements" WHERE (UnitType = "UNIT_BOMBER");
-----------

-- Bomber Blenheim Greece
INSERT INTO "Units" ('Type', 'Description', 'Civilopedia', 'Strategy', 'Help', 'Requirements', 'Combat', 'RangedCombat', 'Cost', 'Moves', 'Immobile', 'Range', 'BaseSightRange', 'Class', 'Special', 'Capture', 'CombatClass', 'Domain', 'CivilianAttackPriority', 'DefaultUnitAI', 'Food', 'NoBadGoodies', 'RivalTerritory', 'MilitarySupport', 'MilitaryProduction', 'Pillage', 'Found', 'FoundAbroad', 'CultureBombRadius', 'GoldenAgeTurns', 'IgnoreBuildingDefense', 'PrereqResources', 'Mechanized', 'Suicide', 'CaptureWhileEmbarked', 'PrereqTech', 'ObsoleteTech', 'GoodyHutUpgradeUnitClass', 'HurryCostModifier', 'AdvancedStartCost', 'MinAreaSize', 'AirUnitCap', 'NukeDamageLevel', 'WorkRate', 'NumFreeTechs', 'RushBuilding', 'BaseHurry', 'HurryMultiplier', 'BaseGold', 'NumGoldPerEra', 'SpreadReligion', 'IsReligious', 'CombatLimit', 'RangeAttackOnlyInDomain', 'RangeAttackIgnoreLOS', 'RangedCombatLimit', 'XPValueAttack', 'XPValueDefense', 'SpecialCargo', 'DomainCargo', 'Conscription', 'ExtraMaintenanceCost', 'NoMaintenance', 'Unhappiness', 'UnitArtInfo', 'UnitArtInfoCulturalVariation', 'UnitArtInfoEraVariation', 'ProjectPrereq', 'SpaceshipProject', 'LeaderPromotion', 'LeaderExperience', 'DontShowYields', 'ShowInPedia', 'MoveRate', 'UnitFlagIconOffset', 'PortraitIndex', 'IconAtlas', 'UnitFlagAtlas')
	SELECT	("UNIT_BOMBER_BLENHEIM_GREECE"), ("TXT_KEY_UNIT_BOMBER_BLENHEIM_GREECE"), "Civilopedia", "Strategy", "Help", "Requirements", "Combat", "RangedCombat", "Cost", "Moves", "Immobile", "Range", "BaseSightRange", "Class", "Special", "Capture", "CombatClass", "Domain", "CivilianAttackPriority", "DefaultUnitAI", "Food", "NoBadGoodies", "RivalTerritory", "MilitarySupport", "MilitaryProduction", "Pillage", "Found", "FoundAbroad", "CultureBombRadius", "GoldenAgeTurns", "IgnoreBuildingDefense", "PrereqResources", "Mechanized", "Suicide", "CaptureWhileEmbarked", "PrereqTech", "ObsoleteTech", "GoodyHutUpgradeUnitClass", "HurryCostModifier", "AdvancedStartCost", "MinAreaSize", "AirUnitCap", "NukeDamageLevel", "WorkRate", "NumFreeTechs", "RushBuilding", "BaseHurry", "HurryMultiplier", "BaseGold", "NumGoldPerEra", "SpreadReligion", "IsReligious", "CombatLimit", "RangeAttackOnlyInDomain", "RangeAttackIgnoreLOS", "RangedCombatLimit", "XPValueAttack", "XPValueDefense", "SpecialCargo", "DomainCargo", "Conscription", "ExtraMaintenanceCost", "NoMaintenance", "Unhappiness",
			("ART_DEF_UNIT_BOMBER_BLENHEIM_GREECE"), "UnitArtInfoCulturalVariation", "UnitArtInfoEraVariation", "ProjectPrereq", "SpaceshipProject", "LeaderPromotion", "LeaderExperience", "DontShowYields", "ShowInPedia", "MoveRate", "UnitFlagIconOffset", "PortraitIndex", "IconAtlas", "UnitFlagAtlas"
	FROM "Units" WHERE (Type = "UNIT_BOMBER");
INSERT INTO "Language_en_US" ( 'Tag', 'Text' )
	VALUES ( 'TXT_KEY_UNIT_BOMBER_BLENHEIM_GREECE', 'Bristol Blenheim' );
INSERT INTO "Unit_AITypes" ('UnitType', 'UnitAIType')
	SELECT ("UNIT_BOMBER_BLENHEIM_GREECE"), "UnitAIType"
	FROM "Unit_AITypes" WHERE (UnitType = "UNIT_BOMBER");
INSERT INTO "Unit_ClassUpgrades" ('UnitType', 'UnitClassType')
	SELECT ("UNIT_BOMBER_BLENHEIM_GREECE"), "UnitClassType"
	FROM "Unit_ClassUpgrades" WHERE (UnitType = "UNIT_BOMBER");
INSERT INTO "Civilization_UnitClassOverrides" ( 'CivilizationType', 'UnitClassType', 'UnitType' )
	VALUES ( 'CIVILIZATION_GREECE', 'UNITCLASS_BOMBER', 'UNIT_BOMBER_BLENHEIM_GREECE' );
INSERT INTO "Unit_Flavors" ('UnitType', 'FlavorType', 'Flavor')
	SELECT ("UNIT_BOMBER_BLENHEIM_GREECE"), "FlavorType", "Flavor"
	FROM "Unit_Flavors" WHERE (UnitType = "UNIT_BOMBER");
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	SELECT ("UNIT_BOMBER_BLENHEIM_GREECE"), "PromotionType"
	FROM "Unit_FreePromotions" WHERE (UnitType = "UNIT_BOMBER");
INSERT INTO "Unit_ResourceQuantityRequirements" ('UnitType', 'ResourceType', 'Cost')
	SELECT ("UNIT_BOMBER_BLENHEIM_GREECE"), "ResourceType", "Cost"
	FROM "Unit_ResourceQuantityRequirements" WHERE (UnitType = "UNIT_BOMBER");
-----------

-- Bomber He-111
INSERT INTO "Units" ('Type', 'Description', 'Civilopedia', 'Strategy', 'Help', 'Requirements', 'Combat', 'RangedCombat', 'Cost', 'Moves', 'Immobile', 'Range', 'BaseSightRange', 'Class', 'Special', 'Capture', 'CombatClass', 'Domain', 'CivilianAttackPriority', 'DefaultUnitAI', 'Food', 'NoBadGoodies', 'RivalTerritory', 'MilitarySupport', 'MilitaryProduction', 'Pillage', 'Found', 'FoundAbroad', 'CultureBombRadius', 'GoldenAgeTurns', 'IgnoreBuildingDefense', 'PrereqResources', 'Mechanized', 'Suicide', 'CaptureWhileEmbarked', 'PrereqTech', 'ObsoleteTech', 'GoodyHutUpgradeUnitClass', 'HurryCostModifier', 'AdvancedStartCost', 'MinAreaSize', 'AirUnitCap', 'NukeDamageLevel', 'WorkRate', 'NumFreeTechs', 'RushBuilding', 'BaseHurry', 'HurryMultiplier', 'BaseGold', 'NumGoldPerEra', 'SpreadReligion', 'IsReligious', 'CombatLimit', 'RangeAttackOnlyInDomain', 'RangeAttackIgnoreLOS', 'RangedCombatLimit', 'XPValueAttack', 'XPValueDefense', 'SpecialCargo', 'DomainCargo', 'Conscription', 'ExtraMaintenanceCost', 'NoMaintenance', 'Unhappiness', 'UnitArtInfo', 'UnitArtInfoCulturalVariation', 'UnitArtInfoEraVariation', 'ProjectPrereq', 'SpaceshipProject', 'LeaderPromotion', 'LeaderExperience', 'DontShowYields', 'ShowInPedia', 'MoveRate', 'UnitFlagIconOffset', 'PortraitIndex', 'IconAtlas', 'UnitFlagAtlas')
	SELECT	("UNIT_BOMBER_HE111"), ("TXT_KEY_UNIT_BOMBER_HE111"), "Civilopedia", "Strategy", "Help", "Requirements", "Combat", "RangedCombat", "Cost", "Moves", "Immobile", "Range", "BaseSightRange", "Class", "Special", "Capture", "CombatClass", "Domain", "CivilianAttackPriority", "DefaultUnitAI", "Food", "NoBadGoodies", "RivalTerritory", "MilitarySupport", "MilitaryProduction", "Pillage", "Found", "FoundAbroad", "CultureBombRadius", "GoldenAgeTurns", "IgnoreBuildingDefense", "PrereqResources", "Mechanized", "Suicide", "CaptureWhileEmbarked", "PrereqTech", "ObsoleteTech", "GoodyHutUpgradeUnitClass", "HurryCostModifier", "AdvancedStartCost", "MinAreaSize", "AirUnitCap", "NukeDamageLevel", "WorkRate", "NumFreeTechs", "RushBuilding", "BaseHurry", "HurryMultiplier", "BaseGold", "NumGoldPerEra", "SpreadReligion", "IsReligious", "CombatLimit", "RangeAttackOnlyInDomain", "RangeAttackIgnoreLOS", "RangedCombatLimit", "XPValueAttack", "XPValueDefense", "SpecialCargo", "DomainCargo", "Conscription", "ExtraMaintenanceCost", "NoMaintenance", "Unhappiness",
			("ART_DEF_UNIT_BOMBER_HE111"), "UnitArtInfoCulturalVariation", "UnitArtInfoEraVariation", "ProjectPrereq", "SpaceshipProject", "LeaderPromotion", "LeaderExperience", "DontShowYields", "ShowInPedia", "MoveRate", "UnitFlagIconOffset", "PortraitIndex", "IconAtlas", "UnitFlagAtlas"
	FROM "Units" WHERE (Type = "UNIT_BOMBER");
INSERT INTO "Language_en_US" ( 'Tag', 'Text' )
	VALUES ( 'TXT_KEY_UNIT_BOMBER_HE111', 'Heinkel He 111' );
INSERT INTO "Unit_AITypes" ('UnitType', 'UnitAIType')
	SELECT ("UNIT_BOMBER_HE111"), "UnitAIType"
	FROM "Unit_AITypes" WHERE (UnitType = "UNIT_BOMBER");
INSERT INTO "Unit_ClassUpgrades" ('UnitType', 'UnitClassType')
	SELECT ("UNIT_BOMBER_HE111"), "UnitClassType"
	FROM "Unit_ClassUpgrades" WHERE (UnitType = "UNIT_BOMBER");
INSERT INTO "Civilization_UnitClassOverrides" ( 'CivilizationType', 'UnitClassType', 'UnitType' )
	VALUES ( 'CIVILIZATION_GERMANY', 'UNITCLASS_BOMBER', 'UNIT_BOMBER_HE111' );
INSERT INTO "Unit_Flavors" ('UnitType', 'FlavorType', 'Flavor')
	SELECT ("UNIT_BOMBER_HE111"), "FlavorType", "Flavor"
	FROM "Unit_Flavors" WHERE (UnitType = "UNIT_BOMBER");
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	SELECT ("UNIT_BOMBER_HE111"), "PromotionType"
	FROM "Unit_FreePromotions" WHERE (UnitType = "UNIT_BOMBER");
INSERT INTO "Unit_ResourceQuantityRequirements" ('UnitType', 'ResourceType', 'Cost')
	SELECT ("UNIT_BOMBER_HE111"), "ResourceType", "Cost"
	FROM "Unit_ResourceQuantityRequirements" WHERE (UnitType = "UNIT_BOMBER");
-----------

-- Bomber Ju-88 Spain
INSERT INTO "Units" ('Type', 'Description', 'Civilopedia', 'Strategy', 'Help', 'Requirements', 'Combat', 'RangedCombat', 'Cost', 'Moves', 'Immobile', 'Range', 'BaseSightRange', 'Class', 'Special', 'Capture', 'CombatClass', 'Domain', 'CivilianAttackPriority', 'DefaultUnitAI', 'Food', 'NoBadGoodies', 'RivalTerritory', 'MilitarySupport', 'MilitaryProduction', 'Pillage', 'Found', 'FoundAbroad', 'CultureBombRadius', 'GoldenAgeTurns', 'IgnoreBuildingDefense', 'PrereqResources', 'Mechanized', 'Suicide', 'CaptureWhileEmbarked', 'PrereqTech', 'ObsoleteTech', 'GoodyHutUpgradeUnitClass', 'HurryCostModifier', 'AdvancedStartCost', 'MinAreaSize', 'AirUnitCap', 'NukeDamageLevel', 'WorkRate', 'NumFreeTechs', 'RushBuilding', 'BaseHurry', 'HurryMultiplier', 'BaseGold', 'NumGoldPerEra', 'SpreadReligion', 'IsReligious', 'CombatLimit', 'RangeAttackOnlyInDomain', 'RangeAttackIgnoreLOS', 'RangedCombatLimit', 'XPValueAttack', 'XPValueDefense', 'SpecialCargo', 'DomainCargo', 'Conscription', 'ExtraMaintenanceCost', 'NoMaintenance', 'Unhappiness', 'UnitArtInfo', 'UnitArtInfoCulturalVariation', 'UnitArtInfoEraVariation', 'ProjectPrereq', 'SpaceshipProject', 'LeaderPromotion', 'LeaderExperience', 'DontShowYields', 'ShowInPedia', 'MoveRate', 'UnitFlagIconOffset', 'PortraitIndex', 'IconAtlas', 'UnitFlagAtlas')
	SELECT	("UNIT_BOMBER_JU88_SPAIN"), ("TXT_KEY_UNIT_BOMBER_JU88_SPAIN"), "Civilopedia", "Strategy", "Help", "Requirements", "Combat", "RangedCombat", "Cost", "Moves", "Immobile", "Range", "BaseSightRange", "Class", "Special", "Capture", "CombatClass", "Domain", "CivilianAttackPriority", "DefaultUnitAI", "Food", "NoBadGoodies", "RivalTerritory", "MilitarySupport", "MilitaryProduction", "Pillage", "Found", "FoundAbroad", "CultureBombRadius", "GoldenAgeTurns", "IgnoreBuildingDefense", "PrereqResources", "Mechanized", "Suicide", "CaptureWhileEmbarked", "PrereqTech", "ObsoleteTech", "GoodyHutUpgradeUnitClass", "HurryCostModifier", "AdvancedStartCost", "MinAreaSize", "AirUnitCap", "NukeDamageLevel", "WorkRate", "NumFreeTechs", "RushBuilding", "BaseHurry", "HurryMultiplier", "BaseGold", "NumGoldPerEra", "SpreadReligion", "IsReligious", "CombatLimit", "RangeAttackOnlyInDomain", "RangeAttackIgnoreLOS", "RangedCombatLimit", "XPValueAttack", "XPValueDefense", "SpecialCargo", "DomainCargo", "Conscription", "ExtraMaintenanceCost", "NoMaintenance", "Unhappiness",
			("ART_DEF_UNIT_BOMBER_JU88_SPAIN"), "UnitArtInfoCulturalVariation", "UnitArtInfoEraVariation", "ProjectPrereq", "SpaceshipProject", "LeaderPromotion", "LeaderExperience", "DontShowYields", "ShowInPedia", "MoveRate", "UnitFlagIconOffset", "PortraitIndex", "IconAtlas", "UnitFlagAtlas"
	FROM "Units" WHERE (Type = "UNIT_BOMBER");
INSERT INTO "Language_en_US" ( 'Tag', 'Text' )
	VALUES ( 'TXT_KEY_UNIT_BOMBER_JU88_SPAIN', 'Junkers Ju 88' );
INSERT INTO "Unit_AITypes" ('UnitType', 'UnitAIType')
	SELECT ("UNIT_BOMBER_JU88_SPAIN"), "UnitAIType"
	FROM "Unit_AITypes" WHERE (UnitType = "UNIT_BOMBER");
INSERT INTO "Unit_ClassUpgrades" ('UnitType', 'UnitClassType')
	SELECT ("UNIT_BOMBER_JU88_SPAIN"), "UnitClassType"
	FROM "Unit_ClassUpgrades" WHERE (UnitType = "UNIT_BOMBER");
--INSERT INTO "Civilization_UnitClassOverrides" ( 'CivilizationType', 'UnitClassType', 'UnitType' )
--	VALUES ( 'CIVILIZATION_SPAIN', 'UNITCLASS_BOMBER', 'UNIT_BOMBER_JU88_SPAIN' );
INSERT INTO "Unit_Flavors" ('UnitType', 'FlavorType', 'Flavor')
	SELECT ("UNIT_BOMBER_JU88_SPAIN"), "FlavorType", "Flavor"
	FROM "Unit_Flavors" WHERE (UnitType = "UNIT_BOMBER");
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	SELECT ("UNIT_BOMBER_JU88_SPAIN"), "PromotionType"
	FROM "Unit_FreePromotions" WHERE (UnitType = "UNIT_BOMBER");
INSERT INTO "Unit_ResourceQuantityRequirements" ('UnitType', 'ResourceType', 'Cost')
	SELECT ("UNIT_BOMBER_JU88_SPAIN"), "ResourceType", "Cost"
	FROM "Unit_ResourceQuantityRequirements" WHERE (UnitType = "UNIT_BOMBER");
-----------

-- Bomber SM.84
INSERT INTO "Units" ('Type', 'Description', 'Civilopedia', 'Strategy', 'Help', 'Requirements', 'Combat', 'RangedCombat', 'Cost', 'Moves', 'Immobile', 'Range', 'BaseSightRange', 'Class', 'Special', 'Capture', 'CombatClass', 'Domain', 'CivilianAttackPriority', 'DefaultUnitAI', 'Food', 'NoBadGoodies', 'RivalTerritory', 'MilitarySupport', 'MilitaryProduction', 'Pillage', 'Found', 'FoundAbroad', 'CultureBombRadius', 'GoldenAgeTurns', 'IgnoreBuildingDefense', 'PrereqResources', 'Mechanized', 'Suicide', 'CaptureWhileEmbarked', 'PrereqTech', 'ObsoleteTech', 'GoodyHutUpgradeUnitClass', 'HurryCostModifier', 'AdvancedStartCost', 'MinAreaSize', 'AirUnitCap', 'NukeDamageLevel', 'WorkRate', 'NumFreeTechs', 'RushBuilding', 'BaseHurry', 'HurryMultiplier', 'BaseGold', 'NumGoldPerEra', 'SpreadReligion', 'IsReligious', 'CombatLimit', 'RangeAttackOnlyInDomain', 'RangeAttackIgnoreLOS', 'RangedCombatLimit', 'XPValueAttack', 'XPValueDefense', 'SpecialCargo', 'DomainCargo', 'Conscription', 'ExtraMaintenanceCost', 'NoMaintenance', 'Unhappiness', 'UnitArtInfo', 'UnitArtInfoCulturalVariation', 'UnitArtInfoEraVariation', 'ProjectPrereq', 'SpaceshipProject', 'LeaderPromotion', 'LeaderExperience', 'DontShowYields', 'ShowInPedia', 'MoveRate', 'UnitFlagIconOffset', 'PortraitIndex', 'IconAtlas', 'UnitFlagAtlas')
	SELECT	("UNIT_BOMBER_SM84"), ("TXT_KEY_UNIT_BOMBER_SM84"), "Civilopedia", "Strategy", "Help", "Requirements", "Combat", "RangedCombat", "Cost", "Moves", "Immobile", "Range", "BaseSightRange", "Class", "Special", "Capture", "CombatClass", "Domain", "CivilianAttackPriority", "DefaultUnitAI", "Food", "NoBadGoodies", "RivalTerritory", "MilitarySupport", "MilitaryProduction", "Pillage", "Found", "FoundAbroad", "CultureBombRadius", "GoldenAgeTurns", "IgnoreBuildingDefense", "PrereqResources", "Mechanized", "Suicide", "CaptureWhileEmbarked", "PrereqTech", "ObsoleteTech", "GoodyHutUpgradeUnitClass", "HurryCostModifier", "AdvancedStartCost", "MinAreaSize", "AirUnitCap", "NukeDamageLevel", "WorkRate", "NumFreeTechs", "RushBuilding", "BaseHurry", "HurryMultiplier", "BaseGold", "NumGoldPerEra", "SpreadReligion", "IsReligious", "CombatLimit", "RangeAttackOnlyInDomain", "RangeAttackIgnoreLOS", "RangedCombatLimit", "XPValueAttack", "XPValueDefense", "SpecialCargo", "DomainCargo", "Conscription", "ExtraMaintenanceCost", "NoMaintenance", "Unhappiness",
			("ART_DEF_UNIT_BOMBER_SM84"), "UnitArtInfoCulturalVariation", "UnitArtInfoEraVariation", ("PROJECT_SM84"), "SpaceshipProject", "LeaderPromotion", "LeaderExperience", "DontShowYields", "ShowInPedia", "MoveRate", "UnitFlagIconOffset", "PortraitIndex", "IconAtlas", "UnitFlagAtlas"
	FROM "Units" WHERE (Type = "UNIT_BOMBER");
INSERT INTO "Language_en_US" ( 'Tag', 'Text' )
	VALUES ( 'TXT_KEY_UNIT_BOMBER_SM84', 'Savoia-Marchetti SM.84' );
INSERT INTO "Unit_AITypes" ('UnitType', 'UnitAIType')
	SELECT ("UNIT_BOMBER_SM84"), "UnitAIType"
	FROM "Unit_AITypes" WHERE (UnitType = "UNIT_BOMBER");
INSERT INTO "Unit_ClassUpgrades" ('UnitType', 'UnitClassType')
	SELECT ("UNIT_BOMBER_SM84"), "UnitClassType"
	FROM "Unit_ClassUpgrades" WHERE (UnitType = "UNIT_BOMBER");
INSERT INTO "Civilization_UnitClassOverrides" ( 'CivilizationType', 'UnitClassType', 'UnitType' )
	VALUES ( 'CIVILIZATION_ROME', 'UNITCLASS_BOMBER', 'UNIT_BOMBER_SM84' );
INSERT INTO "Unit_Flavors" ('UnitType', 'FlavorType', 'Flavor')
	SELECT ("UNIT_BOMBER_SM84"), "FlavorType", "Flavor"
	FROM "Unit_Flavors" WHERE (UnitType = "UNIT_BOMBER");
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	SELECT ("UNIT_BOMBER_SM84"), "PromotionType"
	FROM "Unit_FreePromotions" WHERE (UnitType = "UNIT_BOMBER");
INSERT INTO "Unit_ResourceQuantityRequirements" ('UnitType', 'ResourceType', 'Cost')
	SELECT ("UNIT_BOMBER_SM84"), "ResourceType", "Cost"
	FROM "Unit_ResourceQuantityRequirements" WHERE (UnitType = "UNIT_BOMBER");
-----------

-- Bomber Wellington
INSERT INTO "Units" ('Type', 'Description', 'Civilopedia', 'Strategy', 'Help', 'Requirements', 'Combat', 'RangedCombat', 'Cost', 'Moves', 'Immobile', 'Range', 'BaseSightRange', 'Class', 'Special', 'Capture', 'CombatClass', 'Domain', 'CivilianAttackPriority', 'DefaultUnitAI', 'Food', 'NoBadGoodies', 'RivalTerritory', 'MilitarySupport', 'MilitaryProduction', 'Pillage', 'Found', 'FoundAbroad', 'CultureBombRadius', 'GoldenAgeTurns', 'IgnoreBuildingDefense', 'PrereqResources', 'Mechanized', 'Suicide', 'CaptureWhileEmbarked', 'PrereqTech', 'ObsoleteTech', 'GoodyHutUpgradeUnitClass', 'HurryCostModifier', 'AdvancedStartCost', 'MinAreaSize', 'AirUnitCap', 'NukeDamageLevel', 'WorkRate', 'NumFreeTechs', 'RushBuilding', 'BaseHurry', 'HurryMultiplier', 'BaseGold', 'NumGoldPerEra', 'SpreadReligion', 'IsReligious', 'CombatLimit', 'RangeAttackOnlyInDomain', 'RangeAttackIgnoreLOS', 'RangedCombatLimit', 'XPValueAttack', 'XPValueDefense', 'SpecialCargo', 'DomainCargo', 'Conscription', 'ExtraMaintenanceCost', 'NoMaintenance', 'Unhappiness', 'UnitArtInfo', 'UnitArtInfoCulturalVariation', 'UnitArtInfoEraVariation', 'ProjectPrereq', 'SpaceshipProject', 'LeaderPromotion', 'LeaderExperience', 'DontShowYields', 'ShowInPedia', 'MoveRate', 'UnitFlagIconOffset', 'PortraitIndex', 'IconAtlas', 'UnitFlagAtlas')
	SELECT	("UNIT_BOMBER_WELLINGTON"), ("TXT_KEY_UNIT_BOMBER_WELLINGTON"), "Civilopedia", "Strategy", "Help", "Requirements", "Combat", "RangedCombat", "Cost", "Moves", "Immobile", "Range", "BaseSightRange", "Class", "Special", "Capture", "CombatClass", "Domain", "CivilianAttackPriority", "DefaultUnitAI", "Food", "NoBadGoodies", "RivalTerritory", "MilitarySupport", "MilitaryProduction", "Pillage", "Found", "FoundAbroad", "CultureBombRadius", "GoldenAgeTurns", "IgnoreBuildingDefense", "PrereqResources", "Mechanized", "Suicide", "CaptureWhileEmbarked", "PrereqTech", "ObsoleteTech", "GoodyHutUpgradeUnitClass", "HurryCostModifier", "AdvancedStartCost", "MinAreaSize", "AirUnitCap", "NukeDamageLevel", "WorkRate", "NumFreeTechs", "RushBuilding", "BaseHurry", "HurryMultiplier", "BaseGold", "NumGoldPerEra", "SpreadReligion", "IsReligious", "CombatLimit", "RangeAttackOnlyInDomain", "RangeAttackIgnoreLOS", "RangedCombatLimit", "XPValueAttack", "XPValueDefense", "SpecialCargo", "DomainCargo", "Conscription", "ExtraMaintenanceCost", "NoMaintenance", "Unhappiness",
			("ART_DEF_UNIT_BOMBER_WELLINGTON"), "UnitArtInfoCulturalVariation", "UnitArtInfoEraVariation", "ProjectPrereq", "SpaceshipProject", "LeaderPromotion", "LeaderExperience", "DontShowYields", "ShowInPedia", "MoveRate", "UnitFlagIconOffset", "PortraitIndex", "IconAtlas", "UnitFlagAtlas"
	FROM "Units" WHERE (Type = "UNIT_BOMBER");
INSERT INTO "Language_en_US" ( 'Tag', 'Text' )
	VALUES ( 'TXT_KEY_UNIT_BOMBER_WELLINGTON', 'Vickers Wellington' );
INSERT INTO "Unit_AITypes" ('UnitType', 'UnitAIType')
	SELECT ("UNIT_BOMBER_WELLINGTON"), "UnitAIType"
	FROM "Unit_AITypes" WHERE (UnitType = "UNIT_BOMBER");
INSERT INTO "Unit_ClassUpgrades" ('UnitType', 'UnitClassType')
	SELECT ("UNIT_BOMBER_WELLINGTON"), "UnitClassType"
	FROM "Unit_ClassUpgrades" WHERE (UnitType = "UNIT_BOMBER");
INSERT INTO "Civilization_UnitClassOverrides" ( 'CivilizationType', 'UnitClassType', 'UnitType' )
	VALUES ( 'CIVILIZATION_ENGLAND', 'UNITCLASS_BOMBER', 'UNIT_BOMBER_WELLINGTON' );
INSERT INTO "Unit_Flavors" ('UnitType', 'FlavorType', 'Flavor')
	SELECT ("UNIT_BOMBER_WELLINGTON"), "FlavorType", "Flavor"
	FROM "Unit_Flavors" WHERE (UnitType = "UNIT_BOMBER");
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	SELECT ("UNIT_BOMBER_WELLINGTON"), "PromotionType"
	FROM "Unit_FreePromotions" WHERE (UnitType = "UNIT_BOMBER");
INSERT INTO "Unit_ResourceQuantityRequirements" ('UnitType', 'ResourceType', 'Cost')
	SELECT ("UNIT_BOMBER_WELLINGTON"), "ResourceType", "Cost"
	FROM "Unit_ResourceQuantityRequirements" WHERE (UnitType = "UNIT_BOMBER");
-----------

-- Bomber Il-4
INSERT INTO "Units" ('Type', 'Description', 'Civilopedia', 'Strategy', 'Help', 'Requirements', 'Combat', 'RangedCombat', 'Cost', 'Moves', 'Immobile', 'Range', 'BaseSightRange', 'Class', 'Special', 'Capture', 'CombatClass', 'Domain', 'CivilianAttackPriority', 'DefaultUnitAI', 'Food', 'NoBadGoodies', 'RivalTerritory', 'MilitarySupport', 'MilitaryProduction', 'Pillage', 'Found', 'FoundAbroad', 'CultureBombRadius', 'GoldenAgeTurns', 'IgnoreBuildingDefense', 'PrereqResources', 'Mechanized', 'Suicide', 'CaptureWhileEmbarked', 'PrereqTech', 'ObsoleteTech', 'GoodyHutUpgradeUnitClass', 'HurryCostModifier', 'AdvancedStartCost', 'MinAreaSize', 'AirUnitCap', 'NukeDamageLevel', 'WorkRate', 'NumFreeTechs', 'RushBuilding', 'BaseHurry', 'HurryMultiplier', 'BaseGold', 'NumGoldPerEra', 'SpreadReligion', 'IsReligious', 'CombatLimit', 'RangeAttackOnlyInDomain', 'RangeAttackIgnoreLOS', 'RangedCombatLimit', 'XPValueAttack', 'XPValueDefense', 'SpecialCargo', 'DomainCargo', 'Conscription', 'ExtraMaintenanceCost', 'NoMaintenance', 'Unhappiness', 'UnitArtInfo', 'UnitArtInfoCulturalVariation', 'UnitArtInfoEraVariation', 'ProjectPrereq', 'SpaceshipProject', 'LeaderPromotion', 'LeaderExperience', 'DontShowYields', 'ShowInPedia', 'MoveRate', 'UnitFlagIconOffset', 'PortraitIndex', 'IconAtlas', 'UnitFlagAtlas')
	SELECT	("UNIT_BOMBER_IL4"), ("TXT_KEY_UNIT_BOMBER_IL4"), "Civilopedia", "Strategy", "Help", "Requirements", "Combat", "RangedCombat", "Cost", "Moves", "Immobile", "Range", "BaseSightRange", "Class", "Special", "Capture", "CombatClass", "Domain", "CivilianAttackPriority", "DefaultUnitAI", "Food", "NoBadGoodies", "RivalTerritory", "MilitarySupport", "MilitaryProduction", "Pillage", "Found", "FoundAbroad", "CultureBombRadius", "GoldenAgeTurns", "IgnoreBuildingDefense", "PrereqResources", "Mechanized", "Suicide", "CaptureWhileEmbarked", "PrereqTech", "ObsoleteTech", "GoodyHutUpgradeUnitClass", "HurryCostModifier", "AdvancedStartCost", "MinAreaSize", "AirUnitCap", "NukeDamageLevel", "WorkRate", "NumFreeTechs", "RushBuilding", "BaseHurry", "HurryMultiplier", "BaseGold", "NumGoldPerEra", "SpreadReligion", "IsReligious", "CombatLimit", "RangeAttackOnlyInDomain", "RangeAttackIgnoreLOS", "RangedCombatLimit", "XPValueAttack", "XPValueDefense", "SpecialCargo", "DomainCargo", "Conscription", "ExtraMaintenanceCost", "NoMaintenance", "Unhappiness",
			("ART_DEF_UNIT_BOMBER_IL4"), "UnitArtInfoCulturalVariation", "UnitArtInfoEraVariation", ("PROJECT_IL4"), "SpaceshipProject", "LeaderPromotion", "LeaderExperience", "DontShowYields", "ShowInPedia", "MoveRate", "UnitFlagIconOffset", "PortraitIndex", "IconAtlas", "UnitFlagAtlas"
	FROM "Units" WHERE (Type = "UNIT_BOMBER");
INSERT INTO "Language_en_US" ( 'Tag', 'Text' )
	VALUES ( 'TXT_KEY_UNIT_BOMBER_IL4', 'Il-4' );
INSERT INTO "Unit_AITypes" ('UnitType', 'UnitAIType')
	SELECT ("UNIT_BOMBER_IL4"), "UnitAIType"
	FROM "Unit_AITypes" WHERE (UnitType = "UNIT_BOMBER");
INSERT INTO "Unit_ClassUpgrades" ('UnitType', 'UnitClassType')
	SELECT ("UNIT_BOMBER_IL4"), "UnitClassType"
	FROM "Unit_ClassUpgrades" WHERE (UnitType = "UNIT_BOMBER");
INSERT INTO "Civilization_UnitClassOverrides" ( 'CivilizationType', 'UnitClassType', 'UnitType' )
	VALUES ( 'CIVILIZATION_RUSSIA', 'UNITCLASS_BOMBER', 'UNIT_BOMBER_IL4' );
INSERT INTO "Unit_Flavors" ('UnitType', 'FlavorType', 'Flavor')
	SELECT ("UNIT_BOMBER_IL4"), "FlavorType", "Flavor"
	FROM "Unit_Flavors" WHERE (UnitType = "UNIT_BOMBER");
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	SELECT ("UNIT_BOMBER_IL4"), "PromotionType"
	FROM "Unit_FreePromotions" WHERE (UnitType = "UNIT_BOMBER");
INSERT INTO "Unit_ResourceQuantityRequirements" ('UnitType', 'ResourceType', 'Cost')
	SELECT ("UNIT_BOMBER_IL4"), "ResourceType", "Cost"
	FROM "Unit_ResourceQuantityRequirements" WHERE (UnitType = "UNIT_BOMBER");
-----------

-- Bomber Ki-21 Sally
INSERT INTO "Units" ('Type', 'Description', 'Civilopedia', 'Strategy', 'Help', 'Requirements', 'Combat', 'RangedCombat', 'Cost', 'Moves', 'Immobile', 'Range', 'BaseSightRange', 'Class', 'Special', 'Capture', 'CombatClass', 'Domain', 'CivilianAttackPriority', 'DefaultUnitAI', 'Food', 'NoBadGoodies', 'RivalTerritory', 'MilitarySupport', 'MilitaryProduction', 'Pillage', 'Found', 'FoundAbroad', 'CultureBombRadius', 'GoldenAgeTurns', 'IgnoreBuildingDefense', 'PrereqResources', 'Mechanized', 'Suicide', 'CaptureWhileEmbarked', 'PrereqTech', 'ObsoleteTech', 'GoodyHutUpgradeUnitClass', 'HurryCostModifier', 'AdvancedStartCost', 'MinAreaSize', 'AirUnitCap', 'NukeDamageLevel', 'WorkRate', 'NumFreeTechs', 'RushBuilding', 'BaseHurry', 'HurryMultiplier', 'BaseGold', 'NumGoldPerEra', 'SpreadReligion', 'IsReligious', 'CombatLimit', 'RangeAttackOnlyInDomain', 'RangeAttackIgnoreLOS', 'RangedCombatLimit', 'XPValueAttack', 'XPValueDefense', 'SpecialCargo', 'DomainCargo', 'Conscription', 'ExtraMaintenanceCost', 'NoMaintenance', 'Unhappiness', 'UnitArtInfo', 'UnitArtInfoCulturalVariation', 'UnitArtInfoEraVariation', 'ProjectPrereq', 'SpaceshipProject', 'LeaderPromotion', 'LeaderExperience', 'DontShowYields', 'ShowInPedia', 'MoveRate', 'UnitFlagIconOffset', 'PortraitIndex', 'IconAtlas', 'UnitFlagAtlas')
	SELECT	("UNIT_BOMBER_KI21"), ("TXT_KEY_UNIT_BOMBER_KI21"), "Civilopedia", "Strategy", "Help", "Requirements", "Combat", "RangedCombat", "Cost", "Moves", "Immobile", "Range", "BaseSightRange", "Class", "Special", "Capture", "CombatClass", "Domain", "CivilianAttackPriority", "DefaultUnitAI", "Food", "NoBadGoodies", "RivalTerritory", "MilitarySupport", "MilitaryProduction", "Pillage", "Found", "FoundAbroad", "CultureBombRadius", "GoldenAgeTurns", "IgnoreBuildingDefense", "PrereqResources", "Mechanized", "Suicide", "CaptureWhileEmbarked", "PrereqTech", "ObsoleteTech", "GoodyHutUpgradeUnitClass", "HurryCostModifier", "AdvancedStartCost", "MinAreaSize", "AirUnitCap", "NukeDamageLevel", "WorkRate", "NumFreeTechs", "RushBuilding", "BaseHurry", "HurryMultiplier", "BaseGold", "NumGoldPerEra", "SpreadReligion", "IsReligious", "CombatLimit", "RangeAttackOnlyInDomain", "RangeAttackIgnoreLOS", "RangedCombatLimit", "XPValueAttack", "XPValueDefense", "SpecialCargo", "DomainCargo", "Conscription", "ExtraMaintenanceCost", "NoMaintenance", "Unhappiness",
			("ART_DEF_UNIT_BOMBER_KI21"), "UnitArtInfoCulturalVariation", "UnitArtInfoEraVariation", "ProjectPrereq", "SpaceshipProject", "LeaderPromotion", "LeaderExperience", "DontShowYields", "ShowInPedia", "MoveRate", "UnitFlagIconOffset", "PortraitIndex", "IconAtlas", "UnitFlagAtlas"
	FROM "Units" WHERE (Type = "UNIT_BOMBER");
INSERT INTO "Language_en_US" ( 'Tag', 'Text' )
	VALUES ( 'TXT_KEY_UNIT_BOMBER_KI21', 'Ki-21 Sally' );
INSERT INTO "Unit_AITypes" ('UnitType', 'UnitAIType')
	SELECT ("UNIT_BOMBER_KI21"), "UnitAIType"
	FROM "Unit_AITypes" WHERE (UnitType = "UNIT_BOMBER");
INSERT INTO "Unit_ClassUpgrades" ('UnitType', 'UnitClassType')
	SELECT ("UNIT_BOMBER_KI21"), "UnitClassType"
	FROM "Unit_ClassUpgrades" WHERE (UnitType = "UNIT_BOMBER");
INSERT INTO "Civilization_UnitClassOverrides" ( 'CivilizationType', 'UnitClassType', 'UnitType' )
	VALUES ( 'CIVILIZATION_JAPAN', 'UNITCLASS_BOMBER', 'UNIT_BOMBER_KI21' );
INSERT INTO "Unit_Flavors" ('UnitType', 'FlavorType', 'Flavor')
	SELECT ("UNIT_BOMBER_KI21"), "FlavorType", "Flavor"
	FROM "Unit_Flavors" WHERE (UnitType = "UNIT_BOMBER");
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	SELECT ("UNIT_BOMBER_KI21"), "PromotionType"
	FROM "Unit_FreePromotions" WHERE (UnitType = "UNIT_BOMBER");
INSERT INTO "Unit_ResourceQuantityRequirements" ('UnitType', 'ResourceType', 'Cost')
	SELECT ("UNIT_BOMBER_KI21"), "ResourceType", "Cost"
	FROM "Unit_ResourceQuantityRequirements" WHERE (UnitType = "UNIT_BOMBER");
-----------

--------------------------------------------------------------
-- HEAVY BOMBERS
--------------------------------------------------------------

-- Tupolev TB-3
INSERT INTO "Units" ('Type', 'Description', 'Civilopedia', 'Strategy', 'Help', 'Requirements', 'Combat', 'RangedCombat', 'Cost', 'Moves', 'Immobile', 'Range', 'BaseSightRange', 'Class', 'Special', 'Capture', 'CombatClass', 'Domain', 'CivilianAttackPriority', 'DefaultUnitAI', 'Food', 'NoBadGoodies', 'RivalTerritory', 'MilitarySupport', 'MilitaryProduction', 'Pillage', 'Found', 'FoundAbroad', 'CultureBombRadius', 'GoldenAgeTurns', 'IgnoreBuildingDefense', 'PrereqResources', 'Mechanized', 'Suicide', 'CaptureWhileEmbarked', 'PrereqTech', 'ObsoleteTech', 'GoodyHutUpgradeUnitClass', 'HurryCostModifier', 'AdvancedStartCost', 'MinAreaSize', 'AirUnitCap', 'NukeDamageLevel', 'WorkRate', 'NumFreeTechs', 'RushBuilding', 'BaseHurry', 'HurryMultiplier', 'BaseGold', 'NumGoldPerEra', 'SpreadReligion', 'IsReligious', 'CombatLimit', 'RangeAttackOnlyInDomain', 'RangeAttackIgnoreLOS', 'RangedCombatLimit', 'XPValueAttack', 'XPValueDefense', 'SpecialCargo', 'DomainCargo', 'Conscription', 'ExtraMaintenanceCost', 'NoMaintenance', 'Unhappiness', 'UnitArtInfo', 'UnitArtInfoCulturalVariation', 'UnitArtInfoEraVariation', 'ProjectPrereq', 'SpaceshipProject', 'LeaderPromotion', 'LeaderExperience', 'DontShowYields', 'ShowInPedia', 'MoveRate', 'UnitFlagIconOffset', 'PortraitIndex', 'IconAtlas', 'UnitFlagAtlas')
	SELECT	("UNIT_BOMBER_TB3"), ("TXT_KEY_UNIT_BOMBER_TB3"), "Civilopedia", "Strategy", "Help", "Requirements", "Combat", "RangedCombat", "Cost", "Moves", "Immobile", "Range", "BaseSightRange", "Class", "Special", "Capture", "CombatClass", "Domain", "CivilianAttackPriority", "DefaultUnitAI", "Food", "NoBadGoodies", "RivalTerritory", "MilitarySupport", "MilitaryProduction", "Pillage", "Found", "FoundAbroad", "CultureBombRadius", "GoldenAgeTurns", "IgnoreBuildingDefense", "PrereqResources", "Mechanized", "Suicide", "CaptureWhileEmbarked", "PrereqTech", "ObsoleteTech", "GoodyHutUpgradeUnitClass", "HurryCostModifier", "AdvancedStartCost", "MinAreaSize", "AirUnitCap", "NukeDamageLevel", "WorkRate", "NumFreeTechs", "RushBuilding", "BaseHurry", "HurryMultiplier", "BaseGold", "NumGoldPerEra", "SpreadReligion", "IsReligious", "CombatLimit", "RangeAttackOnlyInDomain", "RangeAttackIgnoreLOS", "RangedCombatLimit", "XPValueAttack", "XPValueDefense", "SpecialCargo", "DomainCargo", "Conscription", "ExtraMaintenanceCost", "NoMaintenance", "Unhappiness",
			("ART_DEF_UNIT_BOMBER_TB3"), "UnitArtInfoCulturalVariation", "UnitArtInfoEraVariation", "ProjectPrereq", "SpaceshipProject", "LeaderPromotion", "LeaderExperience", "DontShowYields", "ShowInPedia", "MoveRate", "UnitFlagIconOffset", "PortraitIndex", "IconAtlas", "UnitFlagAtlas"
	FROM "Units" WHERE (Type = "UNIT_OLD_HEAVY_BOMBER");
INSERT INTO "Language_en_US" ( 'Tag', 'Text' )
	VALUES ( 'TXT_KEY_UNIT_BOMBER_TB3', 'Tupolev TB-3' );
INSERT INTO "Unit_AITypes" ('UnitType', 'UnitAIType')
	SELECT ("UNIT_BOMBER_TB3"), "UnitAIType"
	FROM "Unit_AITypes" WHERE (UnitType = "UNIT_OLD_HEAVY_BOMBER");
INSERT INTO "Unit_ClassUpgrades" ('UnitType', 'UnitClassType')
	SELECT ("UNIT_BOMBER_TB3"), "UnitClassType"
	FROM "Unit_ClassUpgrades" WHERE (UnitType = "UNIT_OLD_HEAVY_BOMBER");
INSERT INTO "Civilization_UnitClassOverrides" ( 'CivilizationType', 'UnitClassType', 'UnitType' )
	VALUES ( 'CIVILIZATION_RUSSIA', 'UNITCLASS_OLD_HEAVY_BOMBER', 'UNIT_BOMBER_TB3' );
INSERT INTO "Unit_Flavors" ('UnitType', 'FlavorType', 'Flavor')
	SELECT ("UNIT_BOMBER_TB3"), "FlavorType", "Flavor"
	FROM "Unit_Flavors" WHERE (UnitType = "UNIT_OLD_HEAVY_BOMBER");
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	SELECT ("UNIT_BOMBER_TB3"), "PromotionType"
	FROM "Unit_FreePromotions" WHERE (UnitType = "UNIT_OLD_HEAVY_BOMBER");
INSERT INTO "Unit_ResourceQuantityRequirements" ('UnitType', 'ResourceType', 'Cost')
	SELECT ("UNIT_BOMBER_TB3"), "ResourceType", "Cost"
	FROM "Unit_ResourceQuantityRequirements" WHERE (UnitType = "UNIT_OLD_HEAVY_BOMBER");
-----------

-- Petlyakov Pe-8
INSERT INTO "Units" ('Type', 'Description', 'Civilopedia', 'Strategy', 'Help', 'Requirements', 'Combat', 'RangedCombat', 'Cost', 'Moves', 'Immobile', 'Range', 'BaseSightRange', 'Class', 'Special', 'Capture', 'CombatClass', 'Domain', 'CivilianAttackPriority', 'DefaultUnitAI', 'Food', 'NoBadGoodies', 'RivalTerritory', 'MilitarySupport', 'MilitaryProduction', 'Pillage', 'Found', 'FoundAbroad', 'CultureBombRadius', 'GoldenAgeTurns', 'IgnoreBuildingDefense', 'PrereqResources', 'Mechanized', 'Suicide', 'CaptureWhileEmbarked', 'PrereqTech', 'ObsoleteTech', 'GoodyHutUpgradeUnitClass', 'HurryCostModifier', 'AdvancedStartCost', 'MinAreaSize', 'AirUnitCap', 'NukeDamageLevel', 'WorkRate', 'NumFreeTechs', 'RushBuilding', 'BaseHurry', 'HurryMultiplier', 'BaseGold', 'NumGoldPerEra', 'SpreadReligion', 'IsReligious', 'CombatLimit', 'RangeAttackOnlyInDomain', 'RangeAttackIgnoreLOS', 'RangedCombatLimit', 'XPValueAttack', 'XPValueDefense', 'SpecialCargo', 'DomainCargo', 'Conscription', 'ExtraMaintenanceCost', 'NoMaintenance', 'Unhappiness', 'UnitArtInfo', 'UnitArtInfoCulturalVariation', 'UnitArtInfoEraVariation', 'ProjectPrereq', 'SpaceshipProject', 'LeaderPromotion', 'LeaderExperience', 'DontShowYields', 'ShowInPedia', 'MoveRate', 'UnitFlagIconOffset', 'PortraitIndex', 'IconAtlas', 'UnitFlagAtlas')
	SELECT	("UNIT_BOMBER_PE8"), ("TXT_KEY_UNIT_BOMBER_PE8"), "Civilopedia", "Strategy", "Help", "Requirements", "Combat", "RangedCombat", "Cost", "Moves", "Immobile", "Range", "BaseSightRange", "Class", "Special", "Capture", "CombatClass", "Domain", "CivilianAttackPriority", "DefaultUnitAI", "Food", "NoBadGoodies", "RivalTerritory", "MilitarySupport", "MilitaryProduction", "Pillage", "Found", "FoundAbroad", "CultureBombRadius", "GoldenAgeTurns", "IgnoreBuildingDefense", "PrereqResources", "Mechanized", "Suicide", "CaptureWhileEmbarked", "PrereqTech", "ObsoleteTech", "GoodyHutUpgradeUnitClass", "HurryCostModifier", "AdvancedStartCost", "MinAreaSize", "AirUnitCap", "NukeDamageLevel", "WorkRate", "NumFreeTechs", "RushBuilding", "BaseHurry", "HurryMultiplier", "BaseGold", "NumGoldPerEra", "SpreadReligion", "IsReligious", "CombatLimit", "RangeAttackOnlyInDomain", "RangeAttackIgnoreLOS", "RangedCombatLimit", "XPValueAttack", "XPValueDefense", "SpecialCargo", "DomainCargo", "Conscription", "ExtraMaintenanceCost", "NoMaintenance", "Unhappiness",
			("ART_DEF_UNIT_BOMBER_PE8"), "UnitArtInfoCulturalVariation", "UnitArtInfoEraVariation", ("PROJECT_HEAVY_BOMBER"), "SpaceshipProject", "LeaderPromotion", "LeaderExperience", "DontShowYields", "ShowInPedia", "MoveRate", "UnitFlagIconOffset", "PortraitIndex", "IconAtlas", "UnitFlagAtlas"
	FROM "Units" WHERE (Type = "UNIT_HEAVY_BOMBER");
INSERT INTO "Language_en_US" ( 'Tag', 'Text' )
	VALUES ( 'TXT_KEY_UNIT_BOMBER_PE8', 'Petlyakov Pe-8' );
INSERT INTO "Unit_AITypes" ('UnitType', 'UnitAIType')
	SELECT ("UNIT_BOMBER_PE8"), "UnitAIType"
	FROM "Unit_AITypes" WHERE (UnitType = "UNIT_HEAVY_BOMBER");
INSERT INTO "Unit_ClassUpgrades" ('UnitType', 'UnitClassType')
	SELECT ("UNIT_BOMBER_PE8"), "UnitClassType"
	FROM "Unit_ClassUpgrades" WHERE (UnitType = "UNIT_HEAVY_BOMBER");
INSERT INTO "Civilization_UnitClassOverrides" ( 'CivilizationType', 'UnitClassType', 'UnitType' )
	VALUES ( 'CIVILIZATION_RUSSIA', 'UNITCLASS_HEAVY_BOMBER', 'UNIT_BOMBER_PE8' );
INSERT INTO "Unit_Flavors" ('UnitType', 'FlavorType', 'Flavor')
	SELECT ("UNIT_BOMBER_PE8"), "FlavorType", "Flavor"
	FROM "Unit_Flavors" WHERE (UnitType = "UNIT_HEAVY_BOMBER");
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	SELECT ("UNIT_BOMBER_PE8"), "PromotionType"
	FROM "Unit_FreePromotions" WHERE (UnitType = "UNIT_HEAVY_BOMBER");
INSERT INTO "Unit_ResourceQuantityRequirements" ('UnitType', 'ResourceType', 'Cost')
	SELECT ("UNIT_BOMBER_PE8"), "ResourceType", "Cost"
	FROM "Unit_ResourceQuantityRequirements" WHERE (UnitType = "UNIT_HEAVY_BOMBER");
-----------

-- HP Halifax
INSERT INTO "Units" ('Type', 'Description', 'Civilopedia', 'Strategy', 'Help', 'Requirements', 'Combat', 'RangedCombat', 'Cost', 'Moves', 'Immobile', 'Range', 'BaseSightRange', 'Class', 'Special', 'Capture', 'CombatClass', 'Domain', 'CivilianAttackPriority', 'DefaultUnitAI', 'Food', 'NoBadGoodies', 'RivalTerritory', 'MilitarySupport', 'MilitaryProduction', 'Pillage', 'Found', 'FoundAbroad', 'CultureBombRadius', 'GoldenAgeTurns', 'IgnoreBuildingDefense', 'PrereqResources', 'Mechanized', 'Suicide', 'CaptureWhileEmbarked', 'PrereqTech', 'ObsoleteTech', 'GoodyHutUpgradeUnitClass', 'HurryCostModifier', 'AdvancedStartCost', 'MinAreaSize', 'AirUnitCap', 'NukeDamageLevel', 'WorkRate', 'NumFreeTechs', 'RushBuilding', 'BaseHurry', 'HurryMultiplier', 'BaseGold', 'NumGoldPerEra', 'SpreadReligion', 'IsReligious', 'CombatLimit', 'RangeAttackOnlyInDomain', 'RangeAttackIgnoreLOS', 'RangedCombatLimit', 'XPValueAttack', 'XPValueDefense', 'SpecialCargo', 'DomainCargo', 'Conscription', 'ExtraMaintenanceCost', 'NoMaintenance', 'Unhappiness', 'UnitArtInfo', 'UnitArtInfoCulturalVariation', 'UnitArtInfoEraVariation', 'ProjectPrereq', 'SpaceshipProject', 'LeaderPromotion', 'LeaderExperience', 'DontShowYields', 'ShowInPedia', 'MoveRate', 'UnitFlagIconOffset', 'PortraitIndex', 'IconAtlas', 'UnitFlagAtlas')
	SELECT	("UNIT_BOMBER_HALIFAX"), ("TXT_KEY_UNIT_BOMBER_HALIFAX"), "Civilopedia", "Strategy", "Help", "Requirements", "Combat", "RangedCombat", "Cost", "Moves", "Immobile", "Range", "BaseSightRange", "Class", "Special", "Capture", "CombatClass", "Domain", "CivilianAttackPriority", "DefaultUnitAI", "Food", "NoBadGoodies", "RivalTerritory", "MilitarySupport", "MilitaryProduction", "Pillage", "Found", "FoundAbroad", "CultureBombRadius", "GoldenAgeTurns", "IgnoreBuildingDefense", "PrereqResources", "Mechanized", "Suicide", "CaptureWhileEmbarked", "PrereqTech", "ObsoleteTech", "GoodyHutUpgradeUnitClass", "HurryCostModifier", "AdvancedStartCost", "MinAreaSize", "AirUnitCap", "NukeDamageLevel", "WorkRate", "NumFreeTechs", "RushBuilding", "BaseHurry", "HurryMultiplier", "BaseGold", "NumGoldPerEra", "SpreadReligion", "IsReligious", "CombatLimit", "RangeAttackOnlyInDomain", "RangeAttackIgnoreLOS", "RangedCombatLimit", "XPValueAttack", "XPValueDefense", "SpecialCargo", "DomainCargo", "Conscription", "ExtraMaintenanceCost", "NoMaintenance", "Unhappiness",
			("ART_DEF_UNIT_BOMBER_HALIFAX"), "UnitArtInfoCulturalVariation", "UnitArtInfoEraVariation", ("PROJECT_HEAVY_BOMBER"), "SpaceshipProject", "LeaderPromotion", "LeaderExperience", "DontShowYields", "ShowInPedia", "MoveRate", "UnitFlagIconOffset", "PortraitIndex", "IconAtlas", "UnitFlagAtlas"
	FROM "Units" WHERE (Type = "UNIT_HEAVY_BOMBER");
INSERT INTO "Language_en_US" ( 'Tag', 'Text' )
	VALUES ( 'TXT_KEY_UNIT_BOMBER_HALIFAX', 'HP Halifax' );
INSERT INTO "Unit_AITypes" ('UnitType', 'UnitAIType')
	SELECT ("UNIT_BOMBER_HALIFAX"), "UnitAIType"
	FROM "Unit_AITypes" WHERE (UnitType = "UNIT_HEAVY_BOMBER");
INSERT INTO "Unit_ClassUpgrades" ('UnitType', 'UnitClassType')
	SELECT ("UNIT_BOMBER_HALIFAX"), "UnitClassType"
	FROM "Unit_ClassUpgrades" WHERE (UnitType = "UNIT_HEAVY_BOMBER");
INSERT INTO "Civilization_UnitClassOverrides" ( 'CivilizationType', 'UnitClassType', 'UnitType' )
	VALUES ( 'CIVILIZATION_ENGLAND', 'UNITCLASS_HEAVY_BOMBER', 'UNIT_BOMBER_HALIFAX' );
INSERT INTO "Unit_Flavors" ('UnitType', 'FlavorType', 'Flavor')
	SELECT ("UNIT_BOMBER_HALIFAX"), "FlavorType", "Flavor"
	FROM "Unit_Flavors" WHERE (UnitType = "UNIT_HEAVY_BOMBER");
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	SELECT ("UNIT_BOMBER_HALIFAX"), "PromotionType"
	FROM "Unit_FreePromotions" WHERE (UnitType = "UNIT_HEAVY_BOMBER");
INSERT INTO "Unit_ResourceQuantityRequirements" ('UnitType', 'ResourceType', 'Cost')
	SELECT ("UNIT_BOMBER_HALIFAX"), "ResourceType", "Cost"
	FROM "Unit_ResourceQuantityRequirements" WHERE (UnitType = "UNIT_HEAVY_BOMBER");

-- He-177
INSERT INTO "Units" ('Type', 'Description', 'Civilopedia', 'Strategy', 'Help', 'Requirements', 'Combat', 'RangedCombat', 'Cost', 'Moves', 'Immobile', 'Range', 'BaseSightRange', 'Class', 'Special', 'Capture', 'CombatClass', 'Domain', 'CivilianAttackPriority', 'DefaultUnitAI', 'Food', 'NoBadGoodies', 'RivalTerritory', 'MilitarySupport', 'MilitaryProduction', 'Pillage', 'Found', 'FoundAbroad', 'CultureBombRadius', 'GoldenAgeTurns', 'IgnoreBuildingDefense', 'PrereqResources', 'Mechanized', 'Suicide', 'CaptureWhileEmbarked', 'PrereqTech', 'ObsoleteTech', 'GoodyHutUpgradeUnitClass', 'HurryCostModifier', 'AdvancedStartCost', 'MinAreaSize', 'AirUnitCap', 'NukeDamageLevel', 'WorkRate', 'NumFreeTechs', 'RushBuilding', 'BaseHurry', 'HurryMultiplier', 'BaseGold', 'NumGoldPerEra', 'SpreadReligion', 'IsReligious', 'CombatLimit', 'RangeAttackOnlyInDomain', 'RangeAttackIgnoreLOS', 'RangedCombatLimit', 'XPValueAttack', 'XPValueDefense', 'SpecialCargo', 'DomainCargo', 'Conscription', 'ExtraMaintenanceCost', 'NoMaintenance', 'Unhappiness', 'UnitArtInfo', 'UnitArtInfoCulturalVariation', 'UnitArtInfoEraVariation', 'ProjectPrereq', 'SpaceshipProject', 'LeaderPromotion', 'LeaderExperience', 'DontShowYields', 'ShowInPedia', 'MoveRate', 'UnitFlagIconOffset', 'PortraitIndex', 'IconAtlas', 'UnitFlagAtlas')
	SELECT	("UNIT_BOMBER_HE177"), ("TXT_KEY_UNIT_BOMBER_HE177"), "Civilopedia", "Strategy", "Help", "Requirements", "Combat", "RangedCombat", "Cost", "Moves", "Immobile", "Range", "BaseSightRange", "Class", "Special", "Capture", "CombatClass", "Domain", "CivilianAttackPriority", "DefaultUnitAI", "Food", "NoBadGoodies", "RivalTerritory", "MilitarySupport", "MilitaryProduction", "Pillage", "Found", "FoundAbroad", "CultureBombRadius", "GoldenAgeTurns", "IgnoreBuildingDefense", "PrereqResources", "Mechanized", "Suicide", "CaptureWhileEmbarked", "PrereqTech", "ObsoleteTech", "GoodyHutUpgradeUnitClass", "HurryCostModifier", "AdvancedStartCost", "MinAreaSize", "AirUnitCap", "NukeDamageLevel", "WorkRate", "NumFreeTechs", "RushBuilding", "BaseHurry", "HurryMultiplier", "BaseGold", "NumGoldPerEra", "SpreadReligion", "IsReligious", "CombatLimit", "RangeAttackOnlyInDomain", "RangeAttackIgnoreLOS", "RangedCombatLimit", "XPValueAttack", "XPValueDefense", "SpecialCargo", "DomainCargo", "Conscription", "ExtraMaintenanceCost", "NoMaintenance", "Unhappiness",
			("ART_DEF_UNIT_BOMBER_HE177"), "UnitArtInfoCulturalVariation", "UnitArtInfoEraVariation", ("PROJECT_HE177"), "SpaceshipProject", "LeaderPromotion", "LeaderExperience", "DontShowYields", "ShowInPedia", "MoveRate", "UnitFlagIconOffset", "PortraitIndex", "IconAtlas", "UnitFlagAtlas"
	FROM "Units" WHERE (Type = "UNIT_HEAVY_BOMBER");
INSERT INTO "Language_en_US" ( 'Tag', 'Text' )
	VALUES ( 'TXT_KEY_UNIT_BOMBER_HE177', 'Heinkel He 177' );
INSERT INTO "Unit_AITypes" ('UnitType', 'UnitAIType')
	SELECT ("UNIT_BOMBER_HE177"), "UnitAIType"
	FROM "Unit_AITypes" WHERE (UnitType = "UNIT_HEAVY_BOMBER");
INSERT INTO "Unit_ClassUpgrades" ('UnitType', 'UnitClassType')
	SELECT ("UNIT_BOMBER_HE177"), "UnitClassType"
	FROM "Unit_ClassUpgrades" WHERE (UnitType = "UNIT_HEAVY_BOMBER");
INSERT INTO "Civilization_UnitClassOverrides" ( 'CivilizationType', 'UnitClassType', 'UnitType' )
	VALUES ( 'CIVILIZATION_GERMANY', 'UNITCLASS_HEAVY_BOMBER', 'UNIT_BOMBER_HE177' );
INSERT INTO "Unit_Flavors" ('UnitType', 'FlavorType', 'Flavor')
	SELECT ("UNIT_BOMBER_HE177"), "FlavorType", "Flavor"
	FROM "Unit_Flavors" WHERE (UnitType = "UNIT_HEAVY_BOMBER");
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	SELECT ("UNIT_BOMBER_HE177"), "PromotionType"
	FROM "Unit_FreePromotions" WHERE (UnitType = "UNIT_HEAVY_BOMBER");
INSERT INTO "Unit_ResourceQuantityRequirements" ('UnitType', 'ResourceType', 'Cost')
	SELECT ("UNIT_BOMBER_HE177"), "ResourceType", "Cost"
	FROM "Unit_ResourceQuantityRequirements" WHERE (UnitType = "UNIT_HEAVY_BOMBER");
-----------

-- B-17
INSERT INTO "Units" ('Type', 'Description', 'Civilopedia', 'Strategy', 'Help', 'Requirements', 'Combat', 'RangedCombat', 'Cost', 'Moves', 'Immobile', 'Range', 'BaseSightRange', 'Class', 'Special', 'Capture', 'CombatClass', 'Domain', 'CivilianAttackPriority', 'DefaultUnitAI', 'Food', 'NoBadGoodies', 'RivalTerritory', 'MilitarySupport', 'MilitaryProduction', 'Pillage', 'Found', 'FoundAbroad', 'CultureBombRadius', 'GoldenAgeTurns', 'IgnoreBuildingDefense', 'PrereqResources', 'Mechanized', 'Suicide', 'CaptureWhileEmbarked', 'PrereqTech', 'ObsoleteTech', 'GoodyHutUpgradeUnitClass', 'HurryCostModifier', 'AdvancedStartCost', 'MinAreaSize', 'AirUnitCap', 'NukeDamageLevel', 'WorkRate', 'NumFreeTechs', 'RushBuilding', 'BaseHurry', 'HurryMultiplier', 'BaseGold', 'NumGoldPerEra', 'SpreadReligion', 'IsReligious', 'CombatLimit', 'RangeAttackOnlyInDomain', 'RangeAttackIgnoreLOS', 'RangedCombatLimit', 'XPValueAttack', 'XPValueDefense', 'SpecialCargo', 'DomainCargo', 'Conscription', 'ExtraMaintenanceCost', 'NoMaintenance', 'Unhappiness', 'UnitArtInfo', 'UnitArtInfoCulturalVariation', 'UnitArtInfoEraVariation', 'ProjectPrereq', 'SpaceshipProject', 'LeaderPromotion', 'LeaderExperience', 'DontShowYields', 'ShowInPedia', 'MoveRate', 'UnitFlagIconOffset', 'PortraitIndex', 'IconAtlas', 'UnitFlagAtlas')
	SELECT	("UNIT_AMERICAN_B17"), ("TXT_KEY_UNIT_BOMBER_B17"), ("TXT_KEY_CIV5_INDUSTRIAL_B17_TEXT"), ("TXT_KEY_UNIT_AMERICAN_B17_STRATEGY"), "Help", "Requirements", "Combat", "RangedCombat", "Cost", "Moves", "Immobile", "Range", "BaseSightRange", "Class", "Special", "Capture", "CombatClass", "Domain", "CivilianAttackPriority", "DefaultUnitAI", "Food", "NoBadGoodies", "RivalTerritory", "MilitarySupport", "MilitaryProduction", "Pillage", "Found", "FoundAbroad", "CultureBombRadius", "GoldenAgeTurns", "IgnoreBuildingDefense", "PrereqResources", "Mechanized", "Suicide", "CaptureWhileEmbarked", "PrereqTech", "ObsoleteTech", "GoodyHutUpgradeUnitClass", "HurryCostModifier", "AdvancedStartCost", "MinAreaSize", "AirUnitCap", "NukeDamageLevel", "WorkRate", "NumFreeTechs", "RushBuilding", "BaseHurry", "HurryMultiplier", "BaseGold", "NumGoldPerEra", "SpreadReligion", "IsReligious", "CombatLimit", "RangeAttackOnlyInDomain", "RangeAttackIgnoreLOS", "RangedCombatLimit", "XPValueAttack", "XPValueDefense", "SpecialCargo", "DomainCargo", "Conscription", "ExtraMaintenanceCost", "NoMaintenance", "Unhappiness",
			("ART_DEF_UNIT_U_AMERICAN_B17"), "UnitArtInfoCulturalVariation", "UnitArtInfoEraVariation", ("PROJECT_B17"), "SpaceshipProject", "LeaderPromotion", "LeaderExperience", "DontShowYields", "ShowInPedia", "MoveRate", "UnitFlagIconOffset", ("42"), "IconAtlas", "UnitFlagAtlas"
	FROM "Units" WHERE (Type = "UNIT_HEAVY_BOMBER");
INSERT INTO "Language_en_US" ( 'Tag', 'Text' )
	VALUES ( 'TXT_KEY_UNIT_BOMBER_B17', 'B-17 Flying Fortress' );
INSERT INTO "Unit_AITypes" ('UnitType', 'UnitAIType')
	SELECT ("UNIT_AMERICAN_B17"), "UnitAIType"
	FROM "Unit_AITypes" WHERE (UnitType = "UNIT_HEAVY_BOMBER");
INSERT INTO "Unit_ClassUpgrades" ('UnitType', 'UnitClassType')
	SELECT ("UNIT_AMERICAN_B17"), "UnitClassType"
	FROM "Unit_ClassUpgrades" WHERE (UnitType = "UNIT_HEAVY_BOMBER");
INSERT INTO "Civilization_UnitClassOverrides" ( 'CivilizationType', 'UnitClassType', 'UnitType' )
	VALUES ( 'CIVILIZATION_AMERICA', 'UNITCLASS_HEAVY_BOMBER', 'UNIT_AMERICAN_B17' );
INSERT INTO "Unit_Flavors" ('UnitType', 'FlavorType', 'Flavor')
	SELECT ("UNIT_AMERICAN_B17"), "FlavorType", "Flavor"
	FROM "Unit_Flavors" WHERE (UnitType = "UNIT_HEAVY_BOMBER");
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	SELECT ("UNIT_AMERICAN_B17"), "PromotionType"
	FROM "Unit_FreePromotions" WHERE (UnitType = "UNIT_HEAVY_BOMBER");
INSERT INTO "Unit_ResourceQuantityRequirements" ('UnitType', 'ResourceType', 'Cost')
	SELECT ("UNIT_AMERICAN_B17"), "ResourceType", "Cost"
	FROM "Unit_ResourceQuantityRequirements" WHERE (UnitType = "UNIT_HEAVY_BOMBER");
-----------

-- Avro Lancaster
INSERT INTO "Units" ('Type', 'Description', 'Civilopedia', 'Strategy', 'Help', 'Requirements', 'Combat', 'RangedCombat', 'Cost', 'Moves', 'Immobile', 'Range', 'BaseSightRange', 'Class', 'Special', 'Capture', 'CombatClass', 'Domain', 'CivilianAttackPriority', 'DefaultUnitAI', 'Food', 'NoBadGoodies', 'RivalTerritory', 'MilitarySupport', 'MilitaryProduction', 'Pillage', 'Found', 'FoundAbroad', 'CultureBombRadius', 'GoldenAgeTurns', 'IgnoreBuildingDefense', 'PrereqResources', 'Mechanized', 'Suicide', 'CaptureWhileEmbarked', 'PrereqTech', 'ObsoleteTech', 'GoodyHutUpgradeUnitClass', 'HurryCostModifier', 'AdvancedStartCost', 'MinAreaSize', 'AirUnitCap', 'NukeDamageLevel', 'WorkRate', 'NumFreeTechs', 'RushBuilding', 'BaseHurry', 'HurryMultiplier', 'BaseGold', 'NumGoldPerEra', 'SpreadReligion', 'IsReligious', 'CombatLimit', 'RangeAttackOnlyInDomain', 'RangeAttackIgnoreLOS', 'RangedCombatLimit', 'XPValueAttack', 'XPValueDefense', 'SpecialCargo', 'DomainCargo', 'Conscription', 'ExtraMaintenanceCost', 'NoMaintenance', 'Unhappiness', 'UnitArtInfo', 'UnitArtInfoCulturalVariation', 'UnitArtInfoEraVariation', 'ProjectPrereq', 'SpaceshipProject', 'LeaderPromotion', 'LeaderExperience', 'DontShowYields', 'ShowInPedia', 'MoveRate', 'UnitFlagIconOffset', 'PortraitIndex', 'IconAtlas', 'UnitFlagAtlas')
	SELECT	("UNIT_BOMBER_LANCASTER"), ("TXT_KEY_UNIT_BOMBER_LANCASTER"), "Civilopedia", "Strategy", "Help", "Requirements", "Combat", "RangedCombat", "Cost", "Moves", "Immobile", "Range", "BaseSightRange", "Class", "Special", "Capture", "CombatClass", "Domain", "CivilianAttackPriority", "DefaultUnitAI", "Food", "NoBadGoodies", "RivalTerritory", "MilitarySupport", "MilitaryProduction", "Pillage", "Found", "FoundAbroad", "CultureBombRadius", "GoldenAgeTurns", "IgnoreBuildingDefense", "PrereqResources", "Mechanized", "Suicide", "CaptureWhileEmbarked", "PrereqTech", "ObsoleteTech", "GoodyHutUpgradeUnitClass", "HurryCostModifier", "AdvancedStartCost", "MinAreaSize", "AirUnitCap", "NukeDamageLevel", "WorkRate", "NumFreeTechs", "RushBuilding", "BaseHurry", "HurryMultiplier", "BaseGold", "NumGoldPerEra", "SpreadReligion", "IsReligious", "CombatLimit", "RangeAttackOnlyInDomain", "RangeAttackIgnoreLOS", "RangedCombatLimit", "XPValueAttack", "XPValueDefense", "SpecialCargo", "DomainCargo", "Conscription", "ExtraMaintenanceCost", "NoMaintenance", "Unhappiness",
			("ART_DEF_UNIT_BOMBER_LANCASTER"), "UnitArtInfoCulturalVariation", "UnitArtInfoEraVariation", ("PROJECT_LANCASTER"), "SpaceshipProject", "LeaderPromotion", "LeaderExperience", "DontShowYields", "ShowInPedia", "MoveRate", "UnitFlagIconOffset", "PortraitIndex", "IconAtlas", "UnitFlagAtlas"
	FROM "Units" WHERE (Type = "UNIT_HEAVY_BOMBER_2");
INSERT INTO "Language_en_US" ( 'Tag', 'Text' )
	VALUES ( 'TXT_KEY_UNIT_BOMBER_LANCASTER', 'Avro Lancaster' );
INSERT INTO "Unit_AITypes" ('UnitType', 'UnitAIType')
	SELECT ("UNIT_BOMBER_LANCASTER"), "UnitAIType"
	FROM "Unit_AITypes" WHERE (UnitType = "UNIT_HEAVY_BOMBER_2");
INSERT INTO "Unit_ClassUpgrades" ('UnitType', 'UnitClassType')
	SELECT ("UNIT_BOMBER_LANCASTER"), "UnitClassType"
	FROM "Unit_ClassUpgrades" WHERE (UnitType = "UNIT_HEAVY_BOMBER_2");
INSERT INTO "Civilization_UnitClassOverrides" ( 'CivilizationType', 'UnitClassType', 'UnitType' )
	VALUES ( 'CIVILIZATION_ENGLAND', 'UNITCLASS_HEAVY_BOMBER_2', 'UNIT_BOMBER_LANCASTER' );
INSERT INTO "Unit_Flavors" ('UnitType', 'FlavorType', 'Flavor')
	SELECT ("UNIT_BOMBER_LANCASTER"), "FlavorType", "Flavor"
	FROM "Unit_Flavors" WHERE (UnitType = "UNIT_HEAVY_BOMBER_2");
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	SELECT ("UNIT_BOMBER_LANCASTER"), "PromotionType"
	FROM "Unit_FreePromotions" WHERE (UnitType = "UNIT_HEAVY_BOMBER_2");
INSERT INTO "Unit_ResourceQuantityRequirements" ('UnitType', 'ResourceType', 'Cost')
	SELECT ("UNIT_BOMBER_LANCASTER"), "ResourceType", "Cost"
	FROM "Unit_ResourceQuantityRequirements" WHERE (UnitType = "UNIT_HEAVY_BOMBER_2");
-----------

-- B-24 Liberator
INSERT INTO "Units" ('Type', 'Description', 'Civilopedia', 'Strategy', 'Help', 'Requirements', 'Combat', 'RangedCombat', 'Cost', 'Moves', 'Immobile', 'Range', 'BaseSightRange', 'Class', 'Special', 'Capture', 'CombatClass', 'Domain', 'CivilianAttackPriority', 'DefaultUnitAI', 'Food', 'NoBadGoodies', 'RivalTerritory', 'MilitarySupport', 'MilitaryProduction', 'Pillage', 'Found', 'FoundAbroad', 'CultureBombRadius', 'GoldenAgeTurns', 'IgnoreBuildingDefense', 'PrereqResources', 'Mechanized', 'Suicide', 'CaptureWhileEmbarked', 'PrereqTech', 'ObsoleteTech', 'GoodyHutUpgradeUnitClass', 'HurryCostModifier', 'AdvancedStartCost', 'MinAreaSize', 'AirUnitCap', 'NukeDamageLevel', 'WorkRate', 'NumFreeTechs', 'RushBuilding', 'BaseHurry', 'HurryMultiplier', 'BaseGold', 'NumGoldPerEra', 'SpreadReligion', 'IsReligious', 'CombatLimit', 'RangeAttackOnlyInDomain', 'RangeAttackIgnoreLOS', 'RangedCombatLimit', 'XPValueAttack', 'XPValueDefense', 'SpecialCargo', 'DomainCargo', 'Conscription', 'ExtraMaintenanceCost', 'NoMaintenance', 'Unhappiness', 'UnitArtInfo', 'UnitArtInfoCulturalVariation', 'UnitArtInfoEraVariation', 'ProjectPrereq', 'SpaceshipProject', 'LeaderPromotion', 'LeaderExperience', 'DontShowYields', 'ShowInPedia', 'MoveRate', 'UnitFlagIconOffset', 'PortraitIndex', 'IconAtlas', 'UnitFlagAtlas')
	SELECT	("UNIT_BOMBER_B24"), ("TXT_KEY_UNIT_BOMBER_B24"), "Civilopedia", "Strategy", "Help", "Requirements", "Combat", "RangedCombat", "Cost", "Moves", "Immobile", "Range", "BaseSightRange", "Class", "Special", "Capture", "CombatClass", "Domain", "CivilianAttackPriority", "DefaultUnitAI", "Food", "NoBadGoodies", "RivalTerritory", "MilitarySupport", "MilitaryProduction", "Pillage", "Found", "FoundAbroad", "CultureBombRadius", "GoldenAgeTurns", "IgnoreBuildingDefense", "PrereqResources", "Mechanized", "Suicide", "CaptureWhileEmbarked", "PrereqTech", "ObsoleteTech", "GoodyHutUpgradeUnitClass", "HurryCostModifier", "AdvancedStartCost", "MinAreaSize", "AirUnitCap", "NukeDamageLevel", "WorkRate", "NumFreeTechs", "RushBuilding", "BaseHurry", "HurryMultiplier", "BaseGold", "NumGoldPerEra", "SpreadReligion", "IsReligious", "CombatLimit", "RangeAttackOnlyInDomain", "RangeAttackIgnoreLOS", "RangedCombatLimit", "XPValueAttack", "XPValueDefense", "SpecialCargo", "DomainCargo", "Conscription", "ExtraMaintenanceCost", "NoMaintenance", "Unhappiness",
			("ART_DEF_UNIT_BOMBER_B24"), "UnitArtInfoCulturalVariation", "UnitArtInfoEraVariation", ("PROJECT_B24"), "SpaceshipProject", "LeaderPromotion", "LeaderExperience", "DontShowYields", "ShowInPedia", "MoveRate", "UnitFlagIconOffset", "PortraitIndex", "IconAtlas", "UnitFlagAtlas"
	FROM "Units" WHERE (Type = "UNIT_HEAVY_BOMBER_2");
INSERT INTO "Language_en_US" ( 'Tag', 'Text' )
	VALUES ( 'TXT_KEY_UNIT_BOMBER_B24', 'B-24 Liberator' );
INSERT INTO "Unit_AITypes" ('UnitType', 'UnitAIType')
	SELECT ("UNIT_BOMBER_B24"), "UnitAIType"
	FROM "Unit_AITypes" WHERE (UnitType = "UNIT_HEAVY_BOMBER_2");
INSERT INTO "Unit_ClassUpgrades" ('UnitType', 'UnitClassType')
	SELECT ("UNIT_BOMBER_B24"), "UnitClassType"
	FROM "Unit_ClassUpgrades" WHERE (UnitType = "UNIT_HEAVY_BOMBER_2");
INSERT INTO "Civilization_UnitClassOverrides" ( 'CivilizationType', 'UnitClassType', 'UnitType' )
	VALUES ( 'CIVILIZATION_AMERICA', 'UNITCLASS_HEAVY_BOMBER_2', 'UNIT_BOMBER_B24' );
INSERT INTO "Unit_Flavors" ('UnitType', 'FlavorType', 'Flavor')
	SELECT ("UNIT_BOMBER_B24"), "FlavorType", "Flavor"
	FROM "Unit_Flavors" WHERE (UnitType = "UNIT_HEAVY_BOMBER_2");
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	SELECT ("UNIT_BOMBER_B24"), "PromotionType"
	FROM "Unit_FreePromotions" WHERE (UnitType = "UNIT_HEAVY_BOMBER_2");
INSERT INTO "Unit_ResourceQuantityRequirements" ('UnitType', 'ResourceType', 'Cost')
	SELECT ("UNIT_BOMBER_B24"), "ResourceType", "Cost"
	FROM "Unit_ResourceQuantityRequirements" WHERE (UnitType = "UNIT_HEAVY_BOMBER_2");
-----------

