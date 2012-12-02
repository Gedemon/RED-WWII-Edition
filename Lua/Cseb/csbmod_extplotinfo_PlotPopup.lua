--
-- Replace the logic in PlotHelpManager.lua with our own code. Since this is heavily modified, it was best to just override the whole file
-- Author: csebal (based on the original lua files from CIV5)
--
-- Description:
-- The info box will give information in multiple stages:
-- stage 1: Basic information - Terrain / Feature, Owner, Resource 
-- stage 2: Additional information - Improvement, Yield, Resource yield preview (unless it is already improved)
-- stage 3: Even more information - Preview of absolute tile yields with all the applicable improvements built on it, along with the difference to the current yield.
--

include( "csbmod_extplotinfo_Common" );

local m_fTime = 0; -- accumulated time the mouse spent over the plot without movement
local m_bVisible = false;
local m_bFirstUpdate = true; -- some house keeping for the first time the popup gets updated

local m_pPlotHelpText; -- the popup help text box
local m_bAltPressed; -- stores the state of the alt key for update purposes

local tipControls = {}; -- the actual tooptip control - i think.
TTManager:GetTypeControlTable( "HexDetails", tipControls );

local m_iCurrentX = -1; -- current coordinates
local m_iCurrentY = -1; -- current coordinates

-------------------------------------------------
-- Hide the popup, when the mouse is moved
-------------------------------------------------
function ProcessInput( uiMsg, wParam, lParam )
    if( uiMsg == MouseEvents.MouseMove ) then
        x, y = UIManager:GetMouseDelta();
        if( x ~= 0 or y ~= 0 ) then 
			Reset();
        end
    end
end
ContextPtr:SetInputHandler( ProcessInput );

-------------------------------------------------
-- Hide the popup, when we switch between 
-- strategic and map view
-------------------------------------------------
function OnStrategicViewStateChanged( )
    Reset();
end
Events.StrategicViewStateChanged.Add(OnStrategicViewStateChanged);

-------------------------------------------------
-- Hide the popup when the camera view is 
-- changed.
-------------------------------------------------
function OnCameraViewChanged()
	Reset();
end
Events.CameraViewChanged.Add( OnCameraViewChanged );

-------------------------------------------------
-- Hide the popup
-------------------------------------------------
function Reset()
	m_fTime = 0;
	if( m_bVisible ) then
		Controls.TheBox:SetToolTipType();
		m_bVisible = false;
	end
end

-------------------------------------------------
-- Update the coordinates of the plot we are
-- looking at
-------------------------------------------------
function DoUpdateXY( hexX, hexY )
	
	local plot = Map.GetPlot( hexX, hexY );
	
	if (plot ~= nil) then
		m_iCurrentX = hexX;
		m_iCurrentY = hexY;
	end
	
end
Events.SerialEventMouseOverHex.Add( DoUpdateXY );

-------------------------------------------------
-- some house keeping, i guess this enables /
-- disables the mouse over logic depending
-- on whether the mouse is inside or our outside
-- the game's window.
-------------------------------------------------
Controls.TheBox:RegisterCallback( Mouse.eMouseEnter, function() Events.WorldMouseOver( true  ); end );
Controls.TheBox:RegisterCallback( Mouse.eMouseExit,  function() Events.WorldMouseOver( false ); end );

-------------------------------------------------
-- Update to run periodically, to check for
-- elapsed time so we can display information
-- fDTime: the time elapsed since the last update
-------------------------------------------------
function OnUpdate( fDTime )

    if( m_bFirstUpdate ) then    
        m_pPlotHelpText = ContextPtr:LookUpControl( "/InGame/WorldView/PlotHelpText" );
        m_bFirstUpdate = false;
        return;
    end
    
    m_fTime = m_fTime + fDTime;
	--local bShift = UIManager:GetShift();
	local bAlt = UIManager:GetAlt();
	--local bCtrl = UIManager:GetControl();	

    if( m_fTime > (OptionsManager.GetTooltip1Seconds() / 100) and (not m_bVisible or bAlt ~= m_bAltPressed)) then
		m_bAltPressed = bAlt;
		OnMouseOverHex(m_iCurrentX, m_iCurrentY, bAlt);
		m_bVisible = true;
    end
		    
end
ContextPtr:SetUpdate( OnUpdate );

-------------------------------------------------
-- Called when the mouse enters a new plot
-------------------------------------------------
function OnMouseOverHex( hexX, hexY, bExpanded )
	local TextString = ""; -- used to store the help text
	local pPlot = Map.GetPlot( hexX, hexY ); -- find the pPlot we are looking at
	local iActiveTeam = Game.GetActiveTeam(); -- get the active team

	if (pPlot and pPlot:IsRevealed(iActiveTeam, false)) then -- if the pPlot is valid and visible to the active team

		-- Display unit military information
		if (pPlot:IsVisible(iActiveTeam, false)) then
			local strUnitsText = GetUnitsString(pPlot);			
			if (strUnitsText ~= "") then
				TextString = TextString .. strUnitsText;
			end
		end

		-- Display City/plot owner information
		local strOwner = GetOwnerString(pPlot);
		if (strOwner ~= "") then
			if (TextString ~= "") then
				TextString = TextString .. "[NEWLINE]";
			end
			TextString = TextString .. strOwner;
		end	

		-- Get terrain / feature information
		local natureStr = GetNatureString(pPlot);
		if (natureStr ~= "") then
			if (TextString ~= "") then
				TextString = TextString .. "[NEWLINE]";
			end
			TextString = TextString .. "[COLOR_POSITIVE_TEXT]" .. Locale.ConvertTextKey("TXT_KEY_PEDIA_TERRAIN_LABEL") .. "[ENDCOLOR]" ..  " : " .. natureStr;
		end	

		-- Get plot defense modifiers
		local defStr = GetPlotDefenseString(pPlot);
		if (defStr ~= "") then
			if (TextString ~= "") then
				TextString = TextString .. "[NEWLINE]";
			end
			TextString = TextString .. defStr;
		end	

		-- Get improvement information
		local strImprovement = GetImprovementString(pPlot);
		if (strImprovement ~= "") then
			if (TextString ~= "") then
				TextString = TextString .. "[NEWLINE]";
			end
			TextString = TextString .. "[COLOR_POSITIVE_TEXT]" .. Locale.ConvertTextKey("TXT_KEY_IMPROVEMENT") .. "[ENDCOLOR]" .. " : " .. strImprovement;
		end
		
		-- Resource
		local strResourceAndImprovement = GetResourceString(pPlot, true);
		if (strResourceAndImprovement ~= "") then
			if (TextString ~= "") then
				TextString = TextString .. "[NEWLINE]";
			end
			TextString = TextString .. "[COLOR_POSITIVE_TEXT]" .. Locale.ConvertTextKey("TXT_KEY_RESOURCE") .. "[ENDCOLOR]" .. " : " .. strResourceAndImprovement;
		end
		
		-- Get quest information (tasks given by minor civs)
		local strQuest = GetCivStateQuestString(pPlot, true);
		if (strQuest ~= "") then
			if (TextString ~= "") then
				TextString = TextString .. "[NEWLINE]";
			end
			TextString = TextString .. strQuest;
		end

		-- not needed by Rules of Engagement
		-- Display Yield Information
		--local strYield = GetYieldLines(pPlot, bExpanded);
		--if (strYield ~= "") then
		--	if (TextString ~= "") then
		--		TextString = TextString .. "[NEWLINE]";
		--	end
		--	TextString = TextString .. strYield;
		--end
	end
	
    if( TextString ~= "" ) then	
        tipControls.Text:SetText( TextString );
        tipControls.Grid:DoAutoSize();
        Controls.TheBox:SetToolTipType( "HexDetails" );
    else
        Controls.TheBox:SetToolTipType();
    end
end