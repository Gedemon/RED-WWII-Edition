-- UnitFlagManager_addin
-- Author: Erendir
-- DateCreated: 1/23/2011 12:37:36 AM
--------------------------------------------------------------
local _VERBOSE = false
local print
if not _VERBOSE then print = function() end end

print"UnitFlagManager_addin.lua"

-- Mod globals
include("ModUserData")
local ModID				= ModID --"44311931-9c7a-4f55-b465-7dc8d814e24d";
local ModVersion		= ModVersion --Modding.GetActivatedModVersion(modID) or 1;
local ModUserData		= ModUserData --Modding.OpenUserData(modID, modVersion);
local ignorePromotion	= assert(ignorePromotion, 'ModUserData.lua is not properly loaded')
local OFFSET_NORMAL		= Vector2(0,-28)
local OFFSET_STACK_1	= Vector2(0,0)
local OFFSET_STACK_2	= Vector2(0,-12)

--[[do -- strange way to load new context, because i don't want to "import into VFS" the OptionsScreen.lua
	local modFile = Modding.GetEvaluatedFilePath(ModID, ModVersion, "Flag Promotions/OptionsScreen.lua");
	local modPath = modFile.EvaluatedPath;
	-- Get the absolute path and filename without extension.
	local extension = Path.GetExtension(modPath);
	local path = string.sub(modPath, 1, #modPath - #extension);
	ContextPtr:LoadNewContext(path)
end--]]

-- Imported globals
local g_MasterList = g_MasterList
local g_UnitFlagClass = g_UnitFlagClass
-- g_GarrisonedUnitFlagsInStrategicView -- boolean

-- Shared locals
local bHideAllUnitIcons = false--Controls.HideUnitIcon:IsChecked();	--@?:  is it possible to set bHideAllUnitIcons to HideUnitIcon state, not hardcoded `true` ?
local bDisplayAllFlagPromotions = true;

-- Toggle Unit Flags by Kael
-- Added by Kael 07/17/2010 to disable the Unit Icon
-- Modified by Erendir
-- Modified by Thalassicus
LuaEvents.ToggleHideUnitIcon.Add(
	function()
		bHideAllUnitIcons = not bHideAllUnitIcons	-- Modified by Erendir
	end)
	
g_UnitFlagClass.UpdateVisibility = function ( self )
	self.m_IsUnitIconDisplayed = self.m_IsCurrentlyVisible and not self.m_IsInvisible;
    self.m_Instance.Anchor:SetHide(not self.m_IsUnitIconDisplayed);
	if InStrategicView() then
		self.m_IsUnitIconDisplayed = self.m_IsUnitIconDisplayed and g_GarrisonedUnitFlagsInStrategicView and self.m_IsGarrisoned
	else
		self.m_IsUnitIconDisplayed = self.m_IsUnitIconDisplayed and (self.m_IsGarrisoned or not bHideAllUnitIcons)
		if self.m_Escort then
			self.m_Escort.m_Instance.Anchor:SetHide(not self.m_IsUnitIconDisplayed);
		end
	end
    --self.m_Instance.Anchor:SetHide(not self.m_IsUnitIconDisplayed);
    self.m_Instance.FlagShadow:SetHide(not self.m_IsUnitIconDisplayed);
	if (not bDisplayAllFlagPromotions) and (self.m_DisplayedPromotions[1] ~= nil) then
		self:SetHideAllPromotions(true)
	end
	self:UpdatePromotions()
	self:UpdatePromotionsOffset()
end


g_UnitFlagClass.IsFlagDisplayed = function( self )
	return self.m_IsUnitIconDisplayed;
end

--------------------------------
-- FlagPromotions v.2 by Erendir
--------------------------------
do 
--[[
The code looks ugly (and it's worth rewriting), but it's quite a lot optimized, to do the needed minimum only, and
it's very very modular: look at at diff UnitFlagManager.lua origUnitFileManager
One big problem is: what is the good way to catch OnPromotionChange? (Look at OnPossiblePromotionChange)
]]
-- Options
local iPromotionsStackMax = 9; -- how many promotions are allowed?

-- Used Vars
--local bDisplayAllFlagPromotions = true;

-- generate helper table, garbage collected just after few lines (hopefully)
local unitPromotions, PromotionIDfromType = {}, {}
local PromotionIDlist = {} -- make it global for use in Options window
for P in GameInfo.UnitPromotions() do
	unitPromotions[#unitPromotions+1] = {Type=P.Type, ID = P.ID}
	PromotionIDfromType[P.Type]=P.ID -- map types to IDs
	PromotionIDlist[P.ID]=true
end

--- build list of promotions with levels:
local isPromotionwithlevels = {}
for _,P in pairs(unitPromotions) do
	local ty = P.Type
	local name, suffix = string.match(ty,'(.+)_([^_]+)$')
	--@tothink: looks like the promotions with roman numbers are truly different, and not just stages of one
	if not string.find(suffix,'%D') --[[or not string.find(suffix,'[^IVX]')]] then -- i.e. suffix is a number or small roman number
		local id = P.ID
		suffix = tonumber(suffix)-- or Rnumber_to_number[suffix]
		isPromotionwithlevels[id]={Pclass=name, suffix=suffix} -- map id's to Promotion class and place in that class
	
		local t = isPromotionwithlevels[name] or {}
		t[suffix]=id  -- add id to the class list (referenced by number)
		isPromotionwithlevels[name] = t
	end
end

--[[ Modified by Xienwolf 10/10/2010, heavily modified by Erendir 23.01.2011 ]]
--[[ Displays the Promotions a unit possesses below his Unit Icon ]]
--[[ Currently a hardcoded 9 promotions are available, need to figure out a variable expression for the XML container to allow adjustable rows/columns ]]
--[[ Currently the promotions will not re-locate themselves along with the unit icon (when in a city for example), this would be an improvement worth adding ]]
--[[ If you hide the Unit Icon, it will hide the promotion displays as well. ]]

--[[ There're 2 hardcoded IconStacks now, one below another. ]]
------------------------------------------------------------------
------------------------------------------------------------------
g_UnitFlagClass.UpdatePromotions = function( self, promotionType )
	local unit = Players[ self.m_PlayerID ]:GetUnitByID( self.m_UnitID );
	if not (unit and bDisplayAllFlagPromotions and self.m_DisplayedPromotions) then
		return
	end
	
	print("UpdatePromotions "..GameInfo.Units[unit:GetUnitType()].Type.." "..(promotionType and promotionType or " "))
	
	local self_m_Instance 	= self.m_Instance	
	local displayed 		= self.m_DisplayedPromotions or {}
	local oldNdisplayed	 	= #displayed
	local _I				= 1
	local _MAX				= iPromotionsStackMax
	local best_id			= {}
	local checked			= {}
	for unitPromotion in GameInfo.UnitPromotions() do
		local unitPromotionID = unitPromotion.ID;
		if not (ignorePromotion[unitPromotionID] or checked[unitPromotionID]) then
			local showPromotion = true
			if not best_id[unitPromotionID] then
				--print("  Check         :: "..unitPromotion.Type)
				-- handle promotions with levels
				local Plvl = isPromotionwithlevels[unitPromotionID]
				if Plvl then -- is it one of them?
					--print("        Leveled :: "..unitPromotion.Type)
					local t_Pclass = isPromotionwithlevels[ Plvl.Pclass ] -- get the whole list
					-- find best promo
					local i = #t_Pclass
					local id = t_Pclass[i]
					while id and not (unit:IsHasPromotion(id) or (promotionType and id == GameInfo.UnitPromotions[promotionType].ID)) do
						checked[id]=true
						i=i-1
						id = t_Pclass[i]
					end
					if id then best_id[id]=i;end
					showPromotion = (id==unitPromotionID)
					
					-- mark lower promotions also as checked
					i=i-1; id = t_Pclass[i] -- skip current, best one
					while id do checked[id]=true; i=i-1; id = t_Pclass[i] end -- mark
				else
					--print("            Not :: "..unitPromotion.Type)
					showPromotion = unit:IsHasPromotion(unitPromotionID) or (promotionType and unitPromotionID == GameInfo.UnitPromotions[promotionType].ID)
				end
			end
			if showPromotion then
				if displayed[_I]~=unitPromotionID then
					print("self_m_Instance['Promotion'..".._I.."]:SetHide( false ) :: IconAtlas="..unitPromotion.IconAtlas.."  PortraitIndex="..unitPromotion.PortraitIndex)
					displayed[_I]=unitPromotionID
					local imageControl=self_m_Instance['Promotion'.._I]
					imageControl:SetHide( false );
					IconHookup( unitPromotion.PortraitIndex, 16, unitPromotion.IconAtlas, imageControl );
				
					-- Tooltip
					local L = Locale.ConvertTextKey
					local strToolTip = L(unitPromotion.Description)
					if unitPromotion.Help~=unitPromotion.Description then
						local strHelp = L(unitPromotion.Help)
						-- if strHelp~=strToolTip then
							strToolTip = '[COLOR_YELLOW]'..strToolTip..'[ENDCOLOR]'..'[NEWLINE]'..strHelp
						-- end
					end
					local best_pos = best_id[unitPromotionID]
					if best_pos and best_pos>1 then
						local t_Pclass = isPromotionwithlevels[ isPromotionwithlevels[unitPromotionID].Pclass ]
						-- local i = #t_Pclass
						-- local id = t_Pclass[i]
						-- while id and not (unit:IsHasPromotion(id) or (promotionType and unit:IsHasPromotion(GameInfo.UnitPromotions[promotionType].ID))) do checked[id]=true; i=i-1; id = t_Pclass[i] end
					
						local ids = tostring(t_Pclass[1])
						for i = 2,best_pos-1 do ids=ids..','..t_Pclass[i] end
							-- strToolTip = strToolTip..'[COLOR_YELLOW]'..i..'[ENDCOLOR]'..'[NEWLINE]'
						ids = '('..ids..')'
						local sql = string.format("select Description, Help from UnitPromotions where ID in "..ids);
						for res in DB.Query(sql) do
							strToolTip = strToolTip..'[NEWLINE][COLOR_YELLOW]'..L(res.Description)..'[ENDCOLOR]'..'[NEWLINE]'..L(res.Help)
						end
					end
					imageControl:SetToolTipString(strToolTip);
				end
				
				_I=_I+1
				if _I>_MAX then
					break -- stop the for cycle
				end
			end
		end
	end --for
	
	for i = _I, oldNdisplayed do
		displayed[i] = nil
		self_m_Instance['Promotion'..i]:SetHide( true );
		print("self_m_Instance['Promotion'.."..i.."]:SetHide( true );")
	end
	
	self_m_Instance.EarnedPromotionStack1:CalculateSize();
	self_m_Instance.EarnedPromotionStack1:ReprocessAnchoring();
	
	self_m_Instance.EarnedPromotionStack2:CalculateSize();
	self_m_Instance.EarnedPromotionStack2:ReprocessAnchoring();
end
--[[End Modify]]

g_UnitFlagClass.SetHideAllPromotions = function (self, isHidden)
	for i = 1, iPromotionsStackMax do
		self.m_Instance['Promotion'..i]:SetHide(isHidden)
	end
	if isHidden then
		self.m_DisplayedPromotions = {}
	end
end

local OldInitialize = g_UnitFlagClass.Initialize

g_UnitFlagClass.Initialize = function( o, playerID, unitID, fogState, invisible )
	print( "INIT")	
	OldInitialize( o, playerID, unitID, fogState, invisible )
	
	o.m_IsUnitIconDisplayed = true;
	o.m_DisplayedPromotions = {} -- will store the list of displayed promotions
	--for i = 1, iPromotionsStackMax do
	--	o.m_DisplayedPromotions[i] = "init"
	--end
	--o:UpdatePromotions()
end


local OldUpdateFlagOffset = g_UnitFlagClass.UpdateFlagOffset

g_UnitFlagClass.UpdateFlagOffset = function( self )
	OldUpdateFlagOffset(self)
	self:UpdatePromotionsOffset(self)
end

g_UnitFlagClass.UpdatePromotionsOffset = function( self )
	local pUnit = Players[ self.m_PlayerID ]:GetUnitByID( self.m_UnitID );
	if pUnit == nil then
		return;
	end	
	
	local plot = pUnit:GetPlot();
	
	if plot == nil then
		return;
	end
	
	local offset = Vector2( 0, 0 );
	
	if pUnit:IsGarrisoned() then
		if( Game.GetActiveTeam() == Players[ self.m_PlayerID ]:GetTeam() ) then
			offset = GarrisonOffset;
		else
			offset = GarrisonOtherOffset;
		end 
	elseif plot:IsCity() then
		offset = CityNonGarrisonOffset;
	end
	
	
	if( self.m_CarrierFlag ~= nil ) then
		offset = VecAdd( offset, CivilianOffset );
		
	-- if we're a civilian and there's someone else with us 
	--[[           
	elseif( self.m_IsCivilian and self.m_Escort ~= nil ) then
		if( not self.m_Escort.m_IsCivilian or -- if they are also a civilian try to only offset one of us
			self.m_UnitID < self.m_Escort.m_UnitID ) then
			offset = VecAdd( offset, CivilianOffset );
		end
	end
	--]]
    elseif( self.m_Escort ~= nil ) then
        if( self.m_UnitID < self.m_Escort.m_UnitID ) then
            offset = VecAdd( offset, CivilianOffset );
        end
    end

	if self.m_IsUnitIconDisplayed and not InStrategicView() then
		offset = VecAdd( offset, OFFSET_NORMAL)
	end
	
	-- set the ui offset
	self.m_Instance.EarnedPromotionStack1:SetOffset( VecAdd(offset, OFFSET_STACK_1) );
	self.m_Instance.EarnedPromotionStack2:SetOffset( VecAdd(offset, OFFSET_STACK_2) );
end



-- Independent Events
--[[ for debugging:
LuaEvents.ToggleDisplayFlagPromotions.RemoveAll()
if OnPossiblePromotionChange then LuaEvents.PossiblePromotionChange.Remove(OnPossiblePromotionChange) end
--end debugging]]

Game.ActiveUnitFlagNewPromotion = function(promotionType)
	--print("ActiveUnitFlagNewPromotion :"..(promotionType and promotionType or "none"))
	local unit = UI.GetHeadSelectedUnit();
	if not unit then return; end
	local unitID = unit:GetID() or -1;
	
	local playerID = Game.GetActivePlayer();
	local player = Players[ playerID ]
	if not player or not player:IsAlive() or unit:IsDead() then return; end
	
	local flag = g_MasterList[ playerID ][ unitID ];
	if flag then
		flag:UpdatePromotions(promotionType);
	else
		print( string.format( "Flag not found for ActiveUnitFlagNewPromotion: Player[%i] Unit[%i]", playerID, unitID ) );
	end
end
--Events.SerialEventUnitInfoDirty.Add(OnPossiblePromotionChange);
	
function RefreshUnitFlagPromotionsGlobally()
	for playerID,unitList in pairs(g_MasterList) do
		for unitID,flag in pairs(unitList) do
			if flag and flag:IsFlagDisplayed() then
				flag:UpdateVisibility()
			end
		end
	end
end

Events.ActivePlayerTurnStart.Add( RefreshUnitFlagPromotionsGlobally );

LuaEvents.ToggleDisplayFlagPromotions.Add(
	function(bIsChecked)
		bDisplayAllFlagPromotions = bIsChecked;
		RefreshUnitFlagPromotionsGlobally();
	end)

LuaEvents.UpdateIgnoredFlagPromotions.Add( 
	function()
		print('OnUpdateIgnoredFlagPromotions',bDisplayAllFlagPromotions)
		updateIgnoredPromotions()
		RefreshUnitFlagPromotionsGlobally()
	end)
end

---------------------------------------
-- End FlagPromotions v.2 by Erendir
---------------------------------------
