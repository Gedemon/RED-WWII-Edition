-- RedEurope1940
-- Author: Gedemon
-- DateCreated: 5/17/2011 10:54:28 PM
--------------------------------------------------------------

print("Loading Red Europe 1940 Functions...")
print("-------------------------------------")

-----------------------------------------
-- Initializing Scenario Functions...
-----------------------------------------


-- functions to call at beginning of each turn
function ScenarioOnNewTurn()
	SetAIStrategicValues()	
	InitializeEuro1940Projects()
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
	GameEvents.PlayerCanCreate.Add(PlayerEuro1940ProjectRestriction)
	Events.SerialEventCityCaptured.Add( FallOfFrance )
	Events.SerialEventCityCaptured.Add( FallOfPoland )
	LuaEvents.OnCityAttacked.Add( FallOfDenmark )
	Events.SerialEventCityCaptured.Add( ColonyReconquest )
	Events.EndCombatSim.Add( ConvertToFreeFrance )
	SetAIStrategicValues()
end

-- functions to call after game initialization (DoM screen button "Begin your journey" appears)
function ScenarioOnGameInit()
	GiveVilniusToPoland() -- safe here because ScenarioOnGameInit() is called after main OnGameInit() (and territory map initialization)
	GameEvents.PlayerCanCreate.Add(PlayerEuro1940ProjectRestriction)
	Events.SerialEventCityCaptured.Add( FallOfFrance )
	Events.SerialEventCityCaptured.Add( FallOfPoland )
	LuaEvents.OnCityAttacked.Add( FallOfDenmark )
	Events.SerialEventCityCaptured.Add( ColonyReconquest )
	Events.EndCombatSim.Add( ConvertToFreeFrance )
	SetAIStrategicValues()
end

-- functions to call after game initialization (DoM screen button "Continue your journey" appears) after loading a saved game
function ScenarioOnGameInitReloaded()
end

-- functions to call after entering game (DoM screen button pushed for a new game or reloading)
function ScenarioOnEnterGame()
	DoInitEuro1940UI()
	GameEvents.CityCaptureComplete.Add(	UpdateEuro1940ScoreString )
end
