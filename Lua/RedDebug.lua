-- Debug
-- Author: Gedemon
-- DateCreated: 1/30/2011
--------------------------------------------------------------


print("Loading Red Debug Functions...")
print("-------------------------------------")

-- list object attribute
function ListAttrib(object)
	print("Attributes:")
	for k, v in pairs(getmetatable(object).__index) do print(k) end
	print("End attributes.");
end

-- Add to event to get parameters
function Listen(...)
	print ("")
	print ("Listen called...")
	print(unpack({...}))
	print ("")
end

-- list all civs
function ListAllCivs()
	print ("+++++++++++++++++++")
	print ("---- civ list -----")
	for iPlayer = 0, GameDefines.MAX_PLAYERS do
		local player = Players[iPlayer]
		if player ~= nil then
			local str = "- " .. iPlayer .. " - "
			if player:IsMinorCiv() then
				local minorCivType = player:GetMinorCivType();
				local civInfo = GameInfo.MinorCivilizations[minorCivType];
				local minorName = Locale.ConvertTextKey( civInfo.Description ) 
				str = str .. "Minor civ " .. minorName .. " (" .. minorCivType ..") - "
			else
				local majorCivType = player:GetCivilizationType();
				local civInfo = GameInfo.Civilizations[majorCivType]
				local majorName = Locale.ConvertTextKey( civInfo.Description )  
				str = str .. "Major civ " .. majorName .. " (" .. majorCivType ..") - "
			end
			if player:IsAlive() then
				str = str .. " alive - "
			end
			print (str)
		end
	end
	print ("+++++++++++++++++++")
end

-- show culture map (unused)
function ShowCultureMap()
	Dprint ("-------------")
	Dprint ("Culture Map :")
	result = RedQuery ("SELECT * FROM CultureMap")
	for i, row in ipairs(result) do
		print (unpack(row))
	end
	Dprint ("-------------")
end

-- show Territory Map
function ShowTerritoryMap()
	local territoryMap = LoadTerritoryMap()
	Dprint("Original Territory map :")
	Dprint("-------------------------------------")
	for key, owner in pairs (territoryMap) do
		Dprint(" (" .. key .. ") : player(" .. owner.PlayerID .. "),  civilization (" .. owner.CivID .. "), type (" .. owner.Type .. ")") 
	end
	Dprint("-------------------------------------")
end

-- show first supply line found
-- use Events.ClearHexHighlights() to clear highlight
function ShowSupplyLine (playerID, unitID)
	CanGetSupply (playerID, unitID, true )
end

-- show Calendar
function ShowCalendar()
	Dprint("Calendar :")
	Dprint("-------------------------------------")
	for turn, date in pairs (g_Calendar) do
		Dprint(" turn [ " .. turn .. " ] = " .. date.Text ) 
	end
	Dprint("-------------------------------------")
end

-- show unit data
function ShowUnitData()
	--[[
	local unitData = MapModData.RED.UnitData
	Dprint("Unit Data Table (loaded) :")
	Dprint("-------------------------------------")
	for id, values in pairs (unitData) do
		Dprint(" [" .. id .. "]  builder: " .. Players[ values.BuilderID ]:GetName() .. ", owner: " .. Players[ values.OwnerID ]:GetName() .. ", type: " .. values.Type .. ", Num. count type = " .. values.NumType)
		local totalHP = values.Personnel + values.Materiel
		Dprint("         moral = " .. values.Moral .. "/100, personnel = ".. values.Personnel .. "/".. values.MaxPersonnel ..", materiel = ".. values.Materiel .. "/".. values.MaxMateriel ..", Total = " .. totalHP .."/"..values.MaxHP)
	end
	Dprint("-------------------------------------")
	--]]

	local unitData = MapModData.RED.UnitData
	Dprint("Unit Data Table (Global) :")
	for id, values in pairs (unitData) do
		Dprint("-------------------------------------")
		strAlive = "DEAD/NIL"
		if values.Alive then strAlive = "ALIVE" end
		Dprint(" [" .. id .. "]  Unique ID = ".. values.UniqueID ..", builder: " .. Locale.ToUpper(Players[ values.BuilderID ]:GetCivilizationShortDescription()) .. ", owner: " .. Locale.ToUpper(Players[ values.OwnerID ]:GetCivilizationShortDescription()) .. ", type: " .. values.Type .. ", Num. count type = " .. values.NumType)
		local totalHP = values.Personnel + values.Materiel
		Dprint(" alive = " .. strAlive .. ", combatXP = " .. values.CombatXP ..", moral = " .. values.Moral .. "/100, personnel = ".. values.Personnel .. "/".. values.MaxPersonnel ..", materiel = ".. values.Materiel .. "/".. values.MaxMateriel ..", Total = " .. totalHP .."/"..values.MaxHP)
	end
	Dprint("-------------------------------------")
end

function ShowFullUnitData()
	local unitData = MapModData.RED.UnitData
	Dprint("Unit Data Table (Global) :")
	for id, values in pairs (unitData) do		
		print("-----------------")
		print (" ID = " .. id)
		for k, v in pairs(values) do
			print(k, v, "Type = " .. type( v ))
		end	
	end
	Dprint("-------------------------------------")
end

-- show Availables units for Major Civs
function ShowMajorUnits()
	Dprint("Unit for major civs table :")
	Dprint("-------------------------------------")
	for id, datas in pairs (g_Major_Units) do
		Dprint("-----------------")
		Dprint(" Civilization [" .. id .. "]")
		for n, value in ipairs (datas) do
			Dprint("   - UnitID [" .. value .. "] : " .. GameInfo["Units"][value]["Type"] )
		end
	end
	Dprint("-------------------------------------")


end

-- show reinforcement data
function ShowResourceData()
	local resourceData = MapModData.RED.ResourceData
	Dprint("Resource Data Table (loaded) :")
	Dprint("-------------------------------------")
	for id, values in pairs (resourceData) do
		Dprint(Players [ id ]:GetName() .. " (id=" .. id.. ")  personnel = ".. values.Personnel .. "/".. values.MaxPersonnel ..", materiel = ".. values.Materiel .. "/".. values.MaxMateriel ..", Flux = " .. values.FluxPersonnel .." pers., "..values.FluxMateriel .. " mat.")
	end
	Dprint("-------------------------------------")	

end


-- show track combats data
function ShowTrackCombats()
	Dprint("TrackAllCombats Data Table (global) :")
	Dprint("-------------------------------------")
	for turn, data in pairs (g_TrackCombats) do
		Dprint("Turn = ".. turn)
		for k, v in pairs(data) do
			print("		" .. k, v)
			for kk, vv in pairs(v) do
				print("			"..kk, vv)
				for kkk, vvv in pairs(vv) do
					print("				"..kkk, vvv)
				end
			end
		end
	end
	Dprint("-------------------------------------")

end

-- test give all visibility to AI
function AllVisible()
	local pPlot, iTeam;

	for iPlotLoop = 0, Map.GetNumPlots()-1, 1 do
	   pPlot = Map.GetPlotByIndex(iPlotLoop);

	   	for playerID = 0, GameDefines.MAX_CIV_PLAYERS - 1 do

			local player = Players[playerID]
			if (player:IsAlive()) then -- and not player:IsHuman()
				iTeam = player:GetTeam()

				if (pPlot:GetVisibilityCount(iTeam) > 0) then
					pPlot:ChangeVisibilityCount(iTeam, -1, -1, true);
				end

				pPlot:SetRevealed(iTeam, false);
				pPlot:ChangeVisibilityCount(iTeam, 1, -1, true);
				pPlot:SetRevealed(iTeam, true);
			end
		end
	end
end

-- return city list as defined lua table
function CityList()
	local pPlot;
	local list = {}
	for iPlotLoop = 0, Map.GetNumPlots()-1, 1 do
		pPlot = Map.GetPlotByIndex(iPlotLoop);
		if pPlot:IsCity() then
			local city = pPlot:GetPlotCity()
			local player = Players[city:GetOwner()]
			table.insert(list, {Player = city:GetOwner(), Civilization = player:GetCivilizationShortDescription(), X= city:GetX(), Y = city:GetY(), Name = city:GetName() })
		end
	end
	table.sort(list, function(a,b) return a.Player<b.Player end)
	local curCiv =""
	Dprint ("")
	Dprint ("City List")
	Dprint ("g_Cities = {")
	for i, data in ipairs(list) do
		if curCiv ~= data.Civilization then Dprint("	-- " .. Locale.ToUpper(data.Civilization)) end
		Dprint("	{X = "..data.X..", Y = "..data.Y..", }, -- " .. Locale.ToUpper(data.Name))
		curCiv = data.Civilization
	end
	Dprint "}"
	Dprint ("")
end


-- test unit moves
function Puppet(playerID, unitID, x, y, missionType, missionAItype)
	local player = Players [ playerID ]
	local unit = player:GetUnitByID( unitID )
	local plot = unit:GetPlot()
	unit:SetMoves(2*MOVE_DENOMINATOR)
	unit:PopMission()
	unit:PushMission(missionType, x, y, 0, 0, 1, missionAItype, plot, unit)
end

-- u = UI.GetHeadSelectedUnit()

-- if need to update unit data in midgame after added/changed a row.
-- of course the update must be what's changed here...
function UpdateUnitData()
	for key, values in pairs (MapModData.RED.UnitData) do
		if values.UnitId and not values.UnitID then MapModData.RED.UnitData[key].UnitID = values.UnitId end
		if not values.Alive then MapModData.RED.UnitData[key].Alive = true end
		if not values.UniqueID then MapModData.RED.UnitData[key].UniqueID = values.UnitID.."-".. values.BuilderID .."-"..os.clock() end
	end
end

-- show set interceptor
function ShowInterceptors()
	Dprint("Interceptors table :")
	Dprint("-------------------------------------")
	for i, datas in ipairs (g_AI_Interceptors) do
		Dprint("-----------------")
		Dprint(" Unit Key	[" .. datas.Key .. "]")	
	end
	Dprint("-------------------------------------")
end

function HotTest(playerID)
	Game.SetActivePlayer( playerID, true )
end
--GameEvents.PlayerDoTurn.Add(HotTest)

-- show project data
function ShowProjectTables()
	Dprint("Projects Tables :")
	Dprint("-------------------------------------")
	for civID, projects in pairs (g_Major_Projects) do
		for i, projectID in pairs (projects) do
			if projectID then
				Dprint("Testing ProjectID = " .. projectID .. " of CivID = ".. civID)
				local projectData = g_ProjectsTable[projectID]
				if projectData then
					Dprint("  - checked !")
				else
					Dprint("  - WARNING ! nil entry in g_ProjectsTable for projectID = ".. projectID ..", entry n°  ".. i .. ", of CivID = " .. civID)	

				end
			else
				Dprint("WARNING ! nil project in g_Major_Projects for entry n°  ".. i .. ", of CivID = " .. civID)				
			end
		end
	end
	Dprint("-------------------------------------")

end

function ShowPlayerTrainingRestriction(iPlayer)
	local player = Players[iPlayer]
	if player:IsMinorCiv() then
		return
	end
	Dprint("---------------------------------------------------------------------------------------------------------------")
	Dprint("Units restrictions for " .. tostring(player:GetName()) )
	Dprint("---------------------------------------------------------------------------------------------------------------")	
	Dprint("Total num. of units :	" .. tostring(player:GetNumUnits()) )
	Dprint("Max number of units :	" .. tostring(player:GetNumUnitsSupplied()) )
	Dprint("Supernumerary units :	" .. tostring(player:GetNumUnitsOutOfSupply()) )
	Dprint("Production Modifier :	" .. tostring(player:GetUnitProductionMaintenanceMod()) .."%" )
	Dprint("-------------------------------------")
	for unitInfo in GameInfo.Units() do
		local iUnitType = unitInfo.ID
		local name = Locale.ConvertTextKey( unitInfo.Description )

		local civID = GetCivIDFromPlayerID(iPlayer)
		local civType = GetCivTypeFromPlayerID(iPlayer)

		local line1 = "id = " .. iUnitType .. ", name = " .. name
		local line2 = "restriction = "
		local bShow = true
		local bTest = true

		local condition = "UnitType = '" .. unitInfo.Type .. "'"
		for row in GameInfo.Civilization_UnitClassOverrides( condition ) do
			if row.CivilizationType ~= civType then
				bShow = false -- not for this civ...
				bTest = false
			end
		end		

		if bTest then
			local aliveUnitType = CountUnitTypeAlive (iUnitType, iPlayer)
			line1 = line1 .. ", num alive = "..aliveUnitType
			CachePlayerTrainingRestriction(iPlayer, iUnitType) -- g_UnitRestrictionString is set here
		end

		-- allowed unit ?
		local allowedTable = g_Major_Units[civID]
		if (allowedTable) then
			local bAllow = false
			for i, allowedType in pairs (allowedTable) do
				if (allowedType == iUnitType) then
					bAllow = true
				end
			end
			if not bAllow then
				line2 = line2 .. "Not in allowed table, "
				bShow = false
			end
		end

		if bShow then
			Dprint(line1)
			Dprint(line2 .. g_UnitRestrictionString)
			Dprint("-------------------------------------")
		end
	end
end

function ShowAITrainingRestriction(iPlayer)
	if not DEBUG_AI_BUILD then
		return
	end
	local player = Players[iPlayer]
	if player:IsAlive() and (not player:IsBarbarian()) and (not player:IsHuman()) then -- and (not player:IsMinorCiv()) 
		ShowPlayerTrainingRestriction(iPlayer)
	end
end
--GameEvents.PlayerDoTurn.Add(ShowAITrainingRestriction)

function ListCitiesBuild(iPlayer)
	if not DEBUG_AI_BUILD then
		return
	end
	local player = Players[iPlayer]
	if player:IsAlive() and  (not player:IsBarbarian()) and (not player:IsHuman()) then --(not player:IsMinorCiv()) and
		print()
		print ("----------------------------------------------------------- ")
		print ("- Listing current cities build for " .. tostring(player:GetName()))
		for city in player:Cities() do	
			print ("  - " .. tostring(city:GetName()) .. " : " .. Locale.ConvertTextKey(city:GetProductionNameKey()) )
		end
	end

end
--GameEvents.PlayerDoTurn.Add(ShowAITrainingRestriction)

function ClearUnitMission()
	for playerID = 0, GameDefines.MAX_CIV_PLAYERS - 1 do
		local player = Players[playerID]
		if player and player:IsAlive() then
			for unit in player:Units() do				
				local unitKey = GetUnitKey(unit)
				if MapModData.RED.UnitData[unitKey] and not (unit:GetUnitType() == CONVOY) then
					MapModData.RED.UnitData[unitKey].OrderType = nil
					MapModData.RED.UnitData[unitKey].OrderReference = nil
					MapModData.RED.UnitData[unitKey].OrderObjective = nil
				end
			end
		end
	end
end

function ListUnitMoves(SpecificPlayerID)
	local bOnce
	if SpecificPlayerID then
		bOnce = true
	end
	for playerID = 0, GameDefines.MAX_CIV_PLAYERS - 1 do
		local player = Players[playerID]
		
		if SpecificPlayerID then
			player = Players[SpecificPlayerID]
		end
		if player and player:IsAlive() then
		
			Dprint("---------------------------------------------------------------------------------------------------------------")
			Dprint("Units with moves left for " .. player:GetName() )
			Dprint("---------------------------------------------------------------------------------------------------------------")
			for unit in player:Units() do				
				local unitKey = GetUnitKey(unit)
				--[[
				if MapModData.RED.UnitData[unitKey] and not (unit:GetUnitType() == CONVOY) then
					MapModData.RED.UnitData[unitKey].OrderType = nil
					MapModData.RED.UnitData[unitKey].OrderReference = nil
					MapModData.RED.UnitData[unitKey].OrderObjective = nil
				end --]]
				if unit:GetMoves() > 0 then				
					Dprint(unit:GetName() .. " moves left = " .. unit:GetMoves() )
				end
			end
		end
		if bOnce then -- called for specific player only
			return
		end
	end
end

function SkipUnitsTurn(PlayerID)

	local player = Players[playerID]

	if player and player:IsAlive() then
		
		Dprint("---------------------------------------------------------------------------------------------------------------")
		Dprint("Skip all Units turn for " .. player:GetName() )
		Dprint("---------------------------------------------------------------------------------------------------------------")
		for unit in player:Units() do				
			local unitKey = GetUnitKey(unit)
			--[[
			if MapModData.RED.UnitData[unitKey] and not (unit:GetUnitType() == CONVOY) then
				MapModData.RED.UnitData[unitKey].OrderType = nil
				MapModData.RED.UnitData[unitKey].OrderReference = nil
				MapModData.RED.UnitData[unitKey].OrderObjective = nil
			end --]]
			--if unit:GetMoves() > 0 then
				unit:PopMission()
				unit:PushMission(MissionTypes.MISSION_SKIP, unit:GetX(), unit:GetY(), 0, 0, 1, MissionTypes.MISSION_SKIP, unit:GetPlot(), unit)
			--end
		end

	end
end

-- show ShowCombatLog
function ShowCombatLog()
	Dprint ("-------------")
	Dprint ("Combat Log :")
	Dprint ("-------------")
	for i, data in ipairs(MapModData.RED.CombatsLog) do		
		for k, v in pairs(data) do
			print(k, v, "Type = " .. type( v ))
		end		
		Dprint ("-------------")
	end
	Dprint ("-------------")
end

-- show ShowCombatLog
function ShowAnyGlobal(table)
	Dprint ("-------------")
	Dprint ("Global :")
	Dprint ("-------------")
	for i, data in ipairs(table) do		
		for k, v in pairs(data) do
			print(k, v, "Type = " .. type( v ))
		end		
		Dprint ("-------------")
	end
	Dprint ("-------------")
end

-- Hide/Show HUD for screenshot...
function HideHUD(bValue)
	ContextPtr:LookUpControl("/InGame/TopPanel/"):SetHide(bValue)
	ContextPtr:LookUpControl("/InGame/WorldView/DiploCorner"):SetHide(bValue)
	ContextPtr:LookUpControl("/InGame/WorldView/ActionInfoPanel"):SetHide(bValue)
	ContextPtr:LookUpControl("/InGame/WorldView/UnitPanel"):SetHide(bValue)
	ContextPtr:LookUpControl("/InGame/WorldView/InfoCorner"):SetHide(bValue)
	ContextPtr:LookUpControl("/InGame/PlotHelpManager"):SetHide(bValue)
	ContextPtr:LookUpControl("/InGame/WorldView/PlotHelpText"):SetHide(bValue)
	ContextPtr:LookUpControl("/InGame/WorldView/MiniMapPanel"):SetHide(bValue)
	ContextPtr:LookUpControl("/InGame/UnitFlagManager"):SetHide(bValue)
end 

function CheckUnitData()
	print ("------------------------------------------------------")
	print ("- CheckUnitData:")
	print ("------------------------------------------------------")
	for iPlayer = 0, GameDefines.MAX_PLAYERS-1 do
		local player = Players[iPlayer]
		if player ~= nil and player:IsAlive() then
			print ("Player : " .. tostring(player:GetName()))
			print ("---------------------------")
			for unit in player:Units() do
				local unitKey = GetUnitKey(unit)
				if unitKey   then
					print("unitKey = " .. unitKey)	
					print("Name = " .. tostring(unit:GetName()))
					print("Turn created = ".. tostring(unit:GetGameTurnCreated()))				
					if MapModData.RED.UnitData[unitKey]  then
						print("unitData[unitKey]")						
						if MapModData.RED.UnitData[unitKey].OrderType then
							print("unitData[unitKey].OrderType = " .. MapModData.RED.UnitData[unitKey].OrderType)							
							if unit:GetUnitType() == CONVOY and MapModData.RED.UnitData[unitKey].OrderType == RED_CONVOY then
								print("Unit is convoy with order type 'RED_CONVOY'")
							else
								print("ERROR : convoy without unitData[unitKey].OrderType == RED_CONVOY")
							end 
						else
							print("unitData[unitKey].OrderType = Nil")
						end 
					else
						print("ERROR : no unitData[unitKey]")
						print("Forcing Registration NOW...")
						RegisterNewUnit(iPlayer, unit)
						MapModData.RED.UnitData[unitKey].TurnCreated = unit:GetGameTurnCreated()
					end 
				else
					print("ERROR : no unitKey")
				end 				
				print ("---------------------------")
			end			
			print ("------------------------------------------------------")
		end
	end
	SaveData("Unit", MapModData.RED.UnitData, UNIT_SAVE_SLOT)
end

-- Debug DLL event
function DLL_Debug(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10)
	if PRINT_DLL_DEBUG then
		print ("- DLL Debug:")
		print (arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10)
		print ("-----------")
	end
end
--GameEvents.DLL_Debug.Add( DLL_Debug )

-- C++ code below
--[[

	// RED <<<<<
	ICvEngineScriptSystem1* pkScriptSystem = gDLL->GetScriptSystem();
	if(pkScriptSystem)
	{	
		CvLuaArgsHandle args;
		const char* str = "text";
		args->Push(str,strlen ( str ));

		bool bResult;
		LuaSupport::CallHook(pkScriptSystem, "DLL_Debug", args.get(), bResult);
	}
	// RED >>>>>


--]]