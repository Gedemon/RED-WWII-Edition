
/*
	This file keep compatibility with Civ5 Vanilla.
	Restore vanilla values when needed.
	Load first, before NewRule apply.	

*/


DROP TABLE IF EXISTS "Building_ResourceQuantity";

--DELETE FROM Civilizations WHERE Type ='CIVILIZATION_GREECE';
--DELETE FROM Civilizations WHERE Type ='CIVILIZATION_FRANCE';
INSERT INTO Civilizations VALUES ("8","CIVILIZATION_GREECE","TXT_KEY_RED_WWII_GREECE",null,"TXT_KEY_WW2_SCENARIO_CIV_GREECE",null,"1","1","TXT_KEY_RED_WWII_GREECE_SHORT","TXT_KEY_CIV_GREECE_ADJECTIVE","PLAYERCOLOR_GREECE","ART_DEF_CIVILIZATION_GREECE","ARTSTYLE_GRECO_ROMAN","_MED","MEDITERRANEAN",null,"17","WW2_FLAGS","WW2_FLAGS","Earth1936startscreen.dds","TXT_KEY_RED_EURO1940_GREECE_BRIEFING","dom_greece.dds","AS2D_DOM_SPEECH_GREECE",null,null);
--INSERT INTO Civilization_Leaders VALUES ("CIVILIZATION_GREECE2","LEADER_ALEXANDER");

-- What's below should have been taken care by VanillaCiv5Database.sql...
/*

--------------------------------------------------------------------------------------------
-- Combat Defines, vanilla values
--------------------------------------------------------------------------------------------

INSERT OR REPLACE INTO Defines VALUES ("COMBAT_DAMAGE","20");
INSERT OR REPLACE INTO Defines VALUES ("NONCOMBAT_UNIT_RANGED_DAMAGE","4");
INSERT OR REPLACE INTO Defines VALUES ("NUKE_UNIT_DAMAGE_BASE","3");
INSERT OR REPLACE INTO Defines VALUES ("NUKE_UNIT_DAMAGE_RAND_1","4");
INSERT OR REPLACE INTO Defines VALUES ("NUKE_UNIT_DAMAGE_RAND_2","4");
INSERT OR REPLACE INTO Defines VALUES ("NUKE_CITY_HIT_POINT_DAMAGE","50");
INSERT OR REPLACE INTO Defines VALUES ("MAX_CITY_DEFENSE_DAMAGE","100");
INSERT OR REPLACE INTO Defines VALUES ("PATH_DAMAGE_WEIGHT","0");
INSERT OR REPLACE INTO Defines VALUES ("ATTACK_SAME_STRENGTH_MIN_DAMAGE","400");
INSERT OR REPLACE INTO Defines VALUES ("ATTACK_SAME_STRENGTH_POSSIBLE_EXTRA_DAMAGE","400");
INSERT OR REPLACE INTO Defines VALUES ("RANGE_ATTACK_SAME_STRENGTH_MIN_DAMAGE","200");
INSERT OR REPLACE INTO Defines VALUES ("RANGE_ATTACK_SAME_STRENGTH_POSSIBLE_EXTRA_DAMAGE","400");
INSERT OR REPLACE INTO Defines VALUES ("AIR_STRIKE_SAME_STRENGTH_MIN_DEFENSE_DAMAGE","200");
INSERT OR REPLACE INTO Defines VALUES ("AIR_STRIKE_SAME_STRENGTH_POSSIBLE_EXTRA_DEFENSE_DAMAGE","200");
INSERT OR REPLACE INTO Defines VALUES ("INTERCEPTION_SAME_STRENGTH_MIN_DAMAGE","400");
INSERT OR REPLACE INTO Defines VALUES ("INTERCEPTION_SAME_STRENGTH_POSSIBLE_EXTRA_DAMAGE","300");
INSERT OR REPLACE INTO Defines VALUES ("AIR_SWEEP_INTERCEPTION_DAMAGE_MOD","75");
INSERT OR REPLACE INTO Defines VALUES ("WOUNDED_DAMAGE_MULTIPLIER","50");
INSERT OR REPLACE INTO Defines VALUES ("TRAIT_WOUNDED_DAMAGE_MOD","-50");
INSERT OR REPLACE INTO Defines VALUES ("CITY_ATTACKING_DAMAGE_MOD","50");
INSERT OR REPLACE INTO Defines VALUES ("ATTACKING_CITY_MELEE_DAMAGE_MOD","100");
INSERT OR REPLACE INTO Defines VALUES ("MIN_CITY_STRIKE_DAMAGE","1");
INSERT OR REPLACE INTO Defines VALUES ("CITY_CAPTURE_DAMAGE_PERCENT","50");
INSERT OR REPLACE INTO Defines VALUES ("RANGE_ATTACK_RANGED_DEFENDER_MOD","125");
INSERT OR REPLACE INTO Defines VALUES ("NAVAL_COMBAT_DEFENDER_STRENGTH_MULTIPLIER","40");
INSERT OR REPLACE INTO Defines VALUES ("NUKE_UNIT_DAMAGE_BASE","3");
INSERT OR REPLACE INTO Defines VALUES ("NUKE_UNIT_DAMAGE_RAND_1","4");
INSERT OR REPLACE INTO Defines VALUES ("NUKE_UNIT_DAMAGE_RAND_2","4");
INSERT OR REPLACE INTO Defines VALUES ("EMBARKED_UNIT_COMBAT_STRENGTH","0");
INSERT OR REPLACE INTO Defines VALUES ("EMBARKED_NOT_CIVILIAN_COMBAT_STRENGTH","500");

--------------------------------------------------------------------------------------------
-- Promotions, vanilla values
--------------------------------------------------------------------------------------------
UPDATE UnitPromotions SET CityAttack = 20 WHERE Type = 'PROMOTION_CITY_SIEGE';

UPDATE UnitPromotions_UnitCombatMods SET Modifier = 100 WHERE PromotionType = 'PROMOTION_ANTI_AIR';
--DELETE FROM Unit_FreePromotions WHERE PromotionType='PROMOTION_ANTI_AIR'; -- Vanilla has it for AA-Guns, but the mod was removing it anyway...
DELETE FROM Unit_FreePromotions WHERE PromotionType='PROMOTION_ANTI_AIR_II'; -- does not exist in vanilla

--------------------------------------------------------------------------------------------
-- Minor Civs Visual Relation Status, Vanilla table
--------------------------------------------------------------------------------------------

DROP TABLE MinorCivTraits_Status;
CREATE TABLE MinorCivTraits_Status ('Type' text , 'StatusIcon' text , 'StatusMeter' text );
INSERT INTO MinorCivTraits_Status VALUES ("FRIENDSHIP_THRESHOLD_ALLIES","CityStateMeterBlue32.dds","CityStateMeterBaseBlue.dds");
INSERT INTO MinorCivTraits_Status VALUES ("FRIENDSHIP_THRESHOLD_FRIENDS","CityStateMeterGreen32.dds","CityStateMeterBaseGreen.dds");
INSERT INTO MinorCivTraits_Status VALUES ("MINOR_FRIENDSHIP_AT_WAR","CityStateMeterRed32.dds","CityStateMeterBaseRed.dds");
INSERT INTO MinorCivTraits_Status VALUES ("FRIENDSHIP_THRESHOLD_NEUTRAL","CityStateMeterBlack32.dds","CityStateMeterBaseGreen.dds");


--------------------------------------------------------------------------------------------
-- THIS MUST BE LAST - code below will fail if we are using civ5 vanilla !
-- anything that would be after won't be initialized...
--------------------------------------------------------------------------------------------

ALTER TABLE Buildings ADD COLUMN 'Culture' INTEGER DEFAULT 0;
*/