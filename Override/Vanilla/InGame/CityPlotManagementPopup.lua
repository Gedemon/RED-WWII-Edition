
-- CONFIRM COMMAND POPUP
-- This popup occurs when an action needs confirmation.
PopupLayouts[ButtonPopupTypes.BUTTONPOPUP_CITY_PLOT_MANAGEMENT] = function(popupInfo)

	SetPopupText( Locale.ConvertTextKey( "TXT_KEY_POP_CITY_PLOT_MANAGEMENT" ));
		
	-- Initialize 'yes' button.
	local OnYesClicked = function()
		UI.SetInterfaceMode(InterfaceModeTypes.INTERFACEMODE_CITY_PLOT_SELECTION);
	end
	
	local buttonText = Locale.ConvertTextKey("TXT_KEY_POPUP_YES");
	AddButton(buttonText, OnYesClicked);
		
	-- Initialize 'no' button.
	local buttonText = Locale.ConvertTextKey("TXT_KEY_POPUP_NO");
	AddButton(buttonText, nil);
	
	Controls.CloseButton:SetHide( false );

end

----------------------------------------------------------------        
-- Key Down Processing
----------------------------------------------------------------        
PopupInputHandlers[ButtonPopupTypes.BUTTONPOPUP_CITY_PLOT_MANAGEMENT] = function( uiMsg, wParam, lParam )
    if uiMsg == KeyEvents.KeyDown then
        if( wParam == Keys.VK_ESCAPE or wParam == Keys.VK_RETURN ) then
			HideWindow();
            return true;
        end
    end
end

----------------------------------------------------------------
-- 'Active' (local human) player has changed
----------------------------------------------------------------
Events.GameplaySetActivePlayer.Add(HideWindow);
