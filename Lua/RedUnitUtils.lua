--------------------------------------------------------------
--------------------------------------------------------------
-- Lua RedUnitUtilss
-- Author: Gedemon
-- DateCreated: 8/27/2012 8:39: PM
--------------------------------------------------------------
--------------------------------------------------------------

print("Loading Red Units Utils...")
print("-------------------------------------")


--------------------------------------------------------------
-- Unit Utils 
--------------------------------------------------------------

-- return unique key for units table [unitID,playerID]
function GetUnitKey(unit)
	if unit then
		local ownerID = unit:GetOwner()
		local unitID = unit:GetID()
		local turn = unit:GetGameTurnCreated()
		local unitKey = unitID..","..ownerID..","..turn
		return unitKey
	else
		Dprint("- WARNING: unit is nil for GetUnitKey()")
	end
end

-- return the unit refered by the key string
function GetUnitFromKey ( unitKey )
	if MapModData.RED.UnitData[unitKey] then
		local pos = string.find(unitKey, ",")
		local unitID = tonumber(string.sub(unitKey, 1 , pos -1))
		local pos2 = string.find(unitKey, ",", pos+1)
		local playerID = tonumber(string.sub(unitKey, pos +1, pos2 -1))
		--local ownerID = MapModData.RED.UnitData[unitKey].OwnerID
		local unit = Players[playerID]:GetUnitByID(unitID)
		if unit then
			return unit
		else
			if MapModData.RED.UnitData[unitKey].Alive == nil then
				Dprint("- WARNING: unit is nil and alive is not set for GetUnitFromKey(), marking as dead")
				Dprint("--- UnitId = " .. MapModData.RED.UnitData[unitKey].UnitID ..", BuilderID = " .. MapModData.RED.UnitData[unitKey].BuilderID ..", Type = " .. MapModData.RED.UnitData[unitKey].Type )
				MapModData.RED.UnitData[unitKey].Alive = false
				return nil
			elseif MapModData.RED.UnitData[unitKey].Alive then
				Dprint("- WARNING: unit is marked alive but is nil for GetUnitFromKey(), marking as dead")
				Dprint("--- UnitId = " .. MapModData.RED.UnitData[unitKey].UnitID ..", BuilderID = " .. MapModData.RED.UnitData[unitKey].BuilderID ..", Type = " .. MapModData.RED.UnitData[unitKey].Type )
				MapModData.RED.UnitData[unitKey].Alive = false
				return nil
			else -- alive = false, don't return
				--Dprint("- WARNING: unit is nil for GetUnitFromKey()")
				--Dprint("--- UnitId = " .. MapModData.RED.UnitData[unitKey].UnitId ..", BuilderID = " .. MapModData.RED.UnitData[unitKey].BuilderID ..", Type = " .. MapModData.RED.UnitData[unitKey].Type )
				return nil
			end
		end
	else
		Dprint("- WARNING: MapModData.RED.UnitData[unitKey] is nil for GetUnitFromKey()")
		if unitKey then Dprint("--- unitKey =	" .. unitKey ) end
		if unitID then Dprint("--- unitID =		" .. unitID ) end
		if ownerID then Dprint("--- ownerID =	" .. ownerID ) end
		return nil
	end
end

-- return requested materiel and personnel for 1 HP healed
function RequestedReinforcementsPerHP(iUnitType, unit)

	local thisUnit = GameInfo.Units[iUnitType]

	local reqMateriel = thisUnit.Materiel
	local reqPersonnel = thisUnit.Personnel

	-- apply promotion
	-- to do: defines values

	local bonusPersonnel = 0
	local bonusMateriel = 0
	local malusPersonnel = 0
	local malusMateriel = 0
	if unit then
		if unit:IsHasPromotion(PROMOTION_MEDIC) then bonusPersonnel = bonusPersonnel + (reqPersonnel * 10 / 100) end
		if unit:IsHasPromotion(PROMOTION_FIELD_HOSPITAL) then bonusPersonnel = bonusPersonnel + (reqPersonnel * 30 / 100) end
		if unit:IsHasPromotion(PROMOTION_REPAIR) then bonusMateriel = bonusMateriel + (reqMateriel * 20 / 100) end
		if unit:IsHasPromotion(PROMOTION_AIR_REPAIR) then bonusMateriel = bonusMateriel + (reqMateriel * 20 / 100) end						
		if unit:IsHasPromotion(PROMOTION_SUPPLY) then bonusPersonnel = bonusPersonnel + (reqPersonnel * 30 / 100) end
		if unit:IsHasPromotion(PROMOTION_SUPPLY) then bonusMateriel = bonusMateriel + (reqMateriel * 20 / 100) end
		if unit:IsHasPromotion(PROMOTION_HEAVY) then malusMateriel = malusMateriel + (reqMateriel * 100 / 100) end
	end
	reqPersonnel = reqPersonnel - bonusPersonnel + malusPersonnel
	reqMateriel = reqMateriel - bonusMateriel + malusMateriel
	return reqMateriel, reqPersonnel
end

-- check if the unit is elligible for reinforcement
function CanGetReinforcement(unit)
	if not unit then
		return false
	end
	if not (unit:IsHasPromotion(PROMOTION_NO_SUPPLY))
		and not (unit:IsHasPromotion(PROMOTION_NO_SUPPLY_SPECIAL_FORCES))
		and ( unit:GetCurrHitPoints() < unit:GetMaxHitPoints() )
		and not unit:IsEmbarked() -- land unit won't heal on sea or near harbor...
		and not unit:IsDead()
		then

		local unitType = unit:GetUnitType()
		local plot = unit:GetPlot()
		if ( GameInfo.Units[unitType].Domain ~= "DOMAIN_SEA" ) 
			or (GameInfo.Units[unitType].Domain == "DOMAIN_SEA" and (IsNearNavalFriendlyCity(plot, unit:GetOwner()) or plot:IsCity() )) 
			then -- To do : aircraft on carrier

			return true
		end
	end
	return false
end

-- return num of units of this class already build for auto-naming
function CountUnitClass (unitClass, playerID)
	local num = 0

	for id, values in pairs (MapModData.RED.UnitData) do
		if (values.BuilderID == playerID
		and (
				values.NumType == g_Unit_Classes[unitClass].NumType
				or (IsArmorClass(values.NumType) and IsArmorClass(g_Unit_Classes[unitClass].NumType))
				or (IsFighterClass(values.NumType) and IsFighterClass(g_Unit_Classes[unitClass].NumType))
				or (IsBomberClass(values.NumType) and IsBomberClass(g_Unit_Classes[unitClass].NumType))
			)
		) then
			num = num +1
		end
	end

	return num
end

-- return num of units of this class (armor, fighter, bomber, ...) alive
function CountUnitClassAlive (unitClass, playerID)
	local bDebug = true
	local num = 0

	for key, values in pairs (MapModData.RED.UnitData) do
		if (	values.NumType == g_Unit_Classes[unitClass].NumType
				or (IsArmorClass(values.NumType) and IsArmorClass(g_Unit_Classes[unitClass].NumType))
				or (IsFighterClass(values.NumType) and IsFighterClass(g_Unit_Classes[unitClass].NumType))
				or (IsBomberClass(values.NumType) and IsBomberClass(g_Unit_Classes[unitClass].NumType))				
		) then
			if MapModData.RED.UnitData[key] then -- can be nil when unit change owner
				local unit = GetUnitFromKey(key)
				if unit and playerID == unit:GetOwner() and not unit:IsDead() then
					num = num +1
				end
			end
		end
	end

	return num
end

-- return num of units of this subclass (light tank, tank, heavy tank, ...) alive
function CountUnitSubClassAlive (unitClass, playerID)
	local bDebug = true
	local num = 0

	for key, values in pairs (MapModData.RED.UnitData) do
		if ( values.NumType == g_Unit_Classes[unitClass].NumType ) then
			if MapModData.RED.UnitData[key] then -- can be nil when unit change owner
				local unit = GetUnitFromKey(key)
				if unit and playerID == unit:GetOwner() and not unit:IsDead() then
					num = num +1
				end
			end
		end
	end
	return num
end

-- return num of armor alive
function CountArmorAlive (unitClass, playerID)
	local bDebug = true
	local num = 0
	for key, values in pairs (MapModData.RED.UnitData) do
		if ( IsArmorClass(values.NumType) ) then
			if MapModData.RED.UnitData[key] then -- can be nil when unit change owner
				local unit = GetUnitFromKey(key)
				if unit and playerID == unit:GetOwner() and not unit:IsDead() then
					num = num +1
				end
			end
		end
	end

	return num
end

-- return num of units of this type already build for restriction by number build
function CountUnitType (unitType)
	local num = 0

	for id, values in pairs (MapModData.RED.UnitData) do
		if ( values.TypeID == unitType ) then
			num = num +1
		end
	end

	return num
end

-- return num of units of this type alive
function CountUnitTypeAlive (unitType, playerID)
	local bDebug = true
	local aliveUnits = 0
	for key, values in pairs (MapModData.RED.UnitData) do
		if values.TypeID == unitType then
			if MapModData.RED.UnitData[key] then -- can be nil when unit change owner
				local unit = GetUnitFromKey(key)
				if unit and not unit:IsDead() then
					if (playerID and playerID == unit:GetOwner()) or not playerID then -- function can be called with playerID = nil
						aliveUnits = aliveUnits + 1
					end
				end
			end
		end
	end
	return aliveUnits
end

-- return num of units in each domain for a player
function CountDomainUnits (playerID, unitType)
	local land, sea, air = 0, 0, 0
	player = Players[playerID]
	for unit in player:Units() do
		if ( unit:GetDomainType() == DomainTypes.DOMAIN_LAND ) then
			land = land + 1
		elseif ( unit:GetDomainType() == DomainTypes.DOMAIN_SEA ) and not (unit:GetUnitType() == CONVOY) then
			sea = sea + 1
		elseif ( unit:GetDomainType() == DomainTypes.DOMAIN_AIR ) then
			air = air + 1
		end
	end
	if unitType then -- return domain number for this UnitType only
		if GameInfo.Units[unitType].Domain == "DOMAIN_AIR" then
			return air
		elseif GameInfo.Units[unitType].Domain == "DOMAIN_SEA" then
			return sea
		else -- Domain Land
			return land
		end
	end
	return land, sea, air -- else return all domains numbers
end

-- return number of land units of playerID in areaID
function GetNumLandUnitsByArea (playerID, areaID)
	local player = Players[playerID]
	local num = 0
	for unit in player:Units() do
		if unit:GetArea() == areaID and unit:GetDomainType() == DomainTypes.DOMAIN_LAND then
			num = num + 1
		end
	end
	return num
end

-- return number of land units available for playerID in areaID
function GetNumFreeLandUnitsByArea (playerID, areaID)
	local player = Players[playerID]
	local num = 0
	for unit in player:Units() do
		if unit:GetArea() == areaID and unit:GetDomainType() == DomainTypes.DOMAIN_LAND then
			local unitKey = GetUnitKey(unit)
			if not MapModData.RED.UnitData[unitKey].OrderType then
				num = num + 1
			end
		end
	end
	return num
end

-- return table of land units available for playerID in range around plot
function GetFreeLandUnitsAround (playerID, range, plot)
	local bDebug = true
	local player = Players[playerID]
	local freeUnits = {}
	for unit in player:Units() do
		if unit:GetDomainType() == DomainTypes.DOMAIN_LAND then
			local unitPlot = unit:GetPlot()
			local distance = distanceBetween(plot, unitPlot) - 1
			local unitKey = GetUnitKey(unit)
			if MapModData.RED.UnitData[unitKey] and (not MapModData.RED.UnitData[unitKey].OrderType) and (distance <= range) and (unitPlot:GetArea() == plot:GetArea()) then			
				Dprint ("  - adding " .. unit:GetName() .. " to free list (distance = ".. distance ..")", bDebug)
				table.insert(freeUnits, unit)
			end
		end
	end
	return freeUnits
end

-- change unit ownership
function ChangeUnitOwner (unit, iNewOwner)
	
	local unitKey = GetUnitKey(unit)
	if MapModData.RED.UnitData[unitKey] then

		-- first update to unit table
		MapModData.RED.UnitData[unitKey].OwnerID = iNewOwner

		local player = Players[ iNewOwner ]

		-- get position and damage before killing the unit !
		local x = unit:GetX()
		local y = unit:GetY()
		local damage = unit:GetDamage()
		local moves = unit:GetMoves()


		-- create the new unit from the old one
		local newUnit = player:InitUnit(unit:GetUnitType(), x, y)
		newUnit:SetExperience ( unit:GetExperience() )
		newUnit:SetLevel ( unit:GetLevel() )
		newUnit:SetDamage(damage)
		newUnit:SetMoves(moves)
		newUnit:SetName(unit:GetNameNoDesc())
		newUnit:SetOriginalOwner(unit:GetOriginalOwner()) -- so it always return the first unit owner, even after multiple change
		newUnit:SetEmbarked(unit:IsEmbarked())
		for unitPromotion in GameInfo.UnitPromotions() do
			local unitPromotionID = unitPromotion.ID
			if( unit:IsHasPromotion( unitPromotionID ) ) then
				newUnit:SetHasPromotion( unitPromotionID, true )
			end
		end
				
		-- kill old unit
		--unit:SetDamage( unit:GetMaxHitPoints() )
		unit:Kill()

		-- second update to units table
		local newUnitKey = GetUnitKey(newUnit)
		MapModData.RED.UnitData[newUnitKey] = MapModData.RED.UnitData[unitKey]
		MapModData.RED.UnitData[unitKey] = nil
		return newUnit -- in case we want to do something with the new unit...
	else
		Dprint("- WARNING: MapModData.RED.UnitData[unitKey] is nil for ChangeUnitOwner()")
	end
end

-- change unit type for upgrade (note: should not use this function to change to a different numType)
function ChangeUnitType (unit, iType)
	
	local unitKey = GetUnitKey(unit)
	if MapModData.RED.UnitData[unitKey] then

		-- first update to unit table
		MapModData.RED.UnitData[unitKey].TypeID = iType
		MapModData.RED.UnitData[unitKey].Type = GameInfo.Units[iType].Type

		local player = Players[ unit:GetOwner() ]

		-- get position and damage before killing the unit !
		local x = unit:GetX()
		local y = unit:GetY()
		local damage = unit:GetDamage()
		local moves = unit:GetMoves()


		-- create the new unit from the old one
		local newUnit = player:InitUnit(iType, x, y)
		newUnit:SetExperience ( unit:GetExperience() )
		newUnit:SetLevel ( unit:GetLevel() )
		newUnit:SetDamage(damage)
		newUnit:SetMoves(moves)
		newUnit:SetName(unit:GetNameNoDesc())
		newUnit:SetOriginalOwner(unit:GetOriginalOwner()) -- so it always return the first unit owner, even after multiple change
		newUnit:SetEmbarked(unit:IsEmbarked())
		for unitPromotion in GameInfo.UnitPromotions() do
			local unitPromotionID = unitPromotion.ID
			if( unit:IsHasPromotion( unitPromotionID ) ) then
				newUnit:SetHasPromotion( unitPromotionID, true )
			end
		end
				
		-- kill old unit
		--unit:SetDamage( unit:GetMaxHitPoints() )
		unit:Kill()

		-- second update to units table
		local newUnitKey = GetUnitKey(newUnit)
		MapModData.RED.UnitData[newUnitKey] = MapModData.RED.UnitData[unitKey]
		MapModData.RED.UnitData[newUnitKey].CombatXP = 0 -- reset combat XP, as it's a new type
		MapModData.RED.UnitData[unitKey] = nil
		return newUnit -- in case we want to do something with the new unit...
	else
		Dprint("- WARNING: MapModData.RED.UnitData[unitKey] is nil for ChangeUnitType()")
	end
end

-- Remove unit from a plot and transfert them to nearest valid one  
function EscapeUnitsFromPlot(plot, bRetreat, damageToTransfert, iAttackingPlayer)
	local bDebug = true
	local unitCount = plot:GetNumUnits()
	local unitTable = {}
	Dprint("--------", bDebug) 
	Dprint("Removing " .. unitCount .." units from " .. plot:GetX() .. "," .. plot:GetY(), bDebug)
	for i = 0, unitCount - 1, 1 do	
    	local unit = plot:GetUnit(i)
		if unit then
			Dprint(i+1 .. " = " .. unit:GetName(), bDebug)
			table.insert(unitTable, unit)
		end
	end

	for i, unit in ipairs(unitTable) do
		if unit then
			local owner = Players [ unit:GetOwner() ]
			local extraDamageFactor = nil
			Dprint(unit:GetName() .. " belonging to " .. owner:GetName() .. " want to be removed from plot at (" ..plot:GetX() .."," .. plot:GetY() .. ")", bDebug )

			if unit:GetDomainType() == DomainTypes.DOMAIN_AIR then
				local bNotself = true
				local retreatCity = GetCloseCity ( unit:GetOwner(), plot , bNotself)
				if retreatCity then
					Dprint(" -- " .. unit:GetName() .." transfered to ".. retreatCity:GetName(), bDebug)
					unit:SetXY( retreatCity:GetX() , retreatCity:GetY())
				else
					Dprint(" -- " .. unit:GetName() .." can't retreat, no valid city...", bDebug)
					bRetreat = false -- not retreating : to not apply HP loss
				end
			else
				local bSeaUnit = unit:GetDomainType() == DomainTypes.DOMAIN_SEA
				local bLandUnit = unit:GetDomainType() == DomainTypes.DOMAIN_LAND
				-- search in first circle
				local escapeList = GetAdjacentPlots(plot)
				Shuffle(escapeList) -- Units shouldn't always try to escape in the same direction...
				local bEscaped = false
				for i, escapePlot in pairs(escapeList) do					

					if (escapePlot:GetArea() == plot:GetArea() or escapePlot:Area():GetNumTiles() > 15) -- same area or not a lake/island
					   and CanSharePlot(unit, escapePlot) -- no other unit here
					   and ((escapePlot:IsWater() and bSeaUnit) or (not escapePlot:IsWater() and bLandUnit)) -- same domain
					   and not escapePlot:IsMountain() -- no alpinist here
					   and not escapePlot:IsImpassable() -- do we need to chack the mountain if we check this one ?
					   and not bEscaped -- don't jump around, escape once !
					   --and (unit:CanEnterTerritory() or escapePlot:GetOwner() == unit:GetOwner()) -- CanEnterTerritory is false for CS units on their own territory ???
					   and AreSameSide( escapePlot:GetOwner(), unit:GetOwner())
					   then 						
						Dprint(" -- " .. unit:GetName() .." transfered to plot ".. escapePlot:GetX() .."," .. escapePlot:GetY(), bDebug)
						unit:SetXY( escapePlot:GetX() , escapePlot:GetY())
						bEscaped = true
					end
				end
				if not bEscaped then
					Dprint(" -- " .. unit:GetName() .." can't retreat, no valid plot, search for city...", bDebug)
					
					local bNotself = true
					local retreatCity = nil
					if bLandUnit then
						retreatCity = GetCloseCity ( unit:GetOwner(), plot , bNotself)
					else
						retreatCity = GetCloseNavalCity ( unit:GetOwner(), plot , bNotSelf)
					end
					if retreatCity then
						Dprint("   -- " .. unit:GetName() .." transfered to ".. retreatCity:GetName(), bDebug)
						unit:SetXY( retreatCity:GetX() , retreatCity:GetY())
						extraDamageFactor = 2.5
					else
						Dprint("   -- " .. unit:GetName() .." can't retreat, no valid city...", bDebug)
						bRetreat = false -- not retreating : to not apply HP loss
					end

				end
			end
			if bRetreat then -- fire only when the unit as effectivly retreated, and EscapeUnitsFromPlot() called with penality for retreating flagged true
				local currentHP = unit:GetCurrHitPoints()
				local currentDamage = unit:GetDamage()
				local retreatDamage = math.random( Round(currentHP*MIN_PERCENT_HP_LOSS_ESCAPE/100), Round(currentHP*MAX_PERCENT_HP_LOSS_ESCAPE/100) )
				if damageToTransfert then
					retreatDamage = retreatDamage + damageToTransfert
				end
				if extraDamageFactor then
					retreatDamage = Round (retreatDamage * extraDamageFactor)
				end
				retreatDamage = math.min(retreatDamage, currentHP-1) -- don't kill the unit
				unit:SetMoves(0) -- no move left after retreating this way
				unit:SetDamage(currentDamage + retreatDamage)
				Dprint(unit:GetName() .." escaped with ".. unit:GetCurrHitPoints() .."HP left, retreat damage = " .. retreatDamage , bDebug)
				if plot:IsCity() then
					local city = plot:GetPlotCity()					
					if iAttackingPlayer and iAttackingPlayer == Game:GetActivePlayer() then
						Events.GameplayAlertMessage(Locale.ConvertTextKey("TXT_KEY_ENEMY_UNIT_ESCAPED_FROM_CITY", unit:GetNameKey(), city:GetName(), retreatDamage))
					end
					if unit:GetOwner() == Game:GetActivePlayer() then
						Events.GameplayAlertMessage(Locale.ConvertTextKey("TXT_KEY_YOU_UNIT_ESCAPED_FROM_CITY", unit:GetNameKey(), city:GetName(), retreatDamage))
					end
				end
			end
		end
	end
end

-- Track combat XP for Projects based on XP gained.
function UpdateCombatXP(unit)
	local unitKey = GetUnitKey(unit)
	if MapModData.RED.UnitData[unitKey] then
		local combatXP = MapModData.RED.UnitData[unitKey].CombatXP or 0
		local prevXP = MapModData.RED.UnitData[unitKey].TotalXP or 0
		local diffXP = unit:GetExperience() - prevXP
		combatXP = combatXP + diffXP
		Dprint("Updating XP for " .. unit:GetName() ..", gain "..diffXP.."xp from combat, now has "..combatXP.." combatXP / " .. unit:GetExperience() .." totalXP", g_DebugCombat )
		MapModData.RED.UnitData[unitKey].CombatXP = combatXP	
		MapModData.RED.UnitData[unitKey].TotalXP = unit:GetExperience()
		return combatXP
	else
		Dprint("- WARNING: MapModData.RED.UnitData[unitKey] is nil for UpdateCombatXP()", g_DebugCombat)
		return 0
	end
end

-- Count num units moving on a route
function GetNumUnitsEnRoute(routeID)
	local num = 0
	for i, data in pairs(MapModData.RED.UnitData) do
		if (data.OrderType == RED_MOVE_TO_DISEMBARK or data.OrderType == RED_MOVE_TO_EMBARK or data.OrderType == RED_MOVE) and data.OrderReference == routeID then
			num = num + 1
		end
	end
	return num
end

-- test if this unit class (ID) can capture tile
function CanCaptureTile(unitClassID)
	if g_Unit_Classes[unitClassID] then
		return g_Unit_Classes[unitClassID].Capture or false
	end
	return false
end

-- test if this Unit type (ID) can paradrop
function CanParadrop(unitTypeID)
	return g_Paradrop[unitTypeID] or false
end

-- test if this Unit type (ID) has no combat penalty from no supply line
function HasNoCombatPenaltyFromSupply(unitTypeID)
	return g_NoSupplyPenalty[unitTypeID] or false
end

-- test if this Unit type (ID) has fuel
function UseFuel(unitTypeID)
	return (GameInfo.Units[unitTypeID].FuelConsumption > 0)
end

-- test if this Unit type (ID) has fuel
function GetFuelConsumption(unitTypeID)
	return GameInfo.Units[unitTypeID].FuelConsumption
end

-- test if this Unit type (ID) is never retreating under attack
function IsNeverRetreating(unitTypeID)
	return g_NeverRetreating[unitTypeID] or false
end

function SetTemporaryBestDefender(unit)	
	local bDebug = true
	Dprint("    - Set ("..tostring(unit:GetName())..") as best defender on plot ".. unit:GetX() ..",".. unit:GetY(), bDebug)
	Dprint("    - Moves Left = ".. unit:MovesLeft(), bDebug)
	unit:SetMoves(unit:MovesLeft() + MOVE_DENOMINATOR) -- DLL won't pick immobile unit as BestDefender... 
	Dprint("    - Moves Left with bonus added = ".. unit:MovesLeft(), bDebug)
	unit:SetMarkedBestDefender(true)
end

function RemoveTemporaryBestDefender(unit)
	local bDebug = true
	Dprint("    - Unset ("..tostring(unit:GetName())..") as best defender on plot ".. unit:GetX() ..",".. unit:GetY(), bDebug)
	Dprint("    - Moves Left = ".. unit:MovesLeft(), bDebug)
	unit:SetMoves(unit:MovesLeft() - MOVE_DENOMINATOR) -- We had given this in SetTemporaryBestDefender()... 
	Dprint("    - Moves Left with bonus removed = ".. unit:MovesLeft(), bDebug)
	unit:SetMarkedBestDefender(false)
end

function GetBestDefender(plot, unit)
	local unitCount = plot:GetNumUnits()
	local bestDefender = nil
	for i = 0, unitCount - 1, 1 do	
    	local testUnit = plot:GetUnit(i)
		if testUnit and testUnit:IsBetterDefenderThan(bestDefender, unit) then
			bestDefender = testUnit
		end
	end
	return bestDefender
end


function IsTankDestroyer(unit)
	return (    unit:IsHasPromotion( GameInfo.UnitPromotions.PROMOTION_LIGHT_TANK_DESTROYER.ID )
			 or unit:IsHasPromotion( GameInfo.UnitPromotions.PROMOTION_TANK_DESTROYER.ID )
			 or unit:IsHasPromotion( GameInfo.UnitPromotions.PROMOTION_HEAVY_TANK_DESTROYER.ID )
			)
end

function IsAssaultGun(unit)
	return (    unit:IsHasPromotion( GameInfo.UnitPromotions.PROMOTION_ASSAULT_GUN.ID )
			 or unit:IsHasPromotion( GameInfo.UnitPromotions.PROMOTION_HEAVY_ASSAULT_GUN.ID )
			)
end

function IsArmorClass(iNumType)
	return (    iNumType == CLASS_TANK
			 or iNumType == CLASS_LIGHT_TANK
			 or iNumType == CLASS_LIGHT_TANK_DESTROYER
			 or iNumType == CLASS_CRUISER_TANK
			 or iNumType == CLASS_HEAVY_TANK
			 or iNumType == CLASS_TANK_DESTROYER
			 or iNumType == CLASS_ASSAULT_GUN
			)
end

function IsFighterClass(iNumType)
	return (    iNumType == CLASS_FIGHTER
			 or iNumType == CLASS_FIGHTER_BOMBER
			 or iNumType == CLASS_HEAVY_FIGHTER
			)
end

function IsBomberClass(iNumType)
	return (    iNumType == CLASS_ATTACK_AIRCRAFT
			 or iNumType == CLASS_FAST_BOMBER
			 or iNumType == CLASS_BOMBER
			 or iNumType == CLASS_HEAVY_BOMBER
			)
end

function IsSmallBomberClass(iNumType)
	return (    iNumType == CLASS_ATTACK_AIRCRAFT
			 or iNumType == CLASS_FAST_BOMBER
			 or iNumType == CLASS_FIGHTER_BOMBER
			)
end

function IsSubmarineClass(iNumType)
	return (    iNumType == CLASS_SUBMARINE
			 or iNumType == CLASS_SUBMARINE_2
			 or iNumType == CLASS_SUBMARINE_3
			)
end

function ReinitUnitsOnLoad()
	for playerID = 0, GameDefines.MAX_CIV_PLAYERS - 1 do
		ReinitUnits(playerID)
	end
end

function ReinitUnits(playerID)
	local player = Players[playerID]
	if player and player:IsAlive() then
		for unit in player:Units() do
			local unitType = unit:GetUnitType()
			if unit:IsMarkedBestDefender() then
				Dprint("WARNING: ".. unit:GetName() .." of ".. player:GetName() .." was marked 'best defender' outside combat, unmark it...") 
				unit:SetMarkedBestDefender(false)
			end
			if IsRegiment(unit) and not unit:IsSpecialType() then
				Dprint("WARNING: ".. unit:GetName() .." of ".. player:GetName() .." was not marked 'special type', mark it...") 
				unit:SetIsSpecialType(true)
			end
			-- tank destroyers can only fight in defense
			if IsTankDestroyer(unit) or unit:IsHasPromotion(PROMOTION_FORTIFIED_GUN) then
				unit:SetMadeAttack(true)
			end
		end
	end
end

function IsMaxNumber(unitType)
	if g_UnitMaxNumber and g_UnitMaxNumber[unitType] then
		local maxNumber = g_UnitMaxNumber[unitType]
		if (maxNumber and maxNumber <= CountUnitType (unitType)) then
			return true
		end
	end
	return false
end

function IsLimitedNumber(unitType)
	if g_UnitMaxNumber and g_UnitMaxNumber[unitType] then
		return true
	end
	return false
end

function IsRegiment(unit)
	local unitClass = unit:GetUnitClassType()
	if g_Unit_Classes[unitClass] and g_Unit_Classes[unitClass].Regiment  then
		return true
	end
	local unitType = unit:GetUnitType()
	if g_SpecialType and g_SpecialType[unitType] then
		return true
	end
	return false
end

function IsBleeding(unit)
	if UNIT_BLEEDING then
		return (    unit:IsHasPromotion( GameInfo.UnitPromotions.PROMOTION_NO_SUPPLY.ID )
				 or unit:IsHasPromotion( GameInfo.UnitPromotions.PROMOTION_NO_SUPPLY_MECHANIZED.ID )
				)
	else
		return false
	end
end

function IsNoSupply(unit)
	return (    unit:IsHasPromotion( GameInfo.UnitPromotions.PROMOTION_NO_SUPPLY.ID )
			 or unit:IsHasPromotion( GameInfo.UnitPromotions.PROMOTION_NO_SUPPLY_SPECIAL_FORCES.ID )
			 or unit:IsHasPromotion( GameInfo.UnitPromotions.PROMOTION_NO_SUPPLY_MECHANIZED.ID )
			)
end

-- Check if this unit class is limited by ratio for the AI
function CacheIsLimitedByRatio(unitType, playerID, civID, totalUnits, numDomain, bDebug )

	local unitClassType = GameInfo["Units"][unitType]["Class"]
	local unitClass = GameInfo.UnitClasses[unitClassType].ID
	
	if not g_Unit_Classes[unitClass] then
		return false
	end
	
	local aliveUnitClass = CountUnitClassAlive (unitClass, playerID)
	local aliveUnitSubClass = CountUnitSubClassAlive (unitClass, playerID)
	
	local bDebug = bDebug or false
	
	if GameInfo.Units[unitType].Domain == "DOMAIN_AIR" then
	
		if g_Combat_Type_Ratio and g_Combat_Type_Ratio[civID] and g_Combat_Type_Ratio[civID].Air then
			if (numDomain > 0) and (totalUnits/numDomain < g_Combat_Type_Ratio[civID].Air) then
				g_UnitRestrictionString = "Air ratio restriction (totalUnits/numDomain < g_Combat_Type_Ratio[civID].Air) -> (".. totalUnits .." / ".. numDomain .." < ".. g_Combat_Type_Ratio[civID].Air..")"
				return true
			end
		end					
		if g_Max_Air_SubClass_Percent and g_Max_Air_SubClass_Percent[civID] then
			local airType = g_Unit_Classes[unitClass].NumType
			local maxPercent = g_Max_Air_SubClass_Percent[civID][airType]
			if maxPercent and (numDomain > 0) and (aliveUnitSubClass / numDomain * 100 > maxPercent) then
				g_UnitRestrictionString = "Air type restriction (aliveUnitSubClass / numDomain * 100 > g_Max_Air_SubClass_Percent[civID][airType]) -> (".. aliveUnitSubClass .." / ".. numDomain .." * 100 > ".. maxPercent..")"
				return true
			end
		end

	elseif GameInfo.Units[unitType].Domain == "DOMAIN_SEA" then
		if g_Combat_Type_Ratio and g_Combat_Type_Ratio[civID] and g_Combat_Type_Ratio[civID].Sea then	
			if (numDomain > 0) and (totalUnits / numDomain < g_Combat_Type_Ratio[civID].Sea) then			
				g_UnitRestrictionString = "Sea ratio restriction (totalUnits / numDomain < g_Combat_Type_Ratio[civID].Sea) -> (".. totalUnits .." / ".. numDomain .." < ".. g_Combat_Type_Ratio[civID].Sea..")"
				return true
			end
		end

	else -- Domain land
	
		-- Armor restriction
		if IsArmorClass(g_Unit_Classes[unitClass].NumType) then
		
			local aliveArmor = CountArmorAlive (unitClass, playerID)
			
			if g_Combat_Type_Ratio and g_Combat_Type_Ratio[civID] and g_Combat_Type_Ratio[civID].Armor
			   and (aliveArmor > 0) and (numDomain / aliveArmor < g_Combat_Type_Ratio[civID].Armor)
			   then
				g_UnitRestrictionString = "Armor ratio restriction (numDomain / aliveArmor < g_Combat_Type_Ratio[civID].Armor) -> (".. numDomain .." / ".. aliveArmor .." < ".. g_Combat_Type_Ratio[civID].Armor..")"
				return true
			end					

			if g_Max_Armor_SubClass_Percent and g_Max_Armor_SubClass_Percent[civID] then
				local armorType = g_Unit_Classes[unitClass].NumType
				local maxPercent = g_Max_Armor_SubClass_Percent[civID][armorType]

				if (aliveArmor > 0) and maxPercent and ( aliveUnitSubClass / aliveArmor * 100 > maxPercent) then
				g_UnitRestrictionString = "Armor type restriction (aliveUnitSubClass / aliveArmor * 100 > g_Max_Armor_SubClass_Percent[civID][armorType]) -> (".. aliveUnitSubClass .." / ".. aliveArmor .." * 100 > ".. maxPercent..")"
					return true
				end
			end
		end
		-- Artillery restriction
		if g_Unit_Classes[unitClass].NumType == CLASS_ARTILLERY and g_Combat_Type_Ratio and g_Combat_Type_Ratio[civID] then
			if (aliveUnitClass > 0) and (numDomain / aliveUnitClass < g_Combat_Type_Ratio[civID].Artillery) then
				g_UnitRestrictionString = "Artillery ratio restriction (numDomain / aliveUnitClass < g_Combat_Type_Ratio[civID].Artillery) -> (".. numDomain .." / ".. aliveUnitClass .." < ".. g_Combat_Type_Ratio[civID].Artillery..")"
				return true
			end			
		end
	end

	-- No limit found
	return false

end


-- Check if this unit class is limited by ratio for the AI
function IsLimitedByRatio(unitType, playerID)
	if g_LimitedByRatio then
		if g_LimitedByRatio[unitType] then
			return g_LimitedByRatio[unitType][playerID]
		end
	end
	return false
end
function FillCacheIsLimitedByRatio()
	for iPlayer = 0, GameDefines.MAX_PLAYERS-1 do
		PlayerCacheIsLimitedByRatio(iPlayer)
	end
end
function PlayerCacheIsLimitedByRatio(iPlayer)
	local player = Players[iPlayer]
	if player ~= nil and player:IsAlive() and (not player:IsBarbarian()) then
		local civID = GetCivIDFromPlayerID(iPlayer)
		local totalUnits = player:GetNumMilitaryUnits()
		for unitInfo in GameInfo.Units() do
			local iUnitType = unitInfo.ID
			local numDomain = CountDomainUnits (iPlayer, iUnitType)
			g_LimitedByRatio[iUnitType] = g_LimitedByRatio[iUnitType] or {} -- initialize this entry if not already filled	
			g_LimitedByRatio[iUnitType][iPlayer] = CacheIsLimitedByRatio(iUnitType, iPlayer, civID, totalUnits, numDomain, true )
		end
	end
end

function FillCacheTrainingRestriction()
	for iPlayer = 0, GameDefines.MAX_PLAYERS-1 do
		PlayerCacheTrainingRestriction(iPlayer)
	end
end

function PlayerCacheTrainingRestriction(iPlayer)
	local player = Players[iPlayer]
	if player ~= nil and player:IsAlive() and (not player:IsBarbarian()) then
		for unitInfo in GameInfo.Units() do
			local iUnitType = unitInfo.ID
			if PlayerCanEverBuild(iPlayer, iUnitType) then
				g_TrainingRestriction[iUnitType] = g_TrainingRestriction[iUnitType] or {} -- initialize this entry if not already filled	
				g_TrainingRestriction[iUnitType][iPlayer] = CachePlayerTrainingRestriction(iPlayer, iUnitType)
			end
		end
	end
end


function PlayerCanEverBuild(iPlayer, iUnitType)
	local player = Players[iPlayer]
	if not player:IsMinorCiv() then
		local civID = GetCivIDFromPlayerID(iPlayer, false)
		local allowedTable = g_Major_Units[civID]
		if (allowedTable) then
			for i, allowedType in pairs (allowedTable) do
				if (allowedType == iUnitType) then
					g_UnitRestrictionString = "No restriction, found in allowed table for major civs."
					return true
				end
			end
		end
	else	
		for i, allowedType in pairs (g_Minor_Units) do
			if (allowedType == iUnitType) then
				g_UnitRestrictionString = "No restriction, found in allowed table for minor civs."
				return true
			end
		end
	end
end

function CanSharePlot(unit, plot)
	local numUnits = plot:GetNumUnits();
	for i = 0, numUnits do
		
		local plotUnit = plot:GetUnit(i)
		if plotUnit ~= nil and plotUnit ~= unit and ((unit:GetOwner() ~= plotUnit:GetOwner()) or (unit:IsSpecialType() and plotUnit:IsSpecialType()) or (not unit:IsSpecialType() and not plotUnit:IsSpecialType())) then
			return false
		end
	end
	return true
end

function CleanOrdersRED (unit)
	local bDebug = true
	local unitKey = GetUnitKey(unit)
	if not MapModData.RED.UnitData[unitKey] then -- Units that are not initialized can't have custom orders...
		return
	end
	unit:PopMission()
	MapModData.RED.UnitData[unitKey].OrderType = nil
	MapModData.RED.UnitData[unitKey].OrderReference = nil
	MapModData.RED.UnitData[unitKey].OrderObjective = nil
	MapModData.RED.UnitData[unitKey].TotalControl = nil
end

function Disband(unit)
	local iGoldToScrap = unit:GetScrapGold()
	local iPlayer = unit:GetOwner()
	local pPlayer = Players[iPlayer]
	unit:Kill()
	pPlayer:ChangeGold(iGoldToScrap)
	LuaEvents.OnUnitKilled(iPlayer)
end