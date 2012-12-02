--
-- Helper functions for plot / yield related logic
-- Author: csebal
--

-------------------------------------------------
-- List the improvements that can be built on
-- the specified resource
-------------------------------------------------
function csebPlotHelpers_GetImprovementListForResource(pPlot, pResource)
	local strResult = ""; -- result string	

	-- check to see if there already is an improvement on the plot
	local strBuiltImprovementKey = "";
	local iImprovementType = pPlot:GetRevealedImprovementType(iActiveTeam, false); -- get the improvement type on the plot
	local bHasMatchingImprovement = false;
	if (iImprovementType >= 0) then
		strBuiltImprovementKey = GameInfo.Improvements[iImprovementType].Type;
	end

	local strImpKey = "";
	local strImpHelpKey = "";
	local strImpName = "";
	for row in GameInfo.Improvement_ResourceTypes("ResourceType='" .. pResource.Type .. "'") do
		
		strImpKey = row.ImprovementType;		 
		-- do not display the improvement list if the improvement already on the plot matches any 
		-- of the required improvements for the resource
		if (strImpKey == strBuiltImprovementKey) then
			return "";
		end

		-- only add the improvement, if it can be built on this plot
		local iCurrentImprovementType = GameInfo.Improvements[ strImpKey ].ID;
		if (pPlot:CanHaveImprovement(iCurrentImprovementType, -1)) then			
			strImpHelpKey =  GameInfo.Improvements[ strImpKey ].Description;
			strImpName = Locale.ConvertTextKey( strImpHelpKey );

			if (strResult ~= "") then
				strResult = strResult .. " or ";
			end

			strResult = strResult .. strImpName;
		end
	end

	return strResult;
end

-------------------------------------------------
-- Returns the current yield of a plot
-------------------------------------------------
function csebPlotHelpers_GetCurrentPlotYieldString(pPlot)	
	
	local iNumFood = pPlot:CalculateYield(0, true); -- food	
	local iNumProduction = pPlot:CalculateYield(1, true); -- production	
	local iNumGold = pPlot:CalculateYield(2, true); -- gold	
	local iNumScience = pPlot:CalculateYield(3, true); -- science	
	local iNumCulture = pPlot:GetCulture(); -- Culture
	local iResourceNum = 0;
	local pResource;
	local iHappy = 0;

	local iActiveTeam = Game.GetActiveTeam(); -- the ID of the currently active team
	local pTeam = Teams[iActiveTeam]; -- the currently active team
	
	local iResource = pPlot:GetResourceType(iActiveTeam);
	
	if (iResource >= 0) then -- if there is a resource on this pPlot
		
		pResource = GameInfo.Resources[iResource]; -- get the resource object
		
		if (csebPlotHelpers_IsResourceImproved(pPlot, pResource)) then -- if the resource is being worked
				
			if (pResource.Happiness) then -- if it is a luxury resource, adjust the happiness display
				iHappy = pResource.Happiness;
			end

			iResourceNum = pPlot:GetNumResource();
			if (iHappy > 0) then -- for happiness resources, we display 1
				iResourceNum = 1;
			elseif (iResourceNum <= 1) then --  we do not display food resources
				iResourceNum = 0;
			end

		end

	end

	return csebPlotHelpers_GetFormattedYieldString(iResourceNum, pResource, iHappy, iNumFood, iNumProduction, iNumGold, iNumScience, iNumCulture);
end


-------------------------------------------------
-- Returns the yield of a plot without its
-- actual feature (forest/jungle/marsh)
-------------------------------------------------
function csebPlotHelpers_GetYieldWithoutFeatureString(pPlot)
	local strResult = "";
    
	-- find feature on the plot
	local iFeature = pPlot:GetFeatureType();
	if (iFeature < 0) then
		return "" -- there is no feature to remove
	end
	local iBuild = -1;
	if (iFeature == GameInfoTypes["FEATURE_FOREST"]) then
		iBuild = GameInfoTypes["BUILD_REMOVE_FOREST"];
	elseif (iFeature == GameInfoTypes["FEATURE_JUNGLE"]) then
		iBuild = GameInfoTypes["BUILD_REMOVE_JUNGLE"];
	elseif (iFeature == GameInfoTypes["FEATURE_MARSH"]) then
		iBuild = GameInfoTypes["BUILD_REMOVE_MARSH"];
	elseif (iFeature == GameInfoTypes["FEATURE_FALLOUT"]) then
		iBuild = GameInfoTypes["BUILD_SCRUB_FALLOUT"];
	end

	if (iBuild ~= -1) then
		local pBuild = GameInfo.Builds[iBuild];
		return csebPlotHelpers_GetPlotYieldWithBuild(pPlot, iBuild, true);
	end

	return "";
end

-------------------------------------------------
-- Returns true if the player has the technology
-- to build the specified item
-------------------------------------------------
function csebPlotHelpers_HasTechForBuild(pBuild)
	local iActiveTeam = Game.GetActiveTeam(); -- the ID of the currently active team
	local pActiveTeam = Teams[iActiveTeam]; -- the currently active team
	if (pBuild.PrereqTech ~= nil) then
		local pPrereqTech = GameInfo.Technologies[pBuild.PrereqTech];
		local iPrereqTech = pPrereqTech.ID;
		if (iPrereqTech ~= -1) then
			return pActiveTeam:GetTeamTechs():HasTech(iPrereqTech);
		else
			return true;
		end		
	end
end

-------------------------------------------------
-- Returns true if the specified build is valid
-- for the plot specified
-------------------------------------------------
function csebPlotHelpers_CanBeBuilt(pPlot, pBuild)
	local iActiveTeam = Game.GetActiveTeam();
	local iTerrain = pPlot:GetTerrainType();
	local iFeature = pPlot:GetFeatureType();
	local iResource = pPlot:GetResourceType(iActiveTeam)
	local iImprovementType = pPlot:GetRevealedImprovementType(iActiveTeam, false);

	if (pBuild.ImprovementType ~= nil) then -- if this is an improvement build

		local pImprovement = GameInfo.Improvements[pBuild.ImprovementType];
		
		-- It is already built, we can't build it again
		if (iImprovementType == GameInfoTypes [ pBuild.ImprovementType ]) then
			return false;
		end

		-- If it is a water improvement and we are not on water, we can't build it. same goes for land improvements not on land.
		if (pImprovement.Water ~= pPlot:IsWater()) then
			return false;
		end

		-- It has an resource
		if (iResource ~= -1) then
			-- check to see if the improvement has a valid resource type
			for row in GameInfo.Improvement_ResourceTypes("ResourceType = '" .. GameInfo.Resources[iResource].Type .. "' and ImprovementType = '" .. pImprovement.Type .. "'") do
				return true;
			end

			if (pImprovement.BuildableOnResources) then
				return true;
			end

			return false;
		end

		-- check to see if it has a valid terrain type
		for row in GameInfo.Improvement_ValidTerrains("TerrainType = '" .. GameInfo.Terrains[iTerrain].Type .. "' and ImprovementType = '" .. pImprovement.Type .. "'") do
			return true;
		end

		-- check to see if it has a valid feature type
		if (iFeature ~= -1) then
			for row in GameInfo.Improvement_ValidFeatures("FeatureType = '" .. GameInfo.Features[iFeature].Type .. "' and ImprovementType = '" .. pImprovement.Type .. "'") do
				return true;
			end
		end

		-- check to see if the plot matches any of the improvement's special validation rules
		if (pImprovement.HillsMakesValid and pPlot:IsHills()) then
			return true;
		end
		if (pImprovement.FreshWaterMakesValid and pPlot:IsFreshWater() and (pImprovement.BuildableOnResources or iResource == -1)) then
			return true;
		end

	end

	return false;
end

-------------------------------------------------
-- Returns the yield of a plot with the specified
-- item built on it
-------------------------------------------------
function csebPlotHelpers_GetPlotYieldWithBuild(pPlot, iBuild, bScienceHack)
	local iNumFood = pPlot:GetYieldWithBuild(iBuild, YieldTypes.YIELD_FOOD, false); -- food	
	local iNumProduction = pPlot:GetYieldWithBuild(iBuild, YieldTypes.YIELD_PRODUCTION, false); -- production	
	local iNumGold = pPlot:GetYieldWithBuild(iBuild, YieldTypes.YIELD_GOLD, false); -- gold	
	local iNumScience = pPlot:GetYieldWithBuild(iBuild, YieldTypes.YIELD_SCIENCE, false); -- science	
	local iNumCulture = pPlot:GetCulture();
	local iResourceNum = 0;
	local pResource;
	local iHappy = 0;

	if (bScienceHack) then -- for some reason, the game adds 1 science to some improvements (trading post) when called outside the cultural borders
		if (iNumScience == 1) then
			iNumScience = 0;
		end
	end

	local iActiveTeam = Game.GetActiveTeam(); -- the ID of the currently active team
	local pTeam = Teams[iActiveTeam]; -- the currently active team
	
	local iResource = pPlot:GetResourceType(iActiveTeam);
	local pBuild = GameInfo.Builds[iBuild];
	local pImprovementToBuild = nil;
	if (pBuild.ImprovementType ~= nil) then
		pImprovementToBuild = GameInfo.Improvements[pBuild.ImprovementType];
	end

	local pImprovementOnPlot = nil;
	local iImprovementOnPlotType = pPlot:GetRevealedImprovementType(iActiveTeam, false);

	if (iImprovementOnPlotType ~= nil and iImprovementOnPlotType >= 0) then
		pImprovementOnPlot = GameInfo.Improvements[iImprovementOnPlotType];
	end
	
	if (iResource >= 0) then -- if there is a resource on this pPlot
		
		pResource = GameInfo.Resources[iResource]; -- get the resource object

		-- if it is outside the cultural borders, we have to add the resource based yield increases manually
		local iOwner = pPlot:GetRevealedOwner(iActiveTeam, false);
		local needsAdjustment = true;
		if (iOwner >= 0) then
			local pPlayer = Players[iOwner];
			local plotTeam = pPlayer:GetTeam();
			if iActiveTeam == plotTeam then
				needsAdjustment = false;
			end
		end

		if (needsAdjustment) then
			for row in GameInfo.Resource_YieldChanges("ResourceType='" .. pResource.Type .. "'") do
				iYieldTypeID = GameInfoTypes[row.YieldType];
				if (iYieldTypeID == YieldTypes.YIELD_FOOD) then	
					iNumFood = iNumFood + row.Yield;
				elseif (iYieldTypeID == YieldTypes.YIELD_PRODUCTION) then
					iNumProduction = iNumProduction + row.Yield;					
				elseif (iYieldTypeID == YieldTypes.YIELD_GOLD) then
					iNumGold = iNumGold + row.Yield;					
				elseif (iYieldTypeID == YieldTypes.YIELD_SCIENCE) then
					iNumScience = iNumScience + row.Yield;					
				end	
			end
		end

		local bShowResourceData = false;
		if (csebPlotHelpers_IsBuildImprovingResource(pPlot, GameInfoTypes [ pBuild.ImprovementType ])) then
			bShowResourceData = true;
		elseif (pBuild.RouteType ~= nil and csebPlotHelpers_IsBuildImprovingResource(pPlot, iImprovementOnPlotType)) then
			bShowResourceData = true;
		end
		
		if (bShowResourceData) then -- if the resource will be worked
				
			if (pResource.Happiness) then -- if it is a luxury resource, adjust the happiness display
				iHappy = pResource.Happiness;
			end

			iResourceNum = pPlot:GetNumResource();
			if (iHappy > 0) then -- for happiness resources, we display 1
				iResourceNum = 1;
			elseif (iResourceNum <= 1) then --  we do not display food resources
				iResourceNum = 0;
			end

			if (needsAdjustment) then
				local iYieldTypeID;
				for row in GameInfo.Improvement_ResourceType_Yields("ResourceType='" .. pResource.Type .. "' and ImprovementType='" .. pImprovementToBuild.Type .. "'") do
					iYieldTypeID = GameInfoTypes[row.YieldType];
					if (iYieldTypeID == YieldTypes.YIELD_FOOD) then	
						iNumFood = iNumFood + row.Yield;
					elseif (iYieldTypeID == YieldTypes.YIELD_PRODUCTION) then
						iNumProduction = iNumProduction + row.Yield;					
					elseif (iYieldTypeID == YieldTypes.YIELD_GOLD) then
						iNumGold = iNumGold + row.Yield;					
					elseif (iYieldTypeID == YieldTypes.YIELD_SCIENCE) then
						iNumScience = iNumScience + row.Yield;					
					end	
				end
			end		

		end

	end

	-- adjust culture manually
	if (pImprovementToBuild ~= nil and pImprovementToBuild.Culture) then
		iNumCulture = iNumCulture + pImprovementToBuild.Culture;
	end

	return csebPlotHelpers_GetFormattedYieldString(iResourceNum, pResource, iHappy, iNumFood, iNumProduction, iNumGold, iNumScience, iNumCulture);
end

-------------------------------------------------
-- Returns true if the resource on the plot
-- is improved by the proper improvement
-------------------------------------------------
function csebPlotHelpers_IsResourceImproved(pPlot)
	local iActiveTeam = Game.GetActiveTeam(); 
	local iImprovementType = pPlot:GetRevealedImprovementType(iActiveTeam, false);
	if (iImprovementType ~= nil and iImprovementType >= 0) then
		return pPlot:IsResourceConnectedByImprovement(iImprovementType);
	else
		return false;	
	end
end

-------------------------------------------------
-- Returns true if the specified build constructs
-- the proper improvement for the resource on 
-- on this plot
-------------------------------------------------
function csebPlotHelpers_IsBuildImprovingResource(pPlot, iImprovement)
	if (iImprovement == nil or iImprovement == NULL) then
		return false;
	elseif (iImprovement < 0) then
		return false;
	else
		return pPlot:IsResourceConnectedByImprovement(iImprovement);
	end
end

-------------------------------------------------
-- Returns the name of the feature on this plot
-------------------------------------------------
function csebPlotHelpers_GetPlotFeatureName(pPlot)
	local iFeature = pPlot:GetFeatureType();
	if (iFeature > -1) then
		return Locale.ConvertTextKey( GameInfo.Features[iFeature].Description );
	else
		return "";
	end
end

-------------------------------------------------
-- Returns a formatted yield line
-------------------------------------------------
function csebPlotHelpers_GetFormattedYieldString(iResourceNum, pResource, iHappy, iFood, iProduction, iGold, iScience, iCulture)
	local strResult = "";

	if (iResourceNum > 0 and pResource) then
		strResult = strResult .. pResource.IconString .. " " .. iResourceNum .. " ";
	end
	if (iHappy > 0) then
		strResult = strResult .. "[ICON_HAPPINESS_1] " .. iHappy .. " ";
	end
	if (iFood > 0) then
		strResult = strResult .. "[ICON_FOOD] " .. iFood .. " ";
	end
	if (iProduction > 0) then
		strResult = strResult .. "[ICON_PRODUCTION] " .. iProduction .. " ";
	end
	if (iGold > 0) then
		strResult = strResult .. "[ICON_GOLD] " .. iGold .. " ";
	end
	if (iScience > 0) then
		strResult = strResult .. "[ICON_RESEARCH] " .. iScience .. " ";
	end
	if (iCulture > 0) then
		strResult = strResult .. "[ICON_CULTURE] " .. iCulture .. " ";
	end

	return strResult;
end