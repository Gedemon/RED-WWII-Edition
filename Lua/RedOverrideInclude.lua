-- RedOverrideInclude
-- Author: Gedemon
-- DateCreated: 7/18/2011 10:54:34 PM
--------------------------------------------------------------
-- Include in overriden vanilla files
--------------------------------------------------------------

include ("RedDefinesGlobal")	-- Always first !
include ("RedUtils")			-- Before functions & debug
include ("RedDebug")
include ("RedFunctions")
include ("RedDiplomacy")
include ("RedUnitUtils")
include ("RedUnitFunctions")
include ("RedResources")
include ("RedScenarioDefine")

--------------------------------------------------------------
-- Share global tables after initialization...
--------------------------------------------------------------
Events.LoadScreenClose.Add( ShareGlobalTables )
