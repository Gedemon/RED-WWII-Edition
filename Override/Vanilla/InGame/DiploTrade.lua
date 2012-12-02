----------------------------------------------------------------        
----------------------------------------------------------------        
include( "TradeLogic" );

Events.AILeaderMessage.Add( LeaderMessageHandler );


Controls.WhatWillMakeThisWorkButton:RegisterCallback( Mouse.eLClick, OnEqualizeDeal );
Controls.WhatWillEndThisWarButton:RegisterCallback( Mouse.eLClick, OnEqualizeDeal );
Controls.WhatConcessionsButton:RegisterCallback( Mouse.eLClick, OnEqualizeDeal );
Controls.WhatDoYouWantButton:RegisterCallback( Mouse.eLClick, OnWhatDoesAIWant );
Controls.WhatWillYouGiveMeButton:RegisterCallback( Mouse.eLClick, OnWhatWillAIGive );

ContextPtr:SetInputHandler( InputHandler );


----------------------------------------------------------------        
----------------------------------------------------------------        
function OnLeavingLeader()
    UIManager:DequeuePopup( ContextPtr );
end
Events.LeavingLeaderViewMode.Add( OnLeavingLeader );
