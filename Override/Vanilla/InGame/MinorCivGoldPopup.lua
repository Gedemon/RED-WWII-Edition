local iGoldGiftLarge = GameDefines["MINOR_GOLD_GIFT_LARGE"]
local iGoldGiftMedium = GameDefines["MINOR_GOLD_GIFT_MEDIUM"]
local iGoldGiftSmall = GameDefines["MINOR_GOLD_GIFT_SMALL"]

-- This popup occurs when the player is trying to construct an Improvement over the top of another one.
PopupLayouts[ButtonPopupTypes.BUTTONPOPUP_MINOR_GOLD] = function(popupInfo)

	local iMinor	= popupInfo.Data1;
	local pPlayer = Players[iMinor];
	
	local iActivePlayer = Game.GetActivePlayer();
	local pActivePlayer = Players[iActivePlayer];
	
	local iNumButtons = 0;
	local iGold;
	local iLowestGold;
	local iFriendshipAmount;
	
	-- Small Gold
	local OnSmallGold = function()
		Game.DoMinorGoldGift(iMinor, iGoldGiftSmall);
	end
	
	local iNumGoldPlayerHas = pActivePlayer:GetGold();
	
	iGold = iGoldGiftSmall;
	iLowestGold = iGold;
	iFriendshipAmount = pPlayer:GetFriendshipFromGoldGift(iActivePlayer, iGold);
	local buttonText = Locale.ConvertTextKey("TXT_KEY_POPUP_MINOR_GOLD_GIFT_AMOUNT", iGold, iFriendshipAmount);
	if (iNumGoldPlayerHas < iGold) then
		 buttonText = "[COLOR_WARNING_TEXT]" .. buttonText .. "[ENDCOLOR]";
	end
	AddButton(buttonText, OnSmallGold)

	-- Medium Gold
	local OnMediumGold = function()
		Game.DoMinorGoldGift(iMinor, iGoldGiftMedium);
	end
	
	iGold = iGoldGiftMedium;
	iFriendshipAmount = pPlayer:GetFriendshipFromGoldGift(iActivePlayer, iGold);
	local buttonText = Locale.ConvertTextKey("TXT_KEY_POPUP_MINOR_GOLD_GIFT_AMOUNT", iGold, iFriendshipAmount);
	if (iNumGoldPlayerHas < iGold) then
		 buttonText = "[COLOR_WARNING_TEXT]" .. buttonText .. "[ENDCOLOR]";
	end
	AddButton(buttonText, OnMediumGold)
	
	-- Large Gold
	local OnBigGold = function()
		Game.DoMinorGoldGift(iMinor, iGoldGiftLarge);
	end
	
	iGold = iGoldGiftLarge;
	iFriendshipAmount = pPlayer:GetFriendshipFromGoldGift(iActivePlayer, iGold);
	local buttonText = Locale.ConvertTextKey("TXT_KEY_POPUP_MINOR_GOLD_GIFT_AMOUNT", iGold, iFriendshipAmount);
	if (iNumGoldPlayerHas < iGold) then
		 buttonText = "[COLOR_WARNING_TEXT]" .. buttonText .. "[ENDCOLOR]";
	end
	AddButton(buttonText, OnBigGold)
	
	-- Do we have options here or not?
	local popupText;
	if (iNumGoldPlayerHas >= iLowestGold) then
		popupText = Locale.ConvertTextKey("TXT_KEY_POPUP_MINOR_GOLD_GIFT", pPlayer:GetCivilizationShortDescriptionKey());	
		SetPopupText(popupText);
	else
		popupText = Locale.ConvertTextKey("TXT_KEY_POPUP_MINOR_GOLD_GIFT_CANT", iLowestGold, pPlayer:GetCivilizationShortDescriptionKey());	
		SetPopupText(popupText);
	end
	
	Controls.CloseButton:SetHide( false );
	
end


----------------------------------------------------------------        
-- Key Down Processing
----------------------------------------------------------------        
PopupInputHandlers[ButtonPopupTypes.BUTTONPOPUP_MINOR_GOLD] = function( uiMsg, wParam, lParam )
    if uiMsg == KeyEvents.KeyDown then
        if( wParam == Keys.VK_ESCAPE or wParam == Keys.VK_RETURN ) then
			HideWindow();
            return true;
        end
    end
end
