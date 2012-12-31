-- ScriptAmericaEuro1936
-- Author: Gedemon
-- DateCreated: 8/23/2011 10:36:46 PM
--------------------------------------------------------------

print("Loading America/Europe 1936 Scripts...")
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
						if (x > 1 and x < 115)  then -- Germany
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
						plot:SetOwner(originalOwner, -1 ) 								 
					elseif originalOwner == iAustria and (x > 1 and x < 115)  then -- German territory
						plot:SetOwner(iGermany, -1 ) 
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

			local iSlovakia = GetPlayerIDFromCivID (SLOVAKIA, true, true)
			local pSlovakia = Players[iSlovakia]

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
						if (x > 1 and x < 93)  then -- Germany
							Dprint(" - " .. city:GetName() .. " is in Germany sphere...")	
							if city:GetOwner() ~= iGermany then 
								pGermany:AcquireCity(city, false, true)
								city:SetPuppet(false)
								city:ChangeResistanceTurns(-city:GetResistanceTurns())
							else -- just remove resistance if city was already occupied
								city:ChangeResistanceTurns(-city:GetResistanceTurns())
							end
						elseif (x > 93 and x < 98)  then -- Slovakia
								Dprint(" - " .. city:GetName() .. " is in Slovakia sphere...")	
								if city:GetOwner() ~= iSlovakia then 
									pSlovakia:AcquireCity(city, false, true)
									city:SetPuppet(false)
									city:ChangeResistanceTurns(-city:GetResistanceTurns())
								else -- just remove resistance if city was already occupied
									city:ChangeResistanceTurns(-city:GetResistanceTurns())
								end
						elseif (x > 98 and x < 110)  then -- Hungary
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
						plot:SetOwner(originalOwner, -1 ) 								 
					elseif originalOwner == iCzechosolvakia and (x > 1 and x < 93)  then -- German territory
						plot:SetOwner(iGermany, -1 ) 

					elseif originalOwner == iCzechosolvakia and (x > 93 and x < 98)  then -- Slovakia territory
						plot:SetOwner(iSlovakia, -1 ) 

					elseif originalOwner == iCzechosolvakia and (x > 98 and x < 110)  then -- Hungary territory
						plot:SetOwner(iHungary, -1 ) 

					end
				end
			end			
				
			Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes.NOTIFICATION_DIPLOMACY_DECLARATION, pCzechosolvakia:GetName() .. " has beeen annexed by Germany, Germany has now united with Czechosolvakia and created the Puppet Regime Slovakia.", pCzechosolvakia:GetName() .. " has been annexed !", -1, -1)

			savedData.SetValue("CzechosolvakiaHasFalled", 1)
		end
	end
end

-----------------------------------------
-- Annexation of Albania
-----------------------------------------
function AlbaniaAnnexation()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end

	if 19390407 <= turnDate and 19390407 > prevDate then
		Dprint ("-------------------------------------")
		Dprint ("Scripted Event : Albania Annexed !")

		local iItaly = GetPlayerIDFromCivID (ITALY, false, true)
		local pItaly = Players[iItaly]
			
		local team = Teams[ pItaly:GetTeam() ]
		Dprint("- Italy Selected ...")
		local savedData = Modding.OpenSaveData()
		local iValue = savedData.GetValue("AlbaniaHasFalled")
		if (iValue ~= 1) then
			Dprint("- First occurence, launching Fall of Albania script ...")

			local iAlbania = GetPlayerIDFromCivID (ALBANIA, true, true)
			local pAlbania = Players[iAlbania]

			for unit in pAlbania:Units() do 
				unit:Kill()
			end						

			Dprint("- Change Albania cities ownership ...")	
			for iPlotLoop = 0, Map.GetNumPlots()-1, 1 do
				local plot = Map.GetPlotByIndex(iPlotLoop)
				local x = plot:GetX()
				local y = plot:GetY()
				local plotKey = GetPlotKey ( plot )
				if plot:IsCity() then
					city = plot:GetPlotCity()
					local originalOwner = GetPlotFirstOwner(plotKey)
					if city:GetOwner() == iAlbania and originalOwner ~= iAlbania then -- liberate cities captured by Albania
						Dprint(" - " .. city:GetName() .. " was captured, liberate...")	
						local originalPlayer = Players[originalOwner]
						originalPlayer:AcquireCity(city, false, true)
						--city:SetOccupied(false) -- needed in this case ?
					elseif originalOwner == iAlbania then
						if (x > 1 and x < 115)  then -- Italy
							Dprint(" - " .. city:GetName() .. " is in Italian sphere...")	
							if city:GetOwner() ~= iItaly then 
								pItaly:AcquireCity(city, false, true)
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
					if originalOwner ~= iAlbania and ownerID == iAlbania then -- liberate plot captured by Albania
						plot:SetOwner(originalOwner, -1 ) 
								 
					elseif originalOwner == iAlbania and (x > 1 and x < 115)  then -- Italy territory
						plot:SetOwner(iItaly, -1 ) 

					end
				end
			end			
				
			Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes.NOTIFICATION_DIPLOMACY_DECLARATION, pAlbania:GetName() .. " has fallen to Italy, Italy has annexed Albania.", pAlbania:GetName() .. " has been annexed !", -1, -1)

			savedData.SetValue("AlbaniaHasFalled", 1)
		end
	end
end


-----------------------------------------
-- Annexation of Lithuania
-----------------------------------------
function LithuaniaAnnexation()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end

	if 19390615 <= turnDate and 19390615 > prevDate then
		Dprint ("-------------------------------------")
		Dprint ("Scripted Event : Lithuania Annexed !")

		local iUSSR = GetPlayerIDFromCivID (USSR, false, true)
		local pUSSR = Players[iUSSR]
			
		local team = Teams[ pUSSR:GetTeam() ]
		Dprint("- USSR Selected ...")
		local savedData = Modding.OpenSaveData()
		local iValue = savedData.GetValue("LithuaniaHasFalled")
		if (iValue ~= 1) then
			Dprint("- First occurence, launching Fall of Lithuania script ...")

			local iLithuania = GetPlayerIDFromCivID (LITHUANIA, true, true)
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
					if city:GetOwner() == iLithuania and originalOwner ~= iLithuania then -- liberate cities captured by Lithuania
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
						plot:SetOwner(originalOwner, -1 ) 
								 
					elseif originalOwner == iLithuania and (x > 1 and x < 115)  then -- USSR territory
						plot:SetOwner(iUSSR, -1 ) 

					end
				end
			end			
				
			Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes.NOTIFICATION_DIPLOMACY_DECLARATION, pLithuania:GetName() .. " has fallen to USSR, USSR has annexed Lithuania.", pLithuania:GetName() .. " has been annexed !", -1, -1)

			savedData.SetValue("LithuaniaHasFalled", 1)
		end
	end
end


-----------------------------------------
-- Annexation of Latvia
-----------------------------------------
function LatviaAnnexation()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end

	if 19390616 <= turnDate and 19390616 > prevDate then
		Dprint ("-------------------------------------")
		Dprint ("Scripted Event : Latvia Annexed !")

		local iUSSR = GetPlayerIDFromCivID (USSR, false, true)
		local pUSSR = Players[iUSSR]
			
		local team = Teams[ pUSSR:GetTeam() ]
		Dprint("- USSR Selected ...")
		local savedData = Modding.OpenSaveData()
		local iValue = savedData.GetValue("LatviaHasFalled")
		if (iValue ~= 1) then
			Dprint("- First occurence, launching Fall of Latvia script ...")

			local iLatvia = GetPlayerIDFromCivID (LATVIA, true, true)
			local pLatvia = Players[iLatvia]

			for unit in pLatvia:Units() do 
				unit:Kill()
			end						

			Dprint("- Change Latvia cities ownership ...")	
			for iPlotLoop = 0, Map.GetNumPlots()-1, 1 do
				local plot = Map.GetPlotByIndex(iPlotLoop)
				local x = plot:GetX()
				local y = plot:GetY()
				local plotKey = GetPlotKey ( plot )
				if plot:IsCity() then
					city = plot:GetPlotCity()
					local originalOwner = GetPlotFirstOwner(plotKey)
					if city:GetOwner() == iLatvia and originalOwner ~= iLatvia then -- liberate cities captured by Latvia
						Dprint(" - " .. city:GetName() .. " was captured, liberate...")	
						local originalPlayer = Players[originalOwner]
						originalPlayer:AcquireCity(city, false, true)
						--city:SetOccupied(false) -- needed in this case ?
					elseif originalOwner == iLatvia then
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
					if originalOwner ~= iLatvia and ownerID == iLatvia then -- liberate plot captured by Latvia
						plot:SetOwner(originalOwner, -1 ) 
								 
					elseif originalOwner == iLatvia and (x > 1 and x < 115)  then -- USSR territory
						plot:SetOwner(iUSSR, -1 ) 
					end
				end
			end			
				
			Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes.NOTIFICATION_DIPLOMACY_DECLARATION, pLatvia:GetName() .. " has fallen to USSR, USSR has annexed Latvia.", pLatvia:GetName() .. " has been annexed !", -1, -1)

			savedData.SetValue("LatviaHasFalled", 1)
		end
	end
end

-----------------------------------------
-- Annexation of Estonia
-----------------------------------------
function EstoniaAnnexation()
	
	local turn = Game.GetGameTurn()
	local turnDate, prevDate = 0, 0
	if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
	if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end

	if 19390616 <= turnDate and 19390616 > prevDate then
		Dprint ("-------------------------------------")
		Dprint ("Scripted Event : Estonia Annexed !")

		local iUSSR = GetPlayerIDFromCivID (USSR, false, true)
		local pUSSR = Players[iUSSR]
			
		local team = Teams[ pUSSR:GetTeam() ]
		Dprint("- USSR Selected ...")
		local savedData = Modding.OpenSaveData()
		local iValue = savedData.GetValue("EstoniaHasFalled")
		if (iValue ~= 1) then
			Dprint("- First occurence, launching Fall of Estonia script ...")

			local iEstonia = GetPlayerIDFromCivID (ESTONIA, true, true)
			local pEstonia = Players[iEstonia]

			for unit in pEstonia:Units() do 
				unit:Kill()
			end						

			Dprint("- Change Estonia cities ownership ...")	
			for iPlotLoop = 0, Map.GetNumPlots()-1, 1 do
				local plot = Map.GetPlotByIndex(iPlotLoop)
				local x = plot:GetX()
				local y = plot:GetY()
				local plotKey = GetPlotKey ( plot )
				if plot:IsCity() then
					city = plot:GetPlotCity()
					local originalOwner = GetPlotFirstOwner(plotKey)
					if city:GetOwner() == iEstonia and originalOwner ~= iEstonia then -- liberate cities captured by Estonia
						Dprint(" - " .. city:GetName() .. " was captured, liberate...")	
						local originalPlayer = Players[originalOwner]
						originalPlayer:AcquireCity(city, false, true)
						--city:SetOccupied(false) -- needed in this case ?
					elseif originalOwner == iEstonia then
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
					if originalOwner ~= iEstonia and ownerID == iEstonia then -- liberate plot captured by Estonia
						plot:SetOwner(originalOwner, -1 ) 
								 
					elseif originalOwner == iEstonia and (x > 1 and x < 115)  then -- USSR territory
						plot:SetOwner(iUSSR, -1 ) 

					end
				end
			end			
				
			Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes.NOTIFICATION_DIPLOMACY_DECLARATION, pEstonia:GetName() .. " has fallen to USSR, USSR has annexed Estonia.", pEstonia:GetName() .. " has been annexed !", -1, -1)

			savedData.SetValue("EstoniaHasFalled", 1)
		end
	end
end

-----------------------------------------
-- Fall of France
-----------------------------------------

function FallOfFrance(hexPos, playerID, cityID, newPlayerID)

	if not ALLOW_SCRIPTED_EVENTS then
		return
	end

	local cityPlot = Map.GetPlot( ToGridFromHex( hexPos.x, hexPos.y ) )
	
	local x, y = ToGridFromHex( hexPos.x, hexPos.y )
	local civID = GetCivIDFromPlayerID(newPlayerID, false)
	local pAxis = Players[newPlayerID]
	if x == 73 and y == 45 then -- city of Paris
	
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

				-- todo :
				-- save from units for UK, auto-send some units in Africa and give unit ownership to colony
				-- this will allow war and unit flipping side in colony whithout needing to make Vichy France enter war...
				Dprint("- Change french units ownership ...")
				local palmyraPlot = GetPlot (125,9)
				local palmyra = palmyraPlot:GetPlotCity()
				if palmyra:GetOwner() ~= iFrance then -- give back Palmyra to France
					EscapeUnitsFromPlot(palmyraPlot)
					Players[iFrance]:AcquireCity(palmyra, false, true)
					Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes.NOTIFICATION_DIPLOMACY_DECLARATION, palmyra:GetName() .. " has revolted and is joining Free France.", palmyra:GetName() .. " has revolted !", -1, -1)
				end
				
				local Air = {}
				local Sea = {}
				local Land = {}
				-- fill table, remove convoy
				for unit in pFrance:Units() do 
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
						data.Unit:SetXY(125,9) -- DAMASCUS
					else
						local rand = math.random( 1, 100 )
						local EnglandCity = GetCloseCity ( iEngland, data.Unit:GetPlot() , true)
					
						if rand <= 5 and EnglandCity then -- 5% chance to flew to England
							data.Unit:SetXY(EnglandCity:GetX(), EnglandCity:GetY())
							ChangeUnitOwner (data.Unit, iEngland)
						else -- Vichy metropole force
							data.Unit:SetXY(72, 39) -- VICHY
							ChangeUnitOwner (data.Unit, iVichy)
						end
					end
				end
				
				-- Land Units
				Dprint("   - Land units ...")
				for i, data in ipairs(Land) do
					-- save the best for the player
					if i == 1 then
						data.Unit:SetXY(125,9) -- DAMASCUS
					elseif data.Unit:GetUnitType() == FR_LEGION then -- Special treatment for Legion
						local rand = math.random( 1, 100 )
						if rand <= 25 then
							data.Unit:SetXY(72, 39) -- VICHY
							ChangeUnitOwner (data.Unit, iVichy)
						else
							data.Unit:SetXY(125,9) -- DAMASCUS
						end
					else
						local rand = math.random( 1, 100 )
						local EnglandCity = GetCloseCity ( iEngland, data.Unit:GetPlot() , true)
					
						if rand <= 5 and EnglandCity then -- 5% chance to flew to England
							data.Unit:SetXY(EnglandCity:GetX(), EnglandCity:GetY())
							ChangeUnitOwner (data.Unit, iEngland)
						else -- Vichy metropole force
							data.Unit:SetXY(72, 39) -- VICHY
							ChangeUnitOwner (data.Unit, iVichy)
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
						if ((x < 69 and y > 32) or (y > 42 and x < 87)) then -- occupied territory
							--Dprint("(".. x ..",".. y ..") = City in occupied territory")
							if city:GetOwner() ~= newPlayerID then 
								EscapeUnitsFromPlot(plot)
								pAxis:AcquireCity(city, false, true)
								city:SetPuppet(false)
								city:ChangeResistanceTurns(-city:GetResistanceTurns())
							else -- just remove resistance if city was already occupied
								city:ChangeResistanceTurns(-city:GetResistanceTurns())
							end
						elseif (y > 32 and x < 76) then -- Vichy territory
							--Dprint("(".. x ..",".. y ..") = City in Vichy territory")
							EscapeUnitsFromPlot(plot)
							pVichy:AcquireCity(city, false, true)
							--city:SetOccupied(false)
							city:SetPuppet(false)
							city:SetNumRealBuilding(COURTHOUSE, 1) -- above won't work, try workaround...
							city:ChangeResistanceTurns(-city:GetResistanceTurns())
						elseif (y > 0 and x < 90) then -- Vichy African territory
							--Dprint("(".. x ..",".. y ..") = City in Vichy territory")
							EscapeUnitsFromPlot(plot)
							pVichy:AcquireCity(city, false, true)
							--city:SetOccupied(false)
							city:SetPuppet(false)
							city:SetNumRealBuilding(COURTHOUSE, 1) -- above won't work, try workaround...
							city:ChangeResistanceTurns(-city:GetResistanceTurns())
						elseif (y > 26 and x > 76 and y < 35 and x < 79) then -- Nice, Ajaccio to Italy
							--Dprint("(".. x ..",".. y ..") = City in Italy occupied territory")
							if city:GetOwner() ~= iItaly then
								EscapeUnitsFromPlot(plot)
								pItaly:AcquireCity(city, false, true)
								city:SetPuppet(false)
								city:ChangeResistanceTurns(-city:GetResistanceTurns())
							end
						elseif (y > 44 and x > 76 and y < 47 and x < 81) then -- Metz, Strasbourg to Germany
							--Dprint("(".. x ..",".. y ..") = City in Germany occupied territory")
							if city:GetOwner() ~= iGermany then
								EscapeUnitsFromPlot(plot)
								pGermany:AcquireCity(city, false, true)
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
							plot:SetOwner(originalOwner, -1 ) 
						elseif ownerID ~= iVichy and originalOwner == iFrance and ((x < 69 and y > 32) or (y > 42 and x < 87)) then -- occupied territory
							--Dprint("(".. x ..",".. y ..") = Plot in occupied territory")
							if plot:IsCity() and ownerID ~= newPlayerID then -- handle already captured french cities
								local city = plot:GetPlotCity()
								EscapeUnitsFromPlot(plot)
								Players[newPlayerID]:AcquireCity(city, false, true)
							else
								plot:SetOwner(newPlayerID, -1 ) 
							end
						elseif originalOwner == iFrance and ((y > 32 and x < 76))  then -- Vichy territory
							--Dprint("(".. x ..",".. y ..") = Plot in Vichy territory")
							if plot:IsCity() and ownerID ~= iVichy then
								local city = plot:GetPlotCity()
								EscapeUnitsFromPlot(plot)
								Players[iVichy]:AcquireCity(city, false, true)
							else
								plot:SetOwner(iVichy, -1 ) 
							end
						elseif originalOwner == iFrance and (y > 26 and x > 76 and y < 38 and x < 79) then -- Nice, Ajaccio region to Italy
							--Dprint("(".. x ..",".. y ..") = Plot in Italy occupied territory")
							if plot:IsCity() and ownerID ~= iItaly then
								local city = plot:GetPlotCity()
								EscapeUnitsFromPlot(plot)
								Players[iItaly]:AcquireCity(city, false, true)
							else
								plot:SetOwner(iItaly, -1 ) 
							end
						elseif originalOwner == iFrance and (y > 40 and x > 76 and y < 47 and x < 81) then -- Metz, Strasbourg region to Germany
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

function ConvertToFreeFrance (iAttackingPlayer, iAttackingUnit, attackerDamage, attackerFinalDamage, attackerMaxHP, iDefendingPlayer, iDefendingUnit, defenderDamage, defenderFinalDamage, defenderMaxHP)

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

					local diffDamage = attackerDamage - defenderDamage
					local defenderHealth = defenderMaxHP - defenderFinalDamage
					local defenderHealthRatio =  defenderHealth / defenderMaxHP * rand -- 0 to 100
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
	if x == 98 and y == 48 then -- city of Warsaw 
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
								if (x > 92 and x < 96)  then -- Germany
									Dprint(" - " .. city:GetName() .. " is in Germany sphere...")	
									if city:GetOwner() ~= iGermany then 
										pGermany:AcquireCity(city, false, true)
										city:SetPuppet(false)
										city:ChangeResistanceTurns(-city:GetResistanceTurns())
									else -- just remove resistance if city was already occupied
										city:ChangeResistanceTurns(-city:GetResistanceTurns())
									end
								elseif (x > 100 and x < 106) then -- USSR
									Dprint(" - " .. city:GetName() .. " is in USSR sphere...")
									if city:GetOwner() ~= iUSSR then 
										pUSSR:AcquireCity(city, false, true)
										city:SetPuppet(false)
										city:ChangeResistanceTurns(-city:GetResistanceTurns())
									else -- just remove resistance if city was already occupied
										city:ChangeResistanceTurns(-city:GetResistanceTurns())
									end
								elseif (x > 97 and x < 99) then -- Central cities to Warsaw conqueror
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

							elseif originalOwner == iPoland and (x > 92 and x < 96)  then -- German territory
								plot:SetOwner(iGermany, -1 ) 
							elseif originalOwner == iPoland and (x > 97 and x < 99) then -- Central territory
								plot:SetOwner(newPlayerID, -1 ) 
							elseif originalOwner == iPoland and (x > 100 and x < 106) then -- USSR Territory
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
	if x == 88 and y == 57 then -- city of Copenhagen 
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
							if (x > 81 and x < 110)  then -- Germany
								Dprint(" - " .. city:GetName() .. " is in Germany sphere...")	
								if city:GetOwner() ~= iGermany then 
									pGermany:AcquireCity(city, false, true)
									city:SetPuppet(false)
									city:ChangeResistanceTurns(-city:GetResistanceTurns())
								else -- just remove resistance if city was already occupied
									city:ChangeResistanceTurns(-city:GetResistanceTurns())
								end
							elseif (x > 2 and x < 81) then -- AMERICA
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
	if x == 89 and y == 66 then -- city of Oslo 
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
				
		Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes.NOTIFICATION_DIPLOMACY_DECLARATION, " America has passed the Lend Lease Act, France, the United Kingdom and the USSR will recieve extra convoys.", "Lend Lease Act Passed!")
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
	local suezPlot = GetPlot(118,2) -- Suez
	if suezPlot:GetOwner() == GetPlayerIDFromCivID (ENGLAND, false, true) then
		return true
	else
		return false
	end
end
function IsJacksonvilleAlly()
	local jacksonvillePlot = GetPlot(0,12) -- Jacksonville
	if jacksonvillePlot:GetOwner() == GetPlayerIDFromCivID (AMERICA, false, true) then
		return true
	else
		return false
	end
end
function IsSuezOccupied()
	local suezPlot = GetPlot(118,2) -- Suez
	if suezPlot:GetOwner() == GetPlayerIDFromCivID (ENGLAND, false, true) then
		return false
	else
		return true
	end
end

function IsRailOpenMurmansktoMoscow()
	local plotMurmansk = GetPlot(109,85)
	local plotMoscow = GetPlot(116,58)
	local ussr = Players[GetPlayerIDFromCivID(USSR, false)]

	return isPlotConnected( ussr , plotMurmansk, plotMoscow, "Road", false, nil , PathBlocked)
	
end
function IsRailOpenSueztoStalingrad()
	local plotSuez = GetPlot(118,2)
	local plotStalingrad = GetPlot(127,48)
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

function GetUStoFranceTransport()
	local rand = math.random( 1, 4 ) -- a simple way for making diverse convoy type for test purpose.
	local transport
	if rand == 1 then
		transport = {Type = TRANSPORT_MATERIEL, Reference = 500} -- Reference is quantity of materiel, personnel or gold. For TRANSPORT_UNIT, Reference is the unit type ID
	elseif rand == 2 then 
		transport = {Type = TRANSPORT_PERSONNEL, Reference = 200}
	elseif rand == 3 then 
		transport = {Type = TRANSPORT_UNIT, Reference = FR_HAWK75}
	elseif rand == 4 then 
		transport = {Type = TRANSPORT_GOLD, Reference = 400}
	end
	
	return transport
end
function GetUStoUKTransport()
	local rand = math.random( 1, 3 )
	local transport
	if rand == 1 then
		transport = {Type = TRANSPORT_MATERIEL, Reference = 800} 
	elseif rand == 2 then 
		transport = {Type = TRANSPORT_PERSONNEL, Reference = 400}
	elseif rand == 3 then 
		transport = {Type = TRANSPORT_GOLD, Reference = 500}
	end
	
	return transport
end
function GetSueztoUKTransport()
	local rand = math.random( 1, 4 )
	local transport
	if rand == 1 then
		transport = {Type = TRANSPORT_MATERIEL, Reference = 250} 
	elseif rand == 2 then 
		transport = {Type = TRANSPORT_PERSONNEL, Reference = 300}
	elseif rand == 3 then 
		transport = {Type = TRANSPORT_UNIT, Reference = UK_INFANTRY}
	elseif rand == 4 then 
		transport = {Type = TRANSPORT_GOLD, Reference = 350}
	end
	
	return transport
end
function GetSueztoUSTransport()
	local rand = math.random( 1, 2 )
	local transport
	if rand == 1 then
		transport = {Type = TRANSPORT_MATERIEL, Reference = 500} 
	elseif rand == 2 then 
		transport = {Type = TRANSPORT_GOLD, Reference = 600}
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
function GetSueztoFranceTransport()
	local rand = math.random( 1, 4 )
	local transport
	if rand == 1 then
		transport = {Type = TRANSPORT_MATERIEL, Reference = 200} 
	elseif rand == 2 then 
		transport = {Type = TRANSPORT_PERSONNEL, Reference = 250}
	elseif rand == 3 then 
		transport = {Type = TRANSPORT_UNIT, Reference = FR_INFANTRY}
	elseif rand == 4 then 
		transport = {Type = TRANSPORT_GOLD, Reference = 300}
	end
	
	return transport
end
function GetFinlandtoGermanyTransport()
	local transport = {Type = TRANSPORT_MATERIEL, Reference = 125}
	return transport
end
function GetNorwaytoGermanyTransport()
	local transport = {Type = TRANSPORT_MATERIEL, Reference = 225}
	return transport
end
function GetSueztoUSSRTransport()
	local rand = math.random( 1, 2 )
	local transport
	if rand == 1 then
		transport = {Type = TRANSPORT_MATERIEL, Reference = 150} 
	elseif rand == 2 then 
		transport = {Type = TRANSPORT_GOLD, Reference = 100}
	end
	
	return transport
end
function GetUStoUSSRTransport()
	local rand = math.random( 1, 2 )
	local transport
	if rand == 1 then
		transport = {Type = TRANSPORT_MATERIEL, Reference = 900} 
	elseif rand == 2 then 
		transport = {Type = TRANSPORT_GOLD, Reference = 400}
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
SUEZ_TO_UK = 7
SUEZ_TO_UK_2 = 8
SUEZ_TO_FRANCE = 9
SUEZ_TO_ITALY = 10
US_TO_USSR = 11
US_TO_USSR_2 = 12
NORWAY_TO_GERMANY = 13
SWEDEN_TO_GERMANY = 14
SUEZ_TO_US = 15

-- Convoy table
g_Convoy = { 
	[US_TO_FRANCE] = {
		Name = "US to France",
		SpawnList = { {X=3, Y=36}, {X=4, Y=38}, {X=3, Y=37}, {X=4, Y=37}, }, -- Adjacent Phylidelphia
		RandomSpawn = true, -- true : random choice in spawn list
		DestinationList = { {X=66, Y=42}, {X=66, Y=45}, {X=74, Y=50}, {X=74, Y=34}, }, -- La Rochelle, St Nazaire, Dunkerque, Marseille
		RandomDestination = false, -- false : sequential try in destination list
		CivID = FRANCE,
		MaxFleet = 1, -- how many convoy can use that route at the same time (not implemented)
		Frequency = 20, -- probability (in percent) of convoy spawning at each turn
		Condition = IsRouteOpenUStoFrance, -- Must refer to a function, remove this line to use the default condition (true)
		UnloadCondition = function() return true; end, -- Must refer to a function, remove this line to use the default condition (true)
		Transport = GetUStoFranceTransport, -- Must refer to a function, remove this line to use the default function
	},
	[US_TO_FRANCE_2] = {
		Name = "US to France",
		SpawnList = { {X=3, Y=36}, {X=4, Y=38}, {X=3, Y=37}, {X=4, Y=37}, }, -- Adjacent Phylidelphia
		RandomSpawn = true, -- true : random choice in spawn list
		DestinationList = { {X=66, Y=42}, {X=66, Y=45}, {X=74, Y=50}, {X=74, Y=34}, }, -- La Rochelle, St Nazaire, Dunkerque, Marseille
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
		SpawnList = { {X=4, Y=41}, {X=5, Y=44}, {X=4, Y=39}, {X=7, Y=44}, }, -- Adjacent to New York, Boston,
		RandomSpawn = true, -- true : random choice in spawn list
		DestinationList = { {X=67, Y=52}, {X=69, Y=57}, {X=72, Y=52}, {X=73, Y=65}, }, -- Plymouth, Liverpool, London, Aberdeen
		RandomDestination = false, -- false : sequential try in destination list
		CivID = ENGLAND,
		MaxFleet = 1,
		Frequency = 25, -- probability (in percent) of convoy spawning at each turn
		-- Condition = IsRouteOpenUStoUK, -- no special condition here, let the spawning function do the job...
		Transport = GetUStoUKTransport,
	},
	[US_TO_UK_2] = {
		Name = "US to UK",
		SpawnList = { {X=4, Y=41}, {X=5, Y=44}, {X=4, Y=39}, {X=7, Y=44}, }, -- Adjacent to New York, Boston,
		RandomSpawn = true, -- true : random choice in spawn list
		DestinationList = { {X=67, Y=52}, {X=69, Y=57}, {X=72, Y=52}, {X=73, Y=65}, }, -- Plymouth, Liverpool, London, Aberdeen
		RandomDestination = false, -- false : sequential try in destination list
		CivID = ENGLAND,
		MaxFleet = 1,
		Frequency = 40, -- probability (in percent) of convoy spawning at each turn
		Condition = IsRouteOpenLendLease, 
		Transport = GetUStoUKTransport,
	},
	[US_TO_UK_3] = {
		Name = "US to UK",
		SpawnList = { {X=4, Y=41}, {X=5, Y=44}, {X=4, Y=39}, {X=7, Y=44}, }, -- Adjacent to New York, Boston,
		RandomSpawn = true, -- true : random choice in spawn list
		DestinationList = { {X=67, Y=52}, {X=69, Y=57}, {X=72, Y=52}, {X=73, Y=65}, }, -- Plymouth, Liverpool, London, Aberdeen
		RandomDestination = false, -- false : sequential try in destination list
		CivID = ENGLAND,
		MaxFleet = 1,
		Frequency = 15, -- probability (in percent) of convoy spawning at each turn
		Condition = IsRouteOpenLendLease, 
		Transport = GetUStoUKTransport,
	},
	[FINLAND_TO_GERMANY] = {
		Name = "Finland to Germany",
		SpawnList = { {X=101, Y=77}, }, -- adjacent to Oulu
		RandomSpawn = false,
		DestinationList = { {X=97, Y=53}, {X=91, Y=52}, {X=86, Y=54}, }, -- Konigsberg, Stettin, Kiel
		RandomDestination = false,
		CivID = GERMANY,
		MaxFleet = 1, 
		Frequency = 35,
		Condition = IsRouteOpenFinlandtoGermany,
		Transport = GetFinlandtoGermanyTransport,
	},
	[SUEZ_TO_UK] = {
		Name = "Suez to UK",
		SpawnList = { {X=118, Y=5}, },
		RandomSpawn = false, -- true : random choice in spawn list
		DestinationList = { {X=67, Y=52}, {X=69, Y=57}, {X=72, Y=52}, }, -- Plymouth, Liverpool, London
		RandomDestination = false, -- false : sequential try in destination list
		CivID = ENGLAND,
		MaxFleet = 1,
		Frequency = 25, -- probability (in percent) of convoy spawning at each turn
		Condition = IsSuezAlly,
		Transport = GetSueztoUKTransport,
	},
	[SUEZ_TO_UK_2] = {
		Name = "Suez to UK",
		SpawnList = { {X=118, Y=7}, },
		RandomSpawn = false, -- true : random choice in spawn list
		DestinationList = { {X=67, Y=52}, {X=69, Y=57}, {X=72, Y=52}, }, -- Plymouth, Liverpool, London
		RandomDestination = false, -- false : sequential try in destination list
		CivID = ENGLAND,
		MaxFleet = 1,
		Frequency = 15, -- probability (in percent) of convoy spawning at each turn
		Condition = IsSuezAlly,
		Transport = GetSueztoUKTransport,
	},
	[SUEZ_TO_FRANCE] = {
		Name = "Suez to France",
		SpawnList = { {X=119, Y=5}, },
		RandomSpawn = false, -- true : random choice in spawn list
		DestinationList = { {X=74, Y=34}, }, -- Marseille
		RandomDestination = false, -- false : sequential try in destination list
		CivID = FRANCE,
		MaxFleet = 1,
		Frequency = 20, -- probability (in percent) of convoy spawning at each turn
		Condition = IsSuezAlly,
		Transport = GetSueztoFranceTransport,
	},
	[SUEZ_TO_ITALY] = {
		Name = "Suez to Italy",
		SpawnList = { {X=117, Y=5}, },
		RandomSpawn = false, -- true : random choice in spawn list
		DestinationList = { {X=89, Y=19}, {X=86, Y=25}, {X=84, Y=28}, }, -- Reggio Calabria, Naples, Rome
		RandomDestination = false, -- false : sequential try in destination list
		CivID = ITALY,
		MaxFleet = 1,
		Frequency = 20, -- probability (in percent) of convoy spawning at each turn
		Condition = IsSuezOccupied,
		Transport = GetSueztoItalyTransport,
	},
	[US_TO_USSR] = {
		Name = "US to USSR",
		SpawnList = { {X=4, Y=39}, {X=5, Y=44}, {X=3, Y=37}, {X=3, Y=3}, }, -- Adjacent to New York, Boston, Phylidelphia, Miami
		RandomSpawn = true, -- true : random choice in spawn list
		DestinationList = { {X=110, Y=85}, }, -- Murmansk
		RandomDestination = false, -- false : sequential try in destination list
		CivID = USSR,
		MaxFleet = 1,
		Frequency = 20, -- probability (in percent) of convoy spawning at each turn
		Condition = IsRailOpenMurmansktoMoscow,
		UnloadCondition = IsRailOpenMurmansktoMoscow,
		Transport = GetSueztoUSSRTransport,
	},
	[US_TO_USSR_2] = {
		Name = "US to USSR",
		SpawnList = { {X=1, Y=33}, {X=5, Y=45}, {X=3, Y=28}, {X=3, Y=27}, }, -- Adjacent to Baltimore, Boston, Virginia Beach
		RandomSpawn = true, -- true : random choice in spawn list
		DestinationList = { {X=110, Y=85}, }, -- Murmansk
		RandomDestination = false, -- false : sequential try in destination list
		CivID = USSR,
		MaxFleet = 1,
		Frequency = 50, -- probability (in percent) of convoy spawning at each turn
		Condition = IsRouteOpenLendLease, 
		UnloadCondition = IsRailOpenMurmansktoMoscow,
		Transport = GetSueztoUSSRTransport,
	},
	[NORWAY_TO_GERMANY] = {
		Name = "Norway to Germany",
		SpawnList = { {X=95, Y=85}, }, -- adjacent to Narvik
		RandomSpawn = false,
		DestinationList = { {X=86, Y=54}, {X=91, Y=52}, }, -- Kiel, Stettin
		RandomDestination = false,
		CivID = GERMANY,
		MaxFleet = 1, 
		Frequency = 60,
		Condition = IsRouteOpenNorwaytoGermany,
		Transport = GetNorwaytoGermanyTransport,
	},
	[SWEDEN_TO_GERMANY] = {
		Name = "Sweden to Germany",
		SpawnList = { {X=100, Y=77}, }, -- adjacent to Lulea
		RandomSpawn = false,
		DestinationList = { {X=97, Y=53}, {X=91, Y=52}, {X=86, Y=54}, }, -- Konigsberg, Stettin, Kiel
		RandomDestination = false,
		CivID = GERMANY,
		MaxFleet = 1, 
		Frequency = 35,
		Condition = IsRouteOpenSwedentoGermany, 
		Transport = GetFinlandtoGermanyTransport, -- re-use Finland values...
	},
	[SUEZ_TO_US] = {
		Name = "Suez to America",
		SpawnList = { {X=118, Y=6}, },
		RandomSpawn = false, -- true : random choice in spawn list
		DestinationList = { {X=3, Y=40}, }, -- New York
		RandomDestination = false, -- false : sequential try in destination list
		CivID = AMERICA,
		MaxFleet = 1,
		Frequency = 20, -- probability (in percent) of convoy spawning at each turn
		Condition = IsSuezAlly,
		Transport = GetSueztoUSTransport,
	},
}