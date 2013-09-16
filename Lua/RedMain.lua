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
include ("PlotIterators")
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
	g_IsGameFullyInitialized = true
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
-- Temp Debug/Test Functions
----------------------------------------------------------------------------------------------------------------------------
function GameCoreUpdateEnd()
	if PRINT_DLL_DEBUG then
		Dprint ("GameCoreUpdateEnd...")
		Dprint ("-----------")
	end
end
--GameEvents.GameCoreUpdateEnd.Add(GameCoreUpdateEnd)

function GameCoreUpdateBegin()
	if PRINT_DLL_DEBUG then
		Dprint ("GameCoreUpdateBegin...")
		Dprint ("-----------")
	end
end
--GameEvents.GameCoreUpdateBegin.Add(GameCoreUpdateBegin)

---[[
-- Pazyryk code for City graphic (need fix)
g_cityUpdateInfo = {}
g_cityUpdateNum = 0

function ListenerSerialEventCityCreated(vHexPos, iPlayer, iCity, artStyleType, eraType, continent, populationSize, size, fogState)
	print("ListenerSerialEventCityCreated: ", vHexPos, iPlayer, iCity, artStyleType, eraType, continent, populationSize, size, fogState)
	g_cityUpdateNum = g_cityUpdateNum + 1
	g_cityUpdateInfo[g_cityUpdateNum] = g_cityUpdateInfo[g_cityUpdateNum] or {}
	local updateInfo = g_cityUpdateInfo[g_cityUpdateNum]
	updateInfo[1] = {x = vHexPos.x, y = vHexPos.y, z = vHexPos.z}
	updateInfo[2] = iPlayer
	updateInfo[3] = iCity
	updateInfo[4] = artStyleType
	updateInfo[5] = eraType
	updateInfo[6] = continent
	updateInfo[7] = populationSize
	updateInfo[8] = size
	updateInfo[9] = fogState

	--Warning! Infinite loop if new updateInfo causes an update!
	if g_IsGameFullyInitialized then
		local x, y = ToGridFromHex( updateInfo[1].x, updateInfo[1].y )
		local plot = GetPlot(x,y)
		local iOriginalOwner = GetPlotFirstOwner(GetPlotKey(plot))
		local originalOwner = Players[iOriginalOwner]
		local originalCiv = GetCivIDFromPlayerID (iOriginalOwner)

		local originalArtStyle = "ARTSTYLE_EUROPEAN" -- default	
		if originalOwner:IsMinorCiv() then
			originalArtStyle = GameInfo.MinorCivilizations[originalCiv].ArtStyleType
		else
			originalArtStyle = GameInfo.Civilizations[originalCiv].ArtStyleType
		end			
		local cityArtstyleID = GameInfo.ArtStyleTypes[originalArtStyle].ID
		if cityArtstyleID ~= artStyleType then
			UpdateCityGraphic(plot:GetPlotCity())
		end
	end
end
Events.SerialEventCityCreated.Add(ListenerSerialEventCityCreated)

function UpdateCitiesGraphicsOnLoad()
	if g_cityUpdateNum == 0 then return end
	print("Running UpdateCityGraphics; number cached = ", g_cityUpdateNum)
	while 0 < g_cityUpdateNum do
		local updateInfo = g_cityUpdateInfo[g_cityUpdateNum]
		g_cityUpdateNum = g_cityUpdateNum - 1
		--local iCurrentOwner = updateInfo[2]
		--local currentOwner =  Players[iCurrentOwner]
		--local city = currentOwner:GetCityByID(updateInfo[3])
		local x, y = ToGridFromHex( updateInfo[1].x, updateInfo[1].y )
		local plot = GetPlot(x,y)
		local city = plot:GetPlotCity()
		if city then
			local iCurrentOwner = city:GetOwner()
			local currentOwner =  Players[iCurrentOwner]
			local iOriginalOwner = city:GetOriginalOwner()
			local originalOwner = Players[iOriginalOwner]

			local originalCiv = GetCivIDFromPlayerID (iOriginalOwner)
			local currentCiv = GetCivIDFromPlayerID (iCurrentOwner)

			local originalArtStyle = "ARTSTYLE_EUROPEAN" -- default	
			if originalOwner:IsMinorCiv() then
				originalArtStyle = GameInfo.MinorCivilizations[originalCiv].ArtStyleType
			else
				originalArtStyle = GameInfo.Civilizations[originalCiv].ArtStyleType
			end
			
			local cityArtstyleID = GameInfo.ArtStyleTypes[originalArtStyle].ID
			if cityArtstyleID ~= updateInfo[4] then
				Events.SerialEventCityCreated(updateInfo[1], updateInfo[2], updateInfo[3], cityArtstyleID, updateInfo[5], updateInfo[6], updateInfo[7], updateInfo[8], updateInfo[9])
			end
		end
	end
end

function UpdateCityGraphic(city)
	if city then
		local plot = city:Plot()
		Dprint ("-----------")
		Dprint("Update city graphic on plot ".. tostring(plot:GetX()) ..",".. tostring(plot:GetY()))

		local iCurrentOwner = city:GetOwner()
		local currentOwner =  Players[iCurrentOwner]		
		Dprint("Current owner: ".. tostring(currentOwner:GetName()))

		local iOriginalOwner = city:GetOriginalOwner() --GetPlotFirstOwner(GetPlotKey(plot))
		local originalOwner = Players[iOriginalOwner]
		Dprint("Original owner: ".. tostring(originalOwner:GetName()))

		local originalCiv = GetCivIDFromPlayerID (iOriginalOwner)
		local currentCiv = GetCivIDFromPlayerID (iCurrentOwner)

		local originalArtStyle = "ARTSTYLE_EUROPEAN" -- default	
		--local currentArtStyle = city:GetArtStyleType()
		--Dprint("Default Arstyle = ".. tostring(originalArtStyle))
		--Dprint("Current Arstyle = ".. tostring(currentArtStyle))

		if originalOwner:IsMinorCiv() then
			originalArtStyle = GameInfo.MinorCivilizations[originalCiv].ArtStyleType
			Dprint("Original Arstyle = ".. tostring(originalArtStyle))
		else
			originalArtStyle = GameInfo.Civilizations[originalCiv].ArtStyleType
			Dprint("Original Arstyle = ".. tostring(originalArtStyle))
		end
			
		local cityArtstyleID = GameInfo.ArtStyleTypes[originalArtStyle].ID
		local currentArtstyleID = city:GetArtStyleType() --GameInfo.ArtStyleTypes[currentArtStyle].ID
		Dprint("Original Arstyle ID = ".. tostring(cityArtstyleID))
		Dprint("Current Arstyle ID = ".. tostring(currentArtstyleID))
		Dprint ("-----------")
		--if cityArtstyleID ~= currentArtstyleID then
			Events.SerialEventCityCreated(ToHexFromGrid( Vector2( plot:GetX(), plot:GetY() ) ), iCurrentOwner, city:GetID(), cityArtstyleID, 2 --[[originalOwner:GetCurrentEra()--]], plot:GetContinentArtType(), city:GetPopulation(), math.floor(city:GetPopulation()/2), 2)
			--FixCityGraphicBug(plot)
		--end
	end
end


--Events.SerialEventGameDataDirty.Add(UpdateCitiesGraphicsOnLoad)
Events.SequenceGameInitComplete.Add(UpdateCitiesGraphicsOnLoad)
--Events.SerialEventCityCaptured.Add(UpdateCitiesGraphicsOnLoad)
--GameEvents.CityCaptureComplete.Add(UpdateCitiesGraphicsOnLoad)
--]]