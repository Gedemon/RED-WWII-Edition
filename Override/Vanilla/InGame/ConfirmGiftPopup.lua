
-- CONFIRM COMMAND POPUP
-- This popup occurs when an action needs confirmation.
PopupLayouts[ButtonPopupTypes.BUTTONPOPUP_GIFT_CONFIRM] = function(popupInfo)

	print("Trying to do the gift confirm popup");

	local iGiftingPlayer = popupInfo.Data1;
	local iGiftedPlayer  = popupInfo.Data2;
	local iUnitIndex	 = popupInfo.Data3;

	print("iGiftingPlayer " .. iGiftingPlayer);
	print("iGiftedPlayer " .. iGiftedPlayer);
	print("iUnitIndex " .. iUnitIndex);

	pGiftingPlayer = Players[iGiftingPlayer];
	pGiftedPlayer  = Players[iGiftedPlayer];
	pUnit = pGiftingPlayer:GetUnitByID(iUnitIndex);

	local strCivName;
	if (pGiftedPlayer:IsMinorCiv()) then
		strCivName = Locale.ConvertTextKey(pGiftedPlayer:GetCivilizationShortDescriptionKey());
	else
		strCivName = Locale.ConvertTextKey(GameInfo.Civilizations[pGiftedPlayer:GetCivilizationType()].ShortDescription);
	end

	local unitNameKey = pUnit:GetNameKey();
	local convertedUnitKey = Locale.ConvertTextKey(unitNameKey);

	popupText = Locale.ConvertTextKey( "TXT_KEY_POP_GIVE_UNIT_CONFIRMATION", strCivName, convertedUnitKey );
	
	SetPopupText(popupText);
		
	-- Initialize 'yes' button.
	local OnYesClicked = function()
		Network.SendGiftUnit(iGiftedPlayer, iUnitIndex);
	end
	
	local buttonText = Locale.ConvertTextKey("TXT_KEY_POPUP_YES");
	AddButton(buttonText, OnYesClicked);
		
	-- Initialize 'no' button.
	local buttonText = Locale.ConvertTextKey("TXT_KEY_POPUP_NO");
	AddButton(buttonText, nil);

end
