-- ModUserData
-- Author: Erendir
-- DateCreated: 1/23/2011 12:36:56 PM
--------------------------------------------------------------
local _VERBOSE = false
local print
if not _VERBOSE then print = function() end end

ModID		= "580c14eb-9799-4d31-8b14-c2a78931de89";
ModVersion	= Modding.GetActivatedModVersion(ModID);
ModUserData = Modding.OpenUserData(ModID, ModVersion);

default_ignoredPromotion = {}
for promotionType in GameInfo.UnitPromotions() do
	if promotionType.PediaType == "PEDIA_ATTRIBUTES" or promotionType.PediaType == "PEDIA_SHARED" then
		default_ignoredPromotion[promotionType.Type] = true
	end
end
default_ignoredPromotion["PROMOTION_JAGUAR"] 							= false --jaguar
default_ignoredPromotion["PROMOTION_PARTIAL_HEAL_IF_DESTROY_ENEMY"] 	= false --jaguar
default_ignoredPromotion["PROMOTION_FASTER_HEAL"] 						= false --immortal
default_ignoredPromotion["PROMOTION_MOHAWK"] 							= false --mohawk
default_ignoredPromotion["PROMOTION_SPAWN_GENERALS_I"] 					= false --companion cavalry
default_ignoredPromotion["PROMOTION_ANTI_MOUNTED_I"] 					= false --siamese elephant
default_ignoredPromotion["PROMOTION_CITY_ASSAULT"] 						= false --songhai cavalry
default_ignoredPromotion["PROMOTION_SECOND_ATTACK"] 					= false --chu-ko-nu
default_ignoredPromotion["PROMOTION_SPAWN_GENERALS_II"] 				= false --samurai
default_ignoredPromotion["PROMOTION_IGNORE_TERRAIN_COST"] 				= false --minuteman
default_ignoredPromotion["PROMOTION_HEAL_IF_DESTROY_ENEMY"] 			= false --janissary
default_ignoredPromotion["PROMOTION_FREE_PILLAGE_MOVES"] 				= false --sipahi
default_ignoredPromotion["PROMOTION_EXTRA_SIGHT_I"] 					= false --sipahi
default_ignoredPromotion["PROMOTION_STRONGER_VS_DAMAGED"] 				= false --cossak
default_ignoredPromotion["PROMOTION_FOREIGN_LANDS"] 					= true --foreign legion
default_ignoredPromotion["PROMOTION_ANTI_FIGHTER"] 						= false --zero
default_ignoredPromotion["PROMOTION_EXTRA_SIGHT_I"] 					= false --ship of the line
default_ignoredPromotion["PROMOTION_IGNORE_TERRAIN_COST"] 				= true --scout
default_ignoredPromotion["PROMOTION_GAIN_EXPERIENCE"] 					= false --keshik
	
ignorePromotion = {}

function updateIgnoredPromotions(resetToDefaults)
	print'updateIgnoredPromotions'
    -- get list of ignored promotion from ModUserData
    for promotion in GameInfo.UnitPromotions() do
		local id = promotion.ID
        local ignore = ModUserData.GetValue(id)
        if ignore == nil or resetToDefaults then
			ignore = default_ignoredPromotion[promotion.Type];
			ModUserData.SetValue(id, ignore and 0 or 1)
        else
			ignore = (ignore == 0) and true or false
        end
        ignorePromotion[id]=ignore
		--if ignore~=nil then print(string.format('ignorePromotion[%d]=%s', id, tostring(ignore))) end
    end
end
--updateIgnoredPromotions (false)
updateIgnoredPromotions (true) -- resets to defaults