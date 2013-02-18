-- Earth1936Defines
-- Author: Gedemon (Edited By CommanderBly)
-- DateCreated: 8/17/2012
----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------

print("Loading Earth 1936 Defines...")
print("-------------------------------------")

----------------------------------------------------------------------------------------------------------------------------
-- Scenario Rules
----------------------------------------------------------------------------------------------------------------------------

-- WAR_MINIMUM_STARTING_TURN is completed/replaced by selectable option "Allow Alternate History"
WAR_MINIMUM_STARTING_TURN = 3
REVEAL_ALL_CITIES = true -- cities tiles are always visible for every civs
EMBARK_FROM_HARBOR = true -- allow embarking only from a city with a port (and adjacent tiles)
BEACHHEAD_DAMAGE = true -- Amphibious assault on an empty tile owned by enemy civ will cause damage to the landing unit
NUM_BUILDINGS_IMPORTANT_CITY = 0 -- switch to health production on first turn for cities with less than 3 buildings added.

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
NO_AI_EMBARKATION = false -- remove AI ability to embark (to do : take total control of AI unit to embark) 

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

AFGHANISTAN = GameInfo.MinorCivilizations.MINOR_CIV_AFGHANISTAN.ID
ARGENTINA = GameInfo.MinorCivilizations.MINOR_CIV_ARGENTINA.ID
AUSTRALIA = GameInfo.MinorCivilizations.MINOR_CIV_AUSTRALIA.ID
ARABIA = GameInfo.MinorCivilizations.MINOR_CIV_ARABIA.ID
AUSTRIA = GameInfo.MinorCivilizations.MINOR_CIV_AUSTRIA.ID
BALTIC = GameInfo.MinorCivilizations.MINOR_CIV_BALTIC_STATES.ID
BELGIUM = GameInfo.MinorCivilizations.MINOR_CIV_BELGIUM.ID
BOLIVIA = GameInfo.MinorCivilizations.MINOR_CIV_BOLIVIA.ID
BRAZIL = GameInfo.MinorCivilizations.MINOR_CIV_BRAZIL.ID
BULGARIA = GameInfo.MinorCivilizations.MINOR_CIV_BULGARIA.ID
CANADA = GameInfo.MinorCivilizations.MINOR_CIV_CANADA.ID
CENTRAL = GameInfo.MinorCivilizations.MINOR_CIV_CENTRALAMERICA.ID
CHILE = GameInfo.MinorCivilizations.MINOR_CIV_CHILE.ID
COLOMBIA = GameInfo.MinorCivilizations.MINOR_CIV_CHILE.ID
CZECHOSOLVAKIA = GameInfo.MinorCivilizations.MINOR_CIV_CZECHOSOLVAKIA.ID
DENMARK = GameInfo.MinorCivilizations.MINOR_CIV_DENMARK.ID
ECUADOR = GameInfo.MinorCivilizations.MINOR_CIV_ECUADOR.ID
FINLAND = GameInfo.MinorCivilizations.MINOR_CIV_FINLAND.ID
HUNGARY = GameInfo.MinorCivilizations.MINOR_CIV_HUNGARY.ID
IRELAND = GameInfo.MinorCivilizations.MINOR_CIV_IRELAND.ID
MEXICO = GameInfo.MinorCivilizations.MINOR_CIV_MEXICO.ID
MONGOLIA = GameInfo.MinorCivilizations.MINOR_CIV_MONGOLIA.ID
NSPAIN = GameInfo.MinorCivilizations.MINOR_CIV_NATIONALISTSPAIN.ID
NETHERLANDS = GameInfo.MinorCivilizations.MINOR_CIV_NETHERLANDS.ID
NEWZEALAND = GameInfo.MinorCivilizations.MINOR_CIV_NEWZEALAND.ID
NORWAY = GameInfo.MinorCivilizations.MINOR_CIV_NORWAY.ID
PARAGUAY = GameInfo.MinorCivilizations.MINOR_CIV_PARAGUAY.ID
PERU = GameInfo.MinorCivilizations.MINOR_CIV_PERU.ID
POLAND = GameInfo.MinorCivilizations.MINOR_CIV_POLAND.ID
PORTUGAL = GameInfo.MinorCivilizations.MINOR_CIV_PORTUGAL.ID
RSPAIN = GameInfo.MinorCivilizations.MINOR_CIV_REPUBLICANSPAIN.ID
ROMANIA = GameInfo.MinorCivilizations.MINOR_CIV_ROMANIA.ID
SOUTHAFRICA = GameInfo.MinorCivilizations.MINOR_CIV_SOUTHAFRICA.ID
SWEDEN = GameInfo.MinorCivilizations.MINOR_CIV_SWEDEN.ID
SWITZERLAND = GameInfo.MinorCivilizations.MINOR_CIV_SWITZERLAND.ID
THAILAND = GameInfo.MinorCivilizations.MINOR_CIV_THAILAND.ID
TURKEY = GameInfo.MinorCivilizations.MINOR_CIV_TURKEY.ID
URAGUAY = GameInfo.MinorCivilizations.MINOR_CIV_URAGUAY.ID
VENEZUELA = GameInfo.MinorCivilizations.MINOR_CIV_VENEZUELA.ID
VICHY = GameInfo.MinorCivilizations.MINOR_CIV_VICHY.ID
YUGOSLAVIA = GameInfo.MinorCivilizations.MINOR_CIV_YUGOSLAVIA.ID


----------------------------------------------------------------------------------------------------------------------------
-- Buildings (see RedDefines.lua for IDs)
----------------------------------------------------------------------------------------------------------------------------

-- no override here, use default tables from RedDefines.lua...

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
		GE_INFANTRY, GE_PARATROOPER,
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
	[JAPAN] = {
		JP_INFANTRY,
		JP_TYPE97_SHINHORO, JP_TYPE1, JP_TYPE3, JP_TYPE4, TYPE4_CHI_TO, JP_TYPE5,
		JP_A6M2,
		JP_AICHI, JP_KI21,
		JP_SUBMARINE, JP_BATTLESHIP_2, JP_KAGERO, JP_TAKAO, JP_BATTLESHIP, JP_CARRIER,
		ARTILLERY},
	[CHINA] = {
		CH_INFANTRY,
		CH_T26B,
		CH_P40N,
		CH_B25,
		DESTROYER,
		ARTILLERY},
	[GREECE] = {
		GR_INFANTRY,
		GR_VICKERS_MKE, GR_VICKERS_MKII,
		GR_P24, GR_SPITFIRE,
		GR_FAIREY, GR_BLENHEIM,
		GR_SUBMARINE, GR_PISA, GR_GEORGIOS,
		ARTILLERY},
}


-- Units that have no combat penalty from absence of supply line
g_NoSupplyPenalty= {
	[FR_LEGION] = true,
	[PARATROOPER] = true,
	[GE_PARATROOPER] = true, 
}

-- Units that are restricted by number of instance (dead unit can be rebuild)
g_UnitMaxInstance = {
	[INFANTRY] = 126,
	[DESTROYER] = 12,
	[ARTILLERY] = 63,
}

-- unit type called when AI need reserve troops
g_Reserve_Unit = {
	[FRANCE] = { {Prob = 50, ID = FR_INFANTRY}, {Prob = 10, ID = FR_AMR35}, {Prob = 10, ID = FR_FCM36}, {Prob = 5, ID = FR_AMC35}, {Prob = 5, ID = FR_CHAR_D1}, {Prob = 5, ID = FR_CHAR_D2}, },
	[ENGLAND] = { {Prob = 50, ID = UK_INFANTRY}, {Prob = 20, ID = UK_VICKERS_MK6B}, {Prob = 10, ID = UK_TETRARCH}, {Prob = 5, ID = US_M3_GRANT},  },
	[USSR] = { {Prob = 50, ID = RU_INFANTRY}, {Prob = 20, ID = RU_T26}, {Prob = 15, ID = RU_T28},  },
	[GERMANY] = { {Prob = 50, ID = GE_INFANTRY}, {Prob = 20, ID = GE_PANZER_I}, {Prob = 15, ID = GE_PANZER_35},  },
	[ITALY] = { {Prob = 50, ID = IT_INFANTRY}, {Prob = 20, ID = IT_L6_40}, {Prob = 15, ID = IT_M11_39},  },
	[AMERICA] = { {Prob = 50, ID = US_INFANTRY}, {Prob = 25, ID = US_M3STUART}, {Prob = 10, ID = US_M3_GRANT},  },
	[JAPAN] = { {Prob = 75, ID = JP_INFANTRY}, {Prob = 25, ID = JP_TYPE97_SHINHORO}},
	[CHINA] = { {Prob = 75, ID = JP_INFANTRY}, {Prob = 15, ID = US_M3STUART}, {Prob = 10, ID = CH_T26B},  },
}

-- Thresholds used to check if AI need to call reserve troops
g_Reserve_Data = { 
	-- UnitThreshold : minimum number of land units left
	-- LandThreshold : minimum number of plot left
	-- LandUnitRatio : ratio between lands and units, use higher ratio when the nation as lot of space between cities
	[GERMANY] = {	UnitThreshold = 10, LandThreshold = 55, LandUnitRatio = 5, -- 55 total
					},
	[CHINA] = {	UnitThreshold = 13, LandThreshold = 352, LandUnitRatio = 20, -- 440 Total
					},
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
	[USSR] = {Air = 6, Sea = 6, Armor = 3, Artillery = 4,},
	[GERMANY] = {Air = 3, Sea = 5, Armor = 2, Artillery = 5,},
	[ITALY] = {Air = 5, Sea = 4, Armor = 4, Artillery = 6,},
	[AMERICA] = {Air = 2, Sea = 2, Armor = 4, Artillery = 5,},
	[JAPAN] = {Air = 3, Sea = 3, Armor = 7, Artillery = 5,},
	[CHINA] = {Air = 5, Sea = 10, Armor = 7, Artillery = 5,},
}

-- Order of Battle
-- group size = 7 units max placed in (and around) plot (x,y), except air placed only in central plot (should be city plot)
-- we can initialize any units for anyone here, no restriction by nation like in build list
g_Initial_OOB = {
-- French Navy and Air Force
	{Name = "French metr. aviation", X = 13, Y = 65, Domain = "Air", CivID = FRANCE, Group = {FR_HAWK75, FR_HAWK75,} },
	{Name = "French Mediteranean fleet", X = 15, Y = 57, Domain = "Sea", CivID = FRANCE, Group = {FR_FANTASQUE, FR_FANTASQUE, FR_SUBMARINE, FR_BATTLESHIP_2,} },
	{Name = "French Atlantic fleet", X = 5, Y = 63, Domain = "Sea", CivID = FRANCE, Group = {FR_FANTASQUE, FR_FANTASQUE, FR_GALISSONIERE, FR_SUBMARINE, FR_SUBMARINE, FR_GALISSONIERE, FR_BATTLESHIP,} },
-- German Navy and Air Force
	{Name = "German Luftwaffe", X = 23, Y = 70, Domain = "Air", CivID = GERMANY, Group = {GE_BF109, GE_BF109, GE_HE111, GE_JU87,} },
	{Name = "German Luftwaffe AI Bonus", X = 44, Y = 50, Domain = "Air", AI = true, CivID = GERMANY, Group = {GE_HE111, GE_HE111, GE_HE111,} },
	{Name = "German Fleet", X = 26, Y = 74, Domain = "Sea", CivID = GERMANY, Group = {GE_BATTLESHIP_2, GE_DESTROYER, GE_BATTLESHIP,} },
	{Name = "German Submarine Fleet", X = 179, Y = 79, Domain = "Sea", CivID = GERMANY, Group = { GE_SUBMARINE, GE_SUBMARINE, GE_SUBMARINE,} },
	{Name = "German Submarine Fleet AI bonus", X = 174, Y = 63, Domain = "Sea", AI = true, CivID = GERMANY, Group = { GE_SUBMARINE, GE_SUBMARINE, GE_SUBMARINE, GE_SUBMARINE,} },
-- British Navy and Air Force
	{Name = "England Metropole RAF", X = 11, Y = 71, Domain = "Air", CivID = ENGLAND, Group = {UK_SPITFIRE, UK_SPITFIRE,} },
	{Name = "England Cairo RAF", X = 36, Y = 40, Domain = "Air", CivID = ENGLAND, Group = {UK_SPITFIRE} },
	{Name = "England Dehli RAF", X = 60, Y = 51, Domain = "Air", CivID = ENGLAND, Group = {UK_SPITFIRE} },
	{Name = "England Home fleet", X = 11, Y = 81, Domain = "Sea", CivID = ENGLAND, Group = {UK_TRIBA, UK_TRIBA, UK_DIDO, UK_BATTLESHIP, UK_BATTLESHIP_2, UK_ELIZABETH} },
	{Name = "England Mediterranean fleet", X = 36, Y = 49, Domain = "Sea", CivID = ENGLAND, Group = {UK_TRIBA, UK_TRIBA, UK_SUBMARINE, UK_ELIZABETH} },
	{Name = "England Pacific fleet", X = 68, Y = 28, Domain = "Sea", CivID = ENGLAND, Group = {UK_TRIBA, UK_DIDO, UK_SUBMARINE, UK_BATTLESHIP, UK_ELIZABETH} },
	{Name = "England Home fleet AI Bonus", X = 8, Y = 81, Domain = "Sea", AI = true, CivID = ENGLAND, Group = {UK_TRIBA, UK_TRIBA, UK_DIDO} },
-- Soviet Navy and Air Force
	{Name = "USSR central aviation", X = 40, Y = 72, Domain = "Air", CivID = USSR, Group = {RU_I16,} },
	{Name = "USSR central aviation AI Bonus", X = 40, Y = 72, Domain = "Air", AI = true,CivID = USSR, Group = {RU_I16,} },
	{Name = "USSR North fleet", X = 42, Y = 91, Domain = "Sea", CivID = USSR, Group = {RU_GANGUT, RU_GANGUT, RU_GNEVNY, RU_SUBMARINE} },
	{Name = "USSR Central fleet", X = 33, Y = 77, Domain = "Sea", CivID = USSR, Group = {RU_GANGUT,} },
-- Italian Navy and Air Force
	{Name = "Italian air", X = 19, Y = 57, Domain = "Air", CivID = ITALY, Group = {IT_CR42} },
	{Name = "Italian air Benghazi", X = 26, Y = 47, Domain = "Air", CivID = ITALY, Group = {IT_CR42} },
	{Name = "Italian fleet", X = 19, Y = 53, Domain = "Sea", CivID = ITALY, Group = {IT_SOLDATI, IT_SOLDATI, IT_ZARA, IT_DI_CAVOUR, IT_SUBMARINE, IT_BATTLESHIP} },
	{Name = "Italian Destroyer", X = 21, Y = 61, Domain = "Sea", CivID = ITALY, Group = {IT_SOLDATI} },
-- American Navy and Air Force
	{Name = "American Air Corps", X = 119, Y = 54, Domain = "Air", CivID = AMERICA, Group = {US_P36} },
	{Name = "American Pacific fleet", X = 132, Y = 56, Domain = "Sea", CivID = AMERICA, Group = {US_BATTLESHIP, US_CARRIER, US_FLETCHER, US_BALTIMORE, US_FLETCHER, US_SUBMARINE, US_FLETCHER} },
	{Name = "American Atlantic Fleet", X = 158, Y = 63, Domain = "Sea", CivID = AMERICA, Group = {US_BATTLESHIP, US_FLETCHER, US_BALTIMORE, US_FLETCHER, US_FLETCHER} },
	{Name = "American Suez Fleet", X = 149, Y = 38, Domain = "Sea", CivID = AMERICA, Group = {US_SUBMARINE, US_SUBMARINE} },
-- Imperial Japanese Navy and Air Force
	{Name = "Japanese Manchurian Army", X = 54, Y = 19, Domain = "Land", AI = true, CivID = JAPAN, Group = {JP_INFANTRY, JP_INFANTRY, JP_INFANTRY, JP_INFANTRY} },
	{Name = "Japanese Air", X = 97, Y = 58, Domain = "Air", CivID = JAPAN, Group = {JP_A6M2, JP_A6M2, JP_A6M2} },
	{Name = "Japanese Korea Air", X = 86, Y = 67, Domain = "Air", CivID = JAPAN, Group = {JP_A6M2, JP_AICHI, JP_KI21} },
	{Name = "Japanese Air AI Bonus", X = 88, Y = 49, Domain = "Air", AI = true,CivID = JAPAN, Group = {JP_A6M2, JP_AICHI, JP_KI21} },
	{Name = "Japanese Western fleet", X = 93, Y = 53, Domain = "Sea", CivID = JAPAN, Group = {JP_SUBMARINE, JP_BATTLESHIP_2, JP_KAGERO, JP_TAKAO, JP_BATTLESHIP, JP_KAGERO, JP_KAGERO,} },
	{Name = "Japanese Eastern Fleet", X = 103, Y = 45, Domain = "Sea", CivID = JAPAN, Group = {JP_SUBMARINE, JP_TAKAO, JP_BATTLESHIP, JP_KAGERO, JP_KAGERO, JP_CARRIER, JP_CARRIER} },
-- Chinese Navy and Air Force
	{Name = "Chinese Army AI Bonus", X = 77, Y = 58, Domain = "Land", AI = true, CivID = CHINA, Group = {CH_INFANTRY, CH_INFANTRY, CH_INFANTRY, CH_INFANTRY} },
	{Name = "Chinese Air AI Bonus", X = 78, Y = 53, Domain = "Air", AI = true,CivID = CHINA, Group = {CH_P40N, CH_P40N} },
-- Greek Navy and Air Force
	{Name = "Greek fleet", X = 27, Y = 50, Domain = "Sea", CivID = GREECE, Group = {GR_GEORGIOS, GR_GEORGIOS} },
-- Dutch Navy and Air Force
	{Name = "Dutch fleet", X = 85, Y = 26, Domain = "Sea", CivID = NETHERLANDS, IsMinor = true, Group = {DESTROYER, DESTROYER, DESTROYER} },
-- Republican Spain Navy and Air Force
	{Name = "Republican Spain air", X = 8, Y = 55, Domain = "Air", CivID = RSPAIN, IsMinor = true, Group = {RU_I16} },
-- Nationalist Spain Navy and Air Force
	{Name = "Nationalist Spain air", X = 9, Y = 57, Domain = "Air", CivID = NSPAIN, IsMinor = true, Group = {GE_JU87, GE_BF109} },
	{Name = "Nationalist Spain fleet", X = 4, Y = 60, Domain = "Sea", CivID = NSPAIN, IsMinor = true, Group = {DESTROYER, DESTROYER} },
-- Australian Navy and Air Force
	{Name = "Australian fleet", X = 106, Y = 11, Domain = "Sea", CivID = AUSTRALIA, IsMinor = true, Group = {DESTROYER, DESTROYER, DESTROYER} },
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
	[JAPAN] = {OPERATION_CHINA, OPERATION_PACIFIC},
	[GERMANY] = {OPERATION_NORWAY, OPERATION_FALLGELB, OPERATION_TWENTYFIVE, OPERATION_MARITA},
}

----------------------------------------------------------------------------------------------------------------------------
-- Diplomacy
----------------------------------------------------------------------------------------------------------------------------

-- Victory types
g_Victory = {
}

g_MinorProtector = {
	--[NSPAIN] = {GERMANY, ITALY }, 
	--[RSPAIN] = {USSR, },  
	[THAILAND] = {JAPAN, }, 
	[MONGOLIA] = {USSR, },
	[AUSTRALIA] = {ENGLAND, },  
	[BELGIUM] = {FRANCE, ENGLAND}, 
	[NETHERLANDS] = {FRANCE, ENGLAND}, 
	[CANADA] = {ENGLAND, }, 
	[IRELAND] = {ENGLAND, }, 
	[NEWZEALAND] = {ENGLAND, },
	[PORTUGAL] = {ENGLAND, },
	[SOUTHAFRICA] = {ENGLAND, },
	[BRAZIL] = {AMERICA, },
	[COLOMBIA] = {AMERICA, },
	[VENEZUELA] = {AMERICA, },
	[PERU] = {AMERICA, },
	[CHILE] = {AMERICA, },
	[ARGENTINA] = {AMERICA, },
	[BOLIVIA] = {AMERICA, }, 
	[URAGUAY] = {AMERICA, },
	[PARAGUAY] = {AMERICA, },       
	[ROMANIA] = {GERMANY, ITALY},
	[CENTRAL] = {AMERICA, },
	[MEXICO] = {AMERICA, },
	[BULGARIA] = {GERMANY, },  
	[HUNGARY] = {GERMANY, }, 
	[YUGOSLAVIA] = {GREECE, },
	[SWEDEN] = {FRANCE, ENGLAND, GERMANY, }, 
}

-- Major Civilizations
-- to do in all table : add entry bCheck = function() return true or false, apply change only if true or nill
g_Major_Diplomacy = {
	[19360701] = { 
		{Type = PEA, Civ1 = FRANCE, Civ2 = ENGLAND},
	},
	[19370707] = { 
		{Type = DOW, Civ1 = JAPAN, Civ2 = CHINA},
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
	[19400927] = { 
		{Type = DOF, Civ1 = GERMANY, Civ2 = JAPAN},
	},
	[19401028] = { 
		{Type = DOW, Civ1 = ITALY, Civ2 = GREECE},
		{Type = PEA, Civ1 = ENGLAND, Civ2 = GREECE},
		{Type = PEA, Civ1 = FRANCE, Civ2 = GREECE},
	},
	[19410406] = {
		{Type = DOW, Civ1 = GERMANY, Civ2 = GREECE},
	},
	[19410622] = { 
		{Type = DOW, Civ1 = GERMANY, Civ2 = USSR},
		{Type = DOW, Civ1 = ITALY, Civ2 = USSR},
		{Type = DOF, Civ1 = FRANCE, Civ2 = USSR},
		{Type = DOF, Civ1 = ENGLAND, Civ2 = USSR},
		{Type = DOF, Civ1 = GREECE, Civ2 = USSR},
	},
	[19411207] = { 
		{Type = DOW, Civ1 = GERMANY, Civ2 = AMERICA},
		{Type = DOW, Civ1 = GERMANY, Civ2 = CHINA},
		{Type = DOW, Civ1 = ITALY, Civ2 = AMERICA},
		{Type = DOW, Civ1 = ITALY, Civ2 = CHINA},
		{Type = DOW, Civ1 = JAPAN, Civ2 = AMERICA},
		{Type = DOW, Civ1 = JAPAN, Civ2 = FRANCE},
		{Type = DOW, Civ1 = JAPAN, Civ2 = ENGLAND},
		{Type = DOW, Civ1 = JAPAN, Civ2 = GREECE},
		{Type = PEA, Civ1 = FRANCE, Civ2 = AMERICA},
		{Type = PEA, Civ1 = ENGLAND, Civ2 = AMERICA},
		{Type = DOF, Civ1 = USSR, Civ2 = AMERICA},
		{Type = PEA, Civ1 = CHINA, Civ2 = AMERICA},
		{Type = PEA, Civ1 = CHINA, Civ2 = FRANCE},
		{Type = PEA, Civ1 = CHINA, Civ2 = ENGLAND},
		{Type = PEA, Civ1 = GREECE, Civ2 = AMERICA},
		{Type = PEA, Civ1 = GREECE, Civ2 = CHINA},
	},
	[19450809] = { 
		{Type = DOW, Civ1 = USSR, Civ2 = JAPAN},
		{Type = PEA, Civ1 = FRANCE, Civ2 = USSR},
		{Type = PEA, Civ1 = ENGLAND, Civ2 = USSR},
		{Type = PEA, Civ1 = CHINA, Civ2 = USSR},
		{Type = PEA, Civ1 = GREECE, Civ2 = USSR},
		{Type = PEA, Civ1 = AMERICA, Civ2 = USSR},
	},				
}

-- Minor Civilizations
g_Minor_Relation = {
	[19360701] = { 
		{Value = 50, Major = USSR, Minor = RSPAIN},
		{Value = -50, Major = USSR, Minor = FINLAND},
		{Value = -50, Major = FRANCE, Minor = THAILAND},
		{Value = 50, Major = GERMANY, Minor = NSPAIN},
		{Value = 50, Major = ITALY, Minor = NSPAIN},
		{Value = 120, Major = ENGLAND, Minor = CANADA},
		{Value = 120, Major = FRANCE, Minor = CANADA},
		{Value = 120, Major = ENGLAND, Minor = AUSTRALIA},
		{Value = 120, Major = FRANCE, Minor = AUSTRALIA},
		{Value = 120, Major = ENGLAND, Minor = NEWZEALAND},
		{Value = 120, Major = FRANCE, Minor = NEWZEALAND},
		{Value = 120, Major = ENGLAND, Minor = SOUTHAFRICA},
		{Value = 120, Major = FRANCE, Minor = SOUTHAFRICA},
	},
	[19380320] = { 
		{Value = 120, Major = ENGLAND, Minor = POLAND},
		{Value = 120, Major = FRANCE, Minor = POLAND},
		{Value = 50, Major = GERMANY, Minor = HUNGARY},
		{Value = 50, Major = ITALY, Minor = HUNGARY},
		{Value = 50, Major = ENGLAND, Minor = BELGIUM},
		{Value = 50, Major = FRANCE, Minor = BELGIUM},
		{Value = 50, Major = ENGLAND, Minor = NETHERLANDS},
		{Value = 50, Major = FRANCE, Minor = NETHERLANDS},
		{Value = 50, Major = ENGLAND, Minor = NORWAY},
		{Value = 50, Major = FRANCE, Minor = NORWAY},
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
	},
	[19401028] = { 
		{Value = 120, Major = ENGLAND, Minor = YUGOSLAVIA},
		{Value = 120, Major = FRANCE, Minor = YUGOSLAVIA},
	},
	[19410406] = { 
		{Value = 120, Major = GREECE, Minor = YUGOSLAVIA},
		{Value = 120, Major = GREECE, Minor = NETHERLANDS},
		{Value = 120, Major = GREECE, Minor = BELGIUM},
		{Value = 120, Major = GREECE, Minor = NORWAY},
		{Value = 120, Major = GREECE, Minor = DENMARK},
		{Value = 120, Major = GREECE, Minor = POLAND},
		{Value = 120, Major = GREECE, Minor = CANADA},
	    {Value = 120, Major = GREECE, Minor = AUSTRALIA},
		{Value = 120, Major = GREECE, Minor = NEWZEALAND},
		{Value = 120, Major = GREECE, Minor = SOUTHAFRICA},
	},
	[19410622] = { 
		{Value = 120, Major = GERMANY, Minor = ROMANIA},
		{Value = 120, Major = GERMANY, Minor = FINLAND},
		{Value = 120, Major = ITALY, Minor = ROMANIA},
		{Value = 120, Major = ITALY, Minor = HUNGARY},
		{Value = 120, Major = ITALY, Minor = BULGARIA},
		{Value = 120, Major = ITALY, Minor = FINLAND},
		{Value = 120, Major = GERMANY, Minor = BULGARIA},
	},
	[19411207] = { 
		{Value = 120, Major = AMERICA, Minor = POLAND},
		{Value = 120, Major = AMERICA, Minor = NETHERLANDS},
		{Value = 120, Major = AMERICA, Minor = BELGIUM},
		{Value = 120, Major = AMERICA, Minor = DENMARK},
		{Value = 120, Major = AMERICA, Minor = NORWAY},
		{Value = 120, Major = AMERICA, Minor = YUGOSLAVIA},
		{Value = 120, Major = AMERICA, Minor = CANADA},
		{Value = 120, Major = AMERICA, Minor = AUSTRALIA},
		{Value = 120, Major = AMERICA, Minor = NEWZEALAND},
		{Value = 120, Major = AMERICA, Minor = SOUTHAFRICA},
		{Value = 120, Major = AMERICA, Minor = CENTRAL},
		{Value = 120, Major = ENGLAND, Minor = CENTRAL},
		{Value = 120, Major = FRANCE, Minor = CENTRAL},
		{Value = 120, Major = CHINA, Minor = CENTRAL},
		{Value = 120, Major = GREECE, Minor = CENTRAL},
	},
	[19420125] = { 
		{Value = 120, Major = JAPAN, Minor = THAILAND},
	},
	[19420822] = { 
		{Value = 120, Major = AMERICA, Minor = BRAZIL},
		{Value = 120, Major = ENGLAND, Minor = BRAZIL},
		{Value = 120, Major = FRANCE, Minor = BRAZIL},
		{Value = 120, Major = CHINA, Minor = BRAZIL},
		{Value = 120, Major = GREECE, Minor = BRAZIL},
		{Value = 120, Major = AMERICA, Minor = MEXICO},
		{Value = 120, Major = ENGLAND, Minor = MEXICO},
		{Value = 120, Major = FRANCE, Minor = MEXICO},
		{Value = 120, Major = CHINA, Minor = MEXICO},
		{Value = 120, Major = GREECE, Minor = MEXICO},
	},
	[19430407] = { 
		{Value = 120, Major = AMERICA, Minor = BOLIVIA},
		{Value = 120, Major = ENGLAND, Minor = BOLIVIA},
		{Value = 120, Major = FRANCE, Minor = BOLIVIA},
		{Value = 120, Major = CHINA, Minor = BOLIVIA},
		{Value = 120, Major = GREECE, Minor = BOLIVIA},
	},
	[19430726] = { 
		{Value = 120, Major = AMERICA, Minor = COLOMBIA},
		{Value = 120, Major = ENGLAND, Minor = COLOMBIA},
		{Value = 120, Major = FRANCE, Minor = COLOMBIA},
		{Value = 120, Major = CHINA, Minor = COLOMBIA},
		{Value = 120, Major = GREECE, Minor = COLOMBIA},
	},
	[19440202] = { 
		{Value = 120, Major = AMERICA, Minor = PERU},
		{Value = 120, Major = ENGLAND, Minor = PERU},
		{Value = 120, Major = FRANCE, Minor = PERU},
		{Value = 120, Major = CHINA, Minor = PERU},
		{Value = 120, Major = GREECE, Minor = PERU},
	},
	[19440915] = { 
		{Value = 120, Major = AMERICA, Minor = FINLAND},
		{Value = 120, Major = ENGLAND, Minor = FINLAND},
		{Value = 120, Major = FRANCE, Minor = FINLAND},
		{Value = 120, Major = CHINA, Minor = FINLAND},
		{Value = 120, Major = GREECE, Minor = FINLAND},
		{Value = -120, Major = GERMANY, Minor = FINLAND},
		{Value = -120, Major = ITALY, Minor = FINLAND},
	},
	[19450202] = { 
		{Value = 120, Major = AMERICA, Minor = ECUADOR},
		{Value = 120, Major = ENGLAND, Minor = ECUADOR},
		{Value = 120, Major = FRANCE, Minor = ECUADOR},
		{Value = 120, Major = CHINA, Minor = ECUADOR},
		{Value = 120, Major = GREECE, Minor = ECUADOR},
	},
	[19450207] = { 
		{Value = 120, Major = AMERICA, Minor = PARAGUAY},
		{Value = 120, Major = ENGLAND, Minor = PARAGUAY},
		{Value = 120, Major = FRANCE, Minor = PARAGUAY},
		{Value = 120, Major = CHINA, Minor = PARAGUAY},
		{Value = 120, Major = GREECE, Minor = PARAGUAY},
	},
	[19450215] = { 
		{Value = 120, Major = AMERICA, Minor = URAGUAY},
		{Value = 120, Major = ENGLAND, Minor = URAGUAY},
		{Value = 120, Major = FRANCE, Minor = URAGUAY},
		{Value = 120, Major = CHINA, Minor = URAGUAY},
		{Value = 120, Major = GREECE, Minor = URAGUAY},
		{Value = 120, Major = AMERICA, Minor = VENEZUELA},
		{Value = 120, Major = ENGLAND, Minor = VENEZUELA},
		{Value = 120, Major = FRANCE, Minor = VENEZUELA},
		{Value = 120, Major = CHINA, Minor = VENEZUELA},
		{Value = 120, Major = GREECE, Minor = VENEZUELA},
	},
	[19450223] = { 
		{Value = 120, Major = AMERICA, Minor = TURKEY},
		{Value = 120, Major = ENGLAND, Minor = TURKEY},
		{Value = 120, Major = FRANCE, Minor = TURKEY},
		{Value = 120, Major = CHINA, Minor = TURKEY},
		{Value = 120, Major = GREECE, Minor = TURKEY},
	},
	[19450301] = { 
		{Value = 120, Major = AMERICA, Minor = ARABIA},
		{Value = 120, Major = ENGLAND, Minor = ARABIA},
		{Value = 120, Major = FRANCE, Minor = ARABIA},
		{Value = 120, Major = CHINA, Minor = ARABIA},
		{Value = 120, Major = GREECE, Minor = ARABIA},
	},
	[19450327] = { 
		{Value = 120, Major = AMERICA, Minor = ARGENTINA},
		{Value = 120, Major = ENGLAND, Minor = ARGENTINA},
		{Value = 120, Major = FRANCE, Minor = ARGENTINA},
		{Value = 120, Major = CHINA, Minor = ARGENTINA},
		{Value = 120, Major = GREECE, Minor = ARGENTINA},
	},
	[19450411] = { 
		{Value = 120, Major = AMERICA, Minor = CHILE},
		{Value = 120, Major = ENGLAND, Minor = CHILE},
		{Value = 120, Major = FRANCE, Minor = CHILE},
		{Value = 120, Major = CHINA, Minor = CHILE},
		{Value = 120, Major = GREECE, Minor = CHILE},
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
	[19410622] = { 
		{Major = USSR, Minor = HUNGARY},
		{Major = USSR, Minor = BULGARIA},	
	},
	[19401028] = {	
		{Major = ITALY, Minor = BELGIUM},
		{Major = ITALY, Minor = NETHERLANDS},
	},
	[19410406] = { 
		{Major = ITALY, Minor = YUGOSLAVIA},
		{Major = GERMANY, Minor = YUGOSLAVIA},
	},
	[19421110] = { 
		{Major = ENGLAND, Minor = VICHY},
		{Major = AMERICA, Minor = VICHY},
	},
}
g_Major_Minor_Peace = {
	[19400313] = { 
		{Major = USSR, Minor = FINLAND},	
	},
	[19440915] = { 
		{Major = USSR, Minor = FINLAND},
		{Major = AMERICA, Minor = FINLAND},	
		{Major = ENGLAND, Minor = FINLAND},
		{Major = FRANCE, Minor = FINLAND},
		{Major = GREECE, Minor = FINLAND},	
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
	},
}
g_Minor_Major_DoW = {
	[19390903] = { 
		{Minor = AUSTRALIA, Major = GERMANY},
		{Minor = CANADA, Major = GERMANY},
		{Minor = NEWZEALAND, Major = GERMANY},
		{Minor = SOUTHAFRICA, Major = GERMANY},
	},
	[19400610] = { 
		{Minor = AUSTRALIA, Major = ITALY},
		{Minor = CANADA, Major = ITALY},
		{Minor = NEWZEALAND, Major = ITALY},
		{Minor = SOUTHAFRICA, Major = ITALY},
		{Minor = DENMARK, Major = ITALY},
		{Minor = NORWAY, Major = ITALY},
		{Minor = POLAND, Major = ITALY},
	},
	[19410406] = { 
		{Minor = BULGARIA, Major = GREECE},
	},
	[19410622] = { 
		{Minor = ROMANIA, Major = USSR},
		{Minor = FINLAND, Major = USSR},
	},
	[19411207] = { 
		{Minor = AUSTRALIA, Major = JAPAN},
		{Minor = CANADA, Major = JAPAN},
		{Minor = NEWZEALAND, Major = JAPAN},
		{Minor = SOUTHAFRICA, Major = JAPAN},
		{Minor = DENMARK, Major = JAPAN},
		{Minor = NORWAY, Major = JAPAN},
		{Minor = POLAND, Major = JAPAN},
		{Minor = BELGIUM, Major = JAPAN},
		{Minor = NETHERLANDS, Major = JAPAN},
		{Minor = CENTRAL, Major = JAPAN},
		{Minor = CENTRAL, Major = GERMANY},
		{Minor = CENTRAL, Major = ITALY},
	},
	[19420822] = { 
		{Minor = BRAZIL, Major = JAPAN},
		{Minor = BRAZIL, Major = GERMANY},
		{Minor = BRAZIL, Major = ITALY},
		{Minor = MEXICO, Major = JAPAN},
		{Minor = MEXICO, Major = GERMANY},
		{Minor = MEXICO, Major = ITALY},
	},
	[19430407] = { 
		{Minor = BOLIVIA, Major = JAPAN},
		{Minor = BOLIVIA, Major = GERMANY},
		{Minor = BOLIVIA, Major = ITALY},
	},
	[19430726] = { 
		{Minor = COLOMBIA, Major = JAPAN},
		{Minor = COLOMBIA, Major = GERMANY},
		{Minor = COLOMBIA, Major = ITALY},
	},
	[19440202] = { 
		{Minor = PERU, Major = JAPAN},
		{Minor = PERU, Major = GERMANY},
		{Minor = PERU, Major = ITALY},
	},
	[19450202] = { 
		{Minor = ECUADOR, Major = JAPAN},
		{Minor = ECUADOR, Major = GERMANY},
		{Minor = ECUADOR, Major = ITALY},
	},
	[19450202] = { 
		{Minor = PARAGUAY, Major = JAPAN},
		{Minor = PARAGUAY, Major = GERMANY},
		{Minor = PARAGUAY, Major = ITALY},
	},
	[19450215] = { 
		{Minor = URAGUAY, Major = JAPAN},
		{Minor = URAGUAY, Major = GERMANY},
		{Minor = URAGUAY, Major = ITALY},
		{Minor = VENEZUELA, Major = JAPAN},
		{Minor = VENEZUELA, Major = GERMANY},
		{Minor = VENEZUELA, Major = ITALY},
	},
	[19450223] = { 
		{Minor = TURKEY, Major = JAPAN},
		{Minor = TURKEY, Major = GERMANY},
		{Minor = TURKEY, Major = ITALY},
	},
	[19450301] = { 
		{Minor = ARABIA, Major = JAPAN},
		{Minor = ARABIA, Major = GERMANY},
		{Minor = ARABIA, Major = ITALY},
	},
	[19450327] = { 
		{Minor = ARGENTINA, Major = JAPAN},
		{Minor = ARGENTINA, Major = GERMANY},
		{Minor = ARGENTINA, Major = ITALY},
	},
	[19450411] = { 
		{Minor = CHILE, Major = JAPAN},
	},
}




----------------------------------------------------------------------------------------------------------------------------
-- Cities
----------------------------------------------------------------------------------------------------------------------------

-- Populate cities with buildings
-- Key cities are cities that need to be occupied to trigger victory
g_Cities = {
	-- UNITED KINGDOM
		{X = 11, Y = 71, Key = true, Buildings = { HARBOR, SHIPYARD, FACTORY, BANK }, AIBuildings = {RADIO, ARSENAL, HOSPITAL}, }, -- London
		{X = 10, Y = 77, Key = true, Buildings = { HARBOR, BANK }, AIBuildings = {RADIO, ARSENAL, HOSPITAL}, }, -- Edinburgh
		{X = 9, Y = 74, Key = true, Buildings = { HARBOR, BANK }, AIBuildings = {RADIO, HOSPITAL}, }, -- Manchester
		{X = 10, Y = 72, Key = true, Buildings = { BANK }, AIBuildings = {RADIO, HOSPITAL}, }, -- Birmingham
	-- GERMANY
		{X = 23, Y = 70, Key = true, Buildings = { BARRACKS, ARSENAL, ACADEMY, BANK, FACTORY }, AIBuildings = {RADIO, ARSENAL, HOSPITAL}, }, -- Berlin
		{X = 19, Y = 72, Key = true, Buildings = { BANK, HARBOR }, AIBuildings = {RADIO, ARSENAL, HOSPITAL, BARRACKS, FACTORY}, }, -- Hamburg
		{X = 21, Y = 64, Key = true, Buildings = { BANK }, AIBuildings = {RADIO, ARSENAL, HOSPITAL, BARRACKS, FACTORY}, }, -- Munich
		{X = 20, Y = 67, Key = true, Buildings = { BANK }, AIBuildings = {RADIO, ARSENAL, HOSPITAL, BARRACKS, FACTORY}, }, -- Frankfurt
	-- FRANCE
		{X = 13, Y = 65, Key = true, Buildings = { BANK, FACTORY, ARSENAL }, AIBuildings = {RADIO, HOSPITAL}, }, -- Paris
		{X = 15, Y = 59, Key = true, Buildings = { HARBOR, BANK }, AIBuildings = {RADIO, HOSPITAL, BANK}, }, -- Marseille
		{X = 15, Y = 62, Key = true, Buildings = { BANK }, AIBuildings = {}, }, -- Lyon
		{X = 11, Y = 62, Key = true, Buildings = { BANK }, AIBuildings = {}, }, -- Bordeaux
	-- ITALY
		{X = 19, Y = 57, Key = true, Buildings = { HARBOR, BANK, BARRACKS }, AIBuildings = {RADIO, ARSENAL, HOSPITAL, FACTORY, BASE}, }, -- Rome
		{X = 21, Y = 54, Key = true, Buildings = { HARBOR, BANK }, AIBuildings = {RADIO, ARSENAL, HOSPITAL, FACTORY}, }, -- Naples
		{X = 19, Y = 60, Key = true, Buildings = { BANK }, AIBuildings = {RADIO, ARSENAL, HOSPITAL}, }, -- Milan
	-- U.S.S.R.
	    {X = 40, Y = 72, Key = true, Buildings = { BARRACKS, ARSENAL }, AIBuildings = {RADIO, HOSPITAL, BANK, FACTORY, BASE}, }, -- Moscow
		{X = 41, Y = 67, Key = true, Buildings = {}, AIBuildings = {RADIO, ARSENAL, HOSPITAL, BANK}, }, -- Stalingrad
		{X = 33, Y = 77, Key = true, Buildings = { HARBOR }, AIBuildings = {RADIO, ARSENAL, HOSPITAL, BANK, BASE}, }, -- Leningrad
		{X = 33, Y = 72, Key = true, Buildings = {}, AIBuildings = {RADIO, ARSENAL, HOSPITAL, BANK}, }, -- Minsk
		{X = 34, Y = 66, Key = true, Buildings = {}, AIBuildings = {RADIO, ARSENAL, HOSPITAL, BANK}, }, -- Kiev
		{X = 35, Y = 61, Key = true, Buildings = { HARBOR }, AIBuildings = {RADIO, HOSPITAL}, }, -- Stevaspol
		{X = 39, Y = 89, Key = true, Buildings = { HARBOR }, AIBuildings = {RADIO, ARSENAL, HOSPITAL, FACTORY}, }, -- Murmansk
		{X = 46, Y = 69, Key = true, Buildings = {}, AIBuildings = {RADIO, FACTORY, HOSPITAL}, }, -- Kuybyshev
		{X = 66, Y = 72, Key = true, Buildings = {}, AIBuildings = {RADIO, FACTORY, HOSPITAL, BARRACKS}, }, -- Novosibirsk
	-- AMERICA
		{X = 156, Y = 62, Key = true, Buildings = { ACADEMY, BANK, ARSENAL, HARBOR }, AIBuildings = {RADIO, HOSPITAL, BARRACKS, BASE}, }, -- Washington
		{X = 144, Y = 56, Key = true, Buildings = { BANK }, AIBuildings = {RADIO, ARSENAL, HOSPITAL, FACTORY}, }, -- Dallas
		{X = 132, Y = 62, Key = true, Buildings = { BANK, HARBOR }, AIBuildings = {RADIO, ARSENAL, HOSPITAL, FACTORY}, }, -- San Francisco
		{X = 132, Y = 59, Key = true, Buildings = { BANK, HARBOR }, AIBuildings = {RADIO, ARSENAL, HOSPITAL, FACTORY}, }, -- Los Angeles
		{X = 149, Y = 61, Key = true, Buildings = {}, AIBuildings = {RADIO, HOSPITAL, BANK}, }, -- St. Louis
		{X = 132, Y = 67, Key = true, Buildings = { BANK, HARBOR }, AIBuildings = {RADIO, ARSENAL, HOSPITAL, FACTORY}, }, -- Seattle
		{X = 150, Y = 65, Key = true, Buildings = { BANK }, AIBuildings = {RADIO, RADIO, HOSPITAL, FACTORY, BARRACKS}, }, -- Chicago
		{X = 159, Y = 66, Key = true, Buildings = { HARBOR, BANK }, AIBuildings = {RADIO, ARSENAL, HOSPITAL, FACTORY}, }, -- Boston
		{X = 157, Y = 65, Key = true, Buildings = { HARBOR, BANK, RADIO }, AIBuildings = {ARSENAL, HOSPITAL, FACTORY}, }, -- New York
		{X = 153, Y = 63, Key = true, Buildings = { BANK, FACTORY}, AIBuildings = {RADIO, BANK, HOSPITAL}, }, -- Detriot
	-- JAPAN
		{X = 97, Y = 58, Key = true, Buildings = { BANK, FACTORY, ARSENAL, BARRACKS, HARBOR, SHIPYARD, BASE }, AIBuildings = {RADIO, HOSPITAL}, }, -- Tokyo
		{X = 94, Y = 57, Key = true, Buildings = { HARBOR, BANK }, AIBuildings = {RADIO, HOSPITAL}, }, -- Osaka
		{X = 96, Y = 67, Key = true, Buildings = { BANK, HARBOR }, AIBuildings = {RADIO, ARSENAL, HOSPITAL}, }, -- Sapparo
		{X = 89, Y = 61, Key = true, Buildings = { BANK, HARBOR }, AIBuildings = {RADIO, ARSENAL, HOSPITAL}, }, -- Seoul
	-- CHINA
		{X = 85, Y = 57, Key = true, Buildings = { BANK, BARRACKS }, AIBuildings = {RADIO, ARSENAL, HOSPITAL, FACTORY}, }, -- Nanjing
		{X = 88, Y = 56, Key = true, Buildings = { HARBOR, BANK, FACTORY }, AIBuildings = {RADIO, ARSENAL, HOSPITAL, BARRACKS}, }, -- Shanghai
		{X = 82, Y = 64, Key = true, Buildings = { BANK }, AIBuildings = {RADIO, ARSENAL, HOSPITAL}, }, -- Peking
		{X = 78, Y = 53, Key = true, Buildings = { BANK, BARRACKS }, AIBuildings = {RADIO, ARSENAL, HOSPITAL}, }, -- Chongqing
		{X = 82, Y = 47, Key = true, Buildings = { BANK }, AIBuildings = {RADIO, ARSENAL, HOSPITAL}, }, -- Guangzhou
	-- GREECE
		{X = 29, Y = 54, Key = true, Buildings = { BANK, HARBOR }, AIBuildings = {RADIO, ARSENAL, HOSPITAL}, }, -- Athens
		{X = 26, Y = 53, Key = true, Buildings = { HARBOR, BANK }, AIBuildings = {RADIO, ARSENAL, HOSPITAL}, }, -- Patras
}


----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------