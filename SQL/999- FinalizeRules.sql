--------------------------------------------------------------------------------------------
-- Finalize Rules for R.E.D. WWII edition
-- Loaded AFTER all other modifications.
--------------------------------------------------------------------------------------------


--------------------------------------------------------------------------------------------
-- Buildings
--------------------------------------------------------------------------------------------

UPDATE Building_Flavors SET Flavor = Flavor * 0.5;	-- Build less buildings...

--------------------------------------------------------------------------------------------
-- Units
--------------------------------------------------------------------------------------------
UPDATE Units SET ProjectPrereq = NULL;			-- We don't need to set projects for units, this is handled by the mod custom function/tables
UPDATE Unit_Flavors SET Flavor = Flavor * 4;	-- Build more units...

--------------------------------------------------------------------------------------------
-- Projects
--------------------------------------------------------------------------------------------
UPDATE Project_Flavors SET Flavor = Flavor * 3 WHERE ProjectType LIKE 'PROJECT_%';	-- Project's flavor relative to units...


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