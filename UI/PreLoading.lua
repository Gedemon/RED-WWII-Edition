-------------------------------------------------
-- PreLoading
-------------------------------------------------

function ShowHideHandler( bIsHide, bIsInit )

    if( not bIsHide ) then
    	UIManager:SetUICursor( 0 );
        Controls.LoadingImage:SetTexture( "CivilzationVAtlas.dds" );
    else
        Controls.LoadingImage:UnloadTexture();
    end
end
--ContextPtr:SetShowHideHandler( ShowHideHandler );
