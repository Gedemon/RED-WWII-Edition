print ("Loading custom ModsSinglePlayer.lua") -- RED WWII Edition
----------------------------------------------------
-- Mods Menu
----------------------------------------------------
include( "InstanceManager" );

g_InstanceManager = InstanceManager:new( "ModInstance", "Label", Controls.ModsStack );

--------------------------------------------------
-- Navigation Routines
--------------------------------------------------
function NavigateBack()
	UIManager:DequeuePopup( ContextPtr );
end

----------------------------------------------------
-- UI Event Handlers
----------------------------------------------------
Controls.PlayMapButton:RegisterCallback( Mouse.eLClick, function()
    UIManager:QueuePopup(Controls.ModdingGameSetupScreen, PopupPriority.ModdingGameSetupScreen );
end);

----------------------------------------------------------------------
Controls.CustomGameButton:RegisterCallback( Mouse.eLClick, function()
    UIManager:QueuePopup(Controls.ModsCustom, PopupPriority.ModsCustom );
end);
----------------------------------------------------------------------
Controls.BackButton:RegisterCallback(Mouse.eLClick, NavigateBack);
----------------------------------------------------------------------
Controls.LoadGameButton:RegisterCallback( Mouse.eLClick, function()
    UIManager:QueuePopup(Controls.LoadGameScreen, PopupPriority.LoadGameScreen );
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

--------------------------------------------------
-- Show/Hide Handler
--------------------------------------------------
ContextPtr:SetShowHideHandler(function(isHiding)
	if(not isHiding) then
		
		local bHasCustomGames = false;
		for row in Modding.GetActivatedModEntryPoints("Custom") do
			bHasCustomGames = true;
			break;
		end
		
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
		
		Controls.PlayMapButton:SetHide(Modding.AnyEnabledModsContainPropertyValue("HideSetupGame", 1));			
		Controls.CustomGameButton:SetHide(not bHasCustomGames);
		-- <<<<< RED WWII Edition
		-- Loading a RED WWII save from here may crash the game...
		g_RED_WWII_IsActive = false
		local mods = Modding.GetEnabledModsByActivationOrder()
		if(#mods > 0) then
			for i,v in ipairs(mods) do
				if v.ModID == "580c14eb-9799-4d31-8b14-c2a78931de89" then g_RED_WWII_IsActive = true; end -- RED WWII Edition
			end
		end
		if g_RED_WWII_IsActive then
			Controls.LoadGameButton:SetHide(true)
			UIManager:QueuePopup(Controls.ModsCustom, PopupPriority.ModsCustom )
		end
		-- RED RED WWII Edition >>>>>
	end
end);
