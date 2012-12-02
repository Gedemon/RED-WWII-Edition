--[[
	FlagPromotionsOptions.lua
	Author: Erendir
	Credits: alpaca
	
	Description: Creates a window for FlagPromotions options.
]]--
local _VERBOSE = false
local print
if not _VERBOSE then print = function() end end

print'FlagPromotionsOptions.lua'

-- global mod vars
include'ModUserData'
local ModUserData = ModUserData

-- how do the window popup?
LuaEvents.ShowFlagPromotionsOptionsScreen.RemoveAll()
LuaEvents.ShowFlagPromotionsOptionsScreen.Add(function()
	UIManager:QueuePopup( ContextPtr, PopupPriority.BarbarianCamp );
end);

-- UI
include( "InstanceManager" );
local InstanceCheckButton = InstanceManager:new("FlagPromotionsOptionsInstance", "RootCheckButton", Controls.CheckTextStack);
local InstanceIcon = InstanceManager:new("FlagPromotionsOptionsIcon", "RootIcon", Controls.IconsStack);

--[[
	Initialises the FlagPromotions settings from user data 
]]--
local bOptionsWindowIsHide
local bFirstTime = true
function InitSettings()
	print('InitSettings')
	bOptionsWindowIsHide = true
end


--[[
	Refresh the window. This loads all FlagPromotions options with their current values and displays them.
]]--
include( "IconSupport" );
local change_ignorePromotion
function RefreshFlagPromotionsOptions()
	print('RefreshFlagPromotionsOptions' )
	
	change_ignorePromotion = change_ignorePromotion or {}
	Controls.MainGrid:SetHide(false)
	--InitSettings()
	InstanceCheckButton:ResetInstances();
	
	local L = Locale.ConvertTextKey

	local sql = "select ID, Description, Help, PortraitIndex, IconAtlas from UnitPromotions"
	for res in DB.Query(sql) do
		local id, txt, hlp = res.ID, L(res.Description), L(res.Help)
		local ignore = ModUserData.GetValue(id)==0
		
		-- checkbutton
		local rootButton = InstanceCheckButton:GetInstance().RootCheckButton
		local textButton = rootButton:GetTextButton();
		-- fetch text
		textButton:SetText( txt );
		rootButton:SetToolTipString( hlp );
		--FlagPromotionsOption.FlagPromotionsOptionRoot:SetDisabled(val);
		rootButton:SetCheck(not ignore);
		rootButton:RegisterCheckHandler( function(bCheck)
			print('CheckHandler', bCheck)
			change_ignorePromotion[id] = not bCheck
		end);
		
		-- icon
		local rootIcon = InstanceIcon:GetInstance().RootIcon
		IconHookup( res.PortraitIndex, 32, res.IconAtlas, rootIcon );
		rootIcon:SetToolTipString(hlp);
		-- 	rootIcon:SetHide(false)
	end
	
	Controls.IconsStack:CalculateSize();
	Controls.IconsStack:ReprocessAnchoring();
	
	Controls.CheckTextStack:CalculateSize();
	Controls.CheckTextStack:ReprocessAnchoring();
	Controls.ScrollPanel1:CalculateInternalSize();--]]
end

function OnCancel()
	print'OnCancel'
	change_ignorePromotion = nil
	UIManager:DequeuePopup( ContextPtr );
end
Controls.CancelButton:RegisterCallback( Mouse.eLClick, OnCancel );

function OnAccept()
	print'OnAccept'
	if change_ignorePromotion then -- any settings were changed?
		-- local ModUserData = OpenUserData()
		local SaveValue = ModUserData.SetValue
		for k,v in pairs(change_ignorePromotion) do
			ignorePromotion[k]=v
			SaveValue(k, v and 0 or 1) -- 0 means ignore
			print('SetValue',k, v and 0 or 1)
		end
		change_ignorePromotion = nil
		LuaEvents.UpdateIgnoredFlagPromotions() -- tell the mod it's updated.
	end
	UIManager:DequeuePopup( ContextPtr );
end
Controls.AcceptButton:RegisterCallback( Mouse.eLClick, OnAccept );

function ShowHideHandler( bIsHide, bIsInit )
	print('ShowHideHandler', bIsHide, bIsInit)
	bOptionsWindowIsHide = bIsHide
	if bIsInit then
		InitSettings()
	elseif bFirstTime and not bIsHide then
		RefreshFlagPromotionsOptions()
		bFirstTime = false
	end
end
ContextPtr:SetShowHideHandler( ShowHideHandler );

-- close window on escape
ContextPtr:SetInputHandler(function(uiMsg, wParam, lParam)
	if bOptionsWindowIsHide then return end
	if uiMsg == KeyEvents.KeyDown then
		if wParam == Keys.VK_ESCAPE then
			OnCancel();
			return true;
		end
	end
end);