--------------------------------------------------------------
-- R.E.D. WW2 Edition New Units
-- Infantries
--------------------------------------------------------------

-- american infantry
INSERT INTO "Units" ('Type', 'Description', 'Civilopedia', 'Strategy', 'Help', 'Requirements', 'Combat', 'RangedCombat', 'Cost', 'Moves', 'Immobile', 'Range', 'BaseSightRange', 'Class', 'Special', 'Capture', 'CombatClass', 'Domain', 'CivilianAttackPriority', 'DefaultUnitAI', 'Food', 'NoBadGoodies', 'RivalTerritory', 'MilitarySupport', 'MilitaryProduction', 'Pillage', 'Found', 'FoundAbroad', 'CultureBombRadius', 'GoldenAgeTurns', 'IgnoreBuildingDefense', 'PrereqResources', 'Mechanized', 'Suicide', 'CaptureWhileEmbarked', 'PrereqTech', 'ObsoleteTech', 'GoodyHutUpgradeUnitClass', 'HurryCostModifier', 'AdvancedStartCost', 'MinAreaSize', 'AirUnitCap', 'NukeDamageLevel', 'WorkRate', 'NumFreeTechs', 'RushBuilding', 'BaseHurry', 'HurryMultiplier', 'BaseGold', 'NumGoldPerEra', 'SpreadReligion', 'IsReligious', 'CombatLimit', 'RangeAttackOnlyInDomain', 'RangeAttackIgnoreLOS', 'RangedCombatLimit', 'XPValueAttack', 'XPValueDefense', 'SpecialCargo', 'DomainCargo', 'Conscription', 'ExtraMaintenanceCost', 'NoMaintenance', 'Unhappiness', 'UnitArtInfo', 'UnitArtInfoCulturalVariation', 'UnitArtInfoEraVariation', 'ProjectPrereq', 'SpaceshipProject', 'LeaderPromotion', 'LeaderExperience', 'DontShowYields', 'ShowInPedia', 'MoveRate', 'UnitFlagIconOffset', 'PortraitIndex', 'IconAtlas', 'UnitFlagAtlas')
	SELECT	("UNIT_AMERICAN_INFANTRY"), ("TXT_KEY_UNIT_AMERICAN_INFANTRY"), "Civilopedia", "Strategy", "Help", "Requirements", "Combat", "RangedCombat", "Cost", "Moves", "Immobile", "Range", "BaseSightRange", "Class", "Special", "Capture", "CombatClass", "Domain", "CivilianAttackPriority", "DefaultUnitAI", "Food", "NoBadGoodies", "RivalTerritory", "MilitarySupport", "MilitaryProduction", "Pillage", "Found", "FoundAbroad", "CultureBombRadius", "GoldenAgeTurns", "IgnoreBuildingDefense", "PrereqResources", "Mechanized", "Suicide", "CaptureWhileEmbarked", "PrereqTech", "ObsoleteTech", "GoodyHutUpgradeUnitClass", "HurryCostModifier", "AdvancedStartCost", "MinAreaSize", "AirUnitCap", "NukeDamageLevel", "WorkRate", "NumFreeTechs", "RushBuilding", "BaseHurry", "HurryMultiplier", "BaseGold", "NumGoldPerEra", "SpreadReligion", "IsReligious", "CombatLimit", "RangeAttackOnlyInDomain", "RangeAttackIgnoreLOS", "RangedCombatLimit", "XPValueAttack", "XPValueDefense", "SpecialCargo", "DomainCargo", "Conscription", "ExtraMaintenanceCost", "NoMaintenance", "Unhappiness",
			("ART_DEF_UNIT_AMERICAN_INFANTRY"), "UnitArtInfoCulturalVariation", "UnitArtInfoEraVariation", "ProjectPrereq", "SpaceshipProject", "LeaderPromotion", "LeaderExperience", "DontShowYields", "ShowInPedia", "MoveRate",
			("0"), ("6"), ("WW2_UNIT_ICONS"), ("WW2_UNIT_FLAGS")
	FROM "Units" WHERE (Type = "UNIT_INFANTRY");
INSERT INTO "Language_en_US" ( 'Tag', 'Text' )
	VALUES ( 'TXT_KEY_UNIT_AMERICAN_INFANTRY', 'American Infantry' );
INSERT INTO "Unit_AITypes" ('UnitType', 'UnitAIType')
	SELECT ("UNIT_AMERICAN_INFANTRY"), "UnitAIType"
	FROM "Unit_AITypes" WHERE (UnitType = "UNIT_INFANTRY");
INSERT INTO "Unit_ClassUpgrades" ('UnitType', 'UnitClassType')
	SELECT ("UNIT_AMERICAN_INFANTRY"), "UnitClassType"
	FROM "Unit_ClassUpgrades" WHERE (UnitType = "UNIT_INFANTRY");
INSERT INTO "Civilization_UnitClassOverrides" ( 'CivilizationType', 'UnitClassType', 'UnitType' )
	VALUES ( 'CIVILIZATION_AMERICA', 'UNITCLASS_INFANTRY', 'UNIT_AMERICAN_INFANTRY' );
INSERT INTO "Unit_Flavors" ('UnitType', 'FlavorType', 'Flavor')
	SELECT ("UNIT_AMERICAN_INFANTRY"), "FlavorType", "Flavor"
	FROM "Unit_Flavors" WHERE (UnitType = "UNIT_INFANTRY");
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	SELECT ("UNIT_AMERICAN_INFANTRY"), "PromotionType"
	FROM "Unit_FreePromotions" WHERE (UnitType = "UNIT_INFANTRY");
INSERT INTO "Unit_ResourceQuantityRequirements" ('UnitType', 'ResourceType', 'Cost')
	SELECT ("UNIT_AMERICAN_INFANTRY"), "ResourceType", "Cost"
	FROM "Unit_ResourceQuantityRequirements" WHERE (UnitType = "UNIT_INFANTRY");
-----------

-- english infantry
INSERT INTO "Units" ('Type', 'Description', 'Civilopedia', 'Strategy', 'Help', 'Requirements', 'Combat', 'RangedCombat', 'Cost', 'Moves', 'Immobile', 'Range', 'BaseSightRange', 'Class', 'Special', 'Capture', 'CombatClass', 'Domain', 'CivilianAttackPriority', 'DefaultUnitAI', 'Food', 'NoBadGoodies', 'RivalTerritory', 'MilitarySupport', 'MilitaryProduction', 'Pillage', 'Found', 'FoundAbroad', 'CultureBombRadius', 'GoldenAgeTurns', 'IgnoreBuildingDefense', 'PrereqResources', 'Mechanized', 'Suicide', 'CaptureWhileEmbarked', 'PrereqTech', 'ObsoleteTech', 'GoodyHutUpgradeUnitClass', 'HurryCostModifier', 'AdvancedStartCost', 'MinAreaSize', 'AirUnitCap', 'NukeDamageLevel', 'WorkRate', 'NumFreeTechs', 'RushBuilding', 'BaseHurry', 'HurryMultiplier', 'BaseGold', 'NumGoldPerEra', 'SpreadReligion', 'IsReligious', 'CombatLimit', 'RangeAttackOnlyInDomain', 'RangeAttackIgnoreLOS', 'RangedCombatLimit', 'XPValueAttack', 'XPValueDefense', 'SpecialCargo', 'DomainCargo', 'Conscription', 'ExtraMaintenanceCost', 'NoMaintenance', 'Unhappiness', 'UnitArtInfo', 'UnitArtInfoCulturalVariation', 'UnitArtInfoEraVariation', 'ProjectPrereq', 'SpaceshipProject', 'LeaderPromotion', 'LeaderExperience', 'DontShowYields', 'ShowInPedia', 'MoveRate', 'UnitFlagIconOffset', 'PortraitIndex', 'IconAtlas', 'UnitFlagAtlas')
	SELECT	("UNIT_ENGLISH_INFANTRY"), ("TXT_KEY_UNIT_ENGLISH_INFANTRY"), "Civilopedia", "Strategy", "Help", "Requirements", "Combat", "RangedCombat", "Cost", "Moves", "Immobile", "Range", "BaseSightRange", "Class", "Special", "Capture", "CombatClass", "Domain", "CivilianAttackPriority", "DefaultUnitAI", "Food", "NoBadGoodies", "RivalTerritory", "MilitarySupport", "MilitaryProduction", "Pillage", "Found", "FoundAbroad", "CultureBombRadius", "GoldenAgeTurns", "IgnoreBuildingDefense", "PrereqResources", "Mechanized", "Suicide", "CaptureWhileEmbarked", "PrereqTech", "ObsoleteTech", "GoodyHutUpgradeUnitClass", "HurryCostModifier", "AdvancedStartCost", "MinAreaSize", "AirUnitCap", "NukeDamageLevel", "WorkRate", "NumFreeTechs", "RushBuilding", "BaseHurry", "HurryMultiplier", "BaseGold", "NumGoldPerEra", "SpreadReligion", "IsReligious", "CombatLimit", "RangeAttackOnlyInDomain", "RangeAttackIgnoreLOS", "RangedCombatLimit", "XPValueAttack", "XPValueDefense", "SpecialCargo", "DomainCargo", "Conscription", "ExtraMaintenanceCost", "NoMaintenance", "Unhappiness",
			("ART_DEF_UNIT_ENGLISH_INFANTRY"), "UnitArtInfoCulturalVariation", "UnitArtInfoEraVariation", "ProjectPrereq", "SpaceshipProject", "LeaderPromotion", "LeaderExperience", "DontShowYields", "ShowInPedia", "MoveRate",
			("0"), ("2"), ("WW2_INFANTRY01_ATLAS"), ("WW2_UNIT_FLAGS")
	FROM "Units" WHERE (Type = "UNIT_INFANTRY");
INSERT INTO "Language_en_US" ( 'Tag', 'Text' )
	VALUES ( 'TXT_KEY_UNIT_ENGLISH_INFANTRY', 'English Infantry' );
INSERT INTO "Unit_AITypes" ('UnitType', 'UnitAIType')
	SELECT ("UNIT_ENGLISH_INFANTRY"), "UnitAIType"
	FROM "Unit_AITypes" WHERE (UnitType = "UNIT_INFANTRY");
INSERT INTO "Unit_ClassUpgrades" ('UnitType', 'UnitClassType')
	SELECT ("UNIT_ENGLISH_INFANTRY"), "UnitClassType"
	FROM "Unit_ClassUpgrades" WHERE (UnitType = "UNIT_INFANTRY");
INSERT INTO "Civilization_UnitClassOverrides" ( 'CivilizationType', 'UnitClassType', 'UnitType' )
	VALUES ( 'CIVILIZATION_ENGLAND', 'UNITCLASS_INFANTRY', 'UNIT_ENGLISH_INFANTRY' );
INSERT INTO "Unit_Flavors" ('UnitType', 'FlavorType', 'Flavor')
	SELECT ("UNIT_ENGLISH_INFANTRY"), "FlavorType", "Flavor"
	FROM "Unit_Flavors" WHERE (UnitType = "UNIT_INFANTRY");
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	SELECT ("UNIT_ENGLISH_INFANTRY"), "PromotionType"
	FROM "Unit_FreePromotions" WHERE (UnitType = "UNIT_INFANTRY");
INSERT INTO "Unit_ResourceQuantityRequirements" ('UnitType', 'ResourceType', 'Cost')
	SELECT ("UNIT_ENGLISH_INFANTRY"), "ResourceType", "Cost"
	FROM "Unit_ResourceQuantityRequirements" WHERE (UnitType = "UNIT_INFANTRY");
-----------

-- german infantry
INSERT INTO "Units" ('Type', 'Description', 'Civilopedia', 'Strategy', 'Help', 'Requirements', 'Combat', 'RangedCombat', 'Cost', 'Moves', 'Immobile', 'Range', 'BaseSightRange', 'Class', 'Special', 'Capture', 'CombatClass', 'Domain', 'CivilianAttackPriority', 'DefaultUnitAI', 'Food', 'NoBadGoodies', 'RivalTerritory', 'MilitarySupport', 'MilitaryProduction', 'Pillage', 'Found', 'FoundAbroad', 'CultureBombRadius', 'GoldenAgeTurns', 'IgnoreBuildingDefense', 'PrereqResources', 'Mechanized', 'Suicide', 'CaptureWhileEmbarked', 'PrereqTech', 'ObsoleteTech', 'GoodyHutUpgradeUnitClass', 'HurryCostModifier', 'AdvancedStartCost', 'MinAreaSize', 'AirUnitCap', 'NukeDamageLevel', 'WorkRate', 'NumFreeTechs', 'RushBuilding', 'BaseHurry', 'HurryMultiplier', 'BaseGold', 'NumGoldPerEra', 'SpreadReligion', 'IsReligious', 'CombatLimit', 'RangeAttackOnlyInDomain', 'RangeAttackIgnoreLOS', 'RangedCombatLimit', 'XPValueAttack', 'XPValueDefense', 'SpecialCargo', 'DomainCargo', 'Conscription', 'ExtraMaintenanceCost', 'NoMaintenance', 'Unhappiness', 'UnitArtInfo', 'UnitArtInfoCulturalVariation', 'UnitArtInfoEraVariation', 'ProjectPrereq', 'SpaceshipProject', 'LeaderPromotion', 'LeaderExperience', 'DontShowYields', 'ShowInPedia', 'MoveRate', 'UnitFlagIconOffset', 'PortraitIndex', 'IconAtlas', 'UnitFlagAtlas')
	SELECT	("UNIT_GERMAN_INFANTRY"), ("TXT_KEY_UNIT_GERMAN_INFANTRY"), "Civilopedia", "Strategy", "Help", "Requirements", "Combat", "RangedCombat", "Cost", "Moves", "Immobile", "Range", "BaseSightRange", "Class", "Special", "Capture", "CombatClass", "Domain", "CivilianAttackPriority", "DefaultUnitAI", "Food", "NoBadGoodies", "RivalTerritory", "MilitarySupport", "MilitaryProduction", "Pillage", "Found", "FoundAbroad", "CultureBombRadius", "GoldenAgeTurns", "IgnoreBuildingDefense", "PrereqResources", "Mechanized", "Suicide", "CaptureWhileEmbarked", "PrereqTech", "ObsoleteTech", "GoodyHutUpgradeUnitClass", "HurryCostModifier", "AdvancedStartCost", "MinAreaSize", "AirUnitCap", "NukeDamageLevel", "WorkRate", "NumFreeTechs", "RushBuilding", "BaseHurry", "HurryMultiplier", "BaseGold", "NumGoldPerEra", "SpreadReligion", "IsReligious", "CombatLimit", "RangeAttackOnlyInDomain", "RangeAttackIgnoreLOS", "RangedCombatLimit", "XPValueAttack", "XPValueDefense", "SpecialCargo", "DomainCargo", "Conscription", "ExtraMaintenanceCost", "NoMaintenance", "Unhappiness",
			("ART_DEF_UNIT_GERMAN_INFANTRY"), "UnitArtInfoCulturalVariation", "UnitArtInfoEraVariation", "ProjectPrereq", "SpaceshipProject", "LeaderPromotion", "LeaderExperience", "DontShowYields", "ShowInPedia", "MoveRate", ("0"), ("0"), ("WW2_INFANTRY01_ATLAS"), ("WW2_UNIT_FLAGS")
	FROM "Units" WHERE (Type = "UNIT_INFANTRY");
INSERT INTO "Language_en_US" ( 'Tag', 'Text' )
	VALUES ( 'TXT_KEY_UNIT_GERMAN_INFANTRY', 'German Infantry' );
INSERT INTO "Unit_AITypes" ('UnitType', 'UnitAIType')
	SELECT ("UNIT_GERMAN_INFANTRY"), "UnitAIType"
	FROM "Unit_AITypes" WHERE (UnitType = "UNIT_INFANTRY");
INSERT INTO "Unit_ClassUpgrades" ('UnitType', 'UnitClassType')
	SELECT ("UNIT_GERMAN_INFANTRY"), "UnitClassType"
	FROM "Unit_ClassUpgrades" WHERE (UnitType = "UNIT_INFANTRY");
INSERT INTO "Civilization_UnitClassOverrides" ( 'CivilizationType', 'UnitClassType', 'UnitType' )
	VALUES ( 'CIVILIZATION_GERMANY', 'UNITCLASS_INFANTRY', 'UNIT_GERMAN_INFANTRY' );
INSERT INTO "Unit_Flavors" ('UnitType', 'FlavorType', 'Flavor')
	SELECT ("UNIT_GERMAN_INFANTRY"), "FlavorType", "Flavor"
	FROM "Unit_Flavors" WHERE (UnitType = "UNIT_INFANTRY");
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	SELECT ("UNIT_GERMAN_INFANTRY"), "PromotionType"
	FROM "Unit_FreePromotions" WHERE (UnitType = "UNIT_INFANTRY");
INSERT INTO "Unit_ResourceQuantityRequirements" ('UnitType', 'ResourceType', 'Cost')
	SELECT ("UNIT_GERMAN_INFANTRY"), "ResourceType", "Cost"
	FROM "Unit_ResourceQuantityRequirements" WHERE (UnitType = "UNIT_INFANTRY");
-----------

-- Japanese infantry
INSERT INTO "Units" ('Type', 'Description', 'Civilopedia', 'Strategy', 'Help', 'Requirements', 'Combat', 'RangedCombat', 'Cost', 'Moves', 'Immobile', 'Range', 'BaseSightRange', 'Class', 'Special', 'Capture', 'CombatClass', 'Domain', 'CivilianAttackPriority', 'DefaultUnitAI', 'Food', 'NoBadGoodies', 'RivalTerritory', 'MilitarySupport', 'MilitaryProduction', 'Pillage', 'Found', 'FoundAbroad', 'CultureBombRadius', 'GoldenAgeTurns', 'IgnoreBuildingDefense', 'PrereqResources', 'Mechanized', 'Suicide', 'CaptureWhileEmbarked', 'PrereqTech', 'ObsoleteTech', 'GoodyHutUpgradeUnitClass', 'HurryCostModifier', 'AdvancedStartCost', 'MinAreaSize', 'AirUnitCap', 'NukeDamageLevel', 'WorkRate', 'NumFreeTechs', 'RushBuilding', 'BaseHurry', 'HurryMultiplier', 'BaseGold', 'NumGoldPerEra', 'SpreadReligion', 'IsReligious', 'CombatLimit', 'RangeAttackOnlyInDomain', 'RangeAttackIgnoreLOS', 'RangedCombatLimit', 'XPValueAttack', 'XPValueDefense', 'SpecialCargo', 'DomainCargo', 'Conscription', 'ExtraMaintenanceCost', 'NoMaintenance', 'Unhappiness', 'UnitArtInfo', 'UnitArtInfoCulturalVariation', 'UnitArtInfoEraVariation', 'ProjectPrereq', 'SpaceshipProject', 'LeaderPromotion', 'LeaderExperience', 'DontShowYields', 'ShowInPedia', 'MoveRate', 'UnitFlagIconOffset', 'PortraitIndex', 'IconAtlas', 'UnitFlagAtlas')
	SELECT	("UNIT_JAPAN_INFANTRY"), ("TXT_KEY_UNIT_JAPAN_INFANTRY"), "Civilopedia", "Strategy", "Help", "Requirements", "Combat", "RangedCombat", "Cost", "Moves", "Immobile", "Range", "BaseSightRange", "Class", "Special", "Capture", "CombatClass", "Domain", "CivilianAttackPriority", "DefaultUnitAI", "Food", "NoBadGoodies", "RivalTerritory", "MilitarySupport", "MilitaryProduction", "Pillage", "Found", "FoundAbroad", "CultureBombRadius", "GoldenAgeTurns", "IgnoreBuildingDefense", "PrereqResources", "Mechanized", "Suicide", "CaptureWhileEmbarked", "PrereqTech", "ObsoleteTech", "GoodyHutUpgradeUnitClass", "HurryCostModifier", "AdvancedStartCost", "MinAreaSize", "AirUnitCap", "NukeDamageLevel", "WorkRate", "NumFreeTechs", "RushBuilding", "BaseHurry", "HurryMultiplier", "BaseGold", "NumGoldPerEra", "SpreadReligion", "IsReligious", "CombatLimit", "RangeAttackOnlyInDomain", "RangeAttackIgnoreLOS", "RangedCombatLimit", "XPValueAttack", "XPValueDefense", "SpecialCargo", "DomainCargo", "Conscription", "ExtraMaintenanceCost", "NoMaintenance", "Unhappiness",
			("ART_DEF_UNIT_JAPAN_INFANTRY"), "UnitArtInfoCulturalVariation", "UnitArtInfoEraVariation", "ProjectPrereq", "SpaceshipProject", "LeaderPromotion", "LeaderExperience", "DontShowYields", "ShowInPedia", "MoveRate", ("0"), "PortraitIndex", "IconAtlas", ("WW2_UNIT_FLAGS")
	FROM "Units" WHERE (Type = "UNIT_INFANTRY");
INSERT INTO "Language_en_US" ( 'Tag', 'Text' )
	VALUES ( 'TXT_KEY_UNIT_JAPAN_INFANTRY', 'Japanese Infantry' );
INSERT INTO "Unit_AITypes" ('UnitType', 'UnitAIType')
	SELECT ("UNIT_JAPAN_INFANTRY"), "UnitAIType"
	FROM "Unit_AITypes" WHERE (UnitType = "UNIT_INFANTRY");
INSERT INTO "Unit_ClassUpgrades" ('UnitType', 'UnitClassType')
	SELECT ("UNIT_JAPAN_INFANTRY"), "UnitClassType"
	FROM "Unit_ClassUpgrades" WHERE (UnitType = "UNIT_INFANTRY");
INSERT INTO "Civilization_UnitClassOverrides" ( 'CivilizationType', 'UnitClassType', 'UnitType' )
	VALUES ( 'CIVILIZATION_JAPAN', 'UNITCLASS_INFANTRY', 'UNIT_JAPAN_INFANTRY' );
INSERT INTO "Unit_Flavors" ('UnitType', 'FlavorType', 'Flavor')
	SELECT ("UNIT_JAPAN_INFANTRY"), "FlavorType", "Flavor"
	FROM "Unit_Flavors" WHERE (UnitType = "UNIT_INFANTRY");
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	SELECT ("UNIT_JAPAN_INFANTRY"), "PromotionType"
	FROM "Unit_FreePromotions" WHERE (UnitType = "UNIT_INFANTRY");
INSERT INTO "Unit_ResourceQuantityRequirements" ('UnitType', 'ResourceType', 'Cost')
	SELECT ("UNIT_JAPAN_INFANTRY"), "ResourceType", "Cost"
	FROM "Unit_ResourceQuantityRequirements" WHERE (UnitType = "UNIT_INFANTRY");
-----------

-- russian infantry
INSERT INTO "Units" ('Type', 'Description', 'Civilopedia', 'Strategy', 'Help', 'Requirements', 'Combat', 'RangedCombat', 'Cost', 'Moves', 'Immobile', 'Range', 'BaseSightRange', 'Class', 'Special', 'Capture', 'CombatClass', 'Domain', 'CivilianAttackPriority', 'DefaultUnitAI', 'Food', 'NoBadGoodies', 'RivalTerritory', 'MilitarySupport', 'MilitaryProduction', 'Pillage', 'Found', 'FoundAbroad', 'CultureBombRadius', 'GoldenAgeTurns', 'IgnoreBuildingDefense', 'PrereqResources', 'Mechanized', 'Suicide', 'CaptureWhileEmbarked', 'PrereqTech', 'ObsoleteTech', 'GoodyHutUpgradeUnitClass', 'HurryCostModifier', 'AdvancedStartCost', 'MinAreaSize', 'AirUnitCap', 'NukeDamageLevel', 'WorkRate', 'NumFreeTechs', 'RushBuilding', 'BaseHurry', 'HurryMultiplier', 'BaseGold', 'NumGoldPerEra', 'SpreadReligion', 'IsReligious', 'CombatLimit', 'RangeAttackOnlyInDomain', 'RangeAttackIgnoreLOS', 'RangedCombatLimit', 'XPValueAttack', 'XPValueDefense', 'SpecialCargo', 'DomainCargo', 'Conscription', 'ExtraMaintenanceCost', 'NoMaintenance', 'Unhappiness', 'UnitArtInfo', 'UnitArtInfoCulturalVariation', 'UnitArtInfoEraVariation', 'ProjectPrereq', 'SpaceshipProject', 'LeaderPromotion', 'LeaderExperience', 'DontShowYields', 'ShowInPedia', 'MoveRate', 'UnitFlagIconOffset', 'PortraitIndex', 'IconAtlas', 'UnitFlagAtlas')
	SELECT	("UNIT_RUSSIAN_INFANTRY"), ("TXT_KEY_UNIT_RUSSIAN_INFANTRY"), "Civilopedia", "Strategy", "Help", "Requirements", "Combat", "RangedCombat", "Cost", "Moves", "Immobile", "Range", "BaseSightRange", "Class", "Special", "Capture", "CombatClass", "Domain", "CivilianAttackPriority", "DefaultUnitAI", "Food", "NoBadGoodies", "RivalTerritory", "MilitarySupport", "MilitaryProduction", "Pillage", "Found", "FoundAbroad", "CultureBombRadius", "GoldenAgeTurns", "IgnoreBuildingDefense", "PrereqResources", "Mechanized", "Suicide", "CaptureWhileEmbarked", "PrereqTech", "ObsoleteTech", "GoodyHutUpgradeUnitClass", "HurryCostModifier", "AdvancedStartCost", "MinAreaSize", "AirUnitCap", "NukeDamageLevel", "WorkRate", "NumFreeTechs", "RushBuilding", "BaseHurry", "HurryMultiplier", "BaseGold", "NumGoldPerEra", "SpreadReligion", "IsReligious", "CombatLimit", "RangeAttackOnlyInDomain", "RangeAttackIgnoreLOS", "RangedCombatLimit", "XPValueAttack", "XPValueDefense", "SpecialCargo", "DomainCargo", "Conscription", "ExtraMaintenanceCost", "NoMaintenance", "Unhappiness",
			("ART_DEF_UNIT_RUSSIAN_INFANTRY"), "UnitArtInfoCulturalVariation", "UnitArtInfoEraVariation", "ProjectPrereq", "SpaceshipProject", "LeaderPromotion", "LeaderExperience", "DontShowYields", "ShowInPedia", "MoveRate", ("0"), ("3"), ("WW2_INFANTRY01_ATLAS"), ("WW2_UNIT_FLAGS")
	FROM "Units" WHERE (Type = "UNIT_INFANTRY");
INSERT INTO "Language_en_US" ( 'Tag', 'Text' )
	VALUES ( 'TXT_KEY_UNIT_RUSSIAN_INFANTRY', 'Russian Infantry' );
INSERT INTO "Unit_AITypes" ('UnitType', 'UnitAIType')
	SELECT ("UNIT_RUSSIAN_INFANTRY"), "UnitAIType"
	FROM "Unit_AITypes" WHERE (UnitType = "UNIT_INFANTRY");
INSERT INTO "Unit_ClassUpgrades" ('UnitType', 'UnitClassType')
	SELECT ("UNIT_RUSSIAN_INFANTRY"), "UnitClassType"
	FROM "Unit_ClassUpgrades" WHERE (UnitType = "UNIT_INFANTRY");
INSERT INTO "Civilization_UnitClassOverrides" ( 'CivilizationType', 'UnitClassType', 'UnitType' )
	VALUES ( 'CIVILIZATION_RUSSIA', 'UNITCLASS_INFANTRY', 'UNIT_RUSSIAN_INFANTRY' );
INSERT INTO "Unit_Flavors" ('UnitType', 'FlavorType', 'Flavor')
	SELECT ("UNIT_RUSSIAN_INFANTRY"), "FlavorType", "Flavor"
	FROM "Unit_Flavors" WHERE (UnitType = "UNIT_INFANTRY");
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	SELECT ("UNIT_RUSSIAN_INFANTRY"), "PromotionType"
	FROM "Unit_FreePromotions" WHERE (UnitType = "UNIT_INFANTRY");
INSERT INTO "Unit_ResourceQuantityRequirements" ('UnitType', 'ResourceType', 'Cost')
	SELECT ("UNIT_RUSSIAN_INFANTRY"), "ResourceType", "Cost"
	FROM "Unit_ResourceQuantityRequirements" WHERE (UnitType = "UNIT_INFANTRY");
-----------

-- french infantry
INSERT INTO "Units" ('Type', 'Description', 'Civilopedia', 'Strategy', 'Help', 'Requirements', 'Combat', 'RangedCombat', 'Cost', 'Moves', 'Immobile', 'Range', 'BaseSightRange', 'Class', 'Special', 'Capture', 'CombatClass', 'Domain', 'CivilianAttackPriority', 'DefaultUnitAI', 'Food', 'NoBadGoodies', 'RivalTerritory', 'MilitarySupport', 'MilitaryProduction', 'Pillage', 'Found', 'FoundAbroad', 'CultureBombRadius', 'GoldenAgeTurns', 'IgnoreBuildingDefense', 'PrereqResources', 'Mechanized', 'Suicide', 'CaptureWhileEmbarked', 'PrereqTech', 'ObsoleteTech', 'GoodyHutUpgradeUnitClass', 'HurryCostModifier', 'AdvancedStartCost', 'MinAreaSize', 'AirUnitCap', 'NukeDamageLevel', 'WorkRate', 'NumFreeTechs', 'RushBuilding', 'BaseHurry', 'HurryMultiplier', 'BaseGold', 'NumGoldPerEra', 'SpreadReligion', 'IsReligious', 'CombatLimit', 'RangeAttackOnlyInDomain', 'RangeAttackIgnoreLOS', 'RangedCombatLimit', 'XPValueAttack', 'XPValueDefense', 'SpecialCargo', 'DomainCargo', 'Conscription', 'ExtraMaintenanceCost', 'NoMaintenance', 'Unhappiness', 'UnitArtInfo', 'UnitArtInfoCulturalVariation', 'UnitArtInfoEraVariation', 'ProjectPrereq', 'SpaceshipProject', 'LeaderPromotion', 'LeaderExperience', 'DontShowYields', 'ShowInPedia', 'MoveRate', 'UnitFlagIconOffset', 'PortraitIndex', 'IconAtlas', 'UnitFlagAtlas')
	SELECT	("UNIT_FRENCH_INFANTRY"), ("TXT_KEY_UNIT_FRENCH_INFANTRY"), "Civilopedia", "Strategy", "Help", "Requirements", "Combat", "RangedCombat", "Cost", "Moves", "Immobile", "Range", "BaseSightRange", "Class", "Special", "Capture", "CombatClass", "Domain", "CivilianAttackPriority", "DefaultUnitAI", "Food", "NoBadGoodies", "RivalTerritory", "MilitarySupport", "MilitaryProduction", "Pillage", "Found", "FoundAbroad", "CultureBombRadius", "GoldenAgeTurns", "IgnoreBuildingDefense", "PrereqResources", "Mechanized", "Suicide", "CaptureWhileEmbarked", "PrereqTech", "ObsoleteTech", "GoodyHutUpgradeUnitClass", "HurryCostModifier", "AdvancedStartCost", "MinAreaSize", "AirUnitCap", "NukeDamageLevel", "WorkRate", "NumFreeTechs", "RushBuilding", "BaseHurry", "HurryMultiplier", "BaseGold", "NumGoldPerEra", "SpreadReligion", "IsReligious", "CombatLimit", "RangeAttackOnlyInDomain", "RangeAttackIgnoreLOS", "RangedCombatLimit", "XPValueAttack", "XPValueDefense", "SpecialCargo", "DomainCargo", "Conscription", "ExtraMaintenanceCost", "NoMaintenance", "Unhappiness",
			("ART_DEF_UNIT_FRENCH_INFANTRY"), "UnitArtInfoCulturalVariation", "UnitArtInfoEraVariation", "ProjectPrereq", "SpaceshipProject", "LeaderPromotion", "LeaderExperience", "DontShowYields", "ShowInPedia", "MoveRate", ("0"), ("1"), ("WW2_INFANTRY01_ATLAS"), ("WW2_UNIT_FLAGS")
	FROM "Units" WHERE (Type = "UNIT_INFANTRY");
INSERT INTO "Language_en_US" ( 'Tag', 'Text' )
	VALUES ( 'TXT_KEY_UNIT_FRENCH_INFANTRY', 'French Infantry' );
INSERT INTO "Unit_AITypes" ('UnitType', 'UnitAIType')
	SELECT ("UNIT_FRENCH_INFANTRY"), "UnitAIType"
	FROM "Unit_AITypes" WHERE (UnitType = "UNIT_INFANTRY");
INSERT INTO "Unit_ClassUpgrades" ('UnitType', 'UnitClassType')
	SELECT ("UNIT_FRENCH_INFANTRY"), "UnitClassType"
	FROM "Unit_ClassUpgrades" WHERE (UnitType = "UNIT_INFANTRY");
INSERT INTO "Civilization_UnitClassOverrides" ( 'CivilizationType', 'UnitClassType', 'UnitType' )
	VALUES ( 'CIVILIZATION_FRANCE', 'UNITCLASS_INFANTRY', 'UNIT_FRENCH_INFANTRY' );
INSERT INTO "Unit_Flavors" ('UnitType', 'FlavorType', 'Flavor')
	SELECT ("UNIT_FRENCH_INFANTRY"), "FlavorType", "Flavor"
	FROM "Unit_Flavors" WHERE (UnitType = "UNIT_INFANTRY");
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	SELECT ("UNIT_FRENCH_INFANTRY"), "PromotionType"
	FROM "Unit_FreePromotions" WHERE (UnitType = "UNIT_INFANTRY");
INSERT INTO "Unit_ResourceQuantityRequirements" ('UnitType', 'ResourceType', 'Cost')
	SELECT ("UNIT_FRENCH_INFANTRY"), "ResourceType", "Cost"
	FROM "Unit_ResourceQuantityRequirements" WHERE (UnitType = "UNIT_INFANTRY");
-----------

-- french Foreign Legion infantry
--UPDATE Units
--	SET Class = 'UNITCLASS_SPECIAL_FORCES', Combat = 30, UnitFlagIconOffset = 3, UnitFlagAtlas = 'WW2_UNIT_FLAGS'
--	WHERE Type = 'UNIT_FRENCH_FOREIGNLEGION';

--INSERT INTO "Civilization_UnitClassOverrides" ( 'CivilizationType', 'UnitClassType', 'UnitType' )
--	VALUES ( 'CIVILIZATION_FRANCE', 'UNITCLASS_SPECIAL_FORCES', 'UNIT_FRENCH_FOREIGNLEGION' );

-----------

-- italian infantry
INSERT INTO "Units" ('Type', 'Description', 'Civilopedia', 'Strategy', 'Help', 'Requirements', 'Combat', 'RangedCombat', 'Cost', 'Moves', 'Immobile', 'Range', 'BaseSightRange', 'Class', 'Special', 'Capture', 'CombatClass', 'Domain', 'CivilianAttackPriority', 'DefaultUnitAI', 'Food', 'NoBadGoodies', 'RivalTerritory', 'MilitarySupport', 'MilitaryProduction', 'Pillage', 'Found', 'FoundAbroad', 'CultureBombRadius', 'GoldenAgeTurns', 'IgnoreBuildingDefense', 'PrereqResources', 'Mechanized', 'Suicide', 'CaptureWhileEmbarked', 'PrereqTech', 'ObsoleteTech', 'GoodyHutUpgradeUnitClass', 'HurryCostModifier', 'AdvancedStartCost', 'MinAreaSize', 'AirUnitCap', 'NukeDamageLevel', 'WorkRate', 'NumFreeTechs', 'RushBuilding', 'BaseHurry', 'HurryMultiplier', 'BaseGold', 'NumGoldPerEra', 'SpreadReligion', 'IsReligious', 'CombatLimit', 'RangeAttackOnlyInDomain', 'RangeAttackIgnoreLOS', 'RangedCombatLimit', 'XPValueAttack', 'XPValueDefense', 'SpecialCargo', 'DomainCargo', 'Conscription', 'ExtraMaintenanceCost', 'NoMaintenance', 'Unhappiness', 'UnitArtInfo', 'UnitArtInfoCulturalVariation', 'UnitArtInfoEraVariation', 'ProjectPrereq', 'SpaceshipProject', 'LeaderPromotion', 'LeaderExperience', 'DontShowYields', 'ShowInPedia', 'MoveRate', 'UnitFlagIconOffset', 'PortraitIndex', 'IconAtlas', 'UnitFlagAtlas')
	SELECT	("UNIT_ITALIAN_INFANTRY"), ("TXT_KEY_UNIT_ITALIAN_INFANTRY"), "Civilopedia", "Strategy", "Help", "Requirements", "Combat", "RangedCombat", "Cost", "Moves", "Immobile", "Range", "BaseSightRange", "Class", "Special", "Capture", "CombatClass", "Domain", "CivilianAttackPriority", "DefaultUnitAI", "Food", "NoBadGoodies", "RivalTerritory", "MilitarySupport", "MilitaryProduction", "Pillage", "Found", "FoundAbroad", "CultureBombRadius", "GoldenAgeTurns", "IgnoreBuildingDefense", "PrereqResources", "Mechanized", "Suicide", "CaptureWhileEmbarked", "PrereqTech", "ObsoleteTech", "GoodyHutUpgradeUnitClass", "HurryCostModifier", "AdvancedStartCost", "MinAreaSize", "AirUnitCap", "NukeDamageLevel", "WorkRate", "NumFreeTechs", "RushBuilding", "BaseHurry", "HurryMultiplier", "BaseGold", "NumGoldPerEra", "SpreadReligion", "IsReligious", "CombatLimit", "RangeAttackOnlyInDomain", "RangeAttackIgnoreLOS", "RangedCombatLimit", "XPValueAttack", "XPValueDefense", "SpecialCargo", "DomainCargo", "Conscription", "ExtraMaintenanceCost", "NoMaintenance", "Unhappiness",
			("ART_DEF_UNIT_ITALIAN_INFANTRY"), "UnitArtInfoCulturalVariation", "UnitArtInfoEraVariation", "ProjectPrereq", "SpaceshipProject", "LeaderPromotion", "LeaderExperience", "DontShowYields", "ShowInPedia", "MoveRate", ("0"), "PortraitIndex", "IconAtlas", ("WW2_UNIT_FLAGS")
	FROM "Units" WHERE (Type = "UNIT_INFANTRY");
INSERT INTO "Language_en_US" ( 'Tag', 'Text' )
	VALUES ( 'TXT_KEY_UNIT_ITALIAN_INFANTRY', 'Italian Infantry' );
INSERT INTO "Unit_AITypes" ('UnitType', 'UnitAIType')
	SELECT ("UNIT_ITALIAN_INFANTRY"), "UnitAIType"
	FROM "Unit_AITypes" WHERE (UnitType = "UNIT_INFANTRY");
INSERT INTO "Unit_ClassUpgrades" ('UnitType', 'UnitClassType')
	SELECT ("UNIT_ITALIAN_INFANTRY"), "UnitClassType"
	FROM "Unit_ClassUpgrades" WHERE (UnitType = "UNIT_INFANTRY");
INSERT INTO "Civilization_UnitClassOverrides" ( 'CivilizationType', 'UnitClassType', 'UnitType' )
	VALUES ( 'CIVILIZATION_ROME', 'UNITCLASS_INFANTRY', 'UNIT_ITALIAN_INFANTRY' );
INSERT INTO "Unit_Flavors" ('UnitType', 'FlavorType', 'Flavor')
	SELECT ("UNIT_ITALIAN_INFANTRY"), "FlavorType", "Flavor"
	FROM "Unit_Flavors" WHERE (UnitType = "UNIT_INFANTRY");
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	SELECT ("UNIT_ITALIAN_INFANTRY"), "PromotionType"
	FROM "Unit_FreePromotions" WHERE (UnitType = "UNIT_INFANTRY");
INSERT INTO "Unit_ResourceQuantityRequirements" ('UnitType', 'ResourceType', 'Cost')
	SELECT ("UNIT_ITALIAN_INFANTRY"), "ResourceType", "Cost"
	FROM "Unit_ResourceQuantityRequirements" WHERE (UnitType = "UNIT_INFANTRY");
-----------

-- chinese infantry
INSERT INTO "Units" ('Type', 'Description', 'Civilopedia', 'Strategy', 'Help', 'Requirements', 'Combat', 'RangedCombat', 'Cost', 'Moves', 'Immobile', 'Range', 'BaseSightRange', 'Class', 'Special', 'Capture', 'CombatClass', 'Domain', 'CivilianAttackPriority', 'DefaultUnitAI', 'Food', 'NoBadGoodies', 'RivalTerritory', 'MilitarySupport', 'MilitaryProduction', 'Pillage', 'Found', 'FoundAbroad', 'CultureBombRadius', 'GoldenAgeTurns', 'IgnoreBuildingDefense', 'PrereqResources', 'Mechanized', 'Suicide', 'CaptureWhileEmbarked', 'PrereqTech', 'ObsoleteTech', 'GoodyHutUpgradeUnitClass', 'HurryCostModifier', 'AdvancedStartCost', 'MinAreaSize', 'AirUnitCap', 'NukeDamageLevel', 'WorkRate', 'NumFreeTechs', 'RushBuilding', 'BaseHurry', 'HurryMultiplier', 'BaseGold', 'NumGoldPerEra', 'SpreadReligion', 'IsReligious', 'CombatLimit', 'RangeAttackOnlyInDomain', 'RangeAttackIgnoreLOS', 'RangedCombatLimit', 'XPValueAttack', 'XPValueDefense', 'SpecialCargo', 'DomainCargo', 'Conscription', 'ExtraMaintenanceCost', 'NoMaintenance', 'Unhappiness', 'UnitArtInfo', 'UnitArtInfoCulturalVariation', 'UnitArtInfoEraVariation', 'ProjectPrereq', 'SpaceshipProject', 'LeaderPromotion', 'LeaderExperience', 'DontShowYields', 'ShowInPedia', 'MoveRate', 'UnitFlagIconOffset', 'PortraitIndex', 'IconAtlas', 'UnitFlagAtlas')
	SELECT	("UNIT_CHINESE_INFANTRY"), ("TXT_KEY_UNIT_CHINESE_INFANTRY"), "Civilopedia", "Strategy", "Help", "Requirements", "Combat", "RangedCombat", "Cost", "Moves", "Immobile", "Range", "BaseSightRange", "Class", "Special", "Capture", "CombatClass", "Domain", "CivilianAttackPriority", "DefaultUnitAI", "Food", "NoBadGoodies", "RivalTerritory", "MilitarySupport", "MilitaryProduction", "Pillage", "Found", "FoundAbroad", "CultureBombRadius", "GoldenAgeTurns", "IgnoreBuildingDefense", "PrereqResources", "Mechanized", "Suicide", "CaptureWhileEmbarked", "PrereqTech", "ObsoleteTech", "GoodyHutUpgradeUnitClass", "HurryCostModifier", "AdvancedStartCost", "MinAreaSize", "AirUnitCap", "NukeDamageLevel", "WorkRate", "NumFreeTechs", "RushBuilding", "BaseHurry", "HurryMultiplier", "BaseGold", "NumGoldPerEra", "SpreadReligion", "IsReligious", "CombatLimit", "RangeAttackOnlyInDomain", "RangeAttackIgnoreLOS", "RangedCombatLimit", "XPValueAttack", "XPValueDefense", "SpecialCargo", "DomainCargo", "Conscription", "ExtraMaintenanceCost", "NoMaintenance", "Unhappiness",
			("ART_DEF_UNIT_CHINESE_INFANTRY"), "UnitArtInfoCulturalVariation", "UnitArtInfoEraVariation", "ProjectPrereq", "SpaceshipProject", "LeaderPromotion", "LeaderExperience", "DontShowYields", "ShowInPedia", "MoveRate", ("0"), "PortraitIndex", "IconAtlas", ("WW2_UNIT_FLAGS")
	FROM "Units" WHERE (Type = "UNIT_INFANTRY");
INSERT INTO "Language_en_US" ( 'Tag', 'Text' )
	VALUES ( 'TXT_KEY_UNIT_CHINESE_INFANTRY', 'Chinese Infantry' );
INSERT INTO "Unit_AITypes" ('UnitType', 'UnitAIType')
	SELECT ("UNIT_CHINESE_INFANTRY"), "UnitAIType"
	FROM "Unit_AITypes" WHERE (UnitType = "UNIT_INFANTRY");
INSERT INTO "Unit_ClassUpgrades" ('UnitType', 'UnitClassType')
	SELECT ("UNIT_CHINESE_INFANTRY"), "UnitClassType"
	FROM "Unit_ClassUpgrades" WHERE (UnitType = "UNIT_INFANTRY");
INSERT INTO "Civilization_UnitClassOverrides" ( 'CivilizationType', 'UnitClassType', 'UnitType' )
	VALUES ( 'CIVILIZATION_CHINA', 'UNITCLASS_INFANTRY', 'UNIT_CHINESE_INFANTRY' );
INSERT INTO "Unit_Flavors" ('UnitType', 'FlavorType', 'Flavor')
	SELECT ("UNIT_CHINESE_INFANTRY"), "FlavorType", "Flavor"
	FROM "Unit_Flavors" WHERE (UnitType = "UNIT_INFANTRY");
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	SELECT ("UNIT_CHINESE_INFANTRY"), "PromotionType"
	FROM "Unit_FreePromotions" WHERE (UnitType = "UNIT_INFANTRY");
INSERT INTO "Unit_ResourceQuantityRequirements" ('UnitType', 'ResourceType', 'Cost')
	SELECT ("UNIT_CHINESE_INFANTRY"), "ResourceType", "Cost"
	FROM "Unit_ResourceQuantityRequirements" WHERE (UnitType = "UNIT_INFANTRY");
-----------

-- greek infantry
INSERT INTO "Units" ('Type', 'Description', 'Civilopedia', 'Strategy', 'Help', 'Requirements', 'Combat', 'RangedCombat', 'Cost', 'Moves', 'Immobile', 'Range', 'BaseSightRange', 'Class', 'Special', 'Capture', 'CombatClass', 'Domain', 'CivilianAttackPriority', 'DefaultUnitAI', 'Food', 'NoBadGoodies', 'RivalTerritory', 'MilitarySupport', 'MilitaryProduction', 'Pillage', 'Found', 'FoundAbroad', 'CultureBombRadius', 'GoldenAgeTurns', 'IgnoreBuildingDefense', 'PrereqResources', 'Mechanized', 'Suicide', 'CaptureWhileEmbarked', 'PrereqTech', 'ObsoleteTech', 'GoodyHutUpgradeUnitClass', 'HurryCostModifier', 'AdvancedStartCost', 'MinAreaSize', 'AirUnitCap', 'NukeDamageLevel', 'WorkRate', 'NumFreeTechs', 'RushBuilding', 'BaseHurry', 'HurryMultiplier', 'BaseGold', 'NumGoldPerEra', 'SpreadReligion', 'IsReligious', 'CombatLimit', 'RangeAttackOnlyInDomain', 'RangeAttackIgnoreLOS', 'RangedCombatLimit', 'XPValueAttack', 'XPValueDefense', 'SpecialCargo', 'DomainCargo', 'Conscription', 'ExtraMaintenanceCost', 'NoMaintenance', 'Unhappiness', 'UnitArtInfo', 'UnitArtInfoCulturalVariation', 'UnitArtInfoEraVariation', 'ProjectPrereq', 'SpaceshipProject', 'LeaderPromotion', 'LeaderExperience', 'DontShowYields', 'ShowInPedia', 'MoveRate', 'UnitFlagIconOffset', 'PortraitIndex', 'IconAtlas', 'UnitFlagAtlas')
	SELECT	("UNIT_GREEK_INFANTRY"), ("TXT_KEY_UNIT_GREEK_INFANTRY"), "Civilopedia", "Strategy", "Help", "Requirements", "Combat", "RangedCombat", "Cost", "Moves", "Immobile", "Range", "BaseSightRange", "Class", "Special", "Capture", "CombatClass", "Domain", "CivilianAttackPriority", "DefaultUnitAI", "Food", "NoBadGoodies", "RivalTerritory", "MilitarySupport", "MilitaryProduction", "Pillage", "Found", "FoundAbroad", "CultureBombRadius", "GoldenAgeTurns", "IgnoreBuildingDefense", "PrereqResources", "Mechanized", "Suicide", "CaptureWhileEmbarked", "PrereqTech", "ObsoleteTech", "GoodyHutUpgradeUnitClass", "HurryCostModifier", "AdvancedStartCost", "MinAreaSize", "AirUnitCap", "NukeDamageLevel", "WorkRate", "NumFreeTechs", "RushBuilding", "BaseHurry", "HurryMultiplier", "BaseGold", "NumGoldPerEra", "SpreadReligion", "IsReligious", "CombatLimit", "RangeAttackOnlyInDomain", "RangeAttackIgnoreLOS", "RangedCombatLimit", "XPValueAttack", "XPValueDefense", "SpecialCargo", "DomainCargo", "Conscription", "ExtraMaintenanceCost", "NoMaintenance", "Unhappiness",
			("ART_DEF_UNIT_GREEK_INFANTRY"), "UnitArtInfoCulturalVariation", "UnitArtInfoEraVariation", "ProjectPrereq", "SpaceshipProject", "LeaderPromotion", "LeaderExperience", "DontShowYields", "ShowInPedia", "MoveRate", ("0"), "PortraitIndex", "IconAtlas", ("WW2_UNIT_FLAGS")
	FROM "Units" WHERE (Type = "UNIT_INFANTRY");
INSERT INTO "Language_en_US" ( 'Tag', 'Text' )
	VALUES ( 'TXT_KEY_UNIT_GREEK_INFANTRY', 'Greek Infantry' );
INSERT INTO "Unit_AITypes" ('UnitType', 'UnitAIType')
	SELECT ("UNIT_GREEK_INFANTRY"), "UnitAIType"
	FROM "Unit_AITypes" WHERE (UnitType = "UNIT_INFANTRY");
INSERT INTO "Unit_ClassUpgrades" ('UnitType', 'UnitClassType')
	SELECT ("UNIT_GREEK_INFANTRY"), "UnitClassType"
	FROM "Unit_ClassUpgrades" WHERE (UnitType = "UNIT_INFANTRY");
INSERT INTO "Civilization_UnitClassOverrides" ( 'CivilizationType', 'UnitClassType', 'UnitType' )
	VALUES ( 'CIVILIZATION_GREECE', 'UNITCLASS_INFANTRY', 'UNIT_GREEK_INFANTRY' );
INSERT INTO "Unit_Flavors" ('UnitType', 'FlavorType', 'Flavor')
	SELECT ("UNIT_GREEK_INFANTRY"), "FlavorType", "Flavor"
	FROM "Unit_Flavors" WHERE (UnitType = "UNIT_INFANTRY");
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	SELECT ("UNIT_GREEK_INFANTRY"), "PromotionType"
	FROM "Unit_FreePromotions" WHERE (UnitType = "UNIT_INFANTRY");
INSERT INTO "Unit_ResourceQuantityRequirements" ('UnitType', 'ResourceType', 'Cost')
	SELECT ("UNIT_GREEK_INFANTRY"), "ResourceType", "Cost"
	FROM "Unit_ResourceQuantityRequirements" WHERE (UnitType = "UNIT_INFANTRY");
-----------

-- poland infantry
INSERT INTO "Units" ('Type', 'Description', 'Civilopedia', 'Strategy', 'Help', 'Requirements', 'Combat', 'RangedCombat', 'Cost', 'Moves', 'Immobile', 'Range', 'BaseSightRange', 'Class', 'Special', 'Capture', 'CombatClass', 'Domain', 'CivilianAttackPriority', 'DefaultUnitAI', 'Food', 'NoBadGoodies', 'RivalTerritory', 'MilitarySupport', 'MilitaryProduction', 'Pillage', 'Found', 'FoundAbroad', 'CultureBombRadius', 'GoldenAgeTurns', 'IgnoreBuildingDefense', 'PrereqResources', 'Mechanized', 'Suicide', 'CaptureWhileEmbarked', 'PrereqTech', 'ObsoleteTech', 'GoodyHutUpgradeUnitClass', 'HurryCostModifier', 'AdvancedStartCost', 'MinAreaSize', 'AirUnitCap', 'NukeDamageLevel', 'WorkRate', 'NumFreeTechs', 'RushBuilding', 'BaseHurry', 'HurryMultiplier', 'BaseGold', 'NumGoldPerEra', 'SpreadReligion', 'IsReligious', 'CombatLimit', 'RangeAttackOnlyInDomain', 'RangeAttackIgnoreLOS', 'RangedCombatLimit', 'XPValueAttack', 'XPValueDefense', 'SpecialCargo', 'DomainCargo', 'Conscription', 'ExtraMaintenanceCost', 'NoMaintenance', 'Unhappiness', 'UnitArtInfo', 'UnitArtInfoCulturalVariation', 'UnitArtInfoEraVariation', 'ProjectPrereq', 'SpaceshipProject', 'LeaderPromotion', 'LeaderExperience', 'DontShowYields', 'ShowInPedia', 'MoveRate', 'UnitFlagIconOffset', 'PortraitIndex', 'IconAtlas', 'UnitFlagAtlas')
	SELECT	("UNIT_POLAND_INFANTRY"), ("TXT_KEY_UNIT_POLAND_INFANTRY"), "Civilopedia", "Strategy", "Help", "Requirements", "Combat", "RangedCombat", "Cost", "Moves", "Immobile", "Range", "BaseSightRange", "Class", "Special", "Capture", "CombatClass", "Domain", "CivilianAttackPriority", "DefaultUnitAI", "Food", "NoBadGoodies", "RivalTerritory", "MilitarySupport", "MilitaryProduction", "Pillage", "Found", "FoundAbroad", "CultureBombRadius", "GoldenAgeTurns", "IgnoreBuildingDefense", "PrereqResources", "Mechanized", "Suicide", "CaptureWhileEmbarked", "PrereqTech", "ObsoleteTech", "GoodyHutUpgradeUnitClass", "HurryCostModifier", "AdvancedStartCost", "MinAreaSize", "AirUnitCap", "NukeDamageLevel", "WorkRate", "NumFreeTechs", "RushBuilding", "BaseHurry", "HurryMultiplier", "BaseGold", "NumGoldPerEra", "SpreadReligion", "IsReligious", "CombatLimit", "RangeAttackOnlyInDomain", "RangeAttackIgnoreLOS", "RangedCombatLimit", "XPValueAttack", "XPValueDefense", "SpecialCargo", "DomainCargo", "Conscription", "ExtraMaintenanceCost", "NoMaintenance", "Unhappiness",
			("ART_DEF_UNIT_POLAND_INFANTRY"), "UnitArtInfoCulturalVariation", "UnitArtInfoEraVariation", "ProjectPrereq", "SpaceshipProject", "LeaderPromotion", "LeaderExperience", "DontShowYields", "ShowInPedia", "MoveRate", ("0"), "PortraitIndex", "IconAtlas", ("WW2_UNIT_FLAGS")
	FROM "Units" WHERE (Type = "UNIT_INFANTRY");
INSERT INTO "Language_en_US" ( 'Tag', 'Text' )
	VALUES ( 'TXT_KEY_UNIT_POLAND_INFANTRY', 'Poland Infantry' );
INSERT INTO "Unit_AITypes" ('UnitType', 'UnitAIType')
	SELECT ("UNIT_POLAND_INFANTRY"), "UnitAIType"
	FROM "Unit_AITypes" WHERE (UnitType = "UNIT_INFANTRY");
INSERT INTO "Unit_ClassUpgrades" ('UnitType', 'UnitClassType')
	SELECT ("UNIT_POLAND_INFANTRY"), "UnitClassType"
	FROM "Unit_ClassUpgrades" WHERE (UnitType = "UNIT_INFANTRY");
--INSERT INTO "Civilization_UnitClassOverrides" ( 'CivilizationType', 'UnitClassType', 'UnitType' )
--	VALUES ( 'CIVILIZATION_POLAND', 'UNITCLASS_INFANTRY', 'UNIT_POLAND_INFANTRY' );
INSERT INTO "Unit_Flavors" ('UnitType', 'FlavorType', 'Flavor')
	SELECT ("UNIT_POLAND_INFANTRY"), "FlavorType", "Flavor"
	FROM "Unit_Flavors" WHERE (UnitType = "UNIT_INFANTRY");
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	SELECT ("UNIT_POLAND_INFANTRY"), "PromotionType"
	FROM "Unit_FreePromotions" WHERE (UnitType = "UNIT_INFANTRY");
INSERT INTO "Unit_ResourceQuantityRequirements" ('UnitType', 'ResourceType', 'Cost')
	SELECT ("UNIT_POLAND_INFANTRY"), "ResourceType", "Cost"
	FROM "Unit_ResourceQuantityRequirements" WHERE (UnitType = "UNIT_INFANTRY");
-----------


--------------------------------------------------------------
-- Special Forces
--------------------------------------------------------------

-- french Special forces
INSERT INTO "Units" ('Type', 'Description', 'Civilopedia', 'Strategy', 'Help', 'Requirements', 'Combat', 'RangedCombat', 'Cost', 'Moves', 'Immobile', 'Range', 'BaseSightRange', 'Class', 'Special', 'Capture', 'CombatClass', 'Domain', 'CivilianAttackPriority', 'DefaultUnitAI', 'Food', 'NoBadGoodies', 'RivalTerritory', 'MilitarySupport', 'MilitaryProduction', 'Pillage', 'Found', 'FoundAbroad', 'CultureBombRadius', 'GoldenAgeTurns', 'IgnoreBuildingDefense', 'PrereqResources', 'Mechanized', 'Suicide', 'CaptureWhileEmbarked', 'PrereqTech', 'ObsoleteTech', 'GoodyHutUpgradeUnitClass', 'HurryCostModifier', 'AdvancedStartCost', 'MinAreaSize', 'AirUnitCap', 'NukeDamageLevel', 'WorkRate', 'NumFreeTechs', 'RushBuilding', 'BaseHurry', 'HurryMultiplier', 'BaseGold', 'NumGoldPerEra', 'SpreadReligion', 'IsReligious', 'CombatLimit', 'RangeAttackOnlyInDomain', 'RangeAttackIgnoreLOS', 'RangedCombatLimit', 'XPValueAttack', 'XPValueDefense', 'SpecialCargo', 'DomainCargo', 'Conscription', 'ExtraMaintenanceCost', 'NoMaintenance', 'Unhappiness', 'UnitArtInfo', 'UnitArtInfoCulturalVariation', 'UnitArtInfoEraVariation', 'ProjectPrereq', 'SpaceshipProject', 'LeaderPromotion', 'LeaderExperience', 'DontShowYields', 'ShowInPedia', 'MoveRate', 'UnitFlagIconOffset', 'PortraitIndex', 'IconAtlas', 'UnitFlagAtlas')
	SELECT	("UNIT_FRENCH_SPECIAL_FORCES"), ("TXT_KEY_UNIT_FRENCH_FOREIGNLEGION"), ("TXT_KEY_CIV5_INDUSTRIAL_FOREIGNLEGION_TEXT"), ("TXT_KEY_UNIT_FRENCH_FOREIGNLEGION_STRATEGY"), ("TXT_KEY_UNIT_HELP_FOREIGN_LEGION"), "Requirements", "Combat", "RangedCombat", "Cost", "Moves", "Immobile", "Range", "BaseSightRange", "Class", "Special", "Capture", "CombatClass", "Domain", "CivilianAttackPriority", "DefaultUnitAI", "Food", "NoBadGoodies", "RivalTerritory", "MilitarySupport", "MilitaryProduction", "Pillage", "Found", "FoundAbroad", "CultureBombRadius", "GoldenAgeTurns", "IgnoreBuildingDefense", "PrereqResources", "Mechanized", "Suicide", "CaptureWhileEmbarked", "PrereqTech", "ObsoleteTech", "GoodyHutUpgradeUnitClass", "HurryCostModifier", "AdvancedStartCost", "MinAreaSize", "AirUnitCap", "NukeDamageLevel", "WorkRate", "NumFreeTechs", "RushBuilding", "BaseHurry", "HurryMultiplier", "BaseGold", "NumGoldPerEra", "SpreadReligion", "IsReligious", "CombatLimit", "RangeAttackOnlyInDomain", "RangeAttackIgnoreLOS", "RangedCombatLimit", "XPValueAttack", "XPValueDefense", "SpecialCargo", "DomainCargo", "Conscription", "ExtraMaintenanceCost", "NoMaintenance", "Unhappiness",
			("ART_DEF_UNIT_U_FRENCH_FOREIGNLEGION"), "UnitArtInfoCulturalVariation", "UnitArtInfoEraVariation", "ProjectPrereq", "SpaceshipProject", "LeaderPromotion", "LeaderExperience", "DontShowYields", "ShowInPedia", "MoveRate", 
			"UnitFlagIconOffset", (38), "IconAtlas", "UnitFlagAtlas"
			--"UnitFlagIconOffset", (2), "WW2_UNIT_ICONS", "UnitFlagAtlas" -- preview icons
	FROM "Units" WHERE (Type = "UNIT_SPECIAL_FORCES");
--INSERT INTO "Language_en_US" ( 'Tag', 'Text' )
--	VALUES ( 'TXT_KEY_UNIT_FRENCH_SPECIAL_FORCES', 'French Infantry' );
INSERT INTO "Unit_AITypes" ('UnitType', 'UnitAIType')
	SELECT ("UNIT_FRENCH_SPECIAL_FORCES"), "UnitAIType"
	FROM "Unit_AITypes" WHERE (UnitType = "UNIT_SPECIAL_FORCES");
INSERT INTO "Unit_ClassUpgrades" ('UnitType', 'UnitClassType')
	SELECT ("UNIT_FRENCH_SPECIAL_FORCES"), "UnitClassType"
	FROM "Unit_ClassUpgrades" WHERE (UnitType = "UNIT_SPECIAL_FORCES");
INSERT INTO "Civilization_UnitClassOverrides" ( 'CivilizationType', 'UnitClassType', 'UnitType' )
	VALUES ( 'CIVILIZATION_FRANCE', 'UNITCLASS_SPECIAL_FORCES', 'UNIT_FRENCH_SPECIAL_FORCES' );
INSERT INTO "Unit_Flavors" ('UnitType', 'FlavorType', 'Flavor')
	SELECT ("UNIT_FRENCH_SPECIAL_FORCES"), "FlavorType", "Flavor"
	FROM "Unit_Flavors" WHERE (UnitType = "UNIT_SPECIAL_FORCES");
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	SELECT ("UNIT_FRENCH_SPECIAL_FORCES"), "PromotionType"
	FROM "Unit_FreePromotions" WHERE (UnitType = "UNIT_SPECIAL_FORCES");
-- Foreign Legion	
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	VALUES ( 'UNIT_FRENCH_SPECIAL_FORCES', 'PROMOTION_FOREIGN_LANDS' );
INSERT INTO "Unit_ResourceQuantityRequirements" ('UnitType', 'ResourceType', 'Cost')
	SELECT ("UNIT_FRENCH_SPECIAL_FORCES"), "ResourceType", "Cost"
	FROM "Unit_ResourceQuantityRequirements" WHERE (UnitType = "UNIT_SPECIAL_FORCES");
-----------


--------------------------------------------------------------
-- Paratrooper
--------------------------------------------------------------

-- german paratrooper
INSERT INTO "Units" ('Type', 'Description', 'Civilopedia', 'Strategy', 'Help', 'Requirements', 'Combat', 'RangedCombat', 'Cost', 'Moves', 'Immobile', 'Range', 'BaseSightRange', 'Class', 'Special', 'Capture', 'CombatClass', 'Domain', 'CivilianAttackPriority', 'DefaultUnitAI', 'Food', 'NoBadGoodies', 'RivalTerritory', 'MilitarySupport', 'MilitaryProduction', 'Pillage', 'Found', 'FoundAbroad', 'CultureBombRadius', 'GoldenAgeTurns', 'IgnoreBuildingDefense', 'PrereqResources', 'Mechanized', 'Suicide', 'CaptureWhileEmbarked', 'PrereqTech', 'ObsoleteTech', 'GoodyHutUpgradeUnitClass', 'HurryCostModifier', 'AdvancedStartCost', 'MinAreaSize', 'AirUnitCap', 'NukeDamageLevel', 'WorkRate', 'NumFreeTechs', 'RushBuilding', 'BaseHurry', 'HurryMultiplier', 'BaseGold', 'NumGoldPerEra', 'SpreadReligion', 'IsReligious', 'CombatLimit', 'RangeAttackOnlyInDomain', 'RangeAttackIgnoreLOS', 'RangedCombatLimit', 'XPValueAttack', 'XPValueDefense', 'SpecialCargo', 'DomainCargo', 'Conscription', 'ExtraMaintenanceCost', 'NoMaintenance', 'Unhappiness', 'UnitArtInfo', 'UnitArtInfoCulturalVariation', 'UnitArtInfoEraVariation', 'ProjectPrereq', 'SpaceshipProject', 'LeaderPromotion', 'LeaderExperience', 'DontShowYields', 'ShowInPedia', 'MoveRate', 'UnitFlagIconOffset', 'PortraitIndex', 'IconAtlas', 'UnitFlagAtlas')
	SELECT	("UNIT_GERMAN_PARATROOPER"), ("TXT_KEY_UNIT_GERMAN_PARATROOPER"), "Civilopedia", "Strategy", "Help", "Requirements", "Combat", "RangedCombat", "Cost", "Moves", "Immobile", "Range", "BaseSightRange", "Class", "Special", "Capture", "CombatClass", "Domain", "CivilianAttackPriority", "DefaultUnitAI", "Food", "NoBadGoodies", "RivalTerritory", "MilitarySupport", "MilitaryProduction", "Pillage", "Found", "FoundAbroad", "CultureBombRadius", "GoldenAgeTurns", "IgnoreBuildingDefense", "PrereqResources", "Mechanized", "Suicide", "CaptureWhileEmbarked", "PrereqTech", "ObsoleteTech", "GoodyHutUpgradeUnitClass", "HurryCostModifier", "AdvancedStartCost", "MinAreaSize", "AirUnitCap", "NukeDamageLevel", "WorkRate", "NumFreeTechs", "RushBuilding", "BaseHurry", "HurryMultiplier", "BaseGold", "NumGoldPerEra", "SpreadReligion", "IsReligious", "CombatLimit", "RangeAttackOnlyInDomain", "RangeAttackIgnoreLOS", "RangedCombatLimit", "XPValueAttack", "XPValueDefense", "SpecialCargo", "DomainCargo", "Conscription", "ExtraMaintenanceCost", "NoMaintenance", "Unhappiness",
			("ART_DEF_UNIT_GERMAN_PARATROOPER"), "UnitArtInfoCulturalVariation", "UnitArtInfoEraVariation", "ProjectPrereq", "SpaceshipProject", "LeaderPromotion", "LeaderExperience", "DontShowYields", "ShowInPedia", "MoveRate",
			"UnitFlagIconOffset", ("0"), ("WW2_INFANTRY01_ATLAS"), "UnitFlagAtlas"
	FROM "Units" WHERE (Type = "UNIT_PARATROOPER");
INSERT INTO "Language_en_US" ( 'Tag', 'Text' )
	VALUES ( 'TXT_KEY_UNIT_GERMAN_PARATROOPER', 'German Paratrooper' );
INSERT INTO "Unit_AITypes" ('UnitType', 'UnitAIType')
	SELECT ("UNIT_GERMAN_PARATROOPER"), "UnitAIType"
	FROM "Unit_AITypes" WHERE (UnitType = "UNIT_PARATROOPER");
INSERT INTO "Unit_ClassUpgrades" ('UnitType', 'UnitClassType')
	SELECT ("UNIT_GERMAN_PARATROOPER"), "UnitClassType"
	FROM "Unit_ClassUpgrades" WHERE (UnitType = "UNIT_PARATROOPER");
INSERT INTO "Civilization_UnitClassOverrides" ( 'CivilizationType', 'UnitClassType', 'UnitType' )
	VALUES ( 'CIVILIZATION_GERMANY', 'UNITCLASS_PARATROOPER', 'UNIT_GERMAN_PARATROOPER' );
INSERT INTO "Unit_Flavors" ('UnitType', 'FlavorType', 'Flavor')
	SELECT ("UNIT_GERMAN_PARATROOPER"), "FlavorType", "Flavor"
	FROM "Unit_Flavors" WHERE (UnitType = "UNIT_PARATROOPER");
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	SELECT ("UNIT_GERMAN_PARATROOPER"), "PromotionType"
	FROM "Unit_FreePromotions" WHERE (UnitType = "UNIT_PARATROOPER");
INSERT INTO "Unit_ResourceQuantityRequirements" ('UnitType', 'ResourceType', 'Cost')
	SELECT ("UNIT_GERMAN_PARATROOPER"), "ResourceType", "Cost"
	FROM "Unit_ResourceQuantityRequirements" WHERE (UnitType = "UNIT_PARATROOPER");
-----------