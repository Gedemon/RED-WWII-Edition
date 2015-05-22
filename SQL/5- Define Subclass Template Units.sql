/*

	R.E.D. WWII Edition
	SubClasses Template units configuration file
	by Gedemon (2013)

	It use the info stocked in the UnitConfiguration table to make all the entries on the various unit tables.
	When a model is used multiple times, it will be added once in table with unique ID, only the required table will be updated.
	
*/

-----------------------------------------------
-- Fill the initialization table
-----------------------------------------------

INSERT INTO UnitConfiguration
	(		UnitKey,				CivKey,		Var,	Name,		fxsxml,		Template,				Nb,	Form,		Scl,	Cbt,	Rgcbt,	Cst,	Mvt,	Imb,	Rng,	Mat,	Pers,	Flav,	Flag,	Icon,	IcAtl,				FlagAtl,			Sv,				Embark  	)
--		Key Name								Variation			Model file							Figures			Scale			RangedCombat	Move			Range			Pers	Flavor			IconIndex					FlagAtlas							Embarked 
--									Nation Name			Unit Name				Template Unit					Formation		Combat			Cost			Immobile		Mat						FlagIndex		IconAtlas								SV Icon

SELECT	'INFANTRY_2',				NULL,		'',		NULL,		NULL,		'INFANTRY',				NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,		NULL,	NULL,	NULL,				NULL,				NULL,			NULL	UNION ALL

SELECT	'MECHANIZED_INFANTRY_2',	NULL,		'',		NULL,		NULL,		'MECHANIZED_INFANTRY',	NULL,	NULL,	NULL,	40,		NULL,	310,	NULL,	NULL,	NULL,	NULL,	NULL,	1,		NULL,	NULL,	NULL,				NULL,				NULL,			NULL	UNION ALL
	
SELECT	'OLD_LIGHT_TANK',			NULL,		'',		NULL,		NULL,		'LIGHT_TANK',			NULL,	NULL,	NULL,	38,		NULL,	300,	4,		NULL,	NULL,	NULL,	NULL,	-2,		NULL,	NULL,	NULL,				NULL,				NULL,			NULL	UNION ALL
SELECT	'LIGHT_TANK_2',				NULL,		'',		NULL,		NULL,		'LIGHT_TANK',			NULL,	NULL,	NULL,	44,		NULL,	320,	NULL,	NULL,	NULL,	NULL,	NULL,	1,		NULL,	NULL,	NULL,				NULL,				NULL,			NULL	UNION ALL
SELECT	'LIGHT_TANK_2_B',			NULL,		'',		NULL,		NULL,		'LIGHT_TANK',			NULL,	NULL,	NULL,	48,		NULL,	325,	NULL,	NULL,	NULL,	NULL,	NULL,	1,		NULL,	NULL,	NULL,				NULL,				NULL,			NULL	UNION ALL
SELECT	'LIGHT_TANK_3',				NULL,		'',		NULL,		NULL,		'LIGHT_TANK',			NULL,	NULL,	NULL,	50,		NULL,	330,	NULL,	NULL,	NULL,	NULL,	NULL,	2,		NULL,	NULL,	NULL,				NULL,				NULL,			NULL	UNION ALL

SELECT	'LIGHT_TANK_DESTROYER_2',	NULL,		'',		NULL,		NULL,		'LIGHT_TANK_DESTROYER',	NULL,	NULL,	NULL,	38,		58,		280,	NULL,	NULL,	NULL,	NULL,	NULL,	1,		NULL,	NULL,	NULL,				NULL,				NULL,			NULL	UNION ALL
SELECT	'LIGHT_TANK_DESTROYER_2_B',	NULL,		'',		NULL,		NULL,		'LIGHT_TANK_DESTROYER',	NULL,	NULL,	NULL,	40,		60,		285,	NULL,	NULL,	NULL,	NULL,	NULL,	1,		NULL,	NULL,	NULL,				NULL,				NULL,			NULL	UNION ALL
SELECT	'LIGHT_TANK_DESTROYER_3',	NULL,		'',		NULL,		NULL,		'LIGHT_TANK_DESTROYER',	NULL,	NULL,	NULL,	42,		62,		290,	NULL,	NULL,	NULL,	NULL,	NULL,	2,		NULL,	NULL,	NULL,				NULL,				NULL,			NULL	UNION ALL
SELECT	'LIGHT_TANK_DESTROYER_4',	NULL,		'',		NULL,		NULL,		'LIGHT_TANK_DESTROYER',	NULL,	NULL,	NULL,	46,		66,		300,	NULL,	NULL,	NULL,	NULL,	NULL,	3,		NULL,	NULL,	NULL,				NULL,				NULL,			NULL	UNION ALL
SELECT	'LIGHT_TANK_DESTROYER_4_B',	NULL,		'',		NULL,		NULL,		'LIGHT_TANK_DESTROYER',	NULL,	NULL,	NULL,	48,		68,		305,	NULL,	NULL,	NULL,	NULL,	NULL,	3,		NULL,	NULL,	NULL,				NULL,				NULL,			NULL	UNION ALL
SELECT	'LIGHT_TANK_DESTROYER_4_C',	NULL,		'',		NULL,		NULL,		'LIGHT_TANK_DESTROYER',	NULL,	NULL,	NULL,	52,		72,		310,	NULL,	NULL,	NULL,	NULL,	NULL,	3,		NULL,	NULL,	NULL,				NULL,				NULL,			NULL	UNION ALL
SELECT	'LIGHT_TANK_DESTROYER_5',	NULL,		'',		NULL,		NULL,		'LIGHT_TANK_DESTROYER',	NULL,	NULL,	NULL,	55,		75,		310,	NULL,	NULL,	NULL,	NULL,	NULL,	4,		NULL,	NULL,	NULL,				NULL,				NULL,			NULL	UNION ALL

SELECT	'TANK_DESTROYER_B',			NULL,		'',		NULL,		NULL,		'TANK_DESTROYER',		NULL,	NULL,	NULL,	54,		74,		380,	NULL,	NULL,	NULL,	NULL,	NULL,	0,		NULL,	NULL,	NULL,				NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_DESTROYER_2',			NULL,		'',		NULL,		NULL,		'TANK_DESTROYER',		NULL,	NULL,	NULL,	60,		80,		385,	NULL,	NULL,	NULL,	NULL,	NULL,	1,		NULL,	NULL,	NULL,				NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_DESTROYER_2_B',		NULL,		'',		NULL,		NULL,		'TANK_DESTROYER',		NULL,	NULL,	NULL,	64,		84,		390,	NULL,	NULL,	NULL,	NULL,	NULL,	1,		NULL,	NULL,	NULL,				NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_DESTROYER_3',			NULL,		'',		NULL,		NULL,		'TANK_DESTROYER',		NULL,	NULL,	NULL,	70,		90,		395,	NULL,	NULL,	NULL,	NULL,	NULL,	2,		NULL,	NULL,	NULL,				NULL,				NULL,			NULL	UNION ALL

SELECT	'HEAVY_TANK_DESTROYER_2',	NULL,		'',		NULL,		NULL,		'HEAVY_TANK_DESTROYER',	NULL,	NULL,	NULL,	95,		130,	700,	NULL,	NULL,	NULL,	NULL,	NULL,	1,		NULL,	NULL,	NULL,				NULL,				NULL,			NULL	UNION ALL

SELECT	'ASSAULT_GUN_B',			NULL,		'',		NULL,		NULL,		'ASSAULT_GUN',			NULL,	NULL,	NULL,	53,		NULL,	380,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,				NULL,				NULL,			NULL	UNION ALL
SELECT	'ASSAULT_GUN_C',			NULL,		'',		NULL,		NULL,		'ASSAULT_GUN',			NULL,	NULL,	NULL,	56,		NULL,	385,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,				NULL,				NULL,			NULL	UNION ALL
SELECT	'ASSAULT_GUN_2',			NULL,		'',		NULL,		NULL,		'ASSAULT_GUN',			NULL,	NULL,	NULL,	60,		NULL,	385,	NULL,	NULL,	NULL,	NULL,	NULL,	1,		NULL,	NULL,	NULL,				NULL,				NULL,			NULL	UNION ALL
SELECT	'ASSAULT_GUN_3',			NULL,		'',		NULL,		NULL,		'ASSAULT_GUN',			NULL,	NULL,	NULL,	65,		NULL,	395,	NULL,	NULL,	NULL,	NULL,	NULL,	2,		NULL,	NULL,	NULL,				NULL,				NULL,			NULL	UNION ALL
																	
SELECT	'OLD_HEAVY_ASSAULT_GUN',	NULL,		'',		NULL,		NULL,		'HEAVY_ASSAULT_GUN',	NULL,	NULL,	NULL,	70,		NULL,	685,	1,		NULL,	NULL,	NULL,	NULL,	-1,		NULL,	NULL,	NULL,				NULL,				NULL,			NULL	UNION ALL
SELECT	'HEAVY_ASSAULT_GUN_2',		NULL,		'',		NULL,		NULL,		'HEAVY_ASSAULT_GUN',	NULL,	NULL,	NULL,	90,		NULL,	725,	NULL,	NULL,	NULL,	NULL,	NULL,	1,		NULL,	NULL,	NULL,				NULL,				NULL,			NULL	UNION ALL
																			
--		Key Name								Variation			Model file							Figures			Scale			RangedCombat	Move			Range			Pers	Flavor			IconIndex					FlagAtlas							Embarked 
--									Nation Name			Unit Name				Template Unit					Formation		Combat			Cost			Immobile		Mat						FlagIndex		IconAtlas								SV Icon
																			
SELECT	'CRUISER_TANK_B',			NULL,		'',		NULL,		NULL,		'CRUISER_TANK',			NULL,	NULL,	NULL,	42,		NULL,	380,	6,		NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,				NULL,				NULL,			NULL	UNION ALL
SELECT	'CRUISER_TANK_2',			NULL,		'',		NULL,		NULL,		'CRUISER_TANK',			NULL,	NULL,	NULL,	45,		NULL,	385,	6,		NULL,	NULL,	NULL,	NULL,	1,		NULL,	NULL,	NULL,				NULL,				NULL,			NULL	UNION ALL
SELECT	'CRUISER_TANK_2_B',			NULL,		'',		NULL,		NULL,		'CRUISER_TANK',			NULL,	NULL,	NULL,	47,		NULL,	390,	6,		NULL,	NULL,	NULL,	NULL,	1,		NULL,	NULL,	NULL,				NULL,				NULL,			NULL	UNION ALL
SELECT	'CRUISER_TANK_3',			NULL,		'',		NULL,		NULL,		'CRUISER_TANK',			NULL,	NULL,	NULL,	48,		NULL,	395,	6,		NULL,	NULL,	NULL,	NULL,	1,		NULL,	NULL,	NULL,				NULL,				NULL,			NULL	UNION ALL
SELECT	'CRUISER_TANK_4',			NULL,		'',		NULL,		NULL,		'CRUISER_TANK',			NULL,	NULL,	NULL,	50,		NULL,	405,	6,		NULL,	NULL,	NULL,	NULL,	2,		NULL,	NULL,	NULL,				NULL,				NULL,			NULL	UNION ALL
SELECT	'CRUISER_TANK_4_B',			NULL,		'',		NULL,		NULL,		'CRUISER_TANK',			NULL,	NULL,	NULL,	52,		NULL,	410,	6,		NULL,	NULL,	NULL,	NULL,	2,		NULL,	NULL,	NULL,				NULL,				NULL,			NULL	UNION ALL
SELECT	'CRUISER_TANK_5',			NULL,		'',		NULL,		NULL,		'CRUISER_TANK',			NULL,	NULL,	NULL,	52,		NULL,	410,	6,		NULL,	NULL,	NULL,	NULL,	3,		NULL,	NULL,	NULL,				NULL,				NULL,			NULL	UNION ALL
SELECT	'CRUISER_TANK_5_B',			NULL,		'',		NULL,		NULL,		'CRUISER_TANK',			NULL,	NULL,	NULL,	52,		NULL,	410,	6,		NULL,	NULL,	NULL,	NULL,	3,		NULL,	NULL,	NULL,				NULL,				NULL,			NULL	UNION ALL
SELECT	'CRUISER_TANK_5_C',			NULL,		'',		NULL,		NULL,		'CRUISER_TANK',			NULL,	NULL,	NULL,	60,		NULL,	425,	6,		NULL,	NULL,	NULL,	NULL,	3,		NULL,	NULL,	NULL,				NULL,				NULL,			NULL	UNION ALL
SELECT	'CRUISER_TANK_6',			NULL,		'',		NULL,		NULL,		'CRUISER_TANK',			NULL,	NULL,	NULL,	52,		NULL,	410,	6,		NULL,	NULL,	NULL,	NULL,	4,		NULL,	NULL,	NULL,				NULL,				NULL,			NULL	UNION ALL
SELECT	'CRUISER_TANK_7',			NULL,		'',		NULL,		NULL,		'CRUISER_TANK',			NULL,	NULL,	NULL,	52,		NULL,	410,	6,		NULL,	NULL,	NULL,	NULL,	4,		NULL,	NULL,	NULL,				NULL,				NULL,			NULL	UNION ALL

SELECT	'LIGHT_INFANTRY_TANK_B',	NULL,		'',		NULL,		NULL,		'LIGHT_INFANTRY_TANK',	NULL,	NULL,	NULL,	46,		NULL,	320,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,				NULL,				NULL,			NULL	UNION ALL
SELECT	'LIGHT_INFANTRY_TANK_2',	NULL,		'',		NULL,		NULL,		'LIGHT_INFANTRY_TANK',	NULL,	NULL,	NULL,	48,		NULL,	325,	NULL,	NULL,	NULL,	NULL,	NULL,	1,		NULL,	NULL,	NULL,				NULL,				NULL,			NULL	UNION ALL

SELECT	'INFANTRY_TANK_2',			NULL,		'',		NULL,		NULL,		'INFANTRY_TANK',		NULL,	NULL,	NULL,	60,		NULL,	385,	4,		NULL,	NULL,	NULL,	NULL,	1,		NULL,	NULL,	NULL,				NULL,				NULL,			NULL	UNION ALL
																			
--		Key Name								Variation			Model file							Figures			Scale			RangedCombat	Move			Range			Pers	Flavor			IconIndex					FlagAtlas							Embarked 
--									Nation Name			Unit Name				Template Unit					Formation		Combat			Cost			Immobile		Mat						FlagIndex		IconAtlas								SV Icon
																			
SELECT	'OLD_TANK',					NULL,		'',		NULL,		NULL,		'TANK',					NULL,	NULL,	NULL,	48,		NULL,	375,	4,		NULL,	NULL,	NULL,	NULL,	-1,		NULL,	NULL,	NULL,				NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_B',					NULL,		'',		NULL,		NULL,		'TANK',					NULL,	NULL,	NULL,	54,		NULL,	380,	5,		NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,				NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_C',					NULL,		'',		NULL,		NULL,		'TANK',					NULL,	NULL,	NULL,	58,		NULL,	385,	5,		NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,				NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_D',					NULL,		'',		NULL,		NULL,		'TANK',					NULL,	NULL,	NULL,	60,		NULL,	388,	5,		NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,				NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_E',					NULL,		'',		NULL,		NULL,		'TANK',					NULL,	NULL,	NULL,	62,		NULL,	394,	5,		NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,				NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_F',					NULL,		'',		NULL,		NULL,		'TANK',					NULL,	NULL,	NULL,	64,		NULL,	398,	5,		NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,				NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_G',					NULL,		'',		NULL,		NULL,		'TANK',					NULL,	NULL,	NULL,	68,		NULL,	402,	5,		NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,				NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_2',					NULL,		'',		NULL,		NULL,		'TANK',					NULL,	NULL,	NULL,	58,		NULL,	385,	5,		NULL,	NULL,	NULL,	NULL,	1,		NULL,	NULL,	NULL,				NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_2_B',					NULL,		'',		NULL,		NULL,		'TANK',					NULL,	NULL,	NULL,	62,		NULL,	390,	5,		NULL,	NULL,	NULL,	NULL,	1,		NULL,	NULL,	NULL,				NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_2_C',					NULL,		'',		NULL,		NULL,		'TANK',					NULL,	NULL,	NULL,	65,		NULL,	395,	5,		NULL,	NULL,	NULL,	NULL,	1,		NULL,	NULL,	NULL,				NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_2_D',					NULL,		'',		NULL,		NULL,		'TANK',					NULL,	NULL,	NULL,	70,		NULL,	400,	5,		NULL,	NULL,	NULL,	NULL,	1,		NULL,	NULL,	NULL,				NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_3',					NULL,		'',		NULL,		NULL,		'TANK',					NULL,	NULL,	NULL,	75,		NULL,	395,	5,		NULL,	NULL,	NULL,	NULL,	2,		NULL,	NULL,	NULL,				NULL,				NULL,			NULL	UNION ALL
																		
SELECT	'HEAVY_TANK_B',				NULL,		'',		NULL,		NULL,		'HEAVY_TANK',			NULL,	NULL,	NULL,	70,		NULL,	630,	3,		NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,				NULL,				NULL,			NULL	UNION ALL
SELECT	'HEAVY_TANK_2',				NULL,		'',		NULL,		NULL,		'HEAVY_TANK',			NULL,	NULL,	NULL,	80,		NULL,	650,	4,		NULL,	NULL,	NULL,	NULL,	1,		NULL,	NULL,	NULL,				NULL,				NULL,			NULL	UNION ALL
SELECT	'HEAVY_TANK_2_B',			NULL,		'',		NULL,		NULL,		'HEAVY_TANK',			NULL,	NULL,	NULL,	85,		NULL,	675,	4,		NULL,	NULL,	NULL,	NULL,	1,		NULL,	NULL,	NULL,				NULL,				NULL,			NULL	UNION ALL
SELECT	'HEAVY_TANK_2_C',			NULL,		'',		NULL,		NULL,		'HEAVY_TANK',			NULL,	NULL,	NULL,	90,		NULL,	700,	4,		NULL,	NULL,	NULL,	NULL,	1,		NULL,	NULL,	NULL,				NULL,				NULL,			NULL	UNION ALL
SELECT	'HEAVY_TANK_3',				NULL,		'',		NULL,		NULL,		'HEAVY_TANK',			NULL,	NULL,	NULL,	95,		NULL,	700,	4,		NULL,	NULL,	NULL,	NULL,	2,		NULL,	NULL,	NULL,				NULL,				NULL,			NULL	UNION ALL
	
SELECT	'MOBILE_ARTILLERY_2',		NULL,		'',		NULL,		NULL,		'MOBILE_ARTILLERY',		NULL,	NULL,	NULL,	20,		35,		350,	4,		NULL,	NULL,	NULL,	NULL,	1,		NULL,	NULL,	NULL,				NULL,				NULL,			NULL	UNION ALL
SELECT	'MOBILE_ARTILLERY_3',		NULL,		'',		NULL,		NULL,		'MOBILE_ARTILLERY',		NULL,	NULL,	NULL,	24,		42,		360,	4,		NULL,	NULL,	NULL,	NULL,	2,		NULL,	NULL,	NULL,				NULL,				NULL,			NULL	UNION ALL
SELECT	'MOBILE_ARTILLERY_4',		NULL,		'',		NULL,		NULL,		'MOBILE_ARTILLERY',		NULL,	NULL,	NULL,	28,		50,		370,	4,		NULL,	NULL,	NULL,	NULL,	3,		NULL,	NULL,	NULL,				NULL,				NULL,			NULL	UNION ALL

SELECT	'MOBILE_AA_GUN_B',			NULL,		'',		NULL,		NULL,		'MOBILE_AA_GUN',		NULL,	NULL,	NULL,	20,		40,		335,	4,		NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,				NULL,				NULL,			NULL	UNION ALL
SELECT	'MOBILE_AA_GUN_2',			NULL,		'',		NULL,		NULL,		'MOBILE_AA_GUN',		NULL,	NULL,	NULL,	30,		50,		350,	4,		NULL,	NULL,	15,		9,		1,		NULL,	NULL,	NULL,				NULL,				NULL,			NULL	UNION ALL
SELECT	'MOBILE_AA_GUN_2_B',		NULL,		'',		NULL,		NULL,		'MOBILE_AA_GUN',		NULL,	NULL,	NULL,	35,		54,		355,	4,		NULL,	NULL,	15,		9,		1,		NULL,	NULL,	NULL,				NULL,				NULL,			NULL	UNION ALL
SELECT	'MOBILE_AA_GUN_2_C',		NULL,		'',		NULL,		NULL,		'MOBILE_AA_GUN',		NULL,	NULL,	NULL,	40,		54,		360,	4,		NULL,	NULL,	15,		9,		1,		NULL,	NULL,	NULL,				NULL,				NULL,			NULL	UNION ALL
SELECT	'MOBILE_AA_GUN_2_D',		NULL,		'',		NULL,		NULL,		'MOBILE_AA_GUN',		NULL,	NULL,	NULL,	50,		58,		370,	4,		NULL,	NULL,	16,		8,		1,		NULL,	NULL,	NULL,				NULL,				NULL,			NULL	UNION ALL
SELECT	'MOBILE_AA_GUN_3',			NULL,		'',		NULL,		NULL,		'MOBILE_AA_GUN',		NULL,	NULL,	NULL,	55,		60,		380,	4,		NULL,	NULL,	16,		8,		2,		NULL,	NULL,	NULL,				NULL,				NULL,			NULL	UNION ALL

	
--		Key Name								Variation			Model file							Figures			Scale			RangedCombat	Move			Range			Pers	Flavor			IconIndex					FlagAtlas							Embarked 
--									Nation Name			Unit Name				Template Unit					Formation		Combat			Cost			Immobile		Mat						FlagIndex		IconAtlas								SV Icon

SELECT	'OLD_NAVY_FIGHTER',			NULL,		'',		NULL,		NULL,		'NAVY_FIGHTER',			NULL,	NULL,	NULL,	NULL,	30,		345,	NULL,	NULL,	8,		NULL,	NULL,	-1,		NULL,	NULL,	NULL,				NULL,				NULL,			NULL	UNION ALL
SELECT	'NAVY_FIGHTER_B',			NULL,		'',		NULL,		NULL,		'NAVY_FIGHTER',			NULL,	NULL,	NULL,	NULL,	40,		405,	NULL,	NULL,	10,		NULL,	NULL,	NULL,	NULL,	NULL,	NULL,				NULL,				NULL,			NULL	UNION ALL
SELECT	'NAVY_FIGHTER_C',			NULL,		'',		NULL,		NULL,		'NAVY_FIGHTER',			NULL,	NULL,	NULL,	NULL,	42,		415,	NULL,	NULL,	11,		NULL,	NULL,	NULL,	NULL,	NULL,	NULL,				NULL,				NULL,			NULL	UNION ALL
SELECT	'NAVY_FIGHTER_2',			NULL,		'',		NULL,		NULL,		'NAVY_FIGHTER',			NULL,	NULL,	NULL,	NULL,	48,		410,	NULL,	NULL,	11,		NULL,	NULL,	1,		NULL,	NULL,	NULL,				NULL,				NULL,			NULL	UNION ALL
SELECT	'NAVY_FIGHTER_3',			NULL,		'',		NULL,		NULL,		'NAVY_FIGHTER',			NULL,	NULL,	NULL,	NULL,	52,		425,	NULL,	NULL,	12,		NULL,	NULL,	2,		NULL,	NULL,	NULL,				NULL,				NULL,			NULL	UNION ALL

SELECT	'OLD_FIGHTER',				NULL,		'',		NULL,		NULL,		'FIGHTER',				NULL,	NULL,	NULL,	NULL,	30,		325,	NULL,	NULL,	8,		NULL,	NULL,	-1,		NULL,	NULL,	NULL,				NULL,				NULL,			NULL	UNION ALL
SELECT	'FIGHTER_B',				NULL,		'',		NULL,		NULL,		'FIGHTER',				NULL,	NULL,	NULL,	NULL,	44,		380,	NULL,	NULL,	10,		NULL,	NULL,	NULL,	NULL,	NULL,	NULL,				NULL,				NULL,			NULL	UNION ALL
SELECT	'FIGHTER_C',				NULL,		'',		NULL,		NULL,		'FIGHTER',				NULL,	NULL,	NULL,	NULL,	48,		390,	NULL,	NULL,	10,		NULL,	NULL,	NULL,	NULL,	NULL,	NULL,				NULL,				NULL,			NULL	UNION ALL
SELECT	'FIGHTER_D',				NULL,		'',		NULL,		NULL,		'FIGHTER',				NULL,	NULL,	NULL,	NULL,	50,		400,	NULL,	NULL,	10,		NULL,	NULL,	NULL,	NULL,	NULL,	NULL,				NULL,				NULL,			NULL	UNION ALL
SELECT	'FIGHTER_2',				NULL,		'',		NULL,		NULL,		'FIGHTER',				NULL,	NULL,	NULL,	NULL,	45,		385,	NULL,	NULL,	11,		NULL,	NULL,	1,		NULL,	NULL,	NULL,				NULL,				NULL,			NULL	UNION ALL
SELECT	'FIGHTER_2_B',				NULL,		'',		NULL,		NULL,		'FIGHTER',				NULL,	NULL,	NULL,	NULL,	48,		390,	NULL,	NULL,	11,		NULL,	NULL,	1,		NULL,	NULL,	NULL,				NULL,				NULL,			NULL	UNION ALL
SELECT	'FIGHTER_2_C',				NULL,		'',		NULL,		NULL,		'FIGHTER',				NULL,	NULL,	NULL,	NULL,	52,		400,	NULL,	NULL,	12,		NULL,	NULL,	1,		NULL,	NULL,	NULL,				NULL,				NULL,			NULL	UNION ALL
SELECT	'FIGHTER_2_D',				NULL,		'',		NULL,		NULL,		'FIGHTER',				NULL,	NULL,	NULL,	NULL,	55,		410,	NULL,	NULL,	12,		NULL,	NULL,	1,		NULL,	NULL,	NULL,				NULL,				NULL,			NULL	UNION ALL
SELECT	'FIGHTER_3',				NULL,		'',		NULL,		NULL,		'FIGHTER',				NULL,	NULL,	NULL,	NULL,	55,		400,	NULL,	NULL,	12,		NULL,	NULL,	2,		NULL,	NULL,	NULL,				NULL,				NULL,			NULL	UNION ALL

SELECT	'FIGHTER_BOMBER_B',			NULL,		'',		NULL,		NULL,		'FIGHTER_BOMBER',		NULL,	NULL,	NULL,	NULL,	44,		380,	NULL,	NULL,	10,		NULL,	NULL,	NULL,	NULL,	NULL,	NULL,				NULL,				NULL,			NULL	UNION ALL
SELECT	'FIGHTER_BOMBER_2',			NULL,		'',		NULL,		NULL,		'FIGHTER_BOMBER',		NULL,	NULL,	NULL,	NULL,	50,		385,	NULL,	NULL,	12,		NULL,	NULL,	1,		NULL,	NULL,	NULL,				NULL,				NULL,			NULL	UNION ALL
SELECT	'FIGHTER_BOMBER_2_B',		NULL,		'',		NULL,		NULL,		'FIGHTER_BOMBER',		NULL,	NULL,	NULL,	NULL,	55,		390,	NULL,	NULL,	12,		NULL,	NULL,	1,		NULL,	NULL,	NULL,				NULL,				NULL,			NULL	UNION ALL

SELECT	'ATTACK_AIRCRAFT_B',		NULL,		'',		NULL,		NULL,		'ATTACK_AIRCRAFT',		NULL,	NULL,	NULL,	NULL,	34,		305,	NULL,	NULL,	9,		NULL,	NULL,	NULL,	NULL,	NULL,	NULL,				NULL,				NULL,			NULL	UNION ALL
SELECT	'ATTACK_AIRCRAFT_C',		NULL,		'',		NULL,		NULL,		'ATTACK_AIRCRAFT',		NULL,	NULL,	NULL,	NULL,	38,		315,	NULL,	NULL,	10,		NULL,	NULL,	NULL,	NULL,	NULL,	NULL,				NULL,				NULL,			NULL	UNION ALL

SELECT	'NAVY_BOMBER_2',			NULL,		'',		NULL,		NULL,		'NAVY_BOMBER',			NULL,	NULL,	NULL,	NULL,	35,		390,	NULL,	NULL,	10,		NULL,	NULL,	1,		NULL,	NULL,	NULL,				NULL,				NULL,			NULL	UNION ALL
																		
SELECT	'HEAVY_FIGHTER_B',			NULL,		'',		NULL,		NULL,		'HEAVY_FIGHTER',		NULL,	NULL,	NULL,	NULL,	48,		395,	NULL,	NULL,	13,		NULL,	NULL,	NULL,	NULL,	NULL,	NULL,				NULL,				NULL,			NULL	UNION ALL
SELECT	'HEAVY_FIGHTER_2',			NULL,		'',		NULL,		NULL,		'HEAVY_FIGHTER',		NULL,	NULL,	NULL,	NULL,	52,		400,	NULL,	NULL,	13,		NULL,	NULL,	1,		NULL,	NULL,	NULL,				NULL,				NULL,			NULL	UNION ALL
SELECT	'HEAVY_FIGHTER_3',			NULL,		'',		NULL,		NULL,		'HEAVY_FIGHTER',		NULL,	NULL,	NULL,	NULL,	65,		420,	NULL,	NULL,	14,		NULL,	NULL,	2,		NULL,	NULL,	NULL,				NULL,				NULL,			NULL	UNION ALL
																		
SELECT	'FAST_BOMBER_2',			NULL,		'',		NULL,		NULL,		'FAST_BOMBER',			NULL,	NULL,	NULL,	NULL,	44,		425,	NULL,	NULL,	12,		NULL,	NULL,	1,		NULL,	NULL,	NULL,				NULL,				NULL,			NULL	UNION ALL

SELECT	'JET_BOMBER_2',				NULL,		'',		NULL,		NULL,		'JET_BOMBER',			NULL,	NULL,	NULL,	NULL,	40,		550,	NULL,	NULL,	14,		1,		NULL,	1,		NULL,	NULL,	NULL,				NULL,				NULL,			NULL	UNION ALL

SELECT	'OLD_HEAVY_BOMBER',			NULL,		'',		NULL,		NULL,		'HEAVY_BOMBER',			NULL,	NULL,	NULL,	NULL,	60,		450,	NULL,	NULL,	15,		NULL,	NULL,	-1,		NULL,	NULL,	NULL,				NULL,				NULL,			NULL	UNION ALL
SELECT	'HEAVY_BOMBER_2',			NULL,		'',		NULL,		NULL,		'HEAVY_BOMBER',			NULL,	NULL,	NULL,	NULL,	80,		525,	NULL,	NULL,	18,		NULL,	NULL,	1,		NULL,	NULL,	NULL,				NULL,				NULL,			NULL	UNION ALL
SELECT	'HEAVY_BOMBER_3',			NULL,		'',		NULL,		NULL,		'HEAVY_BOMBER',			NULL,	NULL,	NULL,	NULL,	90,		575,	NULL,	NULL,	20,		NULL,	NULL,	2,		NULL,	NULL,	NULL,				NULL,				NULL,			NULL	UNION ALL

--		Key Name								Variation			Model file							Figures			Scale			RangedCombat	Move			Range			Pers	Flavor			IconIndex					FlagAtlas							Embarked 
--									Nation Name			Unit Name				Template Unit					Formation		Combat			Cost			Immobile		Mat						FlagIndex		IconAtlas								SV Icon
										
SELECT	'DESTROYER_2',				NULL,		'',		NULL,		NULL,		'DESTROYER',			NULL,	NULL,	NULL,	35,		25,		410,	7,		NULL,	1,		NULL,	NULL,	1,		NULL,	NULL,	NULL,				NULL,				NULL,			NULL	UNION ALL

SELECT	'BATTLESHIP_2',				NULL,		'',		NULL,		NULL,		'BATTLESHIP',			NULL,	NULL,	NULL,	75,		50,		750,	4,		NULL,	1,		NULL,	NULL,	1,		NULL,	NULL,	NULL,				NULL,				NULL,			NULL	UNION ALL

SELECT	'SUBMARINE_2',				NULL,		'',		NULL,		NULL,		'SUBMARINE',			NULL,	NULL,	NULL,	25,		35,		325,	6,		NULL,	1,		NULL,	NULL,	1,		NULL,	NULL,	NULL,				NULL,				NULL,			NULL	UNION ALL
SELECT	'SUBMARINE_3',				NULL,		'',		NULL,		NULL,		'SUBMARINE',			NULL,	NULL,	NULL,	35,		30,		425,	5,		NULL,	1,		NULL,	NULL,	2,		NULL,	NULL,	NULL,				NULL,				NULL,			NULL	UNION ALL

SELECT	'CARRIER_2',				NULL,		'',		NULL,		NULL,		'CARRIER',				NULL,	NULL,	NULL,	40,		NULL,	550,	5,		NULL,	NULL,	NULL,	NULL,	1,		NULL,	NULL,	NULL,				NULL,				NULL,			NULL	UNION ALL
SELECT	'CARRIER_3',				NULL,		'',		NULL,		NULL,		'CARRIER',				NULL,	NULL,	NULL,	50,		NULL,	600,	5,		NULL,	NULL,	NULL,	NULL,	2,		NULL,	NULL,	NULL,				NULL,				NULL,			NULL;--	UNION ALL


-----------------------------------------------
-- Make ArtDefine_UnitMemberCombats 
-----------------------------------------------

-- Works for single or multiple figures, with Var being '' in case of single (or first) figure
INSERT INTO ArtDefine_UnitMemberCombats (UnitMemberType, EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
	SELECT	'ART_DEF_UNIT_MEMBER_' || UnitKey || Var, EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, 
			MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
	FROM ArtDefine_UnitMemberCombats JOIN UnitConfiguration ON  (UnitMemberType = 'ART_DEF_UNIT_MEMBER_' || UnitConfiguration.Template);
	

-----------------------------------------------
-- Make ArtDefine_UnitMemberCombatWeapons 
-----------------------------------------------

INSERT INTO ArtDefine_UnitMemberCombatWeapons (UnitMemberType, "Index", SubIndex, "ID", VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag, MissTargetSlopRadius)
	SELECT 'ART_DEF_UNIT_MEMBER_' || UnitKey || Var, "Index", SubIndex, ArtDefine_UnitMemberCombatWeapons.ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag, MissTargetSlopRadius
	FROM ArtDefine_UnitMemberCombatWeapons JOIN UnitConfiguration ON (UnitMemberType = 'ART_DEF_UNIT_MEMBER_' || UnitConfiguration.Template);
		
	
-----------------------------------------------
-- Make ArtDefine_UnitMemberInfos 
-----------------------------------------------

-- Use default scale with new model
INSERT INTO ArtDefine_UnitMemberInfos (Type, Scale, ZOffset, Domain, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag)
	SELECT	'ART_DEF_UNIT_MEMBER_' || UnitKey || Var, Scale, ZOffset, Domain, 
			UnitConfiguration.fxsxml || '.fxsxml', MaterialTypeTag, MaterialTypeSoundOverrideTag
	FROM ArtDefine_UnitMemberInfos JOIN UnitConfiguration ON (Type = 'ART_DEF_UNIT_MEMBER_' || UnitConfiguration.Template AND UnitConfiguration.Scl ISNULL AND UnitConfiguration.fxsxml NOT NULL);

-- Use custom scale with new model
INSERT INTO ArtDefine_UnitMemberInfos (Type, Scale, ZOffset, Domain, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag)
	SELECT	'ART_DEF_UNIT_MEMBER_' || UnitKey || Var, Scl, ZOffset, Domain, 
			UnitConfiguration.fxsxml || '.fxsxml', MaterialTypeTag, MaterialTypeSoundOverrideTag
	FROM ArtDefine_UnitMemberInfos JOIN UnitConfiguration ON (Type = 'ART_DEF_UNIT_MEMBER_' || UnitConfiguration.Template AND UnitConfiguration.Scl NOT NULL AND UnitConfiguration.fxsxml NOT NULL);

-- Use template fsxml model
INSERT OR REPLACE INTO ArtDefine_UnitMemberInfos (Type, Scale, ZOffset, Domain, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag)
	SELECT	'ART_DEF_UNIT_MEMBER_' || UnitKey || Var, Scale, ZOffset, Domain, 
			Model, MaterialTypeTag, MaterialTypeSoundOverrideTag
	FROM ArtDefine_UnitMemberInfos JOIN UnitConfiguration ON (Type = 'ART_DEF_UNIT_MEMBER_' || UnitConfiguration.Template AND UnitConfiguration.fxsxml ISNULL);

-----------------------------------------------
-- Make ArtDefine_UnitInfoMemberInfos 
-----------------------------------------------

-- Remove previous entries, if any
DELETE FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType IN (SELECT 'ART_DEF_UNIT_' || UnitKey FROM UnitConfiguration);

-- Use default number of member
INSERT INTO ArtDefine_UnitInfoMemberInfos (UnitInfoType, UnitMemberInfoType, NumMembers)
	SELECT	'ART_DEF_UNIT_' || UnitKey, 'ART_DEF_UNIT_MEMBER_' || UnitKey || Var, NumMembers
	FROM ArtDefine_UnitInfoMemberInfos JOIN UnitConfiguration ON (UnitConfiguration.Nb ISNULL AND UnitInfoType = 'ART_DEF_UNIT_' || UnitConfiguration.Template);

-- Use custom number of member
INSERT INTO ArtDefine_UnitInfoMemberInfos (UnitInfoType, UnitMemberInfoType, NumMembers)
	SELECT	'ART_DEF_UNIT_' || UnitKey, 'ART_DEF_UNIT_MEMBER_' || UnitKey || Var, Nb
	FROM UnitConfiguration WHERE (UnitConfiguration.Nb NOT NULL);
	

---------------------------------------------------------
-- Keep only the first entry in config table for each unit type
---------------------------------------------------------

DELETE FROM UnitConfiguration
	WHERE   var <> '';


---------------------------------------------------------
-- Make ArtDefine_UnitInfos from remaining unique entries
---------------------------------------------------------

-- Use default formation
INSERT INTO ArtDefine_UnitInfos (Type,DamageStates,Formation)
	SELECT	'ART_DEF_UNIT_' || UnitKey, DamageStates, Formation
	FROM ArtDefine_UnitInfos JOIN UnitConfiguration
		ON 'ART_DEF_UNIT_' || UnitConfiguration.Template = Type AND UnitConfiguration.Form ISNULL;

-- Use custom formation
INSERT INTO ArtDefine_UnitInfos (Type,DamageStates,Formation)
	SELECT	'ART_DEF_UNIT_' || UnitKey, DamageStates, Form
	FROM ArtDefine_UnitInfos JOIN UnitConfiguration 
		ON 'ART_DEF_UNIT_' || UnitConfiguration.Template = Type AND UnitConfiguration.Form NOT NULL;


---------------------------------------------------------
-- Unit statistics: First copy all value from base template
---------------------------------------------------------

INSERT INTO Units (Type, Description, Civilopedia, Strategy, Help, Requirements,
					 Combat, RangedCombat, Cost, Moves, Immobile, Range, BaseSightRange, Class, Special, Capture, CombatClass, Domain, CivilianAttackPriority, DefaultUnitAI, Food, NoBadGoodies, RivalTerritory, MilitarySupport, MilitaryProduction, Pillage, Found, FoundAbroad, CultureBombRadius, GoldenAgeTurns, IgnoreBuildingDefense, PrereqResources, Mechanized, Suicide, CaptureWhileEmbarked, PrereqTech, ObsoleteTech, GoodyHutUpgradeUnitClass, HurryCostModifier, AdvancedStartCost, MinAreaSize, AirUnitCap, NukeDamageLevel, WorkRate, NumFreeTechs, RushBuilding, BaseHurry, HurryMultiplier, BaseGold, NumGoldPerEra, SpreadReligion, CombatLimit, RangeAttackOnlyInDomain, RangeAttackIgnoreLOS, RangedCombatLimit, XPValueAttack, XPValueDefense, SpecialCargo, DomainCargo, Conscription, ExtraMaintenanceCost, NoMaintenance, Unhappiness,
					 UnitArtInfo, UnitArtInfoCulturalVariation, UnitArtInfoEraVariation, ProjectPrereq, SpaceshipProject, LeaderPromotion, LeaderExperience, DontShowYields, ShowInPedia, MoveRate, 
					 UnitFlagIconOffset, PortraitIndex, IconAtlas, UnitFlagAtlas, Materiel, Personnel, FuelConsumption, KeyName)
	SELECT	'UNIT_' || UnitKey, Description, Civilopedia, Strategy, Help, Requirements,
					 Combat, RangedCombat, Cost, Moves, Immobile, Range, BaseSightRange, Class, Special, Capture, CombatClass, Domain, CivilianAttackPriority, DefaultUnitAI, Food, NoBadGoodies, RivalTerritory, MilitarySupport, MilitaryProduction, Pillage, Found, FoundAbroad, CultureBombRadius, GoldenAgeTurns, IgnoreBuildingDefense, PrereqResources, Mechanized, Suicide, CaptureWhileEmbarked, PrereqTech, ObsoleteTech, GoodyHutUpgradeUnitClass, HurryCostModifier, AdvancedStartCost, MinAreaSize, AirUnitCap, NukeDamageLevel, WorkRate, NumFreeTechs, RushBuilding, BaseHurry, HurryMultiplier, BaseGold, NumGoldPerEra, SpreadReligion, CombatLimit, RangeAttackOnlyInDomain, RangeAttackIgnoreLOS, RangedCombatLimit, XPValueAttack, XPValueDefense, SpecialCargo, DomainCargo, Conscription, ExtraMaintenanceCost, NoMaintenance, Unhappiness,
			'ART_DEF_UNIT_' || UnitKey, UnitArtInfoCulturalVariation, UnitArtInfoEraVariation, ProjectPrereq, SpaceshipProject, LeaderPromotion, LeaderExperience, DontShowYields, ShowInPedia, MoveRate, 
					 UnitFlagIconOffset, PortraitIndex, IconAtlas, UnitFlagAtlas, Materiel, Personnel, FuelConsumption, UnitKey
	FROM Units JOIN UnitConfiguration ON  (Type = 'UNIT_' || UnitConfiguration.Template);


---------------------------------------------------------
-- Then update each value that is specific to the new template
---------------------------------------------------------

-- Template units define their own classes...
INSERT INTO UnitClasses (Type, Description, MaxGlobalInstances, MaxTeamInstances, MaxPlayerInstances, InstanceCostModifier, DefaultUnit)
	SELECT 'UNITCLASS_' || UnitKey, Description, MaxGlobalInstances, MaxTeamInstances, MaxPlayerInstances, InstanceCostModifier, 'UNIT_' || UnitKey
	FROM UnitClasses JOIN UnitConfiguration ON (Type = 'UNITCLASS_' || UnitConfiguration.Template);
	
			
UPDATE UnitClasses SET Description = (SELECT Tag FROM Language_en_US WHERE 'TXT_KEY_' || UnitClasses.DefaultUnit = Tag)
			WHERE EXISTS	   (SELECT Tag FROM Language_en_US WHERE 'TXT_KEY_' || UnitClasses.DefaultUnit = Tag);
			
UPDATE UnitClasses SET Description = (SELECT Name FROM UnitConfiguration WHERE 'UNITCLASS_' || UnitConfiguration.UnitKey = UnitClasses.Type)
			WHERE NOT EXISTS   (SELECT Tag FROM Language_en_US WHERE 'TXT_KEY_' || UnitClasses.DefaultUnit = Tag)
			AND EXISTS (SELECT Name FROM UnitConfiguration WHERE 'UNITCLASS_' || UnitConfiguration.UnitKey = UnitClasses.Type AND Name NOT NULL);
	
-- Class
UPDATE Units SET Class = (SELECT 'UNITCLASS_' || UnitKey FROM UnitConfiguration WHERE 'UNIT_' || UnitKey = Type)
			WHERE EXISTS (SELECT 'UNITCLASS_' || UnitKey FROM UnitConfiguration WHERE 'UNIT_' || UnitKey = Type) ;

-- Combat
UPDATE Units SET Combat = (SELECT Cbt FROM UnitConfiguration WHERE 'UNIT_' || UnitConfiguration.UnitKey = Units.Type AND UnitConfiguration.Cbt NOT NULL)
			WHERE EXISTS  (SELECT Cbt FROM UnitConfiguration WHERE 'UNIT_' || UnitConfiguration.UnitKey = Units.Type AND UnitConfiguration.Cbt NOT NULL);

-- Ranged Combat
UPDATE Units SET RangedCombat = (SELECT Rgcbt FROM UnitConfiguration WHERE 'UNIT_' || UnitConfiguration.UnitKey = Units.Type AND UnitConfiguration.Rgcbt NOT NULL)
			WHERE EXISTS        (SELECT Rgcbt FROM UnitConfiguration WHERE 'UNIT_' || UnitConfiguration.UnitKey = Units.Type AND UnitConfiguration.Rgcbt NOT NULL);

-- Cost
UPDATE Units SET Cost =  (SELECT Cst FROM UnitConfiguration WHERE 'UNIT_' || UnitConfiguration.UnitKey = Units.Type AND UnitConfiguration.Cst NOT NULL)
			WHERE EXISTS (SELECT Cst FROM UnitConfiguration WHERE 'UNIT_' || UnitConfiguration.UnitKey = Units.Type AND UnitConfiguration.Cst NOT NULL);

-- Moves
UPDATE Units SET Moves = (SELECT Mvt FROM UnitConfiguration WHERE 'UNIT_' || UnitConfiguration.UnitKey = Units.Type AND UnitConfiguration.Mvt NOT NULL)
			WHERE EXISTS (SELECT Mvt FROM UnitConfiguration WHERE 'UNIT_' || UnitConfiguration.UnitKey = Units.Type AND UnitConfiguration.Mvt NOT NULL);

-- Immobile
UPDATE Units SET Immobile = (SELECT Imb FROM UnitConfiguration WHERE 'UNIT_' || UnitConfiguration.UnitKey = Units.Type AND UnitConfiguration.Imb NOT NULL)
			WHERE EXISTS    (SELECT Imb FROM UnitConfiguration WHERE 'UNIT_' || UnitConfiguration.UnitKey = Units.Type AND UnitConfiguration.Imb NOT NULL);
				
-- Range
UPDATE Units SET Range = (SELECT Rng FROM UnitConfiguration WHERE 'UNIT_' || UnitConfiguration.UnitKey = Units.Type AND UnitConfiguration.Rng NOT NULL)
			WHERE EXISTS (SELECT Rng FROM UnitConfiguration WHERE 'UNIT_' || UnitConfiguration.UnitKey = Units.Type AND UnitConfiguration.Rng NOT NULL);
					
-- UnitFlagIconOffset
UPDATE Units SET UnitFlagIconOffset = (SELECT Flag FROM UnitConfiguration WHERE 'UNIT_' || UnitConfiguration.UnitKey = Units.Type AND UnitConfiguration.Flag NOT NULL)
			WHERE EXISTS			  (SELECT Flag FROM UnitConfiguration WHERE 'UNIT_' || UnitConfiguration.UnitKey = Units.Type AND UnitConfiguration.Flag NOT NULL);
					
-- PortraitIndex
UPDATE Units SET PortraitIndex = (SELECT Icon FROM UnitConfiguration WHERE 'UNIT_' || UnitConfiguration.UnitKey = Units.Type AND UnitConfiguration.Icon NOT NULL)
			WHERE EXISTS		 (SELECT Icon FROM UnitConfiguration WHERE 'UNIT_' || UnitConfiguration.UnitKey = Units.Type AND UnitConfiguration.Icon NOT NULL);
					
-- IconAtlas
UPDATE Units SET IconAtlas = (SELECT IcAtl FROM UnitConfiguration WHERE 'UNIT_' || UnitConfiguration.UnitKey = Units.Type AND UnitConfiguration.IcAtl NOT NULL)
			WHERE EXISTS	 (SELECT IcAtl FROM UnitConfiguration WHERE 'UNIT_' || UnitConfiguration.UnitKey = Units.Type AND UnitConfiguration.IcAtl NOT NULL);
					
-- UnitFlagAtlas
UPDATE Units SET UnitFlagAtlas = (SELECT FlagAtl FROM UnitConfiguration WHERE 'UNIT_' || UnitConfiguration.UnitKey = Units.Type AND UnitConfiguration.FlagAtl NOT NULL)
			WHERE EXISTS		 (SELECT FlagAtl FROM UnitConfiguration WHERE 'UNIT_' || UnitConfiguration.UnitKey = Units.Type AND UnitConfiguration.FlagAtl NOT NULL);

-- Can Embark on Carrier
UPDATE Units SET Special = (SELECT 'SPECIALUNIT_EMBARKED' FROM UnitConfiguration WHERE 'UNIT_' || UnitConfiguration.UnitKey = Units.Type AND UnitConfiguration.Embark = 1)
			WHERE EXISTS   (SELECT 'SPECIALUNIT_EMBARKED' FROM UnitConfiguration WHERE 'UNIT_' || UnitConfiguration.UnitKey = Units.Type AND UnitConfiguration.Embark = 1);

-- Materiel / HP
UPDATE Units SET Materiel = (SELECT Mat FROM UnitConfiguration WHERE 'UNIT_' || UnitConfiguration.UnitKey = Units.Type AND UnitConfiguration.Mat  NOT NULL)
			WHERE EXISTS	(SELECT Mat FROM UnitConfiguration WHERE 'UNIT_' || UnitConfiguration.UnitKey = Units.Type AND UnitConfiguration.Mat  NOT NULL);

-- Personnel / HP
UPDATE Units SET Personnel = (SELECT Pers FROM UnitConfiguration WHERE 'UNIT_' || UnitConfiguration.UnitKey = Units.Type AND UnitConfiguration.Pers  NOT NULL)
			WHERE EXISTS	 (SELECT Pers FROM UnitConfiguration WHERE 'UNIT_' || UnitConfiguration.UnitKey = Units.Type AND UnitConfiguration.Pers  NOT NULL);

-- Description
UPDATE Units SET Description = (SELECT Tag FROM Language_en_US WHERE 'TXT_KEY_UNIT_' || Units.KeyName = Tag)
			WHERE EXISTS	   (SELECT Tag FROM Language_en_US WHERE 'TXT_KEY_UNIT_' || Units.KeyName = Tag);
			
UPDATE Units SET Description = (SELECT Name FROM UnitConfiguration WHERE 'UNIT_' || UnitConfiguration.UnitKey = Units.Type)
			WHERE NOT EXISTS   (SELECT Tag FROM Language_en_US WHERE 'TXT_KEY_UNIT_' || Units.KeyName = Tag)
			AND EXISTS (SELECT Name FROM UnitConfiguration WHERE 'UNIT_' || UnitConfiguration.UnitKey = Units.Type AND Name NOT NULL);

-- Civilopedia
UPDATE Units SET Civilopedia = (SELECT Tag FROM Language_en_US WHERE 'TXT_KEY_UNIT_PEDIA_' || Units.KeyName  = Tag)
			WHERE EXISTS	   (SELECT Tag FROM Language_en_US WHERE 'TXT_KEY_UNIT_PEDIA_' || Units.KeyName  = Tag);

-- Strategy
UPDATE Units SET Strategy = (SELECT Tag FROM Language_en_US WHERE 'TXT_KEY_UNIT_' || Units.KeyName || '_STRATEGY'  = Tag)
			WHERE EXISTS	(SELECT Tag FROM Language_en_US WHERE 'TXT_KEY_UNIT_' || Units.KeyName || '_STRATEGY'  = Tag);

-- Help
UPDATE Units SET Help =  (SELECT Tag FROM Language_en_US WHERE 'TXT_KEY_UNIT_HELP_' || Units.KeyName  = Tag)
			WHERE EXISTS (SELECT Tag FROM Language_en_US WHERE 'TXT_KEY_UNIT_HELP_' || Units.KeyName  = Tag);

---------------------------------------------------------
-- Fill secondary tables
---------------------------------------------------------
	
INSERT INTO Unit_AITypes (UnitType, UnitAIType)
	SELECT 'UNIT_' || UnitKey, UnitAIType
	FROM Unit_AITypes JOIN UnitConfiguration ON  (UnitType= 'UNIT_' || UnitConfiguration.Template);
	
-- Flavors
INSERT INTO Unit_Flavors (UnitType, FlavorType, Flavor)
	SELECT 'UNIT_' || UnitKey, FlavorType, Flavor
	FROM Unit_Flavors JOIN UnitConfiguration ON  (UnitType= 'UNIT_' || UnitConfiguration.Template AND UnitConfiguration.Flav ISNULL);

-- Flavors (with bonus)
INSERT INTO Unit_Flavors (UnitType, FlavorType, Flavor)
	SELECT 'UNIT_' || UnitKey, FlavorType, Flavor + UnitConfiguration.Flav
	FROM Unit_Flavors JOIN UnitConfiguration ON  (UnitType= 'UNIT_' || UnitConfiguration.Template AND UnitConfiguration.Flav  NOT NULL);
	
-- first set the free promotion from class template...
INSERT INTO Unit_FreePromotions (UnitType, PromotionType)
	SELECT 'UNIT_' || UnitKey, PromotionType
	FROM Unit_FreePromotions JOIN UnitConfiguration ON (UnitType= 'UNIT_' || UnitConfiguration.Template);

-- then replace the class template FreePromotion if there is one specific to the subclass
REPLACE INTO Unit_FreePromotions (UnitType, PromotionType)
	SELECT 'UNIT_' || UnitKey, 'PROMOTION_' || UnitKey
	FROM UnitPromotions JOIN UnitConfiguration ON (UnitPromotions.Type = 'PROMOTION_' || UnitConfiguration.UnitKey);

INSERT INTO Unit_ResourceQuantityRequirements (UnitType, ResourceType, Cost)
	SELECT 'UNIT_' || UnitKey, ResourceType, Cost
	FROM Unit_ResourceQuantityRequirements JOIN UnitConfiguration ON  (UnitType= 'UNIT_' || UnitConfiguration.Template);

INSERT INTO ArtDefine_StrategicView (StrategicViewType, TileType, Asset)
	SELECT 'ART_DEF_UNIT_' || UnitKey, TileType, Asset
	FROM ArtDefine_StrategicView JOIN UnitConfiguration ON  (StrategicViewType = 'ART_DEF_UNIT_' || UnitConfiguration.Template);

-----------------------------------------------
-- Clear UnitConfiguration table for next step
-----------------------------------------------

DELETE FROM UnitConfiguration;
