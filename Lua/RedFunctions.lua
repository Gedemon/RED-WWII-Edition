-- R.E.D. common Functions
-- Author: Gedemon
-- DateCreated: 2/1/2011 7:34:01 PM
--------------------------------------------------------------

print("Loading Red Generic Functions...")
print("-------------------------------------")

--------------------------------------------------------------
-- InGame functions 
--------------------------------------------------------------

-- no culture on water tile
function CheckCultureChange(iHexX, iHexY, iPlayerID, bUnknown)
	if (iPlayerID ~= -1) then
		local x, y = ToGridFromHex( iHexX, iHexY )
		local plot = GetPlot(x,y)
		if ( plot:IsWater() ) then
			Dprint("-------------------------------------")
			Dprint("Culture was set on water plot ("..x..","..y.."), removing it ...")
			plot:SetOwner(-1, -1)
		elseif plot:IsCity() then
			--FixCityGraphicBug(plot)
			--UpdateCityGraphic(plot:GetPlotCity())
		end		
	end
end
-- Events.SerialEventHexCultureChanged.Add(CheckCultureChange)
-- add to Events after map initialization (or re-loading) in RedEuro1940.Lua or other scenario Lua file

function MapUpdate() -- to do : check culture tile consistency. for example, a city can get a culture tile from a friendly civs if this tile was conquered by the ancient city owner, we should fix that once per turn here
	Dprint("-------------------------------------")
	Dprint("Updating map ...")		
	local t1 = os.clock()
	local orphanTestTime = 0
	for iPlotLoop = 0, Map.GetNumPlots()-1, 1 do
		local plot = Map.GetPlotByIndex(iPlotLoop)
		local x = plot:GetX()
		local y = plot:GetY()
		local ownerID = plot:GetOwner()
		local plotKey = GetPlotKey ( plot )

		-- check only owned plot...
		if (ownerID ~= -1) then
			local originalOwner = GetPlotFirstOwner(plotKey)
			local bCapturedPlot = ownerID ~= originalOwner

			-- there shouldn't be any culture on water when calling this function, but just in case...
			if ( plot:IsWater() ) then
				Dprint("WARNING: Culture was set on water plot ("..x..","..y.."), removing it ...")
				plot:SetOwner(-1, -1)

			-- if the original plot owner is a possible ally of the current owner, give it back to him
			elseif bCapturedPlot and AreSameSide( ownerID, originalOwner) then -- and Players[originalOwner]:IsAlive() ) then 			
				Dprint("Changing owner at ("..x..","..y.."), ".. Players[originalOwner]:GetName() .. " and " .. Players[ownerID]:GetName() .." are same side")
				plot:SetOwner(originalOwner, -1 ) 
				bCapturedPlot = false
			end	
			local t_start = os.clock()
			if CHECK_FOR_ORPHAN_TILE and not IsUnderControl ( plot, bCapturedPlot ) then
				local bChangedOwner = TestEnemyControl(plot, bCapturedPlot)
				if not bChangedOwner and not Players[originalOwner]:IsAlive() then 
					GiveToNearestPlayer(plot)
				end
			end	
			local t_end = os.clock()
			orphanTestTime = orphanTestTime + (t_end - t_start)
		elseif not plot:IsWater() then		
			if plot:Area():GetNumCities() > 0 then
				Dprint("WARNING: plot ("..x..","..y..") is not owned, give it to first player found in range...")
				GiveToNearestPlayer(plot)
			end
		end
	end
	local t2 = os.clock()
	Dprint("  - Total time for map update :		" .. t2 - t1 .. " s")
	Dprint("	- Orphan tiles used :		" .. orphanTestTime .. " s")
	Dprint("-------------------------------------")
end

function OnLoadMapUpdate() 
	Dprint("-------------------------------------")
	Dprint("Updating map on loading ...")		
	local t1 = os.clock()
	for iPlotLoop = 0, Map.GetNumPlots()-1, 1 do
		local plot = Map.GetPlotByIndex(iPlotLoop)
		local ownerID = plot:GetOwner()
		if (ownerID ~= -1) then
			plot:SetOwner(ownerID, -1)
		end
	end
	local t2 = os.clock()
	Dprint("  - Total time for map update :		" .. t2 - t1 .. " s")
	Dprint("-------------------------------------")
end

-- handle city capture
-- function HandleCityCapture (hexPos, playerID, cityID, newPlayerID) -- format for adding to Events.SerialEventCityCaptured
function HandleCityCapture  (playerID, bCapital, iX, iY, newPlayerID)

	if g_NoCityCapture then -- do not run twice when liberating a city 
		return
	end

	local cityPlot = Map.GetPlot(iX, iY)
	local cityPlotKey = GetPlotKey(cityPlot)
	local bDebugOutput = true
	local city = cityPlot:GetPlotCity()
	city:SetPuppet(false) -- prevent AI puppeting cities it could use...
	local originalCityOwner = GetPlotFirstOwner(cityPlotKey)
	Dprint ("Change " .. city:GetName() .." owner and culture after capture at (" .. cityPlotKey.. ")", bDebugOutput)

	if ( newPlayerID ~= originalCityOwner and AreSameSide( newPlayerID, originalCityOwner) ) then

		Dprint (" - Liberating the city...", bDebugOutput)
		local player = Players [ originalCityOwner ]
		local newPlayer = Players [ newPlayerID ]

		g_NoCityCapture = true
		player:AcquireCity(city, false, true) -- void player:acquireCity(<City> pCity, boolean bConquest, boolean bTrade)
		g_NoCityCapture = false

		if player:IsMinorCiv() and not newPlayer:IsMinorCiv() then
			player:ChangeMinorCivFriendshipWithMajor( newPlayerID, LIBERATE_MINOR_CITY_BONUS ) -- give diplo bonus for liberating friendly city
		end
	end

	if city:GetResistanceTurns() >0 then
		city:ChangeResistanceTurns(-Round(city:GetResistanceTurns()*0.75)) -- lower the number of resistance turns by 75%
	end

	for i = 0, city:GetNumCityPlots() - 1, 1 do
		local plot = city:GetCityIndexPlot( i )

		if (plot ~= nil and not plot:IsWater() ) then
			-- make sure to give at least all the first ring to the conqueror (if plots original owner are original city owner)
			--if ( Map:PlotDistance(plot:GetX(), plot:GetY(), cityPlot:GetX(), cityPlot:GetY()) == 1 ) then
			local distance = distanceBetween(plot, cityPlot) - 1
			if distance < 2  then
				local plotKey = GetPlotKey(plot)
				local originalPlotOwner = GetPlotFirstOwner(plotKey)
				local currentPlotOwner = plot:GetOwner()
				if ( originalCityOwner == originalPlotOwner and AreSameSide( newPlayerID, currentPlotOwner) ) then
					plot:SetOwner(newPlayerID, -1)
				end
			end
			
		end
	end
	
	if AreAtWar( playerID, newPlayerID) or not Players[playerID]:IsAlive() then -- do not pillage someone that may have just liberated one of your cities...

		local gainMat, gainOil = 0, 0

		-- Get Materiel from city capture
		local currentMateriel = math.max(0, MapModData.RED.ResourceData[playerID].Materiel + MapModData.RED.ResourceData[playerID].MatFromCityCapture)
		local materielRatio = GetCityMaxMateriel (city) / (GetMaxMateriel (playerID) + GetCityMaxMateriel (city)) -- to use value from before the city capture...	
		Dprint ("   Materiel ratio = GetCityMaxMateriel / GetMaxMateriel = " .. GetCityMaxMateriel (city) .. "/" .. (GetMaxMateriel (playerID) + GetCityMaxMateriel (city)) .." = " .. materielRatio, bDebugOutput)

		gainMat = Round(currentMateriel * materielRatio)
		Dprint ("      gainMat = currentMateriel * ratio = " .. gainMat .. ", currentMateriel = Materiel + MatFromCityCapture = " ..  MapModData.RED.ResourceData[playerID].Materiel .. " + ".. MapModData.RED.ResourceData[playerID].MatFromCityCapture, bDebugOutput)
		MapModData.RED.ResourceData[newPlayerID].MatFromCityCapture			= MapModData.RED.ResourceData[newPlayerID].MatFromCityCapture	+ gainMat
		MapModData.RED.ResourceData[playerID].MatFromCityCapture			= MapModData.RED.ResourceData[playerID].MatFromCityCapture		- gainMat

		-- Get Oil from city capture
		if RESOURCE_CONSUMPTION then
			local currentOil = math.max(0, MapModData.RED.ResourceData[playerID].Oil + MapModData.RED.ResourceData[playerID].OilFromCityCapture)
			local oilRatio = GetCityMaxOil (city) / (GetMaxOil (playerID) + GetCityMaxOil (city))
			Dprint ("   Oil ratio = GetCityMaxOil / GetMaxOil = " .. GetCityMaxOil (city) .. "/" .. (GetMaxOil (playerID) + GetCityMaxOil (city)) .." = " .. oilRatio, bDebugOutput)

			gainOil = Round(currentOil * oilRatio)
			Dprint ("      gainOil = currentOil * ratio = " .. gainOil .. ", currentOil = Oil + OilFromCityCapture = " ..  MapModData.RED.ResourceData[playerID].Oil .. " + ".. MapModData.RED.ResourceData[playerID].OilFromCityCapture, bDebugOutput)
			MapModData.RED.ResourceData[newPlayerID].OilFromCityCapture			= MapModData.RED.ResourceData[newPlayerID].OilFromCityCapture	+ gainOil
			MapModData.RED.ResourceData[playerID].OilFromCityCapture			= MapModData.RED.ResourceData[playerID].OilFromCityCapture		- gainOil
		end
			
		if gainMat > 0 or gainOil > 0 then
			Events.GameplayAlertMessage(Players[newPlayerID]:GetName() .. " has gained " .. gainMat .. " [ICON_MATERIEL] Materiel and " .. gainOil .. " [ICON_RES_OIL] Oil from " .. city:GetName() .. " capture")
		end
	end

	Dprint ("-------------------------------------", bDebugOutput)
end
-- add to GameEvents.CityCaptureComplete

-- function FixCityGraphicBug(iAttackingUnit, defendingPlotKey, iAttackingPlayer, iDefendingPlayer)
function FixCityGraphicBug(plot)
	Dprint (" - Fix city capture graphic bug...")
	--local cityPlot = GetPlotFromKey ( defendingPlotKey )
	local cityPlot = plot
	local city = cityPlot:GetPlotCity()
	Dprint ("     - 1st : Pop +1")
	city:ChangePopulation(1, true)
	Dprint ("     - 2nd : Pop -1")
	city:ChangePopulation(-1, true)
end
-- add to Events.SerialEventCityCaptured

function VictoryCheck (hexPos, playerID, cityID, newPlayerID)	  

	local bDebug = false
	
	Dprint("-------------------------------------")
	Dprint("Check for victory condition on city capture, loop all key cities")

	if not g_Cities then
		return
	end

	local bVictory = true -- we are optimist
	local bKeyCityExist = false -- but not too much
	for i, data in ipairs(g_Cities) do
		if data.Key then
			bKeyCityExist = true
			local plot = GetPlot(data.X, data.Y)
			local city = plot:GetPlotCity()	
			if city then
				Dprint("- Check if " .. city:GetName() .. " is occupied and if capturing player is an opponent of original owner, or if owner is an ally...", bDebug)
				if not city:IsOccupied() and not AreSameSide(newPlayerID, GetPlotFirstOwner(GetPlotKey(plot)) ) then -- check if a key cities of newPlayerID opponent is free
					Dprint("     - Checked false, either not occupied, or occupant is not allied", bDebug)
					bVictory = false
				else
					Dprint("     - Checked true !", bDebug)
				end
				
				Dprint("- Check if " .. city:GetName() .. " is occupied and if original owner is an ally...", bDebug)
				if city:IsOccupied() and AreSameSide(newPlayerID, GetPlotFirstOwner(GetPlotKey(plot)) ) then -- check if a key cities of newPlayerID is occupied
					Dprint("     - Checked true, one of our cities is occupied, victory denied", bDebug)
					bVictory = false
				else
					Dprint("     - Checked false, victory condition still true !", bDebug)
				end

			else
				Dprint("WARNING : plot at ("..tostring(data.X)..","..tostring(data.Y) ..") is not city, but is in g_Cities table !", bDebug)
			end
			Dprint("-----", bDebug)
		end
	end
  
	if bVictory and bKeyCityExist then -- Game winned		
		Dprint("----------------------------------------------------------------------------------------------------------------")
		Dprint("WE HAVE A WINNER !")
		Dprint("----------------------------------------------------------------------------------------------------------------")
		local savedData = Modding.OpenSaveData()
		savedData.SetValue("VictoryType", "default")
		if g_Victory then
			victoryType = g_Victory[GetCivIDFromPlayerID(newPlayerID)]
			Dprint("Victory Type : " .. victoryType)
			local savedData = Modding.OpenSaveData()
			savedData.SetValue("VictoryType", victoryType)
			if AreSameSide(newPlayerID, Game.GetActivePlayer()) then
				Game.SetWinner(Game.GetActiveTeam(), GameInfo.Victories[victoryType].ID)
			else
				Game.SetWinner(Players[newPlayerID]:GetTeam(), GameInfo.Victories[victoryType].ID)
			end
		else
			if AreSameSide(newPlayerID, Game.GetActivePlayer()) then
				Game.SetWinner(Game.GetActiveTeam(), GameInfo.Victories["VICTORY_DOMINATION"].ID)
			else				
				Game.SetWinner(Players[newPlayerID]:GetTeam(), GameInfo.Victories["VICTORY_DOMINATION"].ID)
			end
		end
	end
end
-- add to Events.SerialEventCityCaptured

-----------------------------------------
-- Restriction functions
-----------------------------------------
function PlayerBuildingRestriction(iPlayer, iBuildingType)
	--Dprint ("Check if player.".. iPlayer .." can construct building.".. iBuildingType)
	local player = Players[iPlayer]

	local civID = GetCivIDFromPlayerID(iPlayer, false)
	local allowedTable = g_Major_Buildings[civID]
	if (allowedTable) then
		for i, allowedType in ipairs (allowedTable) do
			if (allowedType == iBuildingType) then
				return true
			end
		end
	else
		if not (player:IsMinorCiv()) then
			return false
		end
		for i, allowedType in ipairs (g_Minor_Buildings) do
			if (allowedType == iBuildingType) then
				return true
			end
		end
	end
	return false
end

function PlayerTrainingRestriction(iPlayer, iUnitType)


	local player = Players [ iPlayer ]

	 -- update data for humans player (they don't call this often)
	if player:IsHuman() then
		return CachePlayerTrainingRestriction(iPlayer, iUnitType)
	end

	-- use the cached values for the AI
	if g_TrainingRestriction then
		if g_TrainingRestriction[iUnitType] then
			return g_TrainingRestriction[iUnitType][iPlayer]
		end
	end
	return false
end
function CachePlayerTrainingRestriction(iPlayer, iUnitType)

	g_UnitRestrictionString = ""

	local player = Players[iPlayer]
	local civID = GetCivIDFromPlayerID(iPlayer)

	-- Don't build units when border are closed (that's for CS only)
	if Teams[player:GetTeam()]:IsClosedBorder() then 
		return false
	end	

	if g_UnitsProject[iUnitType] then
		local projectID = g_UnitsProject[iUnitType]
		if not IsProjectDone(projectID) then
			g_UnitRestrictionString = "required project is missing."
			return false
		end
	end

	if UNIT_SUPPORT_LIMIT_FOR_AI and (not player:IsBarbarian()) and (not player:IsHuman()) then
		if  player:GetNumUnitsOutOfSupply() > 0 then
			g_UnitRestrictionString = "Nation can't supply any more unit, don't let the AI goes above."
			return false
		end
	end

	--
	if ALLOW_AI_UNITS_LIMIT and (not player:IsBarbarian()) and (not player:IsHuman()) then
		local totalUnits = player:GetNumMilitaryUnits()
		if totalUnits > (MAX_AI_UNITS) then
			g_UnitRestrictionString = "Max number of units for the AI reached (" .. tostring(totalUnits) .."/".. tostring(MAX_AI_UNITS) ..")"
			return false
		end
	end

	if AI_USE_RESOURCE_LIMIT and (not player:IsBarbarian()) and (not player:IsHuman()) then
		local reqMateriel, reqPersonnel = RequestedReinforcementsPerHP(iUnitType)

		if IsMaterielShortage(iPlayer) and reqMateriel > AI_UNIT_RESOURCE_SHORTAGE then		
			g_UnitRestrictionString = "Player is short on materiel and unit use " .. tostring(reqMateriel) .." (max allowed = ".. tostring(AI_UNIT_RESOURCE_SHORTAGE) ..")"
			return false
		elseif IsNearMaterielShortage(iPlayer) and reqMateriel > AI_UNIT_RESOURCE_LOW then		
			g_UnitRestrictionString = "Player is low on materiel and unit use " .. tostring(reqMateriel) .." (max allowed = ".. tostring(AI_UNIT_RESOURCE_LOW) ..")"
			return false
		end
		
		if IsPersonnelShortage(iPlayer) and reqPersonnel > AI_UNIT_RESOURCE_SHORTAGE then		
			g_UnitRestrictionString = "Player is short on personnel and unit use " .. tostring(reqPersonnel) .." (max allowed = ".. tostring(AI_UNIT_RESOURCE_SHORTAGE) ..")"
			return false
		elseif IsNearPersonnelShortage(iPlayer) and reqPersonnel > AI_UNIT_RESOURCE_LOW then		
			g_UnitRestrictionString = "Player is low on personnel and unit use " .. tostring(reqPersonnel) .." (max allowed = ".. tostring(AI_UNIT_RESOURCE_LOW) ..")"
			return false
		end
		
		local fuelConsumption = GetFuelConsumption(iUnitType)
		if IsOilShortage(iPlayer) and fuelConsumption > AI_UNIT_RESOURCE_SHORTAGE then		
			g_UnitRestrictionString = "Player is short on oil and unit use " .. tostring(fuelConsumption) .." (max allowed = ".. tostring(AI_UNIT_RESOURCE_SHORTAGE) ..")"
			return false
		elseif IsNearOilShortage(iPlayer) and fuelConsumption > AI_UNIT_RESOURCE_LOW then		
			g_UnitRestrictionString = "Player is low on oil and unit use " .. tostring(fuelConsumption) .." (max allowed = ".. tostring(AI_UNIT_RESOURCE_LOW) ..")"
			return false
		end
	end

	local unitClassType = GameInfo["Units"][iUnitType]["Class"]
	local unitClass = GameInfo.UnitClasses[unitClassType].ID
	
	-- restrictions based on numbers

	if g_Unit_Classes[unitClass] then -- bugfix : some unused classes are not defined (Settler, Worker...), just don't test them...

		-- restriction ratio for AI player
		if  (not player:IsBarbarian()) and (not player:IsHuman()) and USE_UNIT_RATIO_FOR_AI then
			local totalUnits = player:GetNumMilitaryUnits()
			local numDomain = CountDomainUnits (iPlayer, iUnitType) 
			local id = civID
			if player:IsMinorCiv() then id = MINOR;	end
			if CacheIsLimitedByRatio(iUnitType, iPlayer, id, totalUnits, numDomain) then
				return false
			end
		end

		-- restriction when upgrade is available
		local upgradeType = GetLastUnitUpgradeType(player, iUnitType )
		if upgradeType then	
			g_UnitRestrictionString = "upgraded type available."		
			return false
		end

		-- restriction on builded units of this type
		local maxNumber = g_UnitMaxNumber[iUnitType]
		local numUnitType = CountUnitType (iUnitType)
		if (maxNumber and maxNumber <= CountUnitType (iUnitType)) then
			g_UnitRestrictionString = "Max build number reached (g_UnitMaxNumber[unitType] <= CountUnitType (unitType)) -> (".. maxNumber .." <= ".. numUnitType ..")"
			return false
		end
	
		-- restriction on unit instances
		local maxInstance = g_UnitMaxInstance[iUnitType]
		if maxInstance then
			local aliveUnits = CountUnitTypeAlive (iUnitType)
			if (maxInstance <= aliveUnits) then
				g_UnitRestrictionString = "Max instance reached (g_UnitMaxInstance[unitType] <= CountUnitTypeAlive (unitType)) -> (".. maxInstance .." <= ".. aliveUnits ..")"
				return false
			end
		end
	end

	-- allowed unit ?
	-- check last, as it returns "true"
	if PlayerCanEverBuild(iPlayer, iUnitType) then
		return true
	end

	return false
end

function PlayerCreateRestriction (iPlayer, iProjectType)

	local civID = GetCivIDFromPlayerID(iPlayer, false)

	if IsProjectDone(iProjectType, civID) then
		return false -- don't allow project marked as done for this civ
	end

	-- project available for this player ?
	if IsProjectOfCiv(iProjectType, civID) then
		-- projects triggered ?
		if g_ProjectsTable[iProjectType] then

			if g_ProjectsTable[iProjectType].AIOnly and Players[iPlayer]:IsHuman() then -- some projects are available for the AI only
				return false
			end

			local triggerData = g_ProjectsTable[iProjectType].Trigger
			if triggerData then
				local savedData = Modding.OpenSaveData()
				local saveStr = "Project-"..iProjectType
				local triggered = savedData.GetValue(saveStr)
				if triggered == 1 then
					return true
				end
			else -- project allowed for this nation, but no trigger data defined, return true
				return true
			end
		else
			Dprint ("WARNING: project (ID="..iProjectType..") is not defined in g_ProjectsTable")
		end
	end

	return false
end

function CityBuildingRestriction (iPlayer, iCity, iBuildingType)
	local civID = GetCivIDFromPlayerID(iPlayer, false)
	local player = Players [ iPlayer ]
	local city = player:GetCityByID(iCity)

	local bAllow = true -- nothing preventing construction of the new building yet

	local allowedTable = g_Buildings_Req[iBuildingType]
	local exclusiveTable = g_Buildings_Exclusion[iBuildingType]
	if (allowedTable or exclusiveTable ) then
		-- first check if requested buildings are needed and present
		if (allowedTable) then
			for i, reqBuilding in ipairs (allowedTable) do	 
				if (not city:IsHasBuilding(reqBuilding)) then
					bAllow = false -- one requested building is not present
				end
			end
		end
		-- then check if there are exclusive buildings
		if (exclusiveTable) then
			for i, building in ipairs (exclusiveTable) do
				if (city:IsHasBuilding(building)) then
					bAllow = false -- an exclusive building prevent the construction
				end
			end
		end
	else
		return true -- there are no request or exclusive table for this building
	end
	
	return bAllow -- there was a request table or an exclusive table (or both), return the test result
end

function CityTrainingRestriction (iPlayer, iCity, iUnitType)
	bDebug = false
	local player = Players [ iPlayer ]
	local city = player:GetCityByID(iCity)
	
	Dprint("- Check training restriction for " .. player:GetName() .. " in  " .. city:GetName() .. " for unitType = " .. iUnitType, bDebug)

	bAllow = true

	if NO_AI_EMBARKATION and NO_LAND_UNIT_BUILD_ON_ISLAND and (not player:IsHuman()) then
		local area = city:Area()
		if area:GetNumTiles() < NO_LAND_UNIT_ISLAND_MAX_AREA then
			if GameInfo["Units"][iUnitType]["Domain"] =="DOMAIN_LAND" then 
				return false
			end
		end
	end

	if (city:IsOccupied() and not CAN_BUILD_UNIT_IN_OCCUPIED_CITY) then
		if not (city:IsHasBuilding(COURTHOUSE) and city:IsHasBuilding(RADIO) ) then
			return false
		end
	end

	-- runtime error: c stack overflow
	--if not city:CanTrain( iUnitType ) then
	--	bAllow = false
	--end

	local unitClassType = GameInfo["Units"][iUnitType]["Class"]
	local unitClass = GameInfo.UnitClasses[unitClassType]

	if (g_Unit_Classes and g_Unit_Classes[unitClass.ID]) then
		local allowedTable = g_Unit_Classes[unitClass.ID].Buildings or {}
		for i, reqBuilding in ipairs (allowedTable) do
			if (not city:IsHasBuilding(reqBuilding)) then
				bAllow = false
			end
		end
	end	
	
	if (g_Unit_ReqBuildings and g_Unit_ReqBuildings[iUnitType]) then
		local allowedTable = g_Unit_ReqBuildings[iUnitType]
		for i, reqBuilding in ipairs (allowedTable) do
			if (not city:IsHasBuilding(reqBuilding)) then
				bAllow = false
			end
		end
	end	

	Dprint("   Returning: " .. tostring(bAllow), bDebug)

	return bAllow
end

function CityCreateRestriction (iPlayer, iCity, iProjectType)
	local civID = GetCivIDFromPlayerID(iPlayer, false)
	local player = Players [ iPlayer ]
	local city = player:GetCityByID(iCity)
	local bCanCreate = false

	if g_ProjectsTable[iProjectType] then
		local allowedTable = g_ProjectsTable[iProjectType].Buildings
		if (allowedTable) then
			for i, reqBuilding in ipairs (allowedTable) do
				if (city:IsHasBuilding(reqBuilding)) then
					bCanCreate = true
				end
			end
			return bCanCreate
		else
			return true	-- no building defined, return default = true
		end		
	else
		return true	-- no table defined, return default = true	
	end
	return bCanCreate

end

function CityMaintainingRestriction (iPlayer, iCity, iProcessType)
	local civID = GetCivIDFromPlayerID(iPlayer, false)
	local player = Players [ iPlayer ]
	local city = player:GetCityByID(iCity)

	if (city:IsOccupied() and not CAN_BUILD_UNIT_IN_OCCUPIED_CITY) then
		if not (city:IsHasBuilding(COURTHOUSE) and city:IsHasBuilding(RADIO) ) then
			if iProcessType == WAR_BONDS or iProcessType == RECRUITING then
				return false
			end
		end
	end

	return true
end

function DeclareWarRestriction (myTeam, theirTeam)

	local turn = Game.GetGameTurn()
	-- Don't allow to start war at game launch...
	if (turn < WAR_MINIMUM_STARTING_TURN) then
		return false
	end
	
	-- Is alternate history allowed ?
	if not ALLOW_ALTERNATE_HISTORY then
		return false
	end

	-- no inter-allied war !
	local myPlayer = -1
	local theirPlayer = -1

 	for iLoopPlayer = 0, GameDefines.MAX_CIV_PLAYERS-1, 1 do
	    local pLoopPlayer = Players[iLoopPlayer]
	    if (pLoopPlayer:GetTeam() == myTeam) then
			myPlayer = iLoopPlayer
	    end
	    if (pLoopPlayer:GetTeam() == theirTeam) then
			theirPlayer = iLoopPlayer
	    end
	    if (myPlayer ~= -1 and theirPlayer ~= -1) then
			break
	    end
	end

	local myCiv = GetCivIDFromPlayerID(myPlayer, false)
	local theirCiv = GetCivIDFromPlayerID(theirPlayer, false)
	
	local bMyIsAxe = g_Axis[myCiv]
	local bTheirIsAxe = g_Axis[theirCiv]

	local bMyIsAllied = g_Allied[myCiv]
	local bTheirIsAllied = g_Allied[theirCiv]
	
	if ( bMyIsAxe and bTheirIsAxe ) then
		return false
	elseif ( bMyIsAllied and bTheirIsAllied ) then
		return false
	else
		return true
	end
end


--------------------------------------------------------------
-- Projects functions 
--------------------------------------------------------------
function InitializeProjects()

	local bDebug = true

	Dprint("-------------------------------------")
	Dprint("Initializing new projects...")

	if g_ProjectsAvailableAtStart then
		-- Already researched at start	
		local savedData = Modding.OpenSaveData()
		local startProjectInitialized = savedData.GetValue("FromStartProjects")
		if startProjectInitialized ~=1 then
			for civID, projects in pairs(g_ProjectsAvailableAtStart) do
				for n, projectID in pairs(projects) do
					local projectInfo = GameInfo.Projects[projectID]
					MarkProjectDone(projectID, civID) -- new code
					local saveStr = "Project-"..projectID
					savedData.SetValue(saveStr, 1) -- mark as triggered !
					Dprint ( Locale.ConvertTextKey(projectInfo.Description) .." is completed.", debug )
				end
			end
			savedData.SetValue("FromStartProjects", 1)
		end
	end
	
	if not g_ProjectsTable then
		return
	end

	-- Projects to research
	for id, projectData in pairs(g_ProjectsTable) do	
		local savedData = Modding.OpenSaveData()
		local saveStr = "Project-"..id
		local triggered = savedData.GetValue(saveStr)
		if triggered ~= 1 then -- not triggered yet, test it !

			-- check if other projects are required for this one
			local bMissingProject = false
			local allowedTable = projectData.Projects
			local projectInfo = GameInfo.Projects[id]
			if allowedTable then -- don't check if there is no project prerequested
				for i, projectID in ipairs (allowedTable) do
					if (not IsProjectDone(projectID)) then -- not looking for a specific civs here
						Dprint ( " - " .. Locale.ConvertTextKey(projectInfo.Description) .." lacks pre-required project.", debug )
						bMissingProject = true
					end
				end
			end

			-- check if project is available for this scenario
			local bMissingScenario = true
			local ScenarioList = projectData.Scenarios
			if ScenarioList then 
				for i, scenarioName in ipairs (ScenarioList) do
					if scenarioName == g_Scenario_Name then
						Dprint ( " - " .. Locale.ConvertTextKey(projectInfo.Description) .." available in " .. scenarioName, debug )
						bMissingScenario = false
					end
				end
			else -- no scenario prerequested...
				bMissingScenario = false
			end

			if (not bMissingProject) and (not bMissingScenario) then
				data = projectData.Trigger
				if not data then -- initialize immediatly
					savedData.SetValue(saveStr, 1)
					Dprint ( " - No trigger data, " .. Locale.ConvertTextKey(projectInfo.Description) .." is immediatly available.", debug )
				else
					local bDateCheck = true
					local bXPCheck = true
					local sNotificationString = ""

					local iActivePlayer = Game.GetActivePlayer()
					local iActiveCiv = GetCivIDFromPlayerID(iActivePlayer, false)

					if (data.Type == TRIGGER_DATE or data.Type == TRIGGER_DATE_AND_XP or data.Type == TRIGGER_DATE_OR_XP) then
						if data.Date and data.ProbPerTurn then
							local rand = math.random( 1, 100 )
							local turn = Game.GetGameTurn()
							local date = g_Calendar[turn] or " "
							if data.ProbPerTurn >= rand and date.Number >= data.Date then
								sNotificationString = Locale.ConvertTextKey(projectInfo.Description) .." is now available."
								Dprint ( " - " .. Locale.ConvertTextKey(projectInfo.Description) .." date = Checked ! ( >= ".. tostring(data.Date) .." and Prob ".. tostring(data.ProbPerTurn) .."% >= "..tostring(rand)..")", debug )
							else
								bDateCheck = false
								Dprint ( " - " .. Locale.ConvertTextKey(projectInfo.Description) .." date = Fail ! ( < ".. tostring(data.Date) .." or Prob ".. tostring(data.ProbPerTurn) .."% < "..tostring(rand)..")", debug )
							end
						else						
							Dprint ( " - ERROR: missing data.Date or data.ProbPerTurn for " .. Locale.ConvertTextKey(projectInfo.Description) .." whith Date triggering...", debug )
						end
					end
					if (data.Type == TRIGGER_XP or data.Type == TRIGGER_DATE_AND_XP or data.Type == TRIGGER_DATE_OR_XP) then
						if data.Reference then
							local unitInfo = GameInfo.Units[data.Reference]
							if unitInfo then
								local combatXP = GetTotalCombatXP(data.Reference)
								if combatXP >= data.XP then
									Dprint ( " - " .. Locale.ConvertTextKey(projectInfo.Description) .." Checked ! (XP = ".. tostring(combatXP) .." >= "..tostring(data.XP)..")", debug )							
									sNotificationString = "Based on combat experience with ".. Locale.ConvertTextKey(unitInfo.Description) ..", " .. Locale.ConvertTextKey(projectInfo.Description) .." is now available."
								else
									Dprint ( " - " .. Locale.ConvertTextKey(projectInfo.Description) .." XP = Fail ! (XP = ".. tostring(combatXP) .." < "..tostring(data.XP)..")", debug )
									bXPCheck = false
								end							
							else						
								Dprint ( " - ERROR: no unitInfo found  with data.Reference = " .. tostring(data.Reference) .." for " .. Locale.ConvertTextKey(projectInfo.Description), debug )
							end
						else						
							Dprint ( " - ERROR: no unit in data.Reference for " .. Locale.ConvertTextKey(projectInfo.Description) .." whith XP triggering...", debug )
						end
					end
					if	((data.Type == TRIGGER_XP or data.Type == TRIGGER_DATE) and (bDateCheck and bXPCheck)) -- if data.Type is TRIGGER_XP then bDateCheck is always true and if data.Type is TRIGGER_DATE then bXPCheck is always true...
					 or ((data.Type == TRIGGER_DATE_AND_XP) and (bDateCheck and bXPCheck))
					 or ((data.Type == TRIGGER_DATE_OR_XP) and (bDateCheck or bXPCheck))
					 then
						savedData.SetValue(saveStr, 1)
						if IsProjectOfCiv(id, iActiveCiv) then
							Players[iActivePlayer]:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, sNotificationString, "New Project available !", -1, -1)
						end
						Dprint ( sNotificationString, debug )
					end
				end
			end
		end
	end
end


--------------------------------------------------------------
-- Input Handler
--------------------------------------------------------------
function InputHandler( uiMsg, wParam, lParam )
	if uiMsg == KeyEvents.KeyDown then
		if wParam == Keys.VK_F11 then

			-- table data saving here
			SaveAllTable()

		    Dprint("-------------------------------------")
		    Dprint("Quicksaving...")
		    Dprint("-------------------------------------")

			UI.QuickSave()
        	return true
		end
	end
	
end
ContextPtr:SetInputHandler( InputHandler )


--------------------------------------------------------------
-- User Interface
--------------------------------------------------------------

function AirSweepHighlight()
	local interfaceMode = UI.GetInterfaceMode()
	if interfaceMode == InterfaceModeTypes.INTERFACEMODE_AIR_SWEEP then
		local pSelUnit = UI.GetHeadSelectedUnit()
		local selUnitPlot = pSelUnit:GetPlot()
		local selX = selUnitPlot:GetX()
		local selY = selUnitPlot:GetY()
		local range = pSelUnit:Range()
		for x = -range,range do
			for y = -range,range do
				local tPlot = Map.GetPlotXY(selX,selY,x,y)
				if tPlot ~= nil then
					local tX = tPlot:GetX()
					local tY = tPlot:GetY()
					local tdist = Map.PlotDistance(selX,selY,tX,tY)
					if tdist <= range then
						local hex = ToHexFromGrid(Vector2(tX,tY))
						Events.SerialEventHexHighlight(hex,true,Vector4(0.7,0.7,0,1),"MovementRangeBorder")
					end
				end
			end
		end
	end
end
--Events.InterfaceModeChanged.Add(AirSweepHighlight)

--------------------------------------------------------------
-- Load / Save Handler
--------------------------------------------------------------
function OnSaveClicked()
	Dprint("-------------------------------------")
	Dprint("SaveGame clicked")

	SaveAllTable()

	local iPlayer = Game.GetActivePlayer()
	local leaderName = PreGame.GetLeaderName(iPlayer)
	local civ = PreGame.GetCivilization()
	local civInfo = GameInfo.Civilizations[civ]
	local leader = GameInfo.Leaders[GameInfo.Civilization_Leaders( "CivilizationType = '" .. civInfo.Type .. "'" )().LeaderheadType]
	
	local leaderDescription = Locale.ConvertTextKey(leader.Description)
	if leaderName ~= nil and leaderName ~= ""then
		leaderDescription = leaderName;
	end
	
	local turn = Game.GetGameTurn()
	local saveDate =  g_Calendar[turn].Text or "xx-xx-1947"
	local saveStr = leaderDescription .. " - Turn " .. turn .. " - " .. saveDate
    UI.SaveGame( saveStr )
	--Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes.NOTIFICATION_GENERIC,  "Game saved as :[NEWLINE]" .. saveStr, "Game saved !", -1, -1)
	Events.GameplayAlertMessage("Saving Game ( " .. saveStr .. " ) ...")
end

function OnQuickSaveClicked()
	Dprint("-------------------------------------")
	Dprint("QuickSaveGame clicked")
	SaveAllTable()
	UI.QuickSave()
end

function RegisterOnSaveCallback()

	local QuickSaveButton = ContextPtr:LookUpControl("/InGame/GameMenu/QuickSaveButton")
	local SaveCtrlButton = ContextPtr:LookUpControl("/InGame/GameMenu/SaveGameButton")

	QuickSaveButton:RegisterCallback( Mouse.eLClick, OnQuickSaveClicked )
	SaveCtrlButton:RegisterCallback( Mouse.eLClick, OnSaveClicked )

	print ("SaveGame Buttons callbacks registered...")
	Dprint("-------------------------------------")
end

--------------------------------------------------------------
-- Other functions...
--------------------------------------------------------------

function TransfertDamage( city, damage)

	local bDebug = true
	
	Dprint("Transfering ".. tostring(damage).." damage from city to local improvements...", bDebug)
	local sector = math.random( 1, 6 ) -- north, north-east, ...
	local anticlock = (math.random( 1, 2 ) == 2)
	local range = 2	
	Dprint(" - Range = ".. tostring(range) ..", sector = ".. tostring(sector) ..", anticlock = ".. tostring(anticlock), bDebug)

	for plot in PlotAreaSpiralIterator(city:Plot(), range, sector, anticlock, DIRECTION_OUTWARDS, false) do

		local damageTotransfert = damageImprovements(city, damage, plot)

		Dprint("     - damage left to transfert = ".. tostring(damageTotransfert), bDebug)
		if damageTotransfert <= 0 then
			return
		end

	end

	-- todo: another pass at roads/rails if there are damage point left ?
end

function damageImprovements(city, damage, plot)

	local improvementType = plot:GetImprovementType()
	local fortType = GameInfoTypes["IMPROVEMENT_FORT"]
	local citadelType = GameInfoTypes["IMPROVEMENT_CITADEL"]
	local bunkerType = GameInfoTypes["IMPROVEMENT_BUNKER"]
	local damageTotransfert = 0

	if improvementType ~= -1 and improvementType ~= fortType and improvementType ~= citadelType and improvementType ~= bunkerType and plot:GetOwner() == city:GetOwner() then -- pure defensive improvements are not destroyed by city bombing

		local plotKey = GetPlotKey ( plot )
		local improvementDamage = 0

		Dprint(" - Found = ".. tostring(GameInfo.Improvements[improvementType].Type) .." at (".. tostring(plotKey) ..")", bDebug)
		
		if MapModData.RED.DynamicMap[plotKey] then
			improvementDamage = MapModData.RED.DynamicMap[plotKey].ImprovementDamage or 0
		else
			MapModData.RED.DynamicMap[plotKey] = { ImprovementDamage = 0, RouteDamage = 0  }
		end
		Dprint("     - current damage = ".. tostring(improvementDamage), bDebug)

		local received = math.min (damage, IMPROVEMENT_MAX_DAMAGE - improvementDamage)
		damageTotransfert = damage - received
			
		Dprint("     - received damage = ".. tostring(received) .." (IMPROVEMENT_MAX_DAMAGE - current damage = ".. tostring(IMPROVEMENT_MAX_DAMAGE - improvementDamage) ..")", bDebug)

		MapModData.RED.DynamicMap[plotKey].ImprovementDamage = MapModData.RED.DynamicMap[plotKey].ImprovementDamage + received

		if MapModData.RED.DynamicMap[plotKey].ImprovementDamage >= IMPROVEMENT_DAMAGED_THRESHOLD and not plot:IsImprovementPillaged() then
			Dprint("     - total damage (".. tostring(received) ..") is >=  IMPROVEMENT_DAMAGED_THRESHOLD (".. tostring(IMPROVEMENT_DAMAGED_THRESHOLD) .."), pillaging improvement !", bDebug)
			plot:SetImprovementPillaged( true )
		end

	end
	return damageTotransfert
end

function RepairImprovements()
	Dprint("Check for Improvements to repair...")
	for plotKey, data in pairs(MapModData.RED.DynamicMap) do
		if MapModData.RED.DynamicMap[plotKey] then
			MapModData.RED.DynamicMap[plotKey].ImprovementDamage = math.max(0, MapModData.RED.DynamicMap[plotKey].ImprovementDamage - IMPROVEMENT_REPAIR_PER_TURN)
			MapModData.RED.DynamicMap[plotKey].RouteDamage = math.max(0, MapModData.RED.DynamicMap[plotKey].RouteDamage - IMPROVEMENT_REPAIR_PER_TURN)

			if MapModData.RED.DynamicMap[plotKey].ImprovementDamage < IMPROVEMENT_DAMAGED_THRESHOLD then
				local plot = GetPlotFromKey ( plotKey )
				if plot:IsImprovementPillaged() then
					Dprint("Repairing improvement at " .. plotKey)
					plot:SetImprovementPillaged( false )
				end
			end
			
			if MapModData.RED.DynamicMap[plotKey].RouteDamage < IMPROVEMENT_DAMAGED_THRESHOLD then
				local plot = GetPlotFromKey ( plotKey )
				if plot:IsRoutePillaged() then
					Dprint("Repairing route at " .. plotKey)
					plot:SetRouteType( plot:GetRouteType() ) -- seems that hacky way to say plot:SetImprovementPillaged( false )
				end
			end

		end
	end 
end
-- add at start of turn

function NewGetNickName(self)
	local playerID = self:GetID()
	local civIndex = PreGame.GetCivilization( playerID )
	if( civIndex ~= -1 ) then
		local civ = GameInfo.Civilizations[ civIndex ]
		local leader = GameInfo.Leaders[GameInfo.Civilization_Leaders( "CivilizationType = '" .. civ.Type .. "'" )().LeaderheadType]
		return Locale.ConvertTextKey(leader.Description)
	else
		local name = self:GetName()
		return name
	end
end

function InitializeHotseat()
	if Game.IsHotSeat() then
		Dprint("Initializing Hotseat game...")
		-- replace player:GetName() by custom test function...
		local p = getmetatable(Players[0]).__index
		p.OldGetNickName = p.GetNickName
		p.GetNickName = NewGetNickName

		if (PreGame.GetGameOption("GAMEOPTION_NO_MP_LIST") ~= nil) and (PreGame.GetGameOption("GAMEOPTION_NO_MP_LIST") > 0) then
			Dprint("No MP list option is activated...")
			ContextPtr:LookUpControl("/InGame/WorldView/MPList/MPListStack"):SetHide(true) 
			
		end
	end
end
--Events.SequenceGameInitComplete.Add( InitializeHotseat )

function SetQuickCombat()
	PreGame.SetQuickCombat( true );
	PreGame.SetQuickMovement( true );
	Events.GameplayAlertMessage("Quick Combat/Movement = ON")
end

function RemoveQuickCombat()
	PreGame.SetQuickCombat( false );
	PreGame.SetQuickMovement( false );
	Events.GameplayAlertMessage("Quick Combat/Movement = OFF")
end

function InitializeUI()
	Dprint("Initializing User Interface...")

	-- Override StrategicViewButton to set quick combat/movement on left/right click
	--ContextPtr:LookUpControl("/InGame/WorldView/MiniMapPanel/StrategicViewButton"):SetHide(true)	
	ContextPtr:LookUpControl("/InGame/WorldView/MiniMapPanel/StrategicViewButton"):SetTexture( "assets/UI/Art/Icons/MainUnitButton.dds" );
	ContextPtr:LookUpControl("/InGame/WorldView/MiniMapPanel/StrategicMO"):SetTexture( "assets/UI/Art/Icons/MainUnitButton.dds" );
	ContextPtr:LookUpControl("/InGame/WorldView/MiniMapPanel/StrategicHL"):SetTexture( "assets/UI/Art/Icons/MainUnitButtonHL.dds" );	
	ContextPtr:LookUpControl("/InGame/WorldView/MiniMapPanel/StrategicViewButton"):RegisterCallback( Mouse.eLClick, SetQuickCombat );
	ContextPtr:LookUpControl("/InGame/WorldView/MiniMapPanel/StrategicViewButton"):RegisterCallback( Mouse.eRClick, RemoveQuickCombat );
	ContextPtr:LookUpControl("/InGame/WorldView/MiniMapPanel/StrategicViewButton"):SetToolTipString("Configure Quick Combat/Movement[NEWLINE]left click = ON[NEWLINE]right click = OFF")
		
	ContextPtr:LookUpControl("/InGame/WorldView/DiploCorner/SocialPoliciesButton"):SetHide(true) 	
	ContextPtr:LookUpControl("/InGame/WorldView/DiploCorner/AdvisorButton"):SetHide(true)	
	ContextPtr:LookUpControl("/InGame/WorldView/InfoCorner"):SetHide(true)
	
	Events.SerialEventGameDataDirty()
	Events.SerialEventTurnTimerDirty()
	Events.SerialEventCityInfoDirty()
end

function IsUnderControl ( plot, bCapturedPlot )

	if plot:IsWater() then
		return
	end

	local bDebug = DEBUG_ORPHAN_TILE
	local playerID = plot:GetOwner()
	local player = Players[ playerID ]

	if (not player) or (not player:IsAlive()) then
		return false
	end

	local area = plot:GetArea()
	Dprint (" - Search supply line for plot " .. plot:GetX() .. ",".. plot:GetY(), bDebug)

	-- save time, try the most common first
	local closeCity = GetCloseCity ( playerID, plot )
	if closeCity then
		local cityPlot = closeCity:Plot()
		-- first check the area, no need to calculate land path if not in the same land... 
		if bCapturedPlot then
			if ( cityPlot:GetArea() == area and isPlotConnected(player, plot, cityPlot, "Land", nil, nil, NoNationalPath) ) then -- path must be direct (not going through friendly territory)
				Dprint ("   - Found path with close city (".. closeCity:GetName() ..")", bDebug )
				return true
			end
		else
			if ( cityPlot:GetArea() == area and isPlotConnected(player, plot, cityPlot, "Land", nil, nil, PathBlocked) ) then -- for "free territory", friendly path is allowed
				Dprint ("   - Found path with close city (".. closeCity:GetName() ..")", bDebug )
				return true
			end
		end
	end

	--local adjacentPlots = GetPlotsInCircle(plot, 0, MAX_PLOT_CONTROL_RANGE)
	--local adjacentPlots = GetPlotsInSpiral(plot, MAX_PLOT_CONTROL_RANGE)
		
	Dprint ("   - No path yet, check near area", bDebug )
	--for i, adjPlot in pairs(adjacentPlots) do			

	for adjPlot in PlotAreaSpiralIterator(plot, MAX_PLOT_CONTROL_RANGE, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, true) do	

		-- units
		local unitCount = adjPlot:GetNumUnits()    
		for i = 0, unitCount - 1, 1	do
    		local unit = adjPlot:GetUnit(i)
			if unit then 

				local unitClassID = unit:GetUnitClassType()	-- yes GetUnitClassType return an ID...

				if bCapturedPlot then -- and plot:GetOwner() == unit:GetOwner() then -- captured plot are kept under control by own units only...
					if plot:GetOwner() == unit:GetOwner() and CanCaptureTile(unitClassID) and isPlotConnected(Players[unit:GetOwner()], plot, adjPlot, "Land", nil, nil, NoNationalPath) then -- path must be direct for captured plots (not going through friendly territory)
						Dprint ("   - Found path with unit (".. unit:GetName() ..") for captured plot", bDebug )
						return true
					end
				elseif AreSameSide( plot:GetOwner(), unit:GetOwner()) then -- any ally can keep control of free territory
					if CanCaptureTile(unitClassID) and isPlotConnected(Players[unit:GetOwner()], plot, adjPlot, "Land", nil, nil, PathBlocked) then -- for "free territory", friendly path is allowed
						Dprint ("   - Found path with unit (".. unit:GetName() ..")", bDebug )
						return true
					end
				end
			end
		end

		-- cities
		if adjPlot:IsCity() then
			local city = adjPlot:GetPlotCity()
			if city  then -- AreSameSide( plot:GetOwner(), city:GetOwner()) then
				if bCapturedPlot then --and plot:GetOwner() == city:GetOwner() then -- captured plot are kept under control by own cities only...
					if plot:GetOwner() == city:GetOwner() and isPlotConnected(Players[city:GetOwner()], plot, adjPlot, "Land", nil, nil, NoNationalPath) then  -- path must be direct for captured plots (not going through friendly territory)
						Dprint ("   - Found path with city (".. closeCity:GetName() ..") for captured plot", bDebug )
						return true
					end
				elseif AreSameSide( plot:GetOwner(), city:GetOwner()) then -- any ally can keep control of free territory
					if isPlotConnected(Players[city:GetOwner()], plot, adjPlot, "Land", nil, nil, PathBlocked) then -- for "free territory", friendly path is allowed
						Dprint ("   - Found path with city (".. closeCity:GetName() ..")", bDebug )
						return true
					end
				end
			end
		end
	end
	
	Dprint ("   - No path found !", bDebug )
	return false
end

function TestEnemyControl(plot, bCapturedPlot)

	local bDebug = DEBUG_ORPHAN_TILE
	
	Dprint (" - Search new military control for plot " .. plot:GetX() .. ",".. plot:GetY(), bDebug )
	--local adjacentPlots = GetPlotsInCircle(plot, 0, MAX_PLOT_CONTROL_RANGE)
	--local adjacentPlots = GetPlotsInSpiral(plot, MAX_PLOT_CONTROL_RANGE)

	--for j, adjPlot in pairs(adjacentPlots) do
	for adjPlot in PlotAreaSpiralIterator(plot, MAX_PLOT_CONTROL_RANGE, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, true) do

		-- units
		local unitCount = adjPlot:GetNumUnits()    
		for i = 0, unitCount - 1, 1	do
    		local unit = adjPlot:GetUnit(i)
			if unit and ( AreAtWar( plot:GetOwner(), unit:GetOwner()) or bCapturedPlot ) then
				local unitClassID = unit:GetUnitClassType()	-- yes GetUnitClassType return an ID...
				if CanCaptureTile(unitClassID) and isPlotConnected(Players[unit:GetOwner()], plot, adjPlot, "Land", nil, nil, NoNationalPath) then
					plot:SetOwner(unit:GetOwner(), -1)
					Dprint ("   - controlled by " .. unit:GetName(), bDebug )
					return true
				end
			end
		end

		-- cities
		if adjPlot:IsCity() then
			local city = adjPlot:GetPlotCity()
			if city and ( AreAtWar( plot:GetOwner(), city:GetOwner()) or bCapturedPlot ) then
				if isPlotConnected(Players[city:GetOwner()], plot, adjPlot, "Land", nil, nil, NoNationalPath) then
					plot:SetOwner(city:GetOwner(), -1)
					Dprint ("   - controlled by " .. city:GetName(), bDebug )
					return true
				end
			end
		end
	end
	return false
end


function GiveToNearestPlayer(plot)

	local bDebug = DEBUG_ORPHAN_TILE
	
	Dprint (" - Search new military control for unowned plot " .. plot:GetX() .. ",".. plot:GetY(), bDebug )
	--local adjacentPlots = GetPlotsInCircle(plot, 0, MAX_PLOT_CONTROL_RANGE)

	--for j, adjPlot in pairs(adjacentPlots) do
	for adjPlot in PlotAreaSpiralIterator(plot, MAX_PLOT_CONTROL_RANGE, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, true) do
		
		-- units
		local unitCount = adjPlot:GetNumUnits()    
		for i = 0, unitCount - 1, 1	do
    		local unit = adjPlot:GetUnit(i)
			if unit then
				local unitClassID = unit:GetUnitClassType()	-- yes GetUnitClassType return an ID...
				if CanCaptureTile(unitClassID) and isPlotConnected(Players[unit:GetOwner()], plot, adjPlot, "Land", nil, nil, NoNationalPath) then
					plot:SetOwner(unit:GetOwner(), -1)
					Dprint ("   - controlled by " .. unit:GetName(), bDebug )
					return
				end
			end
		end

		-- cities
		if adjPlot:IsCity() then
			local city = adjPlot:GetPlotCity()
			if city then
				if isPlotConnected(Players[city:GetOwner()], plot, adjPlot, "Land", nil, nil, NoNationalPath) then
					plot:SetOwner(city:GetOwner(), -1)
					Dprint ("   - controlled by " .. city:GetName(), bDebug )
					return
				end
			end
		end
	end
end

function UpdatePlayerData(playerID)

	local player = Players[playerID]
	if not player then
		return
	end
	Dprint("-------------------------------------")
	Dprint("Updating player #".. tostring(playerID) .." data ...")	

	-- Update number of wounded soldier that could be healed.
	local wounded = 0
	for unit in player:Units() do
		-- Count only wounded from unit that have a supply line
		if CanGetReinforcement(unit) then
			local reqMateriel, reqPersonnel = RequestedReinforcementsPerHP(unit:GetUnitType(), unit)
			local totalPers = reqPersonnel * unit:GetDamage()
			wounded = wounded + (totalPers * WOUNDED_PERCENT / 100)
		end
	end
	g_Wounded[playerID] = Round(wounded)

end

function UpdateGlobalData()
	for iPlayer = 0, GameDefines.MAX_CIV_PLAYERS - 1 do
		local player = Players[iPlayer]
		if player and player:IsAlive() and not player:IsBarbarian() then
			UpdatePlayerData(iPlayer)	
			GetNumResourceTypeForPlayer(RESOURCE_OIL, iPlayer) -- update procurement detail
		end
	end	
end

function UpdateREDLoadingFix()
	local activatedMods = Modding.GetActivatedMods()
	for i,v in ipairs(activatedMods) do
		if v.ID == g_RED_WWII_ModID then
			local folder = Modding.GetModProperty(v.ID, v.Version, "Name");
			folder = tostring(folder) .. " (v ".. tostring(v.Version) .. ")"
			Dprint("-------------------------------------")
			Dprint("Updating R.E.D. Loading Fix in Assets folder, the mod's folder should be: ".. tostring(folder))	
			Dprint("-------------------------------------")
			Game.UpdateREDLoadingFix(folder)
		end
	end
end

function SetGlobalAIStrategicValues()
	Dprint("-------------------------------------")
	Dprint("Cache Global AI Strategic Values...")
	local t_start = os.clock()
	FillCacheIsLimitedByRatio()
	FillCacheTrainingRestriction()
	local t_end = os.clock()
	Dprint("  - Total time :		" .. t_end - t_start .. " s")
end


function SetPillageDamage (iX, iY, bImprovement, bRoute, iUnitID, iOwnerID)

	local plot = Map.GetPlot(iX, iY)
	local plotKey = GetPlotKey ( plot )
	local bDebugOutput = true
	Dprint ("Improvement pillaged by unit at (" .. tostring(plotKey).. ")", bDebugOutput)		

	-- Set timer to auto-repair plots that have been pillaged by units (like Special Forces)...
	if bImprovement then
		if not MapModData.RED.DynamicMap[plotKey] then
			Dprint("Mark Improvement pillaged by unit (max damage), set timer for auto-repair...", bDebugOutput)
			MapModData.RED.DynamicMap[plotKey] = { ImprovementDamage = IMPROVEMENT_MAX_DAMAGE, RouteDamage = 0  }
							
		elseif MapModData.RED.DynamicMap[plotKey].ImprovementDamage then
			Dprint("Update Improvement pillaged by unit (max damage), set timer for auto-repair...", bDebugOutput)
			MapModData.RED.DynamicMap[plotKey].ImprovementDamage = IMPROVEMENT_MAX_DAMAGE
		end
	end		
	if bRoute then
		if not MapModData.RED.DynamicMap[plotKey] then
			Dprint("Mark Route pillaged by unit (max damage), set timer for auto-repair...", bDebugOutput)
			MapModData.RED.DynamicMap[plotKey] = { ImprovementDamage = 0, RouteDamage = IMPROVEMENT_MAX_DAMAGE  }

		elseif MapModData.RED.DynamicMap[plotKey].RouteDamage then
			Dprint("Update Improvement pillaged by unit (max damage), set timer for auto-repair...", bDebugOutput)
			MapModData.RED.DynamicMap[plotKey].RouteDamage = IMPROVEMENT_MAX_DAMAGE
		end
	end

	Dprint ("-------------------------------------", bDebugOutput)
end
-- add to GameEvents.UnitHasPillaged