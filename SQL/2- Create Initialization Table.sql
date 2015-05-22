/*

	R.E.D. WWII Edition
	Table for new units configuration
	by Gedemon (2013)
	
	The info stocked in this table (from each unit type SQL file) are used in FinalizeTable.sql to make all the entries on the various art defines tables.
	When a model is used multiple times, it will be added once in tables with unique ID, and only the required table will be updated with multiple entries.
	
*/

-----------------------------------------------
-- Add column for effects from G+K / BNW
-----------------------------------------------
--ALTER TABLE ArtDefine_UnitMemberCombats		ADD COLUMN LastToDie INTEGER;
--ALTER TABLE UnitPromotions					ADD COLUMN IgnoreZOC BOOLEAN; -- Need DLL modification -> Must port the mod to BNW to use it.

-----------------------------------------------
-- Create UnitConfiguration table
-----------------------------------------------

DROP TABLE IF EXISTS UnitConfiguration;

CREATE TABLE UnitConfiguration (		id INTEGER PRIMARY KEY AUTOINCREMENT,
										UnitKey TEXT,
										CivKey TEXT default NULL,
										Var TEXT default '', -- Default = '' to allow empty string concatenation
										Name TEXT,
										fxsxml TEXT,
										Template TEXT,
										Nb INTEGER default NULL,
										Form TEXT default NULL,
										Scl FLOAT default NULL,
										Cbt INTEGER default NULL,
										Rgcbt INTEGER default NULL,
										Cst INTEGER default NULL,
										Mvt INTEGER default NULL,
										Imb INTEGER default NULL,
										Rng INTEGER default NULL,
										Mat INTEGER default NULL,
										Pers INTEGER default NULL,
										Fuel INTEGER default NULL,
										Flav INTEGER default NULL,
										ProjCst FLOAT default NULL,
										Flag INTEGER default NULL,
										Icon INTEGER default NULL,
										IcAtl TEXT default NULL,
										FlagAtl TEXT default NULL,
										Sv TEXT default NULL,
										Embark BOOLEAN default NULL
								);

/*
	UnitKey		= Name of the unit (ex: "PANZER_IV")
	CivKey		= Name of the civ (ex: "GERMANY"), NULL means default unit.
	Var			= prefix in case of multiple figure unit, Unit Member will be concatenate ike this ART_DEF_UNIT_MEMBER_[Key]_[var]. NULL means first (or single) figure unit.
	fxsxml		= Name of the fxsxml file of the new model (without the extension)
	Template	= UNIT_[Template], ART_DEF_UNIT_[Template] and ART_DEF_UNIT_MEMBER_[Template]: template used for the new unit's definition.
	Nb			= Number of figures in the unit for that models. Use multiple lines with different model to "interleave" them. 0 means use value from template unit.
	Form		= Formation to use for the model. NULL means use value from template unit.
	Scl			= New scale to use for the model. 0 means use value from template unit.
	Cbt			= Combat value
	Rgcbt		= Ranged Combat
	Cst			= Cost
	Mvt			= moves
	Imb			= immobile
	Rng			= range
	Mat			= reinforcement materiel / HP
	Pers		= reinforcement personnel / HP
	Fuel		= Fuel Consumption / turn
	Flav		= bonus applied to each flavor of this unit
	ProjCst		= cost factor of this project relative to unit's cost (NULL means unit's cost * 0.75)
	Flag		= flag index
	Icon		= icon idex
	IcAtl		= icon atlas
	FlagAtl		= flag atlas
	Sv			= strategic view icon
	Embark		= unit can embark on aircraft carrier
*/

