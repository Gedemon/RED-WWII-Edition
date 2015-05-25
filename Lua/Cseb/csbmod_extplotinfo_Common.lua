--
-- Common logic used by both plot info panels
-- Author: csebal
--

include ( "csbmod_Common_PlotHelpers" );
include ( "RedOverrideInclude" );

-------------------------------------------------
-- Returns general unit / military information
-- about a plot
-------------------------------------------------
function GetUnitsString(pPlot)
	local strResult = "";

	local iActiveTeam = Game.GetActiveTeam();
	local pTeam = Teams[iActiveTeam];
	local bIsDebug = Game.IsDebugMode();
	local bFirstEntry = true;
	
	-- Loop through all units
	local numUnits = pPlot:GetNumUnits();
	for i = 0, numUnits do
		
		local unit = pPlot:GetUnit(i);
		if (unit ~= nil and not unit:IsInvisible(iActiveTeam, bIsDebug)) then

			if (bFirstEntry) then
				bFirstEntry = false;
			else
				strResult = strResult .. "[NEWLINE]";
			end

			local strength = 0;
			strength = unit:GetBaseCombatStrength();
		
			local pPlayer = Players[unit:GetOwner()];
			
			-- Unit Name
			local strUnitName = unit:GetNameKey();
			local convertedKey = Locale.ConvertTextKey(strUnitName);
			--local convertedKey = unit:GetName();
			--convertedKey = Locale.ToUpper(convertedKey);
			
			-- Player using nickname
			--if (pPlayer:GetNickName() ~= nil and pPlayer:GetNickName() ~= "") then
			--	strResult = strResult .. Locale.ConvertTextKey("TXT_KEY_MULTIPLAYER_UNIT_TT", pPlayer:GetNickName(), Locale.ConvertTextKey(pPlayer:GetCivilizationAdjectiveKey()), convertedKey);
			-- Use civ short description
			--else
				strResult = strResult .. Locale.ConvertTextKey("TXT_KEY_PLOTROLL_UNIT_DESCRIPTION_CIV", pPlayer:GetCivilizationAdjectiveKey(), convertedKey);
			--end
			
			local unitTeam = unit:GetTeam();
			if iActiveTeam == unitTeam then
				strResult = "[COLOR_WHITE]" .. strResult .. "[ENDCOLOR]";
			elseif pTeam:IsAtWar(unitTeam) then
				strResult = "[COLOR_NEGATIVE_TEXT]" .. strResult .. "[ENDCOLOR]";
			--else
			--	strResult = "[COLOR_POSITIVE_TEXT]" .. strResult .. "[ENDCOLOR]";
			end
			
			-- Debug stuff
			if (OptionsManager:IsDebugMode()) then
				strResult = strResult .. " ("..tostring(unit:GetOwner()).." - " .. tostring(unit:GetID()) .. ")";
			end
			
			-- Unit Class
			--local unitClassType = Locale.ConvertTextKey(GameInfo.UnitClasses[unit:GetUnitClassType()].Description)
			--strResult = strResult .. ", ".. unitClassType

			-- Combat strength
			if (strength > 0) then
				strResult = strResult .. ", " .. unit:GetBaseCombatStrength() .."[ICON_STRENGTH]";
			end
			
			-- Hit Points
			--if (unit:GetDamage() > 0) then
			--	strResult = strResult .. ", " .. Locale.ConvertTextKey("TXT_KEY_PLOTROLL_UNIT_HP", unit:GetMaxHitPoints() - unit:GetDamage());
			--end
			
			-- Embarked?
			--if (unit:IsEmbarked()) then
			--	strResult = strResult .. ", " .. Locale.ConvertTextKey( "TXT_KEY_PLOTROLL_EMBARKED" );
			--end
			
			-- Building something?
			--if (unit:GetBuildType() ~= -1) then
				--strResult = strResult .. ", " .. Locale.ConvertTextKey(GameInfo.Builds[unit:GetBuildType()].Description);
			--end
			
			if unit:FortifyModifier() > 0 then
				local leftToMax = math.max(0, GameDefines.MAX_FORTIFY_TURNS - unit:GetFortifyTurns())
				strResult = strResult .. "[NEWLINE]" .. Locale.ConvertTextKey("TXT_KEY_HOVERINFO_FORTIFIED", unit:FortifyModifier(), leftToMax);
			end

		end			
	end	
	
	return strResult;

end

-------------------------------------------------
-- Returns general city / owner information
-- about a plot
-------------------------------------------------
function GetOwnerString(pPlot)
	local strResult = "";
	
	local iActiveTeam = Game.GetActiveTeam();
	local pTeam = Teams[iActiveTeam];
	local bIsDebug = Game.IsDebugMode();
	
	if DEBUG_SHOW_PLOT_XY then
		strResult = strResult .. "Debug : Plot (".. pPlot:GetX() .."," .. pPlot:GetY()..")[NEWLINE]"
	end

	-- old owner
	plotKey = GetPlotKey ( pPlot )
	firstOwner = GetPlotFirstOwner( plotKey )
	if (firstOwner ~= -1) and (firstOwner ~= pPlot:GetOwner()) then
		local strAdjective = Players[firstOwner]:GetCivilizationAdjective()
		strResult = strResult .. "Captured ".. strAdjective .." territory[NEWLINE]"
	end


	-- City here?
	if (pPlot:IsCity()) then
		
		local pCity = pPlot:GetPlotCity();
		local strAdjectiveKey = Players[pCity:GetOwner()]:GetCivilizationAdjectiveKey();
		
		strResult = strResult .. Locale.ConvertTextKey("TXT_KEY_CITY_OF", strAdjectiveKey, pCity:GetName());
		
	-- No city, see if this plot is just owned
	else
		
		-- Plot owner
		local iOwner = pPlot:GetOwner();
		
		if (iOwner >= 0) then
			local pPlayer = Players[iOwner];
			
			strResult = strResult .. Locale.ConvertTextKey("TXT_KEY_PLOTROLL_OWNED_CIV", pPlayer:GetCivilizationShortDescriptionKey());

			local iActiveTeam = Game.GetActiveTeam();
			local plotTeam = pPlayer:GetTeam();
			if iActiveTeam == plotTeam then
				strResult = "[COLOR_WHITE]" .. strResult .. "[ENDCOLOR]";
			elseif pTeam:IsAtWar(plotTeam) then
				strResult = "[COLOR_NEGATIVE_TEXT]" .. strResult .. "[ENDCOLOR]";
			else
				strResult = "[COLOR_POSITIVE_TEXT]" .. strResult .. "[ENDCOLOR]";
			end
		end
	end
	
	return strResult;
end

-------------------------------------------------
-- Returns general terrain information
-- about a plot
-------------------------------------------------
function GetNatureString(pPlot)	
	local strResult = ""; -- result string	
	local bFirst = true; -- differentiate betweent he first and subsequent entries in the nature line		
	local bMountain = false; -- mountains and special features (natural wonders) do not display base pPlot type.

	local iFeature = pPlot:GetFeatureType(); -- Get the feature on the pPlot

	-- Features
	if (iFeature > -1) then -- if there is a feature on the pPlot
		if (bFirst) then
			bFirst = false;
		else
			strResult = strResult .. ", ";
		end
			
		-- Block terrian type below natural wonders
		if (GameInfo.Features[iFeature].NaturalWonder) then
			bMountain = true;
		end
									
		strResult = strResult .. csebPlotHelpers_GetPlotFeatureName(pPlot);
	else 
		-- Mountain
		if (pPlot:IsMountain()) then
			if (bFirst) then
				bFirst = false;
			else
				strResult = strResult .. ", ";
			end
				
			bMountain = true;
				
			strResult = strResult .. Locale.ConvertTextKey( "TXT_KEY_PLOTROLL_MOUNTAIN" );
		end
	end
	-- Terrain
	if (not bMountain) then -- we do not display base terrain for mountain type features
		if (bFirst) then
			bFirst = false;
		else
			strResult = strResult .. ", ";
		end
			
		local convertedKey;
			
		-- Lake?
		if (pPlot:IsLake()) then
			convertedKey = Locale.ConvertTextKey( "TXT_KEY_PLOTROLL_LAKE" );
		else
			convertedKey = Locale.ConvertTextKey(GameInfo.Terrains[pPlot:GetTerrainType()].Description);		
		end
			
		strResult = strResult .. convertedKey;
	end
	-- Hills
	if (pPlot:IsHills()) then
		if (bFirst) then
			bFirst = false;
		else
			strResult = strResult .. ", ";
		end
		
		strResult = strResult .. Locale.ConvertTextKey( "TXT_KEY_PLOTROLL_HILL" );
	end
	-- River
	if (pPlot:IsRiver()) then
		if (bFirst) then
			bFirst = false;
		else
			strResult = strResult .. ", ";
		end
		
		strResult = strResult .. Locale.ConvertTextKey( "TXT_KEY_PLOTROLL_RIVER" );
	end
	-- Fresh Water
	if (pPlot:IsFreshWater()) then
		strResult = strResult .. " ([COLOR_POSITIVE_TEXT]" .. Locale.ConvertTextKey( "TXT_KEY_PLOTROLL_FRESH_WATER" ) .. "[ENDCOLOR])";
	end
	
	return strResult;	
end

-------------------------------------------------
-- Returns general improvement information
-- about a plot
-------------------------------------------------
function GetImprovementString(pPlot)

	local strResult = ""; -- result string		
	local iActiveTeam = Game.GetActiveTeam(); -- the ID of the currently active team
	local pTeam = Teams[iActiveTeam]; -- the currently active team

	-- add the improvement already built on this plot
	local iImprovementType = pPlot:GetRevealedImprovementType(iActiveTeam, false); -- get improvement on the pPlot
	if (iImprovementType >= 0) then -- if there is an improvement, display it
		if (strResult ~= "") then
			strResult = strResult .. ", ";
		end

		local convertedKey = Locale.ConvertTextKey(GameInfo.Improvements[iImprovementType].Description);		
		strResult = strResult .. convertedKey;

		-- <<<<< RED
		if MapModData.RED.DynamicMap[plotKey] and MapModData.RED.DynamicMap[plotKey].ImprovementDamage > 0 then
			if pPlot:IsImprovementPillaged() then
				local destroyedPercent = Round((MapModData.RED.DynamicMap[plotKey].ImprovementDamage-IMPROVEMENT_DAMAGED_THRESHOLD) / (IMPROVEMENT_MAX_DAMAGE-IMPROVEMENT_DAMAGED_THRESHOLD) * 100)
				local turnsToRepair = Round((MapModData.RED.DynamicMap[plotKey].ImprovementDamage-IMPROVEMENT_DAMAGED_THRESHOLD) / IMPROVEMENT_REPAIR_PER_TURN)
				strResult = strResult .. "[COLOR_WARNING_TEXT](" .. tostring(destroyedPercent) .. "% destroyed - repaired in ".. tostring(turnsToRepair) .. " turns)[ENDCOLOR]";
			else
				local damagedPercent = Round(MapModData.RED.DynamicMap[plotKey].ImprovementDamage / IMPROVEMENT_DAMAGED_THRESHOLD * 100)
				strResult = strResult .. "[COLOR_PLAYER_ORANGE_TEXT](" .. tostring(damagedPercent) .. "% damaged)[ENDCOLOR]";
			end
		-- RED >>>>>
		elseif pPlot:IsImprovementPillaged() then -- add text, when it is pillaged.
			strResult = strResult .. "[COLOR_WARNING_TEXT]" .. Locale.ConvertTextKey("TXT_KEY_PLOTROLL_PILLAGED") .. "[ENDCOLOR]";
		end
		
	end

	-- add the improvement being built on this plot
	for pBuildInfo in GameInfo.Builds() do -- iterate through all the possible worker actions
		local iTurnsLeft = pPlot:GetBuildTurnsLeft(pBuildInfo.ID, 0, 0);
		-- only process if it is an imprvement type and actually has turns left
		if (pBuildInfo.ImprovementType and iTurnsLeft < 4000 and iTurnsLeft > 0) then
			-- only process it, if it isnt already built
			if (GameInfoTypes[ pBuildInfo.ImprovemenType ] ~= iImprovementType) then
				if (strResult ~= "") then
					strResult = strResult .. ", ";
				end

				local convertedKey = Locale.ConvertTextKey(GameInfo.Improvements[pBuildInfo.ImprovementType].Description);		
				strResult = strResult .. Locale.ConvertTextKey("TXT_KEY_CSB_PLOTROLL_IMPROVEMENT_UNDER_CONSTRUCTION", convertedKey, iTurnsLeft);
			end
		end
	end

	-- add the route already built on this plot
	local iRouteType = pPlot:GetRevealedRouteType(iActiveTeam, false); -- get route type on pPlot
	if (iRouteType > -1) then -- if there is a route, display it
		if (strResult ~= "") then
			strResult = strResult .. ", ";
		end
		local convertedKey = Locale.ConvertTextKey(GameInfo.Routes[iRouteType].Description);		
		strResult = strResult .. convertedKey;
		
		-- <<<<< RED
		if MapModData.RED.DynamicMap[plotKey] and MapModData.RED.DynamicMap[plotKey].RouteDamage > 0 then
			if pPlot:IsRoutePillaged() then
				local destroyedPercent = Round((MapModData.RED.DynamicMap[plotKey].RouteDamage-IMPROVEMENT_DAMAGED_THRESHOLD) / (IMPROVEMENT_MAX_DAMAGE-IMPROVEMENT_DAMAGED_THRESHOLD) * 100)
				local turnsToRepair = Round((MapModData.RED.DynamicMap[plotKey].RouteDamage-IMPROVEMENT_DAMAGED_THRESHOLD) / IMPROVEMENT_REPAIR_PER_TURN)
				strResult = strResult .. "[COLOR_WARNING_TEXT](" .. tostring(destroyedPercent) .. "% destroyed - repaired in ".. tostring(turnsToRepair) .. " turns)[ENDCOLOR]";
			else
				local damagedPercent = Round(MapModData.RED.DynamicMap[plotKey].RouteDamage / IMPROVEMENT_DAMAGED_THRESHOLD * 100)
				strResult = strResult .. "[COLOR_PLAYER_ORANGE_TEXT](" .. tostring(damagedPercent) .. "% damaged)[ENDCOLOR]";
			end
		-- RED >>>>>
		elseif (pPlot:IsRoutePillaged()) then
			strResult = strResult .."[COLOR_WARNING_TEXT]" .. Locale.ConvertTextKey("TXT_KEY_PLOTROLL_PILLAGED") .. "[ENDCOLOR]";
		end
	end

	-- add the route being built on this plot
	for pBuildInfo in GameInfo.Builds() do -- iterate through all the possible worker actions
		local iTurnsLeft = pPlot:GetBuildTurnsLeft(pBuildInfo.ID, 0, 0);
		-- only process if it is an imprvement type and actually has turns left
		if (pBuildInfo.RouteType and iTurnsLeft < 4000 and iTurnsLeft > 0) then
			-- only process it, if it isnt already built
			if (GameInfoTypes[pBuildInfo.RouteType] ~= iRouteType) then

				if (strResult ~= "") then
					strResult = strResult .. ", ";
				end

				local convertedKey = Locale.ConvertTextKey(GameInfo.Routes[pBuildInfo.RouteType].Description);		
				strResult = strResult .. Locale.ConvertTextKey("TXT_KEY_CSB_PLOTROLL_IMPROVEMENT_UNDER_CONSTRUCTION", convertedKey, iTurnsLeft);
			end
		end
	end
	
	return strResult;
end

-------------------------------------------------
-- Returns quests / tasks given by minor civs
-- if they are related to this plot
-------------------------------------------------
function GetCivStateQuestString(pPlot, bShortVersion)
	local strResult = "";  -- result string	
	local iActivePlayer = Game.GetActivePlayer(); -- the ID of the currently active player
	local iActiveTeam = Game.GetActiveTeam(); -- the ID of the currently active team
	local pTeam = Teams[iActiveTeam]; -- the currently active team
	
	for iPlayerLoop = GameDefines.MAX_MAJOR_CIVS, GameDefines.MAX_CIV_PLAYERS-1, 1 do -- cycle through other players
		pOtherPlayer = Players[iPlayerLoop]; -- the ID of the other player
		iOtherTeam = pOtherPlayer:GetTeam(); -- the ID of the other player's team
			
		if( pOtherPlayer:IsMinorCiv() and iActiveTeam ~= iOtherTeam and pOtherPlayer:IsAlive() and pTeam:IsHasMet( iOtherTeam ) ) then
			-- if the other player is a minor civ, not the currently active player, is still in the game and is in contact with us
			local iQuest      = pOtherPlayer:GetActiveQuestForPlayer(iActivePlayer); -- get quests for the current player
			local iQuestData1 = pOtherPlayer:GetQuestData1(iActivePlayer); -- get quest data (x coord of quest location)
			local iQuestData2 = pOtherPlayer:GetQuestData2(iActivePlayer); -- get quest data (y coord of quest location)
			
			if (iQuest == MinorCivQuestTypes.MINOR_CIV_QUEST_KILL_CAMP and iQuestData1 == pPlot:GetX() and iQuestData2 == pPlot:GetY()) then
				if (strResult ~= "") then
					strResult = strResult .. "[NEWLINE]";
				end
				if (bShortVersion) then
					strResult =  "[COLOR_POSITIVE_TEXT]" .. Locale.ConvertTextKey("TXT_KEY_CITY_STATE_BARB_QUEST_SHORT") .. "[ENDCOLOR]";
				else				
					strResult = "[COLOR_POSITIVE_TEXT]" .. Locale.ConvertTextKey("TXT_KEY_CITY_STATE_BARB_QUEST_LONG",  pOtherPlayer:GetCivilizationShortDescriptionKey()) .. "[ENDCOLOR]";
				end
			end
		end
	end		
	
	return strResult;
end

-------------------------------------------------
-- Returns resource information for any resource
-- located on this plot
-------------------------------------------------
function GetResourceString(pPlot, bShortVersion)
	local strResult = ""; -- result string	
	local iActiveTeam = Game.GetActiveTeam(); -- the ID of the currently active team
	local pTeam = Teams[iActiveTeam]; -- the currently active team
	
	if (pPlot:GetResourceType(iActiveTeam) >= 0) then -- if there is a resource on this pPlot
		local resourceType = pPlot:GetResourceType(iActiveTeam); -- find the resource type
		local pResource = GameInfo.Resources[resourceType]; -- get the resource object
		
		if (pPlot:GetNumResource() > 1) then -- we leave this there for the odd chance they add quantified resources
			strResult = strResult .. tostring(pPlot:GetNumResource()*RESOURCE_PRODUCTION_FACTOR) .. " ";
		end
		
		-- Add the resource info to the line
		local convertedKey = Locale.ConvertTextKey(pResource.Description);		
		strResult = strResult .. pResource.IconString .. " " .. convertedKey;

		--[[
		-- Find the improvements that can improve this resource and list them
		local strImpList = csebPlotHelpers_GetImprovementListForResource(pPlot, pResource);
		if (strImpList ~= "") then
			strResult = strResult .. " " .. Locale.ConvertTextKey( "TXT_KEY_CSB_PLOTROLL_IMPROVEMENTS_REQUIRED_FOR_RESOURCE", strImpList );
		end
		--]]

		-- RED <<<<<
		if RESOURCE_CONNECTION == RESOURCE_OWNED_PLOTS then
			-- that's the simpliest case !
			strResult = strResult .. " (added each turn to your stock if this gisement is owned by you or your allies)"

		elseif	RESOURCE_CONNECTION == RESOURCE_ROAD_TO_CAPITAL then
			-- need road connection between the resource plot and the capital...
			strResult = strResult .. " (added each turn to your stock if this gisement is linked by roads or rails to your capital)"

		elseif	RESOURCE_CONNECTION == RESOURCE_RAILS_TO_CAPITAL then
			-- need rails connection between the resource plot and the capital...
			strResult = strResult .. " (added each turn to your stock if this gisement is linked by rails to your capital)"

		elseif	RESOURCE_CONNECTION == RESOURCE_ROAD_TO_ANY_CITY then
			-- need road connection between the resource plot and any city...
			strResult = strResult .. " (added each turn to your stock if this gisement is linked by roads or rails to one of your cities)"

		elseif	RESOURCE_CONNECTION == RESOURCE_RAILS_TO_ANY_CITY then
			-- need rails connection between the resource plot and any city...
			strResult = strResult .. " (added each turn to your stock if this gisement is linked by rails to one of your cities)"
		end
		-- RED >>>>>

		
		-- check to see if the player owns the neccessary technology for the resource and display a warning if he does not
		local iTechCityTrade = GameInfoTypes[pResource.TechCityTrade];
		if (iTechCityTrade ~= nil) then
			if (iTechCityTrade ~= -1 and not pTeam:GetTeamTechs():HasTech(iTechCityTrade)) then
				local techName = Locale.ConvertTextKey(GameInfo.Technologies[iTechCityTrade].Description);
				
				if (bShortVersion) then
					strResult = strResult .. "[NEWLINE]" .. Locale.ConvertTextKey( "TXT_KEY_PLOTROLL_REQUIRES_TECH", techName );
				else
					strResult = strResult .. "[NEWLINE]" .. Locale.ConvertTextKey( "TXT_KEY_PLOTROLL_REQUIRES_TECH_TO_USE", techName );
				end
			end
		end
	end
	
	return strResult;	
end

-------------------------------------------------
-- Returns various yield informations 
-- about the plot
-------------------------------------------------
function GetYieldLines(pPlot, bExpanded)
	local strResult = ""; -- result string

	-- get current plot yield
	local strCurrentYield = csebPlotHelpers_GetCurrentPlotYieldString(pPlot);

	-- get current plot yield
	strResult = strResult ..  Locale.ConvertTextKey("TXT_KEY_CSB_PLOTROLL_LABEL_YIELDS_ACTUAL", strCurrentYield);

	-- if the plot has a clearable feature, get the yield after clearing the feature
	local strPlotFeature = csebPlotHelpers_GetPlotFeatureName(pPlot);
	local strYieldWithoutFeature = csebPlotHelpers_GetYieldWithoutFeatureString(pPlot);

	local strExtraInfo = "";

	if (strYieldWithoutFeature ~= "") then
		strExtraInfo = strExtraInfo .. "[NEWLINE]" .. Locale.ConvertTextKey("TXT_KEY_CSB_PLOTROLL_LABEL_YIELDS_WITHOUTFEATURE", strPlotFeature, strYieldWithoutFeature);
	end

	-- list each item we can build on this plot, along with the yields they provide, if it differs from the base yield
	for pBuildInfo in GameInfo.Builds() do
		local strBuildName = "";
		
		if (pBuildInfo.ImprovementType ~= nil) then
			strBuildName = Locale.ConvertTextKey( GameInfo.Improvements[ pBuildInfo.ImprovementType ].Description );
		end
			
--		if (pBuildInfo.RouteType ~= nil) then
--			strBuildName = Locale.ConvertTextKey( GameInfo.Routes [ pBuildInfo.RouteType ].Description );
--		end
		
		if (strBuildName ~= "" and csebPlotHelpers_HasTechForBuild(pBuildInfo) and csebPlotHelpers_CanBeBuilt(pPlot, pBuildInfo)) then
			local strYieldWithBuild = csebPlotHelpers_GetPlotYieldWithBuild( pPlot, pBuildInfo.ID, true );
			if (strYieldWithBuild ~= "") then
				strExtraInfo = strExtraInfo .. "[NEWLINE]" .. Locale.ConvertTextKey("TXT_KEY_CSB_PLOTROLL_LABEL_YIELDS_WITHIMPROVEMENT", strBuildName, strYieldWithBuild);
			end
		end
	end

	if (bExpanded or strExtraInfo == "") then -- display expanded version, that also shows the yields
		strResult = strResult .. strExtraInfo;
	else
		strResult = strResult .. "[NEWLINE]" .. Locale.ConvertTextKey("TXT_KEY_CSB_PLOTROLL_HELP_PRESS_FOR_MORE");
	end

	return strResult;
end


-------------------------------------------------
-- Returns defensive bonuses / penalties 
-- for the plot
-------------------------------------------------
function GetPlotDefenseString(pPlot)
	local strResult = ""; -- result string
	local pPlayer = Players[pPlot:GetOwner()]
	local iDefensePlotTotal = 0
	if pPlayer then
		local iPlotTeam = pPlayer:GetTeam()
		iDefensePlotTotal = pPlot:DefenseModifier(iPlotTeam, true);
	else
		iDefensePlotTotal = pPlot:DefenseModifier(-1, true);
	end

	if (iDefensePlotTotal ~= 0) then
		strResult = Locale.ConvertTextKey("TXT_KEY_CSB_PLOTROLL_LABEL_DEFENSE_BLOCK_SIMPLE", iDefensePlotTotal)
	end

	return strResult;
end



