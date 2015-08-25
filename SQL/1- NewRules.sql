--------------------------------------------------------------------------------------------
-- New rules for R.E.D. WWII edition
-- Must be loaded before adding/moddifying other game items.
--------------------------------------------------------------------------------------------


--------------------------------------------------------------------------------------------
-- Gamespeed
--------------------------------------------------------------------------------------------
DELETE FROM GameSpeed_Turns WHERE GameSpeedType='GAMESPEED_STANDARD';
INSERT INTO GameSpeed_Turns (GameSpeedType, MonthIncrement,TurnsPerIncrement) VALUES ('GAMESPEED_STANDARD', '1', '360');
UPDATE GameSpeeds SET DealDuration = 100;

--------------------------------------------------------------------------------------------
-- Cities
--------------------------------------------------------------------------------------------
UPDATE Eras SET CityBombardEffectTag = "ART_DEF_VEFFECT_ANTIAIR_IMPACT_AIR";

--------------------------------------------------------------------------------------------
-- Technologies
--------------------------------------------------------------------------------------------
UPDATE Technologies SET Era = "ERA_INDUSTRIAL" WHERE Type="TECH_SATELLITES";
UPDATE Technologies SET Era = "ERA_INDUSTRIAL" WHERE Type="TECH_RAILROADS";
UPDATE Technologies SET ResearchAgreementTradingAllowed = "false";
UPDATE Technologies SET AllowsEmbarking = "false";

--------------------------------------------------------------------------------------------
-- Routes
--------------------------------------------------------------------------------------------
UPDATE Routes SET GoldMaintenance = 0 WHERE Type='ROUTE_ROAD';
UPDATE Routes SET GoldMaintenance = 2 WHERE Type='ROUTE_RAILROAD';

--------------------------------------------------------------------------------------------
-- Buildings
--------------------------------------------------------------------------------------------
DELETE FROM Building_FreeUnits;
UPDATE Buildings SET Culture =			0;
UPDATE Buildings SET SpecialistType =	NULL;
UPDATE Buildings SET SpecialistCount =	0;
UPDATE Buildings SET FreePolicies =		0;
UPDATE Buildings SET ConquestProb =		100;
UPDATE Buildings SET ConquestProb =		25		WHERE Type='BUILDING_ARSENAL';
UPDATE Buildings SET ConquestProb =		50		WHERE Type='BUILDING_MILITARY_BASE';
UPDATE Buildings SET NeverCapture =		0;
UPDATE Buildings SET NeverCapture =		1		WHERE Type='BUILDING_WALLS';
UPDATE Buildings SET NeverCapture =		1		WHERE Type='BUILDING_COURTHOUSE';
UPDATE Buildings SET NeverCapture =		1		WHERE Type='BUILDING_BROADCAST_TOWER';
UPDATE Buildings SET PrereqTech =		NULL;
--UPDATE Buildings SET ArtDefineTag =		NULL	WHERE Type='BUILDING_WALLS'; -- hardcoded ?

DELETE FROM Building_ResourceQuantityRequirements;

DELETE FROM Building_ClassesNeededInCity;

DELETE FROM Building_DomainFreeExperiences WHERE BuildingType='BUILDING_BARRACKS' and DomainType='DOMAIN_SEA';
DELETE FROM Building_DomainFreeExperiences WHERE BuildingType='BUILDING_BARRACKS' and DomainType='DOMAIN_AIR';
UPDATE Building_DomainFreeExperiences SET Experience = 10 WHERE BuildingType='BUILDING_BARRACKS';
UPDATE Building_DomainFreeExperiences SET Experience = 25 WHERE BuildingType='BUILDING_MILITARY_ACADEMY';
INSERT INTO Building_DomainFreeExperiences (BuildingType, DomainType, Experience) VALUES ('BUILDING_MILITARY_BASE', 'DOMAIN_SEA', 25);
INSERT INTO Building_DomainFreeExperiences (BuildingType, DomainType, Experience) VALUES ('BUILDING_MILITARY_BASE', 'DOMAIN_AIR', 25);
INSERT INTO Building_DomainFreeExperiences (BuildingType, DomainType, Experience) VALUES ('BUILDING_MILITARY_BASE', 'DOMAIN_LAND', 25);

INSERT INTO Building_YieldChanges (BuildingType, YieldType, Yield) VALUES ('BUILDING_BANK', 'YIELD_GOLD', 4);

UPDATE Building_YieldChanges SET Yield = 0 WHERE YieldType = 'YIELD_SCIENCE' ;

UPDATE Buildings SET GoldMaintenance = 18	WHERE Type='BUILDING_MILITARY_BASE';
UPDATE Buildings SET GoldMaintenance = 10	WHERE Type='BUILDING_MILITARY_ACADEMY';
UPDATE Buildings SET GoldMaintenance = 4	WHERE Type='BUILDING_ARSENAL';
UPDATE Buildings SET GoldMaintenance = 2	WHERE Type='BUILDING_BARRACKS';

UPDATE Buildings SET Defense = 2400		WHERE Type='BUILDING_MILITARY_BASE';
UPDATE Buildings SET Defense = 1600		WHERE Type='BUILDING_ARSENAL';
UPDATE Buildings SET Defense = 600		WHERE Type='BUILDING_BARRACKS';


--------------------------------------------------------------------------------------------
-- Units
--------------------------------------------------------------------------------------------

UPDATE Defines SET Value = 1250		WHERE Name = 'EMBARKED_UNIT_COMBAT_STRENGTH'; -- 1200
UPDATE Defines SET Value = 150		WHERE Name = 'BASE_UNIT_UPGRADE_COST'; -- was 10
UPDATE Defines SET Value = 10		WHERE Name = 'UNIT_UPGRADE_COST_PER_PRODUCTION'; -- was 2
UPDATE Defines SET Value = 3		WHERE Name = 'EMBARKED_UNIT_MOVEMENT'; -- was 2, total is 4 with techs at scenario era
UPDATE Defines SET Value = 300		WHERE Name = 'AIR_UNIT_REBASE_RANGE_MULTIPLIER';
UPDATE Defines SET Value = -500		WHERE Name = 'DEFICIT_UNIT_DISBANDING_THRESHOLD'; -- prevent disbanding when negative income


--------------------------------------------------------------------------------------------
-- Promotions
--------------------------------------------------------------------------------------------

UPDATE UnitPromotions SET AttackWoundedMod	= 10	WHERE Type = 'PROMOTION_CHARGE';

UPDATE UnitPromotions SET OpenAttack		= 15,	OpenDefense		= 5 WHERE Type	= 'PROMOTION_SHOCK_1';
UPDATE UnitPromotions SET OpenAttack		= 10,	OpenDefense		= 10 WHERE Type = 'PROMOTION_SHOCK_2';
UPDATE UnitPromotions SET OpenAttack		= 5,	OpenDefense		= 15 WHERE Type = 'PROMOTION_SHOCK_3';
UPDATE UnitPromotions SET RoughAttack		= 5,	RoughDefense	= 15 WHERE Type = 'PROMOTION_DRILL_1';
UPDATE UnitPromotions SET RoughAttack		= 10,	RoughDefense	= 10 WHERE Type = 'PROMOTION_DRILL_2';
UPDATE UnitPromotions SET RoughAttack		= 15,	RoughDefense	= 5 WHERE Type	= 'PROMOTION_DRILL_3';

UPDATE UnitPromotions_Domains SET Modifier = 15 WHERE PromotionType = 'PROMOTION_TARGETING_1';
UPDATE UnitPromotions_Domains SET Modifier = 10 WHERE PromotionType = 'PROMOTION_TARGETING_2';
UPDATE UnitPromotions_Domains SET Modifier = 5  WHERE PromotionType = 'PROMOTION_TARGETING_3';


--------------------------------------------------------------------------------------------
-- Game Defines
--------------------------------------------------------------------------------------------

UPDATE Defines SET Value = 0		WHERE Name = 'CITY_ATTACK_RANGE';
UPDATE Defines SET Value = -33		WHERE Name = 'RIVER_ATTACK_MODIFIER'; -- default -20
UPDATE Defines SET Value = -50		WHERE Name = 'AMPHIB_ATTACK_MODIFIER'; -- default -50
UPDATE Defines SET Value = 1		WHERE Name = 'UNIT_MAINTENANCE_GAME_MULTIPLIER';
UPDATE Defines SET Value = 3		WHERE Name = 'RECON_VISIBILITY_RANGE';
UPDATE Defines SET Value = 15000	WHERE Name = 'BASE_CITY_GROWTH_THRESHOLD';
UPDATE Defines SET Value = 80		WHERE Name = 'CITY_GROWTH_MULTIPLIER';
UPDATE Defines SET Value = 0		WHERE Name = 'FOOD_CONSUMPTION_PER_POPULATION';
UPDATE Defines SET Value = 100		WHERE Name = 'CITY_CAPTURE_POPULATION_PERCENT';
UPDATE Defines SET Value = 1500		WHERE Name = 'CULTURE_COST_FIRST_PLOT';
UPDATE Defines SET Value = 2500		WHERE Name = 'PLOT_BASE_COST';
UPDATE Defines SET Value = 3		WHERE Name = 'BONUS_PER_ADJACENT_FRIEND'; -- flancking bonus (default 10)
UPDATE Defines SET Value = 75		WHERE Name = 'MAX_HIT_POINTS'; -- Absolute MaxHP to set at 100 if per units maxHP could be achieved
UPDATE Defines SET Value = 50		WHERE Name = 'MAX_CITY_HIT_POINTS';
UPDATE Defines SET Value = 0		WHERE Name = 'ENEMY_HEAL_RATE';
UPDATE Defines SET Value = 0		WHERE Name = 'NEUTRAL_HEAL_RATE';
UPDATE Defines SET Value = 0		WHERE Name = 'FRIENDLY_HEAL_RATE';
UPDATE Defines SET Value = 0		WHERE Name = 'CITY_HEAL_RATE';
UPDATE Defines SET Value = 1		WHERE Name = 'BUY_PLOTS_DISABLED';
UPDATE Defines SET Value = 900000	WHERE Name = 'GREAT_GENERALS_THRESHOLD';
UPDATE Defines SET Value = 0		WHERE Name LIKE 'LAND_DISPUTE_%';
--UPDATE Defines SET Value = -10000 WHERE Name LIKE 'PEACE_WILLINGNESS_ACCEPT_PROJECTION_%';
--UPDATE Defines SET Value = -10000 WHERE Name LIKE 'PEACE_WILLINGNESS_OFFER_PROJECTION_%';
UPDATE Defines SET Value = 1000		WHERE Name = 'PROGRESS_POPUP_TURN_FREQUENCY';
UPDATE Defines SET Value = 6		WHERE Name = 'STANDARD_CALENDAR';
--UPDATE Defines SET Value = 200		WHERE Name = 'MILITARY_STRENGTH_CITY_MOD'; -- default = 33
UPDATE Defines SET Value = 350		WHERE Name = 'CITY_STRENGTH_UNIT_DIVISOR'; -- default = 500 -- used 375
UPDATE Defines SET Value = 50		WHERE Name = 'CITY_STRENGTH_POPULATION_CHANGE'; -- default = 25
-- "CITY_STRENGTH_DEFAULT","600"
UPDATE Defines SET Value = 25		WHERE Name = 'FORTIFY_MODIFIER_PER_TURN'; -- default = 25
UPDATE Defines SET Value = 3		WHERE Name = 'MAX_FORTIFY_TURNS'; -- default = 2
--UPDATE Defines SET Value = 0		WHERE Name = 'FIRE_SUPPORT_DISABLED'; -- default = 1, behave strangely
UPDATE Defines SET Value = 5000		WHERE Name = 'AI_GOLD_PRIORITY_UNIT'; -- default = 500
--UPDATE PostDefines SET Key = 'ROUTE_RAILROAD' WHERE Name = 'INITIAL_CITY_ROUTE_TYPE'; -- don't work

UPDATE Defines SET Value = 2 WHERE Name = 'EXPERIENCE_ATTACKING_CITY_AIR'; -- default = 4
UPDATE Defines SET Value = 3 WHERE Name = 'EXPERIENCE_ATTACKING_CITY_MELEE'; -- default = 5
UPDATE Defines SET Value = 0 WHERE Name = 'EXPERIENCE_ATTACKING_CITY_RANGED'; -- default = 3
UPDATE Defines SET Value = 3 WHERE Name = 'EXPERIENCE_ATTACKING_AIR_SWEEP'; -- default = 5
UPDATE Defines SET Value = 3 WHERE Name = 'EXPERIENCE_DEFENDING_AIR_SWEEP_AIR'; -- default = 5
UPDATE Defines SET Value = 1 WHERE Name = 'EXPERIENCE_DEFENDING_AIR_SWEEP_GROUND'; -- default = 2
UPDATE Defines SET Value = 2 WHERE Name = 'EXPERIENCE_ATTACKING_UNIT_AIR'; -- default = 4
UPDATE Defines SET Value = 1 WHERE Name = 'EXPERIENCE_DEFENDING_UNIT_AIR'; -- default = 2
UPDATE Defines SET Value = 3 WHERE Name = 'EXPERIENCE_ATTACKING_UNIT_MELEE'; -- default = 5
UPDATE Defines SET Value = 2 WHERE Name = 'EXPERIENCE_DEFENDING_UNIT_MELEE'; -- default = 4
UPDATE Defines SET Value = 2 WHERE Name = 'EXPERIENCE_ATTACKING_UNIT_RANGED'; -- default = 2
UPDATE Defines SET Value = 1 WHERE Name = 'EXPERIENCE_DEFENDING_UNIT_RANGED'; -- default = 2

--"EXPERIENCE_PER_LEVEL","10"
--"MAX_EXPERIENCE_PER_COMBAT","10"
--"MIN_EXPERIENCE_PER_COMBAT","1"

UPDATE Defines SET Value = 1 WHERE Name = 'RECON_VISIBILITY_RANGE'; -- default = 6

--------------------------------------------------------------------------------------------
-- Diplo AI defines
--------------------------------------------------------------------------------------------
UPDATE Defines SET Value = 0	WHERE Name LIKE 'OPINION_WEIGHT_LAND_%';
UPDATE Defines SET Value = 0	WHERE Name LIKE 'OPINION_WEIGHT_MINOR_CIV_%';
UPDATE Defines SET Value = 0	WHERE Name LIKE 'OPINION_WEIGHT_VICTORY%';
UPDATE Defines SET Value = 0	WHERE Name LIKE 'OPINION_WEIGHT_WARMONGER%';
--UPDATE Defines SET Value = 0	WHERE Name LIKE 'DONT_SETTLE_%';
UPDATE Defines SET Value = 0	WHERE Name LIKE 'DONT_SETTLE_STRENGTH_%';
UPDATE Defines SET Value = 0	WHERE Name = 'DONT_SETTLE_FLAVOR_BASE'; -- 0 don't work, -1000 don't work, 1000 don't work... 2nd turn request of no settle seems hardcoded...
UPDATE Defines SET Value = 0	WHERE Name = 'DONT_SETTLE_FLAVOR_MULTIPLIER';
UPDATE Defines SET Value = -200 WHERE Name = 'OPINION_WEIGHT_DOF';
UPDATE Defines SET Value = -75	WHERE Name = 'OPINION_WEIGHT_DOF_WITH_FRIEND';
UPDATE Defines SET Value = 0	WHERE Name = 'OPINION_WEIGHT_DOF_WITH_ENEMY';
--UPDATE Leaders SET Chattiness = -10;
--UPDATE Leaders SET Meanness = 0;

UPDATE HandicapInfos SET AIDeclareWarProb = 125;

--------------------------------------------------------------------------------------------
-- Game AI defines
--------------------------------------------------------------------------------------------
--UPDATE Leader_Flavors SET Flavor = -30 WHERE FlavorType='FLAVOR_EXPANSION';
--DELETE FROM AIEconomicStrategy_Flavors WHERE FlavorType='FLAVOR_EXPANSION';
--DELETE FROM AICityStrategy_Flavors WHERE FlavorType='FLAVOR_EXPANSION';
--DELETE FROM CitySpecialization_Flavors WHERE FlavorType='FLAVOR_EXPANSION';
--UPDATE Defines SET Value = 0	WHERE Name = 'AI_CITY_SPECIALIZATION_FOOD_WEIGHT_PERCENT_CONTINENT_UNOWNED';
--UPDATE Defines SET Value = 0	WHERE Name = 'AI_CITY_SPECIALIZATION_FOOD_WEIGHT_EARLY_EXPANSION'; 
UPDATE Defines SET Value = 5	WHERE Name = 'AI_STRATEGY_MILITARY_RESERVE_PERCENTAGE'; -- default 35

UPDATE AIMilitaryStrategies SET TechPrereq = NULL;
UPDATE AIMilitaryStrategies SET FirstTurnExecuted = 0;

--DELETE FROM Unit_AITypes WHERE UnitAIType='UNITAI_RESERVE_SEA';
--DELETE FROM Unit_AITypes WHERE UnitAIType='UNITAI_ESCORT_SEA';
--DELETE FROM Unit_AITypes WHERE UnitAIType='UNITAI_EXPLORE_SEA';
--DELETE FROM Unit_AITypes WHERE UnitAIType='UNITAI_EXPLORE';


--------------------------------------------------------------------------------------------
-- Minor Civilizations
--------------------------------------------------------------------------------------------
UPDATE Defines SET Value = 1000		WHERE Name = 'MINOR_CIV_QUEST_FIRST_POSSIBLE_TURN';
UPDATE Defines SET Value = 0		WHERE Name LIKE 'MINOR_FRIENDSHIP_DROP_PER_TURN%'; -- -1
UPDATE Defines SET Value = 100000	WHERE Name LIKE 'MINOR_GOLD_GIFT_%';
UPDATE Defines SET Value = 0		WHERE Name = 'MINOR_CIV_TECH_PERCENT';
UPDATE Defines SET Value = 80		WHERE Name = 'MINOR_CIV_AGGRESSOR_THRESHOLD'; --2
UPDATE Defines SET Value = 160		WHERE Name = 'MINOR_CIV_WARMONGER_THRESHOLD'; -- 4
UPDATE Defines SET Value = 100		WHERE Name = 'GAME_THREAT_MINOR_THRESHOLD'; -- 10

--------------------------------------------------------------------------------------------
-- UI, Controls
--------------------------------------------------------------------------------------------
UPDATE Controls SET HotKey = NULL WHERE Type = 'CONTROL_QUICK_SAVE'; -- To allow saving of table before quicksaving game
UPDATE Controls SET HotKey = NULL WHERE Type = 'CONTROL_SAVE_GROUP' or Type = 'CONTROL_SAVE_NORMAL'; -- To allow saving of table before saving game
UPDATE Controls SET HotKey = NULL WHERE Type = 'CONTROL_TOGGLE_STRATEGIC_VIEW'; -- Disable strategic view

--------------------------------------------------------------------------------------------
-- Process
--------------------------------------------------------------------------------------------
UPDATE Processes SET TechPrereq = 'TECH_FUTURE_TECH' WHERE Type = 'PROCESS_RESEARCH';
UPDATE Process_ProductionYields SET Yield = 100 WHERE ProcessType = 'PROCESS_WEALTH';

--------------------------------------------------------------------------------------------
-- Terrains
--------------------------------------------------------------------------------------------
UPDATE Defines SET Value = 10 WHERE Name = 'HILLS_EXTRA_DEFENSE';
UPDATE Terrains SET Movement = 2 WHERE Type = 'TERRAIN_DESERT';
UPDATE Terrains SET Movement = 2 WHERE Type = 'TERRAIN_SNOW';

--------------------------------------------------------------------------------------------
-- Improvements
--------------------------------------------------------------------------------------------

INSERT INTO Improvement_Yields (ImprovementType, YieldType, Yield) VALUES ('IMPROVEMENT_TRADING_POST', 'YIELD_PRODUCTION', 1);
UPDATE Improvement_Yields SET Yield = 2 WHERE ImprovementType = 'IMPROVEMENT_MINE';

UPDATE Builds SET PrereqTech = NULL;


--------------------------------------------------------------------------------------------
-- Resources
--------------------------------------------------------------------------------------------
DELETE FROM Resource_YieldChanges;
UPDATE Resources SET TechCityTrade = NULL;
UPDATE Resources SET TechReveal = NULL;

--------------------------------------------------------------------------------------------
-- Leaders
--------------------------------------------------------------------------------------------
--/*
UPDATE Leaders SET Boldness = 8,	VictoryCompetitiveness = 7,		Meanness = 9	WHERE Type = 'LEADER_AUGUSTUS';		-- ITALY
UPDATE Leaders SET Boldness = 10,	VictoryCompetitiveness = 10,	Meanness = 10	WHERE Type = 'LEADER_BISMARCK';		-- GERMANY
UPDATE Leaders SET Boldness = 7,	VictoryCompetitiveness = 7,		Meanness = 6	WHERE Type = 'LEADER_CATHERINE';	-- U.S.S.R.
UPDATE Leaders SET Boldness = 9,	VictoryCompetitiveness = 8,		Meanness = 7	WHERE Type = 'LEADER_ODA_NOBUNAGA';	-- Japan

UPDATE Leader_Flavors SET Flavor = 12	WHERE FlavorType = 'FLAVOR_OFFENSE'	AND LeaderType = 'LEADER_AUGUSTUS';		-- ITALY
UPDATE Leader_Flavors SET Flavor = 18	WHERE FlavorType = 'FLAVOR_OFFENSE'	AND LeaderType = 'LEADER_BISMARCK';		-- GERMANY
UPDATE Leader_Flavors SET Flavor = 13	WHERE FlavorType = 'FLAVOR_OFFENSE'	AND LeaderType = 'LEADER_CATHERINE';	-- U.S.S.R.
UPDATE Leader_Flavors SET Flavor = 18	WHERE FlavorType = 'FLAVOR_OFFENSE'	AND LeaderType = 'LEADER_ODA_NOBUNAGA';	-- Japan

UPDATE Leader_Flavors SET Flavor = 16	WHERE FlavorType = 'FLAVOR_EXPANSION'	AND LeaderType = 'LEADER_AUGUSTUS';		-- ITALY
UPDATE Leader_Flavors SET Flavor = 18	WHERE FlavorType = 'FLAVOR_EXPANSION'	AND LeaderType = 'LEADER_BISMARCK';		-- GERMANY
UPDATE Leader_Flavors SET Flavor = 13	WHERE FlavorType = 'FLAVOR_EXPANSION'	AND LeaderType = 'LEADER_CATHERINE';	-- U.S.S.R.
UPDATE Leader_Flavors SET Flavor = 16	WHERE FlavorType = 'FLAVOR_EXPANSION'	AND LeaderType = 'LEADER_ODA_NOBUNAGA';	-- Japan

UPDATE Leader_Flavors SET Flavor = 6	WHERE FlavorType = 'FLAVOR_MILITARY_TRAINING' AND LeaderType = 'LEADER_AUGUSTUS';		-- ITALY
UPDATE Leader_Flavors SET Flavor = 10	WHERE FlavorType = 'FLAVOR_MILITARY_TRAINING' AND LeaderType = 'LEADER_BISMARCK';		-- GERMANY
UPDATE Leader_Flavors SET Flavor = 6	WHERE FlavorType = 'FLAVOR_MILITARY_TRAINING' AND LeaderType = 'LEADER_CATHERINE';		-- U.S.S.R.
UPDATE Leader_Flavors SET Flavor = 10	WHERE FlavorType = 'FLAVOR_MILITARY_TRAINING' AND LeaderType = 'LEADER_ODA_NOBUNAGA';	-- Japan

UPDATE Leader_MajorCivApproachBiases SET Bias = 7	WHERE MajorCivApproachType = 'MAJOR_CIV_APPROACH_WAR' AND LeaderType = 'LEADER_AUGUSTUS';		-- ITALY
UPDATE Leader_MajorCivApproachBiases SET Bias = 10	WHERE MajorCivApproachType = 'MAJOR_CIV_APPROACH_WAR' AND LeaderType = 'LEADER_BISMARCK';		-- GERMANY
UPDATE Leader_MajorCivApproachBiases SET Bias = 6	WHERE MajorCivApproachType = 'MAJOR_CIV_APPROACH_WAR' AND LeaderType = 'LEADER_CATHERINE';		-- U.S.S.R.
UPDATE Leader_MajorCivApproachBiases SET Bias = 9	WHERE MajorCivApproachType = 'MAJOR_CIV_APPROACH_WAR' AND LeaderType = 'LEADER_ODA_NOBUNAGA';	-- Japan

UPDATE Leader_MajorCivApproachBiases SET Bias = 7	WHERE MajorCivApproachType = 'MAJOR_CIV_APPROACH_HOSTILE' AND LeaderType = 'LEADER_AUGUSTUS';		-- ITALY
UPDATE Leader_MajorCivApproachBiases SET Bias = 9	WHERE MajorCivApproachType = 'MAJOR_CIV_APPROACH_HOSTILE' AND LeaderType = 'LEADER_BISMARCK';		-- GERMANY
UPDATE Leader_MajorCivApproachBiases SET Bias = 7	WHERE MajorCivApproachType = 'MAJOR_CIV_APPROACH_HOSTILE' AND LeaderType = 'LEADER_CATHERINE';		-- U.S.S.R.
UPDATE Leader_MajorCivApproachBiases SET Bias = 8	WHERE MajorCivApproachType = 'MAJOR_CIV_APPROACH_HOSTILE' AND LeaderType = 'LEADER_ODA_NOBUNAGA';	-- Japan

UPDATE Leader_MinorCivApproachBiases SET Bias = 10	WHERE MinorCivApproachType = 'MINOR_CIV_APPROACH_CONQUEST' AND LeaderType = 'LEADER_AUGUSTUS';		-- ITALY
UPDATE Leader_MinorCivApproachBiases SET Bias = 10	WHERE MinorCivApproachType = 'MINOR_CIV_APPROACH_CONQUEST' AND LeaderType = 'LEADER_BISMARCK';		-- GERMANY
UPDATE Leader_MinorCivApproachBiases SET Bias = 10	WHERE MinorCivApproachType = 'MINOR_CIV_APPROACH_CONQUEST' AND LeaderType = 'LEADER_CATHERINE';		-- U.S.S.R.
UPDATE Leader_MinorCivApproachBiases SET Bias = 10	WHERE MinorCivApproachType = 'MINOR_CIV_APPROACH_CONQUEST' AND LeaderType = 'LEADER_ODA_NOBUNAGA';	-- Japan
--*/
--------------------------------------------------------------------------------------------
-- Unit Supply Production Modifier
--------------------------------------------------------------------------------------------
UPDATE HandicapInfos SET ProductionFreeUnits = 5;
UPDATE HandicapInfos SET ProductionFreeUnitsPerCity = 1;
UPDATE HandicapInfos SET ProductionFreeUnitsPopulationPercent = 10;
UPDATE Defines SET Value = 96 WHERE Name = 'MAX_UNIT_SUPPLY_PRODMOD';
INSERT INTO Defines (Name, Value) VALUES ('SUPPLY_PRODMOD_PER_UNIT', 2); -- used in DLL to calculate Unit supply production modifier, was hardcoded at 10

--------------------------------------------------------------------------------------------
-- Game hidden options checked in DLL code...
--------------------------------------------------------------------------------------------
INSERT INTO GameOptions (Type, "Default", Visible) VALUES ( 'GAMEOPTION_DOUBLE_EMBARKED_DEFENSE_AGAINST_AIR', 1, 0 );	-- double defense strenght of embarked units against air.
INSERT INTO GameOptions (Type, "Default", Visible) VALUES ( 'GAMEOPTION_FREE_PLOTS', 1, 0 );							-- remove city ownership on plots (don't change owner on city capture).
INSERT INTO GameOptions (Type, "Default", Visible) VALUES ( 'GAMEOPTION_NO_MINOR_DIPLO_SPAM', 1, 0 );					-- prevent minor civs to send "please gift units message". (and fix a crash that can occur when the minor try to send the message)
INSERT INTO GameOptions (Type, "Default", Visible) VALUES ( 'GAMEOPTION_CAN_STACK_IN_CITY', 1, 0 );						-- allow unit stacking in cities.
INSERT INTO GameOptions (Type, "Default", Visible) VALUES ( 'GAMEOPTION_CAN_ENTER_FOREIGN_CITY', 1, 0 );				-- allow units to enter in foreign cities.
INSERT INTO GameOptions (Type, "Default", Visible) VALUES ( 'GAMEOPTION_CIVILIAN_MOVE_THROUGH', 1, 0 );					-- allow civilian to move through other units.
INSERT INTO GameOptions (Type, "Default", Visible) VALUES ( 'GAMEOPTION_NAVAL_MOVE_THROUGH', 1, 0 );					-- allow naval units to move through enemy units