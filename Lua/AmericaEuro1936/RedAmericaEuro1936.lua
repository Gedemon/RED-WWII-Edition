-- RedAmericaEurope1936
-- Author: Gedemon
-- DateCreated: 5/17/2011 10:54:28 PM
--------------------------------------------------------------


print("Loading America/Europe 1936 Functions...")
print("-------------------------------------")

-----------------------------------------
-- Initializing Scenario Functions...
-----------------------------------------


-- functions to call at beginning of each turn
function ScenarioOnNewTurn()
	AustriaAnnexation()
	CzechAnnexation()
	AlbaniaAnnexation()
	LithuaniaAnnexation()
	LatviaAnnexation()
	EstoniaAnnexation()
	LendLeaseAct()
	PrepareForWar(5) -- alert 5 turns before declaring war
	PrepareForWar(1) -- alert 1 turn before declaring war
end

-- functions to call at end of each turn
function ScenarioOnEndTurn()
end

-- functions to call at end of 1st turn
function ScenarioOnFirstTurnEnd()
end

-- functions to call ASAP after loading this file when game is launched for the first time
function ScenarioOnFirstTurn()
end

-- functions to call ASAP after loading a saved game
function ScenarioOnLoading()
end

-- functions to call after game initialization (DoM screen button "Begin your journey" appears)
function ScenarioOnGameInit()
end

-- functions to call after game initialization (DoM screen button "Continue your journey" appears) after loading a saved game
function ScenarioOnGameInitReloaded()
end

-- functions to call after entering game (DoM screen button pushed)
function ScenarioOnEnterGame()
end
