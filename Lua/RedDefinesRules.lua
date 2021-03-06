-- R.E.D. Rules Defines
-- Author: Gedemon
-- DateCreated: 2/15/2012 1:40:03 AM
--------------------------------------------------------------

print("Loading Red Rules Defines...")
print("-------------------------------------")


--[[
****************************************************************************************************************************
All values used below can be overriden by scenario specific values.
They are defined here to be used as default values for any "blank" scenario.
****************************************************************************************************************************
--]]


----------------------------------------------------------------------------------------------------------------------------
-- Default Game Rules
----------------------------------------------------------------------------------------------------------------------------

-- Global
EXPERIENCE_INTERCEPTING_UNIT_AIR		= 1
FORCE_UNIT_SPAWNING_ON_OCCUPIED_PLOT	= true	-- will try to place an unit (Order of Battle initialization, Reinforcement spawning) even if spawning plot is occupied
NO_AUTO_NAMING							= false -- if set to true, units won't be automatically named

RETREAT_RATIO							= 7		-- health/damage ratio to force retreat (was 5, higher means more retreats)

-- diplomacy
LIBERATE_MINOR_TERRITORY_BONUS	= 5		-- bonus for liberating minor civ territory
LIBERATE_MINOR_CITY_BONUS		= 30	-- bonus for liberating minor civ city
NO_DIPLO_STATEMENT				= true	-- no diplo contact

-- Units supply
SUPPLY_FROM_BARRACKS	= 0.25	-- free units from barracks
SUPPLY_FROM_ARSENALS	= 0.5	-- free units from arsenals
SUPPLY_FROM_BASES		= 1.0	-- free units from bases
SUPPLY_FROM_CITIES		= 0.25	-- free units from cities
SUPPLY_POSITIVE_GPT_RATIO = 100 -- bonus = Gold per turn / SUPPLY_POSITIVE_GPT_RATIO
SUPPLY_NEGATIVE_GPT_RATIO = 20	-- malus = Gold per turn / SUPPLY_NEGATIVE_GPT_RATIO

-- Resources
INITIAL_MATERIEL_VALUE				= 0		-- Materiel reserve at start
INITIAL_PERSONNEL_VALUE				= 0		-- Personnel reserve at start
INITIAL_OIL_VALUE					= 5000	-- Oil reserve at start
REINFORCEMENT_RATIO					= 5		-- 1 = 100 personnel+materiel needed for 1 HP, 5 = 20 personnel+materiel, 10 = 10 personnel+materiel... MUST be > 0 (see next value)
REINFORCEMENT_BASE					= 100 / REINFORCEMENT_RATIO
MAX_HP_HEALED						= 5		-- Max number of HP healed each turn
RESISTANCE_REINFORCEMENT_PERCENT	= 0		-- ratio of reinforcement recieved from cities in resistance
OCCUPIED_REINFORCEMENT_PERCENT		= 15	-- ratio of reinforcement recieved from occupied cities
CAPTURED_REINFORCEMENT_PERCENT		= 50	-- ratio of reinforcement recieved from captured cities with Administrative building (non-occupied)
FRIEND_REINFORCEMENT_PERCENT		= 30	-- ratio of reinforcement recieved from friendly CS
ALLY_REINFORCEMENT_PERCENT			= 60	-- ratio of reinforcement recieved from allied CS
WOUNDED_PERCENT						= 35	-- percentage of soldiers out of combat that could be healed
HOSPITAL_HEALING_PERCENT			= 5		-- percentage of a nation total wounded soldiers an hospital can heal each turn
HOSPITAL_MAX_HEALING_PER_TURN		= 150	-- max number of soldiers an hospital can heal each turn
RADIO_RECRUITING_FACTOR				= 3		-- Personnel recruited from radio, relative to city size
RADIO_PROPAGANDA_BONUS				= 50	-- percentage of additional recruit from radio propaganda in a city
WAR_BONDS_PRODUCTION_PERCENT		= 75	-- percentage of production + gold converted to materiel when producing war bonds

RESOURCE_PRODUCTION_FACTOR			= 10	-- each deposit produce (plot:GetNumResource() * RESOURCE_PRODUCTION_FACTOR) number of resource each turn
RESOURCE_OIL_LIGHT_RATIONING		= 2500	-- when oil reserves are below this value, light rationning is applied
RESOURCE_OIL_RATIONING				= 1000	-- when oil reserves are below this value, rationning is applied
RESOURCE_OIL_HEAVY_RATIONING		= 500	-- when oil reserves are below this value, heavy rationning is applied

RESOURCE_CONSUMPTION				= false						-- If true, use resources consumption (fuel, ...)
RESOURCE_CONNECTION					= RESOURCE_ROAD_TO_ANY_CITY	-- Default connection type (can be overriden by scenario defines)
RESOURCE_FROM_FRIENDS				= true						-- If true you get resources from friendly territory (friendly CS or major with open border), else only from your territory

UNIT_BLEEDING						= true	-- when true, unit will lose HP each turn when their supply line is cut
BLEEDING_PER_TURN					= 2

-- Convoy
TRANSPORT_DEFAULT					= TRANSPORT_MATERIEL	-- default type (1 = materiel...)
TRANSPORT_DEFAULT_REFERENCE			= 250					-- default value

-- Senario
WAR_MINIMUM_STARTING_TURN		= 0		-- can't manually start war before this turn (but forced DOW via SetMajorRelations or SetMinorDOW are possible)
PERMANENT_WAR_DECLARATION		= true	-- can't make peace once a war is declared (but forced peace via scenario event is still possible)

CAN_BUILD_UNIT_IN_OCCUPIED_CITY = false -- need special building to build unit in occupied cities
REVEAL_ALL_CITIES				= false -- cities tiles are always visible for every civs
REVEAL_ALL_MAP					= false -- reveal all map for every civs
EMBARK_FROM_HARBOR				= false -- allow embarking only from a city with a harbor (and adjacent hexes)

ALLOW_SCRIPTED_EVENTS	= true -- allow scripted events like "Fall of France", "Fall of Poland", etc...
ALLOW_ALTERNATE_HISTORY = true -- allow declarations of war outside the historic calendar

SCENARIO_MATERIEL_PER_TURN	= 500 -- / ((HANDICAP + 2 ) /2) = materiel for reinforcement bonus each turn
SCENARIO_PERSONNEL_PER_TURN = 350 -- / ((HANDICAP + 2 ) /2) = personnel for reinforcement bonus each turn
SCENARIO_OIL_PER_TURN		= 100 -- / ((HANDICAP + 2 ) /2) = oil for resource bonus each turn

SCENARIO_MAX_MATERIEL_BONUS		= 0
SCENARIO_MAX_OIL_BONUS			= 5000
SCENARIO_MAX_PERSONNEL_BONUS	= 0

CLOSE_MINOR_NEUTRAL_CIV_BORDERS = true -- if true will close neutral territories unless for civs which have reached the allied treshold

CHECK_FOR_ORPHAN_TILE	= true	-- if true will flip back captured tiles that are not linked to a close city or unit 
MAX_PLOT_CONTROL_RANGE	= 6		-- distance at which a unit or city can control an enemy orphan plot

NUM_BUILDINGS_IMPORTANT_CITY = 1 -- city with at least NUM_BUILDINGS_IMPORTANT_CITY number of buildings are flagged important and won't be on auto-wealth at start

USE_TACTICAL_RANGE	= false -- +3 range to artillery, +6 range to aircraft (to do : make it +6 for light planes, +12 for other)
USE_FAST_OCEAN_MOVE = true	-- x2 moves on ocean (all units)
USE_FAST_NAVAL_MOVE = false -- +2 moves on sea (doesn't work with embarked units)

MIN_HP_LEFT_BEFORE_ESCAPING_CITY	= 4 -- under that value of predicted HP left to a city after a combat that is starting, units will try to escape a city
MAX_PERCENT_HP_LOSS_ESCAPE			= 50 -- Maximum percentage of remaining HP loss when retreating from a plot.
MIN_PERCENT_HP_LOSS_ESCAPE			= 25 -- Minimum percentage of remaining HP loss when retreating from a plot.

MAX_CITY_BOMBARD_DAMAGE				= 66 -- Maximum damage made to cities in percent. 100 means no change from vanilla
MIN_CITY_HP_FOR_BOMBARD				= GameDefines.MAX_CITY_HIT_POINTS * MAX_CITY_BOMBARD_DAMAGE / 100 -- minimum HP left to a city before bombing has no more effect.
ALLOW_CITY_IMPROVEMENT_DAMAGE		= true -- damage done above MAX_CITY_BOMBARD_DAMAGE are converted to damage to nearest improvement

IMPROVEMENT_REPAIR_PER_TURN			= 2 -- HP restored to improvements each turn
IMPROVEMENT_DAMAGED_THRESHOLD		= 10
IMPROVEMENT_MAX_DAMAGE				= 20

-- Resources
NO_SUPPLY_LINE_INITIAL_MOVEMENT_LEFT	= 50 -- percentage of mechanized unit's movement points left when supply lines have just been cut
NO_SUPPLY_LINE_MOVEMENT_LEFT			= 25 -- percentage of mechanized unit's movement points left when supply lines have been cut for more than 1 turn
LIGHT_RATIONING_MOVEMENT_LEFT			= 80 -- percentage of mechanized unit's movement points left when fuel is lightly rationed
MEDIUM_RATIONING_MOVEMENT_LEFT			= 60 -- percentage of mechanized unit's movement points left when fuel is rationed
HEAVY_RATIONING_MOVEMENT_LEFT			= 30 -- percentage of mechanized unit's movement points left when fuel is heavily rationed
LIGHT_RATIONING_FUEL_CONSUMPTION		= 85 -- percentage of total planned consumption used when fuel is lightly rationed
MEDIUM_RATIONING_FUEL_CONSUMPTION		= 65 -- percentage of total planned consumption used when fuel is rationed
HEAVY_RATIONING_FUEL_CONSUMPTION		= 50 -- percentage of total planned consumption used when fuel is heavily rationed

-- not implemented yet
ALLOW_CITY_UNIT_DAMAGE			= true	-- damage done above MAX_CITY_BOMBARD_DAMAGE are converted to damage to garisoned unit if any
MAX_UNIT_IN_CITY_BOMBARD_DAMAGE = 50	-- Maximum damage made to unit garisoned in cities if ALLOW_CITY_UNIT_DAMAGE is true, in percent
BEACHHEAD_DAMAGE				= false -- Amphibious assault on an empty tile owned by enemy civ will cause damage to the landing unit
AIRCRAFT_CAP					= 2		-- relative to city number, player can build (number_of_cities * AIRCRAFT_CAP) aircrafts
LAND_CAP_RATIO					= 10	-- relative to territory owned, player can build (number_tiles_owned / LAND_CAP_RATIO) land units
-- / not implemented


----------------------------------------------------------------------------------------------------------------------------
-- AI Rules
----------------------------------------------------------------------------------------------------------------------------

RED_AI_HANDICAP		= 3		-- handicap value for computer player (specific to R.E.D. function, not linked to vanilla handicap tables)

ALLOW_AI_CONTROL = true -- Allow the use of functions to (try to) control the AI units and build list

USE_UNIT_RATIO_FOR_AI		= true	-- Allow limitation of AI military unit using ratio by classes (g_Max_Armor_SubClass_Percent and g_Max_Air_SubClass_Percent must be defined in scenario files)
ALLOW_AI_UNITS_LIMIT		= false	-- Allow limitation of max number of AI military unit
MAX_AI_UNITS				= 75	-- Max number of units for the AI when ALLOW_AI_UNITS_LIMIT = true

UNIT_SUPPORT_LIMIT_FOR_AI	= false -- Allow limitation of max number of AI units based on number of supported units
AI_UNIT_SUPPLY_THRESHOLD	= 10	-- if UNIT_SUPPORT_LIMIT_FOR_AI is true, AI start disbanding wounded units when close to this threshold

AI_MINIMAL_RESERVE			= 30	-- | 
AI_LAND_MINIMAL_RESERVE		= nil	-- | Do not disband units if we have less than this 
AI_AIR_MINIMAL_RESERVE		= nil	-- | (nil means "not checked")
AI_SEA_MINIMAL_RESERVE		= nil	-- |

AI_USE_RESOURCE_LIMIT		= true	-- the AI won't build units using resources in case of shortage...
AI_TURNS_BEFORE_SHORTAGE	= 15	-- consider low on a resource if there is a shortage in this number of turn at the current rate
AI_UNIT_RESOURCE_LOW		= 10	-- Don't build unit consuming more than this number of resource per HP healed if we're low on stock
AI_UNIT_RESOURCE_SHORTAGE	= 2		-- Don't build unit consuming more than this number of resource per HP healed if we're out of stock

TRACK_COMBATS_MAX_TURNS						= 5 -- Number of previous turns entries keeped in the TrackCombat table
DESTROYER_SUB_HUNTING_MAX_TURNS_ATTACK		= 2 -- Number of previous turns attacks entries destroyers look at for subhunting
DESTROYER_SUB_HUNTING_MAX_TURNS_TO_TARGET	= 3 -- Max turns needed for destroyer to reach last attack plot for subhunting
CRUISER_SUB_HUNTING_MAX_TURNS_ATTACK		= 1 -- Number of previous turns attacks entries cruisers look at for subhunting
CRUISER_SUB_HUNTING_MAX_TURNS_TO_TARGET		= 1 -- Max turns needed for cruiser to reach last attack plot for subhunting
INTERCEPTOR_MAX_TURNS_ATTACK				= 2 -- Number of previous turns attacks entries interceptors look at for rebasing and force interception mission
AIRSWEEP_MAX_TURNS_ATTACK					= 2 -- Number of previous turns attacks entries interceptors look at for airsweep and force interception mission
INTERCEPTOR_RATIO_NEEDED					= 4 --If NumAirAttacks / NumInterceptor > Ratio then we need another interceptor
AIRSWEEP_RATIO_NEEDED						= 2 --If NumInterceptionAttacks / NumAirsweep > Ratio then we need another sweep

MIN_HP_LEFT_REBASE_CITY = 20 -- under that value of HP, air units won't rebase to a city

-- Suicide Attacks Prevention
NO_SUICIDE_ATTACK				= false -- If set to true, try to prevent suicide attacks
SUICIDE_DAMAGE_THRESHOLD		= 8		-- Above this level of damage let's call it a tentative of suicide, but check the below value too
SUICIDE_DIFF_DAMAGE_THRESHOLD	= 5		-- Above this difference between damage dealed and damage received, consider that the attack is a large defeat
SUICIDE_HP_RATIO				= 4.5	-- Under this ratio between HP left and damage received, call it suicidal 
--
NO_AI_EMBARKATION				= false -- remove AI ability to embark 
NO_LAND_UNIT_BUILD_ON_ISLAND	= true	-- prevent the AI to build land units on cities on island when NO_AI_EMBARKATION = true
NO_LAND_UNIT_ISLAND_MAX_AREA	= 10	-- prevent land units to be build in area under that size when NO_LAND_UNIT_BUILD_ON_ISLAND = true

-- Healing values
MIN_HEALTH_PERCENT			= 35 -- under this health percent, force unit to heal
OPTIMAL_HEALTH_PERCENT		= 40 -- try to heal until reaching this value
MIN_AIR_HEALTH_PERCENT		= 65
OPTIMAL_AIR_HEALTH_PERCENT	= 75
MIN_SEA_HEALTH_PERCENT		= 50
OPTIMAL_SEA_HEALTH_PERCENT	= 65

-- AI Distances decisions
CLOSE_LAND_DISTANCE			= 8		-- to do : convert to max turn to reach / unit...
CLOSE_SEA_DISTANCE			= 24
MAX_LANDING_PLOT_DISTANCE	= 5		-- consider landing plot reached when disembarking at this distance of the destination