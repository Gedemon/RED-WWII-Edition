-------------------------------
-- TopPanel.lua
-------------------------------

-------------------------------------------------------------------------------------------------------
-- R.E.D. WW II edition
-------------------------------------------------------------------------------------------------------
include ("RedOverrideInclude")

local reinforcementDisplayFormat = modUserData.GetValue("ReinforcementDisplayFormat") or 1
local bOnlySupplied = (reinforcementDisplayFormat == 1)

function ToggleReinforcementDisplayFormat()
	local reinforcementDisplayFormat = modUserData.GetValue("ReinforcementDisplayFormat") or 1
	if (reinforcementDisplayFormat == 0) then
		reinforcementDisplayFormat = 1
	else
		reinforcementDisplayFormat = 0
	end
	modUserData.SetValue("ReinforcementDisplayFormat", reinforcementDisplayFormat)
	bOnlySupplied = (reinforcementDisplayFormat == 1)

	UpdateData()

	Controls.MaterielPerTurn:SetToolTipString(GetMaterielTTString())
	Controls.PersonnelPerTurn:SetToolTipString(GetPersonnelTTString())
end

Controls.PersonnelPerTurn:RegisterCallback( Mouse.eLClick, ToggleReinforcementDisplayFormat )
Controls.MaterielPerTurn:RegisterCallback( Mouse.eLClick, ToggleReinforcementDisplayFormat )

-------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------------------------
-- Clock from AgentofEvil
-------------------------------------------------------------------------------------------------------
TimeFormats = {}
TimeFormats[12] = "%I:%M";
TimeFormats[24] = "%H:%M";

local CurrentTimeFormatIndex = modUserData.GetValue("TimeFormat") or 12;			

ContextPtr:SetUpdate(function ()
	local computersystime = os.date(TimeFormats[CurrentTimeFormatIndex]);
	Controls.TopPanelClock:SetText(computersystime);
end);

function ToggleTimeFormat()
	CurrentTimeFormatIndex = ((CurrentTimeFormatIndex + 11) % 24) + 1;
	modUserData.SetValue("TimeFormat", CurrentTimeFormatIndex)
end;

Controls.TopPanelClock:RegisterCallback( Mouse.eLClick, ToggleTimeFormat );
-------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------

function UpdateData()

	local iPlayerID = Game.GetActivePlayer();

	if( iPlayerID >= 0 ) then
		local pPlayer = Players[iPlayerID];
		local pTeam = Teams[pPlayer:GetTeam()];
		local pCity = UI.GetHeadSelectedCity();
		
		if (pPlayer:GetNumCities() > 0) then
			
			Controls.TopPanelInfoStack:SetHide(false);
			
			if (pCity ~= nil and UI.IsCityScreenUp()) then		
				Controls.MenuButton:SetText(Locale.ToUpper(Locale.ConvertTextKey("TXT_KEY_RETURN")));
				Controls.MenuButton:SetToolTipString(Locale.ConvertTextKey("TXT_KEY_CITY_SCREEN_EXIT_TOOLTIP"));
			else
				Controls.MenuButton:SetText(Locale.ToUpper(Locale.ConvertTextKey("TXT_KEY_MENU")));
				Controls.MenuButton:SetToolTipString(Locale.ConvertTextKey("TXT_KEY_MENU_TOOLTIP"));
			end
			-----------------------------
			-- Update personnel stats
			-----------------------------
			local strPersonnelText = ""
			local strMaterielText = ""

			local reinforcementData = MapModData.RED.ReinforcementData
			local iPlayerID = Game.GetActivePlayer()
			local pPlayer = Players[iPlayerID]
			local data
			if reinforcementData then
				data = reinforcementData[iPlayerID]
			end
			if data then
				local strFluxPersonnel, strFluxMateriel = "", ""
				--local matToUpgrade = data.MatToUpgrade or 0

				local personnelReinforcement	= GetPersonnelReinforcement(iPlayerID) 
				local materielReinforcement		= GetMaterielReinforcement(iPlayerID) 
				local neededReinforcement		= GetNeededReinforcementForUnits(iPlayerID, bOnlySupplied)

				local fluxPersonnel = Round(personnelReinforcement.total - neededReinforcement.nextTurnPers)
				local fluxMateriel = Round(materielReinforcement.total - neededReinforcement.nextTurnMat) -- - matToUpgrade -- check that...

				if fluxPersonnel >= 0 then
					strFluxPersonnel = "("..Locale.ConvertTextKey("TXT_KEY_NUMBER_PERTURN_TEXT", fluxPersonnel)..")" -- Locale.ConvertTextKey("TXT_KEY_NUMBER_PERTURN_TEXT", fluxMateriel)
				else
					strFluxPersonnel = "("..Locale.ConvertTextKey("TXT_KEY_NUMBER_PERTURN_TEXT_NEGATIVE", fluxPersonnel)..")"
				end
				if fluxMateriel >= 0 then
					strFluxMateriel = "("..Locale.ConvertTextKey("TXT_KEY_NUMBER_PERTURN_TEXT", fluxMateriel)..")"
				else
					strFluxMateriel = "("..Locale.ConvertTextKey("TXT_KEY_NUMBER_PERTURN_TEXT_NEGATIVE", fluxMateriel)..")"
				end
				-- reinforcementData[civID] = { Personnel = fluxPersonnel, Materiel = fluxMateriel, MaxPersonnel = maxPersonnel, MaxMateriel = maxMateriel, FluxPersonnel = fluxPersonnel, FluxMateriel = fluxMateriel}
				strPersonnelText	= "[ICON_PERSONNEL] "..data.Personnel.." ".. strFluxPersonnel
				strMaterielText		= "[ICON_MATERIEL] "..data.Materiel.." ".. strFluxMateriel
			else
				strPersonnelText	= "[ICON_PERSONNEL] 0 (+0)"
				strMaterielText		= "[ICON_MATERIEL] 0 (+0)"
			end
			
			Controls.PersonnelPerTurn:SetText(strPersonnelText);			
			Controls.MaterielPerTurn:SetText(strMaterielText);
			
			-----------------------------
			-- Update gold stats
			-----------------------------
			local iTotalGold = pPlayer:GetGold();
			local iGoldPerTurn = pPlayer:CalculateGoldRate();
			
			-- Accounting for positive or negative GPT - there's obviously a better way to do this.  If you see this comment and know how, it's up to you ;)
			-- Text is White when you can buy a Plot
			--if (iTotalGold >= pPlayer:GetBuyPlotCost(-1,-1)) then
				--if (iGoldPerTurn >= 0) then
					--strGoldStr = string.format("[COLOR:255:255:255:255]%i (+%i)[/COLOR]", iTotalGold, iGoldPerTurn)
				--else
					--strGoldStr = string.format("[COLOR:255:255:255:255]%i (%i)[/COLOR]", iTotalGold, iGoldPerTurn)
				--end
			---- Text is Yellow or Red when you can't buy a Plot
			--else
			local strGoldStr = Locale.ConvertTextKey("TXT_KEY_TOP_PANEL_GOLD", iTotalGold, iGoldPerTurn);
			--end
			
			Controls.GoldPerTurn:SetText(strGoldStr);
			
			-----------------------------
			-- Update Resources
			-----------------------------
			local pResource;
			local bShowResource;
			local iNumAvailable;
			local iNumUsed;
			local iNumTotal;
			
			local strResourceText = "";
			local strTempText = "";		

			
			Controls.ResourceString:SetText(strResourceText);
			
		-- No Cities, so hide everything
		else
			
			Controls.TopPanelInfoStack:SetHide(true);
			
		end
		
		-- Update turn counter
		local turn = Locale.ConvertTextKey("TXT_KEY_TP_TURN_COUNTER", Game.GetGameTurn());
		Controls.CurrentTurn:SetText(turn);
		

		-- Update Unit Supply
		if SHOW_UNIT_SUPPLY then
			local iUnitSupplyMod = pPlayer:GetUnitProductionMaintenanceMod();
			local iUnitsSupplied = pPlayer:GetNumUnitsSupplied();
			local iUnitsTotal = pPlayer:GetNumUnits()
			local iUnitsFromCities = pPlayer:GetNumUnitsSuppliedByCities()
			local iUnitsFromPopulation = pPlayer:GetNumUnitsSuppliedByPopulation()
			local iUnitsFromHandicap = pPlayer:GetNumUnitsSuppliedByHandicap()

			if (iUnitSupplyMod ~= 0) then
				local iUnitsOver = pPlayer:GetNumUnitsOutOfSupply();
				local strUnitSupplyToolTip = Locale.ConvertTextKey("TXT_KEY_UNIT_SUPPLY_REACHED_TOOLTIP", iUnitsSupplied, iUnitsOver, iUnitSupplyMod, iUnitsFromCities, iUnitsFromPopulation, iUnitsFromHandicap);
				local strUnitSupply = "[ICON_STRENGTH] " .. Locale.ConvertTextKey("TXT_KEY_UNIT_SUPPLY_REACHED", iUnitSupplyMod);
			
				Controls.UnitSupplyString:SetToolTipString(strUnitSupplyToolTip);
				Controls.UnitSupplyString:SetText(strUnitSupply);
				Controls.UnitSupplyString:SetHide(false);
			else
				local iUnitsLeft = iUnitsSupplied - iUnitsTotal
				if iUnitsLeft <= SHOW_UNIT_SUPPLY_THRESHOLD then
					local strUnitSupplyToolTip = Locale.ConvertTextKey("TXT_KEY_UNIT_SUPPLY_TOOLTIP", iUnitsSupplied, iUnitsTotal, iUnitsFromCities, iUnitsFromPopulation, iUnitsFromHandicap);
					local strUnitSupply = "[ICON_STRENGTH] " .. Locale.ConvertTextKey("TXT_KEY_UNIT_SUPPLY", iUnitsLeft);
			
					Controls.UnitSupplyString:SetToolTipString(strUnitSupplyToolTip);
					Controls.UnitSupplyString:SetText(strUnitSupply);
					Controls.UnitSupplyString:SetHide(false);
				else
					Controls.UnitSupplyString:SetHide(true);
				end
			end
		else
			Controls.UnitSupplyString:SetHide(true);
		end
		

		-- R.E.D. WW II edition real date
		local realDate = g_Calendar[Game.GetGameTurn()].Text or "You should really end this war now !"
		Controls.CurrentDate:SetText(realDate)	

	end
end

function OnTopPanelDirty()
	UpdateData();
end

-------------------------------------------------
-------------------------------------------------
function OnCivilopedia()	
	-- In City View, return to main game
	--if (UI.GetHeadSelectedCity() ~= nil) then
		--Events.SerialEventExitCityScreen();
	--end
	--
	-- opens the Civilopedia without changing its current state
	Events.SearchForPediaEntry("");
end
Controls.CivilopediaButton:RegisterCallback( Mouse.eLClick, OnCivilopedia );


-------------------------------------------------
-------------------------------------------------
function OnMenu()
	
	-- In City View, return to main game
	if (UI.GetHeadSelectedCity() ~= nil) then
		Events.SerialEventExitCityScreen();
		--UI.SetInterfaceMode(InterfaceModeTypes.INTERFACEMODE_SELECTION);
	-- In Main View, open Menu Popup
	else
	    UIManager:QueuePopup( LookUpControl( "/InGame/GameMenu" ), PopupPriority.InGameMenu );
	end
end
Controls.MenuButton:RegisterCallback( Mouse.eLClick, OnMenu );


-------------------------------------------------
-- TOOLTIPS
-------------------------------------------------


-- Tooltip init
function DoInitTooltips()
	Controls.PersonnelPerTurn:SetToolTipCallback( PersonnelTipHandler );
	Controls.MaterielPerTurn:SetToolTipCallback( MaterielTipHandler );
	Controls.GoldPerTurn:SetToolTipCallback( GoldTipHandler );
	Controls.ResourceString:SetToolTipCallback( ResourcesTipHandler );
end

local tipControlTable = {};
TTManager:GetTypeControlTable( "TooltipTypeTopPanel", tipControlTable );

-- Personnel Tooltip
function PersonnelTipHandler( control )

	local strText = GetPersonnelTTString()
	
	tipControlTable.TooltipLabel:SetText( strText );
	tipControlTable.TopPanelMouseover:SetHide(false);
    
    -- Autosize tooltip
    tipControlTable.TopPanelMouseover:DoAutoSize();
	
end
function GetPersonnelTTString()

	local strText = ""
	
	local playerID = Game.GetActivePlayer()
	local player = Players[playerID]
	
	if bOnlySupplied then
		strText = strText .. "[ICON_PERSONNEL] for units with a supply line (click to toggle all units)"
	else
		strText = strText .. "[ICON_PERSONNEL] for all units (click to toggle supply lines only)"
	end
	strText = strText .. "[NEWLINE]----------------------------------------------------------------[NEWLINE]"

	strText = strText .. "[ICON_PERSONNEL] Personnel maximum reserve : " .. tostring(GetMaxPersonnel (playerID))
	strText = strText .. "[NEWLINE]----------------------------------------------------------------[NEWLINE][NEWLINE]"

	local reinforcementData = MapModData.RED.ReinforcementData
	local currentPersFromSupplyRoutes = 0 -- need to be passed to current turn string, but is from reinforcementData table, so initialize here...
	if reinforcementData and reinforcementData[playerID] then
	
		for k,v in pairs(reinforcementData[playerID]) do reinforcementData[playerID][k] = Round(v); end

		local totalPers = reinforcementData[playerID].ReceivedPers
		local persFromGlobal = reinforcementData[playerID].PersFromGlobal
		local persFromHospital = reinforcementData[playerID].PersFromHospital
		local persFromPropaganda = reinforcementData[playerID].PersFromPropaganda
		local persFromRecruiting = reinforcementData[playerID].PersFromRecruiting
		local persFromTrait = reinforcementData[playerID].PersFromTrait
		local persFromNeedYou = reinforcementData[playerID].PersFromNeedYou
		local persFromMinor = reinforcementData[playerID].PersFromMinor
		local persFromScenario = reinforcementData[playerID].PersFromScenario

		local persFromSupplyRoutes = reinforcementData[playerID].TotalPersFromSupplyRoute
		currentPersFromSupplyRoutes = reinforcementData[playerID].PersFromSupplyRoute

		local reinfPers = reinforcementData[playerID].FluxPersonnel - totalPers
		
		strText = strText .. "[ICON_PERSONNEL] Personnel received this turn : " .. totalPers
		strText = strText .. "[NEWLINE][ICON_BULLET] from nation (population growth) : "  .. persFromGlobal
		if persFromRecruiting	> 0 then strText = strText .. "[NEWLINE][ICON_BULLET] from military recruiting (barracks, academy) : "  .. persFromRecruiting; end
		if persFromPropaganda	> 0 then strText = strText .. "[NEWLINE][ICON_BULLET] from propaganda (radio) : "  .. persFromPropaganda; end
		if persFromHospital		> 0 then strText = strText .. "[NEWLINE][ICON_BULLET] from hospitals (healed) : "  .. persFromHospital; end
		if persFromNeedYou		> 0 then strText = strText .. "[NEWLINE][ICON_BULLET] from cities recruiting (we need you) : "  .. persFromNeedYou; end
		if persFromMinor		> 0 then strText = strText .. "[NEWLINE][ICON_BULLET] from other nations (Friends, Allies) : "  .. persFromMinor; end
		if persFromSupplyRoutes > 0 then strText = strText .. "[NEWLINE][ICON_BULLET] from supply routes (convoy, railsroad) : "  .. persFromSupplyRoutes; end
		if persFromScenario		> 0 then strText = strText .. "[NEWLINE][ICON_BULLET] from base production : "  .. persFromScenario; end
		if persFromTrait		> 0 then strText = strText .. "[NEWLINE][ICON_BULLET] from trait (Great Patriotic War) : "  .. persFromTrait; end
		
		strText = strText .. "[NEWLINE][NEWLINE][ICON_PERSONNEL] Personnel affected this turn : " .. reinfPers
		if reinfPers ~= 0 then strText = strText .. "[NEWLINE][ICON_BULLET] to reinforce troops : "  .. reinfPers; end

		local difference = totalPers + reinfPers -- reinfPers is a negative value !
		local strDifference = ""
		
		if difference >= 0 then
			strDifference = Locale.ConvertTextKey("TXT_KEY_NUMBER_PERTURN_TEXT", difference)
		else
			strDifference = Locale.ConvertTextKey("TXT_KEY_NUMBER_PERTURN_TEXT_NEGATIVE", difference)
		end

		strText = strText .. "[NEWLINE][NEWLINE][ICON_PERSONNEL] Personnel reserve variation : " .. strDifference		

		-- to do : add details for maximum capacities (MaxMateriel, MaxPersonnel)

	else
		strText = strText .. "Please wait for first turn to allow data initialization..."
	end

	
	local personnelReinforcement = GetPersonnelReinforcement (playerID) 
	if personnelReinforcement then

		for k,v in pairs(personnelReinforcement) do personnelReinforcement[k] = Round(v); end
		local totalPers = personnelReinforcement.total + currentPersFromSupplyRoutes
		
		strText = strText .. "[NEWLINE][NEWLINE]----------------------------------------------------------------[NEWLINE]"
		strText = strText .. "[NEWLINE][ICON_PERSONNEL] Personnel planned for next turn : " .. totalPers

		strText = strText .. "[NEWLINE][ICON_BULLET] from nation (population, food) : "  .. personnelReinforcement.fromGlobal
		if personnelReinforcement.fromRecruiting	> 0 then strText = strText .. "[NEWLINE][ICON_BULLET] from military recruiting (barracks, academy) : "  .. personnelReinforcement.fromRecruiting; end
		if personnelReinforcement.fromPropaganda	> 0 then strText = strText .. "[NEWLINE][ICON_BULLET] from propaganda (radio) : "  .. personnelReinforcement.fromPropaganda; end
		if personnelReinforcement.fromHospital		> 0 then strText = strText .. "[NEWLINE][ICON_BULLET] from hospitals (healed) : "  .. personnelReinforcement.fromHospital; end
		if personnelReinforcement.fromNeedYou		> 0 then strText = strText .. "[NEWLINE][ICON_BULLET] from cities recruiting (we need you) : "  .. personnelReinforcement.fromNeedYou; end
		if personnelReinforcement.fromMinor			> 0 then strText = strText .. "[NEWLINE][ICON_BULLET] from other nations (Friends, Allies) : "  .. personnelReinforcement.fromMinor; end
		if currentPersFromSupplyRoutes				> 0 then strText = strText .. "[NEWLINE][ICON_BULLET] from supply routes (convoy, railsroad) : "  .. currentPersFromSupplyRoutes; end
		if personnelReinforcement.fromScenario		> 0 then strText = strText .. "[NEWLINE][ICON_BULLET] from base production : "  .. personnelReinforcement.fromScenario; end
		if personnelReinforcement.fromTrait			> 0 then strText = strText .. "[NEWLINE][ICON_BULLET] from trait (Great Patriotic War) : "  .. personnelReinforcement.fromTrait; end
		
		local neededReinforcement = GetNeededReinforcementForUnits(playerID, bOnlySupplied)
		
		for k,v in pairs(neededReinforcement) do neededReinforcement[k] = Round(v); end

		local reinfPers = - neededReinforcement.nextTurnPers
		
		strText = strText .. "[NEWLINE][NEWLINE][ICON_PERSONNEL] Personnel requirement for next turn : " .. reinfPers
		if reinfPers ~= 0 then strText = strText .. "[NEWLINE][ICON_BULLET] to reinforce troops : "  .. reinfPers; end

		local difference = totalPers + reinfPers -- reinfPers is a negative value ! todo = change that.
		local strDifference = ""
		
		if difference >= 0 then
			strDifference = Locale.ConvertTextKey("TXT_KEY_NUMBER_PERTURN_TEXT", difference)
		else
			strDifference = Locale.ConvertTextKey("TXT_KEY_NUMBER_PERTURN_TEXT_NEGATIVE", difference)
		end

		strText = strText .. "[NEWLINE][NEWLINE][ICON_PERSONNEL] Personnel planned reserve variation : " .. strDifference	
		strText = strText .. "[NEWLINE][NEWLINE]----------------------------------------------------------------"
		strText = strText .. "[NEWLINE][ICON_PERSONNEL] Personnel total requirement : " .. neededReinforcement.totalPers

	else
		strText = strText .. "Please wait for first turn to allow data initialization..."
	end

	return strText
end

-- Materiel Tooltip
function MaterielTipHandler( control )

	local strText = GetMaterielTTString()
	
	tipControlTable.TooltipLabel:SetText( strText );
	tipControlTable.TopPanelMouseover:SetHide(false);
    
    -- Autosize tooltip
    tipControlTable.TopPanelMouseover:DoAutoSize();
	
end
function GetMaterielTTString()

	local strText = ""
	
	local playerID = Game.GetActivePlayer()
	local player = Players[playerID]
	
	
	if bOnlySupplied then
		strText = strText .. "[ICON_MATERIEL] for units with a supply line (click to toggle all units)"
	else
		strText = strText .. "[ICON_MATERIEL] for all units (click to toggle supply lines only)"
	end
	strText = strText .. "[NEWLINE]----------------------------------------------------------------[NEWLINE]"

	strText = strText .. "[ICON_MATERIEL] Materiel maximum stock : " .. tostring(GetMaxMateriel (playerID))
	strText = strText .. "[NEWLINE]----------------------------------------------------------------[NEWLINE][NEWLINE]"

	local reinforcementData = MapModData.RED.ReinforcementData 
	
	local currentMatFromSupplyRoutes = 0

	if reinforcementData and reinforcementData[playerID] then
	
		for k,v in pairs(reinforcementData[playerID]) do reinforcementData[playerID][k] = Round(v); end

		local totalMat = reinforcementData[playerID].ReceivedMat
		local matFromGlobal = reinforcementData[playerID].MatFromGlobal
		local matFromFactory = reinforcementData[playerID].MatFromFactory
		local matFromHarbor = reinforcementData[playerID].MatFromHarbor
		local matFromWarBonds = reinforcementData[playerID].MatFromWarBonds
		local matFromMinor = reinforcementData[playerID].MatFromMinor
		local matFromScenario = reinforcementData[playerID].MatFromScenario

		local matToUpgrade = reinforcementData[playerID].MatToUpgrade or 0

		local matFromSupplyRoutes = reinforcementData[playerID].TotalMatFromSupplyRoute
		currentMatFromSupplyRoutes = reinforcementData[playerID].MatFromSupplyRoute

		local reinfMat = reinforcementData[playerID].FluxMateriel - totalMat
		
		strText = strText .. "[ICON_MATERIEL] Materiel produced this turn : " .. totalMat
		strText = strText .. "[NEWLINE][ICON_BULLET] from nation (global production) : "  .. matFromGlobal
		if matFromFactory		> 0 then strText = strText .. "[NEWLINE][ICON_BULLET] from factories (local production bonus) : "  .. matFromFactory; end
		if matFromHarbor		> 0 then strText = strText .. "[NEWLINE][ICON_BULLET] from harbors (imports) : "  .. matFromHarbor; end
		if matFromWarBonds		> 0 then strText = strText .. "[NEWLINE][ICON_BULLET] from war bonds (materiel bought) : "  .. matFromWarBonds; end
		if matFromMinor			> 0 then strText = strText .. "[NEWLINE][ICON_BULLET] from other nations (Friends, Allies) : "  .. matFromMinor; end
		if matFromSupplyRoutes	> 0 then strText = strText .. "[NEWLINE][ICON_BULLET] from supply routes (convoy, railsroad) : "  .. matFromSupplyRoutes; end
		if matFromScenario		> 0 then strText = strText .. "[NEWLINE][ICON_BULLET] from base production : "  .. matFromScenario; end

		strText = strText .. "[NEWLINE][NEWLINE][ICON_MATERIEL] Materiel used this turn : " .. tostring(reinfMat - matToUpgrade)
		if reinfMat ~= 0 then strText = strText .. "[NEWLINE][ICON_BULLET] to reinforce troops : " .. reinfMat; end
		if matToUpgrade > 0 then strText = strText .. "[NEWLINE][ICON_BULLET] for units upgrading : " .. tostring(-matToUpgrade) end
		
		local difference = totalMat + reinfMat -- reinfMat is a negative value !
		local strDifference = ""
		
		if difference >= 0 then
			strDifference = Locale.ConvertTextKey("TXT_KEY_NUMBER_PERTURN_TEXT", difference)
		else
			strDifference = Locale.ConvertTextKey("TXT_KEY_NUMBER_PERTURN_TEXT_NEGATIVE", difference)
		end

		strText = strText .. "[NEWLINE][NEWLINE][ICON_MATERIEL] Materiel stock variation : " .. strDifference	

	else
		strText = strText .. "Please wait for first turn to allow data initialization..."
	end

	local materielReinforcement = GetMaterielReinforcement (playerID) 
	if materielReinforcement then

		for k,v in pairs(materielReinforcement) do materielReinforcement[k] = Round(v); end -- no digit please.

		local totalMat = materielReinforcement.total + currentMatFromSupplyRoutes -- count extra reinforcement (not in per turn calculations)
		
		strText = strText .. "[NEWLINE][NEWLINE]----------------------------------------------------------------[NEWLINE]"
		strText = strText .. "[NEWLINE][ICON_MATERIEL] Materiel planned for next turn : " .. totalMat

		strText = strText .. "[NEWLINE][ICON_BULLET] from nation (global production) : "  .. materielReinforcement.fromGlobal
		if materielReinforcement.fromFactory	> 0 then strText = strText .. "[NEWLINE][ICON_BULLET] from factories (local production bonus) : "  .. materielReinforcement.fromFactory; end
		if materielReinforcement.fromHarbor		> 0 then strText = strText .. "[NEWLINE][ICON_BULLET] from harbors (imports) : "  .. materielReinforcement.fromHarbor; end
		if materielReinforcement.fromWarBonds	> 0 then strText = strText .. "[NEWLINE][ICON_BULLET] from war bonds (materiel bought) : "  .. materielReinforcement.fromWarBonds; end
		if materielReinforcement.fromMinor		> 0 then strText = strText .. "[NEWLINE][ICON_BULLET] from other nations (friends, allies) : "  .. materielReinforcement.fromMinor; end
		if currentMatFromSupplyRoutes			> 0 then strText = strText .. "[NEWLINE][ICON_BULLET] from supply routes (convoy, railsroad) : "  .. currentMatFromSupplyRoutes; end
		if materielReinforcement.fromScenario	> 0 then strText = strText .. "[NEWLINE][ICON_BULLET] from base production : "  .. materielReinforcement.fromScenario; end
		
		local neededReinforcement = GetNeededReinforcementForUnits(playerID, bOnlySupplied)

		for k,v in pairs(neededReinforcement) do neededReinforcement[k] = Round(v); end

		local reinfMat = - neededReinforcement.nextTurnMat
		
		strText = strText .. "[NEWLINE][NEWLINE][ICON_MATERIEL] Materiel requirement for next turn : " .. reinfMat
		if reinfMat ~= 0 then strText = strText .. "[NEWLINE][ICON_BULLET] to reinforce troops : "  .. reinfMat; end
		-- to do: add function for upgrade

		local difference = totalMat + reinfMat -- reinfMat is a negative value ! todo = change that.
		local strDifference = ""
		
		if difference >= 0 then
			strDifference = Locale.ConvertTextKey("TXT_KEY_NUMBER_PERTURN_TEXT", difference)
		else
			strDifference = Locale.ConvertTextKey("TXT_KEY_NUMBER_PERTURN_TEXT_NEGATIVE", difference)
		end

		strText = strText .. "[NEWLINE][NEWLINE][ICON_MATERIEL] Materiel planned stock variation : " .. strDifference
		strText = strText .. "[NEWLINE][NEWLINE]----------------------------------------------------------------"
		strText = strText .. "[NEWLINE][ICON_MATERIEL] Materiel total requirement : " .. neededReinforcement.totalMat

	else
		strText = strText .. "Please wait for first turn to allow data initialization..."
	end
	return strText
end

-- Gold Tooltip
function GoldTipHandler( control )

	local strText = "";
	local iPlayerID = Game.GetActivePlayer();
	local pPlayer = Players[iPlayerID];
	local pTeam = Teams[pPlayer:GetTeam()];
	local pCity = UI.GetHeadSelectedCity();
	
	local iTotalGold = pPlayer:GetGold();

	local iGoldPerTurnFromOtherPlayers = pPlayer:GetGoldPerTurnFromDiplomacy();
	local iGoldPerTurnToOtherPlayers = 0;
	if (iGoldPerTurnFromOtherPlayers < 0) then
		iGoldPerTurnToOtherPlayers = -iGoldPerTurnFromOtherPlayers;
		iGoldPerTurnFromOtherPlayers = 0;
	end

	local fGoldPerTurnFromCities = pPlayer:GetGoldFromCitiesTimes100() / 100;
	local fCityConnectionGold = pPlayer:GetCityConnectionGoldTimes100() / 100;
	local fTotalIncome = fGoldPerTurnFromCities + iGoldPerTurnFromOtherPlayers + fCityConnectionGold;
	
	if (not OptionsManager.IsNoBasicHelp()) then
		strText = strText .. Locale.ConvertTextKey("TXT_KEY_TP_AVAILABLE_GOLD", iTotalGold);
		strText = strText .. "[NEWLINE][NEWLINE]";
	end
	
	strText = strText .. "[COLOR:150:255:150:255]";
	strText = strText .. "+" .. Locale.ConvertTextKey("TXT_KEY_TP_TOTAL_INCOME", math.floor(fTotalIncome));
	strText = strText .. "[NEWLINE]  [ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_TP_CITY_OUTPUT", fGoldPerTurnFromCities);
	strText = strText .. "[NEWLINE]  [ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_TP_GOLD_FROM_TR", math.floor(fCityConnectionGold));
	if (iGoldPerTurnFromOtherPlayers > 0) then
		strText = strText .. "[NEWLINE]  [ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_TP_GOLD_FROM_OTHERS", iGoldPerTurnFromOtherPlayers);
	end
	strText = strText .. "[/COLOR]";
	
	local iUnitCost = pPlayer:CalculateUnitCost();
	local iUnitSupply = pPlayer:CalculateUnitSupply();
	local iBuildingMaintenance = pPlayer:GetBuildingGoldMaintenance();
	local iImprovementMaintenance = pPlayer:GetImprovementGoldMaintenance();
	local iTotalExpenses = iUnitCost + iUnitSupply + iBuildingMaintenance + iImprovementMaintenance + iGoldPerTurnToOtherPlayers;
	
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
	if (iImprovementMaintenance ~= 0) then
		strText = strText .. "[NEWLINE]  [ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_TP_GOLD_TILE_MAINT", iImprovementMaintenance);
	end
	if (iGoldPerTurnToOtherPlayers > 0) then
		strText = strText .. "[NEWLINE]  [ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_TP_GOLD_TO_OTHERS", iGoldPerTurnToOtherPlayers);
	end
	strText = strText .. "[/COLOR]";
	
	if (fTotalIncome + iTotalGold < 0) then
		strText = strText .. "[NEWLINE][COLOR:255:60:60:255]" .. Locale.ConvertTextKey("TXT_KEY_TP_LOSING_SCIENCE_FROM_DEFICIT") .. "[/COLOR]";
	end
	
	-- Basic explanation of Happiness
	if (not OptionsManager.IsNoBasicHelp()) then
		strText = strText .. "[NEWLINE][NEWLINE]";
		strText = strText ..  Locale.ConvertTextKey("TXT_KEY_TP_GOLD_EXPLANATION");
	end
	
	--Controls.GoldPerTurn:SetToolTipString(strText);
	
	tipControlTable.TooltipLabel:SetText( strText );
	tipControlTable.TopPanelMouseover:SetHide(false);
    
    -- Autosize tooltip
    tipControlTable.TopPanelMouseover:DoAutoSize();
	
end

-- Resources Tooltip
function ResourcesTipHandler( control )

	local strText;
	local iPlayerID = Game.GetActivePlayer();
	local pPlayer = Players[iPlayerID];
	local pTeam = Teams[pPlayer:GetTeam()];
	local pCity = UI.GetHeadSelectedCity();
	
	strText = "";
	
	local pResource;
	local bShowResource;
	local bThisIsFirstResourceShown = true;
	local iNumAvailable;
	local iNumUsed;
	local iNumTotal;
	
	for pResource in GameInfo.Resources() do
		local iResourceLoop = pResource.ID;
		
		if (Game.GetResourceUsageType(iResourceLoop) == ResourceUsageTypes.RESOURCEUSAGE_STRATEGIC) then
			
			bShowResource = false;
			
			if (pTeam:GetTeamTechs():HasTech(GameInfoTypes[pResource.TechReveal])) then
				if (pTeam:GetTeamTechs():HasTech(GameInfoTypes[pResource.TechCityTrade])) then
					bShowResource = true;
				end
			end
			
			if (bShowResource) then
				iNumAvailable = pPlayer:GetNumResourceAvailable(iResourceLoop, true);
				iNumUsed = pPlayer:GetNumResourceUsed(iResourceLoop);
				iNumTotal = pPlayer:GetNumResourceTotal(iResourceLoop, true);
				
				-- Add newline to the front of all entries that AREN'T the first
				if (bThisIsFirstResourceShown) then
					strText = "";
					bThisIsFirstResourceShown = false;
				else
					strText = strText .. "[NEWLINE]";
				end
				
				strText = strText .. iNumAvailable .. " " .. pResource.IconString .. " " .. Locale.ConvertTextKey(pResource.Description);
				
				-- Details
				if (iNumUsed ~= 0 or iNumTotal ~= 0) then
					strText = strText .. ": ";
					strText = strText .. Locale.ConvertTextKey("TXT_KEY_TP_RESOURCE_INFO", iNumTotal, iNumUsed);
				end
				
			end
		end
	end
	
	print(strText);
	if(strText ~= "") then
		tipControlTable.TopPanelMouseover:SetHide(false);
		tipControlTable.TooltipLabel:SetText( strText );
	else
		tipControlTable.TopPanelMouseover:SetHide(true);
	end
    
    -- Autosize tooltip
    tipControlTable.TopPanelMouseover:DoAutoSize();
	
end

-------------------------------------------------
-- On Top Panel mouseover exited
-------------------------------------------------
--function HelpClose()
	---- Hide the help text box
	--Controls.HelpTextBox:SetHide( true );
--end



function UpdateReinforcementDataOnMove(iPlayer, unitID, x, y)
	
	local bDebug = true

	--Dprint("- Unit Moving at " .. x .. "," .. y , bDebug)

	local player = Players[iPlayer]	
	if (not player:IsHuman()) then	
		return	
	end

	local unit = player:GetUnitByID(unitID)	
	if (unit == nil or unit:IsDelayedDeath()) then	
		return	
	end	
	local plot = GetPlot(x, y)	
	local missionPlot = unit:LastMissionPlot()
	--local endPathPlot = unit:GetPathEndTurnPlot()
	
	--Dprint("- missionPlot = " .. tostring(missionPlot), bDebug)
	--Dprint("- endPathPlot = " .. tostring(endPathPlot), bDebug)
	
	--Dprint("- Unit at (" .. x .. "," .. y .. "), Mission Plot at ("..missionPlot:GetX()..","..missionPlot:GetY()..")", bDebug)
	--Dprint("- Unit at (" .. x .. "," .. y .. "), Mission Plot at ("..missionPlot:GetX()..","..missionPlot:GetY().."), End Path Plot at ("..endPathPlot:GetX()..","..endPathPlot:GetY()..")", bDebug)
	
	if plot == missionPlot then
		UpdateData()
	end
end

-- Register Events
Events.SerialEventGameDataDirty.Add(OnTopPanelDirty);
Events.SerialEventTurnTimerDirty.Add(OnTopPanelDirty);
Events.SerialEventCityInfoDirty.Add(OnTopPanelDirty);
GameEvents.UnitSetXY.Add(UpdateReinforcementDataOnMove);

-- Update data at initialization
UpdateData();
DoInitTooltips();