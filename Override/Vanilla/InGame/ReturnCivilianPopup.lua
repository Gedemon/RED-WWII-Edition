
-- RETURN CIVILIAN POPUP
-- This popup occurs when an action needs confirmation.
PopupLayouts[ButtonPopupTypes.BUTTONPOPUP_RETURN_CIVILIAN] = function(popupInfo)

	print("Trying to do the Return Civilian popup");

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

	local strOldUnitKey = pUnit:GetNameKey();
	local iNewUnit = pUnit:GetCaptureUnitType(pGiftingPlayer:GetCivilizationType());
	local strNewUnitKey = GameInfo.Units[iNewUnit].Description;

	popupText = Locale.ConvertTextKey( "TXT_KEY_POP_RETURN_CIVILIAN_CONFIRMATION", strCivName, strNewUnitKey );
	
	-- Returning to a City-State, add string indicating they will be happy
	if (pGiftedPlayer:IsMinorCiv()) then
		local iInfluence = GameDefines.RETURN_CIVILIAN_FRIENDSHIP;		-- 30
		popupText = popupText .. " ";
		popupText = popupText .. Locale.ConvertTextKey( "TXT_KEY_POP_RETURN_CIVILIAN_CITY_STATE", iInfluence);
	-- Returning to an AI player, add string indicating they will be happy
	elseif (not pGiftedPlayer:IsHuman()) then
		popupText = popupText .. " ";
		popupText = popupText .. Locale.ConvertTextKey( "TXT_KEY_POP_RETURN_CIVILIAN_AI");
	end
	
	SetPopupText(popupText);
	
	-- Initialize 'yes' button.
	local OnYesClicked = function()
		Network.SendReturnCivilian(true, iGiftedPlayer, iUnitIndex);
	end
	
	-- Initialize 'no' button.
	local OnNoClicked = function()
		Network.SendReturnCivilian(false, iGiftedPlayer, iUnitIndex);
	end
	
	local buttonText = Locale.ConvertTextKey("TXT_KEY_POP_RETURN_CIVILIAN_CONFIRMATION_RETURN");
	AddButton(buttonText, OnYesClicked);
		
	-- Initialize 'no' button.
	local buttonText = Locale.ConvertTextKey("TXT_KEY_POP_RETURN_CIVILIAN_CONFIRMATION_TAKE");
	AddButton(buttonText, OnNoClicked);

end
