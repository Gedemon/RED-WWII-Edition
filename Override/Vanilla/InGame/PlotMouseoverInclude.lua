-------------------------------------------------
-------------------------------------------------
function GetCivStateQuestString(plot, bShortVersion)
	local resultStr = "";
	local iActivePlayer = Game.GetActivePlayer();
	local iActiveTeam = Game.GetActiveTeam();
	local pTeam = Teams[iActiveTeam];
	
	for iPlayerLoop = GameDefines.MAX_MAJOR_CIVS, GameDefines.MAX_CIV_PLAYERS-1, 1 do	
		pOtherPlayer = Players[iPlayerLoop];
		iOtherTeam = pOtherPlayer:GetTeam();
			
		if( pOtherPlayer:IsMinorCiv() and iActiveTeam ~= iOtherTeam and pOtherPlayer:IsAlive() and pTeam:IsHasMet( iOtherTeam ) ) then
			local iQuest      = pOtherPlayer:GetActiveQuestForPlayer(iActivePlayer);
			local iQuestData1 = pOtherPlayer:GetQuestData1(iActivePlayer);
			local iQuestData2 = pOtherPlayer:GetQuestData2(iActivePlayer);
			
			if (iQuest == MinorCivQuestTypes.MINOR_CIV_QUEST_KILL_CAMP and iQuestData1 == plot:GetX() and iQuestData2 == plot:GetY()) then
				if (bShortVersion) then
					resultStr =  "[COLOR_POSITIVE_TEXT]" .. Locale.ConvertTextKey("TXT_KEY_CITY_STATE_BARB_QUEST_SHORT") .. "[ENDCOLOR]";
				else
					if (resultStr ~= "") then
						resultStr = resultStr .. "[NEWLINE]";
					end
					
					resultStr = resultStr .. "[COLOR_POSITIVE_TEXT]" .. Locale.ConvertTextKey("TXT_KEY_CITY_STATE_BARB_QUEST_LONG",  pOtherPlayer:GetCivilizationShortDescriptionKey()) .. "[ENDCOLOR]";
				end
			end
		end
	end		
	
	return resultStr;
end

-------------------------------------------------
-------------------------------------------------
function GetNatureString(plot)
	
	local natureStr = "";
	
	local bFirst = true;
	
	local iFeature = plot:GetFeatureType();
	
	-- Some Features are handled in a special manner, since they always have the same terrain type under it
	if (IsFeatureSpecial(iFeature)) then
		if (bFirst) then
			bFirst = false;
		else
			natureStr = natureStr .. ", ";
		end
		
		local convertedKey = Locale.ConvertTextKey( GameInfo.Features[plot:GetFeatureType()].Description);
		natureStr = natureStr .. convertedKey;
		
	-- Not a jungle
	else
		
		local bMountain = false;
		
		-- Feature
		if (iFeature > -1) then
			if (bFirst) then
				bFirst = false;
			else
				natureStr = natureStr .. ", ";
			end
			
			-- Block terrian type below
			if (GameInfo.Features[plot:GetFeatureType()].NaturalWonder) then
				bMountain = true;
			end
			
			local convertedKey = Locale.ConvertTextKey( GameInfo.Features[plot:GetFeatureType()].Description);
			natureStr = natureStr .. convertedKey;
			
		-- No Feature
		else
			
			-- Mountain
			if (plot:IsMountain()) then
				if (bFirst) then
					bFirst = false;
				else
					natureStr = natureStr .. ", ";
				end
				
				bMountain = true;
				
				natureStr = natureStr .. Locale.ConvertTextKey( "TXT_KEY_PLOTROLL_MOUNTAIN" );
			end
			
		end
			
		-- Terrain
		if (not bMountain) then
			if (bFirst) then
				bFirst = false;
			else
				natureStr = natureStr .. ", ";
			end
			
			local convertedKey;
			
			-- Lake?
			if (plot:IsLake()) then
				convertedKey = Locale.ConvertTextKey( "TXT_KEY_PLOTROLL_LAKE" );
			else
				convertedKey = Locale.ConvertTextKey(GameInfo.Terrains[plot:GetTerrainType()].Description);		
			end
			
			natureStr = natureStr .. convertedKey;
		end
	end	-- End Feature hack
	
	-- Hills
	if (plot:IsHills()) then
		if (bFirst) then
			bFirst = false;
		else
			natureStr = natureStr .. ", ";
		end
		
		natureStr = natureStr .. Locale.ConvertTextKey( "TXT_KEY_PLOTROLL_HILL" );
	end

	-- River
	if (plot:IsRiver()) then
		if (bFirst) then
			bFirst = false;
		else
			natureStr = natureStr .. ", ";
		end
		
		natureStr = natureStr .. Locale.ConvertTextKey( "TXT_KEY_PLOTROLL_RIVER" );
	end
	
	return natureStr;
	
end


-------------------------------------------------
-------------------------------------------------
function IsFeatureSpecial(iFeature)
	
	if (iFeature == GameInfoTypes["FEATURE_JUNGLE"]) then
		return true;
	elseif (iFeature == GameInfoTypes["FEATURE_MARSH"]) then
		return true;
	elseif (iFeature == GameInfoTypes["FEATURE_OASIS"]) then
		return true;
	elseif (iFeature == GameInfoTypes["FEATURE_ICE"]) then
		return true;
	end
	
	return false;
	
end


-------------------------------------------------
-------------------------------------------------
function GetResourceString(plot, bLongForm)

	local improvementStr = "";
	
	local iActiveTeam = Game.GetActiveTeam();
	local pTeam = Teams[iActiveTeam];
	
	if (plot:GetResourceType(iActiveTeam) >= 0) then
		local resourceType = plot:GetResourceType(iActiveTeam);
		local pResource = GameInfo.Resources[resourceType];
		
		if (plot:GetNumResource() > 1) then
			improvementStr = improvementStr .. plot:GetNumResource() .. " ";
		end
		
		local convertedKey = Locale.ConvertTextKey(pResource.Description);		
		improvementStr = improvementStr .. pResource.IconString .. " " .. convertedKey;
		
		-- Resource Hookup info
		local iTechCityTrade = GameInfoTypes[pResource.TechCityTrade];
		if (iTechCityTrade ~= nil) then
			if (iTechCityTrade ~= -1 and not pTeam:GetTeamTechs():HasTech(iTechCityTrade)) then

				local techName = GameInfo.Technologies[iTechCityTrade].Description;
				if (bLongForm) then
					improvementStr = improvementStr .. " " .. Locale.ConvertTextKey( "TXT_KEY_PLOTROLL_REQUIRES_TECH_TO_USE", techName );
				else
					improvementStr = improvementStr .. " " .. Locale.ConvertTextKey( "TXT_KEY_PLOTROLL_REQUIRES_TECH", techName );
				end
			end
		end
	end
	
	return improvementStr;
	
end


-------------------------------------------------
-------------------------------------------------
function GetImprovementString(plot)

	local improvementStr = "";
	
	local iActiveTeam = Game.GetActiveTeam();
	local pTeam = Teams[iActiveTeam];

	local iImprovementType = plot:GetRevealedImprovementType(iActiveTeam, bIsDebug);
	if (iImprovementType >= 0) then
		if (improvementStr ~= "") then
			improvementStr = improvementStr .. ", ";
		end
		local convertedKey = Locale.ConvertTextKey(GameInfo.Improvements[iImprovementType].Description);		
		improvementStr = improvementStr .. convertedKey;
		if plot:IsImprovementPillaged() then
			improvementStr = improvementStr .." " .. Locale.ConvertTextKey("TXT_KEY_PLOTROLL_PILLAGED")
		end
	end

	local iRouteType = plot:GetRevealedRouteType(iActiveTeam, bIsDebug);
	if (iRouteType > -1) then
		if (improvementStr ~= "") then
			improvementStr = improvementStr .. ", ";
		end
		local convertedKey = Locale.ConvertTextKey(GameInfo.Routes[iRouteType].Description);		
		improvementStr = improvementStr .. convertedKey;
		--improvementStr = improvementStr .. "Road";
		
		if (plot:IsRoutePillaged()) then
			improvementStr = improvementStr .. " " .. Locale.ConvertTextKey("TXT_KEY_PLOTROLL_PILLAGED")
		end
	end
	
	return improvementStr;

end


-------------------------------------------------
-------------------------------------------------
function GetUnitsString(plot)

	local strUnitText = "";

	local iActiveTeam = Game.GetActiveTeam();
	local pTeam = Teams[iActiveTeam];
	local bIsDebug = Game.IsDebugMode();
	local bFirstEntry = true;
	
	-- Loop through all units
	local numUnits = plot:GetNumUnits();
	for i = 0, numUnits do
		
		local unit = plot:GetUnit(i);
		if (unit ~= nil and not unit:IsInvisible(iActiveTeam, bIsDebug)) then

			if (bFirstEntry) then
				bFirstEntry = false;
			else
				strUnitText = strUnitText .. "[NEWLINE]";
			end

			local strength = 0;
			strength = unit:GetBaseCombatStrength();
		
			local pPlayer = Players[unit:GetOwner()];
			
			-- Player using nickname
			if (pPlayer:GetNickName() ~= nil and pPlayer:GetNickName() ~= "") then
				strUnitText = strUnitText .. Locale.ConvertTextKey("TXT_KEY_MULTIPLAYER_UNIT_TT", pPlayer:GetNickName(), pPlayer:GetCivilizationAdjectiveKey(), unit:GetNameKey());
			-- Use civ short description
			else
				if(unit:HasName()) then
					local desc = Locale.ConvertTextKey("TXT_KEY_PLOTROLL_UNIT_DESCRIPTION_CIV", pPlayer:GetCivilizationAdjectiveKey(), unit:GetNameKey());
					strUnitText = strUnitText .. string.format("%s (%s)", unit:GetNameNoDesc(), desc); 
				else
					strUnitText = strUnitText .. Locale.ConvertTextKey("TXT_KEY_PLOTROLL_UNIT_DESCRIPTION_CIV", pPlayer:GetCivilizationAdjectiveKey(), unit:GetNameKey());
				end
			end
			
			local unitTeam = unit:GetTeam();
			if iActiveTeam == unitTeam then
				strUnitText = "[COLOR_WHITE]" .. strUnitText .. "[ENDCOLOR]";
			elseif pTeam:IsAtWar(unitTeam) then
				strUnitText = "[COLOR_NEGATIVE_TEXT]" .. strUnitText .. "[ENDCOLOR]";
			else
				strUnitText = "[COLOR_POSITIVE_TEXT]" .. strUnitText .. "[ENDCOLOR]";
			end
			
			-- Debug stuff
			if (OptionsManager:IsDebugMode()) then
				strUnitText = strUnitText .. " ("..tostring(unit:GetOwner()).." - " .. tostring(unit:GetID()) .. ")";
			end
			
			-- Combat strength
			if (strength > 0) then
				strUnitText = strUnitText .. ", [ICON_STRENGTH]" .. unit:GetBaseCombatStrength();
			end
			
			-- Hit Points
			if (unit:GetDamage() > 0) then
				strUnitText = strUnitText .. ", " .. Locale.ConvertTextKey("TXT_KEY_PLOTROLL_UNIT_HP", GameDefines["MAX_HIT_POINTS"] - unit:GetDamage());
			end
			
			-- Embarked?
			if (unit:IsEmbarked()) then
				strUnitText = strUnitText .. ", " .. Locale.ConvertTextKey( "TXT_KEY_PLOTROLL_EMBARKED" );
			end
			
			-- Building something?
			--if (unit:GetBuildType() ~= -1) then
				--strUnitText = strUnitText .. ", " .. Locale.ConvertTextKey(GameInfo.Builds[unit:GetBuildType()].Description);
			--end
		end			
	end	
	
	return strUnitText;
	
end


-------------------------------------------------
-------------------------------------------------
function GetOwnerString(plot)

	local strOwner = "";
	
	local iActiveTeam = Game.GetActiveTeam();
	local pTeam = Teams[iActiveTeam];
	local bIsDebug = Game.IsDebugMode();
	
	-- City here?
	if (plot:IsCity()) then
		
		local pCity = plot:GetPlotCity();
		local strAdjectiveKey = Players[pCity:GetOwner()]:GetCivilizationAdjectiveKey();
		
		strOwner = Locale.ConvertTextKey("TXT_KEY_CITY_OF", strAdjectiveKey, pCity:GetName());
		
	-- No city, see if this plot is just owned
	else
		
		-- Plot owner
		local iOwner = plot:GetRevealedOwner(iActiveTeam, bIsDebug);
		
		if (iOwner >= 0) then
			local pPlayer = Players[iOwner];
			
			-- Player using nickname
			if (pPlayer:GetNickName() ~= nil and pPlayer:GetNickName() ~= "") then
				strOwner = Locale.ConvertTextKey("TXT_KEY_PLOTROLL_OWNED_PLAYER", pPlayer:GetNickName());
			-- Use civ short description
			else
				strOwner = Locale.ConvertTextKey("TXT_KEY_PLOTROLL_OWNED_CIV", pPlayer:GetCivilizationShortDescriptionKey());
			end
				local iActiveTeam = Game.GetActiveTeam();
				local plotTeam = pPlayer:GetTeam();
				if iActiveTeam == plotTeam then
					strOwner = "[COLOR_WHITE]" .. strOwner .. "[ENDCOLOR]";
				elseif pTeam:IsAtWar(plotTeam) then
					strOwner = "[COLOR_NEGATIVE_TEXT]" .. strOwner .. "[ENDCOLOR]";
				else
					strOwner = "[COLOR_POSITIVE_TEXT]" .. strOwner .. "[ENDCOLOR]";
				end
		end
	end


	
	return strOwner;

end


-------------------------------------------------
-------------------------------------------------
function GetYieldString(plot)

	local strYield = "";
	
	-- food
	local iNumFood = plot:CalculateYield(0, true);
	if (iNumFood > 0) then
		strYield = strYield .. "[ICON_FOOD] " .. iNumFood .. " ";
	end
	
	-- production
	local iNumProduction = plot:CalculateYield(1, true);
	if (iNumProduction > 0) then
		strYield = strYield .. "[ICON_PRODUCTION] " .. iNumProduction .. " ";
	end
	
	-- gold
	local iNumGold = plot:CalculateYield(2, true);
	if (iNumGold > 0) then
		strYield = strYield .. "[ICON_GOLD] " .. iNumGold .. " ";
	end
	
	-- science
	local iNumScience = plot:CalculateYield(3, true);
	if (iNumScience > 0) then
		strYield = strYield .. "[ICON_RESEARCH] " .. iNumScience .. " ";
	end
	
	-- Culture
	-- NOTE: If the plot has a natural wonder that adds culture but is not within your borders, plot:getCulture() will not display this.
	-- In this particular case, let's hypothesize what the culture gain would be and append that to iNumCulture.
	local iNumCulture = plot:GetCulture();
	
	-- Only fudge in the additional culture if the owner is NOT the active player.
	local activePlayer = Game.GetActivePlayer();
	if(plot:GetOwner() ~= activePlayer) then
		local featureType = plot:GetFeatureType();
		
		local featureInfo = GameInfo.Features[featureType];
		if(featureInfo ~= nil and featureInfo.NaturalWonder) then	
			local player = Players[activePlayer];
			local nwCulture = featureInfo.Culture * (100 + player:GetNaturalWonderYieldModifier())
			iNumCulture = iNumCulture + math.floor(nwCulture / 100);
		end
	end
		
	if (iNumCulture > 0) then
		strYield = strYield .. "[ICON_CULTURE] " .. iNumCulture .. " ";
	end
	
	return strYield;
	
end
