--------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------
-- R.E.D. WWII Edition
-- Author: Gedemon
-- DateCreated: 5/17/2011 10:50:50 PM
----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------

print("+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++")
print("++++++++++++++++++++++++++++++++++++++++++++++++++++++ R.E.D. World War II script started... ++++++++++++++++++++++++++++++++++++++++++++++++++++++")
print("+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++")

local bWaitBeforeInitialize = true

----------------------------------------------------------------------------------------------------------------------------
-- Common Includes
----------------------------------------------------------------------------------------------------------------------------

include ("RedDefinesGlobal")	-- Always first !
include ("RedUtils")			-- Before functions & debug...
include ("RedDebug")
include ("RouteConnections")
include ("RedFunctions")
include ("RedDiplomacy")
include ("RedUnitUtils")
include ("RedUnitFunctions")
include ("RedReinforcements")
include ("RedAI_Global")
include ("RedAI_Air")
include ("RedCombat")
include ("RedSupplyRoutes")

----------------------------------------------------------------------------------------------------------------------------
-- Scenario-specific Includes
----------------------------------------------------------------------------------------------------------------------------

include ("RedScenarioDefine")
include ("Script" .. g_Scenario_Name)
include ("Red" .. g_Scenario_Name)

----------------------------------------------------------------------------------------------------------------------------
-- Initializing main functions...
----------------------------------------------------------------------------------------------------------------------------


-------------------------------
-- Turns summary
-------------------------------

g_endTurnTime = 0
g_startTurnTime = 0

function NewTurnSummary()
	local turn = Game.GetGameTurn()
	local date = g_Calendar[turn] or " "
	g_startTurnTime = os.clock()
	print("-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------")
	print("---------------------------------------------------------------------------------------- NEW TURN -----------------------------------------------------------------------------------------------------")
	print("-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------")
	print ("Game turn " .. turn .. " : " .. date.Text )
	if g_endTurnTime > 0 then
		print ("AI turn execution time = " .. g_startTurnTime - g_endTurnTime )	
	end
	print("-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------")
	print("-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------")
end
function EndTurnSummary()
	g_endTurnTime = os.clock()
	print("-------------------------------------")
	print ("Your turn execution time = " .. g_endTurnTime - g_startTurnTime )
	print("-------------------------------------")
end


-- functions to call at beginning of each turn
function OnNewTurn ()
	CommonOnNewTurn()
	ScenarioOnNewTurn()
	SaveAllTable() -- must be last before NewTurnSummary
	NewTurnSummary() -- after other functions to get benchmark...
end
Events.ActivePlayerTurnStart.Add( OnNewTurn )

-- functions to call at end of each turn
function OnEndTurn ()
	CommonOnEndTurn()
	ScenarioOnEndTurn()
	EndTurnSummary()
end
Events.ActivePlayerTurnEnd.Add( OnEndTurn )

-- functions to call at end of 1st turn
function OnFirstTurnEnd()
	Dprint ("End of First turn detected, calling OnFirstTurnEnd() ...")
	local savedData = Modding.OpenSaveData()
	local iValue = savedData.GetValue("RedFirstTurnEnded")
	if (iValue ~= 1) then
		CommonOnFirstTurnEnd()
		ScenarioOnFirstTurnEnd()
		savedData.SetValue("RedFirstTurnEnded", 1)
	end
	Events.ActivePlayerTurnEnd.Remove(OnFirstTurnEnd)
end

-- functions to call ASAP after loading this file when game is launched for the first time
function OnFirstTurn ()
	Dprint ("RedMain.lua loaded, initializing for new game  ...")
	RemoveHiddenCivs()
	CommonOnFirstTurn()
	ScenarioOnFirstTurn()
	NewTurnSummary()
end

-- functions to call ASAP after loading a saved game
function OnLoading ()
	Dprint ("RedMain.lua loaded, initializing for saved game ...")
	NewTurnSummary()
	CommonOnLoading()
	ScenarioOnLoading()
end

-- functions to call after game initialization (DoM screen button "Begin your journey" appears)
function OnGameInit ()
	local savedData = Modding.OpenSaveData()
	local iValue = savedData.GetValue("RedFinalInitDone")
	if (iValue ~= 1) then
		Dprint ("Game is initialized, calling OnGameInit() for new game ...")
		CommonOnGameInit()
		ScenarioOnGameInit()
		savedData.SetValue("RedFinalInitDone", 1)
	else
		Dprint ("Game is initialized, calling OnGameInit() for loaded game ...")
		CommonOnGameInitReloaded()
		ScenarioOnGameInitReloaded()
	end
end

-- functions to call after entering game (DoM screen button pushed)
function OnEnterGame ()
	CommonOnEnterGame()
	ScenarioOnEnterGame()
	WARN_NOT_SHARED = true -- saveutils should have shared it's cache at this point.
end

-- Initialize when RedMain is loaded
if ( bWaitBeforeInitialize ) then
	bWaitBeforeInitialize = false	
	local savedData = Modding.OpenSaveData()
	local iValue = savedData.GetValue("RedInitDone")
	if (iValue ~= 1) then	
		OnFirstTurn()
		Events.ActivePlayerTurnEnd.Add(OnFirstTurnEnd)
		savedData.SetValue("RedInitDone", 1)
		savedData.SetValue("RedScenario", modUserData.GetValue("RedLoading"))
	else
		OnLoading()
	end
end

Events.SequenceGameInitComplete.Add( OnGameInit )
Events.LoadScreenClose.Add( OnEnterGame )
GameEvents.DLL_Debug.Add( DLL_Debug )

----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------


-- after initialization, reset loading value from setup screen
modUserData.SetValue("RedLoading", "none")

print("+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++")
print("+++++++++++++++++++++++++++++++++++++++++++++++++++++++++ R.E.D. World War II : loaded ! ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++")
print("+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++")

----------------------------------------------------------------------------------------------------------------------------
-- Test Functions
----------------------------------------------------------------------------------------------------------------------------
function GameCoreUpdateEnd()
	if PRINT_DLL_DEBUG then
		Dprint ("GameCoreUpdateEnd...")
		Dprint ("-----------")
	end
end
GameEvents.GameCoreUpdateEnd.Add(GameCoreUpdateEnd)

function GameCoreUpdateBegin()
	if PRINT_DLL_DEBUG then
		Dprint ("GameCoreUpdateBegin...")
		Dprint ("-----------")
	end
end
GameEvents.GameCoreUpdateBegin.Add(GameCoreUpdateBegin)
