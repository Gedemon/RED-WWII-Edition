-- StalingradDefines
-- Author: Gedemon
----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------

print("Loading Stalingrad Defines...")
print("-------------------------------------")

----------------------------------------------------------------------------------------------------------------------------
-- Scenario Specific Rules
----------------------------------------------------------------------------------------------------------------------------

SHOW_UNIT_SUPPLY = false -- don'tshow unit supply on TopPanel

STALINGRAD_END_TURN = 39
INITIAL_OBJECTIVE = "34,24" -- Stalingrad PlotKey

SCENARIO_BASE_GOLD_PER_TURN = 750 --  / ((HANDICAP + 2 ) /2) = gold bonus each turn

SCENARIO_MATERIEL_PER_TURN = 1000 -- / ((HANDICAP + 2 ) /2) = materiel for reinforcement bonus each turn
SCENARIO_PERSONNEL_PER_TURN = 2000 -- / ((HANDICAP + 2 ) /2) = personnel for reinforcement bonus each turn
SCENARIO_MAX_MATERIEL_BONUS = 2000 -- max stocked materiel bonus
SCENARIO_MAX_PERSONNEL_BONUS = 3000 -- max stocked personnel bonus
INITIAL_MATERIEL_VALUE = 2500 -- Materiel reserve at start
INITIAL_PERSONNEL_VALUE = 2000 -- Personnel reserve at start

REVEAL_ALL_CITIES = true -- cities tiles are always visible for every civs
REVEAL_ALL_MAP = false -- reveal all map for every civs
EMBARK_FROM_HARBOR = false -- allow embarking only from a city with a port (and adjacent tiles)
BEACHHEAD_DAMAGE = false -- Amphibious assault on an empty tile owned by enemy civ will cause damage to the landing unit
USE_TACTICAL_RANGE = true -- +3 range to artillery, +6 range to aircraft (to do : make it +6 for light planes, +12 for other)
USE_FAST_OCEAN_MOVE = false -- x2 moves on ocean

MAX_CITY_BOMBARD_DAMAGE = 100

MAX_PERCENT_HP_LOSS_ESCAPE = 25 -- Maximum percentage of HP left losed when retreating from a city.
MIN_PERCENT_HP_LOSS_ESCAPE = 10 -- Minimum percentage of HP left losed when retreating from a city.

NO_TILE_FLIPPING_ON_CITY_CAPTURE = true -- hardcoding ATM

NUM_BUILDINGS_IMPORTANT_CITY = 2

SIXTH_ARMY_INITIAL_STRENGTH = 1875 -- deprecated
SIXTH_ARMY_MINIMUM_STRENGTH_PERCENT = 40 -- dependent of difficulty setting, +/-5% per level

----------------------------------------------------------------------------------------------------------------------------
-- AI Scenario Specific Rules
----------------------------------------------------------------------------------------------------------------------------

NO_AI_EMBARKATION = false -- AI can embark, hardcoded to be from eastern side of Volga only


----------------------------------------------------------------------------------------------------------------------------
-- Calendar
----------------------------------------------------------------------------------------------------------------------------

g_Calendar = {}
local monthList = { "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December" }
local dayList = { "4", "8", "12", "16", "20", "24", "28" }
local turn = 0
for year = 1942, 1943 do 
	for month = 1, #monthList do
		for day = 1, #dayList do
			local bStart = (month >= 10 and year == 1942) -- Start date: October 1942
			if bStart or (year > 1942) then -- Start year
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
-- Buildings (see RedDefines.lua for IDs)
----------------------------------------------------------------------------------------------------------------------------

g_Major_Buildings = {} -- can't construct buildings...


----------------------------------------------------------------------------------------------------------------------------
-- PROJECTS
----------------------------------------------------------------------------------------------------------------------------

g_Major_Projects = {} -- no searchable projects

g_ProjectsAvailableAtStart = {
	[USSR] =	{ PROJECT_KV1, PROJECT_T34_76, PROJECT_KV2, 
				  PROJECT_LAGG3, PROJECT_LA5, PROJECT_YAK7, PROJECT_IL2, PROJECT_IL4, PROJECT_HEAVY_BOMBER },
	[GERMANY] = { PROJECT_PANZER_III_J, PROJECT_PANZER_IV_G, PROJECT_PANZER_VI,
				  PROJECT_BF110, PROJECT_BF109F, PROJECT_FW190, PROJECT_JU88C, PROJECT_HE177},
}

----------------------------------------------------------------------------------------------------------------------------
-- Units (see RedDefines.lua for IDs)
----------------------------------------------------------------------------------------------------------------------------
g_Major_Units = {
	[USSR] = {
		RU_INFANTRY,
		RU_T26, RU_BT7,
		RU_T34_76, 
		RU_KV1, RU_KV2,
		RU_I16, RU_LAGG3, RU_LA5, RU_YAK_7,
		RU_IL2, RU_PE2, RU_IL4, RU_TB3, RU_PE8,
		ARTILLERY, AA_GUN, AT_GUN},
	[GERMANY] = {
		GE_INFANTRY,
		GE_PANZER_II, 
		GE_PANZER_III, GE_PANZER_III_J, GE_PANZER_IV, GE_PANZER_IV_G, GE_PANZER_IV_H, GE_PANZER_VI,
		GE_BF109_F, GE_FW190, GE_BF110, GE_JU88C, 
		GE_JU87, GE_JU88, GE_HE111, GE_HE177,
		ARTILLERY, AA_GUN, AT_GUN},

}


-- Allow artillery to capture territory
g_Unit_Classes[CLASS_ARTILLERY].Capture = true


-- Order of Battle
-- group size = 7 units max placed in (and around) plot (x,y), except air placed only in central plot (should be city plot)
-- we can initialize any units for anyone here, no restriction by nation like in build list
-- initial objective, using player:AddTemporaryDominanceZone (x, y), looks like something that can be set only once or at least not all turns, use with caution...
g_Initial_OOB = { 
	------------------------------------------------------------------------------------
	-- GERMANY
	------------------------------------------------------------------------------------
	{	Name = "VIII Army Corps", X = 18, Y = 28, Domain = "Land", CivID = GERMANY,
		Group = {		GE_INFANTRY,								GE_INFANTRY,								ARTILLERY,											ARTILLERY},
		UnitsName = {	"6.Ar VIII.A.K. 76.Infanterie-Division",	"6.Ar VIII.A.K. 113.Infanterie-Division",	"6.Ar VIII.A.K. 76.ID Artillerie-Regiment176", 		"6.Ar VIII.A.K. 113.ID Artillerie-Regiment87"},
		UnitsXP = {		10,											15,											15,													10}, 
		InitialObjective = "34,24",
	},
	{	Name = "IV Army Corps", X = 21, Y = 21, Domain = "Land", CivID = GERMANY,
		Group = {		GE_INFANTRY,							GE_INFANTRY,							GE_INFANTRY,							ARTILLERY,										ARTILLERY},
		UnitsName = {	"6.Ar IV.A.K. 29.Infanterie-Division",	"6.Ar IV.A.K. 297.Infanterie-Division",	"6.Ar IV.A.K. 371.Infanterie-Division",	"6.Ar IV.A.K. 29.ID Artillerie-Regiment29", 	"6.Ar IV.A.K. 297.ID Artillerie-Regiment297"},
		InitialObjective = "34,24",
	}, 
	{	Name = "XI Army Corps", X = 19, Y = 24, Domain = "Land", CivID = GERMANY,
		Group = {		GE_INFANTRY,							GE_INFANTRY,							GE_INFANTRY,							ARTILLERY},
		UnitsName = {	"6.Ar XI.A.K. 44.Infanterie-Division",	"6.Ar XI.A.K. 376.Infanterie-Division",	"6.Ar XI.A.K. 384.Infanterie-Division",	"6.Ar XI.A.K. 44.ID Artillerie-Regiment96",}, 
		InitialObjective = "34,24",
	},
	{	Name = "XIV Panzer Corps", X = 24, Y = 19, Domain = "Land", CivID = GERMANY,
		Group = {		GE_PANZER_II,						GE_PANZER_II,						GE_PANZER_III_J,					GE_PANZER_III_J,					GE_PANZER_IV_G},
		UnitsName = {	"6.Ar XIV.P.K. 3.PzGren-Division",	"6.Ar XIV.P.K. 60.PzGren-Division",	"6.Ar XIV.P.K. 16.PzDiv PzBr203",	"6.Ar XIV.P.K. 16.PzDiv PzBr202",	"6.Ar XIV.P.K. 16.PzDiv PzBr201"}, -- transformed (16. PzrDiv Panzer-Regiment 2) to (Panzer-Brigade 201, 202, 203) for gameplay
		UnitsXP = {		10,									15,									15,									10,									15},
		InitialObjective = "34,24",
	},
	{	Name = "LI Army Corps (1)", X = 27, Y = 19, Domain = "Land", CivID = GERMANY,
		Group = {		ARTILLERY,										GE_PANZER_III_J,					GE_PANZER_IV,						PARATROOPER,						 GE_INFANTRY,							GE_INFANTRY,							GE_PANZER_II},
		UnitsName = {	"6.Ar LI.A.K. 79.ID Artillerie-Regiment179",	"6.Ar LI.A.K. 14.PzDiv PzBr361",	"6.Ar LI.A.K. 14.PzDiv PzBr362",	"6.Ar LI.A.K. 100.Jager-Division",	"6.Ar LI.A.K. 79.Infanterie-Division",	"6.Ar LI.A.K. 71.Infanterie-Division",	"6.Ar LI.A.K. 14.PzDiv PzBr363"}, -- transformed (14. PzrDiv Panzer-Regiment 36) to (Panzer-Brigade 361, 362, 363) for gameplay
		UnitsXP = {		10,												15,									15,									25,									15,										10,										5}, 
		Promotions = {	nil,											nil,								nil,								{PROMOTION_ARCTIC_POWER,},				nil,									nil,									nil},
		InitialObjective = "34,24",
	},
	{	Name = "LI Army Corps (2)", X = 33, Y = 15, Domain = "Land", CivID = GERMANY, AI = true,
		Group = {		ARTILLERY,										GE_PANZER_III_J,					GE_INFANTRY,							GE_INFANTRY,							GE_INFANTRY,							GE_PANZER_II},
		UnitsName = {	"6.Ar LI.A.K. 305.ID Artillerie-Regiment305",	"6.Ar LI.A.K. 24.PzDiv PzBr241",	"6.Ar LI.A.K. 305.Infanterie-Division",	"6.Ar LI.A.K. 295.Infanterie-Division",	"6.Ar LI.A.K. 389.Infanterie-Division",	"6.Ar LI.A.K. 24.PzDiv PzBr242"}, -- transformed (24. PzrDiv Panzer-Regiment 24) to (Panzer-Brigade 241, 242) for gameplay
		UnitsXP = {		10,												25,									25,										10,										15,										30},
		InitialObjective = "34,24",
	},
	{	Name = "Italian 8ª Armata XXXV Corpo d'Armata (ex CSIR)", X = 2, Y = 28, Domain = "Land", CivID = GERMANY,
		Group = {		IT_L6_40,												IT_INFANTRY,						IT_INFANTRY},
		UnitsName = {	"3ª Divisione Celere 'Principe Amedeo Duca d'Aosta'",	"52ª Divisione fanteria 'Torino'", "9ª Divisione fanteria 'Pasubio'" },
	},
	{	Name = "Italian 8ª Armata II Corpo d'Armata", X = 6, Y = 30, Domain = "Land", CivID = GERMANY, AI = true,
		Group = {		IT_INFANTRY,							IT_INFANTRY,						IT_INFANTRY,						ARTILLERY},
		UnitsName = {	"2ª Divisione fanteria 'Sforzesca'",	"3ª Divisione fanteria 'Ravenna'",	"5ª Divisione fanteria 'Cosseria'", "2º Raggruppamento artiglieria di Corpo d'Armata" },
	},
	{	Name = "Italian 8ª Armata", X = 1, Y = 31, Domain = "Land", CivID = GERMANY, AI = true,
		Group = {		IT_INFANTRY,							IT_INFANTRY,						IT_INFANTRY,					IT_INFANTRY,						ARTILLERY},
		UnitsName = {	"156ª Divisione fanteria 'Vicenza'",	"2ª Divisione alpina 'Tridentina'",	"3ª Divisione alpina 'Julia'",	"4ª Divisione alpina 'Cuneense'",	"11º Raggruppamento artiglieria di Corpo d'Armata" },
	},
	{	Name = "Romanian Third Army  (Armata a 3-a Român?) (1)", X = 10, Y = 26, Domain = "Land", CivID = GERMANY,
		Group = {		GE_PANZER_I,			IT_INFANTRY,				IT_INFANTRY,				IT_INFANTRY, },
		UnitsName = {	"1st Romanian Cavalry", "5th Romanian Infantry",	"6th Romanian Infantry",	"7th Romanian Infantry"}, 
	},
	{	Name = "Romanian Third Army  (Armata a 3-a Român?) (2)", X = 13, Y = 26, Domain = "Land", CivID = GERMANY, AI = true,
		Group = {		GE_PANZER_35,			IT_INFANTRY,				IT_INFANTRY,				IT_INFANTRY,				IT_INFANTRY, },
		UnitsName = {	"7th Romanian Cavalry", "9th Romanian Infantry",	"11th Romanian Infantry",	"13th Romanian Infantry",	"14th Romanian Infantry", }, 
	},
	{	Name = "Romanian Fourth Army  (Armata a 4-a Român?) (1)", X = 41, Y = 13, Domain = "Land", CivID = GERMANY,
		Group = {		GE_PANZER_II,			IT_INFANTRY,				IT_INFANTRY,				IT_INFANTRY,				IT_INFANTRY,			},
		UnitsName = {	"5th Romanian Cavalry", "1st Romanian Infantry",	"2nd Romanian Infantry",	"18th Romanian Infantry",	"15th Romanian Infantry", }, 
	},
	{	Name = "Romanian Fourth Army  (Armata a 4-a Român?) (2)", X = 37, Y = 12, Domain = "Land", CivID = GERMANY, AI = true,
		Group = {		GE_PANZER_35,			IT_INFANTRY,	},
		UnitsName = {	"8th Romanian Cavalry", "4th Romanian Infantry",	}, 
	},
	{	Name = "Luftflotte IV", X = 15, Y = 19, Domain = "Air", CivID = GERMANY,
		Group = {		GE_BF109,	GE_BF109,	GE_FW190,	GE_BF110,	GE_HE111,	GE_HE111,	GE_JU87,	GE_JU87,	GE_JU87},
		UnitsXP = {		10,			5,			15,			10,			15,			5,			15,			5,			10,},
	},	
	{	Name = "Luftflotte IV", X = 1, Y = 13, Domain = "Air", CivID = GERMANY, AI = true,
		Group = {		GE_HE177,	GE_HE177,	GE_HE177,	GE_HE111,	GE_HE111,	GE_BF110},
		UnitsXP = {		10,			15,			10,			15,			5,			10,},
	},	
	------------------------------------------------------------------------------------
	-- USSR
	------------------------------------------------------------------------------------
	
	{	Name = "64th Army (1)", X = 25, Y = 30, Domain = "Land", CivID = USSR,
		Group = {		RU_INFANTRY, RU_INFANTRY, RU_INFANTRY, RU_INFANTRY, RU_BT7, RU_T26},
	},
	{	Name = "64th Army (1)", X = 21, Y = 33, Domain = "Land", CivID = USSR, AI = true,
		Group = {		RU_INFANTRY, RU_INFANTRY},
	},
	{	Name = "64th Army (2)", X = 32, Y = 24, Domain = "Land", CivID = USSR,
		Group = {		RU_INFANTRY,	RU_INFANTRY,	RU_INFANTRY,	RU_T34,						RU_KV1,	},
		Promotions = {	nil,			nil,			nil,			{PROMOTION_ARCTIC_POWER,},}
	},
	{	Name = "64th Army (2)", X = 34, Y = 26, Domain = "Land", CivID = USSR, AI = true,
		Group = {		RU_INFANTRY,	RU_INFANTRY,	RU_INFANTRY,	RU_T34,						RU_KV1,			RU_KV2,		RU_INFANTRY},
		UnitsXP = {		10,				5,				15,				10,							15,				25,			15,},
		Promotions = {	nil,			nil,			nil,			{PROMOTION_ARCTIC_POWER,},	nil,			nil,		nil}

	},
	{	Name = "64th Army (3)", X = 43, Y = 24, Domain = "Land", CivID = USSR, AI = true,
		Group = {		RU_INFANTRY, RU_INFANTRY, RU_INFANTRY, RU_INFANTRY, RU_BT7, RU_T26},
	},
	{	Name = "64th Army (4)", X = 46, Y = 12, Domain = "Land", CivID = USSR,
		Group = {		RU_INFANTRY, RU_INFANTRY},
	},
	{	Name = "64th Army (4)", X = 47, Y = 11, Domain = "Land", CivID = USSR, AI = true,
		Group = {		RU_INFANTRY, RU_INFANTRY},
	},
	{	Name = "8th Air Army", X = 37, Y = 26, Domain = "Air", CivID = USSR,
		Group = {		RU_I16, RU_I16, RU_IL2},
	},	
	{	Name = "8th Air Army", X = 37, Y = 26, Domain = "Air", CivID = USSR, AI = true,
		Group = {		RU_LAGG3, RU_LAGG3, RU_IL2, RU_IL2, RU_IL2},
	},	
}

g_Reinforcement_OOB = { 
	------------------------------------------------------------------------------------
	[GERMANY] = {
	------------------------------------------------------------------------------------
		[19421215] = {
			{	Name = "6./23. Panzer-Division", X = 12, Y = 1, Domain = "Land", CivID = GERMANY,
						Group = {		GE_PANZER_II,		GE_PANZER_III_J,	GE_PANZER_IV_G,		GE_PANZER_IV_G,		GE_PANZER_VI},
						UnitsName = {	"23.PzDiv PzBr231", "23.PzDiv PzBr232", "17.PzDiv PzBr171", "6.PzDiv PzBr63", "6.PzDiv PzBr64"}, 
						UnitsXP = {		15,					25,					35,					9},
			},
			{	Name = "6./23. Panzer Division", X = 14, Y = 4, Domain = "Land", CivID = GERMANY, AI = true,
						Group = {		GE_PANZER_II,		GE_PANZER_III_J,	GE_PANZER_III_J,	GE_PANZER_IV_G,		GE_PANZER_IV_G},
						UnitsName = {	"6.PzDiv PzBr61",	"6.PzDiv PzBr62",	"17.PzDiv PzBr172", "23.PzDiv PzBr233", "23.PzDiv PzBr234"}, 
						UnitsXP = {		15,					25,					15,					35,					55}, 
			},
			
			{	Name = "Romanian (4)", X = 15, Y = 1, Domain = "Land", CivID = GERMANY,
				Group = {		GE_PANZER_35,			IT_INFANTRY,				IT_INFANTRY, },
				UnitsName = {	"Cavalry Group Popescu", "1st Romanian Infantry",	"18th Romanian Infantry",}, 
			},
			{	Name = "Romanian (reformed)", X = 18, Y = 2, Domain = "Land", CivID = GERMANY, AI = true,
				Group = {		GE_PANZER_35,			IT_INFANTRY,				IT_INFANTRY,				IT_INFANTRY, },
				UnitsName = {	"8th Romanian Cavalry", "4th Romanian Infantry",	"18th Romanian Infantry",	"15th Romanian Infantry",}, 
			},
			
			{	Name = "48th Panzer Corps", X = 1, Y = 13, Domain = "Land", CivID = GERMANY,
						Group = {		GE_PANZER_II,		GE_PANZER_III_J,	GE_INFANTRY, GE_INFANTRY},
						UnitsName = {	"11.PzDiv PzBr111", "22.PzDiv PzBr221", "306.Infanterie-Division",	"79.Infanterie-Division"}, 
						UnitsXP = {		10,					15,					15,					10,							15},
			},
			
			{	Name = "48th Panzer Corps", X = 1, Y = 10, Domain = "Land", CivID = GERMANY, AI = true,
						Group = {		GE_PANZER_II,		GE_PANZER_IV_G,		GE_INFANTRY,				GE_INFANTRY},
						UnitsName = {	"22.PzDiv PzBr222", "11.PzDiv PzBr112", "302.Infanterie-Division",	"304.Infanterie-Division"}, 
						UnitsXP = {		10,					15,					20,							15},
			},
		},
	},
	------------------------------------------------------------------------------------
	[USSR] = {
	------------------------------------------------------------------------------------	
		[19420915] = {	
			{	Name = "URSS (0)", X = 46, Y = 22, Domain = "Land", CivID = USSR, AI = true,
				Group = {		RU_INFANTRY, RU_INFANTRY, RU_T34, ARTILLERY},
			},
		},
		[19420925] = {
			{	Name = "URSS (0)", X = 46, Y = 22, Domain = "Land", CivID = USSR, AI = true,
				Group = {		RU_INFANTRY, RU_INFANTRY, RU_INFANTRY, ARTILLERY},
			}, 
		},
		[19421005] = {
			{	Name = "URSS (0)", X = 46, Y = 22, Domain = "Land", CivID = USSR,
				Group = {		RU_INFANTRY, ARTILLERY, RU_BT7, RU_T26},
			},
		},
		[19421015] = { 
			{	Name = "URSS (0)", X = 46, Y = 22, Domain = "Land", CivID = USSR, AI = true,
				Group = {		RU_INFANTRY, RU_INFANTRY, RU_INFANTRY, RU_T34},
			}, 
		},
		[19421025] = {	
			{	Name = "URSS (0)", X = 46, Y = 22, Domain = "Land", CivID = USSR,
				Group = {		RU_INFANTRY, RU_INFANTRY, RU_T34},
			},
			{	Name = "8th Air Army", X = 37, Y = 26, Domain = "Air", CivID = USSR, AI = true,
				Group = {		RU_IL2, RU_PE2, RU_IL4, RU_YAK_7},
			},
		},

		-- URANUS
		[19421119] = {		
			{	Name = "URSS (1)", X = 48, Y = 11, Domain = "Land", CivID = USSR,
				Group = {		RU_INFANTRY,				RU_INFANTRY,				RU_INFANTRY,				RU_BT7,						RU_T26,						RU_T34_76,					RU_KV1},
				Promotions = {	{PROMOTION_ARCTIC_POWER,},	{PROMOTION_ARCTIC_POWER,},	{PROMOTION_ARCTIC_POWER,},	{PROMOTION_ARCTIC_POWER,},	{PROMOTION_ARCTIC_POWER,},	{PROMOTION_ARCTIC_POWER,},	{PROMOTION_ARCTIC_POWER,},	}
			},
			{	Name = "URSS (1)", X = 46, Y = 9, Domain = "Land", CivID = USSR, AI = true,
				Group = {		RU_INFANTRY,				RU_INFANTRY,				RU_INFANTRY,				RU_BT7,						RU_T26,						RU_T34,						RU_T34_76,					RU_KV1},
				Promotions = {	{PROMOTION_ARCTIC_POWER,},	{PROMOTION_ARCTIC_POWER,},	{PROMOTION_ARCTIC_POWER,},	{PROMOTION_ARCTIC_POWER,},	{PROMOTION_ARCTIC_POWER,},	{PROMOTION_ARCTIC_POWER,},	{PROMOTION_ARCTIC_POWER,},	}
			},
			{	Name = "URSS (2)", X = 5, Y = 38, Domain = "Land", CivID = USSR,
				Group = {		RU_INFANTRY, RU_INFANTRY, RU_INFANTRY, RU_BT7, RU_T26, RU_T34, RU_KV1},
			},
			{	Name = "URSS (2)", X = 2, Y = 38, Domain = "Land", CivID = USSR, AI = true,
				Group = {		RU_INFANTRY,				RU_INFANTRY,				RU_INFANTRY,				RU_BT7,						RU_T26,						RU_T34,						RU_KV1,						RU_KV2},
				Promotions = {	{PROMOTION_ARCTIC_POWER,},	{PROMOTION_ARCTIC_POWER,},	{PROMOTION_ARCTIC_POWER,},	{PROMOTION_ARCTIC_POWER,},	{PROMOTION_ARCTIC_POWER,},	{PROMOTION_ARCTIC_POWER,},	}
			},
			{	Name = "URSS (3)", X = 8, Y = 38, Domain = "Land", CivID = USSR,
				Group = {		RU_INFANTRY, ARTILLERY, ARTILLERY, ARTILLERY},
			},
			{	Name = "URSS (3)", X = 11, Y = 37, Domain = "Land", CivID = USSR, AI = true,
				Group = {		RU_INFANTRY, RU_INFANTRY, ARTILLERY, ARTILLERY, ARTILLERY, ARTILLERY},
			},
			{	Name = "URSS (4)", X = 18, Y = 38, Domain = "Land", CivID = USSR,
				Group = {		RU_INFANTRY,				RU_INFANTRY,				RU_INFANTRY,				RU_BT7,						RU_T26,						RU_T34_76,					RU_KV2},
				Promotions = {	{PROMOTION_ARCTIC_POWER,},	{PROMOTION_ARCTIC_POWER,},	{PROMOTION_ARCTIC_POWER,},	{PROMOTION_ARCTIC_POWER,},	{PROMOTION_ARCTIC_POWER,},	{PROMOTION_ARCTIC_POWER,},	}
			},
			{	Name = "URSS (4)", X = 15, Y = 38, Domain = "Land", CivID = USSR, AI = true,
				Group = {		RU_INFANTRY,				RU_INFANTRY,				RU_INFANTRY,				RU_T34_76,					RU_T34_76,					RU_KV1,						RU_KV2},
				Promotions = {	{PROMOTION_ARCTIC_POWER,},	{PROMOTION_ARCTIC_POWER,},	{PROMOTION_ARCTIC_POWER,},	{PROMOTION_ARCTIC_POWER,},	{PROMOTION_ARCTIC_POWER,},	{PROMOTION_ARCTIC_POWER,},	{PROMOTION_ARCTIC_POWER,},	}
			},
			{	Name = "8th Air Army", X = 37, Y = 26, Domain = "Air", CivID = USSR,
				Group = {		RU_YAK_7, RU_IL2, RU_PE2, RU_YAK_7},
			},	
			{	Name = "8th Air Army", X = 37, Y = 26, Domain = "Air", CivID = USSR, AI = true,
				Group = {		RU_TB3, RU_TB3, RU_TB3, RU_IL4, RU_IL4 },
			},	
		},

		[19421120] = {	
			{	Name = "URSS (0)", X = 46, Y = 22, Domain = "Land", CivID = USSR, AI = true,
				Group = {		RU_INFANTRY, RU_INFANTRY, RU_T34, ARTILLERY},
			},
		},
		[19421125] = {
			{	Name = "URSS (0)", X = 46, Y = 22, Domain = "Land", CivID = USSR,
				Group = {		RU_INFANTRY, RU_INFANTRY, RU_INFANTRY, ARTILLERY},
			}, 
		},
		[19421210] = {	
			{	Name = "URSS (0)", X = 46, Y = 22, Domain = "Land", CivID = USSR, AI = true,
				Group = {		RU_INFANTRY, RU_INFANTRY, RU_T34, ARTILLERY},
			},
		},
		[19421225] = {
			{	Name = "URSS (0)", X = 46, Y = 22, Domain = "Land", CivID = USSR,
				Group = {		RU_INFANTRY, RU_INFANTRY, RU_INFANTRY, ARTILLERY},
			}, 
		},
		
		[19421230] = {		
			{	Name = "URSS (1)", X = 48, Y = 11, Domain = "Land", CivID = USSR,
				Group = {		RU_INFANTRY,				RU_INFANTRY,				RU_INFANTRY,				RU_BT7,						RU_T26,						RU_T34_76,					RU_KV1},
				Promotions = {	{PROMOTION_ARCTIC_POWER,},	{PROMOTION_ARCTIC_POWER,},	{PROMOTION_ARCTIC_POWER,},	{PROMOTION_ARCTIC_POWER,},	{PROMOTION_ARCTIC_POWER,},	{PROMOTION_ARCTIC_POWER,},	{PROMOTION_ARCTIC_POWER,},	}
			},
			{	Name = "URSS (1)", X = 46, Y = 9, Domain = "Land", CivID = USSR, AI = true,
				Group = {		RU_INFANTRY,				RU_INFANTRY,				RU_INFANTRY,				RU_BT7,						RU_T26,						RU_T34,						RU_T34_76,					RU_KV1},
				Promotions = {	{PROMOTION_ARCTIC_POWER,},	{PROMOTION_ARCTIC_POWER,},	{PROMOTION_ARCTIC_POWER,},	{PROMOTION_ARCTIC_POWER,},	{PROMOTION_ARCTIC_POWER,},	{PROMOTION_ARCTIC_POWER,},	{PROMOTION_ARCTIC_POWER,},	}
			},
			{	Name = "URSS (2)", X = 5, Y = 38, Domain = "Land", CivID = USSR,
				Group = {		RU_INFANTRY, RU_INFANTRY, RU_INFANTRY, RU_BT7, RU_T26, RU_T34, RU_KV1},
			},
			{	Name = "URSS (2)", X = 2, Y = 38, Domain = "Land", CivID = USSR, AI = true,
				Group = {		RU_INFANTRY,				RU_INFANTRY,				RU_INFANTRY,				RU_BT7,						RU_T26,						RU_T34,						RU_KV1,						RU_KV2},
				Promotions = {	{PROMOTION_ARCTIC_POWER,},	{PROMOTION_ARCTIC_POWER,},	{PROMOTION_ARCTIC_POWER,},	{PROMOTION_ARCTIC_POWER,},	{PROMOTION_ARCTIC_POWER,},	{PROMOTION_ARCTIC_POWER,},	}
			},
			{	Name = "URSS (3)", X = 8, Y = 38, Domain = "Land", CivID = USSR,
				Group = {		RU_INFANTRY, ARTILLERY, ARTILLERY, ARTILLERY},
			},
			{	Name = "URSS (3)", X = 11, Y = 37, Domain = "Land", CivID = USSR, AI = true,
				Group = {		RU_INFANTRY, RU_INFANTRY, ARTILLERY, ARTILLERY, ARTILLERY, ARTILLERY},
			},
			{	Name = "URSS (4)", X = 18, Y = 38, Domain = "Land", CivID = USSR,
				Group = {		RU_INFANTRY,				RU_INFANTRY,				RU_INFANTRY,				RU_BT7,						RU_T26,						RU_T34_76,					RU_KV2},
				Promotions = {	{PROMOTION_ARCTIC_POWER,},	{PROMOTION_ARCTIC_POWER,},	{PROMOTION_ARCTIC_POWER,},	{PROMOTION_ARCTIC_POWER,},	{PROMOTION_ARCTIC_POWER,},	{PROMOTION_ARCTIC_POWER,},	}
			},
			{	Name = "URSS (4)", X = 15, Y = 38, Domain = "Land", CivID = USSR, AI = true,
				Group = {		RU_INFANTRY,				RU_INFANTRY,				RU_INFANTRY,				RU_T34_76,					RU_T34_76,					RU_KV1,						RU_KV2},
				Promotions = {	{PROMOTION_ARCTIC_POWER,},	{PROMOTION_ARCTIC_POWER,},	{PROMOTION_ARCTIC_POWER,},	{PROMOTION_ARCTIC_POWER,},	{PROMOTION_ARCTIC_POWER,},	{PROMOTION_ARCTIC_POWER,},	{PROMOTION_ARCTIC_POWER,},	}
			},
			{	Name = "8th Air Army", X = 37, Y = 26, Domain = "Air", CivID = USSR,
				Group = {		RU_YAK_7, RU_IL2, RU_IL4, RU_IL4, RU_YAK_7},
			},	
		},
	},
	------------------------------------------------------------------------------------
}


-- No Units upgrades...
g_UnitUpgrades = {}

-- No Para
g_Paradrop = {}

----------------------------------------------------------------------------------------------------------------------------
-- Diplomacy
----------------------------------------------------------------------------------------------------------------------------


-- Victory types
g_Victory = {
	[USSR] = "VICTORY_USSR_EUROPE",
	[GERMANY] = "VICTORY_AXIS_EUROPE",
}

-- Virtual allies
g_Allied = {
	[USSR] = true,
}
g_Axis = {
	[GERMANY] = true,
}


----------------------------------------------------------------------------------------------------------------------------
-- Logistic
----------------------------------------------------------------------------------------------------------------------------

g_LogisticEntryPlot = {
	["0,30"] = {Active = true, Civs = {USSR, GERMANY} }, -- when can be used by all civs, can simply use ["0,30"] = {Active = true},
	["4,39"] = {Active = true, Civs = {USSR} },
	["14,39"] = {Active = true, Civs = {USSR} },
	["20,39"] = {Active = true, Civs = {USSR} },
	["25,39"] = {Active = true, Civs = {USSR} },
	["41,39"] = {Active = true, Civs = {USSR} },
	["41,39"] = {Active = true, Civs = {USSR} },
	["45,39"] = {Active = true, Civs = {USSR} },
	["47,39"] = {Active = true, Civs = {USSR} },
	["49,19"] = {Active = true, Civs = {USSR} },
	["49,11"] = {Active = true, Civs = {USSR} },
	["37,0"] = {Active = true},
	["12,0"] = {Active = true},
	["10,0"] = {Active = true},
	["4,0"] = {Active = true, Civs = {GERMANY} },
	["0,12"] = {Active = true, Civs = {GERMANY} },
}

----------------------------------------------------------------------------------------------------------------------------
-- Cities
----------------------------------------------------------------------------------------------------------------------------

-- Populate cities with buildings
-- Key cities are cities that need to be occupied to trigger victory
g_Cities = {
	-- GERMANY
	{X = 4, Y = 1, Buildings = { FACTORY, BARRACKS, LAND_FACTORY },}, -- TSYMLYANKAYA
	{X = 17, Y = 20, }, -- KALACH
	{X = 9, Y = 16, Buildings = { OPEN_CITY }, }, -- SUROVIKINO OPEN_CITY
	{X = 33, Y = 15, Buildings = { OPEN_CITY }, }, -- TUNDUTOVO
	{X = 24, Y = 19, Buildings = { OPEN_CITY }, }, -- KARPOVKA
	{X = 11, Y = 24, Buildings = { OPEN_CITY }, }, -- Verkhnyaya Buzinovka
	{X = 19, Y = 24, Buildings = { OPEN_CITY }, }, -- PESKOVATKA
	{X = 16, Y = 15, Buildings = { OPEN_CITY }, }, -- CHIR Station
	{X = 3, Y = 22, Buildings = { OPEN_CITY }, }, -- PRONIN
	{X = 1, Y = 13, Buildings = { FACTORY, BARRACKS, BASE, LAND_FACTORY, SMALL_AIR_FACTORY, MEDIUM_AIR_FACTORY, LARGE_AIR_FACTORY  }, }, -- MOROZOVSK
	{X = 24, Y = 4, Buildings = { OPEN_CITY }, }, -- ZALIVSKIY
	{X = 12, Y = 1, Buildings = { FACTORY, BARRACKS, LAND_FACTORY },}, -- KOTELNIKOVO
	{X = 31, Y = 8, Buildings = { OPEN_CITY }, }, -- ABGANEROVO
	{X = 16, Y = 8, Buildings = { OPEN_CITY }, }, -- VERKHNEKUMSKIY
	{X = 22, Y = 10, Buildings = { OPEN_CITY }, }, -- KUMSKIY
	{X = 38, Y = 9, Buildings = { OPEN_CITY }, }, -- Gorodovikovo
	-- U.S.S.R.
	{X = 23, Y = 29, Buildings = { OPEN_CITY }, }, -- PANSHIRSKIY
	--{X = 24, Y = 37, Buildings = { FACTORY, BARRACKS, LAND_FACTORY }, }, -- FROLOVO
	{X = 36, Y = 31, Buildings = { FACTORY, BARRACKS, LAND_FACTORY },  }, -- DUBOVKA
	{X = 20, Y = 31, Buildings = { OPEN_CITY }, }, -- SIROTINSKAYA
	{X = 37, Y = 26, }, -- VOLZHSKY <- that's the modern (post-1950) name...
	{X = 30, Y = 25, Buildings = { OPEN_CITY }, }, -- GUMRAK
	{X = 28, Y = 22, Buildings = { OPEN_CITY }, }, -- PITOMNIK
	{X = 46, Y = 12, Buildings = { OPEN_CITY }, }, -- VYAZOVKA
	{X = 5, Y = 33, }, -- SERAFIMOVITCH
	{X = 21, Y = 25, Buildings = { OPEN_CITY }, }, -- VERTYACHIY
	{X = 46, Y = 22, Buildings = { FACTORY, BARRACKS, BASE, LAND_FACTORY, SMALL_AIR_FACTORY, MEDIUM_AIR_FACTORY, LARGE_AIR_FACTORY }, }, -- ZNAMENSK
	{X = 41, Y = 24, }, -- LENINSK
	{X = 34, Y = 24, Buildings = { ARSENAL, BANK, HOSPITAL, FACTORY, BARRACKS, LAND_FACTORY },}, -- STALINGRAD
	{X = 16, Y = 34, Buildings = { OPEN_CITY }, }, -- KREMENSKAYA
	{X = 9, Y = 30, }, -- KLETSKAYA
}


----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------


--]]