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