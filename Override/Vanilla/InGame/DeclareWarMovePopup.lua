
-- DECLARE WAR MOVE POPUP
-- This popup occurs when a team unit moves onto rival territory
-- or attacks an rival unit
PopupLayouts[ButtonPopupTypes.BUTTONPOPUP_DECLAREWARMOVE] = function(popupInfo)
	local eRivalTeam = popupInfo.Data1;
	local iX = popupInfo.Data2;
	local iY = popupInfo.Data3;
	local bShift = popupInfo.Option1;

	local plot = Map.GetPlot(iX, iY);

	local popupText;
	
	-- Declaring war by entering player's lands
	if (plot:GetTeam() == eRivalTeam and (not Teams[eRivalTeam]:IsMinorCiv() or plot:IsCity())) then
		local owner = Players[plot:GetOwner()];
		
		-- If not a Minor and allowed to make open borders, ask about that
		if (not owner:IsMinorCiv() and Teams[Game.GetActiveTeam()]:IsOpenBordersTradingAllowed()) then
			popupText = Locale.ConvertTextKey("TXT_KEY_POPUP_DOES_THIS_MEAN_WAR", Teams[eRivalTeam]:GetNameKey());
			popupText = popupText .. "[NEWLINE][NEWLINE]" .. Locale.ConvertTextKey("TXT_KEY_POPUP_ENTER_WITH_OPEN_BORDERS");
			
		-- Normal DoW message
		else
			if (owner:IsMinorCiv()) then
				popupText = Locale.ConvertTextKey("TXT_KEY_POPUP_ENTER_CITY_STATE_WAR", Teams[eRivalTeam]:GetNameKey());			
			else
				popupText = Locale.ConvertTextKey("TXT_KEY_POPUP_ENTER_LANDS_WAR", Teams[eRivalTeam]:GetNameKey());			
			end
		end
		
	-- Declaring war by attacking Unit
	else
	    if (not Teams[eRivalTeam]:IsMinorCiv()) then
			popupText = Locale.ConvertTextKey("TXT_KEY_POPUP_DOES_THIS_MEAN_WAR", Teams[eRivalTeam]:GetNameKey());
        else
			local bIsProtected = false;
			popupText = Locale.ConvertTextKey("TXT_KEY_POPUP_DOES_THIS_MEAN_WAR_PROTECTED_CITY_STATE", Teams[eRivalTeam]:GetNameKey());
	
			for iPlayerLoop = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
				pOtherPlayer = Players[iPlayerLoop];
			
				-- Don't test protection status with active player!
				if (iPlayerLoop ~= Game.GetActivePlayer()) then
					if (pOtherPlayer:IsAlive()) then
					    local iMinor = Teams[eRivalTeam]:GetLeaderID();
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
				popupText = Locale.ConvertTextKey("TXT_KEY_POPUP_DOES_THIS_MEAN_WAR", Teams[eRivalTeam]:GetNameKey());
			end
		end
	end
	
	SetPopupText(popupText);
	
	-- Initialize 'yes' button.
	local OnYesClicked = function()
		-- Send War netmessage.
		Network.SendChangeWar(eRivalTeam, true);
		
		-- Diplomatic response from AI
		if (not Teams[eRivalTeam]:IsMinorCiv() and not Teams[eRivalTeam]:IsHuman()) then
			if (not Game.IsNetworkMultiPlayer()) then
				Game.DoFromUIDiploEvent( FromUIDiploEventTypes.FROM_UI_DIPLO_EVENT_HUMAN_DECLARES_WAR, Teams[eRivalTeam]:GetLeaderID(), 0, 0 );
			end
		end
		
		-- Tell unit to move to position.
		Game.SelectionListMove(plot, false, false, false);
		
		--local messagePushMission		= GameMessageTypes.GAMEMESSAGE_PUSH_MISSION;
		--local missionMoveTo				= MissionTypes.MISSION_MOVE_TO;
		--Game.SelectionListGameNetMessage(messagePushMission, missionMoveTo, iX, iY, 0, false, bShift); 	
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
PopupInputHandlers[ButtonPopupTypes.BUTTONPOPUP_DECLAREWARMOVE] = function( uiMsg, wParam, lParam )
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
