-- Lua RedAI
-- Author: Gedemon
-- DateCreated: 8/3/2011 10:10:01 PM
--------------------------------------------------------------

g_bAIDebug = true -- Before include

print("Loading Red AI Global Functions...")
print("-------------------------------------")


--------------------------------------------------------------
-- AI override
--------------------------------------------------------------
function AIUnitControl(playerID)
	local player = Players[playerID]
	if player:IsBarbarian() then 
		return 
	end
	local bDebug = true

	ClearAIInterceptors() -- remove and update moves of previous interceptors so they can be active during this player turn

	SendTroops(playerID)
	
	local turn = Game.GetGameTurn()

	local numUnit = 0
	local totalUnits = player:GetNumUnits()

	local land, sea, air = CountDomainUnits(playerID)
	local civID = GetCivIDFromPlayerID(playerID)
	
	local airCombats = {}

	local airForce = {}
	local navalForce = {}
	local armyForce = {}
	
	Dprint("Sort Unit List" , bDebug)
	Dprint("--------------------------------------------------------------------------", bDebug)
	for unit in player:Units() do
		numUnit = numUnit + 1
		if not unit:IsDead() then -- don't mess with the dead
			if unit:GetDomainType() == DomainTypes.DOMAIN_LAND then			
				Dprint("- " .. unit:GetName() .. ", unit #" .. tostring(numUnit) .."/" .. tostring(totalUnits) .. " -> Army" , bDebug)
				table.insert(armyForce, unit)
			elseif unit:GetDomainType() == DomainTypes.DOMAIN_SEA then
				Dprint("- " .. unit:GetName() .. ", unit #" .. tostring(numUnit) .."/" .. tostring(totalUnits) .. " -> Fleet" , bDebug)
				table.insert(navalForce, unit)			
			elseif unit:GetDomainType() == DomainTypes.DOMAIN_AIR then
				Dprint("- " .. unit:GetName() .. ", unit #" .. tostring(numUnit) .."/" .. tostring(totalUnits) .. " -> Air Force" , bDebug)
				table.insert(airForce, unit)
			end
		end
	end

	
	Dprint("--------------------------------------------------------------------------", bDebug)
	Dprint("Extract Air Bombing from Combats Log..." , bDebug)
	Dprint("--------------------------------------------------------------------------", bDebug)
	
	g_AirBombing = {} -- reset table
	local numInterception = 0
	for i, data in ipairs(MapModData.RED.CombatsLog) do

		if AreAtWar( playerID, data.AttackerPlayerID) 
		and (data.CombatType == AIRBOMB or data.CombatType == INTERCEPT or data.CombatType == CITYBOMB)
		and (turn - data.Turn <= INTERCEPTOR_MAX_TURNS_ATTACK)
		and data.PlotKey -- could be nil if unable to get defender (case of attack on cities already at 1 HP left)
		then			
			table.insert(g_AirBombing, {PlotKey = data.PlotKey, CombatType = data.CombatType})
			if data.CombatType == INTERCEPT then
				numInterception = numInterception +1
			end
		end		
	end	
	Dprint("- Found " .. tostring(#g_AirBombing) .." enemy bombing runs (".. tostring(numInterception) .." were intercepted)" , bDebug)
	
	Dprint("--------------------------------------------------------------------------", bDebug)
	Dprint("Extract Air Interceptions from Combats Log..." , bDebug)
	Dprint("--------------------------------------------------------------------------", bDebug)

	g_AirInterception = {}  -- reset table
	for i, data in ipairs(MapModData.RED.CombatsLog) do
		if AreAtWar( playerID, data.DefenderPlayerID) 
		and data.CombatType == INTERCEPT
		and (turn - data.Turn <= AIRSWEEP_MAX_TURNS_ATTACK)
		and data.PlotKey -- could be nil if unable to get defender (case of attack on cities already at 1 HP left)
		then			
			table.insert(g_AirInterception, {PlotKey = data.PlotKey, CombatType = data.CombatType})
		end		
	end
	Dprint("- Found " .. tostring(#g_AirInterception) .." enemy Air interceptions" , bDebug)
	
	Dprint("")
	Dprint("----------------------------------------------------------------------------------------------------------------------------------------------------", bDebug)
	Dprint("AI : ARMY" , bDebug)
	Dprint("----------------------------------------------------------------------------------------------------------------------------------------------------", bDebug)
	for i, unit in pairs( armyForce ) do
		local unitKey = GetUnitKey(unit)
		local unitType = unit:GetUnitType()
		Dprint("")
		Dprint("- " .. unit:GetName() .. ", key = " .. tostring(unitKey).. ", unit #" .. tostring(i) .."/" .. tostring(#armyForce), bDebug)
		if MapModData.RED.UnitData[unitKey] 
		and (ALLOW_AI_CONTROL or MapModData.RED.UnitData[unitKey].TotalControl)
		and ((not player:IsHuman()) or MapModData.RED.UnitData[unitKey].TotalControl) then
		
			if MapModData.RED.UnitData[unitKey].OrderType then
				if MapModData.RED.UnitData[unitKey].OrderType == RED_CONVOY then
					MoveConvoy(unit)
				elseif MapModData.RED.UnitData[unitKey].OrderType == RED_MOVE_TO_EMBARK then
					MoveToEmbark(unit) -- reinforcement en route
				end
				if MapModData.RED.UnitData[unitKey].OrderType == RED_MOVE_TO_DISEMBARK then 
					MoveToDisembark(unit)
				end
				if MapModData.RED.UnitData[unitKey].OrderType == RED_MOVE or MapModData.RED.UnitData[unitKey].OrderType == RED_MOVE_TO_EMBARKED_WAYPOINT then 
					MoveUnitTo (unit, GetPlot (MapModData.RED.UnitData[unitKey].OrderObjective.X, MapModData.RED.UnitData[unitKey].OrderObjective.Y )) -- moving...
				end
			end			
			
			-- Try to force healing only when we have not reach the max limit for that type of unit (or if the unit is last of a limited type)
			if (not IsLimitedByRatio(unitType, playerID, civID, totalUnits, land)) or (IsMaxNumber(unitType)) then
				ForceHealing(unit)
			else
				Dprint("Max ratio reached for this unit type, force heal deactivated...")
				if MapModData.RED.UnitData[unitKey] and MapModData.RED.UnitData[unitKey].OrderType == RED_HEALING then
					MapModData.RED.UnitData[unitKey].OrderType = nil
					MapModData.RED.UnitData[unitKey].OrderReference = nil
				end
			end

		end
		Dprint("")
		Dprint("--------------------------------------------------------------------------", bDebug)
	end
	
	Dprint("")
	Dprint("----------------------------------------------------------------------------------------------------------------------------------------------------", bDebug)
	Dprint("AI : FLEET" , bDebug)
	Dprint("----------------------------------------------------------------------------------------------------------------------------------------------------", bDebug)
	for i, unit in pairs( navalForce ) do		
				
		local unitKey = GetUnitKey(unit)
		local unitType = unit:GetUnitType()
		Dprint("")
		Dprint("- " .. unit:GetName() .. ", key = " .. tostring(unitKey).. ", unit #" .. tostring(i) .."/" .. tostring(#navalForce), bDebug)
		if MapModData.RED.UnitData[unitKey] 
		and (ALLOW_AI_CONTROL or MapModData.RED.UnitData[unitKey].TotalControl)
		and ((not player:IsHuman()) or MapModData.RED.UnitData[unitKey].TotalControl) then
			if MapModData.RED.UnitData[unitKey].OrderType then
				if MapModData.RED.UnitData[unitKey].OrderType == RED_CONVOY then
					MoveConvoy(unit)
				elseif MapModData.RED.UnitData[unitKey].OrderType == RED_MOVE_TO_EMBARK then
					MoveToEmbark(unit) -- reinforcement en route
				end
				if MapModData.RED.UnitData[unitKey].OrderType == RED_MOVE_TO_DISEMBARK then 
					MoveToDisembark(unit)
				end
				if MapModData.RED.UnitData[unitKey].OrderType == RED_MOVE or MapModData.RED.UnitData[unitKey].OrderType == RED_MOVE_TO_EMBARKED_WAYPOINT then 
					MoveUnitTo (unit, GetPlot (MapModData.RED.UnitData[unitKey].OrderObjective.X, MapModData.RED.UnitData[unitKey].OrderObjective.Y )) -- moving...
				end
			end
			-- Try to force healing only when we have not reach the max limit for that type of unit (or if the unit is last of a limited type)
			if not IsLimitedByRatio(unitType, playerID, civID, totalUnits, sea) or IsMaxNumber(unitType) then
				ForceHealing(unit)
			else
				Dprint("Max ratio reached for this unit type, force heal deactivated...")
				if MapModData.RED.UnitData[unitKey] and MapModData.RED.UnitData[unitKey].OrderType == RED_HEALING then
					MapModData.RED.UnitData[unitKey].OrderType = nil
					MapModData.RED.UnitData[unitKey].OrderReference = nil
				end
			end
			GoSubHunting(unit) -- launch destroyers/cruisers against reported subs

		end
		Dprint("")
		Dprint("--------------------------------------------------------------------------", bDebug)		
	end
	
	Dprint("")
	Dprint("----------------------------------------------------------------------------------------------------------------------------------------------------", bDebug)
	Dprint("AI : AIR FORCE" , bDebug)
	Dprint("----------------------------------------------------------------------------------------------------------------------------------------------------", bDebug)
	for i, unit in pairs( airForce ) do		
				
		local unitKey = GetUnitKey(unit)
		local unitType = unit:GetUnitType()
		Dprint("")
		Dprint("- " .. unit:GetName() .. ", key = " .. tostring(unitKey).. ", unit #" .. tostring(i) .."/" .. tostring(#airForce), bDebug)
		if MapModData.RED.UnitData[unitKey] 
		and (ALLOW_AI_CONTROL or MapModData.RED.UnitData[unitKey].TotalControl)
		and ((not player:IsHuman()) or MapModData.RED.UnitData[unitKey].TotalControl) then

			CheckRebasing(unit) -- Air unit in transit should continue to objective before anything else...

			-- Force healing only when we have not reach the max limit for that type of unit (or if the unit is last of a limited type)
			if not IsLimitedByRatio(unitType, playerID, civID, totalUnits, air) or IsMaxNumber(unitType) then
				ForceHealing(unit) -- force unit to heal
			else
				Dprint("Max ratio reached for this unit type, force heal deactivated...")
				if MapModData.RED.UnitData[unitKey] and MapModData.RED.UnitData[unitKey].OrderType == RED_HEALING then
					MapModData.RED.UnitData[unitKey].OrderType = nil
					MapModData.RED.UnitData[unitKey].OrderReference = nil
				end
			end
			
			SetAIInterceptors(unit) -- set Fighters on interception mission
			GoAirSweep(unit) -- set Fighters on sweeping mission

		end
		Dprint("")
		Dprint("--------------------------------------------------------------------------", bDebug)		
	end
end
--GameEvents.PlayerDoTurn.Add(AIUnitControl)

--------------------------------------------------------------
-- AI Bonuses
--------------------------------------------------------------
function CallReserveTroops(playerID) 
	local bDebug = true
	local player = Players[playerID]

	if ( g_Reserve_Data and player:IsAlive() and not player:IsHuman() and not player:IsMinorCiv() and not IsSameSideHuman(player) ) then
		local civID = GetCivIDFromPlayerID(playerID, false)
		local reserveData = g_Reserve_Data[civID]
		if reserveData then
			local condition
			if reserveData.Condition then
				condition = reserveData.Condition()
			else
				condition = true -- if no condition set, assume always true
			end
			if condition then
				local numLandCombat = 0
				for unit in player:Units() do
					if unit:IsCombatUnit() and unit:GetDomainType() == DomainTypes.DOMAIN_LAND then
						numLandCombat = numLandCombat + 1
					end
				end
				Dprint("-------------------------------------", bDebug)
				Dprint("Check AI need of reserve troops for ".. player:GetName() .. ", " .. numLandCombat .. " unit(s) left", bDebug)
				if ( numLandCombat < reserveData.UnitThreshold) then
					Dprint(" - Number of land combat units left  (".. numLandCombat .. ") is inferior to minimum (" .. reserveData.UnitThreshold .. ")", bDebug)
					local territorySize = player:GetNumPlots()
					if (territorySize < reserveData.LandThreshold) then
						Dprint(" - Territory size  (".. territorySize .. ") is inferior to minimum (" .. reserveData.LandThreshold .. ")", bDebug)
						local ratio = territorySize / numLandCombat
						if ratio > reserveData.LandUnitRatio then	
							Dprint(" - Territory / Units ratio  (".. ratio .. ") is superior to maximum (" .. reserveData.LandUnitRatio .. "), calling reserve unit", bDebug)
							local capital = player:GetCapitalCity()
							local plot = capital:Plot()
							local unitData = g_Reserve_Unit[civID]
							if unitData then
								for i, unitType in ipairs(unitData) do
									local rand = math.random( 1, 100 )
									if  rand < unitType.Prob then
										Dprint(" - Creating new unit, typeID=".. unitType.ID .." prob (" .. unitType.Prob ..") > rand (" .. rand ..")" , bDebug)
										local unit = player:InitUnit(unitType.ID, plot:GetX(), plot:GetY() )
										Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes.NOTIFICATION_UNIT_PROMOTION, player:GetName() .. " has called reserve troops in his capital", "Calling reserve Troops !", plot:GetX(), plot:GetY(), unitType.ID, unitType.ID)
									end
								end
							end
						else
							Dprint(" - Territory / Units ratio  (".. territorySize .. ") is inferior to maximum (" .. reserveData.LandUnitRatio .. "), no need to call reserve", bDebug)
						end
					else
						Dprint(" - Territory size  (".. territorySize .. ") is superior to minimum (" .. reserveData.LandThreshold .. "), no need to call reserve", bDebug)
					end
				else		
					Dprint(" - Number of land combat units left  (".. numLandCombat .. ") is superior to minimum (" .. reserveData.UnitThreshold .. "), no need to call reserve", bDebug)
				end
			end
		end
	end
end

--------------------------------------------------------------
-- Move AI units
--------------------------------------------------------------

function MoveUnitTo (unit, plot)
	local unitPlot = unit:GetPlot()
	local movesBefore = unit:MovesLeft()

	if movesBefore == 0 then
		Dprint ("Trying to move unit without move left, returning true as the destination may be in fact reachable... ", g_bAIDebug)
		return true
	end

	local x = plot:GetX()
	local y = plot:GetY()
	Dprint ("Trying to move unit to " .. x .."," ..y, g_bAIDebug)


	local player = Players[unit:GetOwner()]
	if player:GetID() == Game:GetActivePlayer() and SHOW_FORCED_MOVE then
		UI.LookAt(unit:GetPlot(), 0)
	end

	unit:PopMission()
	unit:PushMission(MissionTypes.MISSION_MOVE_TO, x, y, 0, 0, 1, MissionTypes.MISSION_MOVE_TO, unitPlot, unit)
	
	local movesAfter = unit:MovesLeft()

	if movesAfter < movesBefore then
		Dprint ("  - returning move done !")
		return true
	else
		Dprint ("  - returning move failed, try close plots !")
		local plotList = GetCloseDestinationList(unit, plot)
		for i, destination in ipairs(plotList) do
			local x = destination.Plot:GetX()
			local y = destination.Plot:GetY()
			Dprint ("    - Trying to move unit to " .. x .."," ..y, g_bAIDebug)
			unit:PopMission()
			unit:PushMission(MissionTypes.MISSION_MOVE_TO, x, y, 0, 0, 1, MissionTypes.MISSION_MOVE_TO, unitPlot, unit)
			movesAfter = unit:MovesLeft()
			if movesAfter < movesBefore then
				Dprint ("    - returning move done !")
				return true
			end
		end
	end
	Dprint ("  - returning move failed !")
	return false
end
function GetCloseDestinationList(unit, plot) -- return routeList = {Plot = destinationPlot, Distance = distance}

	local bDebug = true

	Dprint ("   - Get close destination list...", bDebug)

	local plotList = GetAdjacentPlots(plot)
	local routeList = {}

	local routeType = "Land" -- default...

	local unitType = unit:GetUnitType()
	local player = Players[unit:GetOwner()]

	if GameInfo.Units[unitType].Domain == "DOMAIN_SEA" or unit:IsEmbarked() then
		routeType = "Ocean"
	end

	Dprint ("   - Route type = " .. routeType, bDebug)

	for i, destinationPlot in pairs(plotList) do			
		local bRoute = isPlotConnected(player, unit:GetPlot(), destinationPlot, routeType, false, true , nil)
		if bRoute then
			local distance = getRouteLength()
			Dprint ("   - Adding route, distance = " .. distance, bDebug)
			table.insert (routeList, {Plot = destinationPlot, Distance = distance})
		end
	end

	table.sort(routeList, function(a,b) return a.Distance > b.Distance end) -- shorter distance first...

	return routeList
end

function RebaseUnitTo (unit, plot)

	local unitPlot = unit:GetPlot()
	local unitKey = GetUnitKey(unit)	
	local city = plot:GetPlotCity()

	if  city and ( city:GetOwner() == unit:GetOwner() ) then -- to do : allow rebase on aircraft carrier

		Dprint("Trying to rebase to " .. city:GetName(), g_bAIDebug)

		local rebaseRange = unit:Range() * GameDefines.AIR_UNIT_REBASE_RANGE_MULTIPLIER / 100
		local distanceToCity = (distanceBetween(plot, unit:GetPlot()) - 1)

		if distanceToCity <= rebaseRange then
			Dprint("Forcing rebase mission on " .. unit:GetNameNoDesc() .. " to " .. city:GetName(), g_bAIDebug )
			unit:PopMission()
			unit:PushMission(MissionTypes.MISSION_REBASE, plot:GetX(), plot:GetY(), 0, 0, 1, MissionTypes.MISSION_REBASE, unit:GetPlot(), unit)

			MapModData.RED.UnitData[unitKey].OrderType = nil
			MapModData.RED.UnitData[unitKey].OrderReference = nil

			Dprint("----------", g_bAIDebug)
			return true -- mission acomplished
		else
			Dprint("Can't reach city directly, try to find route...", g_bAIDebug)
			local status, coordPath = CalculatePathNodes(unit:GetPlot(), plot, rebaseRange, unit:GetOwner())
			if status then
				local newX = coordPath[#coordPath][1]
				local newY = coordPath[#coordPath][2]
				local newPlot = GetPlot(newX,newY)
				local newCity = newPlot:GetPlotCity()
				Dprint("Find route via " .. newCity:GetName(), g_bAIDebug )
				Dprint("Forcing rebase mission on " .. unit:GetNameNoDesc() .. " to intermediate base at " .. newCity:GetName(), g_bAIDebug )
				unit:PopMission()
				unit:PushMission(MissionTypes.MISSION_REBASE, newPlot:GetX(), newPlot:GetY(), 0, 0, 1, MissionTypes.MISSION_REBASE, unit:GetPlot(), unit)
				g_AI_UnitPreviousPositions[unit] = newPlot -- mark previous plot as current one so unit can move directly to next node on route if not needed in intermediate city
				MapModData.RED.UnitData[unitKey].OrderType = RED_REBASE
				MapModData.RED.UnitData[unitKey].OrderReference = GetPlotKey ( plot )
				Dprint("----------", g_bAIDebug)
				return true -- mission acomplished
			end
		end

	else
		Dprint("WARNING ! Trying to rebase to nil city or city is no more owned !", g_bAIDebug)
	end
	-- remove order if no destination found...
	MapModData.RED.UnitData[unitKey].OrderType = nil
	MapModData.RED.UnitData[unitKey].OrderReference = nil
	return false
end
function CheckRebasing(unit)
	local unitKey = GetUnitKey(unit)
	if MapModData.RED.UnitData[unitKey] and MapModData.RED.UnitData[unitKey].OrderType == RED_REBASE then

		Dprint("Current order is rebasing...", bDebug)
		local plotKey = MapModData.RED.UnitData[unitKey].OrderReference
		local plot = GetPlotFromKey(plotKey)
		RebaseUnitTo (unit, plot)

	end
end

function IsAtDestination(playerID, UnitID, x, y)

	local bDebug = true

	local plot = Map.GetPlot(x,y)
	local player = Players [ playerID ]
	local unit = player:GetUnitByID(UnitID)
	local unitType = unit:GetUnitType()
	local unitKey = GetUnitKey(unit)

	if not MapModData.RED.UnitData[unitKey] then -- don't test before initialisation of MapModData.RED.UnitData
		return
	end
	if (plot) then
		if MapModData.RED.UnitData[unitKey].OrderType == RED_CONVOY then 
			Dprint("-------------------------------------", bDebug)
			Dprint("Check if ".. unit:GetName() .." (id=".. unit:GetID() ..") has reached a destination near (".. x ..",".. y ..")", bDebug)

			--
			local routeID = MapModData.RED.UnitData[unitKey].OrderReference
			if not routeID then -- shouldn't happen anymore, but to be safe, sabord convoy that were spawned without a routeID
				Dprint("  - WARNING : Convoy unit has no route set, sabording...")
				unit:Kill(true, -1)
				return
			end
			local destinationList = g_Convoy[routeID].DestinationList		
			for i, destination in ipairs(destinationList) do
				local plotList = GetAdjacentPlots(plot, true) -- include central plot in list
				for i, adjacentPlot in pairs(plotList) do
					if destination.X == adjacentPlot:GetX() and destination.Y == adjacentPlot:GetY() then
						Dprint("  - a bon port near (".. x ..",".. y .."), check for unload condition...", bDebug)

						local condition
						if g_Convoy[routeID].UnloadCondition then
							condition = g_Convoy[routeID].UnloadCondition()
						else
							condition = true -- if no condition set, assume always true
						end
						if condition then
							Dprint("  - Unloading...", bDebug)
							UnloadConvoy(unit, playerID, destination.X, destination.Y, routeID)
							MapModData.RED.UnitData[unitKey].OrderType = nil -- prevent double unloading
						else
							Dprint("  - Can't unload !", bDebug)
						end
					end
				end
			end

		elseif MapModData.RED.UnitData[unitKey].OrderType == RED_MOVE_TO_EMBARK then
			Dprint("-------------------------------------", bDebug)
			Dprint("Check if ".. unit:GetName() .." (id=".. unit:GetID() ..") has reached it's destination", bDebug)
			local routeID = MapModData.RED.UnitData[unitKey].OrderReference
			local destination = MapModData.RED.UnitData[unitKey].OrderObjective
			if destination.X == x and destination.Y == y then
				Dprint("  - arrived at embarkement plot !", bDebug)
				if CanEmbarkFrom(plot, unit) then
					if (not unit:IsHasPromotion(PROMOTION_EMBARKATION)) then
						unit:SetHasPromotion(PROMOTION_EMBARKATION, true)
					end
					
					local newWaypoint = GetFirstWaypoint(playerID, routeID)

					if newWaypoint then
						MapModData.RED.UnitData[unitKey].OrderType = RED_MOVE_TO_EMBARKED_WAYPOINT
						MapModData.RED.UnitData[unitKey].OrderObjective = newWaypoint
						MoveUnitTo (unit, GetPlot (newWaypoint.X, newWaypoint.Y ))
					else
						local newDestination = GetDestinationToDisembark(playerID, routeID)
						MapModData.RED.UnitData[unitKey].OrderType = RED_MOVE_TO_DISEMBARK
						MapModData.RED.UnitData[unitKey].OrderObjective = newDestination
						MoveUnitTo (unit, GetPlot (newDestination.X, newDestination.Y ))
					end
				else				
					Dprint("  - WARNING : can't embark, removing orders !!!", bDebug)
					unit:PopMission()
					MapModData.RED.UnitData[unitKey].OrderType = nil
					MapModData.RED.UnitData[unitKey].OrderReference = nil
					MapModData.RED.UnitData[unitKey].OrderObjective = nil
					MapModData.RED.UnitData[unitKey].TotalControl = nil
				end
			end

		elseif MapModData.RED.UnitData[unitKey].OrderType == RED_MOVE_TO_DISEMBARK then
			Dprint("-------------------------------------", bDebug)
			Dprint("Check if ".. unit:GetName() .." (id=".. unit:GetID() ..") has reached it's landing plot", bDebug)
			local routeID = MapModData.RED.UnitData[unitKey].OrderReference
			local destination = MapModData.RED.UnitData[unitKey].OrderObjective
			if destination.X == x and destination.Y == y then
				Dprint("  - arrived at destination plot, removing orders (and embarkation promotion if NO_AI_EMBARKATION)...", bDebug)
				if unit:IsHasPromotion(PROMOTION_EMBARKATION) and NO_AI_EMBARKATION then
					unit:SetHasPromotion(PROMOTION_EMBARKATION, false)
				end
				unit:PopMission()
				MapModData.RED.UnitData[unitKey].OrderType = nil
				MapModData.RED.UnitData[unitKey].OrderReference = nil
				MapModData.RED.UnitData[unitKey].OrderObjective = nil
				MapModData.RED.UnitData[unitKey].TotalControl = nil

			end

		elseif MapModData.RED.UnitData[unitKey].OrderType == RED_MOVE_TO_EMBARKED_WAYPOINT  then
			Dprint("-------------------------------------", bDebug)
			Dprint("Check if ".. unit:GetName() .." (id=".. unit:GetID() ..") has reached it's waypoint", bDebug)
			local routeID = MapModData.RED.UnitData[unitKey].OrderReference
			local destination = MapModData.RED.UnitData[unitKey].OrderObjective
			
			local plotList = GetAdjacentPlots(plot, true) -- include central plot in list
			for i, adjacentPlot in pairs(plotList) do
				if destination.X == adjacentPlot:GetX() and destination.Y == adjacentPlot:GetY() then

					Dprint("  - arrived at embarked waypoint, check for next waypoint...", bDebug)

					local newWaypoint = GetNextWaypoint(playerID, routeID, destination)

					if newWaypoint then
						MapModData.RED.UnitData[unitKey].OrderType = RED_MOVE_TO_EMBARKED_WAYPOINT
						MapModData.RED.UnitData[unitKey].OrderObjective = newWaypoint
						MoveUnitTo (unit, GetPlot (newWaypoint.X, newWaypoint.Y ))
					else
						local newDestination = GetDestinationToDisembark(playerID, routeID)
						MapModData.RED.UnitData[unitKey].OrderType = RED_MOVE_TO_DISEMBARK
						MapModData.RED.UnitData[unitKey].OrderObjective = newDestination
						MoveUnitTo (unit, GetPlot (newDestination.X, newDestination.Y ))
					end
				end

			end
		
		elseif MapModData.RED.UnitData[unitKey].OrderType == RED_MOVE  then
			Dprint("-------------------------------------", bDebug)
			Dprint("Check if ".. unit:GetName() .." (id=".. unit:GetID() ..") has reached it's destination", bDebug)
			local routeID = MapModData.RED.UnitData[unitKey].OrderReference
			local destination = MapModData.RED.UnitData[unitKey].OrderObjective
			if destination.X == x and destination.Y == y then
				Dprint("  - arrived at destination plot, removing orders...", bDebug)
				unit:PopMission()
				MapModData.RED.UnitData[unitKey].OrderType = nil
				MapModData.RED.UnitData[unitKey].OrderReference = nil
				MapModData.RED.UnitData[unitKey].OrderObjective = nil
				MapModData.RED.UnitData[unitKey].TotalControl = nil

			end
		end

	end
end
-- add to GameEvents.UnitSetXY on loading and reloading game

--------------------------------------------------------------
-- Destroyers AI
--------------------------------------------------------------
g_AI_SubHunters = {}

-- go to last sub attack area
function GoSubHunting(unit)
	if unit:GetDomainType() == DomainTypes.DOMAIN_SEA and (unit:IsHasPromotion( GameInfo.UnitPromotions.PROMOTION_DESTROYER.ID ) or unit:IsHasPromotion( GameInfo.UnitPromotions.PROMOTION_CRUISER.ID ) ) then
	
		-- first check adjacent plots before moving...
		local unitPlot = unit:GetPlot()
		SubHunting(unit:GetOwner(), unit:GetID(), unitPlot:GetX(), unitPlot:GetY())

		local turn = Game.GetGameTurn()
		local maxTurnAttack, maxTurnTarget = 0, 0
		if unit:IsHasPromotion( GameInfo.UnitPromotions.PROMOTION_DESTROYER.ID ) then -- destroyer
			maxTurnAttack = DESTROYER_SUB_HUNTING_MAX_TURNS_ATTACK
			maxTurnTarget = DESTROYER_SUB_HUNTING_MAX_TURNS_TO_TARGET
		else -- cruiser
			maxTurnAttack = CRUISER_SUB_HUNTING_MAX_TURNS_ATTACK
			maxTurnTarget = CRUISER_SUB_HUNTING_MAX_TURNS_TO_TARGET
		end

		g_AI_SubHunters[unit] = nil -- temp deactivate

		if g_AI_SubHunters[unit] and turn - g_AI_SubHunters[unit].Turn <= maxTurnAttack then -- already tracking sub ?
			Dprint(unit:GetName() .. " (id = ".. unit:GetID() ..") is en route to search for sub at (" .. g_AI_SubHunters[unit].PlotKey .. "), forcing move...", g_bAIDebug)
			MoveUnitTo (unit, GetPlotFromKey(g_AI_SubHunters[unit].PlotKey))
		else
			-- reset sub hunter data
			g_AI_SubHunters[unit] = nil

			-- find last turn attacks in this unit range
			local player = Players[unit:GetOwner()]
			local numAttacks = 0
			local subPlots = {}
			local moveDenominator = GameDefines["MOVE_DENOMINATOR"]
			local maxMoves = math.floor(unit:MaxMoves() / moveDenominator)
			Dprint("Looking for subs to hunt for " .. unit:GetName() .. " (id = ".. unit:GetID() ..")", g_bAIDebug)
			for i, data in ipairs(MapModData.RED.CombatsLog) do
				if ((AreAtWar( unit:GetOwner(), data.AttackerPlayerID) and data.CombatType == SUBATTACK)
				or (AreAtWar( unit:GetOwner(), data.DefenderPlayerID) and data.CombatType == SUBHUNT))
				and (turn - data.Turn <= maxTurnAttack) -- don't look too many turns back
				then 
					local unitPlot = unit:GetPlot()
					local dataPlot = GetPlotFromKey(data.PlotKey)
					local airDistance = distanceBetween(unitPlot, dataPlot) - 1
					local maxDistance = maxMoves * maxTurnTarget
					if airDistance <= maxDistance then -- this help to save the Earth, lowering CPU heat by checking air distance before trying to find a route...
						-- try to find route
						local bRoute = isPlotConnected(player, unitPlot, dataPlot, "Ocean", false, true , nil)
						local distance = getRouteLength()
						if bRoute and distance <= maxDistance then  -- can we go near fast enough ?
							local turnToGo = (distance / maxMoves) + (turn - data.Turn)
							Dprint("  -- Reported sub attack in range at (" .. data.PlotKey .. "), route distance = " .. distance .. ", turns to go = " .. turnToGo, g_bAIDebug )
							table.insert(subPlots, { PlotKey = data.PlotKey, Timer = turnToGo })
						else
							Dprint("  -- Reported sub attack at (" .. data.PlotKey .. "), route distance = " .. distance .. " - out of range", g_bAIDebug )
						end
					else
						Dprint("  -- Reported sub attack at (" .. data.PlotKey .. "), air distance = " .. airDistance .. " - out of range", g_bAIDebug )
					end
				end
			end
		
			table.sort(subPlots, function(a,b) return a.Timer < b.Timer end) -- shorter distance first...

			-- for now, just go to nearest attacked plot, see later if team attacks are needed
			if subPlots[1] then
				Dprint("Force " .. unit:GetName() .. " (id = ".. unit:GetID() ..") to search for sub at " .. subPlots[1].PlotKey, g_bAIDebug)
				MoveUnitTo (unit, GetPlotFromKey(subPlots[1].PlotKey))
				g_AI_SubHunters[unit] = { PlotKey = subPlots[1].PlotKey, Turn = turn }
			end
		end
		
		Dprint("----------", g_bAIDebug)
	end
end

function SubHunting(playerID, UnitID, x, y)

	local plot = Map.GetPlot(x,y)
	if plot ~= nil then
		local player = Players [ playerID ]
		local unit = player:GetUnitByID(UnitID)
		local bSubHunter = false
		local plotKey = GetPlotKey(plot)

		if g_AI_SubHunters[unit] then
			if g_AI_SubHunters[unit].PlotKey == plotKey then
				Dprint(unit:GetName() .. " (id = ".. unit:GetID() ..") at (" .. unit:GetX() ..",".. unit:GetY() .. ") is hunting and has reached it's destination plot, check adjacent plots for submarines", g_bAIDebug )
				-- to do : add chance to find sub based on distance and movements left
			else
				Dprint(unit:GetName() .. " (id = ".. unit:GetID() ..") at (" .. unit:GetX() ..",".. unit:GetY() .. ") is hunting and check adjacent plots for submarines", g_bAIDebug )
			end
			bSubHunter = true
		elseif unit:GetDomainType() == DomainTypes.DOMAIN_SEA 
		  and (unit:IsHasPromotion( GameInfo.UnitPromotions.PROMOTION_DESTROYER.ID ) or unit:IsHasPromotion( GameInfo.UnitPromotions.PROMOTION_CRUISER.ID ))
		  --and unit:GetNumEnemyUnitsAdjacent() > 0
		  and not player:IsHuman()
		  then
			Dprint(unit:GetName() .. " (id = ".. unit:GetID() ..") at (" .. unit:GetX() ..",".. unit:GetY() .. ") check adjacent plots for submarines", g_bAIDebug )
			bSubHunter = true
		end
		if bSubHunter then
			local direction_types = {
				DirectionTypes.DIRECTION_NORTHEAST,
				DirectionTypes.DIRECTION_EAST,
				DirectionTypes.DIRECTION_SOUTHEAST,
				DirectionTypes.DIRECTION_SOUTHWEST,
				DirectionTypes.DIRECTION_WEST,
				DirectionTypes.DIRECTION_NORTHWEST
			}
		
			-- Check all adjacent plots for enemy subs
			for loop, direction in ipairs(direction_types) do
				local adjPlot = Map.PlotDirection(x, y, direction)
				if adjPlot ~= nil then
					local adjPlotType = adjPlot:GetPlotType()
					if adjPlotType == PlotTypes.PLOT_OCEAN then
						local unitCount = adjPlot:GetNumUnits()    
						for i = 0, unitCount - 1, 1	do
    						local testUnit = adjPlot:GetUnit(i);
							if testUnit then Dprint ("   - found " .. testUnit:GetName() .." at (" .. testUnit:GetX() ..",".. testUnit:GetY() .. ")") end
							if AreAtWar(testUnit:GetOwner(), playerID) and testUnit:IsHasPromotion( GameInfo.UnitPromotions.PROMOTION_SUBMARINE.ID ) then
								-- found a sub, FIRE !
								Dprint(unit:GetName() .. " (id = ".. unit:GetID() ..") has found an enemy sub at (" .. testUnit:GetX() ..",".. testUnit:GetY() .. "), and try to open fire", g_bAIDebug )								
								
								unit:PopMission()
								--unit:FinishMoves()
								--unit:RangeStrike( testUnit:GetX(), testUnit:GetY() )
								unit:PushMission(MissionTypes.MISSION_MOVE_TO, plot:GetX(), plot:GetY(), 0, 1, 0, MissionTypes.MISSION_MOVE_TO, plot, unit)
								unit:PushMission(MissionTypes.MISSION_RANGE_ATTACK, testUnit:GetX(), testUnit:GetY(), 0, 1, 0, MissionTypes.MISSION_RANGE_ATTACK, adjPlot, unit)
							end
						end
					end
				end
			end
			Dprint("--------", g_bAIDebug )
		end
	end
end
-- GameEvents.UnitSetXY.Add( SubHunting )

--------------------------------------------------------------
-- Aborting Suicide Attack
--------------------------------------------------------------
-- to do : try teleporting instead of killing
function AbortSuicideAttacks(iAttackingPlayer, iAttackingUnit, attackerDamage, attackerFinalDamage, attackerMaxHP, iDefendingPlayer, iDefendingUnit, defenderDamage, defenderFinalDamage, defenderMaxHP)
	if NO_SUICIDE_ATTACK then
		-- to do : track suicides attacks and targeted plot on global table and try to move the marked unit to a better plot the next turn 
	
		local pAttackingPlayer = Players[ iAttackingPlayer ]
		local pAttackingUnit = pAttackingPlayer:GetUnitByID( iAttackingUnit )

		if pAttackingUnit -- sometimes nil, why ?
				and	attackerDamage > SUICIDE_DAMAGE_THRESHOLD
				and not pAttackingPlayer:IsHuman()
				and pAttackingUnit:GetDomainType() ~= DomainTypes.DOMAIN_AIR
				then -- heavy casualties for an AI attacking unit...	
				
			Dprint("", g_bAIDebug)
			Dprint("---------------------------------------------------------------------------------------------------------------", g_bAIDebug)
			Dprint("PROJECTED HEAVY CASUALTIES : Check for suicide-attack...", g_bAIDebug)	
			local diffDamage = attackerDamage - defenderDamage
			local ratio =  pAttackingUnit:GetCurrHitPoints() / attackerDamage
			Dprint (pAttackingUnit:GetName().. " : ", g_bAIDebug)
			Dprint (" - Damage received :	" .. attackerDamage, g_bAIDebug)
			Dprint (" - Damage dealed :	" .. defenderDamage, g_bAIDebug)
			Dprint (" - Current HP :		" .. pAttackingUnit:GetCurrHitPoints(), g_bAIDebug)
			Dprint (" - Damage ratio :		" .. ratio .." (if ratio < 5, the unit may be killed in less than 5 attacks of this level)", g_bAIDebug)
			if diffDamage > SUICIDE_DIFF_DAMAGE_THRESHOLD and ratio < SUICIDE_HP_RATIO then -- that really looks like a suicide attack
				Dprint ("Suicide attack detected, ABORT !!!", g_bAIDebug)
				Events.GameplayAlertMessage(pAttackingUnit:GetName() .. " current mission was aborted, considered suicidal." )
				-- Fix visual effect
				pAttackingUnit:ChangeDamage(1)
				pAttackingUnit:ChangeDamage(-1)
				return true
			else
				Dprint ("Close to suicidal ratio (".. tostring(SUICIDE_HP_RATIO) .."), but let it do, it will survive...", g_bAIDebug)
			end
			Dprint("---------------------------------------------------------------------------------------------------------------", g_bAIDebug)
		end
	end
	return false
end
--GameEvents.MustAbortAttack.Add( AbortSuicideAttacks )

--------------------------------------------------------------
-- Healing
--------------------------------------------------------------

function ForceHealing(unit)
	-- to do : allow StrategicAI to mark unit as badly needed, preventing forced health
	
	local bDebug = true

	Dprint("Check if unit need to be healed...", bDebug)

	local unitKey = GetUnitKey(unit)

	if MapModData.RED.UnitData[unitKey] and MapModData.RED.UnitData[unitKey].OrderType == RED_CONVOY then -- don't try to heal convoy...
		Dprint(" - Convoy don't heal...", bDebug)
		return
	end

	if MapModData.RED.UnitData[unitKey] and MapModData.RED.UnitData[unitKey].OrderType == RED_HEALING then -- already healing...
		Dprint(" - Unit is currently healing...", bDebug)
		local healthRatio = unit:GetCurrHitPoints() / unit:GetMaxHitPoints()		

		if healthRatio > MapModData.RED.UnitData[unitKey].OrderReference then
			Dprint("  - Unit healed, remove forced healing ! (health ratio = " .. healthRatio ..")", bDebug)
			MapModData.RED.UnitData[unitKey].OrderType = nil
			MapModData.RED.UnitData[unitKey].OrderReference = nil
		else
			Dprint("  - Unit not healed, check for safe plot or don't move... (health ratio = " .. healthRatio ..")", bDebug)
			GoHealing(unit)
		end

	else
		
		local minHealthRatio = MIN_HEALTH_PERCENT / 100
		local optimalHealthRatio = OPTIMAL_HEALTH_PERCENT / 100
		local healthRatio = unit:GetCurrHitPoints() / unit:GetMaxHitPoints()

		if unit:GetDomainType() == DomainTypes.DOMAIN_AIR then
			minHealthRatio = MIN_AIR_HEALTH_PERCENT / 100
			optimalHealthRatio = OPTIMAL_AIR_HEALTH_PERCENT / 100
		elseif unit:GetDomainType() == DomainTypes.DOMAIN_SEA then
			minHealthRatio = MIN_SEA_HEALTH_PERCENT / 100
			optimalHealthRatio = OPTIMAL_SEA_HEALTH_PERCENT / 100
		end

		if healthRatio < minHealthRatio then
			MapModData.RED.UnitData[unitKey].OrderType = RED_HEALING
			MapModData.RED.UnitData[unitKey].OrderReference = optimalHealthRatio			
			Dprint("  - Need to be healed, check for safe plot or don't move... (health ratio = " .. healthRatio ..")", bDebug)
			GoHealing(unit)
		else			
			Dprint("  - Don't need to be healed... (health ratio = " .. healthRatio ..")", bDebug)
		end
	end
end

function GoHealing(unit)
	if unit:GetDomainType() == DomainTypes.DOMAIN_AIR then
		-- to do : remove from menaced cities		
		Dprint("Pop mission and skip turn for air unit...", g_bAIDebug)
		unit:PopMission()
		unit:SetMoves(0)
		unit:PushMission(MissionTypes.MISSION_SKIP, unit:GetX(), unit:GetY(), 0, 0, 1, MissionTypes.MISSION_SKIP, unit:GetPlot(), unit)
		
	elseif unit:GetDomainType() == DomainTypes.DOMAIN_SEA then
		local unitPlot = unit:GetPlot()
		local playerID = unit:GetOwner()
		if IsNearNavalFriendlyCity(unitPlot, playerID) then
			Dprint("Naval friendly city nearby, try to heal...", g_bAIDebug)
			unit:SetMoves(0)
		else
			local navalCity = GetCloseFriendlyNavalCity ( playerID, unitPlot)
			if navalCity then
				Dprint("Found naval friendly city nearby, trying to reach " .. tostring(navalCity:GetName()), g_bAIDebug)
				MoveUnitTo (unit, navalCity:Plot())
				unit:SetMoves(0)
			else
				Dprint("No naval friendly city nearby, leave to AI control...", g_bAIDebug)
				-- can't find route to healing plot, leave under AI control
			end
		end
	elseif not unit:IsEmbarked() then -- other units, but don't test embarked units, they should simply go to their objective ASAP
		if not (unit:IsHasPromotion(PROMOTION_NO_SUPPLY)) and not (unit:IsHasPromotion(PROMOTION_NO_SUPPLY_SPECIAL_FORCES)) then
			-- unit is receiving reinforcement here, trying to heal
			--unit:SetMoves(0)
			Dprint("Land unit is receiving reinforcement here, trying to heal (mark for no atack)...", g_bAIDebug)
			unit:SetMadeAttack(true)
		else
			Dprint("Land unit is not receiving reinforcement here, leave to AI control...", g_bAIDebug)
			-- to do : find route to safety
		end
	end
end

--------------------------------------------------------------
-- Convoy
--------------------------------------------------------------

function MoveConvoy(unit)

	local bDebug = true

	Dprint("Automoving convoy unit...", bDebug)

	local unitKey = GetUnitKey(unit)

	local destination = MapModData.RED.UnitData[unitKey].OrderObjective
	local routeID = MapModData.RED.UnitData[unitKey].OrderReference

	if not destination then -- todo : how can it happens ?
		Dprint("  - WARNING : convoy " .. unit:GetName() .. " has no destination trying to set a new one...", bDebug)
		destination = GetConvoyDestination(routeID)
		MapModData.RED.UnitData[unitKey].OrderObjective = destination
	end

	if destination then
		if (not TestConvoyDestination(destination, g_Convoy[routeID].CivID, g_Convoy[routeID].IsMinor)) 
		or (not MoveUnitTo (unit, GetPlot (destination.X, destination.Y ))) then -- change route if destination is not valid anymore or unit can't reach it
			Dprint("  - Can't find destination, try other route...", bDebug)
			newDestination = GetConvoyDestination(MapModData.RED.UnitData[unitKey].OrderReference, true)
			if newDestination then
				MoveUnitTo (unit, GetPlot (newDestination.X, newDestination.Y ))
			else
				Dprint("  - No valid destination found, disbanding Convoy...", bDebug)
				player:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, "A convoy was disbanded because no valid destination available.", "Convoy disbanded !", unit:GetX(), unit:GetY())
				unit:Kill(true, -1)
			end
		end
	else
		Dprint("  - WARNING : no destination for convoy " .. unit:GetName() .. " on routeID = " .. MapModData.RED.UnitData[unitKey].OrderReference)						
	end
end

--------------------------------------------------------------
-- Troops transport
--------------------------------------------------------------

function SendTroops(playerID)
	local bDebug = true
	local player = Players[playerID]
	local civID = GetCivIDFromPlayerID(playerID)
	if g_TroopsRoutes and g_TroopsRoutes[civID] then
			
		local bCompatible = (player:IsMinorCiv() and g_TroopsRoutes[civID].IsMinor) or (not player:IsMinorCiv() and not g_TroopsRoutes[civID].IsMinor)

		if not bCompatible then 
			return 
		end

		Dprint ("-------------------------------------", bDebug)
		Dprint ("Looking to send troops away...", bDebug)
		Dprint ("-------------------------------------", bDebug)
		local priority = 0
		local routeID = nil
		local availableUnits = nil
		for id, route in pairs (g_TroopsRoutes[civID]) do
			if route.CentralPlot then -- routes for military operation don't use CentralPlot
				local centralPlot = GetPlot(route.CentralPlot.X, route.CentralPlot.Y)				
				Dprint ("Checking " .. tostring(route.Name), bDebug)
				local listUnits = GetFreeLandUnitsAround(playerID, route.MaxDistanceFromCentral, centralPlot)

				local condition
				if route.Condition then
					condition = route.Condition()
				else
					condition = true -- if no condition set, assume always true
				end
				Dprint ("  - testing reserve needed and minimum units for reinforcement vs number of available units : " .. route.ReserveUnits .. " + " .. route.MinUnits .. " <= " .. #listUnits , bDebug)
				if condition and route.ReserveUnits + route.MinUnits <= #listUnits then -- there are enough free units here !	
					Dprint ("  - conditions ok, marking possible route...", bDebug)
					local rand = math.random(1, 10)
					if rand * route.Priority > priority then -- mark this route as choosen to send reinforcement
						priority = rand * route.Priority
						routeID = id
						availableUnits = listUnits
					end
				end				
				Dprint ("-----------------", bDebug)
			end
		end
		if routeID then
			Dprint ("Choosen route ID = " .. routeID, bDebug)
			local routeData = g_TroopsRoutes[civID][routeID]
			local maxUnits = math.min(#availableUnits - routeData.ReserveUnits, routeData.MaxUnits)
			for i = routeData.ReserveUnits + 1, routeData.ReserveUnits + maxUnits, 1 do
				local unit = availableUnits[i]
				local unitKey = GetUnitKey(unit)	
				Dprint ("  - marking unit to send : " .. unit:GetName(), bDebug)
				MapModData.RED.UnitData[unitKey].OrderType = RED_MOVE_TO_EMBARK
				MapModData.RED.UnitData[unitKey].OrderReference = routeID
				MapModData.RED.UnitData[unitKey].OrderObjective = GetDestinationToEmbark(playerID, routeID)
			end
		end		
		Dprint ("-------------------------------------", bDebug)
	end
end

function MoveToEmbark(unit)

	local bDebug = true
	
	local unitKey = GetUnitKey(unit)

	Dprint("Automoving unit to embark plot...", bDebug)

	destination = MapModData.RED.UnitData[unitKey].OrderObjective

	if not destination then -- todo : how can it happens ?
		Dprint("  - WARNING : " .. unit:GetName() .. " set to embark plot has no destination trying to set a new one...", bDebug)
		local routeID = MapModData.RED.UnitData[unitKey].OrderReference
		destination = GetDestinationToEmbark(unit:GetOwner(), routeID)
		MapModData.RED.UnitData[unitKey].OrderObjective = destination
	end

	if destination then
		if not MoveUnitTo (unit, GetPlot (destination.X, destination.Y )) then -- change route if can't move to actual destination
			Dprint("  - Can't find destination, try other route...", bDebug)
			newDestination = GetDestinationToEmbark(unit:GetOwner(), MapModData.RED.UnitData[unitKey].OrderReference, true)
			if newDestination then
				MoveUnitTo (unit, GetPlot (newDestination.X, newDestination.Y ))
			end
		end
	else
		Dprint("  - WARNING : no destination to embark plot for " .. unit:GetName() .. " on routeID = " .. MapModData.RED.UnitData[unitKey].OrderReference)						
	end
end

function MoveToDisembark(unit)

	local bDebug = true
	
	local unitKey = GetUnitKey(unit)

	Dprint("Automoving unit to disembark plot...", bDebug)

	destination = MapModData.RED.UnitData[unitKey].OrderObjective

	if not destination then -- todo : how can it happens ?
		Dprint("  - WARNING : " .. unit:GetName() .. " set to disembark plot has no destination, trying to set a new one...", bDebug)
		local routeID = MapModData.RED.UnitData[unitKey].OrderReference
		destination = GetDestinationToDisembark(unit:GetOwner(), routeID)
		MapModData.RED.UnitData[unitKey].OrderObjective = destination
	end

	if destination then
		if not MoveUnitTo (unit, GetPlot (destination.X, destination.Y )) then -- change route if can't move to actual destination
			Dprint("  - Can't find destination, try other route...", bDebug)
			newDestination = GetDestinationToDisembark(unit:GetOwner(), MapModData.RED.UnitData[unitKey].OrderReference, true)
			if newDestination then
				MoveUnitTo (unit, GetPlot (newDestination.X, newDestination.Y ))
			end
		end
	else
		Dprint("  - WARNING : no destination to disembark plot for " .. unit:GetName() .. " on routeID = " .. MapModData.RED.UnitData[unitKey].OrderReference)						
	end
end

function GetDestinationToEmbark(playerID, routeID, bForceSequential) -- return {X=x ,Y=y}

	local bDebug = true

	Dprint("   - testing possible destination to embark...", bDebug)

	local embarkDestination = nil
	local civID = GetCivIDFromPlayerID(playerID)
	local embarkList = g_TroopsRoutes[civID][routeID].EmbarkList

	if g_TroopsRoutes[civID][routeID].RandomEmbark and not bForceSequential then
		local numTry = 0
		while not embarkDestination and numTry < 10 do -- check 10 random plots from list for spawning...
			local randPlot = math.random( 1, #embarkList )
			local destination = embarkList[randPlot]
			if IsSafePlot(GetPlot(destination.X,destination.Y), playerID) then
				embarkDestination = destination
			end
			numTry = numTry + 1
		end
	else
		for i, destination in ipairs(embarkList) do
			if not embarkDestination then			
				if IsSafePlot(GetPlot(destination.X,destination.Y), playerID) then
					embarkDestination = destination
				end
			end
		end
	end
	if not embarkDestination then
		embarkDestination = embarkList[1] -- force first destination
	end
	return embarkDestination
end

function GetDestinationToDisembark(playerID, routeID, bForceSequential) -- return {X=x ,Y=y}

	local bDebug = true

	Dprint("   - testing possible destination to disembark...", bDebug)

	local landingDestination = nil
	local civID = GetCivIDFromPlayerID(playerID)
	local landingList = g_TroopsRoutes[civID][routeID].LandingList

	if g_TroopsRoutes[civID][routeID].RandomLanding and not bForceSequential then
		local numTry = 0
		while not landingDestination and numTry < 10 do -- check 10 random plots from list for spawning...
			local randPlot = math.random( 1, #landingList )
			local destination = landingList[randPlot]
			if IsSafePlot(GetPlot(destination.X,destination.Y), playerID) then
				landingDestination = destination
			end
			numTry = numTry + 1
		end
	else
		for i, destination in ipairs(landingList) do
			if not landingDestination then			
				if IsSafePlot(GetPlot(destination.X,destination.Y), playerID) then
					landingDestination = destination
				end
			end
		end
	end
	if not landingDestination then
		landingDestination = landingList[1] -- force first destination
	end
	return landingDestination
end

function GetFirstWaypoint(playerID, routeID, bForceSequential) -- return {X=x ,Y=y}

	local bDebug = true

	Dprint("   - testing possible destination waypoint...", bDebug)

	local waypoint = nil
	local civID = GetCivIDFromPlayerID(playerID)
	local waypointList = g_TroopsRoutes[civID][routeID].WaypointList
	if not waypointList then
		Dprint("      - no waypoints for this route...", bDebug)
		return nil -- this route has no waypoint...
	end

	if g_TroopsRoutes[civID][routeID].RandomWaypoint and not bForceSequential then
		-- route use one random waypoint
		Dprint("      - search random waypoint route...", bDebug)
		local randPlot = math.random( 1, #waypointList )
		waypoint = waypointList[randPlot]
	else
		-- route use fixed waypoint
		Dprint("      - search first waypoint...", bDebug)
		waypoint = waypointList[1]
	end

	return waypoint
end

function GetNextWaypoint(playerID, routeID, previousWaypoint) -- return {X=x ,Y=y}

	local bDebug = true

	Dprint("   - testing next destination waypoint...", bDebug)

	local waypoint = nil
	local civID = GetCivIDFromPlayerID(playerID)
	local waypointList = g_TroopsRoutes[civID][routeID].WaypointList
	if not waypointList then
		Dprint("      - no waypoints for this route...", bDebug)
		return nil -- this route has no waypoint... How do we get here ?
	end

	if g_TroopsRoutes[civID][routeID].RandomWaypoint and not bForceSequential then
		-- route use one random waypoint
		Dprint("      - only one random waypoint for this route !", bDebug)
		return nil
	else
		-- route use fixed waypoint
		for i, destination in ipairs(waypointList) do
			if destination == previousWaypoint and i < #waypointList then
				Dprint("      - set next waypoint !", bDebug)
				waypoint = waypointList[i+1]
			end
		end
	end

	return waypoint
end

--------------------------------------------------------------
-- Test 
--------------------------------------------------------------

-- Return military strenght of player in specified rectangular area
function GetLandForceInArea(player, x1, y1, x2, y2)
	
	if x1 >= x2 or y1 >= y2 then -- x1,y1 must be bottom right of rectangular area
		Dprint("- WARNING : called GetLandForceInArea() with x1 >= x2 or y1 >= y2 ")
		return 0
	end

	local force = 0
	if player and player:IsAlive() then
		for unit in player:Units() do
			if	(unit:GetDomainType() == DomainTypes.DOMAIN_LAND)
			and	(unit:GetX() >= x1) and (unit:GetX() <= x2)
			and	(unit:GetY() >= y1) and (unit:GetY() <= y2)
			then
				force = force + (unit:GetBaseCombatStrength()*unit:GetCurrHitPoints())
			end
		end
	end
	return force
end


-- Return military strenght of player's opponents in specified rectangular area
function GetEnemyLandForceInArea( player, x1, y1, x2, y2 ) 

	local bDebug = true
	local playerID = player:GetID()
	local enemyForce = 0

	for otherID = 0, GameDefines.MAX_PLAYERS - 1 do
		local other = Players[otherID]
		if other and other:IsAlive() and playerID ~= otherID and AreAtWar( playerID, otherID) then
			enemyForce = enemyForce + GetLandForceInArea(other, x1, y1, x2, y2)
		end				
	end
	return enemyForce
end


-- Return military strenght of player's team in specified rectangular area
function GetTeamLandForceInArea( player, x1, y1, x2, y2 ) 

	local bDebug = true
	local playerID = player:GetID()
	local teamForce = 0

	for otherID = 0, GameDefines.MAX_PLAYERS - 1 do
		local other = Players[otherID]
		if other and other:IsAlive() and other:GetTeam() == player:GetTeam() then
			teamForce = teamForce + GetLandForceInArea(other, x1, y1, x2, y2)
		end
	end
	return teamForce
end


-- Return military strenght of same side players in specified rectangular area
function GetSameSideLandForceInArea( player, x1, y1, x2, y2 ) 

	local bDebug = true
	local playerID = player:GetID()
	local force = 0

	for otherID = 0, GameDefines.MAX_PLAYERS - 1 do
		local other = Players[otherID]
		if other and other:IsAlive() and AreSameSide( playerID, otherID) then
			force = force + GetLandForceInArea(other, x1, y1, x2, y2)
		end
	end
	return force
end


-- Check