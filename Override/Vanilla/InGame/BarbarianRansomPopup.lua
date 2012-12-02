
-- BARBARIAN RANSOM POPUP
-- This popup occurs when a Barbarian is ransoming a player-owned civilian Unit.
PopupLayouts[ButtonPopupTypes.BUTTONPOPUP_BARBARIAN_RANSOM] = function(popupInfo)
	
	local iUnitID = popupInfo.Data1;
	
	local pPlayer = Players[Game.GetActivePlayer()];
	local pUnit = pPlayer:GetUnitByID(iUnitID);
	
	local iNumGold = GameDefines["BARBARIAN_UNIT_GOLD_RANSOM"];
	if (iNumGold > pPlayer:GetGold()) then
		iNumGold = pPlayer:GetGold();
	end

	local strText = Locale.ConvertTextKey("TXT_KEY_RANSOM_POPUP_INFO", iNumGold);
	SetPopupText(strText);
	
	local strButtonText;
	
	-- Pay Ransom Button
	local OnPayRansomClicked = function()
		Network.SendBarbarianRansom(0, iUnitID);	-- 0 is Button ID
	end
	
	strButtonText = Locale.ConvertTextKey("TXT_KEY_RANSOM_POPUP_PAY");
	AddButton(strButtonText, OnPayRansomClicked);
	
	-- Abandon Unit
	local OnAbandonUnitClicked = function()
		Network.SendBarbarianRansom(1, iUnitID);	-- 1 is Button ID
	end
	
	strButtonText = Locale.ConvertTextKey("TXT_KEY_RANSOM_POPUP_ABANDON");
	AddButton(strButtonText, OnAbandonUnitClicked);
end




