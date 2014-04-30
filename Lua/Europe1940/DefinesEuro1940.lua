-- RedEurope1940Defines
-- Author: Gedemon
-- DateCreated: 7/9/2011
----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------

print("Loading Euro 1940 Defines...")
print("-------------------------------------")

----------------------------------------------------------------------------------------------------------------------------
-- Scenario Specific Rules
----------------------------------------------------------------------------------------------------------------------------

WAR_MINIMUM_STARTING_TURN		= 3
REVEAL_ALL_CITIES				= true	-- cities tiles are always visible for every civs
EMBARK_FROM_HARBOR				= true	-- allow embarking only from a city with a port (and adjacent tiles)
BEACHHEAD_DAMAGE				= true	-- Amphibious assault on an empty tile owned by enemy civ will cause damage to the landing unit (not implemented)
CLOSE_MINOR_NEUTRAL_CIV_BORDERS = true	-- if true neutral territories is impassable
RESOURCE_CONSUMPTION			= true	-- Use resource consumption (fuel, ...)

----------------------------------------------------------------------------------------------------------------------------
-- AI Scenario Specific Rules
----------------------------------------------------------------------------------------------------------------------------

ALLOW_AI_CONTROL	= true
NO_AI_EMBARKATION	= true -- remove AI ability to embark (to do : take total control of AI unit to embark)
NO_SUICIDE_ATTACK	= true -- If set to true, try to prevent suicide attacks

----------------------------------------------------------------------------------------------------------------------------
-- Calendar
----------------------------------------------------------------------------------------------------------------------------

REAL_WORLD_ENDING_DATE	= 19470105
MAX_FALL_OF_FRANCE_DATE = 19420101 -- France will not surrender if Paris fall after this date...

g_Calendar = {}
local monthList = { "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December" }
local dayList = { "1", "10", "20" }
local turn = 0
for year = 1939, 1946 do -- see large
	for month = 1, #monthList do
		for day = 1, #dayList do
			local bStart = (month >= 7 and year == 1939) -- Start date !
			if bStart or (year > 1939) then
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
ALGERIA = GameInfo.MinorCivilizations.MINOR_CIV_ALGERIA.ID
ARABIA = GameInfo.MinorCivilizations.MINOR_CIV_ARABIA.ID
BALTIC = GameInfo.MinorCivilizations.MINOR_CIV_BALTIC_STATES.ID
BELGIUM = GameInfo.MinorCivilizations.MINOR_CIV_BELGIUM.ID
BULGARIA = GameInfo.MinorCivilizations.MINOR_CIV_BULGARIA.ID
DENMARK = GameInfo.MinorCivilizations.MINOR_CIV_DENMARK.ID
EGYPT = GameInfo.MinorCivilizations.MINOR_CIV_EGYPT.ID
FINLAND = GameInfo.MinorCivilizations.MINOR_CIV_FINLAND.ID
HUNGARY = GameInfo.MinorCivilizations.MINOR_CIV_HUNGARY.ID
IRAN = GameInfo.MinorCivilizations.MINOR_CIV_IRAN.ID
IRAQ = GameInfo.MinorCivilizations.MINOR_CIV_IRAQ.ID
IRELAND = GameInfo.MinorCivilizations.MINOR_CIV_IRELAND.ID
LEBANON = GameInfo.MinorCivilizations.MINOR_CIV_LEBANON.ID
LIBYA = GameInfo.MinorCivilizations.MINOR_CIV_LIBYA.ID
MOROCCO = GameInfo.MinorCivilizations.MINOR_CIV_MOROCCO.ID
NETHERLANDS = GameInfo.MinorCivilizations.MINOR_CIV_NETHERLANDS.ID
NORWAY = GameInfo.MinorCivilizations.MINOR_CIV_NORWAY.ID
PALESTINE = GameInfo.MinorCivilizations.MINOR_CIV_PALESTINE.ID
POLAND = GameInfo.MinorCivilizations.MINOR_CIV_POLAND.ID
PORTUGAL = GameInfo.MinorCivilizations.MINOR_CIV_PORTUGAL.ID
ROMANIA = GameInfo.MinorCivilizations.MINOR_CIV_ROMANIA.ID
SLOVAKIA = GameInfo.MinorCivilizations.MINOR_CIV_SLOVAKIA.ID
SPAIN = GameInfo.MinorCivilizations.MINOR_CIV_SPAIN.ID
SWEDEN = GameInfo.MinorCivilizations.MINOR_CIV_SWEDEN.ID
SWITZERLAND = GameInfo.MinorCivilizations.MINOR_CIV_SWITZERLAND.ID
SYRIA = GameInfo.MinorCivilizations.MINOR_CIV_SYRIA.ID
TUNISIA = GameInfo.MinorCivilizations.MINOR_CIV_TUNISIA.ID
TURKEY = GameInfo.MinorCivilizations.MINOR_CIV_TURKEY.ID
VICHY = GameInfo.MinorCivilizations.MINOR_CIV_VICHY.ID
TUNISIA = GameInfo.MinorCivilizations.MINOR_CIV_TUNISIA.ID
YUGOSLAVIA = GameInfo.MinorCivilizations.MINOR_CIV_YUGOSLAVIA.ID


----------------------------------------------------------------------------------------------------------------------------
-- Buildings (see RedDefines.lua for IDs)
----------------------------------------------------------------------------------------------------------------------------

-- no override here, use default tables from RedDefines.lua...


----------------------------------------------------------------------------------------------------------------------------
-- Units (see RedDefines.lua for IDs)
----------------------------------------------------------------------------------------------------------------------------

-- Available units for minor civs
g_Minor_Units = {}

-- unit type called when AI need reserve troops
g_Reserve_Unit = {
	[FRANCE] = { {Prob = 50, ID = FR_INFANTRY}, {Prob = 10, ID = FR_AMR35}, {Prob = 10, ID = FR_FCM36}, {Prob = 5, ID = FR_AMC35}, {Prob = 5, ID = FR_CHAR_D1}, {Prob = 5, ID = FR_CHAR_D2}, },
	[ENGLAND] = { {Prob = 50, ID = UK_INFANTRY}, {Prob = 20, ID = UK_VICKERS_MK6B}, {Prob = 10, ID = UK_MATILDA_II}, {Prob = 5, ID = UK_MATILDA_I},  },
	[USSR] = { {Prob = 50, ID = RU_INFANTRY}, {Prob = 20, ID = RU_T26}, {Prob = 15, ID = RU_T28},  },
	[GERMANY] = { {Prob = 50, ID = GE_INFANTRY}, {Prob = 20, ID = GE_PANZER_I}, {Prob = 15, ID = GE_PANZER_35},  },
	[ITALY] = { {Prob = 50, ID = IT_INFANTRY}, {Prob = 20, ID = IT_L6_40}, {Prob = 15, ID = IT_M11_39},  },
}

-- Thresholds used to check if AI need to call reserve troops
g_Reserve_Data = { 
	-- UnitThreshold : minimum number of land units left
	-- LandThreshold : minimum number of plot left
	-- LandUnitRatio : ratio between lands and units, use higher ratio when the nation as lot of space between cities
	[FRANCE] = {	UnitThreshold = 8, LandThreshold = 108, LandUnitRatio = 10,
					Condition = function() local savedData = Modding.OpenSaveData(); return savedData.GetValue("FranceHasFallen") ~= 1; end},
					-- initial plots = 216. France won't get reinforcement once Paris is captured
	[ENGLAND] = {	UnitThreshold = 14, LandThreshold = 100, LandUnitRatio = 5,
					}, -- no condition function means always true
					-- initial plots = 111
	[USSR] = {		UnitThreshold = 20, LandThreshold = 2350, LandUnitRatio = 50,
					},
					-- initial plots = 2469
	[GERMANY] = {	UnitThreshold = 20, LandThreshold = 300, LandUnitRatio = 10,
					Condition = function() local turn = Game.GetGameTurn(); return turn > 5; end},
					-- initial plots = 204 : German AI get reinforcement almost immediatly (after 5 turns because LandThreshold > initial plots)
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
	[FRANCE]	= {Air = 5,		Sea = 5,	Armor = 2,		Artillery = 6,},
	[ENGLAND]	= {Air = 4,		Sea = 3.5,	Armor = 2,		Artillery = 6,},
	[USSR]		= {Air = 5,		Sea = 7,	Armor = 3,		Artillery = 5,},
	[GERMANY]	= {Air = 5,		Sea = 5,	Armor = 1.85,	Artillery = 6,},
	[ITALY]		= {Air = 5,		Sea = 4,	Armor = 3,		Artillery = 6,},
	[GREECE]	= {Air = 5,		Sea = 5,	Armor = 4,		Artillery = 6,},
}

-- Armor type ratio restriction used by AI
g_Max_Armor_SubClass_Percent = {
	-- max num	<= armor units / type units
	[FRANCE]	= {	[CLASS_LIGHT_TANK] = 50, [CLASS_CRUISER_TANK] = 20, [CLASS_TANK] = 60, [CLASS_HEAVY_TANK] = 25, [CLASS_ASSAULT_GUN] = 25, [CLASS_LIGHT_TANK_DESTROYER] = 30, [CLASS_TANK_DESTROYER] = 30,	},
	[ENGLAND]	= {	[CLASS_LIGHT_TANK] = 50, [CLASS_CRUISER_TANK] = 60, [CLASS_TANK] = 60, [CLASS_HEAVY_TANK] = 25, [CLASS_ASSAULT_GUN] = 10, [CLASS_LIGHT_TANK_DESTROYER] = 25, [CLASS_TANK_DESTROYER] = 25,	},
	[USSR]		= {	[CLASS_LIGHT_TANK] = 50, [CLASS_CRUISER_TANK] = 20, [CLASS_TANK] = 60, [CLASS_HEAVY_TANK] = 20, [CLASS_ASSAULT_GUN] = 30, [CLASS_LIGHT_TANK_DESTROYER] = 25, [CLASS_TANK_DESTROYER] = 30,	},
	[GERMANY]	= {	[CLASS_LIGHT_TANK] = 50, [CLASS_CRUISER_TANK] = 20, [CLASS_TANK] = 60, [CLASS_HEAVY_TANK] = 40, [CLASS_ASSAULT_GUN] = 30, [CLASS_LIGHT_TANK_DESTROYER] = 30, [CLASS_TANK_DESTROYER] = 30,	},
	[ITALY]		= {	[CLASS_LIGHT_TANK] = 50, [CLASS_CRUISER_TANK] = 20, [CLASS_TANK] = 60, [CLASS_HEAVY_TANK] = 20, [CLASS_ASSAULT_GUN] = 10, [CLASS_LIGHT_TANK_DESTROYER] = 15, [CLASS_TANK_DESTROYER] = 10,	},
	[GREECE]	= {	[CLASS_LIGHT_TANK] = 50, [CLASS_CRUISER_TANK] = 20, [CLASS_TANK] = 60, [CLASS_HEAVY_TANK] = 20, [CLASS_ASSAULT_GUN] = 10, [CLASS_LIGHT_TANK_DESTROYER] = 15, [CLASS_TANK_DESTROYER] = 10,	},
}	

-- Air type ratio restriction used by AI
g_Max_Air_SubClass_Percent = {
	-- max num	<= armor units / type units
	[FRANCE]	= {	[CLASS_FIGHTER] = 50, [CLASS_FIGHTER_BOMBER] = 40, [CLASS_HEAVY_FIGHTER] = 30, [CLASS_ATTACK_AIRCRAFT] = 30, [CLASS_FAST_BOMBER] = 50, [CLASS_BOMBER] = 30, [CLASS_HEAVY_BOMBER] = 15,	},
	[ENGLAND]	= {	[CLASS_FIGHTER] = 50, [CLASS_FIGHTER_BOMBER] = 40, [CLASS_HEAVY_FIGHTER] = 30, [CLASS_ATTACK_AIRCRAFT] = 30, [CLASS_FAST_BOMBER] = 30, [CLASS_BOMBER] = 50, [CLASS_HEAVY_BOMBER] = 15,	},
	[USSR]		= {	[CLASS_FIGHTER] = 55, [CLASS_FIGHTER_BOMBER] = 40, [CLASS_HEAVY_FIGHTER] = 30, [CLASS_ATTACK_AIRCRAFT] = 50, [CLASS_FAST_BOMBER] = 30, [CLASS_BOMBER] = 35, [CLASS_HEAVY_BOMBER] = 15,	},
	[GERMANY]	= {	[CLASS_FIGHTER] = 50, [CLASS_FIGHTER_BOMBER] = 40, [CLASS_HEAVY_FIGHTER] = 30, [CLASS_ATTACK_AIRCRAFT] = 30, [CLASS_FAST_BOMBER] = 30, [CLASS_BOMBER] = 20, [CLASS_HEAVY_BOMBER] = 15,	},
	[ITALY]		= {	[CLASS_FIGHTER] = 50, [CLASS_FIGHTER_BOMBER] = 40, [CLASS_HEAVY_FIGHTER] = 30, [CLASS_ATTACK_AIRCRAFT] = 30, [CLASS_FAST_BOMBER] = 50, [CLASS_BOMBER] = 30, [CLASS_HEAVY_BOMBER] = 15,	},
	[GREECE]	= {	[CLASS_FIGHTER] = 60, [CLASS_FIGHTER_BOMBER] = 40, [CLASS_HEAVY_FIGHTER] = 30, [CLASS_ATTACK_AIRCRAFT] = 45, [CLASS_FAST_BOMBER] = 30, [CLASS_BOMBER] = 50, [CLASS_HEAVY_BOMBER] = 15,	},
}		

-- Order of Battle
-- group size = 7 units max placed in (and around) plot (x,y), except air placed only in central plot (should be city plot)
-- we can initialize any units for anyone here, no restriction by nation like in build list
g_Initial_OOB = { 
	{Name = "French north army", X = 33, Y = 44, Domain = "Land", CivID = FRANCE, Group = {FR_INFANTRY, FR_INFANTRY, FR_AMR35, FR_B1, FR_S35} },
	{Name = "French south army", X = 30, Y = 35, Domain = "Land", AI = true, CivID = FRANCE, Group = {FR_INFANTRY, FR_INFANTRY, FR_CHAR_D1} },
	{Name = "French metr. aviation", X = 28, Y = 45, Domain = "Air", CivID = FRANCE, Group = {FR_MS406, FR_MB152 } },
	{Name = "French metr. aviation AI Bonus", X = 28, Y = 45, Domain = "Air", AI = true, CivID = FRANCE, Group = {FR_HAWK75, FR_HAWK75 } },
	{Name = "French Mediteranean fleet", X = 28, Y = 30, Domain = "Sea", CivID = FRANCE, Group = {FR_FANTASQUE, FR_FANTASQUE, FR_SUBMARINE, FR_GALISSONIERE, FR_GALISSONIERE, FR_BATTLESHIP, FR_BATTLESHIP_2} },
	{Name = "French North Africa", X = 16, Y = 18, Domain = "Land", CivID = FRANCE, Group = {FR_LEGION, FR_AMC35, FR_CHAR_D2} },
	{Name = "French North Africa aviation", X = 16, Y = 18, Domain = "Air", CivID = FRANCE, Group = {FR_MS406} },
	{Name = "French Syria", X = 84, Y = 12, Domain = "Land", CivID = FRANCE, Group = {FR_LEGION, FR_FCM36} },
	{Name = "French Syria aviation", X = 84, Y = 12, Domain = "Air", CivID = FRANCE, Group = {FR_MS406} },
	{Name = "French Oceanic fleet", X = 16, Y = 44, Domain = "Sea", CivID = FRANCE, Group = {FR_FANTASQUE, FR_FANTASQUE, FR_GALISSONIERE, FR_SUBMARINE, FR_SUBMARINE, FR_GALISSONIERE, FR_BATTLESHIP} },

	{Name = "England Metropole army", X = 27, Y = 54, Domain = "Land", CivID = ENGLAND, Group = {UK_INFANTRY, UK_TETRARCH} },
	{Name = "England Exped. corp Netherlands", X = 26, Y = 52, Domain = "Land", AI = true, CivID = ENGLAND, Group = {UK_INFANTRY, UK_INFANTRY, UK_MATILDA_I, UK_MATILDA_II} },
	{Name = "England Exped. corp Belgium", X = 24, Y = 53, Domain = "Land", CivID = ENGLAND, Group = {UK_INFANTRY, UK_TETRARCH} },
	{Name = "England Exped. corp Egypt", X = 63, Y = 2, Domain = "Land", CivID = ENGLAND, Group = {UK_INFANTRY, UK_CRUISER_I, UK_VICKERS_MK6B} },
	{Name = "England Metropole RAF", X = 27, Y = 52, Domain = "Air", CivID = ENGLAND, Group = {UK_SPITFIRE, UK_HURRICANE, UK_WELLINGTON, UK_WELLINGTON} },
	{Name = "England Metropole RAF AI", X = 27, Y = 52, Domain = "Air", AI = true, CivID = ENGLAND, Group = {UK_SPITFIRE, UK_HURRICANE,} },
	{Name = "England Malta RAF", X = 41, Y = 14, Domain = "Air", CivID = ENGLAND, Group = {UK_HURRICANE} },
	{Name = "England Nicosia RAF", X = 74, Y = 12, Domain = "Air", CivID = ENGLAND, Group = {UK_HURRICANE} },
	{Name = "England Egypt RAF", X = 60, Y = 3, Domain = "Air", CivID = ENGLAND, Group = {UK_HURRICANE} },
	{Name = "England Home fleet", X = 10, Y = 46, Domain = "Sea", CivID = ENGLAND, Group = {UK_TRIBA, UK_TRIBA, UK_DIDO, UK_BATTLESHIP, UK_BATTLESHIP_2, UK_ELIZABETH} },
	{Name = "England Home fleet North", X = 34, Y = 59, Domain = "Sea", CivID = ENGLAND, Group = {UK_TRIBA, UK_TRIBA, UK_DIDO, UK_DIDO, UK_BATTLESHIP_2} },
	{Name = "England West Mediterranean fleet", X = 13, Y = 22, Domain = "Sea", CivID = ENGLAND, Group = {UK_TRIBA, UK_TRIBA, UK_DIDO, UK_SUBMARINE, UK_ELIZABETH} },
	{Name = "England East Mediterranean fleet", X = 66, Y = 7, Domain = "Sea", CivID = ENGLAND, Group = {UK_TRIBA, UK_DIDO, UK_SUBMARINE, UK_ELIZABETH} },
	{Name = "England Home fleet AI Bonus", X = 34, Y = 66, Domain = "Sea", AI = true, CivID = ENGLAND, Group = {UK_TRIBA, UK_TRIBA, UK_DIDO, UK_DIDO} },

	{Name = "USSR central army", X = 75, Y = 48, Domain = "Land", CivID = USSR, Group = {RU_INFANTRY, RU_INFANTRY, RU_INFANTRY, RU_BT2, RU_T26, RU_T28} },
	{Name = "USSR moscow army", X = 67, Y = 57, Domain = "Land", AI = true, CivID = USSR, Group = {RU_INFANTRY, RU_INFANTRY, RU_INFANTRY, RU_BT2, RU_BT2, RU_BT7} },
	{Name = "USSR central aviation", X = 72, Y = 58, Domain = "Air", CivID = USSR, Group = {RU_I16, RU_I16} },
	{Name = "USSR central aviation AI Bonus", X = 72, Y = 58, Domain = "Air", AI = true,CivID = USSR, Group = {RU_I16, RU_I16, RU_TB3, RU_TB3 } },
	{Name = "USSR South fleet", X = 69, Y = 32, Domain = "Sea", CivID = USSR, Group = {RU_GANGUT, RU_GANGUT, RU_KIROV, RU_GNEVNY} },
	{Name = "USSR North fleet", X = 67, Y = 87, Domain = "Sea", CivID = USSR, Group = {RU_GANGUT, RU_SUBMARINE, RU_GNEVNY} },
	{Name = "USSR Central fleet", X = 52, Y = 62, Domain = "Sea", AI = true, CivID = USSR, Group = {RU_GANGUT, RU_KIROV, RU_GNEVNY} },

	{Name = "German central army", X = 42, Y = 46, Domain = "Land", CivID = GERMANY, Group = {GE_INFANTRY, GE_INFANTRY, GE_PANZER_I, GE_PANZER_III, GE_PANZER_I, GE_PANZER_III} },
	{Name = "German north army", X = 42, Y = 50, Domain = "Land", CivID = GERMANY, Group = {GE_INFANTRY, GE_INFANTRY, GE_PANZER_I, GE_PANZER_III, GE_PANZER_I, GE_PANZER_III} },
	{Name = "German east army", X = 48, Y = 46, Domain = "Land", AI = true, CivID = GERMANY, Group = {GE_INFANTRY, GE_INFANTRY, GE_PANZER_I, GE_PANZER_III, GE_PANZER_I, GE_PANZER_III} },
	{Name = "German Luftwaffe", X = 44, Y = 50, Domain = "Air", CivID = GERMANY, Group = {GE_BF109, GE_BF109, GE_HE111, GE_HE111, GE_JU87, GE_JU87, GE_JU87} },
	{Name = "German Luftwaffe AI Bonus", X = 44, Y = 50, Domain = "Air", AI = true, CivID = GERMANY, Group = {GE_BF109, GE_BF109, GE_HE111, GE_JU87} },
	{Name = "German Fleet", X = 47, Y = 54, Domain = "Sea", CivID = GERMANY, Group = {GE_BATTLESHIP_2, GE_DESTROYER, GE_BATTLESHIP, GE_DESTROYER} },
	{Name = "German Submarine Fleet", X = 10, Y = 72, Domain = "Sea", CivID = GERMANY, Group = { GE_SUBMARINE, GE_SUBMARINE, GE_SUBMARINE, GE_DESTROYER, GE_DEUTSCHLAND} },
	{Name = "German Fleet AI bonus", X = 38, Y = 61, Domain = "Sea", AI = true, CivID = GERMANY, Group = { GE_LEIPZIG, GE_DESTROYER, GE_DESTROYER, GE_DESTROYER} },

	{Name = "Italian army", X = 37, Y = 33, Domain = "Land", CivID = ITALY, Group = {IT_INFANTRY, IT_INFANTRY, IT_M11_39, IT_L6_40, IT_L6_40, IT_INFANTRY, IT_INFANTRY} },
	{Name = "Italian colonial army", X = 53, Y = 5, Domain = "Land", CivID = ITALY, Group = {IT_INFANTRY, IT_INFANTRY, IT_INFANTRY, IT_M11_39, IT_M11_39, IT_L6_40, IT_L6_40} },
	{Name = "Italian air", X = 39, Y = 28, Domain = "Air", CivID = ITALY, Group = {IT_CR42, IT_CR42, IT_CR42} },
	{Name = "Italian air AI Bonus", X = 39, Y = 28, Domain = "Air", AI = true, CivID = ITALY, Group = {IT_CR42, IT_SM79, IT_SM79} },
	{Name = "Italian fleet", X = 39, Y = 24, Domain = "Sea", CivID = ITALY, Group = {IT_SOLDATI, IT_SOLDATI, IT_ZARA, IT_DI_CAVOUR, IT_SUBMARINE, IT_BATTLESHIP} },
	{Name = "Italian fleet 2", X = 46, Y = 14, Domain = "Sea", CivID = ITALY, Group = {IT_SOLDATI, IT_SOLDATI, IT_DI_CAVOUR, IT_ZARA, IT_BATTLESHIP, IT_SUBMARINE} },
	{Name = "Italian fleet AI Bonus", X = 48, Y = 19, Domain = "Sea", AI = true, CivID = ITALY, Group = {IT_SOLDATI, IT_SOLDATI, IT_SUBMARINE} },

	{Name = "Greek army", X = 54, Y = 19, Domain = "Land", CivID = GREECE, Group = {GR_INFANTRY, GR_INFANTRY, GR_INFANTRY, GR_VICKERS_MKE} },
	{Name = "Greek air force", X = 56, Y = 17, Domain = "Air", CivID = GREECE, Group = {GR_P24, GR_P24} },
	{Name = "Greek fleet", X = 58, Y = 20, Domain = "Sea", CivID = GREECE, Group = {GR_PISA, GR_GEORGIOS, GR_GEORGIOS, GR_SUBMARINE} },	

}


g_MinorMobilization_OOB = { 
	{Name = "Poland army", X = 53, Y = 46, Domain = "Land", CivID = POLAND, IsMinor = true, Group = {PL_INFANTRY, PL_INFANTRY, PL_VICKERS_MKE_A, PL_INFANTRY, PL_INFANTRY, PL_10TP, PL_7TP} },
	{Name = "Poland air force", X = 53, Y = 48, Domain = "Air", CivID = POLAND, IsMinor = true, Group = {PL_PZL37, PL_P11, PL_P11, PL_P11} },
	{Name = "Poland fleet", X = 51, Y = 56, Domain = "Sea", CivID = POLAND, IsMinor = true, Group = {PL_SUBMARINE} },
	{Name = "Belgian army", X = 34, Y = 48, Domain = "Land", CivID = BELGIUM, IsMinor = true, Group = {INFANTRY} },
	{Name = "Netherlands army", X = 35, Y = 52, Domain = "Land", CivID = NETHERLANDS, IsMinor = true, Group = {INFANTRY} },
	{Name = "Finland army", X = 59, Y = 68, Domain = "Land", CivID = FINLAND, IsMinor = true, Group = {INFANTRY, INFANTRY, INFANTRY, INFANTRY} },
	{Name = "Slovakia army", X = 53, Y = 42, Domain = "Land", CivID = SLOVAKIA, IsMinor = true, Group = {GE_INFANTRY, GE_PANZER_35} },
	{Name = "Slovakia army 2", X = 50, Y = 42, Domain = "Land", CivID = SLOVAKIA, IsMinor = true, Group = {GE_INFANTRY, GE_PANZER_35} },
	{Name = "Romania army", X = 59, Y = 36, Domain = "Land", CivID = ROMANIA, IsMinor = true, Group = {INFANTRY, INFANTRY, INFANTRY, INFANTRY} },
	{Name = "Yugoslavia army", X = 53, Y = 30, Domain = "Land", CivID = YUGOSLAVIA, IsMinor = true, Group = {INFANTRY, INFANTRY, INFANTRY, INFANTRY} },
	{Name = "Bulgaria army", X = 61, Y = 29, Domain = "Land", CivID = BULGARIA, IsMinor = true, Group = {INFANTRY, INFANTRY} },
	{Name = "Hungary army", X = 52, Y = 39, Domain = "Land", CivID = HUNGARY, IsMinor = true, Group = {HU_INFANTRY, HU_INFANTRY, HU_INFANTRY, HU_38M_TOLDI, HU_38M_TOLDI, HU_40M_TURAN} },
	{Name = "Sweden army", X = 45, Y = 60, Domain = "Land", CivID = SWEDEN, IsMinor = true, Group = {INFANTRY, INFANTRY, INFANTRY, INFANTRY} },
	{Name = "Spanish army", X = 13, Y = 30, Domain = "Land", CivID = SPAIN, IsMinor = true, Group = {INFANTRY, INFANTRY, INFANTRY} },
}

---------------------------------------------------------------------------------------------------------------------------
-- Units Classes  (see RedDefines.lua for IDs and data table)
----------------------------------------------------------------------------------------------------------------------------

-- Minors classes replacing
-- (don't move to main defines file, must be placed after minor civs ID defines...)
g_Minor_UU = {
	[POLAND] = {
				[CLASS_TANK] = PL_10TP,
				[CLASS_INFANTRY] = PL_INFANTRY,
				[CLASS_FIGHTER] = PL_P11,
	},
	[HUNGARY] = {
				[CLASS_TANK] = HU_40M_TURAN,
				[CLASS_INFANTRY] = HU_INFANTRY,
	},
	[BULGARIA] = {
				[CLASS_INFANTRY] = HU_INFANTRY,
	},
}


----------------------------------------------------------------------------------------------------------------------------
-- Projects  (see RedDefines.lua for IDs and data table)
----------------------------------------------------------------------------------------------------------------------------

-- projects available at start of scenario
g_ProjectsAvailableAtStart = {
	[FRANCE] = {PROJECT_MB152, PROJECT_MS406},
	[USSR] = {PROJECT_KV1},
	[ITALY] = {PROJECT_M11_39, PROJECT_L6_40, PROJECT_G50 },
	[GERMANY] = {PROJECT_BF110, PROJECT_PANZER_III,  PROJECT_PANZER_IV },
	[ENGLAND] = {PROJECT_CRUISER_III, PROJECT_MATILDAII, PROJECT_MATILDAI, PROJECT_TETRARCH },
}

----------------------------------------------------------------------------------------------------------------------------
-- Diplomacy
----------------------------------------------------------------------------------------------------------------------------

-- Protected minor civs
-- When one of those minor civs is receiving a declaration of war from another civ, the listed majors will declare war on it.
-- When one of the listed major is signing a peace treaty with another civ, the protected minor is signing it too.
g_MinorProtector = {
	[ALGERIA] = {FRANCE, }, 
	[TUNISIA] = {FRANCE, },  
	[MOROCCO] = {FRANCE, }, 
	[LEBANON] = {FRANCE, },
	[SYRIA] = {FRANCE, },  
	[BELGIUM] = {FRANCE, ENGLAND}, 
	[NETHERLANDS] = {FRANCE, ENGLAND}, 
	[EGYPT] = {ENGLAND, }, 
	[IRELAND] = {ENGLAND, }, 
	[PALESTINE] = {ENGLAND, },
	[PORTUGAL] = {ENGLAND, },
	[ALBANIA] = {ITALY, },
	[LIBYA] = {ITALY, }, 
	[ROMANIA] = {GERMANY, ITALY},
	[SPAIN] = {GERMANY, ITALY},
	[SLOVAKIA] = {GERMANY, }, 
	[HUNGARY] = {GERMANY, }, 
	[YUGOSLAVIA] = {GREECE, },
	[SWEDEN] = {FRANCE, ENGLAND, GERMANY, }, 
}

-- Victory types
g_Victory = {
	[FRANCE] = "VICTORY_ALLIED_EUROPE",
	[ENGLAND] = "VICTORY_ALLIED_EUROPE",
	[USSR] = "VICTORY_USSR_EUROPE",
	[GERMANY] = "VICTORY_GERMANY_EUROPE",
	[ITALY] = "VICTORY_AXIS_EUROPE",
}

-- Virtual allies
g_Allied = {
	[FRANCE] = true,
	[ENGLAND] = true,
	[USSR] = true,
	[GREECE] = true,
}
g_Axis = {
	[GERMANY] = true,
	[ITALY] = true,
}

-- check functions for diplomacy tables. Must be defined before the table, but can call functions defined later in the script.
function DiploFranceHasFallen()
	return FranceHasFallen()
end

-- Major Civilizations
-- to do in all table : add entry bCheck = function() return true or false, apply change only if true or nill
g_Major_Diplomacy = {
	[19390701] = { 
		{Type = DOF, Civ1 = FRANCE, Civ2 = ENGLAND},
		{Type = DOF, Civ1 = ENGLAND, Civ2 = GREECE},
		{Type = DOF, Civ1 = GERMANY, Civ2 = ITALY},
	},	
	[19390720] = { 
		{Type = DEN, Civ1 = FRANCE, Civ2 = GERMANY},
		{Type = DEN, Civ1 = ENGLAND, Civ2 = GERMANY},
	},
	[19390903] = { 
		{Type = DOW, Civ1 = FRANCE, Civ2 = GERMANY},	
		{Type = DOW, Civ1 = ENGLAND, Civ2 = GERMANY},
		{Type = PEA, Civ1 = FRANCE, Civ2 = ENGLAND},
	},
	[19390920] = { 
		{Type = DEN, Civ1 = ITALY, Civ2 = FRANCE},
		{Type = DEN, Civ1 = ITALY, Civ2 = ENGLAND},
	},
	[19400610] = { 
		{Type = DOW, Civ1 = ITALY, Civ2 = FRANCE},
		{Type = DOW, Civ1 = ITALY, Civ2 = ENGLAND},
	},
	[19400620] = { 
		{Type = PEA, Civ1 = GERMANY, Civ2 = ITALY},
	},
	[19401028] = { 
		{Type = DOW, Civ1 = ITALY, Civ2 = GREECE},
		{Type = PEA, Civ1 = ENGLAND, Civ2 = GREECE},
	},
	[19410622] = { 
		{Type = DOW, Civ1 = GERMANY, Civ2 = USSR},
		{Type = DOW, Civ1 = ITALY, Civ2 = USSR},
	},
	[19410701] = { 
		--{Type = PEA, Civ1 = FRANCE, Civ2 = USSR},
	},
}

-- Minor Civilizations
g_Minor_Relation = {
	[19390701] = { 
		{Value = 120, Major = FRANCE, Minor = ALGERIA},
		{Value = 120, Major = FRANCE, Minor = TUNISIA},
		{Value = 120, Major = FRANCE, Minor = MOROCCO},
		{Value = 120, Major = FRANCE, Minor = LEBANON},
		{Value = 120, Major = FRANCE, Minor = SYRIA},
		{Value = 50, Major = FRANCE, Minor = POLAND},
		{Value = 50, Major = FRANCE, Minor = BELGIUM},
		{Value = 50, Major = FRANCE, Minor = NETHERLANDS},
		--{Value = 50, Major = FRANCE, Minor = GREECE},
		{Value = 50, Major = FRANCE, Minor = NORWAY},
		{Value = 50, Major = FRANCE, Minor = EGYPT},
		{Value = 50, Major = FRANCE, Minor = PALESTINE},
		{Value = 50, Major = FRANCE, Minor = IRAQ},
		{Value = 50, Major = FRANCE, Minor = YUGOSLAVIA},
		{Value = 50, Major = FRANCE, Minor = SWEDEN},
		{Value = 120, Major = ENGLAND, Minor = EGYPT},
		{Value = 120, Major = ENGLAND, Minor = PALESTINE},
		{Value = 120, Major = ENGLAND, Minor = IRAQ},
		{Value = 50, Major = ENGLAND, Minor = ALGERIA},
		{Value = 50, Major = ENGLAND, Minor = TUNISIA},
		{Value = 50, Major = ENGLAND, Minor = MOROCCO},
		{Value = 50, Major = ENGLAND, Minor = LEBANON},
		{Value = 50, Major = ENGLAND, Minor = SYRIA},
		{Value = 50, Major = ENGLAND, Minor = POLAND},
		{Value = 50, Major = ENGLAND, Minor = BELGIUM},
		{Value = 50, Major = ENGLAND, Minor = NETHERLANDS},
		{Value = 50, Major = ENGLAND, Minor = SWEDEN},
		--{Value = 50, Major = ENGLAND, Minor = GREECE},
		{Value = 50, Major = ENGLAND, Minor = NORWAY},
		{Value = 50, Major = ENGLAND, Minor = YUGOSLAVIA},
		{Value = 120, Major = GERMANY, Minor = SLOVAKIA},
		{Value = 50, Major = GERMANY, Minor = HUNGARY},
		{Value = 50, Major = GERMANY, Minor = ROMANIA},
		{Value = 50, Major = GERMANY, Minor = LIBYA},
		{Value = 50, Major = GERMANY, Minor = ALBANIA},
		{Value = 50, Major = GERMANY, Minor = SWEDEN},
		{Value = 120, Major = ITALY, Minor = LIBYA},
		{Value = 120, Major = ITALY, Minor = ALBANIA},
		{Value = 50, Major = ITALY, Minor = SLOVAKIA},
		{Value = 50, Major = ITALY, Minor = HUNGARY},
		{Value = 50, Major = ITALY, Minor = ROMANIA},
		{Value = 50, Major = ITALY, Minor = SWEDEN},
		{Value = 50, Major = USSR, Minor = IRAQ},
		{Value = 50, Major = USSR, Minor = IRAN},
		
		--{Value = -120, Major = FRANCE, Minor = SWITZERLAND}, -- test
	},
	[19400614] = { 
		{Value = 120, Major = USSR, Minor = BALTIC},		
	},
	[19410401] = { 
		{Value = -70, Major = ENGLAND, Minor = IRAQ},
		{Value = 50, Major = GERMANY, Minor = IRAQ},
	},	
	[19410406] = {
		{Value = 50, Major = GERMANY, Minor = BULGARIA},
		{Value = 50, Major = ITALY, Minor = BULGARIA},
	},
	[19410622] = { 
		{Value = 120, Major = GERMANY, Minor = ROMANIA},
		{Value = 120, Major = GERMANY, Minor = FINLAND},
		{Value = 50, Major = ITALY, Minor = ROMANIA},
	},
	[19410701] = { 
		--{Value = 110, Major = USSR, Minor = POLAND},		
	},
	[19410627] = {
		{Value = 110, Major = GERMANY, Minor = HUNGARY},
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
	},
	[19391130] = { 
		{Major = USSR, Minor = FINLAND},
	},
	[19401028] = {
		--{Major = ITALY, Minor = GREECE},	
		{Major = ITALY, Minor = BELGIUM},
		{Major = ITALY, Minor = NETHERLANDS},
	},
	[19410406] = { 
		{Major = ITALY, Minor = YUGOSLAVIA},
		{Major = GERMANY, Minor = YUGOSLAVIA},
		--{Major = GERMANY, Minor = GREECE},
	},
	[19410825] = {
		{Major = USSR, Minor = IRAN},
		{Major = ENGLAND, Minor = IRAN},
	},
}
g_Major_Minor_Peace = {
	[19400313] = { 
		{Major = USSR, Minor = FINLAND},	
	},
	[19410701] = { 
		--{Major = USSR, Minor = POLAND},	
	},
	[19430901] = {
		{Major = USSR, Minor = IRAN},
		{Major = ENGLAND, Minor = IRAN},
	},
}
g_Minor_Minor_DoW = {
	[19410410] = {
		{Minor1 = HUNGARY, Minor2 = YUGOSLAVIA},
	},
	[19410406] = {
		{Minor1 = BULGARIA, Minor2 = YUGOSLAVIA},
		--{Minor1 = BULGARIA, Minor2 = GREECE},
	},
}
g_Minor_Major_DoW = {
	[19410406] = {
		{Minor = BULGARIA, Major = GREECE},
	},
	[19410622] = { 
		{Minor = ROMANIA, Major = USSR},
		{Minor = FINLAND, Major = USSR},
	},
	[19430909] = {
		{Minor = IRAN, Major = GERMANY},
	},
}

----------------------------------------------------------------------------------------------------------------------------
-- Cities
----------------------------------------------------------------------------------------------------------------------------

-- Populate cities with buildings
-- Key cities are cities that need to be occupied to trigger victory
g_Cities = {
	-- UNITED KINGDOM
	{X = 27, Y = 52, Key = true, Buildings = { FACTORY, HARBOR }, AIBuildings = {SHIPYARD}, }, -- LONDON
	{X = 24, Y = 57, Key = true, Buildings = { HARBOR }, AIBuildings = {LAND_FACTORY}, }, -- LIVERPOOL
	{X = 26, Y = 61, Key = true, Buildings = { HARBOR }, AIBuildings = {SMALL_AIR_FACTORY}, }, -- EDINBURGH
	{X = 24, Y = 62, Key = true, Buildings = { HARBOR }, AIBuildings = {SMALL_AIR_FACTORY}, }, -- GLASGOW
	{X = 28, Y = 58, Key = true, Buildings = { FACTORY }, AIBuildings = {LARGE_AIR_FACTORY, HARBOR}, }, -- NEWCASTLE
	{X = 21, Y = 62, Buildings = { HARBOR }, }, -- BELFAST
	{X = 28, Y = 65, }, -- ABERDEEN
	{X = 10, Y = 25, Buildings = { HARBOR, BASE }, }, -- GIBRALTAR
	{X = 41, Y = 14, Buildings = { HARBOR, BASE }, AIBuildings = {ARSENAL}, }, -- MALTA
	{X = 22, Y = 52, Buildings = { HARBOR }, }, -- PLYMOUTH
	{X = 92, Y = 11, }, -- HABBANIYA
	{X = 60, Y = 3, Buildings = { HARBOR }, }, -- SIDI BARRANI
	{X = 73, Y = 2,  }, -- SUEZ
	{X = 29, Y = 54, }, -- NORWICH
	{X = 25, Y = 54, }, -- BIRMINGHAM
	{X = 74, Y = 12, Buildings = { HARBOR }, }, -- NICOSIA
	-- GERMANY
	{X = 44, Y = 50, Key = true, Buildings = { FACTORY, RADIO, BARRACKS }, AIBuildings = {LAND_FACTORY, ARSENAL, BASE}, }, -- BERLIN
	{X = 39, Y = 46, Key = true, Buildings = { FACTORY }, AIBuildings = {SMALL_AIR_FACTORY}, }, -- FRANKFURT
	{X = 39, Y = 53, Key = true, Buildings = { FACTORY }, AIBuildings = {BARRACKS, LARGE_AIR_FACTORY, SHIPYARD, BASE}, }, -- HAMBURG
	{X = 40, Y = 40, Key = true, Buildings = { FACTORY }, AIBuildings = {BARRACKS, LAND_FACTORY, ARSENAL, BASE}, }, -- MUNICH
	{X = 45, Y = 43, Buildings = { FACTORY }, }, -- PRAGUE
	{X = 40, Y = 55, Buildings = { HARBOR }, AIBuildings = {SHIPYARD}, }, -- KIEL
	{X = 39, Y = 43, AIBuildings = {FACTORY}, }, -- NUREMBERG
	{X = 52, Y = 53, Buildings = { HARBOR }, AIBuildings = {FACTORY}, }, -- KONIGSBERG
	{X = 42, Y = 41, AIBuildings = {FACTORY}, }, -- PASSAU
	{X = 46, Y = 52, Buildings = { HARBOR }, AIBuildings = {FACTORY}, }, -- STETTIN
	{X = 36, Y = 49, Buildings = { FACTORY }, }, -- COLOGNE
	{X = 48, Y = 46, AIBuildings = {FACTORY}, }, -- BRESLAU
	{X = 45, Y = 46, AIBuildings = {FACTORY}, }, -- DRESDEN
	{X = 41, Y = 48, AIBuildings = {FACTORY}, }, -- MAGDEBURG
	{X = 47, Y = 40, Buildings = { FACTORY }, }, -- VIENNA
	-- FRANCE
	{X = 28, Y = 45, Key = true, Buildings = { FACTORY, BANK, OPEN_CITY, BARRACKS }, AIBuildings = {LAND_FACTORY},  }, -- PARIS	
	{X = 29, Y = 34, Buildings = { HARBOR }, AIBuildings = {SHIPYARD}, }, -- MARSEILLE
	{X = 30, Y = 38, Buildings = { FACTORY }, }, -- LYON
	{X = 25, Y = 36, Buildings = { FACTORY }, AIBuildings = {SMALL_AIR_FACTORY}, }, -- TOULOUSE
	{X = 25, Y = 46, Key = true,  }, -- CAEN
	{X = 23, Y = 48, Buildings = { HARBOR }, }, -- CHERBOURG
	{X = 16, Y = 18, Buildings = { BARRACKS, LEGION_HQ }, }, -- SIDI BEL ABBES
	{X = 33, Y = 27, Buildings = { HARBOR }, }, -- AJACCIO
	{X = 21, Y = 45, Buildings = { HARBOR }, }, -- SAINT NAZAIRE
	{X = 19, Y = 48, }, -- BREST
	{X = 36, Y = 45, }, -- STRASBOURG
	{X = 33, Y = 34, }, -- NICE
	{X = 22, Y = 39, Key = true,  }, -- BORDEAUX
	{X = 21, Y = 42, Buildings = { HARBOR }, }, -- LA ROCHELLE
	{X = 34, Y = 46, }, -- METZ
	{X = 84, Y = 12, }, -- PALMYRA
	{X = 27, Y = 39, }, -- VICHY
	{X = 25, Y = 42, }, -- TOURS
	{X = 29, Y = 50, Key = true, Buildings = { HARBOR }, }, -- DUNKERQUE
	{X = 31, Y = 46, }, -- REIMS
	{X = 30, Y = 41, }, -- DIJON
	-- ITALY
	{X = 39, Y = 28, Key = true, Buildings = { FACTORY, HARBOR }, AIBuildings = { SHIPYARD }, }, -- ROME
	{X = 41, Y = 25, Key = true, Buildings = { HARBOR }, AIBuildings = { SMALL_AIR_FACTORY }, }, -- NAPLES
	{X = 36, Y = 36, Key = true, Buildings = { FACTORY }, AIBuildings = { LAND_FACTORY }, }, -- MILAN
	{X = 38, Y = 34, Key = true, Buildings = { FACTORY }, AIBuildings = { LARGE_AIR_FACTORY }, }, -- BOLOGNE
	{X = 40, Y = 19, Buildings = { HARBOR },}, -- PALERMO
	{X = 33, Y = 23, Buildings = { HARBOR }, }, -- CAGLIARI
	{X = 44, Y = 19, }, -- REGGIO CALABRIA
	{X = 42, Y = 17, }, -- CATANIA
	{X = 35, Y = 34, }, -- GENOVA
	{X = 43, Y = 35, Buildings = { HARBOR }, }, -- TRIESTE
	{X = 40, Y = 35, }, -- VENICE
	{X = 38, Y = 31, }, -- FLORENCE
	{X = 56, Y = 5, Buildings = { HARBOR }, }, -- TOBRUK
	{X = 46, Y = 24, Buildings = { HARBOR }, }, -- BARI
	{X = 41, Y = 29, }, -- PESCARA
	{X = 62, Y = 14, Buildings = { HARBOR, BASE },}, -- RHODES
	-- U.S.S.R.
	{X = 72, Y = 58, Key = true, Buildings = { RADIO, HOSPITAL }, AIBuildings = {LAND_FACTORY}, }, -- MOSCOW
	{X = 84, Y = 48, Key = true, Buildings = { BARRACKS }, AIBuildings = {LAND_FACTORY}, }, -- STALINGRAD
	{X = 66, Y = 44, Key = true, Buildings = { BARRACKS }, AIBuildings = {SMALL_AIR_FACTORY}, }, -- KIEV
	{X = 64, Y = 64, Key = true, Buildings = { HARBOR }, }, -- LENINGRAD
	{X = 65, Y = 85, Buildings = { HARBOR }, }, -- MURMANSK
	{X = 67, Y = 37, }, -- ODESSA
	{X = 92, Y = 41, }, -- ASTRAKHAN
	{X = 73, Y = 43, }, -- KHARKOV
	{X = 85, Y = 41, }, -- ELISTA
	{X = 82, Y = 38, }, -- STAVROPOL
	{X = 81, Y = 88, }, -- NAR'YAN-MAR
	{X = 77, Y = 48, }, -- VORONEZH
	{X = 67, Y = 71, }, -- PETROZAVODSK
	{X = 76, Y = 73, }, -- BEREZNIK
	{X = 102, Y = 75, }, -- BEREZOVO
	{X = 87, Y = 70, }, -- SYKTYVKAR
	{X = 83, Y = 68, }, -- KOTLAS
	{X = 98, Y = 69, }, -- KRASNOTUR'INSK
	{X = 89, Y = 64, }, -- KIROV
	{X = 81, Y = 76, }, -- USOGORSK
	{X = 86, Y = 79, }, -- PECHORA
	{X = 89, Y = 85, }, -- INTA
	{X = 94, Y = 86, }, -- VORKUTA
	{X = 70, Y = 78, }, -- ARKHANGEL'SK
	{X = 82, Y = 83, }, -- SHCHEL'YAYUR
	{X = 74, Y = 84, }, -- KAMENKA
	{X = 97, Y = 81, }, -- SALEKHARD
	{X = 72, Y = 47, }, -- KURSK
	{X = 74, Y = 62, }, -- YAROSLAVL'
	{X = 92, Y = 61, }, -- PERM'
	{X = 61, Y = 52, }, -- MINSK
	{X = 78, Y = 53, }, -- TAMBOV
	{X = 89, Y = 53, }, -- KUYBYSHEV
	{X = 97, Y = 51, }, -- CHKALOV
	{X = 68, Y = 51, }, -- BRYANSK
	{X = 74, Y = 51, }, -- LIPETSK
	{X = 67, Y = 62, }, -- BOROVICHI
	{X = 83, Y = 54, }, -- PENZA
	{X = 101, Y = 55, }, -- CHELYABINSK
	{X = 61, Y = 60, }, -- PSKOV
	{X = 80, Y = 60, AIBuildings = {SMALL_AIR_FACTORY, LARGE_AIR_FACTORY, MEDIUM_AIR_FACTORY},}, -- NOVGOROD
	{X = 66, Y = 55, }, -- SMOLENSK
	{X = 105, Y = 59, }, -- TOBOL'SK
	{X = 87, Y = 59, }, -- KAZAN
	{X = 98, Y = 59, }, -- YEKATERINBURG
	{X = 91, Y = 35, }, -- GROZNY
	{X = 78, Y = 38, }, -- ROSTOV
	{X = 98, Y = 31, }, -- BAKU
	{X = 71, Y = 33, Buildings = { HARBOR }, }, -- SEVASTOPOL
	{X = 90, Y = 30, }, -- TBILISI
	{X = 81, Y = 32, }, -- NOVOROSSIYSK
	-- GREECE
	{X = 58, Y = 11, Buildings = { HARBOR }, }, -- HERAKLION
	{X = 54, Y = 16, }, -- PATRAS
	{X = 59, Y = 24, }, -- KAVALA
	{X = 56, Y = 22, }, -- THESSALONIKI
	{X = 56, Y = 17, Buildings = { HARBOR, FACTORY }, }, -- ATHENS
	{X = 53, Y = 20, }, -- IOANNINA
	-- ALGERIA
	{X = 20, Y = 12, }, -- LAGHOUAT
	{X = 13, Y = 6, }, -- ADRAR
	{X = 3, Y = 4, }, -- TINDOUF
	{X = 15, Y = 20, }, -- ORAN
	{X = 19, Y = 5, }, -- IN SALAH
	{X = 25, Y = 18, }, -- SETIF
	{X = 21, Y = 21, Buildings = { HARBOR }, }, -- ALGER
	-- ROMANIA
	{X = 65, Y = 34, }, -- TULCEA
	{X = 57, Y = 37, }, -- CLUJ-NAPOCA
	{X = 55, Y = 35, }, -- TIMISOARA
	{X = 63, Y = 38, }, -- LASI
	{X = 60, Y = 33, }, -- BUCAREST
	-- MOROCCO
	{X = 4, Y = 17, Buildings = { HARBOR }, }, -- CASABLANCA
	{X = 4, Y = 14, }, -- MARRAKECH
	{X = 10, Y = 18, }, -- FES
	{X = 1, Y = 15, }, -- AGADIR
	{X = 7, Y = 18, }, -- RABAT
	-- EGYPT
	{X = 68, Y = 3, Buildings = { HARBOR }, }, -- ALEXANDRIA
	{X = 70, Y = 1, }, -- CAIRO
	{X = 66, Y = 2, }, -- ALAMEIN
	-- LEBANON
	{X = 78, Y = 10, Buildings = { HARBOR }, }, -- BEIRUT
	-- FINLAND
	{X = 58, Y = 77, Buildings = { HARBOR }, }, -- OULU
	{X = 59, Y = 83, }, -- INARI
	{X = 57, Y = 65, Buildings = { HARBOR }, }, -- HELSINKI
	{X = 54, Y = 67, }, -- PORI
	{X = 61, Y = 67, }, -- LAPPEENRANTA
	{X = 58, Y = 69, }, -- JYVASKYLA
	{X = 61, Y = 72, }, -- KUOPIO
	{X = 54, Y = 72, }, -- VAASA
	{X = 63, Y = 71, }, -- JOENSUU
	-- DENMARK
	{X = 16, Y = 82, Buildings = { HARBOR }, }, -- REYKJAVIK
	{X = 43, Y = 57, Buildings = { HARBOR }, }, -- COPENHAGEN
	{X = 40, Y = 59, }, -- AALBORG
	-- BALTIC STATES
	{X = 57, Y = 58, Buildings = { HARBOR }, }, -- RIGA
	{X = 57, Y = 63, }, -- TALLINN
	{X = 57, Y = 53, }, -- VILNIUS
	-- SAUDI ARABIA
	{X = 97, Y = 3, }, -- HAFAR AL BATIN
	{X = 103, Y = 1, }, -- ANK
	{X = 92, Y = 4, }, -- ARAR
	-- IRAN
	{X = 101, Y = 20, }, -- TEHRAN
	{X = 102, Y = 15, }, -- ISFAHAN
	{X = 106, Y = 9, }, -- SHIRAZ
	{X = 96, Y = 22, }, -- TABRIZ
	{X = 93, Y = 20, }, -- URMIA
	-- SWITZERLAND
	{X = 36, Y = 40, }, -- ZURICH
	{X = 33, Y = 39, }, -- BERN
	{X = 32, Y = 38, }, -- GENEVA
	-- IRAQ
	{X = 100, Y = 9, }, -- AL-BASRAH
	{X = 90, Y = 17, }, -- MOSUL
	{X = 95, Y = 10, }, -- BAGHDAD
	-- TUNISIA
	{X = 30, Y = 12, }, -- GAFSA
	{X = 33, Y = 10, }, -- GABES
	{X = 33, Y = 17, Buildings = { HARBOR }, }, -- TUNIS
	{X = 34, Y = 13, }, -- SFAX
	-- SPAIN
	{X = 17, Y = 36, }, -- BILBAO
	{X = 14, Y = 38, }, -- GIJON
	{X = 17, Y = 25, Buildings = { HARBOR }, }, -- CARTAGENA
	{X = 15, Y = 32, }, -- MADRID
	{X = 15, Y = 28, }, -- LINARES
	{X = 9, Y = 27, }, -- SEVILLE
	{X = 22, Y = 31, Buildings = { HARBOR }, }, -- BARCELONE
	{X = 9, Y = 22, Buildings = { HARBOR }, }, -- TANGER
	-- SLOVAKIA
	{X = 54, Y = 41, }, -- KOSICE
	{X = 49, Y = 40, }, -- BRATISLAVA
	-- SWEDEN
	{X = 50, Y = 70, }, -- SUNDSVALL
	{X = 55, Y = 78, }, -- LULEA
	{X = 53, Y = 81, }, -- KIRUNA
	{X = 46, Y = 71, }, -- OSTERSUND
	{X = 52, Y = 74, Buildings = { HARBOR }, }, -- UMEA
	{X = 44, Y = 61, Buildings = { HARBOR }, }, -- GOTEBORG
	{X = 50, Y = 64, Buildings = { HARBOR }, }, -- STOCKHOLM
	-- ALBANIA
	{X = 51, Y = 24, }, -- TIRANA
	-- NORWAY
	{X = 43, Y = 72, },										-- TRONDHEIM
	{X = 44, Y = 66, Buildings = { HARBOR }, },				-- OSLO
	{X = 39, Y = 68, },										-- BERGEN
	{X = 47, Y = 79, Buildings = { OPEN_CITY }, },			-- MO I RANA
	{X = 54, Y = 87, Buildings = { OPEN_CITY }, },			-- TROMSE
	{X = 51, Y = 85, Buildings = { HARBOR, OPEN_CITY }, },	-- NARVIK
	{X = 60, Y = 87, Buildings = { HARBOR, OPEN_CITY }, },	-- KIRKENES
	-- NETHERLANDS
	{X = 34, Y = 52,Buildings = { HARBOR },  }, -- AMSTERDAM
	-- HUNGARY
	{X = 55, Y = 38, }, -- DEBRECEN
	{X = 51, Y = 38, }, -- BUDAPEST
	-- IRELAND
	{X = 17, Y = 57, }, -- CORK
	{X = 20, Y = 59, Buildings = { HARBOR }, }, -- DUBLIN
	{X = 16, Y = 60, }, -- GALWAY
	-- BELGIUM
	{X = 32, Y = 49, }, -- BRUSSEL
	-- PORTUGAL
	{X = 8, Y = 34, }, -- PORTO
	{X = 7, Y = 30, Buildings = { HARBOR }, }, -- LISBON
	-- TURKEY
	{X = 62, Y = 18, Buildings = { HARBOR }, }, -- IZMIR
	{X = 71, Y = 18, }, -- KONYA
	{X = 65, Y = 22, }, -- BURSA
	{X = 85, Y = 19, }, -- DIYARBAKIR
	{X = 69, Y = 22, }, -- ESKISEHIR
	{X = 79, Y = 16, }, -- GAZIANTEP
	{X = 76, Y = 16, }, -- ADANA
	{X = 66, Y = 24, Buildings = { HARBOR }, }, -- ISTANBUL
	{X = 89, Y = 22, }, -- VAN
	{X = 63, Y = 24, }, -- TEKIRDAG
	{X = 73, Y = 22, }, -- ANKARA
	{X = 85, Y = 24, }, -- ERZURUM
	{X = 77, Y = 20, }, -- KAYSERI
	{X = 69, Y = 16, }, -- ANTALYA
	{X = 80, Y = 25, Buildings = { HARBOR }, }, -- TRABZON
	{X = 76, Y = 25, }, -- SAMSUN
	-- YUGOSLAVIA
	{X = 49, Y = 31, }, -- SARAJEVO
	{X = 46, Y = 35, }, -- ZAGREB
	{X = 52, Y = 32, }, -- BELGRADE
	{X = 53, Y = 26, }, -- SKOPJE
	{X = 47, Y = 30, Buildings = { HARBOR }, }, -- SPLIT
	-- BULGARIA
	{X = 56, Y = 27, }, -- SOFIA
	{X = 63, Y = 30, Buildings = { HARBOR }, }, -- VARNA
	{X = 60, Y = 30, }, -- RUSE
	-- SYRIA
	{X = 81, Y = 14, }, -- ALEPPO
	{X = 80, Y = 9, }, -- DAMASCUS
	{X = 86, Y = 13, }, -- DEIR EZ-ZOR
	-- POLAND
	{X = 53, Y = 44, }, -- KRAKOW
	{X = 48, Y = 49, }, -- POZNAN
	{X = 58, Y = 49, }, -- PINSK
	{X = 49, Y = 53, Buildings = { HARBOR }, }, -- DANZIG
	{X = 53, Y = 48, }, -- WARSAW
	{X = 56, Y = 48, }, -- BREST-LITOVSK
	{X = 57, Y = 44, }, -- LWOW
	-- LIBYA
	{X = 44, Y = 3, }, -- SIRTE
	{X = 51, Y = 5, Buildings = { HARBOR }, }, -- BENGHAZI
	{X = 39, Y = 7, Buildings = { HARBOR }, }, -- TRIPOLI
	{X = 39, Y = 1, }, -- SABHA
	-- PALESTINE
	{X = 77, Y = 1, }, -- AQABA
	{X = 77, Y = 7, Buildings = { HARBOR }, }, -- HAIFA
}


----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------
