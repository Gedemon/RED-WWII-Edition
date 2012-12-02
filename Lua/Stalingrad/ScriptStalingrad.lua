-- ScriptEuro1940
-- Author: Gedemon
-- DateCreated: 8/23/2011 10:36:46 PM
--------------------------------------------------------------

print("Loading Red Stalingrad Scripts...")
print("-------------------------------------")


--------------------------------------------------------------
-- UI functions
--------------------------------------------------------------
include("InstanceManager")

-- Gold Tooltip init
function DoInitStalingradUI()
	ContextPtr:LookUpControl("/InGame/TopPanel/GoldPerTurn"):SetToolTipCallback( GoldTipforStalingradHandler )
	ContextPtr:LookUpControl("/InGame/TopPanel/ResourceString"):SetToolTipCallback( ToolTipStalingradScore )
	UpdateStalingradScoreString()
end

local tipControlTable = {};
TTManager:GetTypeControlTable( "TooltipTypeTopPanel", tipControlTable );

-- Gold Tooltip for Stalingrad
function GoldTipforStalingradHandler( control )

	local strText = "";
	local iPlayerID = Game.GetActivePlayer();
	local pPlayer = Players[iPlayerID];
	local pTeam = Teams[pPlayer:GetTeam()];
	local pCity = UI.GetHeadSelectedCity();
	
	local iTotalGold = pPlayer:GetGold();


	local fGoldPerTurnFromCities = pPlayer:GetGoldFromCitiesTimes100() / 100;
	local fCityConnectionGold = pPlayer:GetCityConnectionGoldTimes100() / 100;	
	local fScenarioGold = GetScenarioGPT(pPlayer)

	local fTotalIncome = fGoldPerTurnFromCities +  fCityConnectionGold + fScenarioGold;

	
	strText = strText .. "[COLOR:150:255:150:255]";
	strText = strText .. "+" .. Locale.ConvertTextKey("TXT_KEY_TP_TOTAL_INCOME", math.floor(fTotalIncome));
	strText = strText .. "[NEWLINE]  [ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_TP_CITY_OUTPUT", fGoldPerTurnFromCities);	
	if (fScenarioGold ~= 0) then
		strText = strText .. "[NEWLINE]  [ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_TP_SCENARIO_GPT", fScenarioGold);
	end
	strText = strText .. "[/COLOR]";
	
	local iUnitCost = pPlayer:CalculateUnitCost();
	local iUnitSupply = pPlayer:CalculateUnitSupply();
	local iBuildingMaintenance = pPlayer:GetBuildingGoldMaintenance();
	local iImprovementMaintenance = pPlayer:GetImprovementGoldMaintenance();
	local iTotalExpenses = iUnitCost + iUnitSupply + iBuildingMaintenance;
	
	strText = strText .. "[NEWLINE]";
	strText = strText .. "[COLOR:255:150:150:255]";
	strText = strText .. "[NEWLINE]-" .. Locale.ConvertTextKey("TXT_KEY_TP_TOTAL_EXPENSES", iTotalExpenses);
	if (iUnitCost ~= 0) then
		strText = strText .. "[NEWLINE]  [ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_TP_UNIT_MAINT", iUnitCost);
	end
	if (iUnitSupply ~= 0) then
		strText = strText .. "[NEWLINE]  [ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_TP_GOLD_UNIT_SUPPLY", iUnitSupply);
	end
	if (iBuildingMaintenance ~= 0) then
		strText = strText .. "[NEWLINE]  [ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_TP_GOLD_BUILDING_MAINT", iBuildingMaintenance);
	end
	strText = strText .. "[/COLOR]";
	
	if (fTotalIncome + iTotalGold < 0) then
		strText = strText .. "[NEWLINE][COLOR:255:60:60:255]" .. Locale.ConvertTextKey("TXT_KEY_TP_LOSING_SCIENCE_FROM_DEFICIT") .. "[/COLOR]";
	end	

	
	
	tipControlTable.TooltipLabel:SetText( strText );
	tipControlTable.TopPanelMouseover:SetHide(false);
    
    -- Autosize tooltip
    tipControlTable.TopPanelMouseover:DoAutoSize();
	
end

-- Score Tooltip for Stalingrad
function ToolTipStalingradScore( control )

	local score = LoadData("ScoreStalingrad", {[USSR] = 0, [GERMANY] = 0})
	local playerID = Game:GetActivePlayer()
	local player = Players[playerID]

	local strText = "[ICON_MEDAL] Primary Objective :[NEWLINE][NEWLINE]You must control Stalingrad at the end of the turn counter and if your score is negative at this moment, keep it under control until it become positive.[NEWLINE]";
	
	-- Stalingrad owner
	local stalingradOwner = GetStalingradOwner()
	local controlsting = ""
	if stalingradOwner ~= playerID then
		controlsting = "[COLOR_NEGATIVE_TEXT]"
	else
		controlsting = "[COLOR_POSITIVE_TEXT]"
	end
	if GetCivIDFromPlayerID (stalingradOwner) == USSR then
		controlsting = controlsting .. "U.S.S.R.[ENDCOLOR]"
	else
		controlsting = controlsting .. "Germany[ENDCOLOR]"
	end

	strText = strText .. "[NEWLINE][ICON_BULLET] Actually controled by " .. controlsting
	strText = strText .. "[NEWLINE][ICON_BULLET] U.S.S.R for " .. tostring(score[USSR]) .. " turn(s)"
	strText = strText .. "[NEWLINE][ICON_BULLET] Germany for " .. tostring(score[GERMANY]) .. " turn(s)"

	if GetCivIDFromPlayerID (playerID) == USSR then -- USSR obectives

		-- 6th Army
		strText = strText .. "[NEWLINE][NEWLINE][ICON_MEDALS] Secondary Objectives:[NEWLINE]"

		local sixthArmyOperationalPercent = Get6thArmyStrength() / Get6thArmyInitialStrength() * 100
		local sixthArmyOperationalstr = ""
		local handicap = GetHandicapForRED(player)
		local minimalStrength = SIXTH_ARMY_MINIMUM_STRENGTH_PERCENT - (handicap * 5)
		if sixthArmyOperationalPercent < minimalStrength then
			sixthArmyOperationalstr = "[COLOR_POSITIVE_TEXT]".. tostring(Round(sixthArmyOperationalPercent*100)/100) .. "%[ENDCOLOR]"
		else
			sixthArmyOperationalstr = "[COLOR_NEGATIVE_TEXT]".. tostring(Round(sixthArmyOperationalPercent*100)/100) .. "%[ENDCOLOR]"
		end
		strText = strText .. "[NEWLINE][ICON_BULLET] Put German 6th Army under "..minimalStrength.."% strength, current value is: " .. sixthArmyOperationalstr

		-- Road open
		local plotSerafimovitch = GetPlot(5,33)
		local plotVerkhnyaya = GetPlot(11,24)
		local plotKalach = GetPlot(15,19)
		local plotKarpovka = GetPlot(24,19)
		local plotViazovka = GetPlot(46,12)

		local bIsOpenRoad = true
		local routeLength = 0

		local bIsOpenRoad = bIsOpenRoad and isPlotConnected( player , plotSerafimovitch, plotVerkhnyaya, "Road", false, nil , PathBlocked)
		routeLength = routeLength + getRouteLength()
		
		local bIsOpenRoad = bIsOpenRoad and isPlotConnected( player , plotVerkhnyaya, plotKalach, "Road", false, nil , PathBlocked)
		routeLength = routeLength + getRouteLength()
		
		local bIsOpenRoad = bIsOpenRoad and isPlotConnected( player , plotKalach, plotKarpovka, "Road", false, nil , PathBlocked)
		routeLength = routeLength + getRouteLength()
		
		local bIsOpenRoad = bIsOpenRoad and isPlotConnected( player , plotKarpovka, plotViazovka, "Road", false, nil , PathBlocked)
		routeLength = routeLength + getRouteLength()

		local openRoadString = ""
		if bIsOpenRoad and routeLength < 65  then
			openRoadString = "[COLOR_POSITIVE_TEXT]Closed[ENDCOLOR]"
		else
			openRoadString = "[COLOR_NEGATIVE_TEXT]Open[ENDCOLOR]"
		end
	
		strText = strText .. "[NEWLINE][ICON_BULLET] Pincer from Serafimovitch and Viazovka to Kalach: " .. openRoadString

	else -- Germany obectives

		-- 6th Army
		strText = strText .. "[NEWLINE][NEWLINE][ICON_MEDALS] Secondary Objectives:[NEWLINE]"

		local sixthArmyOperationalPercent = Get6thArmyStrength() / Get6thArmyInitialStrength() * 100
		local sixthArmyOperationalstr = ""
		local handicap = GetHandicapForRED(player)
		local minimalStrength = SIXTH_ARMY_MINIMUM_STRENGTH_PERCENT + (handicap * 5)
		if sixthArmyOperationalPercent >= minimalStrength then
			sixthArmyOperationalstr = "[COLOR_POSITIVE_TEXT]".. tostring(Round(sixthArmyOperationalPercent*100)/100) .. "%[ENDCOLOR]"
		else
			sixthArmyOperationalstr = "[COLOR_NEGATIVE_TEXT]".. tostring(Round(sixthArmyOperationalPercent*100)/100) .. "%[ENDCOLOR]"
		end
		strText = strText .. "[NEWLINE][ICON_BULLET] Keep 6th Army "..minimalStrength.."% operational, current value is: " .. sixthArmyOperationalstr
		
		-- Railway open
		local plotMorozovsk = GetPlot(1,13)		
		local plotKotelnikovo = GetPlot(12,1)
		local bIsOpenRail = isPlotConnected( player , plotMorozovsk, plotKotelnikovo, "Railroad", false, nil , PathBlocked)
		local openRailString = ""
		if bIsOpenRail then
			openRailString = "[COLOR_POSITIVE_TEXT]Connected[ENDCOLOR]"
		else
			openRailString = "[COLOR_NEGATIVE_TEXT]Interrupted[ENDCOLOR]"
		end
	
		strText = strText .. "[NEWLINE][ICON_BULLET] Railway from Morozovsk to Kotelnikovo : " .. openRailString

				
		-- Road open
		local plotMorozovsk = GetPlot(1,13)		
		local plotStalingrad = GetPlot(34,24)
		local bIsOpenRoad = isPlotConnected( player , plotMorozovsk, plotStalingrad, "Road", false, nil , PathBlocked)
		local openRoadString = ""
		if bIsOpenRoad then
			openRoadString = "[COLOR_POSITIVE_TEXT]Connected[ENDCOLOR]"
		else
			openRoadString = "[COLOR_NEGATIVE_TEXT]Interrupted[ENDCOLOR]"
		end
	
		strText = strText .. "[NEWLINE][ICON_BULLET] Road from Morozovsk to Stalingrad : " .. openRoadString
	end
	
	tipControlTable.TooltipLabel:SetText( strText );
	tipControlTable.TopPanelMouseover:SetHide(false);
    
    -- Autosize tooltip
    tipControlTable.TopPanelMouseover:DoAutoSize();
	
end

function UpdateStalingradScoreString()
	local scoreString = "[ICON_MEDAL] Score = "
	local score = GetStalingradScore()
	if score > 0 then
		scoreString = scoreString .. "[COLOR_POSITIVE_TEXT]+".. tostring(score) .. "[ENDCOLOR]"
	elseif score < 0 then
		scoreString = scoreString .. "[COLOR_NEGATIVE_TEXT]".. tostring(score) .. "[ENDCOLOR]"
	else
		scoreString = scoreString .. tostring(score)
	end
	local turnsLeft =  STALINGRAD_END_TURN - Game.GetGameTurn()
	if turnsLeft == 0 then
		scoreString = scoreString .. " (last turn !)"
	elseif turnsLeft < 0 then
		scoreString = scoreString .. " (extra time...)"
	else
		scoreString = scoreString .. " (".. tostring(turnsLeft) .." turn(s) left)"
	end

	ContextPtr:LookUpControl("/InGame/TopPanel/ResourceString"):SetText( scoreString )
	ContextPtr:LookUpControl("/InGame/TopPanel/ResourceString"):SetHide( false )
end


--------------------------------------------------------------
-- Gold rate functions
--------------------------------------------------------------

function NewCalculateGoldRate(self)
	local goldRate = self:OldCalculateGoldRate()
	local change = 0
	change = change + GetScenarioGPT(self)
	change = change + self:GetImprovementGoldMaintenance() - self:GetCityConnectionGold()
	return goldRate + change
end

function NewCalculateGoldRateTimes100(self)
	local goldRate = self:OldCalculateGoldRateTimes100()
	local change = 0
	change = change + GetScenarioGPT(self)
	change = change + (self:GetImprovementGoldMaintenance()*100) - self:GetCityConnectionGoldTimes100()
	return goldRate + change
end

function InitializePlayerFunctions()

	local bDebug = true
	Dprint ("------------------ ", bDebug)
	Dprint ("Updating player metatable... ", bDebug)

	-- update player functions...
	local p = getmetatable(Players[0]).__index
	-- save old functions
	if not p.OldCalculateGoldRate then
		p.OldCalculateGoldRate = p.CalculateGoldRate
		p.OldCalculateGoldRateTimes100 = p.CalculateGoldRateTimes100
	end
	-- set replacement
	p.CalculateGoldRate = NewCalculateGoldRate
	p.CalculateGoldRateTimes100 = NewCalculateGoldRateTimes100

	Events.SerialEventGameDataDirty()
end

function GetScenarioGPT(player)
	local bDebug = false
	local gpt = Round(SCENARIO_BASE_GOLD_PER_TURN / ((GetHandicapForRED(player) + 2 ) /2)) 
	Dprint ("GetScenarioGPT() return for " .. player:GetName() .. " is ".. gpt, bDebug)
	return gpt
end

function UpdateGold(previousPlayerID)
	local bDebug = true
	local playerID = GetNextMajorPlayerID(previousPlayerID) -- need to be edited before, else the game could think we're in debt when we are not...
	local player = Players[playerID]
	if player == nil then
		return
	end
	Dprint ("------------------ ", bDebug)
	Dprint ("Update gold of " .. player:GetName(), bDebug)
	local change = 0
	Dprint ("Base change = " .. change, bDebug)
	change = change + GetScenarioGPT(player)
	Dprint ("After scenarioGPT, change = " .. change, bDebug)
	change = change + player:GetImprovementGoldMaintenance() -- Remove improvement maintenance
	Dprint ("After re-adding GetImprovementGoldMaintenance(), change = " .. change, bDebug)
	change = change - player:GetCityConnectionGold() -- Remove route incomes
	Dprint ("After removing GetCityConnectionGold(), return change = " .. change, bDebug)
	Dprint ("------------------ ", bDebug)
	player:ChangeGold(change)
end
-- GameEvents.PlayerDoTurn.Add(UpdateGold) at game init

--------------------------------------------------------------
-- Stalingrad function functions
--------------------------------------------------------------

function SetStalingradPromotion( playerID, unitID)
	local bDebug = true

	local player = Players[playerID]
	if player == nil then
		return
	end

	local unit = player:GetUnitByID( unitID )
	
	if unit == nil or unit:IsDead() then
		return
	end

	if (GetCivIDFromPlayerID (playerID) == USSR and unit:GetDomainType() == DomainTypes.DOMAIN_LAND) then
		if (not unit:IsHasPromotion(PROMOTION_WINTER_READY)) then
			Dprint("   - Adding Winter Ready promotion to " .. unit:GetName() .. " (unitID =".. unit:GetID(), bDebug)
			unit:SetHasPromotion(PROMOTION_WINTER_READY, true)
		end
	end
end
--Events.SerialEventUnitCreated.Add( SetStalingradPromotion ) at game init

function GetStalingradOwner()
	local Stalingrad = GetPlot(34,24):GetPlotCity()
	return Stalingrad:GetOwner()
end

function CheckAIObjective(previousPlayerID)
	local bDebug = true
	local playerID = GetNextMajorPlayerID(previousPlayerID)
	local player = Players[playerID]
	if player == nil then
		return
	end
	if (GetCivIDFromPlayerID (playerID) == GERMANY) and GetStalingradOwner() ~= playerID then
		for unit in player:Units() do
			if (unit:GetDomainType() == DomainTypes.DOMAIN_LAND) and string.find(unit:GetName(), "6.Ar") then
				unit:SetDeployFromOperationTurn(1)
			end
		end
		player:AddTemporaryDominanceZone (34, 24)
	end
end
-- GameEvents.PlayerDoTurn.Add(CheckAIObjective) at game init

function UpdateStalingradScore()
	Dprint("-------------------------------------")
	Dprint("Updating Stalingrad Score...")
	local plot = GetPlot(34,24)
	local stalingrad = plot:GetPlotCity()
	local score = LoadData("ScoreStalingrad", {[USSR] = 0, [GERMANY] = 0})
	local scorer = GetCivIDFromPlayerID (stalingrad:GetOwner())
	score[scorer] = score[scorer] + 1
	SaveData("ScoreStalingrad", score)
end

function GetStalingradScore()
	local score = LoadData("ScoreStalingrad", {[USSR] = 0, [GERMANY] = 0})
	local diff = 0
	if GetCivIDFromPlayerID (Game:GetActivePlayer()) == USSR then
		diff = score[USSR] - score[GERMANY]
	else
		diff = score[GERMANY] - score[USSR]
	end
	return diff
end

function CheckStalingradVictory()
	if Game.GetGameTurn() > STALINGRAD_END_TURN then
		Dprint("-------------------------------------")
		Dprint("Timer is out, look for a winner...")
		local score = LoadData("ScoreStalingrad")
		local scoreBonus = 0
		local stalingradOwner = GetStalingradOwner()
		local winner = nil
		if (score[USSR] > score[GERMANY]) and GetCivIDFromPlayerID (stalingradOwner) == USSR then
			Dprint("Winner is USSR !")
			winner = USSR
			scoreBonus = (score[USSR] - score[GERMANY])*5
		elseif (score[GERMANY] > score[USSR]) and GetCivIDFromPlayerID (stalingradOwner) == GERMANY then
			Dprint("Winner is GERMANY !")
			winner = GERMANY
			scoreBonus = (score[GERMANY] - score[USSR])*5
		end
		if not winner then 		
			Dprint("No winner yet, entering Extra time...")
			return -- still a draw, wait one more turn...
		end

		-- We have a winner !
		
		local PlayerID = GetPlayerIDFromCivID (winner, false)
		local player = Players[PlayerID]
		local handicap = GetHandicapForRED(player)
		local handicapFactor = (handicap + 2 ) /2

		scoreBonus = Round(scoreBonus * handicapFactor)
		Dprint("Bonus from Stalingrad control is " .. scoreBonus)

		local savedData = Modding.OpenSaveData()
		savedData.SetValue("VictoryType", "default")

		-- Set score
		Game.SetEstimateEndTurn(STALINGRAD_END_TURN)		
		player:ChangeScoreFromFutureTech(-500) -- relativize high score...
		player:ChangeScoreFromFutureTech(scoreBonus)

		local victoryString = ""

		-- Check for Active winner...
		if GetCivIDFromPlayerID (Game:GetActivePlayer()) == winner then
			Dprint("Active player is the Winner !")

			if winner == GERMANY then -- Winner is Germany

				-- primary objective
				victoryString = victoryString .. "After months of hard fighting, your troops have finally won the Battle of Stalingrad !"
				victoryString = victoryString .. "[NEWLINE]For controlling the city during ".. tostring(score[GERMANY]) .." turn(s), you get a score bonus of [COLOR_POSITIVE_TEXT]" ..  tostring(scoreBonus) .."[ENDCOLOR] points.[NEWLINE][NEWLINE]"

				-- check secondary objectives
				local operationalScore = 0
				local operationalStr = ""

				-- 6th Army
				local sixthArmyOperationalPercent = Get6thArmyStrength() / Get6thArmyInitialStrength() * 100
				local minimalStrength = SIXTH_ARMY_MINIMUM_STRENGTH_PERCENT + (handicap * 5)
				local sixthArmyScore =  (sixthArmyOperationalPercent - minimalStrength) * 5

				if sixthArmyOperationalPercent >= minimalStrength then
					sixthArmyScore = Round(sixthArmyScore * handicapFactor)
					operationalStr = operationalStr .. "On top of that your 6th Army is [COLOR_POSITIVE_TEXT]".. tostring(Round(sixthArmyOperationalPercent*100)/100) .. "%[ENDCOLOR] operational "
					operationalStr = operationalStr .. "(".. tostring(minimalStrength) .. "% requested), allowing the offensive to continue in this sector.[NEWLINE][NEWLINE]"
				else
					sixthArmyScore = Round(sixthArmyScore * handicapFactor)
					operationalStr = operationalStr .. "But your 6th Army is only [COLOR_NEGATIVE_TEXT]".. tostring(Round(sixthArmyOperationalPercent)*100/100) .. "%[ENDCOLOR] operational "
					operationalStr = operationalStr .. "(".. tostring(minimalStrength) .. "% requested), which will slow down the planned offensive in this sector.[NEWLINE][NEWLINE]"
				end
				operationalScore = operationalScore + sixthArmyScore
				Dprint("6th Army score is " .. sixthArmyScore)

				-- Railway open
				local plotMorozovsk = GetPlot(1,13)		
				local plotKotelnikovo = GetPlot(12,1)
				local bIsOpenRail = isPlotConnected( player , plotMorozovsk, plotKotelnikovo, "Railroad", false, nil , PathBlocked)
				local railScore =  100
				if bIsOpenRail then
					railScore = Round(railScore * handicapFactor / 2)
					operationalStr = operationalStr .. "Morozovsk is still [COLOR_POSITIVE_TEXT]connected[ENDCOLOR] by railway to Kotelnikovo, you know how important for Germany are the resources in the south and a fast way to transport them back to the Reich is vital for the war effort.[NEWLINE][NEWLINE]"
				else
					railScore = Round(- railScore * handicapFactor / 2)
					operationalStr = operationalStr .. "Morozovsk to Kotelnikovo railway connection is [COLOR_NEGATIVE_TEXT]interrupted[ENDCOLOR], the Wehrmacht will have to re-open it as soon as possible, a fast way to transport the resources in the south back to the Reich is vital for the war effort.[NEWLINE][NEWLINE]"
				end
	
				operationalScore = operationalScore + railScore
				Dprint("Rail score is " .. railScore)

				-- road open
				local plotMorozovsk = GetPlot(1,13)		
				local plotStalingrad = GetPlot(34,24)
				local bIsOpenRoad = isPlotConnected( player , plotMorozovsk, plotStalingrad, "Road", false, nil , PathBlocked)
				local roadScore =  75
				if bIsOpenRoad then
					roadScore = Round(roadScore * handicapFactor / 2)
					operationalStr = operationalStr .. "Thanks to the [COLOR_POSITIVE_TEXT]open[ENDCOLOR] road from Morozovsk, your supply trucks can travel to Stalingrad, a great news for the troops garrisoned here.[NEWLINE][NEWLINE]"
				else
					roadScore = Round(- roadScore * handicapFactor / 2)
					operationalStr = operationalStr .. "The road from Morozovsk to Stalingrad is [COLOR_NEGATIVE_TEXT]closed[ENDCOLOR], only limited supplies will reach the troops garrisoned here.[NEWLINE][NEWLINE]"
				end
	
				operationalScore = operationalScore + roadScore
				Dprint("Road score is " .. roadScore)

				player:ChangeScoreFromFutureTech( operationalScore)
				if operationalScore >= 0 then
					operationalStr = operationalStr .. "From all your secondary objectives, you get an operational score bonus of [COLOR_POSITIVE_TEXT]" ..  tostring(operationalScore) .."[ENDCOLOR] points."
				else
					operationalStr = operationalStr .. "From your secondary objectives, you get an operational score malus of [COLOR_NEGATIVE_TEXT]" ..  tostring(operationalScore) .."[ENDCOLOR] points."				
				end
				victoryString = victoryString .. operationalStr

				-- Final Score
				local info = GameInfo.HandicapInfos[ player:GetHandicapType() ]
				victoryString = victoryString .. "[NEWLINE]Your final score is: [COLOR_POSITIVE_TEXT]" .. tostring(player:GetScore()) .."[ENDCOLOR] points, playing at [COLOR_POSITIVE_TEXT]" .. Locale.ConvertTextKey( info.Description ) .. "[ENDCOLOR] level"

				-- Set victory text...
				Dprint(victoryString)
				SetText ( victoryString, "TXT_KEY_VICTORY_FLAVOR_DOMINATION" )
				SetText ( victoryString, "TXT_KEY_VICTORY_FLAVOR_TIME")

			else -- Winner is URSS

				-- primary objective
				victoryString = victoryString ..  "After months of hard fighting, your troops have finally won the Battle of Stalingrad !"
				victoryString = victoryString .. "[NEWLINE]For controlling the city during ".. tostring(score[USSR]) .." turn(s), you get a score bonus of [COLOR_POSITIVE_TEXT]" ..  tostring(scoreBonus) .."[ENDCOLOR] points.[NEWLINE][NEWLINE]"

				-- check secondary objectives
				local operationalScore = 0
				local operationalStr = ""

				-- 6th Army
				local sixthArmyOperationalPercent = Get6thArmyStrength() / Get6thArmyInitialStrength() * 100
				local minimalStrength = SIXTH_ARMY_MINIMUM_STRENGTH_PERCENT - (handicap * 5)
				local sixthArmyScore =  (minimalStrength - sixthArmyOperationalPercent) * 5

				if sixthArmyOperationalPercent < minimalStrength then
					sixthArmyScore = Round((sixthArmyScore + 50) * handicapFactor / 2)
					operationalStr = operationalStr .. "On top of that you've reduced German 6th Army strength to [COLOR_POSITIVE_TEXT]".. tostring(Round(sixthArmyOperationalPercent*100)/100) .. "%[ENDCOLOR] operational "
					operationalStr = operationalStr .. "(".. tostring(minimalStrength) .. "% requested), a terrible loss for our enemy.[NEWLINE][NEWLINE]"
				else
					sixthArmyScore = Round((sixthArmyScore - 50) * handicapFactor / 2)
					operationalStr = operationalStr .. "But the German 6th Army is still [COLOR_NEGATIVE_TEXT]".. tostring(Round(sixthArmyOperationalPercent)*100/100) .. "%[ENDCOLOR] operational "
					operationalStr = operationalStr .. "(".. tostring(minimalStrength) .. "% requested), will have to take care of the remaining soldiers before starting the planned counter-offensive.[NEWLINE][NEWLINE]"
				end
				operationalScore = operationalScore + sixthArmyScore
				Dprint("6th Army score is " .. sixthArmyScore)

				
				-- Road open
				local plotSerafimovitch = GetPlot(5,33)
				local plotVerkhnyaya = GetPlot(11,24)
				local plotKalach = GetPlot(15,19)
				local plotKarpovka = GetPlot(24,19)
				local plotViazovka = GetPlot(46,12)

				local bIsOpenRoad = true
				local routeLength = 0

				local bIsOpenRoad = bIsOpenRoad and isPlotConnected( player , plotSerafimovitch, plotVerkhnyaya, "Road", false, nil , PathBlocked)
				routeLength = routeLength + getRouteLength()
		
				local bIsOpenRoad = bIsOpenRoad and isPlotConnected( player , plotVerkhnyaya, plotKalach, "Road", false, nil , PathBlocked)
				routeLength = routeLength + getRouteLength()
		
				local bIsOpenRoad = bIsOpenRoad and isPlotConnected( player , plotKalach, plotKarpovka, "Road", false, nil , PathBlocked)
				routeLength = routeLength + getRouteLength()
		
				local bIsOpenRoad = bIsOpenRoad and isPlotConnected( player , plotKarpovka, plotViazovka, "Road", false, nil , PathBlocked)
				routeLength = routeLength + getRouteLength()

				local openRoadString = ""				

				local roadScore =  85

				if bIsOpenRoad and routeLength < 65  then
					roadScore = Round(roadScore * handicapFactor / 2)
					operationalStr = operationalStr .. "You've also managed to [COLOR_POSITIVE_TEXT]close the pincer[ENDCOLOR] at Kalach, no enemy will escape from Stalingrad, resistance in the area will be quickly terminated.[NEWLINE][NEWLINE]"
				else
					roadScore = Round(- roadScore * handicapFactor / 2)
					operationalStr = operationalStr .. "You've failed to perfectly [COLOR_NEGATIVE_TEXT]close the pincer[ENDCOLOR] at Kalach, supplies and reinforcement may reach the remaining enemy troops in the area, something we'll have to deal with.[NEWLINE][NEWLINE]"
				end
	
				operationalScore = operationalScore + roadScore
				Dprint("Road score is " .. roadScore)

				player:ChangeScoreFromFutureTech( operationalScore)
				if operationalScore >= 0 then
					operationalStr = operationalStr .. "From all your secondary objectives, you get an operational score bonus of [COLOR_POSITIVE_TEXT]" ..  tostring(operationalScore) .."[ENDCOLOR] points."
				else
					operationalStr = operationalStr .. "From your secondary objectives, you get an operational score malus of [COLOR_NEGATIVE_TEXT]" ..  tostring(operationalScore) .."[ENDCOLOR] points."				
				end
				victoryString = victoryString .. operationalStr

				-- Final Score
				local info = GameInfo.HandicapInfos[ player:GetHandicapType() ]
				victoryString = victoryString .. "[NEWLINE]Your final score is: [COLOR_POSITIVE_TEXT]" .. tostring(player:GetScore()) .."[ENDCOLOR] points, playing at [COLOR_POSITIVE_TEXT]" .. Locale.ConvertTextKey( info.Description ) .. "[ENDCOLOR] level"

				-- Set victory text...
				Dprint(victoryString)
				SetText ( victoryString, "TXT_KEY_VICTORY_FLAVOR_DOMINATION" )
				SetText ( victoryString, "TXT_KEY_VICTORY_FLAVOR_TIME")
			end
		end

		if g_Victory then
			victoryType = g_Victory[winner]
			Dprint("Victory Type : " .. victoryType)
			local savedData = Modding.OpenSaveData()
			savedData.SetValue("VictoryType", victoryType)
			savedData.SetValue("VictoryString", victoryString)
			Game.SetWinner(player:GetTeam(), GameInfo.Victories[victoryType].ID)
			--ContextPtr:LookUpControl("/InGame/EndGameMenu/EndGameText"):SetText(victoryString)
		else				
			Game.SetWinner(player:GetTeam(), GameInfo.Victories["VICTORY_DOMINATION"].ID)
		end
	end
end


--------------------------------------------------------------
-- R.E.D. Functions override for Stalingrad Scenario...
-- We need specific cheks here...
--------------------------------------------------------------

function CreateTerritoryMap()
	Dprint("-------------------------------------")
	Dprint("Creating Territory Map...")
	--local territoryMap = LoadTerritoryMap()

	for iPlotLoop = 0, Map.GetNumPlots()-1, 1 do
		local plot = Map.GetPlotByIndex(iPlotLoop)
		local x = plot:GetX()
		local y = plot:GetY()
		if ( plot:IsWater() ) then
			plot:SetOwner(-1, -1)
		else
			local owner = plot:GetOwner()
			if (owner ~= -1) then
				-- Spies everywhere : always reveal cities plot (allow long range bombing)
				if plot:IsCity() and REVEAL_ALL_CITIES then
					for iTeamLoop = 0, GameDefines.MAX_CIV_TEAMS - 1, 1 do
						if (plot:GetVisibilityCount(iTeamLoop) > 0) then
						  plot:ChangeVisibilityCount(iTeamLoop, -1, -1, true)
						end

						plot:SetRevealed(iTeamLoop, false)

						plot:ChangeVisibilityCount(iTeamLoop, 1, -1, true)
						plot:SetRevealed(iTeamLoop, true)
					end
				end
				--[[
				local player = Players [owner]
				local civID = GetCivIDFromPlayerID( owner, true )
				local type
				if (player:IsMinorCiv()) then
					type = GameInfo.MinorCivilizations[civID].Type
				else
					type = GameInfo.Civilizations[civID].Type
				end
				if not type then
					Dprint("WARNING, can't find type for playerID = " .. owner ..", civID = " .. civID)
				end
				-- all tiles belong to capital city ? or initialize to close city ? leave original value from WB map ?
				--local capitalCity = player:GetCapitalCity()
				--local closeCity = GetCloseCity ( owner, plot )
				--plot:SetOwner(owner, closeCity:GetID() )
				territoryMap[GetPlotKey ( plot )] = { PlayerID = owner, CivID = civID, Type = type }
				--]]
			else
				-- WB map is crashing trying to place dummy civ for hotseat if all culture is already filled, so fill it now it has been placed during initialization...
				local iGermany = GetPlayerIDFromCivID (GERMANY, false, true)
				plot:SetOwner(iGermany)
			end
		end
	end
	SaveTerritoryMap( territoryMap )
end


-- function HandleCityCapture (hexPos, playerID, cityID, newPlayerID)
function HandleCityCapture (playerID, bCapital, iX, iY, newPlayerID)

	g_FixedPlots = {} -- reset list of fixed plots

	local bDebugOutput = true
	local cityPlot = Map.GetPlot(iX, iY)
	local cityPlotKey = GetPlotKey(cityPlot)
	local city = cityPlot:GetPlotCity()
	Dprint ("Handle capture of ".. tostring(city:GetName()) .." at (" .. cityPlotKey.. ")", bDebugOutput)
	city:SetPuppet(false) -- prevent AI puppeting cities it could use...
	city:ChangeResistanceTurns(-city:GetResistanceTurns()) -- no resistance
	city:SetOccupied(false) -- not occupied

	-- Remove or Restore buildings in key cities
	for i, cityData in pairs(g_Cities) do
		if cityData.Buildings then
			local plot = GetPlot(cityData.X, cityData.Y)
			if plot == cityPlot then
				if city:GetNumBuildings() > 0 then -- other side has captured a city with buildings, remove them...
					for j, building in ipairs (cityData.Buildings) do
						Dprint ("   - Remove building type =  "..building, bDebug)
						if  building ~= OPEN_CITY then
							city:SetNumRealBuilding(building, 0)
						else
							city:SetNumRealBuilding(building, 1) -- Open cities stay open..
						end
					end
				else
					for j, building in ipairs (cityData.Buildings) do
						Dprint ("   - Restore building type =  "..building, bDebug)
						city:SetNumRealBuilding(building, 1)
					end
				end
			end
		end
	end
	Dprint ("-------------------------------------", bDebugOutput)
end

function CheckEmbarkedPromotion(unit)
	local bDebug = true
	local player = Players[unit:GetOwner()]
	local unitType = unit:GetUnitType()
	
	if unit:IsEmbarked() then
		return
	end

	local bCanEmbark = (GetPlot(41,24):GetArea() == unit:GetPlot():GetArea()) -- unit is in Leninsk side of the Volga

	if not bCanEmbark then
		if (unit:IsHasPromotion(PROMOTION_EMBARKATION)) then
			Dprint("   - Removing embarkation promotion from " .. unit:GetName() .. " (unitID =".. unit:GetID(), bDebug)
			unit:SetHasPromotion(PROMOTION_EMBARKATION, false)
		end
	elseif (not unit:IsHasPromotion(PROMOTION_EMBARKATION)) and not ( GameInfo.Units[unitType].Domain == "DOMAIN_SEA" or GameInfo.Units[unitType].Domain == "DOMAIN_AIR" ) then
		Dprint("   - Adding embarkation promotion to " .. unit:GetName() .. " (unitID =".. unit:GetID(), bDebug)
		unit:SetHasPromotion(PROMOTION_EMBARKATION, true)
	end
end

--[[
function CheckCultureChange(iHexX, iHexY, iPlayerID, bUnknown)
	local bDebug = true
	if (iPlayerID ~= -1) then
		local x, y = ToGridFromHex( iHexX, iHexY )
		local plot = GetPlot(x,y)
		Dprint("-------------------------------------", bDebug)
		Dprint("Culture changed at ("..x..","..y.."), testing...", bDebug)
		if ( plot:IsWater() ) then
			Dprint("-------------------------------------", bDebug)
			Dprint("Culture was set on water plot ("..x..","..y.."), removing it ...", bDebug)
			plot:SetOwner(-1, -1)
		end
		plotKey = GetPlotKey(plot)
		if g_FixedPlots[plotKey] or (not g_StalingradInit) or plot:IsCity() then
			return
		end
		-- NO_TILE_FLIPPING_ON_CITY_CAPTURE
		local iUSSR = GetPlayerIDFromCivID (USSR, false)
		local iGermany = GetPlayerIDFromCivID (GERMANY, false)

		Dprint("-------------------------------------")
		Dprint("Plot ("..x..","..y.."), was flipped by city capture, give it back to the other side...", bDebug)

		if iPlayerID == iUSSR then
			g_FixedPlots[plotKey] = true
			plot:SetOwner(iGermany)
		else
			g_FixedPlots[plotKey] = true
			plot:SetOwner(iUSSR)
		end
	end
end
--]]

function Set6thArmyInitialStrength()
	local savedData = Modding.OpenSaveData()
	local sixthArmyValue = Get6thArmyStrength()
	savedData.SetValue("6thArmyInitialStrength", sixthArmyValue)
end

function Get6thArmyInitialStrength()
	local savedData = Modding.OpenSaveData()
	local sixthArmyValue = savedData.GetValue("6thArmyInitialStrength") or SIXTH_ARMY_INITIAL_STRENGTH
	return sixthArmyValue
end

function Get6thArmyStrength()

	local iGermany = GetPlayerIDFromCivID (GERMANY, false, true)
	local player = Players[iGermany]

	local sixthArmyValue = 0
	for unit in player:Units() do
		if string.find(unit:GetName(), "6.Ar") then
			sixthArmyValue = sixthArmyValue + unit:GetCurrHitPoints()
		end
	end
	return sixthArmyValue
end