-- RedAmericaEurope1936Defines
-- Author: Gedemon
-- DateCreated: 7/9/2011
----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------

print("Loading America/Euro 1936 Defines...")
print("-------------------------------------")

----------------------------------------------------------------------------------------------------------------------------
-- Scenario Rules
----------------------------------------------------------------------------------------------------------------------------

-- WAR_MINIMUM_STARTING_TURN is completed/replaced by selectable option "Allow Alternate History"
WAR_MINIMUM_STARTING_TURN = 5
-- @T_KCommanderbly: fell free to edit it back to 113 even with alternate history option, it's your scenario ;-)
-- BTW the option entry can also be removed from this scenario setup screen.

CAN_BUILD_UNIT_IN_OCCUPIED_CITY = false -- need special building to build unit in occupied cities
MAX_HP_HEALED = 5 -- Max number of HP healed each turn
REVEAL_ALL_CITIES = true
BEACHHEAD_DAMAGE = true -- Amphibious assault on an empty tile owned by enemy civ will cause damage to the landing unit

NUM_BUILDINGS_IMPORTANT_CITY = 3 -- switch to health production on first turn for cities with less than 3 buildings added.

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
for year = 1936, 1946 do -- see large
	for month = 1, #monthList do
		for day = 1, #dayList do
			--local bStart = (month >= 8 and year == 1939) -- Start date !
			local bStart = (month >= 7 and year == 1936) -- Start date !
			if bStart or (year > 1936) then
				--g_Calendar[turn] = monthList[month] .. " " .. dayList[day] .. ", " .. year -- old format
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

ALBANIA = GameInfo.MinorCivilizations.MINOR_CIV_ALBANIA.ID
ARABIA = GameInfo.MinorCivilizations.MINOR_CIV_ARABIA.ID
AUSTRIA = GameInfo.MinorCivilizations.MINOR_CIV_AUSTRIA.ID
BELGIUM = GameInfo.MinorCivilizations.MINOR_CIV_BELGIUM.ID
BULGARIA = GameInfo.MinorCivilizations.MINOR_CIV_BULGARIA.ID
CANADA = GameInfo.MinorCivilizations.MINOR_CIV_CANADA.ID
CZECHOSOLVAKIA = GameInfo.MinorCivilizations.MINOR_CIV_CZECHOSOLVAKIA.ID
DENMARK = GameInfo.MinorCivilizations.MINOR_CIV_DENMARK.ID
ESTONIA = GameInfo.MinorCivilizations.MINOR_CIV_ESTONIA.ID
FINLAND = GameInfo.MinorCivilizations.MINOR_CIV_FINLAND.ID
GREECE = GameInfo.MinorCivilizations.MINOR_CIV_GREECE.ID
HUNGARY = GameInfo.MinorCivilizations.MINOR_CIV_HUNGARY.ID
IRELAND = GameInfo.MinorCivilizations.MINOR_CIV_IRELAND.ID
LATVIA = GameInfo.MinorCivilizations.MINOR_CIV_LATVIA.ID
LITHUANIA = GameInfo.MinorCivilizations.MINOR_CIV_LITHUANIA.ID
LUXEMBOURG = GameInfo.MinorCivilizations.MINOR_CIV_LUXEMBOURG.ID
NSPAIN = GameInfo.MinorCivilizations.MINOR_CIV_NATIONALISTSPAIN.ID
NETHERLANDS = GameInfo.MinorCivilizations.MINOR_CIV_NETHERLANDS.ID
NORWAY = GameInfo.MinorCivilizations.MINOR_CIV_NORWAY.ID
POLAND = GameInfo.MinorCivilizations.MINOR_CIV_POLAND.ID
PORTUGAL = GameInfo.MinorCivilizations.MINOR_CIV_PORTUGAL.ID
RSPAIN = GameInfo.MinorCivilizations.MINOR_CIV_REPUBLICANSPAIN.ID
ROMANIA = GameInfo.MinorCivilizations.MINOR_CIV_ROMANIA.ID
SLOVAKIA = GameInfo.MinorCivilizations.MINOR_CIV_SLOVAKIA.ID
SWEDEN = GameInfo.MinorCivilizations.MINOR_CIV_SWEDEN.ID
SWITZERLAND = GameInfo.MinorCivilizations.MINOR_CIV_SWITZERLAND.ID
TURKEY = GameInfo.MinorCivilizations.MINOR_CIV_TURKEY.ID
VICHY = GameInfo.MinorCivilizations.MINOR_CIV_VICHY.ID
YUGOSLAVIA = GameInfo.MinorCivilizations.MINOR_CIV_YUGOSLAVIA.ID


----------------------------------------------------------------------------------------------------------------------------
-- Buildings (see RedDefines.lua for IDs)
----------------------------------------------------------------------------------------------------------------------------

-- Available buildings for major civs
g_Major_Buildings = {
	[FRANCE] = {FACTORY, ARSENAL, HARBOR, RADIO, BARRACKS, ACADEMY, BASE, HOSPITAL, BANK, COURTHOUSE, LAND_FACTORY, SMALL_AIR_FACTORY, MEDIUM_AIR_FACTORY, SHIPYARD}, -- , LARGE_AIR_FACTORY : no bombers or heavy bombers
	[ENGLAND] = {FACTORY, ARSENAL, HARBOR, RADIO, BARRACKS, ACADEMY, BASE, HOSPITAL, BANK, COURTHOUSE, LAND_FACTORY, SMALL_AIR_FACTORY, MEDIUM_AIR_FACTORY, LARGE_AIR_FACTORY, SHIPYARD},
	[USSR] = {FACTORY, ARSENAL, HARBOR, RADIO, BARRACKS, ACADEMY, BASE, HOSPITAL, BANK, COURTHOUSE, LAND_FACTORY, SMALL_AIR_FACTORY, MEDIUM_AIR_FACTORY, LARGE_AIR_FACTORY, SHIPYARD},
	[GERMANY] = {FACTORY, ARSENAL, HARBOR, RADIO, BARRACKS, ACADEMY, BASE, HOSPITAL, BANK, COURTHOUSE, LAND_FACTORY, SMALL_AIR_FACTORY, MEDIUM_AIR_FACTORY, LARGE_AIR_FACTORY, SHIPYARD},
	[ITALY] = {FACTORY, ARSENAL, HARBOR, RADIO, BARRACKS, ACADEMY, BASE, HOSPITAL, BANK, COURTHOUSE, LAND_FACTORY, SMALL_AIR_FACTORY, MEDIUM_AIR_FACTORY, LARGE_AIR_FACTORY, SHIPYARD},
	[AMERICA] = {FACTORY, ARSENAL, HARBOR, RADIO, BARRACKS, ACADEMY, BASE, HOSPITAL, BANK, COURTHOUSE, LAND_FACTORY, SMALL_AIR_FACTORY, MEDIUM_AIR_FACTORY, LARGE_AIR_FACTORY, SHIPYARD},
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
	[LARGE_AIR_FACTORY] = {LAND_FACTORY, SMALL_AIR_FACTORY, SHIPYARD}, 
	[SHIPYARD] = {LAND_FACTORY, SMALL_AIR_FACTORY, MEDIUM_AIR_FACTORY, LARGE_AIR_FACTORY}, 
}

-- Available buildings for minor civs
g_Minor_Buildings = {FACTORY, ARSENAL, HARBOR, BARRACKS, ARMORY, BASE, SMALL_AIR_FACTORY, MEDIUM_AIR_FACTORY}


----------------------------------------------------------------------------------------------------------------------------
-- Units (see RedDefines.lua for IDs)
----------------------------------------------------------------------------------------------------------------------------

-- Available units for major civs
g_Major_Units = {
	[FRANCE] = {
		FR_INFANTRY, FR_LEGION,
		FR_R35, FR_R40, FR_H35, FR_H39,
		FR_S35, FR_B1, FR_ARL44,
		FR_MB152, FR_D520, FR_POTEZ630,
		FR_LN401, FR_AMIOT350,
		FR_FANTASQUE, FR_GALISSONIERE, FR_SUBMARINE, FR_BATTLESHIP, FR_BATTLESHIP_2,
		ARTILLERY},
	[ENGLAND] = {
		UK_INFANTRY,
		UK_MATILDA_I, UK_CRUISER_II, UK_CRUISER_III, UK_CRUISER_IV, UK_A10_VALENTINE, UK_A15_CRUSADER,
		UK_MATILDA_II, UK_M4_FIREFLY,
		UK_CHURCHILL,
		UK_SPITFIRE, UK_SPITFIRE_V, UK_SPITFIRE_IX, UK_WHIRLWIND, UK_BEAUFIGHTER,
		UK_MOSQUITO, UK_WELLINGTON, UK_HALIFAX, UK_LANCASTER,
		UK_TRIBA, UK_SUBMARINE, UK_DIDO, UK_BATTLESHIP, UK_BATTLESHIP_2,
		ARTILLERY},
	[USSR] = {
		RU_INFANTRY,
		RU_T26, RU_BT7,
		RU_T28, RU_T34, RU_T34_76, RU_T34_85,
		RU_KV1, RU_KV2, RU_IS_1, RU_IS_2,
		RU_I16, RU_LAGG3, RU_LA5, RU_LA5_V2, RU_LA7, RU_YAK_7,
		RU_IL2, RU_PE2, RU_TU2, RU_IL4, RU_TB3, RU_PE8,
		RU_GNEVNY, RU_SUBMARINE, RU_KIROV, RU_BATTLESHIP,
		ARTILLERY},
	[GERMANY] = {
		GE_INFANTRY,
		GE_PANZER_II, GE_PANZER_II_L,
		GE_PANZER_III, GE_PANZER_III_J, GE_PANZER_IV, GE_PANZER_IV_G, GE_PANZER_IV_H, GE_PANZER_V,
		GE_PANZER_VI,
		GE_BF109, GE_BF109_F, GE_BF109_G, GE_FW190, GE_BF110, GE_BF110_F4, GE_JU88C, GE_HE219,
		GE_JU87, GE_JU88, GE_HE111, GE_HE177,
		GE_DESTROYER, GE_SUBMARINE, GE_LEIPZIG, GE_DEUTSCHLAND, GE_BATTLESHIP, GE_BATTLESHIP_2,
		ARTILLERY},
	[ITALY] = {
		IT_INFANTRY,
		IT_L6_40, IT_M11_39, IT_M13_40, IT_M14_41, IT_M15_42, IT_P26_40,
		IT_G50, IT_G55, IT_C202,
		IT_BA65, IT_SM79, IT_SM84,
		IT_SOLDATI, IT_SUBMARINE, IT_ZARA, IT_BATTLESHIP,
		ARTILLERY},
	[AMERICA] = {
		US_INFANTRY,
		US_M3STUART, US_M5STUART,
		US_M3_GRANT, US_SHERMAN, US_SHERMAN_IIA, US_SHERMAN_III, US_SHERMAN_IIIA, US_SHERMAN_IV, US_SHERMAN_JUMBO, US_SHERMAN_EASYEIGHT, US_M26_PERSHING,
		US_P36, US_P40, US_P51, US_P38,
		US_B17, US_B25, US_B24, 
		US_SUBMARINE, US_BATTLESHIP_2, US_FLETCHER, US_BALTIMORE, US_BATTLESHIP, US_CARRIER, 
		ARTILLERY},
}

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
	[UK_MATILDA_I] = UK_MATILDA_II,
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
	[US_BATTLESHIP] = 3,
	[US_BATTLESHIP_2] = 4,
}

-- Units that are restricted by number of instance (dead unit can be rebuild)
g_UnitMaxInstance = {
	[INFANTRY] = 56,
	[DESTROYER] = 10,
	[FR_INFANTRY] = 24,
	[FR_R35] = 6,
	[FR_LEGION] = 5,
	[FR_AMIOT350] = 10,
	[UK_INFANTRY] = 32,
	[UK_VICKERS_MK6B] = 5,
	[UK_SPITFIRE] = 18,
	[UK_WELLINGTON] = 12,
	[UK_MATILDA_I] = 8,
	[UK_MATILDA_II] = 10,
	[RU_INFANTRY] = 52,
	[RU_T28] = 10,
	[RU_BT7] = 8,
	[RU_I16] = 18,
	[RU_PE2] = 12,
	[GE_INFANTRY] = 52,
	[GE_PANZER_II] = 12,
	[GE_PANZER_III] = 16,
	[GE_JU87] = 18,
	[GE_BF109] = 24,
	[GE_HE111] = 16,
	[GE_JU88] = 16,
	[US_INFANTRY] = 42,
	[US_M3STUART] = 8,
	[US_M3_GRANT] = 8,
	[US_B17] = 16,
	[US_P40] = 20,
	[US_P38] = 8,
	[IT_INFANTRY] = 24,
	[IT_L6_40] = 5,
	[IT_M11_39] = 7,
	[IT_BA65] = 12,
	[IT_G50] = 16,
	[IT_SM79] = 10,
	[IT_SM84] = 10,
}

-- unit type called when AI need reserve troops
g_Reserve_Unit = {
	[FRANCE] = { {Prob = 50, ID = FR_INFANTRY}, {Prob = 10, ID = FR_AMR35}, {Prob = 10, ID = FR_FCM36}, {Prob = 5, ID = FR_AMC35}, {Prob = 5, ID = FR_CHAR_D1}, {Prob = 5, ID = FR_CHAR_D2}, },
	[ENGLAND] = { {Prob = 50, ID = UK_INFANTRY}, {Prob = 20, ID = UK_VICKERS_MK6B}, {Prob = 10, ID = UK_TETRARCH}, {Prob = 5, ID = US_M3_GRANT},  },
	[USSR] = { {Prob = 50, ID = RU_INFANTRY}, {Prob = 20, ID = RU_T26}, {Prob = 15, ID = RU_T28},  },
	[GERMANY] = { {Prob = 50, ID = GE_INFANTRY}, {Prob = 20, ID = GE_PANZER_I}, {Prob = 15, ID = GE_PANZER_35},  },
	[ITALY] = { {Prob = 50, ID = IT_INFANTRY}, {Prob = 20, ID = IT_L6_40}, {Prob = 15, ID = IT_M11_39},  },
	[AMERICA] = { {Prob = 50, ID = US_INFANTRY}, {Prob = 25, ID = US_M3STUART}, {Prob = 10, ID = US_M3_GRANT},  },
}

-- Thresholds used to check if AI need to call reserve troops
g_Reserve_Data = { 
	-- UnitThreshold : minimum number of land units left
	-- LandThreshold : minimum number of plot left
	-- LandUnitRatio : ratio between lands and units, use higher ratio when the nation as lot of space between cities
	[FRANCE] = {	UnitThreshold = 8, LandThreshold = 108, LandUnitRatio = 10,
					},
					-- initial plots = 216, France won't get reinforcement once Paris is captured
	[ENGLAND] = {	UnitThreshold = 14, LandThreshold = 100, LandUnitRatio = 5,
					},
					-- initial plots = 111
	[USSR] = {		UnitThreshold = 20, LandThreshold = 2350, LandUnitRatio = 50,
					},
					-- initial plots = 2469
	[GERMANY] = {	UnitThreshold = 20, LandThreshold = 300, LandUnitRatio = 10,
					},
					-- initial plots = 204 : German AI get reinforcement almost immediatly (after 5 turns)
	[ITALY] = {		UnitThreshold = 12, LandThreshold = 90, LandUnitRatio = 5,
					},
					-- initial plots = 114
}

-- Combat type ratio restriction used by AI
g_Combat_Type_Ratio = { 
	-- Air		<= military units / air units
	-- Sea		<= military units / sea units
	-- Armor	<= land units / armor units
	-- Artillery<= land units / artillery units
	-- ( 1 = no limit )
	[FRANCE] = {Air = 5, Sea = 3, Armor = 4, Artillery = 5,},
	[ENGLAND] = {Air = 3, Sea = 3, Armor = 6, Artillery = 6,},
	[USSR] = {Air = 6, Sea = 10, Armor = 3, Artillery = 4,},
	[GERMANY] = {Air = 5, Sea = 5, Armor = 2, Artillery = 5,},
	[ITALY] = {Air = 5, Sea = 4, Armor = 4, Artillery = 6,},
	[AMERICA] = {Air = 2, Sea = 2, Armor = 4, Artillery = 5,},
}

-- Available units for minor civs
g_Minor_Units = {INFANTRY, TANK, FIGHTER, DESTROYER, CRUISER, SUBMARINE}

-- Order of Battle
-- group size = 7 units max placed in (and around) plot (x,y), except air placed only in central plot (should be city plot)
-- we can initialize any units for anyone here, no restriction by nation like in build list
g_Initial_OOB = { 
}

----------------------------------------------------------------------------------------------------------------------------
-- Units Classes (see RedDefines.lua for IDs and data table)
----------------------------------------------------------------------------------------------------------------------------


-- Minors classes replacing
g_Minor_UU = {
	[POLAND] = {
				[CLASS_TANK] = PL_10TP,
				[CLASS_INFANTRY] = PL_INFANTRY,
				[CLASS_FIGHTER] = PL_P11,
	},
}

----------------------------------------------------------------------------------------------------------------------------
-- Projects (see RedDefines.lua for IDs and data table)
----------------------------------------------------------------------------------------------------------------------------

-- projects available at start of scenario
g_ProjectsAvailableAtStart = {
}

----------------------------------------------------------------------------------------------------------------------------
-- Diplomacy
----------------------------------------------------------------------------------------------------------------------------

-- Victory types
g_Victory = {
	[FRANCE] = "VICTORY_ALLIED_EUROPE",
	[ENGLAND] = "VICTORY_ALLIED_EUROPE",
	[USSR] = "VICTORY_USSR_EUROPE",
	[GERMANY] = "VICTORY_GERMANY_EUROPE",
	[ITALY] = "VICTORY_AXIS_EUROPE",
	[AMERICA] = "VICTORY_ALLIED_EUROPE",
}

-- Virtual allies
g_Allied = {
	[FRANCE] = true,
	[ENGLAND] = true,
	[USSR] = true,
	[AMERICA] = true,
}
g_Axis = {
	[GERMANY] = true,
	[ITALY] = true,
}

-- Major Civilizations
-- to do in all table : add entry bCheck = function() return true or false, apply change only if true or nill
g_Major_Diplomacy = {
	[19360701] = { 
		{Type = PEA, Civ1 = FRANCE, Civ2 = ENGLAND},
	},
	[19380316] = { 
		{Type = DEN, Civ1 = FRANCE, Civ2 = GERMANY},
		{Type = DEN, Civ1 = ENGLAND, Civ2 = GERMANY},
	},
	[19390903] = { 
		{Type = DOW, Civ1 = FRANCE, Civ2 = GERMANY},
		{Type = DOW, Civ1 = ENGLAND, Civ2 = GERMANY},
		{Type = DEN, Civ1 = AMERICA, Civ2 = GERMANY},
		{Type = DEN, Civ1 = ITALY, Civ2 = FRANCE},
		{Type = DEN, Civ1 = ITALY, Civ2 = ENGLAND},
		{Type = DOF, Civ1 = GERMANY, Civ2 = USSR},
	},
	[19400201] = { 
		{Type = DOF, Civ1 = GERMANY, Civ2 = USSR},
	},
	[19400610] = { 
		{Type = DOW, Civ1 = ITALY, Civ2 = FRANCE},
		{Type = DOW, Civ1 = ITALY, Civ2 = ENGLAND},
		{Type = PEA, Civ1 = GERMANY, Civ2 = ITALY},
	},
	[19410622] = { 
		{Type = DOW, Civ1 = GERMANY, Civ2 = USSR},
		{Type = DOW, Civ1 = ITALY, Civ2 = USSR},
		{Type = DOF, Civ1 = FRANCE, Civ2 = USSR},
		{Type = DOF, Civ1 = ENGLAND, Civ2 = USSR},
	},
	[19411207] = { 
		{Type = DOW, Civ1 = GERMANY, Civ2 = AMERICA},
		{Type = DOW, Civ1 = ITALY, Civ2 = AMERICA},
		{Type = DOF, Civ1 = FRANCE, Civ2 = AMERICA},
		{Type = PEA, Civ1 = ENGLAND, Civ2 = AMERICA},
		{Type = PEA, Civ1 = USSR, Civ2 = AMERICA},
	},				
}

-- Minor Civilizations
g_Minor_Relation = {
	[19360701] = { 
		{Value = 50, Major = USSR, Minor = RSPAIN},
		{Value = -50, Major = USSR, Minor = FINLAND},
		{Value = 50, Major = GERMANY, Minor = NSPAIN},
		{Value = 50, Major = ITALY, Minor = NSPAIN},
		{Value = 120, Major = ENGLAND, Minor = CANADA},
		{Value = 120, Major = FRANCE, Minor = CANADA},
	},
	[19380320] = { 
		{Value = 120, Major = ENGLAND, Minor = POLAND},
		{Value = 120, Major = FRANCE, Minor = POLAND},
		{Value = 120, Major = GERMANY, Minor = SLOVAKIA},
		{Value = 50, Major = ITALY, Minor = SLOVAKIA},
		{Value = 50, Major = GERMANY, Minor = HUNGARY},
		{Value = 50, Major = ITALY, Minor = HUNGARY},
		{Value = 50, Major = ENGLAND, Minor = BELGIUM},
		{Value = 50, Major = FRANCE, Minor = BELGIUM},
		{Value = 50, Major = ENGLAND, Minor = NETHERLANDS},
		{Value = 50, Major = FRANCE, Minor = NETHERLANDS},
		{Value = 50, Major = ENGLAND, Minor = LUXEMBOURG},
		{Value = 50, Major = FRANCE, Minor = LUXEMBOURG},
		{Value = 50, Major = ENGLAND, Minor = NORWAY},
		{Value = 50, Major = FRANCE, Minor = NORWAY},
		{Value = 50, Major = ENGLAND, Minor = GREECE},
		{Value = 50, Major = FRANCE, Minor = GREECE},
	},
	[19390903] = { 
		{Value = 120, Major = GERMANY, Minor = HUNGARY},
	},
	[19400409] = { 
		{Value = 120, Major = ENGLAND, Minor = DENMARK},
		{Value = 120, Major = FRANCE, Minor = NORWAY},
		{Value = 120, Major = ENGLAND, Minor = NORWAY},
		{Value = 120, Major = FRANCE, Minor = DENMARK},
	},
	[19400510] = { 
		{Value = 120, Major = ENGLAND, Minor = BELGIUM},
		{Value = 120, Major = FRANCE, Minor = NETHERLANDS},
		{Value = 120, Major = ENGLAND, Minor = NETHERLANDS},
		{Value = 120, Major = FRANCE, Minor = BELGIUM},
		{Value = 120, Major = ENGLAND, Minor = LUXEMBOURG},
		{Value = 120, Major = FRANCE, Minor = LUXEMBOURG},
	},
	[19401028] = { 
		{Value = 120, Major = ENGLAND, Minor = YUGOSLAVIA},
		{Value = 120, Major = FRANCE, Minor = YUGOSLAVIA},
	},
	[19410406] = { 
		{Value = 120, Major = ENGLAND, Minor = GREECE},
		{Value = 120, Major = FRANCE, Minor = GREECE},
	},
	[19410622] = { 
		{Value = 120, Major = GERMANY, Minor = ROMANIA},
		{Value = 120, Major = GERMANY, Minor = FINLAND},
		{Value = 120, Major = ITALY, Minor = ROMANIA},
		{Value = 120, Major = ITALY, Minor = HUNGARY},
		{Value = 120, Major = ITALY, Minor = BULGARIA},
		{Value = 120, Major = GERMANY, Minor = BULGARIA},
	},
	[19411207] = { 
		{Value = 120, Major = AMERICA, Minor = POLAND},
		{Value = 120, Major = AMERICA, Minor = NETHERLANDS},
		{Value = 120, Major = AMERICA, Minor = BELGIUM},
		{Value = 120, Major = AMERICA, Minor = LUXEMBOURG},
		{Value = 120, Major = AMERICA, Minor = DENMARK},
		{Value = 120, Major = AMERICA, Minor = NORWAY},
		{Value = 120, Major = AMERICA, Minor = YUGOSLAVIA},
		{Value = 120, Major = AMERICA, Minor = GREECE},
		{Value = 120, Major = AMERICA, Minor = CANADA},
	},	
}
g_Major_Minor_DoW = {
	[19390901] = { 
		{Major = GERMANY, Minor = POLAND},
	},
	[19390917] = { 
		{Major = USSR, Minor = POLAND},	
	},
	[19400409] = { 
		{Major = GERMANY, Minor = DENMARK},	
		{Major = GERMANY, Minor = NORWAY},	
	},
	[19400510] = { 
		{Major = GERMANY, Minor = BELGIUM},
		{Major = GERMANY, Minor = NETHERLANDS},
		{Major = GERMANY, Minor = LUXEMBOURG},
	},
	[19391130] = { 
		{Major = USSR, Minor = FINLAND},
	},
	[19410622] = { 
		{Major = USSR, Minor = HUNGARY},
		{Major = USSR, Minor = BULGARIA},	
	},
	[19401028] = {
		{Major = ITALY, Minor = GREECE},	
		{Major = ITALY, Minor = BELGIUM},
		{Major = ITALY, Minor = NETHERLANDS},
	},
	[19410406] = { 
		{Major = ITALY, Minor = YUGOSLAVIA},
		{Major = GERMANY, Minor = YUGOSLAVIA},
		{Major = GERMANY, Minor = GREECE},
	},
}
g_Major_Minor_Peace = {
	[19400313] = { 
		{Major = USSR, Minor = FINLAND},	
	},
}
g_Minor_Minor_DoW = {
	[19360701] = {
		{Minor1 = RSPAIN, Minor2 = NSPAIN},
	},
	[19410410] = {
		{Minor1 = HUNGARY, Minor2 = YUGOSLAVIA},
	},
	[19410406] = {
		{Minor1 = BULGARIA, Minor2 = YUGOSLAVIA},
		{Minor1 = BULGARIA, Minor2 = GREECE},
	},
}
g_Minor_Major_DoW = {
	[19410622] = { 
		{Minor = ROMANIA, Major = USSR},
		{Minor = FINLAND, Major = USSR},
	},
}




----------------------------------------------------------------------------------------------------------------------------
-- Cities
----------------------------------------------------------------------------------------------------------------------------

-- Populate cities with buildings
-- Key cities are cities that need to be occupied to trigger victory
g_Cities = {
	-- UNITED KINGDOM
		{X = 72, Y = 52, Key = true, Buildings = { HARBOR, SHIPYARD, FACTORY, BANK }, AIBuildings = {RADIO, ARSENAL, HOSPITAL}, }, -- London
		{X = 69, Y = 57, Key = true, Buildings = {}, AIBuildings = {RADIO, ARSENAL, HOSPITAL, BANK}, }, -- Liverpool
		{X = 71, Y = 62, Key = true, Buildings = { HARBOR, BANK }, AIBuildings = {RADIO, ARSENAL, HOSPITAL}, }, -- Edinburgh
		{X = 72, Y = 60, Key = true, Buildings = {}, AIBuildings = {RADIO, HOSPITAL, BANK}, }, -- Newcastle
		{X = 66, Y = 62, Key = true, Buildings = {}, AIBuildings = {RADIO, HOSPITAL, BANK}, }, -- Belfast
		{X = 70, Y = 54, Key = true, Buildings = {}, AIBuildings = {RADIO, HOSPITAL, BANK}, }, -- Birmingham
	-- GERMANY
		{X = 89, Y = 50, Key = true, Buildings = { BARRACKS, ARSENAL, ACADEMY, BANK, FACTORY }, AIBuildings = {RADIO, ARSENAL, HOSPITAL}, }, -- Berlin
		{X = 84, Y = 53, Key = true, Buildings = { BANK, HARBOR }, AIBuildings = {RADIO, ARSENAL, HOSPITAL, BANK, BARRACKS, FACTORY}, }, -- Hamburg
		{X = 85, Y = 40, Key = true, Buildings = {}, AIBuildings = {RADIO, ARSENAL, HOSPITAL, BANK, BARRACKS, FACTORY}, }, -- Munich
		{X = 81, Y = 49, Key = true, Buildings = { FACTORY }, AIBuildings = {RADIO, ARSENAL, HOSPITAL, BANK, BARRACKS}, }, -- Cologne
		{X = 89, Y = 47, Key = true, Buildings = {}, AIBuildings = {RADIO, HOSPITAL, BANK, BARRACKS, FACTORY}, }, -- Dresden
		{X = 84, Y = 46, Key = true, Buildings = {}, AIBuildings = {RADIO, ARSENAL, HOSPITAL, BANK, BARRACKS, FACTORY}, }, -- Frankfurt
		{X = 83, Y = 52, Key = true, Buildings = {}, AIBuildings = {RADIO, ARSENAL, HOSPITAL, BANK, BARRACKS, FACTORY}, }, -- Bremen
	-- FRANCE
		{X = 73, Y = 45, Key = true, Buildings = { BANK, FACTORY, ARSENAL }, AIBuildings = {RADIO, HOSPITAL}, }, -- Paris
		{X = 74, Y = 34, Key = true, Buildings = { HARBOR }, AIBuildings = {RADIO, HOSPITAL, BANK}, }, -- Marseille
		{X = 75, Y = 38, Key = true, Buildings = {}, AIBuildings = {}, }, -- Lyon
		{X = 70, Y = 36, Key = true, Buildings = {}, AIBuildings = {}, }, -- Toulouse
		{X = 125, Y = 9, Buildings = {}, AIBuildings = {}, }, -- Damascus
		{X = 66, Y = 45, Key = true, Buildings = {}, AIBuildings = {}, }, -- Saint Naizier
	-- ITALY
		{X = 84, Y = 28, Key = true, Buildings = { HARBOR, BANK, BARRACKS }, AIBuildings = {RADIO, ARSENAL, HOSPITAL, FACTORY, BASE}, }, -- Rome
		{X = 86, Y = 25, Key = true, Buildings = { HARBOR, BANK }, AIBuildings = {RADIO, ARSENAL, HOSPITAL, BARRACKS, FACTORY}, }, -- Naples
		{X = 83, Y = 34, Key = true, Buildings = {}, AIBuildings = {RADIO, HOSPITAL, FACTORY}, }, -- Bologna
		{X = 81, Y = 36, Key = true, Buildings = {}, AIBuildings = {RADIO, ARSENAL, HOSPITAL, BANK}, }, -- Milan
		{X = 83, Y = 31, Key = true, Buildings = {}, AIBuildings = {RADIO, ARSENAL, HOSPITAL, BANK, FACTORY}, }, -- Florence
		{X = 80, Y = 34, Key = true, Buildings = { HARBOR }, AIBuildings = {RADIO, ARSENAL, HOSPITAL}, }, -- Genova
		{X = 91, Y = 24, Key = true, Buildings = {}, AIBuildings = {RADIO, HOSPITAL}, }, -- Bari
	-- U.S.S.R.
	    {X = 117, Y = 58, Key = true, Buildings = { BARRACKS, ARSENAL }, AIBuildings = {RADIO, HOSPITAL, BANK, FACTORY, BASE}, }, -- Moscow
		{X = 127, Y = 47, Key = true, Buildings = {}, AIBuildings = {RADIO, ARSENAL, HOSPITAL, BANK, BARRACKS, FACTORY}, }, -- Stalingrad
		{X = 109, Y = 64, Key = true, Buildings = { HARBOR }, AIBuildings = {RADIO, ARSENAL, HOSPITAL, BANK, BARRACKS, FACTORY, BASE}, }, -- Leningrad
		{X = 125, Y = 60, Key = true, Buildings = {}, AIBuildings = {RADIO, HOSPITAL, BANK, BARRACKS}, }, -- Novograd
		{X = 106, Y = 52, Key = true, Buildings = {}, AIBuildings = {RADIO, ARSENAL, HOSPITAL, BANK, BARRACKS}, }, -- Minsk
		{X = 111, Y = 44, Key = true, Buildings = {}, AIBuildings = {RADIO, ARSENAL, HOSPITAL, BANK, BARRACKS}, }, -- Kiev
		{X = 116, Y = 33, Key = true, Buildings = { HARBOR }, AIBuildings = {RADIO, HOSPITAL, BARRACKS}, }, -- Stevaspol
		{X = 110, Y = 85, Key = true, Buildings = { HARBOR }, AIBuildings = {RADIO, ARSENAL, HOSPITAL}, }, -- Murmansk
		{X = 111, Y = 55, Key = true, Buildings = {}, AIBuildings = {RADIO, FACTORY, HOSPITAL, BARRACKS}, }, -- Smolensk
	-- AMERICA
		{X = 0, Y = 32, Key = true, Buildings = { ACADEMY, BANK, ARSENAL }, AIBuildings = {RADIO, HOSPITAL, FACTORY, BARRACKS, BASE}, }, -- Washington
		{X = 0, Y = 12, Key = true, Buildings = {}, AIBuildings = {RADIO, ARSENAL, HOSPITAL, BANK, FACTORY}, }, -- Jacksonville
		{X = 2, Y = 27, Key = true, Buildings = {}, AIBuildings = {RADIO, HOSPITAL, BANK}, }, -- Virginia Beach
		{X = 2, Y = 33, Key = true, Buildings = { BANK, HARBOR }, AIBuildings = {RADIO, ARSENAL, HOSPITAL, FACTORY}, }, -- Baltimore
		{X = 2, Y = 37, Key = true, Buildings = { BANK, ARSENAL }, AIBuildings = {RADIO, RADIO, HOSPITAL, FACTORY}, }, -- Phyledeplphia
		{X = 4, Y = 44, Key = true, Buildings = { HARBOR, BANK }, AIBuildings = {RADIO, ARSENAL, HOSPITAL, FACTORY}, }, -- Boston
		{X = 2, Y = 27, Key = true, Buildings = { HARBOR, BANK, RADIO }, AIBuildings = {ARSENAL, HOSPITAL, FACTORY}, }, -- New York
		{X = 1, Y = 44, Key = true, Buildings = {}, AIBuildings = {RADIO, BANK, HOSPITAL}, }, -- Albany


 -- {X = 98, Y = 48, Buildings = { FACTORY, BANK, BASE, BARRACKS, LARGE_AIR_FACTORY, ACADEMY }, AIBuildings = {RADIO, ARSENAL, HOSPITAL}, }, -- Warsaw
 --	{X = 90, Y = 45, Buildings = { FACTORY, BANK, BASE, BARRACKS, LARGE_AIR_FACTORY, ACADEMY }, AIBuildings = {RADIO, ARSENAL, HOSPITAL}, }, -- Prague
 -- {X = 92, Y = 40, Buildings = { FACTORY, BANK, BASE, BARRACKS, LARGE_AIR_FACTORY, ACADEMY }, AIBuildings = {RADIO, ARSENAL, HOSPITAL}, }, -- Vienna
 -- {X = 88, Y = 57, Buildings = { FACTORY, BANK, BASE, BARRACKS, LARGE_AIR_FACTORY, ACADEMY }, AIBuildings = {RADIO, ARSENAL, HOSPITAL}, }, -- Copenhagen
 --	{X = 89, Y = 66, Buildings = { FACTORY, BANK, BASE, BARRACKS, LARGE_AIR_FACTORY, ACADEMY }, AIBuildings = {RADIO, ARSENAL, HOSPITAL}, }, -- Oslo
 --	{X = 97, Y = 32, Buildings = { FACTORY, BANK, BASE, BARRACKS, LARGE_AIR_FACTORY, ACADEMY }, AIBuildings = {RADIO, ARSENAL, HOSPITAL}, }, -- Belgrade
 --	{X = 101, Y = 17, Buildings = { FACTORY, BANK, BASE, BARRACKS, LARGE_AIR_FACTORY, ACADEMY }, AIBuildings = {RADIO, ARSENAL, HOSPITAL}, }, -- Athens
}


----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------


