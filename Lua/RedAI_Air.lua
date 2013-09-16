-- Lua Red Air AI
-- Author: Gedemon
-- DateCreated: 8/26/2012 10:23:42 PM
--------------------------------------------------------------

print("Loading Red Air AI Functions...")
print("-------------------------------------")

g_bAIDebug = true

--------------------------------------------------------------
-- Interceptors AI
--------------------------------------------------------------
g_AI_Interceptors = {}
g_AI_UnitPreviousPositions = {}
g_AirSweep = {}


function SetAIInterceptors(unit)
	if unit:GetDomainType() == DomainTypes.DOMAIN_AIR 
		--and unit:IsHasPromotion( GameInfo.UnitPromotions.PROMOTION_INTERCEPTION_IV.ID )
		and unit:CurrInterceptionProbability() > 0
		and unit:GetMoves() > 0 -- don't bother if unit has already be used for something else (like force healing)...
		then
		Dprint("Checking for interception mission...", g_bAIDebug)
		
		local unitKey = GetUnitKey(unit)

		-- first, get last turns attacks in this unit range
		local turn = Game.GetGameTurn()
		local numAttacks = 0
		local maxTurnAttack = INTERCEPTOR_MAX_TURNS_ATTACK
		local notIntercepted = {}
		local bDebugStrategy = true
		for i, data in ipairs(g_AirBombing) do						
			if (distanceBetween(unit:GetPlot(), GetPlotFromKey(data.PlotKey)) - 1) <= unit:Range() then
				numAttacks = numAttacks + 1
			elseif not data.CombatType == INTERCEPT then -- attack out of range and not intercepted by another fighter
				table.insert(notIntercepted, data.PlotKey)
			end
		end

		-- second, get num intercepting unit on that plot 
		local numInterceptors = 0
		for i, data in ipairs(g_AI_Interceptors) do
			local interceptor = GetUnitFromKey(data.Key)
			if unit:GetPlot() == interceptor:GetPlot() then
				numInterceptors = numInterceptors + 1
			end
		end

		-- check ratio
		local bNeedInterceptor = true

		if numInterceptors > 0 then -- already an interceptor here, is it enough ?
			local ratio = numAttacks / numInterceptors
			if ratio <= INTERCEPTOR_RATIO_NEEDED then
				bNeedInterceptor = false
			end
		elseif numAttacks == 0 then -- no reported attacks lately, no need for interceptor
			bNeedInterceptor = false
		end
		

		--g_AI_UnitPreviousPositions[unit] = unit:GetPlot() -- save current position for next turn

		if bNeedInterceptor then -- we may need it here !

			Dprint(" - Forcing interception mission...", g_bAIDebug)
			local plot = unit:GetPlot()
			local moves = unit:GetMoves()
			unit:PopMission()
			unit:PushMission(MissionTypes.MISSION_AIRPATROL, 0, 0, 0, 0, 1, MissionTypes.MISSION_AIRPATROL, plot, unit)
			unit:SetMoves(0)
			table.insert(g_AI_Interceptors, {Key = GetUnitKey(unit), Moves = moves })
			MapModData.RED.UnitData[unitKey].OrderType = RED_INTERCEPTION
			Dprint("----------", g_bAIDebug)
			return true  -- mission acomplished

		else -- we can rebase if needed elsewhere

			Dprint(" - Not needed here, check for rebase possibility", g_bAIDebug)
			-- create possibleDestination table sorted by distance from unit...
			local rebaseRange = unit:Range() * GameDefines.AIR_UNIT_REBASE_RANGE_MULTIPLIER / 100
			local testedPlot = {}
			local possibleDestination = {}
			for i, plotKey in ipairs(notIntercepted) do			
				local plot = GetPlotFromKey(plotKey)
				local city = GetCloseCity ( unit:GetOwner(), plot, true)
				local cityHPLeft = GameDefines.MAX_CITY_HIT_POINTS - city:GetDamage()
				if cityHPLeft >= MIN_HP_LEFT_REBASE_CITY then
					local cityPlot = city:Plot()
					if not testedPlot[plot] then -- register only once
						local distanceToCity = (distanceBetween(cityPlot, unit:GetPlot()) - 1)
						local distanceFromCityToBombardedPlot = (distanceBetween(cityPlot, plot) - 1)
						Dprint("  - Need interceptor at " .. city:GetName() .. " at plot ".. cityPlot:GetX() ..",".. cityPlot:GetY() .."( distance to city = " .. tostring(distanceToCity) .."), distance from city to bombarded plot = " .. tostring(distanceFromCityToBombardedPlot) .. ", unit range = "..unit:Range(), g_bAIDebug)
						if distanceFromCityToBombardedPlot <= unit:Range() then
							Dprint("    Interceptor range will cover the attacked plot, mark city as potential destination...", g_bAIDebug)
							table.insert (possibleDestination, {City = city, Distance = distanceToCity})
						else						
							Dprint("    Interceptor range won't help there...", g_bAIDebug)
						end
					end
				else
					Dprint("  - Need interceptor at " .. city:GetName() .. ", but city HP left is inferior to minimum for rebasing : " .. MIN_HP_LEFT_REBASE_CITY, g_bAIDebug)
				end
				testedPlot[plot] = true
			end
			table.sort(possibleDestination, function(a,b) return a.Distance > b.Distance end) -- shorter distance first...

			for i, data in ipairs(possibleDestination) do
			
				local city = data.City
				local cityPlot = city:Plot()
				Dprint(" - Trying to rebase to " .. city:GetName(), g_bAIDebug)
				if data.Distance <= rebaseRange then
					Dprint("  - Forcing rebase mission...", g_bAIDebug )
					unit:PopMission()
					unit:PushMission(MissionTypes.MISSION_REBASE, cityPlot:GetX(), cityPlot:GetY(), 0, 0, 1, MissionTypes.MISSION_REBASE, unit:GetPlot(), unit)
					return true -- mission acomplished
				else
					Dprint("   - Can't reach city directly, try to find route...", g_bAIDebug)
					local status, coordPath = CalculatePathNodes(unit:GetPlot(), cityPlot, rebaseRange, unit:GetOwner())
					if status then
						local newX = coordPath[#coordPath][1]
						local newY = coordPath[#coordPath][2]
						local newPlot = GetPlot(newX,newY)
						local newCity = newPlot:GetPlotCity()
						Dprint("    - Find route via " .. newCity:GetName(), g_bAIDebug )
						Dprint("    - Forcing rebase mission...", g_bAIDebug )
						unit:PopMission()
						unit:PushMission(MissionTypes.MISSION_REBASE, newPlot:GetX(), newPlot:GetY(), 0, 0, 1, MissionTypes.MISSION_REBASE, unit:GetPlot(), unit)
						--g_AI_UnitPreviousPositions[unit] = newPlot -- mark previous plot as current one so unit can move directly to next node on route if not needed in intermediate city
						
						MapModData.RED.UnitData[unitKey].OrderType = RED_REBASE
						MapModData.RED.UnitData[unitKey].OrderReference = GetPlotKey ( cityPlot )
						
						return true -- mission acomplished
					end
				end
			end

			Dprint(" - No new base found...", g_bAIDebug)
			
			MapModData.RED.UnitData[unitKey].OrderType = nil
			MapModData.RED.UnitData[unitKey].OrderReference = nil

		end
		return false
	end
end
function ClearAIInterceptors()
	Dprint("Clearing Interceptors table... ", g_bAIDebug)
	Dprint("-------------------------------------", g_bAIDebug)
	
	--ShowInterceptors()

	local toRemove = {}
	for i, data in ipairs(g_AI_Interceptors) do
		local unit = GetUnitFromKey(data.Key)
		if not unit then -- unit can be killed or upgraded during the turn, simply remove it from table then
			table.insert(toRemove, i)
		else
			local player = Players[unit:GetOwner()]
			if not player:IsTurnActive() then -- remove unit of previous player
				unit:SetMoves(data.Moves) -- restore their moves now that the previous AI won't try to move them...
				table.insert(toRemove, i)
			end
		end
	end
	
	for n, index in ipairs(toRemove) do
		table.remove(g_AI_Interceptors, index)
	end
end
--GameEvents.PlayerDoTurn.Add(ClearAIInterceptors) -- called in AIUnitControl()


function ClearAIairSweep()
	Dprint("Clearing Air Sweep table... ", g_bAIDebug)
	Dprint("-------------------------------------", g_bAIDebug)	
	g_AirSweep = {}
end
-- add at end of turn

function GoAirSweep(unit)
	if unit:GetDomainType() == DomainTypes.DOMAIN_AIR 
		--and unit:IsHasPromotion( GameInfo.UnitPromotions.PROMOTION_INTERCEPTION_IV.ID )
		and unit:CurrInterceptionProbability() > 0
		and unit:GetMoves() > 0 -- don't bother if unit has already be used for something else (like force healing)...
		then
		Dprint("Checking for air sweep mission...", g_bAIDebug)
		
		local unitKey = GetUnitKey(unit)

		-- first, get last turns interception in this unit range
		local turn = Game.GetGameTurn()
		local numAttacks = 0
		local interceptedInRange = {}
		local interceptedOutRange = {}
		local interception = {}

		-- to do : create a table before itering all units
		for i, data in ipairs(g_AirInterception) do
								
			if (distanceBetween(unit:GetPlot(), GetPlotFromKey(data.PlotKey)) - 1) <= unit:Range() then -- there was an enemy interception made in range of this fighter
				table.insert(interceptedInRange, data.PlotKey)
				if interception[data.PlotKey] then
					interception[data.PlotKey] = interception[data.PlotKey] + 1
				else
					interception[data.PlotKey] = 1
				end
			else -- interception out of range
				table.insert(interceptedOutRange, data.PlotKey)
				if interception[data.PlotKey] then
					interception[data.PlotKey] = interception[data.PlotKey] + 1
				else
					interception[data.PlotKey] = 1
				end
			end
		end

		local bAirSweep = false

		for i, plotKey in pairs(interceptedInRange) do

			if not g_AirSweep[plotKey] then
				g_AirSweep[plotKey] = 0
			end

			if 	interception[plotKey] > g_AirSweep[plotKey] * AIRSWEEP_RATIO_NEEDED then
				Dprint("- Forcing Air Sweep mission...", g_bAIDebug)
				local plot = GetPlotFromKey(plotKey)
				unit:PopMission()
				unit:PushMission(MissionTypes.MISSION_AIR_SWEEP, plot:GetX(), plot:GetY(), 0, 0, 1, MissionTypes.MISSION_AIR_SWEEP, plot, unit)
				g_AirSweep[plotKey] = g_AirSweep[plotKey] + 1
				return  -- mission acomplished
			end
		end

		-- no airsweep in range, we can rebase if needed elsewhere

		Dprint("- Not needed here, check for rebase possibility", g_bAIDebug)
		-- create possibleDestination table sorted by distance from unit...
		local rebaseRange = unit:Range() * GameDefines.AIR_UNIT_REBASE_RANGE_MULTIPLIER / 100
		local testedPlot = {}
		local possibleDestination = {}
		for i, plotKey in ipairs(interceptedOutRange) do
			
			if not g_AirSweep[plotKey] then
				g_AirSweep[plotKey] = 0
			end

			if 	interception[plotKey] > g_AirSweep[plotKey] then					
				local plot = GetPlotFromKey(plotKey)
				local city = GetCloseCity ( unit:GetOwner(), plot, true)
				local cityHPLeft = GameDefines.MAX_CITY_HIT_POINTS - city:GetDamage()
				if cityHPLeft >= MIN_HP_LEFT_REBASE_CITY then
					local cityPlot = city:Plot()
					if not testedPlot[plot] then -- register only once
						local distanceToCity = (distanceBetween(cityPlot, unit:GetPlot()) - 1)
						local distanceFromCityToBombardedPlot = (distanceBetween(cityPlot, plot) - 1)
						Dprint(" - Need air superiority at " .. city:GetName() .. " at plot ".. cityPlot:GetX() ..",".. cityPlot:GetY() .."( distance to city = " .. tostring(distanceToCity) .."), distance from city to intercepted plot = " .. tostring(distanceFromCityToBombardedPlot) .. ", unit range = "..unit:Range(), g_bAIDebug)
						if distanceFromCityToBombardedPlot <= unit:Range() then
							Dprint("   Fighter range will cover the intercepted plot, mark city as potential destination...", g_bAIDebug)
							table.insert (possibleDestination, {City = city, Distance = distanceToCity})
						else						
							Dprint("   Fighter range won't help there...", g_bAIDebug)
						end
					end
				else
					Dprint(" - Need air superiority at " .. city:GetName() .. ", but city HP left is inferior to minimum for rebasing : " .. MIN_HP_LEFT_REBASE_CITY, g_bAIDebug)
				end
				testedPlot[plot] = true
			end
		end
		table.sort(possibleDestination, function(a,b) return a.Distance > b.Distance end) -- shorter distance first...

		for i, data in ipairs(possibleDestination) do
			
			local city = data.City
			local cityPlot = city:Plot()
			Dprint("- Trying to rebase to " .. city:GetName(), g_bAIDebug)
			if data.Distance <= rebaseRange then
				Dprint(" - Forcing rebase mission...", g_bAIDebug )
				unit:PopMission()
				unit:PushMission(MissionTypes.MISSION_REBASE, cityPlot:GetX(), cityPlot:GetY(), 0, 0, 1, MissionTypes.MISSION_REBASE, unit:GetPlot(), unit)
				return true -- mission acomplished
			else
				Dprint(" - Can't reach city directly, try to find route...", g_bAIDebug)
				local status, coordPath = CalculatePathNodes(unit:GetPlot(), cityPlot, rebaseRange, unit:GetOwner())
				if status then
					local newX = coordPath[#coordPath][1]
					local newY = coordPath[#coordPath][2]
					local newPlot = GetPlot(newX,newY)
					local newCity = newPlot:GetPlotCity()
					Dprint("   Find route via " .. newCity:GetName(), g_bAIDebug )
					Dprint("   Forcing rebase mission...", g_bAIDebug )
					unit:PopMission()
					unit:PushMission(MissionTypes.MISSION_REBASE, newPlot:GetX(), newPlot:GetY(), 0, 0, 1, MissionTypes.MISSION_REBASE, unit:GetPlot(), unit)
					g_AI_UnitPreviousPositions[unit] = newPlot -- mark previous plot as current one so unit can move directly to next node on route if not needed in intermediate city

					MapModData.RED.UnitData[unitKey].OrderType = RED_REBASE
					MapModData.RED.UnitData[unitKey].OrderReference = GetPlotKey ( cityPlot )

					return true -- mission acomplished
				end
			end
		end

		Dprint("- No new base found, leave " .. unit:GetNameNoDesc() .." to AI control", g_bAIDebug)

		MapModData.RED.UnitData[unitKey].OrderType = nil
		MapModData.RED.UnitData[unitKey].OrderReference = nil
		return false
	end
end