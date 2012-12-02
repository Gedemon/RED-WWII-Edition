-- Lua RedReinforcements
-- Author: Gedemon
-- DateCreated: 7/19/2011 11:18:03 PM
--------------------------------------------------------------

print("Loading Red Reinforcements Functions...")
print("-------------------------------------")

function GetPersonnelReinforcement (playerID, reinforcementData)
	
	-- use passed table (from toppanel) or  global table (from redmain context)
	-- passed table is loaded from previous turn save, toppanel display show previous turn data
	local reinforcementData = reinforcementData or g_ReinforcementData

	local player = Players[playerID]

	local fromGlobal = math.floor ( player:CalculateTotalYield(YieldTypes.YIELD_FOOD) / 2) --/ player:GetTotalPopulation() * 25)
	local fromHospital, fromPropaganda, fromRecruiting, fromNeedYou, fromTrait, fromMinor, fromScenario = 0, 0, 0, 0, 0, 0, 0
	
	local handicap = GetHandicapForRED(player)

	-- Bonus from scenario
	if SCENARIO_PERSONNEL_PER_TURN and not player:IsMinorCiv() then
		fromScenario = Round(SCENARIO_PERSONNEL_PER_TURN / ((handicap + 2 ) /2) )
	end

	for city in player:Cities() do
		-- to do : link with city population
		local ratio = 100
		if city:GetOriginalOwner() ~= city:GetOwner() then ratio = CAPTURED_REINFORCEMENT_PERCENT; end
		if city:IsOccupied() then ratio = OCCUPIED_REINFORCEMENT_PERCENT; end
		if city:IsResistance() then ratio = 0; end
		if city:IsHasBuilding(HOSPITAL) then fromHospital = fromHospital + math.ceil((20) * ratio / 100); end -- to do: link to wounded personnel ?
		if city:IsHasBuilding(RADIO) then fromPropaganda = fromPropaganda + math.ceil((10) * ratio / 100); end -- to do: link to city population
		if city:IsHasBuilding(ACADEMY) then fromRecruiting = fromRecruiting + math.ceil(25 * ratio / 100); end
		if city:IsHasBuilding(BARRACKS) then fromRecruiting = fromRecruiting + math.ceil(15 * ratio / 100); end
		if city:GetProductionProcess() == RECRUITING then fromNeedYou = fromNeedYou + math.ceil(((city:FoodDifferenceTimes100() / 100)) * ratio / 100); end
	end

	local total = fromGlobal + fromHospital + fromPropaganda + fromRecruiting + fromNeedYou + fromScenario

	-- apply soviet trait
	if GetCivIDFromPlayerID (playerID) == USSR then		
		fromTrait = total
		total = total + fromTrait
	end

	-- apply minor help
	if not player:IsMinorCiv() and not player:IsBarbarian() then
		for i = GameDefines.MAX_MAJOR_CIVS, GameDefines.MAX_CIV_PLAYERS - 1 do
			local minor = Players[i]
			if minor:IsAlive() then
				local favorite = minor:GetMinorCivFavoriteMajor()
				local friendship = minor:GetMinorCivFriendshipWithMajor(playerID)
				if friendship > 30 and reinforcementData[i] then
				--if favorite == playerID and reinforcementData[i] then -- g_ReinforcementData not available in toppanel ?
					local flux = tonumber(reinforcementData[i].FluxPersonnel) or 0
					local personnel = tonumber(reinforcementData[i].Personnel) or 0
					local level = minor:GetMinorCivFriendshipLevelWithMajor(favorite)
					local ratio, bonus = 0, 0
					if level == 2 then ratio = ALLY_REINFORCEMENT_PERCENT; end -- Allied
					if level == 1 then ratio = FRIEND_REINFORCEMENT_PERCENT; end -- Friend
					if flux > personnel then
						bonus = math.ceil(personnel*ratio/100)
					else
						bonus = math.ceil(flux*ratio/100)
					end
					-- apply change here only if g_ReinforcementData exist (redmain context, for calculation)
					if g_ReinforcementData[i] then
						--g_ReinforcementData[i].Personnel = personnel - bonus
						--g_ReinforcementData[i].FluxPersonnel = flux - bonus
					end
					fromMinor = fromMinor + bonus
					--Dprint(" - " .. minor:GetName() .. " send " .. bonus .. " troops to reinforce " .. player:GetName() .. " (total reinforcements from allies is " .. fromMinor .. ")" )
				end
			end
		end
	end

	total = total + fromMinor
	--Dprint ("   return personnel : " .. total ..",".. fromGlobal ..",".. fromHospital..",".. fromPropaganda..",".. fromRecruiting..",".. fromTrait..",".. fromNeedYou..",".. fromMinor)
	return total, fromGlobal, fromHospital, fromPropaganda, fromRecruiting, fromTrait, fromNeedYou, fromMinor, fromScenario
end

function GetMaterielReinforcement (playerID, reinforcementData)
	local reinforcementData = reinforcementData or g_ReinforcementData -- use passed table (from toppanel) or  global table (from redmain context)

	local player = Players[playerID]
	local fromGlobal = math.floor ( player:CalculateTotalYield(YieldTypes.YIELD_PRODUCTION) / 2 ) --/ 10 )
	local fromFactory, fromHarbor, fromWarBonds, fromMinor, fromScenario = 0, 0, 0, 0, 0

	-- Bonus from scenario
	local handicap = GetHandicapForRED(player)
	if SCENARIO_MATERIEL_PER_TURN and not player:IsMinorCiv() then
		fromScenario = Round(SCENARIO_MATERIEL_PER_TURN / ((handicap + 2 ) /2) )
	end

	for city in player:Cities() do
		-- to do : link with city production
		local ratio = 100
		if city:GetOriginalOwner() ~= city:GetOwner() then ratio = CAPTURED_REINFORCEMENT_PERCENT; end
		if city:IsOccupied() then ratio = OCCUPIED_REINFORCEMENT_PERCENT; end
		if city:IsResistance() then ratio = 0; end
		if city:IsHasBuilding(FACTORY) then fromFactory = fromFactory + math.ceil((20) * ratio / 100); end
		if city:IsHasBuilding(LAND_FACTORY) then fromFactory = fromFactory + math.ceil((15) * ratio / 100); end
		if city:IsHasBuilding(SMALL_AIR_FACTORY) then fromFactory = fromFactory + math.ceil((5) * ratio / 100); end
		if city:IsHasBuilding(MEDIUM_AIR_FACTORY) then fromFactory = fromFactory + math.ceil((5) * ratio / 100); end
		if city:IsHasBuilding(LARGE_AIR_FACTORY) then fromFactory = fromFactory + math.ceil((5) * ratio / 100); end
		if city:IsHasBuilding(SHIPYARD) then fromFactory = fromFactory + math.ceil((15) * ratio / 100); end
		if city:IsHasBuilding(HARBOR) then fromHarbor = fromHarbor + math.ceil((10) * ratio / 100); end -- to do: no prod when blockaded
		if city:GetProductionProcess() == WAR_BONDS then fromWarBonds = fromWarBonds + math.ceil(((((city:GetCurrentProductionDifferenceTimes100(false, false) / 100) + (city:GetYieldRateTimes100(YieldTypes.YIELD_GOLD) / 100))/2)) * ratio / 100); end -- Hey, Firaxis, you could have used simplier callbacks here...
	end
	
	-- apply minor help
	if not player:IsMinorCiv() and not player:IsBarbarian() then
		for i = GameDefines.MAX_MAJOR_CIVS, GameDefines.MAX_CIV_PLAYERS - 1 do
			local minor = Players[i]
			if minor:IsAlive() then
				local favorite = minor:GetMinorCivFavoriteMajor()
				local friendship = minor:GetMinorCivFriendshipWithMajor(playerID)
				if friendship > 30 and reinforcementData[i] then
				--if favorite == playerID  and reinforcementData[i] then
					local flux = tonumber(reinforcementData[i].FluxMateriel) or 0
					local materiel = tonumber(reinforcementData[i].Materiel) or 0
					local level = minor:GetMinorCivFriendshipLevelWithMajor(favorite)
					local ratio, bonus = 0, 0
					if level == 2 then ratio = 50; end -- Allied
					if level == 1 then ratio = 20; end -- Friend
					if flux > materiel then  -- don't apply change here, called multiple times for display !!!
						bonus = math.ceil(materiel*ratio/100)
					else
						bonus = math.ceil(flux*ratio/100)
					end
					-- apply change here only if g_ReinforcementData exist (redmain context, for calculation)
					if g_ReinforcementData[i] then
						--g_ReinforcementData[i].Materiel = materiel - bonus
						--g_ReinforcementData[i].FluxMateriel = flux - bonus
					end
					fromMinor = fromMinor + bonus
				end
			end
		end
	end
	
	local total = fromGlobal + fromFactory + fromHarbor + fromWarBonds + fromMinor + fromScenario
	--Dprint ("   return materiel : " .. total ..",".. fromGlobal..",".. fromFactory.."," ..fromHarbor..",".. fromWarBonds..",".. fromMinor)
	return total, fromGlobal, fromFactory, fromHarbor, fromWarBonds, fromMinor, fromScenario
end

function GetMaxPersonnel (playerID)
	local player = Players[playerID]
	local realPopulation = player:GetRealPopulation()
	-- GetTotalPopulation
	local max = math.floor (realPopulation / 10000)
	for city in player:Cities() do
		-- +10 / city
		max = max + 10 
		if city:IsHasBuilding(BARRACKS) then max = max + 200; end
		if city:IsHasBuilding(BASE) then max = max + 500; end
	end
	-- Bonus from scenario
	if SCENARIO_MAX_PERSONNEL_BONUS then
		max = max + SCENARIO_MAX_PERSONNEL_BONUS
	end
	return max
end

function GetMaxMateriel (playerID)
	local player = Players[playerID]
	local max = 0
	for city in player:Cities() do
		-- +10 / city
		max = max + 10 
		if city:IsHasBuilding(FACTORY) then max = max + 50; end
		if city:IsHasBuilding(LAND_FACTORY) then max = max + 50; end
		if city:IsHasBuilding(HARBOR) then max = max + 50; end
		if city:IsHasBuilding(BASE) then max = max + 100; end
		if city:IsHasBuilding(ARSENAL) then max = max + 500; end
		if city:IsHasBuilding(SMALL_AIR_FACTORY) then max = max + 20; end
		if city:IsHasBuilding(MEDIUM_AIR_FACTORY) then max = max + 20; end
		if city:IsHasBuilding(LARGE_AIR_FACTORY) then max = max + 20; end
		if city:IsHasBuilding(SHIPYARD) then max = max + 50; end
	end
	-- Bonus from scenario
	if SCENARIO_MAX_MATERIEL_BONUS then
		max = max + SCENARIO_MAX_MATERIEL_BONUS
	end
	return max
end

function InitializeReinforcementTable()
	-- We could use directly g_ReinforcementData, just a leftover from loading/saving data in function
	--local reinforcementData = g_ReinforcementData
	local bDebug = true
	Dprint("-------------------------------------", bDebug)
	Dprint("Creating Reinforcements data table...", bDebug)

	for playerID = 0, GameDefines.MAX_CIV_PLAYERS - 1 do

		local player = Players[playerID]
		if (player:IsAlive()) then
			
			local civID = GetCivIDFromPlayerID ( playerID )

			local fluxPersonnel, persFromGlobal, persFromHospital, persFromPropaganda, persFromRecruiting, persFromTrait, persFromNeedYou, persFromMinor, persFromScenario = GetPersonnelReinforcement (playerID)
			local maxPersonnel = GetMaxPersonnel (playerID)
			local fluxMateriel, matFromGlobal, matFromFactory, matFromHarbor, matFromWarBonds, matFromMinor, matFromScenario = GetMaterielReinforcement (playerID)
			local maxMateriel = GetMaxMateriel (playerID)

			g_ReinforcementData[playerID] = {}
			g_ReinforcementData[playerID].Personnel = INITIAL_PERSONNEL_VALUE
			g_ReinforcementData[playerID].Materiel = INITIAL_MATERIEL_VALUE
			g_ReinforcementData[playerID].FluxPersonnel = fluxPersonnel
			g_ReinforcementData[playerID].FluxMateriel = fluxMateriel
			g_ReinforcementData[playerID].MaxPersonnel = maxPersonnel
			g_ReinforcementData[playerID].MaxMateriel = maxMateriel
		
			g_ReinforcementData[playerID].ReceivedPers = fluxPersonnel
			g_ReinforcementData[playerID].ReceivedMat = fluxMateriel
			g_ReinforcementData[playerID].PersFromGlobal = persFromGlobal
			g_ReinforcementData[playerID].PersFromHospital = persFromHospital
			g_ReinforcementData[playerID].PersFromPropaganda = persFromPropaganda
			g_ReinforcementData[playerID].PersFromRecruiting = persFromRecruiting
			g_ReinforcementData[playerID].PersFromTrait = persFromTrait
			g_ReinforcementData[playerID].PersFromNeedYou = persFromNeedYou
			g_ReinforcementData[playerID].PersFromMinor = persFromMinor
			g_ReinforcementData[playerID].PersFromScenario = persFromScenario
			g_ReinforcementData[playerID].MatFromGlobal = matFromGlobal
			g_ReinforcementData[playerID].MatFromFactory = matFromFactory
			g_ReinforcementData[playerID].MatFromHarbor = matFromHarbor
			g_ReinforcementData[playerID].MatFromWarBonds = matFromWarBonds
			g_ReinforcementData[playerID].MatFromMinor = matFromMinor
			g_ReinforcementData[playerID].MatFromScenario = matFromScenario
			g_ReinforcementData[playerID].TotalMatFromSupplyRoute = 0
			g_ReinforcementData[playerID].MatFromSupplyRoute = 0
			g_ReinforcementData[playerID].TotalPersFromSupplyRoute = 0
			g_ReinforcementData[playerID].PersFromSupplyRoute = 0
			
			Dprint("- " .. player:GetName() .. " has: +" .. fluxPersonnel .."/"..maxPersonnel.." personnel and +".. fluxMateriel .."/"..maxMateriel.." materiel")
						
		end
	end	
	Dprint("-------------------------------------", bDebug)
	SaveAllTable()
end

function Reinforcements(playerID) 

	local bDebug = true
	local player = Players[playerID]
	if ( player:IsAlive() ) then
			
		local value = g_ReinforcementData[playerID]

		if value == nil then
			Dprint("-------------------------------------", bDebug)
			Dprint("WARNING, no reinforcement data for "..player:GetName()..", skipping Reinforcement()...", bDebug)
			return
		end

		local personnel = tonumber(value.Personnel) or 0
		local materiel = tonumber(value.Materiel) or 0

		Dprint("-------------------------------------", bDebug)
		Dprint("Receving Global Reinforcements for "..player:GetName().."...", bDebug)

		local civID = GetCivIDFromPlayerID ( playerID )

		local fluxPersonnel, persFromGlobal, persFromHospital, persFromPropaganda, persFromRecruiting, persFromTrait, persFromNeedYou, persFromMinor, persFromScenario = GetPersonnelReinforcement (playerID)
		local maxPersonnel = GetMaxPersonnel (playerID)
		local fluxMateriel, matFromGlobal, matFromFactory, matFromHarbor, matFromWarBonds, matFromMinor, matFromScenario = GetMaterielReinforcement (playerID)
		local maxMateriel = GetMaxMateriel (playerID)
		
		-- Supply Routes
		-- to do : include in GetPersonnelReinforcement / GetMateriellReinforcement ?
		g_ReinforcementData[playerID].TotalPersFromSupplyRoute = g_ReinforcementData[playerID].PersFromSupplyRoute
		g_ReinforcementData[playerID].PersFromSupplyRoute = 0
		g_ReinforcementData[playerID].TotalMatFromSupplyRoute = g_ReinforcementData[playerID].MatFromSupplyRoute
		g_ReinforcementData[playerID].MatFromSupplyRoute = 0
		fluxPersonnel = fluxPersonnel + g_ReinforcementData[playerID].TotalPersFromSupplyRoute
		fluxMateriel = fluxMateriel + g_ReinforcementData[playerID].TotalMatFromSupplyRoute

		--
		g_ReinforcementData[playerID].Personnel = personnel + fluxPersonnel -- check for max value after applying reinforcement to units
		g_ReinforcementData[playerID].Materiel = materiel + fluxMateriel
		g_ReinforcementData[playerID].MaxPersonnel = maxPersonnel
		g_ReinforcementData[playerID].MaxMateriel = maxMateriel
		
		g_ReinforcementData[playerID].ReceivedPers = fluxPersonnel -- before reinforcements lower flux
		g_ReinforcementData[playerID].ReceivedMat = fluxMateriel -- before reinforcements lower flux
		g_ReinforcementData[playerID].PersFromGlobal = persFromGlobal
		g_ReinforcementData[playerID].PersFromHospital = persFromHospital
		g_ReinforcementData[playerID].PersFromPropaganda = persFromPropaganda
		g_ReinforcementData[playerID].PersFromRecruiting = persFromRecruiting
		g_ReinforcementData[playerID].PersFromTrait = persFromTrait
		g_ReinforcementData[playerID].PersFromNeedYou = persFromNeedYou
		g_ReinforcementData[playerID].PersFromMinor = persFromMinor
		g_ReinforcementData[playerID].PersFromScenario = persFromScenario
		g_ReinforcementData[playerID].MatFromGlobal = matFromGlobal
		g_ReinforcementData[playerID].MatFromFactory = matFromFactory
		g_ReinforcementData[playerID].MatFromHarbor = matFromHarbor
		g_ReinforcementData[playerID].MatFromWarBonds = matFromWarBonds
		g_ReinforcementData[playerID].MatFromMinor = matFromMinor
		g_ReinforcementData[playerID].MatFromScenario = matFromScenario
		
		Dprint("-------------------------------------", bDebug)
		Dprint("Sending Reinforcements to units...", bDebug)

		-- stock units in a table from higher damage to lower
		local damaged = {}	-- List of damaged units needing reinforcements, ordered by healt left	
		local healTable = {} -- This table store HP gained to apply en masse after all reinforcements are calculated (visual fix) 
		for n = 1, MAX_HP do -- maxHP from defines
			damaged[n] = {}
		end

		for unit in player:Units() do
			-- don't reinforce units out of range or totally healed
			if not (unit:IsHasPromotion(PROMOTION_NO_SUPPLY))
				and not (unit:IsHasPromotion(PROMOTION_NO_SUPPLY_SPECIAL_FORCES))
				and ( unit:GetCurrHitPoints() < unit:GetMaxHitPoints() )
				and not unit:IsEmbarked() -- land unit won't heal on sea or near harbor...
				and not unit:IsDead()
				then

				local unitType = unit:GetUnitType()
				local plot = unit:GetPlot()
				if ( GameInfo.Units[unitType].Domain ~= "DOMAIN_SEA" ) 
					or (GameInfo.Units[unitType].Domain == "DOMAIN_SEA" and (IsNearNavalFriendlyCity(plot, playerID) or plot:IsCity() )) 
					then -- To do : aircraft on carrier

					local hp = unit:GetCurrHitPoints()
					table.insert(damaged[hp], unit)
					local key = GetUnitKey(unit)
					healTable[key] = 0
				end
			end
		end

		-- try to reinforce the selected units
		-- up to MAX_HP_HEALED, 1hp per turn
		for healHP = 1, MAX_HP_HEALED do
			--for i, table in ipairs (damaged) do
			for n = 1, MAX_HP do -- maxHP from defines
				local unitTable = damaged[n]
				for j, unit in ipairs (unitTable) do
					local unitType = unit:GetUnitType()
					local key = GetUnitKey(unit)
					if (unit:GetCurrHitPoints() + healTable[key] < unit:GetMaxHitPoints()) then
						--Dprint("-------------------------------------")
						--Dprint("- units with ".. i .. "HP left")
						-- to do : add code to heal based on materiel & personnel left in the unit here
						-- to do : add code to remove materiel/personnel after combat

						-- ratio hp/(perso+materiel) set in defines
						--local key = GetUnitKey(unit)
						
						local reqMateriel, reqPersonnel = RequestedReinforcementsPerHP(unitType, unit)

						-- reinforce the units if the requested resources are available
						if (reqMateriel <= g_ReinforcementData[playerID].Materiel) and (reqPersonnel <= g_ReinforcementData[playerID].Personnel) then
							Dprint("  - reinforcement pass num".. healHP .." in the [" .. n .. "hp row] : ".. unit:GetName() .. " get 1 hp from ".. reqPersonnel .." personnel and " .. reqMateriel .." materiel", bDebug)
							healTable[key] = healTable[key] + 1 -- store +1 HP for this unit
							fluxPersonnel = fluxPersonnel - reqPersonnel
							fluxMateriel = fluxMateriel - reqMateriel
							g_ReinforcementData[playerID].Materiel = g_ReinforcementData[playerID].Materiel - reqMateriel
							g_ReinforcementData[playerID].Personnel = g_ReinforcementData[playerID].Personnel - reqPersonnel
						end
					end
				end
			end
		end

		-- Apply reinforcement from all passes to units in one call to SetDamage (fix visual display of one "+1" when the unit was getting possibly more)
		for key, hp in pairs (healTable) do
			local unit = GetUnitFromKey (key)
			if unit then
				local damage = unit:GetDamage()
				unit:SetDamage(damage-hp)
			end
		end

		-- round values, and check for maximum.
		g_ReinforcementData[playerID].Materiel = math.min(Round(g_ReinforcementData[playerID].Materiel), maxMateriel) 
		g_ReinforcementData[playerID].Personnel = math.min(Round(g_ReinforcementData[playerID].Personnel), maxPersonnel)
		g_ReinforcementData[playerID].FluxMateriel = Round(fluxMateriel)
		g_ReinforcementData[playerID].FluxPersonnel = Round(fluxPersonnel)

	end
end
-- add to GameEvents.PlayerDoTurn

-- will need this one ?
--Events.SerialEventUnitSetDamage.Add( OnChangeEvent )