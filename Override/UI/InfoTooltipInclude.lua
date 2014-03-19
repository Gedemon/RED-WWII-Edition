-------------------------------------------------
-- Help text for Info Objects (Units, Buildings, etc.)
-------------------------------------------------


-- UNIT
function GetHelpTextForUnit(iUnitID, bIncludeRequirementsInfo)
	local pUnitInfo = GameInfo.Units[iUnitID];
	
	local pActivePlayer = Players[Game.GetActivePlayer()];
	local pActiveTeam = Teams[Game.GetActiveTeam()];

	local strHelpText = "";
	
	-- Name & Class
	strHelpText = strHelpText .. Locale.ConvertTextKey( pUnitInfo.Description ) .. " (" .. Locale.ToUpper(Locale.ConvertTextKey(GameInfo.UnitClasses[pUnitInfo.Class].Description)) .. ")";
	
	-- Cost
	strHelpText = strHelpText .. "[NEWLINE]--------------------------------[NEWLINE]";
	strHelpText = strHelpText .. Locale.ConvertTextKey("TXT_KEY_PRODUCTION_COST", pActivePlayer:GetUnitProductionNeeded(iUnitID));
	-- Moves
	strHelpText = strHelpText .. "[NEWLINE]";
	strHelpText = strHelpText .. Locale.ConvertTextKey("TXT_KEY_PRODUCTION_MOVEMENT", pUnitInfo.Moves);
	
	-- Range
	local iRange = pUnitInfo.Range;
	if (iRange ~= 0) then
		strHelpText = strHelpText .. "[NEWLINE]";
		strHelpText = strHelpText .. Locale.ConvertTextKey("TXT_KEY_PRODUCTION_RANGE", iRange);
	end
	
	-- Ranged Strength
	local iRangedStrength = pUnitInfo.RangedCombat;
	if (iRangedStrength ~= 0) then
		strHelpText = strHelpText .. "[NEWLINE]";
		strHelpText = strHelpText .. Locale.ConvertTextKey("TXT_KEY_PRODUCTION_RANGED_STRENGTH", iRangedStrength);
	end
	
	-- Strength
	local iStrength = pUnitInfo.Combat;
	if (iStrength ~= 0) then
		strHelpText = strHelpText .. "[NEWLINE]";
		strHelpText = strHelpText .. Locale.ConvertTextKey("TXT_KEY_PRODUCTION_STRENGTH", iStrength);
	end
	
	-- Reinforcements
	--local unitClassID = GameInfo.UnitClasses[pUnitInfo.Class].ID
	local reqMateriel, reqPersonnel = RequestedReinforcementsPerHP(iUnitID)
	local reqOil = GameInfo.Units[iUnitID].FuelConsumption
	if (reqMateriel ~= 0) then
		strHelpText = strHelpText .. "[NEWLINE]"
		strHelpText = strHelpText .. Locale.ConvertTextKey("TXT_KEY_PRODUCTION_MATERIEL", reqMateriel);
	end
	if (reqPersonnel ~= 0) then
		strHelpText = strHelpText .. "[NEWLINE]"
		strHelpText = strHelpText .. Locale.ConvertTextKey("TXT_KEY_PRODUCTION_PERSONNEL", reqPersonnel);
	end
	if (reqOil > 0) then
		strHelpText = strHelpText .. "[NEWLINE]"
		strHelpText = strHelpText .. Locale.ConvertTextKey("TXT_KEY_PRODUCTION_OIL", reqOil);
	end


	-- Resource Requirements
	local iNumResourcesNeededSoFar = 0;
	local iNumResourceNeeded;
	local iResourceID;
	for pResource in GameInfo.Resources() do
		iResourceID = pResource.ID;
		iNumResourceNeeded = Game.GetNumResourceRequiredForUnit(iUnitID, iResourceID);
		if (iNumResourceNeeded > 0) then
			-- First resource required
			if (iNumResourcesNeededSoFar == 0) then
				strHelpText = strHelpText .. "[NEWLINE]";
				strHelpText = strHelpText .. Locale.ConvertTextKey("TXT_KEY_PRODUCTION_RESOURCES_REQUIRED");
				strHelpText = strHelpText .. " " .. iNumResourceNeeded .. " " .. pResource.IconString .. " " .. Locale.ConvertTextKey(pResource.Description);
			else
				strHelpText = strHelpText .. ", " .. iNumResourceNeeded .. " " .. pResource.IconString .. " " .. Locale.ConvertTextKey(pResource.Description);
			end
			
			-- JON: Not using this for now, the formatting is better when everything is on the same line
			--iNumResourcesNeededSoFar = iNumResourcesNeededSoFar + 1;
		end
 	end
	
	-- Pre-written Help text
	if (not pUnitInfo.Help) then
		print("Invalid unit help");
		print(strHelpText);
	else
		local strWrittenHelpText = Locale.ConvertTextKey( pUnitInfo.Help );
		if (strWrittenHelpText ~= nil and strWrittenHelpText ~= "") then
			-- Separator
			strHelpText = strHelpText .. "[NEWLINE]--------------------------------[NEWLINE]";
			strHelpText = strHelpText .. strWrittenHelpText;
		end	
	end
		
	-- Free promotion ?
	local condition = "UnitType = '" .. pUnitInfo.Type .. "'"
	local promotion = nil
	for row in GameInfo.Unit_FreePromotions( condition ) do
		promotion = GameInfo.UnitPromotions[row.PromotionType]
	end
	if promotion then
		local strWrittenHelpText = Locale.ConvertTextKey( promotion.Help );
		if (strWrittenHelpText ~= nil and strWrittenHelpText ~= "") then
			-- Separator
			strHelpText = strHelpText .. "[NEWLINE]--------------------------------[NEWLINE]";
			strHelpText = strHelpText .. strWrittenHelpText;
		end	
	end
	
	
	-- Requirements?
	if (bIncludeRequirementsInfo) then
		if (pUnitInfo.Requirements) then
			strHelpText = strHelpText .. Locale.ConvertTextKey( pUnitInfo.Requirements );
		end
	end
	
	return strHelpText;
	
end

-- BUILDING
function GetHelpTextForBuilding(iBuildingID, bExcludeName, bExcludeHeader, bNoMaintenance)
	local pBuildingInfo = GameInfo.Buildings[iBuildingID];
	
	local pActivePlayer = Players[Game.GetActivePlayer()];
	local pActiveTeam = Teams[Game.GetActiveTeam()];
	
	local buildingClass = GameInfo.Buildings[iBuildingID].BuildingClass;
	local buildingClassID = GameInfo.BuildingClasses[buildingClass].ID;
	
	
	local strHelpText = "";
	
	if (not bExcludeHeader) then
		
		if (not bExcludeName) then
			-- Name
			strHelpText = strHelpText .. Locale.ToUpper(Locale.ConvertTextKey( pBuildingInfo.Description ));
			strHelpText = strHelpText .. "[NEWLINE]----------------[NEWLINE]";
		end
		
		-- Cost
		local iCost = pActivePlayer:GetBuildingProductionNeeded(iBuildingID);
		strHelpText = strHelpText .. Locale.ConvertTextKey("TXT_KEY_PRODUCTION_COST", iCost);
		
		-- Maintenance
		if (not bNoMaintenance) then
			local iMaintenance = pBuildingInfo.GoldMaintenance;
			if (iMaintenance ~= nil and iMaintenance ~= 0) then
				strHelpText = strHelpText .. "[NEWLINE]";
				strHelpText = strHelpText .. Locale.ConvertTextKey("TXT_KEY_PRODUCTION_BUILDING_MAINTENANCE", iMaintenance);
			end
		end
		
	end
	
	-- Happiness (from all sources)
	local iHappinessTotal = 0;
	local iHappiness = pBuildingInfo.Happiness;
	if (iHappiness ~= nil) then
		iHappinessTotal = iHappinessTotal + iHappiness;
	end
	local iHappiness = pBuildingInfo.UnmoddedHappiness;
	if (iHappiness ~= nil) then
		iHappinessTotal = iHappinessTotal + iHappiness;
	end
	iHappinessTotal = iHappinessTotal + pActivePlayer:GetExtraBuildingHappinessFromPolicies(iBuildingID);
	if (iHappinessTotal ~= 0) then
		strHelpText = strHelpText .. "[NEWLINE]";
		strHelpText = strHelpText .. Locale.ConvertTextKey("TXT_KEY_PRODUCTION_BUILDING_HAPPINESS", iHappinessTotal);
	end
	
	-- Culture
	local iCulture = pBuildingInfo.Culture;
	if (iCulture ~= nil and iCulture ~= 0) then
		strHelpText = strHelpText .. "[NEWLINE]";
		strHelpText = strHelpText .. Locale.ConvertTextKey("TXT_KEY_PRODUCTION_BUILDING_CULTURE", iCulture);
	end
	
	-- Defense
	local iDefense = pBuildingInfo.Defense;
	if (iDefense ~= nil and iDefense ~= 0) then
		strHelpText = strHelpText .. "[NEWLINE]";
		strHelpText = strHelpText .. Locale.ConvertTextKey("TXT_KEY_PRODUCTION_BUILDING_DEFENSE", iDefense / 100);
	end
	
	-- Food
	local iFood = Game.GetBuildingYieldChange(iBuildingID, YieldTypes.YIELD_FOOD);
	if (iFood ~= nil and iFood ~= 0) then
		strHelpText = strHelpText .. "[NEWLINE]";
		strHelpText = strHelpText .. Locale.ConvertTextKey("TXT_KEY_PRODUCTION_BUILDING_FOOD", iFood);
	end
	
	-- Gold Mod
	local iGold = Game.GetBuildingYieldModifier(iBuildingID, YieldTypes.YIELD_GOLD);
	iGold = iGold + pActivePlayer:GetPolicyBuildingClassYieldModifier(buildingClassID, YieldTypes.YIELD_GOLD);
	
	if (iGold ~= nil and iGold ~= 0) then
		strHelpText = strHelpText .. "[NEWLINE]";
		strHelpText = strHelpText .. Locale.ConvertTextKey("TXT_KEY_PRODUCTION_BUILDING_GOLD", iGold);
	end
	
	-- Gold Change
	iGold = Game.GetBuildingYieldChange(iBuildingID, YieldTypes.YIELD_GOLD);
	if (iGold ~= nil and iGold ~= 0) then
		strHelpText = strHelpText .. "[NEWLINE]";
		strHelpText = strHelpText .. Locale.ConvertTextKey("TXT_KEY_PRODUCTION_BUILDING_GOLD_CHANGE", iGold);
	end
	
	
	
	-- Science
	local iScience = Game.GetBuildingYieldModifier(iBuildingID, YieldTypes.YIELD_SCIENCE);
	iScience = iScience + pActivePlayer:GetPolicyBuildingClassYieldModifier(buildingClassID, YieldTypes.YIELD_SCIENCE);
	if (iScience ~= nil and iScience ~= 0) then
		strHelpText = strHelpText .. "[NEWLINE]";
		strHelpText = strHelpText .. Locale.ConvertTextKey("TXT_KEY_PRODUCTION_BUILDING_SCIENCE", iScience);
	end
	
	-- Science
	local iScienceChange = Game.GetBuildingYieldChange(iBuildingID, YieldTypes.YIELD_SCIENCE);
	if (iScienceChange ~= nil and iScienceChange ~= 0) then
		strHelpText = strHelpText .. "[NEWLINE]";
		strHelpText = strHelpText .. Locale.ConvertTextKey("TXT_KEY_PRODUCTION_BUILDING_SCIENCE_CHANGE", iScienceChange);
	end
	
	-- Production
	local iProduction = Game.GetBuildingYieldModifier(iBuildingID, YieldTypes.YIELD_PRODUCTION);
	iProduction = iProduction + pActivePlayer:GetPolicyBuildingClassYieldModifier(buildingClassID, YieldTypes.YIELD_PRODUCTION);
	if (iProduction ~= nil and iProduction ~= 0) then
		strHelpText = strHelpText .. "[NEWLINE]";
		strHelpText = strHelpText .. Locale.ConvertTextKey("TXT_KEY_PRODUCTION_BUILDING_PRODUCTION", iProduction);
	end

	-- Production Change
	local iProd = Game.GetBuildingYieldChange(iBuildingID, YieldTypes.YIELD_PRODUCTION);
	if (iProd ~= nil and iProd ~= 0) then
		strHelpText = strHelpText .. "[NEWLINE]";
		strHelpText = strHelpText .. Locale.ConvertTextKey("TXT_KEY_PRODUCTION_BUILDING_PRODUCTION_CHANGE", iProd);
	end
	
	-- Great People
	local specialistType = pBuildingInfo.SpecialistType;
	if specialistType ~= nil then
		local iNumPoints = pBuildingInfo.GreatPeopleRateChange;
		if (iNumPoints > 0) then
			strHelpText = strHelpText .. "[NEWLINE]";
			strHelpText = strHelpText .. "[ICON_GREAT_PEOPLE] " .. Locale.ConvertTextKey(GameInfo.Specialists[specialistType].GreatPeopleTitle) .. " " .. iNumPoints;
		end
		
		if(pBuildingInfo.SpecialistCount > 0) then
			strHelpText = strHelpText .. "[NEWLINE]";
			
			-- Append a key such as TXT_KEY_SPECIALIST_ARTIST_SLOTS
			local specialistSlotsKey = GameInfo.Specialists[specialistType].Description .. "_SLOTS";
			strHelpText = strHelpText .. "[ICON_GREAT_PEOPLE] " .. Locale.ConvertTextKey(specialistSlotsKey) .. " " .. pBuildingInfo.SpecialistCount;
		end
		
		
	end
	
	-- Pre-written Help text
	if (pBuildingInfo.Help ~= nil) then
		local strWrittenHelpText = Locale.ConvertTextKey( pBuildingInfo.Help );
		if (strWrittenHelpText ~= nil and strWrittenHelpText ~= "") then
			-- Separator
			strHelpText = strHelpText .. "[NEWLINE]----------------[NEWLINE]";
			strHelpText = strHelpText .. strWrittenHelpText;
		end
	end
	
	return strHelpText;
	
end


-- IMPROVEMENT
function GetHelpTextForImprovement(iImprovementID, bExcludeName, bExcludeHeader, bNoMaintenance)
	local pImprovementInfo = GameInfo.Improvements[iImprovementID];
	
	local pActivePlayer = Players[Game.GetActivePlayer()];
	local pActiveTeam = Teams[Game.GetActiveTeam()];
	
	local strHelpText = "";
	
	if (not bExcludeHeader) then
		
		if (not bExcludeName) then
			-- Name
			strHelpText = strHelpText .. Locale.ToUpper(Locale.ConvertTextKey( pImprovementInfo.Description ));
			strHelpText = strHelpText .. "[NEWLINE]----------------[NEWLINE]";
		end
				
	end
		
	-- if we end up having a lot of these we may need to add some more stuff here
	
	-- Pre-written Help text
	if (pImprovementInfo.Help ~= nil) then
		local strWrittenHelpText = Locale.ConvertTextKey( pImprovementInfo.Help );
		if (strWrittenHelpText ~= nil and strWrittenHelpText ~= "") then
			-- Separator
			-- strHelpText = strHelpText .. "[NEWLINE]----------------[NEWLINE]";
			strHelpText = strHelpText .. strWrittenHelpText;
		end
	end
	
	return strHelpText;
	
end










-- PROJECT
function GetHelpTextForProject(iProjectID, bIncludeRequirementsInfo)
	local pProjectInfo = GameInfo.Projects[iProjectID];
	
	local pActivePlayer = Players[Game.GetActivePlayer()];
	local pActiveTeam = Teams[Game.GetActiveTeam()];
	
	local strHelpText = "";
	
	-- Name
	strHelpText = strHelpText .. Locale.ToUpper(Locale.ConvertTextKey( pProjectInfo.Description ));
	
	-- Cost
	local iCost = pActivePlayer:GetProjectProductionNeeded(iProjectID);
	strHelpText = strHelpText .. "[NEWLINE]----------------[NEWLINE]";
	strHelpText = strHelpText .. Locale.ConvertTextKey("TXT_KEY_PRODUCTION_COST", iCost);
	
	-- Pre-written Help text
	local strWrittenHelpText = Locale.ConvertTextKey( pProjectInfo.Help );
	if (strWrittenHelpText ~= nil and strWrittenHelpText ~= "") then
		-- Separator
		strHelpText = strHelpText .. "[NEWLINE]----------------[NEWLINE]";
		strHelpText = strHelpText .. strWrittenHelpText;
	end
	
	-- Requirements?
	if (bIncludeRequirementsInfo) then
		if (pProjectInfo.Requirements) then
			strHelpText = strHelpText .. Locale.ConvertTextKey( pProjectInfo.Requirements );
		end
	end
	
	return strHelpText;
	
end


-- CITY STATE STATUS
function GetCityStateStatus(pPlayer, iForPlayer, bWar)
	
	-- Status
	local strStatusTT = "";
	local strShortDescKey = pPlayer:GetCivilizationShortDescriptionKey();
	
	local iInfluenceChangeThisTurn = pPlayer:GetFriendshipChangePerTurnTimes100(iForPlayer) / 100;
	
	if (pPlayer:IsAllies(iForPlayer)) then		-- Allies
		strStatusTT = Locale.ConvertTextKey("TXT_KEY_DIPLO_STATUS_TT", Locale.ConvertTextKey(strShortDescKey), Locale.ConvertTextKey("TXT_KEY_ALLIES"),
										  pPlayer:GetMinorCivFriendshipWithMajor(iForPlayer), 
										  GameDefines["FRIENDSHIP_THRESHOLD_MAX"] - GameDefines["FRIENDSHIP_THRESHOLD_ALLIES"]); 
		
		local strTempTT = Locale.ConvertTextKey("TXT_KEY_ALLIES_CSTATE_TT", strShortDescKey, iInfluenceChangeThisTurn);
		
		strStatusTT = strStatusTT .. "[NEWLINE][NEWLINE]" .. strTempTT;
		
	elseif (pPlayer:IsFriends(iForPlayer)) then		-- Friends
		strStatusTT = Locale.ConvertTextKey("TXT_KEY_DIPLO_STATUS_TT", Locale.ConvertTextKey(strShortDescKey), Locale.ConvertTextKey("TXT_KEY_FRIENDS"),
										    pPlayer:GetMinorCivFriendshipWithMajor(iForPlayer),
										    GameDefines["FRIENDSHIP_THRESHOLD_ALLIES"] - GameDefines["FRIENDSHIP_THRESHOLD_FRIENDS"]);
		
		local strTempTT = Locale.ConvertTextKey("TXT_KEY_FRIENDS_CSTATE_TT", strShortDescKey, iInfluenceChangeThisTurn);
		
		strStatusTT = strStatusTT .. "[NEWLINE][NEWLINE]" .. strTempTT;
		
	elseif (pPlayer:IsMinorPermanentWar(iActiveTeam)) then		-- Permanent War
		strStatusTT = Locale.ConvertTextKey("TXT_KEY_DIPLO_STATUS_TT", Locale.ConvertTextKey(strShortDescKey), Locale.ConvertTextKey("TXT_KEY_ANGRY"),
										    pPlayer:GetMinorCivFriendshipWithMajor(iForPlayer), GameDefines["MINOR_FRIENDSHIP_AT_WAR"]);
										    
		strStatusTT = strStatusTT .. "[NEWLINE][NEWLINE]" .. Locale.ConvertTextKey("TXT_KEY_PERMANENT_WAR_CSTATE_TT", strShortDescKey);
		
	elseif (pPlayer:IsPeaceBlocked(iActiveTeam)) then		-- Peace blocked by being at war with ally
		strStatusTT = Locale.ConvertTextKey("TXT_KEY_DIPLO_STATUS_TT", Locale.ConvertTextKey(strShortDescKey), Locale.ConvertTextKey("TXT_KEY_ANGRY"),
										    pPlayer:GetMinorCivFriendshipWithMajor(iForPlayer), GameDefines["MINOR_FRIENDSHIP_AT_WAR"]);
										    
		strStatusTT = strStatusTT .. "[NEWLINE][NEWLINE]" .. Locale.ConvertTextKey("TXT_KEY_PEACE_BLOCKED_CSTATE_TT", strShortDescKey);
		
	elseif (bWar) then		-- War
		strStatusTT = Locale.ConvertTextKey("TXT_KEY_DIPLO_STATUS_TT", Locale.ConvertTextKey(strShortDescKey), Locale.ConvertTextKey("TXT_KEY_ANGRY"),
										    pPlayer:GetMinorCivFriendshipWithMajor(iForPlayer), GameDefines["MINOR_FRIENDSHIP_AT_WAR"]);
										    
		strStatusTT = strStatusTT .. "[NEWLINE][NEWLINE]" ..Locale.ConvertTextKey("TXT_KEY_WAR_CSTATE_TT", strShortDescKey);
		
	elseif (pPlayer:GetMinorCivFriendshipWithMajor(iForPlayer) < 0) then		-- Angry
		strStatusTT = Locale.ConvertTextKey("TXT_KEY_DIPLO_STATUS_TT", Locale.ConvertTextKey(strShortDescKey), Locale.ConvertTextKey("TXT_KEY_ANGRY"),
										    pPlayer:GetMinorCivFriendshipWithMajor(iForPlayer), GameDefines["MINOR_FRIENDSHIP_AT_WAR"]);
										    
		strStatusTT = strStatusTT .. "[NEWLINE][NEWLINE]" .. Locale.ConvertTextKey("TXT_KEY_ANGRY_CSTATE_TT", strShortDescKey, iInfluenceChangeThisTurn);
		
	else		-- Neutral
		strStatusTT = Locale.ConvertTextKey("TXT_KEY_DIPLO_STATUS_TT", Locale.ConvertTextKey(strShortDescKey), Locale.ConvertTextKey("TXT_KEY_CITY_STATE_PERSONALITY_NEUTRAL"),
										    pPlayer:GetMinorCivFriendshipWithMajor(iForPlayer) - GameDefines["FRIENDSHIP_THRESHOLD_NEUTRAL"], 
											GameDefines["FRIENDSHIP_THRESHOLD_FRIENDS"] - GameDefines["FRIENDSHIP_THRESHOLD_NEUTRAL"]);
										    
		strStatusTT = strStatusTT .. "[NEWLINE][NEWLINE]" .. Locale.ConvertTextKey("TXT_KEY_NEUTRAL_CSTATE_TT", strShortDescKey);
	end
	
	return strStatusTT;
	
end


-------------------------------------------------
-- Tooltips for Yield & Similar (e.g. Culture)
-------------------------------------------------

-- FOOD
function GetFoodTooltip(pCity)
	
	local iYieldType = YieldTypes.YIELD_FOOD;
	local strFoodToolTip = "";
	
	if (not OptionsManager.IsNoBasicHelp()) then
		strFoodToolTip = strFoodToolTip .. Locale.ConvertTextKey("TXT_KEY_FOOD_HELP_INFO");
		strFoodToolTip = strFoodToolTip .. "[NEWLINE][NEWLINE]";
	end
	--[[
	local fFoodProgress = pCity:GetFoodTimes100() / 100;
	local iFoodNeeded = pCity:GrowthThreshold();
	
	strFoodToolTip = strFoodToolTip .. Locale.ConvertTextKey("TXT_KEY_FOOD_PROGRESS", fFoodProgress, iFoodNeeded);
	--]]
	strFoodToolTip = strFoodToolTip .. GetYieldTooltipHelper(pCity, iYieldType, "[ICON_FOOD]");
	
	return strFoodToolTip;
end

-- GOLD
function GetGoldTooltip(pCity)
	
	local iYieldType = YieldTypes.YIELD_GOLD;

	local strGoldToolTip = "";
	if (not OptionsManager.IsNoBasicHelp()) then
		strGoldToolTip = strGoldToolTip .. Locale.ConvertTextKey("TXT_KEY_GOLD_HELP_INFO");
		strGoldToolTip = strGoldToolTip .. "[NEWLINE][NEWLINE]";
	end
	
	strGoldToolTip = strGoldToolTip .. GetYieldTooltipHelper(pCity, iYieldType, "[ICON_GOLD]");
	
	return strGoldToolTip;
end

-- SCIENCE
function GetScienceTooltip(pCity)
	
	local strScienceToolTip = "";

	if (Game.IsOption(GameOptionTypes.GAMEOPTION_NO_SCIENCE)) then
		strScienceToolTip = Locale.ConvertTextKey("TXT_KEY_TOP_PANEL_SCIENCE_OFF_TOOLTIP");
	else

		local iYieldType = YieldTypes.YIELD_SCIENCE;
	
		if (not OptionsManager.IsNoBasicHelp()) then
			strScienceToolTip = strScienceToolTip .. Locale.ConvertTextKey("TXT_KEY_SCIENCE_HELP_INFO");
			strScienceToolTip = strScienceToolTip .. "[NEWLINE][NEWLINE]";
		end
	
		strScienceToolTip = strScienceToolTip .. GetYieldTooltipHelper(pCity, iYieldType, "[ICON_RESEARCH]");
	end
	
	return strScienceToolTip;
end

-- PRODUCTION
function GetProductionTooltip(pCity)

	local iBaseProductionPT = pCity:GetBaseYieldRate(YieldTypes.YIELD_PRODUCTION);
	local iProductionPerTurn = pCity:GetCurrentProductionDifferenceTimes100(false, false) / 100;--pCity:GetYieldRate(YieldTypes.YIELD_PRODUCTION);
	local strCodeToolTip = pCity:GetYieldModifierTooltip(YieldTypes.YIELD_PRODUCTION);
	
	local strProductionBreakdown = GetYieldTooltip(pCity, YieldTypes.YIELD_PRODUCTION, iBaseProductionPT, iProductionPerTurn, "[ICON_PRODUCTION]", strCodeToolTip);
	
	-- Basic explanation of production
	local strProductionHelp = "";
	if (not OptionsManager.IsNoBasicHelp()) then
		strProductionHelp = strProductionHelp .. Locale.ConvertTextKey("TXT_KEY_PRODUCTION_HELP_INFO");
		strProductionHelp = strProductionHelp .. "[NEWLINE][NEWLINE]";
		--Controls.ProductionButton:SetToolTipString(Locale.ConvertTextKey("TXT_KEY_CITYVIEW_CHANGE_PROD_TT"));
	else
		--Controls.ProductionButton:SetToolTipString(Locale.ConvertTextKey("TXT_KEY_CITYVIEW_CHANGE_PROD"));
	end
	
	return strProductionHelp .. strProductionBreakdown;
end

-- CULTURE
function GetCultureTooltip(pCity)
	
	local strCultureToolTip = "";
	
	if (not OptionsManager.IsNoBasicHelp()) then
		strCultureToolTip = strCultureToolTip .. Locale.ConvertTextKey("TXT_KEY_CULTURE_HELP_INFO");
		strCultureToolTip = strCultureToolTip .. "[NEWLINE][NEWLINE]";
	end
	
	local bFirst = true;
	
	-- Culture from Buildings
	local iCultureFromBuildings = pCity:GetJONSCulturePerTurnFromBuildings();
	if (iCultureFromBuildings ~= 0) then
		
		-- Spacing
		if (bFirst) then
			bFirst = false;
		else
			strCultureToolTip = strCultureToolTip .. "[NEWLINE]";
		end
		
		strCultureToolTip = strCultureToolTip .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_CULTURE_FROM_BUILDINGS", iCultureFromBuildings);
	end
	
	-- Culture from Policies
	local iCultureFromPolicies = pCity:GetJONSCulturePerTurnFromPolicies();
	if (iCultureFromPolicies ~= 0) then
		
		-- Spacing
		if (bFirst) then
			bFirst = false;
		else
			strCultureToolTip = strCultureToolTip .. "[NEWLINE]";
		end
		
		strCultureToolTip = strCultureToolTip .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_CULTURE_FROM_POLICIES", iCultureFromPolicies);
	end
	
	-- Culture from Specialists
	local iCultureFromSpecialists = pCity:GetJONSCulturePerTurnFromSpecialists();
	if (iCultureFromSpecialists ~= 0) then
		
		-- Spacing
		if (bFirst) then
			bFirst = false;
		else
			strCultureToolTip = strCultureToolTip .. "[NEWLINE]";
		end
		
		strCultureToolTip = strCultureToolTip .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_CULTURE_FROM_SPECIALISTS", iCultureFromSpecialists);
	end
	
	-- Culture from Terrain
	local iCultureFromTerrain = pCity:GetJONSCulturePerTurnFromTerrain();
	if (iCultureFromTerrain ~= 0) then
		
		-- Spacing
		if (bFirst) then
			bFirst = false;
		else
			strCultureToolTip = strCultureToolTip .. "[NEWLINE]";
		end
		
		strCultureToolTip = strCultureToolTip .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_CULTURE_FROM_TERRAIN", iCultureFromTerrain);
	end

	-- Culture from Traits
	local iCultureFromTraits = pCity:GetJONSCulturePerTurnFromTraits();
	if (iCultureFromTraits ~= 0) then
		
		-- Spacing
		if (bFirst) then
			bFirst = false;
		else
			strCultureToolTip = strCultureToolTip .. "[NEWLINE]";
		end
		
		strCultureToolTip = strCultureToolTip .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_CULTURE_FROM_TRAITS", iCultureFromTraits);
	end
	
	-- Empire Culture modifier
	local iAmount = Players[pCity:GetOwner()]:GetCultureCityModifier();
	if (iAmount ~= 0) then
		strCultureToolTip = strCultureToolTip .. "[NEWLINE][NEWLINE]";
		strCultureToolTip = strCultureToolTip .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_CULTURE_PLAYER_MOD", iAmount);
	end
	
	-- City Culture modifier
	local iAmount = pCity:GetCultureRateModifier();
	if (iAmount ~= 0) then
		strCultureToolTip = strCultureToolTip .. "[NEWLINE][NEWLINE]";
		strCultureToolTip = strCultureToolTip .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_CULTURE_CITY_MOD", iAmount);
	end
	
	-- Culture Wonders modifier
	if (pCity:GetNumWorldWonders() > 0) then
		iAmount = Players[pCity:GetOwner()]:GetCultureWonderMultiplier();
		
		if (iAmount ~= 0) then
			strCultureToolTip = strCultureToolTip .. "[NEWLINE][NEWLINE]";
			strCultureToolTip = strCultureToolTip .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_CULTURE_WONDER_BONUS", iAmount);
		end
	end
	
	-- Tile growth
	local iCulturePerTurn = pCity:GetJONSCulturePerTurn();
	local iCultureStored = pCity:GetJONSCultureStored();
	local iCultureNeeded = pCity:GetJONSCultureThreshold();

	strCultureToolTip = strCultureToolTip .. "[NEWLINE][NEWLINE]";
	strCultureToolTip = strCultureToolTip .. Locale.ConvertTextKey("TXT_KEY_CULTURE_INFO", iCultureStored, iCultureNeeded);
	
	if iCulturePerTurn > 0 then
		local iCultureDiff = iCultureNeeded - iCultureStored;
		local iCultureTurns = math.ceil(iCultureDiff / iCulturePerTurn);
		strCultureToolTip = strCultureToolTip .. " " .. Locale.ConvertTextKey("TXT_KEY_CULTURE_TURNS", iCultureTurns);
	end
	
	return strCultureToolTip;
end

-- Yield Tooltip Helper
function GetYieldTooltipHelper(pCity, iYieldType, strIcon)
	
	local strModifiers = "";
	
	-- Base Yield
	local iBaseYield = pCity:GetBaseYieldRate(iYieldType);

	local iYieldPerPop = pCity:GetYieldPerPopTimes100(iYieldType);
	if (iYieldPerPop ~= 0) then
		iYieldPerPop = iYieldPerPop * pCity:GetPopulation();
		iYieldPerPop = iYieldPerPop / 100;
		
		iBaseYield = iBaseYield + iYieldPerPop;
	end

	-- Total Yield
	local iTotalYield;
	
	-- Food is special
	if (iYieldType == YieldTypes.YIELD_FOOD) then
		iTotalYield = pCity:FoodDifferenceTimes100() / 100;
	else
		iTotalYield = pCity:GetYieldRateTimes100(iYieldType) / 100;
	end
	
	-- Yield modifiers string
	strModifiers = strModifiers .. pCity:GetYieldModifierTooltip(iYieldType);
	
	-- Build tooltip
	local strYieldToolTip = GetYieldTooltip(pCity, iYieldType, iBaseYield, iTotalYield, strIcon, strModifiers);
	
	return strYieldToolTip;

end


------------------------------
-- Helper function to build yield tooltip string
function GetYieldTooltip(pCity, iYieldType, iBase, iTotal, strIconString, strModifiersString)
	
	local strYieldBreakdown = "";
	
	-- Base Yield from terrain
	local iYieldFromTerrain = pCity:GetBaseYieldRateFromTerrain(iYieldType);
	if (iYieldFromTerrain ~= 0) then
		strYieldBreakdown = strYieldBreakdown .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_YIELD_FROM_TERRAIN", iYieldFromTerrain, strIconString);
		strYieldBreakdown = strYieldBreakdown .. "[NEWLINE]";
	end
	
	-- Base Yield from Buildings
	local iYieldFromBuildings = pCity:GetBaseYieldRateFromBuildings(iYieldType);
	if (iYieldFromBuildings ~= 0) then
		strYieldBreakdown = strYieldBreakdown .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_YIELD_FROM_BUILDINGS", iYieldFromBuildings, strIconString);
		strYieldBreakdown = strYieldBreakdown .. "[NEWLINE]";
	end
	
	-- Base Yield from Specialists
	local iYieldFromSpecialists = pCity:GetBaseYieldRateFromSpecialists(iYieldType);
	if (iYieldFromSpecialists ~= 0) then
		strYieldBreakdown = strYieldBreakdown .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_YIELD_FROM_SPECIALISTS", iYieldFromSpecialists, strIconString);
		strYieldBreakdown = strYieldBreakdown .. "[NEWLINE]";
	end
	
	-- Base Yield from Misc
	local iYieldFromMisc = pCity:GetBaseYieldRateFromMisc(iYieldType);
	if (iYieldFromMisc ~= 0) then
		if (iYieldType == YieldTypes.YIELD_SCIENCE) then
			strYieldBreakdown = strYieldBreakdown .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_YIELD_FROM_POP", iYieldFromMisc, strIconString);
		else
			strYieldBreakdown = strYieldBreakdown .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_YIELD_FROM_MISC", iYieldFromMisc, strIconString);
		end
		strYieldBreakdown = strYieldBreakdown .. "[NEWLINE]";
	end
	
	-- Base Yield from Pop
	local iYieldPerPop = pCity:GetYieldPerPopTimes100(iYieldType);
	if (iYieldPerPop ~= 0) then
		local iYieldFromPop = iYieldPerPop * pCity:GetPopulation();
		iYieldFromPop = iYieldFromPop / 100;
		
		strYieldBreakdown = strYieldBreakdown .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_YIELD_FROM_POP_EXTRA", iYieldFromPop, strIconString);
		strYieldBreakdown = strYieldBreakdown .. "[NEWLINE]";
	end
	
	local strExtraBaseString = "";
	
	-- Food eaten by pop
	local iYieldEaten = 0;
	if (iYieldType == YieldTypes.YIELD_FOOD) then
		iYieldEaten = pCity:FoodConsumption(true, 0);
		if (iYieldEaten ~= 0) then
			--strModifiers = strModifiers .. "[NEWLINE]";
			--strModifiers = strModifiers .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_YIELD_EATEN_BY_POP", iYieldEaten, "[ICON_FOOD]");
			--strModifiers = strModifiers .. "[NEWLINE]----------------[NEWLINE]";
			
			strExtraBaseString = strExtraBaseString .. "   " .. Locale.ConvertTextKey("TXT_KEY_FOOD_USAGE", iBase, iYieldEaten);
			
			local iFoodSurplus = pCity:GetYieldRate(YieldTypes.YIELD_FOOD) - iYieldEaten;
			iBase = iFoodSurplus;
			
			--if (iFoodSurplus >= 0) then
				--strModifiers = strModifiers .. Locale.ConvertTextKey("TXT_KEY_YIELD_AFTER_EATEN", iFoodSurplus, "[ICON_FOOD]");
			--else
				--strModifiers = strModifiers .. Locale.ConvertTextKey("TXT_KEY_YIELD_AFTER_EATEN_NEGATIVE", iFoodSurplus, "[ICON_FOOD]");
			--end
		end
	end
	
	local strTotal;
	if (iTotal >= 0) then
		strTotal = Locale.ConvertTextKey("TXT_KEY_YIELD_TOTAL", iTotal, strIconString);
	else
		strTotal = Locale.ConvertTextKey("TXT_KEY_YIELD_TOTAL_NEGATIVE", iTotal, strIconString);
	end
	
	strYieldBreakdown = strYieldBreakdown .. "----------------";
	
	-- Build combined string
	if (iBase ~= iTotal or strExtraBaseString ~= "") then
		local strBase = Locale.ConvertTextKey("TXT_KEY_YIELD_BASE", iBase, strIconString) .. strExtraBaseString;
		strYieldBreakdown = strYieldBreakdown .. "[NEWLINE]" .. strBase;
	end
	
	-- Modifiers
	if (strModifiersString ~= "") then
		strYieldBreakdown = strYieldBreakdown .. "[NEWLINE]----------------" .. strModifiersString .. "[NEWLINE]----------------";
	end
	strYieldBreakdown = strYieldBreakdown .. "[NEWLINE]" .. strTotal;
	
	return strYieldBreakdown;

end


----------------------------------------------------------------        
-- MOOD INFO
----------------------------------------------------------------        
function GetMoodInfo(iOtherPlayer)
	
	local strInfo = "";
	
	-- Always war!
	if (Game.IsOption(GameOptionTypes.GAMEOPTION_ALWAYS_WAR)) then
		return "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_ALWAYS_WAR_TT");
	end
	
	local iActivePlayer = Game.GetActivePlayer();
	local pActivePlayer = Players[iActivePlayer];
	local pActiveTeam = Teams[pActivePlayer:GetTeam()];
	local pOtherPlayer = Players[iOtherPlayer];
	local iOtherTeam = pOtherPlayer:GetTeam();
	
	local iVisibleApproach = Players[iActivePlayer]:GetApproachTowardsUsGuess(iOtherPlayer);
	
	-- At war right now
	if (pActiveTeam:IsAtWar(iOtherTeam)) then
		strInfo = strInfo .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_DIPLO_AT_WAR") .. "[NEWLINE]";
		
	-- Not at war right now
	else
		
		-- We've fought before
		if (pActivePlayer:GetNumWarsFought(iOtherPlayer) > 0) then
			-- They don't appear to be mad
			if (iVisibleApproach == MajorCivApproachTypes.MAJOR_CIV_APPROACH_FRIENDLY or 
				iVisibleApproach == MajorCivApproachTypes.MAJOR_CIV_APPROACH_NEUTRAL) then
				strInfo = strInfo .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_DIPLO_PAST_WAR_NEUTRAL") .. "[NEWLINE]";
			-- They aren't happy with us
			else
				strInfo = strInfo .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_DIPLO_PAST_WAR_BAD") .. "[NEWLINE]";
			end
		end
		
	end
	
	-- Good things
	if (pActivePlayer:IsDoF(iOtherPlayer)) then
		strInfo = strInfo .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_DIPLO_DOF") .. "[NEWLINE]";
	end
	if (pActivePlayer:IsPlayerDoFwithAnyFriend(iOtherPlayer)) then		-- Human has a mutual friend with the AI
		strInfo = strInfo .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_DIPLO_MUTUAL_DOF") .. "[NEWLINE]";
	end
	if (pActivePlayer:IsPlayerDenouncedEnemy(iOtherPlayer)) then		-- Human has denounced an enemy of the AI
		strInfo = strInfo .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_DIPLO_MUTUAL_ENEMY") .. "[NEWLINE]";
	end
	if (pOtherPlayer:GetNumCiviliansReturnedToMe(iActivePlayer) > 0) then
		strInfo = strInfo .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_DIPLO_CIVILIANS_RETURNED") .. "[NEWLINE]";
	end
	
	-- Neutral things
	if (iVisibleApproach == MajorCivApproachTypes.MAJOR_CIV_APPROACH_AFRAID) then
		strInfo = strInfo .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_DIPLO_AFRAID") .. "[NEWLINE]";
	end
	
	-- Bad things
	if (pOtherPlayer:IsFriendDeclaredWarOnUs(iActivePlayer)) then		-- Human was a friend and declared war on us
		strInfo = strInfo .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_DIPLO_HUMAN_FRIEND_DECLARED_WAR") .. "[NEWLINE]";
	end
	if (pOtherPlayer:IsFriendDenouncedUs(iActivePlayer)) then			-- Human was a friend and denounced us
		strInfo = strInfo .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_DIPLO_HUMAN_FRIEND_DENOUNCED") .. "[NEWLINE]";
	end
	if (pActivePlayer:GetWeDeclaredWarOnFriendCount() > 0) then		-- Human declared war on friends
		strInfo = strInfo .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_DIPLO_HUMAN_DECLARED_WAR_ON_FRIENDS") .. "[NEWLINE]";
	end
	if (pActivePlayer:GetWeDenouncedFriendCount() > 0) then			-- Human has denounced his friends
		strInfo = strInfo .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_DIPLO_HUMAN_DENOUNCED_FRIENDS") .. "[NEWLINE]";
	end
	if (pActivePlayer:GetNumFriendsDenouncedBy() > 0) then			-- Human has been denounced by friends
		strInfo = strInfo .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_DIPLO_HUMAN_DENOUNCED_BY_FRIENDS") .. "[NEWLINE]";
	end
	if (pActivePlayer:IsDenouncedPlayer(iOtherPlayer)) then
		strInfo = strInfo .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_DIPLO_DENOUNCED_BY_US") .. "[NEWLINE]";
	end
	if (pOtherPlayer:IsDenouncedPlayer(iActivePlayer)) then
		strInfo = strInfo .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_DIPLO_DENOUNCED_BY_THEM") .. "[NEWLINE]";
	end
	if (pOtherPlayer:IsPlayerDoFwithAnyEnemy(iActivePlayer)) then
		strInfo = strInfo .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_DIPLO_HUMAN_DOF_WITH_ENEMY") .. "[NEWLINE]";
	end
	if (pOtherPlayer:IsPlayerDenouncedFriend(iActivePlayer)) then
		strInfo = strInfo .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_DIPLO_HUMAN_DENOUNCED_FRIEND") .. "[NEWLINE]";
	end
	if (pOtherPlayer:IsPlayerNoSettleRequestEverAsked(iActivePlayer)) then
		strInfo = strInfo .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_DIPLO_NO_SETTLE_ASKED") .. "[NEWLINE]";
	end
	if (pOtherPlayer:IsDemandEverMade(iActivePlayer)) then
		strInfo = strInfo .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_DIPLO_TRADE_DEMAND") .. "[NEWLINE]";
	end
	if (pOtherPlayer:GetNumTimesCultureBombed(iActivePlayer) > 0) then
		strInfo = strInfo .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_DIPLO_CULTURE_BOMB") .. "[NEWLINE]";
	end
	if (pOtherPlayer:IsPlayerBrokenMilitaryPromise(iActivePlayer)) then
		strInfo = strInfo .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_DIPLO_MILITARY_PROMISE") .. "[NEWLINE]";
	end
	if (pOtherPlayer:IsPlayerIgnoredMilitaryPromise(iActivePlayer)) then
		strInfo = strInfo .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_DIPLO_MILITARY_PROMISE_IGNORED") .. "[NEWLINE]";
	end
	if (pOtherPlayer:IsPlayerBrokenExpansionPromise(iActivePlayer)) then
		strInfo = strInfo .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_DIPLO_EXPANSION_PROMISE") .. "[NEWLINE]";
	end
	if (pOtherPlayer:IsPlayerIgnoredExpansionPromise(iActivePlayer)) then
		strInfo = strInfo .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_DIPLO_EXPANSION_PROMISE_IGNORED") .. "[NEWLINE]";
	end
	if (pOtherPlayer:IsPlayerBrokenBorderPromise(iActivePlayer)) then
		strInfo = strInfo .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_DIPLO_BORDER_PROMISE") .. "[NEWLINE]";
	end
	if (pOtherPlayer:IsPlayerIgnoredBorderPromise(iActivePlayer)) then
		strInfo = strInfo .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_DIPLO_BORDER_PROMISE_IGNORED") .. "[NEWLINE]";
	end
	if (pOtherPlayer:IsPlayerBrokenCityStatePromise(iActivePlayer)) then
		strInfo = strInfo .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_DIPLO_CITY_STATE_PROMISE") .. "[NEWLINE]";
	end
	if (pOtherPlayer:IsPlayerIgnoredCityStatePromise(iActivePlayer)) then
		strInfo = strInfo .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_DIPLO_CITY_STATE_PROMISE_IGNORED") .. "[NEWLINE]";
	end
	if (pOtherPlayer:IsPlayerBrokenCoopWarPromise(iActivePlayer)) then
		strInfo = strInfo .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_DIPLO_COOP_WAR_PROMISE") .. "[NEWLINE]";
	end
	if (pOtherPlayer:IsPlayerRecklessExpander(iActivePlayer)) then
		strInfo = strInfo .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_DIPLO_RECKLESS_EXPANDER") .. "[NEWLINE]";
	end
	if (pOtherPlayer:GetNumRequestsRefused(iActivePlayer) > 0) then
		strInfo = strInfo .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_DIPLO_REFUSED_REQUESTS") .. "[NEWLINE]";
	end
	if (pOtherPlayer:GetRecentTradeValue(iActivePlayer) > 0) then
		strInfo = strInfo .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_DIPLO_TRADE_PARTNER") .. "[NEWLINE]";	
	end
	if (pOtherPlayer:GetCommonFoeValue(iActivePlayer) > 0) then
		strInfo = strInfo .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_DIPLO_COMMON_FOE") .. "[NEWLINE]";	
	end
	if (pOtherPlayer:GetRecentAssistValue(iActivePlayer) > 0) then
		strInfo = strInfo .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_DIPLO_ASSISTANCE_TO_THEM") .. "[NEWLINE]";	
	end	
	if (pOtherPlayer:IsLiberatedCapital(iActivePlayer)) then
		strInfo = strInfo .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_DIPLO_LIBERATED_CAPITAL") .. "[NEWLINE]";	
	end
	if (pOtherPlayer:IsLiberatedCity(iActivePlayer)) then
		strInfo = strInfo .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_DIPLO_LIBERATED_CITY") .. "[NEWLINE]";	
	end	
	if (pOtherPlayer:IsGaveAssistanceTo(iActivePlayer)) then
		strInfo = strInfo .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_DIPLO_ASSISTANCE_FROM_THEM") .. "[NEWLINE]";	
	end		
	if (pOtherPlayer:IsHasPaidTributeTo(iActivePlayer)) then
		strInfo = strInfo .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_DIPLO_PAID_TRIBUTE") .. "[NEWLINE]";	
	end	
	if (pOtherPlayer:IsNukedBy(iActivePlayer)) then
		strInfo = strInfo .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_DIPLO_NUKED") .. "[NEWLINE]";	
	end		
	if (pOtherPlayer:IsCapitalCapturedBy(iActivePlayer)) then
		strInfo = strInfo .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_DIPLO_CAPTURED_CAPITAL") .. "[NEWLINE]";	
	end	

	-- Protected Minors
	if (pOtherPlayer:GetOtherPlayerNumProtectedMinorsKilled(iActivePlayer) > 0) then
		strInfo = strInfo .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_DIPLO_PROTECTED_MINORS_KILLED") .. "[NEWLINE]";
	-- Only worry about protected minors ATTACKED if they haven't KILLED any
	else
		if (pOtherPlayer:GetOtherPlayerNumProtectedMinorsAttacked(iActivePlayer) > 0) then
			strInfo = strInfo .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_DIPLO_PROTECTED_MINORS_ATTACKED") .. "[NEWLINE]";
		end
	end
	
	--local iActualApproach = pOtherPlayer:GetMajorCivApproach(iActivePlayer)
	
	-- Bad things we don't want visible if someone is friendly (acting or truthfully)
	if (iVisibleApproach ~= MajorCivApproachTypes.MAJOR_CIV_APPROACH_FRIENDLY) then-- and
		--iActualApproach ~= MajorCivApproachTypes.MAJOR_CIV_APPROACH_DECEPTIVE) then
		if (pOtherPlayer:GetLandDisputeLevel(iActivePlayer) > DisputeLevelTypes.DISPUTE_LEVEL_NONE) then
			strInfo = strInfo .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_DIPLO_LAND_DISPUTE") .. "[NEWLINE]";
		end
		if (pOtherPlayer:GetVictoryDisputeLevel(iActivePlayer) > DisputeLevelTypes.DISPUTE_LEVEL_NONE) then
			strInfo = strInfo .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_DIPLO_VICTORY_DISPUTE") .. "[NEWLINE]";
		end
		if (pOtherPlayer:GetWonderDisputeLevel(iActivePlayer) > DisputeLevelTypes.DISPUTE_LEVEL_NONE) then
			strInfo = strInfo .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_DIPLO_WONDER_DISPUTE") .. "[NEWLINE]";
		end
		if (pOtherPlayer:GetMinorCivDisputeLevel(iActivePlayer) > DisputeLevelTypes.DISPUTE_LEVEL_NONE) then
			strInfo = strInfo .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_DIPLO_MINOR_CIV_DISPUTE") .. "[NEWLINE]";
		end
		if (pOtherPlayer:GetWarmongerThreat(iActivePlayer) > ThreatTypes.THREAT_NONE) then
			strInfo = strInfo .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_DIPLO_WARMONGER_THREAT") .. "[NEWLINE]";
		end
	end
	
	--  No specific events - let's see what string we should use
	if (strInfo == "") then
		
		-- Appears Friendly
		if (iVisibleApproach == MajorCivApproachTypes.MAJOR_CIV_APPROACH_FRIENDLY) then
			strInfo = strInfo .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_DIPLO_FRIENDLY");
		-- Appears Guarded
		elseif (iVisibleApproach == MajorCivApproachTypes.MAJOR_CIV_APPROACH_GUARDED) then
			strInfo = strInfo .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_DIPLO_GUARDED");
		-- Appears Hostile
		elseif (iVisibleApproach == MajorCivApproachTypes.MAJOR_CIV_APPROACH_HOSTILE) then
			strInfo = strInfo .. "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_DIPLO_HOSTILE");
		-- Neutral - default string
		else
			strInfo = "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_DIPLO_DEFAULT_STATUS");
		end
	end
	
	-- Remove extra newline off the end if we have one
	if (Locale.EndsWith(strInfo, "[NEWLINE]")) then
		local iNewLength = Locale.Length(strInfo)-9;
		strInfo = Locale.Substring(strInfo, 1, iNewLength);
	end
	
	return strInfo;
	
end
