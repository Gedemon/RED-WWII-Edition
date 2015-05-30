-- Defines
-- Author: Gedemon
-- DateCreated: 1/29/2011
----------------------------------------------------------------------------------------------------------------------------

print("Loading Red Defines...")
print("-------------------------------------")

g_RED_WWII_ModID = "580c14eb-9799-4d31-8b14-c2a78931de89"

-------------------------------------------------------------------------------------------------------
-- Initialize for SaveUtils
-------------------------------------------------------------------------------------------------------
WARN_NOT_SHARED = false
include( "ShareData.lua" )
include( "SaveUtils" )
MY_MOD_NAME = g_RED_WWII_ModID

PLAYER_SAVE_SLOT =			0		-- player slot for saveutils (used by culture map)
DEFAULT_SAVE_KEY =			"0,0"	-- default plot for saveutils
UNIT_SAVE_SLOT =			"0,1"
RESOURCE_SAVE_SLOT =		"1,0"
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
PRINT_DEBUG				= true	-- Dprint Lua output to firetuner ON/OFF
PRINT_DLL_DEBUG			= false	-- use DLL_Debug GameEvent to show some values from the C++ code in Firetuner
DEBUG_SHOW_PLOT_XY		= true	-- show plot X,Y on mouse over plot
DEBUG_SHOW_UNIT_KEY		= false	-- show unitkey on mouse over flag
DEBUG_SHOW_RED_ORDER	= true	-- show RED current order (if any) on mouse over flag
DEBUG_PERFORMANCE		= false	-- always show loading/save time of tables
DEBUG_AI_BUILD			= true	-- Show AI build restrictions and current cities productions
USE_CUSTOM_OPTION		= true	-- use the option value selected in setup screen, set to false to debug and force use of global/scenario files defines
DEBUG_ORPHAN_TILE		= false	-- orphan tile function output debug text to firetuner ON/OFF

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
myModId = g_RED_WWII_ModID
myModVersion = Modding.GetActivatedModVersion(myModId)
modUserData = Modding.OpenUserData(myModId, myModVersion)
-- Selected Scenario
local savedData = Modding.OpenSaveData()
g_Scenario_Name = savedData.GetValue("RedScenario") or modUserData.GetValue("RedLoading")


----------------------------------------------------------------------------------------------------------------------------
-- Global Data
----------------------------------------------------------------------------------------------------------------------------

MAX_HP = GameDefines.MAX_HIT_POINTS

-- Cached 
g_FixedPlots				= {}
g_Wounded					= {}
g_RunningCoroutines			= {}
g_IsGameFullyInitialized	= false
g_LimitedByRatio			= {}
g_TrainingRestriction		= {}
g_NoCityCapture				= false	-- prevent loop in HandleCityCapture()

-- Saved & Shared
MapModData.RED = MapModData.RED or {}
MapModData.RED.UnitData = MapModData.RED.UnitData or {}
MapModData.RED.ResourceData = MapModData.RED.ResourceData or {}
MapModData.RED.ProjectsDone = MapModData.RED.ProjectsDone or {}
MapModData.RED.CombatsLog = MapModData.RED.CombatsLog or {}
MapModData.RED.DynamicMap = MapModData.RED.DynamicMap or {}
MapModData.RED.ResourceMap = MapModData.RED.ResourceMap or {}

-- Cached & Shared
MapModData.RED.OilNationDetail = MapModData.RED.OilNationDetail or {}

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

MINOR =		99 -- can be used in shared tables like g_Combat_Type_Ratio... 

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
-- Transported types enum
----------------------------------------------------------------------------------------------------------------------------
TRANSPORT_MATERIEL	= 1
TRANSPORT_PERSONNEL = 2
TRANSPORT_UNIT		= 3
TRANSPORT_GOLD		= 4
TRANSPORT_OIL		= 5

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
-- Orders types for AI override
----------------------------------------------------------------------------------------------------------------------------
RED_CONVOY						= 1
RED_HEALING						= 2
RED_INTERCEPTION				= 3
RED_AIRSWEEP					= 4
RED_REBASE						= 5
RED_MOVE						= 6
RED_MOVE_TO_EMBARK				= 7
RED_MOVE_TO_DISEMBARK			= 8
RED_MOVE_TO_EMBARKED_WAYPOINT	= 9

----------------------------------------------------------------------------------------------------------------------------
-- Project's Trigger types Enum
----------------------------------------------------------------------------------------------------------------------------
TRIGGER_XP =			0	-- Project is triggered by XP gained during combat by an unit type
TRIGGER_DATE =			1	-- Project have a chance to be triggered each turns after a fixed Date
TRIGGER_DATE_AND_XP =	3	-- Project is triggered if both Date and XP condition are checked
TRIGGER_DATE_OR_XP =	4	-- Project is triggered if any of Date or XP condition is checked

----------------------------------------------------------------------------------------------------------------------------
-- Resource Connection types Enum
----------------------------------------------------------------------------------------------------------------------------
RESOURCE_OWNED_PLOTS =			0	-- Resource is connected when you own the plot (no road or rails connection required)
RESOURCE_ROAD_TO_CAPITAL =		1	-- Resource is connected when linked by road (or rails) to the capital
RESOURCE_RAILS_TO_CAPITAL =		2	-- Resource is connected when linked by rails to the capital
RESOURCE_ROAD_TO_ANY_CITY =		3	-- Resource is connected when linked by road (or rails) to any owned city
RESOURCE_RAILS_TO_ANY_CITY =	4	-- Resource is connected when linked by rails to any owned city

----------------------------------------------------------------------------------------------------------------------------
-- Resources Type ID
----------------------------------------------------------------------------------------------------------------------------
RESOURCE_OIL =	GameInfo.Resources.RESOURCE_OIL.ID

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

----------------------------------------------------------------------------------------------------------------------------
-- AI Tactical enum (MUST be identical to DLL)
----------------------------------------------------------------------------------------------------------------------------
AI_TACTICAL_TARGET_NONE							= 0
AI_TACTICAL_TARGET_CITY							= 1
AI_TACTICAL_TARGET_BARBARIAN_CAMP				= 2
AI_TACTICAL_TARGET_IMPROVEMENT					= 3
AI_TACTICAL_TARGET_BLOCKADE_RESOURCE_POINT		= 4
AI_TACTICAL_TARGET_LOW_PRIORITY_UNIT			= 5		-- Can't attack one of our cities
AI_TACTICAL_TARGET_MEDIUM_PRIORITY_UNIT			= 6		-- Can damage one of our cities
AI_TACTICAL_TARGET_HIGH_PRIORITY_UNIT			= 7		-- Can contribute to capturing one of our cities
AI_TACTICAL_TARGET_CITY_TO_DEFEND				= 8
AI_TACTICAL_TARGET_IMPROVEMENT_TO_DEFEND		= 9
AI_TACTICAL_TARGET_DEFENSIVE_BASTION			= 10
AI_TACTICAL_TARGET_ANCIENT_RUINS				= 11
AI_TACTICAL_TARGET_BOMBARDMENT_ZONE				= 12	-- Used for naval bombardment operation
AI_TACTICAL_TARGET_EMBARKED_MILITARY_UNIT		= 13
AI_TACTICAL_TARGET_EMBARKED_CIVILIAN			= 14
AI_TACTICAL_TARGET_VERY_HIGH_PRIORITY_CIVILIAN	= 15
AI_TACTICAL_TARGET_HIGH_PRIORITY_CIVILIAN		= 16
AI_TACTICAL_TARGET_MEDIUM_PRIORITY_CIVILIAN		= 17
AI_TACTICAL_TARGET_LOW_PRIORITY_CIVILIAN		= 18



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
LEGION_HQ =				GameInfo.Buildings.BUILDING_LEGION_HQ.ID
SYNTHETIC_FUEL_PLANT =	GameInfo.Buildings.BUILDING_SYNTHETIC_FUEL_PLANT.ID
OIL_REFINERY =			GameInfo.Buildings.BUILDING_OIL_REFINERY.ID


-- Available buildings for major civs
g_Major_Buildings = {
	[FRANCE] =	{FACTORY, ARSENAL, HARBOR, RADIO, BARRACKS, ACADEMY, BASE, HOSPITAL, BANK, COURTHOUSE, BARRICADE, LAND_FACTORY, SMALL_AIR_FACTORY, MEDIUM_AIR_FACTORY, SHIPYARD, OIL_REFINERY}, -- LARGE_AIR_FACTORY, : no bombers or heavy bombers
	[ENGLAND] = {FACTORY, ARSENAL, HARBOR, RADIO, BARRACKS, ACADEMY, BASE, HOSPITAL, BANK, COURTHOUSE, BARRICADE, LAND_FACTORY, SMALL_AIR_FACTORY, MEDIUM_AIR_FACTORY, LARGE_AIR_FACTORY, SHIPYARD, OIL_REFINERY},
	[USSR] =	{FACTORY, ARSENAL, HARBOR, RADIO, BARRACKS, ACADEMY, BASE, HOSPITAL, BANK, COURTHOUSE, BARRICADE, LAND_FACTORY, SMALL_AIR_FACTORY, MEDIUM_AIR_FACTORY, LARGE_AIR_FACTORY, SHIPYARD, OIL_REFINERY},
	[GERMANY] = {FACTORY, ARSENAL, HARBOR, RADIO, BARRACKS, ACADEMY, BASE, HOSPITAL, BANK, COURTHOUSE, BARRICADE, LAND_FACTORY, SMALL_AIR_FACTORY, MEDIUM_AIR_FACTORY, LARGE_AIR_FACTORY, SHIPYARD, SYNTHETIC_FUEL_PLANT, OIL_REFINERY},
	[ITALY] =	{FACTORY, ARSENAL, HARBOR, RADIO, BARRACKS, ACADEMY, BASE, HOSPITAL, BANK, COURTHOUSE, BARRICADE, LAND_FACTORY, SMALL_AIR_FACTORY, MEDIUM_AIR_FACTORY, LARGE_AIR_FACTORY, SHIPYARD, OIL_REFINERY},
	[GREECE] =	{FACTORY, ARSENAL, HARBOR, RADIO, BARRACKS, ACADEMY, BASE, HOSPITAL, BANK, COURTHOUSE, BARRICADE, LAND_FACTORY, SMALL_AIR_FACTORY, MEDIUM_AIR_FACTORY, SHIPYARD, OIL_REFINERY}, -- LARGE_AIR_FACTORY, : no bombers or heavy bombers
	[JAPAN] =	{FACTORY, ARSENAL, HARBOR, RADIO, BARRACKS, ACADEMY, BASE, HOSPITAL, BANK, COURTHOUSE, BARRICADE, LAND_FACTORY, SMALL_AIR_FACTORY, MEDIUM_AIR_FACTORY, LARGE_AIR_FACTORY, SHIPYARD, OIL_REFINERY},
	[AMERICA] = {FACTORY, ARSENAL, HARBOR, RADIO, BARRACKS, ACADEMY, BASE, HOSPITAL, BANK, COURTHOUSE, BARRICADE, LAND_FACTORY, SMALL_AIR_FACTORY, MEDIUM_AIR_FACTORY, LARGE_AIR_FACTORY, SHIPYARD, OIL_REFINERY},
	[CHINA] =	{FACTORY, ARSENAL, HARBOR, RADIO, BARRACKS, ACADEMY, BASE, HOSPITAL, BANK, COURTHOUSE, BARRICADE, LAND_FACTORY, SMALL_AIR_FACTORY, MEDIUM_AIR_FACTORY, LARGE_AIR_FACTORY, SHIPYARD, OIL_REFINERY},
}

-- Buildings pre-request (need all building types listed)
g_Buildings_Req = {
	[ACADEMY] =				{BARRACKS},
	[BASE] =				{BARRACKS},
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
	[BASE] =				{OPEN_CITY},
}

-- Available buildings for minor civs
g_Minor_Buildings = {FACTORY, ARSENAL, HARBOR, BARRACKS, ARMORY, BASE, LAND_FACTORY, SMALL_AIR_FACTORY, MEDIUM_AIR_FACTORY}


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
PROMOTION_NO_SUPPLY_MECHANIZED =		GameInfo.UnitPromotions.PROMOTION_NO_SUPPLY_MECHANIZED.ID
PROMOTION_LIGHT_RATIONING =				GameInfo.UnitPromotions.PROMOTION_LIGHT_RATIONING.ID
PROMOTION_RATIONING =					GameInfo.UnitPromotions.PROMOTION_RATIONING.ID
PROMOTION_HEAVY_RATIONING =				GameInfo.UnitPromotions.PROMOTION_HEAVY_RATIONING.ID
PROMOTION_ELITE =						GameInfo.UnitPromotions.PROMOTION_ELITE.ID
PROMOTION_ACE =							GameInfo.UnitPromotions.PROMOTION_ACE.ID
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
PROMOTION_SORTIE =						GameInfo.UnitPromotions.PROMOTION_SORTIE.ID
PROMOTION_AIR_RECON =					GameInfo.UnitPromotions.PROMOTION_AIR_RECON.ID
FIRST_STRIKE_RANGE_BONUS =				GameInfo.UnitPromotions.PROMOTION_FIRST_STRIKE_RANGE_BONUS.ID
PROMOTION_ARTILLERY =					GameInfo.UnitPromotions.PROMOTION_ARTILLERY.ID
PROMOTION_FIELD_GUN =					GameInfo.UnitPromotions.PROMOTION_FIELD_GUN.ID
PROMOTION_FORTIFIED_GUN =				GameInfo.UnitPromotions.PROMOTION_FORTIFIED_GUN.ID
PROMOTION_LIGHT_TANK_DESTROYER =		GameInfo.UnitPromotions.PROMOTION_LIGHT_TANK_DESTROYER.ID
PROMOTION_TANK_DESTROYER =				GameInfo.UnitPromotions.PROMOTION_TANK_DESTROYER.ID
PROMOTION_HEAVY_TANK_DESTROYER =		GameInfo.UnitPromotions.PROMOTION_HEAVY_TANK_DESTROYER.ID
PROMOTION_MOBILE_ARTILLERY =			GameInfo.UnitPromotions.PROMOTION_MOBILE_ARTILLERY.ID


----------------------------------------------------------------------------------------------------------------------------
-- R.E.D. Rules
----------------------------------------------------------------------------------------------------------------------------
include ("RedDefinesRules") -- Big file edition is too slow with ModBuddy...


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

