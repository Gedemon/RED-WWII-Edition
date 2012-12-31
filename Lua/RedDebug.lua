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
	local unitData = LoadUnitData()
	Dprint("Unit Data Table (loaded) :")
	Dprint("-------------------------------------")
	for id, values in pairs (unitData) do
		Dprint(" [" .. id .. "]  builder: " .. Players[ values.BuilderID ]:GetName() .. ", owner: " .. Players[ values.OwnerID ]:GetName() .. ", type: " .. values.Type .. ", Num. count type = " .. values.NumType)
		local totalHP = values.Personnel + values.Materiel
		Dprint("         moral = " .. values.Moral .. "/100, personnel = ".. values.Personnel .. "/".. values.MaxPersonnel ..", materiel = ".. values.Materiel .. "/".. values.MaxMateriel ..", Total = " .. totalHP .."/"..values.MaxHP)
	end
	Dprint("-------------------------------------")
	--]]

	local unitData = g_UnitData
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
	local unitData = g_UnitData
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

-- show unit classes
function ShowUnitClasses()
	Dprint("Unit Classes table :")
	Dprint("-------------------------------------")
	for id, values in pairs (g_Unit_Classes) do
		local str = ""
		if values.Capture then str = "true"; else str = "false"; end
		Dprint(" [" .. id .. "]  - Capture tile: " .. str .. ", Moral: " .. values.Moral .. ", Num. count type = " .. values.NumType.. ", MaterielRatio = " .. values.MaterielRatio)
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
function ShowReinforcementData()
	local reinforcementData = LoadReinforcementData()
	Dprint("Reinforcement Data Table (loaded) :")
	Dprint("-------------------------------------")
	for id, values in pairs (reinforcementData) do
		Dprint(Players [ id ]:GetName() .. " (id=" .. id.. ")  personnel = ".. values.Personnel .. "/".. values.MaxPersonnel ..", materiel = ".. values.Materiel .. "/".. values.MaxMateriel ..", Flux = " .. values.FluxPersonnel .." pers., "..values.FluxMateriel .. " mat.")
	end
	Dprint("-------------------------------------")
	
	local reinforcementData = g_ReinforcementData
	Dprint("Reinforcement Data Table (global) :")
	Dprint("-------------------------------------")
	for id, values in pairs (reinforcementData) do
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
	for key, values in pairs (g_UnitData) do
		if values.UnitId and not values.UnitID then g_UnitData[key].UnitID = values.UnitId end
		if not values.Alive then g_UnitData[key].Alive = true end
		if not values.UniqueID then g_UnitData[key].UniqueID = values.UnitID.."-".. values.BuilderID .."-"..os.clock() end
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
	Dprint("---------------------------------------------------------------------------------------------------------------")
	Dprint("Units restrictions for " .. player:GetName() )
	Dprint("---------------------------------------------------------------------------------------------------------------")
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
			PlayerTrainingRestriction(iPlayer, iUnitType)
		end

		--[[
		-- restrictions based on numbers

		if bTest and g_Unit_Classes[unitClass] then -- bugfix : some unused classes are not defined (Settler, Worker...), just don't test them...

			-- restriction ratio for AI player
			if not player:IsBarbarian() then
				local totalUnits = player:GetNumMilitaryUnits()
				local aliveUnitClass = CountUnitClassAlive (unitClass, iPlayer)
				local aliveUnitSubClass = CountUnitSubClassAlive (unitClass, iPlayer)
				local aliveArmor = CountArmorAlive (unitClass, iPlayer)
				local aliveUnitType = CountUnitTypeAlive (iUnitType, iPlayer)
				local land, sea, air = CountDomainUnits (iPlayer)
				line1 = line1 .. ", num alive = "..aliveUnitType

				-- Class restriction
				if g_Combat_Type_Ratio then -- scenario may not use this
					-- Air restriction
					if GameInfo.Units[iUnitType].Domain == "DOMAIN_AIR" then
						if (air > 0) and (totalUnits/air < g_Combat_Type_Ratio[civID].Air) then
							-- false
							line2 = line2 .. "Air restriction ("..totalUnits.."/"..air .."<".. g_Combat_Type_Ratio[civID].Air.."), "
						else
							line2 = line2 .. "Air OK ("..totalUnits.."/"..air .."<".. g_Combat_Type_Ratio[civID].Air.."), "
						end
					end
					-- Sea restriction
					if GameInfo.Units[iUnitType].Domain == "DOMAIN_SEA" then
						if (sea > 0) and (totalUnits/sea < g_Combat_Type_Ratio[civID].Sea) then
							-- false
							line2 = line2 .. "Sea restriction ("..totalUnits.."/"..sea .."<".. g_Combat_Type_Ratio[civID].Sea.."), "
						else
							line2 = line2 .. "Sea OK ("..totalUnits.."/"..sea .."<".. g_Combat_Type_Ratio[civID].Sea.."), "
						end
					end
					-- no land restriction...

					-- Armor restriction
					if IsArmorClass(g_Unit_Classes[unitClass].NumType) then
						if (aliveArmor > 0) and (land/aliveArmor < g_Combat_Type_Ratio[civID].Armor) then
							-- false
							line2 = line2 .. "Global Armor restriction (".. land.."/"..aliveArmor .."<".. g_Combat_Type_Ratio[civID].Armor .."), "
						else
							line2 = line2 .. "Global Armor OK (".. land.."/"..aliveArmor .."<".. g_Combat_Type_Ratio[civID].Armor .."), "
						end

						if g_Max_Armor_SubClass_Percent and g_Max_Armor_SubClass_Percent[civID] then
							local armorType = g_Unit_Classes[unitClass].NumType
							local maxPercent = g_Max_Armor_SubClass_Percent[civID][armorType]

							if (aliveArmor > 0) and (aliveUnitSubClass/aliveArmor*100 > maxPercent) then
								-- false
								line2 = line2 .. "Armor Type percent (".. aliveUnitSubClass/aliveArmor*100 .."%) restriction (".. aliveUnitSubClass.."/".. aliveArmor .."*100<=".. maxPercent .."%), "
							else
								line2 = line2 .. "Armor Type percent (".. aliveUnitSubClass/aliveArmor*100 .."%) OK (".. aliveUnitSubClass.."/".. aliveArmor .."*100<=".. maxPercent .."%), "
							end
						end
					end
		
					-- Artillery restriction
					if g_Unit_Classes[unitClass].NumType == CLASS_ARTILLERY then
						if (aliveUnitClass > 0) and (land/aliveUnitClass < g_Combat_Type_Ratio[civID].Artillery) then
							-- false
							line2 = line2 .. "Artillery restriction (".. land.."/"..aliveUnitClass .."<".. g_Combat_Type_Ratio[civID].Artillery .."), "
						else
							line2 = line2 .. "Artillery OK (".. land.."/"..aliveUnitClass .."<".. g_Combat_Type_Ratio[civID].Artillery .."), "
						end			
					end
				end

			end

			-- restriction when upgrade is available
			local upgradeType = GetUnitUpgradeType( iUnitType )
			if upgradeType and player:CanTrain(upgradeType) then			
				-- false
				line2 = line2 .. "Upgrade available, "
			end

			-- restriction on builded units of this type
			local maxNumber = g_UnitMaxNumber[iUnitType]
			if (maxNumber and maxNumber <= CountUnitType (iUnitType)) then
				-- false
				line2 = line2 .. "Max build reached (".. maxNumber .."<=".. CountUnitType (iUnitType) .."), "
			end
	
			-- restriction on unit instances
			local maxInstance = g_UnitMaxInstance[iUnitType]
			if maxInstance then
				local aliveUnits = CountUnitTypeAlive (iUnitType)
				if (maxInstance <= aliveUnits) then
					-- false
					line2 = line2 .. "Max alive reached (".. maxInstance .."<=".. aliveUnits .."), "
				end
			end
		end
		
		--]]

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
--GameEvents.PlayerDoTurn.Add(ShowPlayerTrainingRestriction)

function ClearUnitMission()
	for playerID = 0, GameDefines.MAX_CIV_PLAYERS - 1 do
		local player = Players[playerID]
		if player and player:IsAlive() then
			for unit in player:Units() do				
				local unitKey = GetUnitKey(unit)
				if g_UnitData[unitKey] and not (unit:GetUnitType() == CONVOY) then
					g_UnitData[unitKey].OrderType = nil
					g_UnitData[unitKey].OrderReference = nil
					g_UnitData[unitKey].OrderObjective = nil
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
				if g_UnitData[unitKey] and not (unit:GetUnitType() == CONVOY) then
					g_UnitData[unitKey].OrderType = nil
					g_UnitData[unitKey].OrderReference = nil
					g_UnitData[unitKey].OrderObjective = nil
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
			if g_UnitData[unitKey] and not (unit:GetUnitType() == CONVOY) then
				g_UnitData[unitKey].OrderType = nil
				g_UnitData[unitKey].OrderReference = nil
				g_UnitData[unitKey].OrderObjective = nil
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
	for i, data in ipairs(g_CombatsLog) do		
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
					if g_UnitData[unitKey]  then
						print("unitData[unitKey]")						
						if g_UnitData[unitKey].OrderType then
							print("unitData[unitKey].OrderType = " .. g_UnitData[unitKey].OrderType)							
							if unit:GetUnitType() == CONVOY and g_UnitData[unitKey].OrderType == RED_CONVOY then
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
						g_UnitData[unitKey].TurnCreated = unit:GetGameTurnCreated()
					end 
				else
					print("ERROR : no unitKey")
				end 				
				print ("---------------------------")
			end			
			print ("------------------------------------------------------")
		end
	end
	SaveData("Unit", g_UnitData, UNIT_SAVE_SLOT)
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