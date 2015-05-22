--------------------------------------------------------------
--------------------------------------------------------------
-- R.E.D. Europe 1940 Setup
-- Author: Firaxis, Gedemon
--------------------------------------------------------------
--------------------------------------------------------------

----------------------------------------------------------------
include( "IconSupport" )
include( "UniqueBonuses" )
include( "InstanceManager" )

----------------------------------------------------------------
-- Global Constants
----------------------------------------------------------------

ScenarioCivilizations = {
	-- [0] = "CIVILIZATION_MONGOL", -- Fake civilization defined as player one in scenario tab of WB (with a starting plot in the middle of nowhere), and killed at start of any game. Used to fix a hotseat bug that make the player one of any scenario always human whatever the settings here
	[1] = "CIVILIZATION_FRANCE",
	[2] = "CIVILIZATION_GERMANY",
	[3] = "CIVILIZATION_ENGLAND",
	[4] = "CIVILIZATION_ROME",
	[5] = "CIVILIZATION_RUSSIA",
	[6] = "CIVILIZATION_GREECE",
}

TYPE_SINGLE = 1
TYPE_HOTSEAT = 2
RED_COMPUTER = 1
RED_HUMAN = 2

----------------------------------------------------------------
-- Global Variables
----------------------------------------------------------------
g_CurrentPlayerIndex = nil; --default to random
g_bCanLoad = true -- set to false if another mod is activated
g_bDataLoaded = false -- set to true if data files mod is activated
g_CurrentDifficulty = 8

g_GameOptionsManager = InstanceManager:new("GameOptionInstance", "GameOptionRoot", Controls.GameOptionsStack);
g_DropDownOptionsManager = InstanceManager:new("DropDownOptionInstance", "DropDownOptionRoot", Controls.DropDownOptionsStack);


		
myModId = "580c14eb-9799-4d31-8b14-c2a78931de89";
myModVersion = Modding.GetActivatedModVersion(myModId);
scenarioMap = Modding.GetEvaluatedFilePath(myModId, myModVersion, "Europe_1939.Civ5Map");
modUserData = Modding.OpenUserData(myModId, myModVersion)

----------------------------------------------------------------
function OnBack()
	if(not Controls.SelectCivScrollPanel:IsHidden()) then
		ToggleCivSelection();
	else
		UIManager:DequeuePopup( ContextPtr );
		--Controls.LargeMapImage:UnloadTexture(); 
	end
end
----------------------------------------------------------------       
Controls.BackButton:RegisterCallback(Mouse.eLClick, OnBack);
----------------------------------------------------------------
ContextPtr:SetInputHandler( function(uiMsg, wParam, lParam)
    if uiMsg == KeyEvents.KeyDown then
        if wParam == Keys.VK_ESCAPE or wParam == Keys.VK_RETURN then
			OnBack();
        end
    end
    return true;
end);
----------------------------------------------------------------
-- Handle Start Button
Controls.StartButton:RegisterCallback(Mouse.eLClick, function()

	UI.ResetScenarioPlayerSlots(true)

	-- Shared settings
	--PreGame.Reset(); -- just in case.
	local scenarioPlayer, scenarioPlayerName
	local bHotseat = PreGame.GetGameOption("GameType") == TYPE_HOTSEAT
	if bHotseat then
		PreGame.SetGameType(GameTypes.GAME_HOTSEAT_MULTIPLAYER)
		for i, CIVILIZATION_TYPE in ipairs(ScenarioCivilizations) do
			if PreGame.GetGameOption(CIVILIZATION_TYPE) == RED_HUMAN then
				print (CIVILIZATION_TYPE .. " is human")
				--UI.MoveScenarioPlayerToSlot( i, 0 )
				PreGame.SetSlotStatus( i, SlotStatus.SS_TAKEN )
				PreGame.SetSlotClaim( i, SlotClaim.SLOTCLAIM_RESERVED )
				PreGame.SetHandicap( i, g_CurrentDifficulty )

				local civ = GameInfo.Civilizations[CIVILIZATION_TYPE]
				local leader = GameInfo.Leaders[GameInfo.Civilization_Leaders( "CivilizationType = '" .. civ.Type .. "'" )().LeaderheadType];
				local leaderName = Locale.ConvertTextKey(leader.Description)
				PreGame.SetNickName( i, leaderName )
				scenarioPlayer = i
				scenarioPlayerName = leaderName
			else
				PreGame.SetSlotStatus(i, SlotStatus.SS_COMPUTER)
				PreGame.SetSlotClaim(i, SlotClaim.SLOTCLAIM_ASSIGNED)
			end
		end
	else
		PreGame.SetGameType( GAME_SINGLE_PLAYER )
		local playerIndex = g_CurrentPlayerIndex;
		if(playerIndex == nil) then
			playerIndex = math.random(1, table.count(ScenarioCivilizations)); -- theres one slot for the hotseat fix...
		end	
		scenarioPlayer = playerIndex
		PreGame.SetHandicap(0, g_CurrentDifficulty)
		if(scenarioPlayer ~= nil) then
			UI.MoveScenarioPlayerToSlot( scenarioPlayer, 0 )
		end
	end

	if(scenarioPlayer ~= nil) then
		--UI.MoveScenarioPlayerToSlot( scenarioPlayer, 0 )
		if bHotseat then
			--PreGame.SetNickName( 0, scenarioPlayerName )
			--PreGame.SetLeaderName( 0, scenarioPlayerName)
		end
	end

	PreGame.SetMapScript(scenarioMap.EvaluatedPath)
	PreGame.SetLoadWBScenario(true)
	--UI.ResetScenarioPlayerSlots(true); -- why do that ?
	PreGame.SetGameSpeed(2)  -- Standard speed
	PreGame.SetOverrideScenarioHandicap(true)

	if ( not g_bCanLoad ) then
		Controls.StartButton:SetText("[COLOR_WARNING_TEXT]MODS SELECTION ERROR[ENDCOLOR]")
		Controls.StartButton:SetToolTipString("'R.E.D. WWII Edition' and 'R.E.D. WWII Data Files' must be the only activated mods[NEWLINE]Please go back to the mod selection screen and uncheck all mods except the two R.E.D WW2")
	elseif (not g_bDataLoaded ) then
		Controls.StartButton:SetText("[COLOR_WARNING_TEXT]DATAFILES NOT LOADED[ENDCOLOR]")
		Controls.StartButton:SetToolTipString("'R.E.D. WWII Data Files' must be activated[NEWLINE]Please go back to the mod selection screen and check the 'R.E.D WWII Data Files' mod, or download the latest version.")

	else
		modUserData.SetValue("RedLoading", "Euro1940")
		Events.SerialEventStartGame()
		--Matchmaking.LaunchMultiplayerGame()
		UIManager:SetUICursor( 1 )
	--	UIManager:DequeuePopup( ContextPtr );
	end
end);

------------------------------------------------------------------------------------------------------
-- Refreshes all dynamic drop down game options
function RefreshDropDownGameOptions()
	g_DropDownOptionsManager:ResetInstances();

	local options = {};

	g_REDPulldownOptions =	{
			{
			Type = "GameType",
			Name = "Game Type",
			ToolTip = "Single Player or Hotseat",
			Disabled = false,
			DefaultValue = TYPE_SINGLE,
			SortPriority = 0,
			Values = { 
				{ Name	= "Single Player", ToolTip = "Local single player", Value = TYPE_SINGLE,},
				{ Name	= "HotSeat", ToolTip = "Local Multiplayer", Value = TYPE_HOTSEAT,},
					},
		},  
	}

	for i, option in ipairs(g_REDPulldownOptions) do
		table.insert(options, option)
	end

	if PreGame.GetGameOption("GameType") == TYPE_HOTSEAT then
		for i, CIVILIZATION_TYPE in ipairs(ScenarioCivilizations) do
			local option = {}
			local civ = GameInfo.Civilizations[CIVILIZATION_TYPE]
			option.Type = CIVILIZATION_TYPE
			option.Name = "[ICON_BULLET]" .. Locale.ConvertTextKey(civ.ShortDescription)
			option.ToolTip = Locale.ConvertTextKey(civ.Description)
			option.DefaultValue = RED_COMPUTER
			option.SortPriority = 5
			option.Values = { 
				{ Name	= "Computer", ToolTip = "Brainless AI", Value = RED_COMPUTER,},
				{ Name	= "Human", ToolTip = "Girlfriend, little brother, great father or any other worthy adversary like yourself", Value = RED_HUMAN,},
					},
			table.insert(options, option)
		end
	end

	
	local sortedOptions = {};
	for k,v in pairs(options) do
		table.insert(sortedOptions, v);
	end
	 
	-- Sort the options
	table.sort(sortedOptions, function(a, b) 
		if(a.SortPriority == b.SortPriority) then
			return a.Name < b.Name; 
		else
			return a.SortPriority < b.SortPriority;
		end
	end);
	
	-- Update the UI!
	for _, option in ipairs(sortedOptions) do
	
		local gameOption = g_DropDownOptionsManager:GetInstance();
				
		gameOption.OptionName:SetText(option.Name);
								
		if(option.ToolTip ~= nil) then
			gameOption.OptionName:SetToolTipString(option.ToolTip);
		else
			gameOption.OptionName:SetToolTipString();
		end
		
		gameOption.OptionDropDown:SetDisabled(option.Disabled);
		local dropDownButton = gameOption.OptionDropDown:GetButton();
		
		gameOption.OptionDropDown:ClearEntries();
		for _, possibleValue in ipairs(option.Values) do
			controlTable = {};
			gameOption.OptionDropDown:BuildEntry( "InstanceOne", controlTable );
			controlTable.Button:SetText(possibleValue.Name);
			
			if(possibleValue.ToolTip ~= nil) then
				controlTable.Button:SetToolTipString(possibleValue.ToolTip);
			else
				controlTable.Button:SetToolTipString();
			end
			
			
			controlTable.Button:RegisterCallback(Mouse.eLClick, function()
				dropDownButton:SetText(possibleValue.Name);
				if(possibleValue.ToolTip) then
					dropDownButton:SetToolTipString(possibleValue.ToolTip);
				else
					dropDownButton:SetToolTipString();
				end
				PreGame.SetGameOption(option.Type, possibleValue.Value);
				modUserData.SetValue (option.Type, possibleValue.Value);
				PerformPartialSync()
			end);
		end
		
		--Assign the currently selected value.

		local modSavedValue = modUserData.GetValue (option.Type);
		local savedValue = PreGame.GetGameOption(option.Type);
		local defaultValue;

		if(modSavedValue ~= -1) then
			defaultValue = option.Values[modSavedValue];
		else
			defaultValue = option.Values[option.DefaultValue];
		end

		if(savedValue ~= -1) then
			defaultValue = option.Values[savedValue];
		else
			defaultValue = option.Values[option.DefaultValue];
		end
		
		if(defaultValue ~= nil) then
			dropDownButton:SetText(defaultValue.Name);
			
			if(defaultValue.ToolTip ~= nil) then
				dropDownButton:SetToolTipString(defaultValue.ToolTip);
			else
				dropDownButton:SetToolTipString();
			end
		end
	
		if(option.Disabled) then
			dropDownButton:SetDisabled(true);
		end
		
		gameOption.OptionDropDown:CalculateInternals();
	end
	
	Controls.DropDownOptionsStack:CalculateSize();
	Controls.DropDownOptionsStack:ReprocessAnchoring();

	Controls.OptionsScrollPanel:CalculateInternalSize();
end
------------------------------------------------------------------------------------------------------
-- Refreshes all dynamic checkbox game options
function RefreshCheckBoxGameOptions()
	g_GameOptionsManager:ResetInstances();
	
	---------------------------------
	-- General Game Options
	local options = {}
		
	-- R.E.D. options
	g_REDCheckboxOptions = {

		{
			Type = "RevealCities",
			Name = "Reveal all cities",
			ToolTip = "All cities plot will be revealed on the map",
			Disabled = false,
			GameOption = true,
			SortPriority = 1,
		},	{
			Type = "AlternateHistory",
			Name = "Alternate history",
			ToolTip = "Allow declarations of war outside the historic calendar",
			Disabled = false,
			GameOption = true,
			SortPriority = 1,
		},	{
			Type = "RedAutosave",
			Name = "Extra Auto Save",
			ToolTip = "Create a save game named 'RED_WWII_Autosave_EndTurn' at the end of each turn",
			Disabled = false,
			GameOption = true,
			SortPriority = 3,
		},	{
			Type = "AllowScriptedevents",
			Name = "Allow Scripted Events",
			ToolTip = "Uncheck this to prevent special scripts to be used, like the 'Fall of France' event, as it has been reported to be a cause of crash on some computers.",
			Disabled = false,
			GameOption = true,
			SortPriority = 3,
		},	{
			Type = "GAMEOPTION_NO_MP_LIST",
			Name = "Hide MP List",
			ToolTip = "The multiplayer score list on the right will be hidden in hotseat mode.",
			Disabled = false,
			GameOption = true,
			SortPriority = 3,
		},	{
			Type = "MaginotLine",
			Name = "Maginot Line",
			ToolTip = "The Maginot Line will be placed on the map at game start.",
			Disabled = false,
			GameOption = true,
			SortPriority = 1,
		},	{
			Type = "Westwall",
			Name = "Westwall",
			ToolTip = "The Westwall (aka Siegfried Line) will be placed on the map at game start.",
			Disabled = false,
			GameOption = true,
			SortPriority = 1,
		},

	}

	for i, option in ipairs(g_REDCheckboxOptions) do
		local modSavedValue = modUserData.GetValue (option.Type)
		local savedValue = PreGame.GetGameOption(option.Type)
		if option.Checked ~= nil then -- there is an override for this scenario, don't use saved value
			PreGame.SetGameOption(option.Type, option.Checked)
		else
			if(modSavedValue ~= nil) then
				option.Checked = (modSavedValue == 1)
				PreGame.SetGameOption(option.Type, option.Checked)
			elseif(savedValue ~= nil) then
				option.Checked = (savedValue == 1)
				PreGame.SetGameOption(option.Type, option.Checked)
			else			
				PreGame.SetGameOption(option.Type, false) -- not checked if not defined at all
			end
		end
		table.insert(options, option)
	end	

	-- Add Options to UI.
	local sizeY = 0;
	for _, option in ipairs(options) do
		local gameOption = g_GameOptionsManager:GetInstance();
		
		local gameOptionTextButton = gameOption.GameOptionRoot:GetTextButton();
		gameOptionTextButton:SetText(option.Name);
								
		if(option.ToolTip ~= nil) then
			gameOption.GameOptionRoot:SetToolTipString(option.ToolTip);
		end
		
		gameOption.GameOptionRoot:SetDisabled(option.Disabled);
		gameOption.GameOptionRoot:SetCheck(option.Checked);
		sizeY = sizeY + gameOption.GameOptionRoot:GetSizeY();
		if(option.GameOption == true) then
			gameOption.GameOptionRoot:RegisterCheckHandler( function(bCheck)
				PreGame.SetGameOption(option.Type, bCheck);
				if bCheck then
					modUserData.SetValue (option.Type, 1) 
				else
					modUserData.SetValue (option.Type, 0) 
				end
			end);
		else
			gameOption.GameOptionRoot:RegisterCheckHandler( function(bCheck)
				PreGame.SetMapOption(option.ID, bCheck);
			end);
		end	
	end	


	Controls.DropDownOptionsStack:CalculateSize();
	Controls.DropDownOptionsStack:ReprocessAnchoring();
	
	Controls.GameOptionsStack:CalculateSize();
	Controls.GameOptionsStack:ReprocessAnchoring();
	
	Controls.GameOptionsFullStack:CalculateSize();
	Controls.GameOptionsFullStack:ReprocessAnchoring();

	Controls.OptionsScrollPanel:CalculateInternalSize();
end
------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------
-- Screen Options
------------------------------------------------------------------------------------------------------
ScreenOptions = {

----------------------------------------------------------------
["CustomOptions"] = {
	FullSync = function()
		RefreshDropDownGameOptions();
		RefreshCheckBoxGameOptions();
	end,
	
	PartialSync = function()
		-- Still doing a full sync here..
		RefreshDropDownGameOptions();
		RefreshCheckBoxGameOptions();
	end,
},
----------------------------------------------------------------
["Handicaps"] = {
	FullSync = function()
		local pullDown = Controls.HandicapPullDown;
		pullDown:ClearEntries();
		for info in GameInfo.HandicapInfos() do

			local instance = {};
			pullDown:BuildEntry( "InstanceOne", instance );
		    
			instance.Button:LocalizeAndSetText(info.Description);
			instance.Button:LocalizeAndSetToolTip(info.Help);
			instance.Button:SetVoid1( info.ID );
		end
		
		pullDown:CalculateInternals();
		
		pullDown:RegisterSelectionCallback(function(id)
			local handicap = GameInfo.HandicapInfos[id];
			PreGame.SetHandicap( 0, id );
			modUserData.SetValue ("Handicap", id)
			g_CurrentDifficulty = id
			pullDown:GetButton():LocalizeAndSetText(handicap.Description);
			pullDown:GetButton():LocalizeAndSetToolTip(handicap.Help);
		
			PerformPartialSync();
		end);
	end,
	
	PartialSync = function()
		local info = GameInfo.HandicapInfos[PreGame.GetHandicap(0)];
		Controls.HandicapPullDown:GetButton():LocalizeAndSetText(info.Description);
		Controls.HandicapPullDown:GetButton():LocalizeAndSetToolTip(info.Help);
	end,
},
----------------------------------------------------------------


}
-------------------------------------------------

----------------------------------------------------------------
-- ScreenOptions methods
-- Used to manage the entries in ScreenOptions
----------------------------------------------------------------
function ForEachScreenOption(func, ...)
	for _,v in pairs(ScreenOptions) do
		if(v[func]) then
			v[func](...);
		end
	end
end
------------------------------------------------------------------
function PerformFullSync()
	ForEachScreenOption("FullSync");
end
------------------------------------------------------------------
function PerformPartialSync()
	ForEachScreenOption("PartialSync");
	if PreGame.GetGameOption("GameType") == TYPE_HOTSEAT then
		PreGame.SetGameType(GameTypes.GAME_HOTSEAT_MULTIPLAYER)
		SetPlayerIndex(nil)
		Controls.CivilizationButton:SetDisabled(true)
	else
		Controls.CivilizationButton:SetDisabled(false)
		PreGame.SetGameType( GAME_SINGLE_PLAYER )
	end
end
------------------------------------------------------------------
function PerformValidation()
	local args = {Valid = true};
	ForEachScreenOption("Validate", args);
	
	Controls.StartButton:SetDisabled(not args.Valid);
	
	if(not args.Valid) then
		Controls.StartButton:LocalizeAndSetToolTip(args.Reason);
	else
		Controls.StartButton:SetToolTipString(nil);
	end
end
------------------------------------------------------------------

function Initialize()

	print("-------------------------------------")
	print ("R.E.D WW2 - Europe 1940 setup screen")
	local gameVersion = UI.GetVersionInfo()
	print ("game version : " .. gameVersion )
	print("-------------------------------------")

	local RedWW2ModID = "580c14eb-9799-4d31-8b14-c2a78931de89"
	local RedWW2DataFilesModID = "544d699d-1c84-4606-b22f-a1b009af9471"
	
	-- list mods
	print("Enabled mods :")
	local unsortedInstalledMods = Modding.GetInstalledMods()
	for key, modInfo in pairs(unsortedInstalledMods) do
		if modInfo.Enabled then
			if (modInfo.Name) then
				print (" - " .. modInfo.Name .. " (v." .. modInfo.Version ..")")
				-- Don't allow another mod to be activated, let's help clean debugging
				if ( modInfo.ID ~= RedWW2ModID and modInfo.ID ~= RedWW2DataFilesModID ) then 
					--g_bCanLoad = false
				elseif ( modInfo.ID == RedWW2DataFilesModID and modInfo.Version >= 4) then
					g_bDataLoaded = true
				end
			end
		end
	end
	--[[
	print("Disabled mods :")
	local unsortedInstalledMods = Modding.GetInstalledMods()
	for key, modInfo in pairs(unsortedInstalledMods) do
		if not (modInfo.Enabled) then
			if (modInfo.Name) then
				print (" - " .. modInfo.Name .. " (v." .. modInfo.Version ..")")
			end
		end
	end	--]]
	print("-------------------------------------")

	Controls.RedWW2Logo:SetTextureAndResize( "_background.dds" )
	
	local defaultDifficulty = GameInfo.HandicapInfos["HANDICAP_DEITY"];
	--local defaultDifficulty = GameInfo.HandicapInfos["HANDICAP_IMMORTAL"];
	if(defaultDifficulty == nil) then
		defaultDifficulty = GameInfo.HandicapInfos()();	-- Get first handicap found.
	end
	g_CurrentDifficulty = defaultDifficulty.ID	
	PreGame.SetHandicap( 0, g_CurrentDifficulty )
	PreGame.SetGameOption("GameType", TYPE_SINGLE)

	for i, CIVILIZATION_TYPE in ipairs(ScenarioCivilizations) do
		PreGame.SetGameOption(CIVILIZATION_TYPE, RED_COMPUTER)
	end

	----------------------------------------------------------------        
	-- build the buttons
	----------------------------------------------------------------        

	
	Controls.CivilizationButton:RegisterCallback(Mouse.eLClick, function() ToggleCivSelection() end);

	--Controls.OptionStack:CalculateSize();
	--Controls.OptionStack:ReprocessAnchoring();
	Controls.OptionsScrollPanel:CalculateInternalSize();
			
	BuildCivSelectList();
	
	SetPlayerIndex(g_CurrentPlayerIndex);
end

function ToggleCivSelection()
	if(not Controls.SelectCivScrollPanel:IsHidden()) then
		Controls.SelectCivScrollPanel:SetHide(true);
		Controls.OptionSelectionBox:SetHide(false);
		Controls.DoMBox:SetHide(false);
		Controls.StartButton:SetHide(false);
	else
		BuildCivSelectList();
		Controls.SelectCivScrollPanel:SetHide(false);
		Controls.OptionSelectionBox:SetHide(true);
		Controls.DoMBox:SetHide(true);
		Controls.StartButton:SetHide(true);
	end
end

function BuildCivSelectList()

	Controls.SelectCivStack:DestroyAllChildren(); 
	
	--Create Random Selection Entry if it's not already selected
	if(g_CurrentPlayerIndex ~= nil) then

		local controlTable = {};
		ContextPtr:BuildInstanceForControl( "SelectCivInstance", controlTable, Controls.SelectCivStack );
		
		controlTable.Button:SetVoid1( -1 );
		controlTable.Button:RegisterCallback( Mouse.eLClick, function() SetPlayerIndex(nil); ToggleCivSelection(); end );

		controlTable.Title:LocalizeAndSetText("TXT_KEY_RANDOM_LEADER");
		controlTable.Description:LocalizeAndSetText("TXT_KEY_RANDOM_LEADER_HELP");
		IconHookup( 22, 128, "LEADER_ATLAS", controlTable.Portrait );
		
		if(questionOffset ~= nil) then       
			controlTable.Icon:SetTexture( questionTextureSheet );
			controlTable.Icon:SetTextureOffset( questionOffset );
			controlTable.IconShadow:SetTexture( questionTextureSheet );
			controlTable.IconShadow:SetTextureOffset( questionOffset );
		end
		
		local primaryColor       = GameInfo.Colors.COLOR_DARK_GREY;
		local primaryColorVector = Vector4( primaryColor.Red, primaryColor.Green, primaryColor.Blue, primaryColor.Alpha );
		controlTable.Icon:SetColor( primaryColorVector );
		
		local secondaryColor       = GameInfo.Colors.COLOR_LIGHT_GREY;
		local secondaryColorVector = Vector4( secondaryColor.Red, secondaryColor.Green, secondaryColor.Blue, secondaryColor.Alpha );
		controlTable.TeamColor:SetColor( secondaryColorVector );
	
		-- Sets Trait bonus Text
		controlTable.BonusDescription:SetText( "" );
	
		 -- Sets Bonus Icons
		local maxSmallButtons = 2;
		for buttonNum = 1, maxSmallButtons, 1 do
			local buttonName = "B"..tostring(buttonNum);
			controlTable[buttonName]:SetTexture( questionTextureSheet );
			controlTable[buttonName]:SetTextureOffset( questionOffset );
			controlTable[buttonName]:SetToolTipString( unknownString );
			controlTable[buttonName]:SetHide(false);
			local buttonFrameName = "BF"..tostring(buttonNum);
			controlTable[buttonFrameName]:SetHide(false);
		end
	end 
		 
	for playerIndex, civType in pairs(ScenarioCivilizations) do
		if(playerIndex ~= g_CurrentPlayerIndex) then
		
			local civ = GameInfo.Civilizations[civType];
			
			-- Use the Civilization_Leaders table to cross reference from this civ to the Leaders table
			local leader = GameInfo.Leaders[GameInfo.Civilization_Leaders( "CivilizationType = '" .. civ.Type .. "'" )().LeaderheadType];
			local leaderDescription = leader.Description;
		    
			local colorSet = GameInfo.PlayerColors[civ.DefaultPlayerColor];
		    
			local primaryColor       = GameInfo.Colors[colorSet.PrimaryColor];
			local primaryColorVector = Vector4( primaryColor.Red, primaryColor.Green, primaryColor.Blue, primaryColor.Alpha );
		    
			local secondaryColor       = GameInfo.Colors[colorSet.SecondaryColor];
			local secondaryColorVector = Vector4( secondaryColor.Red, secondaryColor.Green, secondaryColor.Blue, secondaryColor.Alpha );
		        
			local controlTable = {};
			ContextPtr:BuildInstanceForControl( "SelectCivInstance", controlTable, Controls.SelectCivStack );
		    
			controlTable.Button:SetVoid1( civ.ID );
			controlTable.Button:RegisterCallback( Mouse.eLClick, function() SetPlayerIndex(playerIndex); ToggleCivSelection(); end);
		   			
			controlTable.Description:SetText( Locale.ConvertTextKey( civ.Description ) );

			IconHookup( leader.PortraitIndex, 128, leader.IconAtlas, controlTable.Portrait );
			local textureOffset, textureAtlas = IconLookup( civ.PortraitIndex, 64, civ.IconAtlas );
			if textureOffset ~= nil then       
				controlTable.Icon:SetTexture( textureAtlas );
				controlTable.Icon:SetTextureOffset( textureOffset );
				controlTable.IconShadow:SetTexture( textureAtlas );
				controlTable.IconShadow:SetTextureOffset( textureOffset );
			end

			controlTable.Icon:SetColor( primaryColorVector );
			controlTable.TeamColor:SetColor( secondaryColorVector );
		    
			-- Sets Trait bonus Text
			local leaderTrait = GameInfo.Leader_Traits("LeaderType ='" .. leader.Type .. "'")();
			local trait = leaderTrait.TraitType;
			local gameTrait = GameInfo.Traits[trait];
			controlTable.BonusDescription:SetText( Locale.ConvertTextKey( gameTrait.Description ));
		 
		 	local title = string.format("%s (%s)", Locale.ConvertTextKey("TXT_KEY_RANDOM_LEADER_CIV", leaderDescription, civ.ShortDescription), Locale.ConvertTextKey(gameTrait.ShortDescription));
			controlTable.Title:SetText(title);
			
			PopulateUniqueBonuses( controlTable, civ, leader );
		end
	end
	
	Controls.SelectCivStack:CalculateSize();
	Controls.SelectCivStack:ReprocessAnchoring();
	Controls.SelectCivScrollPanel:CalculateInternalSize();
end

function SetPlayerIndex(playerIndex)
	g_CurrentPlayerIndex = playerIndex;
	if(playerIndex ~= nil) then		
		print ("player index = " .. playerIndex )
		--Set up items for specified player.
		local civType = ScenarioCivilizations[playerIndex];

		-- Use the Civilization_Leaders table to cross reference from this civ to the Leaders table
		local civ = GameInfo.Civilizations[civType];
		local leader = GameInfo.Leaders[GameInfo.Civilization_Leaders( "CivilizationType = '" .. civ.Type .. "'" )().LeaderheadType];
		local leaderDescription = leader.Description;
		
		-- Set Civ Leader Icon
		IconHookup( leader.PortraitIndex, 128, leader.IconAtlas, Controls.Portrait );
			
		-- Set Civ Icon
		IconHookup( civ.PortraitIndex, 64, civ.IconAtlas, Controls.IconShadow );
			
		-- Sets Trait bonus Text
		local leaderTrait = GameInfo.Leader_Traits("LeaderType ='" .. leader.Type .. "'")();
		local trait = leaderTrait.TraitType;
		Controls.BonusDescription:LocalizeAndSetText(GameInfo.Traits[trait].Description);

		-- Set Leader & Civ Text
		local title = Locale.ConvertTextKey("TXT_KEY_RANDOM_LEADER_CIV", leaderDescription, civ.ShortDescription);
		title = string.format("%s (%s)", title, Locale.ConvertTextKey(GameInfo.Traits[trait].ShortDescription));
		
		Controls.Title:SetText(title);
		
		---- Sets Bonus Icons
		PopulateUniqueBonuses( Controls, civ, leader );

	        
		-- Sets Dawn of Man Quote
		Controls.Quote:LocalizeAndSetText(civ.DawnOfManQuote or "");
    else
		-- Setup entry for random player.

		Controls.Title:LocalizeAndSetText("TXT_KEY_RANDOM_LEADER");
		--controlTable.Description:LocalizeAndSetText("TXT_KEY_RANDOM_LEADER_HELP");
		IconHookup( 22, 128, "LEADER_ATLAS", Controls.Portrait  );
		
		if(questionOffset ~= nil) then       
			--controlTable.Icon:SetTexture( questionTextureSheet );
			--controlTable.Icon:SetTextureOffset( questionOffset );
			Controls.IconShadow:SetTexture( questionTextureSheet );
			Controls.IconShadow:SetTextureOffset( questionOffset );
		end
			
		-- Sets Trait bonus Text
		Controls.BonusDescription:SetText( "" );
	
		 -- Sets Bonus Icons
		local maxSmallButtons = 2;
		for buttonNum = 1, maxSmallButtons, 1 do
			local buttonName = "B"..tostring(buttonNum);
			Controls[buttonName]:SetTexture( questionTextureSheet );
			Controls[buttonName]:SetTextureOffset( questionOffset );
			Controls[buttonName]:SetToolTipString( unknownString );
			Controls[buttonName]:SetHide(false);
			local buttonFrameName = "BF"..tostring(buttonNum);
			Controls[buttonFrameName]:SetHide(false);
		end
		
		-- Sets Dawn of Man Quote
		Controls.Quote:LocalizeAndSetText("TXT_KEY_RED_EURO1940_BRIEFING");		
    end

	Controls.MainStack:CalculateSize();
	Controls.MainStack:ReprocessAnchoring();
	Controls.DoMScrollPanel:CalculateInternalSize();
end

Initialize()
PerformFullSync()
PerformPartialSync()