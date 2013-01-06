-- Defines
-- Author: Gedemon
-- DateCreated: 1/29/2011
----------------------------------------------------------------------------------------------------------------------------

print("Loading Red Defines...")
print("-------------------------------------")

-------------------------------------------------------------------------------------------------------
-- Initialize for SaveUtils
-------------------------------------------------------------------------------------------------------
WARN_NOT_SHARED = false
include( "ShareData.lua" )
include( "SaveUtils" )
MY_MOD_NAME = "580c14eb-9799-4d31-8b14-c2a78931de89"

PLAYER_SAVE_SLOT =			0		-- player slot for saveutils (used by culture map)
DEFAULT_SAVE_KEY =			"0,0"	-- default plot for saveutils
UNIT_SAVE_SLOT =			"0,1"
REINFORCEMENT_SAVE_SLOT =	"1,0"
PROJECTS_SAVE_SLOT =		"1,1"
COMBATLOG_SAVE_SLOT =		"0,2"
DYNAMICMAP_SAVE_SLOT =		"1,2"
COMBAT_ARCHIVE_SAVE_SLOT =	"2,0"

MAX_COMBAT_LOG_ENTRIES	= 1500	-- Archive/delete old entries above this value
MIN_COMBAT_LOG_ENTRIES	= 300	-- Keep this number on entries in Combat Log when deleting/archiving
USE_ARCHIVE				= false	-- If true, archive the old entries, else delete them. Archiving can take up to 2-3 mn in late game (with more than 10,000 combats)

-------------------------------------------------------------------------------------------------------
-- DEBUG Output
-------------------------------------------------------------------------------------------------------
PRINT_DEBUG =			true	-- Dprint Lua output to firetuner ON/OFF
PRINT_DLL_DEBUG =		false	-- use DLL_Debug GameEvent to show some values from the C++ code in Firetuner
DEBUG_SHOW_PLOT_XY =	false	-- show plot X,Y on mouse over plot
DEBUG_SHOW_UNIT_KEY =	false	-- show unitkey on mouse over flag
DEBUG_PERFORMANCE =		false	-- always show loading/save time of tables
USE_CUSTOM_OPTION =		true	-- use the option value selected in setup screen, set to false to debug and force use of global/scenario files defines
DEBUG_ORPHAN_TILE =		false	-- orphan tile function output debug text to firetuner ON/OFF

g_UnitRestrictionString = ""

----------------------------------------------------------------------------------------------------------------------------
-- UI
----------------------------------------------------------------------------------------------------------------------------

SHOW_FORCED_MOVE =			true	-- show moves of human units under AI control
SHOW_UNIT_SUPPLY =			true	-- show unit supply (number of unit supported by your nation) on TopPanel
RED_AUTOSAVE =				true	-- autosave at human player turn end
RED_AUTOSAVE_EACH_PLAYER =	false	-- autosave at each player turn end

SHOW_UNIT_SUPPLY_THRESHOLD = 20		-- don't show unit supply left until this number is reached 

-------------------------------------------------------------------------------------------------------
-- use mod data to save / load value between game initialisation phases
-------------------------------------------------------------------------------------------------------
myModId = "580c14eb-9799-4d31-8b14-c2a78931de89"
myModVersion = Modding.GetActivatedModVersion(myModId)
modUserData = Modding.OpenUserData(myModId, myModVersion)
-- Selected Scenario
local savedData = Modding.OpenSaveData()
g_Scenario_Name = savedData.GetValue("RedScenario") or modUserData.GetValue("RedLoading")


----------------------------------------------------------------------------------------------------------------------------
-- Global Data Tables
----------------------------------------------------------------------------------------------------------------------------

-- Saved
g_UnitData = {}
g_ReinforcementData = {}
g_ProjectsDone = {}
g_CombatsLog = {}
g_DynamicMap = {}

-- Cached 
g_FixedPlots = {}
g_Wounded = {}


----------------------------------------------------------------------------------------------------------------------------
-- R.E.D. Rules
----------------------------------------------------------------------------------------------------------------------------

include ("RedDefinesRules") -- Big file edition is too slow with ModBuddy...


----------------------------------------------------------------------------------------------------------------------------
-- Civilizations Type ID
-- Don't remove anything here, to use a city state instead of one of the listed civs,
-- you just need to redefine the value in the scenario file...
----------------------------------------------------------------------------------------------------------------------------
FRANCE =	GameInfo.Civilizations.CIVILIZATION_FRANCE.ID
ENGLAND =	GameInfo.Civilizations.CIVILIZATION_ENGLAND.ID
USSR =		GameInfo.Civilizations.CIVILIZATION_RUSSIA.ID
GERMANY =	GameInfo.Civilizations.CIVILIZATION_GERMANY.ID
ITALY =		GameInfo.Civilizations.CIVILIZATION_ROME.ID
AMERICA =	GameInfo.Civilizations.CIVILIZATION_AMERICA.ID
JAPAN =		GameInfo.Civilizations.CIVILIZATION_JAPAN.ID
CHINA =		GameInfo.Civilizations.CIVILIZATION_CHINA.ID
GREECE =	GameInfo.Civilizations.CIVILIZATION_GREECE.ID

----------------------------------------------------------------------------------------------------------------------------
-- Placeholder major civ used on hotseat scenario loading as player one, to be killed at game start.
----------------------------------------------------------------------------------------------------------------------------

HOTSEAT_CIV_TO_KILL = GameInfo.Civilizations.CIVILIZATION_MONGOL.ID

----------------------------------------------------------------------------------------------------------------------------
-- Diplomacy Enum
----------------------------------------------------------------------------------------------------------------------------

DOF = 0 -- Declaration of Friendship
DEN = 1 -- Denounciation
DOW = 2 -- Declaration of War
PEA = 3 -- Permanent Alliance
SPT = 4 -- Signe Peace Treaty


----------------------------------------------------------------------------------------------------------------------------
-- Combat types Enum
----------------------------------------------------------------------------------------------------------------------------

MELEE =			0	-- normal combat
RANGED =		1	-- ranged attack
SUBATTACK =		2	-- submarines attacking
SUBHUNT =		3	-- submarines attacked
AIRBOMB =		4	-- Air bombing
INTERCEPT =		5	-- Air bombing with interception
DOGFIGHT =		6	-- Airsweep
CITYBOMB =		7	-- Ranged attack on city
CITYASSAULT =	8	-- Melee attack on city
NAVALCOUNTER =	9	-- Naval counter-attack
GRDINTERCEPT =	10	-- Interception by ground (sea, land) unit



----------------------------------------------------------------------------------------------------------------------------
--Moves
----------------------------------------------------------------------------------------------------------------------------
MOVE_DENOMINATOR = GameDefines.MOVE_DENOMINATOR

----------------------------------------------------------------------------------------------------------------------------
--player ID
----------------------------------------------------------------------------------------------------------------------------
LOCAL_PLAYER = Game.GetActivePlayer
BARBARIAN_PLAYER = GameDefines.MAX_CIV_PLAYERS
--HANDICAP = modUserData.GetValue ("Handicap")

--[[
****************************************************************************************************************************
All values used below can be overriden by scenario specific values.
They are defined here to be used as default values for any blank scenario.

You can also override a complete table in the scenario define, example :

	g_Major_Buildings = { .... }

or just a specific entry, example :

	g_Major_Buildings[FRANCE] = { .... }


****************************************************************************************************************************
--]]

----------------------------------------------------------------------------------------------------------------------------
-- Diplomacy
----------------------------------------------------------------------------------------------------------------------------

-- Virtual allies
g_Allied = {
	[FRANCE] =	true,
	[ENGLAND] = true,
	[USSR] =	true,
	[AMERICA] = true,
	[CHINA] =	true,
	[GREECE] =	true,
}
g_Axis = {
	[GERMANY] = true,
	[ITALY] =	true,
	[JAPAN] =	true,
}

----------------------------------------------------------------------------------------------------------------------------
-- Calendar
----------------------------------------------------------------------------------------------------------------------------

REAL_WORLD_ENDING_DATE = 19470105 -- Nothing related to calendar happens after this date.
g_Calendar = {}
local monthList = { "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December" }
local dayList = { "1", "5", "10", "15", "20", "25" }
local turn = 0
for year = 1939, 1946 do -- see large
	for month = 1, #monthList do
		for day = 1, #dayList do
			local bStart = (month >= 7 and year == 1939) -- Start date = july, 1st 1939
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
-- Buildings
----------------------------------------------------------------------------------------------------------------------------

-- Type ID
BARRICADE =				GameInfo.Buildings.BUILDING_WALLS.ID
FACTORY =				GameInfo.Buildings.BUILDING_FACTORY.ID
ARSENAL =				GameInfo.Buildings.BUILDING_ARSENAL.ID
HARBOR =				GameInfo.Buildings.BUILDING_HARBOR.ID
RADIO =					GameInfo.Buildings.BUILDING_BROADCAST_TOWER.ID
BARRACKS =				GameInfo.Buildings.BUILDING_BARRACKS.ID
ACADEMY =				GameInfo.Buildings.BUILDING_MILITARY_ACADEMY.ID
BASE =					GameInfo.Buildings.BUILDING_MILITARY_BASE.ID
HOSPITAL =				GameInfo.Buildings.BUILDING_HOSPITAL.ID
BANK =					GameInfo.Buildings.BUILDING_BANK.ID
COURTHOUSE =			GameInfo.Buildings.BUILDING_COURTHOUSE.ID
LAND_FACTORY =			GameInfo.Buildings.BUILDING_LAND_FACTORY.ID
SMALL_AIR_FACTORY =		GameInfo.Buildings.BUILDING_SMALL_AIR_FACTORY.ID
MEDIUM_AIR_FACTORY =	GameInfo.Buildings.BUILDING_MEDIUM_AIR_FACTORY.ID
LARGE_AIR_FACTORY =		GameInfo.Buildings.BUILDING_LARGE_AIR_FACTORY.ID
SHIPYARD =				GameInfo.Buildings.BUILDING_SHIPYARD.ID
OPEN_CITY =				GameInfo.Buildings.BUILDING_OPEN_CITY.ID
ALLIEDCITY =			GameInfo.Buildings.BUILDING_ALLIEDCITY.ID
AXISCITY =				GameInfo.Buildings.BUILDING_AXISCITY.ID
COMINTERNCITY =			GameInfo.Buildings.BUILDING_COMINTERNCITY.ID
NODRAFT =				GameInfo.Buildings.BUILDING_NODRAFT.ID
LIMITEDDRAFT =			GameInfo.Buildings.BUILDING_LIMITEDDRAFT.ID


-- Available buildings for major civs
g_Major_Buildings = {
	[FRANCE] =	{FACTORY, ARSENAL, HARBOR, RADIO, BARRACKS, ACADEMY, BASE, HOSPITAL, BANK, COURTHOUSE, BARRICADE, LAND_FACTORY, SMALL_AIR_FACTORY, MEDIUM_AIR_FACTORY, SHIPYARD}, -- LARGE_AIR_FACTORY, : no bombers or heavy bombers
	[ENGLAND] = {FACTORY, ARSENAL, HARBOR, RADIO, BARRACKS, ACADEMY, BASE, HOSPITAL, BANK, COURTHOUSE, BARRICADE, LAND_FACTORY, SMALL_AIR_FACTORY, MEDIUM_AIR_FACTORY, LARGE_AIR_FACTORY, SHIPYARD},
	[USSR] =	{FACTORY, ARSENAL, HARBOR, RADIO, BARRACKS, ACADEMY, BASE, HOSPITAL, BANK, COURTHOUSE, BARRICADE, LAND_FACTORY, SMALL_AIR_FACTORY, MEDIUM_AIR_FACTORY, LARGE_AIR_FACTORY, SHIPYARD},
	[GERMANY] = {FACTORY, ARSENAL, HARBOR, RADIO, BARRACKS, ACADEMY, BASE, HOSPITAL, BANK, COURTHOUSE, BARRICADE, LAND_FACTORY, SMALL_AIR_FACTORY, MEDIUM_AIR_FACTORY, LARGE_AIR_FACTORY, SHIPYARD},
	[ITALY] =	{FACTORY, ARSENAL, HARBOR, RADIO, BARRACKS, ACADEMY, BASE, HOSPITAL, BANK, COURTHOUSE, BARRICADE, LAND_FACTORY, SMALL_AIR_FACTORY, MEDIUM_AIR_FACTORY, LARGE_AIR_FACTORY, SHIPYARD},
	[GREECE] =	{FACTORY, ARSENAL, HARBOR, RADIO, BARRACKS, ACADEMY, BASE, HOSPITAL, BANK, COURTHOUSE, BARRICADE, LAND_FACTORY, SMALL_AIR_FACTORY, LARGE_AIR_FACTORY,SHIPYARD}, -- MEDIUM_AIR_FACTORY, : no fast bombers/heavy fighters
	[JAPAN] =	{FACTORY, ARSENAL, HARBOR, RADIO, BARRACKS, ACADEMY, BASE, HOSPITAL, BANK, COURTHOUSE, BARRICADE, LAND_FACTORY, SMALL_AIR_FACTORY, MEDIUM_AIR_FACTORY, LARGE_AIR_FACTORY, SHIPYARD},
	[AMERICA] = {FACTORY, ARSENAL, HARBOR, RADIO, BARRACKS, ACADEMY, BASE, HOSPITAL, BANK, COURTHOUSE, BARRICADE, LAND_FACTORY, SMALL_AIR_FACTORY, MEDIUM_AIR_FACTORY, LARGE_AIR_FACTORY, SHIPYARD},
	[CHINA] =	{FACTORY, ARSENAL, HARBOR, RADIO, BARRACKS, ACADEMY, BASE, HOSPITAL, BANK, COURTHOUSE, BARRICADE, LAND_FACTORY, SMALL_AIR_FACTORY, MEDIUM_AIR_FACTORY, LARGE_AIR_FACTORY, SHIPYARD},
}

-- Buildings pre-request (need all building types listed)
g_Buildings_Req = {
	[LAND_FACTORY] =		{FACTORY},
	[SMALL_AIR_FACTORY] =	{FACTORY}, 
	[MEDIUM_AIR_FACTORY] =	{FACTORY}, 
	[LARGE_AIR_FACTORY] =	{FACTORY}, 
	[SHIPYARD] =			{FACTORY, HARBOR},
}

-- Buildings mutual exclusion (none of listed buildings allowed)
g_Buildings_Exclusion = {
	[LAND_FACTORY] =		{SMALL_AIR_FACTORY, MEDIUM_AIR_FACTORY, LARGE_AIR_FACTORY, SHIPYARD}, 
	[SMALL_AIR_FACTORY] =	{LAND_FACTORY, LARGE_AIR_FACTORY, SHIPYARD}, 
	[MEDIUM_AIR_FACTORY] =	{LAND_FACTORY, SHIPYARD}, 
	[LARGE_AIR_FACTORY] =	{LAND_FACTORY, SMALL_AIR_FACTORY, SHIPYARD}, 
	[SHIPYARD] =			{LAND_FACTORY, SMALL_AIR_FACTORY, MEDIUM_AIR_FACTORY, LARGE_AIR_FACTORY}, 
	[ARSENAL] =				{OPEN_CITY}, 
	[BARRACKS] =			{OPEN_CITY}, 
	[BARRICADE] =			{OPEN_CITY},
}

-- Available buildings for minor civs
g_Minor_Buildings = {FACTORY, ARSENAL, HARBOR, BARRACKS, ARMORY, BASE, SMALL_AIR_FACTORY, MEDIUM_AIR_FACTORY}


----------------------------------------------------------------------------------------------------------------------------
-- Processes
----------------------------------------------------------------------------------------------------------------------------

-- Processes Type ID
RECRUITING =	GameInfo.Processes.PROCESS_RECRUITING.ID
WAR_BONDS =		GameInfo.Processes.PROCESS_WAR_BONDS.ID


----------------------------------------------------------------------------------------------------------------------------
-- Promotions
----------------------------------------------------------------------------------------------------------------------------

-- Promotions Type ID
PROMOTION_NO_SUPPLY =					GameInfo.UnitPromotions.PROMOTION_NO_SUPPLY.ID
PROMOTION_NO_SUPPLY_SPECIAL_FORCES =	GameInfo.UnitPromotions.PROMOTION_NO_SUPPLY_SPECIAL_FORCES.ID
PROMOTION_EMBARKED_FIX =				GameInfo.UnitPromotions.PROMOTION_EMBARKED_FIX.ID
PROMOTION_EMBARKED_ARTILLERY_FIX =		GameInfo.UnitPromotions.PROMOTION_EMBARKED_ARTILLERY_FIX.ID
PROMOTION_MEDIC =						GameInfo.UnitPromotions.PROMOTION_MEDIC.ID
PROMOTION_FIELD_HOSPITAL =				GameInfo.UnitPromotions.PROMOTION_MARCH.ID
PROMOTION_REPAIR =						GameInfo.UnitPromotions.PROMOTION_REPAIR.ID
PROMOTION_AIR_REPAIR =					GameInfo.UnitPromotions.PROMOTION_AIR_REPAIR.ID
PROMOTION_PARADROP =					GameInfo.UnitPromotions.PROMOTION_PARADROP.ID
PROMOTION_SUPPLY =						GameInfo.UnitPromotions.PROMOTION_SUPPLY.ID
PROMOTION_BLITZ =						GameInfo.UnitPromotions.PROMOTION_BLITZ.ID
PROMOTION_HEAVY =						GameInfo.UnitPromotions.PROMOTION_HEAVY.ID
PROMOTION_SPECIAL_FORCES =				GameInfo.UnitPromotions.PROMOTION_SPECIAL_FORCES.ID
PROMOTION_INVISIBLE =					GameInfo.UnitPromotions.PROMOTION_INVISIBLE_SUBMARINE.ID
PROMOTION_EMBARKATION =					GameInfo.UnitPromotions.PROMOTION_EMBARKATION.ID
PROMOTION_RANGE_3 =						GameInfo.UnitPromotions.PROMOTION_SCENARIO_RANGE_3.ID
PROMOTION_RANGE_6 =						GameInfo.UnitPromotions.PROMOTION_SCENARIO_RANGE_6.ID
PROMOTION_NAVAL_MOVEMENT =				GameInfo.UnitPromotions.PROMOTION_SCENARIO_NAVAL_MOVEMENT_2.ID
PROMOTION_OCEAN_MOVEMENT =				GameInfo.UnitPromotions.PROMOTION_SCENARIO_OCEAN_MOVEMENT.ID
PROMOTION_OCEAN_MOVEMENT =				GameInfo.UnitPromotions.PROMOTION_SCENARIO_OCEAN_MOVEMENT.ID
PROMOTION_WINTER_READY =				GameInfo.UnitPromotions.PROMOTION_WINTER_READY.ID
PROMOTION_ARCTIC_POWER =				GameInfo.UnitPromotions.PROMOTION_ARCTIC_POWER.ID
PROMOTION_LONG_PARADROP =				GameInfo.UnitPromotions.PROMOTION_LONG_PARADROP.ID
PROMOTION_FIGHTER =						GameInfo.UnitPromotions.PROMOTION_FIGHTER.ID
PROMOTION_HEAVY_FIGHTER =				GameInfo.UnitPromotions.PROMOTION_HEAVY_FIGHTER.ID
PROMOTION_MODERN_FIGHTER =				GameInfo.UnitPromotions.PROMOTION_MODERN_FIGHTER.ID
PROMOTION_SORTIE =						GameInfo.UnitPromotions.PROMOTION_SORTIE.ID
PROMOTION_FULL_PENALTY =				GameInfo.UnitPromotions.PROMOTION_FULL_PENALTY.ID

----------------------------------------------------------------------------------------------------------------------------
-- Units
----------------------------------------------------------------------------------------------------------------------------

include ("RedDefinesUnits") -- Big file edition is too slow with ModBuddy


----------------------------------------------------------------------------------------------------------------------------
-- Units Classes
----------------------------------------------------------------------------------------------------------------------------

include ("RedDefinesClasses") -- Big file edition is too slow with ModBuddy


----------------------------------------------------------------------------------------------------------------------------
-- Projects 
----------------------------------------------------------------------------------------------------------------------------

include ("RedDefinesProjects") -- Big file edition is too slow with ModBuddy

