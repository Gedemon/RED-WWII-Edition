-- Utils
-- Author: Gedemon
-- DateCreated: 1/29/2011
--------------------------------------------------------------

print("Loading Red Utils Functions...")
print("-------------------------------------")

-- Output debug text
function Dprint ( str, bOutput )
  if bOutput == nil then
    bOutput = true
  end
  if ( PRINT_DEBUG and bOutput ) then
    print (str)
  end
end

--------------------------------------------------------------
-- Math functions 
--------------------------------------------------------------

function Round(num)
    under = math.floor(num)
    upper = math.floor(num) + 1
    underV = -(under - num)
    upperV = upper - num
    if (upperV > underV) then
        return under
    else
        return upper
    end
end

function Shuffle(t)
  local n = #t
 
  while n >= 2 do
    -- n is now the last pertinent index
    local k = math.random(n) -- 1 <= k <= n
    -- Quick swap
    t[n], t[k] = t[k], t[n]
    n = n - 1
  end
 
  return t
end

function GetSize(t)

	if type(t) ~= "table" then
		return 1 
	end

	local n = #t 
	if n == 0 then
		for k, v in pairs(t) do
			n = n + 1
		end
	end 
	return n
end

-- From Thalassicus utils 
function IsBetween(lower, mid, upper)
	return ((lower <= mid) and (mid <= upper))
end
function Constrain(lower, mid, upper)
	return math.max(lower, math.min(mid, upper))
end

--------------------------------------------------------------
-- Map functions 
--------------------------------------------------------------

--	here (x,y) = (0,0) is bottom left of map in Worldbuilder.
function GetPlot (x,y)
	local plot = Map:GetPlotXY(y,x)
	return plot
end

-- return a key string used in saved table refering to a plot position (can't save object in table...)
function GetPlotKey ( plot )
	-- set the key string used in TerritoryMap
	local x = plot:GetX()
	local y = plot:GetY()
	local plotKey = x..","..y
	return plotKey
end

-- return the plot coordonate refered by the key string
function GetPlotXYFromKey ( plotKey )
	local pos = string.find(plotKey, ",")
	local x = string.sub(plotKey, 1 , pos -1)
	local y = string.sub(plotKey, pos +1)
	return x, y
end

-- return the plot refered by the key string
function GetPlotFromKey ( plotKey )
	local pos = string.find(plotKey, ",")
	if pos then
		local x = string.sub(plotKey, 1 , pos -1)
		local y = string.sub(plotKey, pos +1)
		local plot = Map:GetPlotXY(y,x)
		return plot
	else
		Dprint("Error: Can't get substring (x,y) of plotKey in GetPlotFromKey ( ".. tostring(plotKey) .. "), returning plot = nil")
		return nil
	end
end

-- get playerID closest city from a plot (return city object)
function GetCloseCity ( playerID, plot , bNotSelf)
	local pPlayer = Players[playerID]
	if pPlayer then
		local distance = 1000
		local closeCity = nil
		for pCity in pPlayer:Cities() do
			if pCity:Plot() == plot and bNotSelf then
				--Dprint ( " -- GetCloseCity() called with (bNotSelf = true), don't test city on starting plot...")
			else
				distanceToCity = Map.PlotDistance(pCity:GetX(), pCity:GetY(), plot:GetX(), plot:GetY())
				if ( distanceToCity < distance) then
					distance = distanceToCity
					closeCity = pCity
				end
			end
		end
		return closeCity
	else
		Dprint("- WARNING: pPlayer is nil for GetCloseCity()")
		if playerID then Dprint ("  -- playerID is :" .. playerID) else Dprint ("  -- playerID is : nil or false") end
		return nil
	end
end

-- get original owner of a plot
function GetPlotFirstOwner(plotKey)
	-- return original owner of a plot
	local map = LoadTerritoryMap()
	for key, owner in pairs ( map ) do
		if (key == plotKey) then
			return owner.PlayerID
		end
	end
	return -1
end

-- covert plot (to do : use for meteo sim when selecting planes ?)
function CoverPlots(iPlayer)
	nPlayer = Players[iPlayer]
	for i = 1, 6 do
		for j = 0, 3 do
			local tempPlot = Map.GetPlot(i, j);
			--tempPlot:SetRevealed(Player, false) --, false, iPlayer) 
			tempPlot:SetRevealed(nPlayer:GetTeam(), false, 0, -1);
		end
	end
end

-- return list of adjacent plots
function GetAdjacentPlots(plot, bIncludeSelf)
	local bDebug = false
	Dprint("   - Getting adjacent plots for " .. plot:GetX() .. ",".. plot:GetY(), bDebug)
	
	if not plot then
		Dprint("- WARNING ! plot is nil for GetAdjacentPlots()")
	end

	local plotList = {}
	if bIncludeSelf and plot then
		table.insert(plotList, plot)
	end
	local direction_types = {
		DirectionTypes.DIRECTION_NORTHEAST,
		DirectionTypes.DIRECTION_EAST,
		DirectionTypes.DIRECTION_SOUTHEAST,
		DirectionTypes.DIRECTION_SOUTHWEST,
		DirectionTypes.DIRECTION_WEST,
		DirectionTypes.DIRECTION_NORTHWEST
	}
	for loop, direction in ipairs(direction_types) do
		local adjPlot = Map.PlotDirection( plot:GetX(), plot:GetY(), direction)
		if ( adjPlot ~= nil ) then
			Dprint("      - adding plot at " .. adjPlot:GetX() .. ",".. adjPlot:GetY(), bDebug)
			table.insert(plotList, adjPlot)
		end
	end
	Dprint("   - num adjacent plots = " .. #plotList, bDebug)
	return plotList
end

-- return list of plots in a circle, Thanks to Thalassicus...
function GetPlotsInCircle(plot, minRadius, maxRadius)
    local plotList    = {}
    local mapW, mapH  = Map.GetGridSize()
    local isWrapX     = Map:IsWrapX()
    local isWrapY     = Map:IsWrapY()
    local centerX     = plot:GetX()
    local centerY     = plot:GetY()
    
    x1 = isWrapX and ((centerX-maxRadius) % mapW) or Constrain(0, centerX-maxRadius, mapW-1)
    x2 = isWrapX and ((centerX+maxRadius) % mapW) or Constrain(0, centerX+maxRadius, mapW-1)
    y1 = isWrapY and ((centerY-maxRadius) % mapH) or Constrain(0, centerY-maxRadius, mapH-1)
    y2 = isWrapY and ((centerY+maxRadius) % mapH) or Constrain(0, centerY+maxRadius, mapH-1)

    local x      = x1
    local y      = y1
    local xStep  = 0
    local yStep  = 0
    local rectW  = x2-x1 
    local rectH  = y2-y1
    
    if rectW < 0 then
        rectW = rectW + mapW
    end
    
    if rectH < 0 then
        rectH = rectH + mapH
    end
    
    local adjPlot = Map.GetPlot(x, y)
    while (yStep < 1 + rectH) and adjPlot ~= nil do
        while (xStep < 1 + rectW) and adjPlot ~= nil do
            if IsBetween(minRadius, Map.PlotDistance(x, y, centerX, centerY), maxRadius) then
                table.insert(plotList, adjPlot)
            end
            
            x        = x + 1
            x        = isWrapX and (x % mapW) or x
            xStep    = xStep + 1
            adjPlot  = Map.GetPlot(x, y)
        end
        x        = x1
        y        = y + 1
        y        = isWrapY and (y % mapH) or y
        xStep    = 0
        yStep    = yStep + 1
        adjPlot  = Map.GetPlot(x, y)
    end
    
    return plotList
end  


function GetPlotsInSpiral(plot, range, bIncludeCenter)
	if bIncludeCenter == nil then
		bIncludeCenter = true
	end
    local plotList    = {}
	for pAreaPlot in PlotAreaSpiralIterator(plot, range, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, bIncludeCenter) do
		table.insert(plotList, pAreaPlot)
    end
    return plotList
end  

-- check if a plot and all adjacents are safe for spawning (no enemy units)
function IsSafePlot( plot, playerID)
	local bSafe= true
	--local player = Players[ playerID ]
	local adjacentPlots = GetAdjacentPlots(plot, true) -- check central plot
	for i, adjPlot in pairs(adjacentPlots) do		
		
		-- test for units
		local unitCount = adjPlot:GetNumUnits()    
		for i = 0, unitCount - 1, 1	do
    		local unit = adjPlot:GetUnit(i)
			if unit and not AreSameSide( playerID, unit:GetOwner()) then
				bSafe = false
			end
		end

		-- test for cities
		if adjPlot:IsCity() then
			local city = adjPlot:GetPlotCity()
			if not AreSameSide( playerID, city:GetOwner()) then
				bSafe = false
			end
		end
	end
	return bSafe
end

function IsNearFriendlyCity(plot, playerID)
	local bFriendlyCity= false
	--local player = Players[ playerID ]
	local adjacentPlots = GetAdjacentPlots(plot, false) -- don't check central plot
	for i, adjPlot in pairs(adjacentPlots) do		
		-- test for cities
		if adjPlot:IsCity() then
			local city = adjPlot:GetPlotCity()
			if AreSameSide( playerID, city:GetOwner()) then
				bFriendlyCity = true
			end
		end
	end
	return bFriendlyCity
end

function IsNearNavalFriendlyCity(plot, playerID)
	local bFriendlyCity= false
	local adjacentPlots = GetAdjacentPlots(plot, false) -- don't check central plot
	for i, adjPlot in pairs(adjacentPlots) do		
		-- test for cities
		if adjPlot:IsCity() then
			local city = adjPlot:GetPlotCity()
			if AreSameSide( playerID, city:GetOwner()) and city:GetNumBuilding(HARBOR) > 0 then
				bFriendlyCity = true
			end
		end
	end
	return bFriendlyCity
end

-- get closest friendly naval city from a plot (return city object)
-- to do : add max distance as parameter... combine with AI turns to reach plot...
function GetCloseFriendlyNavalCity ( playerID, plot , bNotSelf)
	local bDebug = false
	local player = Players[playerID]
	
	local distance = CLOSE_SEA_DISTANCE + 1
	local closeCity = nil
	local distanceToCity

	for player_num = 0, GameDefines.MAX_CIV_PLAYERS-1, 1 do
		local otherPlayer = Players[player_num]
		if otherPlayer:IsAlive() and AreSameSide( playerID, player_num) then
			for pCity in otherPlayer:Cities() do
				if pCity:Plot() == plot and bNotSelf then
					Dprint ( " -- GetCloseNavalCity() called with (bNotSelf = true), don't test city on starting plot...", bDebug)
				elseif pCity:GetNumBuilding(HARBOR) == 0 then
					Dprint ( " ----  " .. pCity:GetName() .. " has no harbor...", bDebug)
				else
					--distanceToCity = Map.PlotDistance(pCity:GetX(), pCity:GetY(), plot:GetX(), plot:GetY())
					local airDistance = Map.PlotDistance(pCity:GetX(), pCity:GetY(), plot:GetX(), plot:GetY())
					Dprint ( " --  Air distance to " .. pCity:GetName() .. " = " .. airDistance, bDebug)

					if CLOSE_SEA_DISTANCE >= airDistance then
						if isPlotConnected(player, plot, pCity:Plot(), "Ocean", false, true , nil) then
							distanceToCity = getRouteLength()
							Dprint ( " --  found route, distance = " .. distanceToCity, bDebug)
							if ( distanceToCity < distance) then
								distance = distanceToCity
								closeCity = pCity
							end
						end
					end
				end
			end
		end
	end
	if closeCity then
		Dprint ( "  - found close city : " .. closeCity:GetName(), bDebug)
	end
	return closeCity
end

-- get playerID closest naval city from a plot (return city object)
function GetCloseNavalCity ( playerID, plot , bNotSelf)
	local bDebug = true
	local pPlayer = Players[playerID]
	if pPlayer then
		local distance = 1000
		local closeCity = nil
		for pCity in pPlayer:Cities() do
			if pCity:Plot() == plot and bNotSelf then
				Dprint ( " -- GetCloseCity() called with (bNotSelf = true), don't test city on starting plot...", bDebug)
			elseif pCity:GetNumBuilding(HARBOR) == 0 then
				Dprint ( " --  " .. pCity:GetName() .. " has no harbor...", bDebug)
			else
				distanceToCity = Map.PlotDistance(pCity:GetX(), pCity:GetY(), plot:GetX(), plot:GetY())
				if ( distanceToCity < distance) then
					distance = distanceToCity
					closeCity = pCity
				end
			end
		end
		return closeCity
	else
		Dprint("- WARNING: pPlayer is nil for GetCloseCity()")
		if playerID then Dprint ("  -- playerID is :" .. playerID) else Dprint ("  -- playerID is : nil or false") end
		return nil
	end
end

--------------------------------------------------------------
-- Database functions 
--------------------------------------------------------------

-- update localized text
function SetText ( str, tag )

	-- Quick format for SQL
	str = string.gsub(str, "'", "''")

	-- in case of language change mid-game :
	local query = "UPDATE Language_en_US SET Text = '".. str .."' WHERE Tag = '".. tag .."'"
	for result in DB.Query(query) do
	end
	-- that's the table used ingame :
	local query = "UPDATE LocalizedText SET Text = '".. str .."' WHERE Tag = '".. tag .."'"
	for result in DB.Query(query) do
	end
end

-- return the first playerID using this CivilizationID or MinorcivID
function GetPlayerIDFromCivID (id, bIsMinor, bReportError)
	if ( bIsMinor ) then
		for player_num = GameDefines.MAX_MAJOR_CIVS, GameDefines.MAX_CIV_PLAYERS - 1, 1 do
			local player = Players[player_num]
			if ( id == player:GetMinorCivType() ) then
				return player_num
			end
		end
	else
		for player_num = 0, GameDefines.MAX_MAJOR_CIVS-1 do
			local player = Players[player_num]
			if ( id == player:GetCivilizationType() ) then
				return player_num
			end
		end
	end
	if (id) then 
		Dprint ("WARNING : can't find Player ID for civ ID = " .. id , bReportError) 
	else	
		Dprint ("WARNING : civID is NILL or FALSE", bReportError) 
	end
	return false
end

-- return Civ type ID for playerID
function GetCivIDFromPlayerID (playerID, bReportError)
	if (playerID and playerID ~= -1) then
		if playerID <= GameDefines.MAX_MAJOR_CIVS-1 then
			local civID = Players[playerID]:GetCivilizationType()
			if (civID ~= -1) then
				return civID
			else
				Dprint ("WARNING : no major civ for PlayerId = " .. playerID , bReportError) 
				return false
			end
		else 
			local civID = Players[playerID]:GetMinorCivType()
			if (civID ~= -1) then
				return civID
			else
				Dprint ("WARNING : no minor civ for PlayerId = " .. playerID, bReportError) 
				return false
			end
		end
	else
		Dprint ("WARNING : trying to find CivType for PlayerId = -1 or nil", bReportError) 
		return false
	end
end

-- return Civ type string for playerID
function GetCivTypeFromPlayerID(playerID)
	local player = Players[playerID]
	local civID = GetCivIDFromPlayerID(playerID, true)
	local type
	if (player:IsMinorCiv()) then
		type = GameInfo.MinorCivilizations[civID].Type
	else
		type = GameInfo.Civilizations[civID].Type
	end
	return type
end

--------------------------------------------------------------
-- Save/Load 
--------------------------------------------------------------

function REDAutoSave(iplayer)
	if RED_AUTOSAVE and Game.GetActivePlayer() == iplayer then
		SaveAllTable()
		Dprint("-------------------------------------")
		Dprint("Auto-Saving is ON ...")
		local saveName = "RED_WWII_Autosave_EndTurn"
		Dprint("Saving: " .. saveName )
		UI.SaveGame( saveName )
	end
end

function REDAutoSaveEachPlayer(iplayer)
	local player = Players[iplayer]
	if player and RED_AUTOSAVE_EACH_PLAYER and iplayer < GameDefines.MAX_MAJOR_CIVS then
		Dprint("-------------------------------------")
		Dprint("Auto-Saving for each player is ON ...")
		SaveAllTable()
		local saveName = "RED_WWII_Autosave_EndTurn_"..tostring(player:GetName())		
		Dprint("Saving: " .. saveName )
		UI.SaveGame( saveName )
	end
	if iplayer == BARBARIAN_PLAYER then
		Dprint("-------------------------------------")
		Dprint("Saving all table at end of Barbarian (last) player, before civ5's autosaving...")
		SaveAllTable()
	end

end

function LoadAllTable()
	Dprint("-------------------------------------")
	Dprint("Loading data tables ...")
	DEBUG_PERFORMANCE = true	
	local t1 = os.clock()

	g_UnitData = LoadData("Unit", {}, UNIT_SAVE_SLOT)
	g_ReinforcementData = LoadData("Reinforcement", {}, REINFORCEMENT_SAVE_SLOT)
	g_ProjectsDone = LoadData("ProjectsDone", {}, PROJECTS_SAVE_SLOT)
	g_CombatsLog = LoadData("CombatsLog", {}, COMBATLOG_SAVE_SLOT)
	g_DynamicMap = LoadData("DynamicMap", {}, DYNAMICMAP_SAVE_SLOT)

	local t2 = os.clock()
	Dprint("  - Total time for all tables :		" .. t2 - t1 .. " s")
	DEBUG_PERFORMANCE = false
end
function SaveAllTable()
	Dprint("-------------------------------------")
	Dprint("Saving data table ...")
	DEBUG_PERFORMANCE = true	
	local t1 = os.clock()

	if #g_CombatsLog > MAX_COMBAT_LOG_ENTRIES then -- do we need to archive or delete entries in combat log ?
		local logArchive = {}
		if USE_ARCHIVE then
			LoadData("CombatsLogArchive", {}, COMBAT_ARCHIVE_SAVE_SLOT)
		end
		local logActive = {}
		for i, data in ipairs(g_CombatsLog) do
			if i < (MAX_COMBAT_LOG_ENTRIES - MIN_COMBAT_LOG_ENTRIES) then 
				table.insert(logArchive, data)
			else
				table.insert(logActive, data)
			end
		end
		if USE_ARCHIVE then
			SaveData("CombatsLogArchive", logArchive, COMBAT_ARCHIVE_SAVE_SLOT)
		end
		g_CombatsLog = logActive
	end
	
	SaveData("CombatsLog", g_CombatsLog, COMBATLOG_SAVE_SLOT)
	SaveData("Unit", g_UnitData, UNIT_SAVE_SLOT)
	SaveData("Reinforcement", g_ReinforcementData, REINFORCEMENT_SAVE_SLOT)
	SaveData("ProjectsDone", g_ProjectsDone, PROJECTS_SAVE_SLOT)
	SaveData("DynamicMap", g_DynamicMap, DYNAMICMAP_SAVE_SLOT)

	local t2 = os.clock()
	Dprint("  - Total time for all tables :		" .. t2 - t1 .. " s")
	DEBUG_PERFORMANCE = false
end

function LoadData( name, defaultValue, key )
	local startTime = os.clock()
	local plotKey = key or DEFAULT_SAVE_KEY
	local pPlot = GetPlotFromKey ( plotKey )
	if pPlot then
		local value = load( pPlot, name ) or defaultValue
		local endTime = os.clock()
		local totalTime = endTime - startTime
		Dprint ("LoadData() used " .. tostring(totalTime) .. " sec to retrieve " .. tostring(name) .. " from plot " .. tostring(plotKey) .. " (#entries = " .. tostring(GetSize(value)) ..")", DEBUG_PERFORMANCE)
		return value
	else
		Dprint("Error: trying to load script data from invalid plot (" .. tostring(plotKey) .."), data = " .. tostring(name))
		return nil
	end
end
function SaveData( name, value, key )
	local startTime = os.clock()
	local plotKey = key or DEFAULT_SAVE_KEY
	local pPlot = GetPlotFromKey ( plotKey )	
	if pPlot then
		save( pPlot, name, value )
		local endTime = os.clock()
		local totalTime = endTime - startTime
		Dprint ("SaveData() used " .. tostring(totalTime) .. " sec to store " .. tostring(name) .. " in plot " .. tostring(plotKey) .. " (#entries = " .. tostring(GetSize(value)) ..")", DEBUG_PERFORMANCE)
	else
		Dprint("Error: trying to save script data to invalid plot (" .. tostring(plotKey) .."), data = " .. tostring(name) .. " value = " .. tostring(value))
	end
end

function LoadModdingData( name, defaultValue)
	local startTime = os.clock()
	local savedData = Modding.OpenSaveData()
	local value = savedData.GetValue(name) or defaultValue
	local endTime = os.clock()
	local totalTime = endTime - startTime
	Dprint ("LoadData() used " .. totalTime .. " sec for " .. name, DEBUG_PERFORMANCE)
	Dprint("-------------------------------------", DEBUG_PERFORMANCE)
	return value
end
function SaveModdingData( name, value )
	startTime = os.clock()
	local savedData = Modding.OpenSaveData()
	savedData.SetValue(name, value)
	endTime = os.clock()
	totalTime = endTime - startTime
	Dprint ("SaveData() used " .. totalTime .. " sec for " .. name, DEBUG_PERFORMANCE)
	Dprint("-------------------------------------", DEBUG_PERFORMANCE)
end

-- the territory map is an save of all nation territory at game start
-- structure : TerritoryMap[plotKey] = { PlayerID = owner, CivID = civID, Type = type }
-- It's a one-time written table, saved once.
function LoadTerritoryMap()
	local pPlayer = Players[PLAYER_SAVE_SLOT]
	local territoryMap = load( pPlayer, "TerritoryMap" ) or {}
	return territoryMap
end
function SaveTerritoryMap( territoryMap )
	local pPlayer = Players[PLAYER_SAVE_SLOT]
	save( pPlayer, "TerritoryMap", territoryMap )
end

-- the dynamic map contains damage done to terrain improvment, and a counter for reparations...
function LoadDynamicMap()
	return LoadData("DynamicMap", {}, DYNAMICMAP_SAVE_SLOT)
end

-- Available reinforcements data
function LoadReinforcementData()
	return LoadData("Reinforcement", {}, REINFORCEMENT_SAVE_SLOT)
end

-- UnitData is used to save extra info for units
function LoadUnitData()
	return LoadData("Unit", {}, UNIT_SAVE_SLOT)
end

-- CombatsLog logs all combat
function LoadCombatsLog()
	return LoadData("CombatsLog", {}, COMBATLOG_SAVE_SLOT)
end

-- Tracks finished projects
function LoadProjectsDone()
	return LoadData("ProjectsDone", {}, PROJECTS_SAVE_SLOT)
end

--------------------------------------------------------------
-- Initialization 
--------------------------------------------------------------

function InitializeGameOption()

	-- Mandatory DLL configuration for R.E.D.
	PreGame.SetGameOption("GAMEOPTION_DOUBLE_EMBARKED_DEFENSE_AGAINST_AIR", 1)	
	PreGame.SetGameOption("GAMEOPTION_FREE_PLOTS", 1)
	PreGame.SetGameOption("GAMEOPTION_NO_MINOR_DIPLO_SPAM", 1)
	PreGame.SetGameOption("GAMEOPTION_CAN_STACK_IN_CITY", 1)
	PreGame.SetGameOption("GAMEOPTION_CAN_ENTER_FOREIGN_CITY", 1)
	PreGame.SetGameOption("GAMEOPTION_REBASE_IN_FRIENDLY_CITY", 1)

	-- Options related to Lua code. Non-mandatory DLL options does not need to be defined here or before, setting them in the start-up screen is enough.
	if USE_CUSTOM_OPTION then
		Dprint("-------------------------------------")
		Dprint("Initialize Game Options ...")

		local savedData = Modding.OpenSaveData()
		
		-- City Revealed to all civs
		if(PreGame.GetGameOption("RevealCities") ~= nil) and (PreGame.GetGameOption("RevealCities") >  0) then
			REVEAL_ALL_CITIES = true
			Dprint("- RevealCities		-> ON")
		end
		if(PreGame.GetGameOption("RevealCities") ~= nil) and (PreGame.GetGameOption("RevealCities") == 0) then
			REVEAL_ALL_CITIES = false
			Dprint("- RevealCities		-> OFF")
		end
		
		-- AI control
		if(PreGame.GetGameOption("AIoverride") ~= nil) and (PreGame.GetGameOption("AIoverride") >  0) then
			ALLOW_AI_CONTROL = true
			Dprint("- AIoverride		-> ON")
		end
		if(PreGame.GetGameOption("AIoverride") ~= nil) and (PreGame.GetGameOption("AIoverride") == 0) then
			ALLOW_AI_CONTROL = false
			Dprint("- AIoverride		-> OFF")
		end

		-- Alternate History
		if(PreGame.GetGameOption("AlternateHistory") ~= nil) and (PreGame.GetGameOption("AlternateHistory") >  0) then
			ALLOW_ALTERNATE_HISTORY = true
			Dprint("- AlternateHistory	-> ON")
		end
		if(PreGame.GetGameOption("AlternateHistory") ~= nil) and (PreGame.GetGameOption("AlternateHistory") == 0) then
			ALLOW_ALTERNATE_HISTORY = false
			Dprint("- AlternateHistory	-> OFF")
		end
		
		-- No embarkation for the AI
		if(PreGame.GetGameOption("NoAIEmbarkation") ~= nil) and (PreGame.GetGameOption("NoAIEmbarkation") >  0) then
			NO_AI_EMBARKATION = true
			Dprint("- NoAIEmbarkation		-> ON")
		end
		if(PreGame.GetGameOption("NoAIEmbarkation") ~= nil) and (PreGame.GetGameOption("NoAIEmbarkation") == 0) then
			NO_AI_EMBARKATION = false
			Dprint("- NoAIEmbarkation		-> OFF")
		end
		
		-- Can only embark from harbor
		if(PreGame.GetGameOption("EmbarkFromHarbor") ~= nil) and (PreGame.GetGameOption("EmbarkFromHarbor") >  0) then
			EMBARK_FROM_HARBOR = true
			Dprint("- EmbarkFromHarbor	-> ON")
		end
		if(PreGame.GetGameOption("EmbarkFromHarbor") ~= nil) and (PreGame.GetGameOption("EmbarkFromHarbor") == 0) then
			EMBARK_FROM_HARBOR = false
			Dprint("- EmbarkFromHarbor	-> OFF")
		end
		
		-- Auto-saving at end of turn
		if(PreGame.GetGameOption("RedAutosave") ~= nil) and (PreGame.GetGameOption("RedAutosave") >  0) then
			RED_AUTOSAVE = true
			Dprint("- RedAutosave		-> ON")
		end
		if(PreGame.GetGameOption("RedAutosave") ~= nil) and (PreGame.GetGameOption("RedAutosave") == 0) then
			RED_AUTOSAVE = false
			Dprint("- RedAutosave		-> OFF")
		end
		
		-- Allow scripted events
		if(PreGame.GetGameOption("AllowScriptedevents") ~= nil) and (PreGame.GetGameOption("AllowScriptedevents") >  0) then
			ALLOW_SCRIPTED_EVENTS = true
			Dprint("- AllowScriptedevents	-> ON")
		end
		if(PreGame.GetGameOption("AllowScriptedevents") ~= nil) and (PreGame.GetGameOption("AllowScriptedevents") == 0) then
			ALLOW_SCRIPTED_EVENTS = false
			Dprint("- AllowScriptedevents	-> OFF")
		end
	end
end

function ShareGlobalTables()
	print("Sharing Global Tables...")
	g_ReinforcementData = share ("Reinforcement", g_ReinforcementData)
	g_Wounded			= share ("Wounded", g_Wounded)
end

function ValidateData()

	Dprint("-------------------------------------")
	Dprint("Validating UnitClasses table...")	
	if g_Unit_Classes then
		for class in GameInfo.UnitClasses() do
			if not g_Unit_Classes[class.ID] then
				Dprint("WARNING: ".. tostring(class.Type).." is not defined in g_Unit_Classes")			
			end			
		end
	else
		Dprint("ERROR: g_Unit_Classes does not exist")
	end
	
end
--------------------------------------------------------------
-- Projects Utils 
--------------------------------------------------------------

function GetTotalCombatXP(unitTypeID)
	local total = 0
	for key, data in pairs(g_UnitData) do
		if data.TypeID == unitTypeID then
			total = total + data.CombatXP
		end
	end
	return total
end

function IsProjectOfCiv(iProjectType, civID)
	local allowedTable = g_Major_Projects[civID]
	if (allowedTable) then
		for i, allowedType in pairs (allowedTable) do
			if (allowedType == iProjectType) then
				return true
			end
		end
	end
end

function IsProjectDone(iProjectType, civID)
	if g_ProjectsDone[iProjectType] and g_ProjectsDone[iProjectType][civID] then
		return true
	end
	return false
end

function MarkProjectDone(iProjectType, civID)
	g_ProjectsDone[iProjectType] = { [civID] = true}
end

function FinalizeNextPlayerProjects(CurrentPlayerID)
	Dprint ("-------------------------------------")
	Dprint ("Finalize projects of next player...")
	local bDebug = true
	local playerID = GetNextMajorPlayerID(CurrentPlayerID)
	local player = Players[playerID]
	if player then
		for city in player:Cities() do
			local projectID = city:GetProductionProject()
			if projectID ~= -1 then
				local projectInfo = GameInfo.Projects[projectID]
				local str = Locale.ConvertTextKey( projectInfo.Description )
				Dprint (" - " .. city:GetName() .. " is building project : " .. str, bDebug)
				local turnLeft = city:GetProjectProductionTurnsLeft( projectID )
				Dprint ("     - Turn(s) left = " .. turnLeft, bDebug)
				if turnLeft < 2 then
					Dprint ("     - Removing project from build list and mark it as done...", bDebug)
					city:PopOrder()
					local civID = GetCivIDFromPlayerID(playerID)
					MarkProjectDone(projectID, civID)
					-- todo : alert all player for some projects only...
					if g_ProjectsTable[projectID].TopSecret then
						player:AddNotification(NotificationTypes.NOTIFICATION_PROJECT_COMPLETED, str .. " is finished", "Project done !", city:GetX(), city:GetY(), projectID, playerID)
					else
						BroadcastNotification(NotificationTypes.NOTIFICATION_PROJECT_COMPLETED, str .. " is finished", "Project done !", city:GetX(), city:GetY(), projectID, playerID )
					end
				end
			end
		end
	else
		Dprint (" - WARNING ! next player is nil for FinalizeNextPlayerProjects...")
	end
end

--------------------------------------------------------------
-- Redox Rebase Function 
--------------------------------------------------------------

function CalculatePathNodes(plot1, plot2, range, playerID)
	local player=Players[playerID];
	
	local x1=plot1:GetX();  local y1=plot1:GetY(); 
	local x2=plot2:GetX();  local y2=plot2:GetY(); 

	local closestU=-1;
	local source=-1;
	local target=-1;
	local fail=true;
	
	local Node={};
	local Prev={};
	local NodeCoordContainer={};
	
	local numCities=player:GetNumCities();
	for i = 0, numCities - 1, 1 do
		local city = player:GetCityByID( i );
		if (city) then
			--Node[ii]=nil;
		--else
			ii=i+1;
			Prev[ii]=-1;

			Node[ii]={};				NodeCoordContainer[ii]={};
			Node[ii].x=city:GetX();		NodeCoordContainer[ii].x=Node[ii].x;
			Node[ii].y=city:GetY();		NodeCoordContainer[ii].y=Node[ii].y;
			Node[ii].dist=2000;
		
			if(Node[ii].x==x1 and Node[ii].y==y1) then
				Node[ii].dist=0;	--this is "source", starting point
				source=ii;
			end
		
			if(Node[ii].x==x2 and Node[ii].y==y2) then
				target=ii;			--this is "target", final city
			end
		end
	end
	
	if(source==-1) then --source is not a city. Create a node manually
		source=0;
		Prev[source]=-1;
		
		Node[source]={};		NodeCoordContainer[source]={};
		Node[source].x=x1;		NodeCoordContainer[source].x=x1;
		Node[source].y=y1;		NodeCoordContainer[source].y=y1;
		Node[source].dist=0;
	end
	
	
	if(target==-1) then --target is not a city. Create a node manually
		target=numCities+1;
		Prev[target]=-1;
		
		Node[target]={};		NodeCoordContainer[target]={};
		Node[target].x=x2;		NodeCoordContainer[target].x=x2;
		Node[target].y=y2;		NodeCoordContainer[target].y=y2;
		Node[target].dist=2000;
	end
	
	
	closestU=source;	
	while true do
	
		dist_u = Node[closestU].dist;		
	
		if(dist_u > 1000) then break; end;	--no path exists
		
		if(closestU==target) then 	--success, shortest path found!
			fail=false; 
			break; 
		end;
		
		local adjList, closestNode = ListAdjacentNodes(Node, closestU, range);
			
		local newU=closestNode;
		local newUdist=Node[closestNode].dist;
		for i, tmp in pairs(adjList) do
			local alt = Node[closestU].dist + 1;	-- distance to all adjacent nodes is 1 (1 turn)
			if(alt < Node[i].dist) then
				Node[i].dist = alt;
				Prev[i] = closestU;
			end
			if(Node[i].dist < newUdist) then
				newUdist = Node[i].dist;
				newU = i;
			end
		end
			
		Node[closestU]=nil;
		closestU = newU;
	
	end

	local nodePath={};
	local coordPath={};
	if(not fail) then
		--nodePath is populated in reverse direction, from the target to source (with source missing)
		local i = target;
		local cnt=1;
		while i~=source do
			nodePath[cnt] = i;
			
			local nodeCoord=NodeCoordContainer[i];
			coordPath[cnt] = {nodeCoord.x, nodeCoord.y};
			
			i = Prev[i];
			cnt=cnt+1;
		end
	end		

	return (not fail), coordPath;
end

function ListAdjacentNodes(Node, u, range)
	local adjList={};
	local closestNode=-1;
	local closestDist=4000;
	for i, v in pairs(Node) do
		if(i~=u) then
			local thisVectX=Node[u].x-Node[i].x;
			local thisVectY=Node[u].y-Node[i].y;
			--thisDist=math.sqrt(thisVectX * thisVectX + thisVectY * thisVectY);
			thisDist=Map.PlotDistance(Node[u].x, Node[u].y, Node[i].x, Node[i].y);
			if(thisDist <= range) then
				adjList[i]=true;
			end
			if(Node[i].dist < closestDist) then	--this distance is unrelated to physical hexes distance, it's number of turns to reach the node
				closestDist=Node[i].dist;
				closestNode=i;
			end
		end
	end
	return adjList, closestNode;
end


--------------------------------------------------------------
-- W.I.P.
--------------------------------------------------------------

function TurnToMonth()
	local bDebug = true
	local turn = Game.GetGameTurn()
	local month = 0
	if g_Calendar[turn] then
		local turnDate = tostring(g_Calendar[turn].Number)
		month = tonumber(string.sub(turnDate, 5, 6))
	end
	Dprint ("   - exctracting month = " .. month .. " from date = " .. turnDate, bDebug)
	return month
end


function GetNextMajorPlayerID(playerID)
	if playerID > GameDefines.MAX_MAJOR_CIVS then
		return -1
	end  
	local nextPlayerID = playerID + 1;
	for iPlayerLoop = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do		
		if (nextPlayerID >= GameDefines.MAX_MAJOR_CIVS) then
			nextPlayerID = 0
		end 
		local player = Players[nextPlayerID]
		if (playerID ~= nextPlayerID and player:IsAlive()) then
			return nextPlayerID
		end
		nextPlayerID = nextPlayerID + 1
	end
	return -1
end

function BroadcastNotification(type, text, title, x, y, id1, id2)
	for playerID = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
		local player = Players[playerID]
		if player and player:IsAlive() then
			player:AddNotification(type, text, title, x, y, id1, id2)
		end
	end
end

-- deprecated
function SaveAfterActivePlayer(playerID)
	local bDebug = true
	if playerID == GetNextMajorPlayerID(Game.GetActivePlayer()) then -- save at the immediate start of the next player turn...
		REDAutoSave()
	end
end
-- GameEvents.PlayerDoTurn.Add(SaveAfterActivePlayer) at game init

function GetHandicapForRED(player)
	local bDebug = false
	local handicap = 0
	if player:IsHuman() then
		handicap = player:GetHandicapType() -- assuming higher handicap type means higher difficulty level...
	else
		handicap = RED_AI_HANDICAP
	end	
	Dprint ("GetHandicapForRED() return for " .. player:GetName() .. " is ".. handicap, bDebug)
	return handicap
end


function PauseGame(sec)
	if not sec or sec < 1 then
		return
	end
	Dprint("Call pause for "..sec.." second(s)")
	Game.SetPausePlayer(Game.GetActivePlayer())
	local StartTime = os.clock()

	while os.clock() < StartTime + sec do
		-- empty loop
	end
	Game.SetPausePlayer(-1)
end

PLOTSIZE = 70
ZOOM = 500
function PlaceCameraAtPlot(plot) -- nop, don't work, placement value (x,y) not relative to plotsize...
	local mapX, mapY = Map.GetGridSize()
	local centerX = math.max(Round(mapX/2)-1,0)
	local centerY = math.max(Round(mapY/2)-1,0)
	local cameraX = (plot:GetX() - centerX) * PLOTSIZE
	local cameraY = (plot:GetY() - centerY) * PLOTSIZE
	Dprint("mapX="..mapX)
	Dprint("mapY="..mapY)
	Dprint("centerX="..centerX)
	Dprint("centerY="..centerY)
	Dprint("cameraX="..cameraX)
	Dprint("cameraY="..cameraY)
	Events.SerialEventCameraSetCenterAndZoom(Vector3(cameraX,cameraY,ZOOM))
end

function IsActivePlayerTurnInitialised()
	local turn = Game.GetGameTurn()
	local str = "player"..tostring(Game.GetActivePlayer()).."_turn"..turn
	local init = LoadData(str)
	Dprint("Check Active Player Turn = " .. tostring(str) .. ", value is " .. tostring(init), bDebug)
	return (init and init == 1)
end


function InitializeActivePlayerTurn()
	local bDebug = true
	local turn = Game.GetGameTurn()
	local str = "player"..tostring(Game.GetActivePlayer()).."_turn"..turn
	Dprint("Initialize Active Player Turn = " .. str, bDebug)
	SaveData( str, 1 )
end

function ShowPlayerInfo(playerID)
	local player = Players[playerID]
	if (player:IsMinorCiv() or player:IsBarbarian()) and STFU then
		PRINT_DEBUG = false
	else
		PRINT_DEBUG = true		
	end
	Dprint(" " )
	Dprint("++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++")
	Dprint("+++++++++++++++++++++++++++++++++++++++++++++++++++++ Start active turn for " .. Locale.ToUpper(player:GetCivilizationShortDescription()) .. " +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++")
	Dprint("++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++")
end


function IsOperationLaunched(iOperation)
	local savedData = Modding.OpenSaveData()
	local saveStr = "Operation-"..iOperation
	local triggered = savedData.GetValue(saveStr)
	if triggered == 1 then
		return true
	end
	return false
end

--[[
ToHexFromGrid( Vector2( city:GetX(), city:GetY() ) )
Events.SerialEventCityCreated(Vector2 vHexPos, PlayerID player, CityID cityID, ArtStyleType artStyleType, EraType eraType, int continent, int populationSize, int size, int fogState)


Events.SerialEventCityCreated(ToHexFromGrid( Vector2( x, y ) ), 0, NULL, GameInfoTypes.ARTSTYLE_ASIAN, GameInfoTypes.ERA_ANCIENT, NULL, 1, 1, 2)

			if (pPlot:GetVisibilityCount() > 0) then
				pPlot:ChangeVisibilityCount(team, -1, -1, true, true);
			end
			pPlot:SetRevealed(team, false);

--]]

function CreateFakeCity(x,y, playerID, artStyleType, eraType, size, name )
	local vHexPos = ToHexFromGrid( Vector2( x,y ) )
	local plot = GetPlot(x,y)
	local visibility = plot:GetVisibilityCount(Players[Game.GetActivePlayer()]:GetTeam())
	Events.SerialEventCityCreated(ToHexFromGrid( Vector2( x, y ) ), playerID, NULL, artStyleType, eraType, NULL, 1, size, 2) -- todo: dynamic fogstate

end

function SetVisibility(playerID, x, y, visibility) -- DLL is broken, see ChangeVisibilityCount for Lua converting to boolean what should be an integer...
	local player = Players[playerID]
	local plot = GetPlot(x,y)
	plot:ChangeVisibilityCount(player:GetTeam(), -plot:GetVisibilityCount(player:GetTeam()) + num, -1, true, false)
end