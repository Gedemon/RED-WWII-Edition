-- Earth 1942
-- Author: Gedemon (Edited by CommanderBly)
-- DateCreated: 8/27/2011
----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------

print("Loading Earth 1942 Defines...")
print("-------------------------------------")

----------------------------------------------------------------------------------------------------------------------------
-- Scenario Rules
----------------------------------------------------------------------------------------------------------------------------

WAR_MINIMUM_STARTING_TURN = 3 -- can't start major war before this turn
CAN_BUILD_UNIT_IN_OCCUPIED_CITY = false -- need special building to build unit in occupied cities
MAX_HP_HEALED = 5 -- Max number of HP healed each turn
REVEAL_ALL_CITIES = false

----------------------------------------------------------------------------------------------------------------------------
-- AI Rules
----------------------------------------------------------------------------------------------------------------------------

ALLOW_AI_CONTROL = true -- Allow the use of functions to (try to) control the AI units and build list
TRACK_COMBATS_MAX_TURNS = 5 -- Number of previous turns entries keeped in the TrackCombat table
DESTROYER_SUB_HUNTING_MAX_TURNS_ATTACK = 2 -- Number of previous turns attacks entries destroyers look at for subhunting
DESTROYER_SUB_HUNTING_MAX_TURNS_TO_TARGET = 3 -- Max turns needed for destroyer to reach last attack plot for subhunting
CRUISER_SUB_HUNTING_MAX_TURNS_ATTACK = 1 -- Number of previous turns attacks entries cruisers look at for subhunting
CRUISER_SUB_HUNTING_MAX_TURNS_TO_TARGET = 1 -- Max turns needed for cruiser to reach last attack plot for subhunting
INTERCEPTOR_MAX_TURNS_ATTACK = 2 -- Number of previous turns attacks entries interceptors look at for rebasing and force interception mission
INTERCEPTOR_RATIO_NEEDED = 4 --If NumAirAttacks / NumInterceptor > Ratio then we need another interceptor
-- Suicide Attacks Prevention
NO_SUICIDE_ATTACK = false -- If set to true, try to prevent suicide attacks
SUICIDE_DAMAGE_THRESHOLD = 8 -- Above this level of damage let's call it a tentative of suicide, but check the below value too
SUICIDE_DIFF_DAMAGE_THRESHOLD = 5 -- Above this difference between damage dealed and damage received, consider that the attack is a large defeat
SUICIDE_HP_RATIO = 4.5 -- Under this ratio between HP left and damage received, call it suicidal 


----------------------------------------------------------------------------------------------------------------------------
-- Calendar
----------------------------------------------------------------------------------------------------------------------------

g_Calendar = {}
local monthList = { "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December" }
--local dayList = { "1", "5", "10", "15", "20", "25" }
local dayList = { "1", "10", "20" }
local turn = 0
for year = 1939, 1946 do -- see large
	for month = 1, #monthList do
		for day = 1, #dayList do
			local bStart = (month >= 1 and year == 1942) -- Start date !
			--local bStart = (month >= 12 and year == 1941) -- Start date !
			if bStart or (year > 1942) then
				--g_Calendar[turn] = monthList[month] .. " " .. dayList[day] .. ", " .. year
				local numMonth, numDay
				if month < 10 then numMonth = "0"..month; else numMonth = month; end
				if tonumber(dayList[day]) < 10 then numDay = "0"..dayList[day]; else numDay = dayList[day]; end
				g_Calendar[turn] = { Text = monthList[month] .. " " .. dayList[day] .. ", " .. year, Number = tonumber(year..numMonth..numDay)}
				turn = turn + 1
			end		
		end
	end
end

----------------------------------------------------------------------------------------------------------------------------
-- Minor Civs ID
-- Must be scenario specific to allow replacing of a major civ reference by a minor...
----------------------------------------------------------------------------------------------------------------------------

AFGHANISTAN = GameInfo.MinorCivilizations.MINOR_CIV_AFGHANISTAN.ID
ARGENTINA = GameInfo.MinorCivilizations.MINOR_CIV_ARGENTINA.ID
AUSTRALIA = GameInfo.MinorCivilizations.MINOR_CIV_AUSTRALIA.ID
ARABIA = GameInfo.MinorCivilizations.MINOR_CIV_ARABIA.ID
BELGIUM = GameInfo.MinorCivilizations.MINOR_CIV_BELGIUM.ID
BOLIVIA = GameInfo.MinorCivilizations.MINOR_CIV_BOLIVIA.ID
BRAZIL = GameInfo.MinorCivilizations.MINOR_CIV_BRAZIL.ID
BULGARIA = GameInfo.MinorCivilizations.MINOR_CIV_BULGARIA.ID
CANADA = GameInfo.MinorCivilizations.MINOR_CIV_CANADA.ID
CHILE = GameInfo.MinorCivilizations.MINOR_CIV_CHILE.ID
COLOMBIA = GameInfo.MinorCivilizations.MINOR_CIV_COLOMBIA.ID
COMMUNISTCHINA = GameInfo.MinorCivilizations.MINOR_CIV_COMMUNISTCHINA.ID
CUBA = GameInfo.MinorCivilizations.MINOR_CIV_CUBA.ID
DOMINICANREPUBLIC = GameInfo.MinorCivilizations.MINOR_CIV_DOMINICANREPUBLIC.ID
ECUADOR = GameInfo.MinorCivilizations.MINOR_CIV_ECUADOR.ID
ELSALVADOR = GameInfo.MinorCivilizations.MINOR_CIV_ELSALVADOR.ID
GUATAMALA = GameInfo.MinorCivilizations.MINOR_CIV_GUATAMALA.ID
FINLAND = GameInfo.MinorCivilizations.MINOR_CIV_FINLAND.ID
HAITI = GameInfo.MinorCivilizations.MINOR_CIV_HAITI.ID
HONDURAS = GameInfo.MinorCivilizations.MINOR_CIV_HONDURAS.ID
HUNGARY = GameInfo.MinorCivilizations.MINOR_CIV_HUNGARY.ID
IRAN = GameInfo.MinorCivilizations.MINOR_CIV_IRAN.ID
IRELAND = GameInfo.MinorCivilizations.MINOR_CIV_IRELAND.ID
MEXICO = GameInfo.MinorCivilizations.MINOR_CIV_MEXICO.ID
MONGOLIA = GameInfo.MinorCivilizations.MINOR_CIV_MONGOLIA.ID
NETHERLANDS = GameInfo.MinorCivilizations.MINOR_CIV_NETHERLANDS.ID
NEWZEALAND = GameInfo.MinorCivilizations.MINOR_CIV_NEWZEALAND.ID
NICARAGUA = GameInfo.MinorCivilizations.MINOR_CIV_NICARAGUA.ID
PARAGUAY = GameInfo.MinorCivilizations.MINOR_CIV_PARAGUAY.ID
PERU = GameInfo.MinorCivilizations.MINOR_CIV_PERU.ID
PORTUGAL = GameInfo.MinorCivilizations.MINOR_CIV_PORTUGAL.ID
ROMANIA = GameInfo.MinorCivilizations.MINOR_CIV_ROMANIA.ID
SOUTHAFRICA = GameInfo.MinorCivilizations.MINOR_CIV_SOUTHAFRICA.ID
SPAIN = GameInfo.MinorCivilizations.MINOR_CIV_SPAIN.ID
SWEDEN = GameInfo.MinorCivilizations.MINOR_CIV_SWEDEN.ID
SWITZERLAND = GameInfo.MinorCivilizations.MINOR_CIV_SWITZERLAND.ID
THAILAND = GameInfo.MinorCivilizations.MINOR_CIV_THAILAND.ID
TIBET = GameInfo.MinorCivilizations.MINOR_CIV_TIBET.ID
TURKEY = GameInfo.MinorCivilizations.MINOR_CIV_TURKEY.ID
URAGUAY = GameInfo.MinorCivilizations.MINOR_CIV_URAGUAY.ID
VENEZUELA = GameInfo.MinorCivilizations.MINOR_CIV_VENEZUELA.ID

----------------------------------------------------------------------------------------------------------------------------
-- Buildings (see RedDefines.lua for IDs)
----------------------------------------------------------------------------------------------------------------------------

-- Available buildings for major civs
g_Major_Buildings = {
	[FRANCE] = {ARSENAL, RADIO, BARRACKS, ACADEMY, COURTHOUSE}, -- , LARGE_AIR_FACTORY : no bombers or heavy bombers
	[ENGLAND] = {FACTORY, ARSENAL, RADIO, BARRACKS, ACADEMY, COURTHOUSE, LAND_FACTORY, SMALL_AIR_FACTORY, MEDIUM_AIR_FACTORY, LARGE_AIR_FACTORY, SHIPYARD},
	[USSR] = {FACTORY, ARSENAL, RADIO, BARRACKS, ACADEMY, COURTHOUSE, LAND_FACTORY, SMALL_AIR_FACTORY, MEDIUM_AIR_FACTORY, LARGE_AIR_FACTORY, SHIPYARD},
	[GERMANY] = {FACTORY, ARSENAL, RADIO, BARRACKS, ACADEMY, COURTHOUSE, LAND_FACTORY, SMALL_AIR_FACTORY, MEDIUM_AIR_FACTORY, LARGE_AIR_FACTORY, SHIPYARD},
	[JAPAN] = {FACTORY, ARSENAL, RADIO, BARRACKS, ACADEMY, COURTHOUSE, LAND_FACTORY, SMALL_AIR_FACTORY, MEDIUM_AIR_FACTORY, LARGE_AIR_FACTORY, SHIPYARD},
	[ITALY] = {FACTORY, ARSENAL, RADIO, BARRACKS, ACADEMY, COURTHOUSE, LAND_FACTORY, SMALL_AIR_FACTORY, MEDIUM_AIR_FACTORY, LARGE_AIR_FACTORY, SHIPYARD},
	[AMERICA] = {FACTORY, RADIO, BARRACKS, ACADEMY, COURTHOUSE, LAND_FACTORY, SMALL_AIR_FACTORY, MEDIUM_AIR_FACTORY, LARGE_AIR_FACTORY, SHIPYARD},
	[CHINA] = {FACTORY, RADIO, BARRACKS, ACADEMY, COURTHOUSE, LAND_FACTORY, SMALL_AIR_FACTORY},
}

-- Buildings pre-request (need all building types listed)
g_Buildings_Req = {
	[LAND_FACTORY] = {FACTORY},
	[SMALL_AIR_FACTORY] = {FACTORY}, 
	[MEDIUM_AIR_FACTORY] = {FACTORY}, 
	[LARGE_AIR_FACTORY] = {FACTORY}, 
	[SHIPYARD] = {FACTORY, HARBOR},
}

-- Buildings mutual exclusion (none of listed buildings allowed)
g_Buildings_Exclusion = {
	[LAND_FACTORY] = {SMALL_AIR_FACTORY, MEDIUM_AIR_FACTORY, LARGE_AIR_FACTORY, SHIPYARD}, 
	[SMALL_AIR_FACTORY] = {LAND_FACTORY, LARGE_AIR_FACTORY, SHIPYARD}, 
	[MEDIUM_AIR_FACTORY] = {LAND_FACTORY, SHIPYARD}, 
	[LARGE_AIR_FACTORY] = {LAND_FACTORY, SMALL_AIR_FACTORY}, 
	[SHIPYARD] = {LAND_FACTORY, SMALL_AIR_FACTORY, MEDIUM_AIR_FACTORY}, 
}

-- Available buildings for minor civs
g_Minor_Buildings = {FACTORY, ARSENAL, BARRACKS, ARMORY, BASE, SMALL_AIR_FACTORY}


----------------------------------------------------------------------------------------------------------------------------
-- Units (see RedDefines.lua for IDs)
----------------------------------------------------------------------------------------------------------------------------

-- Units that are restricted by number for all the game duration (dead units can't be rebuild)
g_UnitMaxNumber= {
	[FR_BATTLESHIP] = 2,
	[FR_BATTLESHIP_2] = 4,
	[GE_BATTLESHIP] = 2,
	[GE_BATTLESHIP_2] = 2,
	[UK_BATTLESHIP] = 4,
	[UK_BATTLESHIP_2] = 3,
	[IT_BATTLESHIP] = 4,
	[JP_BATTLESHIP] = 4,
	[JP_BATTLESHIP_2] = 3,
	[US_BATTLESHIP] = 4,
	[US_BATTLESHIP_2] = 3,
}

-- Units that are restricted by number of instance (dead unit can be rebuild)
g_UnitMaxInstance = {
}

--[[ use default "all units" 
-- Available units for major civs
g_Major_Units = {
	[FRANCE] = {FR_INFANTRY, FR_LEGION, FR_R40, FR_S35, FR_CHAR_D2, FR_B1, FR_LN401, FR_MB152, FR_D520, FR_POTEZ630, FR_AMIOT350, FR_FANTASQUE, FR_SUBMARINE, FR_BATTLESHIP, FR_BATTLESHIP_2, FR_GALISSONIERE, ARTILLERY},
	[ENGLAND] = {UK_INFANTRY, UK_MATILDA_II, UK_CRUISER_IV,  UK_M4_FIREFLY, UK_CHURCHILL, UK_SPITFIRE_V, UK_SPITFIRE_IX, UK_WHIRLWIND, UK_BEAUFIGHTER, UK_WELLINGTON,  UK_HALIFAX, UK_TRIBA, UK_SUBMARINE, UK_BATTLESHIP, UK_BATTLESHIP_2, ARTILLERY, CARRIER},
	[USSR] = {RU_INFANTRY, RU_T34, RU_KV1,  RU_T34_76,  RU_KV2, RU_LA5, RU_LA5_V2, RU_LA7, RU_IL2, RU_PE2, RU_TU2, RU_IL4, RU_PE8, RU_GNEVNY, RU_KIROV, RU_SUBMARINE, RU_BATTLESHIP, ARTILLERY},
	[GERMANY] = {GE_INFANTRY, GE_PANZER_IV_G, GE_PANZER_IV_H, GE_BF109_F, GE_BF109_G, GE_FW190, GE_JU87,  GE_HE111, GE_HE177, GE_JU88, GE_BF110, GE_BF110_F4, GE_JU88C, GE_HE219, GE_DESTROYER, GE_LEIPZIG, GE_DEUTSCHLAND, GE_SUBMARINE, GE_BATTLESHIP, GE_BATTLESHIP_2, ARTILLERY, CARRIER},
	[ITALY] = {IT_INFANTRY,  IT_M15_42, IT_P26_40, IT_BA65, IT_G50,  IT_G55, IT_SM79, IT_SM84, IT_SOLDATI, IT_SUBMARINE,  IT_ZARA, IT_BATTLESHIP, ARTILLERY, CARRIER},
	[AMERICA] = {US_INFANTRY, US_M5STUART, US_SHERMAN, US_SHERMAN_IIA, US_SHERMAN_III, US_P40, US_P51, US_P38, US_SUBMARINE, US_BATTLESHIP_2, US_B17, US_B25, US_FLETCHER, US_BALTIMORE, US_BATTLESHIP, ARTILLERY, US_CARRIER},
	[JAPAN] = {JP_INFANTRY, JP_TYPE97_SHINHORO, JP_TYPE1, JP_TYPE3, JP_TYPE4, JP_TYPE4_CHI_TO, JP_TYPE5, JP_ZERO, JP_AICHI, JP_SUBMARINE, JP_BATTLESHIP_2, JP_KI21, JP_KAGERO, JP_TAKAO, JP_BATTLESHIP, ARTILLERY, JP_CARRIER},
	[CHINA] = {CH_INFANTRY, CH_T26B, CH_P40N, CH_B25, DESTROYER, ARTILLERY},
}--]]

-- Units upgrades
g_UnitUpgrades = {
	[FR_AMR35] = FR_R35,
	[FR_AMC35] = FR_R40,
	[FR_R35] = FR_R40,
	[FR_H35] = FR_H39,
	[GE_PANZER_I] = GE_PANZER_II,
	[GE_PANZER_35] = GE_PANZER_II_L,
	[GE_PANZER_II] = GE_PANZER_II_L,
	[GE_PANZER_III] = GE_PANZER_III_J,
	[GE_PANZER_IV] = GE_PANZER_IV_G,
	[GE_PANZER_III_J] = GE_PANZER_V,
	[GE_PANZER_IV_G] = GE_PANZER_IV_H,
	[GE_BF109] = GE_BF109_F,
	[GE_BF109_F] = GE_BF109_G,
	[GE_BF110] = GE_BF110_F4,
	[UK_CRUISER_I] = UK_CRUISER_II,
	[UK_CRUISER_II] = UK_CRUISER_IV,
	[UK_CRUISER_III] = UK_CRUISER_IV,
	[UK_CRUISER_IV] = UK_A15_CRUSADER,
	[UK_A13_COVENANTER] = UK_A15_CRUSADER,
	[UK_A15_CRUSADER] = UK_A15_CRUSADER_MKIII,
	[UK_VICKERS_MK6B] = UK_MATILDA_I,
	[UK_MATILDA_II] = UK_M4_FIREFLY,
	[UK_SPITFIRE] = UK_SPITFIRE_V,
	[UK_SPITFIRE_V] = UK_SPITFIRE_IX,
	[RU_T34] = RU_T34_76,
	[RU_T34_76] = RU_T34_85,
	[RU_I16] = RU_LAGG3,
	[RU_LAGG3] = RU_LA5,
	[RU_LA5] = RU_LA5_V2,
	[RU_LA5_V2] = RU_LA7,
	[RU_LA5] = RU_LA7,
	[RU_T28] = RU_T34_76,
	[RU_BT2] = RU_BT7,
	[RU_TB3] = RU_PE8,
	[IT_M11_39] = IT_M13_40,
	[IT_M13_40] = IT_M14_41,
	[IT_M14_41] = IT_M15_42,
	[IT_CR42] = IT_G50,
	[IT_G50] = IT_G55,
	[US_M3STUART] = US_M5STUART,
	[US_M3_GRANT] = US_SHERMAN_IIA,
	[US_SHERMAN] = US_SHERMAN_IIA,
	[US_SHERMAN_IIA] = US_SHERMAN_III,
	[US_SHERMAN_III] = US_SHERMAN_IIIA,
	[US_SHERMAN_IIIA] = US_SHERMAN_JUMBO,
	[US_SHERMAN_JUMBO] = US_SHERMAN_EASYEIGHT,
	[US_P36] = US_P40,
}

-- unit type called when AI need reserve troops
g_Reserve_Unit = {
	[FRANCE] = { {Prob = 50, ID = FR_INFANTRY}, {Prob = 20, ID = FR_AMR35}, {Prob = 15, ID = FR_FCM36}, },
	[ENGLAND] = { {Prob = 50, ID = UK_INFANTRY}, {Prob = 20, ID = UK_VICKERS_MK6B}, {Prob = 15, ID = UK_TETRARCH},  },
	[USSR] = { {Prob = 50, ID = RU_INFANTRY}, {Prob = 20, ID = RU_T26}, {Prob = 15, ID = RU_T26},  },
	[GERMANY] = { {Prob = 50, ID = GE_INFANTRY}, {Prob = 20, ID = GE_PANZER_I}, {Prob = 15, ID = GE_PANZER_35},  },
	[ITALY] = { {Prob = 50, ID = IT_INFANTRY}, {Prob = 20, ID = IT_L6_40}, {Prob = 15, ID = IT_L6_40},  },
	[AMERICA] = { {Prob = 65, ID = US_INFANTRY}, {Prob = 20, ID = US_M3STUART},  },
	[JAPAN] = { {Prob = 65, ID = JP_INFANTRY}, {Prob = 20, ID = JP_TYPE97},  },
	[CHINA] = { {Prob = 85, ID = CH_INFANTRY},  },
}

-- Thresholds used to check if AI need to call reserve troops
g_Reserve_Data = { 
	-- UnitThreshold : minimum number of land units left
	-- LandThreshold : minimum number of plot left
	-- LandUnitRatio : ratio between lands and units, use higher ratio when the nation as lot of space between cities
	[USSR] = {UnitThreshold = 16, LandThreshold = 2000, LandUnitRatio = 50}, -- initial plots = 2000<
	[ITALY] = {UnitThreshold = 10, LandThreshold = 90, LandUnitRatio = 4}, -- initial plots = 111
	[CHINA] = {UnitThreshold = 14, LandThreshold = 220, LandUnitRatio = 7}, -- initial plots = 220
}

-- Unit ratio restriction used by AI
g_Unit_Ratio = { 
	-- Air		<= military units / air units
	-- Sea		<= military units / sea units
	-- Armor	<= land units / armor units
	-- Artillery<= land units / artillery units
	[FRANCE] = {Air = 5, Sea = 5, Armor = 2, Artillery = 5,},
	[ENGLAND] = {Air = 3, Sea = 3, Armor = 2, Artillery = 5,},
	[USSR] = {Air = 5, Sea = 10, Armor = 3, Artillery = 4,},
	[GERMANY] = {Air = 5, Sea = 5, Armor = 1.5, Artillery = 5,},
	[ITALY] = {Air = 5, Sea = 4, Armor = 3, Artillery = 5,},
	[AMERICA] = {Air = 2, Sea = 2, Armor = 2, Artillery = 4,},
	[JAPAN] = {Air = 3, Sea = 2, Armor = 5, Artillery = 6,},
	[CHINA] = {Air = 6, Sea = 10, Armor = 5, Artillery = 5,},
}

-- Available units for minor civs
g_Minor_Units = {INFANTRY, TANK, FIGHTER, DESTROYER}


-- Order of Battle
-- group size = 7 units max placed in (and around) plot (x,y), except air placed only in central plot (should be city plot)
-- we can initialize any units here, no restriction by nation like in build list
g_Initial_OOB = { 
	
}

----------------------------------------------------------------------------------------------------------------------------
-- Units Classes  (see RedDefines.lua for IDs and data table)
----------------------------------------------------------------------------------------------------------------------------

-- Minors classes replacing
g_Minor_UU = {
}

----------------------------------------------------------------------------------------------------------------------------
-- Projects  (see RedDefines.lua for IDs and data table)
----------------------------------------------------------------------------------------------------------------------------

-- projects available at start of scenario
g_ProjectsAvailableAtStart = {
	[FRANCE] = {PROJECT_D520,  PROJECT_H39, PROJECT_R40, PROJECT_ATTACK_AIRCRAFT},
	[USSR] = {PROJECT_LAGG3, PROJECT_LA5, PROJECT_IL2,  PROJECT_IL4, PROJECT_HEAVY_BOMBER, PROJECT_TU2, PROJECT_SOYUZ, PROJECT_T34},
	[ITALY] = {PROJECT_ATTACK_AIRCRAFT, PROJECT_SM84, PROJECT_G55, PROJECT_M13_40, PROJECT_M14_41, PROJECT_M15_42, PROJECT_P26_40},
	[GERMANY] = {PROJECT_BF109F, PROJECT_BF110, PROJECT_BF110F4, PROJECT_JU88, PROJECT_HE177, PROJECT_PANZER_III, PROJECT_PANZER_III_J, PROJECT_PANZER_IV, PROJECT_PANZER_IV_G},
	[ENGLAND] = {PROJECT_HEAVY_BOMBER, PROJECT_MOSQUITO, PROJECT_CRUISER_IV, PROJECT_WHIRLWIND, PROJECT_BEAUFIGHTER, PROJECT_SPITFIRE_V,},
	[AMERICA] = {PROJECT_M5STUART, PROJECT_P40, PROJECT_P38, PROJECT_B17, PROJECT_B25},
}

g_ProjectsTable[PROJECT_PANZER_II_L] =  {
	Buildings = {ACADEMY, FACTORY},
	Trigger = {Type = "date", Value = 19430101, ProbPerTurn = 5},
}

----------------------------------------------------------------------------------------------------------------------------
-- Diplomacy
----------------------------------------------------------------------------------------------------------------------------

-- Virtual allies
g_Allied = {
	[FRANCE] = true,
	[ENGLAND] = true,
	[USSR] = true,
	[AMERICA] = true,
	[CHINA] = true,
}
g_Axis = {
	[GERMANY] = true,
	[ITALY] = true,
	[JAPAN] = true,
}

-- Major Civilizations
-- to do in all table : add entry bCheck = function() return true or false, apply change only if true or nill 
g_Major_Diplomacy = {
	[19420101] = { 
		{Type = DOW, Civ1 = FRANCE, Civ2 = GERMANY},
		{Type = DOW, Civ1 = ENGLAND, Civ2 = GERMANY},
		{Type = DOW, Civ1 = USSR, Civ2 = GERMANY},
		{Type = DOW, Civ1 = AMERICA, Civ2 = GERMANY},
		{Type = DOW, Civ1 = ENGLAND, Civ2 = ITALY},
		{Type = DOW, Civ1 = FRANCE, Civ2 = ITALY},
		{Type = DOW, Civ1 = AMERICA, Civ2 = ITALY},
		{Type = DOW, Civ1 = USSR, Civ2 = ITALY},
		{Type = DOW, Civ1 = ENGLAND, Civ2 = JAPAN},
		{Type = DOW, Civ1 = FRANCE, Civ2 = JAPAN},
		{Type = DOW, Civ1 = AMERICA, Civ2 = JAPAN},
		{Type = DOW, Civ1 = CHINA, Civ2 = JAPAN},
	},
}

-- Minor Civilizations
g_Minor_Relation = {
	[19420101] = { 
		{Value = 120, Major = FRANCE, Minor = BELGIUM},
		{Value = 50, Major = FRANCE, Minor = DOMINICANREPUBLIC},
		{Value = 50, Major = FRANCE, Minor = HAITI},
		{Value = 50, Major = FRANCE, Minor = SOUTHAFRICA},
		{Value = 50, Major = FRANCE, Minor = HONDURAS},
		{Value = 50, Major = FRANCE, Minor = AUSTRALIA},
		{Value = 50, Major = FRANCE, Minor = NEWZEALAND},
		{Value = 120, Major = FRANCE, Minor = NETHERLANDS},
		{Value = 50, Major = FRANCE, Minor = CUBA},
		{Value = 50, Major = FRANCE, Minor = GUATAMALA},
		{Value = 50, Major = FRANCE, Minor = ELSALVADOR},
		{Value = 50, Major = FRANCE, Minor = CANADA},
		{Value = 50, Major = FRANCE, Minor = NICARAGUA},
		{Value = 120, Major = ENGLAND, Minor = BELGIUM},
		{Value = 50, Major = ENGLAND, Minor = DOMINICANREPUBLIC},
		{Value = 50, Major = ENGLAND, Minor = HAITI},
		{Value = 120, Major = ENGLAND, Minor = SOUTHAFRICA},
		{Value = 50, Major = ENGLAND, Minor = HONDURAS},
		{Value = 120, Major = ENGLAND, Minor = AUSTRALIA},
		{Value = 120, Major = ENGLAND, Minor = NEWZEALAND},
		{Value = 120, Major = ENGLAND, Minor = NETHERLANDS},
		{Value = 50, Major = ENGLAND, Minor = CUBA},
		{Value = 50, Major = ENGLAND, Minor = GUATAMALA},
		{Value = 50, Major = ENGLAND, Minor = ELSALVADOR},
		{Value = 120, Major = ENGLAND, Minor = CANADA},
		{Value = 50, Major = ENGLAND, Minor = NICARAGUA},
		{Value = 50, Major = AMERICA, Minor = BELGIUM},
		{Value = 120, Major = AMERICA, Minor = DOMINICANREPUBLIC},
		{Value = 120, Major = AMERICA, Minor = HAITI},
		{Value = 50, Major = AMERICA, Minor = SOUTHAFRICA},
		{Value = 120, Major = AMERICA, Minor = HONDURAS},
		{Value = 50, Major = AMERICA, Minor = AUSTRALIA},
		{Value = 50, Major = AMERICA, Minor = NEWZEALAND},
		{Value = 50, Major = AMERICA, Minor = NETHERLANDS},
		{Value = 50, Major = AMERICA, Minor = BRAZIL},
		{Value = 50, Major = AMERICA, Minor = VENEZUELA},
		{Value = 50, Major = AMERICA, Minor = ECUADOR},
		{Value = 120, Major = AMERICA, Minor = CUBA},
		{Value = 120, Major = AMERICA, Minor = GUATAMALA},
		{Value = 120, Major = AMERICA, Minor = ELSALVADOR},
		{Value = 120, Major = AMERICA, Minor = CANADA},
		{Value = 120, Major = AMERICA, Minor = NICARAGUA},
		{Value = 50, Major = CHINA, Minor = BELGIUM},
		{Value = 50, Major = CHINA, Minor = DOMINICANREPUBLIC},
		{Value = 50, Major = CHINA, Minor = HAITI},
		{Value = 50, Major = CHINA, Minor = SOUTHAFRICA},
		{Value = 50, Major = CHINA, Minor = HONDURAS},
		{Value = 50, Major = CHINA, Minor = AUSTRALIA},
		{Value = 50, Major = CHINA, Minor = NEWZEALAND},
		{Value = 50, Major = CHINA, Minor = NETHERLANDS},
		{Value = 50, Major = CHINA, Minor = CUBA},
		{Value = 50, Major = CHINA, Minor = GUATAMALA},
		{Value = 50, Major = CHINA, Minor = ELSALVADOR},
		{Value = 50, Major = CHINA, Minor = CANADA},
		{Value = 50, Major = CHINA, Minor = NICARAGUA},
		{Value = 120, Major = USSR, Minor = MONGOLIA},
		{Value = 50, Major = USSR, Minor = COMMUNISTCHINA},
		{Value = 120, Major = GERMANY, Minor = HUNGARY},
		{Value = 120, Major = GERMANY, Minor = ROMANIA},
		{Value = 120, Major = GERMANY, Minor = BULGARIA},
		{Value = 50, Major = GERMANY, Minor = FINLAND},
		{Value = 50, Major = GERMANY, Minor = THAILAND},
		{Value = 120, Major = ITALY, Minor = HUNGARY},
		{Value = 120, Major = ITALY, Minor = ROMANIA},
		{Value = 120, Major = ITALY, Minor = BULGARIA},
		{Value = 50, Major = ITALY, Minor = FINLAND},
		{Value = 50, Major = ITALY, Minor = THAILAND},
		{Value = 50, Major = JAPAN, Minor = HUNGARY},
		{Value = 50, Major = JAPAN, Minor = ROMANIA},
		{Value = 50, Major = JAPAN, Minor = BULGARIA},
		{Value = 50, Major = JAPAN, Minor = FINLAND},
		{Value = 120, Major = JAPAN, Minor = THAILAND},
	},
}

g_Major_Minor_DoW = {
[19420101] = { 
		{Major = GERMANY, Minor = BELGIUM},
		{Major = GERMANY, Minor = DOMINICANREPUBLIC},
		{Major = GERMANY, Minor = HAITI},
		{Major = GERMANY, Minor = SOUTHAFRICA},
		{Major = GERMANY, Minor = HONDURAS},
		{Major = GERMANY, Minor = AUSTRALIA},
		{Major = GERMANY, Minor = NEWZEALAND},
		{Major = GERMANY, Minor = NETHERLANDS},
		{Major = GERMANY, Minor = CUBA},
		{Major = GERMANY, Minor = GUATAMALA},
		{Major = GERMANY, Minor = ELSALVADOR},
		{Major = GERMANY, Minor = CANADA},
		{Major = GERMANY, Minor = NICARAGUA},
		{Major = JAPAN, Minor = BELGIUM},
		{Major = JAPAN, Minor = DOMINICANREPUBLIC},
		{Major = JAPAN, Minor = HAITI},
		{Major = JAPAN, Minor = SOUTHAFRICA},
		{Major = JAPAN, Minor = HONDURAS},
		{Major = JAPAN, Minor = AUSTRALIA},
		{Major = JAPAN, Minor = NEWZEALAND},
		{Major = JAPAN, Minor = NETHERLANDS},
		{Major = JAPAN, Minor = CUBA},
		{Major = JAPAN, Minor = GUATAMALA},
		{Major = JAPAN, Minor = ELSALVADOR},
		{Major = JAPAN, Minor = CANADA},
		{Major = JAPAN, Minor = NICARAGUA},
		{Major = ITALY, Minor = BELGIUM},
		{Major = ITALY, Minor = DOMINICANREPUBLIC},
		{Major = ITALY, Minor = HAITI},
		{Major = ITALY, Minor = SOUTHAFRICA},
		{Major = ITALY, Minor = HONDURAS},
		{Major = ITALY, Minor = AUSTRALIA},
		{Major = ITALY, Minor = NEWZEALAND},
		{Major = ITALY, Minor = NETHERLANDS},
		{Major = ITALY, Minor = CUBA},
		{Major = ITALY, Minor = GUATAMALA},
		{Major = ITALY, Minor = ELSALVADOR},
		{Major = ITALY, Minor = CANADA},
		{Major = ITALY, Minor = NICARAGUA},
		{Major = ENGLAND, Minor = HUNGARY},
		{Major = ENGLAND, Minor = ROMANIA},
		{Major = ENGLAND, Minor = BULGARIA},
		{Major = ENGLAND, Minor = THAILAND},
		{Major = USSR, Minor = FINLAND},
		{Major = FRANCE, Minor = HUNGARY},
		{Major = FRANCE, Minor = ROMANIA},
		{Major = FRANCE, Minor = BULGARIA},
		{Major = FRANCE, Minor = THAILAND},
		{Major = AMERICA, Minor = HUNGARY},
		{Major = AMERICA, Minor = ROMANIA},
		{Major = AMERICA, Minor = BULGARIA},
		{Major = AMERICA, Minor = THAILAND},
		{Major = USSR, Minor = HUNGARY},
		{Major = USSR, Minor = ROMANIA},
		{Major = USSR, Minor = BULGARIA},
		{Major = USSR, Minor = THAILAND},
		{Major = CHINA, Minor = THAILAND},
	},
}

g_Major_Minor_Peace = {
}

g_Minor_Minor_DoW = {
}

g_Minor_Major_DoW = {
}

----------------------------------------------------------------------------------------------------------------------------
-- Cities
----------------------------------------------------------------------------------------------------------------------------

-- Populate cities with buildings
g_Cities = {
	--Germany
	{X = 22, Y = 70, Buildings = { FACTORY, BANK, BASE, BARRACKS, LARGE_AIR_FACTORY, ACADEMY }, AIBuildings = {RADIO, ARSENAL, HOSPITAL}, }, -- Berlin
	{X = 20, Y = 71, Buildings = { FACTORY, SHIPYARD, HARBOR, BARRACKS }, AIBuildings = {RADIO, HOSPITAL}, }, -- Hamburg
	{X = 19, Y = 68, Buildings = { FACTORY, LAND_FACTORY, BARRACKS }, AIBuildings = {RADIO, HOSPITAL}, }, -- Cologne
	{X = 20, Y = 67, Buildings = { FACTORY, MEDIUM_AIR_FACTORY, BARRACKS }, AIBuildings = {HOSPITAL}, }, -- Frankfurt
	{X = 20, Y = 65, Buildings = { FACTORY, BARRACKS, LAND_FACTORY, RADIO }, AIBuildings = {HOSPITAL}, }, -- Munich
	{X = 23, Y = 68, Buildings = { FACTORY, BARRACKS, SMALL_AIR_FACTORY }, AIBuildings = {ARSENAL}, }, -- Dresden
	{X = 27, Y = 69, Buildings = { FACTORY, BANK, BARRACKS, SMALL_AIR_FACTORY, RADIO }, AIBuildings = {HOSPITAL}, }, -- Warsaw
	{X = 13, Y = 68, Buildings = { FACTORY, BANK, BARRACKS, LARGE_AIR_FACTORY, RADIO }, AIBuildings = {ARSENAL, HOSPITAL}, }, -- Paris
	--Soviet Union
	{X = 34, Y = 77, Buildings = { FACTORY, BASE, BARRICADE, BARRACKS, HARBOR }, AIBuildings = {HOSPITAL, RADIO}, }, -- Leningrad
	{X = 38, Y = 72, Buildings = { FACTORY, BASE, BARRICADE, BARRACKS, LAND_FACTORY }, AIBuildings = {ARSENAL, RADIO, HOSPITAL, BANK}, }, -- Moscow
	{X = 42, Y = 68, Buildings = { FACTORY, BARRACKS, LAND_FACTORY }, AIBuildings = {RADIO, ARSENAL}, }, -- Stalingrad
	{X = 39, Y = 65, Buildings = { FACTORY, BARRACKS, SMALL_AIR_FACTORY }, AIBuildings = {HOSPITAL}, }, -- Rostov
	{X = 40, Y = 74, Buildings = { FACTORY, BARRACKS, MEDIUM_AIR_FACTORY }, AIBuildings = {HOSPITAL}, }, -- Novgorod
	{X = 93, Y = 68, Buildings = { FACTORY, BARRACKS, HARBOR }, AIBuildings = {BANK}, }, -- Vladivostok
	--United Kingdom
	{X = 13, Y = 70, Buildings = { FACTORY, BANK, BARRACKS, ARSENAL, LARGE_AIR_FACTORY, HARBOR, SHIPYARD }, AIBuildings = {HOSPITAL, RADIO}, }, -- London
	{X = 10, Y = 71, Buildings = { FACTORY, BANK, BARRACKS, SMALL_AIR_FACTORY }, AIBuildings = {HOSPITAL, RADIO}, }, -- Birmingham
	{X = 10, Y = 73, Buildings = { FACTORY, BANK, BARRACKS, LAND_FACTORY }, AIBuildings = {HOSPITAL, RADIO}, }, -- Manchester
	{X = 10, Y = 75, Buildings = { FACTORY, BANK, BARRACKS, HARBOR, SHIPYARD }, AIBuildings = {HOSPITAL}, }, -- Edinburgh
	{X = 59, Y = 51, Buildings = { FACTORY, BANK, RADIO }, AIBuildings = {BARRACKS}, }, -- Dehli
	--France
	{X = 165, Y = 36, Buildings = { BARRACKS, HARBOR }, AIBuildings = {BANK, HOSPITAL, RADIO, ARSENAL}, }, -- Cayenne
	{X = 37, Y = 53, Buildings = { BARRACKS }, AIBuildings = {BANK, HOSPITAL, RADIO, ARSENAL}, }, -- Damascus
	--Italy
	{X = 20, Y = 60, Buildings = { FACTORY, LAND_FACTORY, BARRACKS }, AIBuildings = {BANK, HOSPITAL}, }, -- Florence
	{X = 21, Y = 58, Buildings = { FACTORY, BANK, HARBOR, SHIPYARD, BARRACKS }, AIBuildings = {HOSPITAL, RADIO}, }, -- Rome
	{X = 22, Y = 57, Buildings = { FACTORY, SMALL_AIR_FACTORY, BARRACKS }, AIBuildings = {HOSPITAL}, }, -- Naples
	--Japan
	{X = 97, Y = 58, Buildings = { FACTORY, BANK, BARRACKS, SMALL_AIR_FATORY, HARBOR }, AIBuildings = {SHIPYARD, HOSPITAL}, }, -- Tokyo
	{X = 95, Y = 57, Buildings = { FACTORY, BARRACKS, SHIPYARD, HARBOR }, AIBuildings = {BANK, HOSPITAL}, }, -- Kyoto
	{X = 93, Y = 57, Buildings = { FACTORY, BARRACKS }, AIBuildings = {BASE, RADIO, HOSPITAL}, }, -- Hiroshima
	{X = 96, Y = 67, Buildings = { FACTORY, BARRACKS, HARBOR }, AIBuildings = {SHIPYARD}, }, -- Sapparo
	{X = 89, Y = 62, Buildings = { FACTORY, BARRACKS }, AIBuildings = {RADIO, BANK}, }, -- Seoul
	{X = 82, Y = 61, Buildings = { FACTORY, BANK }, AIBuildings = {RADIO, HOSPITAL}, }, -- Peking
	--China
	{X = 78, Y = 53, Buildings = { FACTORY, BANK, BARRACKS, BARRICADE }, AIBuildings = {LAND_FACTORY, BANK, HOSPITAL, RADIO, ARSENAL}, }, -- Chongquig
	{X = 77, Y = 60, Buildings = { FACTORY, BANK, BARRACKS, BARRICADE }, AIBuildings = {BANK, HOSPITAL, RADIO, ARSENAL}, }, -- Xian
	{X = 83, Y = 49, Buildings = { FACTORY, BANK, BARRACKS, BARRICADE }, AIBuildings = {BANK, HOSPITAL, RADIO, ARSENAL}, }, -- Guangzhao
	{X = 82, Y = 54, Buildings = { FACTORY, BANK, BARRACKS }, AIBuildings = {BANK, HOSPITAL, RADIO, ARSENAL}, }, -- Wuhan
	--United States
	{X = 155, Y = 63, Buildings = { FACTORY, BANK, BASE, BARRACKS, RADIO, ARSENAL, ACADEMY }, AIBuildings = {HOSPITAL}, }, -- Washington
	{X = 150, Y = 67, Buildings = { FACTORY, LAND_FACTORY, BARRACKS, RADIO }, AIBuildings = {HOSPITAL}, }, -- Detriot
	{X = 156, Y = 65, Buildings = { FACTORY, BANK, HARBOR, SHIPYARD, SMALL_AIR_FACTORY, RADIO, BARRACKS }, AIBuildings = {HOSPITAL, ARSENAL, ACADEMY}, }, -- New York
	{X = 157, Y = 67, Buildings = { FACTORY, BANK, BARRACKS, HARBOR, MEDIUM_AIR_FACTORY, RADIO }, AIBuildings = {HOSPITAL}, }, -- Boston
	{X = 150, Y = 59, Buildings = { FACTORY, BARRACKS, LAND_FACTORY }, AIBuildings = {HOSPITAL, RADIO}, }, -- Atlanta
	{X = 148, Y = 66, Buildings = { FACTORY, BANK, BARRACKS, LAND_FACTORY, RADIO, HOSPITAL }, AIBuildings = {ARSENAL, ACEDEMY}, }, -- Chicago
	{X = 148, Y = 64, Buildings = { FACTORY, BARRACKS, LAND_FACTORY }, AIBuildings = {HOSPITAL, RADIO}, }, -- Indianapolis
	{X = 141, Y = 55, Buildings = { FACTORY, BANK, ARSENAL, BARRACKS, HARBOR, RADIO, LARGE_AIR_FACTORY }, AIBuildings = {HOSPITAL, ACADEMY}, }, -- Houston
	{X = 130, Y = 61, Buildings = { FACTORY, BANK, HARBOR, SHIPYARD, BARRACKS, RADIO }, AIBuildings = {HOSPITAL, ACEDEMY}, }, -- Los Angeles
	{X = 131, Y = 59, Buildings = { FACTORY, HARBOR, SHIPYARD, BARRACKS }, AIBuildings = {RADIO, HOSPITAL, ARSENAL}, }, -- San Diego
	{X = 130, Y = 69, Buildings = { FACTORY, HARBOR, SHIPYARD, LARGE_AIR_FACTORY, RADIO, BARRACKS }, AIBuildings = {HOSPITAL, BANK}, }, -- Seattle
	{X = 130, Y = 64, Buildings = { FACTORY, HARBOR, SHIPYARD, BARRACKS }, AIBuildings = {RADIO, HOSPITAL, BANK}, }, -- San Francisco
	{X = 141, Y = 58, Buildings = { FACTORY, SMALL_AIR_FACTORY, BARRACKS }, AIBuildings = {HOSPITAL, RADIO}, }, -- Dallas
}

----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------


