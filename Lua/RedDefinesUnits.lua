-- RedDefinesUnits
-- Author: Gedemon
-- DateCreated: 5/6/2012 8:34:28 PM
--------------------------------------------------------------

-- transported types
TRANSPORT_MATERIEL = 1
TRANSPORT_PERSONNEL = 2
TRANSPORT_UNIT = 3
TRANSPORT_GOLD = 4
TRANSPORT_DEFAULT = 1 -- default type (1 = materiel...)
TRANSPORT_DEFAULT_REFERENCE = 250 -- default value

-- Units Type ID
-----------------

SETTLER				= GameInfo.Units.UNIT_SETTLER.ID
AIRFIELD			= GameInfo.Units.UNIT_AIRFIELD.ID

-- Infantries -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
INFANTRY				= GameInfo.Units.UNIT_INFANTRY.ID -- NumType for unit naming...
FR_INFANTRY				= GameInfo.Units.UNIT_FRENCH_INFANTRY.ID
FR_LEGION				= GameInfo.Units.UNIT_FRENCH_FOREIGNLEGION.ID
US_INFANTRY				= GameInfo.Units.UNIT_AMERICAN_INFANTRY.ID
US_MARINES				= GameInfo.Units.UNIT_AMERICAN_MARINES.ID
GE_INFANTRY				= GameInfo.Units.UNIT_GERMAN_INFANTRY.ID
GE_SS_INFANTRY			= GameInfo.Units.UNIT_GERMAN_SS_INFANTRY.ID
JP_INFANTRY				= GameInfo.Units.UNIT_JAPAN_INFANTRY.ID
UK_INFANTRY				= GameInfo.Units.UNIT_ENGLISH_INFANTRY.ID
IT_INFANTRY				= GameInfo.Units.UNIT_ITALIAN_INFANTRY.ID
RU_INFANTRY				= GameInfo.Units.UNIT_RUSSIAN_INFANTRY.ID
RU_NAVAL_INFANTRY		= GameInfo.Units.UNIT_RUSSIAN_NAVAL_INFANTRY.ID
CH_INFANTRY				= GameInfo.Units.UNIT_CHINESE_INFANTRY.ID
GR_INFANTRY				= GameInfo.Units.UNIT_GREEK_INFANTRY.ID
PL_INFANTRY				= GameInfo.Units.UNIT_POLAND_INFANTRY.ID
HU_INFANTRY				= GameInfo.Units.UNIT_HUNGARY_INFANTRY.ID

-- Mechanized Infantries ------------------------------------------------------------------------------------------------------------------------------------------------------------------------
MECHANIZED_INFANTRY 	= GameInfo.Units.UNIT_MECHANIZED_INFANTRY.ID -- NumType for unit naming...
GE_MECH_INFANTRY 		= GameInfo.Units.UNIT_GERMAN_MECH_INFANTRY.ID
FR_MECH_INFANTRY 		= GameInfo.Units.UNIT_FRENCH_MECH_INFANTRY.ID
US_MECH_INFANTRY 		= GameInfo.Units.UNIT_AMERICAN_MECH_INFANTRY.ID
RU_MECH_INFANTRY 		= GameInfo.Units.UNIT_RUSSIAN_MECH_INFANTRY.ID
UK_MECH_INFANTRY 		= GameInfo.Units.UNIT_BRITISH_MECH_INFANTRY.ID

-- Paratrooper ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
PARATROOPER				= GameInfo.Units.UNIT_PARATROOPER.ID -- NumType for unit naming...
GE_PARATROOPER			= GameInfo.Units.UNIT_GERMAN_PARATROOPER.ID
FR_PARATROOPER			= GameInfo.Units.UNIT_FRENCH_PARATROOPER.ID
GR_PARATROOPER			= GameInfo.Units.UNIT_GREEK_PARATROOPER.ID
JP_PARATROOPER			= GameInfo.Units.UNIT_JAPAN_PARATROOPER.ID
IT_PARATROOPER			= GameInfo.Units.UNIT_ITALIAN_PARATROOPER.ID
CH_PARATROOPER			= GameInfo.Units.UNIT_CHINESE_PARATROOPER.ID
US_PARATROOPER			= GameInfo.Units.UNIT_AMERICAN_PARATROOPER.ID
RU_PARATROOPER			= GameInfo.Units.UNIT_RUSSIAN_PARATROOPER.ID
UK_PARATROOPER			= GameInfo.Units.UNIT_BRITISH_PARATROOPER.ID

-- Special Forces -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
SPECIAL_FORCES			= GameInfo.Units.UNIT_SPECIAL_FORCES.ID -- NumType for unit naming...
GE_SPECIAL_FORCES		= GameInfo.Units.UNIT_GERMAN_SPECIAL_FORCES.ID
FR_SPECIAL_FORCES		= GameInfo.Units.UNIT_FRENCH_SPECIAL_FORCES.ID
GR_SPECIAL_FORCES		= GameInfo.Units.UNIT_GREEK_SPECIAL_FORCES.ID
JP_SPECIAL_FORCES		= GameInfo.Units.UNIT_JAPAN_SPECIAL_FORCES.ID
IT_SPECIAL_FORCES		= GameInfo.Units.UNIT_ITALIAN_SPECIAL_FORCES.ID
CH_SPECIAL_FORCES		= GameInfo.Units.UNIT_CHINESE_SPECIAL_FORCES.ID
US_SPECIAL_FORCES		= GameInfo.Units.UNIT_AMERICAN_SPECIAL_FORCES.ID
RU_SPECIAL_FORCES		= GameInfo.Units.UNIT_RUSSIAN_SPECIAL_FORCES.ID
UK_SPECIAL_FORCES		= GameInfo.Units.UNIT_BRITISH_SPECIAL_FORCES.ID

-- TANKS ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
TANK					= GameInfo.Units.UNIT_TANK_CIV4.ID -- NumType for unit naming...
-- France
FR_AMR35				= GameInfo.Units.UNIT_TANK_AMR35.ID
FR_FCM36				= GameInfo.Units.UNIT_TANK_FCM36.ID
FR_R35					= GameInfo.Units.UNIT_TANK_R35.ID
FR_R35_BONUS			= GameInfo.Units.UNIT_TANK_R35_BONUS.ID
FR_R40					= GameInfo.Units.UNIT_TANK_R40.ID
FR_H35					= GameInfo.Units.UNIT_TANK_H35.ID
FR_H39					= GameInfo.Units.UNIT_TANK_H39.ID
FR_AMC35				= GameInfo.Units.UNIT_TANK_AMC35.ID
FR_CHAR_D1				= GameInfo.Units.UNIT_TANK_CHAR_D1.ID
FR_CHAR_D2				= GameInfo.Units.UNIT_TANK_CHAR_D2.ID
FR_S35					= GameInfo.Units.UNIT_TANK_S35.ID
FR_B1					= GameInfo.Units.UNIT_TANK_B1.ID
FR_ARL44				= GameInfo.Units.UNIT_TANK_ARL44.ID 
FR_CHAR_2C				= GameInfo.Units.UNIT_TANK_CHAR_2C.ID
-- Italy
IT_L6_40				= GameInfo.Units.UNIT_TANK_L6_40.ID
IT_M11_39				= GameInfo.Units.UNIT_TANK_M11_39.ID
IT_M13_40				= GameInfo.Units.UNIT_TANK_M13_40.ID
IT_M14_41				= GameInfo.Units.UNIT_TANK_M14_41.ID
IT_M15_42				= GameInfo.Units.UNIT_TANK_M15_42.ID
IT_P26_40				= GameInfo.Units.UNIT_TANK_P26_40.ID
-- USSR
RU_BT2					= GameInfo.Units.UNIT_TANK_BT2.ID
RU_BT7					= GameInfo.Units.UNIT_TANK_BT7.ID
RU_T26					= GameInfo.Units.UNIT_TANK_T26.ID
RU_T28					= GameInfo.Units.UNIT_TANK_T28.ID
RU_T34					= GameInfo.Units.UNIT_TANK_T34.ID
RU_T34_76				= GameInfo.Units.UNIT_TANK_T34_76.ID
RU_T34_85				= GameInfo.Units.UNIT_TANK_T34_85.ID
RU_KV1					= GameInfo.Units.UNIT_TANK_KV1.ID
RU_IS_1					= GameInfo.Units.UNIT_TANK_IS_1.ID
RU_IS_2					= GameInfo.Units.UNIT_TANK_IS_2.ID
-- U.K.
UK_CRUISER_I			= GameInfo.Units.UNIT_TANK_CRUISER_MKI.ID
UK_CRUISER_II			= GameInfo.Units.UNIT_TANK_CRUISER_MKII.ID
UK_CRUISER_III			= GameInfo.Units.UNIT_TANK_CRUISER_MKIII.ID
UK_CRUISER_IV			= GameInfo.Units.UNIT_TANK_CRUISER_MKIV.ID
UK_A10_VALENTINE		= GameInfo.Units.UNIT_TANK_VALENTINE.ID
UK_A13_COVENANTER		= GameInfo.Units.UNIT_TANK_A13_MKIII.ID
UK_A15_CRUSADER			= GameInfo.Units.UNIT_TANK_A15_CRUSADER.ID
UK_A15_CRUSADER_MKIII	= GameInfo.Units.UNIT_TANK_A15_CRUSADER_MKIII.ID
UK_VICKERS_MK6B			= GameInfo.Units.UNIT_TANK_VICKERS_MKVIB.ID
UK_TETRARCH				= GameInfo.Units.UNIT_TANK_TETRARCH.ID
UK_MATILDA_I			= GameInfo.Units.UNIT_TANK_MATILDA_I.ID
UK_M3_GRANT				= GameInfo.Units.UNIT_TANK_M3_GRANT.ID
UK_MATILDA_II			= GameInfo.Units.UNIT_TANK_MATILDA_II.ID
UK_M4_FIREFLY			= GameInfo.Units.UNIT_TANK_M4_FIREFLY.ID
UK_CHURCHILL			= GameInfo.Units.UNIT_TANK_CHURCHILL.ID
-- Germany
GE_PANZER_I				= GameInfo.Units.UNIT_TANK_PANZER_I.ID
GE_PANZER_35			= GameInfo.Units.UNIT_TANK_PANZER_35.ID
GE_PANZER_38			= GameInfo.Units.UNIT_TANK_PANZER_38.ID
GE_PANZER_II			= GameInfo.Units.UNIT_TANK_PANZER_II.ID
GE_PANZER_II_L			= GameInfo.Units.UNIT_TANK_PANZER_II_L.ID
GE_PANZER_III			= GameInfo.Units.UNIT_TANK_PANZER_III.ID
GE_PANZER_III_J			= GameInfo.Units.UNIT_TANK_PANZER_III_J.ID
GE_PANZER_IV			= GameInfo.Units.UNIT_TANK_PANZER_IV.ID
GE_PANZER_IV_G			= GameInfo.Units.UNIT_TANK_PANZER_IV_G.ID
GE_PANZER_IV_H			= GameInfo.Units.UNIT_TANK_PANZER_IV_H.ID
GE_PANZER_V				= GameInfo.Units.UNIT_TANK_PANZER_V_PANTHER.ID
GE_PANZER_VI			= GameInfo.Units.UNIT_TANK_PANZER_VI_TIGER.ID
GE_PANZER_VIB			= GameInfo.Units.UNIT_TANK_PANZER_VIB_TIGER_II.ID
GE_PANZER_VIII			= GameInfo.Units.UNIT_TANK_PANZER_VIII_MAUS.ID
-- Greece
GR_VICKERS_MKE			= GameInfo.Units.UNIT_TANK_VICKERS_MKE_GREECE.ID
GR_VICKERS_MKII			= GameInfo.Units.UNIT_TANK_VICKERS_MKII_GREECE.ID
-- Poland
PL_VICKERS_MKE_A		= GameInfo.Units.UNIT_TANK_VICKERS_MKE_A.ID
PL_7TP					= GameInfo.Units.UNIT_TANK_7TP.ID
PL_10TP					= GameInfo.Units.UNIT_TANK_10TP.ID
-- U.S.A.
US_M3STUART				= GameInfo.Units.UNIT_TANK_M3_STUART.ID
US_M5STUART				= GameInfo.Units.UNIT_TANK_M5_STUART.ID
US_M24CHAFFEE			= GameInfo.Units.UNIT_TANK_M24_CHAFFEE.ID
US_M3GRANT				= GameInfo.Units.UNIT_TANK_M3_GRANT.ID
US_SHERMAN				= GameInfo.Units.UNIT_TANK_SHERMAN.ID
US_SHERMAN_IIA			= GameInfo.Units.UNIT_TANK_SHERMAN_IIA.ID
US_SHERMAN_III			= GameInfo.Units.UNIT_TANK_SHERMAN_III.ID
US_SHERMAN_IIIA			= GameInfo.Units.UNIT_TANK_SHERMAN_IIIA.ID
US_SHERMAN_IV			= GameInfo.Units.UNIT_TANK_SHERMAN_IV.ID
US_SHERMAN_JUMBO		= GameInfo.Units.UNIT_TANK_SHERMAN_JUMBO.ID
US_SHERMAN_EASYEIGHT	= GameInfo.Units.UNIT_TANK_SHERMAN_EASYEIGHT.ID
US_M26_PERSHING			= GameInfo.Units.UNIT_TANK_M26_PERSHING.ID
-- Japan
JP_TYPE95				= GameInfo.Units.UNIT_TANK_TYPE95.ID
JP_TYPE97_SHINHORO		= GameInfo.Units.UNIT_TANK_TYPE97_SHINHOTO.ID
JP_TYPE97				= GameInfo.Units.UNIT_TANK_TYPE97.ID
JP_TYPE4				= GameInfo.Units.UNIT_TANK_TYPE4_KE_NU.ID
JP_TYPE1				= GameInfo.Units.UNIT_TANK_TYPE1_CHI_HE.ID
JP_TYPE3				= GameInfo.Units.UNIT_TANK_TYPE3_CHI_NU.ID
JP_TYPE4_CHI_TO			= GameInfo.Units.UNIT_TANK_TYPE4_CHI_TO.ID
JP_TYPE5				= GameInfo.Units.UNIT_TANK_TYPE5_CHI_RI.ID
-- China
CH_T26B					= GameInfo.Units.UNIT_TANK_T26B.ID
-- Hungary
HU_38M_TOLDI			= GameInfo.Units.UNIT_TANK_38M_TOLDI_I.ID
HU_40M_TURAN			= GameInfo.Units.UNIT_TANK_40M_TURAN_I.ID

-- Assault Guns ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
RU_KV2					= GameInfo.Units.UNIT_ASSAULT_GUN_KV2.ID
FR_SAU40				= GameInfo.Units.UNIT_ASSAULT_GUN_SAU40.ID
GE_STUG_III				= GameInfo.Units.UNIT_ASSAULT_GUN_STUG_III.ID
GE_STUG_III_F			= GameInfo.Units.UNIT_ASSAULT_GUN_STUG_III_F.ID
GE_STUG_III_G			= GameInfo.Units.UNIT_ASSAULT_GUN_STUG_III_G.ID
GE_STUG_IV				= GameInfo.Units.UNIT_ASSAULT_GUN_STUG_IV.ID

-- Tank Destroyer -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
FR_W15_TCC				= GameInfo.Units.UNIT_TANK_DESTROYER_W15_TCC.ID
FR_AMR35_ZT3			= GameInfo.Units.UNIT_TANK_DESTROYER_AMR35_ZT3.ID
FR_37L					= GameInfo.Units.UNIT_TANK_DESTROYER_37L.ID
GE_PZJAGER_I			= GameInfo.Units.UNIT_TANK_DESTROYER_PZJ_I.ID
GE_MARDER_II			= GameInfo.Units.UNIT_TANK_DESTROYER_MARDER_II.ID
GE_MARDER_III			= GameInfo.Units.UNIT_TANK_DESTROYER_MARDER_III.ID

-- Artilleries ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
ARTILLERY				= GameInfo.Units.UNIT_ARTILLERY.ID
AT_GUN					= GameInfo.Units.UNIT_FIELD_GUN.ID
AA_GUN					= GameInfo.Units.UNIT_ANTI_AIRCRAFT_GUN.ID
-- Mobile Artilleries ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
FR_MOBILE_AA_GUN		= GameInfo.Units.UNIT_MOBILE_AA_GUN_HOTCHKISS.ID
GE_MOBILE_AA_GUN		= GameInfo.Units.UNIT_MOBILE_AA_GUN_FLK_PZI.ID

-- FIGHTERS -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
FIGHTER					= GameInfo.Units.UNIT_FIGHTER_CIV4.ID -- NumType for unit naming...
-- Fighters -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
FR_MS406				= GameInfo.Units.UNIT_FIGHTER_MS406.ID
FR_HAWK75				= GameInfo.Units.UNIT_FIGHTER_HAWK75.ID
FR_P40					= GameInfo.Units.UNIT_FIGHTER_P40_FRANCE.ID
FR_MB152				= GameInfo.Units.UNIT_FIGHTER_MB152.ID
FR_D520					= GameInfo.Units.UNIT_FIGHTER_D520.ID
FR_D790					= GameInfo.Units.UNIT_FIGHTER_D790.ID
FR_HURRICANE			= GameInfo.Units.UNIT_FIGHTER_HURRICANE_FR.ID
IT_CR42					= GameInfo.Units.UNIT_FIGHTER_CR42.ID
IT_G50					= GameInfo.Units.UNIT_FIGHTER_G50.ID
IT_C202					= GameInfo.Units.UNIT_FIGHTER_C202.ID
IT_G55					= GameInfo.Units.UNIT_FIGHTER_G55.ID
RU_I16					= GameInfo.Units.UNIT_FIGHTER_I16.ID
RU_LAGG3				= GameInfo.Units.UNIT_FIGHTER_LAGG3.ID
RU_LA5					= GameInfo.Units.UNIT_FIGHTER_LA5.ID
RU_LA5_V2				= GameInfo.Units.UNIT_FIGHTER_LA5_V2.ID
RU_LA7					= GameInfo.Units.UNIT_FIGHTER_LA7.ID
RU_YAK_7				= GameInfo.Units.UNIT_FIGHTER_YAK7.ID
UK_SPITFIRE				= GameInfo.Units.UNIT_FIGHTER_SPITFIRE.ID
UK_SPITFIRE_V			= GameInfo.Units.UNIT_FIGHTER_SPITFIRE_MKV.ID
UK_SPITFIRE_IX			= GameInfo.Units.UNIT_FIGHTER_SPITFIRE_MKIX.ID
UK_HURRICANE			= GameInfo.Units.UNIT_FIGHTER_HURRICANE.ID
UK_HURRICANE_II			= GameInfo.Units.UNIT_FIGHTER_HURRICANE_MKII.ID
GE_BF109				= GameInfo.Units.UNIT_FIGHTER_BF109.ID
GE_BF109_F				= GameInfo.Units.UNIT_FIGHTER_BF109_F.ID
GE_BF109_G				= GameInfo.Units.UNIT_FIGHTER_BF109_G.ID
GE_FW190				= GameInfo.Units.UNIT_FIGHTER_FW190.ID
US_P36					= GameInfo.Units.UNIT_FIGHTER_P36.ID
US_P40					= GameInfo.Units.UNIT_FIGHTER_P40.ID
US_P51					= GameInfo.Units.UNIT_FIGHTER_P51.ID
JP_A6M2					= GameInfo.Units.UNIT_FIGHTER_A6M2_ZERO.ID
CH_P40N					= GameInfo.Units.UNIT_FIGHTER_P40N_CHINA.ID
PL_P11					= GameInfo.Units.UNIT_FIGHTER_P11.ID
GR_P24					= GameInfo.Units.UNIT_FIGHTER_P24.ID
GR_SPITFIRE				= GameInfo.Units.UNIT_FIGHTER_SPITFIRE_GREECE.ID
-- Heavy Fighters -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
FR_POTEZ630				= GameInfo.Units.UNIT_FIGHTER_POTEZ630.ID
UK_WHIRLWIND			= GameInfo.Units.UNIT_FIGHTER_WHIRLWIND.ID
UK_BEAUFIGHTER			= GameInfo.Units.UNIT_FIGHTER_BEAUFIGHTER.ID
GE_BF110				= GameInfo.Units.UNIT_FIGHTER_BF110.ID
GE_BF110_F4				= GameInfo.Units.UNIT_FIGHTER_BF110_F4.ID
GE_JU88_C				= GameInfo.Units.UNIT_FIGHTER_JU88_C.ID
GE_HE219				= GameInfo.Units.UNIT_FIGHTER_HE219.ID
US_P38					= GameInfo.Units.UNIT_FIGHTER_P38.ID
						
-- BOMBERS --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
BOMBER					= GameInfo.Units.UNIT_BOMBER.ID -- NumType for unit naming...
-- Attack Aircrafts -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
FR_LN401				= GameInfo.Units.UNIT_BOMBER_LN401.ID
IT_BA65					= GameInfo.Units.UNIT_BOMBER_BA65.ID
GE_JU87					= GameInfo.Units.UNIT_BOMBER_JU87.ID
RU_IL2					= GameInfo.Units.UNIT_BOMBER_IL2.ID
JP_AICHI				= GameInfo.Units.UNIT_BOMBER_AICHI.ID
GR_FAIREY				= GameInfo.Units.UNIT_BOMBER_FAIREY.ID
-- Fast/Light Bombers ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
FR_AMIOT350				= GameInfo.Units.UNIT_BOMBER_AMIOT350.ID
FR_BR690				= GameInfo.Units.UNIT_BOMBER_BR690.ID
FR_BR810				= GameInfo.Units.UNIT_BOMBER_BR810.ID
UK_MOSQUITO				= GameInfo.Units.UNIT_BOMBER_MOSQUITO.ID
RU_PE2					= GameInfo.Units.UNIT_BOMBER_PE2.ID
RU_TU2					= GameInfo.Units.UNIT_BOMBER_TU2.ID
IT_SM79					= GameInfo.Units.UNIT_BOMBER_SM79.ID
GE_JU88					= GameInfo.Units.UNIT_BOMBER_JU88.ID
PL_PZL37				= GameInfo.Units.UNIT_BOMBER_PZL37.ID
-- Medium Bombers -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
IT_SM84					= GameInfo.Units.UNIT_BOMBER_SM84.ID
UK_WELLINGTON			= GameInfo.Units.UNIT_BOMBER_WELLINGTON.ID
GE_HE111				= GameInfo.Units.UNIT_BOMBER_HE111.ID
RU_IL4					= GameInfo.Units.UNIT_BOMBER_IL4.ID
JP_KI21					= GameInfo.Units.UNIT_BOMBER_KI21.ID
US_B25					= GameInfo.Units.UNIT_BOMBER_B25.ID
CH_B25					= GameInfo.Units.UNIT_BOMBER_B25_CHINA.ID
GR_BLENHEIM				= GameInfo.Units.UNIT_BOMBER_BLENHEIM_GREECE.ID
-- Heavy Bombers --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
RU_TB3					= GameInfo.Units.UNIT_BOMBER_TB3.ID
RU_PE8					= GameInfo.Units.UNIT_BOMBER_PE8.ID
GE_HE177				= GameInfo.Units.UNIT_BOMBER_HE177.ID
UK_HALIFAX				= GameInfo.Units.UNIT_BOMBER_HALIFAX.ID
UK_LANCASTER			= GameInfo.Units.UNIT_BOMBER_LANCASTER.ID
US_B17					= GameInfo.Units.UNIT_BOMBER_B17.ID
US_B24					= GameInfo.Units.UNIT_BOMBER_B24.ID
						
-- Convoy ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CONVOY					= GameInfo.Units.UNIT_CONVOY.ID
						
-- Destroyers -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
DESTROYER				= GameInfo.Units.UNIT_DESTROYER.ID -- NumType for unit naming...
FR_FANTASQUE			= GameInfo.Units.UNIT_DESTROYER_FANTASQUE.ID
GE_DESTROYER			= GameInfo.Units.UNIT_DESTROYER_TYPE_1934A.ID
UK_TRIBA				= GameInfo.Units.UNIT_DESTROYER_TRIBA.ID
RU_GNEVNY				= GameInfo.Units.UNIT_DESTROYER_GNEVNY.ID
IT_SOLDATI				= GameInfo.Units.UNIT_DESTROYER_SOLDATI.ID
US_FLETCHER				= GameInfo.Units.UNIT_DESTROYER_FLETCHER.ID
JP_KAGERO				= GameInfo.Units.UNIT_DESTROYER_KAGERO.ID
GR_GEORGIOS				= GameInfo.Units.UNIT_DESTROYER_GEORGIOS.ID
						
-- Cruisers -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CRUISER					= GameInfo.Units.UNIT_CRUISER.ID -- NumType for unit naming...
FR_GALISSONIERE			= GameInfo.Units.UNIT_CRUISER_GALISSONIERE.ID 
GE_LEIPZIG				= GameInfo.Units.UNIT_CRUISER_LEIPZIG.ID 
UK_DIDO					= GameInfo.Units.UNIT_CRUISER_DIDO.ID 
RU_KIROV				= GameInfo.Units.UNIT_CRUISER_KIROV.ID
US_BALTIMORE			= GameInfo.Units.UNIT_CRUISER_BALTIMORE.ID
JP_TAKAO				= GameInfo.Units.UNIT_CRUISER_TAKAO.ID
GR_PISA					= GameInfo.Units.UNIT_CRUISER_PISA.ID 
						
-- Heavy Cruisers -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
HEAVY_CRUISER			= GameInfo.Units.UNIT_HEAVY_CRUISER.ID -- NumType for unit naming...
GE_DEUTSCHLAND			= GameInfo.Units.UNIT_HEAVY_CRUISER_DEUTSCHLAND.ID 
IT_ZARA					= GameInfo.Units.UNIT_HEAVY_CRUISER_ZARA.ID 
						
-- Dreadnought ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
DREADNOUGHT				= GameInfo.Units.UNIT_DREADNOUGHT.ID -- NumType for unit naming...
UK_ELIZABETH			= GameInfo.Units.UNIT_DREADNOUGHT_ELIZABETH.ID 
RU_GANGUT				= GameInfo.Units.UNIT_DREADNOUGHT_GANGUT.ID 
IT_DI_CAVOUR			= GameInfo.Units.UNIT_DREADNOUGHT_DI_CAVOUR.ID 
						
-- battleships ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
BATTLESHIP				= GameInfo.Units.UNIT_BATTLESHIP.ID -- NumType for unit naming...
--BATTLESHIP_2			= GameInfo.Units.UNIT_BATTLESHIP_2.ID -- NumType for unit naming...
FR_BATTLESHIP			= GameInfo.Units.UNIT_BATTLESHIP_DUNKERQUE.ID
FR_BATTLESHIP_2			= GameInfo.Units.UNIT_BATTLESHIP_RICHELIEU.ID
UK_BATTLESHIP			= GameInfo.Units.UNIT_BATTLESHIP_ADMIRAL.ID
UK_BATTLESHIP_2			= GameInfo.Units.UNIT_BATTLESHIP_GEORGE_V.ID
GE_BATTLESHIP			= GameInfo.Units.UNIT_BATTLESHIP_SCHARNHORST.ID
GE_BATTLESHIP_2			= GameInfo.Units.UNIT_BATTLESHIP_BISMARK.ID
IT_BATTLESHIP			= GameInfo.Units.UNIT_BATTLESHIP_LITTORIO.ID
RU_BATTLESHIP			= GameInfo.Units.UNIT_BATTLESHIP_SOYUZ.ID
US_BATTLESHIP			= GameInfo.Units.UNIT_BATTLESHIP_SOUTH_DAKOTA.ID
US_BATTLESHIP_2			= GameInfo.Units.UNIT_BATTLESHIP_IOWA.ID
JP_BATTLESHIP			= GameInfo.Units.UNIT_BATTLESHIP_KONGO.ID
JP_BATTLESHIP_2			= GameInfo.Units.UNIT_BATTLESHIP_YAMOTO.ID
						
-- Submarines -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
SUBMARINE				= GameInfo.Units.UNIT_SUBMARINE.ID -- NumType for unit naming...
SUBMARINE_2				= GameInfo.Units.UNIT_SUBMARINE_2.ID
SUBMARINE_3				= GameInfo.Units.UNIT_SUBMARINE_3.ID
FR_SUBMARINE			= GameInfo.Units.UNIT_SUBMARINE_REDOUTABLE.ID
IT_SUBMARINE			= GameInfo.Units.UNIT_SUBMARINE_MARCELLO.ID
UK_SUBMARINE			= GameInfo.Units.UNIT_SUBMARINE_TCLASS.ID
RU_SUBMARINE			= GameInfo.Units.UNIT_SUBMARINE_SHCHUKA.ID
GE_SUBMARINE			= GameInfo.Units.UNIT_SUBMARINE_U_BOAT.ID
PL_SUBMARINE			= GameInfo.Units.UNIT_SUBMARINE_ORZEL.ID
US_SUBMARINE			= GameInfo.Units.UNIT_SUBMARINE_GATO.ID
JP_SUBMARINE			= GameInfo.Units.UNIT_SUBMARINE_B1.ID
GR_SUBMARINE			= GameInfo.Units.UNIT_SUBMARINE_KATSONIS.ID
-- Carrier --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CARRIER					= GameInfo.Units.UNIT_CARRIER.ID -- NumType for unit naming...
US_CARRIER				= GameInfo.Units.UNIT_CARRIER_YORKTOWN.ID
JP_CARRIER				= GameInfo.Units.UNIT_CARRIER_KAGA.ID
FR_CARRIER				= GameInfo.Units.UNIT_CARRIER_JOFFRE.ID

CARRIER_2				= GameInfo.Units.UNIT_CARRIER_2.ID
CARRIER_3				= GameInfo.Units.UNIT_CARRIER_3.ID

-- Available units for major civs
g_Major_Units = {
	[FRANCE] = {
		FR_INFANTRY, FR_LEGION, FR_PARATROOPER, FR_MECH_INFANTRY, FR_SPECIAL_FORCES,
		FR_W15_TCC, FR_AMR35_ZT3, FR_37L,
		FR_R35, FR_R40, FR_H35, FR_H39,
		FR_S35,
		FR_B1, FR_ARL44, FR_CHAR_2C,
		FR_SAU40,
		FR_MS406, FR_D520, FR_D790,
		FR_MB152, 
		FR_POTEZ630,
		FR_LN401, FR_AMIOT350, FR_BR690, FR_BR810,
		FR_FANTASQUE, FR_GALISSONIERE, FR_SUBMARINE, FR_BATTLESHIP, FR_BATTLESHIP_2,
		ARTILLERY, AA_GUN, AT_GUN, FR_MOBILE_AA_GUN,
		FR_CARRIER},
	[ENGLAND] = {
		UK_INFANTRY, UK_SPECIAL_FORCES, UK_PARATROOPER, UK_MECH_INFANTRY,
		UK_TETRARCH, UK_MATILDA_I, UK_CRUISER_II, UK_CRUISER_III, UK_CRUISER_IV, UK_A10_VALENTINE, UK_A15_CRUSADER,
		UK_MATILDA_II, UK_M4_FIREFLY,
		UK_CHURCHILL,
		UK_SPITFIRE, UK_SPITFIRE_V, UK_SPITFIRE_IX, 
		UK_HURRICANE, UK_HURRICANE_II,
		UK_WHIRLWIND, UK_BEAUFIGHTER,
		UK_MOSQUITO, UK_WELLINGTON, UK_HALIFAX, UK_LANCASTER,
		UK_TRIBA, UK_SUBMARINE, UK_DIDO, UK_BATTLESHIP, UK_BATTLESHIP_2,
		ARTILLERY, AA_GUN, AT_GUN},
	[USSR] = {
		RU_INFANTRY, RU_NAVAL_INFANTRY, RU_PARATROOPER, RU_MECH_INFANTRY, RU_SPECIAL_FORCES,
		RU_T26, RU_BT7,
		RU_T28, RU_T34, RU_T34_76, RU_T34_85,
		RU_KV1, RU_KV2, RU_IS_1, RU_IS_2,
		RU_I16, RU_LAGG3, RU_LA5, RU_LA5_V2, RU_LA7, RU_YAK_7,
		RU_IL2, RU_PE2, RU_TU2, RU_IL4, RU_TB3, RU_PE8,
		RU_GNEVNY, RU_SUBMARINE, RU_KIROV, RU_BATTLESHIP,
		ARTILLERY, AA_GUN, AT_GUN},
	[GERMANY] = {
		GE_INFANTRY, GE_PARATROOPER, GE_SS_INFANTRY, GE_SPECIAL_FORCES, GE_MECH_INFANTRY,
		GE_PZJAGER_I,
		GE_PANZER_II, GE_PANZER_II_L,
		GE_PANZER_III, GE_PANZER_III_J, GE_PANZER_IV, GE_PANZER_IV_G, GE_PANZER_IV_H, GE_PANZER_V,
		GE_PANZER_VI, GE_PANZER_VIB, GE_PANZER_VIII,
		GE_STUG_III, GE_STUG_IV,
		GE_BF109, GE_BF109_F, GE_BF109_G, GE_FW190, GE_BF110, GE_BF110_F4, GE_JU88_C, GE_HE219,
		GE_JU87, GE_JU88, GE_HE111, GE_HE177,
		GE_DESTROYER, GE_SUBMARINE, GE_LEIPZIG, GE_DEUTSCHLAND, GE_BATTLESHIP, GE_BATTLESHIP_2,
		ARTILLERY, AA_GUN, AT_GUN, GE_MOBILE_AA_GUN},
	[ITALY] = {
		IT_INFANTRY, IT_SPECIAL_FORCES, IT_PARATROOPER, 
		IT_L6_40, IT_M11_39, IT_M13_40, IT_M14_41, IT_M15_42, IT_P26_40,
		IT_G50, IT_G55, IT_C202,
		IT_BA65, IT_SM79, IT_SM84,
		IT_SOLDATI, IT_SUBMARINE, IT_ZARA, IT_BATTLESHIP,
		ARTILLERY, AA_GUN, AT_GUN},
	[AMERICA] = {
		US_INFANTRY, US_SPECIAL_FORCES, US_PARATROOPER, US_MECH_INFANTRY,
		US_M3STUART, US_M5STUART, US_M24CHAFFEE,
		US_M3GRANT, US_SHERMAN, US_SHERMAN_IIA, US_SHERMAN_III, US_SHERMAN_IIIA, US_SHERMAN_IV, US_SHERMAN_JUMBO, US_SHERMAN_EASYEIGHT, US_M26_PERSHING,
		US_P36, US_P40, US_P51, US_P38,
		US_B17, US_B25, US_B24, 
		US_SUBMARINE, US_BATTLESHIP_2, US_FLETCHER, US_BALTIMORE, US_BATTLESHIP, US_CARRIER, 
		ARTILLERY, AA_GUN, AT_GUN},
	[JAPAN] = {
		JP_INFANTRY, JP_SPECIAL_FORCES, JP_PARATROOPER,
		JP_TYPE97_SHINHORO, JP_TYPE1, JP_TYPE3, JP_TYPE4, TYPE4_CHI_TO, JP_TYPE5,
		JP_A6M2,
		JP_AICHI, JP_KI21,
		JP_SUBMARINE, JP_BATTLESHIP_2, JP_KAGERO, JP_TAKAO, JP_BATTLESHIP, JP_CARRIER,
		ARTILLERY, AA_GUN, AT_GUN},
	[CHINA] = {
		CH_INFANTRY, CH_SPECIAL_FORCES, CH_PARATROOPER,
		CH_T26B,
		CH_P40N,
		CH_B25,
		DESTROYER,
		ARTILLERY, AA_GUN, AT_GUN},
	[GREECE] = {
		GR_INFANTRY, GR_PARATROOPER, GR_SPECIAL_FORCES,
		GR_VICKERS_MKE, GR_VICKERS_MKII,
		GR_P24, GR_SPITFIRE,
		GR_FAIREY, GR_BLENHEIM,
		GR_SUBMARINE, GR_PISA, GR_GEORGIOS,
		ARTILLERY, AA_GUN, AT_GUN},
}

-- Units upgrades
g_UnitUpgrades = {
	[FR_R35] = FR_R40,
	[FR_H35] = FR_H39,
	[GE_PANZER_II] = GE_PANZER_II_L,
	[GE_PANZER_III] = GE_PANZER_III_J,
	[GE_PANZER_IV] = GE_PANZER_IV_G,
	[GE_PANZER_IV_G] = GE_PANZER_IV_H,
	[GE_BF109] = GE_BF109_F,
	[GE_BF109_F] = GE_BF109_G,
	[GE_BF110] = GE_BF110_F4,
	[UK_CRUISER_II] = UK_CRUISER_IV,
	[UK_CRUISER_III] = UK_CRUISER_IV,
	[UK_SPITFIRE] = UK_SPITFIRE_V,
	[UK_SPITFIRE_V] = UK_SPITFIRE_IX,
	[RU_BT2] = RU_BT7,
	[RU_T34] = RU_T34_76,
	[RU_T34_76] = RU_T34_85,
	[RU_IS_1] = RU_IS_2,
	[RU_LAGG3] = RU_LA5,
	[RU_LA5] = RU_LA5_V2,
	[RU_LA5_V2] = RU_LA7,
	[IT_M11_39] = IT_M13_40,
	[IT_M13_40] = IT_M14_41,
	[IT_M14_41] = IT_M15_42,
	[US_SHERMAN] = US_SHERMAN_IIA,
	[US_SHERMAN_IIA] = US_SHERMAN_III,
	[US_SHERMAN_III] = US_SHERMAN_IIIA,
	[US_SHERMAN_IIIA] = US_SHERMAN_JUMBO,
	[US_SHERMAN_JUMBO] = US_SHERMAN_EASYEIGHT,
}

-- Unit Type with paradrop
g_Paradrop = {
	[PARATROOPER] = true,
	[GE_PARATROOPER] = true, 
	[FR_PARATROOPER] = true, 
	[GR_PARATROOPER] = true, 
	[JP_PARATROOPER] = true, 
	[IT_PARATROOPER] = true, 
	[CH_PARATROOPER] = true, 
	[US_PARATROOPER] = true, 
	[RU_PARATROOPER] = true, 
	[UK_PARATROOPER] = true, 
	
	[SPECIAL_FORCES] = true, 
	[GE_SPECIAL_FORCES] = true, 
	[FR_SPECIAL_FORCES] = true, 
	[GR_SPECIAL_FORCES] = true, 
	[JP_SPECIAL_FORCES] = true, 
	[IT_SPECIAL_FORCES] = true, 
	[CH_SPECIAL_FORCES] = true, 
	[US_SPECIAL_FORCES] = true, 
	[RU_SPECIAL_FORCES] = true, 
	[UK_SPECIAL_FORCES] = true, 
}

-- Units that have no combat penalty from absence of supply line
g_NoSupplyPenalty= {
	[FR_LEGION] = true,

	[PARATROOPER] = true,
	[GE_PARATROOPER] = true, 
	[FR_PARATROOPER] = true, 
	[GR_PARATROOPER] = true, 
	[JP_PARATROOPER] = true, 
	[IT_PARATROOPER] = true, 
	[CH_PARATROOPER] = true, 
	[US_PARATROOPER] = true, 
	[RU_PARATROOPER] = true, 
	[UK_PARATROOPER] = true, 
	
	[SPECIAL_FORCES] = true, 
	[GE_SPECIAL_FORCES] = true, 
	[FR_SPECIAL_FORCES] = true, 
	[GR_SPECIAL_FORCES] = true, 
	[JP_SPECIAL_FORCES] = true, 
	[IT_SPECIAL_FORCES] = true, 
	[CH_SPECIAL_FORCES] = true, 
	[US_SPECIAL_FORCES] = true, 
	[RU_SPECIAL_FORCES] = true, 
	[UK_SPECIAL_FORCES] = true, 
}

-- Units that will never retreat
g_NeverRetreating= {
	[FR_LEGION] = true,
	[GE_SS_INFANTRY] = true,
}

g_NoRangeAttack = {
	--[GE_ME262] = true,
}

-- Unit that can stack with normal units (but no other special type units) - defined globally in g_Unit_Classes, but can be set for some specific units of a class here. Note that class define take
g_SpecialType = {
}

-- Units that are restricted by number for all the game duration (dead units can't be rebuild)
g_UnitMaxNumber= {
	[FR_BATTLESHIP] = 2,
	[FR_BATTLESHIP_2] = 4,
	[FR_GALISSONIERE] = 6,
	[GE_BATTLESHIP] = 2,
	[GE_BATTLESHIP_2] = 2,
	[GE_LEIPZIG] = 2,
	[GE_DEUTSCHLAND] = 3,
	[UK_BATTLESHIP] = 2,
	[UK_BATTLESHIP_2] = 5,
	[UK_DIDO] = 16,
	[UK_ELIZABETH] = 5,
	[IT_BATTLESHIP] = 4,
	[IT_ZARA] = 4,
	[IT_DI_CAVOUR] = 3,
	[RU_BATTLESHIP] = 4,
	[RU_GANGUT] = 4,
	[RU_KIROV] = 6,
	[JP_BATTLESHIP] = 4,
	[JP_BATTLESHIP_2] = 3,
	[US_BATTLESHIP] = 4,
	[US_BATTLESHIP_2] = 3,
	[GR_PISA] = 1,
	[FR_CHAR_2C] = 3,
}

-- Units that are restricted by number of instance (dead unit can be rebuild)
g_UnitMaxInstance = {
	[PARATROOPER]		= 5,
	[GE_PARATROOPER]	= 10, 
	[FR_PARATROOPER]	= 5, 
	[GR_PARATROOPER]	= 5, 
	[JP_PARATROOPER]	= 5, 
	[IT_PARATROOPER]	= 5, 
	[CH_PARATROOPER]	= 5, 
	[US_PARATROOPER]	= 5, 
	[RU_PARATROOPER]	= 5, 
	[UK_PARATROOPER]	= 5, 
	
	[SPECIAL_FORCES]	= 1, 
	[GE_SPECIAL_FORCES] = 1, 
	[FR_SPECIAL_FORCES] = 1, 
	[GR_SPECIAL_FORCES] = 1, 
	[JP_SPECIAL_FORCES] = 1, 
	[IT_SPECIAL_FORCES] = 1, 
	[CH_SPECIAL_FORCES] = 1, 
	[US_SPECIAL_FORCES] = 1, 
	[RU_SPECIAL_FORCES] = 1, 
	[UK_SPECIAL_FORCES] = 3, 
}

-- All listed buildings are needed to train this unit type.
g_Unit_ReqBuildings = {
	[FR_LEGION] =			{LEGION_HQ},
	[RU_NAVAL_INFANTRY] =	{SHIPYARD},
	[US_MARINES] =			{ACADEMY},
	[GE_SS_INFANTRY] =		{ACADEMY},
}

-- Available units for minor civs
g_Minor_Units = {INFANTRY, LIGHT_TANK, TANK, FIGHTER, DESTROYER, CRUISER, SUBMARINE}