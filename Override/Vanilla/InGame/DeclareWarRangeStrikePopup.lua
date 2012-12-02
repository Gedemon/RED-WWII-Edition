
-- DECLARE WAR RANGE STRIKE POPUP
-- This popup occurs when a team unit attempts a range strike
-- attack on a rival unit or city.
PopupLayouts[ButtonPopupTypes.BUTTONPOPUP_DECLAREWARRANGESTRIKE] = function(popupInfo)
	local eRivalTeam	= popupInfo.Data1;
	local iX			= popupInfo.Data2;
	local iY			= popupInfo.Data3;

	local rivalTeam = Teams[eRivalTeam];
	
	if (not rivalTeam:IsMinorCiv()) then
		popupText = Locale.ConvertTextKey("TXT_KEY_POPUP_DOES_THIS_MEAN_WAR", rivalTeam:GetName());
    else
		local bIsProtected = false;
		popupText = Locale.ConvertTextKey("TXT_KEY_POPUP_DOES_THIS_MEAN_WAR_PROTECTED_CITY_STATE", rivalTeam:GetName());
	
		for iPlayerLoop = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
			pOtherPlayer = Players[iPlayerLoop];
			
			-- Don't test protection status with active player!
			if (iPlayerLoop ~= Game.GetActivePlayer()) then
				if (pOtherPlayer:IsAlive()) then
				    local iMinor = rivalTeam:GetLeaderID();
					if (pOtherPlayer:IsProtectingMinor(iMinor)) then
						if (bIsProtected)then
							popupText = popupText .. ", " .. Locale.ConvertTextKey(Players[iPlayerLoop]:GetCivilizationShortDescriptionKey());
						else
							popupText = popupText .. " " .. Locale.ConvertTextKey(Players[iPlayerLoop]:GetCivilizationShortDescriptionKey());	
							bIsProtected = true;	
						end		    
					end
				end
			end
		end

		if (not bIsProtected) then
			popupText = Locale.ConvertTextKey("TXT_KEY_POPUP_DOES_THIS_MEAN_WAR", rivalTeam:GetName());
		end
	end	
		
	SetPopupText(popupText);
		
	-- Initialize 'yes' button.
	local OnYesClicked = function()
		-- Send War netmessage.
		Network.SendChangeWar(eRivalTeam, true);

		-- Diplomatic response from AI
		if (not rivalTeam:IsMinorCiv() and not rivalTeam:IsHuman()) then
			if (not Game.IsNetworkMultiPlayer()) then
				Game.DoFromUIDiploEvent( FromUIDiploEventTypes.FROM_UI_DIPLO_EVENT_HUMAN_DECLARES_WAR, rivalTeam:GetLeaderID(), 0, 0 );
			end
		end
		
		-- Attack!
		local messagePushMission = GameMessageTypes.GAMEMESSAGE_PUSH_MISSION
		local missionRangeAttack = MissionTypes.MISSION_RANGE_ATTACK
		Game.SelectionListGameNetMessage(messagePushMission, missionRangeAttack, iX, iY);
		
		local interfaceModeSelection = InterfaceModeTypes.INTERFACEMODE_SELECTION
		UI.SetInterfaceMode(interfaceModeSelection);
		
	end
	
	local buttonText = Locale.ConvertTextKey("TXT_KEY_DECLARE_WAR_YES");
	AddButton(buttonText, OnYesClicked);
		
	-- Initialize 'no' button.
	local buttonText = Locale.ConvertTextKey("TXT_KEY_DECLARE_WAR_NO");
	AddButton(buttonText, nil);
	
	Controls.CloseButton:SetHide( false );

end

----------------------------------------------------------------        
-- Key Down Processing
----------------------------------------------------------------        
PopupInputHandlers[ButtonPopupTypes.BUTTONPOPUP_DECLAREWARRANGESTRIKE] = function( uiMsg, wParam, lParam )
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
