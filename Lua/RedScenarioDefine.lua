-- Lua RedScenarioInclude
-- Author: Gedemon
-- DateCreated: 7/18/2011 10:21:52 PM
--------------------------------------------------------------

-------------------------------------------------------------------------------------------------------
-- R.E.D. WW II edition Scenario-specific Defines
-------------------------------------------------------------------------------------------------------

include ("Defines" .. g_Scenario_Name)

--[[
-- Europe 1940
if (g_bEuro1940) then
	 -- beware of the VFS include bug if string contains another file name. 
	 -- can't use "RedEuro1940Defines" because "RedEuro1940" is already used...
	include ("DefinesEuro1940")
end

-- Earth 1942
if (g_bEarth1942) then
	include ("DefinesEarth1942")
end

-- America+Europe 1936
if (g_bAmericaEuro1936) then
	include ("DefinesAmericaEuro1936")
end
--]]
-------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------