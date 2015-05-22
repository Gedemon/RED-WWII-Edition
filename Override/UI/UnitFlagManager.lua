-- UnitFlagManager
-------------------------------------------------
-------------------------------------------------------------------------------------------------------
-- R.E.D. WW II edition
-------------------------------------------------------------------------------------------------------
include ("RedOverrideInclude")
-------------------------------------------------------------------------------------------------------
include( "IconSupport" );
include( "InstanceManager" );
local g_MilitaryManager = InstanceManager:new( "NewUnitFlag", "Anchor", Controls.MilitaryFlags );
local g_CivilianManager = InstanceManager:new( "NewUnitFlag", "Anchor", Controls.CivilianFlags );
local g_AirCraftManager = InstanceManager:new( "NewUnitFlag", "Anchor", Controls.AirCraftFlags );

g_MasterList = {}; --@was: local -- Modified by Erendir
local g_MasterList = g_MasterList; -- local link to the global table -- Added by Erendir
local g_LastPlayerID;
local g_LastUnitID;
local g_PrintDebug = false;
g_GarrisonedUnitFlagsInStrategicView = true; --@was: local -- Modified by Erendir

local BlackFog = 0; -- invisible
local GreyFog  = 1; -- once seen
local WhiteFog = 2; -- eyes on
local g_DimAlpha = 0.45;
local g_DimAirAlpha = 0.6;

GarrisonOffset = Vector2( -43, -39 );
GarrisonOtherOffset = Vector2( -55, -34 );
CityNonGarrisonOffset = Vector2( 45, -45 );
CivilianOffset = Vector2( 35, 0 );

local g_AirFlagNormalOffset = -24;
local g_AirFlagHealthOffset = -19;

local g_CityFlags = {};
local g_CityFlagPlots = {};
local g_SelectedContainer = ContextPtr:LookUpControl( "../SelectedUnitContainer" );
local g_SelectedFlag = nil;
local CityWorldPositionOffset = { x = 0, y = 0, z = 35 };

------------------------------------------------------------------
-- from Thal's Utility
------------------------------------------------------------------
function Unit_GetXPStored(unit)
	return unit:GetExperience() - GetExperienceForLevel(unit:GetLevel())
end

function Unit_GetXPNeeded(unit)
	return unit:ExperienceNeeded() - GetExperienceForLevel(unit:GetLevel())
end

function GetExperienceForLevel(level)
	local xpSum = 0
	for i=1, level-1 do
		xpSum = xpSum + i*GameDefines.EXPERIENCE_PER_LEVEL
	end
	return xpSum
end
------------------------------------------------------------------
------------------------------------------------------------------

-- Modified by Erendir
g_UnitFlagClass =  --@was: local -- Modified by Erendir
{
    ------------------------------------------------------------------
    -- default values
    ------------------------------------------------------------------
    m_Instance = {},
    
    m_FlagType = 0,
    m_UnitType = 0,
    m_IsSelected = false,
    m_IsCurrentlyVisible = true,
    m_IsInvisible = false,
    m_IsGarrisoned = false,
    m_IsDimmed = false,
    m_OverrideDimedFlag = false,
    m_HasCivilianSelectFlag = false,
    m_Health   = 1,
    
    m_Player   = -1,
    m_PlayerID = -1,
    m_CivID    = -1,
    m_UnitID   = -1,
    
    m_IsAirCraft = false,
    m_IsCivilian = false,
    m_CargoControls = nil,
    m_CarrierFlag = nil,
    m_CityFlag    = nil,
    m_CargoIsActive = false,
    
    m_Escort = nil;


    ------------------------------------------------------------------
    -- constructor
    ------------------------------------------------------------------
    new = function( self, playerID, unitID, fogState, invisible )
        local o = {};
        setmetatable( o, self );
        self.__index = self;
        o.m_Instance = {};
        
        if( playerID ~= -1 )
        then
			local pUnit = Players[ playerID ]:GetUnitByID( unitID );
			
            if( pUnit:IsCombatUnit() ) then
                o.m_InstanceManager = g_MilitaryManager;
            else
                if( pUnit:GetDomainType() == DomainTypes.DOMAIN_AIR ) then
                    o.m_InstanceManager = g_AirCraftManager;
                    o.m_IsAirCraft = true;
                else
                    o.m_InstanceManager = g_CivilianManager;
                end
            end

            o.m_Instance = o.m_InstanceManager:GetInstance();
            o:Initialize( playerID, unitID, fogState, invisible );
           
            ---------------------------------------------------------
            -- Can carry units
            if( pUnit:CargoSpace() > 0 ) then
            
                --print( "unit has cargo space, building air button" );
                o.m_CargoControls = {};
                ContextPtr:BuildInstanceForControl( "AirButton", o.m_CargoControls, o.m_Instance.AirAnchor );
                o.m_CargoControls.PullDown:RegisterSelectionCallback( UnitFlagClicked );
                o.m_CargoControls.PullDown:ReprocessAnchoring();
               -- print( "creation cargo" );
                o:UpdateCargo();
            end

            ---------------------------------------------------------
            -- build the table for this player and store the flag
            local playerTable = g_MasterList[ playerID ];
            if playerTable == nil 
            then
                playerTable = {};
                g_MasterList[ playerID ] = playerTable
            end
            g_MasterList[ playerID ][ unitID ] = o;
	        
			-- Threatening? (Disabled)
			--if (pUnit:IsThreateningAnyMinorCiv()) then
				--OnMarkThreateningEvent( playerID, unitID, true )
			--else
	            --o:SetFlash( false );
			--end
        end
        
        return o;
    end,
     
    
        
    ------------------------------------------------------------------
    -- constructor
    ------------------------------------------------------------------
    Initialize = function( o, playerID, unitID, fogState, invisible )
        o.m_Player = Players[ playerID ];
        o.m_PlayerID = playerID;
        o.m_UnitID = unitID;
        
        if( g_PrintDebug ) then print( string.format( "Creating UnitFlag for: Player[%i] Unit[%i]", playerID, unitID ) ); end
        
		local pUnit = Players[ playerID ]:GetUnitByID( unitID );
        if( pUnit == nil )
        then
            print( string.format( "Unit not found for UnitFlag: Player[%i] Unit[%i]", playerID, unitID ) );
            return nil;
        end
     
        o.m_IsCivilian = not pUnit:IsCombatUnit();
        o.m_IsInvisible = invisible;
        
        -- Technically, we should get a UnitGarrisoned event after the creation event if
        -- the unit is garrisoned.  So IsGarrisoned should always be false at creation.
        -- In the interest of preserving behavior I'm allowing m_IsGarrisoned to be set
        -- using IsGarrisoned() on creation.  However, in the strategic view this causes
        -- a visibility error in some odd cases so there it always starts as false.
        if( InStrategicView() )
        then
			o.m_IsGarrisoned = false;
		else
			o.m_IsGarrisoned = pUnit:IsGarrisoned();
		end
      
        ---------------------------------------------------------
        -- Hook up the button
        local pPlayer = Players[Game.GetActivePlayer()];
        local active_team = pPlayer:GetTeam();
        local team = o.m_Player:GetTeam();
        	
		local unitNameString;
		if(pUnit:HasName()) then
			local desc = Locale.ConvertTextKey("TXT_KEY_PLOTROLL_UNIT_DESCRIPTION_CIV",  o.m_Player:GetCivilizationAdjectiveKey(), pUnit:GetNameKey());
			unitNameString = string.format("%s (%s)", pUnit:GetName(), desc);
		else
			unitNameString = Locale.ConvertTextKey("TXT_KEY_PLOTROLL_UNIT_DESCRIPTION_CIV",  o.m_Player:GetCivilizationAdjectiveKey(), pUnit:GetNameKey());
		end
		
        if( active_team == team ) then
            o.m_Instance.NormalButton:SetVoid1( playerID );
            o.m_Instance.NormalButton:SetVoid2( unitID );
            o.m_Instance.NormalButton:RegisterCallback( Mouse.eLClick, UnitFlagClicked );
            o.m_Instance.NormalButton:RegisterCallback( Mouse.eMouseEnter, UnitFlagEnter );
            o.m_Instance.NormalButton:RegisterCallback( Mouse.eMouseExit, UnitFlagExit );
            o.m_Instance.NormalButton:SetDisabled( false );
            o.m_Instance.NormalButton:SetConsumeMouseOver( true );
            if(PreGame.IsMultiplayerGame() and o.m_Player:IsHuman()) then
				local unitOwner = Players[playerID];
                local string = Locale.ConvertTextKey("TXT_KEY_MULTIPLAYER_UNIT_TT", o.m_Player:GetNickName(), o.m_Player:GetCivilizationAdjectiveKey(), pUnit:GetNameKey() );
                if( playerID == Game.GetActivePlayer() ) then
                    string = string .. Locale.ConvertTextKey( "TXT_KEY_UPANEL_CLICK_TO_SELECT" );
				end
				o.m_Instance.UnitIcon:SetToolTipString( string );
			else
				local string = unitNameString; 
				if( playerID == Game.GetActivePlayer() ) then
                    string = string .. Locale.ConvertTextKey( "TXT_KEY_UPANEL_CLICK_TO_SELECT" );
				end
				o.m_Instance.UnitIcon:SetToolTipString( string );
            end
            o.m_Instance.HealthBarButton:SetVoid1( playerID );
            o.m_Instance.HealthBarButton:SetVoid2( unitID );
            o.m_Instance.HealthBarButton:RegisterCallback( Mouse.eLClick, UnitFlagClicked );
            o.m_Instance.HealthBarButton:RegisterCallback( Mouse.eMouseEnter, UnitFlagEnter );
            o.m_Instance.HealthBarButton:RegisterCallback( Mouse.eMouseExit, UnitFlagExit );
            o.m_Instance.HealthBarButton:SetDisabled( false );
            o.m_Instance.HealthBarButton:SetConsumeMouseOver( true );
            
		    local pPlot = pUnit:GetPlot();
		    if( pPlot:IsCity() ) then
			    o.m_CityFlag = UpdateCityCargo( pPlot );
		    end

        else
            if(PreGame.IsMultiplayerGame() and o.m_Player:IsHuman()) then
				o.m_Instance.UnitIcon:SetToolTipString(Locale.ConvertTextKey("TXT_KEY_MULTIPLAYER_UNIT_TT", o.m_Player:GetNickName(), o.m_Player:GetCivilizationAdjectiveKey(), pUnit:GetNameKey()));
			else
				o.m_Instance.UnitIcon:SetToolTipString(unitNameString); 
            end
            o.m_Instance.NormalButton:SetDisabled( true );
            o.m_Instance.NormalButton:SetConsumeMouseOver( false );
            o.m_Instance.HealthBarButton:SetDisabled( true );
            o.m_Instance.HealthBarButton:SetConsumeMouseOver( false );
        end


        ---------------------------------------------------------
        -- update all the info
        o:SetUnitColor();
        o:SetUnitType();
        o:UpdateFlagType();
		o:UpdateTooltip();
        o:UpdateHealth();
        o:UpdateSelected();
        o:SetFogState( fogState );
        o:UpdateFlagOffset();
        o:UpdateVisibility();
    
    
        ---------------------------------------------------------
        -- Set the world position
        local worldPosX, worldPosY, worldPosZ = GridToWorld( pUnit:GetX(), pUnit:GetY() );
        worldPosZ = worldPosZ + 35;
        
        o:UnitMove( worldPosX, worldPosY, worldPosZ );
        
    end,
        
       
    
    ------------------------------------------------------------------
    ------------------------------------------------------------------
    destroy = function( self )
        if( self.m_InstanceManager ~= nil )
        then
            -- tell our escort we're dead
            if( self.m_Escort ~= nil ) then
                self.m_Escort:SetEscort( nil );
            end
            
            if( self.m_CargoControls ~= nil ) then
                self.m_Instance.AirAnchor:DestroyAllChildren();
                self.m_CargoIsActive = false;
                self.m_CargoControls = nil;
            end
           
            self:UpdateSelected( false );
            
            if( self.m_CarrierFlag ~= nil ) then
    		    self.m_CarrierFlag:UpdateCargo();
		    end
		    
            if( self.m_CityFlag ~= nil ) then
		        UpdateCityCargo( g_CityFlagPlots[ self.m_CityFlag ] );
		    end
		    
            self.m_InstanceManager:ReleaseInstance( self.m_Instance );
            g_MasterList[ self.m_PlayerID ][ self.m_UnitID ] = nil;
        end
    end,
    


    ------------------------------------------------------------------
    ------------------------------------------------------------------
    SetUnitColor = function( self )
        local iconColor, flagColor = self.m_Player:GetPlayerColors();
        
        if( self.m_Player:IsMinorCiv() )
        then
            flagColor, iconColor = iconColor, flagColor;
        end

        self.m_Instance.FlagBase:SetColor( flagColor );
        self.m_Instance.UnitIcon:SetColor( iconColor );
        self.m_Instance.FlagBaseOutline:SetColor( iconColor );

    end,



    ------------------------------------------------------------------
    ------------------------------------------------------------------
    SetUnitType = function( self )
            
        local unit = Players[ self.m_PlayerID ]:GetUnitByID( self.m_UnitID );
        if unit == nil then
			return;
		end
				
		local thisUnitInfo = GameInfo.Units[unit:GetUnitType()];
		 
 		local textureOffset, textureSheet = IconLookup( thisUnitInfo.UnitFlagIconOffset, 32, thisUnitInfo.UnitFlagAtlas );				
		self.m_Instance.UnitIcon:SetTexture( textureSheet );
		self.m_Instance.UnitIconShadow:SetTexture( textureSheet );
		self.m_Instance.UnitIcon:SetTextureOffset( textureOffset );
		self.m_Instance.UnitIconShadow:SetTextureOffset( textureOffset );

    end,



    ------------------------------------------------------------------
    ------------------------------------------------------------------
    SetFogState = function( self, fogState )
        if( fogState ~= WhiteFog ) then
            self:SetHide( true );
        else
            self:SetHide( false );
        end
        
        self.m_FogState = fogState;
    end,
    
    ------------------------------------------------------------------
    ------------------------------------------------------------------
    SetHide = function( self, bHide )
		self.m_IsCurrentlyVisible = not bHide;
		self:UpdateVisibility();
    end,
    
    ------------------------------------------------------------
    ------------------------------------------------------------
    UpdateVisibility = function( self )
		local bVisible = self.m_IsCurrentlyVisible and not self.m_IsInvisible;
    	if InStrategicView() then
    		local bShowInStrategicView = bVisible and g_GarrisonedUnitFlagsInStrategicView and self.m_IsGarrisoned;
    		self.m_Instance.Anchor:SetHide(not bShowInStrategicView);
    	else
    		self.m_Instance.Anchor:SetHide(not bVisible);
    		if( self.m_Escort ~= nil ) then
        		self.m_Escort.m_Instance.Anchor:SetHide(not bVisible);
        	end
        	if( self.m_CargoControls ~= nil and bVisible) then
        		self:UpdateCargo();
    		end
    	end
    end,
    
    ------------------------------------------------------------
    ------------------------------------------------------------
    GarrisonComplete = function( self )
		self.m_IsGarrisoned = true;
		self:UpdateVisibility();
		self:OverrideDimmedFlag( true );
    end,
 
    ------------------------------------------------------------------
    ------------------------------------------------------------------
    UpdateHealth = function( self )
    
		local pUnit = Players[ self.m_PlayerID ]:GetUnitByID( self.m_UnitID );
        if pUnit == nil then
			return;
		end	
			
        local healthPercent = math.max( math.min( pUnit:GetCurrHitPoints() / pUnit:GetMaxHitPoints(), 1 ), 0 );
        if( g_PrintDebug ) then print( "Setting health: " .. tostring( healthPercent ) .. " " .. tostring( self.m_PlayerID ) .. " " .. tostring( self.m_UnitID ) ); end
    
        -- going to damaged state
        if( healthPercent < 1 )
        then
            -- show the bar and the button anim
            self.m_Instance.HealthBarBG:SetHide( false );
            self.m_Instance.HealthBar:SetHide( false );
            self.m_Instance.HealthBarButton:SetHide( false );
            
            if( self.m_CargoControls ~= nil ) then
                self.m_CargoControls.PullDown:SetOffsetX( g_AirFlagHealthOffset );
            end
        
            -- hide the normal button
            self.m_Instance.NormalButton:SetHide( true );
            
            -- handle the selection indicator    
            if( self.m_IsSelected )
            then
                self.m_Instance.NormalSelect:SetHide( true );
                self.m_Instance.HealthBarSelect:SetHide( false );
            end
                    
            if( healthPercent > 0.66 )
            then
                self.m_Instance.HealthBar:SetFGColor( Vector4( 0, 1, 0, 1 ) );
            elseif( healthPercent > 0.33 )
            then
                self.m_Instance.HealthBar:SetFGColor( Vector4( 1, 1, 0, 1 ) );
            else
                self.m_Instance.HealthBar:SetFGColor( Vector4( 1, 0, 0, 1 ) );
            end
            
        --------------------------------------------------------------------    
        -- going to full health
        else
            self.m_Instance.HealthBar:SetFGColor( Vector4( 0, 1, 0, 1 ) );
            
            -- hide the bar and the button anim
            self.m_Instance.HealthBarBG:SetHide( true );
            self.m_Instance.HealthBar:SetHide( true );
            self.m_Instance.HealthBarButton:SetHide( true );
            if( self.m_CargoControls ~= nil ) then
                self.m_CargoControls.PullDown:SetOffsetX( g_AirFlagNormalOffset );
            end
        
            -- show the normal button
            self.m_Instance.NormalButton:SetHide( false );
        
            -- handle the selection indicator    
            if( self.m_IsSelected )
            then
                self.m_Instance.NormalSelect:SetHide( false );
                self.m_Instance.HealthBarSelect:SetHide( true );
            end
        end
        
        self.m_Instance.HealthBar:SetPercent( healthPercent );
        self.m_Health = healthPercent;
        self:UpdateTooltip();
    end,
   
    
    

    ------------------------------------------------------------------
    ------------------------------------------------------------------
    UpdateSelected = function( self, isSelected )
        self.m_IsSelected = isSelected; --self.m_Unit:IsSelected();
        if( g_PrintDebug ) then print( "Setting selected: " .. tostring( self.m_IsSelected ) .. " " .. tostring( self.m_PlayerID ) .. " " .. tostring( self.m_UnitID ) ); end
        
        if( self.m_Health >= 1 )
        then
            self.m_Instance.NormalSelect:SetHide( not self.m_IsSelected );
            self.m_Instance.HealthBarSelect:SetHide( true );
        else
            self.m_Instance.HealthBarSelect:SetHide( not self.m_IsSelected );
            self.m_Instance.NormalSelect:SetHide( true );
        end
        
        if( self.m_IsSelected ) then
            self.m_Instance.Anchor:ChangeParent( g_SelectedContainer );
            g_SelectedFlag = self;
        else
            
            if( self.m_IsAirCraft ) then
                self.m_Instance.Anchor:ChangeParent( Controls.AirCraftFlags );
            elseif( self.m_IsCivilian ) then
                self.m_Instance.Anchor:ChangeParent( Controls.CivilianFlags );
            elseif( self.m_IsGarrisoned ) then
                self.m_Instance.Anchor:ChangeParent( Controls.GarrisonFlags );
            else
                self.m_Instance.Anchor:ChangeParent( Controls.MilitaryFlags );
            end
            
        end
        
        self:OverrideDimmedFlag( self.m_IsSelected or self.m_IsGarrisoned );
        
    end,
    
    
    ------------------------------------------------------------------
    ------------------------------------------------------------------
	-- Added by Adam Watkins for Hover Info
	UpdateTooltip = function ( self )
		pUnit = Players[ self.m_PlayerID ]:GetUnitByID( self.m_UnitID );
		local bShowBasicHelp = not OptionsManager.IsNoBasicHelp()
	
		if pUnit == nil then
			return;
		end

		local pPlayer = Players[Game.GetActivePlayer()];
        local active_team = pPlayer:GetTeam();
        local team = self.m_Player:GetTeam();
		local unitData = MapModData.RED.UnitData
		if not unitData then
			print("WARNING : unitData is nil for " .. tostring(pUnit:GetName()))
		end
		local unitKey = GetUnitKey(pUnit)

		--[[
		if(PreGame.IsMultiplayerGame() or not self.m_Player:IsHuman() or active_team ~= team) then
			return;
		end
		--]]		
			 
		string = Locale.ConvertTextKey("TXT_KEY_PLOTROLL_UNIT_DESCRIPTION_CIV",  self.m_Player:GetCivilizationAdjectiveKey(), pUnit:GetName());
		
		-- Debug Infos
		if DEBUG_SHOW_UNIT_KEY then
			string = string .. "[NEWLINE]Debug: UnitKey = ".. tostring(unitKey);
		end
		if DEBUG_SHOW_RED_ORDER then
			if unitData[unitKey] then
				if unitData[unitKey].OrderType then string = string .. "[NEWLINE]Debug: OrderType = ".. tostring(unitData[unitKey].OrderType); end
				if unitData[unitKey].OrderObjective then string = string .. "[NEWLINE]Debug: OrderObjective = ".. tostring(unitData[unitKey].OrderObjective.X) .. "," .. tostring(unitData[unitKey].OrderObjective.Y); end
			end
		end

		-- Unit Class
		local unitClassType = Locale.ConvertTextKey(GameInfo.UnitClasses[pUnit:GetUnitClassType()].Description)
		string = string .. "[NEWLINE]Class : ".. unitClassType
		-- Combat strength
		if (pUnit:GetBaseCombatStrength() > 0) then
			string = string .. ", " .. pUnit:GetBaseCombatStrength() .."[ICON_STRENGTH]";
		end
		if (pUnit:GetBaseRangedCombatStrength() > 0) then
			string = string .. ", " .. pUnit:GetBaseRangedCombatStrength() .."[ICON_RANGE_STRENGTH]";
		end

		-- Convoy ? Transport ? Destination ?
		local bIsConvoy = false
		
		if pUnit:GetUnitClassType() == CLASS_CONVOY then
			bIsConvoy = true
		end

		if unitData[unitKey] and unitData[unitKey].OrderType == RED_CONVOY then
			local destination = unitData[unitKey].OrderObjective
			local transportType = unitData[unitKey].TransportType
			local transportReference = unitData[unitKey].TransportReference
			local healthRatio = pUnit:GetCurrHitPoints() / pUnit:GetMaxHitPoints()
			if transportReference and transportType then
				local strTransport = ""
				if transportType == TRANSPORT_MATERIEL then
					strTransport = transportReference .. " [ICON_MATERIEL] materiel"
				elseif transportType == TRANSPORT_PERSONNEL then
					strTransport = transportReference .. " [ICON_PERSONNEL] personnel"
				elseif transportType == TRANSPORT_UNIT then 
					local unitInfo = GameInfo.Units[transportReference]
					local unitName = Locale.ConvertTextKey( unitInfo.Description ) .. " (" .. Locale.ToUpper(Locale.ConvertTextKey(GameInfo.UnitClasses[unitInfo.Class].Description)) .. ")"
					strTransport = "" .. unitName
				elseif transportType == TRANSPORT_OIL then
					strTransport = transportReference .. " [ICON_RES_OIL] oil"
				elseif transportType == TRANSPORT_GOLD then
					strTransport = transportReference .. " [ICON_GOLD] gold"
				else 
					strTransport = transportReference .. " unknown cargo"
				end
				string = string .. "[NEWLINE]Cargo : ".. strTransport
			end
			if destination then
				local plot = GetPlot(destination.X,destination.Y)
				local strDestination = ""
				if plot:IsCity() then
					local city = plot:GetPlotCity()
					strDestination = city:GetName()
				else
					strDestination = " plot (".. destination.X .."," .. destination.Y ..")"
				end				
				string = string .. "[NEWLINE]Destination : ".. strDestination
			end
		end

		local strStatus = ""

		-- Movement
		if active_team == team and bShowBasicHelp then
			strStatus = strStatus .. Locale.ConvertTextKey("TXT_KEY_HOVERINFO_MOVES", pUnit:MovesLeft() / GameDefines.MOVE_DENOMINATOR) .. "  ";
		end		

		if pUnit:IsCombatUnit() or pUnit:GetDomainType() == DomainTypes.DOMAIN_AIR then
			strStatus = strStatus .. Locale.ConvertTextKey("TXT_KEY_HOVERINFO_EXPERIENCE", Unit_GetXPStored(pUnit), Unit_GetXPNeeded(pUnit)) .. "  ";
		end
		
		if pUnit:Range() and pUnit:Range() > 0 then
			strStatus = strStatus .. Locale.ConvertTextKey("TXT_KEY_HOVERINFO_RANGE_STRIKE", pUnit:Range()) .. "  ";
		end
		
		if pUnit:GetDamage() ~= 0 then
			strStatus = strStatus .. Locale.ConvertTextKey("TXT_KEY_HOVERINFO_HEALTH", GameDefines.MAX_HIT_POINTS - pUnit:GetDamage()) .. "  ";
		end

		if strStatus ~= "" then
			string = string .. "[NEWLINE]" .. strStatus
		end
		
				
		-- Reinforcement
		if not bIsConvoy then
			local reqMateriel, reqPersonnel = RequestedReinforcementsPerHP(pUnit:GetUnitType(), pUnit)
			local totalMat = reqMateriel * pUnit:GetDamage()
			local totalPers = reqPersonnel * pUnit:GetDamage()
			string = string .. "[NEWLINE]------------";
			if totalMat > 0 or totalPers > 0 then
				string = string .. "[NEWLINE]" .. Locale.ConvertTextKey("TXT_KEY_HOVERINFO_REQUIRED_REINFORCEMENT", reqMateriel, totalMat, reqPersonnel, totalPers );
			else
				string = string .. "[NEWLINE]" .. Locale.ConvertTextKey("TXT_KEY_HOVERINFO_REINFORCEMENT", reqMateriel, reqPersonnel );
			end
		end

		-- Oil Consumption
		local reqOil = GameInfo.Units[pUnit:GetUnitType()].FuelConsumption		
		if reqOil > 0 then
			string = string .. "[NEWLINE]------------";
			string = string .. "[NEWLINE]" .. Locale.ConvertTextKey("TXT_KEY_HOVERINFO_OIL_CONSUMPTION", reqOil );
		end

		local buildType = pUnit:GetBuildType();			
		if buildType ~= -1 then
			string = string .. "[NEWLINE]";
			string = string ..  Locale.ConvertTextKey(GameInfo.Builds[buildType].Description);
			string = string .. " ("..tostring(PlotGetBuildTurnsLeft(pUnit:GetPlot(), buildType))..")";
		end
				
		if not OptionsManager.IsNoBasicHelp() then
			--string = string .. Locale.ConvertTextKey( "TXT_KEY_UPANEL_CLICK_TO_SELECT" );
		end
		self.m_Instance.UnitIcon:SetToolTipString(string);
		
	end,
	--- End Addition by Adam Watkins

    UpdateFlagType = function ( self )
    
        local textureName;
        local maskName;
        
		local pUnit = Players[ self.m_PlayerID ]:GetUnitByID( self.m_UnitID );
        if pUnit == nil then
			return;
		end	
		
		if self.m_IsGarrisoned and not pUnit:IsGarrisoned() then
			self.m_IsGarrisoned = false;
			if InStrategicView() then
				self.m_Instance.Anchor:SetHide(true);
			end
		end
			
        if( pUnit:IsEmbarked() )
        then 
            textureName = "UnitFlagEmbark.dds";
            maskName = "UnitFlagEmbarkMask.dds";
            self.m_Instance.UnitIconShadow:SetOffsetVal( -1, -2 );

        elseif( pUnit:IsGarrisoned() )
        then
            textureName = "UnitFlagBase.dds";
            maskName = "UnitFlagMask.dds";
            self.m_Instance.UnitIconShadow:SetOffsetVal( -1, 1 );
            
            -- Garrisoned Unit flag should never be dimmed
            self:OverrideDimmedFlag( true );
        
        elseif( pUnit:GetFortifyTurns() > 0 )
        then
            --[[
            if( pUnit:isRanged() )
            then
                -- need art for this
                textureName = "UnitFlagRanged.dds";
                maskName = "UnitFlagRangedMask.dds";
                self.m_Instance.UnitIconShadow:SetOffsetVal( 0, 0 );
            else
            --]]
                textureName = "UnitFlagFortify.dds";
                maskName = "UnitFlagFortifyMask.dds";
                self.m_Instance.UnitIconShadow:SetOffsetVal( -1, 0 );
            --end
            
        elseif( not self.m_IsCivilian )
        then
            textureName = "UnitFlagBase.dds";
            maskName = "UnitFlagMask.dds";
            self.m_Instance.UnitIconShadow:SetOffsetVal( -1, 0 );
            
        else
            --[[textureName = "UnitFlagCiv.dds";
            maskName = "UnitFlagCivMask.dds";
            self.m_Instance.UnitIconShadow:SetOffsetVal( -1, -3 ); --]]
            textureName = "UnitFlagBase.dds";
            maskName = "UnitFlagMask.dds";
            self.m_Instance.UnitIconShadow:SetOffsetVal( -1, 0 );
        end
        
        self.m_Instance.UnitIconShadow:ReprocessAnchoring();
        
        
        self.m_Instance.FlagShadow:SetTexture( textureName );
        self.m_Instance.FlagBase:SetTexture( textureName );
        self.m_Instance.FlagBaseOutline:SetTexture( textureName );
        self.m_Instance.NormalSelect:SetTexture( textureName );
        self.m_Instance.HealthBarSelect:SetTexture( textureName );
        self.m_Instance.LightEffect:SetTexture( textureName );
        self.m_Instance.HealthBarBG:SetTexture( textureName );
        self.m_Instance.NormalAlphaAnim:SetTexture( textureName );
        self.m_Instance.HealthBarAlphaAnim:SetTexture( textureName );
        
        self.m_Instance.NormalScrollAnim:SetMask( maskName );
        self.m_Instance.HealthBarScrollAnim:SetMask( maskName );
    end,



    ------------------------------------------------------------------
    ------------------------------------------------------------------
    CheckEscort = function( self )
        --if( nil == nil ) then return; end
        
		local pUnit = Players[ self.m_PlayerID ]:GetUnitByID( self.m_UnitID );
        if pUnit == nil then
			return;
		end
		
		if (pUnit:GetDomainType() == DomainTypes.DOMAIN_AIR) then
			if (pUnit:IsImmobile()) then
		        if( g_PrintDebug ) then print( string.format( "Immobile air unit... not checking for escort!") ); end
		        
				return;
			end
		end
			
        local plot = pUnit:GetPlot();
        if( plot == nil )
        then 
            return
        end
        
        local escortUnit = nil;
        
        -- check current hex for other units
        if( plot:GetNumUnits() > 1 )
        then
            for i = 0, plot:GetNumUnits() - 1, 1
            do
		        if( g_PrintDebug ) then print( string.format( "Determining Escort for: Player[%i] Unit[%i] - %i", self.m_PlayerID, self.m_UnitID, i ) ); end
				
                local test = plot:GetUnit( i );
                if( test ~= nil and test:GetID() ~= self.m_UnitID and not test:IsGarrisoned() )
                then
                    escortUnit = test;
                    break;
                end
            end
        
        end
        
       
        -- we have a new escort
        if( escortUnit ~= nil )
        then
            local playerTable = g_MasterList[ escortUnit:GetOwner() ];
            if( playerTable == nil )
            then
                if( g_PrintDebug ) then print( "Escort Unit found, but no flag built yet" ); end
                return;
            end
            
            local escortFlag = playerTable[ escortUnit:GetID() ];
            if( escortFlag == nil )
            then
                if( g_PrintDebug ) then print( "Escort Unit found, but no flag built yet" ); end
                return;
            end
            
            -- we had an old escort 
            if( self.m_Escort ~= nil and escortFlag ~= self.m_Escort )
            then
                if( g_PrintDebug ) then print( "informing old escort of our new plans " ); end
                self.m_Escort:SetEscort( nil );
            end
            
            if( g_PrintDebug ) then print( "Setting Escorts " ); end
            
            self:SetEscort( escortFlag );
            escortFlag:SetEscort( self );
         
        -- we do not have a new escort, but we had an old one
        elseif ( self.m_Escort ~= nil )
        then
            if( g_PrintDebug ) then print( "Clearing Both Escorts: " .. " " .. tostring( self.m_PlayerID ) .. " " .. tostring( self.m_UnitID ) ); end
            self.m_Escort:SetEscort( nil );
            self:SetEscort( nil );
        end   
    end,
   
    
    
    ------------------------------------------------------------------
    -- used by CheckEscort to maintain the Other Unit
    ------------------------------------------------------------------
    SetEscort = function( self, newEscort )
    
        if( newEscort == self.m_Escort )
        then
            if( g_PrintDebug ) then print( "Reseting same escort? " ); end
            --return; 
        end
       
        self.m_Escort = newEscort;
        
        self:UpdateFlagOffset()
    end,
    
    
    -----------------------------------------------------------------
    ------------------------------------------------------------------
    UpdateCargo = function( self )
        
		local pUnit = Players[ self.m_PlayerID ]:GetUnitByID( self.m_UnitID );
        if( pUnit:CargoSpace() <= 0 ) then
            return;
        end
        
        if( self.m_CargoControls == nil )  then
            print( "bad cargo controls... ? ? ?" );
            return;
        end
        
        
        if( not pUnit:HasCargo() ) then
            self.m_CargoControls.PullDown:SetHide( true );
        else
            self.m_CargoControls.PullDown:SetHide( false );
            self.m_CargoControls.PullDown:ClearEntries();
            
            if( self.m_Instance.HealthBar:IsHidden() == false ) then
                self.m_CargoControls.PullDown:SetOffsetX( g_AirFlagHealthOffset );
            else
                self.m_CargoControls.PullDown:SetOffsetX( g_AirFlagNormalOffset );
            end
            local cargoCount = 0;
            
            -----------------------------------------------
            -- button for the carrier
            controlTable = {};
            self.m_CargoControls.PullDown:BuildEntry( "UnitInstance", controlTable );
            controlTable.Button:SetText( pUnit:GetName() );
            controlTable.Button:SetVoids( self.m_playerID, self.m_UnitID );
            if( pUnit:MovesLeft() > 0 ) then
                controlTable.Button:SetAlpha( 1.0 );
            else
                controlTable.Button:SetAlpha( 0.6 );
            end

            self.m_CargoIsActive = false;
            local pPlot = pUnit:GetPlot();
            local numUnits = pPlot:GetNumUnits();
            for i = 0, numUnits - 1 do
            
                local pPlotUnit = pPlot:GetUnit( i );
                if( pPlotUnit:IsCargo() and pPlotUnit:GetTransportUnit():GetID() == self.m_UnitID ) then
                
                    -- we're carrying
                    controlTable = {};
                    self.m_CargoControls.PullDown:BuildEntry( "UnitInstance", controlTable );
                    
					local nameStr = Locale.ConvertTextKey(pPlotUnit:GetNameKey())				
					if (pPlotUnit:GetDamage() > 0) then
						local healthPercent = math.max(math.min(pPlotUnit:GetCurrHitPoints() / pPlotUnit:GetMaxHitPoints(), 1), 0)
						if healthPercent < 0.33 then
							nameStr = "[COLOR_WARNING_TEXT]".. nameStr .."[ENDCOLOR]"
						elseif healthPercent < 0.66 then
							nameStr = "[COLOR_YELLOW]".. nameStr .."[ENDCOLOR]"
						end
					end
					controlTable.Button:SetText( nameStr )

					local str = ""
					str = str .. pPlotUnit:GetNameNoDesc() .. "[NEWLINE]" .. Locale.ConvertTextKey(pPlotUnit:GetNameKey())
					str = str .. "[NEWLINE]" .. Locale.ConvertTextKey(GameInfo.UnitClasses[pPlotUnit:GetUnitClassType()].Description)
					if pPlotUnit:GetBaseCombatStrength() > 0 then
						str = str .. ", " .. pPlotUnit:GetBaseCombatStrength() .."[ICON_STRENGTH]"
					elseif pPlotUnit:GetBaseRangedCombatStrength() > 0 then					
						str = str .. ", " .. pPlotUnit:GetBaseRangedCombatStrength() .."[ICON_STRENGTH]"
					end
					-- Hit Points
					if (pPlotUnit:GetDamage() > 0) then
						str = str .. "[NEWLINE]" .. Locale.ConvertTextKey("TXT_KEY_UPANEL_SET_HITPOINTS_TT", pPlotUnit:GetMaxHitPoints() - pPlotUnit:GetDamage(), pPlotUnit:GetMaxHitPoints());
					end

					-- Activity
					if pPlotUnit:GetOwner() == Game.GetActivePlayer() then
						local activityType = pPlotUnit:GetActivityType()
						if activityType == ActivityTypes.ACTIVITY_INTERCEPT then
							str = str .. "[NEWLINE]" .. "On Interception"
						elseif activityType == ActivityTypes.ACTIVITY_HOLD then
							str = str .. "[NEWLINE]" .. "On Hold"
						elseif activityType == ActivityTypes.ACTIVITY_AWAKE then
							str = str .. "[NEWLINE]" .. "Waiting for orders"
						elseif activityType == ActivityTypes.ACTIVITY_SLEEP then
							str = str .. "[NEWLINE]" .. "Reserve squadron"
						end
					end

					controlTable.Button:SetToolTipString( str );
                    controlTable.Button:SetVoids( self.m_playerID, pPlotUnit:GetID() );
                    
                    if( pPlotUnit:MovesLeft() > 0 ) then
                        self.m_CargoIsActive = true;
                        controlTable.Button:SetAlpha( 1.0 );
                    else
                        controlTable.Button:SetAlpha( 0.6 );
                    end
                    cargoCount = cargoCount + 1;
                end
            end
            
            self.m_CargoControls.Count:SetText( cargoCount );
            self.m_CargoControls.PullDown:LocalizeAndSetToolTip( "TXT_KEY_STATIONED_AIRCRAFT", cargoCount );
            self.m_CargoControls.PullDown:CalculateInternals();
            
            if( self.m_CargoIsActive == false ) then
                self.m_CargoControls.PullDown:GetButton():SetAlpha( g_DimAirAlpha );
            end
        end
    end,



    -----------------------------------------------------------------
    ------------------------------------------------------------------
    SetFlash = function( self, bFlashOn )
        self.m_Instance.UnitIconAnim:SetToBeginning();
        
        if( bFlashOn ) then
            self.m_Instance.UnitIconAnim:Play();
        end
        
    end,
    
    
    -----------------------------------------------------------------
    ------------------------------------------------------------------
    SetDim = function( self, bDim )
		self.m_IsDimmed = bDim;
        self:UpdateDimmedState();
        
		local pUnit = Players[ self.m_PlayerID ]:GetUnitByID( self.m_UnitID );
        if( pUnit:IsCargo() and self.m_CarrierFlag ~= nil ) then
		    self.m_CarrierFlag:UpdateCargo();
	    elseif( self.m_CargoControls ~= nil ) then
	        self:UpdateCargo();
        end
        
        if( self.m_CityFlag ~= nil ) then
            UpdateCityCargo( pUnit:GetPlot() );
        end
    end,
   
    
    -----------------------------------------------------------------
    ------------------------------------------------------------------
    OverrideDimmedFlag = function( self, bOverride )
		self.m_OverrideDimmedFlag = bOverride;
        self:UpdateDimmedState();
    end,
    
    
    -----------------------------------------------------------------
    ------------------------------------------------------------------
    UpdateDimmedState = function( self )
		if( self.m_IsDimmed and not self.m_OverrideDimmedFlag ) then
            self.m_Instance.Anchor:SetAlpha( g_DimAlpha );
            self.m_Instance.HealthBar:SetAlpha( 1.0 / g_DimAlpha ); -- Health bar doesn't get dimmed (Hacky I know)
            
            if( self.m_CargoControls ~= nil ) then
                if( self.m_CargoIsActive ) then
                    self.m_CargoControls.PullDown:GetButton():SetAlpha( 1.0 / g_DimAlpha ); -- active cargo doesn't get dimmed (Hacky I know)
                    self.m_CargoControls.Count:SetAlpha( 1.0 / g_DimAlpha );
                else
                    self.m_CargoControls.PullDown:GetButton():SetAlpha( 1.0 );
                    self.m_CargoControls.Count:SetAlpha( 1.0 );
                end
            end
        else
            self.m_Instance.Anchor:SetAlpha( 1.0 );
            self.m_Instance.HealthBar:SetAlpha( 1.0 );
            
            if( self.m_CargoControls ~= nil ) then
                if( self.m_CargoIsActive ) then
                    self.m_CargoControls.PullDown:GetButton():SetAlpha( 1.0 );
                else
                    self.m_CargoControls.PullDown:GetButton():SetAlpha( g_DimAirAlpha );
                end
            end
        end
    end,


    -----------------------------------------------------------------
    ------------------------------------------------------------------
    UnitMove = function( self, posX, posY, posZ )
    
        self:CheckEscort();
        self:UpdateFlagOffset();
           
        ------------------------
        if( g_PrintDebug ) then print( "Setting flag position" ); end
        self.m_Instance.Anchor:SetWorldPositionVal( posX, posY, posZ );
        
        if( self.m_HasCivilianSelectFlag )
        then
            if( g_PrintDebug ) then print( "Updating select flag pos" ); end
            --g_CivilianSelectFlag.m_Instance.Anchor:SetWorldPositionVal( posX, posY, posZ );
        end
        
    end,



    ------------------------------------------------------------------
    ------------------------------------------------------------------
	UpdateFlagOffset = function( self )
	
		local pUnit = Players[ self.m_PlayerID ]:GetUnitByID( self.m_UnitID );
        if pUnit == nil then
			return;
		end	

        local plot = pUnit:GetPlot();
        
        if plot == nil then
			return;
        end
        
        local offset = Vector2( 0, 0 );
        	            
        if pUnit:IsGarrisoned() then
            if( Game.GetActiveTeam() == Players[ self.m_PlayerID ]:GetTeam() ) then
				offset = GarrisonOffset;
			else
				offset = GarrisonOtherOffset;
            end 
        elseif plot:IsCity() then
            offset = CityNonGarrisonOffset;
        end


        if( self.m_CarrierFlag ~= nil ) then
            offset = VecAdd( offset, CivilianOffset );
            
        -- if we're a civilian and there's someone else with us            
		--[[
        elseif( self.m_IsCivilian and self.m_Escort ~= nil ) then
            if( not self.m_Escort.m_IsCivilian or -- if they are also a civilian try to only offset one of us
                self.m_UnitID < self.m_Escort.m_UnitID ) then
                offset = VecAdd( offset, CivilianOffset );
            end
        end
		--]]		
        elseif( self.m_Escort ~= nil ) then
            if( self.m_UnitID < self.m_Escort.m_UnitID ) then
                offset = VecAdd( offset, CivilianOffset );
            end
        end
        
        -- set the ui offset
        self.m_Instance.FlagShadow:SetOffset( offset );
    end,
}

--g_CivilianSelectFlag = g_UnitFlagClass:new( -1 );
--ContextPtr:BuildInstance( "NewUnitFlag", g_CivilianSelectFlag.m_Instance );
--g_CivilianSelectFlag.m_Instance.Anchor:SetHide( true );

-------------------------------------------------
-- On Unit Created
-------------------------------------------------
function OnUnitCreated( playerID, unitID, hexVec, unitType, cultureType, civID, primaryColor, secondaryColor, unitFlagIndex, fogState, selected, military, notInvisible )
    if( Players[ playerID ] == nil or
        Players[ playerID ]:GetUnitByID( unitID ) == nil or
        Players[ playerID ]:GetUnitByID( unitID ):IsDead() )
    then
        return;
    end
    
    -- support for debug panel
    g_LastPlayerID = playerID;
    g_LastUnitID   = unitID;
    
    if( g_PrintDebug ) then print( "  Unit Created: " .. tostring( playerID ) .. " " .. tostring( unitID ) .. " " .. fogState ); end
    
    g_UnitFlagClass:new( playerID, unitID, fogState, not notInvisible );
end
Events.SerialEventUnitCreated.Add( OnUnitCreated );



-------------------------------------------------
-- On Unit Position Changed
-- sent by the engine while it walks a unit around
-------------------------------------------------
function OnUnitPositionChanged( playerID, unitID, unitPosition )
    if( Players[ playerID ] == nil or
		not Players[ playerID ]:IsAlive() )
        --Players[ playerID ]:GetUnitByID( unitID ) == nil or
        --Players[ playerID ]:GetUnitByID( unitID ):IsDead() )
    then
        return;
    end
    
    if( g_MasterList[ playerID ] == nil or
        g_MasterList[ playerID ][ unitID ] == nil ) 
    then
        --print( string.format( "Unit not found for OnUnitMove: Player[%i] Unit[%i]", playerID, unitID ) );
    else                
        local worldOffset = Vector3( 0, 0, 35 );
        local position = VecAdd( unitPosition, worldOffset );
        g_MasterList[ playerID ][ unitID ]:UnitMove( position.x, position.y, position.z );
		g_MasterList[ playerID ][ unitID ]:UpdateTooltip();
    end
end
Events.LocalMachineUnitPositionChanged.Add( OnUnitPositionChanged );



--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function OnFlagTypeChange( playerID, unitID )
        
    if( Players[ playerID ] == nil or
		not Players[ playerID ]:IsAlive() or
        Players[ playerID ]:GetUnitByID( unitID ) == nil or
        Players[ playerID ]:GetUnitByID( unitID ):IsDead() )
    then
        return;
    end
    
    if( g_MasterList[ playerID ] == nil or
        g_MasterList[ playerID ][ unitID ] == nil ) 
    then
        --print( string.format( "Unit not found for OnFlagTypeChange: Player[%i] Unit[%i]", playerID, unitID ) );
    else
        local flag = g_MasterList[ playerID ][ unitID ];
        flag:UpdateFlagType();
        flag:UpdateFlagOffset();
		flag:UpdateTooltip();
    end
	UpdateCityCargo( Players[ playerID ]:GetUnitByID( unitID ):GetPlot() );
end
Events.UnitActionChanged.Add( OnFlagTypeChange );
Events.UnitGarrison.Add( OnFlagTypeChange );
Events.UnitEmbark.Add( OnFlagTypeChange );


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function UpdateFlagAtPlayerTurnStart(playerID)
	local player = Players[playerID]
	if (player == nil) or (not player:IsAlive()) then
		return
	end
	for unit in player:Units() do
		if not ( unit == nil or unit:IsDead() ) then

			local unitID = unit:GetID()
			if (unit:IsImmobile()) then
			OnUnitMoveQueueChanged( playerID, unitID, false )
			end
			--[[
			if not ( g_MasterList[ playerID ] == nil or
				     g_MasterList[ playerID ][ unitID ] == nil ) 
			then
				local flag = g_MasterList[ playerID ][ unitID ]			
				if( flag ~= nil ) then
					flag:UpdateTooltip()
				end
				
			end	
			--]]			
		end
	end
end
--GameEvents.PlayerDoTurn.Add(UpdateFlagAtPlayerTurnStart)


-------------------------------------------------
-- nukes teleport instead of moving
-------------------------------------------------
function OnUnitTeleported( i, j, playerID, unitID )
    -- spoof out the move queue changed logic.
    OnUnitMoveQueueChanged( playerID, unitID, false );
end
Events.SerialEventUnitTeleportedToHex.Add( OnUnitTeleported );
	
	
-------------------------------------------------
-- On Unit Move Queue Changed
-------------------------------------------------
function OnUnitMoveQueueChanged( playerID, unitID, bRemainingMoves )

	if( not bRemainingMoves )then

		local thisUnit = Players[ playerID ]:GetUnitByID( unitID );
		if( thisUnit ~= nil and g_MasterList[ playerID ] ~= nil ) then

			local flag = g_MasterList[ playerID ][ unitID ];
			
			if( flag ~= nil ) then
				flag:UpdateTooltip();

        		if( thisUnit:IsGarrisoned() ) then
    				flag:GarrisonComplete();
    			end

    			if( flag.m_CarrierFlag ~= nil ) then
    			    flag.m_CarrierFlag:UpdateCargo();
    		    end

    			if( thisUnit:IsCargo() ) then
    				flag.m_CarrierFlag = g_MasterList[ playerID ][ thisUnit:GetTransportUnit():GetID() ];
    			    
    			    if( flag.m_CarrierFlag ~= nil ) then
        			    flag.m_CarrierFlag:UpdateCargo();
    			    end
    		    else
    		        flag.m_CarrierFlag = nil;
    		    end


    		    local pPlot = thisUnit:GetPlot();
    			if( flag.m_CityFlag ~= nil ) then
    				UpdateCityCargo( g_CityFlagPlots[ flag.m_CityFlag ] );
    			    flag.m_CityFlag = nil;
    			end

    		    if( pPlot:IsCity() ) then
    			    flag.m_CityFlag = UpdateCityCargo( pPlot );
    			end

    		    flag:UpdateFlagOffset();
    		end
		end
	end
end
Events.UnitMoveQueueChanged.Add( OnUnitMoveQueueChanged );


-------------------------------------------------
-------------------------------------------------
function UpdateCityCargo( pPlot )
    --if( not pPlot:IsCity() ) then
        --return;
    --end
    
    local cargoCount = 0;
    local numUnits = pPlot:GetNumUnits();
    
    -- count the air units
    for i = 0, numUnits - 1 do
        local pPlotUnit = pPlot:GetUnit( i );
        if( pPlotUnit:GetDomainType() == DomainTypes.DOMAIN_AIR ) then
            cargoCount = cargoCount + 1;
        end
    end
    
    local cityFlagInstance = g_CityFlags[ pPlot:GetX() .. " " .. pPlot:GetY() ];
    if( cargoCount > 0 and pPlot:IsCity() ) then
        if( cityFlagInstance == nil ) then
            cityFlagInstance = {};
            ContextPtr:BuildInstanceForControl( "CityFlag", cityFlagInstance, Controls.CityContainer );
            cityFlagInstance.PullDown:RegisterSelectionCallback( UnitFlagClicked );
            g_CityFlags[ pPlot:GetX() .. " " .. pPlot:GetY() ] = cityFlagInstance;
            g_CityFlagPlots[ cityFlagInstance ] = pPlot;
        		        
        	local worldPos = Vector4( GridToWorld( pPlot:GetX(), pPlot:GetY() ) );
        	cityFlagInstance.Anchor:SetWorldPosition( VecAdd( worldPos, CityWorldPositionOffset ) );
	    end

        cityFlagInstance.PullDown:ClearEntries();
        
        -- actually add the air units
        for i = 0, numUnits - 1 do
            local pPlotUnit = pPlot:GetUnit( i );
            if( pPlotUnit:GetDomainType() == DomainTypes.DOMAIN_AIR ) then
            
                controlTable = {};
                cityFlagInstance.PullDown:BuildEntry( "UnitInstance", controlTable );
                
				local nameStr = Locale.ConvertTextKey(pPlotUnit:GetNameKey())				
				if (pPlotUnit:GetDamage() > 0) then
					local healthPercent = math.max(math.min(pPlotUnit:GetCurrHitPoints() / pPlotUnit:GetMaxHitPoints(), 1), 0)
					if healthPercent < 0.33 then
						nameStr = "[COLOR_WARNING_TEXT]".. nameStr .."[ENDCOLOR]"
					elseif healthPercent < 0.66 then
						nameStr = "[COLOR_YELLOW]".. nameStr .."[ENDCOLOR]"
					end
				end
                controlTable.Button:SetText( nameStr )

				local str = ""
				str = str .. pPlotUnit:GetNameNoDesc() .. "[NEWLINE]" .. Locale.ConvertTextKey(pPlotUnit:GetNameKey())
				str = str .. "[NEWLINE]" .. Locale.ConvertTextKey(GameInfo.UnitClasses[pPlotUnit:GetUnitClassType()].Description)
				if pPlotUnit:GetBaseCombatStrength() > 0 then
					str = str .. ", " .. pPlotUnit:GetBaseCombatStrength() .."[ICON_STRENGTH]"
				elseif pPlotUnit:GetBaseRangedCombatStrength() > 0 then					
					str = str .. ", " .. pPlotUnit:GetBaseRangedCombatStrength() .."[ICON_STRENGTH]"
				end
				-- Hit Points
				if (pPlotUnit:GetDamage() > 0) then
					str = str .. "[NEWLINE]" .. Locale.ConvertTextKey("TXT_KEY_UPANEL_SET_HITPOINTS_TT", pPlotUnit:GetMaxHitPoints() - pPlotUnit:GetDamage(), pPlotUnit:GetMaxHitPoints());
				end

				-- Activity
				if pPlotUnit:GetOwner() == Game.GetActivePlayer() then
					local activityType = pPlotUnit:GetActivityType()
					if activityType == ActivityTypes.ACTIVITY_INTERCEPT then
						str = str .. "[NEWLINE]" .. "On Interception"
					elseif activityType == ActivityTypes.ACTIVITY_HOLD then
						str = str .. "[NEWLINE]" .. "On Hold"
					elseif activityType == ActivityTypes.ACTIVITY_AWAKE then
						str = str .. "[NEWLINE]" .. "Waiting for orders"
					elseif activityType == ActivityTypes.ACTIVITY_SLEEP then
						str = str .. "[NEWLINE]" .. "Reserve squadron"
					end
				end

                controlTable.Button:SetToolTipString( str );
                controlTable.Button:SetVoids( pPlotUnit:GetOwner(), pPlotUnit:GetID() );
                
                if( pPlotUnit:MovesLeft() > 0 ) then
                    controlTable.Button:SetAlpha( 1.0 );
                else
                    controlTable.Button:SetAlpha( 0.6 );
                end
            end
        end
    
        cityFlagInstance.Count:SetText( cargoCount );
        cityFlagInstance.PullDown:LocalizeAndSetToolTip( "TXT_KEY_STATIONED_AIRCRAFT", cargoCount );
        cityFlagInstance.PullDown:CalculateInternals();
        cityFlagInstance.PullDown:SetHide( false );
        
        return cityFlagInstance;
    else
        if( cityFlagInstance ~= nil ) then
			cityFlagInstance.PullDown:SetHide( true );
        end
    end
end 


-------------------------------------------------
-------------------------------------------------
function OnCityCreated( hexPos, playerID, cityID, cultureType, eraType, continent, populationSize, size, fowState )
    local gridPosX, gridPosY = ToGridFromHex( hexPos.x, hexPos.y );
    --print( "gridPosX, gridPosY: "..tostring(gridPosX)..","..tostring(gridPosY) );
    local pCityFlag = UpdateCityCargo( Map.GetPlot( gridPosX, gridPosY ) );
    
    -- Set the visibility
    if (pCityFlag ~= nil) then
		local bInvisible = fowState ~= WhiteFog;
		
		pCityFlag.Anchor:SetHide( bInvisible );
   	end
    
end
Events.SerialEventCityCreated.Add( OnCityCreated );


-------------------------------------------------
-- On Unit Garrison
-------------------------------------------------
function OnUnitGarrison( playerID, unitID, bGarrisoned )
	if bGarrisoned and not UnitMoving(playerID, unitID) and g_MasterList[ playerID ] ~= nil then
		local flag = g_MasterList[ playerID ][ unitID ];
		if flag ~= nil then
			flag:GarrisonComplete();
			flag:UpdateTooltip();
		end
	end
end
Events.UnitGarrison.Add( OnUnitGarrison );


-------------------------------------------------
-- On Unit Destroyed
-------------------------------------------------
function OnUnitVisibility( playerID, unitID, visible, checkFlag, blendTime )
	if checkFlag then
		if( g_MasterList[ playerID ] ~= nil and
			g_MasterList[ playerID ][ unitID ] ~= nil ) then
	        
			local flag = g_MasterList[ playerID ][ unitID ];
			flag.m_IsInvisible = not visible;
			flag:UpdateVisibility();
			flag:UpdateTooltip();
		end
	end
end
Events.UnitVisibilityChanged.Add( OnUnitVisibility );


-------------------------------------------------
-- On Unit Destroyed
-------------------------------------------------
function OnUnitDestroyed( playerID, unitID )
    if( g_MasterList[ playerID ] == nil or
        g_MasterList[ playerID ][ unitID ] == nil ) 
    then
        --print( string.format( "Unit not found for OnUnitDestroyed: Player[%i] Unit[%i]", playerID, unitID ) );
    else
        g_MasterList[ playerID ][ unitID ]:destroy();
    end
end
Events.SerialEventUnitDestroyed.Add( OnUnitDestroyed );


-------------------------------------------------
-- On Flag Clicked
-------------------------------------------------
function UnitFlagClicked( playerID, unitID )
    Events.SerialEventUnitFlagSelected( playerID, unitID );
end


function UnitFlagEnter( playerID, unitID )
    if( g_MasterList[ playerID ] ~= nil and
        g_MasterList[ playerID ][ unitID ] ~= nil ) then
        
        g_MasterList[ playerID ][ unitID ]:OverrideDimmedFlag( true );
    end
end

function UnitFlagExit( playerID, unitID )
    if( g_MasterList[ playerID ] ~= nil and
        g_MasterList[ playerID ][ unitID ] ~= nil ) then
        
        local flag = g_MasterList[ playerID ][ unitID ];
        flag:OverrideDimmedFlag( flag.m_IsSelected or flag.m_IsGarrisoned );
    end
end



-------------------------------------------------
-------------------------------------------------
function OnUnitSelect( playerID, unitID, i, j, k, isSelected )

    if( Players[ playerID ] == nil or
		not Players[ playerID ]:IsAlive() or
        Players[ playerID ]:GetUnitByID( unitID ) == nil or
        Players[ playerID ]:GetUnitByID( unitID ):IsDead() )
    then
        return;
    end
    
    if( g_MasterList[ playerID ] == nil or
        g_MasterList[ playerID ][ unitID ] == nil ) 
    then
        print( string.format( "Unit not found for OnUnitSelect: Player[%i] Unit[%i]", playerID, unitID ) );
    else
        g_MasterList[ playerID ][ unitID ]:UpdateSelected( isSelected );
    end
	-- RED
	UpdateCityCargo( Players[ playerID ]:GetUnitByID( unitID ):GetPlot() );
end
Events.UnitSelectionChanged.Add( OnUnitSelect );



--------------------------------------------------------------------------------
-- Unit SetDamage was called - we only enter this function if the amount of damage actually changed
--------------------------------------------------------------------------------
function OnUnitSetDamage( playerID, unitID, iDamage, iPreviousDamage )
    if( Players[ playerID ] == nil or
		not Players[ playerID ]:IsAlive() or
        Players[ playerID ]:GetUnitByID( unitID ) == nil or
        Players[ playerID ]:GetUnitByID( unitID ):IsDead() )
    then
        return;
    end
    
	-- R.E.D. WWII start
	local plot = Players[ playerID ]:GetUnitByID( unitID ):GetPlot()
	if plot and plot:IsCity() then
		UpdateCityCargo( plot )
	end

	-- R.E.D. WWII end

    if( g_MasterList[ playerID ] == nil or
        g_MasterList[ playerID ][ unitID ] == nil ) 
    then
        --print( "Unit not found for OnUnitSetDamage: Player[" .. tostring( playerID ) .. "] Unit[" .. tostring( unitID ) .. "]" );
    else
        g_MasterList[ playerID ][ unitID ]:UpdateHealth();
    end
end
Events.SerialEventUnitSetDamage.Add( OnUnitSetDamage );



------------------------------------------------------------
-- this goes off when a hex is seen or unseen
------------------------------------------------------------
function OnHexFogEvent( hexPos, fogState, bWholeMap )
    if( bWholeMap ) 
    then
        for playerID,playerTable in pairs( g_MasterList ) 
        do
            for unitID,flag in pairs( playerTable ) 
            do
                flag:SetFogState( fogState );
            end
        end

		-- Do the city flags        
		local bInvisible = fogState ~= WhiteFog;
		for cityIndex, pCityFlag in pairs(g_CityFlags) do
			pCityFlag.Anchor:SetHide( bInvisible );
		end
    else
        local gridVecX, gridVecY = ToGridFromHex( hexPos.x, hexPos.y );
        local plot = Map.GetPlot( gridVecX, gridVecY );
        
        if( plot ~= nil ) then
        
            local unitCount = plot:GetNumUnits();
            
            for i = 0, unitCount - 1, 1
            do
                local unit = plot:GetUnit( i );
                if( unit ~= nil ) 
                then
                    local owner, unitID = unit:GetOwner(), unit:GetID();
                    if( g_MasterList[ owner ] ~= nil and
                        g_MasterList[ owner ][ unitID ] ~= nil )
                    then
                        --print( " FOG OF WAR'd!! " .. owner .. " " .. unitID .. " " .. fogState );
                        g_MasterList[ owner ][ unitID ]:SetFogState( fogState );
                    end
                end
            end
            
            -- Do city flag
			local bInvisible = fogState ~= WhiteFog;
			for cityIndex, pCityFlag in pairs( g_CityFlags )
			do				
				-- The flag doesn't seem to store its plot, so we have to search using the instance to plot map.
				local pCityFlagPlot = g_CityFlagPlots[ pCityFlag ];
				if (pCityFlagPlot == plot ) then
					pCityFlag.Anchor:SetHide( bInvisible );
					break;
				end				
			end
        end
    end
end
Events.HexFOWStateChanged.Add( OnHexFogEvent );



------------------------------------------------------------
-- this goes off when a unit moves into or out of the fog
------------------------------------------------------------
function OnUnitFogEvent( playerID, unitID, fogState )
    if( Players[ playerID ] == nil or
		not Players[ playerID ]:IsAlive() or
        Players[ playerID ]:GetUnitByID( unitID ) == nil or
        Players[ playerID ]:GetUnitByID( unitID ):IsDead() )
    then
        return;
    end

    playerTable = g_MasterList[ playerID ];
    if( playerTable ~= nil ) 
    then
        local flag = playerTable[ unitID ];
        if( flag ~= nil ) 
        then
            flag:SetFogState( fogState );
        end
    end
end
Events.UnitStateChangeDetected.Add( OnUnitFogEvent );



------------------------------------------------------------
-- this goes off when gameplay decides a unit's flag should be dimmed or not
------------------------------------------------------------
function OnDimEvent( playerID, unitID, bDim )
    if( Players[ playerID ] == nil or
		not Players[ playerID ]:IsAlive() or
        Players[ playerID ]:GetUnitByID( unitID ) == nil or
        Players[ playerID ]:GetUnitByID( unitID ):IsDead() )
    then
        return;
    end

    playerTable = g_MasterList[ playerID ];
    if( playerTable ~= nil ) 
    then
        local flag = playerTable[ unitID ];
        if( flag ~= nil ) 
        then
        	local active_team = Players[Game.GetActivePlayer()]:GetTeam();
        	local team = Players[playerID]:GetTeam();
        	
        	if( active_team == team )
        	then
                --print( "  Unit dim: " .. tostring( playerID ) .. " " .. tostring( unitID ) .. " " .. iDim );
                flag:SetDim( bDim  );
				flag:UpdateTooltip();
        	end
        end
    end
end
Events.UnitShouldDimFlag.Add( OnDimEvent );



------------------------------------------------------------
-- this goes off when gameplay decides a unit is threatening and wants it marked
------------------------------------------------------------
function OnMarkThreateningEvent( playerID, unitID, bMark )
	
	Dprint("Marking Unit as Threatening: " .. tostring(playerID) .. ", " .. tostring(unitID) .. ", " .. tostring(bMark));
	
    if( Players[ playerID ] == nil or
		not Players[ playerID ]:IsAlive() or
        Players[ playerID ]:GetUnitByID( unitID ) == nil or
        Players[ playerID ]:GetUnitByID( unitID ):IsDead() )
    then
        return;
    end

    playerTable = g_MasterList[ playerID ];
    if( playerTable ~= nil ) 
    then
        local flag = playerTable[ unitID ];
        if( flag ~= nil ) 
        then
            Dprint( "  Unit mark threatening: " .. tostring( playerID ) .. " " .. tostring( unitID ) .. " " .. tostring(bMark) );
            flag:SetFlash(bMark);
        end
    end
end
Events.UnitMarkThreatening.Add( OnMarkThreateningEvent );










-- -------------------------------------------------------
-- temp to make updating units easier
-- -------------------------------------------------------
g_LastPlayerID = 0;
g_LastUnitID   = 0;



------------------------------------------------------------
-- scan for all cities when we are loaded
-- this keeps the banners from disappearing on hotload
------------------------------------------------------------
if( ContextPtr:IsHotLoad() )
then
    local i = 0;
    local player = Players[i];
    while player ~= nil 
    do
        if( player:IsAlive() )
        then
            for unit in player:Units() do
                local plot = Map.GetPlot( unit:GetX(), unit:GetY() );
                if( plot ~= nil ) then
                    if( plot:IsVisible( Game.GetActiveTeam() ) ) then
                        OnUnitCreated( player:GetID(), unit:GetID(), 0, 0, 0, 0, 0, 0, 0, WhiteFog, 0, 0, true );
                    end
                end
            end
        end

        i = i + 1;
        player = Players[i];
    end
end

------------------------------------------------------------
------------------------------------------------------------
function OnStrategicViewStateChanged( bStrategicView, bCityBanners )
	g_GarrisonedUnitFlagsInStrategicView = bStrategicView and bCityBanners;
	for playerID,playerTable in pairs( g_MasterList ) 
	do
		for unitID,flag in pairs( playerTable ) 
		do
			flag:UpdateVisibility();
		end
	end
end
Events.StrategicViewStateChanged.Add(OnStrategicViewStateChanged);


------------------------------------------------------------
------------------------------------------------------------
function OnCityDestroyed( hexPos, playerID, cityID )
    local pPlot = Map.GetPlot( ToGridFromHex( hexPos.x, hexPos.y ) );
    if( pPlot ~= nil ) then
        local count = pPlot:GetNumUnits();
        for i = 0, count - 1 do
            local pUnit = pPlot:GetUnit( i );
            if( pUnit ~= nil ) then
                local playerTable = g_MasterList[ pUnit:GetOwner() ];
                if( playerTable ~= nil ) then
                    local pFlag = playerTable[ pUnit:GetID() ];
                    if( pFlag ~= nil ) then
                        pFlag:UpdateFlagOffset();
                    end
                end
            end
        end
        
        UpdateCityCargo( pPlot );
    end
end
Events.SerialEventCityDestroyed.Add(OnCityDestroyed);
Events.SerialEventCityCaptured.Add(OnCityDestroyed);


------------------------------------------------------------
------------------------------------------------------------
function OnCombatBegin( m_AttackerPlayer,
                        m_AttackerUnitID,
                        m_AttackerUnitDamage,
                        m_AttackerFinalUnitDamage,
                        m_AttackerMaxHitPoints,
                        m_DefenderPlayer,
                        m_DefenderUnitID,
                        m_DefenderUnitDamage,
                        m_DefenderFinalUnitDamage,
                        m_DefenderMaxHitPoints, 
                        m_bContinuation )
    --print( "CombatBegin" );
                        
    local playerTable = g_MasterList[ m_AttackerPlayer ];
    if( playerTable ~= nil ) 
    then
        local flag = playerTable[ m_AttackerUnitID ];
        if( flag ~= nil and flag.m_IsCurrentlyVisible == true ) 
        then
            flag.m_Instance.Anchor:SetHide( true );
            if( flag.m_Escort ~= nil ) then
                flag.m_Escort.m_Instance.Anchor:SetHide( true );
            end
        end
    end
    
	playerTable = g_MasterList[ m_DefenderPlayer ];
    if( playerTable ~= nil ) 
    then
        local flag = playerTable[ m_DefenderUnitID ];
        if( flag ~= nil and flag.m_IsCurrentlyVisible == true ) 
        then
            flag.m_Instance.Anchor:SetHide( true );
            if( flag.m_Escort ~= nil ) then
                flag.m_Escort.m_Instance.Anchor:SetHide( true );
            end
        end
    end
end
Events.RunCombatSim.Add( OnCombatBegin );


------------------------------------------------------------
------------------------------------------------------------
function OnCombatEnd( m_AttackerPlayer,
                      m_AttackerUnitID,
                      m_AttackerUnitDamage,
                      m_AttackerFinalUnitDamage,
                      m_AttackerMaxHitPoints,
                      m_DefenderPlayer,
                      m_DefenderUnitID,
                      m_DefenderUnitDamage,
                      m_DefenderFinalUnitDamage,
                      m_DefenderMaxHitPoints )
                         
    local playerTable = g_MasterList[ m_AttackerPlayer ];
    if( playerTable ~= nil ) 
    then
        local flag = playerTable[ m_AttackerUnitID ];
        if( flag ~= nil ) 
        then
            flag:UpdateVisibility();
        end
    end
    
	playerTable = g_MasterList[ m_DefenderPlayer ];
    if( playerTable ~= nil ) 
    then
        local flag = playerTable[ m_DefenderUnitID ];
        if( flag ~= nil ) 
        then
            flag:UpdateVisibility();
			flag:UpdateTooltip();
        end
    end           
end
Events.EndCombatSim.Add( OnCombatEnd );


----------------------------------------------------------------
-- on shutdown, we need to get the selected flag instance back, 
-- or we'll assert clearing the registered button handler
function OnShutdown()
    -- doesn't really matter where we put it, as long as we own it again.
    if( g_SelectedFlag ~= nil ) then
        g_SelectedFlag.m_Instance.Anchor:ChangeParent( Controls.MilitaryFlags );
    end
end
ContextPtr:SetShutdown( OnShutdown );

----------------------------------------------------------------
-- 'Active' (local human) player has changed
----------------------------------------------------------------
function OnActivePlayerChanged( iActivePlayer, iPrevActivePlayer )

	local iActivePlayerID = Game.GetActivePlayer();
	
	-- Rebuild all the tool tip strings.
	for playerID,playerTable in pairs( g_MasterList ) 
	do
		local pPlayer = Players[ playerID ];
		
		-- Only need to do this for human players
		if (pPlayer:IsHuman()) then	
			for unitID, pFlag in pairs( playerTable ) 
			do
				local pUnit = pPlayer:GetUnitByID( unitID );
				if ( pUnit ~= nil ) then        	
					local toolTipString;
					if (PreGame.IsMultiplayerGame()) then
						toolTipString = Locale.ConvertTextKey("TXT_KEY_MULTIPLAYER_UNIT_TT", pPlayer:GetNickName(), pPlayer:GetCivilizationAdjectiveKey(), pUnit:GetNameKey());
					else
						if (pUnit:HasName()) then
							local desc = Locale.ConvertTextKey("TXT_KEY_PLOTROLL_UNIT_DESCRIPTION_CIV",  pPlayer:GetCivilizationAdjectiveKey(), pUnit:GetNameKey());
							toolTipString = string.format("%s (%s)", pUnit:GetName(), desc);
						else
							toolTipString = Locale.ConvertTextKey("TXT_KEY_PLOTROLL_UNIT_DESCRIPTION_CIV",  pPlayer:GetCivilizationAdjectiveKey(), pUnit:GetNameKey());
						end
					end

					if ( playerID == iActivePlayer ) then
						toolTipString = toolTipString .. Locale.ConvertTextKey( "TXT_KEY_UPANEL_CLICK_TO_SELECT" );
					end
					
					pFlag.m_Instance.UnitIcon:SetToolTipString( toolTipString );			
				end
			end
		end
	end
end
Events.GameplaySetActivePlayer.Add(OnActivePlayerChanged);

-- Added by Erendir
include"UnitFlagManager_addin"
-- End Add

function UpdateAllFlags()
	print ("Updating all units flag...")
	local iActivePlayerID = Game.GetActivePlayer();
	
	-- Rebuild all the tool tip strings.
	for playerID,playerTable in pairs( g_MasterList ) 
	do
		local pPlayer = Players[ playerID ]		
		for unitID, pFlag in pairs( playerTable ) 
		do
			local pUnit = pPlayer:GetUnitByID( unitID )
			if ( pUnit ~= nil ) then        	
				pFlag:UpdateVisibility()
				pFlag:UpdateTooltip()
			end
		end
	end
end
--Events.SequenceGameInitComplete.Add( UpdateAllFlags )
Events.LoadScreenClose.Add(UpdateAllFlags)
LuaEvents.WWIITest.Add(UpdateAllFlags)