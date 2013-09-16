----------------------------------------------------------------        
----------------------------------------------------------------        
include( "IconSupport" );
include( "SupportFunctions"  );
include( "InstanceManager" );

local g_GameOptionIM = InstanceManager:new( "GameOption", "Text", Controls.SetupOptions );
local g_GameOptionsList = {};

local g_VictoryConditionsIM = InstanceManager:new( "GameOption", "Text", Controls.VictoryConditions );
local g_VictoryConditionsList = {};

local g_AdvancedOptionIM = InstanceManager:new( "GameOption", "Text", Controls.AdvancedOptions );
local g_AdvancedOptionsList = {};

local g_ActivatedModsIM = InstanceManager:new( "ModEntryInstance", "Text", Controls.ModsStack );

local g_bEntered = false;
m_ExitToMain = true;

----------------------------------------------------------------        
---------------------------------------------------------------- 
function OnEnter()
	if (not g_bEntered) then
		-- Moving between sub-menus causes this screen to be shown and hidden
		-- multiple times. Want to maintain the fact that there is an active popup
		-- by incrementing the turn timer semaphore once on entering the screen and
		-- have the semaphore decremented on leaving the screen.
		UI.incTurnTimerSemaphore();
		g_bEntered = true;
	end
end

----------------------------------------------------------------        
----------------------------------------------------------------  
function OnLeave()
	if (g_bEntered) then
		-- Leaving the screen (via Return To Game or Exit to Main Menu/Windows).
		UI.decTurnTimerSemaphore();
		g_bEntered = false;
	end
end

----------------------------------------------------------------        
----------------------------------------------------------------        
function OnQuickSave()
    OnReturn();
	UI.QuickSave();
end
Controls.QuickSaveButton:RegisterCallback( Mouse.eLClick, OnQuickSave );


----------------------------------------------------------------        
----------------------------------------------------------------        
function OnSave()
    UIManager:QueuePopup( Controls.SaveMenu, PopupPriority.SaveMenu );
end
Controls.SaveGameButton:RegisterCallback( Mouse.eLClick, OnSave );


----------------------------------------------------------------        
----------------------------------------------------------------        
function OnExitGame()
    Events.UserRequestClose();
end
Controls.ExitGameButton:RegisterCallback( Mouse.eLClick, OnExitGame );


-------------------------------------------------
-- Options Button Handler
-------------------------------------------------

function OnOptions()
    UIManager:QueuePopup( Controls.OptionsMenu_InGame, PopupPriority.OptionsMenu );
end
Controls.OptionsButton:RegisterCallback( Mouse.eLClick, OnOptions );

----------------------------------------------------------------        
----------------------------------------------------------------        
function OnMainMenu()
	m_ExitToMain = true;
	Controls.Message:SetText( Locale.ConvertTextKey("TXT_KEY_MENU_RETURN_MM_WARN") );
	Controls.ExitConfirm:SetHide( false );
   	Controls.BGBlock:SetHide( true );
end
Controls.MainMenuButton:RegisterCallback( Mouse.eLClick, OnMainMenu );

----------------------------------------------------------------        
----------------------------------------------------------------        
function OnReturn()
	OnLeave();
	UIManager:DequeuePopup( ContextPtr );
end
Controls.ReturnButton:RegisterCallback( Mouse.eLClick, OnReturn );

function OnGameDetails()
	Controls.ModsPanel:SetHide(true);
	Controls.MainContainer:SetHide(Controls.DetailsPanel:IsHidden());
	Controls.DetailsPanel:SetHide(not Controls.DetailsPanel:IsHidden());
end
Controls.DetailsButton:RegisterCallback( Mouse.eLClick, OnGameDetails );

function OnGameMods()
	Controls.DetailsPanel:SetHide(true);
	Controls.MainContainer:SetHide(Controls.ModsPanel:IsHidden());
	Controls.ModsPanel:SetHide(not Controls.ModsPanel:IsHidden());
end
Controls.ModsButton:RegisterCallback( Mouse.eLClick, OnGameMods);

----------------------------------------------------------------        
----------------------------------------------------------------        
function OnShowHide( isHide, isInit )

	local bDisableQuickSave = false;
	local bHideLoadGameOption = false;
	local bHideSaveGameOption = false;
	
	if(Game.IsGameMultiPlayer()) then
		bDisableQuickSave = true;
		if(Game.IsNetworkMultiPlayer()) then
			bHideLoadGameOption = true;
			
			if(not Matchmaking.IsHost()) then
				bHideSaveGameOption = true;
			end
		end
	end
	
	-- Modding can disable saving functionality.
	bDisableQuickSave = bDisableQuickSave		or Modding.AnyActivatedModsContainPropertyValue("DisableQuickSave", "1");
	bHideSaveGameOption = bHideSaveGameOption	or Modding.AnyActivatedModsContainPropertyValue("DisableSaveGameOption", "1");
	
	
	--For now, do not allow retiring from multiplayer games or the tutorial.
	local isTutorialOrMultiplayer = Game and (Game.IsGameMultiPlayer() or Game.IsStaticTutorialActive());
	local isScenario = PreGame.GetLoadWBScenario();
	
	local startTurn = Game and Game.GetStartTurn() or 0;	
	
	Controls.QuickSaveButton:SetHide(bDisableQuickSave);
	Controls.SaveGameButton:SetHide(bHideSaveGameOption);

	-- returning to main menu does not unload VFS override files (and crash anyway), so allows only return to windows...
	Controls.MainMenuButton:SetHide(true);
	
    if( not isInit ) then
		UI.SetInterfaceMode(InterfaceModeTypes.INTERFACEMODE_SELECTION);
		if( not isHide ) then
			OnEnter();
		end
    end
    
    Controls.DetailsPanel:SetHide(true);
    Controls.ModsPanel:SetHide(true);
    Controls.MainContainer:SetHide(false);
end
ContextPtr:SetShowHideHandler( OnShowHide );

----------------------------------------------------------------        
----------------------------------------------------------------        
function PopulateGameData()

	local iPlayer = Game.GetActivePlayer();
	local pPlayer = Players[iPlayer];
	
	-- Set Civ Leader
    local leader = GameInfo.Leaders[pPlayer:GetLeaderType()];
    local leaderDescription = leader.Description;
	local leaderTrait = GameInfo.Leader_Traits( "LeaderType ='" .. leader.Type .. "'" )();
	local gameTrait = GameInfo.Traits[ leaderTrait.TraitType ];
	--controlTable.BonusTitle:SetText( Locale.ConvertTextKey( gameTrait.ShortDescription ) );
	--controlTable.BonusDescription:SetText( Locale.ConvertTextKey( gameTrait.Description ) );

	-- Set Background Map 	
	local myCivInfo = GameInfo.Civilizations[pPlayer:GetCivilizationType()]
	local mapTexture = myCivInfo.MapImage
	if mapTexture then
		Controls.LargeMapImage:UnloadTexture()
		Controls.LargeMapImage:SetTexture(mapTexture)
    end

	IconHookup( leader.PortraitIndex, 128, leader.IconAtlas, Controls.Portrait );
	
	-- Set Civ Icon
	local pTeam = Teams[pPlayer:GetTeam()];

	CivIconHookup( iPlayer, 32, Controls.CivIcon, Controls.CivIconBG, Controls.CivIconShadow, false, true );
	
	-- Set Civ Leader & Icon Tool tips
	if(Game:IsNetworkMultiPlayer() and pPlayer:GetNickName() ~= "") then
		local myCivType = pPlayer:GetCivilizationType();
		local myCivInfo = GameInfo.Civilizations[myCivType];
		Controls.CivIconFrame:SetToolTipString( Locale.ConvertTextKey( myCivInfo.ShortDescription )  .. "     " .. Locale.ConvertTextKey( gameTrait.ShortDescription ) .. "[NEWLINE]" .. Locale.ConvertTextKey( gameTrait.Description ) );
		Controls.LeaderFrame:SetToolTipString( pPlayer:GetNickName() );
		
	elseif( iPlayer == Game.GetActivePlayer() and PreGame.GetCivilizationShortDescription( 0 ) ~= "" ) then
		Controls.CivIconFrame:SetToolTipString( PreGame.GetCivilizationShortDescription( 0 ) .. "     " .. Locale.ConvertTextKey( gameTrait.ShortDescription ) .. "[NEWLINE]" .. Locale.ConvertTextKey( gameTrait.Description ) );
		Controls.LeaderFrame:SetToolTipString( PreGame.GetLeaderName( 0 ) );

	else
		local myCivType = pPlayer:GetCivilizationType();
		local myCivInfo = GameInfo.Civilizations[ myCivType ];
		Controls.CivIconFrame:SetToolTipString( Locale.ConvertTextKey( myCivInfo.ShortDescription ) .. "     " .. Locale.ConvertTextKey( gameTrait.ShortDescription ) .. "[NEWLINE]" .. Locale.ConvertTextKey( gameTrait.Description ) );
		Controls.LeaderFrame:SetToolTipString( Locale.ConvertTextKey( leaderDescription ) );
	end
	
	-- Set Map Type
	local mapScript = PreGame.GetMapScript();
	
	--First check if it's a map script
	for row in GameInfo.MapScripts{FileName = mapScript, Hidden = 0} do
		IconHookup( row.IconIndex or 0, 32, row.IconAtlas, Controls.TypeIcon );
		Controls.TypeFrame:SetToolTipString( Locale.ConvertTextKey( row.Name or "" ) );
		bFound = true;
		break;
	end
	
	--Then check if it's a known earth map,
	if(not bFound) then
	
		local earthMaps = {
			"Assets\\Maps\\Earth_Duel.Civ5Map",
			"Assets\\Maps\\Earth_Huge.Civ5Map",
			"Assets\\Maps\\Earth_Large.Civ5Map",
			"Assets\\Maps\\Earth_Small.Civ5Map",
			"Assets\\Maps\\Earth_Standard.Civ5Map",
			"Assets\\Maps\\Earth_Tiny.Civ5Map",
		}

		
		for i,v in ipairs(earthMaps) do
			if(v == mapScript) then
				IconHookup(3, 32, "WORLDTYPE_ATLAS", Controls.TypeIcon);
				Controls.TypeFrame:LocalizeAndSetToolTip("TXT_KEY_MAP_EARTH_TITLE");
				bFound = true;
				break;
			end
		end
	end
	
	--Then attempt to use it as a WB map
	if(not bFound) then
		local mapData = UI.GetMapPreview(mapScript);
		if(mapData ~= nil) then
			local name = mapData.Name;
			if(name == nil) then
				local _;
				_, _, name = string.find(header.MapScript,"\\.+\\(.+)%.");
			end
			IconHookup(4, 32, "WORLDTYPE_ATLAS", Controls.TypeIcon);
			Controls.TypeFrame:LocalizeAndSetToolTip(name);
			bFound = true;
		end
	end
   
    if(not bFound) then
		IconHookup( 4, 32, "WORLDTYPE_ATLAS", Controls.TypeIcon); 
		Controls.TypeFrame:SetToolTipString(Locale.ConvertTextKey("TXT_KEY_RANDOM_MAP_SCRIPT") );
	end
	
	-- Set Map Size
	local info = GameInfo.Worlds[ PreGame.GetWorldSize() ];
	if ( info ~= nil ) then
		IconHookup( info.PortraitIndex, 32, info.IconAtlas, Controls.SizeIcon );
		Controls.SizeFrame:SetToolTipString( Locale.ConvertTextKey( info.Description ) );
	else
		IconHookup( 6, 32, "WORLDSIZE_ATLAS", Controls.SizeIcon );
		Controls.SizeFrame:SetToolTipString( Locale.ConvertTextKey( "TXT_KEY_RANDOM_MAP_SIZE" ) );
	end
	
	-- Set Difficulty
	info = GameInfo.HandicapInfos[ Players[Game.GetActivePlayer()]:GetHandicapType() ];
    if ( info ~= nil ) then
        IconHookup( info.PortraitIndex, 32, info.IconAtlas, Controls.DifficultyIcon );
        Controls.DifficultyFrame:SetToolTipString( Locale.ConvertTextKey( info.Description ) );
    else
		Controls.DifficultyFrame:SetHide(true);
    end
    
    -- Set Game Pace
    info = GameInfo.GameSpeeds[ PreGame.GetGameSpeed() ];
    if ( info ~= nil ) then
        IconHookup( info.PortraitIndex, 32, info.IconAtlas, Controls.SpeedIcon );
        Controls.SpeedFrame:SetToolTipString( Locale.ConvertTextKey( info.Description )  );
    else
		Controls.SpeedFrame:SetHide(true);
    end
end
----------------------------------------------------------------        
----------------------------------------------------------------
function PopulateGameOptions()
	g_GameOptionIM:ResetInstances();
	g_VictoryConditionsIM:ResetInstances();
	g_AdvancedOptionIM:ResetInstances();
	g_GameOptionsList = {};
	g_VictoryConditionsList = {};
	g_AdvancedOptionsList = {};
	
	local iPlayer = Game.GetActivePlayer();
	local pPlayer = Players[iPlayer];
	
	-- Set Civ Leader & Icon Tool tips
    local leader = GameInfo.Leaders[pPlayer:GetLeaderType()];
    local leaderDescription = leader.Description;
	local pTeam = Teams[pPlayer:GetTeam()];
	local availableTextExtent = Controls.ScrollPanel:GetSizeX();
	
	if(Game:IsNetworkMultiPlayer() and pPlayer:GetNickName() ~= "") then
		local myCivType = pPlayer:GetCivilizationType();
		local myCivInfo = GameInfo.Civilizations[myCivType];
		TruncateString(Controls.DetailsCiv, availableTextExtent, Locale.ConvertTextKey(myCivInfo.ShortDescription));
		TruncateString(Controls.DetailsLeader, availableTextExtent, pPlayer:GetNickName());
	elseif(iPlayer == Game.GetActivePlayer() and PreGame.GetCivilizationShortDescription(0) ~= "") then
		TruncateString(Controls.DetailsCiv, availableTextExtent, PreGame.GetCivilizationShortDescription(0));
		TruncateString(Controls.DetailsLeader, availableTextExtent, PreGame.GetLeaderName(0));
	else
		local myCivType = pPlayer:GetCivilizationType();
		local myCivInfo = GameInfo.Civilizations[myCivType];
		TruncateString(Controls.DetailsCiv, availableTextExtent, Locale.ConvertTextKey(myCivInfo.ShortDescription));
		TruncateString(Controls.DetailsLeader, availableTextExtent, Locale.ConvertTextKey(leaderDescription));
	end
	
	local count = 1;
	if(PreGame.GetEra() ~= nil) then
		local controlTable = g_GameOptionIM:GetInstance();
		g_GameOptionsList[count] = controlTable;
		controlTable.Text:LocalizeAndSetText("TXT_KEY_START_ERA", Locale.ConvertTextKey(GameInfo.Eras[PreGame.GetEra()].Description));
		count = count + 1;
	end
	
	-- Set Map Type
	local mapScriptFileName = PreGame.GetMapScript();
	local mapScript = nil;
    
	for row in GameInfo.MapScripts() do
		if(row.FileName == mapScriptFileName) then
			mapScript = row;
			break;
		end
	end
    
	if(mapScript ~= nil) then
		local controlTable = g_GameOptionIM:GetInstance();
		g_GameOptionsList[count] = controlTable;
		controlTable.Text:LocalizeAndSetText("TXT_KEY_AD_MAP_TYPE_SETTING", Locale.ConvertTextKey( mapScript.Name ) );
		count = count + 1;
	end
	
	-- Set Map Size
	local info = GameInfo.Worlds[ PreGame.GetWorldSize() ];
	if ( info ~= nil ) then
		local controlTable = g_GameOptionIM:GetInstance();
		g_GameOptionsList[count] = controlTable;
		controlTable.Text:LocalizeAndSetText("TXT_KEY_AD_MAP_SIZE_SETTING", Locale.ConvertTextKey( info.Description ) );
		count = count + 1;
	end
	
	-- Set Difficulty
	info = GameInfo.HandicapInfos[ PreGame.GetHandicap( 0 ) ];
    if ( info ~= nil ) then
		local controlTable = g_GameOptionIM:GetInstance();
		g_GameOptionsList[count] = controlTable;
		controlTable.Text:LocalizeAndSetText("TXT_KEY_AD_HANDICAP_SETTING", Locale.ConvertTextKey( info.Description ) );
		count = count + 1;
    end
    
    -- Set Game Pace
    info = GameInfo.GameSpeeds[ PreGame.GetGameSpeed() ];
    if ( info ~= nil ) then
		local controlTable = g_GameOptionIM:GetInstance();
		g_GameOptionsList[count] = controlTable;
		controlTable.Text:LocalizeAndSetText("TXT_KEY_AD_GAME_SPEED_SETTING", Locale.ConvertTextKey( info.Description ) );
		count = count + 1;
    end
    
    -- List Victory Conditions
    local controlTable = g_VictoryConditionsIM:GetInstance();
    g_VictoryConditionsList[count] = controlTable;
	controlTable.Text:LocalizeAndSetText("TXT_KEY_VICTORYS_FORMAT");
    count = 1;
    for row in GameInfo.Victories() do
		if(PreGame.IsVictory(row.ID) == true) then
			controlTable = g_VictoryConditionsIM:GetInstance();
			g_VictoryConditionsList[count] = controlTable;
			controlTable.Text:LocalizeAndSetText(row.Description);
			count = count + 1;
		end
	end
    
    -- Game Options
    count = 1;
    for option in GameInfo.GameOptions{Visible = 1} do		
		local savedValue = PreGame.GetGameOption(option.Type);
		if(savedValue ~= nil and savedValue == 1) then
			local controlTable = g_AdvancedOptionIM:GetInstance();
			g_AdvancedOptionsList[count] = controlTable;
			controlTable.Text:LocalizeAndSetText(option.Description);
			count = count + 1;
		end
	end
	
	if( count == 1) then
		Controls.AdvancedOptions:SetHide(true);
	end
    
    Controls.SetupOptions:CalculateSize();
	Controls.SetupOptions:ReprocessAnchoring();
	
	Controls.VictoryConditions:CalculateSize();
	Controls.VictoryConditions:ReprocessAnchoring();
	
	Controls.AdvancedOptions:CalculateSize();
	Controls.AdvancedOptions:ReprocessAnchoring();
	
	Controls.OptionsStack:CalculateSize();
	Controls.OptionsStack:ReprocessAnchoring();
	
	Controls.ScrollPanel:CalculateInternalSize();
end

----------------------------------------------------------------
----------------------------------------------------------------
function PopulateModData()
	
	g_ActivatedModsIM:ResetInstances();
	
	local sortedActivatedMods = {};
	local activatedMods = Modding.GetActivatedMods();
	for i,v in ipairs(activatedMods) do
		local title = Modding.GetModProperty(v.ID, v.Version, "Name");
		title = Locale.TruncateString(title, 30, true);
		
		table.insert(sortedActivatedMods, {ID = v.ID, Version = v.Version, Title = title});	
	end
	
	table.sort(sortedActivatedMods, function(a,b) return Locale.Compare(a.Title, b.Title) == -1 end);
	
	for i,v in ipairs(sortedActivatedMods) do
		local controlTable = g_ActivatedModsIM:GetInstance();
		controlTable.Text:SetText(string.format("%s (v. %i)", v.Title, v.Version));	
	end
	
	
	Controls.ModsStack:CalculateSize();
	Controls.ModsStack:ReprocessAnchoring();
	
	Controls.ModsScrollPanel:CalculateInternalSize();
	
	Controls.ModsButton:SetHide(#activatedMods == 0);
end

----------------------------------------------------------------        
-- Key Down Processing
----------------------------------------------------------------        
function InputHandler( uiMsg, wParam, lParam )
    if( uiMsg == KeyEvents.KeyDown )
    then
        if( wParam == Keys.VK_ESCAPE or wParam == Keys.VK_RETURN ) then
			if(Controls.ExitConfirm:IsHidden())then
	            OnReturn();
	        else
				Controls.ExitConfirm:SetHide( true );
               	Controls.BGBlock:SetHide( false );
			end
        end
    end
    return true;
end
ContextPtr:SetInputHandler( InputHandler );

----------------------------------------------------------------        
----------------------------------------------------------------
function OnYes( )
	OnLeave();
	Controls.ExitConfirm:SetHide( true );
   	Controls.BGBlock:SetHide( false );
   	
   	UIManager:SetUICursor( 1 );
	
	if(m_ExitToMain) then
		Events.ExitToMainMenu();
	else
		UI.ExitGame();
	end
end
Controls.Yes:RegisterCallback( Mouse.eLClick, OnYes );

function OnNo( )
	Controls.ExitConfirm:SetHide( true );
   	Controls.BGBlock:SetHide( false );
end
Controls.No:RegisterCallback( Mouse.eLClick, OnNo );

----------------------------------------------------------------
-- 'Active' (local human) player has changed
----------------------------------------------------------------
function OnGameMenuActivePlayerChanged( iActivePlayer, iPrevActivePlayer )
	PopulateGameData();
	PopulateGameOptions();
	PopulateModData();

	if(not Controls.ExitConfirm:IsHidden())then
		Controls.ExitConfirm:SetHide( true );
   		Controls.BGBlock:SetHide( false );
	end
		
	OnReturn();
end
Events.GameplaySetActivePlayer.Add(OnGameMenuActivePlayerChanged);

-- Do the initial population of the data, it can change during hotseat games.
PopulateGameData();
PopulateGameOptions();
PopulateModData();
