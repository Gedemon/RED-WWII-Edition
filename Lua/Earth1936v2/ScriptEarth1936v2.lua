-- ScriptEarth1936
-- Author: Gedemon (Edited by CommanderBly)
-- DateCreated: 8/18/2012
--------------------------------------------------------------

print("Loading Earth 1936 Scripts...")
print("-------------------------------------")


-----------------------------------------
-- Planned Events
-----------------------------------------

-- Liberation of Africa
-- End of Vichy France
-- Liberation of Italy

-----------------------------------------
-- Annexation of Austria
-----------------------------------------
function AustriaAnnexation()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end

	if 19380302 <= turnDate and 19380302 > prevDate then
		Dprint ("-------------------------------------")
		Dprint ("Scripted Event : Austria Annexed !")

		local iGermany = GetPlayerIDFromCivID (GERMANY, false, true)
		local pGermany = Players[iGermany]
			
		local team = Teams[ pGermany:GetTeam() ]
		Dprint("- Germany Selected ...")
		local savedData = Modding.OpenSaveData()
		local iValue = savedData.GetValue("AustriaHasFalled")
		if (iValue ~= 1) then
			Dprint("- First occurence, launching Fall of Austria script ...")

			local iAustria = GetPlayerIDFromCivID (AUSTRIA, true, true)
			local pAustria = Players[iAustria]

			for unit in pAustria:Units() do 
				unit:Kill()
			end						

			Dprint("- Change Austria cities ownership ...")	
			for iPlotLoop = 0, Map.GetNumPlots()-1, 1 do
				local plot = Map.GetPlotByIndex(iPlotLoop)
				local x = plot:GetX()
				local y = plot:GetY()
				local plotKey = GetPlotKey ( plot )
				if plot:IsCity() then
					city = plot:GetPlotCity()
					local originalOwner = GetPlotFirstOwner(plotKey)
					if city:GetOwner() == iAustria and originalOwner ~= iAustria then -- liberate cities captured by Austria
						Dprint(" - " .. city:GetName() .. " was captured, liberate...")	
						local originalPlayer = Players[originalOwner]
						originalPlayer:AcquireCity(city, false, true)
						--city:SetOccupied(false) -- needed in this case ?
					elseif originalOwner == iAustria then
						if (x > 1 and x < 26)  then -- Germany
							Dprint(" - " .. city:GetName() .. " is in Germany sphere...")	
							if city:GetOwner() ~= iGermany then 
								pGermany:AcquireCity(city, false, true)
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
					if originalOwner ~= iAustria and ownerID == iAustria then -- liberate plot captured by Austria
						local closeCity = GetCloseCity ( originalOwner, plot )
						if closeCity then
							plot:SetOwner(originalOwner, closeCity:GetID() ) 
						else
							plot:SetOwner(originalOwner, -1 ) 
						end
								 
					elseif originalOwner == iAustria and (x > 1 and x < 26)  then -- German territory
						local closeCity = GetCloseCity ( iGermany, plot )
						if closeCity then
							plot:SetOwner(iGermany, closeCity:GetID() ) 
						else
							plot:SetOwner(iGermany, -1 ) 
						end
					end
				end
			end			
				
			Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes.NOTIFICATION_DIPLOMACY_DECLARATION, pAustria:GetName() .. " has fallen subject to German Anschluss, Germany has now united with Austria.", pAustria:GetName() .. " has been annexed !", -1, -1)

			savedData.SetValue("AustriaHasFalled", 1)
		end
	end
--		end
--	end
end

-----------------------------------------
-- Annexation of Czechosolvakia
-----------------------------------------

function CzechAnnexation()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end

	if 19380316 <= turnDate and 19380316 > prevDate then
		Dprint ("-------------------------------------")
		Dprint ("Scripted Event : Czechosolvakia Annexed !")

		local iGermany = GetPlayerIDFromCivID (GERMANY, false, true)
		local pGermany = Players[iGermany]
			
		local team = Teams[ pGermany:GetTeam() ]
		Dprint("- Germany Selected ...")
		local savedData = Modding.OpenSaveData()
		local iValue = savedData.GetValue("CzechosolvakiaHasFalled")
		if (iValue ~= 1) then
			Dprint("- First occurence, launching Fall of Czechosolvakia script ...")

			local iCzechosolvakia = GetPlayerIDFromCivID (CZECHOSOLVAKIA, true, true)
			local pCzechosolvakia = Players[iCzechosolvakia]

			local iHungary = GetPlayerIDFromCivID (HUNGARY, true, true)
			local pHungary = Players[iHungary]

			for unit in pCzechosolvakia:Units() do 
				unit:Kill()
			end						

			Dprint("- Change Czech cities ownership ...")	
			for iPlotLoop = 0, Map.GetNumPlots()-1, 1 do
				local plot = Map.GetPlotByIndex(iPlotLoop)
				local x = plot:GetX()
				local y = plot:GetY()
				local plotKey = GetPlotKey ( plot )
				if plot:IsCity() then
					city = plot:GetPlotCity()
					local originalOwner = GetPlotFirstOwner(plotKey)
					if city:GetOwner() == iCzechosolvakia and originalOwner ~= iCzechosolvakia then -- liberate cities captured by Czechosolvakia
						Dprint(" - " .. city:GetName() .. " was captured, liberate...")	
						local originalPlayer = Players[originalOwner]
						originalPlayer:AcquireCity(city, false, true)
						--city:SetOccupied(false) -- needed in this case ?
					elseif originalOwner == iCzechosolvakia then
						if (x > 1 and x < 26)  then -- Germany
							Dprint(" - " .. city:GetName() .. " is in Germany sphere...")	
							if city:GetOwner() ~= iGermany then 
								pGermany:AcquireCity(city, false, true)
								city:SetPuppet(false)
								city:ChangeResistanceTurns(-city:GetResistanceTurns())
							else -- just remove resistance if city was already occupied
								city:ChangeResistanceTurns(-city:GetResistanceTurns())
							end
						elseif (x > 27 and x < 100)  then -- Hungary
								Dprint(" - " .. city:GetName() .. " is in Hungary sphere...")	
								if city:GetOwner() ~= iHungary then 
									pHungary:AcquireCity(city, false, true)
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
					if originalOwner ~= iCzechosolvakia and ownerID == iCzechosolvakia then -- liberate plot captured by Czechosolvakia
						local closeCity = GetCloseCity ( originalOwner, plot )
						if closeCity then
							plot:SetOwner(originalOwner, closeCity:GetID() ) 
						else
							plot:SetOwner(originalOwner, -1 ) 
						end
								 
					elseif originalOwner == iCzechosolvakia and (x > 1 and x < 26)  then -- German territory
						local closeCity = GetCloseCity ( iGermany, plot )
						if closeCity then
							plot:SetOwner(iGermany, closeCity:GetID() ) 
						else
							plot:SetOwner(iGermany, -1 ) 
						end


					elseif originalOwner == iCzechosolvakia and (x > 27 and x < 100)  then -- Hungary territory
						local closeCity = GetCloseCity ( iHungary, plot )
						if closeCity then
							plot:SetOwner(iHungary, closeCity:GetID() ) 
						else
							plot:SetOwner(iHungary, -1 ) 
						end
					end
				end
			end			
				
			Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes.NOTIFICATION_DIPLOMACY_DECLARATION, pCzechosolvakia:GetName() .. " has beeen annexed by Germany, Germany has now united with Czechosolvakia and created the Puppet Regime Slovakia.", pCzechosolvakia:GetName() .. " has been annexed !", -1, -1)

			savedData.SetValue("CzechosolvakiaHasFalled", 1)
		end
	end
end

-----------------------------------------
-- Annexation of the Baltic States
-----------------------------------------
function LithuaniaAnnexation()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end

	if 19390615 <= turnDate and 19390615 > prevDate then
		Dprint ("-------------------------------------")
		Dprint ("Scripted Event : Baltic Annexed !")

		local iUSSR = GetPlayerIDFromCivID (USSR, false, true)
		local pUSSR = Players[iUSSR]
			
		local team = Teams[ pUSSR:GetTeam() ]
		Dprint("- USSR Selected ...")
		local savedData = Modding.OpenSaveData()
		local iValue = savedData.GetValue("LithuaniaHasFalled")
		if (iValue ~= 1) then
			Dprint("- First occurence, launching Fall of Lithuania script ...")

			local iLithuania = GetPlayerIDFromCivID (BALTIC, true, true)
			local pLithuania = Players[iLithuania]

			for unit in pLithuania:Units() do 
				unit:Kill()
			end						

			Dprint("- Change Lithuania cities ownership ...")	
			for iPlotLoop = 0, Map.GetNumPlots()-1, 1 do
				local plot = Map.GetPlotByIndex(iPlotLoop)
				local x = plot:GetX()
				local y = plot:GetY()
				local plotKey = GetPlotKey ( plot )
				if plot:IsCity() then
					city = plot:GetPlotCity()
					local originalOwner = GetPlotFirstOwner(plotKey)
					if city:GetOwner() == iLithuania and originalOwner ~= iLithuania then -- liberate cities captured by Baltics
						Dprint(" - " .. city:GetName() .. " was captured, liberate...")	
						local originalPlayer = Players[originalOwner]
						originalPlayer:AcquireCity(city, false, true)
						--city:SetOccupied(false) -- needed in this case ?
					elseif originalOwner == iLithuania then
						if (x > 1 and x < 115)  then -- USSR
							Dprint(" - " .. city:GetName() .. " is in Russian sphere...")	
							if city:GetOwner() ~= iUSSR then 
								pUSSR:AcquireCity(city, false, true)
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
					if originalOwner ~= iLithuania and ownerID == iLithuania then -- liberate plot captured by Lithuania
						local closeCity = GetCloseCity ( originalOwner, plot )
						if closeCity then
							plot:SetOwner(originalOwner, closeCity:GetID() ) 
						else
							plot:SetOwner(originalOwner, -1 ) 
						end
								 
					elseif originalOwner == iLithuania and (x > 1 and x < 115)  then -- USSR territory
						local closeCity = GetCloseCity ( iUSSR, plot )
						if closeCity then
							plot:SetOwner(iUSSR, closeCity:GetID() ) 
						else
							plot:SetOwner(iUSSR, -1 ) 
						end
					end
				end
			end			
				
			Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes.NOTIFICATION_DIPLOMACY_DECLARATION, pLithuania:GetName() .. " has fallen to USSR, USSR has annexed the Baltic States.", pLithuania:GetName() .. " has been annexed !", -1, -1)

			savedData.SetValue("LithuaniaHasFalled", 1)
		end
	end
end


-----------------------------------------
-- Fall of France
-----------------------------------------

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

function FallOfFrance(hexPos, playerID, cityID, newPlayerID)

	if not ALLOW_SCRIPTED_EVENTS then
		return
	end

	local cityPlot = Map.GetPlot( ToGridFromHex( hexPos.x, hexPos.y ) )
	
	local x, y = ToGridFromHex( hexPos.x, hexPos.y )
	local civID = GetCivIDFromPlayerID(newPlayerID, false)
	local pAxis = Players[newPlayerID]
	if x == 13 and y == 33 then -- city of Paris
	
		Dprint ("-------------------------------------")
		Dprint ("Scripted Event : Paris Captured !")
		if (civID == GERMANY or civID == ITALY) then -- captured by Germany or Italy...
			local pParis = cityPlot:GetPlotCity()
			Dprint("- Captured by Axis power ...")
			local savedData = Modding.OpenSaveData()
			local iValue = savedData.GetValue("FranceHasFallen")
			if (iValue ~= 1) then
				Dprint("- First occurence, launching script ...")

				local iVichy = GetPlayerIDFromCivID (VICHY, true, true)
				local pVichy = Players[iVichy]

				local iItaly = GetPlayerIDFromCivID (ITALY, false, true)
				local pItaly = Players[iItaly]

				local iGermany = GetPlayerIDFromCivID (GERMANY, false, true)
				local pGermany = Players[iGermany]
				
				local iFrance = GetPlayerIDFromCivID (FRANCE, false, true)
				local pFrance = Players[iFrance]

				local iEngland = GetPlayerIDFromCivID (ENGLAND, false, true)
				local pEngland = Players[iEngland]

				local iJapan = GetPlayerIDFromCivID (JAPAN, false, true)
				local pJapan = Players[iJapan]

				-- todo :
				-- save from units for UK, auto-send some units in Africa and give unit ownership to colony
				-- this will allow war and unit flipping side in colony whithout needing to make Vichy France enter war...
				Dprint("- Change french units ownership ...")
				local palmyraPlot = GetPlot (1,3)
				local palmyra = palmyraPlot:GetPlotCity()
				if palmyra:GetOwner() ~= iFrance then -- give back Dakar to France
					EscapeUnitsFromPlot(palmyraPlot)
					Players[iFrance]:AcquireCity(palmyra, false, true)
					Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes.NOTIFICATION_DIPLOMACY_DECLARATION, palmyra:GetName() .. " has revolted and is joining Free France.", palmyra:GetName() .. " has revolted !", -1, -1)
				end
				
				local Air = {}
				local Sea = {}
				local Land = {}
				-- fill table, remove convoy
				for unit in pFrance:Units() do 
					--ChangeUnitOwner (unit, iVichy)
					if (unit:GetUnitType() == CONVOY) then
						unit:Kill(true, -1)
					end
					if not unit:IsDead() then
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
				Dprint("   - Air units ...")
				for i, data in ipairs(Air) do
					-- save the best for the player
					if i == 1 then
						data.Unit:SetXY(1,35) -- DAKAR
					else
						local rand = math.random( 1, 100 )
						local EnglandCity = GetCloseCity ( iEngland, data.Unit:GetPlot() , true)
					
						if rand <= 5 and EnglandCity then -- 5% chance to flew to England
							data.Unit:SetXY(EnglandCity:GetX(), EnglandCity:GetY())
							ChangeUnitOwner (data.Unit, iEngland)
						else -- Vichy metropole force
							data.Unit:SetXY(15, 59) -- MARSIELLE
							ChangeUnitOwner (data.Unit, iVichy)
						end
					end
				end
				
				-- Land Units
				Dprint("   - Land units ...")
				for i, data in ipairs(Land) do
					-- save the best for the player
					if i == 1 then
						data.Unit:SetXY(1,35) -- DAKAR
					elseif data.Unit:GetUnitType() == FR_LEGION then -- Special treatment for Legion
						local rand = math.random( 1, 100 )
						if rand <= 25 then
							ChangeUnitOwner (data.Unit, iVichy)
							--data.Unit:SetXY(AlgeriaCity:GetX(), AlgeriaCity:GetY())
						else
							data.Unit:SetXY(164,37) -- DAKAR
						end
					else
						local rand = math.random( 1, 100 )
						local EnglandCity = GetCloseCity ( iEngland, data.Unit:GetPlot() , true)
					
						if rand <= 5 and EnglandCity then -- 5% chance to flew to England
							ChangeUnitOwner (data.Unit, iEngland)
							--data.Unit:SetXY(EnglandCity:GetX(), EnglandCity:GetY())
						else -- Vichy metropole force
							ChangeUnitOwner (data.Unit, iVichy)
							--data.Unit:SetXY(27, 39) -- VICHY
						end
					end
				end
				
				-- Fleet is simply split in 2	
				Dprint("   - Sea units ...")			
				for i, data in ipairs(Sea) do
					-- save the best for the player
					if i == 1 then
						-- do nothing, become Free France
					else
						local rand = math.random( 1, 100 )					
						if rand <= 75 then -- 75% chance to follow governement in Vichy
							ChangeUnitOwner (data.Unit, iVichy)
						end
					end
				end


				Dprint("- Change french cities ownership ...")	
				for city in pFrance:Cities() do  -- todo : handle french owned cities in colonies
					local plot = city:Plot()
					local plotKey = GetPlotKey ( plot )
					local originalOwner = GetPlotFirstOwner(plotKey)
					if originalOwner ~= iFrance then -- liberate cities captured by France
						local originalPlayer = Players[originalOwner]
						EscapeUnitsFromPlot(plot)
						originalPlayer:AcquireCity(city, false, true)
						--city:SetOccupied(false) -- needed in this case ?
					else
						local x, y = city:GetX(), city:GetY()
						if ((x < 12 and y > 25) or (y > 32 and x < 19)) then -- occupied territory
							--Dprint("(".. x ..",".. y ..") = City in occupied territory")
							if city:GetOwner() ~= newPlayerID then 
								EscapeUnitsFromPlot(plot)
								pAxis:AcquireCity(city, false, true)
								city:SetPuppet(false)
								city:ChangeResistanceTurns(-city:GetResistanceTurns())
							else -- just remove resistance if city was already occupied
								city:ChangeResistanceTurns(-city:GetResistanceTurns())
							end
						elseif (x < 12 and y > 25 and y > 32 and x < 19) then -- Vichy territory
							--Dprint("(".. x ..",".. y ..") = City in Vichy territory")
							EscapeUnitsFromPlot(plot)
							pVichy:AcquireCity(city, false, true)
							--city:SetOccupied(false)
							city:SetPuppet(false)
							city:SetNumRealBuilding(COURTHOUSE, 1) -- above won't work, try workaround...
							city:ChangeResistanceTurns(-city:GetResistanceTurns())
						elseif (y > 10 and x > 0 and y < 20 and x < 19) then -- Vichy African territory
							--Dprint("(".. x ..",".. y ..") = City in Vichy territory")
							EscapeUnitsFromPlot(plot)
							pVichy:AcquireCity(city, false, true)
							--city:SetOccupied(false)
							city:SetPuppet(false)
							city:SetNumRealBuilding(COURTHOUSE, 1) -- above won't work, try workaround...
							city:ChangeResistanceTurns(-city:GetResistanceTurns())
						elseif (y > 24 and x > 16 and y < 26 and x < 18) then -- Ajaccio to Italy
							--Dprint("(".. x ..",".. y ..") = City in Italy occupied territory")
							if city:GetOwner() ~= iItaly then
								EscapeUnitsFromPlot(plot)
								pItaly:AcquireCity(city, false, true)
								city:SetPuppet(false)
								city:ChangeResistanceTurns(-city:GetResistanceTurns())
							end
						elseif (y > 27 and x > 16 and y < 34 and x < 18) then -- Metz, Strasbourg to Germany
							--Dprint("(".. x ..",".. y ..") = City in Germany occupied territory")
							if city:GetOwner() ~= iGermany then
								EscapeUnitsFromPlot(plot)
								pGermany:AcquireCity(city, false, true)
								city:SetPuppet(false)
								city:ChangeResistanceTurns(-city:GetResistanceTurns())
							end
						elseif (y > 1 and x > 74 and y < 16 and x < 82) then -- Indochina to Japan
							--Dprint("(".. x ..",".. y ..") = City in Japan occupied territory")
							if city:GetOwner() ~= iJapan then
								EscapeUnitsFromPlot(plot)
								pJapan:AcquireCity(city, false, true)
								city:SetPuppet(false)
								city:ChangeResistanceTurns(-city:GetResistanceTurns())
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

						if originalOwner ~= iFrance and ownerID == iFrance then -- liberate plot captured by France
							local closeCity = GetCloseCity ( originalOwner, plot )
							if closeCity then
								plot:SetOwner(originalOwner, closeCity:GetID() ) 
							else
								plot:SetOwner(originalOwner, -1 ) 
							end
						elseif ownerID ~= iVichy and originalOwner == iFrance and ((x < 12 and y > 25) or (y > 32 and x < 19)) then -- occupied territory
							--Dprint("(".. x ..",".. y ..") = Plot in occupied territory")
							if plot:IsCity() and ownerID ~= newPlayerID then -- handle already captured french cities
								local city = plot:GetPlotCity()
								EscapeUnitsFromPlot(plot)
								Players[newPlayerID]:AcquireCity(city, false, true)
							else
								local closeCity = GetCloseCity ( newPlayerID, plot )
								if closeCity then
									plot:SetOwner(newPlayerID, closeCity:GetID() ) 
								else
									plot:SetOwner(newPlayerID, -1 ) 
								end
							end
						elseif originalOwner == iFrance and ((y > 25 and x < 16))  then -- Vichy territory
							--Dprint("(".. x ..",".. y ..") = Plot in Vichy territory")
							if plot:IsCity() and ownerID ~= iVichy then
								local city = plot:GetPlotCity()
								EscapeUnitsFromPlot(plot)
								Players[iVichy]:AcquireCity(city, false, true)
							else
								local closeCity = GetCloseCity ( iVichy, plot )
								if closeCity then
									plot:SetOwner(iVichy, closeCity:GetID() ) 
								else
									plot:SetOwner(iVichy, -1 ) 
								end
							end
						elseif originalOwner == iFrance and (y > 24 and x > 16 and y < 26 and x < 18) then -- Nice, Ajaccio region to Italy
							--Dprint("(".. x ..",".. y ..") = Plot in Italy occupied territory")
							if plot:IsCity() and ownerID ~= iItaly then
								local city = plot:GetPlotCity()
								EscapeUnitsFromPlot(plot)
								Players[iItaly]:AcquireCity(city, false, true)
							else
								local closeCity = GetCloseCity ( iItaly, plot )
								if closeCity then
									plot:SetOwner(iItaly, closeCity:GetID() ) 
								else
									plot:SetOwner(iItaly, -1 ) 
								end
							end
						elseif originalOwner == iFrance and (y > 27 and x > 16 and y < 34 and x < 18)  then -- Metz, Strasbourg region to Germany
							--Dprint("(".. x ..",".. y ..") = Plot in Germany occupied territory")
							if plot:IsCity() and ownerID ~= iGermany then
								local city = plot:GetPlotCity()
								EscapeUnitsFromPlot(plot)
								Players[iGermany]:AcquireCity(city, false, true)
							else
								local closeCity = GetCloseCity ( iGermany, plot )
								if closeCity then
									plot:SetOwner(iGermany, closeCity:GetID() ) 
								else
									plot:SetOwner(iGermany, -1 ) 
								end
							end
						elseif originalOwner == iFrance and (y > 1 and x > 74 and y < 16 and x < 82) then -- Indochina Japan
							--Dprint("(".. x ..",".. y ..") = Plot in Japan occupied territory")
							if plot:IsCity() and ownerID ~= iJapan then
								local city = plot:GetPlotCity()
								EscapeUnitsFromPlot(plot)
								Players[iJapan]:AcquireCity(city, false, true)
							else
								local closeCity = GetCloseCity ( iJapan, plot )
								if closeCity then
									plot:SetOwner(iJapan, closeCity:GetID() ) 
								else
									plot:SetOwner(iJapan, -1 ) 
								end
							end
						end
					end
				end

				-- change minor diplomacy
				local teamGermany = Teams[ pGermany:GetTeam() ]
				local teamItaly = Teams[ pItaly:GetTeam() ]
				local teamFrance = Teams[ pFrance:GetTeam() ]

				pVichy:ChangeMinorCivFriendshipWithMajor( iGermany, 50 )
				pVichy:ChangeMinorCivFriendshipWithMajor( iItaly, 50 )
				
				-- remove resistance from Paris
				pParis:ChangeResistanceTurns(-pParis:GetResistanceTurns())

				-- french may try to restart...
				if Game.GetActivePlayer() ~= iFrance then
					Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes.NOTIFICATION_DIPLOMACY_DECLARATION, pFrance:GetName() .. " has fled from Paris with all the gold of France promising to continue the fight from french colonies.", pFrance:GetName() .. " in exile !", -1, -1)
				end
				pFrance:SetGold(pFrance:GetGold() + 5000)

				savedData.SetValue("FranceHasFallen", 1)
			end
		end
	end
end
Events.SerialEventCityCaptured.Add( FallOfFrance )

function ConvertToFreeFrance (iAttackingPlayer, iAttackingUnit, iAttackingUnitDamage, iAttackingUnitFinalDamage, iAttackingUnitMaxHitPoints, iDefendingPlayer, iDefendingUnit, iDefendingUnitDamage, iDefendingUnitFinalDamage, iDefendingUnitMaxHitPoints)

	local savedData = Modding.OpenSaveData()
	local iValue = savedData.GetValue("FranceHasFallen")
	if (iValue == 1 and iAttackingPlayer == GetPlayerIDFromCivID (FRANCE, false, true) ) then -- Free France is attacking

		if iAttackingUnit > 0 and iDefendingUnit > 0 then
			local attPlayer = Players[iAttackingPlayer]
			local defPlayer = Players[iDefendingPlayer]
			local attUnit = attPlayer:GetUnitByID( iAttackingUnit )
			local defUnit = defPlayer:GetUnitByID( iDefendingUnit )
			local defUnitKey =  GetUnitKey(defUnit)
			local defUnitData = g_UnitData[defUnitKey]

			if (attUnit:GetDomainType() == DomainTypes.DOMAIN_LAND and defUnit:GetDomainType() == DomainTypes.DOMAIN_LAND and defUnitData) then
				if defUnitData.BuilderID == iAttackingPlayer then -- old french unit, try to convert
					Dprint ("Free France unit is attacking a Vichy France unit")
					local rand = math.random( 1, 100 )

					local diffDamage = iAttackingUnitDamage - iDefendingUnitDamage
					local defenderHealth = iDefendingUnitMaxHitPoints - iDefendingUnitFinalDamage
					local defenderHealthRatio =  defenderHealth / iDefendingUnitMaxHitPoints * rand -- 0 to 100
					local damageRatio = diffDamage * rand  -- (- diffDamage * 100) to (diffDamage * 100)

					if defenderHealth > 0 and (defenderHealthRatio < 10 or damageRatio < - 100) then
						-- chance are relative to lower health of old unit or damage received on defeat of free France attacking unit
						ChangeUnitOwner (defUnit, iAttackingPlayer)
						Events.GameplayAlertMessage(defUnit:GetNameNoDesc() .. " has joined Free France Army after a fight against " .. attUnit:GetNameNoDesc() )
					end
				end
			end
		end
	end
end
Events.EndCombatSim.Add( ConvertToFreeFrance )

-----------------------------------------
-- Fall of Poland
-----------------------------------------
function FallOfPoland(hexPos, playerID, cityID, newPlayerID)

	if not ALLOW_SCRIPTED_EVENTS then
		return
	end

	local cityPlot = Map.GetPlot( ToGridFromHex( hexPos.x, hexPos.y ) )

	local x, y = ToGridFromHex( hexPos.x, hexPos.y )
	local civID = GetCivIDFromPlayerID(newPlayerID, false)
	local pAxis = Players[newPlayerID]
	if x == 27 and y == 37 then -- city of Warsaw 
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
						--ChangeUnitOwner (unit, iEngland)
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
								if (x > 20 and x < 26)  then -- Germany
									Dprint(" - " .. city:GetName() .. " is in Germany sphere...")	
									if city:GetOwner() ~= iGermany then 
										pGermany:AcquireCity(city, false, true)
										city:SetPuppet(false)
										city:ChangeResistanceTurns(-city:GetResistanceTurns())
									else -- just remove resistance if city was already occupied
										city:ChangeResistanceTurns(-city:GetResistanceTurns())
									end
								elseif (x > 28 and x < 50) then -- USSR
									Dprint(" - " .. city:GetName() .. " is in USSR sphere...")
									if city:GetOwner() ~= iUSSR then 
										pUSSR:AcquireCity(city, false, true)
										city:SetPuppet(false)
										city:ChangeResistanceTurns(-city:GetResistanceTurns())
									else -- just remove resistance if city was already occupied
										city:ChangeResistanceTurns(-city:GetResistanceTurns())
									end
								elseif (x > 25 and x < 29) then -- Central cities to Warsaw conqueror
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
								local closeCity = GetCloseCity ( originalOwner, plot )
								if closeCity then
									plot:SetOwner(originalOwner, closeCity:GetID() ) 
								else
									plot:SetOwner(originalOwner, -1 ) 
								end

							elseif originalOwner == iPoland and (x > 20 and x < 26)  then -- German territory
								local closeCity = GetCloseCity ( iGermany, plot )
								if closeCity then
									plot:SetOwner(iGermany, closeCity:GetID() ) 
								else
									plot:SetOwner(iGermany, -1 ) 
								end
							elseif originalOwner == iPoland and (x > 25 and x < 29) then -- Central territory
								local closeCity = GetCloseCity ( newPlayerID, plot )
								if closeCity then
									plot:SetOwner(newPlayerID, closeCity:GetID() ) 
								else
									plot:SetOwner(newPlayerID, -1 ) 
								end
							elseif originalOwner == iPoland and (x > 28 and x < 50) then -- USSR Territory
								local closeCity = GetCloseCity ( iUSSR, plot )
								if closeCity then
									plot:SetOwner(iUSSR, closeCity:GetID() ) 
								else
									plot:SetOwner(iUSSR, -1 ) 
								end
							end
						end
					end				

					-- remove resistance from Warsaw
					pWarsaw:ChangeResistanceTurns(-pWarsaw:GetResistanceTurns())
				
					Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes.NOTIFICATION_DIPLOMACY_DECLARATION, pPoland:GetName() .. " governement has fled the country, Poland has fall under Germany and Soviet control.", pPoland:GetName() .. " has fall !", -1, -1)

					savedData.SetValue("PolandHasFalled", 1)
				end
			end
		end
	end
end
Events.SerialEventCityCaptured.Add( FallOfPoland )

-----------------------------------------
-- Fall of Denmark
-----------------------------------------
function FallOfDenmark(hexPos, playerID, cityID, newPlayerID)

	if not ALLOW_SCRIPTED_EVENTS then
		return
	end

	local cityPlot = Map.GetPlot( ToGridFromHex( hexPos.x, hexPos.y ) )

	local x, y = ToGridFromHex( hexPos.x, hexPos.y )
	local civID = GetCivIDFromPlayerID(newPlayerID, false)
	local pAxis = Players[newPlayerID]
	if x == 24 and y == 42 then -- city of Copenhagen 
		Dprint ("-------------------------------------")
		Dprint ("Scripted Event : Copenhagen Captured !")		

		if (civID == GERMANY) then -- captured by Germany...
			Dprint("- Captured by Germany ...")


			local iGermany = GetPlayerIDFromCivID (GERMANY, false, true)
			local pGermany = Players[iGermany]

			local iAmerica = GetPlayerIDFromCivID (AMERICA, false, true)
			local pAmerica = Players[iAmerica]

			local team = Teams[ pGermany:GetTeam() ]
			Dprint("- Germany Selected ...")
			local pCopenhagen = cityPlot:GetPlotCity()
			local savedData = Modding.OpenSaveData()
			local iValue = savedData.GetValue("DenmarkHasFalled")
			if (iValue ~= 1) then
				Dprint("- First occurence, launching Fall of Denmark script ...")

				local iDenmark = GetPlayerIDFromCivID (DENMARK, true, true)
				local pDenmark = Players[iDenmark]


				-- todo :
				-- save from units for UK
				--Dprint("- Change Denmark units ownership ...")	
				for unit in pDenmark:Units() do 
					--ChangeUnitOwner (unit, iEngland)
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
							if (x > 17 and x < 26)  then -- Germany
								Dprint(" - " .. city:GetName() .. " is in Germany sphere...")	
								if city:GetOwner() ~= iGermany then 
									pGermany:AcquireCity(city, false, true)
									city:SetPuppet(false)
									city:ChangeResistanceTurns(-city:GetResistanceTurns())
								else -- just remove resistance if city was already occupied
									city:ChangeResistanceTurns(-city:GetResistanceTurns())
								end
							elseif (x > 0 and x < 18) or (x > 27 and x < 179) then -- AMERICA
								Dprint(" - " .. city:GetName() .. " is in America sphere...")
								if city:GetOwner() ~= iAmerica then 
									pAmerica:AcquireCity(city, false, true)
									city:SetPuppet(true)
									city:SetNumRealBuilding(COURTHOUSE, 1) -- above won't work, try workaround...
									city:ChangeResistanceTurns(-city:GetResistanceTurns())
								else -- just remove resistance if city was already occupied
									city:ChangeResistanceTurns(-city:GetResistanceTurns())
								end
							end					
						end
					end
				end
				
				-- remove resistance from Copenhagen
				pCopenhagen:ChangeResistanceTurns(-pCopenhagen:GetResistanceTurns())
				
				Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes.NOTIFICATION_DIPLOMACY_DECLARATION, pDenmark:GetName() .. " government has fled the country, Denmark has fallen to Germany. The United Kingdom has assigned Greenland and Iceland to the American Government.", pDenmark:GetName() .. " has fallen !", -1, -1)

				savedData.SetValue("DenmarkHasFalled", 1)
	
			end
		end
	end
end
Events.SerialEventCityCaptured.Add( FallOfDenmark )

-----------------------------------------
-- Fall of Norway
-----------------------------------------
function FallOfNorway(hexPos, playerID, cityID, newPlayerID)

	if not ALLOW_SCRIPTED_EVENTS then
		return
	end

	local cityPlot = Map.GetPlot( ToGridFromHex( hexPos.x, hexPos.y ) )

	local x, y = ToGridFromHex( hexPos.x, hexPos.y )
	local civID = GetCivIDFromPlayerID(newPlayerID, false)
	local pAxis = Players[newPlayerID]
	if x == 22 and y == 48 then -- city of Oslo 
		Dprint ("-------------------------------------")
		Dprint ("Scripted Event : Oslo Captured !")		

		if (civID == GERMANY) then -- captured by Germany...
			Dprint("- Captured by Germany ...")


			local iGermany = GetPlayerIDFromCivID (GERMANY, false, true)
			local pGermany = Players[iGermany]

			local team = Teams[ pGermany:GetTeam() ]
			Dprint("- Germany Selected ...")
			local pOslo = cityPlot:GetPlotCity()
			local savedData = Modding.OpenSaveData()
			local iValue = savedData.GetValue("NorwayHasFalled")
			if (iValue ~= 1) then
				Dprint("- First occurence, launching Fall of Norway script ...")

				local iNorway = GetPlayerIDFromCivID (NORWAY, true, true)
				local pNorway = Players[iNorway]


				-- todo :
				-- save from units for UK
				--Dprint("- Change Norway units ownership ...")	
				for unit in pNorway:Units() do 
					--ChangeUnitOwner (unit, iEngland)
					unit:Kill()
				end						

				Dprint("- Change Norway cities ownership ...")	
				for iPlotLoop = 0, Map.GetNumPlots()-1, 1 do
					local plot = Map.GetPlotByIndex(iPlotLoop)
					local x = plot:GetX()
					local y = plot:GetY()
					local plotKey = GetPlotKey ( plot )
					if plot:IsCity() then	
						city = plot:GetPlotCity()
						local originalOwner = GetPlotFirstOwner(plotKey)
						if city:GetOwner() == iNorway and originalOwner ~= iNorway then -- liberate cities captured by Norway
							Dprint(" - " .. city:GetName() .. " was captured, liberate...")	
							local originalPlayer = Players[originalOwner]
							originalPlayer:AcquireCity(city, false, true)
							--city:SetOccupied(false) -- needed in this case ?
						elseif originalOwner == iNorway then
							if (x > 1 and x < 120)  then -- Germany
								Dprint(" - " .. city:GetName() .. " is in Germany sphere...")	
								if city:GetOwner() ~= iGermany then 
									pGermany:AcquireCity(city, false, true)
									city:SetPuppet(false)
									city:ChangeResistanceTurns(-city:GetResistanceTurns())
								else -- just remove resistance if city was already occupied
									city:ChangeResistanceTurns(-city:GetResistanceTurns())
								end
							end					
						end
					end
				end
				
				-- remove resistance from Copenhagen
				pOslo:ChangeResistanceTurns(-pOslo:GetResistanceTurns())
				
				Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes.NOTIFICATION_DIPLOMACY_DECLARATION, pNorway:GetName() .. " government has fled the country, Norway has fallen to Germany.", pNorway:GetName() .. " has fallen !", -1, -1)

				savedData.SetValue("NorwayHasFalled", 1)
	
			end
		end
	end
end
Events.SerialEventCityCaptured.Add( FallOfNorway )

-----------------------------------------
-- Liberation of Africa
-----------------------------------------
function FallOfVichy(hexPos, playerID, cityID, newPlayerID)

	if not ALLOW_SCRIPTED_EVENTS then
		return
	end

	local cityPlot = Map.GetPlot( ToGridFromHex( hexPos.x, hexPos.y ) )

	local x, y = ToGridFromHex( hexPos.x, hexPos.y )
	local civID = GetCivIDFromPlayerID(newPlayerID, false)
	local pAxis = Players[newPlayerID]
	if x == 4 and y == 14 then -- city of Casablanca
		Dprint ("-------------------------------------")
		Dprint ("Scripted Event : Casablanca has been captured !")		

		if (civID == AMERICA or civID == ENGLAND or civID == FRANCE) then -- captured by the Allies...
			Dprint("- Captured by the Allies ...")


			local iGermany = GetPlayerIDFromCivID (GERMANY, false, true)
			local pGermany = Players[iGermany]

			local iFrance = GetPlayerIDFromCivID (FRANCE, false, true)
			local pFrance = Players[iFrance]

			local team = Teams[ pGermany:GetTeam() ]
			Dprint("- Germany Selected ...")
			local pCasablanca = cityPlot:GetPlotCity()
			local savedData = Modding.OpenSaveData()
			local iValue = savedData.GetValue("VichyHasFalled")
			if (iValue ~= 1) then
				Dprint("- First occurence, launching Fall of Norway script ...")

				local iVichy = GetPlayerIDFromCivID (VICHY, true, true)
				local pVichy = Players[iVichy]



				for unit in pVichy:Units() do 
					unit:Kill()
				end						

				Dprint("- Change Vichy cities ownership ...")	
				for iPlotLoop = 0, Map.GetNumPlots()-1, 1 do
					local plot = Map.GetPlotByIndex(iPlotLoop)
					local x = plot:GetX()
					local y = plot:GetY()
					local plotKey = GetPlotKey ( plot )
					if plot:IsCity() then	
						city = plot:GetPlotCity()
						local originalOwner = GetPlotFirstOwner(plotKey)
						if originalOwner == iFrance then
							local x, y = city:GetX(), city:GetY()
							if ((x > 0 and y > 0) and (y < 20 and x < 16)) then -- France
								Dprint(" - " .. city:GetName() .. " is in France sphere...")	
								if city:GetOwner() ~= iFrance then 
									pFrance:AcquireCity(city, false, true)
									city:SetPuppet(false)
									city:ChangeResistanceTurns(-city:GetResistanceTurns())
								else -- just remove resistance if city was already occupied
									city:ChangeResistanceTurns(-city:GetResistanceTurns())
								end
							elseif ((x > 3 and y > 21) and (y < 38 and x < 23)) or ((x > 16 and y > 12) and (y < 19 and x < 22)) then -- Germany
								Dprint(" - " .. city:GetName() .. " is in Germany sphere...")
								if city:GetOwner() ~= iGermany then 
									pGermany:AcquireCity(city, false, true)
									city:SetPuppet(true)
									city:SetNumRealBuilding(COURTHOUSE, 1) -- above won't work, try workaround...
									city:ChangeResistanceTurns(-city:GetResistanceTurns())
								else -- just remove resistance if city was already occupied
									city:ChangeResistanceTurns(-city:GetResistanceTurns())
								end
							end					
						end
					end
				end
				
				-- remove resistance from Conquered Territories
				pCasablanca:ChangeResistanceTurns(-pCasablanca:GetResistanceTurns())
				
				Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes.NOTIFICATION_DIPLOMACY_DECLARATION, pVichy:GetName() .. " has been defeated by the Allies and Germany has taken control of it's remains.", pVichy:GetName() .. " has fallen, North Africa is liberated !", -1, -1)

				savedData.SetValue("VichyHasFalled", 1)
	
			end
		end
	end
end
Events.SerialEventCityCaptured.Add( FallOfVichy )

----------------------------------------------------------------------------------------------------------------------------
-- Lend Lease Act
----------------------------------------------------------------------------------------------------------------------------

function LendLeaseAct()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end

	if 19410311 <= turnDate and 19410311 > prevDate then
		Dprint ("-------------------------------------")
		Dprint ("Scripted Event : Lend Lease Act in Affect !")
				
		Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes.NOTIFICATION_DIPLOMACY_DECLARATION, " America has passed the Lend Lease Act, France, the United Kingdom and the USSR will recieve extra convoys from America.", "Lend Lease Act Passed!")
	end
end

----------------------------------------------------------------------------------------------------------------------------
-- Remove Buildings when at War
----------------------------------------------------------------------------------------------------------------------------

function RemovebuildingsGermany()
	local iGermany = GetPlayerIDFromCivID (GERMANY, false, true)
	local pGermany = Players[iGermany]
	if not IsNeutral(iGermany) then
		Dprint("- Attempting to Run Remove Buildings Script for Germany ...")
		for city in pGermany:Cities() do
			if city:IsHasBuilding(ALLIEDCITY) then city:SetNumRealBuilding(ALLIEDCITY, 0) end
			if city:IsHasBuilding(AXISCITY) then city:SetNumRealBuilding(AXISCITY, 0) end
			if city:IsHasBuilding(COMINTERNCITY) then city:SetNumRealBuilding(COMINTERNCITY, 0) end
			if city:IsHasBuilding(NODRAFT) then city:SetNumRealBuilding(NODRAFT, 0) end
			if city:IsHasBuilding(LIMITEDDRAFT) then city:SetNumRealBuilding(LIMITEDDRAFT, 0) end
		end
	end
end

function RemovebuildingsFrance()
	local iFrance = GetPlayerIDFromCivID (FRANCE, false, true)
	local pFrance = Players[iFrance]
	if not IsNeutral(iFrance) then
		Dprint("- Attempting to Run Remove Buildings Script for France ...")
		for city in pFrance:Cities() do
			if city:IsHasBuilding(ALLIEDCITY) then city:SetNumRealBuilding(ALLIEDCITY, 0) end
			if city:IsHasBuilding(AXISCITY) then city:SetNumRealBuilding(AXISCITY, 0) end
			if city:IsHasBuilding(COMINTERNCITY) then city:SetNumRealBuilding(COMINTERNCITY, 0) end
			if city:IsHasBuilding(NODRAFT) then city:SetNumRealBuilding(NODRAFT, 0) end
			if city:IsHasBuilding(LIMITEDDRAFT) then city:SetNumRealBuilding(LIMITEDDRAFT, 0) end
		end
	end
end

function RemovebuildingsUK()
	local iEngland = GetPlayerIDFromCivID (ENGLAND, false, true)
	local pEngland = Players[iEngland]
	if not IsNeutral(iEngland) then
		Dprint("- Attempting to Run Remove Buildings Script for England ...")
		for city in pEngland:Cities() do
			if city:IsHasBuilding(ALLIEDCITY) then city:SetNumRealBuilding(ALLIEDCITY, 0) end
			if city:IsHasBuilding(AXISCITY) then city:SetNumRealBuilding(AXISCITY, 0) end
			if city:IsHasBuilding(COMINTERNCITY) then city:SetNumRealBuilding(COMINTERNCITY, 0) end
			if city:IsHasBuilding(NODRAFT) then city:SetNumRealBuilding(NODRAFT, 0) end
			if city:IsHasBuilding(LIMITEDDRAFT) then city:SetNumRealBuilding(LIMITEDDRAFT, 0) end
		end
	end
end

function RemovebuildingsUSSR()
	local iUssr = GetPlayerIDFromCivID (USSR, false, true)
	local pUssr = Players[iUssr]
	if not IsNeutral(iUssr) then
		Dprint("- Attempting to Run Remove Buildings Script for USSR ...")
		for city in pUssr:Cities() do
			if city:IsHasBuilding(ALLIEDCITY) then city:SetNumRealBuilding(ALLIEDCITY, 0) end
			if city:IsHasBuilding(AXISCITY) then city:SetNumRealBuilding(AXISCITY, 0) end
			if city:IsHasBuilding(COMINTERNCITY) then city:SetNumRealBuilding(COMINTERNCITY, 0) end
			if city:IsHasBuilding(NODRAFT) then city:SetNumRealBuilding(NODRAFT, 0) end
			if city:IsHasBuilding(LIMITEDDRAFT) then city:SetNumRealBuilding(LIMITEDDRAFT, 0) end
		end
	end
end

function RemovebuildingsChina()
	local iChina = GetPlayerIDFromCivID (CHINA, false, true)
	local pChina = Players[iChina]
	if not IsNeutral(iChina) then
		Dprint("- Attempting to Run Remove Buildings Script for China ...")
		for city in pChina:Cities() do
			if city:IsHasBuilding(ALLIEDCITY) then city:SetNumRealBuilding(ALLIEDCITY, 0) end
			if city:IsHasBuilding(AXISCITY) then city:SetNumRealBuilding(AXISCITY, 0) end
			if city:IsHasBuilding(COMINTERNCITY) then city:SetNumRealBuilding(COMINTERNCITY, 0) end
			if city:IsHasBuilding(NODRAFT) then city:SetNumRealBuilding(NODRAFT, 0) end
			if city:IsHasBuilding(LIMITEDDRAFT) then city:SetNumRealBuilding(LIMITEDDRAFT, 0) end
		end
	end
end

function RemovebuildingsAmerica()
	local iAmerica = GetPlayerIDFromCivID (AMERICA, false, true)
	local pAmerica = Players[iAmerica]
	if not IsNeutral(iAmerica) then
		Dprint("- Attempting to Run Remove Buildings Script for America ...")
		for city in pAmerica:Cities() do
			if city:IsHasBuilding(ALLIEDCITY) then city:SetNumRealBuilding(ALLIEDCITY, 0) end
			if city:IsHasBuilding(AXISCITY) then city:SetNumRealBuilding(AXISCITY, 0) end
			if city:IsHasBuilding(COMINTERNCITY) then city:SetNumRealBuilding(COMINTERNCITY, 0) end
			if city:IsHasBuilding(NODRAFT) then city:SetNumRealBuilding(NODRAFT, 0) end
			if city:IsHasBuilding(LIMITEDDRAFT) then city:SetNumRealBuilding(LIMITEDDRAFT, 0) end
		end
	end
end

function RemovebuildingsItaly()
	local iItaly = GetPlayerIDFromCivID (ITALY, false, true)
	local pItaly = Players[iItaly]
	if not IsNeutral(iItaly) then
		Dprint("- Attempting to Run Remove Buildings Script for Italy ...")
		for city in pItaly:Cities() do
			if city:IsHasBuilding(ALLIEDCITY) then city:SetNumRealBuilding(ALLIEDCITY, 0) end
			if city:IsHasBuilding(AXISCITY) then city:SetNumRealBuilding(AXISCITY, 0) end
			if city:IsHasBuilding(COMINTERNCITY) then city:SetNumRealBuilding(COMINTERNCITY, 0) end
			if city:IsHasBuilding(NODRAFT) then city:SetNumRealBuilding(NODRAFT, 0) end
			if city:IsHasBuilding(LIMITEDDRAFT) then city:SetNumRealBuilding(LIMITEDDRAFT, 0) end
		end
	end
end

function RemovebuildingsJapan()
	local iJapan = GetPlayerIDFromCivID (JAPAN, false, true)
	local pJapan = Players[iJapan]
	if not IsNeutral(iJapan) then
		Dprint("- Attempting to Run Remove Buildings Script for Italy ...")
		for city in pJapan:Cities() do
			if city:IsHasBuilding(ALLIEDCITY) then city:SetNumRealBuilding(ALLIEDCITY, 0) end
			if city:IsHasBuilding(AXISCITY) then city:SetNumRealBuilding(AXISCITY, 0) end
			if city:IsHasBuilding(COMINTERNCITY) then city:SetNumRealBuilding(COMINTERNCITY, 0) end
			if city:IsHasBuilding(NODRAFT) then city:SetNumRealBuilding(NODRAFT, 0) end
			if city:IsHasBuilding(LIMITEDDRAFT) then city:SetNumRealBuilding(LIMITEDDRAFT, 0) end
		end
	end
end

function RemovebuildingsGreece()
	local iGreece = GetPlayerIDFromCivID (GREECE, false, true)
	local pGreece = Players[iGreece]
	if not IsNeutral(iGreece) then
		Dprint("- Attempting to Run Remove Buildings Script for Greece ...")
		for city in pGreece:Cities() do
			if city:IsHasBuilding(ALLIEDCITY) then city:SetNumRealBuilding(ALLIEDCITY, 0) end
			if city:IsHasBuilding(AXISCITY) then city:SetNumRealBuilding(AXISCITY, 0) end
			if city:IsHasBuilding(COMINTERNCITY) then city:SetNumRealBuilding(COMINTERNCITY, 0) end
			if city:IsHasBuilding(NODRAFT) then city:SetNumRealBuilding(NODRAFT, 0) end
			if city:IsHasBuilding(LIMITEDDRAFT) then city:SetNumRealBuilding(LIMITEDDRAFT, 0) end
		end
	end
end

----------------------------------------------------------------------------------------------------------------------------
-- Convoy routes
----------------------------------------------------------------------------------------------------------------------------

-- first define the condition and transport functions that will be stocked in the g_Convoy table... 
function IsRouteOpenUStoFrance()
	local bDebug = false
	Dprint("   - Checking possible maritime route from US to France", bDebug)
	local turn = Game.GetGameTurn()
	if g_Calendar[turn] then 
		turnDate = g_Calendar[turn].Number
	 else 
		turnDate = 0
	end
--	if turnDate < 194000101 then
	if turnDate < 0 then -- testing
		return false
	end
	local open = false
	local destinationList = g_Convoy[US_TO_FRANCE].DestinationList
	for i, destination in ipairs(destinationList) do -- the convoy spawning function do almost the same test, may be removed ?
		local plot = GetPlot (destination.X, destination.Y )
		Dprint("      - Testing plot at : " .. destination.X .. "," .. destination.Y , bDebug)
		if plot:IsCity() then
			local city = plot:GetPlotCity()
			Dprint("      - Plot is city...", bDebug)
			if city:GetOwner() == GetPlayerIDFromCivID( FRANCE, false ) and not city:IsBlockaded() then
				Dprint("      - " .. city:GetName() .. " is owned by france and not blockaded !", bDebug)
				open = true
			end
		end
	end
	return open
end
function IsSuezAlly()
	local suezPlot = GetPlot(38,14) -- Suez
	if suezPlot:GetOwner() == GetPlayerIDFromCivID (ENGLAND, false, true) then
		return true
	else
		return false
	end
end
function IsHongKongAlly()
	local hkPlot = GetPlot(83,13) -- Hong Kong
	if hkPlot:GetOwner() == GetPlayerIDFromCivID (ENGLAND, false, true) then
		return true
	else
		return false
	end
end
function IsShanghaiAlly()
	local shanghaiPlot = GetPlot(88,24) -- Shanghai
	if shanghaiPlot:GetOwner() == GetPlayerIDFromCivID (CHINA, false, true) then
		return true
	else
		return false
	end
end
function IsPanamaAlly()
	local panamaPlot = GetPlot(151,8) -- Panama
	if panamaPlot:GetOwner() == GetPlayerIDFromCivID (AMERICA, false, true) then
		return true
	else
		return false
	end
end
function IsSaigonAlly()
	local saigonPlot = GetPlot(79,7) -- Saigon
	if saigonPlot:GetOwner() == GetPlayerIDFromCivID (FRANCE, false, true) then
		return true
	else
		return false
	end
end
function IsSingaporeAlly()
	local singaporePlot = GetPlot(77,1) -- Singapore
	if singaporePlot:GetOwner() == GetPlayerIDFromCivID (ENGLAND, false, true) then
		return true
	else
		return false
	end
end
function IsSingaporeOccupied()
	local singaporePlot = GetPlot(77,1) -- Singapore
	if singaporePlot:GetOwner() == GetPlayerIDFromCivID (ENGLAND, false, true) then
		return false
	else
		return true
	end
end
function IsSuezOccupied()
	local suezPlot = GetPlot(38,14) -- Suez
	if suezPlot:GetOwner() == GetPlayerIDFromCivID (ENGLAND, false, true) then
		return false
	else
		return true
	end
end

function IsRailOpenSueztoStalingrad()
	local plotSuez = GetPlot(38,14)
	local plotStalingrad = GetPlot(41,35)
	local ussr = Players[GetPlayerIDFromCivID(USSR, false)]
	
	return isPlotConnected( ussr , plotSuez, plotStalingrad, "Road", false, nil , PathBlocked)
	
end

function IsRouteOpenLendLease()
	local bDebug = false
	Dprint("   - Checking possible maritime route from US to France", bDebug)
	local turn = Game.GetGameTurn()
	if g_Calendar[turn] then 
		turnDate = g_Calendar[turn].Number
	 else 
		turnDate = 0
	end
	if turnDate < 19410320 then
		return false
	else
		return true
	end
end

function IsRouteOpentoFinlandtoGermany()


	local bDebug = true

	local month = TurnToMonth()
	if month > 10 or month < 4 then
		return false -- assume North of Baltic Sea is frozen from November to Mars
	else
		return true
	end
	Dprint("     - Baltic Sea is not frozen...", bDebug)

end

function IsRouteOpenNorwaytoGermany()


	local bDebug = true

	local month = TurnToMonth()
	if month > 10 or month < 4 then
		return false -- assume North of Baltic Sea is frozen from November to Mars
	else
		return true
	end
	Dprint("     - Baltic Sea is not frozen...", bDebug)

end

function IsRouteOpenSwedentoGermany()


	local bDebug = true

	local month = TurnToMonth()
	if month > 10 or month < 4 then
		return false -- assume North of Baltic Sea is frozen from November to Mars
	else
		return true
	end
	Dprint("     - Baltic Sea is not frozen...", bDebug)
	
end


-----------------------------------------
-- French Convoys
-----------------------------------------
function GetUStoFranceTransport()
	local rand = math.random( 1, 4 ) -- a simple way for making diverse convoy type for test purpose.
	local transport
	if rand == 1 then
		transport = {Type = TRANSPORT_MATERIEL, Reference = 375} -- Reference is quantity of materiel, personnel or gold. For TRANSPORT_UNIT, Reference is the unit type ID
	elseif rand == 2 then 
		transport = {Type = TRANSPORT_PERSONNEL, Reference = 125}
	elseif rand == 3 then 
		transport = {Type = TRANSPORT_UNIT, Reference = FR_HAWK75}
	elseif rand == 4 then 
		transport = {Type = TRANSPORT_GOLD, Reference = 250}
	end
	
	return transport
end
function GetSaigontoFranceTransport()
	local rand = math.random( 1, 4 )
	local transport
	if rand == 1 then
		transport = {Type = TRANSPORT_MATERIEL, Reference = 400} 
	elseif rand == 2 then 
		transport = {Type = TRANSPORT_PERSONNEL, Reference = 500}
	elseif rand == 3 then 
		transport = {Type = TRANSPORT_UNIT, Reference = FR_INFANTRY}
	elseif rand == 4 then 
		transport = {Type = TRANSPORT_GOLD, Reference = 700}
	end
	
	return transport
end
-----------------------------------------
-- British Convoys
-----------------------------------------
function GetUStoUKTransport()
	local rand = math.random( 1, 3 )
	local transport
	if rand == 1 then
		transport = {Type = TRANSPORT_MATERIEL, Reference = 600} 
	elseif rand == 2 then 
		transport = {Type = TRANSPORT_PERSONNEL, Reference = 300}
	elseif rand == 3 then 
		transport = {Type = TRANSPORT_GOLD, Reference = 300}
	end
	
	return transport
end
function GetBombaytoUKTransport()
	local rand = math.random( 1, 4 )
	local transport
	if rand == 1 then
		transport = {Type = TRANSPORT_MATERIEL, Reference = 400} 
	elseif rand == 2 then 
		transport = {Type = TRANSPORT_PERSONNEL, Reference = 500}
	elseif rand == 3 then 
		transport = {Type = TRANSPORT_UNIT, Reference = UK_INFANTRY}
	elseif rand == 4 then 
		transport = {Type = TRANSPORT_GOLD, Reference = 700}
	end
	
	return transport
end
function GetHongKongtoUKTransport()
	local transport = {Type = TRANSPORT_GOLD, Reference = 650}
	return transport
end
function GetSingaporetoUKTransport()
	local transport = {Type = TRANSPORT_GOLD, Reference = 650}
	return transport
end
function GetAustraliatoUKTransport()
	local rand = math.random( 1, 4 )
	local transport
	if rand == 1 then
		transport = {Type = TRANSPORT_MATERIEL, Reference = 350} 
	elseif rand == 2 then 
		transport = {Type = TRANSPORT_PERSONNEL, Reference = 500}
	elseif rand == 3 then 
		transport = {Type = TRANSPORT_UNIT, Reference = UK_INFANTRY}
	elseif rand == 4 then 
		transport = {Type = TRANSPORT_GOLD, Reference = 600}
	end
	
	return transport
end
function GetCanadatoUKTransport()
	local rand = math.random( 1, 2 )
	local transport
	if rand == 1 then
		transport = {Type = TRANSPORT_PERSONNEL, Reference = 300}
	elseif rand == 2 then 
		transport = {Type = TRANSPORT_UNIT, Reference = UK_INFANTRY}
	end
	
	return transport
end
-----------------------------------------
-- American Convoys
-----------------------------------------
function GetBraziltoUSTransport()
	local rand = math.random( 1, 2 )
	local transport
	if rand == 1 then
		transport = {Type = TRANSPORT_MATERIEL, Reference = 150} 
	elseif rand == 2 then 
		transport = {Type = TRANSPORT_GOLD, Reference = 200}
	end
	
	return transport
end
function GetPanamatoUSTransport()
	local rand = math.random( 1, 2 )
	local transport
	if rand == 1 then
		transport = {Type = TRANSPORT_MATERIEL, Reference = 150} 
	elseif rand == 2 then 
		transport = {Type = TRANSPORT_GOLD, Reference = 250}
	end
	
	return transport
end
function GetAustraliatoUSTransport()
	local rand = math.random( 1, 2 )
	local transport
	if rand == 1 then
		transport = {Type = TRANSPORT_MATERIEL, Reference = 200} 
	elseif rand == 2 then 
		transport = {Type = TRANSPORT_GOLD, Reference = 250}
	end
	
	return transport
end
function GetHongKongtoUSTransport()
	local transport = {Type = TRANSPORT_GOLD, Reference = 400}
	return transport
end
-----------------------------------------
-- German Convoys
-----------------------------------------
function GetFinlandtoGermanyTransport()
	local transport = {Type = TRANSPORT_MATERIEL, Reference = 75}
	return transport
end
function GetNorwaytoGermanyTransport()
	local transport = {Type = TRANSPORT_MATERIEL, Reference = 110}
	return transport
end
-----------------------------------------
-- Soviet Convoys
-----------------------------------------
function GetUSWESTtoUSSRTransport()
	local rand = math.random( 1, 2 )
	local transport
	if rand == 1 then
		transport = {Type = TRANSPORT_MATERIEL, Reference = 400} 
	elseif rand == 2 then 
		transport = {Type = TRANSPORT_GOLD, Reference = 275}
	end
	
	return transport
end
function GetUStoUSSRTransport()
	local rand = math.random( 1, 2 )
	local transport
	if rand == 1 then
		transport = {Type = TRANSPORT_MATERIEL, Reference = 700} 
	elseif rand == 2 then 
		transport = {Type = TRANSPORT_GOLD, Reference = 325}
	end	
	return transport
end
-----------------------------------------
-- Japan Convoys
-----------------------------------------

function GetJakartatoJapanTransport()
	local rand = math.random( 1, 2 )
	local transport
	if rand == 1 then
		transport = {Type = TRANSPORT_MATERIEL, Reference = 675} 
	elseif rand == 2 then 
		transport = {Type = TRANSPORT_GOLD, Reference = 350}
	end	
	return transport
end
function GetSingaporetoJapanTransport()
	local rand = math.random( 1, 2 )
	local transport
	if rand == 1 then
		transport = {Type = TRANSPORT_MATERIEL, Reference = 675} 
	elseif rand == 2 then 
		transport = {Type = TRANSPORT_GOLD, Reference = 350}
	end	
	return transport
end
-----------------------------------------
-- Chinese Convoys
-----------------------------------------

function GetUStoChinaTransport()
	local rand = math.random( 1, 2 )
	local transport
	if rand == 1 then
		transport = {Type = TRANSPORT_MATERIEL, Reference = 550} 
	elseif rand == 2 then 
		transport = {Type = TRANSPORT_GOLD, Reference = 325}
	elseif rand == 3 then 
		transport = {Type = TRANSPORT_UNIT, Reference = CH_P40N}
	end	
	return transport
end
-- ... then define the convoys table
-- don't move those define from this files, they must be set AFTER the functions definition...

-- Route list
US_TO_FRANCE = 1
US_TO_FRANCE_2 = 2
US_TO_UK = 3
US_TO_UK_2 = 4
US_TO_UK_3 = 5
FINLAND_TO_GERMANY = 6
BOMBAY_TO_UK = 7
HONGKONG_TO_UK = 8
SAIGON_TO_FRANCE = 9
NORWAY_TO_GERMANY = 10
SWEDEN_TO_GERMANY = 11
PANAMA_TO_US = 12
AUSTRALIA_TO_US = 13
BRAZIL_TO_US = 14
US_TO_CHINA = 15
USWEST_TO_USSR = 16
USWEST_TO_USSR_2 = 17
CANADA_TO_UK = 18
SINGAPORE_TO_UK = 19
SINGAPORE_TO_JAPAN = 20

-- Convoy table
g_Convoy = { 
	[US_TO_FRANCE] = {
		Name = "US to France",
		SpawnList = { {X=158, Y=32}, {X=157, Y=30}, {X=159, Y=33}, {X=160, Y=34}, }, -- Adjacent New York, Washington and Boston
		RandomSpawn = true, -- true : random choice in spawn list
		DestinationList = { {X=7, Y=35}, {X=15, Y=27}, }, -- Brest, Marseille
		RandomDestination = false, -- false : sequential try in destination list
		CivID = FRANCE,
		MaxFleet = 1, -- how many convoy can use that route at the same time (not implemented)
		Frequency = 15, -- probability (in percent) of convoy spawning at each turn
		Condition = IsRouteOpenUStoFrance, -- Must refer to a function, remove this line to use the default condition (true)
		UnloadCondition = function() return true; end, -- Must refer to a function, remove this line to use the default condition (true)
		Transport = GetUStoFranceTransport, -- Must refer to a function, remove this line to use the default function
	},
	[US_TO_FRANCE_2] = {
		Name = "US to France",
		SpawnList = { {X=158, Y=32}, {X=157, Y=30}, {X=159, Y=33}, {X=160, Y=34}, }, -- Adjacent New York, Washington and Boston
		RandomSpawn = true, -- true : random choice in spawn list
		DestinationList = { {X=7, Y=35}, {X=15, Y=27}, }, -- Brest, Marseille
		RandomDestination = false, -- false : sequential try in destination list
		CivID = FRANCE,
		MaxFleet = 1, -- how many convoy can use that route at the same time (not implemented)
		Frequency = 10, -- probability (in percent) of convoy spawning at each turn
		Condition = IsRouteOpenLendLease, -- Must refer to a function, remove this line to use the default condition (true)
		--UnloadCondition = function() return true; end, -- Must refer to a function, remove this line to use the default condition (true)
		Transport = GetUStoFranceTransport, -- Must refer to a function, remove this line to use the default function
	},
	[US_TO_UK] = {
		Name = "US to UK",
		SpawnList = { {X=158, Y=32}, {X=157, Y=30}, {X=159, Y=33}, {X=160, Y=34}, }, -- Adjacent New York, Washington and Boston
		RandomSpawn = true, -- true : random choice in spawn list
		DestinationList = { {X=9, Y=42}, {X=10, Y=45}, {X=11, Y=39}, }, -- Manchester, Edinburgh, London
		RandomDestination = false, -- false : sequential try in destination list
		CivID = ENGLAND,
		MaxFleet = 1,
		Frequency = 25, -- probability (in percent) of convoy spawning at each turn
		-- Condition = IsRouteOpenUStoUK, -- no special condition here, let the spawning function do the job...
		Transport = GetUStoUKTransport,
	},
	[US_TO_UK_2] = {
		Name = "US to UK",
		SpawnList = { {X=158, Y=32}, {X=157, Y=30}, {X=159, Y=33}, {X=160, Y=34}, }, -- Adjacent New York, Washington and Boston
		RandomSpawn = true, -- true : random choice in spawn list
		DestinationList = { {X=9, Y=42}, {X=10, Y=45}, {X=11, Y=39}, }, -- Manchester, Edinburgh, London
		RandomDestination = false, -- false : sequential try in destination list
		CivID = ENGLAND,
		MaxFleet = 1,
		Frequency = 40, -- probability (in percent) of convoy spawning at each turn
		Condition = IsRouteOpenLendLease, 
		Transport = GetUStoUKTransport,
	},
	[US_TO_UK_3] = {
		Name = "US to UK",
		SpawnList = { {X=158, Y=32}, {X=157, Y=30}, {X=159, Y=33}, {X=160, Y=34}, }, -- Adjacent New York, Washington and Boston
		RandomSpawn = true, -- true : random choice in spawn list
		DestinationList = { {X=9, Y=42}, {X=10, Y=45}, {X=11, Y=39}, }, -- Manchester, Edinburgh, London
		RandomDestination = false, -- false : sequential try in destination list
		CivID = ENGLAND,
		MaxFleet = 1,
		Frequency = 15, -- probability (in percent) of convoy spawning at each turn
		Condition = IsRouteOpenLendLease, 
		Transport = GetUStoUKTransport,
	},
	[FINLAND_TO_GERMANY] = {
		Name = "Finland to Germany",
		SpawnList = { {X=28, Y=49}, }, -- adjacent to Oulu
		RandomSpawn = false,
		DestinationList = { {X=19, Y=40}, }, -- Hamburg
		RandomDestination = false,
		CivID = GERMANY,
		MaxFleet = 1, 
		Frequency = 35,
		Condition = IsRouteOpenFinlandtoGermany,
		Transport = GetFinlandtoGermanyTransport,
	},
	[BOMBAY_TO_UK] = {
		Name = "Bombay to UK",
		SpawnList = { {X=57, Y=10}, {X=57, Y=9}, }, -- Adjacent to Bombay
		RandomSpawn = false, -- true : random choice in spawn list
		DestinationList = { {X=9, Y=42}, {X=10, Y=45}, {X=11, Y=39}, }, -- Manchester, Edinburgh, London
		RandomDestination = false, -- false : sequential try in destination list
		CivID = ENGLAND,
		MaxFleet = 1,
		Frequency = 25, -- probability (in percent) of convoy spawning at each turn
		Condition = IsSuezAlly,
		Transport = GetBombaytoUKTransport,
	},
	[HONGKONG_TO_UK] = {
		Name = "Hong Kong to UK",
		SpawnList = { {X=83, Y=12}, {X=84, Y=12}, {X=84, Y=13}, }, -- Adjacent to Hong Kong
		RandomSpawn = false, -- true : random choice in spawn list
		DestinationList = { {X=9, Y=42}, {X=10, Y=45}, {X=11, Y=39}, }, -- Manchester, Edinburgh, London
		RandomDestination = false, -- false : sequential try in destination list
		CivID = ENGLAND,
		MaxFleet = 1,
		Frequency = 15, -- probability (in percent) of convoy spawning at each turn
		Condition = IsHongKongAlly,  IsSuezAlly,
		Transport = GetHongKongtoUKTransport,
	},
	[SAIGON_TO_FRANCE] = {
		Name = "Saigon to France",
		SpawnList = { {X=80, Y=7}, {X=80, Y=6}, }, -- Adjacent to Saigon
		RandomSpawn = false, -- true : random choice in spawn list
		DestinationList = { {X=15, Y=27}, }, -- Marseille
		RandomDestination = false, -- false : sequential try in destination list
		CivID = FRANCE,
		MaxFleet = 1,
		Frequency = 20, -- probability (in percent) of convoy spawning at each turn
		Condition = IsSaigonAlly,  IsSuezAlly,
		Transport = GetSaigontoFranceTransport,
	},
	[NORWAY_TO_GERMANY] = {
		Name = "Norway to Germany",
		SpawnList = { {X=17, Y=49}, }, -- adjacent to Narvik
		RandomSpawn = false,
		DestinationList = { {X=19, Y=40}, }, -- Hamburg
		RandomDestination = false,
		CivID = GERMANY,
		MaxFleet = 1, 
		Frequency = 60,
		Condition = IsRouteOpenNorwaytoGermany,
		Transport = GetNorwaytoGermanyTransport,
	},
	[SWEDEN_TO_GERMANY] = {
		Name = "Sweden to Germany",
		SpawnList = { {X=26, Y=49}, }, -- adjacent to Lulea
		RandomSpawn = false,
		DestinationList = { {X=19, Y=40}, }, -- Hamburg
		RandomDestination = false,
		CivID = GERMANY,
		MaxFleet = 1, 
		Frequency = 35,
		Condition = IsRouteOpenSwedentoGermany, 
		Transport = GetFinlandtoGermanyTransport, -- re-use Finland values...
	},
	[PANAMA_TO_US] = {
		Name = "Panama to America",
		SpawnList = { {X=151, Y=9}, }, -- Adjacent to Panama
		RandomSpawn = false, -- true : random choice in spawn list
		DestinationList = { {X=157, Y=33}, }, -- New York
		RandomDestination = false, -- false : sequential try in destination list
		CivID = AMERICA,
		MaxFleet = 1,
		Frequency = 15, -- probability (in percent) of convoy spawning at each turn
		Condition = IsPanamaAlly,
		Transport = GetPanamatoUSTransport,
	},
	[AUSTRALIA_TO_US] = {
		Name = "Australia to America",
		SpawnList = { {X=127, Y=0}, }, -- Adjacent to Sydney
		RandomSpawn = false, -- true : random choice in spawn list
		DestinationList = { {X=157, Y=33}, }, -- New York
		RandomDestination = false, -- false : sequential try in destination list
		CivID = AMERICA,
		MaxFleet = 1,
		Frequency = 10, -- probability (in percent) of convoy spawning at each turn
		--Condition = IsSydneyAlly,
		Transport = GetAustraliatoUSTransport,
	},
	[BRAZIL_TO_US] = {
		Name = "Brazil to America",
		SpawnList = { {X=170, Y=2}, }, --Adjacent to Fortaleza
		RandomSpawn = false, -- true : random choice in spawn list
		DestinationList = { {X=157, Y=33}, }, -- New York
		RandomDestination = false, -- false : sequential try in destination list
		CivID = AMERICA,
		MaxFleet = 1,
		Frequency = 10, -- probability (in percent) of convoy spawning at each turn
		--Condition = IsFortalezaAlly,
		Transport = GetBraziltoUSTransport,
	},
	[US_TO_CHINA] = {
		Name = "America to China",
		SpawnList = { {X=131, Y=27}, {X=131, Y=26}, }, --Adjacent to Los Angeles
		RandomSpawn = false, -- true : random choice in spawn list
		DestinationList = { {X=88, Y=24}, }, -- Shanghai
		RandomDestination = false, -- false : sequential try in destination list
		CivID = CHINA,
		MaxFleet = 1,
		Frequency = 20, -- probability (in percent) of convoy spawning at each turn
		Condition = IsShanghaiAlly,
		Transport = GetUStoChinaTransport,
	},
	[USWEST_TO_USSR] = {
		Name = "US to USSR West",
		SpawnList = { {X=118, Y=47}, {X=123, Y=45}, }, -- Adjacent to Anchorage and Juneau
		RandomSpawn = true, -- true : random choice in spawn list
		DestinationList = { {X=102, Y=44}, }, -- Petropavolisk
		RandomDestination = false, -- false : sequential try in destination list
		CivID = USSR,
		MaxFleet = 1,
		Frequency = 15, -- probability (in percent) of convoy spawning at each turn
		--Condition = IsRailOpenMurmansktoMoscow,
		--UnloadCondition = IsRailOpenMurmansktoMoscow,
		Transport = GetUSWESTtoUSSRTransport,
	},
	[USWEST_TO_USSR_2] = {
		Name = "US to USSR West",
		SpawnList = { {X=118, Y=47}, {X=123, Y=45}, }, -- Adjacent to Anchorage and Juneau
		RandomSpawn = true, -- true : random choice in spawn list
		DestinationList = { {X=102, Y=44}, }, -- Petropavolisk
		RandomDestination = false, -- false : sequential try in destination list
		CivID = USSR,
		MaxFleet = 1,
		Frequency = 30, -- probability (in percent) of convoy spawning at each turn
		Condition = IsRouteOpenLendLease,
		Transport = GetUSWESTtoUSSRTransport,
	},
	[CANADA_TO_UK] = {
		Name = "Canada to UK",
		SpawnList = { {X=157, Y=38}, }, -- Adjacent to Quebec City
		RandomSpawn = true, -- true : random choice in spawn list
		DestinationList = { {X=9, Y=42}, {X=10, Y=45}, {X=11, Y=39}, }, -- Manchester, Edinburgh, London
		RandomDestination = false, -- false : sequential try in destination list
		CivID = ENGLAND,
		MaxFleet = 1,
		Frequency = 12, -- probability (in percent) of convoy spawning at each turn
		-- Condition = IsRouteOpenUStoUK, -- no special condition here, let the spawning function do the job...
		Transport = GetCanadatoUKTransport,
	},
	[SINGAPORE_TO_UK] = {
		Name = "Singapore to UK",
		SpawnList = { {X=77, Y=0}, }, -- Adjacent to Singapore
		RandomSpawn = true, -- true : random choice in spawn list
		DestinationList = { {X=9, Y=42}, {X=10, Y=45}, {X=11, Y=39}, }, -- Manchester, Edinburgh, London
		RandomDestination = false, -- false : sequential try in destination list
		CivID = ENGLAND,
		MaxFleet = 1,
		Frequency = 15, -- probability (in percent) of convoy spawning at each turn
		Condition = IsSingaporeAlly,
		Transport = GetSingaporetoUKTransport,
	},
	[SINGAPORE_TO_JAPAN] = {
		Name = "Singapore to Japan",
		SpawnList = { {X=78, Y=1}, {X=78, Y=0}, }, -- Adjacent to Singapore
		RandomSpawn = false, -- true : random choice in spawn list
		DestinationList = { {X=90, Y=23}, {X=94, Y=25}, {X=97, Y=26}, }, -- Nagasaki, Osaka, Tokyo
		RandomDestination = false, -- false : sequential try in destination list
		CivID = JAPAN,
		MaxFleet = 1,
		Frequency = 25, -- probability (in percent) of convoy spawning at each turn
		Condition = IsSingaporeOccupied,
		Transport = GetSingaporetoJapanTransport,
	},
}

-----------------------------------------
-- Japan
-----------------------------------------

function JapanIsSafe()
	local iJapan = GetPlayerIDFromCivID (JAPAN, false, true)
	local safe = true
	for x = 92, 99, 1 do
		for y = 21, 41, 1 do
			local plotKey = x..","..y
			local plot = GetPlot(x,y)
			if GetPlotFirstOwner(plotKey) == iJapan and plot:GetOwner() ~= iJapan then -- one of Germany plot has been conquered
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
	for x = 17, 28, 1 do
		for y = 31, 40, 1 do
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
-- Troops Naval routes
----------------------------------------------------------------------------------------------------------------------------

function JapanReinforcementToChina()

	local bDebug = true
	
	Dprint ("  - Japan is Checking to sent reinforcement troops to China", bDebug)

	if not JapanIsSafe() then
		Dprint ("   - but Japan is invaded, got priority...", bDebug)
		return false
	end

	local iChina = GetPlayerIDFromCivID (CHINA, false, true)
	local pChina = Players[iChina]

	local iJapan = GetPlayerIDFromCivID (JAPAN, false, true)
	local pJapan = Players[iJapan]


	if not AreAtWar( iJapan, iChina) then	
		Dprint ("   - but Japan has not declared war to China...", bDebug)
		return false
	end

	return true
end

function GermanyReinforcementToDenmark()

	local bDebug = true
	
	Dprint ("  - Germany is Checking to sent reinforcement troops to Denmark", bDebug)

	if not GermanyIsSafe() then
		Dprint ("   - but Germany is invaded, got priority...", bDebug)
		return false
	end

	local iDenmark = GetPlayerIDFromCivID (DENMARK, true, true)
	local pDenmark = Players[iDenmark]

	local iGermany = GetPlayerIDFromCivID (GERMANY, false, true)
	local pGermany = Players[iGermany]


	if not AreAtWar( iGermany, iDenmark) then	
		Dprint ("   - but Germany has not declared war on Denmark...", bDebug)
		return false
	end

	return true
end

-- troops route list
TROOPS_JAPAN_CHINA = 1
TROOPS_JAPAN_CHINA_2 = 2
TROOPS_JAPAN_CHINA_3 = 3
TROOPS_INVADE_CHINA_1 = 4
TROOPS_INVADE_CHINA_2 = 5
TROOPS_INVADE_GUAM = 6
TROOPS_INVADE_WAKE = 7
TROOPS_INVADE_TARAWA = 8
TROOPS_INVADE_PHILIPPINES = 9
TROOPS_INVADE_SINGAPORE = 10
TROOPS_GERMANY_DENMARK = 11
TROOPS_GERMANY_AFRICA = 22
TROOPS_LIBERATE_CASABLANCA = 13
TROOPS_LIBERATE_ORAN = 14
TROOPS_LIBERATE_ALGIERS = 15
TROOPS_LIBERATE_ALGIERSBRITISH = 16

-- troops route table

g_TroopsRoutes = { 
	[JAPAN] = {	
			[TROOPS_JAPAN_CHINA] = {
				Name = "Japan to China",
				CentralPlot = {X=97, Y=26},
				MaxDistanceFromCentral = 5,
				ReserveUnits = 2, -- minimum unit to keep in this area (ie : do not send those elsewhere)
				EmbarkList = { {X=90, Y=24}, {X=89, Y=23}, }, -- near Nagasaki
				RandomEmbark = false, -- true : random choice in spawn list
				WaypointList = nil, -- waypoints
				RandomWaypoint = false, -- true : random choice in waypoint list (use 1 random waypoint), else use sequential waypoint movement.
				LandingList = { {X=86, Y=25}, {X=87, Y=24}, {X=87, Y=23}, {X=88, Y=24}, }, -- near Shanghai
				RandomLanding = true, -- false : sequential try in landing list
				MinUnits = 3,
				MaxUnits = 6, -- Maximum number of units on the route at the same time
				Priority = 50, 
				Condition = JapanReinforcementToChina, -- Must refer to a function, remove this line to use the default condition (true)
			},
			[TROOPS_JAPAN_CHINA_2] = {
				Name = "Japan to China (North)",
				CentralPlot = {X=91, Y=33},
				MaxDistanceFromCentral = 5,
				ReserveUnits = 4, -- minimum unit to keep in this area (ie : do not send those elsewhere)
				EmbarkList = { {X=88, Y=32}, {X=89, Y=28}, }, -- near Pyongyang and Seoul
				RandomEmbark = false, -- true : random choice in spawn list
				WaypointList = nil,
				RandomWaypoint = false, -- true : random choice in waypoint list (use 1 random waypoint), else use sequential waypoint movement.
				LandingList = { {X=83, Y=29}, {X=84, Y=30}, {X=83, Y=62}, {X=86, Y=30}, {X=86, Y=29}, {X=82, Y=63}, }, -- near Zibo
				RandomLanding = true, -- false : sequential try in landing list
				MinUnits = 3,
				MaxUnits = 6, -- Maximum number of units on the route at the same time
				Priority = 50, 
				Condition = JapanReinforcementToChina, -- Must refer to a function, remove this line to use the default condition (true)
			},
			[TROOPS_JAPAN_CHINA_3] = {
				Name = "Japan to China (South)",
				CentralPlot = {X=97, Y=31},
				MaxDistanceFromCentral = 5,
				ReserveUnits = 2, -- minimum unit to keep in this area (ie : do not send those elsewhere)
				EmbarkList = { {X=94, Y=24}, {X=97, Y=25}, }, -- near Osaka and Tokyo
				RandomEmbark = false, -- true : random choice in spawn list
				WaypointList = nil, -- waypoints
				RandomWaypoint = false, -- true : random choice in waypoint list (use 1 random waypoint), else use sequential waypoint movement.
				LandingList = { {X=86, Y=25}, {X=87, Y=24}, {X=87, Y=23}, {X=88, Y=24}, }, -- near Shanghai
				RandomLanding = true, -- false : sequential try in landing list
				MinUnits = 2,
				MaxUnits = 6, -- Maximum number of units on the route at the same time
				Priority = 50, 
				Condition = JapanReinforcementToChina, -- Must refer to a function, remove this line to use the default condition (true)
			},
			[TROOPS_INVADE_CHINA_1] = {
				Name = "Japan to China",
				WaypointList = nil, -- waypoints
				RandomWaypoint = true, 
				LandingList = { {X=86, Y=25}, {X=87, Y=24}, {X=87, Y=23}, {X=88, Y=24}, },
				RandomLanding = true, -- false : sequential try in landing list
			},
			[TROOPS_INVADE_CHINA_2] = {
				Name = "Japan to China 2",
				WaypointList = nil, -- waypoints
				RandomWaypoint = true, 
				LandingList = { {X=82, Y=12}, {X=82, Y=13}, {X=84, Y=14}, {X=81, Y=13}, {X=82, Y=10}, {X=83, Y=10}, },
				RandomLanding = true, -- false : sequential try in landing list
			},
			[TROOPS_INVADE_GUAM] = {
				Name = "Japan to Guam",
				WaypointList = nil, -- waypoints
				RandomWaypoint = true, 
				LandingList = { {X=99, Y=11}, },
				RandomLanding = true, -- false : sequential try in landing list
			},
			[TROOPS_INVADE_WAKE] = {
				Name = "Japan to Wake",
				WaypointList = nil, -- waypoints
				RandomWaypoint = true, 
				LandingList = { {X=108, Y=20}, },
				RandomLanding = true, -- false : sequential try in landing list
			},
			[TROOPS_INVADE_TARAWA] = {
				Name = "Japan to Tarawa",
				WaypointList = nil, -- waypoints
				RandomWaypoint = true, 
				LandingList = { {X=113, Y=1}, },
				RandomLanding = true, -- false : sequential try in landing list
			},
			[TROOPS_INVADE_PHILIPPINES] = {
				Name = "Japan to Philippines",
				WaypointList = nil, -- waypoints
				RandomWaypoint = true, 
				LandingList = { {X=88, Y=19}, {X=88, Y=9}, {X=89, Y=8}, },
				RandomLanding = true, -- false : sequential try in landing list
			},
			[TROOPS_INVADE_SINGAPORE] = {
				Name = "Japan to Singapore",
				WaypointList = nil, -- waypoints
				RandomWaypoint = true, 
				LandingList = { {X=77, Y=1}, {X=77, Y=2}, {X=76, Y=1}, },
				RandomLanding = true, -- false : sequential try in landing list
			},
	},
	[GERMANY] = {	
			[TROOPS_GERMANY_DENMARK] = {
				Name = "Germany to Denmark",
				CentralPlot = {X=23, Y=38},
				MaxDistanceFromCentral = 3,
				ReserveUnits = 2, -- minimum unit to keep in this area (ie : do not send those elsewhere)
				EmbarkList = { {X=25, Y=41}, {X=26, Y=41}, }, -- near Danzig
				RandomEmbark = false, -- true : random choice in spawn list
				WaypointList = nil, -- waypoints
				RandomWaypoint = false, -- true : random choice in waypoint list (use 1 random waypoint), else use sequential waypoint movement.
				LandingList = { {X=24, Y=42}, {X=23, Y=42}, {X=23, Y=41}, }, -- near Copenhagen
				RandomLanding = true, -- false : sequential try in landing list
				MinUnits = 1,
				MaxUnits = 3, -- Maximum number of units on the route at the same time
				Priority = 50, 
				Condition = GermanyReinforcementToDenmark, -- Must refer to a function, remove this line to use the default condition (true)
			},
			[TROOPS_GERMANY_AFRICA] = {
				Name = "Germany to Africa",
				WaypointList = nil, -- waypoints
				RandomWaypoint = true, 
				LandingList = { {X=27, Y=15}, {X=27, Y=14}, {X=21, Y=13}, {X=22, Y=12}, },
				RandomLanding = true, -- false : sequential try in landing list
			},
	},
	[AMERICA] = {	
			[TROOPS_LIBERATE_CASABLANCA] = {
				Name = "America to Africa",
				WaypointList = nil, -- waypoints
				RandomWaypoint = true, 
				LandingList = { {X=4, Y=14}, {X=4, Y=15}, {X=3, Y=13}, },
				RandomLanding = true, -- false : sequential try in landing list
			},
			[TROOPS_LIBERATE_ORAN] = {
				Name = "America to Africa 2",
				WaypointList = nil, -- waypoints
				RandomWaypoint = true, 
				LandingList = { {X=10, Y=15}, {X=9, Y=15}, },
				RandomLanding = true, -- false : sequential try in landing list
			},
			[TROOPS_LIBERATE_ALGIERS] = {
				Name = "America to Africa 2",
				WaypointList = nil, -- waypoints
				RandomWaypoint = true, 
				LandingList = { {X=12, Y=17}, {X=12, Y=16}, {X=13, Y=17}, {X=14, Y=17}, },
				RandomLanding = true, -- false : sequential try in landing list
			},
	},
	[ENGLAND] = {	
			[TROOPS_LIBERATE_ALGIERSBRITISH] = {
				Name = "England to Africa",
				WaypointList = nil, -- waypoints
				RandomWaypoint = true, 
				LandingList = { {X=12, Y=17}, {X=12, Y=16}, {X=13, Y=17}, {X=14, Y=17}, },
				RandomLanding = true, -- false : sequential try in landing list
			},
	},
}

----------------------------------------------------------------------------------------------------------------------------
-- Military Projects
----------------------------------------------------------------------------------------------------------------------------


function IsJapanAtWarWithChina()
	local bDebug = false
	if not AreAtWar( GetPlayerIDFromCivID(JAPAN, false), GetPlayerIDFromCivID(CHINA, false)) then
		Dprint("      - Japan is not at war with China...", bDebug)
		return false
	end
	return true
end

function IsJapanAtWarWithAllies()
	local bDebug = false
	if not AreAtWar( GetPlayerIDFromCivID(JAPAN, false), GetPlayerIDFromCivID(ENGLAND, false)) then
		Dprint("      - Japan is not at war with the UK...", bDebug)
		return false
	end
	if not AreAtWar( GetPlayerIDFromCivID(JAPAN, false), GetPlayerIDFromCivID(AMERICA, false)) then
		Dprint("      - Japan is not at war with America...", bDebug)
		return false
	end
	return true
end

function IsGermanyAtWarWithND()
	local bDebug = false
	if not AreAtWar( GetPlayerIDFromCivID(GERMANY, false), GetPlayerIDFromCivID(DENMARK, true)) then
		Dprint("      - Germany is not at war with Denmark...", bDebug)
		return false
	end
	if not AreAtWar( GetPlayerIDFromCivID(GERMANY, false), GetPlayerIDFromCivID(NORWAY, true)) then
		Dprint("      - Germany is not at war with Norway...", bDebug)
		return false
	end
	return true
end

function IsGermanyAtWarWithNB()
	local bDebug = false
	if not AreAtWar( GetPlayerIDFromCivID(GERMANY, false), GetPlayerIDFromCivID(BELGIUM, true)) then
		Dprint("      - Germany is not at war with Belgium...", bDebug)
		return false
	end
	if not AreAtWar( GetPlayerIDFromCivID(GERMANY, false), GetPlayerIDFromCivID(NETHERLANDS, true)) then
		Dprint("      - Germany is not at war with the Netherlands...", bDebug)
		return false
	end
	return true
end

function IsGermanyAtWarWithYugoslavia()
	local bDebug = false
	if not AreAtWar( GetPlayerIDFromCivID(GERMANY, false), GetPlayerIDFromCivID(YUGOSLAVIA, true)) then
		Dprint("      - Germany is not at war with Yugoslavia...", bDebug)
		return false
	end
	return true
end

function IsGermanyAtWarWithGreece()
	local bDebug = false
	if not AreAtWar( GetPlayerIDFromCivID(GERMANY, false), GetPlayerIDFromCivID(GREECE, false)) then
		Dprint("      - Germany is not at war with Greece...", bDebug)
		return false
	end
	return true
end

function IsAlliesAtWarWithVichy()
	local bDebug = false
	if not AreAtWar( GetPlayerIDFromCivID(AMERICA, false), GetPlayerIDFromCivID(VICHY, true)) then
		Dprint("      - America is not at war with Vichy...", bDebug)
		return false
	end
		if not AreAtWar( GetPlayerIDFromCivID(ENGLAND, false), GetPlayerIDFromCivID(VICHY, true)) then
		Dprint("      - UK is not at war with Vichy...", bDebug)
		return false
	end
	return true
end


g_Military_Project = {
	------------------------------------------------------------------------------------
	[JAPAN] = {
	------------------------------------------------------------------------------------
		[OPERATION_CHINA] =  { -- projectID as index !
			Name = "Invasion of China",
			OrderOfBattle = {
				{	Name = "Middle Chinese Invasion Force", X = 93, Y = 21, Domain = "Land", CivID = JAPAN,
					Group = {		JP_INFANTRY, JP_INFANTRY, JP_INFANTRY, JP_INFANTRY,	},
					UnitsXP = {		10,				15,			10,			10,	}, 
					InitialObjective = nil, 
					LaunchType = "Amphibious",
					RouteID = TROOPS_INVADE_CHINA_1, -- must define a troops route for amphibious operation in g_TroopsRoutes !
				},
				{	Name = "Southern Chinese Invasion Force", X = 86, Y = 10, Domain = "Land", CivID = JAPAN,
					Group = {		JP_INFANTRY, JP_INFANTRY, JP_INFANTRY,	},
					UnitsXP = {		10,				15,	}, 
					InitialObjective = nil, 
					LaunchType = "Amphibious",
					RouteID = TROOPS_INVADE_CHINA_2, -- must define a troops route for amphibious operation in g_TroopsRoutes !
				},
				{	Name = "Secondary Mid. Chinese Invasion Force", X = 91, Y = 16, Domain = "Land", CivID = JAPAN, AI = true,
					Group = {		JP_INFANTRY, JP_INFANTRY, JP_INFANTRY, JP_INFANTRY,	},
					UnitsXP = {		15,				15,			10,			10,				}, 
					InitialObjective = nil, 
					LaunchType = "Amphibious",
					RouteID = TROOPS_INVADE_CHINA_1, -- must define a troops route for amphibious operation in g_TroopsRoutes !
				},
				{	Name = "Northern Attack Force", X = 90, Y = 30, Domain = "Land", CivID = JAPAN, AI = true,
					Group = {		JP_INFANTRY,	JP_INFANTRY, JP_INFANTRY,	},
					UnitsXP = {		15,				10,				15,			}, 
					InitialObjective = "82,32", -- Peking
					LaunchType = "ParaDrop",
					LaunchX = 83, -- Destination plot
					LaunchY = 30,
					LaunchImprecision = 2, -- landing area
				},
				{	Name = "Secondary Southern Chinese Invasion Force", X = 85, Y = 13, Domain = "Land", CivID = JAPAN, AI = true,
					Group = {		JP_INFANTRY,	JP_INFANTRY, JP_INFANTRY,	},
					UnitsXP = {		15,				15,				15,		}, 
					InitialObjective = nil, 
					LaunchType = "Amphibious",
					RouteID = TROOPS_INVADE_CHINA_2, -- must define a troops route for amphibious operation in g_TroopsRoutes !
				},
			},			
			Condition = IsJapanAtWarWithChina,
		},
		[OPERATION_PACIFIC] =  { -- projectID as index !
			Name = "Invasion of Indonesia and the Philippines",
			OrderOfBattle = {
				{	Name = "Guam Invasion Force", X = 97, Y = 11, Domain = "Land", CivID = JAPAN,
					Group = {		JP_INFANTRY, JP_INFANTRY, },
					UnitsXP = {		15,				15, }, 
					InitialObjective = nil, 
					LaunchType = "Amphibious",
					RouteID = TROOPS_INVADE_GUAM, -- must define a troops route for amphibious operation in g_TroopsRoutes !
				},
				{	Name = "Wake Invasion Force", X = 105, Y = 20, Domain = "Land", CivID = JAPAN,
					Group = {		JP_INFANTRY, JP_INFANTRY,	},
					UnitsXP = {		15,				15,	}, 
					InitialObjective = nil, 
					LaunchType = "Amphibious",
					RouteID = TROOPS_INVADE_WAKE, -- must define a troops route for amphibious operation in g_TroopsRoutes !
				},
				{	Name = "Tarawa Invasion Force", X = 112, Y = 2, Domain = "Land", CivID = JAPAN,
					Group = {		JP_INFANTRY, JP_INFANTRY, },
					UnitsXP = {		10,				15,	}, 
					InitialObjective = nil, 
					LaunchType = "Amphibious",
					RouteID = TROOPS_INVADE_TARAWA, -- must define a troops route for amphibious operation in g_TroopsRoutes !
				},
				{	Name = "Philippines Invasion Force", X = 90, Y = 12, Domain = "Land", CivID = JAPAN,
					Group = {		JP_INFANTRY,	JP_INFANTRY, JP_INFANTRY, JP_INFANTRY,	},
					UnitsXP = {		15,				15,				15,		}, 
					InitialObjective = nil, 
					LaunchType = "Amphibious",
					RouteID = TROOPS_INVADE_PHILIPPINES, -- must define a troops route for amphibious operation in g_TroopsRoutes !
				},
				{	Name = "Singapore Invasion Force", X = 81, Y = 2, Domain = "Land", CivID = JAPAN,
					Group = {		JP_INFANTRY,	JP_INFANTRY, JP_INFANTRY,	},
					UnitsXP = {		15,				15,				15,		}, 
					InitialObjective = nil, 
					LaunchType = "Amphibious",
					RouteID = TROOPS_INVADE_SINGAPORE, -- must define a troops route for amphibious operation in g_TroopsRoutes !
				},
			},			
			Condition = IsJapanAtWarWithAllies,
		},
	},	
	------------------------------------------------------------------------------------
	[GERMANY] = {
	------------------------------------------------------------------------------------
		[OPERATION_NORWAY] =  { -- projectID as index !
			Name = "Operation Weserübung",
			OrderOfBattle = {
				{	Name = "AI Only Oslo Aiborne Group", X = 22, Y = 38, Domain = "Land", CivID = GERMANY, AI = true,
					Group = {		GE_PARATROOPER,	},
					UnitsXP = {		15,				15, }, 
					InitialObjective = "22,48", -- Oslo
					LaunchType = "ParaDrop",
					LaunchX = 22, -- Destination plot
					LaunchY = 49,
					LaunchImprecision = 2, -- landing area
				},
				{	Name = "South Norway Airborne Group", X = 20, Y = 38, Domain = "Land", CivID = GERMANY,
					Group = {		GE_PARATROOPER,	GE_PARATROOPER, GE_PARATROOPER,	},
					UnitsXP = {		15,				15, }, 
					InitialObjective = "22,48", -- Oslo
					LaunchType = "ParaDrop",
					LaunchX = 19, -- Destination plot
					LaunchY = 47,
					LaunchImprecision = 2, -- landing area
				},

			},			
			Condition = IsGermanyAtWarWithND, -- Must refer to a function, remove this line to use the default condition (always true)
		},
		[OPERATION_FALLGELB] =  { -- projectID as index !
			Name = "Operation Fall Gelb",
			OrderOfBattle = {
				{	Name = "German Blitz to Amsterdam", X = 23, Y = 38, Domain = "Land", CivID = GERMANY,  AI = true,
					Group = {		GE_INFANTRY,	GE_PANZER_III,	},
					UnitsXP = {		15,				10, }, 
					InitialObjective = "16,39", -- Amsterdam
					LaunchType = "ParaDrop",
					LaunchX = 17, -- Destination plot
					LaunchY = 39,
					LaunchImprecision = 2, -- landing area
				},
				{	Name = "German Blitz to Brussels", X = 20, Y = 38, Domain = "Land", CivID = GERMANY, AI = true,
					Group = {		GE_INFANTRY,	GE_PANZER_III,	},
					UnitsXP = {		15,				10, }, 
					InitialObjective = "15,37", -- Brussels
					LaunchType = "ParaDrop",
					LaunchX = 16, -- Destination plot
					LaunchY = 37,
					LaunchImprecision = 2, -- landing area
				},
				{	Name = "German Blitz to Paris", X = 20, Y = 35, Domain = "Land", CivID = GERMANY, AI = true,
					Group = {		GE_INFANTRY,	GE_PANZER_III,	GE_PANZER_III, GE_PANZER_II, 	},
					UnitsXP = {		15,				10,				10,				15, }, 
					InitialObjective = "13,33", -- Paris
					LaunchType = "ParaDrop",
					LaunchX = 18, -- Destination plot
					LaunchY = 36,
					LaunchImprecision = 2, -- landing area
				},
			},			
			Condition = IsGermanyAtWarWithNB, -- Must refer to a function, remove this line to use the default condition (always true)
		},
		[OPERATION_SONNENBLUME] =  { -- projectID as index !
			Name = "Operation Sonnenblume",
			OrderOfBattle = {
				{	Name = "Afrika Korps", X = 23, Y = 18, Domain = "Land", CivID = GERMANY,
					Group = {		GE_INFANTRY, GE_INFANTRY,	GE_PANZER_III,	GE_INFANTRY,	GE_PANZER_III,	},
					UnitsXP = {		15,				15,				15,			15,				10,	}, 
					InitialObjective = nil, 
					LaunchType = "Amphibious",
					RouteID = TROOPS_GERMANY_AFRICA, -- must define a troops route for amphibious operation in g_TroopsRoutes !
				},
			},			
		},
		[OPERATION_TWENTYFIVE] =  { -- projectID as index !
			Name = "Operation 25",
			OrderOfBattle = {
				{	Name = "Belgrade Assault Force", X = 23, Y = 37, Domain = "Land", CivID = GERMANY,  AI = true,
					Group = {		GE_INFANTRY,	GE_INFANTRY, GE_INFANTRY,	},
					UnitsXP = {		25,				25,				25,  }, 
					InitialObjective = "26,27", -- Belgrade
					LaunchType = "ParaDrop",
					LaunchX = 27, -- Destination plot
					LaunchY = 29,
					LaunchImprecision = 2, -- landing area
				},
				{	Name = "Split Assault Force", X = 21, Y = 38, Domain = "Land", CivID = GERMANY, AI = true,
					Group = {		GE_INFANTRY,	GE_PANZER_III, GE_PANZER_III, GE_PANZER_III,	},
					UnitsXP = {		15,				10,				10,				10, }, 
					InitialObjective = "24,26", -- Split
					LaunchType = "ParaDrop",
					LaunchX = 24, -- Destination plot
					LaunchY = 29,
					LaunchImprecision = 2, -- landing area
				},
			},			
			Condition = IsGermanyAtWarWithYugoslavia, -- Must refer to a function, remove this line to use the default condition (always true)
		},
		[OPERATION_MARITA] =  { -- projectID as index !
			Name = "Operation Marita",
			OrderOfBattle = {
				{	Name = "Thessaloniki Assault Force", X = 20, Y = 33, Domain = "Land", CivID = GERMANY,  AI = true,
					Group = {		GE_INFANTRY,	GE_INFANTRY, GE_PANZER_III,	},
					UnitsXP = {		25,				25,				25,  }, 
					InitialObjective = "28,25", -- Thessaloniki
					LaunchType = "ParaDrop",
					LaunchX = 28, -- Destination plot
					LaunchY = 26,
					LaunchImprecision = 2, -- landing area
				},
				{	Name = "Athens Assault Force", X = 20, Y = 36, Domain = "Land", CivID = GERMANY, AI = true,
					Group = {		GE_INFANTRY,	GE_INFANTRY, GE_PANZER_III, GE_PANZER_III,	},
					UnitsXP = {		15,				15,				10,				10, }, 
					InitialObjective = "29,22", -- Athens
					LaunchType = "ParaDrop",
					LaunchX = 26, -- Destination plot
					LaunchY = 25,
					LaunchImprecision = 2, -- landing area
				},
			},			
			Condition = IsGermanyAtWarWithGreece, -- Must refer to a function, remove this line to use the default condition (always true)
		},
	},
	------------------------------------------------------------------------------------
	[AMERICA] = {
	------------------------------------------------------------------------------------
		[OPERATION_TORCH] =  { -- projectID as index !
			Name = "Operation Torch",
			OrderOfBattle = {
				{	Name = "Western Task Force", X = 2, Y = 16, Domain = "Land", CivID = AMERICA,
					Group = {		US_INFANTRY, US_INFANTRY, US_INFANTRY,	},
					UnitsXP = {		10,				10,			10, }, 
					InitialObjective = nil, 
					LaunchType = "Amphibious",
					RouteID = TROOPS_LIBERATE_CASABLANCA, -- must define a troops route for amphibious operation in g_TroopsRoutes !
				},
				{	Name = "Central Task Force", X = 9, Y = 18, Domain = "Land", CivID = AMERICA,
					Group = {		US_INFANTRY, US_INFANTRY,	},
					UnitsXP = {		10,				10,}, 
					InitialObjective = nil, 
					LaunchType = "Amphibious",
					RouteID = TROOPS_LIBERATE_ORAN, -- must define a troops route for amphibious operation in g_TroopsRoutes !
				},
				{	Name = "Eastern Task Force (American)", X = 13, Y = 20, Domain = "Land", CivID = AMERICA,
					Group = {		US_INFANTRY, US_INFANTRY, },
					UnitsXP = {		10,				10,}, 
					InitialObjective = nil, 
					LaunchType = "Amphibious",
					RouteID = TROOPS_LIBERATE_ALGIERS, -- must define a troops route for amphibious operation in g_TroopsRoutes !
				},
				{	Name = "Eastern Task Force (British)", X = 16, Y = 20, Domain = "Land", CivID = ENGLAND,
					Group = {		UK_INFANTRY, },
					UnitsXP = {		15,	}, 
					InitialObjective = nil, 
					LaunchType = "Amphibious",
					RouteID = TROOPS_LIBERATE_ALGIERSBRITISH, -- must define a troops route for amphibious operation in g_TroopsRoutes !
				},
				{	Name = "Paradrop Force", X = 7, Y = 19, Domain = "Land", CivID = AMERICA,
					Group = {		PARATROOPER, },
					UnitsXP = {		25,	 }, 
					InitialObjective = "10,15", -- Oran
					LaunchType = "ParaDrop",
					LaunchX = 10, -- Destination plot
					LaunchY = 14,
					LaunchImprecision = 2, -- landing area
				},
				{	Name = "French Resistance", X = 40, Y = 19, Domain = "Land", CivID = FRANCE,
					Group = {		FR_LEGION, },
					UnitsXP = {		25,	 }, 
					InitialObjective = "12,17", -- Algiers
					LaunchType = "ParaDrop",
					LaunchX = 12, -- Destination plot
					LaunchY = 15,
					LaunchImprecision = 2, -- landing area
				},

			},			
			Condition = FranceHasFallen, IsAlliesAtWarWithVichy, -- Must refer to a function, remove this line to use the default condition (always true)
		},
	},		
}

----------------------------------------------------------------------------------------------------------------------------
-- Invasion of Poland Popup
----------------------------------------------------------------------------------------------------------------------------

function WarPolandPopupGermany()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end
	local iGermany = GetPlayerIDFromCivID (GERMANY, false, true)
	local pGermany = Players[iGermany]
	if 19390901 <= turnDate and 19390901 > prevDate then
		Dprint ("Scripted Event : War With Poland Popup ACTIVATED !")
		for city in pGermany:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(WAR_POLAND, 1) end		
		end
	end
end

function WarPolandPopupFrance()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end
	local iFrance = GetPlayerIDFromCivID (FRANCE, false, true)
	local pFrance = Players[iFrance]
	if 19390901 <= turnDate and 19390901 > prevDate then
		Dprint ("Scripted Event : War With Poland Popup ACTIVATED !")
		for city in pFrance:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(WAR_POLAND, 1) end		
		end
	end
end

function WarPolandPopupEngland()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end
	local iEngland = GetPlayerIDFromCivID (ENGLAND, false, true)
	local pEngland = Players[iEngland]
	if 19390901 <= turnDate and 19390901 > prevDate then
		Dprint ("Scripted Event : War With Poland Popup ACTIVATED !")
		for city in pEngland:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(WAR_POLAND, 1) end		
		end
	end
end

function WarPolandPopupUSSR()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end
	local iUssr = GetPlayerIDFromCivID (USSR, false, true)
	local pUssr = Players[iUssr]
	if 19390901 <= turnDate and 19390901 > prevDate then
		Dprint ("Scripted Event : War With Poland Popup ACTIVATED !")
		for city in pUssr:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(WAR_POLAND, 1) end		
		end
	end
end

function WarPolandPopupAmerica()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end
	local iAmerica = GetPlayerIDFromCivID (AMERICA, false, true)
	local pAmerica = Players[iAmerica]
	if 19390901 <= turnDate and 19390901 > prevDate then
		Dprint ("Scripted Event : War With Poland Popup ACTIVATED !")
		for city in pAmerica:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(WAR_POLAND, 1) end		
		end
	end
end

function WarPolandPopupGreece()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end
	local iGreece = GetPlayerIDFromCivID (GREECE, false, true)
	local pGreece = Players[iGreece]
	if 19390901 <= turnDate and 19390901 > prevDate then
		Dprint ("Scripted Event : War With Poland Popup ACTIVATED !")
		for city in pGreece:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(WAR_POLAND, 1) end		
		end
	end
end

function WarPolandPopupJapan()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end
	local iJapan = GetPlayerIDFromCivID (JAPAN, false, true)
	local pJapan = Players[iJapan]
	if 19390901 <= turnDate and 19390901 > prevDate then
		Dprint ("Scripted Event : War With Poland Popup ACTIVATED !")
		for city in pJapan:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(WAR_POLAND, 1) end		
		end
	end
end

function WarPolandPopupChina()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end
	local iChina = GetPlayerIDFromCivID (CHINA, false, true)
	local pChina = Players[iChina]
	if 19390901 <= turnDate and 19390901 > prevDate then
		Dprint ("Scripted Event : War With Poland Popup ACTIVATED !")
		for city in pChina:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(WAR_POLAND, 1) end		
		end
	end
end

function WarPolandPopupItaly()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end
	local iItaly = GetPlayerIDFromCivID (ITALY, false, true)
	local pItaly = Players[iItaly]
	if 19390901 <= turnDate and 19390901 > prevDate then
		Dprint ("Scripted Event : War With Poland Popup ACTIVATED !")
		for city in pItaly:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(WAR_POLAND, 1) end		
		end
	end
end

----------------------------------------------------------------------------------------------------------------------------
-- Allies Declare War Popup
----------------------------------------------------------------------------------------------------------------------------

function WarAlliesPopupGermany()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end
	local iGermany = GetPlayerIDFromCivID (GERMANY, false, true)
	local pGermany = Players[iGermany]
	if 19390903 <= turnDate and 19390903 > prevDate then
		Dprint ("Scripted Event : War With Allies Popup ACTIVATED !")
		for city in pGermany:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(WAR_ALLIES, 1) end		
		end
	end
end

function WarAlliesPopupFrance()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end
	local iFrance = GetPlayerIDFromCivID (FRANCE, false, true)
	local pFrance = Players[iFrance]
	if 19390903 <= turnDate and 19390903 > prevDate then
		Dprint ("Scripted Event : War With Allies Popup ACTIVATED !")
		for city in pFrance:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(WAR_ALLIES, 1) end		
		end
	end
end

function WarAlliesPopupEngland()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end
	local iEngland = GetPlayerIDFromCivID (ENGLAND, false, true)
	local pEngland = Players[iEngland]
	if 19390903 <= turnDate and 19390903 > prevDate then
		Dprint ("Scripted Event : War With Allies Popup ACTIVATED !")
		for city in pEngland:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(WAR_ALLIES, 1) end			
		end
	end
end

function WarAlliesPopupUSSR()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end
	local iUssr = GetPlayerIDFromCivID (USSR, false, true)
	local pUssr = Players[iUssr]
	if 19390903 <= turnDate and 19390903 > prevDate then
		Dprint ("Scripted Event : War With Allies Popup ACTIVATED !")
		for city in pUssr:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(WAR_ALLIES, 1) end			
		end
	end
end

function WarAlliesPopupAmerica()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end
	local iAmerica = GetPlayerIDFromCivID (AMERICA, false, true)
	local pAmerica = Players[iAmerica]
	if 19390903 <= turnDate and 19390903 > prevDate then
		Dprint ("Scripted Event : War With Allies Popup ACTIVATED !")
		for city in pAmerica:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(WAR_ALLIES, 1) end		
		end
	end
end

function WarAlliesPopupGreece()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end
	local iGreece = GetPlayerIDFromCivID (GREECE, false, true)
	local pGreece = Players[iGreece]
	if 19390903 <= turnDate and 19390903 > prevDate then
		Dprint ("Scripted Event : War With Allies Popup ACTIVATED !")
		for city in pGreece:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(WAR_ALLIES, 1) end		
		end
	end
end

function WarAlliesPopupJapan()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end
	local iJapan = GetPlayerIDFromCivID (JAPAN, false, true)
	local pJapan = Players[iJapan]
	if 19390903 <= turnDate and 19390903 > prevDate then
		Dprint ("Scripted Event : War With Allies Popup ACTIVATED !")
		for city in pJapan:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(WAR_ALLIES, 1) end		
		end
	end
end

function WarAlliesPopupChina()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end
	local iChina = GetPlayerIDFromCivID (CHINA, false, true)
	local pChina = Players[iChina]
	if 19390903 <= turnDate and 19390903 > prevDate then
		Dprint ("Scripted Event : War With Allies Popup ACTIVATED !")
		for city in pChina:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(WAR_ALLIES, 1) end		
		end
	end
end

function WarAlliesPopupItaly()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end
	local iItaly = GetPlayerIDFromCivID (ITALY, false, true)
	local pItaly = Players[iItaly]
	if 19390903 <= turnDate and 19390903 > prevDate then
		Dprint ("Scripted Event : War With Allies Popup ACTIVATED !")
		for city in pItaly:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(WAR_ALLIES, 1) end		
		end
	end
end

----------------------------------------------------------------------------------------------------------------------------
-- Winter War Popup
----------------------------------------------------------------------------------------------------------------------------

function WarWinterPopupGermany()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end
	local iGermany = GetPlayerIDFromCivID (GERMANY, false, true)
	local pGermany = Players[iGermany]
	if 19391130 <= turnDate and 19391130 > prevDate then
		Dprint ("Scripted Event : Winter War Popup ACTIVATED !")
		for city in pGermany:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(WAR_WINTER, 1) end		
		end
	end
end

function WarWinterPopupFrance()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end
	local iFrance = GetPlayerIDFromCivID (FRANCE, false, true)
	local pFrance = Players[iFrance]
	if 19391130 <= turnDate and 19391130 > prevDate then
		Dprint ("Scripted Event : War With Winter Popup ACTIVATED !")
		for city in pFrance:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(WAR_WINTER, 1) end		
		end
	end
end

function WarWinterPopupEngland()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end
	local iEngland = GetPlayerIDFromCivID (ENGLAND, false, true)
	local pEngland = Players[iEngland]
	if 19391130 <= turnDate and 19391130 > prevDate then
		Dprint ("Scripted Event : Winter War Popup ACTIVATED !")
		for city in pEngland:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(WAR_WINTER, 1) end			
		end
	end
end

function WarWinterPopupUSSR()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end
	local iUssr = GetPlayerIDFromCivID (USSR, false, true)
	local pUssr = Players[iUssr]
	if 19391130 <= turnDate and 19391130 > prevDate then
		Dprint ("Scripted Event : Winter War Popup ACTIVATED !")
		for city in pUssr:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(WAR_WINTER, 1) end			
		end
	end
end

function WarWinterPopupAmerica()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end
	local iAmerica = GetPlayerIDFromCivID (AMERICA, false, true)
	local pAmerica = Players[iAmerica]
	if 19391130 <= turnDate and 19391130 > prevDate then
		Dprint ("Scripted Event : Winter War Popup ACTIVATED !")
		for city in pAmerica:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(WAR_WINTER, 1) end		
		end
	end
end

function WarWinterPopupGreece()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end
	local iGreece = GetPlayerIDFromCivID (GREECE, false, true)
	local pGreece = Players[iGreece]
	if 19391130 <= turnDate and 19391130 > prevDate then
		Dprint ("Scripted Event : Winter War Popup ACTIVATED !")
		for city in pGreece:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(WAR_WINTER, 1) end		
		end
	end
end

function WarWinterPopupJapan()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end
	local iJapan = GetPlayerIDFromCivID (JAPAN, false, true)
	local pJapan = Players[iJapan]
	if 19391130 <= turnDate and 19391130 > prevDate then
		Dprint ("Scripted Event : Winter War Popup ACTIVATED !")
		for city in pJapan:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(WAR_WINTER, 1) end		
		end
	end
end

function WarWinterPopupChina()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end
	local iChina = GetPlayerIDFromCivID (CHINA, false, true)
	local pChina = Players[iChina]
	if 19391130 <= turnDate and 19391130 > prevDate then
		Dprint ("Scripted Event : Winter War Popup ACTIVATED !")
		for city in pChina:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(WAR_WINTER, 1) end		
		end
	end
end

function WarWinterPopupItaly()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end
	local iItaly = GetPlayerIDFromCivID (ITALY, false, true)
	local pItaly = Players[iItaly]
	if 19391130 <= turnDate and 19391130 > prevDate then
		Dprint ("Scripted Event : Winter War Popup ACTIVATED !")
		for city in pItaly:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(WAR_WINTER, 1) end		
		end
	end
end

----------------------------------------------------------------------------------------------------------------------------
-- Norway Declares War Popup
----------------------------------------------------------------------------------------------------------------------------

function WarNorwayPopupGermany()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end
	local iGermany = GetPlayerIDFromCivID (GERMANY, false, true)
	local pGermany = Players[iGermany]
	if 19400409 <= turnDate and 19400409 > prevDate then
		Dprint ("Scripted Event : War With Norway Popup ACTIVATED !")
		for city in pGermany:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(WAR_NORWAY, 1) end		
		end
	end
end

function WarNorwayPopupFrance()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end
	local iFrance = GetPlayerIDFromCivID (FRANCE, false, true)
	local pFrance = Players[iFrance]
	if 19400409 <= turnDate and 19400409 > prevDate then
		Dprint ("Scripted Event : War With Norway Popup ACTIVATED !")
		for city in pFrance:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(WAR_NORWAY, 1) end		
		end
	end
end

function WarNorwayPopupEngland()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end
	local iEngland = GetPlayerIDFromCivID (ENGLAND, false, true)
	local pEngland = Players[iEngland]
	if 19400409 <= turnDate and 19400409 > prevDate then
		Dprint ("Scripted Event : War With Norway Popup ACTIVATED !")
		for city in pEngland:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(WAR_NORWAY, 1) end			
		end
	end
end

function WarNorwayPopupUSSR()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end
	local iUssr = GetPlayerIDFromCivID (USSR, false, true)
	local pUssr = Players[iUssr]
	if 19400409 <= turnDate and 19400409 > prevDate then
		Dprint ("Scripted Event : War With Norway Popup ACTIVATED !")
		for city in pUssr:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(WAR_NORWAY, 1) end			
		end
	end
end

function WarNorwayPopupAmerica()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end
	local iAmerica = GetPlayerIDFromCivID (AMERICA, false, true)
	local pAmerica = Players[iAmerica]
	if 19400409 <= turnDate and 19400409 > prevDate then
		Dprint ("Scripted Event : War With Norway Popup ACTIVATED !")
		for city in pAmerica:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(WAR_NORWAY, 1) end		
		end
	end
end

function WarNorwayPopupGreece()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end
	local iGreece = GetPlayerIDFromCivID (GREECE, false, true)
	local pGreece = Players[iGreece]
	if 19400409 <= turnDate and 19400409 > prevDate then
		Dprint ("Scripted Event : War With Norway Popup ACTIVATED !")
		for city in pGreece:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(WAR_NORWAY, 1) end		
		end
	end
end

function WarNorwayPopupJapan()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end
	local iJapan = GetPlayerIDFromCivID (JAPAN, false, true)
	local pJapan = Players[iJapan]
	if 19400409 <= turnDate and 19400409 > prevDate then
		Dprint ("Scripted Event : War With Norway Popup ACTIVATED !")
		for city in pJapan:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(WAR_NORWAY, 1) end		
		end
	end
end

function WarNorwayPopupChina()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end
	local iChina = GetPlayerIDFromCivID (CHINA, false, true)
	local pChina = Players[iChina]
	if 19400409 <= turnDate and 19400409 > prevDate then
		Dprint ("Scripted Event : War With Norway Popup ACTIVATED !")
		for city in pChina:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(WAR_NORWAY, 1) end		
		end
	end
end

function WarNorwayPopupItaly()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end
	local iItaly = GetPlayerIDFromCivID (ITALY, false, true)
	local pItaly = Players[iItaly]
	if 19400409 <= turnDate and 19400409 > prevDate then
		Dprint ("Scripted Event : War With Norway Popup ACTIVATED !")
		for city in pItaly:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(WAR_NORWAY, 1) end		
		end
	end
end

----------------------------------------------------------------------------------------------------------------------------
-- Italy Declares War Popup
----------------------------------------------------------------------------------------------------------------------------

function WarItalyPopupGermany()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end
	local iGermany = GetPlayerIDFromCivID (GERMANY, false, true)
	local pGermany = Players[iGermany]
	if 19400610 <= turnDate and 19400610 > prevDate then
		Dprint ("Scripted Event : War With Italy Popup ACTIVATED !")
		for city in pGermany:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(WAR_ITALY, 1) end		
		end
	end
end

function WarItalyPopupFrance()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end
	local iFrance = GetPlayerIDFromCivID (FRANCE, false, true)
	local pFrance = Players[iFrance]
	if 19400610 <= turnDate and 19400610 > prevDate then
		Dprint ("Scripted Event : War With Italy Popup ACTIVATED !")
		for city in pFrance:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(WAR_ITALY, 1) end		
		end
	end
end

function WarItalyPopupEngland()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end
	local iEngland = GetPlayerIDFromCivID (ENGLAND, false, true)
	local pEngland = Players[iEngland]
	if 19400610 <= turnDate and 19400610 > prevDate then
		Dprint ("Scripted Event : War With Italy Popup ACTIVATED !")
		for city in pEngland:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(WAR_ITALY, 1) end			
		end
	end
end

function WarItalyPopupUSSR()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end
	local iUssr = GetPlayerIDFromCivID (USSR, false, true)
	local pUssr = Players[iUssr]
	if 19400610 <= turnDate and 19400610 > prevDate then
		Dprint ("Scripted Event : War With Italy Popup ACTIVATED !")
		for city in pUssr:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(WAR_ITALY, 1) end			
		end
	end
end

function WarItalyPopupAmerica()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end
	local iAmerica = GetPlayerIDFromCivID (AMERICA, false, true)
	local pAmerica = Players[iAmerica]
	if 19400610 <= turnDate and 19400610 > prevDate then
		Dprint ("Scripted Event : War With Italy Popup ACTIVATED !")
		for city in pAmerica:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(WAR_ITALY, 1) end		
		end
	end
end

function WarItalyPopupGreece()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end
	local iGreece = GetPlayerIDFromCivID (GREECE, false, true)
	local pGreece = Players[iGreece]
	if 19400610 <= turnDate and 19400610 > prevDate then
		Dprint ("Scripted Event : War With Italy Popup ACTIVATED !")
		for city in pGreece:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(WAR_ITALY, 1) end		
		end
	end
end

function WarItalyPopupJapan()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end
	local iJapan = GetPlayerIDFromCivID (JAPAN, false, true)
	local pJapan = Players[iJapan]
	if 19400610 <= turnDate and 19400610 > prevDate then
		Dprint ("Scripted Event : War With Italy Popup ACTIVATED !")
		for city in pJapan:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(WAR_ITALY, 1) end		
		end
	end
end

function WarItalyPopupChina()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end
	local iChina = GetPlayerIDFromCivID (CHINA, false, true)
	local pChina = Players[iChina]
	if 19400610 <= turnDate and 19400610 > prevDate then
		Dprint ("Scripted Event : War With Italy Popup ACTIVATED !")
		for city in pChina:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(WAR_ITALY, 1) end		
		end
	end
end

function WarItalyPopupItaly()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end
	local iItaly = GetPlayerIDFromCivID (ITALY, false, true)
	local pItaly = Players[iItaly]
	if 19400610 <= turnDate and 19400610 > prevDate then
		Dprint ("Scripted Event : War With Italy Popup ACTIVATED !")
		for city in pItaly:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(WAR_ITALY, 1) end		
		end
	end
end
----------------------------------------------------------------------------------------------------------------------------
-- Low Countries Declares War Popup
----------------------------------------------------------------------------------------------------------------------------

function WarLowCountriesPopupGermany()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end
	local iGermany = GetPlayerIDFromCivID (GERMANY, false, true)
	local pGermany = Players[iGermany]
	if 19400509 <= turnDate and 19400509 > prevDate then
		Dprint ("Scripted Event : War With Low Countries Popup ACTIVATED !")
		for city in pGermany:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(WAR_LOW_COUNTRIES, 1) end		
		end
	end
end

function WarLowCountriesPopupFrance()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end
	local iFrance = GetPlayerIDFromCivID (FRANCE, false, true)
	local pFrance = Players[iFrance]
	if 19400509 <= turnDate and 19400509 > prevDate then
		Dprint ("Scripted Event : War With Low Countries Popup ACTIVATED !")
		for city in pFrance:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(WAR_LOW_COUNTRIES, 1) end		
		end
	end
end

function WarLowCountriesPopupEngland()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end
	local iEngland = GetPlayerIDFromCivID (ENGLAND, false, true)
	local pEngland = Players[iEngland]
	if 19400509 <= turnDate and 19400509 > prevDate then
		Dprint ("Scripted Event : War With Low Countries Popup ACTIVATED !")
		for city in pEngland:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(WAR_LOW_COUNTRIES, 1) end			
		end
	end
end

function WarLowCountriesPopupUSSR()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end
	local iUssr = GetPlayerIDFromCivID (USSR, false, true)
	local pUssr = Players[iUssr]
	if 19400509 <= turnDate and 19400509 > prevDate then
		Dprint ("Scripted Event : War With Low Countries Popup ACTIVATED !")
		for city in pUssr:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(WAR_LOW_COUNTRIES, 1) end			
		end
	end
end

function WarLowCountriesPopupAmerica()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end
	local iAmerica = GetPlayerIDFromCivID (AMERICA, false, true)
	local pAmerica = Players[iAmerica]
	if 19400509 <= turnDate and 19400509 > prevDate then
		Dprint ("Scripted Event : War With Low Countries Popup ACTIVATED !")
		for city in pAmerica:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(WAR_LOW_COUNTRIES, 1) end		
		end
	end
end

function WarLowCountriesPopupGreece()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end
	local iGreece = GetPlayerIDFromCivID (GREECE, false, true)
	local pGreece = Players[iGreece]
	if 19400509 <= turnDate and 19400509 > prevDate then
		Dprint ("Scripted Event : War With Low Countries Popup ACTIVATED !")
		for city in pGreece:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(WAR_LOW_COUNTRIES, 1) end		
		end
	end
end

function WarLowCountriesPopupJapan()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end
	local iJapan = GetPlayerIDFromCivID (JAPAN, false, true)
	local pJapan = Players[iJapan]
	if 19400509 <= turnDate and 19400509 > prevDate then
		Dprint ("Scripted Event : War With Low Countries Popup ACTIVATED !")
		for city in pJapan:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(WAR_LOW_COUNTRIES, 1) end		
		end
	end
end

function WarLowCountriesPopupChina()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end
	local iChina = GetPlayerIDFromCivID (CHINA, false, true)
	local pChina = Players[iChina]
	if 19400509 <= turnDate and 19400509 > prevDate then
		Dprint ("Scripted Event : War With Low Countries Popup ACTIVATED !")
		for city in pChina:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(WAR_LOW_COUNTRIES, 1) end		
		end
	end
end

function WarLowCountriesPopupItaly()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end
	local iItaly = GetPlayerIDFromCivID (ITALY, false, true)
	local pItaly = Players[iItaly]
	if 19400509 <= turnDate and 19400509 > prevDate then
		Dprint ("Scripted Event : War With Low Countries Popup ACTIVATED !")
		for city in pItaly:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(WAR_LOW_COUNTRIES, 1) end		
		end
	end
end

----------------------------------------------------------------------------------------------------------------------------
-- Greece Declares War Popup
----------------------------------------------------------------------------------------------------------------------------

function WarGreecePopupGermany()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end
	local iGermany = GetPlayerIDFromCivID (GERMANY, false, true)
	local pGermany = Players[iGermany]
	if 19401028 <= turnDate and 19401028 > prevDate then
		Dprint ("Scripted Event : War With Greece Popup ACTIVATED !")
		for city in pGermany:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(WAR_GREECE, 1) end		
		end
	end
end

function WarGreecePopupFrance()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end
	local iFrance = GetPlayerIDFromCivID (FRANCE, false, true)
	local pFrance = Players[iFrance]
	if 19401028 <= turnDate and 19401028 > prevDate then
		Dprint ("Scripted Event : War With Greece Popup ACTIVATED !")
		for city in pFrance:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(WAR_GREECE, 1) end		
		end
	end
end

function WarGreecePopupEngland()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end
	local iEngland = GetPlayerIDFromCivID (ENGLAND, false, true)
	local pEngland = Players[iEngland]
	if 19401028 <= turnDate and 19401028 > prevDate then
		Dprint ("Scripted Event : War With Greece Popup ACTIVATED !")
		for city in pEngland:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(WAR_GREECE, 1) end			
		end
	end
end

function WarGreecePopupUSSR()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end
	local iUssr = GetPlayerIDFromCivID (USSR, false, true)
	local pUssr = Players[iUssr]
	if 19401028 <= turnDate and 19401028 > prevDate then
		Dprint ("Scripted Event : War With Greece Popup ACTIVATED !")
		for city in pUssr:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(WAR_GREECE, 1) end			
		end
	end
end

function WarGreecePopupAmerica()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end
	local iAmerica = GetPlayerIDFromCivID (AMERICA, false, true)
	local pAmerica = Players[iAmerica]
	if 19401028 <= turnDate and 19401028 > prevDate then
		Dprint ("Scripted Event : War With Greece Popup ACTIVATED !")
		for city in pAmerica:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(WAR_GREECE, 1) end		
		end
	end
end

function WarGreecePopupGreece()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end
	local iGreece = GetPlayerIDFromCivID (GREECE, false, true)
	local pGreece = Players[iGreece]
	if 19401028 <= turnDate and 19401028 > prevDate then
		Dprint ("Scripted Event : War With Greece Popup ACTIVATED !")
		for city in pGreece:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(WAR_GREECE, 1) end		
		end
	end
end

function WarGreecePopupJapan()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end
	local iJapan = GetPlayerIDFromCivID (JAPAN, false, true)
	local pJapan = Players[iJapan]
	if 19401028 <= turnDate and 19401028 > prevDate then
		Dprint ("Scripted Event : War With Greece Popup ACTIVATED !")
		for city in pJapan:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(WAR_GREECE, 1) end		
		end
	end
end

function WarGreecePopupChina()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end
	local iChina = GetPlayerIDFromCivID (CHINA, false, true)
	local pChina = Players[iChina]
	if 19401028 <= turnDate and 19401028 > prevDate then
		Dprint ("Scripted Event : War With Greece Popup ACTIVATED !")
		for city in pChina:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(WAR_GREECE, 1) end		
		end
	end
end

function WarGreecePopupItaly()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end
	local iItaly = GetPlayerIDFromCivID (ITALY, false, true)
	local pItaly = Players[iItaly]
	if 19401028 <= turnDate and 19401028 > prevDate then
		Dprint ("Scripted Event : War With Greece Popup ACTIVATED !")
		for city in pItaly:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(WAR_GREECE, 1) end		
		end
	end
end

----------------------------------------------------------------------------------------------------------------------------
-- Russia Declares War Popup
----------------------------------------------------------------------------------------------------------------------------

function WarRussiaPopupGermany()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end
	local iGermany = GetPlayerIDFromCivID (GERMANY, false, true)
	local pGermany = Players[iGermany]
	if 19410622 <= turnDate and 19410622 > prevDate then
		Dprint ("Scripted Event : War With Russia Popup ACTIVATED !")
		for city in pGermany:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(WAR_RUSSIA, 1) end		
		end
	end
end

function WarRussiaPopupFrance()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end
	local iFrance = GetPlayerIDFromCivID (FRANCE, false, true)
	local pFrance = Players[iFrance]
	if 19410622 <= turnDate and 19410622 > prevDate then
		Dprint ("Scripted Event : War With Russia Popup ACTIVATED !")
		for city in pFrance:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(WAR_RUSSIA, 1) end		
		end
	end
end

function WarRussiaPopupEngland()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end
	local iEngland = GetPlayerIDFromCivID (ENGLAND, false, true)
	local pEngland = Players[iEngland]
	if 19410622 <= turnDate and 19410622 > prevDate then
		Dprint ("Scripted Event : War With Russia Popup ACTIVATED !")
		for city in pEngland:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(WAR_RUSSIA, 1) end			
		end
	end
end

function WarRussiaPopupUSSR()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end
	local iUssr = GetPlayerIDFromCivID (USSR, false, true)
	local pUssr = Players[iUssr]
	if 19410622 <= turnDate and 19410622 > prevDate then
		Dprint ("Scripted Event : War With Russia Popup ACTIVATED !")
		for city in pUssr:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(WAR_RUSSIA, 1) end			
		end
	end
end

function WarRussiaPopupAmerica()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end
	local iAmerica = GetPlayerIDFromCivID (AMERICA, false, true)
	local pAmerica = Players[iAmerica]
	if 19410622 <= turnDate and 19410622 > prevDate then
		Dprint ("Scripted Event : War With Russia Popup ACTIVATED !")
		for city in pAmerica:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(WAR_RUSSIA, 1) end		
		end
	end
end

function WarRussiaPopupGreece()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end
	local iGreece = GetPlayerIDFromCivID (GREECE, false, true)
	local pGreece = Players[iGreece]
	if 19410622 <= turnDate and 19410622 > prevDate then
		Dprint ("Scripted Event : War With Russia Popup ACTIVATED !")
		for city in pGreece:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(WAR_RUSSIA, 1) end		
		end
	end
end

function WarRussiaPopupJapan()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end
	local iJapan = GetPlayerIDFromCivID (JAPAN, false, true)
	local pJapan = Players[iJapan]
	if 19410622 <= turnDate and 19410622 > prevDate then
		Dprint ("Scripted Event : War With Russia Popup ACTIVATED !")
		for city in pJapan:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(WAR_RUSSIA, 1) end		
		end
	end
end

function WarRussiaPopupChina()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end
	local iChina = GetPlayerIDFromCivID (CHINA, false, true)
	local pChina = Players[iChina]
	if 19410622 <= turnDate and 19410622 > prevDate then
		Dprint ("Scripted Event : War With Russia Popup ACTIVATED !")
		for city in pChina:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(WAR_RUSSIA, 1) end		
		end
	end
end

function WarRussiaPopupItaly()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end
	local iItaly = GetPlayerIDFromCivID (ITALY, false, true)
	local pItaly = Players[iItaly]
	if 19410622 <= turnDate and 19410622 > prevDate then
		Dprint ("Scripted Event : War With Russia Popup ACTIVATED !")
		for city in pItaly:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(WAR_RUSSIA, 1) end		
		end
	end
end
----------------------------------------------------------------------------------------------------------------------------
-- America Declares War Popup
----------------------------------------------------------------------------------------------------------------------------

function WarAmericaPopupGermany()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end
	local iGermany = GetPlayerIDFromCivID (GERMANY, false, true)
	local pGermany = Players[iGermany]
	if 19411207 <= turnDate and 19411207 > prevDate then
		Dprint ("Scripted Event : War With America Popup ACTIVATED !")
		for city in pGermany:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(WAR_AMERICA, 1) end		
		end
	end
end

function WarAmericaPopupFrance()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end
	local iFrance = GetPlayerIDFromCivID (FRANCE, false, true)
	local pFrance = Players[iFrance]
	if 19411207 <= turnDate and 19411207 > prevDate then
		Dprint ("Scripted Event : War With America Popup ACTIVATED !")
		for city in pFrance:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(WAR_AMERICA, 1) end		
		end
	end
end

function WarAmericaPopupEngland()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end
	local iEngland = GetPlayerIDFromCivID (ENGLAND, false, true)
	local pEngland = Players[iEngland]
	if 19411207 <= turnDate and 19411207 > prevDate then
		Dprint ("Scripted Event : War With America Popup ACTIVATED !")
		for city in pEngland:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(WAR_AMERICA, 1) end			
		end
	end
end

function WarAmericaPopupUSSR()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end
	local iUssr = GetPlayerIDFromCivID (USSR, false, true)
	local pUssr = Players[iUssr]
	if 19411207 <= turnDate and 19411207 > prevDate then
		Dprint ("Scripted Event : War With America Popup ACTIVATED !")
		for city in pUssr:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(WAR_AMERICA, 1) end			
		end
	end
end

function WarAmericaPopupAmerica()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end
	local iAmerica = GetPlayerIDFromCivID (AMERICA, false, true)
	local pAmerica = Players[iAmerica]
	if 19411207 <= turnDate and 19411207 > prevDate then
		Dprint ("Scripted Event : War With America Popup ACTIVATED !")
		for city in pAmerica:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(WAR_AMERICA, 1) end		
		end
	end
end

function WarAmericaPopupGreece()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end
	local iGreece = GetPlayerIDFromCivID (GREECE, false, true)
	local pGreece = Players[iGreece]
	if 19411207 <= turnDate and 19411207 > prevDate then
		Dprint ("Scripted Event : War With America Popup ACTIVATED !")
		for city in pGreece:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(WAR_AMERICA, 1) end			
		end
	end
end

function WarAmericaPopupJapan()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end
	local iJapan = GetPlayerIDFromCivID (JAPAN, false, true)
	local pJapan = Players[iJapan]
	if 19411207 <= turnDate and 19411207 > prevDate then
		Dprint ("Scripted Event : War With America Popup ACTIVATED !")
		for city in pJapan:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(WAR_AMERICA, 1) end			
		end
	end
end

function WarAmericaPopupChina()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end
	local iChina = GetPlayerIDFromCivID (CHINA, false, true)
	local pChina = Players[iChina]
	if 19411207 <= turnDate and 19411207 > prevDate then
		Dprint ("Scripted Event : War With America Popup ACTIVATED !")
		for city in pChina:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(WAR_AMERICA, 1) end			
		end
	end
end

function WarAmericaPopupItaly()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end
	local iItaly = GetPlayerIDFromCivID (ITALY, false, true)
	local pItaly = Players[iItaly]
	if 19411207 <= turnDate and 19411207 > prevDate then
		Dprint ("Scripted Event : War With America Popup ACTIVATED !")
		for city in pItaly:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(WAR_AMERICA, 1) end			
		end
	end
end

----------------------------------------------------------------------------------------------------------------------------
-- Sino-War Popup
----------------------------------------------------------------------------------------------------------------------------

function WarChinaPopupGermany()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end
	local iGermany = GetPlayerIDFromCivID (GERMANY, false, true)
	local pGermany = Players[iGermany]
	if 19370707 <= turnDate and 19370707 > prevDate then
		Dprint ("Scripted Event : War With China Popup ACTIVATED !")
		for city in pGermany:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(WAR_CHINA, 1) end		
		end
	end
end

function WarChinaPopupFrance()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end
	local iFrance = GetPlayerIDFromCivID (FRANCE, false, true)
	local pFrance = Players[iFrance]
	if 19370707 <= turnDate and 19370707 > prevDate then
		Dprint ("Scripted Event : War With China Popup ACTIVATED !")
		for city in pFrance:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(WAR_CHINA, 1) end		
		end
	end
end

function WarChinaPopupEngland()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end
	local iEngland = GetPlayerIDFromCivID (ENGLAND, false, true)
	local pEngland = Players[iEngland]
	if 19370707 <= turnDate and 19370707 > prevDate then
		Dprint ("Scripted Event : War With China Popup ACTIVATED !")
		for city in pEngland:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(WAR_CHINA, 1) end			
		end
	end
end

function WarChinaPopupUSSR()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end
	local iUssr = GetPlayerIDFromCivID (USSR, false, true)
	local pUssr = Players[iUssr]
	if 19370707 <= turnDate and 19370707 > prevDate then
		Dprint ("Scripted Event : War With China Popup ACTIVATED !")
		for city in pUssr:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(WAR_CHINA, 1) end			
		end
	end
end

function WarChinaPopupAmerica()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end
	local iAmerica = GetPlayerIDFromCivID (AMERICA, false, true)
	local pAmerica = Players[iAmerica]
	if 19370707 <= turnDate and 19370707 > prevDate then
		Dprint ("Scripted Event : War With China Popup ACTIVATED !")
		for city in pAmerica:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(WAR_CHINA, 1) end		
		end
	end
end

function WarChinaPopupGreece()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end
	local iGreece = GetPlayerIDFromCivID (GREECE, false, true)
	local pGreece = Players[iGreece]
	if 19370707 <= turnDate and 19370707 > prevDate then
		Dprint ("Scripted Event : War With China Popup ACTIVATED !")
		for city in pGreece:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(WAR_CHINA, 1) end			
		end
	end
end

function WarChinaPopupJapan()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end
	local iJapan = GetPlayerIDFromCivID (JAPAN, false, true)
	local pJapan = Players[iJapan]
	if 19370707 <= turnDate and 19370707 > prevDate then
		Dprint ("Scripted Event : War With China Popup ACTIVATED !")
		for city in pJapan:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(WAR_CHINA, 1) end			
		end
	end
end

function WarChinaPopupChina()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end
	local iChina = GetPlayerIDFromCivID (CHINA, false, true)
	local pChina = Players[iChina]
	if 19370707 <= turnDate and 19370707 > prevDate then
		Dprint ("Scripted Event : War With China Popup ACTIVATED !")
		for city in pChina:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(WAR_CHINA, 1) end			
		end
	end
end

function WarChinaPopupItaly()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end
	local iItaly = GetPlayerIDFromCivID (ITALY, false, true)
	local pItaly = Players[iItaly]
	if 19370707 <= turnDate and 19370707 > prevDate then
		Dprint ("Scripted Event : War With China Popup ACTIVATED !")
		for city in pItaly:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(WAR_CHINA, 1) end			
		end
	end
end

----------------------------------------------------------------------------------------------------------------------------
-- USSR-Japan War Popup
----------------------------------------------------------------------------------------------------------------------------

function WarJapanPopupGermany()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end
	local iGermany = GetPlayerIDFromCivID (GERMANY, false, true)
	local pGermany = Players[iGermany]
	if 19450809 <= turnDate and 19450809 > prevDate then
		Dprint ("Scripted Event : War With Japan Popup ACTIVATED !")
		for city in pGermany:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(WAR_JAPAN, 1) end		
		end
	end
end

function WarJapanPopupFrance()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end
	local iFrance = GetPlayerIDFromCivID (FRANCE, false, true)
	local pFrance = Players[iFrance]
	if 19450809 <= turnDate and 19450809 > prevDate then
		Dprint ("Scripted Event : War With Japan Popup ACTIVATED !")
		for city in pFrance:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(WAR_JAPAN, 1) end		
		end
	end
end

function WarJapanPopupEngland()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end
	local iEngland = GetPlayerIDFromCivID (ENGLAND, false, true)
	local pEngland = Players[iEngland]
	if 19450809 <= turnDate and 19450809 > prevDate then
		Dprint ("Scripted Event : War With Japan Popup ACTIVATED !")
		for city in pEngland:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(WAR_JAPAN, 1) end			
		end
	end
end

function WarJapanPopupUSSR()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end
	local iUssr = GetPlayerIDFromCivID (USSR, false, true)
	local pUssr = Players[iUssr]
	if 19450809 <= turnDate and 19450809 > prevDate then
		Dprint ("Scripted Event : War With Japan Popup ACTIVATED !")
		for city in pUssr:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(WAR_JAPAN, 1) end			
		end
	end
end

function WarJapanPopupAmerica()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end
	local iAmerica = GetPlayerIDFromCivID (AMERICA, false, true)
	local pAmerica = Players[iAmerica]
	if 19450809 <= turnDate and 19450809 > prevDate then
		Dprint ("Scripted Event : War With Japan Popup ACTIVATED !")
		for city in pAmerica:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(WAR_JAPAN, 1) end		
		end
	end
end

function WarJapanPopupGreece()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end
	local iGreece = GetPlayerIDFromCivID (GREECE, false, true)
	local pGreece = Players[iGreece]
	if 19450809 <= turnDate and 19450809 > prevDate then
		Dprint ("Scripted Event : War With Japan Popup ACTIVATED !")
		for city in pGreece:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(WAR_JAPAN, 1) end			
		end
	end
end

function WarJapanPopupJapan()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end
	local iJapan = GetPlayerIDFromCivID (JAPAN, false, true)
	local pJapan = Players[iJapan]
	if 19450809 <= turnDate and 19450809 > prevDate then
		Dprint ("Scripted Event : War With Japan Popup ACTIVATED !")
		for city in pJapan:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(WAR_JAPAN, 1) end			
		end
	end
end

function WarJapanPopupChina()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end
	local iChina = GetPlayerIDFromCivID (CHINA, false, true)
	local pChina = Players[iChina]
	if 19450809 <= turnDate and 19450809 > prevDate then
		Dprint ("Scripted Event : War With Japan Popup ACTIVATED !")
		for city in pChina:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(WAR_JAPAN, 1) end			
		end
	end
end

function WarJapanPopupItaly()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end
	local iItaly = GetPlayerIDFromCivID (ITALY, false, true)
	local pItaly = Players[iItaly]
	if 19450809 <= turnDate and 19450809 > prevDate then
		Dprint ("Scripted Event : War With Japan Popup ACTIVATED !")
		for city in pItaly:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(WAR_JAPAN, 1) end			
		end
	end
end
----------------------------------------------------------------------------------------------------------------------------
-- Annex Austria Popup
----------------------------------------------------------------------------------------------------------------------------

function FallAustriaPopupGermany()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end
	local iGermany = GetPlayerIDFromCivID (GERMANY, false, true)
	local pGermany = Players[iGermany]
	if 19380302 <= turnDate and 19380302 > prevDate then
		Dprint ("Scripted Event : Annexation of Austria Popup ACTIVATED !")
		for city in pGermany:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(FALL_AUSTRIA, 1) end		
		end
	end
end

function FallAustriaPopupFrance()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end
	local iFrance = GetPlayerIDFromCivID (FRANCE, false, true)
	local pFrance = Players[iFrance]
	if 19380302 <= turnDate and 19380302 > prevDate then
		Dprint ("Scripted Event : Annexation of Austria Popup ACTIVATED !")
		for city in pFrance:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(FALL_AUSTRIA, 1) end		
		end
	end
end

function FallAustriaPopupEngland()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end
	local iEngland = GetPlayerIDFromCivID (ENGLAND, false, true)
	local pEngland = Players[iEngland]
	if 19380302 <= turnDate and 19380302 > prevDate then
		Dprint ("Scripted Event : Annexation of Austria Popup ACTIVATED !")
		for city in pEngland:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(FALL_AUSTRIA, 1) end			
		end
	end
end

function FallAustriaPopupUSSR()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end
	local iUssr = GetPlayerIDFromCivID (USSR, false, true)
	local pUssr = Players[iUssr]
	if 19380302 <= turnDate and 19380302 > prevDate then
		Dprint ("Scripted Event : Annexation of Austria Popup ACTIVATED !")
		for city in pUssr:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(FALL_AUSTRIA, 1) end			
		end
	end
end

function FallAustriaPopupAmerica()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end
	local iAmerica = GetPlayerIDFromCivID (AMERICA, false, true)
	local pAmerica = Players[iAmerica]
	if 19380302 <= turnDate and 19380302 > prevDate then
		Dprint ("Scripted Event : Annexation of Austria Popup ACTIVATED !")
		for city in pAmerica:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(FALL_AUSTRIA, 1) end		
		end
	end
end

function FallAustriaPopupGreece()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end
	local iGreece = GetPlayerIDFromCivID (GREECE, false, true)
	local pGreece = Players[iGreece]
	if 19380302 <= turnDate and 19380302 > prevDate then
		Dprint ("Scripted Event : Annexation of Austria Popup ACTIVATED !")
		for city in pGreece:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(FALL_AUSTRIA, 1) end		
		end
	end
end

function FallAustriaPopupJapan()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end
	local iJapan = GetPlayerIDFromCivID (JAPAN, false, true)
	local pJapan = Players[iJapan]
	if 19380302 <= turnDate and 19380302 > prevDate then
		Dprint ("Scripted Event : Annexation of Austria Popup ACTIVATED !")
		for city in pJapan:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(FALL_AUSTRIA, 1) end		
		end
	end
end

function FallAustriaPopupChina()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end
	local iChina = GetPlayerIDFromCivID (CHINA, false, true)
	local pChina = Players[iChina]
	if 19380302 <= turnDate and 19380302 > prevDate then
		Dprint ("Scripted Event : Annexation of Austria Popup ACTIVATED !")
		for city in pChina:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(FALL_AUSTRIA, 1) end		
		end
	end
end

function FallAustriaPopupItaly()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end
	local iItaly = GetPlayerIDFromCivID (ITALY, false, true)
	local pItaly = Players[iItaly]
	if 19380302 <= turnDate and 19380302 > prevDate then
		Dprint ("Scripted Event : Annexation of Austria Popup ACTIVATED !")
		for city in pItaly:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(FALL_AUSTRIA, 1) end		
		end
	end
end

----------------------------------------------------------------------------------------------------------------------------
-- Annex Czechoslovakia Popup
----------------------------------------------------------------------------------------------------------------------------

function FallCzechPopupGermany()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end
	local iGermany = GetPlayerIDFromCivID (GERMANY, false, true)
	local pGermany = Players[iGermany]
	if 19380316 <= turnDate and 19380316 > prevDate then
		Dprint ("Scripted Event : Annexation of Czechoslovakia Popup ACTIVATED !")
		for city in pGermany:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(FALL_CZECH, 1) end		
		end
	end
end

function FallCzechPopupFrance()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end
	local iFrance = GetPlayerIDFromCivID (FRANCE, false, true)
	local pFrance = Players[iFrance]
	if 19380316 <= turnDate and 19380316 > prevDate then
		Dprint ("Scripted Event : Annexation of Czechoslovakia Popup ACTIVATED !")
		for city in pFrance:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(FALL_CZECH, 1) end		
		end
	end
end

function FallCzechPopupEngland()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end
	local iEngland = GetPlayerIDFromCivID (ENGLAND, false, true)
	local pEngland = Players[iEngland]
	if 19380316 <= turnDate and 19380316 > prevDate then
		Dprint ("Scripted Event : Annexation of Czechoslovakia Popup ACTIVATED !")
		for city in pEngland:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(FALL_CZECH, 1) end			
		end
	end
end

function FallCzechPopupUSSR()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end
	local iUssr = GetPlayerIDFromCivID (USSR, false, true)
	local pUssr = Players[iUssr]
	if 19380316 <= turnDate and 19380316 > prevDate then
		Dprint ("Scripted Event : Annexation of Czechoslovakia Popup ACTIVATED !")
		for city in pUssr:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(FALL_CZECH, 1) end			
		end
	end
end

function FallCzechPopupAmerica()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end
	local iAmerica = GetPlayerIDFromCivID (AMERICA, false, true)
	local pAmerica = Players[iAmerica]
	if 19380316 <= turnDate and 19380316 > prevDate then
		Dprint ("Scripted Event : Annexation of Czechoslovakia Popup ACTIVATED !")
		for city in pAmerica:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(FALL_CZECH, 1) end		
		end
	end
end

function FallCzechPopupGreece()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end
	local iGreece = GetPlayerIDFromCivID (GREECE, false, true)
	local pGreece = Players[iGreece]
	if 19380316 <= turnDate and 19380316 > prevDate then
		Dprint ("Scripted Event : Annexation of Czechoslovakia Popup ACTIVATED !")
		for city in pGreece:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(FALL_CZECH, 1) end		
		end
	end
end

function FallCzechPopupJapan()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end
	local iJapan = GetPlayerIDFromCivID (JAPAN, false, true)
	local pJapan = Players[iJapan]
	if 19380316 <= turnDate and 19380316 > prevDate then
		Dprint ("Scripted Event : Annexation of Czechoslovakia Popup ACTIVATED !")
		for city in pJapan:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(FALL_CZECH, 1) end		
		end
	end
end

function FallCzechPopupChina()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end
	local iChina = GetPlayerIDFromCivID (CHINA, false, true)
	local pChina = Players[iChina]
	if 19380316 <= turnDate and 19380316 > prevDate then
		Dprint ("Scripted Event : Annexation of Czechoslovakia Popup ACTIVATED !")
		for city in pChina:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(FALL_CZECH, 1) end		
		end
	end
end

function FallCzechPopupItaly()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end
	local iItaly = GetPlayerIDFromCivID (ITALY, false, true)
	local pItaly = Players[iItaly]
	if 19380316 <= turnDate and 19380316 > prevDate then
		Dprint ("Scripted Event : Annexation of Czechoslovakia Popup ACTIVATED !")
		for city in pItaly:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(FALL_CZECH, 1) end		
		end
	end
end


----------------------------------------------------------------------------------------------------------------------------
-- Annex Baltic States Popup
----------------------------------------------------------------------------------------------------------------------------

function FallBalticPopupGermany()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end
	local iGermany = GetPlayerIDFromCivID (GERMANY, false, true)
	local pGermany = Players[iGermany]
	if 19400615 <= turnDate and 19400615 > prevDate then
		Dprint ("Scripted Event : Annexation of Baltic States Popup ACTIVATED !")
		for city in pGermany:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(FALL_BALTIC, 1) end		
		end
	end
end

function FallBalticPopupFrance()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end
	local iFrance = GetPlayerIDFromCivID (FRANCE, false, true)
	local pFrance = Players[iFrance]
	if 19400615 <= turnDate and 19400615 > prevDate then
		Dprint ("Scripted Event : Annexation of Baltic States Popup ACTIVATED !")
		for city in pFrance:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(FALL_BALTIC, 1) end		
		end
	end
end

function FallBalticPopupEngland()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end
	local iEngland = GetPlayerIDFromCivID (ENGLAND, false, true)
	local pEngland = Players[iEngland]
	if 19400615 <= turnDate and 19400615 > prevDate then
		Dprint ("Scripted Event : Annexation of Baltic States Popup ACTIVATED !")
		for city in pEngland:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(FALL_BALTIC, 1) end			
		end
	end
end

function FallBalticPopupUSSR()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end
	local iUssr = GetPlayerIDFromCivID (USSR, false, true)
	local pUssr = Players[iUssr]
	if 19400615 <= turnDate and 19400615 > prevDate then
		Dprint ("Scripted Event : Annexation of Baltic States Popup ACTIVATED !")
		for city in pUssr:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(FALL_BALTIC, 1) end			
		end
	end
end

function FallBalticPopupAmerica()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end
	local iAmerica = GetPlayerIDFromCivID (AMERICA, false, true)
	local pAmerica = Players[iAmerica]
	if 19400615 <= turnDate and 19400615 > prevDate then
		Dprint ("Scripted Event : Annexation of Baltic States Popup ACTIVATED !")
		for city in pAmerica:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(FALL_BALTIC, 1) end		
		end
	end
end

function FallBalticPopupGreece()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end
	local iGreece = GetPlayerIDFromCivID (GREECE, false, true)
	local pGreece = Players[iGreece]
	if 19400615 <= turnDate and 19400615 > prevDate then
		Dprint ("Scripted Event : Annexation of Baltic States Popup ACTIVATED !")
		for city in pGreece:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(FALL_BALTIC, 1) end		
		end
	end
end

function FallBalticPopupJapan()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end
	local iJapan = GetPlayerIDFromCivID (JAPAN, false, true)
	local pJapan = Players[iJapan]
	if 19400615 <= turnDate and 19400615 > prevDate then
		Dprint ("Scripted Event : Annexation of Baltic States Popup ACTIVATED !")
		for city in pJapan:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(FALL_BALTIC, 1) end		
		end
	end
end

function FallBalticPopupChina()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end
	local iChina = GetPlayerIDFromCivID (CHINA, false, true)
	local pChina = Players[iChina]
	if 19400615 <= turnDate and 19400615 > prevDate then
		Dprint ("Scripted Event : Annexation of Baltic States Popup ACTIVATED !")
		for city in pChina:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(FALL_BALTIC, 1) end		
		end
	end
end

function FallBalticPopupItaly()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end
	local iItaly = GetPlayerIDFromCivID (ITALY, false, true)
	local pItaly = Players[iItaly]
	if 19400615 <= turnDate and 19400615 > prevDate then
		Dprint ("Scripted Event : Annexation of Baltic States Popup ACTIVATED !")
		for city in pItaly:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(FALL_BALTIC, 1) end		
		end
	end
end
----------------------------------------------------------------------------------------------------------------------------
-- Lend Lease Popup
----------------------------------------------------------------------------------------------------------------------------

function EventLendLeasePopupGermany()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end
	local iGermany = GetPlayerIDFromCivID (GERMANY, false, true)
	local pGermany = Players[iGermany]
	if 19410311 <= turnDate and 19410311 > prevDate then
		Dprint ("Scripted Event : Lend Lease Popup ACTIVATED !")
		for city in pGermany:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(EVENT_LEND_LEASE, 1) end		
		end
	end
end

function EventLendLeasePopupFrance()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end
	local iFrance = GetPlayerIDFromCivID (FRANCE, false, true)
	local pFrance = Players[iFrance]
	if 19410311 <= turnDate and 19410311 > prevDate then
		Dprint ("Scripted Event : Lend Lease Popup ACTIVATED !")
		for city in pFrance:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(EVENT_LEND_LEASE, 1) end		
		end
	end
end

function EventLendLeasePopupEngland()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end
	local iEngland = GetPlayerIDFromCivID (ENGLAND, false, true)
	local pEngland = Players[iEngland]
	if 19410311 <= turnDate and 19410311 > prevDate then
		Dprint ("Scripted Event : Lend Lease Popup ACTIVATED !")
		for city in pEngland:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(EVENT_LEND_LEASE, 1) end			
		end
	end
end

function EventLendLeasePopupUSSR()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end
	local iUssr = GetPlayerIDFromCivID (USSR, false, true)
	local pUssr = Players[iUssr]
	if 19410311 <= turnDate and 19410311 > prevDate then
		Dprint ("Scripted Event : Lend Lease Popup ACTIVATED !")
		for city in pUssr:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(EVENT_LEND_LEASE, 1) end			
		end
	end
end

function EventLendLeasePopupAmerica()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end
	local iAmerica = GetPlayerIDFromCivID (AMERICA, false, true)
	local pAmerica = Players[iAmerica]
	if 19410311 <= turnDate and 19410311 > prevDate then
		Dprint ("Scripted Event : Lend Lease Popup ACTIVATED !")
		for city in pAmerica:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(EVENT_LEND_LEASE, 1) end		
		end
	end
end

function EventLendLeasePopupGreece()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end
	local iGreece = GetPlayerIDFromCivID (GREECE, false, true)
	local pGreece = Players[iGreece]
	if 19410311 <= turnDate and 19410311 > prevDate then
		Dprint ("Scripted Event : Lend Lease Popup ACTIVATED !")
		for city in pGreece:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(EVENT_LEND_LEASE, 1) end		
		end
	end
end

function EventLendLeasePopupJapan()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end
	local iJapan = GetPlayerIDFromCivID (JAPAN, false, true)
	local pJapan = Players[iJapan]
	if 19410311 <= turnDate and 19410311 > prevDate then
		Dprint ("Scripted Event : Lend Lease Popup ACTIVATED !")
		for city in pJapan:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(EVENT_LEND_LEASE, 1) end		
		end
	end
end

function EventLendLeasePopupChina()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end
	local iChina = GetPlayerIDFromCivID (CHINA, false, true)
	local pChina = Players[iChina]
	if 19410311 <= turnDate and 19410311 > prevDate then
		Dprint ("Scripted Event : Lend Lease Popup ACTIVATED !")
		for city in pChina:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(EVENT_LEND_LEASE, 1) end		
		end
	end
end

function EventLendLeasePopupItaly()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end
	local iItaly = GetPlayerIDFromCivID (ITALY, false, true)
	local pItaly = Players[iItaly]
	if 19410311 <= turnDate and 19410311 > prevDate then
		Dprint ("Scripted Event : Lend Lease Popup ACTIVATED !")
		for city in pItaly:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(EVENT_LEND_LEASE, 1) end		
		end
	end
end
----------------------------------------------------------------------------------------------------------------------------
-- Function Conditions for popups
----------------------------------------------------------------------------------------------------------------------------


function PolandHasFallen()
	local savedData = Modding.OpenSaveData()
	local iValue = savedData.GetValue("PolandHasFalled")
	if (iValue == 1) then
		return true
	else
		return false
	end
end

----------------------------------------------------------------------------------------------------------------------------
-- Fall of France Popup
----------------------------------------------------------------------------------------------------------------------------

function FallFrancePopupAmerica()
	
	local iAmerica = GetPlayerIDFromCivID (AMERICA, false, true)
	local pAmerica = Players[iAmerica]
	if FranceHasFallen() then
		Dprint ("Scripted Event : Fall of France Popup ACTIVATED !")
		for city in pAmerica:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(FALL_FRANCE, 1) end		
		end
	end
end


function FallFrancePopupGermany()
	
	local iGermany = GetPlayerIDFromCivID (GERMANY, false, true)
	local pGermany = Players[iGermany]
	if FranceHasFallen() then
		Dprint ("Scripted Event : Fall of France Popup ACTIVATED !")
		for city in pGermany:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(FALL_FRANCE, 1) end		
		end
	end
end

function FallFrancePopupEngland()
	
	local iEngland = GetPlayerIDFromCivID (ENGLAND, false, true)
	local pEngland = Players[iEngland]
	if FranceHasFallen() then
		Dprint ("Scripted Event : Fall of France Popup ACTIVATED !")
		for city in pEngland:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(FALL_FRANCE, 1) end		
		end
	end
end

function FallFrancePopupFrance()
	
	local iFrance = GetPlayerIDFromCivID (FRANCE, false, true)
	local pFrance = Players[iFrance]
	if FranceHasFallen() then
		Dprint ("Scripted Event : Fall of France Popup ACTIVATED !")
		for city in pFrance:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(FALL_FRANCE, 1) end		
		end
	end
end

function FallFrancePopupUSSR()
	
	local iUSSR = GetPlayerIDFromCivID (USSR, false, true)
	local pUSSR = Players[iUSSR]
	if FranceHasFallen() then
		Dprint ("Scripted Event : Fall of France Popup ACTIVATED !")
		for city in pUSSR:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(FALL_FRANCE, 1) end		
		end
	end
end

function FallFrancePopupItaly()
	
	local iItaly = GetPlayerIDFromCivID (ITALY, false, true)
	local pItaly = Players[iItaly]
	if FranceHasFallen() then
		Dprint ("Scripted Event : Fall of France Popup ACTIVATED !")
		for city in pItaly:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(FALL_FRANCE, 1) end		
		end
	end
end

function FallFrancePopupGreece()
	
	local iGreece = GetPlayerIDFromCivID (GREECE, false, true)
	local pGreece = Players[iGreece]
	if FranceHasFallen() then
		Dprint ("Scripted Event : Fall of France Popup ACTIVATED !")
		for city in pGreece:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(FALL_FRANCE, 1) end		
		end
	end
end

function FallFrancePopupJapan()
	
	local iJapan = GetPlayerIDFromCivID (JAPAN, false, true)
	local pJapan = Players[iJapan]
	if FranceHasFallen() then
		Dprint ("Scripted Event : Fall of France Popup ACTIVATED !")
		for city in pJapan:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(FALL_FRANCE, 1) end		
		end
	end
end

function FallFrancePopupChina()
	
	local iChina = GetPlayerIDFromCivID (CHINA, false, true)
	local pChina = Players[iChina]
	if FranceHasFallen() then
		Dprint ("Scripted Event : Fall of France Popup ACTIVATED !")
		for city in pChina:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(FALL_FRANCE, 1) end		
		end
	end
end

---------------------------------------------------------------------------------------------------------------------------
-- Fall of Poland Popup
----------------------------------------------------------------------------------------------------------------------------

function FallPolandPopupAmerica()
	
	local iAmerica = GetPlayerIDFromCivID (AMERICA, false, true)
	local pAmerica = Players[iAmerica]
	if PolandHasFallen() then
		Dprint ("Scripted Event : Fall of Poland Popup ACTIVATED !")
		for city in pAmerica:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(FALL_POLAND, 1) end		
		end
	end
end


function FallPolandPopupGermany()
	
	local iGermany = GetPlayerIDFromCivID (GERMANY, false, true)
	local pGermany = Players[iGermany]
	if PolandHasFallen() then
		Dprint ("Scripted Event : Fall of Poland Popup ACTIVATED !")
		for city in pGermany:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(FALL_POLAND, 1) end		
		end
	end
end

function FallPolandPopupEngland()
	
	local iEngland = GetPlayerIDFromCivID (ENGLAND, false, true)
	local pEngland = Players[iEngland]
	if PolandHasFallen() then
		Dprint ("Scripted Event : Fall of Poland Popup ACTIVATED !")
		for city in pEngland:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(FALL_POLAND, 1) end		
		end
	end
end

function FallPolandPopupFrance()
	
	local iFrance = GetPlayerIDFromCivID (FRANCE, false, true)
	local pFrance = Players[iFrance]
	if PolandHasFallen() then
		Dprint ("Scripted Event : Fall of Poland Popup ACTIVATED !")
		for city in pFrance:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(FALL_POLAND, 1) end		
		end
	end
end

function FallPolandPopupUSSR()
	
	local iUSSR = GetPlayerIDFromCivID (USSR, false, true)
	local pUSSR = Players[iUSSR]
	if PolandHasFallen() then
		Dprint ("Scripted Event : Fall of Poland Popup ACTIVATED !")
		for city in pUSSR:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(FALL_POLAND, 1) end		
		end
	end
end

function FallPolandPopupItaly()
	
	local iItaly = GetPlayerIDFromCivID (ITALY, false, true)
	local pItaly = Players[iItaly]
	if PolandHasFallen() then
		Dprint ("Scripted Event : Fall of Poland Popup ACTIVATED !")
		for city in pItaly:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(FALL_POLAND, 1) end		
		end
	end
end

function FallPolandPopupGreece()
	
	local iGreece = GetPlayerIDFromCivID (GREECE, false, true)
	local pGreece = Players[iGreece]
	if PolandHasFallen() then
		Dprint ("Scripted Event : Fall of Poland Popup ACTIVATED !")
		for city in pGreece:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(FALL_POLAND, 1) end		
		end
	end
end

function FallPolandPopupJapan()
	
	local iJapan = GetPlayerIDFromCivID (JAPAN, false, true)
	local pJapan = Players[iJapan]
	if PolandHasFallen() then
		Dprint ("Scripted Event : Fall of Poland Popup ACTIVATED !")
		for city in pJapan:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(FALL_POLAND, 1) end		
		end
	end
end

function FallPolandPopupChina()
	
	local iChina = GetPlayerIDFromCivID (CHINA, false, true)
	local pChina = Players[iChina]
	if PolandHasFallen() then
		Dprint ("Scripted Event : Fall of Poland Popup ACTIVATED !")
		for city in pChina:Cities() do
			if city:IsHasBuilding(PALACE) then city:SetNumRealBuilding(FALL_POLAND, 1) end		
		end
	end
end