-------------------------------------------------
-- Diplomacy and Advisors Buttons that float out in the screen
-------------------------------------------------
include( "TradeLogic" );
Events.OpenPlayerDealScreenEvent.Add( OnOpenPlayerDealScreen );
Controls.ModifyButton:RegisterCallback( Mouse.eLClick, OnModify );



ContextPtr:SetInputHandler( InputHandler );

Controls.CloseButton:RegisterCallback( Mouse.eLClick, OnBack );

----------------------------------------------------------------
-- 'Active' (local human) player has changed
----------------------------------------------------------------
function OnDiploActivePlayerChanged( iActivePlayer, iPrevActivePlayer )
	if (not ContextPtr:IsHidden()) then
		OnBack();
	end
end
Events.GameplaySetActivePlayer.Add(OnDiploActivePlayerChanged);
