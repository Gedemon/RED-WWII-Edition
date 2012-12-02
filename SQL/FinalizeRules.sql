--------------------------------------------------------------------------------------------
-- Finalize Rules for R.E.D. WWII edition
-- Loaded AFTER all other modifications.
--------------------------------------------------------------------------------------------

--------------------------------------------------------------------------------------------
-- Units
--------------------------------------------------------------------------------------------
UPDATE Units SET ProjectPrereq = NULL; -- We don't need to set projects for units, this is handled by the mod custom function/tables

--------------------------------------------------------------------------------------------
-- free units IDs...
--------------------------------------------------------------------------------------------


--------------------------------------------------------------------------------------------
-- Here are blocks of units ID that can be re-used when working on a WB map
-- To free an ID block, add "--" before the start and end comment tag /* and */
--------------------------------------------------------------------------------------------


/*
DELETE FROM Units WHERE Type='UNIT_OLD_LIGHT_TANK';
DELETE FROM Units WHERE Type='UNIT_LIGHT_TANK';
DELETE FROM Units WHERE Type='UNIT_LIGHT_TANK_2';
DELETE FROM Units WHERE Type='UNIT_LIGHT_TANK_2_B';
DELETE FROM Units WHERE Type='UNIT_LIGHT_TANK_3';
DELETE FROM Units WHERE Type='UNIT_CRUISER_TANK';
DELETE FROM Units WHERE Type='UNIT_CRUISER_TANK_B';
DELETE FROM Units WHERE Type='UNIT_CRUISER_TANK_2';
DELETE FROM Units WHERE Type='UNIT_CRUISER_TANK_2_B';
DELETE FROM Units WHERE Type='UNIT_CRUISER_TANK_3';
DELETE FROM Units WHERE Type='UNIT_CRUISER_TANK_4';
DELETE FROM Units WHERE Type='UNIT_CRUISER_TANK_4_B';
DELETE FROM Units WHERE Type='UNIT_OLD_TANK';
DELETE FROM Units WHERE Type='UNIT_TANK_B';
DELETE FROM Units WHERE Type='UNIT_TANK_C';
DELETE FROM Units WHERE Type='UNIT_TANK_2';
DELETE FROM Units WHERE Type='UNIT_TANK_2_B';
DELETE FROM Units WHERE Type='UNIT_TANK_2_C';
DELETE FROM Units WHERE Type='UNIT_TANK_2_D';
DELETE FROM Units WHERE Type='UNIT_TANK_3';
DELETE FROM Units WHERE Type='UNIT_HEAVY_TANK';
DELETE FROM Units WHERE Type='UNIT_HEAVY_TANK_B';
DELETE FROM Units WHERE Type='UNIT_HEAVY_TANK_2';
DELETE FROM Units WHERE Type='UNIT_HEAVY_TANK_2_B';
DELETE FROM Units WHERE Type='UNIT_OLD_HEAVY_ASSAULT_GUN';
DELETE FROM Units WHERE Type='UNIT_HEAVY_ASSAULT_GUN';
DELETE FROM Units WHERE Type='UNIT_OLD_FIGHTER';
DELETE FROM Units WHERE Type='UNIT_FIGHTER_B';
DELETE FROM Units WHERE Type='UNIT_FIGHTER_C';
DELETE FROM Units WHERE Type='UNIT_FIGHTER_D';
DELETE FROM Units WHERE Type='UNIT_FIGHTER_2';
DELETE FROM Units WHERE Type='UNIT_FIGHTER_2_B';
DELETE FROM Units WHERE Type='UNIT_FIGHTER_3';
DELETE FROM Units WHERE Type='UNIT_HEAVY_FIGHTER';
DELETE FROM Units WHERE Type='UNIT_HEAVY_FIGHTER_B';
DELETE FROM Units WHERE Type='UNIT_HEAVY_FIGHTER_2';
DELETE FROM Units WHERE Type='UNIT_HEAVY_FIGHTER_3';
DELETE FROM Units WHERE Type='UNIT_FAST_BOMBER_2';
DELETE FROM Units WHERE Type='UNIT_OLD_HEAVY_BOMBER';
DELETE FROM Units WHERE Type='UNIT_BATTLESHIP_2'; 
--*/

UPDATE Units SET ID = ID + 10000 WHERE 
	Type='UNIT_OLD_LIGHT_TANK'
OR	Type='UNIT_LIGHT_TANK'
OR	Type='UNIT_LIGHT_TANK_2'
OR	Type='UNIT_LIGHT_TANK_2_B'
OR	Type='UNIT_LIGHT_TANK_3'
OR	Type='UNIT_CRUISER_TANK'
OR	Type='UNIT_CRUISER_TANK_B'
OR	Type='UNIT_CRUISER_TANK_2'
OR	Type='UNIT_CRUISER_TANK_2_B'
OR	Type='UNIT_CRUISER_TANK_3'
OR	Type='UNIT_CRUISER_TANK_4'
OR	Type='UNIT_CRUISER_TANK_4_B'
OR	Type='UNIT_OLD_TANK'
OR	Type='UNIT_TANK_B'
OR	Type='UNIT_TANK_C'
OR	Type='UNIT_TANK_2'
OR	Type='UNIT_TANK_2_B'
OR	Type='UNIT_TANK_2_C'
OR	Type='UNIT_TANK_2_D'
OR	Type='UNIT_TANK_3'
OR	Type='UNIT_HEAVY_TANK'
OR	Type='UNIT_HEAVY_TANK_B'
OR	Type='UNIT_HEAVY_TANK_2'
OR	Type='UNIT_HEAVY_TANK_2_B'
OR	Type='UNIT_OLD_HEAVY_ASSAULT_GUN'
OR	Type='UNIT_HEAVY_ASSAULT_GUN'
OR	Type='UNIT_OLD_FIGHTER'
OR	Type='UNIT_FIGHTER_B'
OR	Type='UNIT_FIGHTER_C'
OR	Type='UNIT_FIGHTER_D'
OR	Type='UNIT_FIGHTER_2'
OR	Type='UNIT_FIGHTER_2_B'
OR	Type='UNIT_FIGHTER_3'
OR	Type='UNIT_HEAVY_FIGHTER'
OR	Type='UNIT_HEAVY_FIGHTER_B'
OR	Type='UNIT_HEAVY_FIGHTER_2'
OR	Type='UNIT_HEAVY_FIGHTER_3'
OR	Type='UNIT_FAST_BOMBER_2'
OR	Type='UNIT_OLD_HEAVY_BOMBER'
OR	Type='UNIT_BATTLESHIP_2';


-- Code's courtesy of lemmy101
CREATE TABLE IDRemapper ( id INTEGER PRIMARY KEY AUTOINCREMENT, Type TEXT );
INSERT INTO IDRemapper (Type) SELECT Type FROM Units ORDER by ID;
UPDATE Units SET ID =	( SELECT IDRemapper.id-1 FROM IDRemapper WHERE Units.Type = IDRemapper.Type);
DROP TABLE IDRemapper;
--