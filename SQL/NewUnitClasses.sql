--------------------------------------------------------------
-- Land
--------------------------------------------------------------

UPDATE UnitClasses SET DefaultUnit ='UNIT_TANK_CIV4' WHERE Type = 'UNITCLASS_TANK';

-- Paratrooper
-- Already existing in vanilla !
DELETE FROM UnitClasses WHERE Type='UNITCLASS_PARATROOPER';
INSERT INTO "UnitClasses" ('Type', 'Description', 'MaxGlobalInstances', 'MaxTeamInstances', 'MaxPlayerInstances', 'InstanceCostModifier', 'DefaultUnit' )
	SELECT ("UNITCLASS_PARATROOPER"), ("TXT_KEY_UNIT_PARATROOPER"), "MaxGlobalInstances", "MaxTeamInstances", "MaxPlayerInstances", "InstanceCostModifier", "DefaultUnit"
	FROM "UnitClasses" WHERE (Type = "UNITCLASS_INFANTRY");

-- Special forces
INSERT INTO "UnitClasses" ('Type', 'Description', 'MaxGlobalInstances', 'MaxTeamInstances', 'MaxPlayerInstances', 'InstanceCostModifier', 'DefaultUnit' )
	SELECT ("UNITCLASS_SPECIAL_FORCES"), ("TXT_KEY_UNIT_SPECIAL_FORCES"), "MaxGlobalInstances", "MaxTeamInstances", "MaxPlayerInstances", "InstanceCostModifier", "DefaultUnit"
	FROM "UnitClasses" WHERE (Type = "UNITCLASS_INFANTRY");

-- Mechanized Infantry
-- Already existing in vanilla !
DELETE FROM UnitClasses WHERE Type='UNITCLASS_MECHANIZED_INFANTRY';
INSERT INTO "UnitClasses" ('Type', 'Description', 'MaxGlobalInstances', 'MaxTeamInstances', 'MaxPlayerInstances', 'InstanceCostModifier', 'DefaultUnit' )
	SELECT ("UNITCLASS_MECHANIZED_INFANTRY"), ("TXT_KEY_UNIT_MECHANIZED_INFANTRY"), "MaxGlobalInstances", "MaxTeamInstances", "MaxPlayerInstances", "InstanceCostModifier", "DefaultUnit"
	FROM "UnitClasses" WHERE (Type = "UNITCLASS_INFANTRY");

-- Mechanized Infantry 2
INSERT INTO "UnitClasses" ('Type', 'Description', 'MaxGlobalInstances', 'MaxTeamInstances', 'MaxPlayerInstances', 'InstanceCostModifier', 'DefaultUnit' )
	SELECT ("UNITCLASS_MECHANIZED_INFANTRY_2"), ("TXT_KEY_UNIT_MECHANIZED_INFANTRY"), "MaxGlobalInstances", "MaxTeamInstances", "MaxPlayerInstances", "InstanceCostModifier", "DefaultUnit"
	FROM "UnitClasses" WHERE (Type = "UNITCLASS_INFANTRY");

-- Old Light Tank
INSERT INTO "UnitClasses" ('Type', 'Description', 'MaxGlobalInstances', 'MaxTeamInstances', 'MaxPlayerInstances', 'InstanceCostModifier', 'DefaultUnit' )
	SELECT ("UNITCLASS_OLD_LIGHT_TANK"), ("TXT_KEY_UNIT_LIGHT_TANK"), "MaxGlobalInstances", "MaxTeamInstances", "MaxPlayerInstances", "InstanceCostModifier", "DefaultUnit"
	FROM "UnitClasses" WHERE (Type = "UNITCLASS_TANK");

-- Light Tank
INSERT INTO "UnitClasses" ('Type', 'Description', 'MaxGlobalInstances', 'MaxTeamInstances', 'MaxPlayerInstances', 'InstanceCostModifier', 'DefaultUnit' )
	SELECT ("UNITCLASS_LIGHT_TANK"), ("TXT_KEY_UNIT_LIGHT_TANK"), "MaxGlobalInstances", "MaxTeamInstances", "MaxPlayerInstances", "InstanceCostModifier", "DefaultUnit"
	FROM "UnitClasses" WHERE (Type = "UNITCLASS_TANK");

-- Light Tank 2
INSERT INTO "UnitClasses" ('Type', 'Description', 'MaxGlobalInstances', 'MaxTeamInstances', 'MaxPlayerInstances', 'InstanceCostModifier', 'DefaultUnit' )
	SELECT ("UNITCLASS_LIGHT_TANK_2"), ("TXT_KEY_UNIT_LIGHT_TANK"), "MaxGlobalInstances", "MaxTeamInstances", "MaxPlayerInstances", "InstanceCostModifier", "DefaultUnit"
	FROM "UnitClasses" WHERE (Type = "UNITCLASS_TANK");

-- Light Tank 2 B
INSERT INTO "UnitClasses" ('Type', 'Description', 'MaxGlobalInstances', 'MaxTeamInstances', 'MaxPlayerInstances', 'InstanceCostModifier', 'DefaultUnit' )
	SELECT ("UNITCLASS_LIGHT_TANK_2_B"), ("TXT_KEY_UNIT_LIGHT_TANK"), "MaxGlobalInstances", "MaxTeamInstances", "MaxPlayerInstances", "InstanceCostModifier", "DefaultUnit"
	FROM "UnitClasses" WHERE (Type = "UNITCLASS_TANK");

-- Light Tank 3
INSERT INTO "UnitClasses" ('Type', 'Description', 'MaxGlobalInstances', 'MaxTeamInstances', 'MaxPlayerInstances', 'InstanceCostModifier', 'DefaultUnit' )
	SELECT ("UNITCLASS_LIGHT_TANK_3"), ("TXT_KEY_UNIT_LIGHT_TANK"), "MaxGlobalInstances", "MaxTeamInstances", "MaxPlayerInstances", "InstanceCostModifier", "DefaultUnit"
	FROM "UnitClasses" WHERE (Type = "UNITCLASS_TANK");

-- Light Tank Destroyer
INSERT INTO "UnitClasses" ('Type', 'Description', 'MaxGlobalInstances', 'MaxTeamInstances', 'MaxPlayerInstances', 'InstanceCostModifier', 'DefaultUnit' )
	SELECT ("UNITCLASS_LIGHT_TANK_DESTROYER"), ("TXT_KEY_UNIT_LIGHT_TANK_DESTROYER"), "MaxGlobalInstances", "MaxTeamInstances", "MaxPlayerInstances", "InstanceCostModifier", "DefaultUnit"
	FROM "UnitClasses" WHERE (Type = "UNITCLASS_TANK");

-- Light Tank Destroyer 2
INSERT INTO "UnitClasses" ('Type', 'Description', 'MaxGlobalInstances', 'MaxTeamInstances', 'MaxPlayerInstances', 'InstanceCostModifier', 'DefaultUnit' )
	SELECT ("UNITCLASS_LIGHT_TANK_DESTROYER_2"), ("TXT_KEY_UNIT_LIGHT_TANK_DESTROYER"), "MaxGlobalInstances", "MaxTeamInstances", "MaxPlayerInstances", "InstanceCostModifier", "DefaultUnit"
	FROM "UnitClasses" WHERE (Type = "UNITCLASS_TANK");


-- Light Tank Destroyer 2 B
INSERT INTO "UnitClasses" ('Type', 'Description', 'MaxGlobalInstances', 'MaxTeamInstances', 'MaxPlayerInstances', 'InstanceCostModifier', 'DefaultUnit' )
	SELECT ("UNITCLASS_LIGHT_TANK_DESTROYER_2_B"), ("TXT_KEY_UNIT_LIGHT_TANK_DESTROYER"), "MaxGlobalInstances", "MaxTeamInstances", "MaxPlayerInstances", "InstanceCostModifier", "DefaultUnit"
	FROM "UnitClasses" WHERE (Type = "UNITCLASS_TANK");


-- Light Tank Destroyer 3
INSERT INTO "UnitClasses" ('Type', 'Description', 'MaxGlobalInstances', 'MaxTeamInstances', 'MaxPlayerInstances', 'InstanceCostModifier', 'DefaultUnit' )
	SELECT ("UNITCLASS_LIGHT_TANK_DESTROYER_3"), ("TXT_KEY_UNIT_LIGHT_TANK_DESTROYER"), "MaxGlobalInstances", "MaxTeamInstances", "MaxPlayerInstances", "InstanceCostModifier", "DefaultUnit"
	FROM "UnitClasses" WHERE (Type = "UNITCLASS_TANK");


-- Light Tank Destroyer 4
INSERT INTO "UnitClasses" ('Type', 'Description', 'MaxGlobalInstances', 'MaxTeamInstances', 'MaxPlayerInstances', 'InstanceCostModifier', 'DefaultUnit' )
	SELECT ("UNITCLASS_LIGHT_TANK_DESTROYER_4"), ("TXT_KEY_UNIT_LIGHT_TANK_DESTROYER"), "MaxGlobalInstances", "MaxTeamInstances", "MaxPlayerInstances", "InstanceCostModifier", "DefaultUnit"
	FROM "UnitClasses" WHERE (Type = "UNITCLASS_TANK");


-- Light Tank Destroyer 4 B
INSERT INTO "UnitClasses" ('Type', 'Description', 'MaxGlobalInstances', 'MaxTeamInstances', 'MaxPlayerInstances', 'InstanceCostModifier', 'DefaultUnit' )
	SELECT ("UNITCLASS_LIGHT_TANK_DESTROYER_4_B"), ("TXT_KEY_UNIT_LIGHT_TANK_DESTROYER"), "MaxGlobalInstances", "MaxTeamInstances", "MaxPlayerInstances", "InstanceCostModifier", "DefaultUnit"
	FROM "UnitClasses" WHERE (Type = "UNITCLASS_TANK");


-- Light Tank Destroyer 4 C 
INSERT INTO "UnitClasses" ('Type', 'Description', 'MaxGlobalInstances', 'MaxTeamInstances', 'MaxPlayerInstances', 'InstanceCostModifier', 'DefaultUnit' )
	SELECT ("UNITCLASS_LIGHT_TANK_DESTROYER_4_C"), ("TXT_KEY_UNIT_LIGHT_TANK_DESTROYER"), "MaxGlobalInstances", "MaxTeamInstances", "MaxPlayerInstances", "InstanceCostModifier", "DefaultUnit"
	FROM "UnitClasses" WHERE (Type = "UNITCLASS_TANK");


-- Light Tank Destroyer 5
INSERT INTO "UnitClasses" ('Type', 'Description', 'MaxGlobalInstances', 'MaxTeamInstances', 'MaxPlayerInstances', 'InstanceCostModifier', 'DefaultUnit' )
	SELECT ("UNITCLASS_LIGHT_TANK_DESTROYER_5"), ("TXT_KEY_UNIT_LIGHT_TANK_DESTROYER"), "MaxGlobalInstances", "MaxTeamInstances", "MaxPlayerInstances", "InstanceCostModifier", "DefaultUnit"
	FROM "UnitClasses" WHERE (Type = "UNITCLASS_TANK");

-- Cruiser Tank
INSERT INTO "UnitClasses" ('Type', 'Description', 'MaxGlobalInstances', 'MaxTeamInstances', 'MaxPlayerInstances', 'InstanceCostModifier', 'DefaultUnit' )
	SELECT ("UNITCLASS_CRUISER_TANK"), ("TXT_KEY_UNIT_CRUISER_TANK"), "MaxGlobalInstances", "MaxTeamInstances", "MaxPlayerInstances", "InstanceCostModifier", "DefaultUnit"
	FROM "UnitClasses" WHERE (Type = "UNITCLASS_TANK");

-- Cruiser Tank B
INSERT INTO "UnitClasses" ('Type', 'Description', 'MaxGlobalInstances', 'MaxTeamInstances', 'MaxPlayerInstances', 'InstanceCostModifier', 'DefaultUnit' )
	SELECT ("UNITCLASS_CRUISER_TANK_B"), ("TXT_KEY_UNIT_CRUISER_TANK"), "MaxGlobalInstances", "MaxTeamInstances", "MaxPlayerInstances", "InstanceCostModifier", "DefaultUnit"
	FROM "UnitClasses" WHERE (Type = "UNITCLASS_TANK");

-- Cruiser Tank 2
INSERT INTO "UnitClasses" ('Type', 'Description', 'MaxGlobalInstances', 'MaxTeamInstances', 'MaxPlayerInstances', 'InstanceCostModifier', 'DefaultUnit' )
	SELECT ("UNITCLASS_CRUISER_TANK_2"), ("TXT_KEY_UNIT_CRUISER_TANK"), "MaxGlobalInstances", "MaxTeamInstances", "MaxPlayerInstances", "InstanceCostModifier", "DefaultUnit"
	FROM "UnitClasses" WHERE (Type = "UNITCLASS_TANK");

-- Cruiser Tank 2 B
INSERT INTO "UnitClasses" ('Type', 'Description', 'MaxGlobalInstances', 'MaxTeamInstances', 'MaxPlayerInstances', 'InstanceCostModifier', 'DefaultUnit' )
	SELECT ("UNITCLASS_CRUISER_TANK_2_B"), ("TXT_KEY_UNIT_CRUISER_TANK"), "MaxGlobalInstances", "MaxTeamInstances", "MaxPlayerInstances", "InstanceCostModifier", "DefaultUnit"
	FROM "UnitClasses" WHERE (Type = "UNITCLASS_TANK");

-- Cruiser Tank 3
INSERT INTO "UnitClasses" ('Type', 'Description', 'MaxGlobalInstances', 'MaxTeamInstances', 'MaxPlayerInstances', 'InstanceCostModifier', 'DefaultUnit' )
	SELECT ("UNITCLASS_CRUISER_TANK_3"), ("TXT_KEY_UNIT_CRUISER_TANK"), "MaxGlobalInstances", "MaxTeamInstances", "MaxPlayerInstances", "InstanceCostModifier", "DefaultUnit"
	FROM "UnitClasses" WHERE (Type = "UNITCLASS_TANK");

-- Cruiser Tank 4
INSERT INTO "UnitClasses" ('Type', 'Description', 'MaxGlobalInstances', 'MaxTeamInstances', 'MaxPlayerInstances', 'InstanceCostModifier', 'DefaultUnit' )
	SELECT ("UNITCLASS_CRUISER_TANK_4"), ("TXT_KEY_UNIT_CRUISER_TANK"), "MaxGlobalInstances", "MaxTeamInstances", "MaxPlayerInstances", "InstanceCostModifier", "DefaultUnit"
	FROM "UnitClasses" WHERE (Type = "UNITCLASS_TANK");

-- Cruiser Tank 4 B
INSERT INTO "UnitClasses" ('Type', 'Description', 'MaxGlobalInstances', 'MaxTeamInstances', 'MaxPlayerInstances', 'InstanceCostModifier', 'DefaultUnit' )
	SELECT ("UNITCLASS_CRUISER_TANK_4_B"), ("TXT_KEY_UNIT_CRUISER_TANK"), "MaxGlobalInstances", "MaxTeamInstances", "MaxPlayerInstances", "InstanceCostModifier", "DefaultUnit"
	FROM "UnitClasses" WHERE (Type = "UNITCLASS_TANK");

-- Cruiser Tank 5
INSERT INTO "UnitClasses" ('Type', 'Description', 'MaxGlobalInstances', 'MaxTeamInstances', 'MaxPlayerInstances', 'InstanceCostModifier', 'DefaultUnit' )
	SELECT ("UNITCLASS_CRUISER_TANK_5"), ("TXT_KEY_UNIT_CRUISER_TANK"), "MaxGlobalInstances", "MaxTeamInstances", "MaxPlayerInstances", "InstanceCostModifier", "DefaultUnit"
	FROM "UnitClasses" WHERE (Type = "UNITCLASS_TANK");

-- Cruiser Tank 5 B
INSERT INTO "UnitClasses" ('Type', 'Description', 'MaxGlobalInstances', 'MaxTeamInstances', 'MaxPlayerInstances', 'InstanceCostModifier', 'DefaultUnit' )
	SELECT ("UNITCLASS_CRUISER_TANK_5_B"), ("TXT_KEY_UNIT_CRUISER_TANK"), "MaxGlobalInstances", "MaxTeamInstances", "MaxPlayerInstances", "InstanceCostModifier", "DefaultUnit"
	FROM "UnitClasses" WHERE (Type = "UNITCLASS_TANK");

-- Cruiser Tank 5 C
INSERT INTO "UnitClasses" ('Type', 'Description', 'MaxGlobalInstances', 'MaxTeamInstances', 'MaxPlayerInstances', 'InstanceCostModifier', 'DefaultUnit' )
	SELECT ("UNITCLASS_CRUISER_TANK_5_C"), ("TXT_KEY_UNIT_CRUISER_TANK"), "MaxGlobalInstances", "MaxTeamInstances", "MaxPlayerInstances", "InstanceCostModifier", "DefaultUnit"
	FROM "UnitClasses" WHERE (Type = "UNITCLASS_TANK");

-- Cruiser Tank 6
INSERT INTO "UnitClasses" ('Type', 'Description', 'MaxGlobalInstances', 'MaxTeamInstances', 'MaxPlayerInstances', 'InstanceCostModifier', 'DefaultUnit' )
	SELECT ("UNITCLASS_CRUISER_TANK_6"), ("TXT_KEY_UNIT_CRUISER_TANK"), "MaxGlobalInstances", "MaxTeamInstances", "MaxPlayerInstances", "InstanceCostModifier", "DefaultUnit"
	FROM "UnitClasses" WHERE (Type = "UNITCLASS_TANK");

-- Cruiser Tank 7
INSERT INTO "UnitClasses" ('Type', 'Description', 'MaxGlobalInstances', 'MaxTeamInstances', 'MaxPlayerInstances', 'InstanceCostModifier', 'DefaultUnit' )
	SELECT ("UNITCLASS_CRUISER_TANK_7"), ("TXT_KEY_UNIT_CRUISER_TANK"), "MaxGlobalInstances", "MaxTeamInstances", "MaxPlayerInstances", "InstanceCostModifier", "DefaultUnit"
	FROM "UnitClasses" WHERE (Type = "UNITCLASS_TANK");

-- Obsolete Tank
INSERT INTO "UnitClasses" ('Type', 'Description', 'MaxGlobalInstances', 'MaxTeamInstances', 'MaxPlayerInstances', 'InstanceCostModifier', 'DefaultUnit' )
	SELECT ("UNITCLASS_OLD_TANK"), "Description", "MaxGlobalInstances", "MaxTeamInstances", "MaxPlayerInstances", "InstanceCostModifier", "DefaultUnit"
	FROM "UnitClasses" WHERE (Type = "UNITCLASS_TANK");

-- Tank B
INSERT INTO "UnitClasses" ('Type', 'Description', 'MaxGlobalInstances', 'MaxTeamInstances', 'MaxPlayerInstances', 'InstanceCostModifier', 'DefaultUnit' )
	SELECT ("UNITCLASS_TANK_B"), "Description", "MaxGlobalInstances", "MaxTeamInstances", "MaxPlayerInstances", "InstanceCostModifier", "DefaultUnit"
	FROM "UnitClasses" WHERE (Type = "UNITCLASS_TANK");
	
-- Tank C
INSERT INTO "UnitClasses" ('Type', 'Description', 'MaxGlobalInstances', 'MaxTeamInstances', 'MaxPlayerInstances', 'InstanceCostModifier', 'DefaultUnit' )
	SELECT ("UNITCLASS_TANK_C"), "Description", "MaxGlobalInstances", "MaxTeamInstances", "MaxPlayerInstances", "InstanceCostModifier", "DefaultUnit"
	FROM "UnitClasses" WHERE (Type = "UNITCLASS_TANK");
	
-- Tank 2
INSERT INTO "UnitClasses" ('Type', 'Description', 'MaxGlobalInstances', 'MaxTeamInstances', 'MaxPlayerInstances', 'InstanceCostModifier', 'DefaultUnit' )
	SELECT ("UNITCLASS_TANK_2"), "Description", "MaxGlobalInstances", "MaxTeamInstances", "MaxPlayerInstances", "InstanceCostModifier", "DefaultUnit"
	FROM "UnitClasses" WHERE (Type = "UNITCLASS_TANK");

-- Tank 2 B
INSERT INTO "UnitClasses" ('Type', 'Description', 'MaxGlobalInstances', 'MaxTeamInstances', 'MaxPlayerInstances', 'InstanceCostModifier', 'DefaultUnit' )
	SELECT ("UNITCLASS_TANK_2_B"), "Description", "MaxGlobalInstances", "MaxTeamInstances", "MaxPlayerInstances", "InstanceCostModifier", "DefaultUnit"
	FROM "UnitClasses" WHERE (Type = "UNITCLASS_TANK");

-- Tank 2 C
INSERT INTO "UnitClasses" ('Type', 'Description', 'MaxGlobalInstances', 'MaxTeamInstances', 'MaxPlayerInstances', 'InstanceCostModifier', 'DefaultUnit' )
	SELECT ("UNITCLASS_TANK_2_C"), "Description", "MaxGlobalInstances", "MaxTeamInstances", "MaxPlayerInstances", "InstanceCostModifier", "DefaultUnit"
	FROM "UnitClasses" WHERE (Type = "UNITCLASS_TANK");

-- Tank 2 D
INSERT INTO "UnitClasses" ('Type', 'Description', 'MaxGlobalInstances', 'MaxTeamInstances', 'MaxPlayerInstances', 'InstanceCostModifier', 'DefaultUnit' )
	SELECT ("UNITCLASS_TANK_2_D"), "Description", "MaxGlobalInstances", "MaxTeamInstances", "MaxPlayerInstances", "InstanceCostModifier", "DefaultUnit"
	FROM "UnitClasses" WHERE (Type = "UNITCLASS_TANK");

-- Tank 3
INSERT INTO "UnitClasses" ('Type', 'Description', 'MaxGlobalInstances', 'MaxTeamInstances', 'MaxPlayerInstances', 'InstanceCostModifier', 'DefaultUnit' )
	SELECT ("UNITCLASS_TANK_3"), "Description", "MaxGlobalInstances", "MaxTeamInstances", "MaxPlayerInstances", "InstanceCostModifier", "DefaultUnit"
	FROM "UnitClasses" WHERE (Type = "UNITCLASS_TANK");

-- Main Battle Tank
INSERT INTO "UnitClasses" ('Type', 'Description', 'MaxGlobalInstances', 'MaxTeamInstances', 'MaxPlayerInstances', 'InstanceCostModifier', 'DefaultUnit' )
	SELECT ("UNITCLASS_MAIN_BATTLE_TANK"), ("TXT_KEY_UNIT_MAIN_BATTLE_TANK"), "MaxGlobalInstances", "MaxTeamInstances", "MaxPlayerInstances", "InstanceCostModifier", "DefaultUnit"
	FROM "UnitClasses" WHERE (Type = "UNITCLASS_TANK");

-- Heavy Tank
INSERT INTO "UnitClasses" ('Type', 'Description', 'MaxGlobalInstances', 'MaxTeamInstances', 'MaxPlayerInstances', 'InstanceCostModifier', 'DefaultUnit' )
	SELECT ("UNITCLASS_HEAVY_TANK"), ("TXT_KEY_UNIT_HEAVY_TANK"), "MaxGlobalInstances", "MaxTeamInstances", "MaxPlayerInstances", "InstanceCostModifier", "DefaultUnit"
	FROM "UnitClasses" WHERE (Type = "UNITCLASS_TANK");

-- Heavy Tank B
INSERT INTO "UnitClasses" ('Type', 'Description', 'MaxGlobalInstances', 'MaxTeamInstances', 'MaxPlayerInstances', 'InstanceCostModifier', 'DefaultUnit' )
	SELECT ("UNITCLASS_HEAVY_TANK_B"), ("TXT_KEY_UNIT_HEAVY_TANK"), "MaxGlobalInstances", "MaxTeamInstances", "MaxPlayerInstances", "InstanceCostModifier", "DefaultUnit"
	FROM "UnitClasses" WHERE (Type = "UNITCLASS_TANK");

-- Heavy Tank 2
INSERT INTO "UnitClasses" ('Type', 'Description', 'MaxGlobalInstances', 'MaxTeamInstances', 'MaxPlayerInstances', 'InstanceCostModifier', 'DefaultUnit' )
	SELECT ("UNITCLASS_HEAVY_TANK_2"), ("TXT_KEY_UNIT_HEAVY_TANK"), "MaxGlobalInstances", "MaxTeamInstances", "MaxPlayerInstances", "InstanceCostModifier", "DefaultUnit"
	FROM "UnitClasses" WHERE (Type = "UNITCLASS_TANK");

-- Heavy Tank 2 B
INSERT INTO "UnitClasses" ('Type', 'Description', 'MaxGlobalInstances', 'MaxTeamInstances', 'MaxPlayerInstances', 'InstanceCostModifier', 'DefaultUnit' )
	SELECT ("UNITCLASS_HEAVY_TANK_2_B"), ("TXT_KEY_UNIT_HEAVY_TANK"), "MaxGlobalInstances", "MaxTeamInstances", "MaxPlayerInstances", "InstanceCostModifier", "DefaultUnit"
	FROM "UnitClasses" WHERE (Type = "UNITCLASS_TANK");

-- Heavy Tank 2 C
INSERT INTO "UnitClasses" ('Type', 'Description', 'MaxGlobalInstances', 'MaxTeamInstances', 'MaxPlayerInstances', 'InstanceCostModifier', 'DefaultUnit' )
	SELECT ("UNITCLASS_HEAVY_TANK_2_C"), ("TXT_KEY_UNIT_HEAVY_TANK"), "MaxGlobalInstances", "MaxTeamInstances", "MaxPlayerInstances", "InstanceCostModifier", "DefaultUnit"
	FROM "UnitClasses" WHERE (Type = "UNITCLASS_TANK");

-- Heavy Tank 3
INSERT INTO "UnitClasses" ('Type', 'Description', 'MaxGlobalInstances', 'MaxTeamInstances', 'MaxPlayerInstances', 'InstanceCostModifier', 'DefaultUnit' )
	SELECT ("UNITCLASS_HEAVY_TANK_3"), ("TXT_KEY_UNIT_HEAVY_TANK"), "MaxGlobalInstances", "MaxTeamInstances", "MaxPlayerInstances", "InstanceCostModifier", "DefaultUnit"
	FROM "UnitClasses" WHERE (Type = "UNITCLASS_TANK");

-- Super Heavy Tank
INSERT INTO "UnitClasses" ('Type', 'Description', 'MaxGlobalInstances', 'MaxTeamInstances', 'MaxPlayerInstances', 'InstanceCostModifier', 'DefaultUnit' )
	SELECT ("UNITCLASS_SUPER_HEAVY_TANK"), ("TXT_KEY_UNIT_SUPER_HEAVY_TANK"), "MaxGlobalInstances", "MaxTeamInstances", "MaxPlayerInstances", "InstanceCostModifier", "DefaultUnit"
	FROM "UnitClasses" WHERE (Type = "UNITCLASS_TANK");

-- Tank Destroyer
INSERT INTO "UnitClasses" ('Type', 'Description', 'MaxGlobalInstances', 'MaxTeamInstances', 'MaxPlayerInstances', 'InstanceCostModifier', 'DefaultUnit' )
	SELECT ("UNITCLASS_TANK_DESTROYER"), ("TXT_KEY_UNIT_TANK_DESTROYER"), "MaxGlobalInstances", "MaxTeamInstances", "MaxPlayerInstances", "InstanceCostModifier", "DefaultUnit"
	FROM "UnitClasses" WHERE (Type = "UNITCLASS_TANK");

-- Tank Destroyer B
INSERT INTO "UnitClasses" ('Type', 'Description', 'MaxGlobalInstances', 'MaxTeamInstances', 'MaxPlayerInstances', 'InstanceCostModifier', 'DefaultUnit' )
	SELECT ("UNITCLASS_TANK_DESTROYER_B"), ("TXT_KEY_UNIT_TANK_DESTROYER"), "MaxGlobalInstances", "MaxTeamInstances", "MaxPlayerInstances", "InstanceCostModifier", "DefaultUnit"
	FROM "UnitClasses" WHERE (Type = "UNITCLASS_TANK");

-- Tank Destroyer 2
INSERT INTO "UnitClasses" ('Type', 'Description', 'MaxGlobalInstances', 'MaxTeamInstances', 'MaxPlayerInstances', 'InstanceCostModifier', 'DefaultUnit' )
	SELECT ("UNITCLASS_TANK_DESTROYER_2"), ("TXT_KEY_UNIT_TANK_DESTROYER"), "MaxGlobalInstances", "MaxTeamInstances", "MaxPlayerInstances", "InstanceCostModifier", "DefaultUnit"
	FROM "UnitClasses" WHERE (Type = "UNITCLASS_TANK");

-- Tank Destroyer 2 B
INSERT INTO "UnitClasses" ('Type', 'Description', 'MaxGlobalInstances', 'MaxTeamInstances', 'MaxPlayerInstances', 'InstanceCostModifier', 'DefaultUnit' )
	SELECT ("UNITCLASS_TANK_DESTROYER_2_B"), ("TXT_KEY_UNIT_TANK_DESTROYER"), "MaxGlobalInstances", "MaxTeamInstances", "MaxPlayerInstances", "InstanceCostModifier", "DefaultUnit"
	FROM "UnitClasses" WHERE (Type = "UNITCLASS_TANK");

-- Tank Destroyer 3
INSERT INTO "UnitClasses" ('Type', 'Description', 'MaxGlobalInstances', 'MaxTeamInstances', 'MaxPlayerInstances', 'InstanceCostModifier', 'DefaultUnit' )
	SELECT ("UNITCLASS_TANK_DESTROYER_3"), ("TXT_KEY_UNIT_TANK_DESTROYER"), "MaxGlobalInstances", "MaxTeamInstances", "MaxPlayerInstances", "InstanceCostModifier", "DefaultUnit"
	FROM "UnitClasses" WHERE (Type = "UNITCLASS_TANK");
	
-- Heavy Tank Destroyer
INSERT INTO "UnitClasses" ('Type', 'Description', 'MaxGlobalInstances', 'MaxTeamInstances', 'MaxPlayerInstances', 'InstanceCostModifier', 'DefaultUnit' )
	SELECT ("UNITCLASS_HEAVY_TANK_DESTROYER"), ("TXT_KEY_UNIT_HEAVY_TANK_DESTROYER"), "MaxGlobalInstances", "MaxTeamInstances", "MaxPlayerInstances", "InstanceCostModifier", "DefaultUnit"
	FROM "UnitClasses" WHERE (Type = "UNITCLASS_TANK");

-- Heavy Tank Destroyer 2
INSERT INTO "UnitClasses" ('Type', 'Description', 'MaxGlobalInstances', 'MaxTeamInstances', 'MaxPlayerInstances', 'InstanceCostModifier', 'DefaultUnit' )
	SELECT ("UNITCLASS_HEAVY_TANK_DESTROYER_2"), ("TXT_KEY_UNIT_HEAVY_TANK_DESTROYER"), "MaxGlobalInstances", "MaxTeamInstances", "MaxPlayerInstances", "InstanceCostModifier", "DefaultUnit"
	FROM "UnitClasses" WHERE (Type = "UNITCLASS_TANK");

-- Assault gun
INSERT INTO "UnitClasses" ('Type', 'Description', 'MaxGlobalInstances', 'MaxTeamInstances', 'MaxPlayerInstances', 'InstanceCostModifier', 'DefaultUnit' )
	SELECT ("UNITCLASS_ASSAULT_GUN"), ("TXT_KEY_UNIT_ASSAULT_GUN"), "MaxGlobalInstances", "MaxTeamInstances", "MaxPlayerInstances", "InstanceCostModifier", "DefaultUnit"
	FROM "UnitClasses" WHERE (Type = "UNITCLASS_TANK");

-- Assault gun B
INSERT INTO "UnitClasses" ('Type', 'Description', 'MaxGlobalInstances', 'MaxTeamInstances', 'MaxPlayerInstances', 'InstanceCostModifier', 'DefaultUnit' )
	SELECT ("UNITCLASS_ASSAULT_GUN_B"), ("TXT_KEY_UNIT_ASSAULT_GUN"), "MaxGlobalInstances", "MaxTeamInstances", "MaxPlayerInstances", "InstanceCostModifier", "DefaultUnit"
	FROM "UnitClasses" WHERE (Type = "UNITCLASS_TANK");

-- Assault gun C
INSERT INTO "UnitClasses" ('Type', 'Description', 'MaxGlobalInstances', 'MaxTeamInstances', 'MaxPlayerInstances', 'InstanceCostModifier', 'DefaultUnit' )
	SELECT ("UNITCLASS_ASSAULT_GUN_C"), ("TXT_KEY_UNIT_ASSAULT_GUN"), "MaxGlobalInstances", "MaxTeamInstances", "MaxPlayerInstances", "InstanceCostModifier", "DefaultUnit"
	FROM "UnitClasses" WHERE (Type = "UNITCLASS_TANK");

-- Assault gun 2
INSERT INTO "UnitClasses" ('Type', 'Description', 'MaxGlobalInstances', 'MaxTeamInstances', 'MaxPlayerInstances', 'InstanceCostModifier', 'DefaultUnit' )
	SELECT ("UNITCLASS_ASSAULT_GUN_2"), ("TXT_KEY_UNIT_ASSAULT_GUN"), "MaxGlobalInstances", "MaxTeamInstances", "MaxPlayerInstances", "InstanceCostModifier", "DefaultUnit"
	FROM "UnitClasses" WHERE (Type = "UNITCLASS_TANK");

-- Assault gun 3
INSERT INTO "UnitClasses" ('Type', 'Description', 'MaxGlobalInstances', 'MaxTeamInstances', 'MaxPlayerInstances', 'InstanceCostModifier', 'DefaultUnit' )
	SELECT ("UNITCLASS_ASSAULT_GUN_3"), ("TXT_KEY_UNIT_ASSAULT_GUN"), "MaxGlobalInstances", "MaxTeamInstances", "MaxPlayerInstances", "InstanceCostModifier", "DefaultUnit"
	FROM "UnitClasses" WHERE (Type = "UNITCLASS_TANK");

-- Assault gun 4
INSERT INTO "UnitClasses" ('Type', 'Description', 'MaxGlobalInstances', 'MaxTeamInstances', 'MaxPlayerInstances', 'InstanceCostModifier', 'DefaultUnit' )
	SELECT ("UNITCLASS_ASSAULT_GUN_4"), ("TXT_KEY_UNIT_ASSAULT_GUN"), "MaxGlobalInstances", "MaxTeamInstances", "MaxPlayerInstances", "InstanceCostModifier", "DefaultUnit"
	FROM "UnitClasses" WHERE (Type = "UNITCLASS_TANK");

-- Old Heavy Assault gun
INSERT INTO "UnitClasses" ('Type', 'Description', 'MaxGlobalInstances', 'MaxTeamInstances', 'MaxPlayerInstances', 'InstanceCostModifier', 'DefaultUnit' )
	SELECT ("UNITCLASS_OLD_HEAVY_ASSAULT_GUN"), ("TXT_KEY_UNIT_HEAVY_ASSAULT_GUN"), "MaxGlobalInstances", "MaxTeamInstances", "MaxPlayerInstances", "InstanceCostModifier", "DefaultUnit"
	FROM "UnitClasses" WHERE (Type = "UNITCLASS_TANK");

-- Heavy Assault gun
INSERT INTO "UnitClasses" ('Type', 'Description', 'MaxGlobalInstances', 'MaxTeamInstances', 'MaxPlayerInstances', 'InstanceCostModifier', 'DefaultUnit' )
	SELECT ("UNITCLASS_HEAVY_ASSAULT_GUN"), ("TXT_KEY_UNIT_HEAVY_ASSAULT_GUN"), "MaxGlobalInstances", "MaxTeamInstances", "MaxPlayerInstances", "InstanceCostModifier", "DefaultUnit"
	FROM "UnitClasses" WHERE (Type = "UNITCLASS_TANK");

-- Heavy Assault gun
INSERT INTO "UnitClasses" ('Type', 'Description', 'MaxGlobalInstances', 'MaxTeamInstances', 'MaxPlayerInstances', 'InstanceCostModifier', 'DefaultUnit' )
	SELECT ("UNITCLASS_HEAVY_ASSAULT_GUN_2"), ("TXT_KEY_UNIT_HEAVY_ASSAULT_GUN"), "MaxGlobalInstances", "MaxTeamInstances", "MaxPlayerInstances", "InstanceCostModifier", "DefaultUnit"
	FROM "UnitClasses" WHERE (Type = "UNITCLASS_TANK");


--------------------------------------------------------------
-- Air
--------------------------------------------------------------

-- Obsolete Fighter
INSERT INTO "UnitClasses" ('Type', 'Description', 'MaxGlobalInstances', 'MaxTeamInstances', 'MaxPlayerInstances', 'InstanceCostModifier', 'DefaultUnit' )
	SELECT ("UNITCLASS_OLD_FIGHTER"), "Description", "MaxGlobalInstances", "MaxTeamInstances", "MaxPlayerInstances", "InstanceCostModifier", "DefaultUnit"
	FROM "UnitClasses" WHERE (Type = "UNITCLASS_FIGHTER");
	
-- Fighter B
INSERT INTO "UnitClasses" ('Type', 'Description', 'MaxGlobalInstances', 'MaxTeamInstances', 'MaxPlayerInstances', 'InstanceCostModifier', 'DefaultUnit' )
	SELECT ("UNITCLASS_FIGHTER_B"), "Description", "MaxGlobalInstances", "MaxTeamInstances", "MaxPlayerInstances", "InstanceCostModifier", "DefaultUnit"
	FROM "UnitClasses" WHERE (Type = "UNITCLASS_FIGHTER");

-- Fighter C
INSERT INTO "UnitClasses" ('Type', 'Description', 'MaxGlobalInstances', 'MaxTeamInstances', 'MaxPlayerInstances', 'InstanceCostModifier', 'DefaultUnit' )
	SELECT ("UNITCLASS_FIGHTER_C"), "Description", "MaxGlobalInstances", "MaxTeamInstances", "MaxPlayerInstances", "InstanceCostModifier", "DefaultUnit"
	FROM "UnitClasses" WHERE (Type = "UNITCLASS_FIGHTER");

-- Fighter D
INSERT INTO "UnitClasses" ('Type', 'Description', 'MaxGlobalInstances', 'MaxTeamInstances', 'MaxPlayerInstances', 'InstanceCostModifier', 'DefaultUnit' )
	SELECT ("UNITCLASS_FIGHTER_D"), "Description", "MaxGlobalInstances", "MaxTeamInstances", "MaxPlayerInstances", "InstanceCostModifier", "DefaultUnit"
	FROM "UnitClasses" WHERE (Type = "UNITCLASS_FIGHTER");

-- Fighter 2
INSERT INTO "UnitClasses" ('Type', 'Description', 'MaxGlobalInstances', 'MaxTeamInstances', 'MaxPlayerInstances', 'InstanceCostModifier', 'DefaultUnit' )
	SELECT ("UNITCLASS_FIGHTER_2"), "Description", "MaxGlobalInstances", "MaxTeamInstances", "MaxPlayerInstances", "InstanceCostModifier", "DefaultUnit"
	FROM "UnitClasses" WHERE (Type = "UNITCLASS_FIGHTER");

-- Fighter 2 B
INSERT INTO "UnitClasses" ('Type', 'Description', 'MaxGlobalInstances', 'MaxTeamInstances', 'MaxPlayerInstances', 'InstanceCostModifier', 'DefaultUnit' )
	SELECT ("UNITCLASS_FIGHTER_2_B"), "Description", "MaxGlobalInstances", "MaxTeamInstances", "MaxPlayerInstances", "InstanceCostModifier", "DefaultUnit"
	FROM "UnitClasses" WHERE (Type = "UNITCLASS_FIGHTER");

-- Fighter 3
INSERT INTO "UnitClasses" ('Type', 'Description', 'MaxGlobalInstances', 'MaxTeamInstances', 'MaxPlayerInstances', 'InstanceCostModifier', 'DefaultUnit' )
	SELECT ("UNITCLASS_FIGHTER_3"), "Description", "MaxGlobalInstances", "MaxTeamInstances", "MaxPlayerInstances", "InstanceCostModifier", "DefaultUnit"
	FROM "UnitClasses" WHERE (Type = "UNITCLASS_FIGHTER");

-- Jet Fighter
-- Already in vanilla !
DELETE FROM UnitClasses WHERE Type='UNITCLASS_JET_FIGHTER';
INSERT INTO "UnitClasses" ('Type', 'Description', 'MaxGlobalInstances', 'MaxTeamInstances', 'MaxPlayerInstances', 'InstanceCostModifier', 'DefaultUnit' )
	SELECT ("UNITCLASS_JET_FIGHTER"), ("TXT_KEY_UNIT_JET_FIGHTER"), "MaxGlobalInstances", "MaxTeamInstances", "MaxPlayerInstances", "InstanceCostModifier", "DefaultUnit"
	FROM "UnitClasses" WHERE (Type = "UNITCLASS_FIGHTER");
	
-- Fighter Bomber
INSERT INTO "UnitClasses" ('Type', 'Description', 'MaxGlobalInstances', 'MaxTeamInstances', 'MaxPlayerInstances', 'InstanceCostModifier', 'DefaultUnit' )
	SELECT ("UNITCLASS_FIGHTER_BOMBER"), ("TXT_KEY_UNIT_FIGHTER_BOMBER"), "MaxGlobalInstances", "MaxTeamInstances", "MaxPlayerInstances", "InstanceCostModifier", "DefaultUnit"
	FROM "UnitClasses" WHERE (Type = "UNITCLASS_FIGHTER");
		
-- Fighter Bomber B
INSERT INTO "UnitClasses" ('Type', 'Description', 'MaxGlobalInstances', 'MaxTeamInstances', 'MaxPlayerInstances', 'InstanceCostModifier', 'DefaultUnit' )
	SELECT ("UNITCLASS_FIGHTER_BOMBER_B"), ("TXT_KEY_UNIT_FIGHTER_BOMBER"), "MaxGlobalInstances", "MaxTeamInstances", "MaxPlayerInstances", "InstanceCostModifier", "DefaultUnit"
	FROM "UnitClasses" WHERE (Type = "UNITCLASS_FIGHTER");

-- Fighter Bomber 2
INSERT INTO "UnitClasses" ('Type', 'Description', 'MaxGlobalInstances', 'MaxTeamInstances', 'MaxPlayerInstances', 'InstanceCostModifier', 'DefaultUnit' )
	SELECT ("UNITCLASS_FIGHTER_BOMBER_2"), ("TXT_KEY_UNIT_FIGHTER_BOMBER"), "MaxGlobalInstances", "MaxTeamInstances", "MaxPlayerInstances", "InstanceCostModifier", "DefaultUnit"
	FROM "UnitClasses" WHERE (Type = "UNITCLASS_FIGHTER");

-- Fighter Bomber 2 B
INSERT INTO "UnitClasses" ('Type', 'Description', 'MaxGlobalInstances', 'MaxTeamInstances', 'MaxPlayerInstances', 'InstanceCostModifier', 'DefaultUnit' )
	SELECT ("UNITCLASS_FIGHTER_BOMBER_2_B"), ("TXT_KEY_UNIT_FIGHTER_BOMBER"), "MaxGlobalInstances", "MaxTeamInstances", "MaxPlayerInstances", "InstanceCostModifier", "DefaultUnit"
	FROM "UnitClasses" WHERE (Type = "UNITCLASS_FIGHTER");

-- Attack Aircraft
INSERT INTO "UnitClasses" ('Type', 'Description', 'MaxGlobalInstances', 'MaxTeamInstances', 'MaxPlayerInstances', 'InstanceCostModifier', 'DefaultUnit' )
	SELECT ("UNITCLASS_ATTACK_AIRCRAFT"), ("TXT_KEY_UNIT_ATTACK_AIRCRAFT"), "MaxGlobalInstances", "MaxTeamInstances", "MaxPlayerInstances", "InstanceCostModifier", "DefaultUnit"
	FROM "UnitClasses" WHERE (Type = "UNITCLASS_FIGHTER");

-- Attack Aircraft B
INSERT INTO "UnitClasses" ('Type', 'Description', 'MaxGlobalInstances', 'MaxTeamInstances', 'MaxPlayerInstances', 'InstanceCostModifier', 'DefaultUnit' )
	SELECT ("UNITCLASS_ATTACK_AIRCRAFT_B"), ("TXT_KEY_UNIT_ATTACK_AIRCRAFT"), "MaxGlobalInstances", "MaxTeamInstances", "MaxPlayerInstances", "InstanceCostModifier", "DefaultUnit"
	FROM "UnitClasses" WHERE (Type = "UNITCLASS_FIGHTER");

-- Attack Aircraft C
INSERT INTO "UnitClasses" ('Type', 'Description', 'MaxGlobalInstances', 'MaxTeamInstances', 'MaxPlayerInstances', 'InstanceCostModifier', 'DefaultUnit' )
	SELECT ("UNITCLASS_ATTACK_AIRCRAFT_C"), ("TXT_KEY_UNIT_ATTACK_AIRCRAFT"), "MaxGlobalInstances", "MaxTeamInstances", "MaxPlayerInstances", "InstanceCostModifier", "DefaultUnit"
	FROM "UnitClasses" WHERE (Type = "UNITCLASS_FIGHTER");
	
-- Heavy Fighter
INSERT INTO "UnitClasses" ('Type', 'Description', 'MaxGlobalInstances', 'MaxTeamInstances', 'MaxPlayerInstances', 'InstanceCostModifier', 'DefaultUnit' )
	SELECT ("UNITCLASS_HEAVY_FIGHTER"), ("TXT_KEY_UNIT_HEAVY_FIGHTER"), "MaxGlobalInstances", "MaxTeamInstances", "MaxPlayerInstances", "InstanceCostModifier", "DefaultUnit"
	FROM "UnitClasses" WHERE (Type = "UNITCLASS_FIGHTER");

-- Heavy Fighter B
INSERT INTO "UnitClasses" ('Type', 'Description', 'MaxGlobalInstances', 'MaxTeamInstances', 'MaxPlayerInstances', 'InstanceCostModifier', 'DefaultUnit' )
	SELECT ("UNITCLASS_HEAVY_FIGHTER_B"), ("TXT_KEY_UNIT_HEAVY_FIGHTER"), "MaxGlobalInstances", "MaxTeamInstances", "MaxPlayerInstances", "InstanceCostModifier", "DefaultUnit"
	FROM "UnitClasses" WHERE (Type = "UNITCLASS_FIGHTER");
	
-- Heavy Fighter 2
INSERT INTO "UnitClasses" ('Type', 'Description', 'MaxGlobalInstances', 'MaxTeamInstances', 'MaxPlayerInstances', 'InstanceCostModifier', 'DefaultUnit' )
	SELECT ("UNITCLASS_HEAVY_FIGHTER_2"), ("TXT_KEY_UNIT_HEAVY_FIGHTER"), "MaxGlobalInstances", "MaxTeamInstances", "MaxPlayerInstances", "InstanceCostModifier", "DefaultUnit"
	FROM "UnitClasses" WHERE (Type = "UNITCLASS_FIGHTER");
	
-- Heavy Fighter 3
INSERT INTO "UnitClasses" ('Type', 'Description', 'MaxGlobalInstances', 'MaxTeamInstances', 'MaxPlayerInstances', 'InstanceCostModifier', 'DefaultUnit' )
	SELECT ("UNITCLASS_HEAVY_FIGHTER_3"), ("TXT_KEY_UNIT_HEAVY_FIGHTER"), "MaxGlobalInstances", "MaxTeamInstances", "MaxPlayerInstances", "InstanceCostModifier", "DefaultUnit"
	FROM "UnitClasses" WHERE (Type = "UNITCLASS_FIGHTER");

-- Fast Bomber 
INSERT INTO "UnitClasses" ('Type', 'Description', 'MaxGlobalInstances', 'MaxTeamInstances', 'MaxPlayerInstances', 'InstanceCostModifier', 'DefaultUnit' )
	SELECT ("UNITCLASS_FAST_BOMBER"), ("TXT_KEY_UNIT_FAST_BOMBER"), "MaxGlobalInstances", "MaxTeamInstances", "MaxPlayerInstances", "InstanceCostModifier", "DefaultUnit"
	FROM "UnitClasses" WHERE (Type = "UNITCLASS_BOMBER");

-- Fast Bomber 2
INSERT INTO "UnitClasses" ('Type', 'Description', 'MaxGlobalInstances', 'MaxTeamInstances', 'MaxPlayerInstances', 'InstanceCostModifier', 'DefaultUnit' )
	SELECT ("UNITCLASS_FAST_BOMBER_2"), ("TXT_KEY_UNIT_FAST_BOMBER"), "MaxGlobalInstances", "MaxTeamInstances", "MaxPlayerInstances", "InstanceCostModifier", "DefaultUnit"
	FROM "UnitClasses" WHERE (Type = "UNITCLASS_BOMBER");

-- Obsolete Heavy Bomber 
INSERT INTO "UnitClasses" ('Type', 'Description', 'MaxGlobalInstances', 'MaxTeamInstances', 'MaxPlayerInstances', 'InstanceCostModifier', 'DefaultUnit' )
	SELECT ("UNITCLASS_OLD_HEAVY_BOMBER"), ("TXT_KEY_UNIT_HEAVY_BOMBER"), "MaxGlobalInstances", "MaxTeamInstances", "MaxPlayerInstances", "InstanceCostModifier", "DefaultUnit"
	FROM "UnitClasses" WHERE (Type = "UNITCLASS_BOMBER");
	
-- Heavy Bomber 
INSERT INTO "UnitClasses" ('Type', 'Description', 'MaxGlobalInstances', 'MaxTeamInstances', 'MaxPlayerInstances', 'InstanceCostModifier', 'DefaultUnit' )
	SELECT ("UNITCLASS_HEAVY_BOMBER"), ("TXT_KEY_UNIT_HEAVY_BOMBER"), "MaxGlobalInstances", "MaxTeamInstances", "MaxPlayerInstances", "InstanceCostModifier", "DefaultUnit"
	FROM "UnitClasses" WHERE (Type = "UNITCLASS_BOMBER");
	
-- Heavy Bomber 2
INSERT INTO "UnitClasses" ('Type', 'Description', 'MaxGlobalInstances', 'MaxTeamInstances', 'MaxPlayerInstances', 'InstanceCostModifier', 'DefaultUnit' )
	SELECT ("UNITCLASS_HEAVY_BOMBER_2"), ("TXT_KEY_UNIT_HEAVY_BOMBER"), "MaxGlobalInstances", "MaxTeamInstances", "MaxPlayerInstances", "InstanceCostModifier", "DefaultUnit"
	FROM "UnitClasses" WHERE (Type = "UNITCLASS_BOMBER");

-- Heavy Bomber 3
INSERT INTO "UnitClasses" ('Type', 'Description', 'MaxGlobalInstances', 'MaxTeamInstances', 'MaxPlayerInstances', 'InstanceCostModifier', 'DefaultUnit' )
	SELECT ("UNITCLASS_HEAVY_BOMBER_3"), ("TXT_KEY_UNIT_HEAVY_BOMBER"), "MaxGlobalInstances", "MaxTeamInstances", "MaxPlayerInstances", "InstanceCostModifier", "DefaultUnit"
	FROM "UnitClasses" WHERE (Type = "UNITCLASS_BOMBER");

--------------------------------------------------------------
-- Sea
--------------------------------------------------------------

-- Battleship
-- switch to per nation limits in Lua
--UPDATE UnitClasses SET MaxPlayerInstances = 4 WHERE Type = 'UNITCLASS_BATTLESHIP';

-- Battleship 2
INSERT INTO "UnitClasses" ('Type', 'Description', 'MaxGlobalInstances', 'MaxTeamInstances', 'MaxPlayerInstances', 'InstanceCostModifier', 'DefaultUnit' )
	SELECT ("UNITCLASS_BATTLESHIP_2"), "Description", "MaxGlobalInstances", "MaxTeamInstances", "MaxPlayerInstances", "InstanceCostModifier", "DefaultUnit"
	FROM "UnitClasses" WHERE (Type = "UNITCLASS_BATTLESHIP");

-- DREADNOUGHT
INSERT INTO "UnitClasses" ('Type', 'Description', 'MaxGlobalInstances', 'MaxTeamInstances', 'MaxPlayerInstances', 'InstanceCostModifier', 'DefaultUnit' )
	SELECT ("UNITCLASS_DREADNOUGHT"), ("TXT_KEY_UNIT_DREADNOUGHT"), "MaxGlobalInstances", "MaxTeamInstances", "MaxPlayerInstances", "InstanceCostModifier", "DefaultUnit"
	FROM "UnitClasses" WHERE (Type = "UNITCLASS_BATTLESHIP");
	
-- HEAVY CRUISER
INSERT INTO "UnitClasses" ('Type', 'Description', 'MaxGlobalInstances', 'MaxTeamInstances', 'MaxPlayerInstances', 'InstanceCostModifier', 'DefaultUnit' )
	SELECT ("UNITCLASS_HEAVY_CRUISER"), ("TXT_KEY_UNIT_HEAVY_CRUISER"), "MaxGlobalInstances", "MaxTeamInstances", "MaxPlayerInstances", "InstanceCostModifier", "DefaultUnit"
	FROM "UnitClasses" WHERE (Type = "UNITCLASS_BATTLESHIP");

-- CRUISER
INSERT INTO "UnitClasses" ('Type', 'Description', 'MaxGlobalInstances', 'MaxTeamInstances', 'MaxPlayerInstances', 'InstanceCostModifier', 'DefaultUnit' )
	SELECT ("UNITCLASS_CRUISER"), ("TXT_KEY_UNIT_CRUISER"), "MaxGlobalInstances", "MaxTeamInstances", "MaxPlayerInstances", "InstanceCostModifier", "DefaultUnit"
	FROM "UnitClasses" WHERE (Type = "UNITCLASS_DESTROYER");
	
-- DESTROYER 2
INSERT INTO "UnitClasses" ('Type', 'Description', 'MaxGlobalInstances', 'MaxTeamInstances', 'MaxPlayerInstances', 'InstanceCostModifier', 'DefaultUnit' )
	SELECT ("UNITCLASS_DESTROYER_2"), "Description", "MaxGlobalInstances", "MaxTeamInstances", "MaxPlayerInstances", "InstanceCostModifier", "DefaultUnit"
	FROM "UnitClasses" WHERE (Type = "UNITCLASS_DESTROYER");
	
-- SUBMARINE 2
INSERT INTO "UnitClasses" ('Type', 'Description', 'MaxGlobalInstances', 'MaxTeamInstances', 'MaxPlayerInstances', 'InstanceCostModifier', 'DefaultUnit' )
	SELECT ("UNITCLASS_SUBMARINE_2"), "Description", "MaxGlobalInstances", "MaxTeamInstances", "MaxPlayerInstances", "InstanceCostModifier", "DefaultUnit"
	FROM "UnitClasses" WHERE (Type = "UNITCLASS_SUBMARINE");

-- SUBMARINE 3
INSERT INTO "UnitClasses" ('Type', 'Description', 'MaxGlobalInstances', 'MaxTeamInstances', 'MaxPlayerInstances', 'InstanceCostModifier', 'DefaultUnit' )
	SELECT ("UNITCLASS_SUBMARINE_3"), "Description", "MaxGlobalInstances", "MaxTeamInstances", "MaxPlayerInstances", "InstanceCostModifier", "DefaultUnit"
	FROM "UnitClasses" WHERE (Type = "UNITCLASS_SUBMARINE");
	
-- CARRIER 2
INSERT INTO "UnitClasses" ('Type', 'Description', 'MaxGlobalInstances', 'MaxTeamInstances', 'MaxPlayerInstances', 'InstanceCostModifier', 'DefaultUnit' )
	SELECT ("UNITCLASS_CARRIER_2"), "Description", "MaxGlobalInstances", "MaxTeamInstances", "MaxPlayerInstances", "InstanceCostModifier", "DefaultUnit"
	FROM "UnitClasses" WHERE (Type = "UNITCLASS_CARRIER");

-- CARRIER 3
INSERT INTO "UnitClasses" ('Type', 'Description', 'MaxGlobalInstances', 'MaxTeamInstances', 'MaxPlayerInstances', 'InstanceCostModifier', 'DefaultUnit' )
	SELECT ("UNITCLASS_CARRIER_3"), "Description", "MaxGlobalInstances", "MaxTeamInstances", "MaxPlayerInstances", "InstanceCostModifier", "DefaultUnit"
	FROM "UnitClasses" WHERE (Type = "UNITCLASS_CARRIER");

-- Convoy
INSERT INTO "UnitClasses" ('Type', 'Description', 'MaxGlobalInstances', 'MaxTeamInstances', 'MaxPlayerInstances', 'InstanceCostModifier', 'DefaultUnit' )
	VALUES ('UNITCLASS_CONVOY', 'TXT_KEY_UNIT_CONVOY', -1, -1, -1, 0, 'UNIT_CONVOY');
	
-- Airfield
INSERT INTO "UnitClasses" ('Type', 'Description', 'MaxGlobalInstances', 'MaxTeamInstances', 'MaxPlayerInstances', 'InstanceCostModifier', 'DefaultUnit' )
	VALUES ('UNITCLASS_AIRFIELD', 'TXT_KEY_UNIT_AIRFIELD', -1, -1, -1, 0, 'UNIT_AIRFIELD');
