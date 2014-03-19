-- R.E.D. Supply Routes Functions
-- Author: Gedemon
-- DateCreated: 2/10/2012 10:02:52 PM
--------------------------------------------------------------

-- to test: unit:GetPathEndTurnPlot()

print("Loading Red Supply Routes Functions...")
print("-------------------------------------")

--------------------------------------------------------------
-- Convoy Functions 
--------------------------------------------------------------

function TestConvoyDestination(destination, CivID, bIsMinor)
	local bDebug = true
	local convoyDestination = destination
	local plot = GetPlot (destination.X, destination.Y )
	Dprint("      - Testing destination plot at : " .. destination.X .. "," .. destination.Y , bDebug)
	if plot:IsCity() then
		local city = plot:GetPlotCity()
		Dprint("      - Plot is city...", bDebug)
		if city:GetOwner() == GetPlayerIDFromCivID( CivID, bIsMinor ) and not city:IsBlockaded() then
			Dprint("      - " .. city:GetName() .. " belongs to convoy's owner and is not blockaded !", bDebug)
		else
			Dprint("      - " .. city:GetName() .. " don't belongs to convoy's owner or is blockaded !", bDebug)
			convoyDestination = nil
		end
	else		
		Dprint("      - Destination is not a city, don't test...", bDebug)
	end
	return convoyDestination
end

function GetConvoyDestination(routeID, bForceSequential) -- return destination.X destination.Y
	local bDebug = true
	Dprint("   - testing possible destination...", bDebug)
	local convoyDestination = nil
	local destinationList = g_Convoy[routeID].DestinationList
	if g_Convoy[routeID].RandomDestination and not bForceSequential then
		local numTry = 0
		while not convoyDestination and numTry < 10 do -- check 10 random plots from list for spawning...
			local randPlot = math.random( 1, #destinationList )
			local destination = destinationList[randPlot]
			convoyDestination = TestConvoyDestination(destination, g_Convoy[routeID].CivID, g_Convoy[routeID].IsMinor)
			numTry = numTry + 1
		end
	else
		for i, destination in ipairs(destinationList) do
			if not convoyDestination then
				convoyDestination = TestConvoyDestination(destination, g_Convoy[routeID].CivID, g_Convoy[routeID].IsMinor)
			end
		end
	end
	return convoyDestination
end

function GetConvoyTransport(routeID)
	local bDebug = true
	Dprint("   - Define convoy transport type on : ".. g_Convoy[routeID].Name, bDebug)
	local transport
	if g_Convoy[routeID].Transport then
		transport = g_Convoy[routeID].Transport()
	else
		transport = {Type = TRANSPORT_DEFAULT, Reference = TRANSPORT_DEFAULT_REFERENCE }
	end
	return transport
end

function SpawnConvoy()
	local bDebug = true
	if g_Convoy then
		Dprint("-------------------------------------")
		Dprint ("Try to spawn convoy units...")
		Dprint("-------------------------------------")
		for routeID, data in ipairs(g_Convoy) do
			Dprint("- Checking maritime route: ".. g_Convoy[routeID].Name, bDebug)
			local rand = math.random( 1, 100 )
			local bSpawned = false
 			Dprint("   - Frequency = " .. data.Frequency .. ", random percent = " .. rand , bDebug)
			local condition
			if data.Condition then
				condition = data.Condition()
			else
				condition = true -- if no condition set, assume always true
			end

			local objective = GetConvoyDestination(routeID)
			
			if not objective then
				Dprint("      - Can't get a destination...", bDebug)
			end

			if not condition then
				Dprint("      - Condition is not true...", bDebug)
			end

			if condition and objective and rand < data.Frequency then
				local playerID = GetPlayerIDFromCivID( data.CivID, data.IsMinor )
				local player = Players [ playerID ]
				if data.RandomSpawn then
					local numTry = 0
					while not bSpawned and numTry < 10 do -- check 10 random plots from list for spawning...
						local spawnList = data.SpawnList
						local randPlot = math.random( 1, #spawnList )
 						Dprint("      - Random spawn position selection = " .. randPlot, bDebug)
						local plotPosition = spawnList[randPlot]
						bSpawned = InitConvoyUnit(playerID, plotPosition.X, plotPosition.Y, routeID)
						numTry = numTry + 1
					end
				else
					for i, plotPosition in ipairs(data.SpawnList) do
 						Dprint("      - Sequential spawn position selection = " .. i, bDebug)
						if not bSpawned then
							bSpawned = InitConvoyUnit(playerID, plotPosition.X, plotPosition.Y, routeID)
						end
					end
				end
			end
		end		
		Dprint("-------------------------------------")
	end
end
-- call from CommonOnNewTurn()

function InitConvoyUnit(playerID, x, y, routeID)
	local bDebug = true
	
	local plot = GetPlot(x, y)
	if IsSafePlot(plot, playerID) and plot:GetNumUnits() == 0 then
		local player = Players[playerID]
		local unit = player:InitUnit(CONVOY, x, y)
		if unit then
			RegisterNewUnit(player:GetID(), unit) -- force immediate registration to allow change in MapModData.RED.UnitData 
			local unitKey = GetUnitKey(unit)
			MapModData.RED.UnitData[unitKey].TotalControl = true
			MapModData.RED.UnitData[unitKey].OrderType = RED_CONVOY

			local objective = GetConvoyDestination(routeID)
			if not objective then
				Dprint("      - Can't get a destination...", bDebug)
				return false
			end
			MapModData.RED.UnitData[unitKey].OrderObjective = objective
			MapModData.RED.UnitData[unitKey].OrderReference = routeID

			local plot = GetPlot(objective.X,objective.Y)
			local strDestination = ""
			if plot:IsCity() then
				local city = plot:GetPlotCity()
				strDestination = city:GetName()
			else
				strDestination = " plot (".. objective.X .."," .. objective.Y ..")"
			end

			local transport = GetConvoyTransport(routeID)
			MapModData.RED.UnitData[unitKey].TransportType = transport.Type
			MapModData.RED.UnitData[unitKey].TransportReference = transport.Reference

			local strTransport = ""
			if transport.Type == TRANSPORT_MATERIEL then
				strTransport = transport.Reference .. " materiel"
			elseif transport.Type == TRANSPORT_PERSONNEL then
				strTransport = transport.Reference .. " personnel"
			elseif transport.Type == TRANSPORT_UNIT then 
				local unitInfo = GameInfo.Units[transport.Reference]
				local unitName = Locale.ConvertTextKey( unitInfo.Description ) .. " (" .. Locale.ToUpper(Locale.ConvertTextKey(GameInfo.UnitClasses[unitInfo.Class].Description)) .. ")"
				strTransport = "" .. unitName
			else -- gold then 
				strTransport = transport.Reference .. " gold"
			end

			player:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, "New convoy formed, transporting " .. strTransport .. " to " .. strDestination, "New convoy formed !", x, y)
			Dprint("      - Creating New convoy at ("..x..","..y.."), transporting " .. strTransport .. " to " .. strDestination, bDebug)
			--MoveUnitTo (unit, GetPlot (objective.X, objective.Y ))
			unit:SetMoves(0) -- don't move on first turn
			return true
		else
			Dprint("      - WARNING !!! convoy unit is nil at ("..x..","..y.."), for " .. player:GetName(), bDebug)
		end
	else
		Dprint("      - Plot is not safe...", bDebug)
	end

	return false

end

function UnloadConvoy(unit, playerID, x, y)
	local bDebug = true
	Dprint("  - Unloading convoy...", bDebug)
	
	local unitKey = GetUnitKey(unit)
	local transportType = MapModData.RED.UnitData[unitKey].TransportType
	local transportReference = MapModData.RED.UnitData[unitKey].TransportReference
	local player = Players[playerID]
	local healthRatio = unit:GetCurrHitPoints() / unit:GetMaxHitPoints()

	local plot = GetPlot(x,y)
	local strDestination = ""
	if plot:IsCity() then
		local city = plot:GetPlotCity()
		strDestination = city:GetName()
	else
		strDestination = " plot (".. x .."," .. y ..")"
	end

	if transportType == TRANSPORT_MATERIEL then
		local amount = math.ceil(transportReference * healthRatio)
		player:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, "Convoy has reached " .. strDestination .. ", delivering " .. amount .." materiel (" .. transportReference .." were loaded)", "Convoy unloading at " .. strDestination .." !", x, y)
		Dprint("      - was transporting ".. transportReference .." materiel, has delivered " .. amount , bDebug)
		MapModData.RED.ResourceData[playerID].MatFromSupplyRoute = MapModData.RED.ResourceData[playerID].MatFromSupplyRoute + amount

	elseif transportType == TRANSPORT_PERSONNEL then
		local amount = math.ceil(transportReference * healthRatio)
		player:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, "Convoy has reached " .. strDestination .. ", delivering " .. amount .." personnel (" .. transportReference .." were loaded)", "Convoy unloading at " .. strDestination .." !", x, y)
		Dprint("      - was transporting ".. transportReference .." personnel, has delivered " .. amount, bDebug)
		MapModData.RED.ResourceData[playerID].PersFromSupplyRoute = MapModData.RED.ResourceData[playerID].PersFromSupplyRoute + amount

	elseif transportType == TRANSPORT_UNIT then 
		player:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, "Convoy has reached " .. strDestination .. ", delivering an equiped unit", "Convoy unloading at " .. strDestination .." !", x, y)
		Dprint("      - was transporting an unit", bDebug)
		local newUnit = player:InitUnit(transportReference, x, y)
		newUnit:SetDamage( unit:GetMaxHitPoints() - (unit:GetMaxHitPoints()*healthRatio) )

	else -- gold then 
		local amount = math.ceil(transportReference * healthRatio)
		player:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, "Convoy has reached " .. strDestination .. ", delivering " .. amount .." gold (" .. transportReference .." were loaded)", "Convoy unloading at " .. strDestination .." !", x, y)
		Dprint("      - was transporting ".. transportReference .." gold, has delivered " .. amount, bDebug)
		player:ChangeGold(amount)
	end

	unit:Kill(true, -1)
end