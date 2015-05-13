--------------------------------------------------------------
--------------------------------------------------------------
-- Lua RedUnitFunctions
-- Author: Gedemon
-- DateCreated: 7/15/2011 1:28:32 AM
--------------------------------------------------------------
--------------------------------------------------------------

print("Loading Red Units Functions...")
print("-------------------------------------")

--------------------------------------------------------------
-- units capture tiles
--------------------------------------------------------------

function UnitCaptureTile(playerID, UnitID, x, y)
	local bDebug = false
	local plot = Map.GetPlot(x,y)
	if (plot == nil) then
		return
	end
	
	if ( plot:IsCity() or plot:IsWater() ) then
		return
	end

	-- check here if an unit can't capture a tile and return
	local player = Players[ playerID ]
	local unit = player:GetUnitByID(UnitID)
	local unitClassID = unit:GetUnitClassType()
	if not ( CanCaptureTile(unitClassID) ) then
		return
	end

	local plotKey = GetPlotKey ( plot )
	local ownerID = plot:GetOwner()

	-- If the unit is moving on another player territory...
	if (playerID ~= ownerID and ownerID ~= -1) then
		Dprint("-------------------------------------", bDebug)
		Dprint("Unit moving on tile ("..x..","..y..") is in another civ (id="..ownerID..") territory", bDebug)

		local player2 = Players[ ownerID ]		
		local team = Teams[ player:GetTeam() ]
		local team2 = Teams[ player2:GetTeam() ]

		-- If we are at war with the other player :
		if team:IsAtWar( player2:GetTeam() ) then
			Dprint(" - Unit owner (id="..playerID..") and tile owner (id="..ownerID..") are at war", bDebug)
			firstOwner = GetPlotFirstOwner( plotKey )	
					
			if (firstOwner == -1) then
				firstOwner = ownerID -- assume that current owner is also the first owner when there wasn't one on map initialization
			end

			-- liberating our territory
			if (firstOwner == playerID) then
				Dprint(" - Unit is liberating it's own territory", bDebug)
				g_FixedPlots[plotKey] = true
				plot:SetOwner(playerID, -1 )

			-- capturing current owner territory			
			elseif ( ownerID == firstOwner) then
				Dprint(" - Unit is capturing territory", bDebug)				
				g_FixedPlots[plotKey] = true
				plot:SetOwner(playerID, -1 )

			else
				-- don't free old owner territory if we're at war !
				local player3 = Players[ firstOwner ]				
				if team:IsAtWar( player3:GetTeam() ) then
					Dprint(" - Unit is capturing territory, old owner civ (id=".. firstOwner ..") is also at war with unit owner", bDebug)
					g_FixedPlots[plotKey] = true
					plot:SetOwner(playerID, -1 )

				elseif ( not player3:IsAlive() ) then
					Dprint(" - Unit is capturing territory, old owner civ (id=".. firstOwner ..") is dead", bDebug)
					g_FixedPlots[plotKey] = true
					plot:SetOwner(playerID, -1 )

				else
				-- liberating old owner territory
					Dprint(" - Unit is liberating this territory belonging to another civ (id=".. firstOwner ..")", bDebug)
					g_FixedPlots[plotKey] = true
					plot:SetOwner(firstOwner, -1 )	

					if player3:IsMinorCiv() and not player:IsMinorCiv() then
						player3:ChangeMinorCivFriendshipWithMajor( playerID, LIBERATE_MINOR_TERRITORY_BONUS ) -- give diplo bonus for liberating minor territory
					end
				end
			end
		end
	end

end
-- GameEvents.UnitSetXY.Add( UnitCaptureTile )
-- add to Events after map initialization (or re-loading) in RedEuro1940.Lua or other scenario Lua file


--------------------------------------------------------------
-- Units renaming
-- to do : make it scenario dependant ? allow defined strings ?
--------------------------------------------------------------
function UnitName(playerID, unitID, num) -- num = number of unit of this type
	
	local bDebug = false
	local player = Players[ playerID ]
	local unit = player:GetUnitByID( unitID )

	--Dprint("-------------------------------------", bDebug)
	Dprint ("Renaming new unit...", bDebug)
	local unitType = unit:GetUnitType()
	local unitClassType = unit:GetUnitClassType()
	local numType = g_Unit_Classes[unitClassType].NumType or -1
	local str = nil

	--------------------------------------------- France ---------------------------------------------
	if ( GetCivIDFromPlayerID (playerID) == FRANCE ) then		
		if ( numType == CLASS_INFANTRY ) then
			if (num == 1) then
				str = "1ere "
			else			
				str = num .. "eme "
			end
			str = str .. "Division d'infanterie"
			unit:SetName(str)
		end	
		if ( numType == CLASS_INFANTRY_2 ) then
			if (num == 1) then
				str = "1er "
			else			
				str = num .. "eme "
			end
			str = str .. "Regiment etranger d'infanterie"
			unit:SetName(str)
		end
		if ( numType == CLASS_PARATROOPER ) then
			if (num == 1) then
				str = "1er "
			else			
				str = num .. "eme "
			end
			str = str .. "Regiment de Chasseurs Parachutistes"
			unit:SetName(str)
		end
		if ( numType == CLASS_SPECIAL_FORCES ) then
			if (num == 1) then
				str = "1ere "
			else			
				str = num .. "eme "
			end
			str = str .. "Compagnie d'Infanterie de l'Air"
			unit:SetName(str)
		end
		if ( numType == CLASS_MECHANIZED_INFANTRY ) then
			if (num == 1) then
				str = "1ere "
			else			
				str = num .. "eme "
			end
			str = str .. "Division d'Infantrie Motorisee"
			unit:SetName(str)
		end
		if IsArmorClass( numType ) then
			if (num == 1) then
				str = "1ere "
			else			
				str = num .. "eme "
			end
			str = str .. "Division blindee"
			unit:SetName(str)
		end
		if ( numType == CLASS_ARTILLERY ) then
			if (num == 1) then
				str = "1er "
			else			
				str = num .. "eme "
			end
			str = str .. "Regiment d'artillerie"
			unit:SetName(str)
		end
		if IsFighterClass( numType  ) then
			if (num == 1) then
				str = "1er "
			else			
				str = num .. "eme "
			end
			str = str .. "Escadron de chasse"
			unit:SetName(str)
		end
		if IsBomberClass( numType  ) then
			if (num == 1) then
				str = "1er "
			else			
				str = num .. "eme "
			end
			str = str .. "Escadron de bombardement"
			unit:SetName(str)
		end
		if ( unitType == FR_BATTLESHIP ) then
			local name = { "Dunkerque", "Strasbourg"}
			if (num <= # name) then
				str = name[num]
				unit:SetName(str)
			end
		end
		if ( unitType == FR_GALISSONIERE ) then
			local name = { "La Galissonniere", "Montcalm", "Georges Leygues", "Jean de Vienne", "Marseillaise", "Gloire"}
			if (num <= # name) then
				str = name[num]
				unit:SetName(str)
			end
		end
		if ( unitType == FR_BATTLESHIP_2 ) then
			local name = { "Richelieu", "Jean Bart", "Clemenceau", "Gascogne"}
			if (num <= # name) then
				str = name[num]
				unit:SetName(str)
			end
		end

	--------------------------------------------- Germany ---------------------------------------------
	elseif ( GetCivIDFromPlayerID (playerID) == GERMANY ) then
 		
		if ( numType == CLASS_INFANTRY ) then
			str = num .. ". Infanterie-Division"
			unit:SetName(str)
		end
		if ( numType == CLASS_INFANTRY_2 ) then
			str = num .. ". Waffen-Grenadier-Division der SS"
			unit:SetName(str)
		end	
		if ( numType == CLASS_PARATROOPER ) then
			str = num .. ". Fallschirm-Jager-Division"
			unit:SetName(str)
		end	
		if ( numType == CLASS_SPECIAL_FORCES ) then
			local name = { "Brandenburg", "Munstereifel", "Niederrhein"}
			if (num <= # name) then
				str = name[num]
				str = "Fallschirm-Jager-Bataillon '".. name[num] .."'"
				unit:SetName(str)
			else
				str = num .. ". Fallschirm-Jager-Bataillon"
			end
		end	
		if IsArmorClass( numType ) then
			str = num .. ". Panzer-Division"
			unit:SetName(str)
		end
		if ( numType == CLASS_ARTILLERY ) then
			str = num .. ". Artillerie-Regiment"
			unit:SetName(str)
		end
		if ( numType == CLASS_MECHANIZED_INFANTRY ) then
			str = num .. ". Panzergrenadier-Division"
			unit:SetName(str)
		end
		if IsFighterClass( numType  ) then
			str = "Jagdgeschwader " .. num
			unit:SetName(str)
		end
		if IsBomberClass( numType  ) then
			str = "Kampfgeschwader " .. num
			unit:SetName(str)
		end
		if ( unitType == GE_BATTLESHIP ) then
			local name = { "Scharnhorst", "Gneisenau"}
			if (num <= # name) then
				str = name[num]
				unit:SetName(str)
			end
		end
		if ( unitType == GE_BATTLESHIP_2 ) then
			local name = { "Bismarck", "Tirpitz"}
			if (num <= # name) then
				str = name[num]
				unit:SetName(str)
			end
		end
		if ( unitType == GE_LEIPZIG ) then
			local name = { "Leipzig", "Nurnberg"}
			if (num <= # name) then
				str = name[num]
				unit:SetName(str)
			end
		end
		if ( unitType == GE_DEUTSCHLAND ) then
			local name = { "Lutzow", "Admiral Scheer", "Admiral Graf Spee"}
			if (num <= # name) then
				str = name[num]
				unit:SetName(str)
			end
		end

	--------------------------------------------- Italy ---------------------------------------------
	elseif ( GetCivIDFromPlayerID (playerID) == ITALY ) then
 		
		if ( unitType == IT_INFANTRY ) then
			str = num .. "a Divisione fanteria"
			unit:SetName(str)
		end	
		if IsArmorClass( numType ) then
			str = num .. "a Divisione corazzata"
			unit:SetName(str)
		end
		if ( numType == CLASS_ARTILLERY ) then
			str = num .. "a Reggimento Artiglieria"
			unit:SetName(str)
		end
		if IsFighterClass( numType  ) then
			str = num .. "a Squadriglia di caccia"
			unit:SetName(str)
		end
		if IsBomberClass( numType  ) then
			str = num .. "a Squadriglia di bombardieri"
			unit:SetName(str)
		end
		if ( unitType == IT_BATTLESHIP ) then
			local name = { "Vittorio Veneto", "Littorio", "Roma", "Impero"}
			if (num <= # name) then
				str = name[num]
				unit:SetName(str)
			end
		end
		if ( unitType == IT_ZARA ) then
			local name = { "Zara", "Fiume", "Pola", "Gorizia"}
			if (num <= # name) then
				str = name[num]
				unit:SetName(str)
			end
		end
		if ( unitType == IT_DI_CAVOUR ) then
			local name = { "Conte Di Cavour", "Giulio Cesare", "Leonardo Da Vinci"}
			if (num <= # name) then
				str = name[num]
				unit:SetName(str)
			end
		end

	--------------------------------------------- USSR ---------------------------------------------
	elseif ( GetCivIDFromPlayerID (playerID) == USSR ) then
 		
		if ( unitType == RU_INFANTRY ) then
			if (num == 1) then
				str = "1st "
			elseif (num == 2) then			
				str = "2nd "
			elseif (num == 3) then			
				str = "3rd "
			else
				str = num .. "th "
			end
			str = str .. "Rifle Division"
			unit:SetName(str)
		end	
		if IsArmorClass( numType ) then
			if (num == 1) then
				str = "1st "
			elseif (num == 2) then			
				str = "2nd "
			elseif (num == 3) then			
				str = "3rd "
			else
				str = num .. "th "
			end
			str = str .. "Tank Corps"
			unit:SetName(str)
		end
		if ( numType == CLASS_ARTILLERY ) then
			if (num == 1) then
				str = "1st "
			elseif (num == 2) then			
				str = "2nd "
			elseif (num == 3) then			
				str = "3rd "
			else
				str = num .. "th "
			end
			str = str .. "Artillery Regiment"
			unit:SetName(str)
		end
		if IsFighterClass( numType  ) then
			if (num == 1) then
				str = "1st "
			elseif (num == 2) then			
				str = "2nd "
			elseif (num == 3) then			
				str = "3rd "
			else
				str = num .. "th "
			end
			str = str .. "Fighter Aviation Division"
			unit:SetName(str)
		end
		if IsBomberClass( numType  ) then
			if (num == 1) then
				str = "1st "
			elseif (num == 2) then			
				str = "2nd "
			elseif (num == 3) then			
				str = "3rd "
			else
				str = num .. "th "
			end
			str = str .. "Bomber Aviation Division"
			unit:SetName(str)
		end
		if ( unitType == RU_BATTLESHIP ) then
			local name = { "Sovetsky Soyuz", "Sovetskaya Ukraina", "Sovetskaya Rossiya", "Sovetskaya Belorussiya"}
			if (num <= # name) then
				str = name[num]
				unit:SetName(str)
			end
		end
		if ( unitType == RU_GANGUT ) then
			local name = { "Oktyabrskaya Revolyutsiya", "Petropavlovsk", "Poltava", "Sevastopol"}
			if (num <= # name) then
				str = name[num]
				unit:SetName(str)
			end
		end
		if ( unitType == RU_KIROV ) then
			local name = { "Kirov", "Voroshilov", "Maxim Gorky", "Molotov", "Kaganovich", "Kalinin"}
			if (num <= # name) then
				str = name[num]
				unit:SetName(str)
			end
		end

	--------------------------------------------- Greece ---------------------------------------------
	elseif ( GetCivIDFromPlayerID (playerID) == GREECE ) then		
		if ( unitType == GR_INFANTRY ) then
			str = num .. "i Merarchia Pezikou"
			unit:SetName(str)
		end	
		if IsArmorClass( numType ) then
			str = num .. "i Merarchia Tethorakismenon"
			unit:SetName(str)
		end
		if ( numType == CLASS_ARTILLERY ) then
			str = num .. "i Merarchia Pirobolikou"
			unit:SetName(str)
		end
		if IsFighterClass( numType  ) then
			str = num .. "i Omada Maxitikon"
			unit:SetName(str)
		end
		if IsBomberClass( numType  ) then
			str = num .. "i Omada Bombardistikon"
			unit:SetName(str)
		end
		if ( unitType == GR_PISA ) then
			local name = { "Georgios Averof"}
			if (num <= # name) then
				str = name[num]
				unit:SetName(str)
			end
		end

	--------------------------------------------- U.K. ---------------------------------------------

	elseif (GetCivIDFromPlayerID (playerID) == ENGLAND) then	
		
		if ( numType == CLASS_INFANTRY ) then
			if (num == 1) then
				str = "1st "
			elseif (num == 2) then			
				str = "2nd "
			elseif (num == 3) then			
				str = "3rd "
			else
				str = num .. "th "
			end
			str = str .. "Infantry Division"
			unit:SetName(str)
		end	
		if ( numType == CLASS_PARATROOPER ) then
			if (num == 1) then
				str = "1st "
			elseif (num == 2) then			
				str = "2nd "
			elseif (num == 3) then			
				str = "3rd "
			else
				str = num .. "th "
			end
			str = str .. "Airborn Division"
			unit:SetName(str)
		end
		if ( numType == CLASS_SPECIAL_FORCES ) then
			if (num == 1) then
				str = "1st "
			elseif (num == 2) then			
				str = "2nd "
			elseif (num == 3) then			
				str = "3rd "
			else
				str = num .. "th "
			end
			str = str .. "SAS Regiment"
			unit:SetName(str)
		end
		if ( numType == CLASS_MECHANIZED_INFANTRY ) then

			if (num == 1) then
				str = "1st "
			elseif (num == 2) then			
				str = "2nd "
			elseif (num == 3) then			
				str = "3rd "
			else
				str = num .. "th "
			end
			str = str .. "Mechanized Infantry Division"
			unit:SetName(str)
		end
		if IsArmorClass( numType ) then
			if (num == 1) then
				str = "1st "
			elseif (num == 2) then			
				str = "2nd "
			elseif (num == 3) then			
				str = "3rd "
			else
				str = num .. "th "
			end
			str = str .. "Armored Division"
			unit:SetName(str)
		end
		if ( numType == CLASS_ARTILLERY ) then
			if (num == 1) then
				str = "1st "
			elseif (num == 2) then			
				str = "2nd "
			elseif (num == 3) then			
				str = "3rd "
			else
				str = num .. "th "
			end
			str = str .. "Artillery Regiment"
			unit:SetName(str)
		end
		if IsFighterClass( numType  ) then
			if (num == 1) then
				str = "1st "
			elseif (num == 2) then			
				str = "2nd "
			elseif (num == 3) then			
				str = "3rd "
			else
				str = num .. "th "
			end
			str = str .. "Fighter Squadron"
			unit:SetName(str)
		end
		if IsBomberClass( numType  ) then
			if (num == 1) then
				str = "1st "
			elseif (num == 2) then			
				str = "2nd "
			elseif (num == 3) then			
				str = "3rd "
			else
				str = num .. "th "
			end
			str = str .. "Bomber Squadron"
			unit:SetName(str)
		end
		
		if ( unitType == UK_BATTLESHIP ) then
			local name = { "HMS Hood", "HMS Rodney"}
			if (num <= # name) then
				str = name[num]
				unit:SetName(str)
			end
		end
		if ( unitType == UK_BATTLESHIP_2 ) then
			local name = { "HMS King George V", "HMS Prince Of Wales", "HMS Duke Of York", "HMS Anson", "HMS Howe"}
			if (num <= # name) then
				str = name[num]
				unit:SetName(str)
			end
		end
		if ( unitType == UK_DIDO ) then
			local name = {	"HMS Argonaut", "HMS Bonaventure", "HMS Charybdis", "HMS Cleopatra", "HMS Dido",
							"HMS Euryalus", "HMS Hermione", "HMS Naiad", "HMS Phoebe", "HMS Scylla", "HMS Sirius",
							"HMS Bellona", "HMS Black Prince", "HMS Diadem", "HMS Royalist", "HMS Spartan"}
			if (num <= # name) then
				str = name[num]
				unit:SetName(str)
			end
		end
		if ( unitType == UK_ELIZABETH ) then
			local name = { "HMS Queen Elizabeth", "HMS Warspite", "HMS Valiant", "HMS Barham", "HMS Malaya"}
			if (num <= # name) then
				str = name[num]
				unit:SetName(str)
			end
		end

	--------------------------------------------- other ---------------------------------------------

	else
		if ( numType == CLASS_INFANTRY ) then
			if (num == 1) then
				str = "1st "
			elseif (num == 2) then			
				str = "2nd "
			elseif (num == 3) then			
				str = "3rd "
			else
				str = num .. "th "
			end
			str = str .. "Infantry Division"
			unit:SetName(str)
		end	
		if ( numType == CLASS_PARATROOPER ) then
			if (num == 1) then
				str = "1st "
			elseif (num == 2) then			
				str = "2nd "
			elseif (num == 3) then			
				str = "3rd "
			else
				str = num .. "th "
			end
			str = str .. "Airborn Division"
			unit:SetName(str)
		end
		if ( numType == CLASS_SPECIAL_FORCES ) then
			if (num == 1) then
				str = "1st "
			elseif (num == 2) then			
				str = "2nd "
			elseif (num == 3) then			
				str = "3rd "
			else
				str = num .. "th "
			end
			str = str .. " Special Forces Regiment"
			unit:SetName(str)
		end
		if ( numType == CLASS_MECHANIZED_INFANTRY ) then

			if (num == 1) then
				str = "1st "
			elseif (num == 2) then			
				str = "2nd "
			elseif (num == 3) then			
				str = "3rd "
			else
				str = num .. "th "
			end
			str = str .. "Mechanized Infantry Division"
			unit:SetName(str)
		end
		if IsArmorClass( numType ) then
			if (num == 1) then
				str = "1st "
			elseif (num == 2) then			
				str = "2nd "
			elseif (num == 3) then			
				str = "3rd "
			else
				str = num .. "th "
			end
			str = str .. "Armored Division"
			unit:SetName(str)
		end
		if ( numType == CLASS_ARTILLERY ) then
			if (num == 1) then
				str = "1st "
			elseif (num == 2) then			
				str = "2nd "
			elseif (num == 3) then			
				str = "3rd "
			else
				str = num .. "th "
			end
			str = str .. "Artillery Regiment"
			unit:SetName(str)
		end
		if IsFighterClass( numType  ) then
			if (num == 1) then
				str = "1st "
			elseif (num == 2) then			
				str = "2nd "
			elseif (num == 3) then			
				str = "3rd "
			else
				str = num .. "th "
			end
			str = str .. "Fighter Squadron"
			unit:SetName(str)
		end
		if IsBomberClass( numType  ) then
			if (num == 1) then
				str = "1st "
			elseif (num == 2) then			
				str = "2nd "
			elseif (num == 3) then			
				str = "3rd "
			else
				str = num .. "th "
			end
			str = str .. "Bomber Squadron"
			unit:SetName(str)
		end
	end
	if str then
		Dprint ("New name : " .. str, bDebug)
		return str
	else
		Dprint ("No name found", bDebug)
		return unit:GetName()
	end
end


--------------------------------------------------------------
-- Units management
--------------------------------------------------------------
function PathBlocked(pPlot, pPlayer)
	if ( pPlot == nil or pPlayer == nil) then
		Dprint ("WARNING : CanPass() called with a nil argument")
		return true
	end

	local ownerID = pPlot:GetOwner()
	local playerID = pPlayer:GetID()

	if ( ownerID == playerID or ownerID == -1 ) then
		return false
	end

	local pOwner = Players [ ownerID ]
	if ( pPlayer:GetTeam() == pOwner:GetTeam() or pOwner:IsAllies(playerID) or pOwner:IsFriends(playerID) ) then
		return false
	end

	--local team1 = Teams [ pPlayer:GetTeam() ]
	local plotTeam = Teams [ pOwner:GetTeam() ]
	if plotTeam:IsAllowsOpenBordersToTeam( pPlayer:GetTeam() ) then
		return false
	end

	return true -- return true if the path is blocked...
end

function NoNationalPath(pPlot, pPlayer)
	if ( pPlot == nil or pPlayer == nil) then
		Dprint ("WARNING : CanPass() called with a nil argument")
		return true
	end

	local ownerID = pPlot:GetOwner()
	local playerID = pPlayer:GetID()

	if ( ownerID == playerID or ownerID == -1 ) then
		return false
	end
	return true -- return true if the path is blocked...
end

function CanGetSupply (playerID, unitID, bShow )

	local bDebug = false
	local player = Players[ playerID ]
	local unit = player:GetUnitByID( unitID )
	local unitPlot = unit:GetPlot()
	local unitType = unit:GetUnitType()
	local unitArea = unitPlot:GetArea()
	local bHighlight = bShow or false

	if ( GameInfo.Units[unitType].Domain == "DOMAIN_SEA" or GameInfo.Units[unitType].Domain == "DOMAIN_AIR" or unit:IsEmbarked() ) then
		-- for now don't check naval supply lines
		return true
	end

	-- first check closest own cities
	Dprint (" - Search supply line for " .. unit:GetName() .. " (unitID =".. unit:GetID() ..", playerID =".. playerID ..")", bDebug)
	local closeCity = GetCloseCity ( playerID, unitPlot )
	if closeCity then
		local cityPlot = closeCity:Plot()
		-- first check the area, no need to calculate land path if not in the same land... 
		if ( cityPlot:GetArea() == unitArea and isPlotConnected(player, unitPlot, cityPlot, "Land", bHighlight, nil , PathBlocked) ) then
			Dprint ("   - Found path with close city (".. closeCity:GetName() ..")", bDebug )
			return true
		end
	end
	
	-- then all own cities
	Dprint ("   - No path with close city, check all cities", bDebug )
	for city in player:Cities() do
		local cityPlot = city:Plot()
		if ( cityPlot:GetArea() == unitArea and isPlotConnected(player, unitPlot, cityPlot, "Land", bHighlight, nil ,PathBlocked) ) then
			Dprint ("   - Found path with city (".. city:GetName() ..")", bDebug )
			return true
		end	
	end

	-- try logistic entry plots if they are defined
	if g_LogisticEntryPlot then
		for plotKey, entryData in pairs(g_LogisticEntryPlot) do
			if entryData.Active then
				local bCanUse = true
				if entryData.Civs then
					bCanUse = false
					for i, civID in pairs(entryData.Civs) do
						if civID == GetCivIDFromPlayerID (playerID) then
							bCanUse = true
						end
					end
				end
				if bCanUse then
					local entryPlot = GetPlotFromKey ( plotKey )
					if ( entryPlot and entryPlot:GetArea() == unitArea and isPlotConnected(player, unitPlot, entryPlot, "Land", bHighlight, nil ,PathBlocked) ) then
						Dprint ("   - Found path with entry plot at (".. plotKey ..")", bDebug )
						return true
					end
				end
			end
		end
	end
	
	if ( not player:IsMinorCiv() ) then -- crash fix: can't test minors for friends / ally ?
		-- now check friend / ally cities
		for player_num = 0, GameDefines.MAX_CIV_PLAYERS-1, 1 do
			if player_num ~= playerID then
				local other = Players [ player_num ]
				if other:IsAlive() then -- dead can't provide reinforcements
					--local unitTeam = Teams [ player:GetTeam() ]
					local bAllied = ( player:GetTeam() == other:GetTeam() or other:IsAllies(playerID) or other:IsFriends(playerID) )
					if ( bAllied ) then
						Dprint ("   - No path with close city, check ally (" .. other:GetName() .. ") cities", bDebug)
						-- first check closest allied city
						local closeCity = GetCloseCity ( player_num, unitPlot )
						if closeCity then -- a civ may still be alived but without cities...
							local cityPlot = closeCity:Plot()
							-- check the area first, no need to calculate land path if not in the same land... 
							if ( cityPlot:GetArea() == unitArea and isPlotConnected(player, unitPlot, cityPlot, "Land", bHighlight, nil , PathBlocked) ) then
								Dprint ("   - Found path with close city (".. closeCity:GetName() ..")", bDebug )
								return true
							end
						end
	
						-- then all his cities
						Dprint ("   - No path with close city, check all " .. other:GetName() .. " cities", bDebug )
						for city in other:Cities() do
							local cityPlot = city:Plot()
							if ( cityPlot:GetArea() == unitArea and isPlotConnected(player, unitPlot, cityPlot, "Land", bHighlight, nil ,PathBlocked) ) then
								Dprint ("   - Found path with city (".. city:GetName() ..")", bDebug )
								return true
							end	
						end				
					end
				end
			end
		end
	end
end

-- check if units can embark from plot
function CanEmbarkFrom(plot, unit)
	local bDebug = false
	local player = Players[unit:GetOwner()]
	local bSea = false
	local bHarbor = false
	Dprint("   - Checking adjacent plots for embark promotion", bDebug)
	local adjacentPlots = GetAdjacentPlots(plot, true) -- list of all adjacent plots + center plot
	for i, adjPlot in pairs(adjacentPlots) do
		if adjPlot:IsWater() and not adjPlot:IsLake() then
			Dprint("   - Found water !", bDebug)
			bSea = true
		elseif adjPlot:IsCity() then
			Dprint("   - Found City !", bDebug)
			local city = adjPlot:GetPlotCity()
			if (city:GetNumBuilding(HARBOR) > 0) and AreSameSide( unit:GetOwner(), city:GetOwner()) then -- and not city:IsBlockaded() 
				Dprint("   - With a friendly harbor !", bDebug) --not blockaded-- not tested
				bHarbor = true
			end			
		end
	end
	if bSea and bHarbor then
		return true
	else
		return false
	end 
end


--------------------------------------------------------------
-- Units Initialization
--------------------------------------------------------------

function RegisterNewUnit(playerID, unit, bNoAutoNaming) -- unit is object, not ID

	local bDebug = true

	if NO_AUTO_NAMING then
		bNoAutoNaming = NO_AUTO_NAMING
	end
	local unitClass = unit:GetUnitClassType()
	local unitType = unit:GetUnitType()
	local value = g_Unit_Classes[unitClass]
	local unitID = unit:GetID()

	if ( value == nil ) then
		Dprint("WARNING : unit (id="..unit:GetID()..", class='".. GameInfo.Units[unitType].Class .."', type='".. GameInfo.Units[unitType].Type .."') is not defined in g_Unit_Classes table", bDebug )
		value = {Moral = 100, NumType = -1, MaxHP = 100}
	end	

	if (value.NumType == nil) then
		Dprint("WARNING : NumType for type='".. GameInfo.Units[unitType].Type .."' class=".. GameInfo.Units[unitType].Class .." (".. unitClass ..") is not defined in g_Unit_Classes table", bDebug )
		-- some units did not have valid NumType but everything else is okay, initialize with unitType as hardcoded fix :-/
		-- todo: find out why this is needed
		value.NumType = unitType
	end

	-- temp, waiting to see if variable maxHP could be implemented
	local maxHP = MAX_HP -- maxHP from Defines here
	--[[
	local maxHP = value.MaxHP
	local initialDamage = MAX_HP - value.MaxHP -- set custom maxHP by substracting the value.MaxHP (requested MaxHit point for this unit) to the global MAX_HP than applying the result as damage (or none if the requested max HP is >= global max HP)
	if initialDamage > 0 then
		unit:SetDamage (initialDamage)
	end 
	--]]

	local unitKey = GetUnitKey(unit)

	MapModData.RED.UnitData[unitKey] = { 
		UniqueID = unitID.."-"..playerID.."-"..os.clock(), -- for linked statistics
		UnitID = unitID,
		BuilderID = playerID,
		Damage = 0,
		OwnerID = playerID,
		TurnCreated = Game.GetGameTurn(),
		NumType = value.NumType,
		Type = GameInfo.Units[unitType].Type,
		TypeID = unitType,
		Moral = value.Moral,
		Alive = true,
		TotalXP = unit:GetExperience(),
		CombatXP = 0,
		MaxHP = value.MaxHP,
		OrderType = nil,
		OrderReference = nil,
		OrderObjective = nil,
		TransportType = nil,
		TransportReference = nil,
		TotalControl = false, -- when set to true, R.E.D. scripts can totally control the unit, even if it belongs to human
	}

	if not (bNoAutoNaming) then
		local num = CountUnitClass (unitClass, playerID)
		UnitName(playerID, unitID, num)
	end

	-- remove embarked promotion if needed
	CheckEmbarkedPromotion(unit)

	-- Set special units that can stack with normal units (but not with other special units)
	if IsRegiment(unit) then
		unit:SetIsSpecialType(true)
	end
	--DynamicTilePromotion(playerID, UnitID, unit:GetX(), unit:GetY())

	-- apply germany trait
	if GetCivIDFromPlayerID (playerID) == GERMANY then		
		if IsArmorClass(value.NumType) and not (IsAssaultGun(unit) or IsTankDestroyer(unit)) then
			unit:SetHasPromotion(PROMOTION_BLITZ, true)
		end
	end

	-- some units can only fight in defense
	if IsTankDestroyer(unit) or unit:IsHasPromotion(PROMOTION_FORTIFIED_GUN) then
		unit:SetMadeAttack(true) -- will be set to false when needed in counter-fire / first strike functions in RedCombat.lua
	end

	-- Place fort under airport
	if unitType == AIRFIELD then
		local plot = unit:GetPlot()
		local fortType = GameInfoTypes["IMPROVEMENT_FORT"]
		if (plot:GetImprovementType() ~= fortType) then
			plot:SetImprovementType(fortType)
		end
	end

	-- Place citadel under fortified guns
	if unitType == FORTIFIED_GUN then
		local plot = unit:GetPlot()
		--local citadelType = GameInfoTypes["IMPROVEMENT_CITADEL"]
		local citadelType = GameInfoTypes["IMPROVEMENT_FORT"] -- to do: resize citadel ? use fort
		if (plot:GetImprovementType() ~= citadelType) then
			plot:SetImprovementType(citadelType)
		end
	end
end

function InitializeUnit(playerID, unitID)
	local bDebug = true
	local player = Players[ playerID ]
	local unit = player:GetUnitByID( unitID )
	if unit then
		local unitKey = GetUnitKey(unit)

		-- initialize only new units...
		if unit:GetGameTurnCreated() ~= Game.GetGameTurn() then
			return
		end
		-- don't initialise settlers
		if unit:GetUnitType() == SETTLER then
			Dprint("  - Unit (TypeID=".. unit:GetID() ..") is a Settler, don't initialize... ", bDebug) 
			return
		end


		if ( SetMinorUU(playerID, unitID) ) then
			-- unit was changed to Minor UU during the above test, don't initialize now, this will be recalled by the new UU creation
			return
		end
	
		if MapModData.RED.UnitData[unitKey] then
			-- unit already registered, don't add it again...
			Dprint("  - ".. unit:GetName() .." is already registered as " .. MapModData.RED.UnitData[unitKey].Type, bDebug) 
			return
		end

		Dprint ("Initializing new unit (".. unit:GetName() ..") for ".. player:GetName() .."...", bDebug)
		local bNoAutoNaming = string.len(unit:GetNameNoDesc()) > 1 -- check if unit has a custom name
		RegisterNewUnit(playerID, unit, bNoAutoNaming) -- no autonaming if unit already has a custom name
		Dprint("-------------------------------------", bDebug)
	else
		Dprint ("- WARNING : tried to initialize nil unit for ".. player:GetName(), bDebug)
	end

end
-- Events.SerialEventUnitCreated.Add( InitializeUnit )
-- add to Events after map initialization (or re-loading)


--------------------------------------------------------------
-- Units placement from Order of Battle
--------------------------------------------------------------
function PlaceUnits(oob)
	local playerID = GetPlayerIDFromCivID( oob.CivID, oob.IsMinor )
	local player = Players [ playerID ]
	local plot = GetPlot(oob.X, oob.Y)
	local plotList = GetAdjacentPlots(plot, true)
	local placedUnits = 0
	for i, unitPlot in pairs (plotList) do
		local unitType = oob.Group[i]
		if unitPlot:GetNumUnits() > 0 then
			Dprint("- WARNING : trying to place unit on occupied plot at " .. unitPlot:GetX() .."," .. unitPlot:GetY())
		end
		if unitType and (unitPlot:GetNumUnits() == 0 or FORCE_UNIT_SPAWNING_ON_OCCUPIED_PLOT) then
			local unit = player:InitUnit(unitType, unitPlot:GetX(), unitPlot:GetY())
			FinalizeUnitFromOOB(unit, oob, i)
			placedUnits = placedUnits + 1
		end
	end
	if placedUnits < #oob.Group then
		Dprint("- WARNING : asked to place " ..  tostring(#oob.Group) .. " units, but found valid plots for only " .. tostring(placedUnits))
	end
end
function PlaceAirUnits(oob)
	local playerID = GetPlayerIDFromCivID( oob.CivID, oob.IsMinor )
	local player = Players [ playerID ]
	local plot = GetPlot(oob.X, oob.Y)
	for i, unitType in ipairs (oob.Group) do
		local unit = player:InitUnit(unitType, oob.X, oob.Y)
		FinalizeUnitFromOOB(unit, oob, i)
	end
end
function FinalizeUnitFromOOB(unit, oob, i)
	local bDebug = true
	if unit:GetDomainType() == DomainTypes.DOMAIN_LAND and unit:GetPlot():IsWater() then
		Dprint("- initializing Land unit on sea...", bDebug)
		if (not unit:IsHasPromotion(PROMOTION_EMBARKATION)) then
			Dprint("   - Adding embarked promotion unitID =".. unit:GetID(), bDebug)
			unit:SetHasPromotion(PROMOTION_EMBARKATION, true)
		end
		--unit:SetEmbarked(true)
		unit:Embark(unit:GetPlot())
	end
	if unit:GetDomainType() == DomainTypes.DOMAIN_SEA and not unit:GetPlot():IsWater() then
		Dprint("- WARNING : tried to spawn a sea unit on land, calling JumpToNearestValidPlot()...", bDebug)
		unit:JumpToNearestValidPlot() -- safe with sea units ?
	end
	if oob.UnitsName and oob.UnitsName[i] then
		Dprint("   - Set name to unitID =".. unit:GetID(), bDebug)
		unit:SetName(oob.UnitsName[i])
	end
	if oob.UnitsXP and oob.UnitsXP[i] then
		Dprint("   - Set XP to unitID =".. unit:GetID(), bDebug)
		unit:SetExperience(oob.UnitsXP[i])
	end
	if oob.Promotions and oob.Promotions[i] then
		Dprint("   - Set promotion to unitID =".. unit:GetID(), bDebug)
		for j, promotion in pairs(oob.Promotions[i]) do
			unit:SetHasPromotion(promotion, true)
		end
	end
	if oob.InitialObjective then -- Initial objective is set for all units of all groups tagged InitialObjective = true		
		Dprint("   - Set Initial objective to unitID =".. unit:GetID(), bDebug)
		unit:SetDeployFromOperationTurn(Game.GetGameTurn()+1)
	end
end

-- Initial Order of Battle
function InitializeOOB ()
	-- mass units initialization is made in PlaceUnits() and PlaceAirUnits() functions
	local bDebug = true
	if g_Initial_OOB then
		Dprint("-------------------------------------")
		Dprint("Initialize Order of Battle")
		local dominanceZone = {}
		for i, oob in ipairs (g_Initial_OOB) do
			local playerID = GetPlayerIDFromCivID (oob.CivID, oob.IsMinor)	
			Dprint("CivID = " .. oob.CivID, bDebug)
			Dprint("PlayerID = " .. playerID, bDebug)
			local player = Players[playerID]
			local bIsHumanSide = player and (player:IsHuman() or IsSameSideHuman(player))
			if (not (bIsHumanSide and oob.AI)) 
			--or BothSideHuman() 
			then
				Dprint("-------------------------------------", bDebug)
				Dprint("Placing ".. oob.Name, bDebug)
				if oob.Domain == "Land" or  oob.Domain == "Sea" then
					PlaceUnits(oob)
				elseif oob.Domain == "Air" then
					PlaceAirUnits(oob)
				else
					Dprint("WARNING, domain is not valid : ".. oob.Domain, bDebug)
				end
				if oob.InitialObjective then
					dominanceZone[player] = oob.InitialObjective
				end
			end
		end
		for player, plotkey in pairs(dominanceZone) do
			Dprint("Set dominance zone for ".. player:GetName() .. " at " .. plotkey, bDebug)
			player:AddTemporaryDominanceZone (GetPlotXYFromKey (plotkey))
		end
		Dprint("-------------------------------------", bDebug)
		Dprint("End of Order of Battle initialization ...", bDebug)
	end
end

-- Mid-Game Reinforcement
function SpawnReinforcements(playerID)

	local bDebug = true

	if g_Reinforcement_OOB then
		local CivID = GetCivIDFromPlayerID (playerID)
		if g_Reinforcement_OOB[CivID] then
			local player = Players[playerID]
			Dprint("-------------------------------------")
			Dprint("Check Reinforcement to spawn for ".. player:GetName())
			local turn = Game.GetGameTurn()
			local turnDate, prevDate = 0, 0
			if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
			if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end
	
			Dprint ("Current turn date : " .. turnDate ..", next turn date :" .. prevDate, bDebug )

			for date, reinforcements in pairs(g_Reinforcement_OOB[CivID]) do
				if date <= turnDate and date > prevDate then
					for i, oob in ipairs (reinforcements) do
						Dprint (date .. " <= " .. turnDate .." and ".. date .." > " .. prevDate, bDebug )
						local bIsHumanSide = player and (player:IsHuman() or IsSameSideHuman(player))
						if (not (bIsHumanSide and oob.AI)) 
						-- or BothSideHuman()
						then
							Dprint("-------------------------------------", bDebug)
							Dprint("Placing ".. oob.Name, bDebug)
							if oob.Domain == "Land" or  oob.Domain == "Sea" then
								PlaceUnits(oob)
							elseif oob.Domain == "Air" then
								PlaceAirUnits(oob)
							else
								Dprint("WARNING, domain is not valid : ".. oob.Domain, bDebug)
							end
						end
					end					
					--if oob.InitialObjective then
					--	player:AddTemporaryDominanceZone (GetPlotXYFromKey ( oob.InitialObjective ))
					--end
				end
			end
			Dprint("-------------------------------------", bDebug)
			Dprint("End of Reinforcement spawning ...", bDebug)
		end
	end
end
-- GameEvents.PlayerDoTurn.Add(SpawnReinforcements)

-- Register Preplaced Units, to add in OnGameInit () after loading tables
function RegisterScenarioUnits()
	Dprint("-------------------------------------")
	Dprint("Register existing units from scenario maps ...")
	local bDebug = true
	for playerID = 0, GameDefines.MAX_CIV_PLAYERS - 1 do
		local player = Players[playerID]
		if player:IsAlive() and GetCivIDFromPlayerID (playerID) ~= HOTSEAT_CIV_TO_KILL then
			for unit in player:Units() do
				if (unit:GetUnitType() ~= SETTLER) then
					local unitKey = GetUnitKey(unit)
					if MapModData.RED.UnitData[unitKey] then
						-- unit already registered, don't add it again...
						Dprint("  - ".. unit:GetName() .." is already registered as " .. MapModData.RED.UnitData[unitKey].Type, bDebug) 
						return
					end
					Dprint ("Initializing scenario unit ".. unit:GetName() .. " for ".. player:GetName() .."...", bDebug)
					Dprint ("Complete Name: , Short Name:" .. unit:GetNameNoDesc(), bDebug)

					-- add scenario specific promotions (normally called in DynamicTilePromotion, but it's called after WB placed units are initialized...)
					SetScenarioPromotion(unit)

					local bNoAutoNaming = string.len(unit:GetNameNoDesc()) > 1 -- check if unit has a custom name
					RegisterNewUnit(playerID, unit, bNoAutoNaming) -- no autonaming if unit already has a custom name
					Dprint("-------------------------------------", bDebug)
				end
			end
		end
	end
end

function LaunchMilitaryOperation(playerID)

	local bDebug = true
	
	Dprint("-------------------------------------")
	Dprint("Check for Military Operations...")

	if not g_Military_Project then
		Dprint("- But no military project defined for this scenario...")
		return
	end

	if playerID == nil then
		Dprint("- PlayerID was nil, assume LaunchMilitaryOperation was called by ActivePlayerStartTurn for active player...")
		playerID = Game.GetActivePlayer()
		if not Players[playerID]:IsHuman() then		
			Dprint("- Game.GetActivePlayer() has returned a non human player... WTF ??? escaping here, bug maybe caused by auto end turn...")
			return
		end
	end

	local player = Players[playerID]

	if player:IsHuman() and not IsActivePlayerTurnInitialised() then
		Dprint("- Player is human, but function called before it's turn has been initialized, wait for ActivePlayerStartTurn...")
		return -- for human player this will be called again at ActivePlayerStart turn
	end

	local civID = GetCivIDFromPlayerID(playerID, false)

	if not g_Military_Project[civID] then
		Dprint("- But no military project defined for this nation...")
		return
	end

	
	if (player:IsMinorCiv() and (not g_Military_Project[civID].IsMinor)) or ((not player:IsMinorCiv()) and g_Military_Project[civID].IsMinor) then
		Dprint("- but minor/major/project defines do not match...")
		return
	end

	Dprint("-------------------------------------")
	Dprint("Initializing Military Operations for " .. player:GetName())

	for id, militaryOperation in pairs(g_Military_Project[civID]) do	
		local savedData = Modding.OpenSaveData()
		local saveStr = "Operation-"..id
		local triggered = savedData.GetValue(saveStr)
		if triggered ~= 1 then -- not triggered yet, test it !
		
			Dprint(" - Testing condition for Operation ID = " .. id, bDebug)
			-- check if required project is done
			if (IsProjectDone(id, civID)) then
				local condition
				if militaryOperation.Condition then
					condition = militaryOperation.Condition()
				else
					condition = true -- if no condition set, assume always true
				end
				if condition then
					
					Dprint(" - Launching Operation ID = " .. tostring(id), bDebug)
					Dprint(" - Code Name =  " .. Locale.ConvertTextKey(militaryOperation.Name), bDebug)
					if militaryOperation.Name then
						Events.GameplayAlertMessage(Locale.ConvertTextKey(militaryOperation.Name).." has been launched !")
						BroadcastNotification(NotificationTypes.NOTIFICATION_PROJECT_COMPLETED, Locale.ConvertTextKey(militaryOperation.Name).." launched !", Locale.ConvertTextKey(militaryOperation.Name).." launched !", nil, nil, id, playerID )
					end
					LaunchUnits(militaryOperation)

					if (not CanRepeatProject(id)) then
						Dprint(" - Marking Operation done...", bDebug)
						local saveStr = "Operation-"..id
						savedData.SetValue(saveStr, 1) -- mark as triggered !
					else
						Dprint(" - Operation can be repeated, mark project as not completed so it can be launched again...", bDebug)
						MarkProjectNotCompleted(id, civID) -- now that Civ can build this project again...
					end
					LuaEvents.MilitaryOperationLaunched(id, civID) -- can use LuaEvents.MilitaryOperationLaunched.Add(anyScenarioFunction) in the scenarios Lua to do additional stuff...
					
					--PauseGame(3)
				end
			end
		end
	end
	Dprint("Military Operations initialized...")
	Dprint("-------------------------------------")
end

function LaunchUnits(militaryOperation)
	local bDebug = true
	for i, oob in ipairs (militaryOperation.OrderOfBattle) do
		local playerID = GetPlayerIDFromCivID( oob.CivID, oob.IsMinor )
		local player = Players [ playerID ]
		local bIsHumanSide = player and (player:IsHuman() or IsSameSideHuman(player))
		if (not (bIsHumanSide and oob.AI)) or BothSideHuman() then
			Dprint("   - Launching " .. tostring(oob.Name), bDebug)
			--PauseGame(2)
			local plot = GetPlot(oob.X, oob.Y)
			local plotList = GetAdjacentPlots(plot, true)

			local objectivePlot = nil
			local objectivePlotList = {}
			local validPlotList = {}
			local bParadrop = (oob.LaunchType and oob.LaunchType == "ParaDrop")
			local bAmphibious = (oob.LaunchType and oob.LaunchType == "Amphibious")
			if  bParadrop then
				objectivePlot = GetPlot(oob.LaunchX, oob.LaunchY)
				objectivePlotList = GetPlotsInCircle(objectivePlot, 0, oob.LaunchImprecision)
				for i, testPlot in pairs(objectivePlotList) do
					if IsSafePlot( testPlot, playerID) and not testPlot:IsWater() and not testPlot:IsImpassable() and not testPlot:IsCity() and not IsNeutral(testPlot:GetOwner()) then
						table.insert(validPlotList, testPlot)
					end
				end
				Shuffle(validPlotList)
			end
	
	--		if player:GetID() == Game:GetActivePlayer() and bParadrop then
			if bParadrop then
			
				Dprint("   - Looking at objective at " .. tostring(objectivePlot:GetX()) .. "," .. tostring(objectivePlot:GetY()), bDebug)
				UI.LookAt(objectivePlot, 0)
				--PlaceCameraAtPlot(objectivePlot)
			end

			local placedUnits = 0
			local unitList = {}

			-- place units on map
			for i, unitPlot in pairs (plotList) do
				local unitType = oob.Group[i]
				if unitPlot:GetNumUnits() > 0 then
					Dprint("- WARNING : trying to place unit on occupied plot at " .. unitPlot:GetX() .."," .. unitPlot:GetY())
				end
				if unitType and (unitPlot:GetNumUnits() == 0 or FORCE_UNIT_SPAWNING_ON_OCCUPIED_PLOT) then
			
					local bCanPlaceUnit = true
					if bParadrop and not validPlotList[i] then
						Dprint("- WARNING : Not enough valid Airdrop destination plot for i = " .. tostring(i))
						bCanPlaceUnit = false
					end
					if bCanPlaceUnit then
						local unit = player:InitUnit(unitType, unitPlot:GetX(), unitPlot:GetY())
						RegisterNewUnit(playerID, unit) -- force immediate registration to allow change in MapModData.RED.UnitData
						local unitKey = GetUnitKey(unit)
						FinalizeUnitFromOOB(unit, oob, i)
						placedUnits = placedUnits + 1
						table.insert(unitList, unitKey)

						if bAmphibious then -- initialize first move for Amphibious operation
							Dprint("   - Initialize first move for Amphibious unit...", bDebug)							
							
							local routeID = oob.RouteID

							MapModData.RED.UnitData[unitKey].OrderReference = routeID
							MapModData.RED.UnitData[unitKey].TotalControl = true

							local newWaypoint = GetFirstWaypoint(playerID, routeID)

							if newWaypoint then
								MapModData.RED.UnitData[unitKey].OrderType = RED_MOVE_TO_EMBARKED_WAYPOINT
								MapModData.RED.UnitData[unitKey].OrderObjective = newWaypoint
								MoveUnitTo (unit, GetPlot (newWaypoint.X, newWaypoint.Y ))
							else
								local newDestination = GetDestinationToDisembark(playerID, routeID)
								MapModData.RED.UnitData[unitKey].OrderType = RED_MOVE_TO_DISEMBARK
								MapModData.RED.UnitData[unitKey].OrderObjective = newDestination
								MoveUnitTo (unit, GetPlot (newDestination.X, newDestination.Y ))
							end
						end
					end
				end
			end

			-- now the show for paradrop...
			if bParadrop then
				--PauseGame(2)
				spotterList = {}
				Dprint("   - Placing spotters for Paradrop mission...", bDebug)
				for i, unitKey in pairs (unitList) do		
					local dropPlot = validPlotList[i]		
					local spotter = player:InitUnit(SETTLER, dropPlot:GetX(), dropPlot:GetY())
					spotter:SetHasPromotion(PROMOTION_AIR_RECON, true)

					local spotterKey = GetUnitKey(spotter)
					Dprint("     - Placing spotters (key = ".. tostring(spotterKey) ..") at " .. tostring(dropPlot:GetX()) .."," .. tostring(dropPlot:GetY()), bDebug)
					table.insert(spotterList, spotterKey)
				end
				
				--PauseGame(2)
				--UI.LookAt(objectivePlot, 0)
				local paraList = {}
				for i, unitKey in pairs (unitList) do
					local unit = GetUnitFromKey ( unitKey )
					local dropPlot = validPlotList[i]
					
					Dprint("   - Launch Paradrop mission for " .. unit:GetName() .. " (unitID = ".. unit:GetID() .. ") at " .. tostring(dropPlot:GetX()) .."," .. tostring(dropPlot:GetY()), bDebug)

					unit:SetHasPromotion(PROMOTION_LONG_PARADROP, true)
					unit:PopMission()
					unit:PushMission(MissionTypes.MISSION_PARADROP, dropPlot:GetX(), dropPlot:GetY(), 0, 0, 1, MissionTypes.MISSION_PARADROP, unit:GetPlot(), unit)
					--unit:SetMoves(0)
					unit:SetHasPromotion(PROMOTION_LONG_PARADROP, false)
					unit:PopMission()
					ChangeUnitOwner (unit, unit:GetOwner()) -- trying to fix a strange bug (bad initialization for those units...)
				end

				Dprint("   - Remove spotters for Paradrop mission...", bDebug)
				for v in player:Units() do
					if (v:GetUnitType() == SETTLER) then
						Dprint("     - removing spotter at " .. tostring(v:GetX()) .."," .. tostring(v:GetY()), bDebug)
						v:Kill(true, -1)
					end
				end
			end
										
			--if oob.InitialObjective then
			--	player:AddTemporaryDominanceZone (GetPlotXYFromKey ( oob.InitialObjective ))
			--end

			if placedUnits < #oob.Group then
				Dprint("- WARNING : asked to place " ..  tostring(#oob.Group) .. " units, but found valid plots for only " .. tostring(placedUnits))
			end
		end
	end
end

-- unused / WIP
function WarPlannedOperations( iTeam1, iTeam2, bWar ) -- Check for military operation to launch at DoW...

	local bDebug = true

	if (bWar) then
		for playerID = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
			local player = Players[playerID]
			if player and player:IsAlive() then
				if player:GetTeam() == iTeam1 or player:GetTeam() == iTeam2 then -- to do : check if player is in active turn
					--LaunchMilitaryOperation(playerID)
				end				
			end
		end
	end	
end
-- Events.WarStateChanged.Add( WarPlannedOperations ) at game init...


--------------------------------------------------------------
-- units Max Health
--------------------------------------------------------------

-- Not used, main problem is number of figures relative to global maxHP and the need to pass unitData to UnitFlagManager.lua
function GetUnitMaxHP(unit)
	local unitKey = GetUnitKey (unit)
	return unitData[unitKey].MaxHP or MAX_HP 
end


--------------------------------------------------------------
-- Minor Civilizations Units replacing
--------------------------------------------------------------
function ChangeUnitTo ( playerID, unitID, unitType )
	local player = Players[ playerID ]
	local unit = player:GetUnitByID( unitID )

	-- get position before killing the unit !
	local x = unit:GetX()
	local y = unit:GetY()

	-- kill old unit
	unit:SetDamage( unit:GetMaxHitPoints() )

	-- create the new unit from the old one
	local newUnit = player:InitUnit(unitType, x, y)
	newUnit:SetExperience ( unit:GetExperience() )
	newUnit:SetLevel ( unit:GetLevel() )
	for unitPromotion in GameInfo.UnitPromotions() do
		local unitPromotionID = unitPromotion.ID
		if( unit:IsHasPromotion( unitPromotionID ) ) then
			newUnit:SetHasPromotion( unitPromotionID )
		end
	end
end

function GetMinorUUType(playerID, unitClassTypeID)
	local player = Players[ playerID ]
	local playerCivID = player:GetMinorCivType()
	local minorUUID = nil
	local minorList = g_Minor_UU[playerCivID]
	if minorList then
		minorUUID = minorList[unitClassTypeID]
	end

	if minorUUID then
		return minorUUID
	end
	return -1
end

function SetMinorUU( playerID, unitID )

	local player = Players[ playerID ]
	if ( player:IsMinorCiv() ) then
		local unit = player:GetUnitByID( unitID )
		local unitType = unit:GetUnitType()		
		local unitClassTypeID = unit:GetUnitClassType()
		local citystateUUTypeID = GetMinorUUType( playerID, unitClassTypeID )

		-- be cautious when setting conditions, remember that we can create an infinite loop here
		if (citystateUUTypeID >= 0  and unitType ~= citystateUUTypeID) then
			ChangeUnitTo ( playerID, unitID, citystateUUTypeID )
			return true
		end
	end

	return false
end

--function OnUnitCreated( playerID, unitID, hexVec, unitType, cultureType, civID, primaryColor, secondaryColor, unitFlagIndex, fogState, selected, military, notInvisible )
--Events.SerialEventUnitCreated.Add( HandleCityStateUU )


--------------------------------------------------------------
-- Units Upgrade
--------------------------------------------------------------

-- Return next upgrade type for this unit type
function GetUnitUpgradeType(unitType)
	if g_UnitUpgrades and g_UnitUpgrades[unitType] then
		return g_UnitUpgrades[unitType]
	end
	return nil
end

-- Return the last available upgrade type for this player and unit type
function GetLastUnitUpgradeType(player, unitType)
	local testType = unitType
	local upgradeType = nil

	repeat
		testType = GetUnitUpgradeType(testType)
		if testType and player:CanTrain(testType) then
			upgradeType = testType
		end
	until not testType

	return upgradeType
end

function GetUnitUpgradeCost(unitType, upgradeType)
	local diffCost = tonumber(GameInfo.Units[upgradeType].Cost) - tonumber(GameInfo.Units[unitType].Cost)
	local cost = GameDefines.BASE_UNIT_UPGRADE_COST +  diffCost * GameDefines.UNIT_UPGRADE_COST_PER_PRODUCTION
	if cost > 0 then
		return cost
	else
		return 0
	end
end

function UpgradingUnits(playerID)
	local bDebug = true
	local player = Players[playerID]
	if ( player:IsAlive() and not player:IsBarbarian() ) then
		Dprint("-------------------------------------", bDebug)
		Dprint("Check possible unit upgrade for ".. player:GetCivilizationShortDescription() .."...", bDebug)
		local upgradeTable = {} 
		for unit in player:Units() do
			local upgradeType = GetLastUnitUpgradeType(player, unit:GetUnitType() )
			-- to do : check if upgradeType can also be upgraded and upgrade to last type available...
			if upgradeType -- upgrade is available ?
			  and (unit:GetDamage() < unit:GetMaxHitPoints() / 2) -- don't upgrade more than half-damaged unit
			  and not unit:IsEmbarked()
			  and not (unit:IsHasPromotion(PROMOTION_NO_SUPPLY)) and not (unit:IsHasPromotion(PROMOTION_NO_SUPPLY_SPECIAL_FORCES)) -- unit must have supply line
			  then
				table.insert(upgradeTable, { Unit = unit, XP = unit:GetExperience(), UpgradeType = upgradeType })
				Dprint("   -- possible upgrade for ".. unit:GetName() .." (".. unit:GetExperience() .."xp) to " .. Locale.ConvertTextKey(GameInfo.Units[upgradeType].Description), bDebug)
			end
		end
		table.sort(upgradeTable, function(a,b) return a.XP > b.XP end) -- upgrade higher XP first...
		for i, data in ipairs(upgradeTable) do
			local reqMateriel = GetUnitUpgradeCost(data.Unit:GetUnitType(), data.UpgradeType)
			if (reqMateriel <= MapModData.RED.ResourceData[playerID].Materiel) then
				Dprint("Upgrade ".. data.Unit:GetName() .." to " .. Locale.ConvertTextKey(GameInfo.Units[data.UpgradeType].Description), bDebug)
				MapModData.RED.ResourceData[playerID].Materiel = MapModData.RED.ResourceData[playerID].Materiel - reqMateriel
				MapModData.RED.ResourceData[playerID].MatToUpgrade = reqMateriel
				local oldType = data.Unit:GetUnitType()
				local plot = data.Unit:GetPlot()
				local newUnit = ChangeUnitType (data.Unit, data.UpgradeType)
				player:AddNotification(NotificationTypes.NOTIFICATION_UNIT_PROMOTION, newUnit:GetNameNoDesc() .. " have just been upgraded from ".. Locale.ConvertTextKey(GameInfo.Units[oldType].Description).." to " .. Locale.ConvertTextKey(GameInfo.Units[data.UpgradeType].Description), newUnit:GetNameNoDesc() .. " upgraded !", plot:GetX(), plot:GetY(), data.UpgradeType, data.UpgradeType)
				return -- upgrade one unit per turn max...
			end
		end		
		Dprint("No upgrade made (not enought materiel, or no upgradable units available)", bDebug)
		MapModData.RED.ResourceData[playerID].MatToUpgrade = nil
	end
end
-- add to GameEvents.PlayerDoTurn


--------------------------------------------------------------
-- Units Promotions
--------------------------------------------------------------

function DynamicUnitPromotion(playerID)

	local bDebug = false

	local player = Players[playerID]
	if ( player:IsAlive() ) then	
		Dprint("-------------------------------------", bDebug)
		Dprint("Add and remove dynamic promotions for ".. player:GetName() .." units ...", bDebug)
		for unit in player:Units() do
			-- Supply line ?
			local unitType = unit:GetUnitType()
			local noSupply
			if HasNoCombatPenaltyFromSupply(unitType) then
				noSupply = PROMOTION_NO_SUPPLY_SPECIAL_FORCES
			elseif UseFuel(unitType) then
				noSupply = PROMOTION_NO_SUPPLY_MECHANIZED
			else
				noSupply = PROMOTION_NO_SUPPLY
			end

			if CanGetSupply(playerID, unit:GetID()) then
				if (unit:IsHasPromotion(noSupply)) then
					Dprint("   - Removing mark " .. unit:GetName() .. " (unitID =".. unit:GetID() ..", playerID =".. playerID .."), supply line reopen", bDebug)
					unit:SetHasPromotion(noSupply, false)
				end
			elseif not (unit:IsHasPromotion(noSupply)) then
				Dprint("   - Marking " .. unit:GetName() .. " (unitID =".. unit:GetID() ..", playerID =".. playerID .."), has no supply line", bDebug)
				unit:SetHasPromotion(noSupply, true)
				if UseFuel(unitType) then
					unit:SetMoves(Round(unit:MovesLeft() * (NO_SUPPLY_LINE_INITIAL_MOVEMENT_LEFT/100)))
				end
			else
				Dprint("   - " .. unit:GetName() .. " (unitID =".. unit:GetID() ..", playerID =".. playerID .."), has still no supply line but is already marked", bDebug)
				if UseFuel(unitType) then
					unit:SetMoves(Round(unit:MovesLeft() * (NO_SUPPLY_LINE_MOVEMENT_LEFT/100)))
				end
			end

			if UseFuel(unitType) and not unit:IsHasPromotion(noSupply) then -- don't apply the penalty twice...
				if (unit:IsHasPromotion(PROMOTION_LIGHT_RATIONING)) then unit:SetMoves(Round(unit:MovesLeft() * (LIGHT_RATIONING_MOVEMENT_LEFT/100))) end
				if (unit:IsHasPromotion(PROMOTION_RATIONING))		then unit:SetMoves(Round(unit:MovesLeft() * (MEDIUM_RATIONING_MOVEMENT_LEFT/100))) end
				if (unit:IsHasPromotion(PROMOTION_HEAVY_RATIONING)) then unit:SetMoves(Round(unit:MovesLeft() * (HEAVY_RATIONING_MOVEMENT_LEFT/100))) end
			end

		end
	end
end
-- add to GameEvents.PlayerDoTurn on loading / reloading a game.

function DynamicTilePromotion(playerID, UnitID, x, y)

	local bDebug = false

	local plot = Map.GetPlot(x,y)
	local player = Players [ playerID ]
	local unit = player:GetUnitByID(UnitID)
	local unitType = unit:GetUnitType()

	if (plot) then 
		Dprint("-------------------------------------", bDebug)
		Dprint("Add and remove dynamic tile promotions for ".. unit:GetName() .." (id=".. unit:GetID() ..") at " .. tostring(GetPlotKey ( plot )), bDebug)

		-- Embarked promotion...

		CheckEmbarkedPromotion(unit) -- Remove/Add embarked promotion for AI units if required by scenario (like reinforcement routes)

		if EMBARK_FROM_HARBOR and not (NO_AI_EMBARKATION and not player:IsHuman()) then -- here we check the AI only if it's allowed to embark at will
			if not ( GameInfo.Units[unitType].Domain == "DOMAIN_SEA" or GameInfo.Units[unitType].Domain == "DOMAIN_AIR" or unit:IsEmbarked() ) then -- don't test those -- 
				if CanEmbarkFrom(plot, unit) then
					if not (unit:IsHasPromotion(PROMOTION_EMBARKATION)) then
						Dprint("   - Marking " .. unit:GetName() .. " (unitID =".. unit:GetID() ..") of ".. player:GetName() ..", can Embark", bDebug)
						unit:SetHasPromotion(PROMOTION_EMBARKATION, true)
					end
				elseif (unit:IsHasPromotion(PROMOTION_EMBARKATION)) then
					Dprint("   - Marking " .. unit:GetName() .. " (unitID =".. unit:GetID() ..") of ".. player:GetName() ..", can no longer Embark", bDebug)
					unit:SetHasPromotion(PROMOTION_EMBARKATION, false)
				end				
			end
		end

		if not ( GameInfo.Units[unitType].Domain == "DOMAIN_SEA" or GameInfo.Units[unitType].Domain == "DOMAIN_AIR" or unit:IsHasPromotion(PROMOTION_EMBARKATION)) then
			local area = plot:Area()
			if area:GetNumCities() == 0 then
				Dprint("   - Somehow " .. unit:GetName() .. " has managed to land on a desert island, be nice and give it the embark promotion...", bDebug)
				unit:SetHasPromotion(PROMOTION_EMBARKATION, true)
			end
		end

		-- Paradrop from cities only
		if CanParadrop(unitType) then
			if ( plot:IsCity() and AreSameSide( plot:GetOwner(), playerID)) then
				if not (unit:IsHasPromotion(PROMOTION_PARADROP)) then
					Dprint("   - Marking " .. unit:GetName() .. " (unitID =".. unit:GetID() ..") of ".. player:GetName() ..", can Paradrop", bDebug)
					unit:SetHasPromotion(PROMOTION_PARADROP, true)
				end
			elseif (unit:IsHasPromotion(PROMOTION_PARADROP)) then
				Dprint("   - Marking " .. unit:GetName() .. " (unitID =".. unit:GetID() ..") of ".. player:GetName() ..", can no longer Paradrop", bDebug)
				unit:SetHasPromotion(PROMOTION_PARADROP, false)
			end
		end

		-- Special Forces
		if unit:IsHasPromotion(PROMOTION_SPECIAL_FORCES) then
			if ( plot:GetFeatureType() == FeatureTypes.FEATURE_FOREST or plot:GetFeatureType() == FeatureTypes.FEATURE_JUNGLE) then
				if not (unit:IsHasPromotion(PROMOTION_INVISIBLE)) then
					Dprint("   - Marking " .. unit:GetName() .. " (unitID =".. unit:GetID() ..") of ".. player:GetName() ..", invisible in wood or jungle", bDebug)
					unit:SetHasPromotion(PROMOTION_INVISIBLE, true)
				end
			elseif (unit:IsHasPromotion(PROMOTION_INVISIBLE)) then
				Dprint("   - Marking " .. unit:GetName() .. " (unitID =".. unit:GetID() ..") of ".. player:GetName() ..", remove invisibility", bDebug)
				unit:SetHasPromotion(PROMOTION_INVISIBLE, false)
			end
		end

		-- Scenarios may specify custom promotions...
		SetScenarioPromotion(unit)

	end
end
-- add to GameEvents.UnitSetXY on loading and reloading game (this event is also fired when unit is created)

function CheckEmbarkedPromotion(unit)
	local bDebug = true
	local player = Players[unit:GetOwner()]
	local unitType = unit:GetUnitType()

	if NO_AI_EMBARKATION and not player:IsHuman() then

		if not unit:GetDomainType() == DomainTypes.DOMAIN_LAND then
			return
		end
	
		local unitKey = GetUnitKey(unit)
		local specialCase = false
		if MapModData.RED.UnitData[unitKey] then -- don't test new units before initialisation of MapModData.RED.UnitData
			if MapModData.RED.UnitData[unitKey].OrderType == RED_MOVE_TO_EMBARK or MapModData.RED.UnitData[unitKey].OrderType == RED_MOVE_TO_DISEMBARK then
				specialCase = true
			end

			if (unit:IsHasPromotion(PROMOTION_EMBARKATION))	and not specialCase then -- as the AI is not allowed to use embarkation, only allow units embark/disembark from a scenario specific event
				Dprint("   - Removing embarkation promotion from " .. unit:GetName() .. " (unitID =".. unit:GetID(), bDebug)
				unit:SetHasPromotion(PROMOTION_EMBARKATION, false)
			end

			if (not unit:IsHasPromotion(PROMOTION_EMBARKATION))	and MapModData.RED.UnitData[unitKey].OrderType == RED_MOVE_TO_DISEMBARK and unit:IsEmbarked() then -- allow unit to disembark, but do not give back to unit that have disembarked near their disembark plot (maybe redondant with the check for landing code, but should handle the cases when MAX_LANDING_PLOT_DISTANCE is too low for the sea front scale)
				Dprint("   - Adding embarkation promotion to " .. unit:GetName() .. " (unitID =".. unit:GetID(), bDebug)
				unit:SetHasPromotion(PROMOTION_EMBARKATION, true)
			end
		end

	elseif not EMBARK_FROM_HARBOR and not (unit:IsHasPromotion(PROMOTION_EMBARKATION)) and not ( GameInfo.Units[unitType].Domain == "DOMAIN_SEA" or GameInfo.Units[unitType].Domain == "DOMAIN_AIR" ) then
		Dprint("   - Adding embarkation promotion to " .. unit:GetName() .. " (unitID =".. unit:GetID(), bDebug)
		unit:SetHasPromotion(PROMOTION_EMBARKATION, true)
	end
end

function SetScenarioPromotion(unit)
	local bDebug = true
	if USE_TACTICAL_RANGE then
		if unit:IsRanged() and (unit:GetDomainType() == DomainTypes.DOMAIN_LAND) then
			if (not unit:IsHasPromotion(PROMOTION_RANGE_3)) then
				Dprint("   - Adding +3 range promotion to " .. unit:GetName() .. " (unitID =".. unit:GetID(), bDebug)
				unit:SetHasPromotion(PROMOTION_RANGE_3, true)
			end
		end
		if ( unit:GetDomainType() == DomainTypes.DOMAIN_AIR ) then
			if (not unit:IsHasPromotion(PROMOTION_RANGE_6)) then
				Dprint("   - Adding +6 range promotion to " .. unit:GetName() .. " (unitID =".. unit:GetID(), bDebug)
				unit:SetHasPromotion(PROMOTION_RANGE_6, true)
			end
		end
	end
		
	if USE_FAST_OCEAN_MOVE then
		if (unit:IsEmbarked() or unit:GetDomainType() == DomainTypes.DOMAIN_SEA) then
			if (not unit:IsHasPromotion(PROMOTION_OCEAN_MOVEMENT)) then
				Dprint("   - Adding x2 Ocean move to " .. unit:GetName() .. " (unitID =".. unit:GetID(), bDebug)
				unit:SetHasPromotion(PROMOTION_OCEAN_MOVEMENT, true)
			end
		elseif (not unit:IsEmbarked()) and ( unit:GetDomainType() == DomainTypes.DOMAIN_LAND ) then
			if (unit:IsHasPromotion(PROMOTION_OCEAN_MOVEMENT)) then
				Dprint("   - Removing x2 Ocean move to " .. unit:GetName() .. " (unitID =".. unit:GetID(), bDebug)
				unit:SetHasPromotion(PROMOTION_OCEAN_MOVEMENT, false)
			end
		end
	end
		
	if USE_FAST_NAVAL_MOVE then
		if (unit:IsEmbarked() or unit:GetDomainType() == DomainTypes.DOMAIN_SEA) then
			if (not unit:IsHasPromotion(PROMOTION_NAVAL_MOVEMENT)) then
				Dprint("   - Adding +2 Sea moves to " .. unit:GetName() .. " (unitID =".. unit:GetID(), bDebug)
				unit:SetHasPromotion(PROMOTION_NAVAL_MOVEMENT, true)
			end
		elseif (not unit:IsEmbarked()) and ( unit:GetDomainType() == DomainTypes.DOMAIN_LAND ) then
			if (unit:IsHasPromotion(PROMOTION_NAVAL_MOVEMENT)) then
				Dprint("   - Removing +2 Sea moves to " .. unit:GetName() .. " (unitID =".. unit:GetID(), bDebug)
				unit:SetHasPromotion(PROMOTION_NAVAL_MOVEMENT, false)
			end
		end
	end
end

function RemoveFreePromotions(unit)
	local thisUnit = GameInfo.Units[unit:GetUnitType()]
	local condition = "UnitType = '" .. thisUnit.Type .. "'";
	for row in GameInfo.Unit_FreePromotions( condition ) do
		local promotion = GameInfo.UnitPromotions[row.PromotionType];
		if promotion then
			if (unit:IsHasPromotion(promotion.ID)) then
				unit:SetHasPromotion(promotion.ID, false)
			end
		end	
	end
end

function RestoreFreePromotions(unit)
	local thisUnit = GameInfo.Units[unit:GetUnitType()]
	local condition = "UnitType = '" .. thisUnit.Type .. "'";
	for row in GameInfo.Unit_FreePromotions( condition ) do
		local promotion = GameInfo.UnitPromotions[row.PromotionType];
		if promotion then
			if (not unit:IsHasPromotion(promotion.ID)) then
				unit:SetHasPromotion(promotion.ID, true)
			end
		end	
	end
end

function InitializeDynamicPromotions()
	for playerID = 0, GameDefines.MAX_CIV_PLAYERS - 1 do
		local player = Players[playerID]
		if player and player:IsAlive() then
			for unit in player:Units() do
				DynamicTilePromotion(playerID, unit:GetID(), unit:GetX(), unit:GetY())
			end
		end
	end
end


-------------------------------
-- New unit:fonctions()
-------------------------------

function GetPreviousDamage(self)
	local unitKey = GetUnitKey(self)
	local damage = 0
	if MapModData.RED.UnitData[unitKey] then
		damage = MapModData.RED.UnitData[unitKey].Damage
	end
	return damage
end

function NewUnitSetDamage(self, damage)
	local unitKey = GetUnitKey(self)
	if MapModData.RED.UnitData[unitKey] then
		MapModData.RED.UnitData[unitKey].Damage = damage
	end
	self:OldSetDamage(damage)
end

--function InitializeUnitFunctions(playerID, unitID)
function InitializeUnitFunctions(playerID, unitID)

	local bDebug = true
	
	--local player = Players[ playerID ]
	--local unit = player:GetUnitByID( unitID )
	local player = Players[Game.GetActivePlayer()]
	for unit in player:Units() do -- get the first unit we found...
		-- update unit functions...
		local u = getmetatable(unit).__index
	
		Dprint ("------------------ ", bDebug)
		Dprint ("Updating unit metatable... ", bDebug)

		-- initialize once...
		if not u.OldSetDamage then
			u.OldSetDamage = u.SetDamage
			-- set replacement
			u.SetDamage = NewUnitSetDamage
			u.GetPreviousDamage = GetPreviousDamage
			-- remove from event
			GameEvents.GameCoreUpdateBegin.Remove( InitializeUnitFunctions )
		end
		break
	end
end


-------------------------------
-- Combat restriction
-------------------------------

function CanRangeStrike(iPlayer, iUnit, x, y)
	--Dprint("Can range strike at (" .. x .. "," .. y ..") ?")
	local player = Players[iPlayer]
	if not player then
		return false
	end
	local unit = player:GetUnitByID(iUnit)
	local plot = GetPlot(x,y)

	if (not unit) or (not plot) then -- we may want to change that to allow range strike on improvement...
		return false 
	end

	local unitDomain = unit:GetDomainType()
	local unitPlot = unit:GetPlot()

	if g_NoRangeAttack and g_NoRangeAttack[unit:GetUnitType()] then -- some ranged units can't range attack (ex: the Me-262 can only intercept or air sweep)		
		return false 
	end

	if unitDomain == DomainTypes.DOMAIN_SEA and unitPlot:IsCity() then -- naval units can't fire from harbors
		return false
	end

	if unitDomain == DomainTypes.DOMAIN_LAND and unit:Range() < 3 and (unitPlot:GetArea() ~= plot:GetArea() and not plot:IsWater()) then -- don't fire across sea channel unless we are really long range...
		return false
	end

	local unitCount = plot:GetNumUnits()
	local bestDefender = nil
	for i = 0, unitCount - 1, 1 do	
    	local testUnit = plot:GetUnit(i)
		if testUnit and testUnit:IsBetterDefenderThan(bestDefender, unit) then
			bestDefender = testUnit
		end
	end
	if bestDefender then
		local defenderClassType = bestDefender:GetUnitClassType()
		local defenderNumType = g_Unit_Classes[defenderClassType].NumType or -1
		--Dprint("defendernumtype = " .. tostring(defenderNumType))
		local classType = unit:GetUnitClassType()
		local numType = g_Unit_Classes[classType].NumType or -1
		--Dprint("attackernumtype = " .. tostring(numType))
		-- to attack submarines we can't be land based or large bomber
		-- to do : change that check to depth charge or torpedoes promotions
		if not plot:IsCity() and IsSubmarineClass(defenderNumType) and (unitDomain == DomainTypes.DOMAIN_LAND or (unitDomain == DomainTypes.DOMAIN_AIR --[[and not IsSmallBomberClass(numType)--]])) then
			return false
		end
	end

	return true
end
--GameEvents.CanRangeStrikeAt.Add(CanRangeStrike)