-------------------------------------------------
-- Technology Chooser Popup
-------------------------------------------------

include( "InstanceManager" );
include( "TechButtonInclude" );
include( "TechHelpInclude" );

local g_TechInstanceManager = InstanceManager:new( "TechButtonInstance", "TechButtonContainer", Controls.ButtonStack );


local maxSmallButtons = 5;
local playerID = Game.GetActivePlayer();	
local player = Players[playerID];
local civType = GameInfo.Civilizations[player:GetCivilizationType()].Type;
local activeTeamID = Game.GetActiveTeam();
local activeTeam = Teams[activeTeamID];

local mostRecentTech = -1;
local currentTech = -1;


-------------------------------------------------
-- Close this popup
-------------------------------------------------
function ClosePopup()
	ContextPtr:SetHide( true );
	Events.SerialEventGameMessagePopupProcessed(ButtonPopupTypes.BUTTONPOPUP_CHOOSETECH, 0);
end
--Controls.CloseButton:RegisterCallback( Mouse.eLClick, ClosePopup);

-------------------------------------------------
-- Open the tech tree
-------------------------------------------------
function OpenTechTree()
	ClosePopup();
	Events.SerialEventGameMessagePopup( { Type = ButtonPopupTypes.BUTTONPOPUP_TECH_TREE } );
end
Controls.OpenTTButton:RegisterCallback( Mouse.eLClick, OpenTechTree);

-------------------------------------------------
-- On Tech Selected
-------------------------------------------------
function TechSelected( eTech, iDiscover)
   	Network.SendResearch(eTech, iDiscover, -1, false);
	ClosePopup();
end


-------------------------------------------------
-- On Display
-------------------------------------------------
function OnDisplay(popupInfo)

    --If popup type isn't choose tech, exit
    if popupInfo.Type ~= ButtonPopupTypes.BUTTONPOPUP_CHOOSETECH then
        return;
    end
    
    -- Only display popup if the ID is the active player.
    if( popupInfo.Data1 ~= Game.GetActivePlayer() ) then
        return;
    end
	
    ContextPtr:SetHide( false );

  	if( popupInfo.Data3 ~= popupInfo.Data3 ~= -1 ) then
  		mostRecentTech = popupInfo.Data3;
  	end
  	
	OnTechPanelUpdated();
	
	Events.SerialEventGameMessagePopupShown(popupInfo);
end
Events.SerialEventGameMessagePopup.Add( OnDisplay );


----------------------------------------------------------------
----------------------------------------------------------------
function OnTechPanelUpdated()
    if( ContextPtr:IsHidden() == true ) then
        return;
    end
	
	Game.SetAdvisorRecommenderTech( playerID );
	
  	local iDiscover = player:GetNumFreeTechs();
  	
    -- Clear buttons
    g_TechInstanceManager:ResetInstances();
    
    techPediaSearchStrings = {};
    
    local thisTechInfo = nil;
    
    if (not Game.IsOption(GameOptionTypes.GAMEOPTION_NO_SCIENCE)) then
 		for tech in GameInfo.Technologies() do
 			local techID = tech.ID;
 			if player:CanResearch( techID ) then
				AddTechButton( tech, player:GetResearchTurnsLeft( techID, true ), iDiscover);
			end
		end
	end
	
	local screenX, screenY = UIManager:GetScreenSizeVal();
	
	Controls.ScrollPanelBlackFrame:SetSizeY( screenY );
	Controls.ScrollPanelFrame:SetSizeY( screenY );
	if( OptionsManager.GetSmallUIAssets() ) then
    	Controls.ScrollPanel:SetSizeY( screenY - 244 );
	else
    	Controls.ScrollPanel:SetSizeY( screenY - 300 );
	end

	Controls.ButtonStack:CalculateSize();
	Controls.ButtonStack:ReprocessAnchoring();
    Controls.ScrollPanel:CalculateInternalSize();
	
end
Events.SerialEventGameDataDirty.Add( OnTechPanelUpdated );


----------------------------------------------------------------        
-- Add a button based on the tech info
----------------------------------------------------------------
      
function AddTechButton( tech, turnsLeft, iDiscover)

	local thisTechButtonInstance = g_TechInstanceManager:GetInstance();
	thisTechButtonInstance.TechButton:SetVoid1( tech.ID ); -- indicates type
	thisTechButtonInstance.TechButton:SetVoid2( iDiscover );
	thisTechButtonInstance.TechButton:RegisterCallback( Mouse.eLClick, TechSelected );
	techPediaSearchStrings[tostring(thisTechButtonInstance.TechButton)] = Locale.ConvertTextKey(tech.Description);
	thisTechButtonInstance.TechButton:RegisterCallback( Mouse.eRClick, GetTechPedia );
	
	local techName = Locale.ConvertTextKey( tech.Description );
	techName = Locale.TruncateString(techName, 20, true);
	thisTechButtonInstance.CurrentlyResearchingTechName:SetText( techName );
	thisTechButtonInstance.AvailableTechName:SetText( techName );
	thisTechButtonInstance.FreeTechName:SetText( techName );

  	local researchTurnsLeft = player:GetResearchTurnsLeft( tech.ID, true );
 	local turnText = tostring( researchTurnsLeft ).." "..turnsString;

	if player:GetCurrentResearch() == tech.ID then -- the player is currently researching this one
 		thisTechButtonInstance.Available:SetHide( true );
		-- deal with free tech
		if iDiscover > 0 then
 			thisTechButtonInstance.CurrentlyResearching:SetHide( true );
  			thisTechButtonInstance.FreeTech:SetHide( false );
			-- update number of turns to research
 			if 	player:GetScience() > 0 then
  				thisTechButtonInstance.FreeTurns:SetText( turnText );
  				thisTechButtonInstance.FreeTurns:SetHide( false );
  			else
  				thisTechButtonInstance.FreeTurns:SetHide( true );
  			end
			thisTechButtonInstance.TechQueueLabel:SetText( freeString );
 			thisTechButtonInstance.TechQueue:SetHide( false );
		else
 			thisTechButtonInstance.CurrentlyResearching:SetHide( false );
  			thisTechButtonInstance.FreeTech:SetHide( true );
			-- update number of turns to research
 			if 	player:GetScience() > 0 then
  				thisTechButtonInstance.CurrentlyResearchingTurns:SetText( turnText );
  				thisTechButtonInstance.CurrentlyResearchingTurns:SetHide( false );
  			else
  				thisTechButtonInstance.CurrentlyResearchingTurns:SetHide( true );
  			end
 			thisTechButtonInstance.TechQueue:SetHide( true );
 		end
 		-- turn on the meter
		local teamTechs = activeTeam:GetTeamTechs();
		local researchProgressPercent = 0;
		local researchProgressPlusThisTurnPercent = 0;
		local researchTurnsLeft = player:GetResearchTurnsLeft(techID, true);
		local currentResearchProgress = teamTechs:GetResearchProgress(techID);
		local researchNeeded = teamTechs:GetResearchCost(techID);
		local researchPerTurn = player:GetScience();
		local currentResearchPlusThisTurn = currentResearchProgress + researchPerTurn;		
		researchProgressPercent = currentResearchProgress / researchNeeded;
		researchProgressPlusThisTurnPercent = currentResearchPlusThisTurn / researchNeeded;		
		if (researchProgressPlusThisTurnPercent > 1) then
			researchProgressPlusThisTurnPercent = 1
		end
 		thisTechButtonInstance.ProgressMeter:SetHide( false );
 		thisTechButtonInstance.ProgressMeterInternal:SetPercents( researchProgressPercent, researchProgressPlusThisTurnPercent );
 	elseif player:CanResearch( tech.ID ) then -- the player research this one right now if he wants
 		thisTechButtonInstance.CurrentlyResearching:SetHide( true );
 		-- deal with free tech
		if iDiscover > 0 then
 			thisTechButtonInstance.Available:SetHide( true );
  			thisTechButtonInstance.FreeTech:SetHide( false );
			-- update number of turns to research
 			if 	player:GetScience() > 0 then
  				thisTechButtonInstance.FreeTurns:SetText( turnText );
  				thisTechButtonInstance.FreeTurns:SetHide( false );
  			else
  				thisTechButtonInstance.FreeTurns:SetHide( true );
  			end
			-- update queue number
			thisTechButtonInstance.TechQueueLabel:SetText( freeString );
 			thisTechButtonInstance.TechQueue:SetHide( false );
		else
 			thisTechButtonInstance.Available:SetHide( false );
  			thisTechButtonInstance.FreeTech:SetHide( true );
			-- update number of turns to research
 			if 	player:GetScience() > 0 then
  				thisTechButtonInstance.AvailableTurns:SetText( turnText );
  				thisTechButtonInstance.AvailableTurns:SetHide( false );
  			else
  				thisTechButtonInstance.AvailableTurns:SetHide( true );
  			end
			-- update queue number if needed
			local queuePosition = player:GetQueuePosition( tech.ID );
			if queuePosition == -1 then
				thisTechButtonInstance.TechQueue:SetHide( true );
			else
				thisTechButtonInstance.TechQueueLabel:SetText( tostring( queuePosition-1 ) );
				thisTechButtonInstance.TechQueue:SetHide( false );
			end
		end
		-- turn off the meter
 		thisTechButtonInstance.ProgressMeter:SetHide( true );
 		-- update advisor icon if needed
	end
	
	local bShowProgress = true;
	thisTechButtonInstance.TechButton:SetToolTipString( GetHelpTextForTech(tech.ID, bShowProgress) );
		
	-- update the picture
	if IconHookup( tech.PortraitIndex, 64, tech.IconAtlas, thisTechButtonInstance.TechPortrait ) then
		thisTechButtonInstance.TechPortrait:SetHide( false );
	else
		thisTechButtonInstance.TechPortrait:SetHide( true );
	end

	for iAdvisorLoop = 0, AdvisorTypes.NUM_ADVISOR_TYPES - 1, 1 do
		local pControl = nil;
		if (iAdvisorLoop == AdvisorTypes.ADVISOR_ECONOMIC) then			
			pControl = thisTechButtonInstance.EconomicRecommendation;
		elseif (iAdvisorLoop == AdvisorTypes.ADVISOR_MILITARY) then
			pControl = thisTechButtonInstance.MilitaryRecommendation;			
		elseif (iAdvisorLoop == AdvisorTypes.ADVISOR_SCIENCE) then
			pControl = thisTechButtonInstance.ScienceRecommendation;
		elseif (iAdvisorLoop == AdvisorTypes.ADVISOR_FOREIGN) then
			pControl = thisTechButtonInstance.ForeignRecommendation;
		end
	
		if (pControl) then
			pControl:SetHide(not Game.IsTechRecommended(tech.ID, iAdvisorLoop));
		end
    end
	thisTechButtonInstance.AdvisorStack:CalculateSize();
	thisTechButtonInstance.AdvisorStack:ReprocessAnchoring();

	-- add the small pictures and their tooltips
	AddSmallButtonsToTechButton( thisTechButtonInstance, tech, maxSmallButtons, 45 );
	AddCallbackToSmallButtons( thisTechButtonInstance, maxSmallButtons, tech.ID, iDiscover, Mouse.eLClick, TechSelected );

end


----------------------------------------------------------------        
-- Key Down Processing
----------------------------------------------------------------        
function InputHandler( uiMsg, wParam, lParam )
	if uiMsg == KeyEvents.KeyDown then
		if wParam == Keys.VK_ESCAPE then --or wParam == Keys.VK_RETURN then
			ClosePopup();
			return true;
		end
	end
end
ContextPtr:SetInputHandler( InputHandler );

----------------------------------------------------------------
-- 'Active' (local human) player has changed
----------------------------------------------------------------
function OnTechPanelActivePlayerChanged( iActivePlayer, iPrevActivePlayer )
	playerID = Game.GetActivePlayer();	
	player = Players[playerID];
	civType = GameInfo.Civilizations[player:GetCivilizationType()].Type;
	activeTeamID = Game.GetActiveTeam();
	activeTeam = Teams[activeTeamID];

	GatherInfoAboutUniqueStuff( civType );
	for tech in GameInfo.Technologies() do
		if activeTeam:GetTeamTechs():HasTech(tech.ID) then
			mostRecentTech = tech.ID;
		end
	end
	
	OnTechPanelUpdated();

	if (not ContextPtr:IsHidden()) then
		ClosePopup();
	end
end
Events.GameplaySetActivePlayer.Add(OnTechPanelActivePlayerChanged);
	
----------------------------------------------------------------        
-- one time initialization stuff goes here
GatherInfoAboutUniqueStuff( civType );
for tech in GameInfo.Technologies() do
	if activeTeam:GetTeamTechs():HasTech(tech.ID) then
		mostRecentTech = tech.ID;
	end
end

