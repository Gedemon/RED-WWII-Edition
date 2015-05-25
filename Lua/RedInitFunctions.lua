-- REDInitFunctions
-- Author: Gedemon
-- DateCreated: 21-May-15 17:36:06
--------------------------------------------------------------

print("Loading Red Initialization Functions...")
print("-------------------------------------")


--------------------------------------------------------------
-- Initializing functions 
--------------------------------------------------------------

-- Place initial buildings for all players and auto-set wealth process in human player cities 
function SetInitialCityBuilds()
	bDebug = true

	if g_Cities then

		Dprint ("-------------------------------------", bDebug)
		Dprint ("Initialize cities build list...", bDebug)


		for i, cityData in pairs (g_Cities) do
			local plot = GetPlot(cityData.X, cityData.Y)
			if plot then
				local city = plot:GetPlotCity()
				if city then

					local player = Players[city:GetOwner()]

					if player:IsHuman() then -- auto-set wealth to all cities, micromanagement is allowed/encouraged, but not the default option
						city:PushOrder (OrderTypes.ORDER_MAINTAIN, GameInfo.Processes["PROCESS_WEALTH"].ID, -1, 0, false, false)
					end

					if cityData.Buildings then
						Dprint (" - Preset buildings at ("..cityData.X..","..cityData.Y .. ") for city: "..city:GetName(), bDebug)
						local numBuilding = 0
						for j, building in ipairs (cityData.Buildings) do
							Dprint ("   - building type =  "..building, bDebug)
							city:SetNumRealBuilding(building, 1)
							numBuilding = numBuilding + 1
						end
						if numBuilding >= NUM_BUILDINGS_IMPORTANT_CITY then
							city:PopOrder() -- cities with preplaced buildings may be important and the player will be asked to chose what to produce here
						end
					end

					-- Bonus for AI
					if (cityData.AIBuildings and not player:IsHuman() and not IsSameSideHuman(player)) 
					--or (cityData.AIBuildings and BothSideHuman())
					then 

						Dprint (" - Preset AI buildings at ("..cityData.X..","..cityData.Y .. ") for city: "..city:GetName(), bDebug)
						for k, building in ipairs (cityData.AIBuildings) do
							Dprint ("   - building type (AI bonus) =  "..building, bDebug)
							city:SetNumRealBuilding(building, 1)
						end

					end
				end
			end
		end
	end
end

-- remove starting units (Settler) from hidden minor civs
function RemoveHiddenCivs()
	Dprint("-------------------------------------")
	Dprint("Remove starting units from hidden minor civs ...")
	for playerID = GameDefines.MAX_MAJOR_CIVS, GameDefines.MAX_CIV_PLAYERS - 1 do
		local player = Players[playerID]
		local minorCivID = player:GetMinorCivType()
		-- Does this civ exist ?
		if minorCivID ~= -1 then
			for v in player:Units() do
				if (v:GetUnitType() == SETTLER) then
					v:SetDamage( v:GetMaxHitPoints() )
				end
			end
		end
	end
	
	if HOTSEAT_CIV_TO_KILL then
		Dprint("-------------------------------------")
		Dprint("Remove starting units from hidden major civs ...")
		local player = Players[GetPlayerIDFromCivID (HOTSEAT_CIV_TO_KILL, false, true)]
		if player then
			for v in player:Units() do
				v:Kill(true, -1)
			end
		end
	end
end

-- Register Territory Map at start
-- (and Reveal all cities plot for all civilizations)
function CreateTerritoryMap()
	Dprint("-------------------------------------")
	Dprint("Creating Territory Map and remove all ownership from water tiles and cities...")
	local territoryMap = LoadTerritoryMap()

	for iPlotLoop = 0, Map.GetNumPlots()-1, 1 do
		local plot = Map.GetPlotByIndex(iPlotLoop)
		local x = plot:GetX()
		local y = plot:GetY()

		if ( plot:IsWater() ) then
			plot:SetOwner(-1, -1)
		else
			local owner = plot:GetOwner()
			if (owner ~= -1) then
				-- Spies everywhere : reveal cities plot (allow long range bombing), or all map
				if (plot:IsCity() and REVEAL_ALL_CITIES) or REVEAL_ALL_MAP then
					for iTeamLoop = 0, GameDefines.MAX_CIV_TEAMS - 1, 1 do
						if (plot:GetVisibilityCount(iTeamLoop) > 0) then
							plot:ChangeVisibilityCount(iTeamLoop, -1, -1, true)
						end

						plot:SetRevealed(iTeamLoop, false)

						plot:ChangeVisibilityCount(iTeamLoop, 1, -1, true)
						plot:SetRevealed(iTeamLoop, true)
					end
				end

				local player = Players [owner]
				local civID = GetCivIDFromPlayerID( owner, true )
				local type
				if (player:IsMinorCiv()) then
					type = GameInfo.MinorCivilizations[civID].Type
				else
					type = GameInfo.Civilizations[civID].Type
				end
				if not type then
					Dprint("WARNING, can't find type for playerID = " .. owner ..", civID = " .. civID)
				end

				territoryMap[GetPlotKey ( plot )] = { PlayerID = owner, CivID = civID, Type = type, TerrainType = plot:GetTerrainType(), FeatureType = plot:GetFeatureType() }
			end
			
			plot:SetOwner(owner, -1) -- Make sure no plots are owned by cities...
		end
	end
	SaveTerritoryMap( territoryMap )
end


--------------------------------------------------------------
-- Common batch functions 
--------------------------------------------------------------

-- functions to call at beginning of each turn
function CommonOnNewTurn()
	InitializeProjects()
	MapUpdate() -- check for culture consistency
	SetMinorRelations()
	SetMinorDOW()
	SetMajorRelations()	
	SpawnConvoy()
	ClearAIairSweep()
	RepairImprovements()
	LaunchMilitaryOperation()
	SetGlobalAIStrategicValues()
end

-- functions to call at beginning of each active player turn
function CommonOnActivePlayerTurn()
	InitializeActivePlayerTurn()
	LaunchMilitaryOperation()
end

-- functions to call at end of each turn
function CommonOnEndTurn()
end

-- functions to call at end of 1st turn
function CommonOnFirstTurnEnd()
end

-- functions to call ASAP after loading this file when game is launched for the first time
function CommonOnFirstTurn()
end

-- functions to call ASAP after loading a saved game
function CommonOnLoading()
end

-- functions to call after first game initialization (DoM screen button "Begin your journey" appears)
function CommonOnGameInit()
	-- calling order is important ! 
	InitializeGameOption()								-- before everything else !
	LoadAllTable()										-- before any change on tables...
	RegisterScenarioUnits()
	Events.SerialEventUnitCreated.Add( InitializeUnit ) -- before initializing Order Of Battle
	CreateTerritoryMap()
	SetInitialCityBuilds()
	InitializeProjects()
	SetMinorRelations()
	SetMinorDOW()
	SetMajorRelations()
	GameEvents.UnitSetXY.Add( DynamicTilePromotion )	-- before initializing Order Of Battle
	InitializeOOB()
	InitializeResourceTable()
	InitializeResourceMap()
	InitializeHotseat()
	ShareGlobalTables()									-- Before UI initialization, after any table initialization (Resource, projects, etc...)
	UpdateREDLoadingFix()
	SetGlobalAIStrategicValues()
end

-- functions to call after game initialization (DoM screen button "Continue your journey" appears) after loading a saved game
function CommonOnGameInitReloaded()
	-- calling order is important ! 
	InitializeGameOption()								-- before everything else !
	LoadAllTable()										-- before any change on tables...
	Events.SerialEventUnitCreated.Add( InitializeUnit )
	OnLoadMapUpdate()
	GameEvents.UnitSetXY.Add( DynamicTilePromotion )
	ReinitUnitsOnLoad()
	InitializeHotseat()
	ShareGlobalTables() -- Before UI initialization
	UpdateREDLoadingFix()	
	SetGlobalAIStrategicValues()
end

-- functions to call after entering game (DoM screen button pushed)
function CommonOnEnterGame()
	Events.SerialEventCityCaptured.Add(	VictoryCheck )
	GameEvents.CityCaptureComplete.Add(	HandleCityCapture )					-- called before the attack animation
	--LuaEvents.OnCityCaptured.Add( FixCityGraphicBug )						-- called after the attack animation ?
	GameEvents.MustAbortAttack.Add(	AbortSuicideAttacks )
	GameEvents.CombatResult.Add( CombatResult )
	GameEvents.CombatEnded.Add(	CombatEnded )
	GameEvents.CombatResult.Add( NavalCounterAttack )
	GameEvents.CombatResult.Add( CounterFire )
	GameEvents.CanRangeStrikeAt.Add( CanRangeStrike )
	GameEvents.UnitSetXY.Add( UnitCaptureTile )	
	GameEvents.UnitSetXY.Add( IsAtDestination ) 
	GameEvents.UnitSetXY.Add( SubHunting )
	GameEvents.TurnComplete.Add( REDAutoSave )
	GameEvents.PlayerEndTurnInitiated.Add( REDAutoSaveEachPlayer )
	GameEvents.UnitHasPillaged.Add( SetPillageDamage )
	LuaEvents.OnUnitKilled.Add( PlayerCacheIsLimitedByRatio )
	LuaEvents.OnUnitKilled.Add( PlayerCacheTrainingRestriction )
	GameEvents.PlayerDoTurn.Add( PlayerCacheIsLimitedByRatio )
	GameEvents.PlayerDoTurn.Add( PlayerCacheTrainingRestriction )
	GameEvents.PlayerDoTurn.Add( ShowPlayerInfo )
	GameEvents.PlayerDoTurn.Add( FinalizeNextPlayerProjects )	
	GameEvents.PlayerDoTurn.Add( ShowAITrainingRestriction )
	GameEvents.PlayerDoTurn.Add( ListCitiesBuild )
	GameEvents.PlayerDoTurn.Add( UnitsBleeding )							-- UnitsBleeding: before doing other stuff with units, no need to reinforce/upgrade/control a dying unit...
	GameEvents.PlayerDoTurn.Add( DynamicUnitPromotion )						-- DynamicUnitPromotion: before calling reinforcements
	GameEvents.PlayerDoTurn.Add( ManageResources )
	GameEvents.PlayerDoTurn.Add( UpgradingUnits )							-- UpgradingUnits: after calling reinforcement
	GameEvents.PlayerDoTurn.Add( CallReserveTroops )
	GameEvents.PlayerDoTurn.Add( SpawnReinforcements )
	GameEvents.PlayerDoTurn.Add( AIUnitControl )
	GameEvents.PlayerDoTurn.Add( LaunchMilitaryOperation )
	GameEvents.PlayerDoTurn.Add( ResetCombatTracking )
	GameEvents.PlayerDoTurn.Add( ReinitUnits )
	GameEvents.PlayerDoTurn.Add( UpdatePlayerData )
	GameEvents.PlayerCanConstruct.Add( PlayerBuildingRestriction )
	GameEvents.PlayerCanTrain.Add( PlayerTrainingRestriction )
	GameEvents.PlayerCanCreate.Add( PlayerCreateRestriction )
	GameEvents.CityCanConstruct.Add( CityBuildingRestriction )
	GameEvents.CityCanCreate.Add( CityCreateRestriction )
	GameEvents.CityCanTrain.Add( CityTrainingRestriction )
	GameEvents.CityCanMaintain.Add( CityMaintainingRestriction )
	Events.WarStateChanged.Add( WarConsequences )
	Events.WarStateChanged.Add( PeaceConsequences )
	Events.WarStateChanged.Add( WarPlannedOperations )
	Events.WarStateChanged.Add( GeneralMobilization )
	GameEvents.CanDeclareWar.Add( DeclareWarRestriction )	
	GameEvents.CanSendDiploStatement.Add( CanSendDiploStatement )
	Events.SerialEventGameMessagePopup.Add( HideMinorWarButton )
	Events.SerialEventGameMessagePopup.Add( HideMinorPeaceButton )
	Events.SerialEventHexCultureChanged.Add( CheckCultureChange ) 
	RegisterOnSaveCallback()
	InitializeDynamicPromotions()
	GameEvents.TacticalAILaunchUnitAttack.Add(TacticalAILaunchUnitAttack )
	GameEvents.PushingMissionTo.Add( PushingMissionTo )
	GameEvents.GameCoreUpdateBegin.Add( InitializeUnitFunctions )
	GameEvents.GetFreeUnitsFromScenario.Add( GetFreeUnitsFromScenario )
	InitializeClosedBorders()
	UpdateGlobalData()
	ValidateData()											
	InitializeUI()															-- InitializeUI: Last to call
end


--------------------------------------------------------------
-- default empty scenario batch functions, 
-- they can be overriden by functions of same 
-- name in main scenario lua file
--------------------------------------------------------------

-- functions to call at beginning of each turn
function ScenarioOnNewTurn()
end

-- functions to call at beginning of each active player turn
function ScenarioOnActivePlayerTurn()
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
