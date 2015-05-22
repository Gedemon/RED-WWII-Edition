-- R.E.D. Diplomacy functions
-- Author: Gedemon
-- DateCreated: 2/15/2012 12:45:48 AM
--------------------------------------------------------------

print("Loading Red Diplomacy Functions...")
print("-------------------------------------")

--------------------------------------------------------------
-- InGame functions 
--------------------------------------------------------------

-- display notification to warn the player when he is going to declare war
function PrepareForWar(turnBefore)

	local bDebug = false

	Dprint("-------------------------------------", bDebug)
	Dprint("Alert for War : looking ".. turnBefore .." turns ahead", bDebug)

	local warTurn = Game.GetGameTurn() + turnBefore
	local activePlayerID = Game.GetActivePlayer()
	
	-- vs major
	if g_Calendar[warTurn] then turnDate = g_Calendar[warTurn].Number else turnDate = REAL_WORLD_ENDING_DATE end
	if g_Calendar[warTurn-1] then prevDate = g_Calendar[warTurn-1].Number else  prevDate = turnDate - 1 end
	
	Dprint("Look for active player (".. activePlayerID ..") at turn ".. warTurn, bDebug)
	for date, relations in pairs(g_Major_Diplomacy) do
		if date <= turnDate and date > prevDate then
			if (relations) then
				for i, diploChange in ipairs (relations) do
					if (diploChange.Type == DOW) then
						Dprint("- Major DOW this turn", bDebug)
						local targetID = GetPlayerIDFromCivID( diploChange.Civ2 ) 
						if ( GetPlayerIDFromCivID( diploChange.Civ1 ) == activePlayerID ) and (not AreAtWar( activePlayerID, targetID)) then
							local target = Players [ targetID ]
							if target:IsAlive() then
								Players[activePlayerID]:AddNotification(NotificationTypes.NOTIFICATION_DIPLOMACY_DECLARATION, "Prepare our troops, we are going to declare war against " .. target:GetName().. " in " .. turnBefore .. " turns", "Entering War in " .. turnBefore .. " turns !", bDebug)
							end
						end
					end
				end
			else
				Dprint("- No change between major that turn")
			end
		end
	end

	-- vs Minor
	--local relations = g_Major_Minor_DoW[warTurn]
	for date, relations in pairs(g_Major_Minor_DoW) do
		if date <= turnDate and date > prevDate then
			if (relations) then
				Dprint("- Minor DOW this turn", bDebug)
				for i, diploChange in ipairs (relations) do
					if ( GetPlayerIDFromCivID( diploChange.Major ) == activePlayerID ) then
						local target = Players [ GetPlayerIDFromCivID( diploChange.Minor, true ) ]
						Players[activePlayerID]:AddNotification(NotificationTypes.NOTIFICATION_DIPLOMACY_DECLARATION, "Prepare our troops, we are going to declare war against " .. target:GetName().. " in " .. turnBefore .. " turns", "Entering War in " .. turnBefore .. " turns !", bDebug)
					end
				end
			else
				Dprint("- No change between minor that turn", bDebug)
			end	
		end
	end

end

--------------------------------------------------------------
-- Utils 
--------------------------------------------------------------

function IsSameSideHuman(AIplayer)
	local bDebug = false
	local sameSide = false
	local AICivID = GetCivIDFromPlayerID (AIplayer:GetID())
	for playerID = 0, GameDefines.MAX_MAJOR_CIVS-1 do
		local player = Players[playerID]
		if player:IsHuman() and player:IsAlive() then
			humanCivID = GetCivIDFromPlayerID (playerID)
			if ( g_Allied[AICivID] and g_Allied[humanCivID] ) or ( g_Axis[AICivID] and g_Axis[humanCivID] ) then
				sameSide = true
			end
		end
	end
	return sameSide
end

function BothSideHuman()
	local bDebug = false
	local AxisHuman = false
	local AlliesHuman = false
	for playerID = 0, GameDefines.MAX_MAJOR_CIVS-1 do
		local player = Players[playerID]
		if player:IsHuman() and player:IsAlive() then
			humanCivID = GetCivIDFromPlayerID (playerID)
			if ( g_Allied[humanCivID] ) then
				AlliesHuman = true
			elseif ( g_Axis[humanCivID] ) then 
				AxisHuman = true
			end
		end
	end
	return (AlliesHuman and AxisHuman)
end

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

function AreAtWar( player1ID, player2ID)
	local bDebug = false
	local player = Players[ player1ID ]
	local player2 = Players[ player2ID ]
	
	if (not player:IsAlive())
	or (not player2:IsAlive())
	or player:IsBarbarian()
	or player2:IsBarbarian()
	then
		Dprint ("WARNING: AreAtWar() called for a dead or barbarian player...", bDebug )
		return false
	end

	Dprint ("testing are at war for : " .. player:GetName() .." and " .. player2:GetName(), bDebug )
	local team = Teams[ player:GetTeam() ]
	if team:IsAtWar( player2:GetTeam() ) then
		Dprint ("   - TRUE", bDebug )
		return true
	end
	Dprint ("   - FALSE", bDebug )
	return false
end

function CreateAlliance(pPlayer1, pPlayer2)
	local team = Teams[ pPlayer1:GetTeam() ]
	local team2 = Teams[ pPlayer2:GetTeam() ]
	team:AddTeam( pPlayer2:GetTeam() )
	Dprint (" - " .. pPlayer1:GetName() .. " is now permanently allied with " .. pPlayer2:GetName() )
	Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes.NOTIFICATION_DIPLOMACY_DECLARATION, pPlayer1:GetName() .. " and " .. pPlayer2:GetName().. " are now permanently allied", "Permanent Alliance created !")
end

function DeclarePermanentWar(iPlayer1, iPlayer2)
	local player1 = Players[ iPlayer1 ]
	local player2 = Players[ iPlayer2 ]
	if not (player1:IsAlive() and player2:IsAlive()) then
		Dprint(" - WARNING : Declare War called for a dead civ, skipping...")
		return
	end
	local team1 = Teams[ player1:GetTeam() ]
	local team2 = Teams[ player2:GetTeam() ]
	if not AreAtWar( iPlayer1, iPlayer2) then
		team1:DeclareWar( player2:GetTeam() )
	end
	team1:SetPermanentWarPeace( player2:GetTeam(), true)
	team2:SetPermanentWarPeace( player1:GetTeam(), true)
end

function DeclareSimpleWar(iPlayer1, iPlayer2)
	local player1 = Players[ iPlayer1 ]
	local player2 = Players[ iPlayer2 ]
	if not (player1:IsAlive() and player2:IsAlive()) then
		Dprint(" - WARNING : Declare War called for a dead civ, skipping...")
		return
	end
	local team1 = Teams[ player1:GetTeam() ]
	local team2 = Teams[ player2:GetTeam() ]
	if not AreAtWar( iPlayer1, iPlayer2) then
		team1:DeclareWar( player2:GetTeam() )
	end
end

function MakePermanentPeace(iPlayer1, iPlayer2)
	local player1 = Players[ iPlayer1 ]
	local player2 = Players[ iPlayer2 ]
	if not (player1:IsAlive() and player2:IsAlive()) then
		Dprint(" - WARNING : Make Peace called for a dead civ, skipping...")
		return
	end
	local team1 = Teams[ player1:GetTeam() ]
	local team2 = Teams[ player2:GetTeam() ]
	if AreAtWar( iPlayer1, iPlayer2) then
		team1:MakePeace( player2:GetTeam() )
	end
	team1:SetPermanentWarPeace( player2:GetTeam(), true)
	team2:SetPermanentWarPeace( player1:GetTeam(), true)
end

function MakeSimplePeace(iPlayer1, iPlayer2)
	local player1 = Players[ iPlayer1 ]
	local player2 = Players[ iPlayer2 ]
	if not (player1:IsAlive() and player2:IsAlive()) then
		Dprint(" - WARNING : Make Peace called for a dead civ, skipping...")
		return
	end
	local team1 = Teams[ player1:GetTeam() ]
	local team2 = Teams[ player2:GetTeam() ]
	if AreAtWar( iPlayer1, iPlayer2) then
		team1:MakePeace( player2:GetTeam() )
	end
end

function IsNeutral(playerID)
	for OtherID = 0, GameDefines.MAX_CIV_PLAYERS-1, 1 do
		if AreAtWar( playerID, OtherID) then
			return false
		end
	end
	return true	
end

function IsAllied(playerID)
	local civID = GetCivIDFromPlayerID(playerID)
	return g_Allied[civID]
end

function IsAxis(playerID)
	local civID = GetCivIDFromPlayerID(playerID)
	return g_Axis[civID]
end


--------------------------------------------------------------
-- Forced diplomacy
--------------------------------------------------------------

function SetMajorRelations()

	local bDebug = false

	if g_Major_Diplomacy then

		Dprint("-------------------------------------")
		Dprint ("Forced Diplomacy : looking for Major relationship...")
	
		local turn = Game.GetGameTurn()
		local turnDate, prevDate = 0, 0
		if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
		if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end
	
		Dprint ("Current turn date : " .. turnDate ..", next turn date :" .. prevDate, bDebug )

		for date, relations in pairs(g_Major_Diplomacy) do
			if date <= turnDate and date > prevDate then
				Dprint (date .. " <= " .. turnDate .." and ".. date .." > " .. prevDate, bDebug )

				if (relations) then
					for i, diploChange in ipairs (relations) do

						-- declaration of friendship
						if (diploChange.Type == DOF) then
							local player = Players[ GetPlayerIDFromCivID( diploChange.Civ1 ) ]
							local player2 = Players[ GetPlayerIDFromCivID( diploChange.Civ2 ) ]

							player:DoForceDoF( GetPlayerIDFromCivID( diploChange.Civ2 ) )

							Dprint (" - " .. player:GetName() .. " (ID "..diploChange.Civ1..") and " .. player2:GetName() .. " (ID "..diploChange.Civ2..") have made a declaration of friendship", bDebug)

						-- denounciation
						elseif (diploChange.Type == DEN) then
							local player = Players[ GetPlayerIDFromCivID( diploChange.Civ1 ) ]
							local player2 = Players[ GetPlayerIDFromCivID( diploChange.Civ2 ) ]

							player:DoForceDenounce( GetPlayerIDFromCivID( diploChange.Civ2 ) )

							Dprint (" - " .. player:GetName() .. " (ID "..diploChange.Civ1..") has denounced " .. player2:GetName() .. " (ID "..diploChange.Civ2..")", bDebug)

						-- declaration of war
						elseif (diploChange.Type == DOW) then
							local player = Players[ GetPlayerIDFromCivID( diploChange.Civ1 ) ]
							local player2 = Players[ GetPlayerIDFromCivID( diploChange.Civ2 ) ]

							DeclarePermanentWar(GetPlayerIDFromCivID( diploChange.Civ1 ),GetPlayerIDFromCivID( diploChange.Civ2 ))

							Dprint (" - " .. player:GetName() .. " (ID "..diploChange.Civ1..") has declared war against " .. player2:GetName() .. " (ID "..diploChange.Civ2..")", bDebug)

						-- permanent alliance
						elseif (diploChange.Type == PEA) then
							local player = Players[ GetPlayerIDFromCivID( diploChange.Civ1 ) ]
							local player2 = Players[ GetPlayerIDFromCivID( diploChange.Civ2 ) ]

							CreateAlliance(player, player2)

						-- sign peace treaty
						elseif (diploChange.Type == SPT) then
							local player = Players[ GetPlayerIDFromCivID( diploChange.Civ1 ) ]
							local player2 = Players[ GetPlayerIDFromCivID( diploChange.Civ2 ) ]

							MakeSimplePeace(GetPlayerIDFromCivID( diploChange.Civ1 ), GetPlayerIDFromCivID( diploChange.Civ2 ))

							Dprint (" - " .. player:GetName() .. " (ID "..diploChange.Civ1..") has signed a peace treaty with " .. player2:GetName() .. " (ID "..diploChange.Civ2..")", bDebug)
						end

					end
				end
			end
		end
	end
end
function SetMinorRelations()

	local bDebug = false

	if g_Minor_Relation then

		Dprint("-------------------------------------")
		Dprint ("Forced Diplomacy : looking for Minor relationship...")

		--local turn = Game.GetGameTurn()
		--local relations = g_Minor_Relation[turn]

		local turn = Game.GetGameTurn()
		if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
		if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end
		for date, relations in pairs(g_Minor_Relation) do
			if date <= turnDate and date > prevDate then
				if (relations) then
					for i, diploChange in ipairs (relations) do
						local player = Players[ GetPlayerIDFromCivID( diploChange.Minor, true ) ]
						local player2 = Players[ GetPlayerIDFromCivID( diploChange.Major ) ]
						player:ChangeMinorCivFriendshipWithMajor( GetPlayerIDFromCivID(diploChange.Major), diploChange.Value )
						Dprint (" - " .. player:GetName() .. " (ID "..diploChange.Minor..") have changed relationship (".. diploChange.Value ..") with " .. player2:GetName() .. " (ID "..diploChange.Major..")", bDebug)
					end
				end	
			end
		end
	end
end
function SetMinorDOW()

	local bDebug = false

	if g_Major_Minor_DoW then

		Dprint("-------------------------------------")
		Dprint ("Forced Diplomacy : looking for Minor civilizations Declaration of War...")
		local turn = Game.GetGameTurn()
		-- Major vs Minor
		--local relations = g_Major_Minor_DoW[turn]
		if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
		if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end
		for date, relations in pairs(g_Major_Minor_DoW) do
			if date <= turnDate and date > prevDate then
				if (relations) then
					for i, diploChange in ipairs (relations) do
						local player = Players[ GetPlayerIDFromCivID( diploChange.Major ) ]
						local player2 = Players[ GetPlayerIDFromCivID( diploChange.Minor, true ) ]

						DeclarePermanentWar(GetPlayerIDFromCivID( diploChange.Major ), GetPlayerIDFromCivID( diploChange.Minor, true ))

						Dprint (" - " .. player:GetName() .. " (ID "..diploChange.Major..") has declared war against " .. player2:GetName() .. " (ID "..diploChange.Minor..")", bDebug)
					end
				end
			end
		end

		-- Major make peace with Minor
		--local relations = g_Major_Minor_Peace[turn]	
		for date, relations in pairs(g_Major_Minor_Peace) do
			if date <= turnDate and date > prevDate then
				if (relations) then
					for i, diploChange in ipairs (relations) do
						local player = Players[ GetPlayerIDFromCivID( diploChange.Major ) ]
						local player2 = Players[ GetPlayerIDFromCivID( diploChange.Minor, true ) ]
						
						MakeSimplePeace(GetPlayerIDFromCivID( diploChange.Major ), GetPlayerIDFromCivID( diploChange.Minor, true ))

						Dprint (" - " .. player:GetName() .. " (ID "..diploChange.Major..") has signed a peace treaty with " .. player2:GetName() .. " (ID "..diploChange.Minor..")")
					end
				end	
			end
		end

		-- Minor vs Minor
		--local relations = g_Minor_Minor_DoW[turn]
		for date, relations in pairs(g_Minor_Minor_DoW) do
			if date <= turnDate and date > prevDate then
				if (relations) then
					for i, diploChange in ipairs (relations) do
						local player = Players[ GetPlayerIDFromCivID( diploChange.Minor1, true ) ]
						local player2 = Players[ GetPlayerIDFromCivID( diploChange.Minor2, true ) ]
						
						DeclarePermanentWar(GetPlayerIDFromCivID( diploChange.Minor1, true ), GetPlayerIDFromCivID( diploChange.Minor2, true ))

						Dprint (" - " .. player:GetName() .. " (ID "..diploChange.Minor1..") has declared war against " .. player2:GetName() .. " (ID "..diploChange.Minor2..")")
					end
				end
			end
		end

		-- Minor vs Major
		--local relations = g_Minor_Major_DoW[turn]
		for date, relations in pairs(g_Minor_Major_DoW) do
			if date <= turnDate and date > prevDate then
				if (relations) then
					for i, diploChange in ipairs (relations) do
						local player = Players[ GetPlayerIDFromCivID( diploChange.Minor, true ) ]
						local player2 = Players[ GetPlayerIDFromCivID( diploChange.Major ) ]
						
						DeclarePermanentWar(GetPlayerIDFromCivID( diploChange.Minor, true ), GetPlayerIDFromCivID( diploChange.Major ))

						Dprint (" - " .. player:GetName() .. " (ID "..diploChange.Minor..") has declared war against " .. player2:GetName() .. " (ID "..diploChange.Major..")")
					end
				end	
			end
		end
	end
end

-- Prevent diplo contact to the player
function CanSendDiploStatement(iPlayer)
	player = Players[iPlayer]
	if player then
		print ("- DIPLO AI: Send diplo statement to " .. tostring(player:GetName()))
		if player:IsHuman() and NO_DIPLO_STATEMENT then
			return false
		end
	end
	return true
end
--GameEvents.CanSendDiploStatement.Add( CanSendDiploStatement )

--------------------------------------------------------------
-- Protected Minors
--------------------------------------------------------------

function GetMinorFromTeam(team) -- assuming minor can't team up with other or major... else this will return the minor civ in the team with the highest number ID
	local minorCiv = nil

	for playerID = GameDefines.MAX_MAJOR_CIVS, GameDefines.MAX_CIV_PLAYERS - 1 do
		local player = Players[playerID]
		if player:GetTeam() == team then
			minorCiv = GetCivIDFromPlayerID (playerID)
		end
	end

	return minorCiv
end

function GetProtectedListFromTeam(team) 
	local listProtected = {}

	if g_MinorProtector then
		for minorID, protectorList in pairs (g_MinorProtector) do
			for i, protectorID in pairs (protectorList) do
				local protector = Players[GetPlayerIDFromCivID (protectorID, false, true)]
				if protector:GetTeam() == team then
					listProtected[minorID] = true
				end
			end
		end
	end

	return listProtected
end

function WarConsequences( iTeam1, iTeam2, bWar ) -- Check for declaration of war consequences...

	local bDebug = false

	if PERMANENT_WAR_DECLARATION then	
		Teams[iTeam1]:SetPermanentWarPeace( iTeam2, true)
		Teams[iTeam2]:SetPermanentWarPeace( iTeam1, true)
	end

	if (bWar) then
		local minorCiv = GetMinorFromTeam(iTeam1)
		if minorCiv and g_MinorProtector then
			local protectorList = g_MinorProtector[minorCiv]
			local protected = Players[GetPlayerIDFromCivID (minorCiv, true, true)]
			local protectedTeam = Teams[iTeam1]
			Dprint ("-------------------------------------", bDebug)
			Dprint ("A protected minor Civ (".. protected:GetName() .. ") is attacked !", bDebug)
			if protectorList then
				for i, protectorCiv in pairs (protectorList) do
					local iProtector = GetPlayerIDFromCivID (protectorCiv, false, true)
					local protector = Players[iProtector]
					local iProtectorTeam = protector:GetTeam()
					local protectorTeam = Teams[iProtectorTeam]
					if iProtectorTeam == iTeam2 then
						Dprint (" - the protector (" .. protector:GetName() ..")  team is also the agressor, do nothing...", bDebug)
					elseif protectorTeam:IsAtWar( iTeam2 ) then
						Dprint (" - the protector (" .. protector:GetName() ..")  team is already at war with the agressor, do nothing...", bDebug)
					elseif protectorTeam:IsAtWar( iTeam1 ) then
						Dprint (" - the protector (" .. protector:GetName() ..")  team is at war with the protected, do nothing...", bDebug)
					elseif iTeam1 == iTeam2 then
						Dprint (" - the protected (" .. protected:GetName() ..")  team is it's own agressor (???), force immediate peace...", bDebug) -- yes a team can declare war to itself...
						protectedTeam:MakePeace( iTeam2 )
					else
						Dprint (" - " .. protector:GetName() .."  team is declaring war to the agressor...", bDebug)
						protectorTeam:DeclareWar( iTeam2 )
						
						protectorTeam:SetPermanentWarPeace( iTeam2, true)
						Teams[iTeam2]:SetPermanentWarPeace( iProtectorTeam, true)

						Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes.NOTIFICATION_DIPLOMACY_DECLARATION, protector:GetName() .. " is entering war to protect " .. protected:GetName() .. " from agression", protector:GetName() .. " is defending " .. protected:GetName() .. " !")
						protected:ChangeMinorCivFriendshipWithMajor( iProtector, 100 ) -- to do : define this value
					end
				end
			end
		end
	end	
end
-- add to Events.WarStateChanged on init and loading...

function ForcePeaceOnProtected(iTeam1, iTeam2)
	local bDebug = true
	local team = Teams[iTeam1]
	Dprint ("-------------------------------------", bDebug)
	Dprint ("Searching protected civs of " .. team:GetName(), bDebug)
	local protectedList = GetProtectedListFromTeam(iTeam1)
	for protectedID, check in pairs (protectedList) do
		local protected = Players[GetPlayerIDFromCivID (protectedID, true, true)]
		local protectedTeam = Teams[ protected:GetTeam() ]
		if protectedTeam:IsAtWar( iTeam1 ) then
			Dprint (" - the protected (" .. protected:GetName() ..")  is at war with the protector, do nothing...", bDebug)
		elseif not protectedTeam:IsAtWar( iTeam2 ) then
			Dprint (" - the protected (" .. protected:GetName() ..")  is already at peace with the other team, do nothing...", bDebug)
		else
			Dprint (" - " .. protected:GetName() .."  is signing the peace treaty...", bDebug)
			protectedTeam:MakePeace( iTeam2 )
		end
	end
end

function PeaceConsequences( iTeam1, iTeam2, bWar ) -- Check for declaration of war consequences...

	local bDebug = true

	if not bWar then
		Dprint ("-------------------------------------", bDebug)
		Dprint ("Peace treaty signed, scan for protected civs to include in peace treaty...", bDebug)
		-- force peace with protected minor civs
		ForcePeaceOnProtected(iTeam1, iTeam2)
		ForcePeaceOnProtected(iTeam2, iTeam1)
	end	
end
-- add to Events.WarStateChanged on init and loading...

-- Functions to hide Minor civ War Button
function HideMinorWarButton( popupInfo )

	local bDebug = true
		Dprint ("-------------------------------------", bDebug)
		Dprint ("Check War button for Minor civ...", bDebug)
	
	if( popupInfo.Type ~= ButtonPopupTypes.BUTTONPOPUP_CITY_STATE_DIPLO ) then
		return
	end
	
    local minorPlayerID = popupInfo.Data1
    --local minorTeamID = Players[minorPlayerID]:GetTeam()	
	local playerID = Game.GetActivePlayer()
	local team = Teams [Players[playerID]:GetTeam()]
	
	local bForcedPeace = false
	local strToolTip = nil
	local strText = nil

	if Game.GetGameTurn() < WAR_MINIMUM_STARTING_TURN then
		bForcedPeace = true
		strToolTip = "You can't declare war before turn " .. WAR_MINIMUM_STARTING_TURN
	end
	if not ALLOW_ALTERNATE_HISTORY then
		bForcedPeace = true
		strToolTip = "This scenario doesn't allow alternate history"
	end

	if g_MinorProtector then
		local protectorList = g_MinorProtector[GetCivIDFromPlayerID (minorPlayerID)]
		if protectorList then
			for i, protectorID in pairs (protectorList) do
				local protector = Players[GetPlayerIDFromCivID (protectorID, false, true)]
				if team:IsForcePeace( protector:GetTeam() ) then
					Dprint ("Peace forced beetwen player and " .. protector:GetName(), bDebug)
					
					bForcedPeace = true
					strToolTip = "There is a peace treaty enforced on you and this nation's protector"
					strText = "We hope that the peace treaty between you and our protector will last."
				end
			end
		end
	end

	if ( bForcedPeace ) then
		ContextPtr:LookUpControl("/InGame/CityStateDiploPopup/WarButton"):SetDisabled(true)
		if strToolTip then ContextPtr:LookUpControl("/InGame/CityStateDiploPopup/WarButton"):SetToolTipString( strToolTip ); end
		if strText then ContextPtr:LookUpControl("/InGame/CityStateDiploPopup/DescriptionLabel"):SetText( strText ); end
	else
		ContextPtr:LookUpControl("/InGame/CityStateDiploPopup/WarButton"):SetDisabled(false)
		ContextPtr:LookUpControl("/InGame/CityStateDiploPopup/WarButton"):SetToolTipString( "" )
	end
end
-- add to Events.SerialEventGameMessagePopup on init and loading...

-- Functions to hide Minor civ Peace Button
function HideMinorPeaceButton( popupInfo )

	local bDebug = true
		Dprint ("-------------------------------------", bDebug)
		Dprint ("Check Peace button for Minor civ...", bDebug)
	
	if( popupInfo.Type ~= ButtonPopupTypes.BUTTONPOPUP_CITY_STATE_DIPLO ) then
		return
	end
	
    local minorPlayerID = popupInfo.Data1
    --local minorTeamID = Players[minorPlayerID]:GetTeam()	
	local playerID = Game.GetActivePlayer()
	local team = Teams [Players[playerID]:GetTeam()]
	
	local bForcedWar = false
	local strToolTip = nil
	local strText = nil

	if not ALLOW_ALTERNATE_HISTORY then
		bForcedWar = true
		strToolTip = "This scenario doesn't allow alternate history"
	end

	if team:IsPermanentWarPeace(Players[minorPlayerID]:GetTeam()) then
		Dprint ("War forced beetwen player and " .. Players[minorPlayerID]:GetName(), bDebug)
		bForcedWar = true
		strToolTip = "Peace is not allowed at this date by the scenario settings."
	end

	if ( bForcedWar ) then
		ContextPtr:LookUpControl("/InGame/CityStateDiploPopup/PeaceButton"):SetDisabled(true)
		if strToolTip then ContextPtr:LookUpControl("/InGame/CityStateDiploPopup/PeaceButton"):SetToolTipString( strToolTip ); end
	else
		ContextPtr:LookUpControl("/InGame/CityStateDiploPopup/PeaceButton"):SetDisabled(false)
		ContextPtr:LookUpControl("/InGame/CityStateDiploPopup/PeaceButton"):SetToolTipString( "" )
	end
end

--------------------------------------------------------------
-- Neutral Minors
--------------------------------------------------------------

function GeneralMobilization (iTeam1, iTeam2, bWar)

	local bDebug = true
	
	if (bWar) then
		local minorCiv1 = GetMinorFromTeam(iTeam1)
		local minorCiv2 = GetMinorFromTeam(iTeam2)

		local bNeedToMobilize = false

		if minorCiv1 then
			OpenBorders(GetPlayerIDFromCivID (minorCiv1, true))
			bNeedToMobilize = not HasAlreadyMobilized(minorCiv1)
		end
		
		if minorCiv2 then
			OpenBorders(GetPlayerIDFromCivID (minorCiv2, true))
			bNeedToMobilize = bNeedToMobilize or not HasAlreadyMobilized(minorCiv2)
		end

		if bNeedToMobilize and g_MinorMobilization_OOB then
			Dprint("-------------------------------------")
			Dprint("Call to General Mobilization !")
			local dominanceZone = {}
			local mobilizedCiv = {}
			for i, oob in ipairs (g_MinorMobilization_OOB) do
				local playerID = GetPlayerIDFromCivID (oob.CivID, oob.IsMinor)	
				Dprint("CivID = " .. oob.CivID, bDebug)
				Dprint("PlayerID = " .. playerID, bDebug)
				local player = Players[playerID]
				local bIsHumanSide = player and (player:IsHuman() or IsSameSideHuman(player))
				if (not (bIsHumanSide and oob.AI)) 
				--or BothSideHuman() 
				and (oob.CivID == minorCiv1 or oob.CivID == minorCiv2)
				and not HasAlreadyMobilized(oob.CivID)
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
					mobilizedCiv[oob.CivID] = true
				end
			end
			for player, plotkey in pairs(dominanceZone) do
				Dprint("Set dominance zone for ".. player:GetName() .. " at " .. plotkey, bDebug)
				player:AddTemporaryDominanceZone (GetPlotXYFromKey (plotkey))
			end		
			
			for civID, bMobilize in pairs(mobilizedCiv) do
				if bMobilize then
					local savedData = Modding.OpenSaveData()					
					local saveStr = "Mobilized-"..civID
					savedData.SetValue(saveStr, 1)
				end
			end

			Dprint("-------------------------------------", bDebug)
			Dprint("End of Order of Battle after Mobilization initialization ...", bDebug)
		end
	else	
		local minorCiv1 = GetMinorFromTeam(iTeam1)
		local minorCiv2 = GetMinorFromTeam(iTeam2)

		if minorCiv1 and IsNeutral(GetPlayerIDFromCivID (minorCiv1, true)) then
			CloseBorders(GetPlayerIDFromCivID (minorCiv1, true))
		end
		
		if minorCiv2 and IsNeutral(GetPlayerIDFromCivID (minorCiv2, true)) then
			CloseBorders(GetPlayerIDFromCivID (minorCiv2, true))
		end
	end
end
-- add to Events.WarStateChanged on init and loading...
		
function HasAlreadyMobilized(minorCiv)
	local savedData = Modding.OpenSaveData()
	local saveStr = "Mobilized-"..minorCiv
	local triggered = savedData.GetValue(saveStr)
	if triggered == 1 then
		return true
	end
	return false
end

function CloseBorders(playerID)

	local bDebug = true

	if not CLOSE_MINOR_NEUTRAL_CIV_BORDERS then
		return
	end
	
	Dprint("-------------------------------------", bDebug)
	Dprint("Closing Borders of " .. tostring(Players[playerID]:GetName()), bDebug)
	local team = Teams[Players[playerID]:GetTeam()]
	team:SetClosedBorder(true)
end

function OpenBorders(playerID)
	local bDebug = true

	if not CLOSE_MINOR_NEUTRAL_CIV_BORDERS then
		return
	end
	
	Dprint("-------------------------------------", bDebug)
	Dprint("Opening Borders of " .. tostring(Players[playerID]:GetName()), bDebug)
	local team = Teams[Players[playerID]:GetTeam()]
	team:SetClosedBorder(false)
end

function InitializeClosedBorders()


	if not CLOSE_MINOR_NEUTRAL_CIV_BORDERS then
		return
	end
	
	Dprint("-------------------------------------")
	Dprint("Initialize Closed Borders ")

	for playerID = GameDefines.MAX_MAJOR_CIVS, GameDefines.MAX_CIV_PLAYERS - 1 do
		local player = Players[playerID]
		if player:IsAlive() and not player:IsBarbarian() then
			if IsNeutral(playerID) then
				CloseBorders(playerID)
			end
		end
	end
end
