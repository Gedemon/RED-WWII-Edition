print ("Loading custom ModsMenu.lua") -- RED WWII Edition
----------------------------------------------------
-- Mods Menu
----------------------------------------------------
include( "InstanceManager" );


g_InstanceManager = InstanceManager:new( "ModInstance", "Label", Controls.ModsStack );


--------------------------------------------------
-- Navigation Routines (Installed,Online,Back)
--------------------------------------------------
function NavigateBack()
	UIManager:SetUICursor( 1 );
	Modding.DeactivateMods();
	UIManager:DequeuePopup( ContextPtr );
	UIManager:SetUICursor( 0 );
	
	Events.SystemUpdateUI( SystemUpdateUIType.RestoreUI, "ModsBrowserReset" );
end

----------------------------------------------------
-- UI Event Handlers
----------------------------------------------------
function OnSinglePlayerClick()
	UIManager:QueuePopup( Controls.ModdingSinglePlayer, PopupPriority.ModdingSinglePlayer );
end
Controls.SinglePlayerButton:RegisterCallback(Mouse.eLClick, OnSinglePlayerClick);
----------------------------------------------------
function OnMultiPlayerClick()
	UIManager:QueuePopup( Controls.ModdingMultiplayer, PopupPriority.ModMultiplayerSelectScreen );
end
Controls.MultiPlayerButton:RegisterCallback(Mouse.eLClick, OnMultiPlayerClick);
----------------------------------------------------------------------
Controls.BackButton:RegisterCallback(Mouse.eLClick, NavigateBack);


--------------------------------------------------
-- Show/Hide Handler
--------------------------------------------------
ContextPtr:SetShowHideHandler(function(isHiding)
	if(not isHiding) then
		local supportsSinglePlayer = Modding.AllEnabledModsContainPropertyValue("SupportsSinglePlayer", 1);
		local supportsMultiplayer = Modding.AllEnabledModsContainPropertyValue("SupportsMultiplayer", 1);
		
		Controls.SinglePlayerButton:SetDisabled(not supportsSinglePlayer);
		Controls.MultiPlayerButton:SetDisabled(not supportsMultiplayer);
		
		--if(supportsSinglePlayer and not supportsMultiplayer) then
			--OnSinglePlayerClick();
		--elseif(supportsMultiplayer and not supportsSinglePlayer) then
			--OnMultiPlayerClick();
		--end
		
		g_InstanceManager:ResetInstances();
		
		local mods = Modding.GetEnabledModsByActivationOrder();
		
		if(#mods == 0) then
			Controls.ModsInUseLabel:SetHide(true);
		else
			Controls.ModsInUseLabel:SetHide(false);
			for i,v in ipairs(mods) do
				local displayName = Modding.GetModProperty(v.ModID, v.Version, "Name");
				local displayNameVersion = string.format("[ICON_BULLET] %s (v. %i)", displayName, v.Version);			
				local listing = g_InstanceManager:GetInstance();
				listing.Label:SetText(displayNameVersion);
				listing.Label:SetToolTipString(displayNameVersion);
			end
		end
		-- <<<<< RED WWII Edition
		-- Loading a RED WWII save from here may crash the game, advancing to custom setup screen...
		g_RED_WWII_IsActive = false
		local mods = Modding.GetEnabledModsByActivationOrder()
		if(#mods > 0) then
			for i,v in ipairs(mods) do
				if v.ModID == "580c14eb-9799-4d31-8b14-c2a78931de89" then g_RED_WWII_IsActive = true; end -- RED WWII Edition
			end
		end
		if g_RED_WWII_IsActive then
			UIManager:QueuePopup( Controls.ModdingSinglePlayer, PopupPriority.ModdingSinglePlayer );
		end
		-- RED RED WWII Edition >>>>>
	end
end);
--------------------------------------------------
-- Input Handler
--------------------------------------------------
ContextPtr:SetInputHandler( function(uiMsg, wParam, lParam)

	if uiMsg == KeyEvents.KeyDown then
		if wParam == Keys.VK_ESCAPE then
			NavigateBack();
		end
	end

	return true;
end);

Controls.MultiPlayerButton:SetHide(true);
