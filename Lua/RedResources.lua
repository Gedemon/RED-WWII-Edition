-- Lua RedResources
-- Author: Gedemon
-- DateCreated: 7/19/2011 11:18:03 PM
--------------------------------------------------------------

print("Loading Red Resources Functions...")
print("-------------------------------------")

--------------------------------------------------------------
-- Personnel 
--------------------------------------------------------------
function GetHealedFromHospital(city, bUpdate)
	local healed = 0
	local playerID = city:GetOwner()
	if g_Wounded[playerID] then
		healed = math.min(Round(g_Wounded[playerID] * HOSPITAL_HEALING_PERCENT), HOSPITAL_MAX_HEALING_PER_TURN )
		if bUpdate then
			g_Wounded[playerID] = g_Wounded[playerID] - healed
		end
	end
	return healed
end

function GetCityPersonnel(city, bUpdate) -- when bUpdate is true, variables can be updated (like number of wounded soldiers to be healed)
	local cityPersonnel = {}
	local ratio = 100
	local size = city:GetPopulation()
	local bCaptured = city:GetOriginalOwner() ~= city:GetOwner()

	cityPersonnel.fromHospital, cityPersonnel.fromPropaganda, cityPersonnel.fromRecruiting, cityPersonnel.fromNeedYou, cityPersonnel.fromFoodYield, cityPersonnel.fromTrait = 0, 0, 0, 0, 0, 0

	-- get ratio from captured cities
	if bCaptured then 
		ratio = CAPTURED_REINFORCEMENT_PERCENT	
		if city:IsOccupied() and not city:IsNoOccupiedUnhappiness() then
			ratio = OCCUPIED_REINFORCEMENT_PERCENT
		end
		if city:IsResistance() then
			ratio = RESISTANCE_REINFORCEMENT_PERCENT
		end
	end
	cityPersonnel.ratio = ratio

	-- to do : remove (magic numbers) !
	cityPersonnel.fromFoodYield = cityPersonnel.fromFoodYield + ((city:GetYieldRate(YieldTypes.YIELD_FOOD)/(2)) * ratio / 100)
	if city:IsHasBuilding(HOSPITAL) then cityPersonnel.fromHospital = cityPersonnel.fromHospital + ((GetHealedFromHospital(city, bUpdate)) * ratio / 100); end
	if city:IsHasBuilding(RADIO) then cityPersonnel.fromRecruiting = cityPersonnel.fromRecruiting + (size * (RADIO_RECRUITING_FACTOR) * ratio / 100); end
	if city:IsHasBuilding(ACADEMY) then cityPersonnel.fromRecruiting = cityPersonnel.fromRecruiting + ((25) * ratio / 100); end
	if city:IsHasBuilding(BARRACKS) then cityPersonnel.fromRecruiting = cityPersonnel.fromRecruiting + ((15) * ratio / 100); end
	if city:GetProductionProcess() == RECRUITING then cityPersonnel.fromNeedYou = cityPersonnel.fromNeedYou + ( (((city:FoodDifferenceTimes100() / 100) + size) /2) * ratio / 100); end

	cityPersonnel.total = cityPersonnel.fromHospital + cityPersonnel.fromRecruiting + cityPersonnel.fromFoodYield + cityPersonnel.fromNeedYou

	-- Apply bonuses
	if city:IsHasBuilding(RADIO) then cityPersonnel.fromPropaganda = cityPersonnel.fromPropaganda + ((cityPersonnel.fromRecruiting + cityPersonnel.fromNeedYou) * RADIO_PROPAGANDA_BONUS / 100 * ratio / 100); end	
	if not bCaptured and GetCivIDFromPlayerID (city:GetOwner()) == USSR then cityPersonnel.fromTrait = (cityPersonnel.fromRecruiting + cityPersonnel.fromNeedYou) * (100) / 100; end -- soviet trait

	-- Total
	cityPersonnel.total = cityPersonnel.total + cityPersonnel.fromPropaganda + cityPersonnel.fromTrait

	return cityPersonnel
end

function GetCityPersonnelTooltip(cityPersonnel)
	
	local strPersonnelToolTip = ""
	
	if (not OptionsManager.IsNoBasicHelp()) then
		strPersonnelToolTip = strPersonnelToolTip .. Locale.ConvertTextKey("TXT_KEY_PERSONNEL_HELP_INFO")
		strPersonnelToolTip = strPersonnelToolTip .. "[NEWLINE][NEWLINE]"
	end
	
	if (cityPersonnel.fromFoodYield ~= 0) then
		strPersonnelToolTip = strPersonnelToolTip .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_PERSONNEL_FROM_FOOD", cityPersonnel.fromFoodYield);
		strPersonnelToolTip = strPersonnelToolTip .. "[NEWLINE]";
	end
	if (cityPersonnel.fromHospital ~= 0) then
		strPersonnelToolTip = strPersonnelToolTip .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_PERSONNEL_FROM_HOSPITAL", cityPersonnel.fromHospital);
		strPersonnelToolTip = strPersonnelToolTip .. "[NEWLINE]";
	end
	if (cityPersonnel.fromRecruiting ~= 0) then
		strPersonnelToolTip = strPersonnelToolTip .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_PERSONNEL_FROM_RECRUITING", cityPersonnel.fromRecruiting);
		strPersonnelToolTip = strPersonnelToolTip .. "[NEWLINE]";
	end
	if (cityPersonnel.fromNeedYou ~= 0) then
		strPersonnelToolTip = strPersonnelToolTip .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_PERSONNEL_FROM_WE_NEED_YOU", cityPersonnel.fromNeedYou);
		strPersonnelToolTip = strPersonnelToolTip .. "[NEWLINE]";
	end

	local iBase = cityPersonnel.fromHospital + cityPersonnel.fromRecruiting + cityPersonnel.fromFoodYield + cityPersonnel.fromNeedYou

	local strTotal
	if (cityPersonnel.total >= 0) then
		strTotal = Locale.ConvertTextKey("TXT_KEY_YIELD_TOTAL", cityPersonnel.total, "[ICON_PERSONNEL]")
	else
		strTotal = Locale.ConvertTextKey("TXT_KEY_YIELD_TOTAL_NEGATIVE", cityPersonnel.total, "[ICON_PERSONNEL]")
	end
	
	-- Penalties were applied ?
	local ratio = 100 -- normal ratio
	if cityPersonnel.ratio ~= ratio then -- captured city

		local strMalusString = ""

		if cityPersonnel.ratio == OCCUPIED_REINFORCEMENT_PERCENT then
			ratio = ratio - OCCUPIED_REINFORCEMENT_PERCENT
			strMalusString = strMalusString .. Locale.ConvertTextKey("TXT_KEY_REINFORCEMENT_FROM_OCCUPIED", ratio) .. "[NEWLINE]";

		elseif cityPersonnel.ratio == RESISTANCE_REINFORCEMENT_PERCENT then
			ratio = ratio - RESISTANCE_REINFORCEMENT_PERCENT				
			strMalusString = strMalusString .. Locale.ConvertTextKey("TXT_KEY_REINFORCEMENT_FROM_RESISTANCE", ratio) .. "[NEWLINE]";

		else -- captured with administrative building	
			ratio = ratio - CAPTURED_REINFORCEMENT_PERCENT		
			strMalusString = strMalusString .. Locale.ConvertTextKey("TXT_KEY_REINFORCEMENT_FROM_CAPTURED", ratio) .. "[NEWLINE]";
		end		
		strPersonnelToolTip = strPersonnelToolTip .. "----------------[NEWLINE]" .. strMalusString;
	end	
	
	strPersonnelToolTip = strPersonnelToolTip .. "----------------";

	-- Build combined string
	if (iBase ~= cityPersonnel.total) then
		local strBase = Locale.ConvertTextKey("TXT_KEY_YIELD_BASE", iBase, "[ICON_PERSONNEL]")
		strPersonnelToolTip = strPersonnelToolTip .. "[NEWLINE]" .. strBase;
	end
	
	-- Modifiers
	if (cityPersonnel.fromPropaganda ~= 0 or cityPersonnel.fromTrait ~= 0) then

		local strModifiersString = ""

		if (cityPersonnel.fromPropaganda ~= 0) then
			strModifiersString = strModifiersString .. "[NEWLINE]" .. Locale.ConvertTextKey("TXT_KEY_PERSONNEL_FROM_PROPAGANDA", RADIO_PROPAGANDA_BONUS);
		end

		if (cityPersonnel.fromTrait ~= 0) then
			strModifiersString = strModifiersString .. "[NEWLINE]" .. Locale.ConvertTextKey("TXT_KEY_PERSONNEL_FROM_TRAIT");
		end


		strPersonnelToolTip = strPersonnelToolTip .. "[NEWLINE]----------------" .. strModifiersString .. "[NEWLINE]----------------";
	end

	-- Total
	strPersonnelToolTip = strPersonnelToolTip .. "[NEWLINE]" .. strTotal;

	return strPersonnelToolTip
end

function GetPersonnelReinforcement (playerID, bUpdate)
	
	local resourceData = MapModData.RED.ResourceData

	local player = Players[playerID]
	local personnelReinforcement = {}
	personnelReinforcement.fromGlobal, personnelReinforcement.fromHospital, personnelReinforcement.fromPropaganda, personnelReinforcement.fromRecruiting, personnelReinforcement.fromNeedYou, personnelReinforcement.fromTrait, personnelReinforcement.fromMinor, personnelReinforcement.fromScenario = 0, 0, 0, 0, 0, 0, 0, 0
	
	local handicap = GetHandicapForRED(player)

	-- Bonus from scenario
	if SCENARIO_PERSONNEL_PER_TURN then -- and not player:IsMinorCiv() <- if we allow CS to receive this bonus, this will also raise the bonuses from CS given to the player, may need rebalance 
		personnelReinforcement.fromScenario = Round(SCENARIO_PERSONNEL_PER_TURN / ((handicap + 2 ) /2) )
	end

	for city in player:Cities() do
		
		local cityPersonnel = GetCityPersonnel(city, bUpdate)
		
		personnelReinforcement.fromGlobal = personnelReinforcement.fromGlobal + cityPersonnel.fromFoodYield
		personnelReinforcement.fromHospital = personnelReinforcement.fromHospital + cityPersonnel.fromHospital
		personnelReinforcement.fromNeedYou = personnelReinforcement.fromNeedYou + cityPersonnel.fromNeedYou
		personnelReinforcement.fromPropaganda = personnelReinforcement.fromPropaganda + cityPersonnel.fromPropaganda
		personnelReinforcement.fromRecruiting = personnelReinforcement.fromRecruiting + cityPersonnel.fromRecruiting
		personnelReinforcement.fromTrait = personnelReinforcement.fromTrait + cityPersonnel.fromTrait

	end

	personnelReinforcement.total = personnelReinforcement.fromGlobal + personnelReinforcement.fromHospital + personnelReinforcement.fromPropaganda + personnelReinforcement.fromRecruiting + personnelReinforcement.fromNeedYou + personnelReinforcement.fromScenario + personnelReinforcement.fromTrait

	-- apply minor help
	if not player:IsMinorCiv() and not player:IsBarbarian() then
		for i = GameDefines.MAX_MAJOR_CIVS, GameDefines.MAX_CIV_PLAYERS - 1 do
			local minor = Players[i]
			if minor:IsAlive() then
				local favorite = minor:GetMinorCivFavoriteMajor()
				local friendship = minor:GetMinorCivFriendshipWithMajor(playerID)
				if friendship > 30 and resourceData[i] then
				--if favorite == playerID and resourceData[i] then -- MapModData.RED.ResourceData not available in toppanel ?
					local flux = tonumber(resourceData[i].FluxPersonnel) or 0
					local personnel = tonumber(resourceData[i].Personnel) or 0
					local level = minor:GetMinorCivFriendshipLevelWithMajor(favorite)
					local ratio, bonus = 0, 0
					if level == 2 then ratio = ALLY_REINFORCEMENT_PERCENT; end -- Allied
					if level == 1 then ratio = FRIEND_REINFORCEMENT_PERCENT; end -- Friend
					if flux > personnel then
						bonus = personnel*ratio/100
					else
						bonus = flux*ratio/100
					end
					-- apply change here only if MapModData.RED.ResourceData exist (redmain context, for calculation)
					if MapModData.RED.ResourceData[i] then
						--MapModData.RED.ResourceData[i].Personnel = personnel - bonus
						--MapModData.RED.ResourceData[i].FluxPersonnel = flux - bonus
					end
					personnelReinforcement.fromMinor = personnelReinforcement.fromMinor + bonus
					--Dprint(" - " .. minor:GetName() .. " send " .. bonus .. " troops to reinforce " .. player:GetName() .. " (total reinforcements from allies is " .. fromMinor .. ")" )
				end
			end
		end
	end

	personnelReinforcement.total = personnelReinforcement.total + personnelReinforcement.fromMinor
	--Dprint ("   return personnel : " .. total ..",".. fromGlobal ..",".. fromHospital..",".. fromPropaganda..",".. fromRecruiting..",".. fromTrait..",".. fromNeedYou..",".. fromMinor)
	--return Round(total), Round(fromGlobal), Round(fromHospital), Round(fromPropaganda), Round(fromRecruiting), Round(fromTrait), Round(fromNeedYou), Round(fromMinor), Round(fromScenario)
	return personnelReinforcement
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

--------------------------------------------------------------
-- Materiel 
--------------------------------------------------------------

function GetCityMateriel(city, bUpdate)
	local cityMateriel = {}
	local ratio = 100
	local size = city:GetPopulation()
	local bCaptured = city:GetOriginalOwner() ~= city:GetOwner()
	local bBlockaded =  city:IsBlockaded()

	cityMateriel.fromProdYield, cityMateriel.fromFactory, cityMateriel.fromHarbor, cityMateriel.fromWarBonds = 0, 0, 0, 0

	-- get ratio from captured cities
	if bCaptured then 
		ratio = CAPTURED_REINFORCEMENT_PERCENT	
		if city:IsOccupied() and not city:IsNoOccupiedUnhappiness() then
			ratio = OCCUPIED_REINFORCEMENT_PERCENT
		end
		if city:IsResistance() then
			ratio = RESISTANCE_REINFORCEMENT_PERCENT
		end
	end
	cityMateriel.ratio = ratio

	-- to do : remove (magic numbers) !	
	cityMateriel.fromProdYield = cityMateriel.fromProdYield + ((city:GetYieldRate(YieldTypes.YIELD_PRODUCTION)/(2)) * ratio / 100)
	if city:IsHasBuilding(FACTORY) then cityMateriel.fromFactory = cityMateriel.fromFactory + math.ceil((20) * ratio / 100); end
	if city:IsHasBuilding(LAND_FACTORY) then cityMateriel.fromFactory = cityMateriel.fromFactory + math.ceil((15) * ratio / 100); end
	if city:IsHasBuilding(SMALL_AIR_FACTORY) then cityMateriel.fromFactory = cityMateriel.fromFactory + math.ceil((5) * ratio / 100); end
	if city:IsHasBuilding(MEDIUM_AIR_FACTORY) then cityMateriel.fromFactory = cityMateriel.fromFactory + math.ceil((5) * ratio / 100); end
	if city:IsHasBuilding(LARGE_AIR_FACTORY) then cityMateriel.fromFactory = cityMateriel.fromFactory + math.ceil((5) * ratio / 100); end
	if city:IsHasBuilding(SHIPYARD) then cityMateriel.fromFactory = cityMateriel.fromFactory + math.ceil((15) * ratio / 100); end
	if city:IsHasBuilding(HARBOR) and not bBlockaded then cityMateriel.fromHarbor = cityMateriel.fromHarbor + math.ceil((10) * ratio / 100); end 
	if city:GetProductionProcess() == WAR_BONDS then cityMateriel.fromWarBonds = cityMateriel.fromWarBonds + math.ceil((((city:GetCurrentProductionDifferenceTimes100(false, false) + city:GetYieldRateTimes100(YieldTypes.YIELD_GOLD)) / 100 * WAR_BONDS_PRODUCTION_PERCENT / 100)) * ratio / 100); end -- Hey, Firaxis, you could have used simplier callbacks here...

	cityMateriel.total = cityMateriel.fromProdYield + cityMateriel.fromFactory + cityMateriel.fromHarbor + cityMateriel.fromWarBonds

	-- Apply bonuses (none yet)
	
	-- Total
	--cityMateriel.total = cityMateriel.total + bonuses

	return cityMateriel
end

function GetCityMaterielTooltip(cityMateriel)
	
	local strMaterielToolTip = ""
	
	if (not OptionsManager.IsNoBasicHelp()) then
		strMaterielToolTip = strMaterielToolTip .. Locale.ConvertTextKey("TXT_KEY_MATERIEL_HELP_INFO")
		strMaterielToolTip = strMaterielToolTip .. "[NEWLINE][NEWLINE]"
	end
	
	if (cityMateriel.fromProdYield ~= 0) then
		strMaterielToolTip = strMaterielToolTip .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_MATERIEL_FROM_PRODUCTION", cityMateriel.fromProdYield);
		strMaterielToolTip = strMaterielToolTip .. "[NEWLINE]";
	end
	if (cityMateriel.fromFactory ~= 0) then
		strMaterielToolTip = strMaterielToolTip .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_MATERIEL_FROM_FACTORY", cityMateriel.fromFactory);
		strMaterielToolTip = strMaterielToolTip .. "[NEWLINE]";
	end
	if (cityMateriel.fromHarbor ~= 0) then
		strMaterielToolTip = strMaterielToolTip .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_MATERIEL_FROM_HARBOR", cityMateriel.fromHarbor);
		strMaterielToolTip = strMaterielToolTip .. "[NEWLINE]";
	end
	if (cityMateriel.fromWarBonds ~= 0) then
		strMaterielToolTip = strMaterielToolTip .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_MATERIEL_FROM_WAR_BONDS", cityMateriel.fromWarBonds);
		strMaterielToolTip = strMaterielToolTip .. "[NEWLINE]";
	end

	local iBase = cityMateriel.fromProdYield + cityMateriel.fromFactory + cityMateriel.fromHarbor + cityMateriel.fromWarBonds

	local strTotal
	if (cityMateriel.total >= 0) then
		strTotal = Locale.ConvertTextKey("TXT_KEY_YIELD_TOTAL", cityMateriel.total, "[ICON_MATERIEL]")
	else
		strTotal = Locale.ConvertTextKey("TXT_KEY_YIELD_TOTAL_NEGATIVE", cityMateriel.total, "[ICON_MATERIEL]")
	end
	
	-- Penalties were applied ?
	local ratio = 100 -- normal ratio
	if cityMateriel.ratio ~= ratio then -- captured city

		local strMalusString = ""

		if cityMateriel.ratio == OCCUPIED_REINFORCEMENT_PERCENT then
			ratio = ratio - OCCUPIED_REINFORCEMENT_PERCENT
			strMalusString = strMalusString .. Locale.ConvertTextKey("TXT_KEY_REINFORCEMENT_FROM_OCCUPIED", ratio) .. "[NEWLINE]";

		elseif cityMateriel.ratio == RESISTANCE_REINFORCEMENT_PERCENT then
			ratio = ratio - RESISTANCE_REINFORCEMENT_PERCENT				
			strMalusString = strMalusString .. Locale.ConvertTextKey("TXT_KEY_REINFORCEMENT_FROM_RESISTANCE", ratio) .. "[NEWLINE]";

		else -- captured with administrative building	
			ratio = ratio - CAPTURED_REINFORCEMENT_PERCENT		
			strMalusString = strMalusString .. Locale.ConvertTextKey("TXT_KEY_REINFORCEMENT_FROM_CAPTURED", ratio) .. "[NEWLINE]";
		end		
		strMaterielToolTip = strMaterielToolTip .. "----------------[NEWLINE]" .. strMalusString;
	end	
	
	strMaterielToolTip = strMaterielToolTip .. "----------------";

	-- Build combined string
	if (iBase ~= cityMateriel.total) then
		local strBase = Locale.ConvertTextKey("TXT_KEY_YIELD_BASE", iBase, "[ICON_MATERIEL]")
		strMaterielToolTip = strMaterielToolTip .. "[NEWLINE]" .. strBase;
	end
	
	-- Modifiers (none yet)
	--[[
	if (cityMateriel.fromPropaganda ~= 0 or cityMateriel.fromTrait ~= 0) then

		local strModifiersString = ""

		if (cityPersonnel.fromPropaganda ~= 0) then
			strModifiersString = strModifiersString .. "[NEWLINE]" .. Locale.ConvertTextKey("TXT_KEY_PERSONNEL_FROM_PROPAGANDA", RADIO_PROPAGANDA_BONUS);
		end

		if (cityPersonnel.fromTrait ~= 0) then
			strModifiersString = strModifiersString .. "[NEWLINE]" .. Locale.ConvertTextKey("TXT_KEY_PERSONNEL_FROM_TRAIT");
		end


		strMaterielToolTip = strMaterielToolTip .. "[NEWLINE]----------------" .. strModifiersString .. "[NEWLINE]----------------";
	end
	--]]

	-- Total
	strMaterielToolTip = strMaterielToolTip .. "[NEWLINE]" .. strTotal;

	return strMaterielToolTip
end

function GetMaterielReinforcement (playerID, bUpdate)

	local resourceData = MapModData.RED.ResourceData

	local player = Players[playerID]
	local materielReinforcement = {}

	materielReinforcement.fromGlobal, materielReinforcement.fromFactory, materielReinforcement.fromHarbor, materielReinforcement.fromWarBonds, materielReinforcement.fromMinor, materielReinforcement.fromScenario = 0, 0, 0, 0, 0, 0

	-- Bonus from scenario
	local handicap = GetHandicapForRED(player)
	if SCENARIO_MATERIEL_PER_TURN then -- and not player:IsMinorCiv() <- if we allow CS to receive this bonus, this will also raise the bonuses from CS given to the player, may need rebalance 
		materielReinforcement.fromScenario = Round(SCENARIO_MATERIEL_PER_TURN / ((handicap + 2 ) /2) )
	end

	for city in player:Cities() do
		-- to do : link with city production

		local cityMateriel = GetCityMateriel(city)
		materielReinforcement.fromGlobal	= materielReinforcement.fromGlobal + cityMateriel.fromProdYield
		materielReinforcement.fromFactory	= materielReinforcement.fromFactory + cityMateriel.fromFactory	
		materielReinforcement.fromHarbor	= materielReinforcement.fromHarbor + cityMateriel.fromHarbor
		materielReinforcement.fromWarBonds	= materielReinforcement.fromWarBonds + cityMateriel.fromWarBonds

	end
	
	-- apply minor help
	if not player:IsMinorCiv() and not player:IsBarbarian() then
		for i = GameDefines.MAX_MAJOR_CIVS, GameDefines.MAX_CIV_PLAYERS - 1 do
			local minor = Players[i]
			if minor:IsAlive() then
				local favorite = minor:GetMinorCivFavoriteMajor()
				local friendship = minor:GetMinorCivFriendshipWithMajor(playerID)
				if friendship > 30 and resourceData[i] then
					local flux = tonumber(resourceData[i].FluxMateriel) or 0
					local materiel = tonumber(resourceData[i].Materiel) or 0
					local level = minor:GetMinorCivFriendshipLevelWithMajor(favorite)
					local ratio, bonus = 0, 0
					if level == 2 then ratio = 50; end -- Allied
					if level == 1 then ratio = 20; end -- Friend
					if flux > materiel then
						bonus = math.ceil(materiel*ratio/100)
					else
						bonus = math.ceil(flux*ratio/100)
					end
					materielReinforcement.fromMinor = materielReinforcement.fromMinor + bonus
				end
			end
		end
	end
	
	materielReinforcement.total = materielReinforcement.fromGlobal + materielReinforcement.fromFactory + materielReinforcement.fromHarbor + materielReinforcement.fromWarBonds + materielReinforcement.fromMinor + materielReinforcement.fromScenario

	return materielReinforcement
end

function GetMaxMateriel (playerID)
	local player = Players[playerID]
	local max = 0
	for city in player:Cities() do
		max = max  + GetCityMaxMateriel (city)
	end
	-- Bonus from scenario
	if SCENARIO_MAX_MATERIEL_BONUS then
		max = max + SCENARIO_MAX_MATERIEL_BONUS
	end
	return max
end


function GetCityMaxMateriel (city)
	-- 10 / city
	local max =  10

	if city:IsHasBuilding(FACTORY) then max = max + 50; end
	if city:IsHasBuilding(LAND_FACTORY) then max = max + 50; end
	if city:IsHasBuilding(HARBOR) then max = max + 50; end
	if city:IsHasBuilding(BASE) then max = max + 1000; end
	if city:IsHasBuilding(ARSENAL) then max = max + 500; end
	if city:IsHasBuilding(SMALL_AIR_FACTORY) then max = max + 20; end
	if city:IsHasBuilding(MEDIUM_AIR_FACTORY) then max = max + 20; end
	if city:IsHasBuilding(LARGE_AIR_FACTORY) then max = max + 20; end
	if city:IsHasBuilding(SHIPYARD) then max = max + 50; end

	return max
end


--------------------------------------------------------------
-- Oil 
--------------------------------------------------------------

function GetOilProcurement (playerID, bNoUpdate)

	local resourceData = MapModData.RED.ResourceData

	local player = Players[playerID]
	local oilProcurement = {}

	oilProcurement.fromGlobal, oilProcurement.fromScenario, oilProcurement.fromMap, oilProcurement.fromBuildings = 0, 0, 0, 0
	oilProcurement.detail = {}

	-- Bonus from scenario
	local handicap = GetHandicapForRED(player)
	if SCENARIO_OIL_PER_TURN and not player:IsMinorCiv() then
		oilProcurement.fromScenario = Round(SCENARIO_OIL_PER_TURN / ((handicap + 2 ) /2) )
	end

	if bNoUpdate then
		oilProcurement.fromMap = resourceData[playerID].OilFromMap
	else
		oilProcurement.fromMap = GetNumResourceTypeForPlayer(RESOURCE_OIL, playerID) -- OilNationDetail is not saved, just cached & shared for toppanel
	end

	for city in player:Cities() do
		if city:IsHasBuilding(SYNTHETIC_FUEL_PLANT) then oilProcurement.fromBuildings	= oilProcurement.fromBuildings + 25; end
	end	
	
	oilProcurement.total = oilProcurement.fromGlobal + oilProcurement.fromScenario + oilProcurement.fromMap + oilProcurement.fromBuildings

	return oilProcurement
end

function GetMaxOil (playerID)
	local player = Players[playerID]
	local max = 0
	for city in player:Cities() do
		max = max + GetCityMaxOil (city)
	end
	-- Bonus from scenario
	if SCENARIO_MAX_OIL_BONUS then
		max = max + SCENARIO_MAX_OIL_BONUS
	end
	return max
end

function GetCityMaxOil (city)
	-- 25 * city size
	local max = 25 * city:GetPopulation() 
	if city:IsHasBuilding(OIL_REFINERY) then max = max + 1000; end
	return max
end


--------------------------------------------------------------
-- Resources assignement 
--------------------------------------------------------------

function GetNeededResourceForUnits(playerID, bOnlySupplied)

	local player = Players[playerID]
	if not player then
		return
	end

	local neededResource = {}
	neededResource.totalMat = 0
	neededResource.totalPers = 0
	neededResource.nextTurnMat = 0
	neededResource.nextTurnPers = 0
	neededResource.nextTurnOil = 0

	for unit in player:Units() do
		-- Count only unit that have a supply line for reinforcement...
		if (not bOnlySupplied) or CanGetReinforcement(unit) then
			local reqMateriel, reqPersonnel = RequestedReinforcementsPerHP(unit:GetUnitType(), unit)
			local damage = unit:GetDamage()
			local addedMat = reqMateriel * damage
			local addedPers = reqPersonnel * damage
			neededResource.totalMat		= neededResource.totalMat + addedMat
			neededResource.totalPers	= neededResource.totalPers + addedPers
			if damage > MAX_HP_HEALED then -- we can't heal more than MAX_HP_HEALED each turn...			
				neededResource.nextTurnMat	= neededResource.nextTurnMat + (reqMateriel * MAX_HP_HEALED)
				neededResource.nextTurnPers	= neededResource.nextTurnPers + (reqPersonnel * MAX_HP_HEALED)
			else
				neededResource.nextTurnMat	= neededResource.nextTurnMat + addedMat
				neededResource.nextTurnPers	= neededResource.nextTurnPers + addedPers
			end
		end
		-- ... But Fuel Consumption is global.
		neededResource.nextTurnOil = neededResource.nextTurnOil + GameInfo.Units[unit:GetUnitType()].FuelConsumption
	end
	return neededResource
end

function GetUnitsFuelConsumption(playerID)
	local consumption = 0
	local player = Players[playerID]
	if not player then
		return
	end

	for unit in player:Units() do
		consumption = consumption + GameInfo.Units[unit:GetUnitType()].FuelConsumption
	end
	return consumption
end


function InitializeResourceTable()
	local resourceData = MapModData.RED.ResourceData
	local bDebug = true
	Dprint("-------------------------------------", bDebug)
	Dprint("Creating Resource data table...", bDebug)

	for playerID = 0, GameDefines.MAX_CIV_PLAYERS - 1 do

		local player = Players[playerID]
		if (player:IsAlive()) then
			
			local civID = GetCivIDFromPlayerID ( playerID )

			resourceData[playerID] = {}

			-- Personnel
			local personnelReinforcement = GetPersonnelReinforcement (playerID)
			local fluxPersonnel = personnelReinforcement.total
			local maxPersonnel = GetMaxPersonnel (playerID)
			resourceData[playerID].Personnel				= INITIAL_PERSONNEL_VALUE
			resourceData[playerID].FluxPersonnel			= fluxPersonnel
			resourceData[playerID].MaxPersonnel				= maxPersonnel		
			resourceData[playerID].ReceivedPers				= fluxPersonnel
			resourceData[playerID].PersFromGlobal			= personnelReinforcement.fromGlobal
			resourceData[playerID].PersFromHospital			= personnelReinforcement.fromHospital
			resourceData[playerID].PersFromPropaganda		= personnelReinforcement.fromPropaganda
			resourceData[playerID].PersFromRecruiting		= personnelReinforcement.fromRecruiting
			resourceData[playerID].PersFromTrait			= personnelReinforcement.fromTrait
			resourceData[playerID].PersFromNeedYou			= personnelReinforcement.fromNeedYou
			resourceData[playerID].PersFromMinor			= personnelReinforcement.fromMinor
			resourceData[playerID].PersFromScenario			= personnelReinforcement.fromScenario
			resourceData[playerID].TotalPersFromSupplyRoute = 0
			resourceData[playerID].PersFromSupplyRoute		= 0
			
			-- Materiel
			local materielReinforcement = GetMaterielReinforcement (playerID)
			local fluxMateriel = materielReinforcement.total
			local maxMateriel = GetMaxMateriel (playerID)
			resourceData[playerID].Materiel					= INITIAL_MATERIEL_VALUE
			resourceData[playerID].FluxMateriel				= fluxMateriel
			resourceData[playerID].MaxMateriel				= maxMateriel
			resourceData[playerID].ReceivedMat				= fluxMateriel
			resourceData[playerID].MatFromGlobal			= materielReinforcement.fromGlobal
			resourceData[playerID].MatFromFactory			= materielReinforcement.fromFactory
			resourceData[playerID].MatFromHarbor			= materielReinforcement.fromHarbor
			resourceData[playerID].MatFromWarBonds			= materielReinforcement.fromWarBonds
			resourceData[playerID].MatFromMinor				= materielReinforcement.fromMinor
			resourceData[playerID].MatFromScenario			= materielReinforcement.fromScenario
			resourceData[playerID].TotalMatFromSupplyRoute	= 0
			resourceData[playerID].MatFromSupplyRoute		= 0
			resourceData[playerID].TotalMatFromCityCapture	= 0
			resourceData[playerID].MatFromCityCapture		= 0

			-- Oil
			local oilProcurement = GetOilProcurement (playerID)
			local fluxOil = oilProcurement.total
			local maxOil = GetMaxOil (playerID)
			resourceData[playerID].Oil						= INITIAL_OIL_VALUE
			resourceData[playerID].FluxOil					= fluxOil
			resourceData[playerID].MaxOil					= maxOil
			resourceData[playerID].ReceivedOil				= fluxOil
			resourceData[playerID].OilFromScenario			= oilProcurement.fromScenario
			resourceData[playerID].OilFromMap				= oilProcurement.fromMap
			resourceData[playerID].OilFromBuildings			= oilProcurement.fromBuildings
			resourceData[playerID].TotalOilFromSupplyRoute	= 0
			resourceData[playerID].OilFromSupplyRoute		= 0
			resourceData[playerID].TotalOilFromCityCapture	= 0
			resourceData[playerID].OilFromCityCapture		= 0
			
			Dprint("- " .. player:GetName() .. " | +" .. fluxPersonnel .."/"..maxPersonnel.." personnel | +".. fluxMateriel .."/"..maxMateriel.." materiel | +".. fluxOil .."/"..maxOil.." oil")
						
		end
	end	
	Dprint("-------------------------------------", bDebug)
	MapModData.RED.ResourceData = resourceData
	SaveAllTable()
end

function ManageResources(playerID) 

	local bDebug = true
	local player = Players[playerID]
	if ( player:IsAlive() ) then
			
		local value = MapModData.RED.ResourceData[playerID]

		if value == nil then
			Dprint("-------------------------------------", bDebug)
			Dprint("WARNING, no resource data for "..player:GetName()..", skipping ManageResources()...", bDebug)
			return
		end

		local personnel = tonumber(value.Personnel) or 0
		local materiel = tonumber(value.Materiel) or 0
		local oil = tonumber(value.Oil) or 0

		Dprint("-------------------------------------", bDebug)
		Dprint("Receving Global Resources for "..player:GetName().."...", bDebug)

		local civID = GetCivIDFromPlayerID ( playerID )

		local personnelReinforcement = GetPersonnelReinforcement (playerID, true) -- second parameter to force updating on some values (like number of wounded left after an Hospital has healed some)
		local fluxPersonnel = personnelReinforcement.total
		local maxPersonnel = GetMaxPersonnel (playerID)

		local materielReinforcement = GetMaterielReinforcement (playerID, true)
		local fluxMateriel = materielReinforcement.total
		local maxMateriel = GetMaxMateriel (playerID)

		local oilProcurement = GetOilProcurement (playerID)
		local fluxOil = oilProcurement.total
		local maxOil = GetMaxOil (playerID)
		
		-- Supply Routes
		-- to do : include in GetPersonnelReinforcement / GetMateriellReinforcement ?
		MapModData.RED.ResourceData[playerID].TotalPersFromSupplyRoute = MapModData.RED.ResourceData[playerID].PersFromSupplyRoute
		MapModData.RED.ResourceData[playerID].PersFromSupplyRoute = 0
		MapModData.RED.ResourceData[playerID].TotalMatFromSupplyRoute = MapModData.RED.ResourceData[playerID].MatFromSupplyRoute
		MapModData.RED.ResourceData[playerID].MatFromSupplyRoute = 0
		MapModData.RED.ResourceData[playerID].TotalOilFromSupplyRoute = MapModData.RED.ResourceData[playerID].OilFromSupplyRoute
		MapModData.RED.ResourceData[playerID].OilFromSupplyRoute = 0
		fluxPersonnel = fluxPersonnel + MapModData.RED.ResourceData[playerID].TotalPersFromSupplyRoute
		fluxMateriel = fluxMateriel + MapModData.RED.ResourceData[playerID].TotalMatFromSupplyRoute
		fluxOil = fluxOil + MapModData.RED.ResourceData[playerID].TotalOilFromSupplyRoute

		-- Cities Capture		
		MapModData.RED.ResourceData[playerID].TotalMatFromCityCapture = MapModData.RED.ResourceData[playerID].MatFromCityCapture
		MapModData.RED.ResourceData[playerID].MatFromCityCapture = 0
		MapModData.RED.ResourceData[playerID].TotalOilFromCityCapture = MapModData.RED.ResourceData[playerID].OilFromCityCapture
		MapModData.RED.ResourceData[playerID].OilFromCityCapture = 0
		fluxMateriel = fluxMateriel + MapModData.RED.ResourceData[playerID].TotalMatFromCityCapture
		fluxOil = fluxOil + MapModData.RED.ResourceData[playerID].TotalOilFromCityCapture

		--
		MapModData.RED.ResourceData[playerID].Personnel = personnel + fluxPersonnel -- check for max value AFTER applying reinforcement to units
		MapModData.RED.ResourceData[playerID].Materiel	= materiel + fluxMateriel
		MapModData.RED.ResourceData[playerID].Oil		= oil + fluxOil

		MapModData.RED.ResourceData[playerID].MaxPersonnel	= maxPersonnel
		MapModData.RED.ResourceData[playerID].MaxMateriel	= maxMateriel
		MapModData.RED.ResourceData[playerID].MaxOil		= maxOil
		
		MapModData.RED.ResourceData[playerID].ReceivedPers	= fluxPersonnel	-- before reinforcements lower the flux
		MapModData.RED.ResourceData[playerID].ReceivedMat	= fluxMateriel	-- before reinforcements lower the flux
		MapModData.RED.ResourceData[playerID].ReceivedOil	= fluxOil		-- before consumption lower the flux

		MapModData.RED.ResourceData[playerID].PersFromGlobal		= personnelReinforcement.fromGlobal
		MapModData.RED.ResourceData[playerID].PersFromHospital		= personnelReinforcement.fromHospital
		MapModData.RED.ResourceData[playerID].PersFromPropaganda	= personnelReinforcement.fromPropaganda
		MapModData.RED.ResourceData[playerID].PersFromRecruiting	= personnelReinforcement.fromRecruiting
		MapModData.RED.ResourceData[playerID].PersFromTrait			= personnelReinforcement.fromTrait
		MapModData.RED.ResourceData[playerID].PersFromNeedYou		= personnelReinforcement.fromNeedYou
		MapModData.RED.ResourceData[playerID].PersFromMinor			= personnelReinforcement.fromMinor
		MapModData.RED.ResourceData[playerID].PersFromScenario		= personnelReinforcement.fromScenario

		MapModData.RED.ResourceData[playerID].MatFromGlobal		= materielReinforcement.fromGlobal
		MapModData.RED.ResourceData[playerID].MatFromFactory	= materielReinforcement.fromFactory
		MapModData.RED.ResourceData[playerID].MatFromHarbor		= materielReinforcement.fromHarbor
		MapModData.RED.ResourceData[playerID].MatFromWarBonds	= materielReinforcement.fromWarBonds
		MapModData.RED.ResourceData[playerID].MatFromMinor		= materielReinforcement.fromMinor
		MapModData.RED.ResourceData[playerID].MatFromScenario	= materielReinforcement.fromScenario
		
		MapModData.RED.ResourceData[playerID].OilFromScenario	= oilProcurement.fromScenario
		MapModData.RED.ResourceData[playerID].OilFromBuildings	= oilProcurement.fromBuildings
		MapModData.RED.ResourceData[playerID].OilFromMap		= oilProcurement.fromMap
		
		Dprint("-------------------------------------", bDebug)
		Dprint("Assigning Resources to units...", bDebug)

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
				and not (unit:IsHasPromotion(PROMOTION_NO_SUPPLY_MECHANIZED))
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
						if (reqMateriel <= MapModData.RED.ResourceData[playerID].Materiel) and (reqPersonnel <= MapModData.RED.ResourceData[playerID].Personnel) then
							Dprint("  - reinforcement pass num".. healHP .." in the [" .. n .. "hp row] : ".. unit:GetName() .. " get 1 hp from ".. reqPersonnel .." personnel and " .. reqMateriel .." materiel", bDebug)
							healTable[key] = healTable[key] + 1 -- store +1 HP for this unit
							fluxPersonnel = fluxPersonnel - reqPersonnel
							fluxMateriel = fluxMateriel - reqMateriel
							MapModData.RED.ResourceData[playerID].Materiel = MapModData.RED.ResourceData[playerID].Materiel - reqMateriel
							MapModData.RED.ResourceData[playerID].Personnel = MapModData.RED.ResourceData[playerID].Personnel - reqPersonnel
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

		-- Apply fuel consumption
		local fuelConsumption = GetUnitsFuelConsumption(playerID)

		if		IsLightRationing(playerID)	then fuelConsumption = fuelConsumption * LIGHT_RATIONING_FUEL_CONSUMPTION / 100
		elseif	IsRationing(playerID)		then fuelConsumption = fuelConsumption * MEDIUM_RATIONING_FUEL_CONSUMPTION / 100
		elseif	IsHeavyRationing(playerID)	then fuelConsumption = fuelConsumption * HEAVY_RATIONING_FUEL_CONSUMPTION / 100
		end

		local reqOil = math.min(MapModData.RED.ResourceData[playerID].Oil, fuelConsumption)
		MapModData.RED.ResourceData[playerID].Oil = MapModData.RED.ResourceData[playerID].Oil - reqOil
		fluxOil = fluxOil - reqOil

		-- round values, and check for maximum.
		MapModData.RED.ResourceData[playerID].Materiel = math.min(Round(MapModData.RED.ResourceData[playerID].Materiel), maxMateriel) 
		MapModData.RED.ResourceData[playerID].Personnel = math.min(Round(MapModData.RED.ResourceData[playerID].Personnel), maxPersonnel)
		MapModData.RED.ResourceData[playerID].Oil = math.min(Round(MapModData.RED.ResourceData[playerID].Oil), maxOil)

		MapModData.RED.ResourceData[playerID].FluxMateriel = Round(fluxMateriel)
		MapModData.RED.ResourceData[playerID].FluxPersonnel = Round(fluxPersonnel)
		MapModData.RED.ResourceData[playerID].FluxOil = Round(fluxOil)

		if RESOURCE_CONSUMPTION then
			local oilReserve = MapModData.RED.ResourceData[playerID].Oil
			if		IsNoRationing(playerID)		then RemoveRationing(playerID)
			elseif	IsLightRationing(playerID)	then ApplyLightRationing(playerID)
			elseif	IsRationing(playerID)		then ApplyRationing(playerID)
			elseif	IsHeavyRationing(playerID)	then ApplyHeavyRationing(playerID)
			end
		end

	end
end
-- add to GameEvents.PlayerDoTurn

-- will need this one ?
--Events.SerialEventUnitSetDamage.Add( OnChangeEvent )


function InitializeResourceMap() 
	Dprint("-------------------------------------")
	Dprint("Initializing resource map ...")		
	local t1 = os.clock()
	for iPlotLoop = 0, Map.GetNumPlots()-1, 1 do
		local plot = Map.GetPlotByIndex(iPlotLoop)
		local x = plot:GetX()
		local y = plot:GetY()
		local ownerID = plot:GetOwner()
		local plotKey = GetPlotKey ( plot )

		if plot:GetResourceType(-1) ~= -1 then -- there is a resource here
			MapModData.RED.ResourceMap[plotKey] = { Type = plot:GetResourceType(-1), Num = plot:GetNumResource()  }
		end
	end
	local t2 = os.clock()
	Dprint("  - Total time to initialize resource map :		" .. t2 - t1 .. " s")
	Dprint("-------------------------------------")
end

function GetNumResourceTypeForPlayer(resourceID, playerID)

	if not RESOURCE_CONSUMPTION then
		return 0
	end

	Dprint("-------------------------------------")
	Dprint("Getting Number of resource type ID=".. tostring(resourceID) .." available for player ID=" .. tostring(playerID))
	local numResource = 0
	local procurementDetail = {}
	for plotKey, data in pairs(MapModData.RED.ResourceMap) do
		if MapModData.RED.ResourceMap[plotKey].Type == resourceID then
			local plot = GetPlotFromKey ( plotKey )
			if plot:IsImprovementPillaged() then
				-- we can't get resource from a pillaged plot...
				-- to do: check for the resource corresponding improvement too ? I don't plan to make scenario where we search for resource and improve land, but...
				Dprint("- Improvement pillaged at " .. plotKey)
				break
			end
			local ownerID = plot:GetOwner()

			if not RESOURCE_FROM_FRIENDS and ownerID ~= playerID then
				-- Don't check for relation if we already know that resources are not shared
				Dprint("- Can't access resource at " .. plotKey .. " (not in player territory and no access to friend resources from scenario setting)")
				break
			else
				local bOnFriendlyTerritory = (ownerID == playerID)
				if not bOnFriendlyTerritory then
					if AreSameSide( ownerID, playerID) then
						bOnFriendlyTerritory = true
					end
				end
				
				if bOnFriendlyTerritory then
					Dprint("- Resource is on friendly territory at " .. plotKey .. " check for possible route")

					local bCanGetRessource = false

					if RESOURCE_CONNECTION == RESOURCE_OWNED_PLOTS then
						Dprint("   - No connection required from scenario settings...")
						-- that's the simpliest case !
						bCanGetRessource = true

					elseif	RESOURCE_CONNECTION == RESOURCE_ROAD_TO_CAPITAL then
						-- check road connection between the resource plot and the capital...
						Dprint("   - Looking for route to capital...")
						local player = Players[playerID]
						local capital = player:GetCapitalCity()
						if capital then
							bCanGetRessource = isPlotConnected( player , plot, capital:Plot(), "Road", false, nil , NoResourcePath)
						end

					elseif	RESOURCE_CONNECTION == RESOURCE_RAILS_TO_CAPITAL then
						-- check rails connection between the resource plot and the capital...
						Dprint("   - Looking for rails to capital...")
						local player = Players[playerID]
						local capital = player:GetCapitalCity()
						if capital then
							bCanGetRessource = isPlotConnected( player , plot, capital:Plot(), "Railroad", false, nil , NoResourcePath)
						end

					elseif	RESOURCE_CONNECTION == RESOURCE_ROAD_TO_ANY_CITY then
						-- check road connection between the resource plot and any city...
						Dprint("   - Looking for route to any city...")
						local player = Players[playerID]
						-- first check closest own cities
						local closeCity = GetCloseCity ( playerID, plot )
						if closeCity then
							local cityPlot = closeCity:Plot()
							-- first check the area, no need to calculate land path if not in the same land... 
							bCanGetRessource = ( cityPlot:GetArea() == plot:GetArea() and isPlotConnected( player , plot, cityPlot, "Road", false, nil , NoResourcePath) ) 
						end	
						-- then all own cities
						if not bCanGetRessource then
							for city in player:Cities() do
								local cityPlot = city:Plot()
								if ( city ~= closeCity and cityPlot:GetArea() == plot:GetArea() and isPlotConnected( player , plot, cityPlot, "Road", false, nil , NoResourcePath) ) then
									bCanGetRessource = true
									break
								end	
							end
						end

					elseif	RESOURCE_CONNECTION == RESOURCE_RAILS_TO_ANY_CITY then
						-- check rails connection between the resource plot and any city...
						Dprint("   - Looking for rails to any city...")
						local player = Players[playerID]
						-- first check closest own cities
						local closeCity = GetCloseCity ( playerID, plot )
						if closeCity then
							local cityPlot = closeCity:Plot()
							-- first check the area, no need to calculate land path if not in the same land... 
							bCanGetRessource = ( cityPlot:GetArea() == plot:GetArea() and isPlotConnected( player , plot, cityPlot, "Railroad", false, nil , NoResourcePath) ) 
						end	
						-- then all own cities
						if not bCanGetRessource then
							for city in player:Cities() do
								local cityPlot = city:Plot()
								if ( city ~= closeCity and cityPlot:GetArea() == plot:GetArea() and isPlotConnected( player , plot, cityPlot, "Railroad", false, nil , NoResourcePath) ) then
									bCanGetRessource = true
									break
								end	
							end
						end
					end
				
					if bCanGetRessource then
						Dprint("   - Resource is connected, added to pool...")
						local numAdded = MapModData.RED.ResourceMap[plotKey].Num * RESOURCE_PRODUCTION_FACTOR
						numResource = numResource + numAdded
						local source = Players[ownerID]:GetCivilizationShortDescription()
						if procurementDetail[source] then
							procurementDetail[source]= procurementDetail[source] + numAdded
						else
							procurementDetail[source]= numAdded
						end
					end

				end				
			end
		end
	end
	Dprint("-------------------------------------")

	if resourceID == RESOURCE_OIL then MapModData.RED.OilNationDetail[playerID] = procurementDetail; end -- shared for toppanel.lua

	return numResource	
end

function IsNoRationing(playerID)
	return (MapModData.RED.ResourceData[playerID].Oil >= RESOURCE_OIL_LIGHT_RATIONING)
end
function IsLightRationing(playerID)
	return (MapModData.RED.ResourceData[playerID].Oil < RESOURCE_OIL_LIGHT_RATIONING and MapModData.RED.ResourceData[playerID].Oil >= RESOURCE_OIL_RATIONING)
end
function IsRationing(playerID)
	return (MapModData.RED.ResourceData[playerID].Oil < RESOURCE_OIL_RATIONING and MapModData.RED.ResourceData[playerID].Oil >= RESOURCE_OIL_HEAVY_RATIONING)
end
function IsHeavyRationing(playerID)
	return (MapModData.RED.ResourceData[playerID].Oil < RESOURCE_OIL_HEAVY_RATIONING)
end

function RemoveRationing(playerID)
	local player = Players[playerID]
	for unit in player:Units() do
		local unitType = unit:GetUnitType()
		if UseFuel(unitType) then
			if (unit:IsHasPromotion(PROMOTION_LIGHT_RATIONING)) then unit:SetHasPromotion(PROMOTION_LIGHT_RATIONING,	false) end
			if (unit:IsHasPromotion(PROMOTION_RATIONING))		then unit:SetHasPromotion(PROMOTION_RATIONING,			false) end
			if (unit:IsHasPromotion(PROMOTION_HEAVY_RATIONING)) then unit:SetHasPromotion(PROMOTION_HEAVY_RATIONING,	false) end
		end
	end
end

function ApplyLightRationing(playerID)
	local player = Players[playerID]
	for unit in player:Units() do
		local unitType = unit:GetUnitType()
		if UseFuel(unitType) then
			if (not unit:IsHasPromotion(PROMOTION_LIGHT_RATIONING)) then unit:SetHasPromotion(PROMOTION_LIGHT_RATIONING,	true)	end
			if (unit:IsHasPromotion(PROMOTION_RATIONING))			then unit:SetHasPromotion(PROMOTION_RATIONING,			false)	end
			if (unit:IsHasPromotion(PROMOTION_HEAVY_RATIONING))		then unit:SetHasPromotion(PROMOTION_HEAVY_RATIONING,	false)	end
		end
	end
end

function ApplyRationing(playerID)
	local player = Players[playerID]
	for unit in player:Units() do
		local unitType = unit:GetUnitType()
		if UseFuel(unitType) then
			if (unit:IsHasPromotion(PROMOTION_LIGHT_RATIONING)) then unit:SetHasPromotion(PROMOTION_LIGHT_RATIONING,	false)	end
			if (not unit:IsHasPromotion(PROMOTION_RATIONING))	then unit:SetHasPromotion(PROMOTION_RATIONING,			true)	end
			if (unit:IsHasPromotion(PROMOTION_HEAVY_RATIONING))	then unit:SetHasPromotion(PROMOTION_HEAVY_RATIONING,	false)	end
		end
	end
end

function ApplyHeavyRationing(playerID)
	local player = Players[playerID]
	for unit in player:Units() do
		local unitType = unit:GetUnitType()
		if UseFuel(unitType) then
			if (unit:IsHasPromotion(PROMOTION_LIGHT_RATIONING))		then unit:SetHasPromotion(PROMOTION_LIGHT_RATIONING,	false)	end
			if (unit:IsHasPromotion(PROMOTION_RATIONING))			then unit:SetHasPromotion(PROMOTION_RATIONING,			false)	end
			if (not unit:IsHasPromotion(PROMOTION_HEAVY_RATIONING))	then unit:SetHasPromotion(PROMOTION_HEAVY_RATIONING,	true)	end
		end
	end
end

-- Check if a plot block a path to a resources deposit for a player in function isPlotConnected
function NoResourcePath(pPlot, pPlayer)
	if ( pPlot == nil or pPlayer == nil) then
		Dprint ("WARNING : NoResourcePath() called with a nil argument")
		return true
	end

	local ownerID = pPlot:GetOwner()
	local playerID = pPlayer:GetID()

	if  AreSameSide(ownerID, playerID) then
		return false -- path is not bloked
	end

	return true -- return true if the path is blocked...
end

function IsNearMaterielShortage(iPlayer)
	return (MapModData.RED.ResourceData[iPlayer].Materiel + (MapModData.RED.ResourceData[iPlayer].FluxMateriel * AI_TURNS_BEFORE_SHORTAGE) <= 0)
end

function IsMaterielShortage(iPlayer)
	return (MapModData.RED.ResourceData[iPlayer].Materiel + MapModData.RED.ResourceData[iPlayer].FluxMateriel <= 0)
end

function IsNearPersonnelShortage(iPlayer)
	return (MapModData.RED.ResourceData[iPlayer].Personnel + (MapModData.RED.ResourceData[iPlayer].FluxPersonnel * AI_TURNS_BEFORE_SHORTAGE) <= 0)
end

function IsPersonnelShortage(iPlayer)
	return (MapModData.RED.ResourceData[iPlayer].Personnel + MapModData.RED.ResourceData[iPlayer].FluxPersonnel <= 0)
end

function IsNearOilShortage(iPlayer)
	return (MapModData.RED.ResourceData[iPlayer].Oil + (MapModData.RED.ResourceData[iPlayer].FluxOil * AI_TURNS_BEFORE_SHORTAGE) <= 0)
end

function IsOilShortage(iPlayer)
	return (MapModData.RED.ResourceData[iPlayer].Oil + MapModData.RED.ResourceData[iPlayer].FluxOil <= 0)
end

-- Update required tooltips when this file is loaded...
LuaEvents.WWIITest()