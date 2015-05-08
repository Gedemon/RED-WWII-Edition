-- ScriptEuro1940
-- Author: Gedemon
-- DateCreated: 8/23/2011 10:36:46 PM
--------------------------------------------------------------

print("Loading Red Europe 1940 Scripts...")
print("-------------------------------------")


-----------------------------------------
-- Functions override
-----------------------------------------

function AreSameSide( player1ID, player2ID)

	local bDebug = false

	if player1ID == player2ID then -- obvious but useful !
		return true
	end
	local player = Players[ player1ID ]
	local player2 = Players[ player2ID ]

	if not player then
		return false
	end
	if not player2 then
		return false
	end

	Dprint ("testing same side for : " .. player:GetName() .." and " .. player2:GetName(), bDebug )
	local team = Teams[ player:GetTeam() ]
	local team2 = Teams[ player2:GetTeam() ]

	local civ1ID = GetCivIDFromPlayerID (player1ID)
	local civ2ID = GetCivIDFromPlayerID (player2ID)

	if not player:IsMinorCiv() and not player2:IsMinorCiv() then	
		Dprint ("Both are major...", bDebug )

		-- to simulate non agression pact and resource sharing before Barbarossa...
		if ( civ1ID == GERMANY and civ2ID == USSR ) then 
			if not team:IsAtWar( player2:GetTeam() ) then
				return true
			end
		end
		if ( civ1ID ==  USSR and civ2ID == GERMANY) then
			if not team:IsAtWar( player2:GetTeam() ) then
				return true
			end
		end
		----

		if ( g_Allied[civ1ID] and g_Allied[civ2ID] ) then
			if not team:IsAtWar( player2:GetTeam() ) then
				return true
			end
		end
		if ( g_Axis[civ1ID] and g_Axis[civ2ID] ) then
			if not team:IsAtWar( player2:GetTeam() ) then
				return true
			end
		end
	end
	if player:IsMinorCiv() then
		Dprint ("first is minor...", bDebug )
		if player:IsFriends(player2ID) or player:IsAllies(player2ID) then
			return true
		end
	end
	if player2:IsMinorCiv() then
		Dprint ("second is minor...", bDebug )
		if player2:IsFriends(player1ID) or player2:IsAllies(player1ID) then
			return true
		end
	end
	Dprint ("No positive result...", bDebug )
	Dprint ("---------------------", bDebug )

	return false
end

-----------------------------------------
-- Strategic AI
-----------------------------------------

g_Norway_Land_Ratio = 1
g_Egypt_Land_Ratio = 1
g_Libya_Land_Ratio = 1
g_Albania_Land_Ratio = 1
g_NAfrica_Land_Ratio = 1
g_France_Land_Ratio = 1
g_USSR_Land_Ratio = 1

function SetAIStrategicValues()

	local bDebug = true
	
	Dprint ("-------------------------------------", bDebug)
	Dprint ("Setting Strategic value for AI...", bDebug)

	local initialNorway, initialEgypt, initialLibya, initialNAfrica, initialAlbania = 0, 0, 0, 0, 0
	local actualNorway, actualEgypt, actualLibya, actualNAfrica, actualAlbania = 0, 0, 0, 0, 0

	local iNorway = GetPlayerIDFromCivID (NORWAY, true, true)
	local iEgypt = GetPlayerIDFromCivID (EGYPT, true, true)
	local iLibya = GetPlayerIDFromCivID (LIBYA, true, true)
	local iAlgeria = GetPlayerIDFromCivID (ALGERIA, true, true)
	local iTunisia = GetPlayerIDFromCivID (TUNISIA, true, true)
	local iMorocco = GetPlayerIDFromCivID (MOROCCO, true, true)
	local iAlbania = GetPlayerIDFromCivID (ALBANIA, true, true)

	
	local initialFrance = 0
	local actualFrance = 0
	local initialUSSR = 0
	local actualUSSR = 0

	local iFrance = GetPlayerIDFromCivID (FRANCE, false, true)
	local iUSSR = GetPlayerIDFromCivID (USSR, false, true)

	local territoryMap = LoadTerritoryMap()

	for i, data in pairs (territoryMap) do
		local originalOwner = data.PlayerID
		if originalOwner == iNorway then
			initialNorway = initialNorway + 1

		elseif originalOwner == iEgypt then
			initialEgypt = initialEgypt + 1

		elseif originalOwner == iLibya then
			initialLibya = initialLibya + 1		

		elseif originalOwner == iAlgeria or originalOwner == iTunisia or originalOwner == iMorocco then
			initialNAfrica = initialNAfrica + 1

		elseif originalOwner == iAlbania then
			initialAlbania = initialAlbania + 1
			
		elseif originalOwner == iFrance then
			initialFrance = initialFrance + 1
			
		elseif originalOwner == iUSSR then
			initialUSSR = initialUSSR + 1
		end
	end

	for iPlotLoop = 0, Map.GetNumPlots()-1, 1 do
		local plot = Map.GetPlotByIndex(iPlotLoop)
		local owner = plot:GetOwner()

		if owner == iNorway then
			actualNorway = actualNorway + 1

		elseif owner == iEgypt then
			actualEgypt = actualEgypt + 1

		elseif owner == iLibya then
			actualLibya = actualLibya + 1		

		elseif owner == iAlgeria or owner == iTunisia or owner == iMorocco then
			actualNAfrica = actualNAfrica + 1

		elseif owner == iAlbania then
			actualAlbania = actualAlbania + 1	

		elseif owner == iFrance then
			actualFrance = actualFrance + 1
			
		elseif owner == iUSSR then
			actualUSSR = actualUSSR + 1
		end
	end
	g_Norway_Land_Ratio = actualNorway / initialNorway
	g_Egypt_Land_Ratio = actualEgypt / initialEgypt
	g_Libya_Land_Ratio = actualLibya / initialLibya
	g_NAfrica_Land_Ratio = actualNAfrica / initialNAfrica
	g_Albania_Land_Ratio = actualAlbania / initialAlbania

	g_France_Land_Ratio = actualFrance / initialFrance
	g_USSR_Land_Ratio = actualUSSR / initialUSSR
end

-----------------------------------------
-- France
-----------------------------------------

-- to do : 
-- liberation of Paris -> liberate vichy France if still existing
-- annexation of Vichy France -> when Morocco, Algeria or Tunisia is liberated by allies (then maybe giving vichy units to axis or France ?)

function FranceHasFallen()
	local savedData = Modding.OpenSaveData()
	local iValue = savedData.GetValue("FranceHasFallen")
	if (iValue == 1) then
		return true
	else
		return false
	end
end

function IsFranceStanding()
	if FranceHasFallen() then
		return false
	else
		return true
	end
end

g_CapturingPlayer = nil

function FallOfFrance(hexPos, playerID, cityID, newPlayerID)
	local bDebug = true	

	if  not ALLOW_SCRIPTED_EVENTS then
		return
	end

	local turn = Game.GetGameTurn()
	local turnDate = REAL_WORLD_ENDING_DATE  
	if g_Calendar[turn] then 
		if g_Calendar[turn].Number > MAX_FALL_OF_FRANCE_DATE then -- Fall of france has a date of peremption...
			return 
		end
	end 
	
	local iGermany = GetPlayerIDFromCivID (GERMANY, false, true)
	local iUSSR = GetPlayerIDFromCivID (USSR, false, true)

	if AreAtWar( iGermany, iUSSR) then -- There is hope in the East !
		return
	end

	local cityPlot = Map.GetPlot( ToGridFromHex( hexPos.x, hexPos.y ) )
	
	local x, y = ToGridFromHex( hexPos.x, hexPos.y )
	local civID = GetCivIDFromPlayerID(newPlayerID, false)
	g_CapturingPlayer = Players[newPlayerID]
	if x == 28 and y == 45 then -- city of Paris
	
		Dprint ("-------------------------------------")
		Dprint ("Scripted Event : Paris Captured !")
		if (civID == GERMANY or civID == ITALY) then -- captured by Germany or Italy...
			local pParis = cityPlot:GetPlotCity()
			Dprint("- Captured by Axis power ...")
			local savedData = Modding.OpenSaveData()
			local iValue = savedData.GetValue("FranceHasFallen")
			if (iValue ~= 1) then
				Dprint("- First occurence, launching script ...")

				StartCoroutine( CoCallOfFrance )

			end
		end
	end
end
-- add to Events.SerialEventCityCaptured in main scenario Lua

function CoCallOfFrance()
	
	-- todo: learn how to pass those to the coroutine...
	local savedData = Modding.OpenSaveData()
	local cityPlot = GetPlot (28,45)
	local pParis = cityPlot:GetPlotCity()
	local pAxis = g_CapturingPlayer
	g_CapturingPlayer = nil
	----

	local iVichy = GetPlayerIDFromCivID (VICHY, true, true)
	local pVichy = Players[iVichy]

	local iAlgeria = GetPlayerIDFromCivID (ALGERIA, true, true)
	local pAlgeria = Players[iAlgeria]
	local iMorocco = GetPlayerIDFromCivID (MOROCCO, true, true)
	local pMorocco = Players[iMorocco]
	local iSyria = GetPlayerIDFromCivID (SYRIA, true, true)
	local pSyria = Players[iSyria]
	local iTunisia = GetPlayerIDFromCivID (TUNISIA, true, true)
	local pTunisia = Players[iTunisia]
	local iLebanon = GetPlayerIDFromCivID (LEBANON, true, true)
	local pLebanon = Players[iLebanon]

	local iItaly = GetPlayerIDFromCivID (ITALY, false, true)
	local pItaly = Players[iItaly]

	local iGermany = GetPlayerIDFromCivID (GERMANY, false, true)
	local pGermany = Players[iGermany]
				
	local iFrance = GetPlayerIDFromCivID (FRANCE, false, true)
	local pFrance = Players[iFrance]

	local iEngland = GetPlayerIDFromCivID (ENGLAND, false, true)
	local pEngland = Players[iEngland]

	-- save processor time, only get one city by nation (capital or closest from Paris) and send all units there				
	local EnglandCity = pEngland:GetCapitalCity()
	if not EnglandCity then
		EnglandCity = GetCloseCity ( iEngland, cityPlot , true)
	end
	local iEnglandCityX = EnglandCity:GetX()
	local iEnglandCityY = EnglandCity:GetY()

	local AlgeriaCity = Players[iAlgeria]:GetCapitalCity()
	if not AlgeriaCity then
		AlgeriaCity = GetCloseCity ( iAlgeria, cityPlot , true)
	end
	local iAlgeriaCityX = AlgeriaCity:GetX()
	local iAlgeriaCityY = AlgeriaCity:GetY()

	local TunisiaCity = Players[iTunisia]:GetCapitalCity()
	if not TunisiaCity then
		TunisiaCity = GetCloseCity ( iTunisia, cityPlot , true)
	end
	local iTunisiaCityX = TunisiaCity:GetX()
	local iTunisiaCityY = TunisiaCity:GetY()

	local MoroccoCity = Players[iMorocco]:GetCapitalCity()
	if not MoroccoCity then
		MoroccoCity = GetCloseCity ( iMorocco, cityPlot , true)
	end
	local iMoroccoCityX = MoroccoCity:GetX()
	local iMoroccoCityY = MoroccoCity:GetY()

	local SyriaCity	= Players[iSyria]:GetCapitalCity()
	if not SyriaCity then
		SyriaCity = GetCloseCity ( iSyria, cityPlot , true)
	end				
	local iSyriaCityX = SyriaCity:GetX()
	local iSyriaCityY = SyriaCity:GetY()

	local LebanonCity = Players[iLebanon]:GetCapitalCity()
	if not LebanonCity then
		LebanonCity = GetCloseCity ( iLebanon, cityPlot , true)
	end
	local iLebanonCityX = LebanonCity:GetX()
	local iLebanonCityY = LebanonCity:GetY()
				
	Dprint("- Each U.K. unit on french territory get 50% chance to go back to London (or die trying)", bDebug)
	for unit in pEngland:Units() do 
		if unit:GetPlot():GetOwner() == iFrance then
			if math.random( 1, 100 ) > 50 or unit:GetDomainType() == DomainTypes.DOMAIN_SEA then
				Dprint("  Killed : " .. unit:GetName(), bDebug)
				unit:Kill(false, -1)
			else
				Dprint("  Escape : " .. unit:GetName(), bDebug)
				CleanOrdersRED (unit)
				unit:SetXY(iEnglandCityX, iEnglandCityY)
			end
		end
	end

	--Pause(1)
	coroutine.yield()

	Dprint("- Change french units ownership ...", bDebug)
	local palmyraPlot = GetPlot (84,12)
	local palmyra = palmyraPlot:GetPlotCity()
	if palmyra:GetOwner() ~= iFrance then -- give back Palmyra to France
		EscapeUnitsFromPlot(palmyraPlot)
		Players[iFrance]:AcquireCity(palmyra, false, true)
		Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes.NOTIFICATION_DIPLOMACY_DECLARATION, palmyra:GetName() .. " has revolted and is joigning Free France.", palmyra:GetName() .. " has revolted !", -1, -1)
	end
				
	local Air = {}
	local Sea = {}
	local Land = {}
	-- fill table (remove convoy and fortifications)
	for unit in pFrance:Units() do 
		--local newUnit = ChangeUnitOwner (unit, iVichy)
		if (unit:GetUnitType() == CONVOY or unit:GetUnitType() == FORTIFIED_GUN) then
			Dprint(" - Killing " .. unit:GetName(), bDebug)
			unit:Kill(false, -1)
		elseif not unit:IsDead() then
			if unit:GetDomainType() == DomainTypes.DOMAIN_AIR then
				table.insert(Air, { Unit = unit, XP = unit:GetExperience() })
			elseif unit:GetDomainType() == DomainTypes.DOMAIN_SEA then
				table.insert(Sea, { Unit = unit, XP = unit:GetExperience() })
			else
				table.insert(Land, { Unit = unit, XP = unit:GetExperience() })
			end
		end
	end
	table.sort(Air, function(a,b) return a.XP < b.XP end)
	table.sort(Sea, function(a,b) return a.XP < b.XP end)
	table.sort(Land, function(a,b) return a.XP < b.XP end)

	-- Air Units
	Dprint("   - Air units ...", bDebug)
	local countUnit = 0
	for i, data in ipairs(Air) do
		countUnit = countUnit + 1					
		Dprint("     - " .. data.Unit:GetName(), bDebug )
		if data.Unit:IsFighting() then
			Dprint("       - Is Fighting, can't be transfered, leave alone...", bDebug )
						
		elseif data.Unit:IsDead() then
			Dprint("       - Is Dead, can't be transfered, leave alone...", bDebug )

		elseif countUnit > 10 then -- military restriction
			Dprint("       - Can't have more than 10 units, disbanded...", bDebug )
			data.Unit:Kill(false, -1)

		elseif i == 1 then -- save the best for the player
			data.Unit:SetXY(84,12) -- PALMYRA
		else
			local rand = math.random( 1, 100 )
			CleanOrdersRED (data.Unit)					
			if rand <= 5 and EnglandCity then -- 5% chance to flew to England							
				Dprint("       - goes to England ", bDebug )
				data.Unit:SetXY(iEnglandCityX, iEnglandCityY)
				local newUnit = ChangeUnitOwner (data.Unit, iEngland)
			elseif rand <= 30 and AlgeriaCity then -- 25% to Algeria
				Dprint("       - goes to Algeria ", bDebug )
				data.Unit:SetXY(iAlgeriaCityX, iAlgeriaCityY)
				local newUnit = ChangeUnitOwner (data.Unit, iAlgeria)
			elseif rand <= 50 and TunisiaCity then -- 20% to Tunisia
				Dprint("       - goes to Tunisia ", bDebug )
				data.Unit:SetXY(iTunisiaCityX, iTunisiaCityY)
				local newUnit = ChangeUnitOwner (data.Unit, iTunisia)
			elseif rand <= 70 and MoroccoCity then -- 20% to Morocco
				Dprint("       - goes to Morocco ", bDebug )
				data.Unit:SetXY(iMoroccoCityX, iMoroccoCityY)
				local newUnit = ChangeUnitOwner (data.Unit, iMorocco)
			elseif rand <= 95 and SyriaCity then -- 25% to Syria
				Dprint("       - goes to Syria ", bDebug )
				data.Unit:SetXY(iSyriaCityX, iSyriaCityY)
				local newUnit = ChangeUnitOwner (data.Unit, iSyria)
			elseif LebanonCity then -- 5% to Lebanon
				Dprint("       - goes to Lebanon ", bDebug )
				data.Unit:SetXY(iLebanonCityX, iLebanonCityY)
				local newUnit = ChangeUnitOwner (data.Unit, iLebanon)
			end
		end
					
		Dprint("      - done for " .. data.Unit:GetName(), bDebug )
	end
				
	--Pause(1)
	coroutine.yield()
				
	-- Land Units
	Dprint("   - Land units ...", bDebug)
	countUnit = 0 -- reset counter
	for i, data in ipairs(Land) do
		countUnit = countUnit + 1					
		Dprint("     - " .. data.Unit:GetName(), bDebug )
		if data.Unit:IsFighting() then
			Dprint("       - Is Fighting, can't be transfered, leave alone...", bDebug )
						
		elseif data.Unit:IsDead() then
			Dprint("       - Is Dead, can't be transfered, leave alone...", bDebug )

		elseif countUnit > 10 then -- military restriction
			Dprint("       - Can't have more than 10 units, disbanded...", bDebug )
			data.Unit:Kill(false, -1)

		elseif i == 1 then -- save the best for the player
			data.Unit:SetXY(84,12) -- PALMYRA
		elseif data.Unit:GetUnitType() == FR_LEGION then -- Special treatment for Legion
			local rand = math.random( 1, 100 )
			CleanOrdersRED (data.Unit)
			if rand <= 25 then
				Dprint("       - goes to Algeria ", bDebug )
				local newUnit = ChangeUnitOwner (data.Unit, iAlgeria)
				newUnit:SetXY(iAlgeriaCityX, iAlgeriaCityY)
			elseif rand <= 50 then
				Dprint("       - goes to Syria ", bDebug )
				local newUnit = ChangeUnitOwner (data.Unit, iSyria)
				newUnit:SetXY(iSyriaCityX, iSyriaCityY)
			else
				data.Unit:SetXY(84,12) -- PALMYRA
			end
		else
			local rand = math.random( 1, 100 )
					
			if rand <= 5 and EnglandCity then -- 5% chance to flew to England
				Dprint("       - goes to England ", bDebug )
				local newUnit = ChangeUnitOwner (data.Unit, iEngland)
				Dprint("       - owner changed ", bDebug )
				newUnit:SetXY(iEnglandCityX, iEnglandCityY)
				Dprint("       - teleportation done ", bDebug )
			elseif rand <= 30 and AlgeriaCity then -- 25% to Algeria
				Dprint("       - goes to Algeria ", bDebug )
				local newUnit = ChangeUnitOwner (data.Unit, iAlgeria)
				newUnit:SetXY(iAlgeriaCityX, iAlgeriaCityY)
			elseif rand <= 50 and TunisiaCity then -- 20% to Tunisia
				Dprint("       - goes to Tunisia ", bDebug )
				local newUnit = ChangeUnitOwner (data.Unit, iTunisia)
				newUnit:SetXY(iTunisiaCityX, iTunisiaCityY)
			elseif rand <= 70 and MoroccoCity then -- 20% to Morocco
				Dprint("       - goes to Morocco ", bDebug )
				local newUnit = ChangeUnitOwner (data.Unit, iMorocco)
				newUnit:SetXY(iMoroccoCityX, iMoroccoCityY)
			elseif rand <= 95 and SyriaCity then -- 25% to Syria
				Dprint("       - goes to Syria ", bDebug )
				local newUnit = ChangeUnitOwner (data.Unit, iSyria)
				newUnit:SetXY(iSyriaCityX, iSyriaCityY)
			elseif LebanonCity then -- 5% to Lebanon
				Dprint("       - goes to Lebanon ", bDebug )
				local newUnit = ChangeUnitOwner (data.Unit, iLebanon)
				newUnit:SetXY(iLebanonCityX, iLebanonCityY)
			--else -- Vichy metropole force
				--local newUnit = ChangeUnitOwner (data.Unit, iVichy)
				--newUnit:SetXY(27, 39) -- VICHY
			end
		end
		Dprint("      - done for " .. data.Unit:GetName(), bDebug )
	end
				
	--Pause(1)
	coroutine.yield()

	-- Fleet is simply split in 2	
	Dprint("   - Sea units ...", bDebug)		
	for i, data in ipairs(Sea) do
		Dprint("     - " .. data.Unit:GetName() , bDebug)	
		CleanOrdersRED (data.Unit)
		-- save the best for the player
		if data.Unit:IsFighting() then
			Dprint("       - Is Fighting, can't be transfered, leave alone...", bDebug )
						
		elseif data.Unit:IsDead() then
			Dprint("       - Is Dead, can't be transfered, leave alone...", bDebug )

		elseif i == 1 then
			-- do nothing, become Free France
		else
			local rand = math.random( 1, 100 )					
			if rand <= 75 then -- 75% chance to follow governement in Vichy
				Dprint("       - goes to Vichy ", bDebug )
				local newUnit = ChangeUnitOwner (data.Unit, iVichy)
			end
		end
					
		Dprint("      - done for " .. data.Unit:GetName(), bDebug )
	end
				
	--Pause(1)
	coroutine.yield()

	Dprint("- Change french cities ownership ...", bDebug)	
	for city in pFrance:Cities() do  -- todo : handle french owned cities in colonies
		local plot = city:Plot()
		local plotKey = GetPlotKey ( plot )
		local originalOwner = GetPlotFirstOwner(plotKey)
		if originalOwner ~= iFrance then -- liberate cities captured by France
			Dprint(" - liberate city captured by France: " .. city:GetName(), bDebug )
			local originalPlayer = Players[originalOwner]
			EscapeUnitsFromPlot(plot)
			originalPlayer:AcquireCity(city, false, true)
			--city:SetOccupied(false) -- needed in this case ?
		else
			local x, y = city:GetX(), city:GetY()
			if ((x < 24 and y > 32) or (y > 42 and x < 33)) then -- occupied territory
				Dprint("   - " .. city:GetName() .. " in occupied territory at (".. x ..",".. y ..")", bDebug)
				if city:GetOwner() ~= newPlayerID then 
					EscapeUnitsFromPlot(plot)
					pAxis:AcquireCity(city, false, true)
					city:SetPuppet(false)
					city:ChangeResistanceTurns(-city:GetResistanceTurns())
				else -- just remove resistance if city was already occupied
					city:ChangeResistanceTurns(-city:GetResistanceTurns())
				end
			elseif (y > 32 and x < 32) then -- Vichy territory
				Dprint("   - " .. city:GetName() .. " in Vichy territory at (".. x ..",".. y ..")", bDebug)
				EscapeUnitsFromPlot(plot)
				pVichy:AcquireCity(city, false, true)
				--city:SetOccupied(false)
				city:SetPuppet(false)
				city:SetNumRealBuilding(COURTHOUSE, 1) -- above won't work, try workaround...
				city:ChangeResistanceTurns(-city:GetResistanceTurns())
			elseif (y > 26 and x > 32 and y < 35 and x < 34) then -- Nice, Ajaccio to Italy
				Dprint("   - " .. city:GetName() .. " in Italy occupied territory at (".. x ..",".. y ..")", bDebug)
				if city:GetOwner() ~= iItaly then
					EscapeUnitsFromPlot(plot)
					pItaly:AcquireCity(city, false, true)
					city:SetPuppet(false)
					city:ChangeResistanceTurns(-city:GetResistanceTurns())
				end
			elseif (y > 44 and x > 32 and y < 47 and x < 37) then -- Metz, Strasbourg to Germany
				Dprint("   - " .. city:GetName() .. " in Germany occupied territory at (".. x ..",".. y ..")", bDebug)
				if city:GetOwner() ~= iGermany then
					EscapeUnitsFromPlot(plot)
					pGermany:AcquireCity(city, false, true)
					city:SetPuppet(false)
					city:ChangeResistanceTurns(-city:GetResistanceTurns())
				end
			end					
		end
	end
				
	--Pause(1)
	coroutine.yield()

	Dprint("Updating territory map ...", bDebug)	
	for iPlotLoop = 0, Map.GetNumPlots()-1, 1 do
		local plot = Map.GetPlotByIndex(iPlotLoop)
		local x = plot:GetX()
		local y = plot:GetY()
		local ownerID = plot:GetOwner()
		-- check only owned plot...
		if (ownerID ~= -1) then
			local plotKey = GetPlotKey ( plot )
			local originalOwner = GetPlotFirstOwner(plotKey)

			if (originalOwner ~= ownerID) and (originalOwner == iAlgeria or originalOwner == iMorocco or originalOwner == iSyria or originalOwner == iTunisia or originalOwner == iLebanon) then -- restore french colonies territory
				plot:SetOwner(originalOwner, -1 )
				if plot:IsCity() then
					local city = plot:GetPlotCity()
					EscapeUnitsFromPlot(plot)
					Players[originalOwner]:AcquireCity(city, false, true)
				end
			elseif originalOwner ~= iFrance and ownerID == iFrance then -- liberate plot captured by France
				plot:SetOwner(originalOwner, -1 ) 

			elseif ownerID ~= iVichy and originalOwner == iFrance and ((x < 24 and y > 32) or (y > 42 and x < 33)) then -- occupied territory
				--Dprint("(".. x ..",".. y ..") = Plot in occupied territory")
				if plot:IsCity() and ownerID ~= newPlayerID then -- handle already captured french cities
					local city = plot:GetPlotCity()
					EscapeUnitsFromPlot(plot)
					pAxis:AcquireCity(city, false, true)
				else
					plot:SetOwner(newPlayerID, -1 ) 
				end
			elseif originalOwner == iFrance and ((y > 32 and x < 32))  then -- Vichy territory
				--Dprint("(".. x ..",".. y ..") = Plot in Vichy territory")
				if plot:IsCity() and ownerID ~= iVichy then
					local city = plot:GetPlotCity()
					EscapeUnitsFromPlot(plot)
					Players[iVichy]:AcquireCity(city, false, true)
				else
					plot:SetOwner(iVichy, -1 ) 
				end
			elseif originalOwner == iFrance and (y > 26 and x > 31 and y < 38 and x < 36) then -- Nice, Ajaccio region to Italy
				--Dprint("(".. x ..",".. y ..") = Plot in Italy occupied territory")
				if plot:IsCity() and ownerID ~= iItaly then
					local city = plot:GetPlotCity()
					EscapeUnitsFromPlot(plot)
					Players[iItaly]:AcquireCity(city, false, true)
				else
					plot:SetOwner(iItaly, -1 ) 
				end
			elseif originalOwner == iFrance and (y > 40 and x > 32 and y < 47 and x < 37) then -- Metz, Strasbourg region to Germany
				--Dprint("(".. x ..",".. y ..") = Plot in Germany occupied territory")
				if plot:IsCity() and ownerID ~= iGermany then
					local city = plot:GetPlotCity()
					EscapeUnitsFromPlot(plot)
					Players[iGermany]:AcquireCity(city, false, true)
				else
					plot:SetOwner(iGermany, -1 ) 
				end
			end
		end
	end
				
	--Pause(1)
	coroutine.yield()
				
	-- change minor diplomacy
	local teamGermany = Teams[ pGermany:GetTeam() ]
	local teamItaly = Teams[ pItaly:GetTeam() ]
	local teamFrance = Teams[ pFrance:GetTeam() ]

	-- Change relation before declaring war or after peace !
				
	Dprint("Updating relations ...", bDebug)	

	pVichy:ChangeMinorCivFriendshipWithMajor( iGermany, 50 )
	pVichy:ChangeMinorCivFriendshipWithMajor( iItaly, 50 )
				
	pAlgeria:ChangeMinorCivFriendshipWithMajor( iFrance, - pAlgeria:GetMinorCivFriendshipWithMajor(iFrance) )
	pAlgeria:ChangeMinorCivFriendshipWithMajor( iEngland, - pAlgeria:GetMinorCivFriendshipWithMajor(iEngland) )
	pMorocco:ChangeMinorCivFriendshipWithMajor( iFrance, - pMorocco:GetMinorCivFriendshipWithMajor(iFrance) )
	pMorocco:ChangeMinorCivFriendshipWithMajor( iEngland, - pMorocco:GetMinorCivFriendshipWithMajor(iEngland) )
	pSyria:ChangeMinorCivFriendshipWithMajor( iFrance, - pSyria:GetMinorCivFriendshipWithMajor(iFrance) )
	pSyria:ChangeMinorCivFriendshipWithMajor( iEngland, - pSyria:GetMinorCivFriendshipWithMajor(iEngland) )
	pTunisia:ChangeMinorCivFriendshipWithMajor( iFrance, - pTunisia:GetMinorCivFriendshipWithMajor(iFrance) )
	pTunisia:ChangeMinorCivFriendshipWithMajor( iEngland, - pTunisia:GetMinorCivFriendshipWithMajor(iEngland) )
	pLebanon:ChangeMinorCivFriendshipWithMajor( iFrance, - pLebanon:GetMinorCivFriendshipWithMajor(iFrance) )
	pLebanon:ChangeMinorCivFriendshipWithMajor( iEngland, - pLebanon:GetMinorCivFriendshipWithMajor(iEngland) )
				
	--Pause(1)
	coroutine.yield()
				
	Dprint("Updating war/peace ...", bDebug)	

	--DeclarePermanentWar(iFrance, iAlgeria) -- wait for Operation Torch
	teamGermany:MakePeace( pAlgeria:GetTeam() )
	teamItaly:MakePeace( pAlgeria:GetTeam() )
	pAlgeria:ChangeMinorCivFriendshipWithMajor( iGermany, 50 - pAlgeria:GetMinorCivFriendshipWithMajor(iGermany) )
	pAlgeria:ChangeMinorCivFriendshipWithMajor( iItaly, 50 - pAlgeria:GetMinorCivFriendshipWithMajor(iItaly) )
				
	--DeclarePermanentWar(iFrance, iMorocco) -- wait for Operation Torch
	teamGermany:MakePeace( pMorocco:GetTeam() )
	teamItaly:MakePeace( pMorocco:GetTeam() )
	pMorocco:ChangeMinorCivFriendshipWithMajor( iGermany, 50 - pMorocco:GetMinorCivFriendshipWithMajor(iGermany) )
	pMorocco:ChangeMinorCivFriendshipWithMajor( iItaly, 50 - pMorocco:GetMinorCivFriendshipWithMajor(iItaly) )
				
	DeclarePermanentWar(iFrance, iSyria)
	teamGermany:MakePeace( pSyria:GetTeam() )
	teamItaly:MakePeace( pSyria:GetTeam() )
	pSyria:ChangeMinorCivFriendshipWithMajor( iGermany, 50 - pSyria:GetMinorCivFriendshipWithMajor(iGermany) )
	pSyria:ChangeMinorCivFriendshipWithMajor( iItaly, 50 - pSyria:GetMinorCivFriendshipWithMajor(iItaly) )
				
	--DeclarePermanentWar(iFrance, iTunisia) -- wait for Operation Torch
	teamGermany:MakePeace( pTunisia:GetTeam() )
	teamItaly:MakePeace( pTunisia:GetTeam() )
	pTunisia:ChangeMinorCivFriendshipWithMajor( iGermany, 50 - pTunisia:GetMinorCivFriendshipWithMajor(iGermany) )
	pTunisia:ChangeMinorCivFriendshipWithMajor( iItaly, 50 - pTunisia:GetMinorCivFriendshipWithMajor(iItaly) )	

	--DeclarePermanentWar(iFrance, iLebanon) -- wait for Operation Torch
	teamGermany:MakePeace( pLebanon:GetTeam() )
	teamItaly:MakePeace( pLebanon:GetTeam() )
	pLebanon:ChangeMinorCivFriendshipWithMajor( iGermany, 50 - pLebanon:GetMinorCivFriendshipWithMajor(iGermany) )
	pLebanon:ChangeMinorCivFriendshipWithMajor( iItaly, 50 - pLebanon:GetMinorCivFriendshipWithMajor(iItaly) )
				
	--Pause(1)
	coroutine.yield()
				
	Dprint("Finalizing Fall of France ...", bDebug)	

	-- remove resistance from Paris
	pParis:ChangeResistanceTurns(-pParis:GetResistanceTurns())

	-- french may try to restart...
	if Game.GetActivePlayer() ~= iFrance then
		Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes.NOTIFICATION_DIPLOMACY_DECLARATION, pFrance:GetName() .. " has fled from Paris with all the gold of France promising to continue the fight from french colonies.", pFrance:GetName() .. " in exil !", -1, -1)
	end
	pFrance:SetGold(pFrance:GetGold() + 5000)

	savedData.SetValue("FranceHasFallen", 1)
				
	Dprint("Fall of France event completed...", bDebug)	
end

function ConvertToFreeFrance (iAttackingPlayer, iAttackingUnit, attackerDamage, attackerFinalDamage, attackerMaxHP, iDefendingPlayer, iDefendingUnit, defenderDamage, defenderFinalDamage, defenderMaxHP)

	local franceID = GetPlayerIDFromCivID (FRANCE, false, true)
	if (FranceHasFallen() and (AreSameSide(iAttackingPlayer, franceID) or AreSameSide(iDefendingPlayer, franceID))) then -- Free France or an ally is attacking

		if iAttackingUnit > 0 and iDefendingUnit > 0 then
			local attPlayer = Players[iAttackingPlayer]
			local defPlayer = Players[iDefendingPlayer]
			local attUnit = attPlayer:GetUnitByID( iAttackingUnit )
			local defUnit = defPlayer:GetUnitByID( iDefendingUnit )
			if not (attUnit and defUnit) then -- One can be dead...
				return
			end
			local attUnitKey =  GetUnitKey(attUnit)
			local attUnitData = MapModData.RED.UnitData[attUnitKey]
			local defUnitKey =  GetUnitKey(defUnit)
			local defUnitData = MapModData.RED.UnitData[defUnitKey]
			if not attUnitData then
				Dprint ("ERROR : attUnitData is NIL in ConvertToFreeFrance, unit key = " .. tostring(attUnitKey)) -- how ?
				return
			end
			
			if not defUnitData then
				Dprint ("ERROR : defUnitData is NIL in ConvertToFreeFrance, unit key = " .. tostring(defUnitKey))
				return
			end

			if (attUnit:GetDomainType() == DomainTypes.DOMAIN_LAND and defUnit:GetDomainType() == DomainTypes.DOMAIN_LAND and defUnitData) then
				if AreSameSide(iAttackingPlayer, franceID) and defUnitData.BuilderID == franceID then -- ally attacks old french unit, try to convert
					Dprint ("Ally unit is attacking a Vichy France unit")
					local rand = math.random( 1, 200 )
					if iAttackingPlayer == franceID then
						rand = (rand * 0.5)
					end

					local diffDamage = attackerDamage - defenderDamage
					local defenderHealth = defenderMaxHP - defenderFinalDamage
					local defenderHealthRatio =  defenderHealth / defenderMaxHP * rand -- 0 to 100
					local damageRatio = diffDamage * rand  -- (- diffDamage * 100) to (diffDamage * 100)

					if defenderHealth > 0 and (defenderHealthRatio < 10 or damageRatio < - 100) then
						-- chance are relative to lower health of old unit or low damage received on defeat
						Events.GameplayAlertMessage(defUnit:GetName() .. " has joined Free France Army after a fight against " .. attUnit:GetNameNoDesc() )
						local newUnit = ChangeUnitOwner (defUnit, franceID)
					end
				elseif AreSameSide(iDefendingPlayer, franceID) and attUnitData.BuilderID == franceID then -- ally defend against old french unit, try to convert
					Dprint ("Vichy France unit is attacking an ally unit")
					local rand = math.random( 1, 200 )
					if iDefendingPlayer == franceID then
						rand = (rand * 0.5)
					end

					local diffDamage = defenderDamage - attackerDamage
					local attHealth = attackerMaxHP - attackerFinalDamage
					local attHealthRatio =  attHealth / attackerMaxHP * rand -- 0 to 100
					local damageRatio = diffDamage * rand  -- (- diffDamage * 100) to (diffDamage * 100)

					if attHealth > 0 and (attHealthRatio < 10 or damageRatio < - 100) then
						-- chance are relative to lower health of old unit or low damage received on defeat
						Events.GameplayAlertMessage(attUnit:GetName() .. " has joined Free France Army after a fight against " .. defUnit:GetNameNoDesc() )
						local newUnit = ChangeUnitOwner (defUnit, franceID)
					end

				end
			end
		end
	end
end
-- add to Events.EndCombatSim in main scenario Lua

function ColonyReconquest(hexPos, playerID, cityID, newPlayerID)
	local cityPlot = Map.GetPlot( ToGridFromHex( hexPos.x, hexPos.y ) )

	local x, y = ToGridFromHex( hexPos.x, hexPos.y )
	local civID = GetCivIDFromPlayerID(newPlayerID, false)

	if FranceHasFallen() and g_Allied[civID]
		and ( (x == 80 and y == 9) -- Damascus
		or (x == 33 and y == 17) -- Tunis
		or (x == 78 and y == 10) -- Beiruth
		or (x == 7 and y == 18) -- Rabat
		or (x == 21 and y == 21) ) -- Alger
		then -- Allies have conquered an old colony capital city	
				
		local colony = Players[playerID]

		EscapeUnitsFromPlot(cityPlot) -- remove the capturing unit from the plot before reversing city ownership...

		local saveStr = colony:GetName() .. "HasBeenLiberated"
		
		local savedData = Modding.OpenSaveData()
		local alreadyLiberated = savedData.GetValue(saveStr)
		
		if alreadyLiberated ~= 1 then

			local iItaly = GetPlayerIDFromCivID (ITALY, false, true)
			local pItaly = Players[iItaly]

			local iGermany = GetPlayerIDFromCivID (GERMANY, false, true)
			local pGermany = Players[iGermany]
				
			local iFrance = GetPlayerIDFromCivID (FRANCE, false, true)
			local pFrance = Players[iFrance]

			local iEngland = GetPlayerIDFromCivID (ENGLAND, false, true)
			local pEngland = Players[iEngland]
			
			Dprint ("-------------------------------------")
			Dprint ("Scripted Event : Liberation of " .. colony:GetName())

			for unit in colony:Units() do
				if not unit:IsDead() then
					if unit:GetOriginalOwner() == iFrance then
						local newUnit = ChangeUnitOwner (unit, iFrance)
					end
				end
			end

			Dprint("Updating territory map ...")	
			for iPlotLoop = 0, Map.GetNumPlots()-1, 1 do
				local plot = Map.GetPlotByIndex(iPlotLoop)
				local x = plot:GetX()
				local y = plot:GetY()
				local ownerID = plot:GetOwner()
				-- check only owned plot...
				if (ownerID ~= -1) then
					local plotKey = GetPlotKey ( plot )
					local originalOwner = GetPlotFirstOwner(plotKey)
					if (originalOwner ~= ownerID) and (originalOwner == playerID) then -- restore french colony territory
						plot:SetOwner(originalOwner, -1 )
						if plot:IsCity() then
							local city = plot:GetPlotCity()
							EscapeUnitsFromPlot(plot)
							Players[originalOwner]:AcquireCity(city, false, true)
						end
					end
				end
			end
				
			-- change diplomacy
			local teamGermany = Teams[ pGermany:GetTeam() ]
			local teamItaly = Teams[ pItaly:GetTeam() ]
			local teamFrance = Teams[ pFrance:GetTeam() ]
			local teamEngland = Teams[ pEngland:GetTeam() ]
				
			colony:ChangeMinorCivFriendshipWithMajor( iFrance, 100 - colony:GetMinorCivFriendshipWithMajor(iFrance) )
			colony:ChangeMinorCivFriendshipWithMajor( iEngland, 50 - colony:GetMinorCivFriendshipWithMajor(iEngland) )

			teamFrance:MakePeace( colony:GetTeam() )
			teamEngland:MakePeace( colony:GetTeam() )
			--teamGermany:DeclareWar( colony:GetTeam() )
			--teamItaly:DeclareWar( colony:GetTeam() )
			DeclarePermanentWar(iGermany, playerID)
			DeclarePermanentWar(iItaly, playerID)
			
			colony:ChangeMinorCivFriendshipWithMajor( iGermany, -60 - colony:GetMinorCivFriendshipWithMajor(iFrance) )
			colony:ChangeMinorCivFriendshipWithMajor( iItaly, -60 - colony:GetMinorCivFriendshipWithMajor(iEngland) )

			Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes.NOTIFICATION_DIPLOMACY_DECLARATION, colony:GetName() .. " has changed governement and joins the Allies.", colony:GetName() .. " liberated !", -1, -1)

			savedData.SetValue(saveStr, 1)
		end
	end
end
-- add to Events.SerialEventCityCaptured in main scenario Lua

function IsFranceNeedFighter()
	local bDebug = true
	local germanFighters = CountUnitClassAlive(CLASS_FIGHTER, GetPlayerIDFromCivID(GERMANY, false))
	local frenchFighters = CountUnitClassAlive(CLASS_FIGHTER, GetPlayerIDFromCivID(FRANCE, false))	
	Dprint ("-------------------------------------", bDebug)
	Dprint ("Check if France need Fighters...", bDebug)
	Dprint (" - Germany fighters = " .. tostring(germanFighters), bDebug)
	Dprint (" - France fighters = " .. tostring(frenchFighters), bDebug)
	Dprint (" - France want at least 3/4 of Germany Fighters = " .. tostring(germanFighters*3/4), bDebug)
	if (germanFighters*3/4) > frenchFighters then
		return true
	end
	return false
end

-----------------------------------------
-- Poland
-----------------------------------------

function GiveVilniusToPoland()

	local plotVilnius = GetPlot(57,53)	
	local iBaltic = GetPlayerIDFromCivID (BALTIC, true, true)
	local pPoland = Players[GetPlayerIDFromCivID (POLAND, true, true)]

	local city = plotVilnius:GetPlotCity()
	EscapeUnitsFromPlot(plotVilnius)
	pPoland:AcquireCity(city, false, true)
	city:SetPuppet(false)
	city:ChangeResistanceTurns(-city:GetResistanceTurns())
	city:SetOccupied(false)

	for x = 53, 60, 1 do
		for y = 50, 63, 1 do
			local plotKey = x..","..y
			local plot = GetPlot(x,y)
			if GetPlotFirstOwner(plotKey) == iBaltic and plot:GetOwner() ~= iBaltic
			and not (plotKey == "56,51" or plotKey == "57,52" or plotKey == "57,53" or plotKey == "58,54") 
			    then -- Give Only Vilnius and 3 plots to Poland, give back the others to Baltic States...
				plot:SetOwner(iBaltic, -1) 
			end
		end
	end 
end

function FallOfPoland(hexPos, playerID, cityID, newPlayerID)
  if ALLOW_SCRIPTED_EVENTS then
	local cityPlot = Map.GetPlot( ToGridFromHex( hexPos.x, hexPos.y ) )

	local x, y = ToGridFromHex( hexPos.x, hexPos.y )
	local civID = GetCivIDFromPlayerID(newPlayerID, false)
	local pAxis = Players[newPlayerID]
	if x == 53 and y == 48 then -- city of Warsaw 
		Dprint ("-------------------------------------")
		Dprint ("Scripted Event : Warsaw Captured !")		

		if (civID == GERMANY or civID == USSR) then -- captured by Germany or USSR...
			Dprint("- Captured by Germany or USSR ...")

			local iUSSR = GetPlayerIDFromCivID (USSR, false, true)
			local pUSSR = Players[iUSSR]

			local iGermany = GetPlayerIDFromCivID (GERMANY, false, true)
			local pGermany = Players[iGermany]

			local team = Teams[ pGermany:GetTeam() ]
			if not team:IsAtWar( pUSSR:GetTeam() ) then
				Dprint("- Both still at peace ...")
				local pWarsaw = cityPlot:GetPlotCity()
				local savedData = Modding.OpenSaveData()
				local iValue = savedData.GetValue("PolandHasFalled")
				if (iValue ~= 1) then
					Dprint("- First occurence, launching Fall of Poland script ...")

					local iPoland = GetPlayerIDFromCivID (POLAND, true, true)
					local pPoland = Players[iPoland]


					-- todo :
					-- save from units for UK
					--Dprint("- Change Poland units ownership ...")	
					for unit in pPoland:Units() do 
						--local newUnit = ChangeUnitOwner (unit, iEngland)
						unit:Kill()
					end						

					Dprint("- Change Poland cities ownership ...")	
					for iPlotLoop = 0, Map.GetNumPlots()-1, 1 do
						local plot = Map.GetPlotByIndex(iPlotLoop)
						local x = plot:GetX()
						local y = plot:GetY()
						local plotKey = GetPlotKey ( plot )
						if plot:IsCity() then
							city = plot:GetPlotCity()
							local originalOwner = GetPlotFirstOwner(plotKey)
							if city:GetOwner() == iPoland and originalOwner ~= iPoland then -- liberate cities captured by Poland
								Dprint(" - " .. city:GetName() .. " was captured, liberate...")	
								local originalPlayer = Players[originalOwner]
								originalPlayer:AcquireCity(city, false, true)
								--city:SetOccupied(false) -- needed in this case ?
							elseif originalOwner == iPoland then
								if (x > 47 and x < 51)  then -- Germany
									Dprint(" - " .. city:GetName() .. " is in Germany sphere...")	
									if city:GetOwner() ~= iGermany then 
										pGermany:AcquireCity(city, false, true)
										city:SetPuppet(false)
										city:ChangeResistanceTurns(-city:GetResistanceTurns())
									else -- just remove resistance if city was already occupied
										city:ChangeResistanceTurns(-city:GetResistanceTurns())
									end
								elseif (x > 55 and x < 61) then -- USSR
									Dprint(" - " .. city:GetName() .. " is in USSR sphere...")
									if city:GetOwner() ~= iUSSR then 
										pUSSR:AcquireCity(city, false, true)
										city:SetPuppet(false)
										city:ChangeResistanceTurns(-city:GetResistanceTurns())
									else -- just remove resistance if city was already occupied
										city:ChangeResistanceTurns(-city:GetResistanceTurns())
									end
								elseif (x > 52 and x < 54) then -- Central cities to Warsaw conqueror
									Dprint(" - " .. city:GetName() .. " is central, going to " .. Players[newPlayerID]:GetName())
									if city:GetOwner() ~= newPlayerID then 
										Players[newPlayerID]:AcquireCity(city, false, true)
										city:SetPuppet(false)
										city:ChangeResistanceTurns(-city:GetResistanceTurns())
									else -- just remove resistance if city was already occupied
										city:ChangeResistanceTurns(-city:GetResistanceTurns())
									end
								end					
							end
						end
					end

					Dprint("Updating territory map ...")	
					for iPlotLoop = 0, Map.GetNumPlots()-1, 1 do
						local plot = Map.GetPlotByIndex(iPlotLoop)
						local x = plot:GetX()
						local y = plot:GetY()
						local ownerID = plot:GetOwner()
						-- check only owned plot...
						if (ownerID ~= -1) then
							local plotKey = GetPlotKey ( plot )
							local originalOwner = GetPlotFirstOwner(plotKey)

							if originalOwner ~= iPoland and ownerID == iPoland then -- liberate plot captured by Poland
								plot:SetOwner(originalOwner, -1 ) 

							elseif originalOwner == iPoland and (x > 46 and x < 51)  then -- German territory
								plot:SetOwner(iGermany, -1 ) 

							elseif originalOwner == iPoland and (x > 50 and x < 55) then -- Central territory
								plot:SetOwner(newPlayerID, -1 ) 

							elseif originalOwner == iPoland and (x > 54 and x < 61) then -- USSR Territory
								plot:SetOwner(iUSSR, -1 ) 

							end
						end
					end				

					-- remove resistance from Warsaw
					pWarsaw:ChangeResistanceTurns(-pWarsaw:GetResistanceTurns())
				
					Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes.NOTIFICATION_DIPLOMACY_DECLARATION, "The Polish governement has fled the country, Poland has fallen under German and Soviet control.", "Poland has fallen !", cityPlot:GetX(), cityPlot:GetY())

					savedData.SetValue("PolandHasFalled", 1)
				end
			end
		end
	end
  end
end
-- add to Events.SerialEventCityCaptured in main scenario Lua


-----------------------------------------
-- Denmark
-----------------------------------------
function FallOfDenmark(iAttackingUnit, defendingPlotKey, iAttackingPlayer, iDefendingPlayer)

  if ALLOW_SCRIPTED_EVENTS then -- attacking a city...
  
	local pAxis = Players[iAttackingPlayer]
	local pAttackingUnit = pAxis:GetUnitByID( iAttackingUnit )
	local cityPlot = GetPlotFromKey ( defendingPlotKey )
	local x = cityPlot:GetX()
	local y = cityPlot:GetY()

	local civID = GetCivIDFromPlayerID(iAttackingPlayer, false)

	if x == 43 and y == 57 then -- city of Copenhagen 
		Dprint ("-------------------------------------")
		Dprint ("Scripted Event : Copenhagen attacked !")		

		if (civID == GERMANY or civID == ITALY) then -- attacked by Germany or Italy...
			Dprint("- Attacked by Germany or Italy ...")

			local iUK = GetPlayerIDFromCivID (ENGLAND, false, true)
			local pUK = Players[iUK]

			local iGermany = GetPlayerIDFromCivID (GERMANY, false, true)
			local pGermany = Players[iGermany]

			local pCopenhagen = cityPlot:GetPlotCity()
			local savedData = Modding.OpenSaveData()
			local iValue = savedData.GetValue("DenmarkHasFalled")
			if (iValue ~= 1) then
				Dprint("- First occurence, launching Fall of Denmark script ...")

				local iDenmark = GetPlayerIDFromCivID (DENMARK, true, true)
				local pDenmark = Players[iDenmark]

				for unit in pDenmark:Units() do 
					unit:Kill()
				end						

				Dprint("- Change Denmark cities ownership ...")	
				for iPlotLoop = 0, Map.GetNumPlots()-1, 1 do
					local plot = Map.GetPlotByIndex(iPlotLoop)
					local x = plot:GetX()
					local y = plot:GetY()
					local plotKey = GetPlotKey ( plot )
					if plot:IsCity() then
						city = plot:GetPlotCity()
						local originalOwner = GetPlotFirstOwner(plotKey)
						if city:GetOwner() == iDenmark and originalOwner ~= iDenmark then -- liberate cities captured by Denmark
							Dprint(" - " .. city:GetName() .. " was captured, liberate...")	
							local originalPlayer = Players[originalOwner]
							originalPlayer:AcquireCity(city, false, true)
							--city:SetOccupied(false) -- needed in this case ?
						elseif originalOwner == iDenmark then
							if ( x > 37 )  then -- Germany
								Dprint(" - " .. city:GetName() .. " is in Germany sphere...")	
								if city:GetOwner() ~= iGermany then 
									pGermany:AcquireCity(city, false, true)
									city:SetPuppet(false)
									city:ChangeResistanceTurns(-city:GetResistanceTurns())
								else -- just remove resistance if city was already occupied
									city:ChangeResistanceTurns(-city:GetResistanceTurns())
								end
							elseif ( x < 22 ) then -- UK
								Dprint(" - " .. city:GetName() .. " is in UK sphere...")
								if city:GetOwner() == iDenmark then -- change to UK only if it was still controlled by Denmark
									pUK:AcquireCity(city, false, true)
									city:SetPuppet(false)
									city:SetOccupied(false)
									city:ChangeResistanceTurns(-city:GetResistanceTurns())
								else -- just remove resistance if city was already occupied by someone else
									city:ChangeResistanceTurns(-city:GetResistanceTurns())
								end
							end					
						end
					end
				end

				Dprint("Updating territory map ...")	
				for iPlotLoop = 0, Map.GetNumPlots()-1, 1 do
					local plot = Map.GetPlotByIndex(iPlotLoop)
					local x = plot:GetX()
					local y = plot:GetY()
					local ownerID = plot:GetOwner()
					-- check only owned plot...
					if (ownerID ~= -1) then
						local plotKey = GetPlotKey ( plot )
						local originalOwner = GetPlotFirstOwner(plotKey)

						if originalOwner ~= iDenmark and ownerID == iDenmark then -- liberate plot captured by Poland
							plot:SetOwner(originalOwner, -1 ) 

						elseif originalOwner == iDenmark and (x > 35)  then -- German territory
							plot:SetOwner(iGermany, -1 ) 

						elseif originalOwner == iDenmark and (x < 35) and ownerID == iDenmark then -- Denmark to UK
							plot:SetOwner(iUK, -1 ) 

						end
					end
				end				

				-- remove resistance from Copenhagen
				pCopenhagen:ChangeResistanceTurns(-pCopenhagen:GetResistanceTurns())
				
				Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes.NOTIFICATION_DIPLOMACY_DECLARATION, "To prevent civilian losses " .. pDenmark:GetName() .. " has surrender to Germany, Denmark has fallen under German control. Remaining Denmark territory is now under U.K. protection", pDenmark:GetName() .. " has fallen !", cityPlot:GetX(), cityPlot:GetY())

				savedData.SetValue("DenmarkHasFalled", 1)
			end
		end
	end
  end
end
-- add to LuaEvents.OnCityAttacked in main scenario Lua

-----------------------------------------
-- United Kingdom
-----------------------------------------

function UKIsSafe()
	local iUK = GetPlayerIDFromCivID (ENGLAND, false, true)
	local safe = true
	for x = 19, 30, 1 do
		for y = 50, 68, 1 do
			local plotKey = x..","..y
			local plot = GetPlot(x,y)
			if GetPlotFirstOwner(plotKey) == iUK and plot:GetOwner() ~= iUK then -- one of UK plot has been conquered
				safe = false 
			end
		end
	end 
	return safe
end
function IsSuezAlly()
	local suezPlot = GetPlot(73,2) -- Suez
	if suezPlot:GetOwner() == GetPlayerIDFromCivID (ENGLAND, false, true) then
		return true
	else
		return false
	end
end
function IsSuezOccupied()
	local suezPlot = GetPlot(73,2) -- Suez
	if suezPlot:GetOwner() == GetPlayerIDFromCivID (ENGLAND, false, true) then
		return false
	else
		return true
	end
end

function IsUKNeedTank()
	local bDebug = true
	local germanTanks = CountUnitClassAlive(CLASS_TANK, GetPlayerIDFromCivID(GERMANY, false))
	local UKTanks = CountUnitClassAlive(CLASS_TANK, GetPlayerIDFromCivID(ENGLAND, false))	
	Dprint ("-------------------------------------", bDebug)
	Dprint ("Check if UK need Tanks...", bDebug)
	Dprint (" - Germany Tanks = " .. tostring(germanTanks), bDebug)
	Dprint (" - UK Tanks = " .. tostring(UKTanks), bDebug)
	Dprint (" - UK want at least 3/4 of Germany Tanks = " .. tostring(germanTanks*3/4), bDebug)
	if (germanTanks*3/4) > UKTanks then
		return true
	end
	return false
end

-----------------------------------------
-- Italy
-----------------------------------------

function ItalyIsSafe()
	local iItaly = GetPlayerIDFromCivID (ITALY, false, true)
	local safe = true
	for x = 33, 48, 1 do
		for y = 16, 38, 1 do
			local plotKey = x..","..y
			local plot = GetPlot(x,y)
			if GetPlotFirstOwner(plotKey) == iItaly and plot:GetOwner() ~= iItaly then -- one of Italy plot has been conquered
				safe = false 
			end
		end
	end 
	return safe
end


-----------------------------------------
-- Germany
-----------------------------------------

function GermanyIsSafe()
	local iGermany = GetPlayerIDFromCivID (GERMANY, false, true)
	local safe = true
	for x = 35, 79, 1 do
		for y = 39, 55, 1 do
			local plotKey = x..","..y
			local plot = GetPlot(x,y)
			if GetPlotFirstOwner(plotKey) == iGermany and plot:GetOwner() ~= iGermany then -- one of Germany plot has been conquered
				safe = false 
			end
		end
	end 
	return safe
end

----------------------------------------------------------------------------------------------------------------------------
-- Convoy routes
----------------------------------------------------------------------------------------------------------------------------

-- first define the condition and transport functions that will be stocked in the g_Convoy table... 
function IsRouteOpenUStoFrance()
	local bDebug = false
	Dprint("   - Checking possible maritime route from US to France", bDebug)
	if FranceHasFallen() then
		Dprint("      - France has fallen...", bDebug)
		return false
	end
	if not AreAtWar( GetPlayerIDFromCivID(FRANCE, false), GetPlayerIDFromCivID(GERMANY, false)) then
		Dprint("      - France is not at war with Germany, no need for reinforcement...", bDebug)
		return false
	end
	return true
end
function IsRouteOpenSueztoFrance()
	local bDebug = false
	Dprint("   - Checking possible maritime route from Suez to France", bDebug)
	if IsSuezOccupied() or FranceHasFallen() then
		return false
	end
	return true
end

function IsRouteOpenUStoUK()
	local bDebug = false
	Dprint("   - Checking possible maritime route from US to UK", bDebug)

	if not AreAtWar( GetPlayerIDFromCivID(ENGLAND, false), GetPlayerIDFromCivID(GERMANY, false)) then
		Dprint("      - UK is not at war with Germany, no need for reinforcement...", bDebug)
		return false
	end
	return true
end

function IsRailOpenMurmansktoMoscow()
	local bDebug = true
	if not AreAtWar( GetPlayerIDFromCivID(USSR, false), GetPlayerIDFromCivID(GERMANY, false)) then
		Dprint("      - USSR is not at war with Germany, no need for reinforcement...", bDebug)
		return false
	end
	local plotMurmansk = GetPlot(65,85)
	local plotMoscow = GetPlot(72,58)
	local ussr = Players[GetPlayerIDFromCivID(USSR, false)]
	local bRoad = isPlotConnected( ussr , plotMurmansk, plotMoscow, "Railroad", false, nil , PathBlocked)
	if bRoad then
		Dprint("     - Rail from Murmansk to Moscow is open for USSR...", bDebug)
	else
		Dprint("     - Rail from Murmansk to Moscow is closed for USSR...", bDebug)
	end	
	return bRoad
end
function IsRailOpenSueztoStalingrad()
	local bDebug = true
	if not AreAtWar( GetPlayerIDFromCivID(USSR, false), GetPlayerIDFromCivID(GERMANY, false)) then
		Dprint("      - USSR is not at war with Germany, no need for reinforcement...", bDebug)
		return false
	end
	local plotSuez = GetPlot(73,2)
	local plotStalingrad = GetPlot(84,48)
	local ussr = Players[GetPlayerIDFromCivID(USSR, false)]	
	local bRoad = isPlotConnected( ussr , plotSuez, plotStalingrad, "Railroad", false, nil , PathBlocked)	
	if bRoad then
		Dprint("     - Rail from Suez to Stalingrad is open for USSR...", bDebug)
	else
		Dprint("     - Rail from Suez to Stalingrad is closed for USSR...", bDebug)
	end
	return bRoad
end

function IsRouteOpenFinlandtoGermany()

	local bDebug = true

	local month = TurnToMonth()
	if month > 10 or month < 4 then
		return false -- assume North of Baltic Sea is frozen from November to Mars
	end
	Dprint("     - Baltic Sea is not frozen...", bDebug)
	
	local plotOulu = GetPlot(58,77)
	local plotInari = GetPlot(59,83)
	local germany = Players[GetPlayerIDFromCivID(GERMANY, false)]
	
	local bRoad = isPlotConnected( germany , plotOulu, plotInari, "Railroad", false, nil , PathBlocked)

	if bRoad then
		Dprint("     - Rail from Oulu to Inari is open for Germany...", bDebug)
	else
		Dprint("     - Rail from Oulu to Inari is closed for Germany...", bDebug)
	end

	return bRoad	
end
function IsRouteOpenNorwaytoGermany()
	
	local bDebug = true

	if IsRouteOpenFinlandtoGermany() or IsRouteOpenSwedentoGermany() then
		return false -- Use only if direct routes via Baltic are closed
	end
	Dprint("     - Baltic Sea routes are closed...", bDebug)

	local plotKiruna = GetPlot(53,81)
	local plotNarvik = GetPlot(51,85)
	local germany = Players[GetPlayerIDFromCivID(GERMANY, false)]

	-- No rail on CS cities, so check rail first, then road.
	local bRail = isPlotConnected( germany , plotKiruna, plotNarvik, "Railroad", false, nil , PathBlocked) 	
	if bRail then
		Dprint("     - Railroad from Kiruna to Narvik is open for Germany...", bDebug)
	else
		Dprint("     - Railroad from Kiruna to Narvik is closed for Germany...", bDebug)
	end
	return bRail	
end
function IsRouteOpenSwedentoGermany()

	local bDebug = true

	local month = TurnToMonth()
	if month > 10 or month < 4 then
		return false -- assume North of Baltic Sea is frozen from November to Mars
	end
	Dprint("     - Baltic Sea is not frozen...", bDebug)

	local plotKiruna = GetPlot(53,81)
	local plotLulea = GetPlot(55,78)
	local germany = Players[GetPlayerIDFromCivID(GERMANY, false)]
	
	local bRail = isPlotConnected( germany , plotKiruna, plotLulea, "Railroad", false, nil , PathBlocked)
	if bRail then
		Dprint("     - Railroad from Kiruna to Lulea is open for Germany...", bDebug)
	else
		Dprint("     - Railroad from Kiruna to Lulea is closed for Germany...", bDebug)
	end
	return bRail	
end

function GetUStoFranceTransport()
	local rand = math.random( 1, 3 )
	local transport
	if rand == 1 then
		transport = {Type = TRANSPORT_MATERIEL, Reference = 250} -- Reference is quantity of materiel, personnel or gold. For TRANSPORT_UNIT, Reference is the unit type ID
	elseif rand == 2 then 
		transport = {Type = TRANSPORT_PERSONNEL, Reference = 150}
	elseif IsFranceNeedFighter() then
		transport = {Type = TRANSPORT_UNIT, Reference = FR_HAWK75}
	else 
		transport = {Type = TRANSPORT_GOLD, Reference = 300}
	end
	
	return transport
end
function GetAfricatoFranceTransport()
	local transport = {Type = TRANSPORT_PERSONNEL, Reference = 150}
	return transport
end
function GetUStoUKTransport()
	local rand = math.random( 1, 3 )
	local transport
	if rand == 1 then
		transport = {Type = TRANSPORT_MATERIEL, Reference = 250} 
	elseif rand == 2 then 
		transport = {Type = TRANSPORT_PERSONNEL, Reference = 250}
	elseif IsUKNeedTank() then 
		transport = {Type = TRANSPORT_UNIT, Reference = UK_M3_GRANT}
	else 
		transport = {Type = TRANSPORT_GOLD, Reference = 300}
	end
	
	return transport
end
function GetSueztoUKTransport()
	local rand = math.random( 1, 6 )
	local transport
	if rand == 1 then
		transport = {Type = TRANSPORT_MATERIEL, Reference = 350} 
	elseif rand == 2 then 
		transport = {Type = TRANSPORT_PERSONNEL, Reference = 450}
	elseif rand == 3 then 
		transport = {Type = TRANSPORT_UNIT, Reference = UK_INFANTRY}
	elseif rand == 4 then 
		transport = {Type = TRANSPORT_GOLD, Reference = 500}
	elseif rand > 4 then 
		transport = {Type = TRANSPORT_OIL, Reference = 500}
	end
	
	return transport
end
function GetSueztoFranceTransport()
	local rand = math.random( 1, 6 )
	local transport
	if rand == 1 then
		transport = {Type = TRANSPORT_MATERIEL, Reference = 250} 
	elseif rand == 2 then 
		transport = {Type = TRANSPORT_PERSONNEL, Reference = 350}
	elseif rand == 3 then 
		transport = {Type = TRANSPORT_UNIT, Reference = FR_INFANTRY}
	elseif rand == 4 then 
		transport = {Type = TRANSPORT_GOLD, Reference = 300}
	elseif rand > 4 then 
		transport = {Type = TRANSPORT_OIL, Reference = 500}
	end
	
	return transport
end
function GetSueztoItalyTransport()
	local rand = math.random( 1, 4 )
	local transport
	if rand == 1 then
		transport = {Type = TRANSPORT_MATERIEL, Reference = 250} 
	elseif rand == 2 then 
		transport = {Type = TRANSPORT_OIL, Reference = 750}
	elseif rand > 2 then 
		transport = {Type = TRANSPORT_OIL, Reference = 500}
	end
	
	return transport
end
function GetAfricatoItalyTransport()
	local rand = math.random( 1, 2 )
	local transport
	if rand == 1 then
		transport = {Type = TRANSPORT_PERSONNEL, Reference = 150} 
	else 
		transport = {Type = TRANSPORT_GOLD, Reference = 250}
	end	
	return transport
end
function GetFinlandtoGermanyTransport()
	local transport = {Type = TRANSPORT_MATERIEL, Reference = 250}
	return transport
end
function GetNorwaytoGermanyTransport()
	local transport = {Type = TRANSPORT_MATERIEL, Reference = 300}
	return transport
end
function GetSueztoUSSRTransport()
	local rand = math.random( 1, 2 )
	local transport
	if rand == 1 then
		transport = {Type = TRANSPORT_MATERIEL, Reference = 350} 
	elseif rand == 2 then 
		transport = {Type = TRANSPORT_GOLD, Reference = 300}
	end	
	return transport
end
function GetUStoUSSRTransport()
	local rand = math.random( 1, 2 )
	local transport
	if rand == 1 then
		transport = {Type = TRANSPORT_MATERIEL, Reference = 375} 
	elseif rand == 2 then 
		transport = {Type = TRANSPORT_GOLD, Reference = 500}
	end	
	return transport
end
function GetCaraibOilTransport()
	local rand = math.random( 1, 4 )
	local transport
	if rand == 1 then
		transport = {Type = TRANSPORT_OIL, Reference = 400} 
	elseif rand == 2 then 
		transport = {Type = TRANSPORT_OIL, Reference = 600}
	elseif rand == 3 then 
		transport = {Type = TRANSPORT_OIL, Reference = 800}
	elseif rand == 4 then 
		transport = {Type = TRANSPORT_OIL, Reference = 1000}
	end
	
	return transport
end
function GetSueztoGreeceTransport()
	local rand = math.random( 1, 5 )
	local transport
	if rand == 1 then
		transport = {Type = TRANSPORT_MATERIEL, Reference = 300} 
	elseif rand == 2 then 
		transport = {Type = TRANSPORT_PERSONNEL, Reference = 250}
	elseif rand == 3 then 
		transport = {Type = TRANSPORT_GOLD, Reference = 300}
	elseif rand > 3 then 
		transport = {Type = TRANSPORT_OIL, Reference = 350}
	end
	
	return transport
end

-- ... then define the convoys table
-- don't move those define from this files, they must be set AFTER the functions definition...

-- Route list
US_TO_FRANCE		= 1
US_TO_UK			= 2
AFRICA_TO_FRANCE	= 3
AFRICA_TO_ITALY		= 4
FINLAND_TO_GERMANY	= 5
SUEZ_TO_UK			= 6
SUEZ_TO_FRANCE		= 7
SUEZ_TO_ITALY		= 8
SUEZ_TO_USSR		= 9
US_TO_USSR			= 10
NORWAY_TO_GERMANY	= 11
SWEDEN_TO_GERMANY	= 12
SUEZ_TO_GREECE		= 13
CARAIB_TO_FRANCE	= 14
CARAIB_TO_UK		= 15
CARAIB_TO_GREECE	= 16

-- Convoy table
g_Convoy = { 
	[US_TO_FRANCE] = {
		Name = "US to France",
		SpawnList = { {X=0, Y=50}, {X=0, Y=55}, {X=0, Y=60}, {X=0, Y=65}, {X=0, Y=70}, {X=0, Y=75}, },
		RandomSpawn = true, -- true : random choice in spawn list
		DestinationList = { {X=21, Y=42}, {X=21, Y=45}, {X=29, Y=50}, {X=29, Y=34}, }, -- La Rochelle, St Nazaire, Dunkerque, Marseille
		RandomDestination = false, -- false : sequential try in destination list
		CivID = FRANCE,
		MaxFleet = 1, -- how many convoy can use that route at the same time (not implemented)
		Frequency = 25, -- probability (in percent) of convoy spawning at each turn
		Condition = IsRouteOpenUStoFrance, -- Must refer to a function, remove this line to use the default condition (true)
		UnloadCondition = function() return true; end, -- Must refer to a function, remove this line to use the default condition (true)
		Transport = GetUStoFranceTransport, -- Must refer to a function, remove this line to use the default function
	},
	[US_TO_UK] = {
		Name = "US to UK",
		SpawnList = { {X=0, Y=50}, {X=0, Y=55}, {X=0, Y=60}, {X=0, Y=65}, {X=0, Y=70}, {X=0, Y=75}, },
		RandomSpawn = true, -- true : random choice in spawn list
		DestinationList = { {X=22, Y=52}, {X=24, Y=57}, {X=27, Y=52}, {X=28, Y=65}, }, -- Plymouth, Liverpool, London, Aberdeen
		RandomDestination = false, -- false : sequential try in destination list
		CivID = ENGLAND,
		MaxFleet = 1,
		Frequency = 25, -- probability (in percent) of convoy spawning at each turn
		Condition = IsRouteOpenUStoUK,
		Transport = GetUStoUKTransport,
	},
	[AFRICA_TO_FRANCE] = {
		Name = "Africa to France",
		SpawnList = { {X=5, Y=18}, {X=22, Y=21}, {X=34, Y=18}, }, -- adjacent to Casablanca, Alger, Tunis
		RandomSpawn = true, -- true : random choice in spawn list
		DestinationList = { {X=29, Y=34}, }, -- Marseille
		RandomDestination = false, -- false : sequential try in destination list
		CivID = FRANCE,
		MaxFleet = 1, -- how many convoy can use that route at the same time (not implemented)
		Frequency = 25, -- probability (in percent) of convoy spawning at each turn
		Condition = IsFranceStanding, -- Must refer to a function, remove this line to use the default function
		Transport = GetAfricatoFranceTransport, -- Must refer to a function, remove this line to use the default function
	},
	[AFRICA_TO_ITALY] = {
		Name = "Africa to Italy",
		SpawnList = { {X=39, Y=8}, {X=51, Y=6}, }, -- adjacent to Tripoli, Benghazi
		RandomSpawn = true,
		DestinationList = { {X=44, Y=19}, {X=41, Y=25}, {X=39, Y=28}, }, -- Reggio Calabria, Naples, Rome
		RandomDestination = false,
		CivID = ITALY,
		MaxFleet = 1, 
		Frequency = 35,
		--Condition = IsRouteOpenAfricaToItaly, -- Must refer to a function, remove this line to use the default function
		Transport = GetAfricatoItalyTransport, -- Must refer to a function, remove this line to use the default function
	},
	[FINLAND_TO_GERMANY] = {
		Name = "Finland to Germany",
		SpawnList = { {X=57, Y=77}, }, -- adjacent to Oulu
		RandomSpawn = false,
		DestinationList = { {X=52, Y=53}, {X=46, Y=52}, {X=40, Y=55}, }, -- Konigsberg, Stettin, Kiel
		RandomDestination = false,
		CivID = GERMANY,
		MaxFleet = 1, 
		Frequency = 25,
		Condition = IsRouteOpenFinlandtoGermany,
		Transport = GetFinlandtoGermanyTransport,
	},
	[SUEZ_TO_UK] = {
		Name = "Suez to UK",
		SpawnList = { {X=73, Y=5}, },
		RandomSpawn = false, -- true : random choice in spawn list
		DestinationList = { {X=22, Y=52}, {X=24, Y=57}, {X=27, Y=52}, }, -- Plymouth, Liverpool, London
		RandomDestination = false, -- false : sequential try in destination list
		CivID = ENGLAND,
		MaxFleet = 1,
		Frequency = 20, -- probability (in percent) of convoy spawning at each turn
		Condition = IsSuezAlly,
		Transport = GetSueztoUKTransport,
	},
	[SUEZ_TO_FRANCE] = {
		Name = "Suez to France",
		SpawnList = { {X=73, Y=5}, },
		RandomSpawn = false, -- true : random choice in spawn list
		DestinationList = { {X=33, Y=34}, {X=29, Y=34}, }, -- near Nice, Marseille
		RandomDestination = false, -- false : sequential try in destination list
		CivID = FRANCE,
		MaxFleet = 1,
		Frequency = 15, -- probability (in percent) of convoy spawning at each turn
		Condition = IsRouteOpenSueztoFrance,
		Transport = GetSueztoFranceTransport,
	},
	[SUEZ_TO_ITALY] = {
		Name = "Suez to Italy",
		SpawnList = { {X=73, Y=5}, },
		RandomSpawn = false, -- true : random choice in spawn list
		DestinationList = { {X=44, Y=19}, {X=41, Y=25}, {X=39, Y=28}, }, -- Reggio Calabria, Naples, Rome
		RandomDestination = false, -- false : sequential try in destination list
		CivID = ITALY,
		MaxFleet = 1,
		Frequency = 15, -- probability (in percent) of convoy spawning at each turn
		Condition = IsSuezOccupied,
		Transport = GetSueztoItalyTransport,
	},
	[SUEZ_TO_USSR] = {
		Name = "Suez to USSR",
		SpawnList = { {X=0, Y=60}, {X=0, Y=64}, {X=0, Y=68}, {X=0, Y=72}, {X=0, Y=76}, {X=0, Y=80}, },
		RandomSpawn = true, -- true : random choice in spawn list
		DestinationList = { {X=72, Y=5}, }, -- Suez
		RandomDestination = false, -- false : sequential try in destination list
		CivID = USSR,
		MaxFleet = 5,
		Frequency = 35, -- probability (in percent) of convoy spawning at each turn
		Condition = IsRailOpenSueztoStalingrad,
		Transport = GetSueztoUSSRTransport,
	},
	[US_TO_USSR] = {
		Name = "US to USSR",
		SpawnList = { {X=0, Y=60}, {X=0, Y=64}, {X=0, Y=68}, {X=0, Y=72}, {X=0, Y=76}, {X=0, Y=80}, },
		RandomSpawn = true, -- true : random choice in spawn list
		DestinationList = { {X=65, Y=85}, }, -- Murmansk
		RandomDestination = false, -- false : sequential try in destination list
		CivID = USSR,
		MaxFleet = 5,
		Frequency = 30, -- probability (in percent) of convoy spawning at each turn
		Condition = IsRailOpenMurmansktoMoscow,
		UnloadCondition = IsRailOpenMurmansktoMoscow, 
		Transport = GetUStoUSSRTransport,
	},
	[NORWAY_TO_GERMANY] = {
		Name = "Norway to Germany",
		SpawnList = { {X=50, Y=85}, }, -- adjacent to Narvik
		RandomSpawn = false,
		DestinationList = { {X=39, Y=53}, {X=40, Y=55}, {X=46, Y=52}, }, -- Hamburg, Kiel, Stettin
		RandomDestination = false,
		CivID = GERMANY,
		MaxFleet = 1, 
		Frequency = 45,
		Condition = IsRouteOpenNorwaytoGermany,
		Transport = GetNorwaytoGermanyTransport,
	},
	[SWEDEN_TO_GERMANY] = {
		Name = "Sweden to Germany",
		SpawnList = { {X=56, Y=78}, }, -- adjacent to Lulea
		RandomSpawn = false,
		DestinationList = { {X=52, Y=53}, {X=46, Y=52}, {X=40, Y=55}, }, -- Konigsberg, Stettin, Kiel
		RandomDestination = false,
		CivID = GERMANY,
		MaxFleet = 1, 
		Frequency = 25,
		Condition = IsRouteOpenSwedentoGermany, 
		Transport = GetFinlandtoGermanyTransport, -- re-use Finland values...
	},
	[SUEZ_TO_GREECE] = {
		Name = "Suez to Greece",
		SpawnList = { {X=73, Y=5}, },
		RandomSpawn = false, -- true : random choice in spawn list
		DestinationList = { {X=56, Y=17}, {X=56, Y=21}, {X=59, Y=24}, }, -- Athens, near Thessaloniki, Kavala
		RandomDestination = false, -- false : sequential try in destination list
		CivID = GREECE,
		MaxFleet = 1,
		Frequency = 15, -- probability (in percent) of convoy spawning at each turn
		Condition = IsSuezAlly,
		Transport = GetSueztoGreeceTransport,
	},
	[CARAIB_TO_FRANCE] = {
		Name = "Caraib to France",
		SpawnList = { {X=0, Y=18}, {X=0, Y=21}, {X=0, Y=24}, {X=0, Y=32}, {X=0, Y=36}, {X=0, Y=40}, },
		RandomSpawn = true, -- true : random choice in spawn list
		DestinationList = { {X=21, Y=42}, {X=21, Y=45}, {X=29, Y=50}, {X=29, Y=34}, }, -- La Rochelle, St Nazaire, Dunkerque, Marseille
		RandomDestination = false, -- false : sequential try in destination list
		CivID = FRANCE,
		MaxFleet = 1, -- how many convoy can use that route at the same time (not implemented)
		Frequency = 25, -- probability (in percent) of convoy spawning at each turn
		Condition = IsFranceStanding, -- Must refer to a function, remove this line to use the default condition (true)
		Transport = GetCaraibOilTransport, -- Must refer to a function, remove this line to use the default function
	},
	[CARAIB_TO_UK] = {
		Name = "Caraib to UK",
		SpawnList = { {X=0, Y=18}, {X=0, Y=21}, {X=0, Y=24}, {X=0, Y=32}, {X=0, Y=36}, {X=0, Y=40}, },
		RandomSpawn = true, -- true : random choice in spawn list
		DestinationList = { {X=22, Y=52}, {X=24, Y=57}, {X=27, Y=52}, {X=28, Y=65}, }, -- Plymouth, Liverpool, London, Aberdeen
		RandomDestination = false, -- false : sequential try in destination list
		CivID = ENGLAND,
		MaxFleet = 1,
		Frequency = 25, -- probability (in percent) of convoy spawning at each turn
		Transport = GetCaraibOilTransport,
	},
	[CARAIB_TO_GREECE] = {
		Name = "Caraib to UK",
		SpawnList = { {X=0, Y=18}, {X=0, Y=21}, {X=0, Y=24}, {X=0, Y=32}, {X=0, Y=36}, {X=0, Y=40}, },
		RandomSpawn = true, -- true : random choice in spawn list
		DestinationList = { {X=56, Y=17}, {X=56, Y=21}, {X=59, Y=24}, }, -- Athens, near Thessaloniki, Kavala
		RandomDestination = false, -- false : sequential try in destination list
		CivID = GREECE,
		MaxFleet = 1,
		Frequency = 15, -- probability (in percent) of convoy spawning at each turn
		Transport = GetCaraibOilTransport,
	},
}


----------------------------------------------------------------------------------------------------------------------------
-- Troops Naval routes
----------------------------------------------------------------------------------------------------------------------------

function UKReinforcementToFrance()

	local bDebug = true
	
	Dprint ("  - UK is Checking to sent reinforcement troops to France", bDebug)

	if FranceHasFallen() then
		Dprint ("   - but France has fallen, now wait for D-Day...", bDebug)
		return false
	end

	if not UKIsSafe() then
		Dprint ("   - but UK is invaded, got priority...", bDebug)
		return false
	end

	if g_Norway_Land_Ratio < 0.75 then
		Dprint ("   - but Norway is invaded, got priority...", bDebug)
		return false
	end

	local iFrance = GetPlayerIDFromCivID (FRANCE, false, true)
	local pFrance = Players[iFrance]

	local iUK = GetPlayerIDFromCivID (ENGLAND, false, true)
	local pUK = Players[iUK]

	if pFrance:GetTeam() ~= pUK:GetTeam() and not Teams[pFrance:GetTeam()]:IsAllowsOpenBordersToTeam(pUK:GetTeam()) then	
		Dprint ("   - but France borders are closed...", bDebug)
		return false
	end

	return true
end
function UKReinforcementToNorway()

	local bDebug = true
	
	Dprint ("  - UK is Checking to sent reinforcement troops to Norway", bDebug)

	if g_Norway_Land_Ratio >= 1 then
		Dprint ("   - but Norway is not invaded...", bDebug)
		return false
	end

	if not UKIsSafe() then
		Dprint ("   - but UK is invaded, got priority...", bDebug)
		return false
	end

	local iNorway = GetPlayerIDFromCivID (NORWAY, true, true)
	local pNorway = Players[iNorway]

	local iUK = GetPlayerIDFromCivID (ENGLAND, false, true)
	local pUK = Players[iUK]

	if not (pNorway:IsAllies(iUK) or pNorway:IsFriends(iUK)) then	
		Dprint ("   - but Norway borders are closed...", bDebug)
		return false
	end

	if pNorway:GetNumCities() == 0 then	
		Dprint ("   - but Norway has no cities left, need an invasion plan instead...", bDebug)
		return false
	end	
	
	local allyInNorway = GetTeamLandForceInArea( pUK, 37, 61, 54, 86 ) -- (37,61) -> (54,86) ~= norway rectangular area
	local enemyInNorway = GetEnemyLandForceInArea( pUK, 37, 61, 54, 86 )
	
	if allyInNorway > enemyInNorway then	
		Dprint ("   - but allied have more force than Axis in Norway, no need to reinforce them...", bDebug)
		return false
	end

	return true
end
function UKReinforcementToAfrica()

	local bDebug = true
	
	Dprint ("  - UK is Checking to sent reinforcement troops to Africa", bDebug)

	if IsSuezOccupied() then
		Dprint ("   - but Suez is occupied, need to prepare an invasion instead...", bDebug)
		return false
	end

	if g_Egypt_Land_Ratio >= 1 then
		Dprint ("   - but Egypt is not invaded...", bDebug)
		return false
	end

	if not UKIsSafe() then
		Dprint ("   - but UK is invaded, got priority...", bDebug)
		return false
	end
	
	--[[
	local iEgypt = GetPlayerIDFromCivID (EGYPT, true, true)
	local pEgypt = Players[iEgypt]

	local iUK = GetPlayerIDFromCivID (ENGLAND, false, true)
	local pUK = Players[iUK]

	if not (pEgypt:IsAllies(iUK) or pEgypt:IsFriends(iUK)) then	
		Dprint ("  - but Egyptian borders are closed...", bDebug)
		return false
	end
	--]]

	return true
end
function UKtryDDay()

	local bDebug = true
	
	Dprint ("  - UK is Checking if early D-Day is possible...", bDebug)

	if not FranceHasFallen() then
		Dprint ("   - but France has not fallen yet...", bDebug)
		return false
	end

	if not UKIsSafe() then
		Dprint ("   - but UK is invaded, got priority...", bDebug)
		return false
	end

	--[[
	local iEgypt = GetPlayerIDFromCivID (EGYPT, true, true)
	local pEgypt = Players[iEgypt]

	local iUK = GetPlayerIDFromCivID (ENGLAND, false, true)
	local pUK = Players[iUK]

	if not (pEgypt:IsAllies(iUK) or pEgypt:IsFriends(iUK)) then	
		Dprint ("  - but Egyptian borders are closed...", bDebug)
		return false
	end
	--]]

	return true
end

function ItalyReinforcementToAfrica()

	local bDebug = true
	
	Dprint ("  - Italy is Checking to sent reinforcement troops to Africa", bDebug)

	if g_Libya_Land_Ratio >= 1 then
		Dprint ("   - but Libya is not invaded...", bDebug)
		return false
	end

	if not ItalyIsSafe() then
		Dprint ("   - but Italy is invaded, got priority...", bDebug)
		return false
	end
	--[[
	local iLibya = GetPlayerIDFromCivID (LIBYA, true, true)
	local pLibya = Players[iLibya]

	local iItaly = GetPlayerIDFromCivID (ITALY, false, true)
	local pItaly = Players[iItaly]

	if not (pLibya:IsAllies(iItaly) or pLibya:IsFriends(iItaly)) then	
		Dprint ("  - but Libya borders are closed...", bDebug)
		return false
	end

	if pLibya:GetNumCities() == 0 then	
		Dprint ("  - but Libya has no cities left, need an invasion plan instead...", bDebug)
		return false
	end
	--]]

	return true
end
function ItalyReinforcementToAlbania()

	local bDebug = true
	
	Dprint ("  - Italy is Checking to sent reinforcement troops to Albania", bDebug)

	if g_Albania_Land_Ratio >= 1 then
		Dprint ("   - but Albania is not invaded...", bDebug)
		return false
	end

	if not ItalyIsSafe() then
		Dprint ("   - but Italy is invaded, got priority...", bDebug)
		return false
	end
	
	--[[
	local iAlbania = GetPlayerIDFromCivID (ALBANIA, true, true)
	local pAlbania = Players[iAlbania]

	local iItaly = GetPlayerIDFromCivID (ITALY, false, true)
	local pItaly = Players[iItaly]

	if not (pAlbania:IsAllies(iItaly) or pAlbania:IsFriends(iItaly)) then	
		Dprint ("  - but Albania borders are closed...", bDebug)
		return false
	end

	if pAlbania:GetNumCities() == 0 then	
		Dprint ("  - but Albania has no cities left, need an invasion plan instead...", bDebug)
		return false
	end
	--]]

	return true
end

function FranceReinforcementToAfrica()

	local bDebug = true
	
	Dprint ("  - France is Checking to sent reinforcement troops to Africa", bDebug)

	if FranceHasFallen() then
		Dprint ("   - but France has fallen, nothing to send...", bDebug)
		return false
	end

	if g_NAfrica_Land_Ratio >= 1 then
		Dprint ("   - but French North Africa is not invaded...", bDebug)
		return false
	end

	if g_France_Land_Ratio < 0.8 then
		Dprint ("   - but France is invaded...", bDebug)
		return false
	end

	return true
end


function GermanyReinforcementToNorway()

	local bDebug = true
	
	Dprint ("  - Germany is Checking to sent reinforcement troops to Norway", bDebug)

	if not GermanyIsSafe() then
		Dprint ("   - but Germany is invaded, got priority...", bDebug)
		return false
	end

	local iNorway = GetPlayerIDFromCivID (NORWAY, true, true)
	local pNorway = Players[iNorway]

	local iGermany = GetPlayerIDFromCivID (GERMANY, false, true)
	local pGermany = Players[iGermany]


	if not AreAtWar( iGermany, iNorway) then	
		Dprint ("   - but Germany has not declared war to Norway...", bDebug)
		return false
	end
	
	local friendInNorway = GetTeamLandForceInArea( pGermany, 37, 61, 54, 86 ) -- (37,61) -> (54,86) ~= norway rectangular area
	local enemyInNorway = GetEnemyLandForceInArea( pGermany, 37, 61, 54, 86 )
	
	if friendInNorway > enemyInNorway then	
		Dprint ("   - but Axis have more force than Allies in Norway, no need to reinforce them...", bDebug)
		return false
	end

	return true
end

function GermanyReinforcementToUK()

	local bDebug = true
	
	Dprint ("  - Germany is Checking to sent reinforcement troops to UK", bDebug)

	if not GermanyIsSafe() then
		Dprint ("   - but Germany is invaded, got priority...", bDebug)
		return false
	end
	
	local iGermany = GetPlayerIDFromCivID (GERMANY, false, true)
	local pGermany = Players[iGermany]


	if not IsOperationLaunched(OPERATION_SEELOWE) then	
		Dprint ("   - but Germany has not launched operation Seelowe...", bDebug)
		return false
	end
	
	local friendInUK = GetTeamLandForceInArea( pGermany, 19, 51, 30, 68 ) -- (19,51) -> (30,68) ~= UK rectangular area
	local enemyInUK = GetEnemyLandForceInArea( pGermany, 19, 51, 30, 68 )
	
	if friendInUK > enemyInUK then	
		Dprint ("   - but Axis ("..friendInUK..") have more force than Allies ("..enemyInUK..") in UK, no need to reinforce them...", bDebug)
		return false
	end

	return true 
end

-- troops route list
TROOPS_UK_FRANCE = 1
TROOPS_UK_NORWAY = 2
TROOPS_UK_AFRICA = 3
TROOPS_ITALY_AFRICA = 4
TROOPS_ITALY_ALBANIA = 5
TROOPS_FRANCE_AFRICA = 6
TROOPS_UK_DDAY = 7
TROOPS_GERMANY_NORWAY = 8
TROOPS_GERMANY_SEELOWE_KIEL = 9
TROOPS_GERMANY_SEELOWE_ST_NAZAIRE = 10
TROOPS_GERMANY_UK = 11

-- troops route table

g_TroopsRoutes = { 
	[ENGLAND] = {	
			[TROOPS_UK_FRANCE] = {
				Name = "UK to France",
				CentralPlot = {X=25, Y=55},
				MaxDistanceFromCentral = 8,
				ReserveUnits = 4, -- minimum unit to keep in this area (ie : do not send those elsewhere)
				EmbarkList = { {X=26, Y=51}, {X=27, Y=51}, }, -- near London
				RandomEmbark = false, -- true : random choice in spawn list
				WaypointList = nil, -- waypoints
				RandomWaypoint = false, -- true : random choice in waypoint list (use 1 random waypoint), else use sequential waypoint movement.
				LandingList = { {X=28, Y=49}, {X=28, Y=48}, {X=27, Y=48}, }, -- near Dunkerque
				RandomLanding = true, -- false : sequential try in landing list
				MinUnits = 2,
				MaxUnits = 2, -- Maximum number of units on the route at the same time
				Priority = 10, 
				Condition = UKReinforcementToFrance, -- Must refer to a function, remove this line to use the default condition (true)
			},
			[TROOPS_UK_NORWAY] = {
				Name = "UK to Norway",
				CentralPlot = {X=26, Y=58},
				MaxDistanceFromCentral = 8,
				ReserveUnits = 4, -- minimum unit to keep in this area (ie : do not send those elsewhere)
				EmbarkList = { {X=27, Y=60}, {X=27, Y=59}, {X=27, Y=58}, }, -- near Newcastle
				RandomEmbark = false, -- true : random choice in spawn list
				WaypointList = { {X=34, Y=66}, {X=34, Y=71}, {X=36, Y=75}, }, -- Waypoints
				RandomWaypoint = true, -- true : random choice in waypoint list (use 1 random waypoint), else use sequential waypoint movement.
				LandingList = { {X=38, Y=69}, {X=39, Y=70}, {X=39, Y=71}, {X=40, Y=72}, {X=41, Y=72}, {X=42, Y=72}, }, -- Between Bergen and trondheim
				RandomLanding = true, -- false : sequential try in landing list
				MinUnits = 2,
				MaxUnits = 4, -- Maximum number of units on the route at the same time
				Priority = 5, 
				Condition = UKReinforcementToNorway, -- Must refer to a function, remove this line to use the default condition (true)
			},
			[TROOPS_UK_AFRICA] = {
				Name = "UK to Africa",
				CentralPlot = {X=25, Y=55},
				MaxDistanceFromCentral = 8,
				ReserveUnits = 4, -- minimum unit to keep in this area (ie : do not send those elsewhere)
				EmbarkList = { {X=21, Y=52}, {X=22, Y=52}, {X=23, Y=52}, }, -- near Plymouth
				RandomEmbark = false, -- true : random choice in spawn list
				WaypointList = { {X=21, Y=50}, {X=10, Y=48}, {X=7, Y=23}, {X=11, Y=23}, {X=19, Y=23}, {X=24, Y=23},  {X=33, Y=20}, {X=39, Y=14}, {X=54, Y=9}, {X=67, Y=7},}, 
				RandomWaypoint = false, -- true : random choice in waypoint list (use 1 random waypoint), else use sequential waypoint movement.
				LandingList = { {X=69, Y=4}, {X=70, Y=4}, {X=71, Y=4}, {X=72, Y=4}, {X=73, Y=4}, {X=74, Y=4}, {X=75, Y=4}, {X=76, Y=4}, {X=76, Y=5}, {X=77, Y=6}, }, -- Between Alexandria and Haifa
				RandomLanding = false, -- false : sequential try in landing list
				MinUnits = 2,
				MaxUnits = 6, -- Maximum number of units on the route at the same time
				Priority = 5, 
				Condition = UKReinforcementToAfrica, -- Must refer to a function, remove this line to use the default condition (true)
			},
			[TROOPS_UK_DDAY] = {
				Name = "UK goes D-Day !",
				CentralPlot = {X=25, Y=55},
				MaxDistanceFromCentral = 9,
				ReserveUnits = 0, -- minimum unit to keep in this area (ie : do not send those elsewhere)
				EmbarkList = { {X=21, Y=52}, {X=22, Y=52}, {X=23, Y=52}, {X=26, Y=51}, {X=27, Y=51}, }, -- near Plymouth, London
				RandomEmbark = false, -- true : random choice in spawn list
				WaypointList = nil, -- Waypoints
				RandomWaypoint = false, -- true : random choice in waypoint list (use 1 random waypoint), else use waypoint to waypoint movement.
				LandingList = { {X=21, Y=47}, {X=22, Y=47}, {X=23, Y=47}, {X=24, Y=47}, {X=25, Y=47}, {X=26, Y=47}, }, -- Between Brest and Caen
				RandomLanding = true, -- false : sequential try in landing list
				MinUnits = 16,
				MaxUnits = 20, -- Maximum number of units on the route at the same time
				Priority = 50, 
				Condition = UKtryDDay, -- Must refer to a function, remove this line to use the default condition (true)
			},
	},
	[ITALY] = {	
			[TROOPS_ITALY_AFRICA] = {
				Name = "Italy to Africa",
				CentralPlot = {X=39, Y=28},
				MaxDistanceFromCentral = 7,
				ReserveUnits = 6, -- minimum unit to keep in this area (ie : do not send those elsewhere)
				EmbarkList = { {X=39, Y=28}, {X=39, Y=27}, {X=41, Y=26},  {X=41, Y=25}, }, -- near Rome, Naples
				RandomEmbark = false, -- true : random choice in spawn list
				WaypointList = { {X=39, Y=22}, {X=37, Y=22},  }, -- Waypoints
				RandomWaypoint = true, -- true : random choice in waypoint list (use 1 random waypoint), else use sequential waypoint movement.
				LandingList = { {X=40, Y=7}, {X=41, Y=6}, {X=45, Y=3}, {X=46, Y=3}, {X=51, Y=4}, {X=52, Y=6}, }, -- near Triploli, Sirte, Benghazi
				RandomLanding = false, -- false : sequential try in landing list
				MinUnits = 2,
				MaxUnits = 4, -- Maximum number of units on the route at the same time
				Priority = 10, 
				Condition = ItalyReinforcementToAfrica, -- Must refer to a function, remove this line to use the default condition (true)
			},
			[TROOPS_ITALY_ALBANIA] = {
				Name = "Italy to Albania",
				CentralPlot = {X=39, Y=28},
				MaxDistanceFromCentral = 7,
				ReserveUnits = 6, -- minimum unit to keep in this area (ie : do not send those elsewhere)
				EmbarkList = { {X=45, Y=25}, {X=46, Y=24}, {X=47, Y=24}, }, -- near Bari
				RandomEmbark = false, -- true : random choice in spawn list
				WaypointList = { {X=48, Y=25},  }, -- Waypoints
				RandomWaypoint = false, -- true : random choice in waypoint list (use 1 random waypoint), else use waypoint to waypoint movement.
				LandingList = { {X=50, Y=24}, {X=50, Y=23}, {X=50, Y=25}, }, -- near Tirana
				RandomLanding = false, -- false : sequential try in landing list
				MinUnits = 2,
				MaxUnits = 2, -- Maximum number of units on the route at the same time
				Priority = 10, 
				Condition = ItalyReinforcementToAlbania, -- Must refer to a function, remove this line to use the default condition (true)
			},
	},
	[FRANCE] = {	
			[TROOPS_FRANCE_AFRICA] = {
				Name = "France to Africa",
				CentralPlot = {X=28, Y=35},
				MaxDistanceFromCentral = 6,
				ReserveUnits = 4, -- minimum unit to keep in this area (ie : do not send those elsewhere)
				EmbarkList = { {X=39, Y=34}, {X=28, Y=34}, {X=29, Y=33}, }, -- near Marseille
				RandomEmbark = false, -- true : random choice in spawn list
				WaypointList = nil,
				RandomWaypoint = false, -- true : random choice in waypoint list (use 1 random waypoint), else use sequential waypoint movement.
				LandingList = { {X=22, Y=20}, {X=23, Y=20}, {X=24, Y=20}, {X=24, Y=19}, {X=25, Y=19}, {X=26, Y=19}, {X=27, Y=19}, {X=28, Y=19}, {X=29, Y=19}, {X=30, Y=18}, {X=31, Y=18}, {X=32, Y=18}, {X=33, Y=18}, }, -- Between Alger and Tunis
				RandomLanding = false, -- false : sequential try in landing list
				MinUnits = 2,
				MaxUnits = 6, -- Maximum number of units on the route at the same time
				Priority = 10, 
				Condition = FranceReinforcementToAfrica, -- Must refer to a function, remove this line to use the default condition (true)
			},
	},
	[GERMANY] = {	
			[TROOPS_GERMANY_NORWAY] = {
				Name = "Germany to Norway",
				CentralPlot = {X=41, Y=54},
				MaxDistanceFromCentral = 6,
				ReserveUnits = 5, -- minimum unit to keep in this area (ie : do not send those elsewhere)
				EmbarkList = { {X=40, Y=54}, {X=40, Y=55}, }, -- near Kiel (West of)
				RandomEmbark = false, -- true : random choice in spawn list
				WaypointList = { {X=38, Y=55}, {X=37, Y=60}, },
				RandomWaypoint = false, -- true : random choice in waypoint list (use 1 random waypoint), else use sequential waypoint movement.
				LandingList = { {X=39, Y=64}, {X=39, Y=63}, {X=40, Y=63}, {X=41, Y=64}, {X=42, Y=64}, }, -- Between Bergen and Oslo
				RandomLanding = true, -- false : sequential try in landing list
				MinUnits = 2,
				MaxUnits = 6, -- Maximum number of units on the route at the same time
				Priority = 10, 
				Condition = GermanyReinforcementToNorway, -- Must refer to a function, remove this line to use the default condition (true)
			},
			[TROOPS_GERMANY_SEELOWE_KIEL] = {
				Name = "Germany to UK (Seelowe from Kiel)",
				WaypointList = { {X=37, Y=56}, {X=31, Y=57}, },
				RandomWaypoint = false, 
				LandingList = { {X=27, Y=55}, {X=28, Y=56}, {X=28, Y=57}, {X=27, Y=57}, }, -- Between Norwich and Newcastle
				RandomLanding = true, -- false : sequential try in landing list
			},
			[TROOPS_GERMANY_SEELOWE_ST_NAZAIRE] = {
				Name = "Germany to UK (Seelowe from St Nazaire)",
				WaypointList = { {X=15, Y=47}, {X=16, Y=53}, },
				RandomWaypoint = false, 
				LandingList = { {X=21, Y=52}, {X=21, Y=53}, {X=22, Y=54}, {X=21, Y=55}, }, -- Between Norwich and Newcastle
				RandomLanding = true, -- false : sequential try in landing list
			},
			[TROOPS_GERMANY_UK] = {
				Name = "Germany to UK",
				CentralPlot = {X=23, Y=47},
				MaxDistanceFromCentral = 8,
				ReserveUnits = 5, -- minimum unit to keep in this area (ie : do not send those elsewhere)
				EmbarkList = { {X=23, Y=48}, {X=22, Y=47}, {X=23, Y=47}, }, -- near Cherbourg
				RandomEmbark = false, -- true : random choice in spawn list
				WaypointList = nil,
				RandomWaypoint = false, -- true : random choice in waypoint list (use 1 random waypoint), else use sequential waypoint movement.
				LandingList = { {X=23, Y=52}, {X=24, Y=52}, {X=25, Y=52}, {X=25, Y=51}, }, -- East of Plymouth
				RandomLanding = true, -- false : sequential try in landing list
				MinUnits = 2,
				MaxUnits = 4, -- Maximum number of units on the route at the same time
				Priority = 10, 
				Condition = GermanyReinforcementToUK, -- Must refer to a function, remove this line to use the default condition (true)
			},
	},
}


----------------------------------------------------------------------------------------------------------------------------
-- Military Projects
----------------------------------------------------------------------------------------------------------------------------

-- add scenario specific restriction for projects
function PlayerEuro1940ProjectRestriction  (iPlayer, iProjectType)

	local civID = GetCivIDFromPlayerID(iPlayer, false)

	if civID == GERMANY and iProjectType == OPERATION_SEELOWE and AreAtWar( iPlayer, GetPlayerIDFromCivID(USSR, false)) then		
		return false -- Operation Seelowe not available if Germany is at war with USSR...	
	end

	return true
end
-- GameEvents.PlayerCanCreate.Add(PlayerEuro1940ProjectRestriction) (called in RedEuro1940.lua)


function IsGermanyAtWarWithNorway()
	local bDebug = false
	if not AreAtWar( GetPlayerIDFromCivID(GERMANY, false), GetPlayerIDFromCivID(NORWAY, true)) then
		Dprint("      - Germany is not at war with Norway...", bDebug)
		return false
	end
	return true
end

function IsUSSRLosingWar()

	local bDebug = true
	
	Dprint ("  - Checking if USSR is losing war...", bDebug)

	if g_Cities then
	
		Dprint("  - Looking for captured key cities...", bDebug)
		local numKeyCityLost = 0
		for i, data in ipairs(g_Cities) do
			if data.Key then
				local plot = GetPlot(data.X, data.Y)
				local city = plot:GetPlotCity()	
				if city then
					local firstOwnerID = GetPlotFirstOwner(GetPlotKey(plot))
					local firstCivID = GetCivIDFromPlayerID(firstOwnerID, false)
					Dprint("    - Check if " .. city:GetName() .. " was USSR and if capturing player is axis...", bDebug)
					if firstCivID == USSR and city:IsOccupied() and g_Axis[GetCivIDFromPlayerID(city:GetOwner(), false)] then -- check if a key cities of newPlayerID opponent is free
						Dprint("       - Occupied by Axis power", bDebug)
						numKeyCityLost = numKeyCityLost + 1
					end
				else
					Dprint("WARNING : plot at ("..tostring(data.X)..","..tostring(data.Y) ..") is not city, but is in g_Cities table !", bDebug)
				end
			end
		end
		if numKeyCityLost > 1 and g_USSR_Land_Ratio < 0.95 then 
			Dprint("  - At least 2 key cities captured, and g_USSR_Land_Ratio < 0.95 returning true...", bDebug)
			return true
		end
		Dprint("  - Less than 2 key cities captured or g_USSR_Land_Ratio >= 0.95...", bDebug)
	end

	if g_USSR_Land_Ratio >= 0.85 then
		Dprint ("   - Land ratio is high enough (".. tostring(g_USSR_Land_Ratio) .. " >= 0.85)", bDebug)
		return false
	end

	Dprint ("   - Land ratio is low (".. tostring(g_USSR_Land_Ratio) .. " < 0.85)", bDebug)

	local iUSSR = GetPlayerIDFromCivID (USSR, false, true)
	local pUSSR = Players[iUSSR]

	local enemyForces = GetEnemyLandForceInArea( pUSSR, 59, 31, 107, 83 )
	local allyForces = GetSameSideLandForceInArea( pUSSR, 59, 31, 107, 83 )

	if (allyForces * 75/100) >= enemyForces then	-- if our ally doesn't have less than 75% of the ennemy forces, we are not losing	
		Dprint ("   - Ally Forces are high enough: ".. tostring(allyForces) .. " > 75% of enemy forces (" .. tostring(enemyForces) ..")", bDebug)
		return false
	end
	
	Dprint ("   - Ally Forces are low: ".. tostring(allyForces) .. " < 75% of enemy forces (" .. tostring(enemyForces) ..")", bDebug)

	return true
end

g_Military_Project = {
	------------------------------------------------------------------------------------
	[GERMANY] = {
	------------------------------------------------------------------------------------
		[OPERATION_WESERUBUNG] =  { -- projectID as index !
			Name = "TXT_KEY_OPERATION_WESERUBUNG",
			OrderOfBattle = {
				{	Name = "Para Group 1", X = 44, Y = 52, Domain = "Land", CivID = GERMANY, -- spawn NW of Berlin
					Group = {		GE_PARATROOPER,	GE_PARATROOPER, GE_PARATROOPER,	},
					UnitsXP = {		10,				15,	}, 
					InitialObjective = "51,85", -- Narvik
					LaunchType = "ParaDrop",
					LaunchX = 51, -- Destination plot
					LaunchY = 83, -- (51,83) = Near Narvik
					LaunchImprecision = 3, -- landing area
				},
				{	Name = "Para Group 2", X = 42, Y = 52, Domain = "Land", CivID = GERMANY, AI = true, -- spawn NW of Berlin
					Group = {		GE_PARATROOPER,	GE_PARATROOPER,	},
					UnitsXP = {		10,				15,				}, 
					InitialObjective = "43,72", -- Trondheim
					LaunchType = "ParaDrop",
					LaunchX = 44, -- Destination plot
					LaunchY = 74, -- (44,74) = Near Trondheim
					LaunchImprecision = 3, -- landing area
				},
				{	Name = "Para Group 3", X = 40, Y = 52, Domain = "Land", CivID = GERMANY, AI = true, -- spawn NW of Berlin
					Group = {		GE_PARATROOPER,	GE_PARATROOPER,	},
					UnitsXP = {		25,				30,				}, 
					InitialObjective = "43,72", -- Trondheim
					LaunchType = "ParaDrop",
					LaunchX = 45, -- Destination plot
					LaunchY = 76, -- (45,76) = Near Trondheim
					LaunchImprecision = 3, -- landing area
				},
			},			
			Condition = IsGermanyAtWarWithNorway, -- Must refer to a function, remove this line to use the default condition (always true)
		},
		[OPERATION_SEELOWE] =  { -- projectID as index !
			Name = "TXT_KEY_OPERATION_SEELOWE",
			OrderOfBattle = {
				{	Name = "Para Group 1", X = 44, Y = 52, Domain = "Land", CivID = GERMANY, -- spawn NW of Berlin
					Group = {		GE_PARATROOPER,	GE_PARATROOPER, GE_PARATROOPER,	},
					UnitsXP = {		10,				15,				10}, 
					InitialObjective = nil, 
					LaunchType = "ParaDrop",
					LaunchX = 25, -- Destination plot
					LaunchY = 55, -- (25,55) = Near Birmingham
					LaunchImprecision = 2, -- landing area
				}, 
				{	Name = "Amphibious Army 1", X = 38, Y = 55, Domain = "Land", CivID = GERMANY, -- spawn west of Kiel
					Group = {		GE_INFANTRY,	GE_INFANTRY,	GE_INFANTRY,	GE_PANZER_III,	GE_PANZER_II},
					UnitsXP = {		10,				15,				}, 
					InitialObjective = nil, 
					LaunchType = "Amphibious",
					RouteID = TROOPS_GERMANY_SEELOWE_KIEL, -- must define a troops route for amphibious operation in g_TroopsRoutes !
				},
				{	Name = "Amphibious Army 2", X = 19, Y = 43, Domain = "Land", CivID = GERMANY, -- spawn west of St Nazaire / La rochelle
					Group = {		GE_INFANTRY,	GE_INFANTRY,	GE_INFANTRY,	GE_PANZER_IV,	GE_PANZER_II},
					UnitsXP = {		10,				15,				}, 
					InitialObjective = nil, 
					LaunchType = "Amphibious",
					RouteID = TROOPS_GERMANY_SEELOWE_ST_NAZAIRE, -- must define a troops route for amphibious operation in g_TroopsRoutes !
				},
			},			
			Condition = FranceHasFallen, -- Must refer to a function, remove this line to use the default condition (always true)
		},
	},	
	------------------------------------------------------------------------------------
	------------------------------------------------------------------------------------
	[USSR] = {
	------------------------------------------------------------------------------------
		[OPERATION_MOTHERLANDCALL] =  { -- projectID as index !
			Name = "TXT_KEY_OPERATION_MOTHERLANDCALL",
			OrderOfBattle = {
				{	Name = "Army Group 1", X = 105, Y = 59, Domain = "Land", CivID = USSR, -- spawn near Tobolsk
					Group = {		RU_NAVAL_INFANTRY,	RU_T34, RU_T34, RU_T34, RU_INFANTRY, RU_INFANTRY, RU_INFANTRY,	},
					UnitsXP = {		35,					15,	}, 
				},
				{	Name = "Support Group 1", X = 105, Y = 59, Domain = "Land", CivID = USSR, -- spawn near Tobolsk
					Group = {		RU_ZIS30,	RU_ZIS30, RU_ZIS30, RU_ARTILLERY, RU_ARTILLERY, RU_ARTILLERY, RU_ARTILLERY,	},
				},
				{	Name = "Army Group 2", X = 106, Y = 70, Domain = "Land", CivID = USSR, AI = true, -- spawn near Berezovo
					Group = {		RU_NAVAL_INFANTRY,	RU_T34, RU_T34, RU_T34, RU_INFANTRY, RU_INFANTRY, RU_INFANTRY,	},
					UnitsXP = {		45,					30,	}, 
				},
				{	Name = "Support Group 2", X = 106, Y = 70, Domain = "Land", CivID = USSR, AI = true, -- spawn near Berezovo
					Group = {		RU_ZIS30,	RU_ZIS30, RU_ZIS30, RU_ARTILLERY, RU_ARTILLERY, RU_ARTILLERY, RU_ARTILLERY,	},
				},
			},			
			Condition = IsUSSRLosingWar, -- Must refer to a function, remove this line to use the default condition (always true)
		},
	},	
}


function InitializeEuro1940Projects()

	local bDebug = true

	Dprint("-------------------------------------")
	Dprint("Initializing specific projects for Europe 1939-1945 scenario...")

	if not g_ProjectsTable then
		return
	end

	local turn = Game.GetGameTurn()
	local date = g_Calendar[turn]
	if date.Number >= 19420101 and PROJECT_M3A1HT and not IsProjectDone(PROJECT_M3A1HT) then
		local projectInfo = GameInfo.Projects[PROJECT_M3A1HT]
		MarkProjectDone(PROJECT_M3A1HT, AMERICA)
		Events.GameplayAlertMessage(Locale.ConvertTextKey(projectInfo.Description) .." has been completed !")
	end
end

--------------------------------------------------------------
-- UI functions
--------------------------------------------------------------
include("InstanceManager")

-- Tooltip init
function DoInitEuro1940UI()
	ContextPtr:LookUpControl("/InGame/TopPanel/REDScore"):SetToolTipCallback( ToolTipEuro1940Score )
	UpdateEuro1940ScoreString()
end

local tipControlTable = {};
TTManager:GetTypeControlTable( "TooltipTypeTopPanel", tipControlTable );

-- Score Tooltip for Europe 39-45
function ToolTipEuro1940Score( control )

	local playerID = Game:GetActivePlayer()
	local player = Players[playerID]

	local strText = "[ICON_MEDAL] Objective :[NEWLINE][NEWLINE]All key cities of your opponents must have been captured by you or your allies while all of your cities (and those of your allies) must still be under your control.[NEWLINE]";
	
	local strAlliedColor = "[COLOR_POSITIVE_TEXT]"
	local strAxisColor = "[COLOR_NEGATIVE_TEXT]"
	if IsAxis(playerID) then	
		strAlliedColor = "[COLOR_NEGATIVE_TEXT]"
		strAxisColor = "[COLOR_POSITIVE_TEXT]"
	end

	-- Allied cities
	strText = strText .. "[NEWLINE]----------------------------------------------------------------[NEWLINE]"
	strText = strText .. "[NEWLINE]Allied cities: "

	for i, city in ipairs(GetAlliedKeyCities()) do
		local playerID = city:GetOwner()
		local player = Players[playerID]
		if IsAxis(playerID) then
			strText = strText .. "[NEWLINE][ICON_BULLET] ".. strAxisColor .. city:GetName() .."[ENDCOLOR] controlled by ".. strAxisColor .. player:GetName() .. "[ENDCOLOR]"
		else
			strText = strText .. "[NEWLINE][ICON_BULLET] ".. strAlliedColor .. city:GetName() .."[ENDCOLOR] controlled by ".. strAlliedColor .. player:GetName() .. "[ENDCOLOR]"
		end
	end
	strText = strText .. "[NEWLINE]----------------------------------------------------------------[NEWLINE]"
	strText = strText .. "[NEWLINE]Axis cities: "

	-- Axis cities
	for i, city in ipairs(GetAxisKeyCities()) do
		local playerID = city:GetOwner()
		local player = Players[playerID]
		if IsAxis(playerID) then
			strText = strText .. "[NEWLINE][ICON_BULLET] ".. strAxisColor .. city:GetName().."[ENDCOLOR] controlled by ".. strAxisColor .. player:GetName() .. "[ENDCOLOR]"
		else
			strText = strText .. "[NEWLINE][ICON_BULLET] ".. strAlliedColor .. city:GetName().."[ENDCOLOR] controlled by ".. strAlliedColor .. player:GetName() .. "[ENDCOLOR]"
		end
	end

	
	tipControlTable.TooltipLabel:SetText( strText );
	tipControlTable.TopPanelMouseover:SetHide(false);
    
    -- Autosize tooltip
    tipControlTable.TopPanelMouseover:DoAutoSize();
	
end

function UpdateEuro1940ScoreString()

	local playerID = Game:GetActivePlayer()
	--local player = Players[playerID]

	local scoreString = "[ICON_MEDAL] Captured cities: "

	if g_Axis[civID] then	
		strAlliedColor = "[COLOR_NEGATIVE_TEXT]"
		strAxisColor = "[COLOR_POSITIVE_TEXT]"
	end

	local capturedAllied = 0
	local totalAllied = 0
	for i, city in ipairs(GetAlliedKeyCities()) do
		totalAllied = totalAllied + 1
		if IsAxis(city:GetOwner()) then
			capturedAllied = capturedAllied + 1
		end
	end
	
	local capturedAxis = 0
	local totalAxis = 0
	for i, city in ipairs(GetAxisKeyCities()) do
		totalAxis = totalAxis + 1
		if IsAllied(city:GetOwner()) then
			capturedAxis = capturedAxis + 1
		end
	end
	
	local strAlliedColor = "[COLOR_NEGATIVE_TEXT]"
	local strAxisColor = "[COLOR_POSITIVE_TEXT]"

	if capturedAllied > 0 and IsAxis(playerID) then
		strAlliedColor = "[COLOR_POSITIVE_TEXT]"
	end
	
	if capturedAxis > 0 and IsAxis(playerID) then
		strAxisColor = "[COLOR_NEGATIVE_TEXT]"
	end

	scoreString = scoreString .. "Allied = " .. strAlliedColor .. capturedAllied .. "[ENDCOLOR]/" .. totalAllied .. ", Axis = " .. strAxisColor .. capturedAxis .. "[ENDCOLOR]/" .. totalAxis

	ContextPtr:LookUpControl("/InGame/TopPanel/REDScore"):SetText( scoreString )
	ContextPtr:LookUpControl("/InGame/TopPanel/REDScore"):SetHide( false )
end

function GetAlliedKeyCities()	
	local cities = {}

	if not g_Cities then
		return cities
	end

	for i, data in ipairs(g_Cities) do
		if data.Key then

			local plot = GetPlot(data.X, data.Y)
			local city = plot:GetPlotCity()	
			if city and IsAllied(GetPlotFirstOwner(GetPlotKey(plot))) then
				table.insert(cities, city)
			end
		end
	end

	return cities
end

function GetAxisKeyCities()	
	local cities = {}

	if not g_Cities then
		return cities
	end

	for i, data in ipairs(g_Cities) do
		if data.Key then

			local plot = GetPlot(data.X, data.Y)
			local city = plot:GetPlotCity()	
			if city and IsAxis(GetPlotFirstOwner(GetPlotKey(plot))) then
				table.insert(cities, city)
			end
		end
	end

	return cities
end