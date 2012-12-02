-------------------------------------------------
-- Action Info Panel
-------------------------------------------------
include( "IconSupport" );
include( "InstanceManager" );

local g_ActiveNotifications = {};
local g_Instances = {};


-------------------------------------------------------------------------------
-- details for dynamically sizing the small notification stack
-------------------------------------------------------------------------------
local DIPLO_SIZE_GUESS = 120;
local _, screenY = UIManager:GetScreenSizeVal();
local _, offsetY = Controls.OuterStack:GetOffsetVal();
local g_SmallScrollMax = screenY - offsetY - DIPLO_SIZE_GUESS;



-------------------------------------------------
-------------------------------------------------
function GenericLeftClick( Id )
	UI.ActivateNotification( Id )
end


-------------------------------------------------
-------------------------------------------------
function GenericRightClick ( Id )
	UI.RemoveNotification( Id )
end






------------------------------------------------------------------------------------
-- set up the exceptions
------------------------------------------------------------------------------------
Controls[ "TechButton" ]:RegisterCallback( Mouse.eLClick, GenericLeftClick );
Controls[ "TechButton" ]:RegisterCallback( Mouse.eRClick, GenericRightClick );
Controls[ "ProductionButton" ]:RegisterCallback( Mouse.eLClick, GenericLeftClick );
Controls[ "ProductionButton" ]:RegisterCallback( Mouse.eRClick, GenericRightClick );
Controls[ "FreeTechButton" ]:RegisterCallback( Mouse.eLClick, GenericLeftClick );
Controls[ "FreeTechButton" ]:RegisterCallback( Mouse.eRClick, GenericRightClick );
Controls[ "FreePolicyButton" ]:RegisterCallback( Mouse.eLClick, GenericLeftClick );
Controls[ "FreePolicyButton" ]:RegisterCallback( Mouse.eRClick, GenericRightClick );
Controls[ "FreeGreatPersonButton" ]:RegisterCallback( Mouse.eLClick, GenericLeftClick );
Controls[ "FreeGreatPersonButton" ]:RegisterCallback( Mouse.eRClick, GenericRightClick );

------------------------------------------------------------------------------------
-- build the list of types we can handle
------------------------------------------------------------------------------------
local g_NameTable = {};
g_NameTable[ -1 ]																= "Generic";
g_NameTable[ NotificationTypes.NOTIFICATION_POLICY ]							= "SocialPolicy";
g_NameTable[ NotificationTypes.NOTIFICATION_MET_MINOR ]							= "MetCityState";
g_NameTable[ NotificationTypes.NOTIFICATION_MINOR ]								= "CityState";
g_NameTable[ NotificationTypes.NOTIFICATION_MINOR_QUEST ]						= "CityState";
g_NameTable[ NotificationTypes.NOTIFICATION_ENEMY_IN_TERRITORY ]				= "EnemyInTerritory";
g_NameTable[ NotificationTypes.NOTIFICATION_REBELS ]				= "EnemyInTerritory";
g_NameTable[ NotificationTypes.NOTIFICATION_CITY_RANGE_ATTACK ]					= "Generic";
g_NameTable[ NotificationTypes.NOTIFICATION_BARBARIAN ]							= "Barbarian";
g_NameTable[ NotificationTypes.NOTIFICATION_GOODY ]								= "AncientRuins";
g_NameTable[ NotificationTypes.NOTIFICATION_BUY_TILE ]							= "BuyTile";
g_NameTable[ NotificationTypes.NOTIFICATION_CITY_GROWTH ]						= "CityGrowth";
g_NameTable[ NotificationTypes.NOTIFICATION_CITY_TILE ]							= "CityTile";
g_NameTable[ NotificationTypes.NOTIFICATION_DEMAND_RESOURCE ]					= "BonusResource";
g_NameTable[ NotificationTypes.NOTIFICATION_UNIT_PROMOTION ]					= "UnitPromoted";
--g_NameTable[ NotificationTypes.NOTIFICATION_WONDER_STARTED ]					= "WonderConstructed";
g_NameTable[ NotificationTypes.NOTIFICATION_WONDER_COMPLETED_ACTIVE_PLAYER]     = "WonderConstructed";
g_NameTable[ NotificationTypes.NOTIFICATION_WONDER_COMPLETED ]					= "WonderConstructed";
g_NameTable[ NotificationTypes.NOTIFICATION_WONDER_BEATEN ]						= "WonderConstructed";
g_NameTable[ NotificationTypes.NOTIFICATION_GOLDEN_AGE_BEGUN_ACTIVE_PLAYER ]	= "GoldenAge";
--g_NameTable[ NotificationTypes.NOTIFICATION_GOLDEN_AGE_BEGUN ]				= "GoldenAge";
g_NameTable[ NotificationTypes.NOTIFICATION_GOLDEN_AGE_ENDED_ACTIVE_PLAYER ]	= "GoldenAge";
--g_NameTable[ NotificationTypes.NOTIFICATION_GOLDEN_AGE_ENDED ]				= "GoldenAge";
g_NameTable[ NotificationTypes.NOTIFICATION_GREAT_PERSON_ACTIVE_PLAYER ]		= "GreatPerson";
--g_NameTable[ NotificationTypes.NOTIFICATION_GREAT_PERSON ]					= "GreatPerson";
g_NameTable[ NotificationTypes.NOTIFICATION_STARVING ]							= "Starving";
g_NameTable[ NotificationTypes.NOTIFICATION_WAR_ACTIVE_PLAYER ]                 = "War";
g_NameTable[ NotificationTypes.NOTIFICATION_WAR ]								= "WarOther";
g_NameTable[ NotificationTypes.NOTIFICATION_PEACE_ACTIVE_PLAYER ]				= "Peace";
g_NameTable[ NotificationTypes.NOTIFICATION_PEACE ]								= "PeaceOther";
g_NameTable[ NotificationTypes.NOTIFICATION_VICTORY ]							= "Victory";
g_NameTable[ NotificationTypes.NOTIFICATION_UNIT_DIED ]							= "UnitDied";
g_NameTable[ NotificationTypes.NOTIFICATION_CITY_LOST ]							= "CapitalLost";
g_NameTable[ NotificationTypes.NOTIFICATION_CAPITAL_LOST_ACTIVE_PLAYER ]        = "CapitalLost";
g_NameTable[ NotificationTypes.NOTIFICATION_CAPITAL_LOST ]						= "CapitalLost";
g_NameTable[ NotificationTypes.NOTIFICATION_CAPITAL_RECOVERED ]					= "CapitalRecovered";
g_NameTable[ NotificationTypes.NOTIFICATION_PLAYER_KILLED ]						= "CapitalLost";
g_NameTable[ NotificationTypes.NOTIFICATION_DISCOVERED_LUXURY_RESOURCE ]		= "LuxuryResource";
g_NameTable[ NotificationTypes.NOTIFICATION_DISCOVERED_STRATEGIC_RESOURCE ]		= "StrategicResource";
g_NameTable[ NotificationTypes.NOTIFICATION_DISCOVERED_BONUS_RESOURCE ]			= "BonusResource";
--g_NameTable[ NotificationTypes.NOTIFICATION_POLICY_ADOPTION ]					= "Generic";
g_NameTable[ NotificationTypes.NOTIFICATION_DIPLO_VOTE ]						= "Generic";
g_NameTable[ NotificationTypes.NOTIFICATION_RELIGION_RACE ]						= "Generic";
g_NameTable[ NotificationTypes.NOTIFICATION_EXPLORATION_RACE ]					= "NaturalWonder";
g_NameTable[ NotificationTypes.NOTIFICATION_DIPLOMACY_DECLARATION ]				= "Diplomacy";
g_NameTable[ NotificationTypes.NOTIFICATION_DEAL_EXPIRED_GPT ]					= "DiplomacyX";
g_NameTable[ NotificationTypes.NOTIFICATION_DEAL_EXPIRED_RESOURCE ]				= "DiplomacyX";
g_NameTable[ NotificationTypes.NOTIFICATION_DEAL_EXPIRED_OPEN_BORDERS ]			= "DiplomacyX";
g_NameTable[ NotificationTypes.NOTIFICATION_DEAL_EXPIRED_DEFENSIVE_PACT ]		= "DiplomacyX";
g_NameTable[ NotificationTypes.NOTIFICATION_DEAL_EXPIRED_RESEARCH_AGREEMENT ]	= "DiplomacyX";
g_NameTable[ NotificationTypes.NOTIFICATION_DEAL_EXPIRED_TRADE_AGREEMENT ]		= "DiplomacyX";
g_NameTable[ NotificationTypes.NOTIFICATION_TECH_AWARD ]						= "TechAward";
g_NameTable[ NotificationTypes.NOTIFICATION_PLAYER_DEAL ]						= "Diplomacy";
g_NameTable[ NotificationTypes.NOTIFICATION_PLAYER_DEAL_RECEIVED ]				= "Diplomacy";
g_NameTable[ NotificationTypes.NOTIFICATION_PLAYER_DEAL_RESOLVED ]				= "Diplomacy";
g_NameTable[ NotificationTypes.NOTIFICATION_PROJECT_COMPLETED ]					= "ProjectConstructed";


g_NameTable[ NotificationTypes.NOTIFICATION_TECH ]       = "Tech";
g_NameTable[ NotificationTypes.NOTIFICATION_PRODUCTION ] = "Production";
g_NameTable[ NotificationTypes.NOTIFICATION_FREE_TECH ]	 = "FreeTech";
g_NameTable[ NotificationTypes.NOTIFICATION_FREE_POLICY ]	 = "FreePolicy";
g_NameTable[ NotificationTypes.NOTIFICATION_FREE_GREAT_PERSON ]	 = "FreeGreatPerson";

g_NameTable[ NotificationTypes.NOTIFICATION_DENUNCIATION_EXPIRED ]	= "Diplomacy";
g_NameTable[ NotificationTypes.NOTIFICATION_FRIENDSHIP_EXPIRED ] = "Diplomacy";

------------------------------------------------------------------------------------
------------------------------------------------------------------------------------
--- Actual new notification entry point
------------------------------------------------------------------------------------
------------------------------------------------------------------------------------

-------------------------------------------------
-------------------------------------------------
function OnNotificationAdded( Id, type, toolTip, strSummary, iGameValue, iExtraGameData )

	-- R.E.D. WWI start
	local turn = Game.GetGameTurn()
	if turn == 0 then return end -- no notificationon at start
	if turn < 2 and Game.IsHotSeat() then return end -- no notificationon at start in hotseat
	-- R.E.D. WWII end

	--[[
    print( "NotificationAdded " .. tostring( Id ) .. " " 
                                .. tostring( type ) .. " " 
                                .. tostring( iGameValue ) .. " " 
                                .. tostring( iExtraGameData ) .. " " 
                                .. tostring( strSummary ) .. " " 
                                .. tostring( toolTip ) );
    --]]
    if( g_ActiveNotifications[ Id ] ~= nil )
    then
        -- print( "Redundant Notification Id: "..tostring(Id) );
        return;
    end
       
    local name = g_NameTable[ type ];
    
    
    local button;
--    local title;
    local text;
--    local frame;
    local bg;
    local fingerTitle;
    local root;
        
    if( name == "Production" or
        name == "Tech" or
        name == "FreeTech" or
        name == "FreePolicy" or
	name == "FreeGreatPerson" )
    then
        button = Controls[ name .. "Button"  ];
--        title  = Controls[ name .. "Title"  ];
        text   = Controls[ name .. "Text"   ];
--        frame  = Controls[ name .. "Frame"  ];
        bg     = Controls[ name .. "BG"   ];
        
    else
        if( name == nil )
        then
            print( "Unknown Notification, Adding generic " .. Id );
            name = "Generic";
        end

        local instance = {};
        ContextPtr:BuildInstanceForControl( name .. "Item", instance, Controls.SmallStack );
        g_Instances[ Id ] = instance;
        
        button = instance[ name .. "Button" ];
		--print(name.."Button: "..tostring(button))
        text   = instance[ name .. "Text" ];
        root   = instance[ name .. "Container" ];
        
        
        instance.FingerTitle:SetText( strSummary );
        root:BranchResetAnimation();
        
		--if type == NotificationTypes.NOTIFICATION_WONDER_STARTED
		if type == NotificationTypes.NOTIFICATION_WONDER_COMPLETED_ACTIVE_PLAYER
		or type == NotificationTypes.NOTIFICATION_WONDER_COMPLETED
		or type == NotificationTypes.NOTIFICATION_WONDER_BEATEN then
			if iGameValue ~= -1 then
				local portraitIndex = GameInfo.Buildings[iGameValue].PortraitIndex;
				if portraitIndex ~= -1 then
					IconHookup( portraitIndex, 80, GameInfo.Buildings[iGameValue].IconAtlas, instance.WonderConstructedAlphaAnim );				
				end
			end
			if iExtraGameData ~= -1 then
				CivIconHookup( iExtraGameData, 45, instance.CivIcon, instance.CivIconBG, instance.CivIconShadow, false, true );
				instance.WonderSmallCivFrame:SetHide(false);				
			else
				CivIconHookup( 22, 45, instance.CivIcon, instance.CivIconBG, instance.CivIconShadow, false, true );
				instance.WonderSmallCivFrame:SetHide(true);				
			end
		elseif type == NotificationTypes.NOTIFICATION_PROJECT_COMPLETED then
			if iGameValue ~= -1 then
				local portraitIndex = GameInfo.Projects[iGameValue].PortraitIndex;
				if portraitIndex ~= -1 then
					IconHookup( portraitIndex, 80, GameInfo.Projects[iGameValue].IconAtlas, instance.ProjectConstructedAlphaAnim );				
				end
			end
			if iExtraGameData ~= -1 then
				CivIconHookup( iExtraGameData, 45, instance.CivIcon, instance.CivIconBG, instance.CivIconShadow, false, true );
				instance.ProjectSmallCivFrame:SetHide(false);				
			else
				CivIconHookup( 22, 45, instance.CivIcon, instance.CivIconBG, instance.CivIconShadow, false, true );
				instance.ProjectSmallCivFrame:SetHide(true);				
			end
		elseif type == NotificationTypes.NOTIFICATION_DISCOVERED_LUXURY_RESOURCE 
		or type == NotificationTypes.NOTIFICATION_DISCOVERED_STRATEGIC_RESOURCE 
		or type == NotificationTypes.NOTIFICATION_DISCOVERED_BONUS_RESOURCE 
		or type == NotificationTypes.NOTIFICATION_DEMAND_RESOURCE then
			local thisResourceInfo = GameInfo.Resources[iGameValue];
			local portraitIndex = thisResourceInfo.PortraitIndex;
			if portraitIndex ~= -1 then
				IconHookup( portraitIndex, 80, thisResourceInfo.IconAtlas, instance.ResourceImage );				
			end
		elseif type == NotificationTypes.NOTIFICATION_EXPLORATION_RACE then
			local thisFeatureInfo = GameInfo.Features[iGameValue];
			local portraitIndex = thisFeatureInfo.PortraitIndex;
			if portraitIndex ~= -1 then
				IconHookup( portraitIndex, 80, thisFeatureInfo.IconAtlas, instance.NaturalWonderImage );				
			end
		elseif type == NotificationTypes.NOTIFICATION_TECH_AWARD then
			local thisTechInfo = GameInfo.Technologies[iExtraGameData];
			local portraitIndex = thisTechInfo.PortraitIndex;
			if portraitIndex ~= -1 then
				IconHookup( portraitIndex, 80, thisTechInfo.IconAtlas, instance.TechAwardImage );				
			else
				instance.TechAwardImage:SetHide( true );
			end
		elseif type == NotificationTypes.NOTIFICATION_UNIT_PROMOTION
		or type == NotificationTypes.NOTIFICATION_UNIT_DIED 
		or type == NotificationTypes.NOTIFICATION_GREAT_PERSON_ACTIVE_PLAYER 			
		or type == NotificationTypes.NOTIFICATION_ENEMY_IN_TERRITORY
		or type == NotificationTypes.NOTIFICATION_REBELS then
			local thisUnitType = iGameValue;
			local thisUnitInfo = GameInfo.Units[thisUnitType];
			local portraitIndex = thisUnitInfo.PortraitIndex;
			if portraitIndex ~= -1 then
				IconHookup( portraitIndex, 80, thisUnitInfo.IconAtlas, instance.UnitImage );				
			end
		elseif type == NotificationTypes.NOTIFICATION_WAR_ACTIVE_PLAYER then
			local index = iGameValue;
			CivIconHookup( index, 80, instance.WarImage, instance.CivIconBG, instance.CivIconShadow, false, true ); 
		elseif type == NotificationTypes.NOTIFICATION_WAR then
			local index = iGameValue;
			CivIconHookup( index, 45, instance.War1Image, instance.Civ1IconBG, instance.Civ1IconShadow, false, true );
			index = iExtraGameData;
			CivIconHookup( index, 45, instance.War2Image, instance.Civ2IconBG, instance.Civ2IconShadow, false, true );
		elseif type == NotificationTypes.NOTIFICATION_PEACE_ACTIVE_PLAYER then
			local index = iGameValue;
			CivIconHookup( index, 80, instance.PeaceImage, instance.CivIconBG, instance.CivIconShadow, false, true );
		elseif type == NotificationTypes.NOTIFICATION_PEACE then
			local index = iGameValue;
			CivIconHookup( index, 45, instance.Peace1Image, instance.Civ1IconBG, instance.Civ1IconShadow, false, true );
			index = iExtraGameData;
			CivIconHookup( index, 45, instance.Peace2Image, instance.Civ2IconBG, instance.Civ2IconShadow, false, true );
		end
       
    end
    
    button:SetHide( false );
    button:SetVoid1( Id );
    button:RegisterCallback( Mouse.eLClick, GenericLeftClick );
    button:RegisterCallback( Mouse.eRClick, GenericRightClick );
--    title:SetText( name );
--    text:SetText( toolTip );
    
    local strToolTip = toolTip;
    button:SetToolTipString(strToolTip);
    
       
    g_ActiveNotifications[ Id ] = type;
    
    ProcessStackSizes();

end
Events.NotificationAdded.Add( OnNotificationAdded );


-------------------------------------------------
-------------------------------------------------
function RemoveNotificationID( Id )

    if( g_ActiveNotifications[ Id ] == nil )
    then
        print( "Attempt to remove unknown Notification " .. tostring( Id ) );
        return;
    end

    local name = g_NameTable[ g_ActiveNotifications[ Id ] ];
    
    if( name == "Production" or
        name == "Tech" or
        name == "FreeTech" or
        name == "FreePolicy" or
	name == "FreeGreatPerson" )
    then
        Controls[ name .. "Button" ]:SetHide( true );
    else
     
        if( name == nil ) then
            name = "Generic";
        end
        
        local instance = g_Instances[ Id ];
        if( instance ~= nil ) then
			Controls.SmallStack:ReleaseChild( instance[ name .. "Container" ] );
		    g_Instances[ Id ] = nil;
		end
        
    end
    
	g_ActiveNotifications[ Id ] = nil;    
end

-------------------------------------------------
-------------------------------------------------
function NotificationRemoved( Id )

    --print( "removing Notification " .. Id .. " " .. tostring( g_ActiveNotifications[ Id ] ) .. " " .. tostring( g_NameTable[ g_ActiveNotifications[ Id ] ] ) );
        
	RemoveNotificationID( Id );	
    ProcessStackSizes();

end
Events.NotificationRemoved.Add( NotificationRemoved );

----------------------------------------------------------------
-- 'Active' (local human) player has changed
----------------------------------------------------------------
function OnNotificationPanelActivePlayerChanged( iActivePlayer, iPrevActivePlayer )

	-- Remove all the UI notifications.  The new player will rebroadcast any persistent ones from their last turn	
	for thisID, thisType in pairs(g_ActiveNotifications) do
		RemoveNotificationID(thisID);
	end

end
Events.GameplaySetActivePlayer.Add(OnNotificationPanelActivePlayerChanged);


-------------------------------------------------
-------------------------------------------------
function ProcessStackSizes()

    Controls.BigStack:CalculateSize();
    local bigY = Controls.BigStack:GetSizeY();
    Controls.SmallScrollPanel:SetSizeY( g_SmallScrollMax - bigY );

    Controls.SmallStack:CalculateSize();
    Controls.SmallStack:ReprocessAnchoring();

	Controls.SmallScrollPanel:CalculateInternalSize();
    if( Controls.SmallScrollPanel:GetRatio() ~= 1 ) then
        Controls.SmallScrollPanel:SetOffsetVal( 20, 0 );
    else
        Controls.SmallScrollPanel:SetOffsetVal( 0, 0 );
    end
    
    Controls.OuterStack:CalculateSize();
    Controls.OuterStack:ReprocessAnchoring();


    --[[   logic for autosized background grids
    local _, y = Controls.BigStack:GetSizeVal();
    if( y > 0 ) then
    	Controls.BigGrid:DoAutoSize();
    	Controls.BigGrid:SetHide( false );
    else
    	Controls.BigGrid:SetHide( true );
    end
    
    local _, y = Controls.SmallStack:GetSizeVal();
	if( y > 0 ) then
    	Controls.SmallGrid:DoAutoSize();
    	Controls.SmallGrid:SetHide( false );
	else
    	Controls.SmallGrid:SetHide( true );
	end
	--]]
	  
end


UI.RebroadcastNotifications();
ProcessStackSizes();