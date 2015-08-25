--------------------------------------------------------------------------------------------
-- Finalize Rules for R.E.D. WWII edition
-- Loaded AFTER all other modifications.
--------------------------------------------------------------------------------------------

--------------------------------------------------------------------------------------------
-- Improvements
--------------------------------------------------------------------------------------------

UPDATE Improvements SET DefenseModifier = 20	WHERE Type = 'IMPROVEMENT_MANUFACTORY';
UPDATE Improvements SET DefenseModifier = 25	WHERE Type = 'IMPROVEMENT_CITY_RUINS';
UPDATE Improvements SET DefenseModifier = 30	WHERE Type = 'IMPROVEMENT_TRADING_POST';
UPDATE Improvements SET DefenseModifier = 40	WHERE Type = 'IMPROVEMENT_BUNKER';
UPDATE Improvements SET DefenseModifier = 75	WHERE Type = 'IMPROVEMENT_FORT';
UPDATE Improvements SET DefenseModifier = 100	WHERE Type = 'IMPROVEMENT_CITADEL';

-- test
/*
UPDATE Improvements SET DefenseModifier = 7	WHERE Type = 'IMPROVEMENT_MANUFACTORY';
UPDATE Improvements SET DefenseModifier = 8	WHERE Type = 'IMPROVEMENT_CITY_RUINS';
UPDATE Improvements SET DefenseModifier = 10	WHERE Type = 'IMPROVEMENT_TRADING_POST';
UPDATE Improvements SET DefenseModifier = 13	WHERE Type = 'IMPROVEMENT_BUNKER';
UPDATE Improvements SET DefenseModifier = 25	WHERE Type = 'IMPROVEMENT_FORT';
UPDATE Improvements SET DefenseModifier = 33	WHERE Type = 'IMPROVEMENT_CITADEL';

UPDATE Defines SET Value = 3 WHERE Name = 'HILLS_EXTRA_DEFENSE';
UPDATE Features SET Defense = 8 WHERE Type = 'FEATURE_FOREST';
UPDATE Features SET Defense = 8 WHERE Type = 'FEATURE_JUNGLE';
-- / test */

UPDATE Improvements SET NearbyEnemyDamage = 0	WHERE Type = 'IMPROVEMENT_CITADEL';


UPDATE ArtDefine_Landmarks SET Scale = 0.65*Scale 
	WHERE ResourceType = 'ART_DEF_RESOURCE_ALUMINUM'
		OR ResourceType = 'ART_DEF_RESOURCE_COAL'
		OR ResourceType = 'ART_DEF_RESOURCE_COAL_HEAVY'
		OR ResourceType = 'ART_DEF_RESOURCE_ALUMINUM_HEAVY'
		OR ResourceType = 'ART_DEF_RESOURCE_COAL_HEAVY_MARSH'
		OR ResourceType = 'ART_DEF_RESOURCE_COAL_MARSH'
		OR ResourceType = 'ART_DEF_RESOURCE_IRON'
		OR ResourceType = 'ART_DEF_RESOURCE_IRON_HEAVY'
		OR ResourceType = 'ART_DEF_RESOURCE_IRON_HEAVY_MARSH'
		OR ResourceType = 'ART_DEF_RESOURCE_IRON_MARSH'
		OR ResourceType = 'ART_DEF_RESOURCE_OIL'
		OR ResourceType = 'ART_DEF_RESOURCE_OIL_HEAVY'
		OR ResourceType = 'ART_DEF_RESOURCE_URANIUM_MARSH'
		OR ResourceType = 'ART_DEF_RESOURCE_URANIUM_HEAVY_MARSH'
		OR ResourceType = 'ART_DEF_RESOURCE_URANIUM_HEAVY'
		OR ResourceType = 'ART_DEF_RESOURCE_URANIUM';

UPDATE ArtDefine_Landmarks SET Scale = 0.65*Scale
	WHERE ImprovementType = 'ART_DEF_IMPROVEMENT_MANUFACTORY'
		OR ImprovementType = 'ART_DEF_IMPROVEMENT_QUARRY';

UPDATE ArtDefine_Landmarks SET Scale = 0.85*Scale WHERE ImprovementType = 'ART_DEF_IMPROVEMENT_FORT'; 
UPDATE ArtDefine_Landmarks SET Scale = 0.95*Scale WHERE ImprovementType = 'ART_DEF_IMPROVEMENT_CITADEL';
UPDATE ArtDefine_Landmarks SET Scale = 0.65*Scale WHERE ImprovementType = 'ART_DEF_IMPROVEMENT_BUNKER';

--------------------------------------------------------------------------------------------
-- Buildings
--------------------------------------------------------------------------------------------

UPDATE Building_Flavors SET Flavor = Flavor * 0.75;	-- Build less buildings...

--------------------------------------------------------------------------------------------
-- Units
--------------------------------------------------------------------------------------------
UPDATE Units SET ProjectPrereq = NULL;			-- We don't need to set projects for units, this is handled by the mod custom function/tables
UPDATE Unit_Flavors SET Flavor = Flavor * 2;	-- Build more units...

--------------------------------------------------------------------------------------------
-- Projects
--------------------------------------------------------------------------------------------
UPDATE Project_Flavors SET Flavor = Flavor * 1.75 WHERE ProjectType LIKE 'PROJECT_%';	-- Project's flavor relative to units...


/*
	Remap Units and UnitClasses ID (the game will expect them to start at ID = 0, and at this point of the code, the first entry is ID = 1)
	Code Thanks to lemmy101, Thalassicus, Pazyryk	 
*/
-- Units
CREATE TABLE IDRemapper ( id INTEGER PRIMARY KEY AUTOINCREMENT, Type TEXT );
INSERT INTO IDRemapper (Type) SELECT Type FROM Units ORDER by ID;
UPDATE Units SET ID =	( SELECT IDRemapper.id-1 FROM IDRemapper WHERE Units.Type = IDRemapper.Type);
DROP TABLE IDRemapper;

-- UnitClasses
CREATE TABLE IDRemapper ( id INTEGER PRIMARY KEY AUTOINCREMENT, Type TEXT );
INSERT INTO IDRemapper (Type) SELECT Type FROM UnitClasses ORDER by ID;
UPDATE UnitClasses SET ID =	( SELECT IDRemapper.id-1 FROM IDRemapper WHERE UnitClasses.Type = IDRemapper.Type);
DROP TABLE IDRemapper;

-- Reset ID autoincrement seq to correct value for modmod loaded after this one...
UPDATE sqlite_sequence SET seq = (SELECT COUNT(ID) FROM Units)-1 WHERE name = 'Units';
UPDATE sqlite_sequence SET seq = (SELECT COUNT(ID) FROM UnitClasses)-1 WHERE name = 'UnitClasses';


--------------------------------------------------------------------------------------------
-- Strategic/Tactical AI	 
--------------------------------------------------------------------------------------------

UPDATE Defines SET Value = 200 WHERE Name = 'AI_GOLD_PRIORITY_DEFENSIVE_BUILDING'; -- Default = 400

UPDATE Defines SET Value = 20	WHERE Name = 'AI_OPERATIONAL_PERCENT_DANGER_FOR_FORWARD_MUSTER';	-- Default = 20
UPDATE Defines SET Value = 5	WHERE Name = 'AI_OPERATIONAL_CITY_ATTACK_DEPLOY_RANGE';				-- Default = 5
UPDATE Defines SET Value = 3	WHERE Name = 'AI_OPERATIONAL_NAVAL_BOMBARDMENT_DEPLOY_RANGE';		-- Default = 1
UPDATE Defines SET Value = 50	WHERE Name = 'AI_OPERATIONAL_PERCENT_HEALTH_FOR_OPERATION';			-- Default = 80
UPDATE Defines SET Value = 5	WHERE Name = 'AI_OPERATIONAL_MAX_RECRUIT_TURNS_DEFAULT';			-- Default = 5
UPDATE Defines SET Value = 10	WHERE Name = 'AI_OPERATIONAL_MAX_RECRUIT_TURNS_ENEMY_TERRITORY';	-- Default = 10
UPDATE Defines SET Value = 0	WHERE Name = 'AI_TACTICAL_MAP_DOMINANCE_PERCENTAGE';				-- Default = 25
UPDATE Defines SET Value = 2	WHERE Name = 'AI_TACTICAL_MAP_BOMBARDMENT_ZONE_TURNS';				-- default = 1
UPDATE Defines SET Value = 10	WHERE Name = 'AI_TACTICAL_OVERKILL_PERCENT';						-- Default = 25
UPDATE Defines SET Value = 0	WHERE Name = 'AI_HOMELAND_MOVE_PRIORITY_HEAL';						-- Default = 30
UPDATE Defines SET Value = 150	WHERE Name = 'AI_MILITARY_CITY_THREAT_WEIGHT_CAPITAL';				-- Default = 125


UPDATE TacticalMoves SET Priority = 0	WHERE Type = 'TACTICAL_MOVE_NONCOMBATANTS_TO_SAFETY';		-- Default = 0
UPDATE TacticalMoves SET Priority = 150 WHERE Type = 'TACTICAL_CAPTURE_CITY';						-- Default = 150
UPDATE TacticalMoves SET Priority = 120	WHERE Type = 'TACTICAL_DAMAGE_CITY';						-- Default = 15

UPDATE TacticalMoves SET Priority = 140 WHERE Type = 'TACTICAL_DESTROY_HIGH_UNIT';					-- Default = 140
UPDATE TacticalMoves SET Priority = 120 WHERE Type = 'TACTICAL_DESTROY_MEDIUM_UNIT';				-- Default = 120
UPDATE TacticalMoves SET Priority = 110 WHERE Type = 'TACTICAL_DESTROY_LOW_UNIT';					-- Default = 110
UPDATE TacticalMoves SET Priority = 11	WHERE Type = 'TACTICAL_TO_SAFETY';							-- Default = 11

UPDATE TacticalMoves SET Priority = 87	WHERE Type = 'TACTICAL_ATTRIT_HIGH_UNIT';					-- Default = 17
UPDATE TacticalMoves SET Priority = 85	WHERE Type = 'TACTICAL_ATTRIT_MEDIUM_UNIT';					-- Default = 15
UPDATE TacticalMoves SET Priority = 82	WHERE Type = 'TACTICAL_ATTRIT_LOW_UNIT';					-- Default = 12

UPDATE TacticalMoves SET Priority = 1	WHERE Type = 'TACTICAL_REPOSITION';							-- Default = 1
UPDATE TacticalMoves SET Priority = 40	WHERE Type = 'TACTICAL_PILLAGE';							-- Default = 40
UPDATE TacticalMoves SET Priority = 60	WHERE Type = 'TACTICAL_SAFE_BOMBARDS',						-- Default = 60
UPDATE TacticalMoves SET Priority = 8	WHERE Type = 'TACTICAL_HEAL';								-- Default = 8
UPDATE TacticalMoves SET Priority = 20	WHERE Type = 'TACTICAL_GARRISON_TO_ALLOW_BOMBARD'			-- Default = 20
UPDATE TacticalMoves SET Priority = 0	WHERE Type = 'TACTICAL_BASTION_ALREADY_THERE';				-- Default = 7
UPDATE TacticalMoves SET Priority = 0	WHERE Type = 'TACTICAL_GARRISON_ALREADY_THERE';				-- Default = 6
UPDATE TacticalMoves SET Priority = 0	WHERE Type = 'TACTICAL_GUARD_IMPROVEMENT_ALREADY_THERE';	-- Default = 3
UPDATE TacticalMoves SET Priority = 0	WHERE Type = 'TACTICAL_BASTION_1_TURN';						-- Default = 5
UPDATE TacticalMoves SET Priority = 0	WHERE Type = 'TACTICAL_GARRISON_1_TURN';					-- Default = 4
UPDATE TacticalMoves SET Priority = 0	WHERE Type = 'TACTICAL_GUARD_IMPROVEMENT_1_TURN';			-- Default = 2
UPDATE TacticalMoves SET Priority = 10	WHERE Type = 'TACTICAL_AIR_SWEEP';							-- Default = 10
UPDATE TacticalMoves SET Priority = 20	WHERE Type = 'TACTICAL_AIR_INTERCEPT';						-- Default = 20
UPDATE TacticalMoves SET Priority = 1	WHERE Type = 'TACTICAL_AIR_REBASE';							-- Default = 1

UPDATE TacticalMoves SET Priority = 1	WHERE Type = 'TACTICAL_POSTURE_WITHDRAW';					-- Default = 95

UPDATE TacticalMoves SET Priority = 105	 WHERE Type = 'TACTICAL_POSTURE_SIT_AND_BOMBARD';			-- Default = 105
UPDATE TacticalMoves SET Priority = 104	 WHERE Type = 'TACTICAL_POSTURE_ATTRIT_FROM_RANGE';			-- Default = 104
UPDATE TacticalMoves SET Priority = 107	 WHERE Type = 'TACTICAL_POSTURE_EXPLOIT_FLANKS';			-- Default = 107
UPDATE TacticalMoves SET Priority = 108	 WHERE Type = 'TACTICAL_POSTURE_STEAMROLL';					-- Default = 108
UPDATE TacticalMoves SET Priority = 106	 WHERE Type = 'TACTICAL_POSTURE_SURGICAL_CITY_STRIKE';		-- Default = 106

UPDATE TacticalMoves SET Priority = 0	WHERE Type = 'TACTICAL_POSTURE_HEDGEHOG';					-- Default = 50

UPDATE TacticalMoves SET Priority = 103	 WHERE Type = 'TACTICAL_POSTURE_COUNTERATTACK';				-- Default = 103
UPDATE TacticalMoves SET Priority = 100	 WHERE Type = 'TACTICAL_POSTURE_SHORE_BOMBARDMENT';			-- Default = 100
UPDATE TacticalMoves SET Priority = 45	 WHERE Type = 'TACTICAL_CLOSE_ON_TARGET';					-- Default = 45
UPDATE TacticalMoves SET Priority = 90	 WHERE Type = 'TACTICAL_MOVE_OPERATIONS';					-- Default = 80
UPDATE TacticalMoves SET Priority = 200	 WHERE Type = 'TACTICAL_EMERGENCY_PURCHASES';				-- Default = 200
UPDATE TacticalMoves SET Priority = 110	 WHERE Type = 'TACTICAL_ATTACK_EMBARKED_MILITARY_UNIT';		-- Default = 110
UPDATE TacticalMoves SET Priority = 70	 WHERE Type = 'TACTICAL_ATTACK_EMBARKED_CIVILIAN';			-- Default = 70

UPDATE TacticalMoves SET Priority = 150 WHERE Type = 'TACTICAL_ATTACK_VERY_HIGH_PRIORITY_CIVILIAN';	-- Default = 130
UPDATE TacticalMoves SET Priority = 200 WHERE Type = 'TACTICAL_ATTACK_HIGH_PRIORITY_CIVILIAN';		-- Default = 100

UPDATE TacticalMoves SET Priority = 40	 WHERE Type = 'TACTICAL_ATTACK_MEDIUM_PRIORITY_CIVILIAN';	-- Default = 40
UPDATE TacticalMoves SET Priority = 30	 WHERE Type = 'TACTICAL_ATTACK_LOW_PRIORITY_CIVILIAN';		-- Default = 30


--/*
--*/


/* Units AI */
UPDATE Units SET DefaultUnitAI = 'UNITAI_ATTACK' WHERE Domain = 'DOMAIN_LAND' AND (Class LIKE '%ASSAULT_GUN%' OR Class = 'UNITCLASS_INFANTRY_2');
UPDATE Units SET DefaultUnitAI = 'UNITAI_DEFENSE' WHERE Domain = 'DOMAIN_LAND' AND (Class LIKE '%TANK_DESTROYER%');
UPDATE Units SET DefaultUnitAI = 'UNITAI_RANGED' WHERE Domain = 'DOMAIN_LAND' AND (Class LIKE '%FIELD_GUN%');
UPDATE Units SET DefaultUnitAI = 'UNITAI_PARADROP' WHERE Domain = 'DOMAIN_LAND' AND (Class LIKE '%PARATROOPER%');
