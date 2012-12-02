-- RedEurope1940Defines
-- Author: Gedemon
----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------

print("Loading Small Euro 1940 Defines...")
print("-------------------------------------")

----------------------------------------------------------------------------------------------------------------------------
-- Scenario Specific Rules
----------------------------------------------------------------------------------------------------------------------------

WAR_MINIMUM_STARTING_TURN = 3
REVEAL_ALL_CITIES = true -- cities tiles are always visible for every civs
EMBARK_FROM_HARBOR = false -- allow embarking only from a city with a port (and adjacent tiles)
BEACHHEAD_DAMAGE = true -- Amphibious assault on an empty tile owned by enemy civ will cause damage to the landing unit
CLOSE_MINOR_NEUTRAL_CIV_BORDERS = true -- if true will place mountain on neutral territories to make them impassable

----------------------------------------------------------------------------------------------------------------------------
-- AI Scenario Specific Rules
----------------------------------------------------------------------------------------------------------------------------

NO_AI_EMBARKATION = false -- remove AI ability to embark (to do : take total control of AI unit to embark)
NO_SUICIDE_ATTACK = false -- If set to true, try to prevent suicide attacks

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

-- No sea units, Remove shipyards from available buildings... 
g_Major_Buildings = {
	[FRANCE] = {FACTORY, ARSENAL, HARBOR, RADIO, BARRACKS, ACADEMY, BASE, HOSPITAL, BANK, COURTHOUSE, BARRICADE, LAND_FACTORY, SMALL_AIR_FACTORY, MEDIUM_AIR_FACTORY }, -- LARGE_AIR_FACTORY, : no bombers or heavy bombers
	[ENGLAND] = {FACTORY, ARSENAL, HARBOR, RADIO, BARRACKS, ACADEMY, BASE, HOSPITAL, BANK, COURTHOUSE, BARRICADE, LAND_FACTORY, SMALL_AIR_FACTORY, MEDIUM_AIR_FACTORY, LARGE_AIR_FACTORY },
	[USSR] = {FACTORY, ARSENAL, HARBOR, RADIO, BARRACKS, ACADEMY, BASE, HOSPITAL, BANK, COURTHOUSE, BARRICADE, LAND_FACTORY, SMALL_AIR_FACTORY, MEDIUM_AIR_FACTORY, LARGE_AIR_FACTORY },
	[GERMANY] = {FACTORY, ARSENAL, HARBOR, RADIO, BARRACKS, ACADEMY, BASE, HOSPITAL, BANK, COURTHOUSE, BARRICADE, LAND_FACTORY, SMALL_AIR_FACTORY, MEDIUM_AIR_FACTORY, LARGE_AIR_FACTORY },
	[ITALY] = {FACTORY, ARSENAL, HARBOR, RADIO, BARRACKS, ACADEMY, BASE, HOSPITAL, BANK, COURTHOUSE, BARRICADE, LAND_FACTORY, SMALL_AIR_FACTORY, MEDIUM_AIR_FACTORY, LARGE_AIR_FACTORY },
	[GREECE] = {FACTORY, ARSENAL, HARBOR, RADIO, BARRACKS, ACADEMY, BASE, HOSPITAL, BANK, COURTHOUSE, BARRICADE, LAND_FACTORY, SMALL_AIR_FACTORY, LARGE_AIR_FACTORY }, -- MEDIUM_AIR_FACTORY, : no fast bombers/heavy fighters
}


----------------------------------------------------------------------------------------------------------------------------
-- Units (see RedDefines.lua for IDs)
----------------------------------------------------------------------------------------------------------------------------

-- Available units for minor civs
g_Minor_Units = {}

-- Combat type ratio restriction used by AI
g_Combat_Type_Ratio = { 
	-- Air		<= military units / air units
	-- Sea		<= military units / sea units
	-- Armor	<= land units / armor units
	-- Artillery<= land units / artillery units
	-- ( 1 = no limit )
	[FRANCE]	= {Air = 5, Sea = 10, Armor = 2, Artillery = 8,},
	[ENGLAND]	= {Air = 4, Sea = 10, Armor = 2, Artillery = 8,},
	[USSR]		= {Air = 5, Sea = 10, Armor = 3, Artillery = 7.5,},
	[GERMANY]	= {Air = 5, Sea = 10, Armor = 1.85, Artillery = 8,},
	[ITALY]		= {Air = 5, Sea = 10, Armor = 3, Artillery = 8,},
	[GREECE]	= {Air = 5, Sea = 10, Armor = 4, Artillery = 8,},
}

-- Armor type ratio restriction used by AI
g_Max_Armor_SubClass_Percent = {
	-- max num	<= armor units / type units
	[FRANCE]	= {	[CLASS_LIGHT_TANK] = 50, [CLASS_CRUISER_TANK] = 20, [CLASS_TANK] = 60, [CLASS_HEAVY_TANK] = 20, [CLASS_ASSAULT_GUN] = 10, },--[CLASS_LIGHT_TANK_DESTROYER] = 15, [CLASS_TANK_DESTROYER] = 10,	},
	[ENGLAND]	= {	[CLASS_LIGHT_TANK] = 50, [CLASS_CRUISER_TANK] = 20, [CLASS_TANK] = 60, [CLASS_HEAVY_TANK] = 20, [CLASS_ASSAULT_GUN] = 10, },--[CLASS_LIGHT_TANK_DESTROYER] = 15, [CLASS_TANK_DESTROYER] = 10,	},
	[USSR]		= {	[CLASS_LIGHT_TANK] = 50, [CLASS_CRUISER_TANK] = 20, [CLASS_TANK] = 60, [CLASS_HEAVY_TANK] = 20, [CLASS_ASSAULT_GUN] = 10, },--[CLASS_LIGHT_TANK_DESTROYER] = 15, [CLASS_TANK_DESTROYER] = 10,	},
	[GERMANY]	= {	[CLASS_LIGHT_TANK] = 50, [CLASS_CRUISER_TANK] = 20, [CLASS_TANK] = 60, [CLASS_HEAVY_TANK] = 20, [CLASS_ASSAULT_GUN] = 10, },--[CLASS_LIGHT_TANK_DESTROYER] = 15, [CLASS_TANK_DESTROYER] = 10,	},
	[ITALY]		= {	[CLASS_LIGHT_TANK] = 50, [CLASS_CRUISER_TANK] = 20, [CLASS_TANK] = 60, [CLASS_HEAVY_TANK] = 20, [CLASS_ASSAULT_GUN] = 10, },--[CLASS_LIGHT_TANK_DESTROYER] = 15, [CLASS_TANK_DESTROYER] = 10,	},
	[GREECE]	= {	[CLASS_LIGHT_TANK] = 50, [CLASS_CRUISER_TANK] = 20, [CLASS_TANK] = 60, [CLASS_HEAVY_TANK] = 20, [CLASS_ASSAULT_GUN] = 10, },--[CLASS_LIGHT_TANK_DESTROYER] = 15, [CLASS_TANK_DESTROYER] = 10,	},
}		



-- Order of Battle
-- group size = 7 units max placed in (and around) plot (x,y), except air placed only in central plot (should be city plot)
-- we can initialize any units for anyone here, no restriction by nation like in build list
g_Initial_OOB = { 
	{Name = "French north army", X = 15, Y = 32, Domain = "Land", CivID = FRANCE, Group = {FR_INFANTRY, FR_INFANTRY, FR_AMR35, FR_B1, FR_S35} },
	{Name = "French south army", X = 8, Y = 22, Domain = "Land", AI = true, CivID = FRANCE, Group = {FR_INFANTRY, FR_INFANTRY, FR_CHAR_D1} },
	{Name = "French metr. aviation", X = 10, Y = 33, Domain = "Air", CivID = FRANCE, Group = {FR_MS406, FR_MS406 } },
	{Name = "French metr. aviation AI Bonus", X = 10, Y = 33, Domain = "Air", AI = true, CivID = FRANCE, Group = {FR_HAWK75, FR_HAWK75 } },	

	{Name = "England Metropole army", X = 9, Y = 42, Domain = "Land", CivID = ENGLAND, Group = {UK_INFANTRY, UK_TETRARCH} },
	{Name = "England Exped. corp Netherlands", X = 8, Y = 40, Domain = "Land", AI = true, CivID = ENGLAND, Group = {UK_INFANTRY, UK_INFANTRY, UK_MATILDA_I, UK_MATILDA_II} },
	{Name = "England Exped. corp Belgium", X = 6, Y = 41, Domain = "Land", CivID = ENGLAND, Group = {UK_INFANTRY, UK_TETRARCH} },
	{Name = "England Metropole RAF", X = 9, Y = 40, Domain = "Air", CivID = ENGLAND, Group = {UK_SPITFIRE, UK_SPITFIRE, UK_WELLINGTON, UK_WELLINGTON} },
	{Name = "England Metropole RAF AI", X = 9, Y = 40, Domain = "Air", AI = true, CivID = ENGLAND, Group = {UK_SPITFIRE, UK_SPITFIRE,} },

	{Name = "USSR central army", X = 57, Y = 36, Domain = "Land", CivID = USSR, Group = {RU_INFANTRY, RU_INFANTRY, RU_INFANTRY, RU_BT2, RU_T26, RU_T28} },
	{Name = "USSR moscow army", X = 49, Y = 45, Domain = "Land", AI = true, CivID = USSR, Group = {RU_INFANTRY, RU_INFANTRY, RU_INFANTRY, RU_BT2, RU_BT2, RU_BT7} },
	{Name = "USSR central aviation", X = 54, Y = 46, Domain = "Air", CivID = USSR, Group = {RU_I16, RU_I16} },
	{Name = "USSR central aviation AI Bonus", X = 54, Y = 46, Domain = "Air", AI = true,CivID = USSR, Group = {RU_I16, RU_I16, RU_TB3, RU_TB3 } },

	{Name = "German central army", X = 24, Y = 34, Domain = "Land", CivID = GERMANY, Group = {GE_INFANTRY, GE_INFANTRY, GE_PANZER_I, GE_PANZER_III, GE_PANZER_I, GE_PANZER_III} },
	{Name = "German north army", X = 24, Y = 38, Domain = "Land", CivID = GERMANY, Group = {GE_INFANTRY, GE_INFANTRY, GE_PANZER_I, GE_PANZER_III, GE_PANZER_I, GE_PANZER_III} },
	{Name = "German east army", X = 30, Y = 34, Domain = "Land", AI = true, CivID = GERMANY, Group = {GE_INFANTRY, GE_INFANTRY, GE_PANZER_I, GE_PANZER_III, GE_PANZER_I, GE_PANZER_III} },
	{Name = "German Luftwaffe", X = 26, Y = 38, Domain = "Air", CivID = GERMANY, Group = {GE_BF109, GE_BF109, GE_HE111, GE_HE111, GE_JU87, GE_JU87, GE_JU87} },
	{Name = "German Luftwaffe AI Bonus", X = 26, Y = 38, Domain = "Air", AI = true, CivID = GERMANY, Group = {GE_BF109, GE_BF109, GE_HE111, GE_JU87} },

	{Name = "Italian army", X = 19, Y = 21, Domain = "Land", CivID = ITALY, Group = {IT_INFANTRY, IT_INFANTRY, IT_M11_39, IT_L6_40, IT_L6_40, IT_INFANTRY, IT_INFANTRY} },
	{Name = "Italian air", X = 21, Y = 16, Domain = "Air", CivID = ITALY, Group = {IT_CR42, IT_CR42, IT_CR42} },
	{Name = "Italian air AI Bonus", X = 21, Y = 16, Domain = "Air", AI = true, CivID = ITALY, Group = {IT_CR42, IT_SM79, IT_SM79} },

	{Name = "Greek army", X = 36, Y = 7, Domain = "Land", CivID = GREECE, Group = {GR_INFANTRY, GR_INFANTRY, GR_INFANTRY, GR_VICKERS_MKE} },
	{Name = "Greek air force", X = 38, Y = 5, Domain = "Air", CivID = GREECE, Group = {GR_P24, GR_P24} },

}


g_MinorMobilization_OOB = { 
	{Name = "Poland army", X = 35, Y = 34, Domain = "Land", CivID = POLAND, IsMinor = true, Group = {PL_INFANTRY, PL_INFANTRY, PL_VICKERS_MKE_A, PL_INFANTRY, PL_INFANTRY, PL_10TP, PL_7TP} },
	{Name = "Poland air force", X = 35, Y = 36, Domain = "Air", CivID = POLAND, IsMinor = true, Group = {PL_PZL37, PL_P11, PL_P11, PL_P11} },
	{Name = "Belgian army", X = 16, Y = 36, Domain = "Land", CivID = BELGIUM, IsMinor = true, Group = {INFANTRY} },
	{Name = "Netherlands army", X = 17, Y = 40, Domain = "Land", CivID = NETHERLANDS, IsMinor = true, Group = {INFANTRY} },
	{Name = "Finland army", X = 41, Y = 56, Domain = "Land", CivID = FINLAND, IsMinor = true, Group = {INFANTRY, INFANTRY, INFANTRY, INFANTRY} },
	{Name = "Slovakia army", X = 35, Y = 30, Domain = "Land", CivID = SLOVAKIA, IsMinor = true, Group = {GE_INFANTRY, GE_PANZER_35} },
	{Name = "Slovakia army 2", X = 32, Y = 30, Domain = "Land", CivID = SLOVAKIA, IsMinor = true, Group = {GE_INFANTRY, GE_PANZER_35} },
	{Name = "Romania army", X = 41, Y = 24, Domain = "Land", CivID = ROMANIA, IsMinor = true, Group = {INFANTRY, INFANTRY, INFANTRY, INFANTRY} },
	{Name = "Yugoslavia army", X = 35, Y = 18, Domain = "Land", CivID = YUGOSLAVIA, IsMinor = true, Group = {INFANTRY, INFANTRY, INFANTRY, INFANTRY} },
	{Name = "Bulgaria army", X = 43, Y = 17, Domain = "Land", CivID = BULGARIA, IsMinor = true, Group = {INFANTRY, INFANTRY} },
	{Name = "Hungary army", X = 34, Y = 27, Domain = "Land", CivID = HUNGARY, IsMinor = true, Group = {INFANTRY, INFANTRY} },
	{Name = "Sweden army", X = 27, Y = 48, Domain = "Land", CivID = SWEDEN, IsMinor = true, Group = {INFANTRY, INFANTRY, INFANTRY, INFANTRY} },
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
		{Value = 50, Major = GERMANY, Minor = LIBYA},
		{Value = 50, Major = GERMANY, Minor = ALBANIA},
		{Value = 50, Major = GERMANY, Minor = SWEDEN},
		{Value = 120, Major = ITALY, Minor = LIBYA},
		{Value = 120, Major = ITALY, Minor = ALBANIA},
		{Value = 50, Major = ITALY, Minor = SLOVAKIA},
		{Value = 50, Major = ITALY, Minor = HUNGARY},
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
		{Major = ITALY, Minor = BELGIUM},
		{Major = ITALY, Minor = NETHERLANDS},
	},
	[19410406] = { 
		{Major = ITALY, Minor = YUGOSLAVIA},
		{Major = GERMANY, Minor = YUGOSLAVIA},
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
-- x-18 y-12
g_Cities_ = {
	-- UNITED KINGDOM
	{X = 9, Y = 40, Key = true, Buildings = { FACTORY, HARBOR }, }, -- LONDON
	{X = 6, Y = 45, Key = true,  Buildings = { HARBOR }, AIBuildings = {LAND_FACTORY}, }, -- LIVERPOOL
	{X = 8, Y = 50, Key = true,  Buildings = { HARBOR }, AIBuildings = {SMALL_AIR_FACTORY}, }, -- EDINBURGH
	{X = 9, Y = 47, Key = true,  Buildings = { FACTORY }, AIBuildings = {LARGE_AIR_FACTORY, HARBOR}, }, -- NEWCASTLE
	{X = 3, Y = 50, Buildings = { HARBOR }, }, -- BELFAST
	{X = 4, Y = 40, Buildings = { HARBOR }, }, -- PLYMOUTH
	-- GERMANY
	{X = 26, Y = 38, Key = true,  Buildings = { FACTORY, RADIO, BARRACKS }, AIBuildings = {LAND_FACTORY, ARSENAL, BASE}, }, -- BERLIN
	{X = 23, Y = 42, Key = true,  Buildings = { HARBOR }, }, -- KIEL
	{X = 20, Y = 40, Key = true,  Buildings = { FACTORY }, AIBuildings = {LARGE_AIR_FACTORY}, }, -- BREMEN
	{X = 21, Y = 34, Key = true,  Buildings = { FACTORY }, AIBuildings = {SMALL_AIR_FACTORY}, }, -- FRANKFURT
	{X = 27, Y = 31, Buildings = { FACTORY }, }, -- PRAGUE
	{X = 21, Y = 31, AIBuildings = {FACTORY}, }, -- NUREMBERG
	{X = 34, Y = 41, Buildings = { HARBOR }, AIBuildings = {FACTORY}, }, -- KONIGSBERG
	{X = 24, Y = 29, AIBuildings = {FACTORY}, }, -- PASSAU
	{X = 28, Y = 40, Buildings = { HARBOR }, AIBuildings = {FACTORY}, }, -- STETTIN
	{X = 18, Y = 37, Buildings = { FACTORY }, }, -- COLOGNE
	{X = 30, Y = 34, AIBuildings = {FACTORY}, }, -- BRESLAU
	{X = 27, Y = 34, AIBuildings = {FACTORY}, }, -- DRESDEN
	{X = 23, Y = 36, AIBuildings = {FACTORY}, }, -- MAGDEBURG
	{X = 29, Y = 28, Buildings = { FACTORY }, }, -- VIENNA
	{X = 22, Y = 28, Buildings = { FACTORY }, }, -- MUNICH

	-- FRANCE
	{X = 28, Y = 45, Key = true,  Buildings = { FACTORY, BANK }, AIBuildings = {LAND_FACTORY},  }, -- PARIS	
	{X = 29, Y = 34, Buildings = { HARBOR }, }, -- MARSEILLE
	{X = 30, Y = 38, Buildings = { FACTORY }, AIBuildings = {SMALL_AIR_FACTORY}, }, -- LYON
	{X = 25, Y = 36, Buildings = { FACTORY }, }, -- TOULOUSE
	{X = 25, Y = 46, Key = true,  }, -- CAEN
	{X = 23, Y = 48, Buildings = { HARBOR }, }, -- CHERBOURG
	{X = 33, Y = 27, Buildings = { HARBOR }, }, -- AJACCIO
	{X = 21, Y = 45, Buildings = { HARBOR }, }, -- SAINT NAZAIRE
	{X = 22, Y = 39, Key = true,  }, -- BORDEAUX
	{X = 21, Y = 42, Buildings = { HARBOR }, }, -- LA ROCHELLE
	{X = 29, Y = 50, Key = true, Buildings = { HARBOR }, }, -- DUNKERQUE
	-- ITALY
	{X = 39, Y = 28, Key = true, Buildings = { FACTORY, HARBOR }, }, -- ROME
	{X = 41, Y = 25, Key = true, Buildings = { HARBOR }, AIBuildings = { SMALL_AIR_FACTORY }, }, -- NAPLES
	{X = 36, Y = 36, Key = true, Buildings = { FACTORY }, AIBuildings = { LAND_FACTORY }, }, -- MILAN
	{X = 38, Y = 34, Key = true, Buildings = { FACTORY }, AIBuildings = { LARGE_AIR_FACTORY }, }, -- BOLOGNE
	{X = 40, Y = 19, Buildings = { HARBOR },}, -- PALERMO
	{X = 33, Y = 23, Buildings = { HARBOR }, }, -- CAGLIARI
	{X = 43, Y = 35, Buildings = { HARBOR }, }, -- TRIESTE
	{X = 46, Y = 24, Buildings = { HARBOR }, }, -- BARI
	{X = 62, Y = 14, Buildings = { HARBOR, BASE },}, -- RHODES
	-- U.S.S.R.
	{X = 72, Y = 58, Key = true, Buildings = { RADIO, HOSPITAL }, AIBuildings = {LAND_FACTORY}, }, -- MOSCOW
	{X = 84, Y = 48, Key = true, Buildings = { BARRACKS }, AIBuildings = {LAND_FACTORY}, }, -- STALINGRAD
	{X = 66, Y = 44, Key = true, Buildings = { BARRACKS }, AIBuildings = {SMALL_AIR_FACTORY}, }, -- KIEV
	{X = 64, Y = 64, Key = true, Buildings = { HARBOR }, }, -- LENINGRAD
	{X = 65, Y = 85, Buildings = { HARBOR }, }, -- MURMANSK
	{X = 71, Y = 33, Buildings = { HARBOR }, }, -- SEVASTOPOL
	-- GREECE
	{X = 58, Y = 11, Buildings = { HARBOR }, }, -- HERAKLION
	{X = 56, Y = 17, Buildings = { HARBOR, FACTORY }, }, -- ATHENS
	-- FINLAND
	{X = 57, Y = 65, Buildings = { HARBOR }, }, -- HELSINKI
	-- DENMARK
	{X = 16, Y = 82, Buildings = { HARBOR }, }, -- REYKJAVIK
	{X = 43, Y = 57, Buildings = { HARBOR }, }, -- COPENHAGEN
	-- BALTIC STATES
	{X = 57, Y = 58, Buildings = { HARBOR }, }, -- RIGA
	-- SWEDEN
	{X = 50, Y = 64, Buildings = { HARBOR }, }, -- STOCKHOLM
	-- NORWAY
	{X = 44, Y = 66, Buildings = { HARBOR }, }, -- OSLO
	-- NETHERLANDS
	{X = 34, Y = 52,Buildings = { HARBOR },  }, -- AMSTERDAM
	-- IRELAND
	{X = 20, Y = 59, Buildings = { HARBOR }, }, -- DUBLIN
	-- TURKEY
	{X = 66, Y = 24, Buildings = { HARBOR }, }, -- ISTANBUL
	-- YUGOSLAVIA
	{X = 47, Y = 30, Buildings = { HARBOR }, }, -- SPLIT
	-- BULGARIA
	{X = 63, Y = 30, Buildings = { HARBOR }, }, -- VARNA
	-- POLAND
	{X = 49, Y = 53, Buildings = { HARBOR }, }, -- DANZIG
}
