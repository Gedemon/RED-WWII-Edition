-- CONFIRM POLICY BRANCH SWITCH POPUP

PopupLayouts[ButtonPopupTypes.BUTTONPOPUP_CONFIRM_POLICY_BRANCH_SWITCH] = function(popupInfo)

	local iNewPolicyBranch = popupInfo.Data1;	-- This should never be nil, because we should have checked before creating Popup
	
	local pPolicyBranch = GameInfo.PolicyBranchTypes[iNewPolicyBranch];
	local strNewBranchType = pPolicyBranch.Type;
	
	local iTempBranch;
	
	local iNumBranchesDisabled = 0;
	local strOldBranches = "";
	for row in GameInfo.PolicyBranch_Disables() do
		if (row.PolicyBranchType == strNewBranchType) then
			
			if (iNumBranchesDisabled > 0) then
				strOldBranches = strOldBranches .. ", ";
			end
			
			iTempBranch = GameInfoTypes[row.PolicyBranchDisable];
			strOldBranches = strOldBranches .. Locale.ConvertTextKey(GameInfo.PolicyBranchTypes[iTempBranch].Description);
			
			-- Increment count - used to add commas in multi entries
			iNumBranchesDisabled = iNumBranchesDisabled + 1;
		end
	end
	
	local strText = Locale.ConvertTextKey("TXT_KEY_SWITCH_POLICY_BRANCHES", pPolicyBranch.Description, strOldBranches);
	
	SetPopupText(strText);
	
	-- Initialize 'yes' button.
	local OnYesClicked = function()
		local bPolicy = false;
		Network.SendUpdatePolicies(iNewPolicyBranch, bPolicy, true);
	end
	
	local buttonText = Locale.ConvertTextKey("TXT_KEY_POPUP_YES");
	AddButton(buttonText, OnYesClicked);
		
	-- Initialize 'no' button.
	local buttonText = Locale.ConvertTextKey("TXT_KEY_POPUP_NO");
	AddButton(buttonText, nil);

end
