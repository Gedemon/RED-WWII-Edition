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
				if MapModData.RED.UnitData[unitKey].OrderType == RED_MOVE then 
					MoveUnitTo (unit, GetPlot (MapModData.RED.UnitData[unitKey].OrderObjective.X, MapModData.RED.UnitData[unitKey].OrderObjective.Y )) -- moving...
				end
				if MapModData.RED.UnitData[unitKey].OrderType == RED_MOVE_TO_EMBARKED_WAYPOINT then 
					-- special check here in case something has gone wrong somewhere <- to do : find where !
					if not unit:IsEmbarked() then
						-- we are going to a waypoint on water, but we are not embarked ?
						-- try to allow that now
						unit:SetHasPromotion(PROMOTION_EMBARKATION, true)
					end
					MoveUnitTo (unit, GetPlot (MapModData.RED.UnitData[unitKey].OrderObjective.X, MapModData.RED.UnitData[unitKey].OrderObjective.Y )) -- moving...
				end
			end			
			
			-- Try to force healing or do more action
			if not ForceHealing(unit) then
				-- nothig more for land units
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
			local bIsConvoy = false
			if MapModData.RED.UnitData[unitKey].OrderType then
				if MapModData.RED.UnitData[unitKey].OrderType == RED_CONVOY then
					MoveConvoy(unit)
					bIsConvoy = true
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

			-- Try to force healing or do more action
			if (not bIsConvoy) and (not ForceHealing(unit)) then -- check if it's a convoy first, it could have reached it's destination, and we don't want it do do anything at this point anyway
				GoSubHunting(unit) -- launch destroyers/cruisers against reported subs
			end

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

			-- Try to force healing or do more action
			if not ForceHealing(unit) then			
				SetAIInterceptors(unit) -- set Fighters on interception mission
				GoAirSweep(unit) -- set Fighters on sweeping mission
			end

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
								if CanSharePlot(unit, plot) then
									Dprint ("   - Attacking sub !", g_bAIDebug)
									unit:PopMission()
									unit:PushMission(MissionTypes.MISSION_MOVE_TO, plot:GetX(), plot:GetY(), 0, 1, 0, MissionTypes.MISSION_MOVE_TO, plot, unit)
									unit:PushMission(MissionTypes.MISSION_RANGE_ATTACK, testUnit:GetX(), testUnit:GetY(), 0, 1, 0, MissionTypes.MISSION_RANGE_ATTACK, adjPlot, unit)
								else
									Dprint ("   - but there is another unit on the attacker plot", g_bAIDebug)
								end
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
		return false
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
			if not disbandingWoundedUnit(unit) then 
				GoHealing(unit)
			end
			return true -- unit need to heal (or has been disbanded)
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
			if not disbandingWoundedUnit(unit) then 
				GoHealing(unit)
			end
			return true -- unit need to heal (or has been disbanded)
		else			
			Dprint("  - Don't need to be healed... (health ratio = " .. healthRatio ..")", bDebug)
		end
	end
	return false -- unit did not need to heal
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
		--if IsNearNavalFriendlyCity(unitPlot, playerID) then
		if IsInNavalFriendlyCity(unitPlot, playerID) then
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
		if not IsNoSupply(unit) then
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

-- 
function disbandingWoundedUnit(unit)

	Dprint("Check if the AI want to disband that wounded unit...")

	local iPlayer = unit:GetOwner()
	local pPlayer = Players[iPlayer]
	local iUnitsSupplied = pPlayer:GetNumUnitsSupplied();
	local iUnitsTotal = pPlayer:GetNumUnits()
	local iUnitsLeft = iUnitsSupplied - iUnitsTotal

	local iUnitType = unit:GetUnitType()

	local bLimitedSupply = false
	
	if  (IsLimitedByRatio(iUnitType, iPlayer)) then -- Disband when we have reach the max limit for that type of unit
		Dprint("Unit is limited by ratio...")
		bLimitedSupply = true
	end

	if (AI_UNIT_SUPPLY_THRESHOLD and iUnitsLeft <= AI_UNIT_SUPPLY_THRESHOLD) then  -- If there are no ratio limit, disband when we are near the max supply limit
		Dprint("Player is near (or above) supply limit (".. tostring(iUnitsLeft) .." left) ")
		bLimitedSupply = true
	end

	--
	-- to do: check for experience above average, materiel/personnel/oil reserves and consumption
	--

	if bLimitedSupply and (not IsLimitedNumber(iUnitType)) then -- UNIT_SUPPORT_LIMIT_FOR_AI and 
	
		-- check for minimal number of units left before disbanding
		if (AI_MINIMAL_RESERVE and iUnitsTotal <= AI_MINIMAL_RESERVE) then
			Dprint("But there is not enough unit left (".. tostring(iUnitsTotal) .." units / ".. tostring(AI_MINIMAL_RESERVE) .." minimum allowed")	
			return false
		end

		-- also check for minimum in domain if required !
		if AI_LAND_MINIMAL_RESERVE and unit:GetDomainType() == DomainTypes.DOMAIN_LAND and CountDomainUnits (iPlayer, iUnitType) <= AI_LAND_MINIMAL_RESERVE then
			Dprint("But there is not enough unit of this domain left !")
			return false
		elseif AI_AIR_MINIMAL_RESERVE and unit:GetDomainType() == DomainTypes.DOMAIN_AIR and CountDomainUnits (iPlayer, iUnitType) <= AI_AIR_MINIMAL_RESERVE then	
			Dprint("But there is not enough unit of this domain left !")	
			return false
		elseif AI_SEA_MINIMAL_RESERVE and unit:GetDomainType() == DomainTypes.DOMAIN_SEA and CountDomainUnits (iPlayer, iUnitType) <= AI_SEA_MINIMAL_RESERVE then
			Dprint("But there is not enough unit of this domain left !")
			return false
		end

		Dprint("Disbanding unit...")
		Disband(unit)
		return true
	end
	return false
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
