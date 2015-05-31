-- RedAI_Move
-- Author: Gedemon
-- DateCreated: 21-May-15 04:11:38
--------------------------------------------------------------

print("Loading Red AI Movement Functions...")
print("-------------------------------------")

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

			local bReachedLandingPlot = false
			if not unit:IsEmbarked() then -- the unit should be set to disembarked before this is called			
				local destinationDistance = distanceBetween(plot, GetPlot(destination.X,destination.Y))
				if destinationDistance < MAX_LANDING_PLOT_DISTANCE then
					bReachedLandingPlot = true -- close enough
				end
			end

			if bReachedLandingPlot then -- for exact destination we'd use (destination.X == x and destination.Y == y) but that may be problemetic to remove the promotion of an embarked unit if the destination plot is set on water by mistake in the route table 
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
				Dprint ("  - testing reserve needed (" .. route.ReserveUnits .. " must stay) and minimum units en route (" .. route.MinUnits .. ") for reinforcement vs number of available units in the area: " .. #listUnits , bDebug)
				if condition and route.ReserveUnits + route.MinUnits <= #listUnits then -- there are enough free units here !	
					Dprint ("  - reserve ok, checking units already en route...", bDebug)
					local NumUnitsEnRoute = GetNumUnitsEnRoute(routeID)
					if route.MaxUnits and NumUnitsEnRoute < route.MaxUnits then
						Dprint ("  - max number of units en route not reached (max =" .. tostring(route.MaxUnits) ..", actual = ".. tostring(NumUnitsEnRoute) .."), marking possible route...", bDebug)
						local rand = math.random(1, 10)
						if rand * route.Priority > priority then -- mark this route as choosen to send reinforcement
							priority = rand * route.Priority
							routeID = id
							availableUnits = listUnits
						end
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