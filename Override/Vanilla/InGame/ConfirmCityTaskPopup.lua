-- CONFIRM CITY TASK POPUP
-- This popup occurs when an action needs confirmation.

PopupLayouts[ButtonPopupTypes.BUTTONPOPUP_CONFIRM_CITY_TASK] = function(popupInfo)

	local iCityID	= popupInfo.Data1;
	local iTask	= popupInfo.Data2;
	
	if (iTask == TaskTypes.TASK_RAZE) then
		popupText = Locale.ConvertTextKey("TXT_KEY_POPUP_ARE_YOU_SURE_RAZE");
	else
		popupText = "NO TEXT HERE";
	end
	
	SetPopupText(popupText);
		
	-- Initialize 'yes' button.
	local OnYesClicked = function()
		
		-- Confirm action
		Network.SendDoTask(iCityID, iTask, -1, -1, false, false, false, false);
	end
	
	local buttonText = Locale.ConvertTextKey("TXT_KEY_POPUP_YES");
	AddButton(buttonText, OnYesClicked)
		
	-- Initialize 'no' button.
	local buttonText = Locale.ConvertTextKey("TXT_KEY_POPUP_NO");
	AddButton(buttonText, nil);

end
