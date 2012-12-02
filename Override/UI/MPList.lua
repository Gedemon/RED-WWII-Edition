-------------------------------------------------
-- Diplomacy and Advisors Buttons that float out in the screen
-------------------------------------------------

-------------------------------------------------------------------------------------------------------
-- R.E.D. WW II edition
-------------------------------------------------------------------------------------------------------
include ("RedOverrideInclude")
-------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------

include( "IconSupport" );
include( "SupportFunctions"  );
include( "InstanceManager" );

local g_pLocalTeam = Teams[ Players[ Game.GetActivePlayer() ]:GetTeam() ];
local g_bRebuildMPList = false;
local g_SortTable = {};
local g_PlayerEntries = {};
local g_TeamEntries = {};
local g_TeamData = {};

local TOP_COMPENSATION = 120;
local CHAT_COMPENSATION = 170;
local MINIMAP_GUESS = 250;
local _, screenY = UIManager:GetScreenSizeVal();
Controls.MPListScroll:SetSizeY( screenY - MINIMAP_GUESS - TOP_COMPENSATION - CHAT_COMPENSATION );
        

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
function MPListSort( a, b )
     local aScore = g_SortTable[ tostring( a ) ];
     local bScore = g_SortTable[ tostring( b ) ];
        
     return aScore > bScore;
end


-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
function BuildStaticTeamsList()
     for iPlayer = 0, GameDefines.MAX_MAJOR_CIVS - 1 do
    
        local pPlayer = Players[ iPlayer ];
        
        if( pPlayer:IsAlive() ) then
            local iTeam = pPlayer:GetTeam();
            local pTeam = Teams[ iTeam ];
            
            if( pTeam:GetNumMembers() == 1 ) then
                g_TeamData[ iTeam ] = pPlayer;
            else
                if( g_TeamData[ iTeam ] == nil ) then
                    g_TeamData[ iTeam ] = {};
                end
                table.insert( g_TeamData[ iTeam ], pPlayer );
            end
        end
    end
end

local g_bShowPings = false;

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
function UpdatePingTimeLabel( kControl, playerID )
	local iPingTime = Network.GetPingTime( playerID );
	if (iPingTime >= 0) then
		if (iPingTime == 0) then
			kControl:SetText( "<1ms" );
		else
			if (iPingTime < 1000) then
				kControl:SetText( tostring(iPingTime) .. "ms" );
			else
				kControl:SetText( tostring(iPingTime / 1000) .. "s" );
			end
		end
	else
		kControl:SetHide( true );
	end					
end

-------------------------------------------------
-------------------------------------------------
function OnPingTimesChanged()
    if( ContextPtr:IsHidden() == false and Game.IsNetworkMultiPlayer()) then

	    for playerID, controlTable in pairs( g_PlayerEntries ) do

			local pPlayer = Players[ playerID ];
			
			--if( playerID ~= Game.GetActivePlayer() ) then
				if (controlTable ~= nil and not controlTable.Ping:IsHidden()) then
					if (pPlayer:IsAlive() and pPlayer:IsHuman()) then
						UpdatePingTimeLabel( controlTable.Ping, playerID );
					else
						controlTable.Ping:SetHide( true );
					end
				end
			--end	
		end
    end
end
Events.MultiplayerPingTimesChanged.Add( OnPingTimesChanged );

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
function UpdatePlayerData( pPlayer, controlTable )

    local iTeam = pPlayer:GetTeam();
    local pTeam = Teams[ iTeam ];
    local bMet = g_pLocalTeam:IsHasMet( iTeam );
	local bIsHuman = pPlayer:IsHuman();
	local bIsLocalPlayer = pPlayer:GetID() == Game.GetActivePlayer();
	local bIsNetworkMP = Game.IsNetworkMultiPlayer();
	
	local bIsHotSeatCivToKill = GetCivIDFromPlayerID (pPlayer:GetID(), true) == HOTSEAT_CIV_TO_KILL
	
	if (g_bShowPings and bIsNetworkMP) then
		controlTable.Root:SetSizeX(260);
		controlTable.Score:SetOffsetX(60);
		controlTable.Ping:SetHide( not bIsHuman or bIsLocalPlayer );
		controlTable.ClickEntry:SetSizeX(260);
		controlTable.ClickEntry:SetHide( false );
		controlTable.Seperator:SetSizeX( 235 );
	else
		controlTable.Root:SetSizeX(200);
		controlTable.Score:SetOffsetX(10);
		controlTable.Ping:SetHide( true );
		controlTable.ClickEntry:SetSizeX(200);
		controlTable.ClickEntry:SetHide( not bIsNetworkMP );
		controlTable.Seperator:SetSizeX( 175 );
	end
		
    -- name
    local textSize = controlTable.Root:GetSizeX() - controlTable.Name:GetOffsetX() - controlTable.CivIconBG:GetSizeX() + (controlTable.IconBox:GetOffsetX() /2);
    if( bIsHuman ) then
    
        local activePlayer = Game.GetActivePlayer();
        if( Game.IsGameMultiPlayer() == false and bIsLocalPlayer ) then
    		local leaderName = PreGame.GetLeaderName( activePlayer );
        	local leaderDescription = pPlayer:GetName();
    		if( leaderName ~= nil and leaderName ~= "" ) then
    			leaderDescription = leaderName;
    		end
            TruncateString( controlTable.Name, textSize, leaderDescription );
            
            --controlTable.Name:LocalizeAndSetText( "TXT_KEY_YOU" );
		else
            TruncateString( controlTable.Name, textSize, pPlayer:GetNickName() );
        end
    
        -- icon
        CivIconHookup( pPlayer:GetID(), 32, controlTable.Icon, controlTable.CivIconBG, controlTable.CivIconShadow, false, true );
        
        if (g_bShowPings) then
			UpdatePingTimeLabel( controlTable.Ping, pPlayer:GetID() );
		end
    else
    
        if( bMet or Game.IsGameMultiPlayer() ) then
            TruncateString( controlTable.Name, textSize, pPlayer:GetName() );
            controlTable.Icon:SetHide( false );
            controlTable.CivIconBG:SetHide( false );
            controlTable.CivIconShadow:SetHide( false );
            CivIconHookup( pPlayer:GetID(), 32, controlTable.Icon, controlTable.CivIconBG, controlTable.CivIconShadow, false, true );
        else
            controlTable.Name:LocalizeAndSetText( "TXT_KEY_POP_VOTE_RESULTS_UNMET_PLAYER" );
            controlTable.Icon:SetTextureOffsetVal( 228, 68 );
            controlTable.Icon:SetHide( false );
            controlTable.CivIconBG:SetHide( true );
            controlTable.CivIconShadow:SetHide( true );
        end
    end

    -- war color
    if( g_pLocalTeam:IsAtWar( pPlayer:GetTeam() ) ) then
        controlTable.Name:SetColorByName( "COLOR_NEGATIVE_TEXT" );
    else
        controlTable.Name:SetColorByName( "White" );
    end
    
    -- score
    controlTable.Score:SetText( pPlayer:GetScore() );
    g_SortTable[ tostring( controlTable.Root ) ] = pPlayer:GetScore();

    -- turn finished
    if( pPlayer:HasReceivedNetTurnComplete() or not pPlayer:IsAlive() ) then
        controlTable.Name:SetAlpha( 0.5 );
        controlTable.IconBox:SetAlpha( 0.2 );
    else
        controlTable.Name:SetAlpha( 1 );
        controlTable.IconBox:SetAlpha( 1 );
    end
end

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
function MPListEntryClick()
	if PreGame.IsInternetGame() then		-- Pings only valid with the Steam transport
		g_bShowPings = not g_bShowPings;
		UpdateAndSort();
		
		Controls.MPListStack:CalculateSize();
		Controls.MPListScroll:CalculateInternalSize();
		if( Controls.MPListScroll:GetRatio() < 1 ) then
			Controls.MPListScroll:SetOffsetX( 15 );
		end
		Controls.MPListScroll:ReprocessAnchoring();   	
	end
end
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
function BuildControls()

    for iTeam, teamData in pairs( g_TeamData ) do
        local pTeam = Teams[ iTeam ];

        if( pTeam:GetNumMembers() == 1 ) then

            -- single member team
            local pPlayer = teamData;

            -- Make sure they're alive
            if( pPlayer:IsAlive() ) then
                local controlTable = {};
                ContextPtr:BuildInstanceForControl( "PlayerEntry", controlTable, Controls.MPListStack );
                g_PlayerEntries[ pPlayer:GetID() ] = controlTable;
				controlTable.ClickEntry:RegisterCallback( Mouse.eLClick, MPListEntryClick );

                UpdatePlayerData( pPlayer, controlTable );
            end
        else
            local teamEntry = {};
            ContextPtr:BuildInstanceForControl( "TeamEntry", teamEntry, Controls.MPListStack );

            for _, pPlayer in pairs( teamData ) do
                
                if( pPlayer:IsEverAlive() ) then
                    local controlTable = {};
                    ContextPtr:BuildInstanceForControl( "PlayerEntry", controlTable, teamEntry.TeamStack );
                    g_PlayerEntries[ pPlayer:GetID() ] = controlTable;
                    controlTable.Seperator:SetHide( true );
					controlTable.ClickEntry:RegisterCallback( Mouse.eLClick, MPListEntryClick );

                    UpdatePlayerData( pPlayer, controlTable );
                end
            end
            
            teamEntry.TeamName:LocalizeAndSetText( "TXT_KEY_MULTIPLAYER_DEFAULT_TEAM_NAME", iTeam + 1 );
			teamEntry.TeamClickEntry:RegisterCallback( Mouse.eLClick, MPListEntryClick );

            teamEntry.TeamStack:CalculateSize();
            teamEntry.Root:SetSizeX( teamEntry.TeamStack:GetSizeX() );
            teamEntry.Root:SetSizeY( teamEntry.TeamStack:GetSizeY() + teamEntry.TeamName:GetSizeY() );

            g_TeamEntries[ iTeam ] = teamEntry;
            g_SortTable[ tostring( teamEntry.Root ) ] = pTeam:GetScore();
        end
    end
    
    Controls.MPListStack:CalculateSize();
    Controls.MPListScroll:CalculateInternalSize();
    if( Controls.MPListScroll:GetRatio() < 1 ) then
        Controls.MPListScroll:SetOffsetX( 15 );
    end
    Controls.MPListScroll:ReprocessAnchoring();   

end


-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
function UpdateAndSort()
    for iPlayer, controlTable in pairs( g_PlayerEntries ) do
        UpdatePlayerData( Players[ iPlayer ], controlTable );
    end
    
	local bIsNetworkMP = Game.IsNetworkMultiPlayer();
	
    for iTeam, teamEntry in pairs( g_TeamEntries ) do
        local pTeam = Teams[ iTeam ];
        local score = pTeam:GetScore();
        teamEntry.Score:SetText( score );
		
		if (g_bShowPings and bIsNetworkMP) then
			teamEntry.TeamBox:SetSizeX(260);
			teamEntry.Score:SetOffsetX(60);
			teamEntry.TeamClickEntry:SetSizeX( 260 );
			teamEntry.TeamClickEntry:SetHide( false );
			teamEntry.TeamSeparator:SetSizeX( 235 );
		else
			teamEntry.TeamBox:SetSizeX(200);
			teamEntry.Score:SetOffsetX(10);
			teamEntry.TeamClickEntry:SetSizeX(200);
			teamEntry.TeamClickEntry:SetHide( not bIsNetworkMP );
			teamEntry.TeamSeparator:SetSizeX( 175 );
		end
        
		teamEntry.TeamStack:CalculateSize();
            
        g_SortTable[ tostring( teamEntry.Root ) ] = score;
        
        -- sort all the players on the team
        teamEntry.TeamStack:SortChildren( MPListSort );
    end
    
    -- sort all of the teams
    Controls.MPListStack:SortChildren( MPListSort );
end

Events.MultiplayerGamePlayerDisconnected.Add( UpdateAndSort )


-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
function OnUpdate()
    if( g_bRebuildMPList ) then
        UpdateAndSort();
        g_bRebuildMPList = false;
    end
end


-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
function OnScoreDirty()
    g_bRebuildMPList = true;
end
Events.SerialEventScoreDirty.Add( OnScoreDirty );


-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
function OnRemotePlayerTurnEnd()
    g_bRebuildMPList = true;
end
Events.RemotePlayerTurnEnd.Add( OnRemotePlayerTurnEnd );


-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
function OnLocalTurnStart()
    g_bRebuildMPList = true;
end
Events.ActivePlayerTurnStart.Add( OnLocalTurnStart );


-------------------------------------------------------------------------------
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
function OnChatToggle( bChatOpen )
    if( bChatOpen ) then
        Controls.MPListScroll:SetOffsetY( TOP_COMPENSATION + CHAT_COMPENSATION );
    else
        Controls.MPListScroll:SetOffsetY( TOP_COMPENSATION );
    end
end
LuaEvents.ChatShow.Add( OnChatToggle );


-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
function ShowHideHandler( bIsHide )
    if( not bIsHide ) then
        ContextPtr:SetUpdate( OnUpdate );
    else
        ContextPtr:ClearUpdate();
    end
end
ContextPtr:SetShowHideHandler( ShowHideHandler );

    
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
function OnOptionsChanged()
    if( Game.IsGameMultiPlayer() or OptionsManager.GetScoreList() ) then
        ContextPtr:SetHide( false );
    else
        ContextPtr:SetHide( true );
    end
end
Events.GameOptionsChanged.Add( OnOptionsChanged );

----------------------------------------------------------------
-- 'Active' (local human) player has changed
----------------------------------------------------------------
function OnMPListActivePlayerChanged( iActivePlayer, iPrevActivePlayer )
	g_pLocalTeam = Teams[ Players[ Game.GetActivePlayer() ]:GetTeam() ];
	g_bRebuildMPList = true;
end
Events.GameplaySetActivePlayer.Add(OnMPListActivePlayerChanged);


-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
BuildStaticTeamsList();
BuildControls();
g_bRebuildMPList = true;
OnOptionsChanged();

