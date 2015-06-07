/*

	R.E.D. WWII Edition
	New units configuration file
	by Gedemon (2013)

	/!\ Here the non-boolean numbers are variation from the template class, not the absolute value like in the define tables for classes and subclasses.

*/

-----------------------------------------------
-- Fill the initialization table
-----------------------------------------------

INSERT INTO UnitConfiguration
	(		UnitKey,					CivKey,		Var,	Name,								fxsxml,									Template,					Nb,		Form,	Scl,	Cbt,	Rgcbt,	Cst,	ProjCst,Mvt,	Imb,	Rng,	Mat,	Pers,	Flag,	Icon,	IcAtl,					FlagAtl,			Sv,							Embark  	)

--		Key Name									Variation									Model file															Figures			Scale			RangedCombat			Move			Range			Personnel		IconIndex						FlagAtlas							Embarked 
--										Nation Name			Unit Name																	Template Unit						Formation		Combat			Cost	ProjCst			Immobile		Materiel		FlagIndex		IconAtlas									SV Icon

SELECT	'AMERICAN_INFANTRY',			'AMERICA',	'',		'Infantry',							'Infantry_USA',							'INFANTRY',					NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	6,		'WW2_UNIT_ICONS',		NULL,				NULL,			NULL	UNION ALL
SELECT	'AMERICAN_MARINES',				'AMERICA',	'',		'Marines',							'Infantry_USA_2',						'INFANTRY_2',				NULL,	NULL,	NULL,	4,		NULL,	50,		NULL,	NULL,	NULL,	NULL,	1,		3,		16,		NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

SELECT	'CHINESE_INFANTRY',				'CHINA',	'',		'Infantry',							'Infantry_China',						'INFANTRY',					NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

SELECT	'ENGLISH_INFANTRY',				'ENGLAND',	'',		'Infantry',							'Infantry_UK',							'INFANTRY',					NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	2,		'WW2_INFANTRY01_ATLAS',	NULL,				NULL,			NULL	UNION ALL
SELECT	'INDIAN_INFANTRY',				NULL,		'',		'Infantry',							'indgw1',								'INFANTRY',					NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	2,		'WW2_INFANTRY01_ATLAS',	NULL,				NULL,			NULL	UNION ALL

SELECT	'FRENCH_INFANTRY',				'FRANCE',	'',		'Infantry',							'Infantry_France',						'INFANTRY',					NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,		'WW2_INFANTRY01_ATLAS',	NULL,				NULL,			NULL	UNION ALL
SELECT	'FRENCH_FOREIGNLEGION',			'FRANCE',	'',		'Foreign Legion',					'U_French_ForeignLegion',				'INFANTRY_2',				NULL,	NULL,	NULL,	2,		NULL,	65,		NULL,	NULL,	NULL,	NULL,	NULL,	10,		NULL,	38,		'UNIT_ATLAS_2',			NULL,				NULL,			NULL	UNION ALL

SELECT	'GERMAN_INFANTRY',				'GERMANY',	'',		'Infantry',							'Infantry_German',						'INFANTRY',					NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,		'WW2_INFANTRY01_ATLAS',	NULL,				NULL,			NULL	UNION ALL
SELECT	'GERMAN_SS_INFANTRY',			'GERMANY',	'',		'Waffen-SS',						'Infantry_WaffenSS',					'INFANTRY_2',				NULL,	NULL,	NULL,	4,		NULL,	25,		NULL,	NULL,	NULL,	NULL,	1,		5,		NULL,	0,		'WW2_INFANTRY01_ATLAS',	NULL,				NULL,			NULL	UNION ALL

SELECT	'GREEK_INFANTRY',				'GREECE',	'',		'Infantry',							'Infantry_Greece',						'INFANTRY',					NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

SELECT	'JAPAN_INFANTRY',				'JAPAN',	'',		'Infantry',							'Infantry_Japan',						'INFANTRY',					NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

SELECT	'ITALIAN_INFANTRY',				'ROME',		'',		'Infantry',							'Infantry_Italy',						'INFANTRY',					NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

SELECT	'RUSSIAN_INFANTRY',				'RUSSIA',	'',		'Infantry',							'Infantry_Russia',						'INFANTRY',					NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	3,		'WW2_INFANTRY01_ATLAS',	NULL,				NULL,			NULL	UNION ALL
SELECT	'RUSSIAN_NAVAL_INFANTRY',		'RUSSIA',	'',		'Naval Infantry',					'Naval_Infantry',						'INFANTRY_2',				NULL,	NULL,	NULL,	2,		NULL,	25,		NULL,	NULL,	NULL,	NULL,	1,		3,		16,		NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

SELECT	'POLAND_INFANTRY',				NULL,		'',		'Infantry',							'Infantry_Poland',						'INFANTRY',					NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'HUNGARY_INFANTRY',				NULL,		'',		'Infantry',							'Infantry_Hungary',						'INFANTRY',					NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'DUTCH_INFANTRY',				NULL,		'',		'Infantry',							'Infantry_Dutch',						'INFANTRY',					NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'SPAIN_INFANTRY',				NULL,		'',		'Infantry',							'Infantry_Spain',						'INFANTRY',					NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'SWEDEN_INFANTRY',				NULL,		'',		'Infantry',							'Infantry_Sweden_v2',					'INFANTRY',					NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

--		Key Name									Variation									Model file															Figures			Scale			RangedCombat			Move			Range			Personnel		IconIndex						FlagAtlas							Embarked 
--										Nation Name			Unit Name																	Template Unit						Formation		Combat			Cost	ProjCst			Immobile		Materiel		FlagIndex		IconAtlas									SV Icon

SELECT	'GERMAN_PARATROOPER',			'GERMANY',	'',		'Paratrooper',						'Paratrooper_German_MG_v2',				'PARATROOPER',				5,		NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'GERMAN_PARATROOPER',			'GERMANY',	'_V2',	'Paratrooper',						'Paratrooper_German_v2',				'PARATROOPER',				2,		NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'GERMAN_PARATROOPER',			'GERMANY',	'_V1',	'Paratrooper',						'Paratrooper_German_MG_v2',				'PARATROOPER',				5,		NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'GERMAN_PARATROOPER',			'GERMANY',	'_V2',	'Paratrooper',						'Paratrooper_German_v2',				'PARATROOPER',				2,		NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

SELECT	'BRITISH_PARATROOPER',			'ENGLAND',	'',		'Paratrooper',						'Paratrooper_Generic_MG',				'PARATROOPER',				5,		NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'BRITISH_PARATROOPER',			'ENGLAND',	'_V2',	'Paratrooper',						'Paratrooper_Generic',					'PARATROOPER',				2,		NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'BRITISH_PARATROOPER',			'ENGLAND',	'_V1',	'Paratrooper',						'Paratrooper_Generic_MG',				'PARATROOPER',				5,		NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'BRITISH_PARATROOPER',			'ENGLAND',	'_V2',	'Paratrooper',						'Paratrooper_Generic',					'PARATROOPER',				2,		NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

SELECT	'AMERICAN_PARATROOPER',			'AMERICA',	'',		'Paratrooper',						'Paratrooper_USA_MG',					'PARATROOPER',				NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

SELECT	'CHINESE_PARATROOPER',			'CHINA',	'',		'Paratrooper',						'Paratrooper_China_MG',					'PARATROOPER',				NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

SELECT	'FRENCH_PARATROOPER',			'FRANCE',	'',		'Paratrooper',						'Paratrooper_France_MG',				'PARATROOPER',				NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

SELECT	'GREEK_PARATROOPER',			'GREECE',	'',		'Paratrooper',						'Paratrooper_Greece_MG',				'PARATROOPER',				NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

SELECT	'JAPAN_PARATROOPER',			'JAPAN',	'',		'Paratrooper',						'Paratrooper_Japan_MG',					'PARATROOPER',				NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

SELECT	'ITALIAN_PARATROOPER',			'ROME',		'',		'Paratrooper',						'Paratrooper_Italy_MG',					'PARATROOPER',				NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

SELECT	'RUSSIAN_PARATROOPER',			'RUSSIA',	'',		'Paratrooper',						'Paratrooper_Russia_MG',				'PARATROOPER',				NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

--		Key Name									Variation									Model file															Figures			Scale			RangedCombat			Move			Range			Personnel		IconIndex						FlagAtlas							Embarked 
--										Nation Name			Unit Name																	Template Unit						Formation		Combat			Cost	ProjCst			Immobile		Materiel		FlagIndex		IconAtlas									SV Icon

SELECT	'GERMAN_SPECIAL_FORCES',		'GERMANY',	'',		'Special Forces',					'Paratrooper_German_MG',				'SPECIAL_FORCES',			4,		NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'GERMAN_SPECIAL_FORCES',		'GERMANY',	'_V2',	'Special Forces',					'Paratrooper_German',					'SPECIAL_FORCES',			1,		NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'GERMAN_SPECIAL_FORCES',		'GERMANY',	'_V1',	'Special Forces',					'Paratrooper_German_MG',				'SPECIAL_FORCES',			4,		NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'GERMAN_SPECIAL_FORCES',		'GERMANY',	'_V2',	'Special Forces',					'Paratrooper_German',					'SPECIAL_FORCES',			1,		NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

SELECT	'BRITISH_SPECIAL_FORCES',		'ENGLAND',	'',		'Special Air Service',				'Paratrooper_UK_MG',					'SPECIAL_FORCES',			4,		NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'BRITISH_SPECIAL_FORCES',		'ENGLAND',	'_V2',	'Special Forces',					'Paratrooper_UK',						'SPECIAL_FORCES',			1,		NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'BRITISH_SPECIAL_FORCES',		'ENGLAND',	'_V1',	'Special Forces',					'Paratrooper_UK_MG',					'SPECIAL_FORCES',			4,		NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'BRITISH_SPECIAL_FORCES',		'ENGLAND',	'_V2',	'Special Forces',					'Paratrooper_UK',						'SPECIAL_FORCES',			1,		NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

SELECT	'AMERICAN_SPECIAL_FORCES',		'AMERICA',	'',		'Special Forces',					'Paratrooper_USA',						'SPECIAL_FORCES',			NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

SELECT	'CHINESE_SPECIAL_FORCES',		'CHINA',	'',		'Special Forces',					'Paratrooper_China',					'SPECIAL_FORCES',			NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

SELECT	'FRENCH_SPECIAL_FORCES',		'FRANCE',	'',		'Special Forces',					'Paratrooper_France',					'SPECIAL_FORCES',			NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

SELECT	'GREEK_SPECIAL_FORCES',			'GREECE',	'',		'Special Forces',					'Paratrooper_Greece',					'SPECIAL_FORCES',			NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

SELECT	'JAPAN_SPECIAL_FORCES',			'JAPAN',	'',		'Special Forces',					'Paratrooper_Japan',					'SPECIAL_FORCES',			NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

SELECT	'ITALIAN_SPECIAL_FORCES',		'ROME',		'',		'Special Forces',					'Paratrooper_Italy',					'SPECIAL_FORCES',			NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

SELECT	'RUSSIAN_SPECIAL_FORCES',		'RUSSIA',	'',		'Special Forces',					'Paratrooper_Russia',					'SPECIAL_FORCES',			NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

--		Key Name								Variation									Model file														Figures			Scale			RangedCombat			Move			Range			Personnel		IconIndex						FlagAtlas							Embarked 
--									Nation Name			Unit Name																Template Unit					Formation		Combat			Cost	ProjCst			Immobile		Materiel		FlagIndex		IconAtlas									SV Icon

/* better looking formation but crashing...
-- Mechanized Infantry Formation defined to work with normal & extrem (Figures=(2*Figures)-1) version of the mod (normal = 3 rows 4-6-4, xtrem = 3 rows 5-8-5)
-- 1st row
SELECT	'FRENCH_MECH_INFANTRY',		'FRANCE',	'',		'Mechanized Infantry',				'Infantry_France',					'MECHANIZED_INFANTRY',		1,		NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'FRENCH_MECH_INFANTRY',		'FRANCE',	'_LTD',	'Mechanized Infantry',				'M3A1HTGreenTC',					'TANK',						1,		NULL,	0.13,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'FRENCH_MECH_INFANTRY',		'FRANCE',	'_V1',	'Mechanized Infantry',				'Infantry_France',					'MECHANIZED_INFANTRY',		2,		NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
-- 2nd row
SELECT	'FRENCH_MECH_INFANTRY',		'FRANCE',	'_V1',	'Mechanized Infantry',				'Infantry_France',					'MECHANIZED_INFANTRY',		2,		NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'FRENCH_MECH_INFANTRY',		'FRANCE',	'_V2',	'Mechanized Infantry',				'M3A1HTGreenTC',					'TANK',						1,		NULL,	0.13,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'FRENCH_MECH_INFANTRY',		'FRANCE',	'_V2',	'Mechanized Infantry',				'M3A1HTGreenTC',					'TANK',						1,		NULL,	0.13,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'FRENCH_MECH_INFANTRY',		'FRANCE',	'_V1',	'Mechanized Infantry',				'Infantry_France',					'MECHANIZED_INFANTRY',		2,		NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
-- last row
SELECT	'FRENCH_MECH_INFANTRY',		'FRANCE',	'_V1',	'Mechanized Infantry',				'Infantry_France',					'MECHANIZED_INFANTRY',		1,		NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'FRENCH_MECH_INFANTRY',		'FRANCE',	'_V1',	'Mechanized Infantry',				'Infantry_France',					'MECHANIZED_INFANTRY',		2,		NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'FRENCH_MECH_INFANTRY',		'FRANCE',	'_V1',	'Mechanized Infantry',				'Infantry_France',					'MECHANIZED_INFANTRY',		1,		NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
--*/

--		Key Name								Variation									Model file													Figures			Scale			RangedCombat			Move			Range			Personnel		IconIndex						FlagAtlas							Embarked 
--	

-- Mechanized Infantry Formation defined to work with normal & extrem (Figures=(2*Figures)-1) version of the mod (normal = 2 rows 5-6, xtrem = 2 rows 7-8)
-- 1st row
SELECT	'FRENCH_MECH_INFANTRY',			'FRANCE',	'_LTD',	'Mechanized Infantry',				'M3A1HTGreenTC',						'TANK',						1,		NULL,	0.14,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'FRENCH_MECH_INFANTRY',			'FRANCE',	'',		'Mechanized Infantry',				'Infantry_France',						'MECHANIZED_INFANTRY',		2,		NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'FRENCH_MECH_INFANTRY',			'FRANCE',	'_V1',	'Mechanized Infantry',				'Infantry_France',						'MECHANIZED_INFANTRY',		2,		NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
-- 2nd row
SELECT	'FRENCH_MECH_INFANTRY',			'FRANCE',	'_V1',	'Mechanized Infantry',				'Infantry_France',						'MECHANIZED_INFANTRY',		2,		NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'FRENCH_MECH_INFANTRY',			'FRANCE',	'_V1',	'Mechanized Infantry',				'Infantry_France',						'MECHANIZED_INFANTRY',		2,		NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'FRENCH_MECH_INFANTRY',			'FRANCE',	'_V1',	'Mechanized Infantry',				'Infantry_France',						'MECHANIZED_INFANTRY',		1,		NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'FRENCH_MECH_INFANTRY',			'FRANCE',	'_V1',	'Mechanized Infantry',				'Infantry_France',						'MECHANIZED_INFANTRY',		1,		NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

SELECT	'GERMAN_MECH_INFANTRY',			'GERMANY',	'_LTD',	'Mechanized Infantry',				'sdkfz251',								'TANK',						1,		NULL,	0.12,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'GERMAN_MECH_INFANTRY',			'GERMANY',	'',		'Mechanized Infantry',				'Infantry_German',						'MECHANIZED_INFANTRY',		2,		NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'GERMAN_MECH_INFANTRY',			'GERMANY',	'_V1',	'Mechanized Infantry',				'Infantry_German',						'MECHANIZED_INFANTRY',		2,		NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'GERMAN_MECH_INFANTRY',			'GERMANY',	'_V1',	'Mechanized Infantry',				'Infantry_German',						'MECHANIZED_INFANTRY',		2,		NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'GERMAN_MECH_INFANTRY',			'GERMANY',	'_V1',	'Mechanized Infantry',				'Infantry_German',						'MECHANIZED_INFANTRY',		2,		NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'GERMAN_MECH_INFANTRY',			'GERMANY',	'_V1',	'Mechanized Infantry',				'Infantry_German',						'MECHANIZED_INFANTRY',		1,		NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'GERMAN_MECH_INFANTRY',			'GERMANY',	'_V1',	'Mechanized Infantry',				'Infantry_German',						'MECHANIZED_INFANTRY',		1,		NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

SELECT	'AMERICAN_MECH_INFANTRY',		'AMERICA',	'_LTD',	'Mechanized Infantry',				'M3A1HTUSA',							'TANK',						1,		NULL,	0.14,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'AMERICAN_MECH_INFANTRY',		'AMERICA',	'',		'Mechanized Infantry',				'Infantry_USA',							'MECHANIZED_INFANTRY',		2,		NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'AMERICAN_MECH_INFANTRY',		'AMERICA',	'_V1',	'Mechanized Infantry',				'Infantry_USA',							'MECHANIZED_INFANTRY',		2,		NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'AMERICAN_MECH_INFANTRY',		'AMERICA',	'_V1',	'Mechanized Infantry',				'Infantry_USA',							'MECHANIZED_INFANTRY',		2,		NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'AMERICAN_MECH_INFANTRY',		'AMERICA',	'_V1',	'Mechanized Infantry',				'Infantry_USA',							'MECHANIZED_INFANTRY',		2,		NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'AMERICAN_MECH_INFANTRY',		'AMERICA',	'_V1',	'Mechanized Infantry',				'Infantry_USA',							'MECHANIZED_INFANTRY',		1,		NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'AMERICAN_MECH_INFANTRY',		'AMERICA',	'_V1',	'Mechanized Infantry',				'Infantry_USA',							'MECHANIZED_INFANTRY',		1,		NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

--		Key Name									Variation									Model file															Figures			Scale			RangedCombat			Move			Range			Personnel		IconIndex						FlagAtlas							Embarked 
--	

SELECT	'RUSSIAN_MECH_INFANTRY',		'RUSSIA',	'_LTD',	'Mechanized Infantry',				'M3A1HTSoviet',							'TANK',						1,		NULL,	0.14,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'RUSSIAN_MECH_INFANTRY',		'RUSSIA',	'',		'Mechanized Infantry',				'Infantry_Russia',						'MECHANIZED_INFANTRY',		2,		NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'RUSSIAN_MECH_INFANTRY',		'RUSSIA',	'_V1',	'Mechanized Infantry',				'Infantry_Russia',						'MECHANIZED_INFANTRY',		2,		NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'RUSSIAN_MECH_INFANTRY',		'RUSSIA',	'_V1',	'Mechanized Infantry',				'Infantry_Russia',						'MECHANIZED_INFANTRY',		2,		NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'RUSSIAN_MECH_INFANTRY',		'RUSSIA',	'_V1',	'Mechanized Infantry',				'Infantry_Russia',						'MECHANIZED_INFANTRY',		2,		NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'RUSSIAN_MECH_INFANTRY',		'RUSSIA',	'_V1',	'Mechanized Infantry',				'Infantry_Russia',						'MECHANIZED_INFANTRY',		1,		NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'RUSSIAN_MECH_INFANTRY',		'RUSSIA',	'_V1',	'Mechanized Infantry',				'Infantry_Russia',						'MECHANIZED_INFANTRY',		1,		NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

SELECT	'BRITISH_MECH_INFANTRY',		'ENGLAND',	'_LTD',	'Mechanized Infantry',				'M3A1HTBritish',						'TANK',						1,		NULL,	0.14,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'BRITISH_MECH_INFANTRY',		'ENGLAND',	'',		'Mechanized Infantry',				'Infantry_UK',							'MECHANIZED_INFANTRY',		2,		NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'BRITISH_MECH_INFANTRY',		'ENGLAND',	'_V1',	'Mechanized Infantry',				'Infantry_UK',							'MECHANIZED_INFANTRY',		2,		NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'BRITISH_MECH_INFANTRY',		'ENGLAND',	'_V1',	'Mechanized Infantry',				'Infantry_UK',							'MECHANIZED_INFANTRY',		2,		NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'BRITISH_MECH_INFANTRY',		'ENGLAND',	'_V1',	'Mechanized Infantry',				'Infantry_UK',							'MECHANIZED_INFANTRY',		2,		NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'BRITISH_MECH_INFANTRY',		'ENGLAND',	'_V1',	'Mechanized Infantry',				'Infantry_UK',							'MECHANIZED_INFANTRY',		1,		NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'BRITISH_MECH_INFANTRY',		'ENGLAND',	'_V1',	'Mechanized Infantry',				'Infantry_UK',							'MECHANIZED_INFANTRY',		1,		NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL


--		Key Name									Variation									Model file															Figures			Scale			RangedCombat			Move			Range			Personnel		IconIndex						FlagAtlas							Embarked 
--										Nation Name			Unit Name																	Template Unit						Formation		Combat			Cost	ProjCst			Immobile		Materiel		FlagIndex		IconAtlas									SV Icon

SELECT	'TANK_M3_STUART',				'AMERICA',	'',		'M3 Stuart',						'M3_Stuart',							'LIGHT_TANK_2',				NULL,	NULL,	0.10,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_M5_STUART',				'AMERICA',	'',		'M5 Stuart',						'M5_Stuart',							'LIGHT_TANK_2_B',			NULL,	NULL,	0.10,	NULL,	NULL,	NULL,	0.25,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_M24_CHAFFEE',				'AMERICA',	'',		'M24 Chaffee',						'M24_Chaffee',							'LIGHT_TANK_3',				NULL,	NULL,	0.10,	NULL,	NULL,	NULL,	0.25,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_SHERMAN',					'AMERICA',	'',		'M4A1 Sherman II',					'M4A1_Sherman_II',						'TANK',						NULL,	NULL,	0.11,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_SHERMAN_IIA',				'AMERICA',	'',		'M4A1(76)W Sherman IIA',			'M4A1(76)W_Sherman_IIA',				'TANK_B',					NULL,	NULL,	0.11,	NULL,	NULL,	NULL,	0.25,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_SHERMAN_III',				'AMERICA',	'',		'M4A2 Sherman III',					'M4A2_Sherman_III',						'TANK_C',					NULL,	NULL,	0.11,	NULL,	NULL,	NULL,	0.25,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_SHERMAN_IIIA',			'AMERICA',	'',		'M4A2(76)W Sherman IIIA',			'M4A2(76)W_Sherman_IIIA',				'TANK_D',					NULL,	NULL,	0.11,	NULL,	NULL,	NULL,	0.25,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_SHERMAN_IV',				'AMERICA',	'',		'M4A3 Sherman IV',					'M4A3_Sherman_IV',						'TANK_E',					NULL,	NULL,	0.11,	NULL,	NULL,	NULL,	0.25,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_SHERMAN_JUMBO',			'AMERICA',	'',		'M4A3E2 Sherman Jumbo',				'M4A3E2_Sherman_Jumbo',					'TANK_F',					NULL,	NULL,	0.11,	NULL,	NULL,	NULL,	0.25,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_SHERMAN_EASYEIGHT',		'AMERICA',	'',		'M4A3E8 Sherman Easy Eight',		'M4A3E8_Sherman_Easy_Eight',			'TANK_G',					NULL,	NULL,	0.11,	NULL,	NULL,	NULL,	0.25,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_M26_PERSHING',			'AMERICA',	'',		'M26 Pershing',						'M26_Pershing',							'HEAVY_TANK_2_B',			NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_T28_95',					'AMERICA',	'',		'T28/T95 GMC',						'T95',									'SUPER_HEAVY_TANK',			NULL,	NULL,	0.13,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

SELECT	'TANK_T26B',					'CHINA',	'',		'T-26B',							'T-26B',								'OLD_LIGHT_TANK',			NULL,	NULL,	0.11,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	7,		'WW2_UNIT_ICONS',		NULL,				NULL,			NULL	UNION ALL

SELECT	'TANK_VICKERS_MKVIB',			'ENGLAND',	'',		'Vickers MK VIB',					'Vickers_MK_VIB',						'OLD_LIGHT_TANK',			NULL,	NULL,	0.11,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_TETRARCH',				'ENGLAND',	'',		'A17 Tetrarch',						'A17_Tetrarch',							'LIGHT_TANK',				NULL,	NULL,	0.105,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_MATILDA_I',				'ENGLAND',	'',		'A11 Matilda I',					'A11_Matilda_I',						'LIGHT_INFANTRY_TANK_2',	NULL,	NULL,	0.105,	2,		NULL,	NULL,	NULL,	-1,		NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_MATILDA_II',				'ENGLAND',	'',		'A12 Matilda II',					'A12_Matilda_II',						'INFANTRY_TANK',			NULL,	NULL,	0.12,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_VALENTINE',				'ENGLAND',	'',		'Valentine',						'A10_Valentine',						'INFANTRY_TANK_2',			NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_CRUISER_MKI',				'ENGLAND',	'',		'A9 Cruiser MK I',					'A9_Cruiser_MK_I',						'CRUISER_TANK',				NULL,	NULL,	0.11,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_CRUISER_MKII',			'ENGLAND',	'',		'A10 Cruiser MK II',				'A10_Cruiser_MK_II',					'CRUISER_TANK_B',			NULL,	NULL,	0.11,	NULL,	NULL,	NULL,	0.25,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_CRUISER_MKIII',			'ENGLAND',	'',		'A13 Cruiser MK III',				'A13_Cruiser_MK_III',					'CRUISER_TANK_2',			NULL,	NULL,	0.11,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_CRUISER_MKIV',			'ENGLAND',	'',		'A13 MK II Cruiser MK IV',			'A13_MK_II_Cruiser_MK_IV',				'CRUISER_TANK_2_B',			NULL,	NULL,	0.11,	NULL,	NULL,	NULL,	0.25,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_A13_MKIII',				'ENGLAND',	'',		'A13 MK III Covenanter',			'A13_MK_III_Covenanter',				'CRUISER_TANK_3',			NULL,	NULL,	0.11,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_A15_CRUSADER',			'ENGLAND',	'',		'A15 Crusader',						'A15_Crusader',							'CRUISER_TANK_4',			NULL,	NULL,	0.11,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_A15_CRUSADER_MKIII',		'ENGLAND',	'',		'A15 Crusader MK III',				'A15_Crusader_MK_III',					'CRUISER_TANK_4_B',			NULL,	NULL,	0.11,	NULL,	NULL,	NULL,	0.25,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_A24_CAVALIER',			'ENGLAND',	'',		'A24 Cavalier',						'A24_Cavalier',							'CRUISER_TANK_5',			NULL,	NULL,	0.11,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_A27_CENTAUR',				'ENGLAND',	'',		'A27L Centaur',						'A27L_Centaur',							'CRUISER_TANK_5_B',			NULL,	NULL,	0.11,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_CROMWELL',				'ENGLAND',	'',		'A27M Cromwell',					'A27M_Cromwell',						'CRUISER_TANK_5_C',			NULL,	NULL,	0.11,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_A30_CHALLENGER',			'ENGLAND',	'',		'A30 Challenger',					'A30_Challenger',						'CRUISER_TANK_6',			NULL,	NULL,	0.11,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_A34_COMET',				'ENGLAND',	'',		'A34 Comet',						'A34_Comet',							'CRUISER_TANK_7',			NULL,	NULL,	0.11,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_M3_GRANT',				'ENGLAND',	'',		'M3 Grant',							'M3_Grant',								'OLD_TANK',					NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_M4_FIREFLY',				'ENGLAND',	'',		'M4 Firefly',						'M4_Firefly',							'TANK_2_C',					NULL,	NULL,	0.11,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_CHURCHILL',				'ENGLAND',	'',		'A22 Churchill',					'A22_Churchill',						'HEAVY_TANK_B',				NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_A41_CENTURION',			'ENGLAND',	'',		'A41 Centurion',					'A41_Centurion',						'MAIN_BATTLE_TANK',			NULL,	NULL,	0.11,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_A39_TORTOISE',			'ENGLAND',	'',		'A39 Tortoise',						'A39_Tortoise',							'SUPER_HEAVY_TANK',			NULL,	NULL,	0.14,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

--		Key Name									Variation									Model file															Figures			Scale			RangedCombat			Move			Range			Personnel		IconIndex						FlagAtlas							Embarked 
--										Nation Name			Unit Name																	Template Unit						Formation		Combat			Cost	ProjCst			Immobile		Materiel		FlagIndex		IconAtlas									SV Icon

SELECT	'TANK_AMR35',					'FRANCE',	'',		'AMR-35',							'AMR-35',								'OLD_LIGHT_TANK',			NULL,	NULL,	0.10,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_FCM36',					'FRANCE',	'',		'FCM 36',							'FCM_36',								'LIGHT_INFANTRY_TANK_2',	NULL,	NULL,	0.105,	-4,		NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_R35',						'FRANCE',	'',		'Renault R-35',						'Renault_R-35',							'LIGHT_INFANTRY_TANK',		NULL,	NULL,	0.105,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_R35_BONUS',				NULL,		'',		'Renault R-35',						'Renault_R-35_bonus',					'LIGHT_INFANTRY_TANK',		NULL,	NULL,	0.105,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_R40',						'FRANCE',	'',		'Renault R-40',						'Renault_R-40',							'LIGHT_INFANTRY_TANK_B',	NULL,	NULL,	0.105,	NULL,	NULL,	NULL,	0.25,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_H35',						'FRANCE',	'',		'Hotchkiss H-35',					'Hotchkiss_H-35',						'LIGHT_TANK',				NULL,	NULL,	0.105,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_H39',						'FRANCE',	'',		'Hotchkiss H-39',					'Hotchkiss_H-39',						'LIGHT_TANK_2',				NULL,	NULL,	0.105,	NULL,	NULL,	NULL,	0.25,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_AMC35',					'FRANCE',	'',		'AMC-35',							'AMC-35',								'OLD_TANK',					NULL,	NULL,	0.11,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_CHAR_D1',					'FRANCE',	'',		'Char D1',							'Char_D1',								'TANK',						NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_CHAR_D2',					'FRANCE',	'',		'Char D2',							'Char_D2',								'TANK_B',					NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0.25,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_S35',						'FRANCE',	'',		'Somua S-35',						'Somua_S-35',							'TANK_C',					NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_B1',						'FRANCE',	'',		'Char B1',							'Char_B1',								'HEAVY_TANK',				NULL,	NULL,	0.14,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_ARL44',					'FRANCE',	'',		'ARL-44',							'ARL-44',								'HEAVY_TANK_2',				NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_CHAR_2C',					'FRANCE',	'',		'Char 2C',							'Char_2C',								'SUPER_HEAVY_TANK',			NULL,	NULL,	0.19,	-45,	NULL,	100,	NULL,	-1,		NULL,	NULL,	-5,		5,		NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

SELECT	'TANK_PANZER_I',				'GERMANY',	'',		'Panzer I',							'Panzer_I',								'OLD_LIGHT_TANK',			NULL,	NULL,	0.10,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	12,		'WW2_UNIT_ICONS',		NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_PANZER_35',				NULL,		'',		'Panzer 35(t)',						'Panzer_35(t)',							'LIGHT_TANK',				NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_PANZER_38',				NULL,		'',		'Panzer 38(t)',						'Panzer_38(t)',							'LIGHT_TANK_3',				NULL,	NULL,	0.11,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_PANZER_II',				'GERMANY',	'',		'Panzer II',						'Panzer_II',							'LIGHT_TANK_2',				NULL,	NULL,	0.10,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_PANZER_II_L',				'GERMANY',	'',		'Panzer II Ausf L Luchs',			'Panzer_II_Ausf_L_Luchs',				'LIGHT_TANK_2_B',			NULL,	NULL,	0.10,	NULL,	NULL,	NULL,	0.25,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_PANZER_III',				'GERMANY',	'',		'Panzer III',						'Panzer_III',							'TANK',						NULL,	NULL,	0.12,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_PANZER_III_J',			'GERMANY',	'',		'Panzer III Ausf J',				'Panzer_III_Ausf_J',					'TANK_D',					NULL,	NULL,	0.12,	NULL,	NULL,	NULL,	0.25,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_PANZER_IV',				'GERMANY',	'',		'Panzer IV',						'Panzer_IV',							'TANK_2',					NULL,	NULL,	0.12,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_PANZER_IV_G',				'GERMANY',	'',		'Panzer IV Ausf G',					'Panzer_IV_Ausf_G',						'TANK_2_B',					NULL,	NULL,	0.12,	NULL,	NULL,	NULL,	0.25,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_PANZER_IV_H',				'GERMANY',	'',		'Panzer IV Ausf H',					'Panzer_IV_Ausf_H',						'TANK_2_C',					NULL,	NULL,	0.12,	NULL,	NULL,	NULL,	0.25,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_PANZER_V_PANTHER',		'GERMANY',	'',		'Panzer V Panther',					'Panzer_V_Panther',						'TANK_3',					NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_PANZER_VI_TIGER',			'GERMANY',	'',		'Panzer VI Tiger',					'Panzer_VI_Tiger',						'HEAVY_TANK_2_B',			NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_PANZER_VIB_TIGER_II',		'GERMANY',	'',		'Panzer VIB Konigstiger',			'Panzer_VIB_KingTiger',					'HEAVY_TANK_3',				NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_PANZER_VIII_MAUS',		'GERMANY',	'',		'Panzer VIII Maus',					'Panzer_VIII_Maus',						'SUPER_HEAVY_TANK',			NULL,	NULL,	0.165,	NULL,	NULL,	NULL,	2.5,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

SELECT	'TANK_VICKERS_MKE_GREECE',		'GREECE',	'',		'Vickers MK E',						'Vickers_MK_E_Greece',					'OLD_LIGHT_TANK',			NULL,	NULL,	0.11,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_VICKERS_MKII_GREECE',		'GREECE',	'',		'Vickers MK II',					'Vickers_MK_II',						'OLD_TANK',					NULL,	NULL,	0.11,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

--		Key Name									Variation									Model file															Figures			Scale			RangedCombat			Move			Range			Personnel		IconIndex						FlagAtlas							Embarked 
--										Nation Name			Unit Name																	Template Unit						Formation		Combat			Cost	ProjCst			Immobile		Materiel		FlagIndex		IconAtlas									SV Icon

SELECT	'TANK_T26',						'RUSSIA',	'',		'T-26',								'T-26',									'OLD_LIGHT_TANK',			NULL,	NULL,	0.105,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	7,		'WW2_UNIT_ICONS',		NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_T70',						'RUSSIA',	'',		'T-70',								'T-70',									'LIGHT_TANK_3',				NULL,	NULL,	0.105,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	7,		'WW2_UNIT_ICONS',		NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_BT2',						'RUSSIA',	'',		'BT-2',								'BT-2',									'CRUISER_TANK',				NULL,	NULL,	0.105,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_BT7',						'RUSSIA',	'',		'BT-7',								'BT-7',									'CRUISER_TANK_2',			NULL,	NULL,	0.105,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_T28',						'RUSSIA',	'',		'T-28',								'T-28',									'OLD_TANK',					NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_T34',						'RUSSIA',	'',		'T-34',								'T-34',									'TANK_2_B',					NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_T34_76',					'RUSSIA',	'',		'T-34-76',							'T-34-76',								'TANK_2_C',					NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0.25,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_T34_85',					'RUSSIA',	'',		'T-34-85',							'T-34-85',								'TANK_2_D',					NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0.25,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_KV1',						'RUSSIA',	'',		'KV-1',								'KV-1',									'HEAVY_TANK',				NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_IS_1',					'RUSSIA',	'',		'IS-1',								'IS-1',									'HEAVY_TANK_2',				NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_IS_2',					'RUSSIA',	'',		'IS-2',								'IS-2',									'HEAVY_TANK_2_B',			NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0.25,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_IS_3',					'RUSSIA',	'',		'IS-3',								'IS-3',									'HEAVY_TANK_2_C',			NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0.25,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_IS_7',					'RUSSIA',	'',		'IS-7',								'IS-7',									'SUPER_HEAVY_TANK',			2,		NULL,	0.125,	-15,	NULL,	-75,	1.5,	2,		NULL,	NULL,	-10,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

SELECT	'TANK_L6_40',					'ROME',		'',		'L6-40',							'L6-40',								'LIGHT_TANK',				NULL,	NULL,	0.095,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_M11_39',					'ROME',		'',		'M11-39',							'M11-39',								'OLD_TANK',					NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_M13_40',					'ROME',		'',		'M13-40',							'M13-40',								'TANK',						NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_M14_41',					'ROME',		'',		'M14-41',							'M14-41',								'TANK_C',					NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0.25,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_M15_42',					'ROME',		'',		'M15-42',							'M15-42',								'TANK_E',					NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0.25,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_P26_40',					'ROME',		'',		'P26-40',							'P26-40',								'HEAVY_TANK_B',				NULL,	NULL,	0.125,	-2,		NULL,	-25,	NULL,	NULL,	NULL,	NULL,	-5,		NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

SELECT	'TANK_TYPE95',					'JAPAN',	'',		'Type95 Ha-Go',						'Type95_Ha-Go',							'LIGHT_TANK',				NULL,	NULL,	0.10,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_TYPE4_KE_NU',				'JAPAN',	'',		'Type4 Ke-Nu',						'Type4_Ke-Nu',							'LIGHT_TANK_2',				NULL,	NULL,	0.10,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_TYPE97',					'JAPAN',	'',		'Type97 Chi-Ha',					'Type97_Chi-Ha',						'TANK',						NULL,	NULL,	0.11,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_TYPE97_SHINHOTO',			'JAPAN',	'',		'Type97 Shinhoto Chi-Ha',			'Type97_Shinhoto_Chi-Ha',				'TANK_B',					NULL,	NULL,	0.11,	NULL,	NULL,	NULL,	0.25,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_TYPE1_CHI_HE',			'JAPAN',	'',		'Type1 Chi-He',						'Type1_Chi-He',							'TANK_2',					NULL,	NULL,	0.11,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_TYPE3_CHI_NU',			'JAPAN',	'',		'Type3 Chi-Nu',						'Type3_Chi-Nu',							'TANK_2_B',					NULL,	NULL,	0.11,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_TYPE4_CHI_TO',			'JAPAN',	'',		'Type4 Chi-To',						'Type4_Chi-To',							'HEAVY_TANK',				NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_TYPE5_CHI_RI',			'JAPAN',	'',		'Type5 Chi-Ri',						'Type5_Chi-Ri',							'HEAVY_TANK_B',				NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_TYPE100',					'JAPAN',	'',		'Type100 O-I',						'Type100_O-I',							'SUPER_HEAVY_TANK',			NULL,	NULL,	0.15,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

SELECT	'TANK_CIV4',					NULL,		'',		'Tank',								'MediumTank_Generic',					'TANK',						NULL,	NULL,	0.11,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_VICKERS_MKE_A',			NULL,		'',		'Vickers MK E TypeA',				'Vickers_MK_E_TypeA',					'OLD_LIGHT_TANK',			NULL,	NULL,	0.11,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_7TP',						'POLAND',	'',		'7TP',								'7TP',									'LIGHT_TANK',				NULL,	NULL,	0.11,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_10TP',					'POLAND', 	'',		'10TP',								'10TP',									'TANK',						NULL,	NULL,	0.11,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_38M_TOLDI_I',				NULL,		'',		'38M Toldi I',						'38M_Toldi_I',							'LIGHT_TANK',				NULL,	NULL,	0.11,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_40M_TURAN_I',				NULL,		'',		'40M Turan I',						'40M_Turan_I',							'TANK',						NULL,	NULL,	0.11,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_VICKERS_M1936',			'NETHERLANDS','',	'Vickers M1936',					'Vickers_M1936',						'OLD_LIGHT_TANK',			NULL,	NULL,	0.10,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_MTSL',					'NETHERLANDS','',	'MTSL-1GI4',						'MTSL-1GI4',							'OLD_TANK',					NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

--		Key Name									Variation									Model file															Figures			Scale			RangedCombat			Move			Range			Personnel		IconIndex						FlagAtlas							Embarked 
--										Nation Name			Unit Name																	Template Unit						Formation		Combat			Cost	ProjCst			Immobile		Materiel		FlagIndex		IconAtlas									SV Icon

SELECT	'ASSAULT_GUN_SU122',			'RUSSIA',	'',		'SU-122',							'SU-122',								'ASSAULT_GUN',				NULL,	NULL,	0.095,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'ASSAULT_GUN_SU152',			'RUSSIA',	'',		'SU-152',							'SU-152',								'ASSAULT_GUN_2',			NULL,	NULL,	0.095,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'ASSAULT_GUN_KV2',				'RUSSIA',	'',		'KV-2',								'KV-2',									'OLD_HEAVY_ASSAULT_GUN',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'ASSAULT_GUN_ISU122',			'RUSSIA',	'',		'ISU-122',							'ISU-122',								'HEAVY_ASSAULT_GUN',		NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'ASSAULT_GUN_ISU152',			'RUSSIA',	'',		'ISU-152',							'ISU-152',								'HEAVY_ASSAULT_GUN_2',		NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

SELECT	'ASSAULT_GUN_SAU40',			'FRANCE',	'',		'Somua SAU-40',						'Somua_SAU-40',							'ASSAULT_GUN_C',			NULL,	NULL,	0.11,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

SELECT	'ASSAULT_GUN_STUG_III',			'GERMANY',	'',		'Sturmgeschutz III',				'Sdkfz142_Sturmgeschutz_III',			'ASSAULT_GUN',				NULL,	NULL,	0.11,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'ASSAULT_GUN_STUG_III_F',		'GERMANY',	'',		'Sturmgeschutz III Ausf F',			'Sdkfz142-1_Sturmgeschutz_III_Ausf_F',	'ASSAULT_GUN_B',			NULL,	NULL,	0.11,	NULL,	NULL,	NULL,	0.25,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'ASSAULT_GUN_STUG_III_G',		'GERMANY',	'',		'Sturmgeschutz III Ausf G',			'Sdkfz142-1_Sturmgeschutz_III_Ausf_G',	'ASSAULT_GUN_C',			NULL,	NULL,	0.11,	NULL,	NULL,	NULL,	0.25,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'ASSAULT_GUN_STUG_IV',			'GERMANY',	'',		'Sturmgeschutz IV',					'Sdkfz167_Sturmgeschutz_IV',			'ASSAULT_GUN_2',			NULL,	NULL,	0.11,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'ASSAULT_GUN_BRUMMBAR',			'GERMANY',	'',		'Sturmpanzer IV Brummbar',			'Sdkfz166_Brummbar',					'ASSAULT_GUN_3',			NULL,	NULL,	0.11,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'ASSAULT_GUN_STURMTIGER',		'GERMANY',	'',		'Sturmpanzer VI Sturmtiger',		'Sdkfz181_Sturmtiger',					'HEAVY_ASSAULT_GUN_2',		NULL,	NULL,	0.13,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

SELECT	'ASSAULT_GUN_M41',				'ROME',		'',		'Semovente M41-75/18',				'Semovente_M41-75-18',					'ASSAULT_GUN',				NULL,	NULL,	0.11,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

SELECT	'ASSAULT_GUN_TYPE2',			'JAPAN',	'',		'Type 2 Ho-I',						'Type2_Ho-I',							'ASSAULT_GUN',				NULL,	NULL,	0.11,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

SELECT	'ASSAULT_GUN_BT42',				'FINLAND',	'',		'BT-42',							'BT-42',								'ASSAULT_GUN',				NULL,	NULL,	0.10,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

--		Key Name									Variation									Model file															Figures			Scale			RangedCombat			Move			Range			Personnel		IconIndex						FlagAtlas							Embarked 
--										Nation Name			Unit Name																	Template Unit						Formation		Combat			Cost	ProjCst			Immobile		Materiel		FlagIndex		IconAtlas									SV Icon

SELECT	'TANK_DESTROYER_W15_TCC',		'FRANCE',	'',		'Laffly W15 TCC',					'Laffly_W15_TCC',						'LIGHT_TANK_DESTROYER',		NULL,	NULL,	0.095,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_DESTROYER_AMR35_ZT3',		'FRANCE',	'',		'AMR-35 ZT3',						'AMR-35_ZT3',							'LIGHT_TANK_DESTROYER_2',	NULL,	NULL,	0.10,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_DESTROYER_37L',			'FRANCE',	'',		'Lorraine 37L w/ SA 37',			'Lorraine_37L',							'LIGHT_TANK_DESTROYER_3',	NULL,	NULL,	0.105,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

SELECT	'TANK_DESTROYER_PZJ_I',			'GERMANY',	'',		'Panzerjager I',					'SdKfz101_Panzerjager_I',				'LIGHT_TANK_DESTROYER',		NULL,	NULL,	0.090,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_DESTROYER_MARDER_I',		'GERMANY',	'',		'Marder I',							'Sdkfz135_Marder_I',					'LIGHT_TANK_DESTROYER',		NULL,	NULL,	0.11,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_DESTROYER_MARDER_II',		'GERMANY',	'',		'Marder II',						'Sdkfz131_Marder_II',					'LIGHT_TANK_DESTROYER_2',	NULL,	NULL,	0.11,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_DESTROYER_MARDER_II_D',	'GERMANY',	'',		'Marder II Ausf D',					'Sdkfz132_Marder_II_Ausf_D',			'LIGHT_TANK_DESTROYER_2_B',	NULL,	NULL,	0.11,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_DESTROYER_MARDER_III',	'GERMANY',	'',		'Marder III',						'Sdkfz139_Marder_III',					'LIGHT_TANK_DESTROYER_4',	NULL,	NULL,	0.11,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_DESTROYER_MARDER_III_H',	'GERMANY',	'',		'Marder III Ausf H',				'Sdkfz138_Marder_III_Ausf_H',			'LIGHT_TANK_DESTROYER_4_B',	NULL,	NULL,	0.11,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_DESTROYER_MARDER_III_M',	'GERMANY',	'',		'Marder III Ausf M',				'Sdkfz138_Marder_III_Ausf_M',			'LIGHT_TANK_DESTROYER_4_C',	NULL,	NULL,	0.11,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_DESTROYER_HETZER',		'GERMANY',	'',		'Panzerjager 38(t) Hetzer',			'Sdkfz138-2_Hetzer',					'LIGHT_TANK_DESTROYER_5',	NULL,	NULL,	0.10,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_DESTROYER_NASHORN',		'GERMANY',	'',		'Panzerjager Nashorn',				'Sdkfz164_Nashorn',						'TANK_DESTROYER',			NULL,	NULL,	0.11,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_DESTROYER_PZJ_IV',		'GERMANY',	'',		'Panzerjager IV',					'Sdkfz162_Jagdpanzer_IV',				'TANK_DESTROYER_2',			NULL,	NULL,	0.11,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_DESTROYER_PZJ_IV_L70',	'GERMANY',	'',		'Panzerjager IV L-70',				'Sdkfz162_Jagdpanzer IV_L-70',			'TANK_DESTROYER_2_B',		NULL,	NULL,	0.11,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_DESTROYER_JAGDPANTHER',	'GERMANY',	'',		'Panzerjager V Jagdpanther',		'SdKfz173_Jagdpanther',					'TANK_DESTROYER_3',			NULL,	NULL,	0.11,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_DESTROYER_FERDINAND',		'GERMANY',	'',		'Panzerjager Tiger (P) Ferdinand',	'Sdkfz184_Ferdenand',					'HEAVY_TANK_DESTROYER',		NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_DESTROYER_JAGDTIGER',		'GERMANY',	'',		'Panzerjager VI Jagdtiger',			'SdKfz186_Jagdtiger',					'HEAVY_TANK_DESTROYER_2',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

--		Key Name									Variation									Model file															Figures			Scale			RangedCombat			Move			Range			Personnel		IconIndex						FlagAtlas							Embarked 
--										Nation Name			Unit Name																	Template Unit						Formation		Combat			Cost	ProjCst			Immobile		Materiel		FlagIndex		IconAtlas									SV Icon

SELECT	'TANK_DESTROYER_ARCHER',		'ENGLAND',	'',		'Valentine MkI Archer',				'Archer',								'TANK_DESTROYER',			NULL,	NULL,	0.11,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_DESTROYER_ACHILLES',		NULL,		'',		'M10 Achilles',						'M10_Achilles',							'TANK_DESTROYER_B',			NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

SELECT	'TANK_DESTROYER_ZIS30',			'RUSSIA',	'',		'ZiS-30',							'ZiS-30',								'LIGHT_TANK_DESTROYER_2',	NULL,	NULL,	0.11,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_DESTROYER_SU76',			'RUSSIA',	'',		'SU-76',							'SU-76',								'TANK_DESTROYER',			NULL,	NULL,	0.10,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_DESTROYER_SU85',			'RUSSIA',	'',		'SU-85',							'SU-85',								'TANK_DESTROYER_2',			NULL,	NULL,	0.10,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_DESTROYER_SU100',			'RUSSIA',	'',		'SU-100',							'SU-100',								'TANK_DESTROYER_2_B',		NULL,	NULL,	0.10,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

SELECT	'TANK_DESTROYER_L40',			'ROME',		'',		'Semovente L40-47/32',				'Semovente_L40-47-32',					'LIGHT_TANK_DESTROYER_2',	NULL,	NULL,	0.10,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_DESTROYER_M41',			'ROME',		'',		'Semovente M41-90/53',				'Semovente_M41M-90-53',					'TANK_DESTROYER_B',			NULL,	NULL,	0.11,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_DESTROYER_M42M',			'ROME',		'',		'Semovente M42M-75/34',				'Semovente_M42M-75-34',					'TANK_DESTROYER_2',			NULL,	NULL,	0.11,	-4,		NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_DESTROYER_M42T',			'ROME',		'',		'Semovente M42T-75/46',				'Semovente_M42T-75-46',					'TANK_DESTROYER_2_B',		NULL,	NULL,	0.11,	-6,		NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_DESTROYER_M43',			'ROME',		'',		'Semovente M43-105/25',				'Semovente_M43-105-25',					'TANK_DESTROYER_3',			NULL,	NULL,	0.11,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

SELECT	'TANK_DESTROYER_M10',			'AMERICA',	'',		'M10 Wolverine',					'M10_Wolverine',						'TANK_DESTROYER_B',			NULL,	NULL,	0.11,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_DESTROYER_M18',			'AMERICA',	'',		'M18 Hellcat',						'M18_Hellcat',							'TANK_DESTROYER_2',			NULL,	NULL,	0.11,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_DESTROYER_M36',			'AMERICA',	'',		'M36 Jackson',						'M36_Jackson',							'TANK_DESTROYER_2_B',		NULL,	NULL,	0.11,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

SELECT	'TANK_DESTROYER_HO_NI_I',		'JAPAN',	'',		'Type 1 Ho-Ni I',					'Type1_Ho-Ni_I',						'LIGHT_TANK_DESTROYER_2',	NULL,	NULL,	0.10,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_DESTROYER_HO_NI_II',		'JAPAN',	'',		'Type 1 Ho-Ni II',					'Type1_Ho-Ni_II',						'LIGHT_TANK_DESTROYER_2_B',	NULL,	NULL,	0.10,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_DESTROYER_HO_NI_III',		'JAPAN',	'',		'Type 3 Ho-Ni III',					'Type3_Ho-Ni_III',						'LIGHT_TANK_DESTROYER_3',	NULL,	NULL,	0.10,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_DESTROYER_NA_TO',			'JAPAN',	'',		'Type 5 Na-To',						'Type5_Na-To',							'LIGHT_TANK_DESTROYER_4',	NULL,	NULL,	0.10,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

SELECT	'TANK_DESTROYER_SKODA',			'YUGOSLAVIA','',	'Skoda T-32',						'Skoda_T-32',							'LIGHT_TANK_DESTROYER',		NULL,	NULL,	0.10,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_DESTROYER_TACAM',			'ROMANIA',	'',		'TACAM R-2',						'TACAM_R-2',							'TANK_DESTROYER',			NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

--		Key Name									Variation									Model file															Figures			Scale			RangedCombat			Move			Range			Personnel		IconIndex						FlagAtlas							Embarked 
--										Nation Name			Unit Name																	Template Unit						Formation		Combat			Cost	ProjCst			Immobile		Materiel		FlagIndex		IconAtlas									SV Icon

SELECT	'ARTILLERY_ML20',				'RUSSIA',	'',		'ML-20 152mm Howitzer',				'ML-20',								'ARTILLERY',				NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

SELECT	'MOBILE_AA_GUN_HOTCHKISS',		'FRANCE',	'',		'Hotchkiss 25mm AA Half-Track',		'Hotchkiss_25mm_AA_Half-Track',			'MOBILE_AA_GUN_B',			NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

SELECT	'MOBILE_AA_GUN_FLK_PZI',		'GERMANY',	'',		'Flakpanzer I',						'Flakpanzer_I',							'MOBILE_AA_GUN',			NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'MOBILE_AA_GUN_FLK_PZ38',		'GERMANY',	'',		'Flakpanzer 38(t)',					'Flakpanzer_38(t)',						'MOBILE_AA_GUN_B',			NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'MOBILE_AA_GUN_MOBELWAGEN',		'GERMANY',	'',		'Flakpanzer IV Mobelwagen',			'Flakpanzer_IV_Mobelwagen',				'MOBILE_AA_GUN_2',			NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'MOBILE_AA_GUN_WIRBELWIND',		'GERMANY',	'',		'Flakpanzer IV Wirbelwind',			'Flakpanzer_IV_Wirbelwind',				'MOBILE_AA_GUN_2_B',		NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'MOBILE_AA_GUN_OSTWIND',		'GERMANY',	'',		'Flakpanzer IV Ostwind',			'Flakpanzer_IV_Ostwind',				'MOBILE_AA_GUN_2_C',		NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'MOBILE_AA_GUN_KUGELBLITZ',		'GERMANY',	'',		'Flakpanzer IV Kugelblitz',			'Flakpanzer_IV_Kugelblitz',				'MOBILE_AA_GUN_2_D',		NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'MOBILE_AA_GUN_COELIAN',		'GERMANY',	'',		'Flakpanzer V Coelian',				'Flakpanzer_V_Coelian',					'MOBILE_AA_GUN_3',			NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

SELECT	'MOBILE_AA_GUN_VICKERS_UK',		'ENGLAND',	'',		'Vickers MK VI AA',					'Vickers_MK_VI_AA',						'MOBILE_AA_GUN',			NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'MOBILE_AA_GUN_CRUSADER',		'ENGLAND',	'',		'Crusader III AA Mk II',			'Crusader_III_AA',						'MOBILE_AA_GUN_2_D',		NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

SELECT	'MOBILE_AA_GUN_ZSU37',			'RUSSIA',	'',		'ZSU-37',							'ZSU-37',								'MOBILE_AA_GUN_2_B',		NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

SELECT	'MOBILE_AA_GUN_AUTOCANNONE',	'ROME',		'',		'Autocannone 90/53',				'Autocannone_90-53',					'MOBILE_AA_GUN_2',			NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

SELECT	'MOBILE_AA_GUN_M16A1',			'AMERICA',	'',		'M16A1 MGMC',						'M16A1_MGMC',							'MOBILE_AA_GUN_2',			NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

SELECT	'MOBILE_AA_GUN_TYPE98',			'JAPAN',	'',		'Type98 Ko-Hi AA Half-Track',		'Type98_Ko-Hi',							'MOBILE_AA_GUN_B',			NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

SELECT	'MOBILE_AA_GUN_VICKERS_GR',		'GREECE',	'',		'Vickers MK VI AA',					'Vickers_MK_VI_AA',						'MOBILE_AA_GUN',			NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

--		Key Name									Variation									Model file															Figures			Scale			RangedCombat			Move			Range			Personnel		IconIndex						FlagAtlas							Embarked 
--										Nation Name			Unit Name																	Template Unit						Formation		Combat			Cost	ProjCst			Immobile		Materiel		FlagIndex		IconAtlas									SV Icon

SELECT	'MOBILE_ARTILLERY_BISON',		'GERMANY',	'',		'Sturmpanzer I Bison',				'Sig33_Bison',							'MOBILE_ARTILLERY',			NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'MOBILE_ARTILLERY_GRILLE',		'GERMANY',	'',		'Sd.Kfz.138-1 Grille',				'Sdkfz138-1_Grille',					'MOBILE_ARTILLERY_2',		NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'MOBILE_ARTILLERY_WESPE',		'GERMANY',	'',		'Sd.Kfz.124 Wespe',					'Sdkfz124_Wespe',						'MOBILE_ARTILLERY_3',		NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'MOBILE_ARTILLERY_HUMMEL',		'GERMANY',	'',		'Sd.Kfz.165 Hummel',				'Sig33_Bison',							'MOBILE_ARTILLERY_4',		NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

SELECT	'MOBILE_ARTILLERY_BISHOP',		'ENGLAND',	'',		'Valentine MkI Bishop',				'Bishop',								'MOBILE_ARTILLERY',			NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'MOBILE_ARTILLERY_PRIEST',		NULL,		'',		'M7 Priest',						'M7_Priest_UK',							'MOBILE_ARTILLERY_2',		NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'MOBILE_ARTILLERY_SEXTON',		NULL,		'',		'Sexton',							'Sexton',								'MOBILE_ARTILLERY_3',		NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

SELECT	'MOBILE_ARTILLERY_SU26',		'RUSSIA',	'',		'SU-26',							'SU-26',								'MOBILE_ARTILLERY',			NULL,	NULL,	0.09,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'MOBILE_ARTILLERY_BM13',		'RUSSIA',	'',		'BM-13 Katyusha',					'BM-13_Katyusha',						'MOBILE_ARTILLERY_2',		NULL,	NULL,	0.09,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'MOBILE_ARTILLERY_BM13_16',		'RUSSIA',	'',		'BM-13-16 Katyusha',				'BM-13-16_Katyusha',					'MOBILE_ARTILLERY_3',		NULL,	NULL,	0.09,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

SELECT	'MOBILE_ARTILLERY_M7',			'AMERICA',	'',		'M7 Priest',						'M7_Priest',							'MOBILE_ARTILLERY_2',		NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'MOBILE_ARTILLERY_M12',			'AMERICA',	'',		'M12 King Kong',					'M12_King_Kong',						'MOBILE_ARTILLERY_3',		NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'MOBILE_ARTILLERY_M40',			'AMERICA',	'',		'M40 Long Tom',						'M40_Long_Tom',							'MOBILE_ARTILLERY_4',		NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

SELECT	'MOBILE_ARTILLERY_HO_RO',		'JAPAN',	'',		'Type 4 Ho-Ro',						'Type4_Ho-Ro',							'MOBILE_ARTILLERY',			NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'MOBILE_ARTILLERY_HA_TO',		'JAPAN',	'',		'Type 4 Ha-To',						'Type4_Ha-To',							'MOBILE_ARTILLERY_3',		NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

--		Key Name									Variation									Model file															Figures			Scale			RangedCombat			Move			Range			Personnel		IconIndex						FlagAtlas							Embarked 
--										Nation Name			Unit Name																	Template Unit						Formation		Combat			Cost	ProjCst			Immobile		Materiel		FlagIndex		IconAtlas									SV Icon

SELECT	'FIGHTER_P47',					'AMERICA',	'',		'P-47 Thunderbolt',					'P-47_Thunderbolt',						'FIGHTER_BOMBER_2_B',		NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0.25,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'FIGHTER_P36',					'AMERICA',	'',		'P-36 Hawk',						'P-36_Hawk',							'FIGHTER',					NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'FIGHTER_P40',					'AMERICA',	'',		'P-40 Warhawk',						'P-40_Warhawk',							'FIGHTER_2',				NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'FIGHTER_P51',					'AMERICA',	'',		'P-51 Mustang',						'P-51_Mustang',							'FIGHTER_3',				NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'FIGHTER_P38',					'AMERICA',	'',		'P-38 Lightning',					'P-38_Lightning',						'HEAVY_FIGHTER_2',			NULL,	NULL,	0.08,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'FIGHTER_F2A',					'AMERICA',	'',		'F2A Buffalo',						'F2A_Buffalo',							'OLD_NAVY_FIGHTER',			NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'FIGHTER_F4F',					'AMERICA',	'',		'F4F Wildcat',						'F4F_Wildcat',							'NAVY_FIGHTER',				NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'FIGHTER_F6F',					'AMERICA',	'',		'F6F Hellcat',						'F6F_Hellcat',							'NAVY_FIGHTER_2',			NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'FIGHTER_F4U',					'AMERICA',	'',		'F4U Corsair',						'F4U_Corsair',							'NAVY_FIGHTER_3',			NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

SELECT	'FIGHTER_P40N_CHINA',			'CHINA',	'',		'P-40 Warhawk',						'P-40_Warhawk_China',					'FIGHTER_2',				NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

SELECT	'FIGHTER_HURRICANE',			'ENGLAND',	'',		'Hawker Hurricane MKI',				'Hawker_Hurricane_MK_I',				'FIGHTER_BOMBER',			NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'FIGHTER_HURRICANE_MKII',		'ENGLAND',	'',		'Hawker Hurricane MkII',			'Hawker_Hurricane_MK_II',				'FIGHTER_BOMBER_B',			NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0.25,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'FIGHTER_TYPHOON',				'ENGLAND',	'',		'Hawker Typhoon',					'Hawker_Typhoon',						'FIGHTER_BOMBER_2',			NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0.25,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'FIGHTER_TEMPEST',				'ENGLAND',	'',		'Hawker Tempest',					'Hawker_Tempest',						'FIGHTER_BOMBER_2_B',		NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0.25,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'FIGHTER_SPITFIRE',				'ENGLAND',	'',		'Supermarine Spitfire MK II',		'Supermarine_Spitfire_MK_II',			'FIGHTER_B',				NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'FIGHTER_SPITFIRE_MKV',			'ENGLAND',	'',		'Supermarine Spitfire MK V',		'Supermarine_Spitfire_MK_V',			'FIGHTER_C',				NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0.25,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'FIGHTER_SPITFIRE_MKIX',		'ENGLAND',	'',		'Supermarine Spitfire MK IX',		'Supermarine_Spitfire_MK_IX',			'FIGHTER_D',				NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0.25,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'FIGHTER_WHIRLWIND',			'ENGLAND',	'',		'Westland Whirlwind',				'Westland_Whirlwind',					'HEAVY_FIGHTER',			NULL,	NULL,	0.08,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'FIGHTER_BEAUFIGHTER',			'ENGLAND',	'',		'Bristol Beaufighter',				'Bristol_Beaufighter',					'HEAVY_FIGHTER_2',			NULL,	NULL,	0.08,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'FIGHTER_METEOR',				'ENGLAND',	'',		'Gloster Meteor',					'Gloster_Meteor',						'JET_FIGHTER',				NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

SELECT	'FIGHTER_MB152',				'FRANCE',	'',		'Bloch MB.152',						'Bloch_MB.152',							'FIGHTER_BOMBER',			NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'FIGHTER_HURRICANE_FR',			NULL,		'',		'Hawker Hurricane MkII',			'Hurricane_France',						'FIGHTER_BOMBER_B',			NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'FIGHTER_MS406',				'FRANCE',	'',		'Morane-Saulnier M.S.406',			'Morane-Saulnier_M.S.406',				'FIGHTER',					NULL,	NULL,	NULL,	NULL,	-4,		NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'FIGHTER_HAWK75',				NULL,		'',		'Curtiss Hawk 75',					'Curtiss_Hawk_75',						'FIGHTER',					NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'FIGHTER_P40_FRANCE',			NULL,		'',		'P-40 Warhawk',						'P40France',							'FIGHTER_2',				NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'FIGHTER_D520',					'FRANCE',	'',		'Dewoitine D.520',					'Dewoitine_D.520',						'FIGHTER_B',				NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'FIGHTER_D790',					'FRANCE',	'',		'Dewoitine D.790',					'Dewoitine_D.790',						'NAVY_FIGHTER_B',			NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'FIGHTER_POTEZ630',				'FRANCE',	'',		'Potez 630',						'Potez_630',							'HEAVY_FIGHTER',			NULL,	NULL,	0.08,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

SELECT	'FIGHTER_BF109',				'GERMANY',	'',		'Messerschmitt Bf-109E',			'Messerschmitt_Bf-109E',				'FIGHTER_B',				NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	11,		'WW2_UNIT_ICONS',		NULL,				NULL,			NULL	UNION ALL
SELECT	'FIGHTER_BF109_F',				'GERMANY',	'',		'Messerschmitt Bf-109F',			'Messerschmitt_Bf-109F',				'FIGHTER_C',				NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0.25,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	11,		'WW2_UNIT_ICONS',		NULL,				NULL,			NULL	UNION ALL
SELECT	'FIGHTER_BF109_G',				'GERMANY',	'',		'Messerschmitt Bf-109G',			'Messerschmitt_Bf-109G',				'FIGHTER_D',				NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0.25,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	11,		'WW2_UNIT_ICONS',		NULL,				NULL,			NULL	UNION ALL
SELECT	'FIGHTER_BF109_T',				'GERMANY',	'',		'Messerschmitt Bf-109T',			'Messerschmitt_Bf-109T',				'NAVY_FIGHTER_B',			NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	11,		'WW2_UNIT_ICONS',		NULL,				NULL,			NULL	UNION ALL
SELECT	'FIGHTER_FW190',				'GERMANY',	'',		'Focke-Wulf Fw-190',				'Focke-Wulf_Fw-190',					'FIGHTER_BOMBER_2_B',		NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'FIGHTER_BF110',				'GERMANY',	'',		'Messerschmitt Bf-110',				'Messerschmitt_Bf-110',					'HEAVY_FIGHTER',			NULL,	NULL,	0.08,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'FIGHTER_BF110_F4',				'GERMANY',	'',		'Messerschmitt Bf-110F4',			'Messerschmitt_Bf-110F4',				'HEAVY_FIGHTER_B',			NULL,	NULL,	0.08,	NULL,	NULL,	NULL,	0.25,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'FIGHTER_JU88_C',				'GERMANY',	'',		'Junkers Ju-88C',					'Junkers_Ju-88C',						'HEAVY_FIGHTER_2',			NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'FIGHTER_HE219',				'GERMANY',	'',		'Heinkel He-219 Uhu',				'Heinkel_He-219_Uhu',					'HEAVY_FIGHTER_3',			NULL,	NULL,	0.08,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'FIGHTER_ME262',				'GERMANY',	'',		'Messerschmitt Me-262',				'Messerschmitt_Me-262_Schwalbe',		'JET_FIGHTER',				NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

--		Key Name									Variation									Model file															Figures			Scale			RangedCombat			Move			Range			Personnel		IconIndex						FlagAtlas							Embarked 
--										Nation Name			Unit Name																	Template Unit						Formation		Combat			Cost	ProjCst			Immobile		Materiel		FlagIndex		IconAtlas									SV Icon

SELECT	'FIGHTER_P24',					'GREECE',	'',		'PZL P.24',							'PZL_P.24',								'OLD_FIGHTER',				NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'FIGHTER_SPITFIRE_GREECE',		'GREECE',	'',		'Supermarine Spitfire',				'Supermarine_Spitfire_Greece',			'FIGHTER',					NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

SELECT	'FIGHTER_A5M',					'JAPAN',	'',		'Mitsubishi A5M Claude',			'Mitsubishi_A5M_Claude',				'OLD_NAVY_FIGHTER',			NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'FIGHTER_A6M2_ZERO',			'JAPAN',	'',		'Mitsubishi A6M2 Zero',				'Mitsubishi_A6M2_Zero',					'NAVY_FIGHTER_B',			NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'FIGHTER_A6M5_ZERO',			'JAPAN',	'',		'Mitsubishi A6M5 Zero',				'Mitsubishi_A6M5_Zero',					'NAVY_FIGHTER_C',			NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0.25,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'FIGHTER_A7M',					'JAPAN',	'',		'Mitsubishi A7M Reppu',				'Mitsubishi_A7M_Reppu',					'NAVY_FIGHTER_2',			NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'FIGHTER_KI43',					'JAPAN',	'',		'Nakajima Ki-43 Hayabusa',			'Nakajima_Ki-43_Hayabusa',				'FIGHTER',					NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'FIGHTER_KI44',					'JAPAN',	'',		'Nakajima Ki-44 Shoki',				'Nakajima_Ki-44_Shoki',					'FIGHTER_B',				NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0.25,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'FIGHTER_KI84',					'JAPAN',	'',		'Nakajima Ki-84 Hayate',			'Nakajima_Ki-84_Hayate',				'FIGHTER_D',				NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'FIGHTER_KI61',					'JAPAN',	'',		'Kawasaki Ki-61 Hien',				'Kawasaki_Ki-61_Hien',					'FIGHTER_2',				NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'FIGHTER_KI100',				'JAPAN',	'',		'Kawasaki Ki-100',					'Kawasaki_Ki-100_Tony',					'FIGHTER_2_C',				NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'FIGHTER_KI100_II',				'JAPAN',	'',		'Kawasaki Ki-100 II',				'Kawasaki_Ki-100_II',					'FIGHTER_2_D',				NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'FIGHTER_N1K2',					'JAPAN',	'',		'Kawanishi N1K2J',					'Kawanishi_N1K2-J_Shiden-Kai',			'FIGHTER_BOMBER_2',			NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'FIGHTER_J2M',					'JAPAN',	'',		'Mitsubishi J2M Raiden',			'Mitsubishi_J2M_Raiden',				'HEAVY_FIGHTER',			NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

SELECT	'FIGHTER_CR42',					'ROME',		'',		'Fiat CR.42 Falco',					'Fiat_CR.42_Falco',						'OLD_FIGHTER',				NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'FIGHTER_G50',					'ROME',		'',		'Fiat G.50 Freccia',				'Fiat_G.50_Freccia',					'FIGHTER',					NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'FIGHTER_C202',					'ROME',		'',		'Macchi C.202 Folgore',				'Macchi_C.202_Folgore',					'FIGHTER_2',				NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'FIGHTER_C205',					'ROME',		'',		'Macchi C.205 Veltro',				'Macchi_C.205_Veltro',					'FIGHTER_2_B',				NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'FIGHTER_G55',					'ROME',		'',		'Fiat G.55 Centauro',				'Fiat_G.55_Centauro',					'FIGHTER_3',				NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'FIGHTER_C200',					'ROME',		'',		'Macchi C.200 Saetta',				'Macchi_C.200_Saetta',					'FIGHTER_BOMBER',			NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'FIGHTER_CAPRONI',				'ROME',		'',		'Campini Caproni',					'Campini_Caproni',						'JET_FIGHTER',				NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

SELECT	'FIGHTER_I16',					'RUSSIA',	'',		'Polikarpov I-16',					'Polikarpov_I-16',						'OLD_FIGHTER',				NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'FIGHTER_LAGG3',				'RUSSIA',	'',		'Lavochkin LaGG-3',					'Lavochkin_LaGG-3',						'FIGHTER',					NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'FIGHTER_LA5',					'RUSSIA',	'',		'Lavochkin La-5',					'Lavochkin_La-5',						'FIGHTER_B',				NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0.25,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'FIGHTER_LA5_V2',				'RUSSIA',	'',		'Lavochkin La-5 FM',				'Lavochkin_La-5_v2',					'FIGHTER_C',				NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0.25,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'FIGHTER_LA7',					'RUSSIA',	'',		'Lavochkin La-7',					'Lavochkin_La-7',						'FIGHTER_D',				NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0.25,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'FIGHTER_YAK7',					'RUSSIA',	'',		'Yakovlev Yak-7',					'Yakovlev_Yak-7',						'FIGHTER_BOMBER_B',			NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'FIGHTER_YAK9',					'RUSSIA',	'',		'Yakovlev Yak-9',					'Yakovlev_Yak-9',						'FIGHTER_BOMBER_2_B',		NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

SELECT	'FIGHTER_CIV4',					NULL,		'',		'Fighter Generic',					'Fighter_Generic',						'FIGHTER',					NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'FIGHTER_LAGG3_EGYPT',			NULL,		'',		'Fighter LaGG-3',					'Fighter_LaGG-3',						'FIGHTER',					NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'FIGHTER_BF109_SPAIN',			NULL,		'',		'Messerschmitt Bf-109J',			'Messerschmitt_Bf-109J',				'FIGHTER',					NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'FIGHTER_P11',					NULL,		'',		'PZL P.11',							'PZL_P.11',								'OLD_FIGHTER',				NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'FIGHTER_FOKKER_DXXI',			'NETHERLANDS','',	'Fokker D.XXI',						'Fokker_D.XXI',							'OLD_FIGHTER',				NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'FIGHTER_FOKKER_GI',			'NETHERLANDS','',	'Fokker G.I',						'Fokker_G.I',							'HEAVY_FIGHTER',			NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'FIGHTER_RE2000',				'HUNGARY',	'',		'Reggiane Re.2000 Heja-M',			'Reggiane_Re.2000_Heja-M',				'FIGHTER',					NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

--		Key Name									Variation									Model file															Figures			Scale			RangedCombat			Move			Range			Personnel		IconIndex						FlagAtlas							Embarked 
--										Nation Name			Unit Name																	Template Unit						Formation		Combat			Cost	ProjCst			Immobile		Materiel		FlagIndex		IconAtlas									SV Icon

SELECT	'BOMBER_A20',					'AMERICA',	'',		'A-20 Havoc',						'A20_Havoc',							'LIGHT_BOMBER',				NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'BOMBER_B25',					'AMERICA',	'',		'B-25 Mitchell',					'B-25_Mitchell',						'BOMBER',					NULL,	NULL,	0.09,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'BOMBER_B17',					'AMERICA',	'',		'B-17 Fortress',					'U_American_B17',						'HEAVY_BOMBER',				NULL,	NULL,	0.09,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'BOMBER_B24',					'AMERICA',	'',		'B-24 Liberator',					'B-24_Liberator',						'HEAVY_BOMBER_2',			NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'BOMBER_B29',					'AMERICA',	'',		'B-29 Superfortress',				'B-29_Superfortress',					'HEAVY_BOMBER_3',			NULL,	NULL,	0.105,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

SELECT	'BOMBER_B25_CHINA',				'CHINA',	'',		'B-25 Mitchell China',				'B-25_Mitchell_China',					'BOMBER',					NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

SELECT	'BOMBER_SWORDFISH',				'ENGLAND',	'',		'Fairey Swordfish',					'FaireySwordfish',						'TORPEDO_BOMBER',			NULL,	NULL,	0.055,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'BOMBER_LANCASTER',				'ENGLAND',	'',		'Avro Lancaster',					'Avro_Lancaster',						'HEAVY_BOMBER_2',			NULL,	NULL,	0.09,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'BOMBER_MOSQUITO',				'ENGLAND',	'',		'De Havilland Mosquito',			'De_Havilland_Mosquito',				'FAST_BOMBER_2',			NULL,	NULL,	0.09,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'BOMBER_WELLINGTON',			'ENGLAND',	'',		'Vickers Wellington',				'Vickers_Wellington',					'BOMBER',					NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	13,		'WW2_UNIT_ICONS',		NULL,				NULL,			NULL	UNION ALL
SELECT	'BOMBER_HALIFAX',				'ENGLAND',	'',		'HP Halifax',						'HP_Halifax',							'HEAVY_BOMBER',				NULL,	NULL,	0.09,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

SELECT	'BOMBER_LN401',					'FRANCE',	'',		'Loire-Nieuport LN.401',			'Loire-Nieuport_LN.401',				'ATTACK_AIRCRAFT',			NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'BOMBER_AMIOT350',				'FRANCE',	'',		'Amiot 350',						'Amiot_350',							'FAST_BOMBER',				NULL,	NULL,	0.065,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'BOMBER_BR690',					'FRANCE',	'',		'Breguet 690',						'Breguet_690',							'LIGHT_BOMBER',				NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'BOMBER_BR810',					'FRANCE',	'',		'Breguet 810',						'Breguet_810',							'NAVY_LIGHT_BOMBER',		NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

SELECT	'BOMBER_JU87',					'GERMANY',	'',		'Junkers Ju-87 Stuka',				'Junkers_Ju-87_Stuka',					'ATTACK_AIRCRAFT',			NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'BOMBER_JU87T',					'GERMANY',	'',		'Junkers Ju-87T Stuka',				'Junkers_Ju-87T_Stuka',					'NAVY_BOMBER',				NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'BOMBER_JU88',					'GERMANY',	'',		'Junkers Ju-88',					'Junkers_Ju-88',						'FAST_BOMBER',				NULL,	NULL,	0.065,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'BOMBER_HE111',					'GERMANY',	'',		'Heinkel He-111',					'Heinkel_He-111',						'BOMBER',					NULL,	NULL,	0.085,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'BOMBER_HE177',					'GERMANY',	'',		'Heinkel He-177 Greif',				'Heinkel_He-177_Greif',					'HEAVY_BOMBER',				NULL,	NULL,	0.11,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'BOMBER_AR234',					'GERMANY',	'',		'Arado Ar-234',						'Ar234',								'JET_BOMBER',				NULL,	NULL,	0.07,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'BOMBER_HO229',					'GERMANY',	'',		'Horten Ho-229',					'Ho229',								'JET_BOMBER_2',				NULL,	NULL,	0.06,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

--		Key Name									Variation									Model file															Figures			Scale			RangedCombat			Move			Range			Personnel		IconIndex						FlagAtlas							Embarked 
--										Nation Name			Unit Name																	Template Unit						Formation		Combat			Cost	ProjCst			Immobile		Materiel		FlagIndex		IconAtlas									SV Icon

SELECT	'BOMBER_FAIREY',				'GREECE',	'',		'Fairey Battle',					'Fairey_Battle',						'ATTACK_AIRCRAFT',			NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'BOMBER_BLENHEIM_GREECE',		'GREECE',	'',		'Bristol Blenheim',					'Bristol_Blenheim',						'LIGHT_BOMBER',				NULL,	NULL,	0.065,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

SELECT	'BOMBER_AICHI',					'JAPAN',	'',		'Aichi D3A Val',					'Aichi_D3A_Val',						'NAVY_BOMBER',				NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'BOMBER_G4M3',					'JAPAN',	'',		'Mitsubishi G4M Betty',				'Mitsubishi_G4M_Betty',					'FAST_BOMBER',				NULL,	NULL,	0.07,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'BOMBER_KI21',					'JAPAN',	'',		'Mitsubishi Ki-21 Sally',			'Mitsubishi_Ki-21_Sally',				'BOMBER',					NULL,	NULL,	0.09,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

SELECT	'BOMBER_BA65',					'ROME',		'',		'Breda Ba.65',						'Breda_Ba.65',							'ATTACK_AIRCRAFT',			NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'BOMBER_SM79',					'ROME',		'',		'Savoia-Marchetti SM.79 Sparviero',	'Savoia-Marchetti_SM.79_Sparviero',		'FAST_BOMBER',				NULL,	NULL,	0.09,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'BOMBER_SM84',					'ROME',		'',		'Savoia-Marchetti SM.84',			'Savoia-Marchetti_SM.84',				'BOMBER',					NULL,	NULL,	0.09,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

SELECT	'BOMBER_IL2',					'RUSSIA',	'',		'Ilyushin IL-2 Shturmovik',			'Ilyushin_IL-2_Shturmovik',				'ATTACK_AIRCRAFT',			NULL,	NULL,	NULL,	NULL,	10,		NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'BOMBER_IL2M3',					'RUSSIA',	'',		'Ilyushin IL-2M3 Shturmovik',		'Ilyushin_IL-2M3',						'ATTACK_AIRCRAFT_B',		NULL,	NULL,	NULL,	NULL,	10,		NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'BOMBER_IL10',					'RUSSIA',	'',		'Ilyushin IL-10',					'Ilyushin_IL-10',						'ATTACK_AIRCRAFT_C',		NULL,	NULL,	NULL,	NULL,	10,		NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'BOMBER_PE2',					'RUSSIA',	'',		'Petlyakov Pe-2',					'Petlyakov_Pe-2',						'FAST_BOMBER',				NULL,	NULL,	0.07,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'BOMBER_TU2',					'RUSSIA',	'',		'Tupolev Tu-2',						'Tupolev_Tu-2',							'FAST_BOMBER_2',			NULL,	NULL,	0.07,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'BOMBER_IL4',					'RUSSIA',	'',		'Ilyushin IL-4',					'Ilyushin_IL-4',						'BOMBER',					NULL,	NULL,	0.085,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'BOMBER_TB3',					'RUSSIA',	'',		'Tupolev TB-3',						'Tupolev_TB-3',							'OLD_HEAVY_BOMBER',			NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'BOMBER_PE8',					'RUSSIA',	'',		'Petlyakov Pe-8',					'Petlyakov_Pe-8',						'HEAVY_BOMBER',				NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

SELECT	'BOMBER_B24_EGYPT',				NULL,		'',		'B-24 Egypt',						'Bomber_B-24_Egypt',					'BOMBER',					NULL,	NULL,	0.10,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'BOMBER_PZL37',					NULL,		'',		'PZL P.37 Los',						'PZL_P.37_Los',							'FAST_BOMBER',				NULL,	NULL,	0.075,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'BOMBER_CIV4',					NULL,		'',		'Bomber Generic',					'Bomber_Generic',						'BOMBER',					NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'BOMBER_JU88_SPAIN',			NULL,		'',		'Ju-88 Spain',						'Bomber_Ju-88_Spain',					'FAST_BOMBER',				NULL,	NULL,	0.065,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'BOMBER_FOKKER_TV',				'NETHERLANDS','',	'Fokker T.V',						'Fokker_T.V',							'BOMBER',					NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'BOMBER_CA135',					'HUNGARY',	'',		'Caproni Ca.135',					'Caproni_Ca.135',						'BOMBER',					NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

--		Key Name									Variation									Model file															Figures			Scale			RangedCombat			Move			Range			Personnel		IconIndex						FlagAtlas							Embarked 
--										Nation Name			Unit Name																	Template Unit						Formation		Combat			Cost	ProjCst			Immobile		Materiel		FlagIndex		IconAtlas									SV Icon

SELECT	'DESTROYER_FLETCHER',			'AMERICA',	'',		'Fletcher Class',					'Fletcher_Class',						'DESTROYER',				NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'DESTROYER_TRIBA',				'ENGLAND',	'',		'Tribal Class',						'Triba_Class',							'DESTROYER',				NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'DESTROYER_FANTASQUE',			'FRANCE',	'',		'Fantasque Class',					'Fantasque_Class',						'DESTROYER',				NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'DESTROYER_TYPE_1934A',			'GERMANY',	'',		'Z Class',							'Z_Class',								'DESTROYER',				NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'DESTROYER_GEORGIOS',			'GREECE',	'',		'Vasilefs Georgios Class',			'Vasilefs_Georgios_Class',				'DESTROYER',				NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'DESTROYER_KAGERO',				'JAPAN',	'',		'Kagero Class',						'Kagero_Class',							'DESTROYER',				NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'DESTROYER_SOLDATI',			'ROME',		'',		'Soldati Class',					'Soldati_Class',						'DESTROYER',				NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'DESTROYER_GNEVNY',				'RUSSIA',	'',		'Gnevny Class',						'Gnevny_Class',							'DESTROYER',				NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

--		Key Name									Variation									Model file															Figures			Scale			RangedCombat			Move			Range			Personnel		IconIndex						FlagAtlas							Embarked 
--										Nation Name			Unit Name																	Template Unit						Formation		Combat			Cost	ProjCst			Immobile		Materiel		FlagIndex		IconAtlas									SV Icon

SELECT	'CRUISER_BALTIMORE',			'AMERICA',	'',		'Baltimore Class',					'Baltimore_Class',						'CRUISER',					NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'CRUISER_DIDO',					'ENGLAND',	'',		'Dido Class',						'Dido_Class',							'CRUISER',					NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'CRUISER_GALISSONIERE',			'FRANCE',	'',		'La Galissonniere Class',			'La_Galissonniere_Class',				'CRUISER',					NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'CRUISER_LEIPZIG',				'GERMANY',	'',		'Leipzig Class',					'Leipzig_Class',						'CRUISER',					NULL,	NULL,	0.12,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'CRUISER_PISA',					'GREECE',	'',		'Pisa Class',						'Pisa_Class',							'DREADNOUGHT',				NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'CRUISER_TAKAO',				'JAPAN',	'',		'Takao Class',						'Takao_Class',							'CRUISER',					NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'CRUISER_KIROV',				'RUSSIA',	'',		'Kirov Class',						'Kirov_Class',							'CRUISER',					NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

SELECT	'HEAVY_CRUISER_DEUTSCHLAND',	'GERMANY',	'',		'Deutschland Class',				'Deutschland_Class',					'HEAVY_CRUISER',			NULL,	NULL,	0.095,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'HEAVY_CRUISER_ZARA',			'ROME',		'',		'Zara Class',						'Zara_Class',							'HEAVY_CRUISER',			NULL,	NULL,	0.095,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

SELECT	'DREADNOUGHT_ELIZABETH',		'ENGLAND',	'',		'Queen Elizabeth Class',			'Queen_Elizabeth_Class',				'DREADNOUGHT',				NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'DREADNOUGHT_DI_CAVOUR',		'ROME',		'',		'Conte Di Cavour Class',			'Conte_Di_Cavour_Class',				'DREADNOUGHT',				NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'DREADNOUGHT_GANGUT',			'RUSSIA',	'',		'Gangut Class',						'Gangut_Class',							'DREADNOUGHT',				NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'DREADNOUGHT_PENNSYLVANIA',		'AMERICA',	'',		'Pennsylvania Class',				'Pennsylvania_Class',					'DREADNOUGHT',				NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

--		Key Name									Variation									Model file															Figures			Scale			RangedCombat			Move			Range			Personnel		IconIndex						FlagAtlas							Embarked 
--										Nation Name			Unit Name																	Template Unit						Formation		Combat			Cost	ProjCst			Immobile		Materiel		FlagIndex		IconAtlas									SV Icon

SELECT	'BATTLESHIP_SOUTH_DAKOTA',		'AMERICA',	'',		'South Dakota Class',				'South_Dakota_Class',					'BATTLESHIP',				NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'BATTLESHIP_IOWA',				'AMERICA',	'',		'Iowa Class',						'Iowa_Class',							'BATTLESHIP_2',				NULL,	NULL,	0.11,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

SELECT	'BATTLESHIP_ADMIRAL',			'ENGLAND',	'',		'Admiral Class',					'Admiral_Class',						'BATTLESHIP',				NULL,	NULL,	0.095,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'BATTLESHIP_GEORGE_V',			'ENGLAND',	'',		'King George V Class',				'King_George_V_Class',					'BATTLESHIP_2',				NULL,	NULL,	0.11,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

SELECT	'BATTLESHIP_DUNKERQUE',			'FRANCE',	'',		'Dunkerque Class',					'Dunkerque_Class',						'BATTLESHIP',				NULL,	NULL,	0.095,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'BATTLESHIP_RICHELIEU',			'FRANCE',	'',		'Richelieu Class',					'Richelieu_Class',						'BATTLESHIP_2',				NULL,	NULL,	0.112,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

SELECT	'BATTLESHIP_SCHARNHORST',		'GERMANY',	'',		'Scharnhorst Class',				'Scharnhorst_Class',					'BATTLESHIP',				NULL,	NULL,	0.11,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'BATTLESHIP_BISMARK',			'GERMANY',	'',		'Bismark Class',					'Bismark_Class',						'BATTLESHIP_2',				NULL,	NULL,	0.11,	5,		5,		NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

SELECT	'BATTLESHIP_KONGO',				'JAPAN',	'',		'Kongo Class',						'Kongo_Class',							'BATTLESHIP',				NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'BATTLESHIP_YAMOTO',			'JAPAN',	'',		'Yamato Class',						'Yamato_Class',							'BATTLESHIP_2',				NULL,	NULL,	0.11,	10,		5,		NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

SELECT	'BATTLESHIP_LITTORIO',			'ROME',		'',		'Littorio Class',					'Littorio_Class',						'BATTLESHIP',				NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

SELECT	'BATTLESHIP_SOYUZ',				'RUSSIA',	'',		'Sovetsky Soyuz Class',				'Sovetsky_Soyuz_Class',					'BATTLESHIP',				NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

--		Key Name									Variation									Model file															Figures			Scale			RangedCombat			Move			Range			Personnel		IconIndex						FlagAtlas							Embarked 
--										Nation Name			Unit Name																	Template Unit						Formation		Combat			Cost	ProjCst			Immobile		Materiel		FlagIndex		IconAtlas									SV Icon

SELECT	'SUBMARINE_GATO',				'AMERICA',	'',		'Gato Class',						'Gato_Class',							'SUBMARINE',				NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'SUBMARINE_TCLASS',				'ENGLAND',	'',		'T Class',							'T_Class',								'SUBMARINE',				NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'SUBMARINE_REDOUTABLE',			'FRANCE',	'',		'Redoutable Class',					'Redoutable_Class',						'SUBMARINE',				NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'SUBMARINE_U_BOAT',				'GERMANY',	'',		'U-Boat Type VII',					'U-Boat_Type_VII',						'SUBMARINE',				NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'SUBMARINE_KATSONIS',			'GREECE',	'',		'Katsonis Class',					'Katsonis_Class',						'SUBMARINE',				NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'SUBMARINE_B1',					'JAPAN',	'',		'B1 Type',							'B1_Type',								'SUBMARINE',				NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'SUBMARINE_MARCELLO',			'ROME',		'',		'Marcello Class',					'Marcello_Class',						'SUBMARINE',				NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'SUBMARINE_SHCHUKA',			'RUSSIA',	'',		'Shchuka Class',					'Shchuka_Class',						'SUBMARINE',				NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

SELECT	'SUBMARINE_ORZEL',				NULL,		'',		'Orzel Class',						'Orzel_Class',							'SUBMARINE',				NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

SELECT	'CARRIER_JOFFRE',				'FRANCE',	'',		'Joffre Class',						'Joffre_Class',							'CARRIER',					NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'CARRIER_ZEPPELIN',				'GERMANY',	'',		'Graf Zeppelin Class',				'Graf_Zeppelin_Class',					'CARRIER',					NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'CARRIER_YORKTOWN',				'AMERICA',	'',		'Yorktown Class',					'Yorktown_Class',						'CARRIER',					NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'CARRIER_ARK_ROYAL',			'ENGLAND',	'',		'Ark Royal Class',					'Ark_Royal_Class',						'CARRIER',					NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'CARRIER_PROJECT71',			'RUSSIA',	'',		'Project 71',						'Project_71',							'CARRIER',					NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'CARRIER_AQUILA',				'ROME',		'',		'Aquila Class',						'Aquila_Class',							'CARRIER',					NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

SELECT	'CARRIER_KAGA',					'JAPAN',	'',		'Kaga Class',						'Kaga_Class',							'CARRIER',					NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL;	--UNION ALL
																			 