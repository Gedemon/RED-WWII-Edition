
-- MINOR CIV ENTER TERRITORY POPUP
-- This popup occurs when the player moves into a minor civ's territory
PopupLayouts[ButtonPopupTypes.BUTTONPOPUP_MINOR_CIV_ENTER_TERRITORY] = function(popupInfo)
	local eRivalTeam = popupInfo.Data1;
	local iX = popupInfo.Data2;
	local iY = popupInfo.Data3;
	local bShift = popupInfo.Option1;

	local plot = Map.GetPlot(iX, iY);

	local popupText;
	if (plot:GetTeam() == eRivalTeam) then

		popupText = Locale.ConvertTextKey("TXT_KEY_POPUP_ENTER_MINOR_CIV_LANDS", Players[plot:GetOwner()]:GetCivilizationAdjective());
		SetPopupText(popupText);
		
	end	
	
	-- Initialize 'yes' button.
	local OnYesClicked = function()
		
		Network.SendMinorCivEnterTerritory(eRivalTeam);
		
		-- Tell unit to move to position.
		local messagePushMission		= GameMessageTypes.GAMEMESSAGE_PUSH_MISSION;
		local missionMoveTo				= MissionTypes.MISSION_MOVE_TO;
		
		Game.SelectionListGameNetMessage(messagePushMission, missionMoveTo, iX, iY, nil, false, bShift); 	
	end
	
	local buttonText = Locale.ConvertTextKey("TXT_KEY_ENTER_MINOR_CIV_LANDS_YES");
	AddButton(buttonText, OnYesClicked);
	
	-- Initialize 'no' button.
	local buttonText = Locale.ConvertTextKey("TXT_KEY_ENTER_MINOR_CIV_LANDS_NO");
	AddButton(buttonText, nil);

end
