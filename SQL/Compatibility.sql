
/*
	This file keep compatibility with Civ5 Vanilla.
	Restore vanilla values when needed.
	Load first, before NewRule apply.	

*/

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
DELETE FROM Unit_FreePromotions WHERE PromotionType='PROMOTION_ANTI_AIR'; -- Vanilla has it for AA-Guns, but the mod was removing it anyway...

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