--------------------------------------------------------------------------------------------
-- New rules for R.E.D. WWII edition
-- Must be loaded before adding/moddifying other game items, only exception being ResetUnits to load first.
--------------------------------------------------------------------------------------------


--------------------------------------------------------------------------------------------
-- Gamespeed
--------------------------------------------------------------------------------------------
DELETE FROM GameSpeed_Turns WHERE GameSpeedType='GAMESPEED_STANDARD';
INSERT INTO GameSpeed_Turns (GameSpeedType, MonthIncrement,TurnsPerIncrement) VALUES ('GAMESPEED_STANDARD', '1', '360');

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
UPDATE Routes SET GoldMaintenance = 1;

--------------------------------------------------------------------------------------------
-- Buildings
--------------------------------------------------------------------------------------------
DELETE FROM Building_FreeUnits;
--UPDATE Buildings SET Culture =			0; -- No culture for G&K
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
--UPDATE Buildings SET ArtDefineTag =		NULL	WHERE Type='BUILDING_WALLS';

DELETE FROM Building_ResourceQuantityRequirements;

DELETE FROM Building_ClassesNeededInCity;
INSERT INTO Building_ClassesNeededInCity (BuildingType, BuildingClassType) VALUES ('BUILDING_MILITARY_ACADEMY', 'BUILDINGCLASS_BARRACKS'); -- todo: add to lua request table for code consistency ?
INSERT INTO Building_ClassesNeededInCity (BuildingType, BuildingClassType) VALUES ('BUILDING_MILITARY_BASE', 'BUILDINGCLASS_BARRACKS');

DELETE FROM Building_DomainFreeExperiences WHERE BuildingType='BUILDING_BARRACKS' and DomainType='DOMAIN_SEA';
DELETE FROM Building_DomainFreeExperiences WHERE BuildingType='BUILDING_BARRACKS' and DomainType='DOMAIN_AIR';
UPDATE Building_DomainFreeExperiences SET Experience = 10 WHERE BuildingType='BUILDING_BARRACKS';
UPDATE Building_DomainFreeExperiences SET Experience = 20 WHERE BuildingType='BUILDING_MILITARY_ACADEMY';
INSERT INTO Building_DomainFreeExperiences (BuildingType, DomainType, Experience) VALUES ('BUILDING_MILITARY_BASE', 'DOMAIN_SEA', 15);
INSERT INTO Building_DomainFreeExperiences (BuildingType, DomainType, Experience) VALUES ('BUILDING_MILITARY_BASE', 'DOMAIN_AIR', 15);
INSERT INTO Building_DomainFreeExperiences (BuildingType, DomainType, Experience) VALUES ('BUILDING_MILITARY_BASE', 'DOMAIN_LAND', 15);

INSERT INTO Building_YieldChanges (BuildingType, YieldType, Yield) VALUES ('BUILDING_BANK', 'YIELD_GOLD', 4);

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
UPDATE Units SET PrereqTech = NULL;
DELETE FROM Unit_ResourceQuantityRequirements;
DELETE FROM Unit_BuildingClassRequireds;
DELETE FROM Civilization_UnitClassOverrides;
DELETE FROM Unit_ClassUpgrades;
--UPDATE Units SET RangedCombatLimit = 75 WHERE RangedCombatLimit = 100; -- no effect ?
--UPDATE Technologies SET AllowsDefensiveEmbarking = "true";
--UPDATE Traits SET EmbarkedNotCivilian = "true";
--UPDATE Technologies SET AllowsEmbarking = "false";
UPDATE Defines SET Value = 1250		WHERE Name = 'EMBARKED_UNIT_COMBAT_STRENGTH'; -- 1200
--UPDATE Defines SET Value = 1250		WHERE Name = 'EMBARKED_NOT_CIVILIAN_COMBAT_STRENGTH'; -- was 500, used with land vs sea penalty promotion to fix bug with air units attacking embarked units as land units
UPDATE Defines SET Value = 150		WHERE Name = 'BASE_UNIT_UPGRADE_COST'; -- was 10
UPDATE Defines SET Value = 10		WHERE Name = 'UNIT_UPGRADE_COST_PER_PRODUCTION'; -- was 2
UPDATE Defines SET Value = 3		WHERE Name = 'EMBARKED_UNIT_MOVEMENT'; -- was 2, total is 4 with techs at scenario era
UPDATE Defines SET Value = 300		WHERE Name = 'AIR_UNIT_REBASE_RANGE_MULTIPLIER';
UPDATE Defines SET Value = -500		WHERE Name = 'DEFICIT_UNIT_DISBANDING_THRESHOLD'; -- no disbanding when negative income

--------------------------------------------------------------------------------------------
-- General Units Promotions (for unit specific promotions, see newDefaultUnits.SQL)
--------------------------------------------------------------------------------------------
--DELETE FROM UnitPromotions WHERE Type='PROMOTION_INSTA_HEAL' or Type='PROMOTION_MEDIC'; -- DON'T DELETE PROMOTION ID=0 FROM TABLE, BREAK SAVEGAME !!!
DELETE FROM UnitPromotions_UnitCombats WHERE PromotionType='PROMOTION_INSTA_HEAL' or PromotionType='PROMOTION_ANTI_HELICOPTER' or PromotionType='PROMOTION_FORMATION_1' or PromotionType='PROMOTION_FORMATION_2' or PromotionType='PROMOTION_RANGE' or PromotionType='PROMOTION_AIR_RANGE';
DELETE FROM Unit_FreePromotions WHERE PromotionType='PROMOTION_ANTI_HELICOPTER';
DELETE FROM Unit_FreePromotions WHERE PromotionType='PROMOTION_AIR_RECON';
UPDATE UnitPromotions SET AdjacentTileHealChange = 0 WHERE Type = 'PROMOTION_MEDIC';
UPDATE UnitPromotions SET AlwaysHeal = 0 WHERE Type = 'PROMOTION_MARCH';
UPDATE UnitPromotions SET AlwaysHeal = 0 WHERE Type = 'PROMOTION_REPAIR';
UPDATE UnitPromotions SET AlwaysHeal = 0 WHERE Type = 'PROMOTION_AIR_REPAIR';
UPDATE UnitPromotions SET Help = 'TXT_KEY_PROMOTION_REPAIR_HELP' WHERE Type = 'PROMOTION_REPAIR';
UPDATE UnitPromotions SET Help = 'TXT_KEY_PROMOTION_REPAIR_HELP' WHERE Type = 'PROMOTION_AIR_REPAIR';
UPDATE UnitPromotions SET Help = 'TXT_KEY_PROMOTION_ANTI_SUBMARINE_I_HELP' WHERE Type = 'PROMOTION_ANTI_SUBMARINE_I';
UPDATE UnitPromotions SET Help = 'TXT_KEY_PROMOTION_ANTI_SUBMARINE_II_HELP' WHERE Type = 'PROMOTION_ANTI_SUBMARINE_II';
UPDATE UnitPromotions SET HealOutsideFriendly = 0, EnemyHealChange = 0, NeutralHealChange = 0 WHERE Type = 'PROMOTION_SUPPLY';
UPDATE UnitPromotions SET DropRange = 20 WHERE Type = 'PROMOTION_PARADROP';
UPDATE UnitPromotions SET DefenseMod = -25 WHERE Type = 'PROMOTION_DEFENSE_PENALTY';
--UPDATE UnitPromotions SET NumInterceptionChange = 0;

--------------------------------------------------------------------------------------------
-- Game Defines
--------------------------------------------------------------------------------------------
--UPDATE Defines SET Value = 2		WHERE Name = 'PLOT_UNIT_LIMIT';
UPDATE Defines SET Value = 0		WHERE Name = 'CITY_ATTACK_RANGE';
UPDATE Defines SET Value = -33		WHERE Name = 'RIVER_ATTACK_MODIFIER'; -- default -20
UPDATE Defines SET Value = -50		WHERE Name = 'AMPHIB_ATTACK_MODIFIER'; -- default -50
UPDATE Defines SET Value = 1		WHERE Name = 'UNIT_MAINTENANCE_GAME_MULTIPLIER';
--UPDATE Defines SET Value = 1000	WHERE Name = 'UNIT_MAINTENANCE_GAME_EXPONENT_DIVISOR';
UPDATE Defines SET Value = 3		WHERE Name = 'RECON_VISIBILITY_RANGE';
UPDATE Defines SET Value = 15000	WHERE Name = 'BASE_CITY_GROWTH_THRESHOLD';
UPDATE Defines SET Value = 80		WHERE Name = 'CITY_GROWTH_MULTIPLIER';
UPDATE Defines SET Value = 0		WHERE Name = 'FOOD_CONSUMPTION_PER_POPULATION';
UPDATE Defines SET Value = 100		WHERE Name = 'CITY_CAPTURE_POPULATION_PERCENT';
UPDATE Defines SET Value = 1500		WHERE Name = 'CULTURE_COST_FIRST_PLOT';
UPDATE Defines SET Value = 2500		WHERE Name = 'PLOT_BASE_COST';
UPDATE Defines SET Value = 75		WHERE Name = 'MAX_HIT_POINTS'; -- Absolute MaxHP to set at 100 if per units maxHP could be achieved
UPDATE Defines SET Value = 50		WHERE Name = 'MAX_CITY_HIT_POINTS';
UPDATE Defines SET Value = 0		WHERE Name = 'ENEMY_HEAL_RATE';
UPDATE Defines SET Value = 0		WHERE Name = 'NEUTRAL_HEAL_RATE';
UPDATE Defines SET Value = 0		WHERE Name = 'FRIENDLY_HEAL_RATE';
UPDATE Defines SET Value = 0		WHERE Name = 'CITY_HEAL_RATE';
UPDATE Defines SET Value = 1		WHERE Name = 'BUY_PLOTS_DISABLED';
UPDATE Defines SET Value = 100000	WHERE Name = 'GREAT_GENERALS_THRESHOLD';
UPDATE Defines SET Value = 0		WHERE Name LIKE 'LAND_DISPUTE_%';
--UPDATE Defines SET Value = -10000 WHERE Name LIKE 'PEACE_WILLINGNESS_ACCEPT_PROJECTION_%';
--UPDATE Defines SET Value = -10000 WHERE Name LIKE 'PEACE_WILLINGNESS_OFFER_PROJECTION_%';
UPDATE Defines SET Value = 1000		WHERE Name = 'PROGRESS_POPUP_TURN_FREQUENCY';
UPDATE Defines SET Value = 6		WHERE Name = 'STANDARD_CALENDAR';
--UPDATE Defines SET Value = 200	WHERE Name = 'MILITARY_STRENGTH_CITY_MOD'; -- default = 33
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
UPDATE Leaders SET Chattiness = -10;
--UPDATE Leaders SET Meanness = 0;

--------------------------------------------------------------------------------------------
-- Game AI defines
--------------------------------------------------------------------------------------------
UPDATE Leader_Flavors SET Flavor = -30 WHERE FlavorType='FLAVOR_EXPANSION';
--DELETE FROM AIEconomicStrategy_Flavors WHERE FlavorType='FLAVOR_EXPANSION';
DELETE FROM AICityStrategy_Flavors WHERE FlavorType='FLAVOR_EXPANSION';
DELETE FROM CitySpecialization_Flavors WHERE FlavorType='FLAVOR_EXPANSION';
UPDATE Defines SET Value = 0	WHERE Name = 'AI_CITY_SPECIALIZATION_FOOD_WEIGHT_PERCENT_CONTINENT_UNOWNED';
UPDATE Defines SET Value = 0	WHERE Name = 'AI_CITY_SPECIALIZATION_FOOD_WEIGHT_EARLY_EXPANSION'; 
UPDATE Defines SET Value = 15	WHERE Name = 'AI_STRATEGY_MILITARY_RESERVE_PERCENTAGE'; -- default 35

DELETE FROM Unit_AITypes WHERE UnitAIType='UNITAI_RESERVE_SEA';
DELETE FROM Unit_AITypes WHERE UnitAIType='UNITAI_ESCORT_SEA';
DELETE FROM Unit_AITypes WHERE UnitAIType='UNITAI_EXPLORE_SEA';
DELETE FROM Unit_AITypes WHERE UnitAIType='UNITAI_EXPLORE';


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
--UPDATE Controls SET HotKey = NULL WHERE Type = 'CONTROL_TOGGLE_STRATEGIC_VIEW'; -- Disable strategic view

--------------------------------------------------------------------------------------------
-- Process
--------------------------------------------------------------------------------------------
UPDATE Processes SET TechPrereq = 'TECH_FUTURE_TECH' WHERE Type = 'PROCESS_RESEARCH';
UPDATE Process_ProductionYields SET Yield = 50 WHERE ProcessType = 'PROCESS_WEALTH';

--------------------------------------------------------------------------------------------
-- Terrains
--------------------------------------------------------------------------------------------

UPDATE Defines SET Value = 10 WHERE Name = 'HILLS_EXTRA_DEFENSE';
UPDATE Terrains SET Movement = 2 WHERE Type = 'TERRAIN_DESERT';
UPDATE Terrains SET Movement = 2 WHERE Type = 'TERRAIN_SNOW';

--------------------------------------------------------------------------------------------
-- Improvements
--------------------------------------------------------------------------------------------

UPDATE Improvements SET DefenseModifier = 15 WHERE Type = 'IMPROVEMENT_TRADING_POST';
UPDATE Improvements SET DefenseModifier = 35 WHERE Type = 'IMPROVEMENT_MANUFACTORY';
UPDATE Improvements SET DefenseModifier = 25 WHERE Type = 'IMPROVEMENT_CITY_RUINS';

--------------------------------------------------------------------------------------------
-- Unit Supply Production Modifier
--------------------------------------------------------------------------------------------

UPDATE HandicapInfos SET ProductionFreeUnits = 5;
UPDATE HandicapInfos SET ProductionFreeUnitsPerCity = 1;
UPDATE HandicapInfos SET ProductionFreeUnitsPopulationPercent = 25;
UPDATE Defines SET Value = 90 WHERE Name = 'MAX_UNIT_SUPPLY_PRODMOD';
INSERT INTO Defines (Name, Value) VALUES ('SUPPLY_PRODMOD_PER_UNIT', 4); -- used in DLL to calculate Unit supply production modifier, was hardcoded at 10

--------------------------------------------------------------------------------------------
-- Game Options
--------------------------------------------------------------------------------------------

--UPDATE GameOptions SET Visible = 0 WHERE Type = 'GAMEOPTION_QUICK_COMBAT';
INSERT INTO GameOptions (Type, "Default", Visible) VALUES ( 'GAMEOPTION_DOUBLE_EMBARKED_DEFENSE_AGAINST_AIR', 1, 0 ); -- hidden option, used in DLL side to double defense strenght of embarked units against air.