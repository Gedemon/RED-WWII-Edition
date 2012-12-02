-- RedEurope1940
-- Author: Gedemon
-- DateCreated: 5/17/2011 10:54:28 PM
--------------------------------------------------------------

print("Loading Red Stalingrad Functions...")
print("-------------------------------------")

-----------------------------------------
-- Initializing Scenario Functions...
-----------------------------------------

g_StalingradInit = false -- used to tell other functions that the game is initialised

-- functions to call at beginning of each turn
function ScenarioOnNewTurn()
	UpdateStalingradScore()
	CheckStalingradVictory()
end

-- functions to call at end of each turn
function ScenarioOnEndTurn()
end

-- functions to call at end of 1st turn
function ScenarioOnFirstTurnEnd()
end

-- functions to call ASAP after loading this file when game is launched for the first time
function ScenarioOnFirstTurn()
	InitializePlayerFunctions()
	GameEvents.PlayerDoTurn.Add(UpdateGold)
	--GameEvents.PlayerDoTurn.Add(CheckAIObjective)
	Events.SerialEventUnitCreated.Add( SetStalingradPromotion )
end

-- functions to call ASAP after loading a saved game
function ScenarioOnLoading()
	InitializePlayerFunctions()
	GameEvents.PlayerDoTurn.Add(UpdateGold)
	--GameEvents.PlayerDoTurn.Add(CheckAIObjective)
	Events.SerialEventUnitCreated.Add( SetStalingradPromotion )
end

-- functions to call after game initialization (DoM screen button "Begin your journey" appears)
function ScenarioOnGameInit()
	Set6thArmyInitialStrength()
end

-- functions to call after game initialization (DoM screen button "Continue your journey" appears) after loading a saved game
function ScenarioOnGameInitReloaded()
end

-- functions to call after entering game (DoM screen button pushed)
function ScenarioOnEnterGame()
	g_StalingradInit = true
	DoInitStalingradUI()
	Events.SerialEventGameDataDirty.Add(UpdateStalingradScoreString)
	Events.SerialEventTurnTimerDirty.Add(UpdateStalingradScoreString)
	Events.SerialEventCityInfoDirty.Add(UpdateStalingradScoreString)
end
