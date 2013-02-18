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
	(		UnitKey,				CivKey,		Var,	Name,								fxsxml,								Template,				Nb,		Form,	Scl,	Cbt,	Rgcbt,	Cst,	Mvt,	Imb,	Rng,	Mat,	Pers,	Flag,	Icon,	IcAtl,					FlagAtl,			Sv,							Embark  	)

--		Key Name								Variation									Model file													Figures			Scale			RangedCombat	Move			Range			Personnel		IconIndex						FlagAtlas							Embarked 
--									Nation Name			Unit Name																Template Unit					Formation		Combat			Cost			Immobile		Materiel		FlagIndex		IconAtlas									SV Icon

SELECT	'AMERICAN_INFANTRY',		'AMERICA',	'',		'Infantry',							'Infantry_USA',						'INFANTRY',				NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	6,		'WW2_UNIT_ICONS',		NULL,				NULL,			NULL	UNION ALL
SELECT	'AMERICAN_MARINES',			'AMERICA',	'',		'Marines',							'Infantry_USA_2',					'INFANTRY_2',			NULL,	NULL,	NULL,	4,		NULL,	50,		NULL,	NULL,	NULL,	1,		3,		16,		NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

SELECT	'CHINESE_INFANTRY',			'CHINA',	'',		'Infantry',							'Infantry_China',					'INFANTRY',				NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

SELECT	'ENGLISH_INFANTRY',			'ENGLAND',	'',		'Infantry',							'Infantry_UK',						'INFANTRY',				NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	2,		'WW2_INFANTRY01_ATLAS',	NULL,				NULL,			NULL	UNION ALL

SELECT	'FRENCH_INFANTRY',			'FRANCE',	'',		'Infantry',							'Infantry_France',					'INFANTRY',				NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,		'WW2_INFANTRY01_ATLAS',	NULL,				NULL,			NULL	UNION ALL
SELECT	'FRENCH_FOREIGNLEGION',		'FRANCE',	'',		'Foreign Legion',					'U_French_ForeignLegion',			'INFANTRY_2',			NULL,	NULL,	NULL,	2,		NULL,	65,		NULL,	NULL,	NULL,	NULL,	5,		NULL,	38,		'UNIT_ATLAS_2',			NULL,				NULL,			NULL	UNION ALL

SELECT	'GERMAN_INFANTRY',			'GERMANY',	'',		'Infantry',							'Infantry_German',					'INFANTRY',				NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,		'WW2_INFANTRY01_ATLAS',	NULL,				NULL,			NULL	UNION ALL
SELECT	'GERMAN_SS_INFANTRY',		'GERMANY',	'',		'Waffen-SS',						'Infantry_WaffenSS',				'INFANTRY_2',			NULL,	NULL,	NULL,	4,		NULL,	25,		NULL,	NULL,	NULL,	NULL,	4,		NULL,	0,		'WW2_INFANTRY01_ATLAS',	NULL,				NULL,			NULL	UNION ALL

SELECT	'GREEK_INFANTRY',			'GREECE',	'',		'Infantry',							'Infantry_Greece',					'INFANTRY',				NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

SELECT	'JAPAN_INFANTRY',			'JAPAN',	'',		'Infantry',							'Infantry_Japan',					'INFANTRY',				NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

SELECT	'ITALIAN_INFANTRY',			'ROME',		'',		'Infantry',							'Infantry_Italy',					'INFANTRY',				NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

SELECT	'RUSSIAN_INFANTRY',			'RUSSIA',	'',		'Infantry',							'Infantry_Russia',					'INFANTRY',				NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	3,		'WW2_INFANTRY01_ATLAS',	NULL,				NULL,			NULL	UNION ALL
SELECT	'RUSSIAN_NAVAL_INFANTRY',	'RUSSIA',	'',		'Naval Infantry',					'Naval_Infantry',					'INFANTRY_2',			NULL,	NULL,	NULL,	2,		NULL,	25,		NULL,	NULL,	NULL,	1,		3,		16,		NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

SELECT	'POLAND_INFANTRY',			NULL,		'',		'Infantry',							'Infantry_Poland',					'INFANTRY',				NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'HUNGARY_INFANTRY',			NULL,		'',		'Infantry',							'Infantry_Hungary',					'INFANTRY',				NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

SELECT	'GERMAN_PARATROOPER',		'GERMANY',	'',		'Paratrooper',						'Paratrooper_German',				'PARATROOPER',			NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

--		Key Name								Variation									Model file													Figures			Scale			RangedCombat	Move			Range			Personnel		IconIndex						FlagAtlas							Embarked 
--									Nation Name			Unit Name																Template Unit					Formation		Combat			Cost			Immobile		Materiel		FlagIndex		IconAtlas									SV Icon

SELECT	'TANK_M3_STUART',			'AMERICA',	'',		'M3 Stuart',						'M3_Stuart',						'LIGHT_TANK_2',			NULL,	NULL,	0.11,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_M5_STUART',			'AMERICA',	'',		'M5 Stuart',						'M5_Stuart',						'LIGHT_TANK_2_B',		NULL,	NULL,	0.11,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_SHERMAN',				'AMERICA',	'',		'M4A1 Sherman II',					'M4A1_Sherman_II',					'TANK',					NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_SHERMAN_IIA',			'AMERICA',	'',		'M4A1(76)W Sherman IIA',			'M4A1(76)W_Sherman_IIA',			'TANK_B',				NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_SHERMAN_III',			'AMERICA',	'',		'M4A2 Sherman III',					'M4A2_Sherman_III',					'TANK_C',				NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_SHERMAN_IIIA',		'AMERICA',	'',		'M4A2(76)W Sherman IIIA',			'M4A2(76)W_Sherman_IIIA',			'TANK_D',				NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_SHERMAN_IV',			'AMERICA',	'',		'M4A3 Sherman IV',					'M4A3_Sherman_IV',					'TANK_E',				NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_SHERMAN_JUMBO',		'AMERICA',	'',		'M4A3E2 Sherman Jumbo',				'M4A3E2_Sherman_Jumbo',				'TANK_F',				NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_SHERMAN_EASYEIGHT',	'AMERICA',	'',		'M4A3E8 Sherman Easy Eight',		'M4A3E8_Sherman_Easy_Eight',		'TANK_G',				NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_M26_PERSHING',		'AMERICA',	'',		'M26 Pershing',						'M26_Pershing',						'HEAVY_TANK_2_B',		NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

SELECT	'TANK_T26B',				'CHINA',	'',		'T-26B',							'T-26B',							'OLD_LIGHT_TANK',		NULL,	NULL,	0.11,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	7,		'WW2_UNIT_ICONS',		NULL,				NULL,			NULL	UNION ALL

SELECT	'TANK_VICKERS_MKVIB',		'ENGLAND',	'',		'Vickers MK VIB',					'Vickers_MK_VIB',					'OLD_LIGHT_TANK',		NULL,	NULL,	0.11,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_TETRARCH',			'ENGLAND',	'',		'A17 Tetrarch',						'A17_Tetrarch',						'LIGHT_TANK',			NULL,	NULL,	0.105,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_MATILDA_I',			'ENGLAND',	'',		'A11 Matilda I',					'A11_Matilda_I',					'LIGHT_TANK_2',			NULL,	NULL,	0.105,	10,		NULL,	NULL,	-2,		NULL,	NULL,	2,		NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_A10_VALENTINE',		'ENGLAND',	'',		'A10 Valentine',					'A10_Valentine',					'LIGHT_TANK_3',			NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_CRUISER_MKI',			'ENGLAND',	'',		'A9 Cruiser MK I',					'A9_Cruiser_MK_I',					'CRUISER_TANK',			NULL,	NULL,	0.11,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_CRUISER_MKII',		'ENGLAND',	'',		'A10 Cruiser MK II',				'A10_Cruiser_MK_II',				'CRUISER_TANK_B',		NULL,	NULL,	0.11,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_CRUISER_MKIII',		'ENGLAND',	'',		'A13 Cruiser MK III',				'A13_Cruiser_MK_III',				'CRUISER_TANK_2',		NULL,	NULL,	0.11,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_CRUISER_MKIV',		'ENGLAND',	'',		'A13 MK II Cruiser MK IV',			'A13_MK_II_Cruiser_MK_IV',			'CRUISER_TANK_2_B',		NULL,	NULL,	0.11,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_A13_MKIII',			'ENGLAND',	'',		'A13 MK III Covenanter',			'A13_MK_III_Covenanter',			'CRUISER_TANK_3',		NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_A15_CRUSADER',		'ENGLAND',	'',		'A15 Crusader',						'A15_Crusader',						'CRUISER_TANK_4',		NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_A15_CRUSADER_MKIII',	'ENGLAND',	'',		'A15 Crusader MK III',				'A15_Crusader_MK_III',				'CRUISER_TANK_4_B',		NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_CROMWELL',			'ENGLAND',	'',		'A27M Cromwell',					'A27M_Cromwell',					'CRUISER_TANK_5_C',		NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_M3_GRANT',			'ENGLAND',	'',		'M3 Grant',							'M3_Grant',							'OLD_TANK',				NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_MATILDA_II',			'ENGLAND',	'',		'A12 Matilda II',					'A12_Matilda_II',					'TANK',					NULL,	NULL,	0.12,	10,		NULL,	NULL,	-1,		NULL,	NULL,	5,		NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_M4_FIREFLY',			'ENGLAND',	'',		'M4 Firefly',						'M4_Firefly',						'TANK_2_C',				NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_CHURCHILL',			'ENGLAND',	'',		'A22 Churchill',					'A22_Churchill',					'HEAVY_TANK_B',			NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

--		Key Name								Variation									Model file													Figures			Scale			RangedCombat	Move			Range			Personnel		IconIndex						FlagAtlas							Embarked 
--									Nation Name			Unit Name																Template Unit					Formation		Combat			Cost			Immobile		Materiel		FlagIndex		IconAtlas									SV Icon

SELECT	'TANK_AMR35',				'FRANCE',	'',		'AMR-35',							'AMR-35',							'OLD_LIGHT_TANK',		NULL,	NULL,	0.10,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_FCM36',				'FRANCE',	'',		'FCM 36',							'FCM_36',							'LIGHT_TANK',			NULL,	NULL,	0.105,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_R35',					'FRANCE',	'',		'Renault R-35',						'Renault_R-35',						'LIGHT_TANK_2',			NULL,	NULL,	0.105,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_R35_BONUS',			NULL,		'',		'Renault R-35 bonus',				'Renault_R-35_bonus',				'LIGHT_TANK_2',			NULL,	NULL,	0.105,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_R40',					'FRANCE',	'',		'Renault R-40',						'Renault_R-40',						'LIGHT_TANK_2_B',		NULL,	NULL,	0.105,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_H35',					'FRANCE',	'',		'Hotchkiss H-35',					'Hotchkiss_H-35',					'CRUISER_TANK',			NULL,	NULL,	0.105,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_H39',					'FRANCE',	'',		'Hotchkiss H-39',					'Hotchkiss_H-39',					'CRUISER_TANK_B',		NULL,	NULL,	0.105,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_AMC35',				'FRANCE',	'',		'AMC-35',							'AMC-35',							'OLD_TANK',				NULL,	NULL,	0.11,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_CHAR_D1',				'FRANCE',	'',		'Char D1',							'Char_D1',							'TANK',					NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_CHAR_D2',				'FRANCE',	'',		'Char D2',							'Char_D2',							'TANK_B',				NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_S35',					'FRANCE',	'',		'Somua S-35',						'Somua_S-35',						'TANK_C',				NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_B1',					'FRANCE',	'',		'Char B1',							'Char_B1',							'HEAVY_TANK',			NULL,	NULL,	0.135,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_ARL44',				'FRANCE',	'',		'ARL-44',							'ARL-44',							'HEAVY_TANK_2',			NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_CHAR_2C',				'FRANCE',	'',		'Char 2C',							'Char_2C',							'SUPER_HEAVY_TANK',		NULL,	NULL,	0.19,	-50,	NULL,	100,	-1,		NULL,	NULL,	-5,		5,		NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

SELECT	'TANK_PANZER_I',			'GERMANY',	'',		'Panzer I',							'Panzer_I',							'OLD_LIGHT_TANK',		NULL,	NULL,	0.105,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	12,		'WW2_UNIT_ICONS',		NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_PANZER_35',			NULL,		'',		'Panzer 35(t)',						'Panzer_35(t)',						'LIGHT_TANK',			NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_PANZER_II',			'GERMANY',	'',		'Panzer II',						'Panzer_II',						'LIGHT_TANK_2',			NULL,	NULL,	0.105,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_PANZER_II_L',			'GERMANY',	'',		'Panzer II Ausf L Luchs',			'Panzer_II_Ausf_L_Luchs',			'LIGHT_TANK_2_B',		NULL,	NULL,	0.105,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_PANZER_III',			'GERMANY',	'',		'Panzer III',						'Panzer_III',						'TANK',					NULL,	NULL,	0.115,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_PANZER_III_J',		'GERMANY',	'',		'Panzer III Ausf J',				'Panzer_III_Ausf_J',				'TANK_D',				NULL,	NULL,	0.115,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_PANZER_IV',			'GERMANY',	'',		'Panzer IV',						'Panzer_IV',						'TANK_2',				NULL,	NULL,	0.12,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_PANZER_IV_G',			'GERMANY',	'',		'Panzer IV Ausf G',					'Panzer_IV_Ausf_G',					'TANK_2_B',				NULL,	NULL,	0.12,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_PANZER_IV_H',			'GERMANY',	'',		'Panzer IV Ausf H',					'Panzer_IV_Ausf_H',					'TANK_2_C',				NULL,	NULL,	0.12,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_PANZER_V_PANTHER',	'GERMANY',	'',		'Panzer V Panther',					'Panzer_V_Panther',					'TANK_3',				NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_PANZER_VI_TIGER',		'GERMANY',	'',		'Panzer VI Tiger',					'Panzer_VI_Tiger',					'HEAVY_TANK_2_B',		NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_PANZER_VIB_TIGER_II',	'GERMANY',	'',		'Panzer VIB Konigstiger',			'Panzer_VIB_KingTiger',				'HEAVY_TANK_3',			NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_PANZER_VIII_MAUS',	'GERMANY',	'',		'Panzer VIII Maus',					'Panzer_VIII_Maus',					'SUPER_HEAVY_TANK',		NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

SELECT	'TANK_VICKERS_MKE_GREECE',	'GREECE',	'',		'Vickers MK E Greece',				'Vickers_MK_E_Greece',				'OLD_LIGHT_TANK',		NULL,	NULL,	0.11,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_VICKERS_MKII_GREECE',	'GREECE',	'',		'Vickers MK II',					'Vickers_MK_II',					'OLD_TANK',				NULL,	NULL,	0.11,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

--		Key Name								Variation									Model file													Figures			Scale			RangedCombat	Move			Range			Personnel		IconIndex						FlagAtlas							Embarked 
--									Nation Name			Unit Name																Template Unit					Formation		Combat			Cost			Immobile		Materiel		FlagIndex		IconAtlas									SV Icon

SELECT	'TANK_T26',					'RUSSIA',	'',		'T-26',								'T-26',								'OLD_LIGHT_TANK',		NULL,	NULL,	0.105,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	7,		'WW2_UNIT_ICONS',		NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_T70',					'RUSSIA',	'',		'T-70',								'T-70',								'LIGHT_TANK_3',			NULL,	NULL,	0.105,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	7,		'WW2_UNIT_ICONS',		NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_BT2',					'RUSSIA',	'',		'BT-2',								'BT-2',								'CRUISER_TANK',			NULL,	NULL,	0.105,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_BT7',					'RUSSIA',	'',		'BT-7',								'BT-7',								'CRUISER_TANK_2',		NULL,	NULL,	0.105,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_T28',					'RUSSIA',	'',		'T-28',								'T-28',								'OLD_TANK',				NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_T34',					'RUSSIA',	'',		'T-34',								'T-34',								'TANK_2_B',				NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_T34_76',				'RUSSIA',	'',		'T-34-76',							'T-34-76',							'TANK_2_C',				NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_T34_85',				'RUSSIA',	'',		'T-34-85',							'T-34-85',							'TANK_2_D',				NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_KV1',					'RUSSIA',	'',		'KV-1',								'KV-1',								'HEAVY_TANK',			NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_IS_1',				'RUSSIA',	'',		'IS-1',								'IS-1',								'HEAVY_TANK_2',			NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_IS_2',				'RUSSIA',	'',		'IS-2',								'IS-2',								'HEAVY_TANK_2_B',		NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

SELECT	'TANK_L6_40',				'ROME',		'',		'L6-40',							'L6-40',							'LIGHT_TANK',			NULL,	NULL,	0.105,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_M11_39',				'ROME',		'',		'M11-39',							'M11-39',							'OLD_TANK',				NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_M13_40',				'ROME',		'',		'M13-40',							'M13-40',							'TANK',					NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_M14_41',				'ROME',		'',		'M14-41',							'M14-41',							'TANK_C',				NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_M15_42',				'ROME',		'',		'M15-42',							'M15-42',							'TANK_E',				NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_P26_40',				'ROME',		'',		'P26-40',							'P26-40',							'HEAVY_TANK_B',			NULL,	NULL,	0.125,	-2,		NULL,	-25,	NULL,	NULL,	NULL,	-5,		NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

SELECT	'TANK_TYPE95',				'JAPAN',	'',		'Type95 Ha-Go',						'Type95_Ha-Go',						'LIGHT_TANK',			NULL,	NULL,	0.11,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_TYPE4_KE_NU',			'JAPAN',	'',		'Type4 Ke-Nu',						'Type4_Ke-Nu',						'LIGHT_TANK_2',			NULL,	NULL,	0.11,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_TYPE97',				'JAPAN',	'',		'Type97 Chi-Ha',					'Type97_Chi-Ha',					'TANK',					NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_TYPE97_SHINHOTO',		'JAPAN',	'',		'Type97 Shinhoto Chi-Ha',			'Type97_Shinhoto_Chi-Ha',			'TANK_B',				NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_TYPE1_CHI_HE',		'JAPAN',	'',		'Type1 Chi-He',						'Type1_Chi-He',						'TANK_2',				NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_TYPE3_CHI_NU',		'JAPAN',	'',		'Type3 Chi-Nu',						'Type3_Chi-Nu',						'TANK_2_B',				NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_TYPE4_CHI_TO',		'JAPAN',	'',		'Type4 Chi-To',						'Type4_Chi-To',						'HEAVY_TANK',			NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_TYPE5_CHI_RI',		'JAPAN',	'',		'Type5 Chi-Ri',						'Type5_Chi-Ri',						'HEAVY_TANK_B',			NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

SELECT	'TANK_CIV4',				NULL,		'',		'MediumTank Generic',				'MediumTank_Generic',				'TANK',					NULL,	NULL,	0.11,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_VICKERS_MKE_A',		NULL,		'',		'Vickers MK E TypeA',				'Vickers_MK_E_TypeA',				'OLD_LIGHT_TANK',		NULL,	NULL,	0.11,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_7TP',					'POLAND',	'',		'7TP',								'7TP',								'LIGHT_TANK',			NULL,	NULL,	0.11,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_10TP',				'POLAND', 	'',		'10TP',								'10TP',								'TANK',					NULL,	NULL,	0.11,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_38M_TOLDI_I',			NULL,		'',		'38M Toldi I',						'38M_Toldi_I',						'LIGHT_TANK',			NULL,	NULL,	0.11,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'TANK_40M_TURAN_I',			NULL,		'',		'40M Turan I',						'40M_Turan_I',						'TANK',					NULL,	NULL,	0.11,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

--		Key Name								Variation									Model file													Figures			Scale			RangedCombat	Move			Range			Personnel		IconIndex							FlagAtlas							Embarked 
--									Nation Name			Unit Name																Template Unit					Formation		Combat			Cost			Immobile		Materiel		FlagIndex		IconAtlas									SV Icon

SELECT	'ASSAULT_GUN_KV2',			'RUSSIA',	'',		'KV-2',								'KV-2',								'OLD_HEAVY_ASSAULT_GUN',NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'ASSAULT_GUN_SAU40',		'FRANCE',	'',		'Somua SAU-40',						'Somua_SAU-40',						'ASSAULT_GUN_2',		NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

--		Key Name								Variation									Model file													Figures			Scale			RangedCombat	Move			Range			Personnel		IconIndex						FlagAtlas							Embarked 
--									Nation Name			Unit Name																Template Unit					Formation		Combat			Cost			Immobile		Materiel		FlagIndex		IconAtlas									SV Icon

SELECT	'FIGHTER_P36',				'AMERICA',	'',		'P-36 Hawk',						'P-36_Hawk',						'FIGHTER',				NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'FIGHTER_P40',				'AMERICA',	'',		'P-40 Warhawk',						'P-40_Warhawk',						'FIGHTER_2',			NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'FIGHTER_P51',				'AMERICA',	'',		'P-51 Mustang',						'P-51_Mustang',						'FIGHTER_3',			NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'FIGHTER_P38',				'AMERICA',	'',		'P-38 Lightning',					'P-38_Lightning',					'HEAVY_FIGHTER_2',		NULL,	NULL,	0.08,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'FIGHTER_F2A',				'AMERICA',	'',		'F2A Buffalo',						'F2A_Buffalo',						'OLD_NAVY_FIGHTER',		NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'FIGHTER_F4F',				'AMERICA',	'',		'F4F Wildcat',						'F4F_Wildcat',						'NAVY_FIGHTER',			NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'FIGHTER_F6F',				'AMERICA',	'',		'F6F Hellcat',						'F6F_Hellcat',						'NAVY_FIGHTER_2',		NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'FIGHTER_F4U',				'AMERICA',	'',		'F4U Corsair',						'F4U_Corsair',						'NAVY_FIGHTER_3',		NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

SELECT	'FIGHTER_P40N_CHINA',		'CHINA',	'',		'P-40 Warhawk China',				'P-40_Warhawk_China',				'FIGHTER_2',			NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

SELECT	'FIGHTER_HURRICANE',		'ENGLAND',	'',		'Hawker Hurricane MKI',				'Hawker_Hurricane_MK_I',			'FIGHTER_BOMBER',		NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'FIGHTER_HURRICANE_MKII',	'ENGLAND',	'',		'Hawker Hurricane MkII',			'Hawker_Hurricane_MK_II',			'FIGHTER_BOMBER_B',		NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'FIGHTER_SPITFIRE',			'ENGLAND',	'',		'Supermarine Spitfire MK II',		'Supermarine_Spitfire_MK_II',		'FIGHTER_B',			NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'FIGHTER_SPITFIRE_MKV',		'ENGLAND',	'',		'Supermarine Spitfire MK V',		'Supermarine_Spitfire_MK_V',		'FIGHTER_C',			NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'FIGHTER_SPITFIRE_MKIX',	'ENGLAND',	'',		'Supermarine Spitfire MK IX',		'Supermarine_Spitfire_MK_IX',		'FIGHTER_D',			NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'FIGHTER_WHIRLWIND',		'ENGLAND',	'',		'Westland Whirlwind',				'Westland_Whirlwind',				'HEAVY_FIGHTER',		NULL,	NULL,	0.08,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'FIGHTER_BEAUFIGHTER',		'ENGLAND',	'',		'Bristol Beaufighter',				'Bristol_Beaufighter',				'HEAVY_FIGHTER_2',		NULL,	NULL,	0.08,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

SELECT	'FIGHTER_MS406',			'FRANCE',	'',		'Morane-Saulnier M.S.406',			'Morane-Saulnier_M.S.406',			'FIGHTER',				NULL,	NULL,	NULL,	NULL,	-4,		NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'FIGHTER_MB152',			'FRANCE',	'',		'Bloch MB.152',						'Bloch_MB.152',						'FIGHTER_BOMBER',		NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'FIGHTER_HAWK75',			NULL,		'',		'Curtiss Hawk 75',					'Curtiss_Hawk_75',					'FIGHTER',				NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'FIGHTER_D520',				'FRANCE',	'',		'Dewoitine D.520',					'Dewoitine_D.520',					'FIGHTER_B',			NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'FIGHTER_D790',				'FRANCE',	'',		'Dewoitine D.790',					'Dewoitine_D.790',					'NAVY_FIGHTER_B',		NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'FIGHTER_POTEZ630',			'FRANCE',	'',		'Potez 630',						'Potez_630',						'HEAVY_FIGHTER',		NULL,	NULL,	0.08,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'FIGHTER_HURRICANE_FR',		NULL,		'',		'Hawker Hurricane',					'Hurricane_France',					'FIGHTER_BOMBER',		NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

SELECT	'FIGHTER_BF109',			'GERMANY',	'',		'Messerschmitt Bf-109E',			'Messerschmitt_Bf-109E',			'FIGHTER_B',			NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	11,		'WW2_UNIT_ICONS',		NULL,				NULL,			NULL	UNION ALL
SELECT	'FIGHTER_BF109_F',			'GERMANY',	'',		'Messerschmitt Bf-109F',			'Messerschmitt_Bf-109F',			'FIGHTER_C',			NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	11,		'WW2_UNIT_ICONS',		NULL,				NULL,			NULL	UNION ALL
SELECT	'FIGHTER_BF109_G',			'GERMANY',	'',		'Messerschmitt Bf-109G',			'Messerschmitt_Bf-109G',			'FIGHTER_D',			NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	11,		'WW2_UNIT_ICONS',		NULL,				NULL,			NULL	UNION ALL
SELECT	'FIGHTER_BF109_T',			'GERMANY',	'',		'Messerschmitt Bf-109T',			'Messerschmitt_Bf-109T',			'NAVY_FIGHTER_B',		NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	11,		'WW2_UNIT_ICONS',		NULL,				NULL,			NULL	UNION ALL
SELECT	'FIGHTER_FW190',			'GERMANY',	'',		'Focke-Wulf Fw-190',				'Focke-Wulf_Fw-190',				'FIGHTER_BOMBER_2_B',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'FIGHTER_BF110',			'GERMANY',	'',		'Messerschmitt Bf-110',				'Messerschmitt_Bf-110',				'HEAVY_FIGHTER',		NULL,	NULL,	0.08,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'FIGHTER_BF110_F4',			'GERMANY',	'',		'Messerschmitt Bf-110F4',			'Messerschmitt_Bf-110F4',			'HEAVY_FIGHTER_B',		NULL,	NULL,	0.08,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'FIGHTER_JU88C',			'GERMANY',	'',		'Junkers Ju-88C',					'Junkers_Ju-88C',					'HEAVY_FIGHTER_2',		NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'FIGHTER_HE219',			'GERMANY',	'',		'Heinkel He-219 Uhu',				'Heinkel_He-219_Uhu',				'HEAVY_FIGHTER_3',		NULL,	NULL,	0.08,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

--		Key Name								Variation									Model file													Figures			Scale			RangedCombat	Move			Range			Personnel		IconIndex						FlagAtlas							Embarked 
--									Nation Name			Unit Name																Template Unit					Formation		Combat			Cost			Immobile		Materiel		FlagIndex		IconAtlas									SV Icon

SELECT	'FIGHTER_P24',				'GREECE',	'',		'PZL P.24',							'PZL_P.24',							'OLD_FIGHTER',			NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'FIGHTER_SPITFIRE_GREECE',	'GREECE',	'',		'Supermarine Spitfire Greece',		'Supermarine_Spitfire_Greece',		'FIGHTER',				NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

SELECT	'FIGHTER_A5M',				'JAPAN',	'',		'Mitsubishi A5M Claude',			'Mitsubishi_A5M_Claude',			'OLD_NAVY_FIGHTER',		NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'FIGHTER_A6M2_ZERO',		'JAPAN',	'',		'Mitsubishi A6M2 Zero',				'Mitsubishi_A6M2_Zero',				'NAVY_FIGHTER_B',		NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'FIGHTER_A6M5_ZERO',		'JAPAN',	'',		'Mitsubishi A6M5 Zero',				'Mitsubishi_A6M5_Zero',				'NAVY_FIGHTER_C',		NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'FIGHTER_A7M',				'JAPAN',	'',		'Mitsubishi A7M Reppu',				'Mitsubishi_A7M_Reppu',				'NAVY_FIGHTER_2',		NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

SELECT	'FIGHTER_CR42',				'ROME',		'',		'Fiat CR.42 Falco',					'Fiat_CR.42_Falco',					'OLD_FIGHTER',			NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'FIGHTER_G50',				'ROME',		'',		'Fiat G.50 Freccia',				'Fiat_G.50_Freccia',				'FIGHTER',				NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'FIGHTER_C202_FOLGORE',		'ROME',		'',		'Macchi C.202 Folgore',				'Macchi_C.202_Folgore',				'FIGHTER_2',			NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'FIGHTER_G55',				'ROME',		'',		'Fiat G.55 Centauro',				'Fiat_G.55_Centauro',				'FIGHTER_3',			NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

SELECT	'FIGHTER_I16',				'RUSSIA',	'',		'Polikarpov I-16',					'Polikarpov_I-16',					'OLD_FIGHTER',			NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'FIGHTER_LAGG3',			'RUSSIA',	'',		'Lavochkin LaGG-3',					'Lavochkin_LaGG-3',					'FIGHTER',				NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'FIGHTER_LA5',				'RUSSIA',	'',		'Lavochkin La-5',					'Lavochkin_La-5',					'FIGHTER_B',			NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'FIGHTER_LA5_V2',			'RUSSIA',	'',		'Lavochkin La-5 FM',				'Lavochkin_La-5_v2',				'FIGHTER_C',			NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'FIGHTER_LA7',				'RUSSIA',	'',		'Lavochkin La-7',					'Lavochkin_La-7',					'FIGHTER_D',			NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'FIGHTER_YAK7',				'RUSSIA',	'',		'Yakovlev Yak-7',					'Yakovlev_Yak-7',					'FIGHTER_BOMBER_B',		NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'FIGHTER_YAK9',				'RUSSIA',	'',		'Yakovlev Yak-9',					'Yakovlev_Yak-9',					'FIGHTER_BOMBER_2_B',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

SELECT	'FIGHTER_CIV4',				NULL,		'',		'Fighter Generic',					'Fighter_Generic',					'FIGHTER',				NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'FIGHTER_LAGG3_EGYPT',		NULL,		'',		'Fighter LaGG-3',					'Fighter_LaGG-3',					'FIGHTER',				NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'FIGHTER_BF109_SPAIN',		NULL,		'',		'Messerschmitt Bf-109J',			'Messerschmitt_Bf-109J',			'FIGHTER',				NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'FIGHTER_P11',				NULL,		'',		'PZL P.11',							'PZL_P.11',							'OLD_FIGHTER',			NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

--		Key Name								Variation									Model file													Figures			Scale			RangedCombat	Move			Range			Personnel		IconIndex						FlagAtlas							Embarked 
--									Nation Name			Unit Name																Template Unit					Formation		Combat			Cost			Immobile		Materiel		FlagIndex		IconAtlas									SV Icon

SELECT	'BOMBER_B25MITCHELL',		'AMERICA',	'',		'B-25 Mitchell',					'B-25_Mitchell',					'BOMBER',				NULL,	NULL,	0.09,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'BOMBER_B17',				'AMERICA',	'',		'B-17 Fortress',					'U_American_B17',					'HEAVY_BOMBER',			NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'BOMBER_B24',				'AMERICA',	'',		'B-24 Liberator',					'B-24_Liberator',					'HEAVY_BOMBER_2',		NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

SELECT	'BOMBER_B25_CHINA',			'CHINA',	'',		'B-25 Mitchell China',				'B-25_Mitchell_China',				'BOMBER',				NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

SELECT	'BOMBER_LANCASTER',			'ENGLAND',	'',		'Avro Lancaster',					'Avro_Lancaster',					'HEAVY_BOMBER_2',		NULL,	NULL,	0.11,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'BOMBER_MOSQUITO',			'ENGLAND',	'',		'De Havilland Mosquito',			'De_Havilland_Mosquito',			'FAST_BOMBER_2',		NULL,	NULL,	0.09,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'BOMBER_WELLINGTON',		'ENGLAND',	'',		'Vickers Wellington',				'Vickers_Wellington',				'BOMBER',				NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	13,		'WW2_UNIT_ICONS',		NULL,				NULL,			NULL	UNION ALL
SELECT	'BOMBER_HALIFAX',			'ENGLAND',	'',		'HP Halifax',						'HP_Halifax',						'HEAVY_BOMBER',			NULL,	NULL,	0.11,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

SELECT	'BOMBER_LN401',				'FRANCE',	'',		'Loire-Nieuport LN.401',			'Loire-Nieuport_LN.401',			'ATTACK_AIRCRAFT',		NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'BOMBER_AMIOT350',			'FRANCE',	'',		'Amiot 350',						'Amiot_350',						'FAST_BOMBER',			NULL,	NULL,	0.085,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'BOMBER_BR690',				'FRANCE',	'',		'Breguet 690',						'Breguet_690',						'LIGHT_BOMBER',			NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'BOMBER_BR810',				'FRANCE',	'',		'Breguet 810',						'Breguet_810',						'NAVY_LIGHT_BOMBER',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

SELECT	'BOMBER_JU87',				'GERMANY',	'',		'Junkers Ju-87 Stuka',				'Junkers_Ju-87_Stuka',				'ATTACK_AIRCRAFT',		NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'BOMBER_JU87T',				'GERMANY',	'',		'Junkers Ju-87T Stuka',				'Junkers_Ju-87T_Stuka',				'NAVY_BOMBER',			NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'BOMBER_JU88',				'GERMANY',	'',		'Junkers Ju-88',					'Junkers_Ju-88',					'FAST_BOMBER',			NULL,	NULL,	0.07,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'BOMBER_HE111',				'GERMANY',	'',		'Heinkel He-111',					'Heinkel_He-111',					'BOMBER',				NULL,	NULL,	0.085,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'BOMBER_HE177',				'GERMANY',	'',		'Heinkel He-177 Greif',				'Heinkel_He-177_Greif',				'HEAVY_BOMBER',			NULL,	NULL,	0.11,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

SELECT	'BOMBER_FAIREY',			'GREECE',	'',		'Fairey Battle',					'Fairey_Battle',					'ATTACK_AIRCRAFT',		NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'BOMBER_BLENHEIM_GREECE',	'GREECE',	'',		'Bristol Blenheim',					'Bristol_Blenheim',					'BOMBER',				NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

SELECT	'BOMBER_AICHI',				'JAPAN',	'',		'Aichi D3A Val',					'Aichi_D3A_Val',					'ATTACK_AIRCRAFT',		NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'BOMBER_G4M3',				'JAPAN',	'',		'Mitsubishi G4M Betty',				'Mitsubishi_G4M_Betty',				'FAST_BOMBER',			NULL,	NULL,	0.075,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'BOMBER_KI21',				'JAPAN',	'',		'Mitsubishi Ki-21 Sally',			'Mitsubishi_Ki-21_Sally',			'BOMBER',				NULL,	NULL,	0.09,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

SELECT	'BOMBER_BA65',				'ROME',		'',		'Breda Ba.65',						'Breda_Ba.65',						'ATTACK_AIRCRAFT',		NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'BOMBER_SM79',				'ROME',		'',		'Savoia-Marchetti SM.79 Sparviero',	'Savoia-Marchetti_SM.79_Sparviero',	'FAST_BOMBER',			NULL,	NULL,	0.09,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'BOMBER_SM84',				'ROME',		'',		'Savoia-Marchetti SM.84',			'Savoia-Marchetti_SM.84',			'BOMBER',				NULL,	NULL,	0.09,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

SELECT	'BOMBER_IL2',				'RUSSIA',	'',		'Ilyushin IL-2 Shturmovik',			'Ilyushin_IL-2_Shturmovik',			'ATTACK_AIRCRAFT',		NULL,	NULL,	NULL,	NULL,	10,		NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'BOMBER_PE2',				'RUSSIA',	'',		'Petlyakov Pe-2',					'Petlyakov_Pe-2',					'FAST_BOMBER',			NULL,	NULL,	0.08,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'BOMBER_TU2',				'RUSSIA',	'',		'Tupolev Tu-2',						'Tupolev_Tu-2',						'FAST_BOMBER_2',		NULL,	NULL,	0.08,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'BOMBER_IL4',				'RUSSIA',	'',		'Ilyushin IL-4',					'Ilyushin_IL-4',					'BOMBER',				NULL,	NULL,	0.09,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'BOMBER_TB3',				'RUSSIA',	'',		'Tupolev TB-3',						'Tupolev_TB-3',						'OLD_HEAVY_BOMBER',		NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'BOMBER_PE8',				'RUSSIA',	'',		'Petlyakov Pe-8',					'Petlyakov_Pe-8',					'HEAVY_BOMBER',			NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

SELECT	'BOMBER_B24_EGYPT',			NULL,		'',		'Bomber B-24 Egypt',				'Bomber_B-24_Egypt',				'BOMBER',				NULL,	NULL,	0.11,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'BOMBER_PZL37',				NULL,		'',		'PZL P.37 Los',						'PZL_P.37_Los',						'FAST_BOMBER',			NULL,	NULL,	0.09,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'BOMBER_CIV4',				NULL,		'',		'Bomber Generic',					'Bomber_Generic',					'BOMBER',				NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'BOMBER_JU88_SPAIN',		NULL,		'',		'Bomber Ju-88 Spain',				'Bomber_Ju-88_Spain',				'FAST_BOMBER',			NULL,	NULL,	0.09,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

--		Key Name								Variation									Model file													Figures			Scale			RangedCombat	Move			Range			Personnel		IconIndex						FlagAtlas							Embarked 
--									Nation Name			Unit Name																Template Unit					Formation		Combat			Cost			Immobile		Materiel		FlagIndex		IconAtlas									SV Icon

SELECT	'DESTROYER_FLETCHER',		'AMERICA',	'',		'Fletcher Class',					'Fletcher_Class',					'DESTROYER',			NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'DESTROYER_TRIBA',			'ENGLAND',	'',		'Triba Class',						'Triba_Class',						'DESTROYER',			NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'DESTROYER_FANTASQUE',		'FRANCE',	'',		'Fantasque Class',					'Fantasque_Class',					'DESTROYER',			NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'DESTROYER_TYPE_1934A',		'GERMANY',	'',		'Z Class',							'Z_Class',							'DESTROYER',			NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'DESTROYER_GEORGIOS',		'GREECE',	'',		'Vasilefs Georgios Class',			'Vasilefs_Georgios_Class',			'DESTROYER',			NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'DESTROYER_KAGERO',			'JAPAN',	'',		'Kagero Class',						'Kagero_Class',						'DESTROYER',			NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'DESTROYER_SOLDATI',		'ROME',		'',		'Soldati Class',					'Soldati_Class',					'DESTROYER',			NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'DESTROYER_GNEVNY',			'RUSSIA',	'',		'Gnevny Class',						'Gnevny_Class',						'DESTROYER',			NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

--		Key Name								Variation									Model file													Figures			Scale			RangedCombat	Move			Range			Personnel		IconIndex						FlagAtlas							Embarked 
--									Nation Name			Unit Name																Template Unit					Formation		Combat			Cost			Immobile		Materiel		FlagIndex		IconAtlas									SV Icon

SELECT	'CRUISER_BALTIMORE',		'AMERICA',	'',		'Baltimore Class',					'Baltimore_Class',					'CRUISER',				NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'CRUISER_DIDO',				'ENGLAND',	'',		'Dido Class',						'Dido_Class',						'CRUISER',				NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'CRUISER_GALISSONIERE',		'FRANCE',	'',		'La Galissonniere Class',			'La_Galissonniere_Class',			'CRUISER',				NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'CRUISER_LEIPZIG',			'GERMANY',	'',		'Leipzig Class',					'Leipzig_Class',					'CRUISER',				NULL,	NULL,	0.12,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'CRUISER_PISA',				'GREECE',	'',		'Pisa Class',						'Pisa_Class',						'DREADNOUGHT',			NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'CRUISER_TAKAO',			'JAPAN',	'',		'Takao Class',						'Takao_Class',						'CRUISER',				NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'CRUISER_KIROV',			'RUSSIA',	'',		'Kirov Class',						'Kirov_Class',						'CRUISER',				NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

SELECT	'HEAVY_CRUISER_DEUTSCHLAND','GERMANY',	'',		'Deutschland Class',				'Deutschland_Class',				'HEAVY_CRUISER',		NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'HEAVY_CRUISER_ZARA',		'ROME',		'',		'Zara Class',						'Zara_Class',						'HEAVY_CRUISER',		NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

SELECT	'DREADNOUGHT_ELIZABETH',	'ENGLAND',	'',		'Queen Elizabeth Class',			'Queen_Elizabeth_Class',			'DREADNOUGHT',			NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'DREADNOUGHT_DI_CAVOUR',	'ROME',		'',		'Conte Di Cavour Class',			'Conte_Di_Cavour_Class',			'DREADNOUGHT',			NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'DREADNOUGHT_GANGUT',		'RUSSIA',	'',		'Gangut Class',						'Gangut_Class',						'DREADNOUGHT',			NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

--		Key Name								Variation									Model file													Figures			Scale			RangedCombat	Move			Range			Personnel		IconIndex						FlagAtlas							Embarked 
--									Nation Name			Unit Name																Template Unit					Formation		Combat			Cost			Immobile		Materiel		FlagIndex		IconAtlas									SV Icon

SELECT	'BATTLESHIP_SOUTH_DAKOTA',	'AMERICA',	'',		'South Dakota Class',				'South_Dakota_Class',				'BATTLESHIP',			NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'BATTLESHIP_IOWA',			'AMERICA',	'',		'Iowa Class',						'Iowa_Class',						'BATTLESHIP_2',			NULL,	NULL,	0.11,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

SELECT	'BATTLESHIP_ADMIRAL',		'ENGLAND',	'',		'Admiral Class',					'Admiral_Class',					'BATTLESHIP',			NULL,	NULL,	0.095,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'BATTLESHIP_GEORGE_V',		'ENGLAND',	'',		'King George V Class',				'King_George_V_Class',				'BATTLESHIP_2',			NULL,	NULL,	0.11,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

SELECT	'BATTLESHIP_DUNKERQUE',		'FRANCE',	'',		'Dunkerque Class',					'Dunkerque_Class',					'BATTLESHIP',			NULL,	NULL,	0.095,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'BATTLESHIP_RICHELIEU',		'FRANCE',	'',		'Richelieu Class',					'Richelieu_Class',					'BATTLESHIP_2',			NULL,	NULL,	0.11,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

SELECT	'BATTLESHIP_SCHARNHORST',	'GERMANY',	'',		'Scharnhorst Class',				'Scharnhorst_Class',				'BATTLESHIP',			NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'BATTLESHIP_BISMARK',		'GERMANY',	'',		'Bismark Class',					'Bismark_Class',					'BATTLESHIP_2',			NULL,	NULL,	0.11,	5,		5,		NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

SELECT	'BATTLESHIP_KONGO',			'JAPAN',	'',		'Kongo Class',						'Kongo_Class',						'BATTLESHIP',			NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'BATTLESHIP_YAMOTO',		'JAPAN',	'',		'Yamato Class',						'Yamato_Class',						'BATTLESHIP_2',			NULL,	NULL,	0.11,	10,		5,		NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

SELECT	'BATTLESHIP_LITTORIO',		'ROME',		'',		'Littorio Class',					'Littorio_Class',					'BATTLESHIP',			NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

SELECT	'BATTLESHIP_SOYUZ',			'RUSSIA',	'',		'Sovetsky Soyuz Class',				'Sovetsky_Soyuz_Class',				'BATTLESHIP',			NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

--		Key Name								Variation									Model file													Figures			Scale			RangedCombat	Move			Range			Personnel		IconIndex						FlagAtlas							Embarked 
--									Nation Name			Unit Name																Template Unit					Formation		Combat			Cost			Immobile		Materiel		FlagIndex		IconAtlas									SV Icon

SELECT	'SUBMARINE_GATO',			'AMERICA',	'',		'Gato Class',						'Gato_Class',						'SUBMARINE',			NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'SUBMARINE_TCLASS',			'ENGLAND',	'',		'T Class',							'T_Class',							'SUBMARINE',			NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'SUBMARINE_REDOUTABLE',		'FRANCE',	'',		'Redoutable Class',					'Redoutable_Class',					'SUBMARINE',			NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'SUBMARINE_U_BOAT',			'GERMANY',	'',		'U-Boat Type VII',					'U-Boat_Type_VII',					'SUBMARINE',			NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'SUBMARINE_KATSONIS',		'GREECE',	'',		'Katsonis Class',					'Katsonis_Class',					'SUBMARINE',			NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'SUBMARINE_B1',				'JAPAN',	'',		'B1 Type',							'B1_Type',							'SUBMARINE',			NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'SUBMARINE_MARCELLO',		'ROME',		'',		'Marcello Class',					'Marcello_Class',					'SUBMARINE',			NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'SUBMARINE_SHCHUKA',		'RUSSIA',	'',		'Shchuka Class',					'Shchuka_Class',					'SUBMARINE',			NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

SELECT	'SUBMARINE_ORZEL',			NULL,		'',		'Orzel Class',						'Orzel_Class',						'SUBMARINE',			NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL

SELECT	'CARRIER_YORKTOWN',			'AMERICA',	'',		'Yorktown Class',					'Yorktown_Class',					'CARRIER',				NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL	UNION ALL
SELECT	'CARRIER_KAGA',				'JAPAN',	'',		'Kaga Class',						'Kaga_Class',						'CARRIER',				NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,					NULL,				NULL,			NULL;	--UNION ALL
																			 