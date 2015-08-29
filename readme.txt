R.E.D. WWII edition
for Civilization 5
v.45

	-- Presentation --

Concepts : http://forums.civfanatics.com/showthread.php?t=436077


Installation thread : http://forums.civfanatics.com/showthread.php?t=472345 


Full credits list : http://forums.civfanatics.com/showthread.php?t=484955


	-- version history --

v.45 (xxx x, 2015)

AI (DLL):
- Every nation use same value (5) for all flavors (testing purpose)
- Tweak score target for cities
- Make defensive Bastion and defend improvements only when they are under immediate threat
- Do not count Air units for Dominance zones (testing purpose)
- Air units should rebase out of cities about to be captured
- Fighters and Attack Aircraft should not bombard cities when they will have no effect on the defense and very small effect on improvements around.

Global:
- Add Urzahil's units icons
- Add Urzahil's German translation
- Add civilizations maps from JFD WWII Leader mod
- Add WWII 3D Leaders to authorized mods list
- Add ZiS-3 soviet Field Gun
- Remove all traits description as they are not all activated
- Change the text on mod initialization to explain the "version number" error: either trying to load on a mac, or using an obsolete version
- Update the turn processing text to show that the mod is updating values after the Barbarian turn
- Restore the "return to Main Menu" button (should not crash anymore)

Europe 1939-1945:
- Make improvements and road/rails visible for all nations at game start.
- Tweak initial buildings list in cities
- Remove Strasbourg for France, update Maginot Line position
- Remove some small soviet cities
- Move Munich, add Essen and Leipzig, remove Passau and Magdeburg for Germany
- Change some population values
- Add troops route out of U.K. in case of near complete conquest by Germany AI
- Add Operation Fallgelb for Germany (human and AI), available only if the Maginot Line is on the map.
- Always place the Modlin Fortress in Poland
- Set friend relation between USSR and Palestine/Egypt, to allow spawning of convoy to USSR via Suez
- Add Mannerheim Line for Finland and Oreshek Fortress for USSR
- Allow Operation Seelowe after succeeding in USSR invasion and if France is also invaded (or has fallen)

Balance :
- Update AI operational and tactical defines values
- Lower Mobile AA combat modifier vs Armor (from 100 to 25)
- Add and edit Army Formations from Artificial Unintelligence mod
- Tweak U.K. and Italy Order of Battle
- Tweak "MotherLand Call" military operation flavors and cost
- Change maintenance cost for roads (free) and rails (2 gpt)
- Tweak ratio between number of cities and total population for units supplied
- Barracks (+0.25 unit), Arsenals (+0.5 units) and Military Bases (+1 unit) can raise the total number of units supplied
- Positive (+1 unit per 100 gpt) and negative (-1 unit per -20 gpt) gold income change total number of units supplied
- Tweak the base supplied value for all nations, based on above change
- Difficulty level now affect the total number of unit supplied (for reference, the difference is around 20 units between Prince and Deity)
- Anti-Air artillery ratio can be set for the AI
- Add specific penalties to Air units under fuel restriction
- Add ranged penalty for land units under fuel restriction
- Tweak flavors values for some units
- Reset all UNIT_AI types for consistency

Bug fix:
- BM13-16 project reference is the BM-13 Katyusha, not the T-34...
- Set upgrade path for Katyusha and Sturmovik
- Add forgotten mobile artillery projects to Germany
- Fix Field Gun size
- Allow Greece to trigger allied victory
- Give French territory to correct player when the AI conquer Paris
- On Military operation, launch Paratroopers from a city and check that it's a friendly city (ie not captured)
- Remove Joffre project
- A bad reference to "close city" could make the map update fail and the following foced diplomatie was not called
- Sometime the mod was trying to upgrade an unit without reference (and failed, loosing any upgrade possibility for that turn)
- Tactical moves priorities should be correctly set from the config file (NewRules.sql) now

Crash fix:
- Prevent a crash that could occur on some computers when changing the number of resistance turns after capturing a city
- Prevent a crash that could occur on some computers when a defending unit is destroyed after capturing the last city of a civilization
- Fix rocket artillery graphical initialization that was causing random crashes when firing at large figures units (like infantry)
- Removed a file from the VFS that was causing a crash when going back to main menu


v.44 (June 7, 2015)

DLL :
make extra-sure to reveal territory when teaming
allow dead civ to change team 

Balance:
tweak OOB
Marder I is not buildable (but 3 are given when conquering Paris)
tweak retreats


v.43 (May 31, 2015):

DLL
only Conquest is available for AI Grand Strategy
minors should not do anything
finally fix wrong icons in War/Peace notification
do not show war/peace notification related to a minor faction following a major into war.

Balance:
do not allow minor nation to build units (again), but give every neutral minor a starting OOB
tweak major nations OOB (add artillery units)
use a maximum number of units on a troop route to prevent sending too many units away
remove Aircraft Carriers from build list, they'll be added as project (to spawn the whole package aircraft + carrier)
infantry tanks get 25% penalty from air attacks

Bug fix:
U.S.A were not supposed to spawn on the Europe map
Semovente M41-75/18 project was not correctly set
bunker were not supposed to be damaged by nearby city bombardment

A few optimizations


v.42 (May 31, 2015):
bugfix : convoy spawn before 1942
typo: tribal class


v.41 (May 30, 2015):
- Feature :
	add bunker Improvements (asioasioasio Civ4 model converted by Ekmek)

- Bug fix :
	cities were not converted during Fall of Poland and Denmark
	damage values were not correctly set on pillaged improvement
	convoy move immediately after spawning (can't be blocked anymore by a smart player against the edge of the map)
	do not stop adding resources to a player pool after testing a pillaged plot
    
- Balance :
	mark convoy as "CIVILIAN_ATTACK_PRIORITY_HIGH" for the AI
	add Fortification NW of Warsaw on the 39-45 Europe map
	add Military Base for Strasbourg for the human players (it was already available to the AI) on the 39-45 Europe map
	new routes in 1942 for U.K. and France (resources and military units from USA) on the 39-45 Europe map
	defensive positions (Urban Area, Factories, Bunker, Fort, Citadel) are pillaged when an unit capture their position on enemy territory (but not when liberating territory)
	lower strength of fortification units (from 50 to 40)
	
v.40 (May 25, 2015):
-DLL : 
	add GameEvent "UnitHasPillaged" to track damages on improvement/roads
	terrain defenseModifier (hill, forest, improvement, ...) can stack
    "Sweeping" is now "Air Superiority" : engage enemy intercepting aircraft in the area and also give reconnaissance on the adjacent tiles (no need to see the targeted plot)
   
-UI :
	show damage level on improvements (from nearby cities being bombed or special Forces pillaging)
	update resource string on mouse over plot to match the mod's rules
    really give correct information about defensive value of a plot
    add max range highlight to "Air Superiority" missions (previously "Air Sweep")
    tweak some battleships, cruisers and heavy cruisers size

-Feature :
	units with no supply line "bleed" (-2 HP/turn)

-Balance :
	add Military Base and Academy to some of the AI cities (so they can make projects) on the Europe 39-45 map
	AI will not build units that require Oil if it can't supply them
    tweak U.S.S.R. air class ratio
    tweak leaders' flavor values

-Bug Fix :
	can now click on the notification icon to see which unit has been upgraded

-Crash Fix :
	new function for the "Fall of France" event on the 39-45 map
	apply change from "Fall of France" to other "Fall of ..." (Poland, Denmark) functions on the Europe 39-45 map


v.39 (May 22, 2015):
- DLL :
	The value to estimate combat results (large/small victory/defeat) based on damages difference was hardcoded to 30, changed to 7 to reflect the mod's values
	Max received damage in any situation is 15 HP, to prevent kills in 3-4shoots
	Use new DLL event to call function at the beginning of a turn, not at the beginning of each human player turn
	One melee attack per turn from inside a city and no attack from inside a city for sea units
	No Zone Of Control on sea
	Add a function to create a RED_WWII folder in the game's "assets/DLC" folder to override some vanilla files to prevent crash on load before deactivating DLCs/Mods
	Crash fix for some case of tentative of air attack on an embarked unit.
	Allow promotion of units after combat
	Bug fix in strategy flavor (dividing by zero, the case did not occurs with vanilla civ5 values)
	Test for military/strategy AI (attack closest cities in priority)
	No more selling gold for gold per turn, unless for peace or when allied

- Features : 
	Starting French translation
	a lots of new units (and corresponding projects) added
	Can toggle the reinforcement tooltip to show requirement for all units, including those that have no supply lines
	Add Oil resource (including stock and use) on the europe 39-45 map
	Add more conditions for projects availability
	Allow repeatable projects
	Add auto-repair function for improvements pillaged by Special Forces
	Give Materiel and Oil when capturing a city, depending on it's size
	Add "The MotherLand Calls" operation to USSR (available and repeatable when losing the war)
	New building: oil refinery (can stock 1000 oil) for all nation
	Allow special forces to embark from anywhere and move after attacking
	Add objective information to top panel in the 39-45 Europe scenario
	Add "Fortification" unit (not in build list, immobile, defense only, but can counter-fire and use defensive first strike)
	Add "Maginot Line" and "Westwall" options to the 1939-1945 Europe map
	When attacking from sea, winning the combat will force the defending unit to retreat, but it's the attacking unit that will get extra damage (heavy offensive)
	Add "PERMANENT_WAR_DECLARATION" to scenario rules (default = true), when using alternate history any declaration of war is permanent (prevent your ally to ask for peace in your back)
	Add a table (g_Units_Maintenance_Modifier) for maintenance free units per nation, used with new DLL event
	Additional compatibility checks on the setup screen (disable DLCs and verify minimal game version)
	AI disband wounded units if it can't support them

- Bug fix :
	No color overlay on nation flag near cities names
	Remove unneeded entries in the rebuild of the vanilla database
	Can't retreat on enemy or neutral territory
	Can't retreat if no moves left
	Can now retreat on another unit of the same nation if the regiment/division rule is respected
	Remove all beta/alpha scenarios from the list, they can be reactivated by changing the content type from "CustomRED_" to "CustomRED" in the project or modinfo file
	Some of the promotions text that where displaying wrong values
	Prevent counter-counter-attack during naval combat
	Clean function AreSameside(player1ID,player2ID). it was hardcoded in general files to do some things for the 39-45 Europe, now there is an override function in the scenario files
	Do not escape from a city to go on neutral/hostile territory !
	Only show the local player's procurement details on the resource tooltip of the top panel, even during other players turn...
	Remove reference to the deleted "PreLoading" files
	Don't allow two units to (automatically) attack a sub from the same position
	Do not show vanilla leaders icon and name (fixed by disabling DLCs)
	Show correct value in texts (fixed by disabling DLCs)
	Show correct defensive value of a plot on mouse over
	Germany does not try to send reinforcement on U.K. after Seelowe if there are no Axis units left there (Europe 39-45 map)
	Minor nations should use the restriction table for units production
	Do not show culture or science in buildings descriptions (there are still a few texts to edit)
	Mobile Artillery is now really an artillery unit, not a tank with ranged attack and melee promotions...
	Mobile Artillery can counter-fire / provide support fire
	Notification for new project should be displayed correctly
	Do not launch counter-fire or support fire if the triggering unit can't attack...
	But no need to check if the attacking unit can attack for counter-fire, the attack is already made at this moment !
	In some cases units on a "sea" route could still be on land without the embarked promotion...

- Balance :
	Buildings give more XP
	Raise defense value for some improvements
	Change a few cities on the 1939 maps, tweak Oil deposit placement and values
	Raise Strasbourg defense for the AI on the 1939-1945 Europe map
	Lose only one movement point on retreat
	Lower some promotions effect
	Lower adjacent units bonus (because you can have 2 units per tile)
	Buff tank destroyer ranged attack
	Waffen SS use a bit more material for reinforcement
	Assault guns and Tank Destroyers does not get the blitz promotion from Germany trait.
	Infantry Tank defense bonus lowered to 20% (was 30%)
	Startegic AI (to send reinforcement on pre-defined routes) Italy is "safe" if less than 6 plots are lost to the enemy, Germany is safe at less than 10 plots (was 1)
	AI ships try to heal inside a city with harbors, it's safer than just outside...
	Convoy are considered free units for supply limit (actually you get 1 more supply per convoy on the map)
	Damage transferred from city to improvement when bombed are applied to the closest improvements first
	Add Kirkwall (Scapa Flow) and Mulhouse (Europe 39-45 map)
	Better Order of Battle for minor nations (Europe 39-45 map)
	Add more units on troupe routes (Europe 39-45 map)
	Change defense bonuses of urban areas (35%), factories (25%) and city ruins (30%)
	Production modifier when over the supply limit for units is now -2% per unit (was 6)
	Add a harbor for the AI in ABERDEEN (U.K.) on the 39-45 Europe map
	Volley promotion give bonus against Fortification units
	Allows minor nations to build units (Europe 39-45 map)
	AI will disband wounded units if it can't build more, and won't build more units if it has reached the supply limit.
	Add units ratio by class to minor nations build list
	Change some database values to make the AI more aggressive

- UI :
	Add details for oil procurement in the top panel
	Small improvements
	Add a shortcut button near the mini map to set quick Combat/Movement ON/OFF on left/right click
	Scale down Destroyers
	Show other nation resources values on the diplolist

- Optimization :
	Correct distribution of units after Fall Of France event, added some optimizations, not sure if it's enough to fix the crashes some were experimenting.
	Use coroutine to handle the Fall of France event on the 1939-1945 Europe
	Cache some values

v.38 (Aug 24, 2013):
- DLL : Update source code to patch 1.0.3.18
- DLL : Use DLL linking as allowed by patch 1.0.3.70 (no additional installation step for Vanilla Civ5 users)

v.37 (Jan 06, 2013):
- UI : show current and next turn values for reinforcements, planned values are updated in real time (for example after combat or after changing city specialization/production)
- UI : add local reinforcement data in city screen.
- UI : change the fonticon for personnel.
- UI : add color-coding for damage to the aircraft list, add the current aircraft mission to the tooltip.
- UI : change some of the game text related to food and gold to reflect the mod's rules.
- UI : include the "Simple 24 Hour Clock Mod" from AgentofEvil in top panel.
- Bugfix: the score in Stalingrad scenario was broken again (this time I forgot to change the original plot ownership initialization with the new tile supply system)
- Bugfix: LuaEvents.OnCityCaptured fire for all city capture.
- Bugfix: the new code to check ratio restriction for the AI failed for armor units on a few scenarios and was crashing the AI override script.
- Bugfix: the diplomacy AreSameside function was sometime crashing, causing the AI override script to fail when searching for a city to heal its ships.
- Optimization: archiving of the combat log can be deactivated, while cleaning remains active (archiving could take up to 2-3 mn every 10-15 turns in late games with more than 10 000 combats)
- Balance : "buy war bonds" process has been buffed, it now converts 75% of city gold+production to materiel (was 50%)
- Balance : Hospital truly heals wounded soldiers. Each turn the game calculate the number of "out of combat" men based on units damage and their personnel ratio (for units that have a supply line), then it applies another ratio to get a "pool of wounded" (men that are not dead or invalid), and finally each hospital can heal 3% of that pool with a maximum rate of 150 personnel / turn. 
- Balance : Radio generate a number of recruits based on city size (x3) and provide a 50% bonus to all recruiting buildings (the radio itself, barracks, military academy and the "We need you" process).
- Balance : the USSR trait is only applied on direct recruitement source (barracks, military academy, radio, "we need you").
- Balance : deal duration (open border) is all game (well 999 turns in fact)


v.36 (Dec 30, 2012):
- DLL : Update source code to 1.0.2.21 (thanks, again, to whoward69's compilation tips)
- Bugfix : games were not correctly initialized when using the 1939-45 Europe map, causing order of battles to be re-spawned when reloading.
- Bugfix : change a road tile to a railroads on both Europe maps. On the Europe 39-45 scenario, this was preventing soviet convoys to spawn from US to Murmansk.
- Balance: raise spawning probability for soviet convoys
- Change : Rebase in friendly city is a permanent feature.
- Optimization : check air distance between a boat and a submarine's attack before trying to find a route (prevent searching for tousands of tiles routes on larger maps)
- AI : don't try to heal unit's types which have reached their ratio limit.
- Correction : a few typo/grammar.
- Authorize mod: IGE - InGame Editor

v.35 (Dec 19, 2012):
- Compatibility : not compatible with saves from previous versions.
- Compatibility : R.E.D. DLL v.4 is mandatory (already included in v.35 if you have G+K).
- DLL feature : add the notion of supply lines to tiles, when not linked to a city or an unit, a plot can flip to the closest enemy unit or city.
- DLL feature : tiles owned by cities does not flip side when the city is captured.
- DLL feature : units can enter allied cities
- DLL feature : units can stack in cities (unlimited stacking now, limited stacking relative to buildings is planned)
- DLL feature : prevent some check related to Minor Civs asking for help, which in turn prevent a crash occuring during the AI turn (related to forced teams ?) 
- Optimization : no need to link tiles to cities on "Fall of..." events (save processing time)
- Optimization : archive combat log in a separate table when needed (save up to 10-15 s/turn in late game) 
- Optimization : add PlotIterator code from whoward69
- Bugfix : once the mod is loaded, does not allow the user to return to the main menu (exit game instead), as the game fail to unload the files that are overriden using the VFS property.
- Bugfix : code to find a city to heal AI Naval Units was sometime failing, making all other AI override inactive for that turn (other naval units and air units...)
- Bugfix : change the way the mod handle support fire, to prevent units from being one-shooted by artillery if they were not supposed to be the target of the attack.
- Bugfix : save all tables at the end of the barbarian player turn, so they can be added to the game autosaves which is done just after.
- Balance: Field Guns bonus vs armor lowered to +25% (was +100%)
- Balance: on the 39-45 Europe map, "Fall of France" on Paris capture doesn't happen after 01/01/1942 or if U.S.S.R and Germany are already at war. 
- Balance: on the 39-45 Europe map, make Paris an "open city" (less defense, no defensive buildings allowed).
- Balance: on the 39-45 Europe map, don't force DoW on all French colonies vs allied (prelude to Operation Torch implementation).
- Balance: allow Air type ratio restriction for the AI (force a limit on each "class" type)
- Correction : Japan DoM text now refers to "Prime Minister"
- Correction : Notification texts were not using the damage number when killing an enemy unit in defense.


v.34 (Dec 02, 2012):
- CrashFix: Attacking submarines was crashing the game when using G+K.
- Balance: City siege Promotion (free for infantries) was 10 times stronger when using G+K (+200%), restored to normal (+20%)
- Balance: Fighter were given Anti-Air promotion when using G+K, which was added to the mod base promotion, keep only the base promotion
- Balance: The 100% defensive bonus vs aircraft for embarked units was not initialized when using G+K
- Balance: Field Guns are now "Siege" combat class, not "Gunpowder".
- BugFix: Embarked units were given 0 strength when using G+K.
- Add: Field Guns and AA Guns to units list for Stalingrad scenario.
- Add: More description for scenarios, add warnings when needed about stability and requirements.
	
v.33 (Dec 01, 2012):
- Installation Fix: Removed files of size 0 from the archive. Firaxis, please, for christmas can you make me an version of Civ5 that does not crash when it meet a 0 size file in an archive ?
	
v.32 (Dec 01, 2012):
- Compatibility : not compatible with saves from previous versions.
- Compatibility: moved to G&K for automatic DLL installation, but still compatible with vanilla (vanilla require an extra installation step to replace the game original DLL file)
- DLL Feature: balance embarked units defensive combat by considering them DOMAIN_SEA (they were considered DOMAIN_LAND) and ignore all other bonus/penalties except a 100% bonus vs aircraft.
- DLL Feature: restriction on ranged attacks, submarines can't be attacked by land-based artillery or medium/heavy bombers, and naval units can't attack from inside a city (at dock) 
- DLL Feature: can set some units to act like a special type of units, "regiment", allowing them to stack with normal ("division") units, but not with another regiment.
- DLL Feature: related to unit stacking, the GetBestDefender function now return the unit that will have the more HP left after the attack.
- DLL Feature: add first strike mechanism used by artillery (field guns, howitzer-guns) units.
- DLL Bugfix: end turn autosave is no more triggered after the AI has started computing it's turn (could make the first AI to lose 1 turn), but before.
- UI: New in-game menu (featuring JanBoruta's Nation maps)
- New Artillery type: "Field Gun" (regiment), with 2 ranges, can't fire above obstacle (direct fire), can only defend, bonus vs armor.
- New Artillery type: "AA Gun" (regiment), protect only the tile it's on from air attack (but with 3 interceptions), can only defend, bonus vs air.
- Balance: remove penalty against armor for Artillery, rename it to "Howitzer-Gun", lowering melee strenght to 14 (was 16), and it's now a "regiment" unit.
- Balance: remove inflation on unit maintenance. 
- Balance: lower the number of units supplied by your nation cities and population.
- Balance: penalty production when reaching the supply limit is lowered to 4% per unit above the limit (was 10% in vanilla game)
- Bugfix: don't make units escape from a city under a ranged attack...
- Bugfix: heavy bombers had 50% naval penalty and 70% sea penalty... Now have "only" 70% sea penalty.
- Bugfix: military operations should not try to paradrop units in neutral territory now that they can be closed...
- Bugfix: Stalingrad score function was broken.
- Bugfix: don't try to Air Sweep when the interception was not made by an air unit... 
- Optimization of loading/saving time for mod data.
- Authorize more mod: UI - Promotion Tree

v.31 (Nov 08, 2012):
- Compatibility : not compatible with saves from previous versions.
- Compatibility : R.E.D. Data Files v.4 is now mandatory.
- Compatibility : R.E.D. DLL is mandatory (no more compatibility with mac version).
- DLL Feature : optional setting (at scenario level, default is true) to make neutral city-states territory impassable until you reach Allied level (60 relation points)
- DLL Feature : option in game setup to allow rebasing of aircraft in allied cities. the AI may not take advantage of it (yet)
- Feature : add notification when an unit have been upgraded.
- Crashfix : moved starting position of Swedish infantries on the Europe 1939-45 map, one of them embarking on a lake caused a crash during AI first turn... 
- Crashfix : corrected script on the America/Europe 1936 scenario that was causing a crash when changing position and ownership of units after the "Fall of France" event.
- DLL Hack : can initialize WorldBuilder maps even when there are more than 256 unit types in the database. But DO NOT try to place an unit which type ID is above 255 on a WB map.
- DLL Bugfix : Combat functions were not reporting attacked cities correctly since civilization patch .674
- DLL Bugfix : Combat functions were not able to get Intercepting aircraft since civilization patch .674, now the AI is programmed to intercept and use air sweep when and where it's needed.
- DLL Bugfix : City Combat maximum damage from Air Bombing was not calculated correctly since patch .674
- DLL Bugfix : QuickCombat option can now be safely used.
- DLL Bugfix : StrategicView is safe to use, but the correct icons are still lacking.
- Bugfix : InitializeHotseat() was not called properly when reloading a saved game.
- Bugfix : deactivate Load Menu from in game (see http://forums.civfanatics.com/showthread.php?p=10901376).
- Bugfix : tweak the upgrade list of the 1942 Earth scenario to prevent light tanks upgrading to medium.
- Bugfix : use default unit list on the 1942 maps (units added in the mod after the scenario creation were not available while the corresponding projects were)
- Bugfix : tooltip on Air unit lists in cities were not updating damage correctly.
- UI : rework the setup screens to be (hopefully) more user friendly.
- UI : remove some uneeded info from ingame screen.
- Balance : In hotseat mode don't give AI starting bonus (units and buildings) to everyone when there are human player in both side.
- Balance : lower submarine production cost.
- Correction : Panzer II Ausf.L project is not marked as done at start on Stalingrad and Earth 1942 scenario (firsts were build in 1943).
- Correction : a few typos on maps and units
- Add : secondary objectives to USSR on Stalingrad scenario, with victory screen.
- Add : a few more backgrounds screen...
- Add : customized fontIcons
- Authorize more mod : FastMove, R.E.D. Xtreme for WWII Edition, LiveTuner - Icon Viewer, LiveTuner - Texture Viewer. 
	
v.30 (Aug 18, 2012):
- Crashfix : the AI won't try to heal convoy anymore when no destination are available.

v.29 (Aug 15, 2012):
- Fix Typo : Sherman Easy Eight is M4A3E8
- Add : option to turn off custom events ("fall of..") in the America/Europe 1936 map.
- Add : a quickly made R.E.D. Mod logo (with http://www.onlinelogomaker.com) and some background screens after mod initialization.
- Feature : automatically disable G&K expansion.
- Feature : automatically enable Mongol DLC.
- Feature : automatically disable all mods that are not specifically authorized. (compatibility will be tested case by case, please submit mods to check in the forum)
- Authorize mods : Faster aircraft Animation (v.2) and UI - Summary Clock. (but it will overlap with turn number, I may merge it with R.E.D. instead)

v.28 (Jun 17, 2012):
- Add : diplo scene for China and Japan.
- Bugfix : can set handicap correctly on all scenario.
- Bugfix : removed feature allowing capture tiles only with units, not with cities on Stalingrad map (broken by the patch)
- Bugfix : Naval counter-attack was broken by the patch.

v.271 (Jun 08, 2012):
- Bugfix : retreat feature was broken by vanilla game bugfix.
- Bugfix : new ArtUnits system was making all units shown as spearmen.

v.27 (Jun 06, 2012):
- Update : upload to steam workshop.
- Bugfix : initialization problem when both side have human player.
- Bugfix : Germany should send reinforcement to UK after Seelöwe is launched.
- Balance : embarkation defense against air unit raised to 200%.

v.26 (May 30, 2012):
- Feature : introducing Military Operation Projects with Operation Weserübung and Operation Seelöwe. Operation Projects require a military base.
- Feature : allow override of saved options in scenario setup screen by defining the "Checked" value to "false" or "true" in g_REDCheckboxOptions. 
- Code : better use of saved tables (should gain 2-6 sec / turn)
- Bugfix : units shouldn't be killed by damage from retreating.
- Bugfix : difficulty setting wasn't correctly defined...
- Bugfix : set correctly embarkation promotion on game initialization (a move was needed to set it)
- Bugfix : Norway convoy should not spawn on land on the 1936 USA/Europe map.
- Bugfix : cities count as rails plot when checking for convoy route. (some railway check where not returning true as expected)
- Bugfix : range and ranged attack value wasn't correctly displayed in unitflag's tooltip.
- Bugfix : convoy should not be able to unload in captured / blockaded city.
- Bugfix : human player should not be able to make peace with minor civs when alternate history is not allowed or permanent war is set by the scenario.
- Bugfix : should not spawn convoy when no destination are available.
- Bugfix : a bug leading to crash on "Fall of France" event removed.
- Added : convoy infos (cargo, destination) in unitflag's tooltip. (yes, even for the enemy convoy, this was a world of spies)
- Updated : completed German side of Stalingrad scenario with primary and secondary objective, custom victory screen.
- Balance : added a small amount of Materiel and Personnel bonus each turn, relative to difficulty setting. (AI use Prince difficulty level for that setting)
- Balance : Light Tanks can get the mobility promotion at level 2.
- Balance : more units at start for German AI on the 1939-45 Europe map.
- Balance : simplification of projects requirements. Academy are needed for brand new units (ex: Panzer IV), Academy OR required building for upgrades (ex: Academy OR Land Factory for Panzer IV G)
- Balance : AI get units/buildings bonus only if there's no human player in the same side. Bonus are applied to all player if there are humans player on both side.
- Balance : added manufactories in Germany.
- Balance : added Cherbourg city in France (with harbor)

v.25 (May 13, 2012):
- Feature : mid-game reinforcement spawning, used by Stalingrad Scenario.
- Updated : Stalingrad scenario first balance pass, German Order of Battle, score and victory condition set.
- Bugfix : corrected movement cost on desert and snow (really x2 now), corrected corresponding promotions (Forgot to set VFS to true for DDS files...)
- Bugfix : convoy should not unload twice...
- Bugfix : fighters were not correctly removed from interception list for healing.
- Bugfix : aircraft names fit in the aircraft selection popup.
- Added : tooltip infos for each unit in the aircraft selection popup.
- Added : fighters won't try to rebase to a city with low HP when looking for interception and airsweep missions.
- Added : Damage texts adapted from Thalassicus' CiVUP/VEM.
- Added : Combat texts specific to the mod mechanism (retreat feature, ...) or added to missing vanilla game's feature (damage from an air to air interception).
- Balance : restore previous fortify bonus per turn to 25%.
- Balance : set the maximum fortify bonus to 75%. (reached in 3 turns)
- Balance : Artillery can use defensive bonus.
- Balance : added a new "Open city" building to represent cities/villages in which you can't set defensive positions, used by Stalingrad Scenario. 
- Tweaked : units will try to retreat from city before they are captured, at the cost of 25 to 50% of current hit points.
- Added : if there's no free plot around the city from which an unit try to escape, it will be transfered to a nearby city, at the cost of 50 to 99% of current HP.

v.24 (May 08, 2012):
- Added : Stalingrad scenario (early beta version with dumb AI, to get feedback on the map or to play hotseat)
- Added : T_KCommanderbly icons for some unit classes
- Added : option to force historical calendar only (no early DoW)
- Added : option to turn off custom events ("fall of..") in the 1939-1945 map.
- Added : hotseat game mode for America/Europe 1936 and Earth 1942 map.
- Added : hotseat loading screen (no need to launch a new hotseat game to reload one...)
- Added : option for quick combat borrowed from Thalassicus' CiVUP/VEM (open and edit Option.sql in R.E.D. WII mod folder)
- Added : combat infos (unit class, combat strength, reinforcement needed...) in unitflag's tooltip, based on Hover Info by Adam Watkins.
- Added : units help text (global class description and usage) in production list.
- Added : setting to allow x2 moves on ocean tiles (default is "USE_FAST_OCEAN_MOVE = true", works with embarked units)
- Added : setting to allow +2 moves on all sea tiles (default is "USE_FAST_NAVAL_MOVE = false", doesn't work with embarked units)
- Bugfix : Free France colony reconquest was not triggered.
- Bugfix : convoy are considered at destination when they reach a plot adjacent to a city, not the city itself, this should reduce the occurence of convoy blocked because of another ship in the city.
- Bugfix : count free promotions when calculating reinforcement for a unit type (correct display of material for heavy units in production list)
- Bugfix : units retreat from a city when the city HP is predicted to go under 5 HP after an attack (was 0, leading to city captured without unit escaping when prediction was erroneous - there's a small random variation here)
- Bugfix : do not use bugged vanilla function unit:JumpToNearestValidPlot() (make the game crash if there's no valid plot on the map)
- Balance : number of resistance's turns for a captured city is halved.
- Balance : -25% for Battleships against air unit. ("Large Target" promotion also used on heavy tanks & assault guns)
- Balance : fortified unit get +25% defense each turn, with 6 turns max. (Fortified Infantry can now get 150% defensive bonus...)
- Balance : raise city defense from population.
- Balance : raise city defense from building (24 from military base, 16 from arsenal, 6 from barracks), add/raise upkeep cost to those buildings.
- Balance : lower crossing River Penalty to -33%, amphibious assault penalty to -50% (from -50%, -75% respectivly, vanilla is -20%, -50%)
- Balance : no bonus (units, buildings) for AI sided with a human player.
- Balance : raise cost of heavy units. (tanks, assault guns)
- Balance : movement cost on desert and snow x2, also added Thal's desert and snow promotions from CiVUP/VEM
- Changed : some units variable renamed for code consistency.
- Added : new Assault gun unit class, represented by the heavy KV-2. To use against cities and fortified units.
- Added : 20 more danrell's units (some much requested !) thanx to T_KCommanderbly 
	- Heavy Tanks : French ARL-44, German Panzer VI Tiger, Russian IS-1 & IS-2, American M-26 Pershing
	- Cruiser Tanks : UK Valentine, Covenanter, Crusader & Crusader Mk III
	- Tanks : German Panther, Russian T34-85, American Sherman IIIA, Sherman IV, Sherman Jumbo, Sherman Easy Eight
	- Fighter : American P-36, Russian Yak-7, Italian Macchi C.202 Folgore 
	- Heavy Bomber : UK Lancaster, American B-24 Liberator 

v.23 (Mar 10, 2012):
- Rebuild mod after HDD crash
- Bugfix : combat functions (retreat, naval counter-attack, ...) where not initialized on new game, only when reloading.

v.22 (Mar 08, 2012):
- Bugfix : initializing a new game was failing.
	
v.21 (Mar 07, 2012):
- Feature : code to manage AI naval troops transport (from embarking plot to debarking plot, used only on 1939 map ATM)
- Feature : city can't be bombarded under 33% HP by air attacks, but once this threshold is reached, the damage that would have be done to the city can disable nearby improvements...
- Changed : Vilnius is given to Poland at scenario start on the Europe 1939 map.
- Tweaked : a few defines about AI opinion

v.20 (Fev 27, 2012):
- Bugfix : Retreat feature was broken in v.19...

v.19 (Fev 26, 2012):
- Changed : recoding of the project registration, if bug free it should be transparent to the user, but now all is handled in the mod's Lua files, not by the game engine.
- Added : custom options on the Europe 1939-1945 setup screen.
- Bugfix : Winter War was not ending correctly.
- BugFix : an embarked unit forcing an enemy unit to retreat when landing should not forget to disembark.
- Bugfix : ships in city should heal.
- Bugfix : kill convoy units on "Fall of France" event
- Balance : occupied cities produce only 15% of normal reinforcement. (you should build administrative center there)
- Balance : friendly CS give 30% of their reinforcement production to friends, and allied CS give 60%.
- Balance : change defense penalty for cruiser tanks to -25%. (was -50%)
- Balance : new convoy route for Germany. (if Narvick has been captured by Axis)
- Balance : liberating minor civ territory gives a diplo bonus.
	
v.18 (Fev 19, 2012):
- Bugfix : Production list was broken in 1936 and 1942 scenario
	
v.17 (Fev 18, 2012):
- Added : 1936 America/Euro scenario by T_KCommanderbly
- Feature : Multiplayer hotseat mode !!!
- Feature : force AI to use Air Sweep mission when needed.
- Feature : option to prevent AI units from embarking. (set "NO_AI_EMBARKATION = true" in scenario define file)
- Feature : option to restrict embarking from cities with harbor (and adjacent tiles) only. (set "EMBARK_FROM_HARBOR = true" in scenario define file)
- Feature : code to manage convoy units.
- Feature : code to manage list of protected minor civs (protectors declare wars when minor is attacked, protected minors sign peace treaties following their protector) 
- Feature : code to force AI to heal damaged units
- Feature : prevent declaration of war on minor civ if there is a minimum turn before allowing war, or if there's a protector civ which with the player has a peace treaty enforced.
- Bugfix : correct flag for Greece.
- Bugfix : correct auto-naming for greek fighters and bombers.
- Bugfix : a typo in projects entries was preventing some US projects to be researched.
- Bugfix : a typo in units entries was preventing some Japanese units to be build on the 1942 scenario.
- Bugfix : some new projects for 1936 scenario were not defined in the 1942 files, preventing corresponding US units to be built.
- Bugfix : naval units escaping from captured cities should not go in landlocked city...
- Balance : use 3x air range for rebase.
- Balance : lower construction cost for Infantry
- Balance : naval units can heal near friendly cities (and the AI will use it)

	
v.16 (Fev 05, 2012):
- Bugfix : to much code cleaning, pre-placed units were not initialized correctly, breaking some of the mod features (reinforcement, auto-update) on the 1942 world map.
	
v.15 (Fev 05, 2012):
- Changed : cleaning of common and scenario files, removing a lot of unnecessary replicated chunks of code...
- Bugfix : some Dawn of Man and Diplo screens were not loaded.
- Bugfix : wounded paratrooper won't break the reinforcement system anymore.
- Added : paratrooper data definition  (can use paradrop from cities only)
- ExploitFix : cities selling disabled.
- Added : cities hexes always revealed (allow long range bombing) (optional, must set "REVEAL_ALL_CITIES = true" in scenario define file)
- Added : Greece as playable nation on Europe 1939-1945 scenario.
- Added : Greek units
	- Land : Infantry, Vickers Mk E, Vickers Mk II
	- Air : Fairey Battle, Bristol Blenheim, PZL.24, Spitfire
	- Sea : Pisa Class, Katsonis Class, Vasilefs Georgios Class
	
v.14 (Sep 25, 2011):
- Bugfix : PanzerIV ausf G was not buildable.
- Bugfix : city banner current build icons was not shown on Earth 1942 scenario. 

v.13 (Sep 24, 2011):
- Bugfix : Normal save was not working on Earth scenario

v.12 (Sep 23, 2011):
- Bugfix : T-34 was not available
- Bugfix : a crash could occur when an AI fighter on forced interception mission was upgraded
- Mapfix : add ownership to Baltic Islands, correct Barcelona and Gothenburg names

v.11 (Sep 21, 2011):
- Feature : AI override function to force destroyer and cruiser to hunt submarines.
- Added : New leaders and units (infantry) icons by Four_Pharao.
- Added : New pedia entries for ships and tanks from Hulfgar.
- Bugfix : Mosquito and Tu-2 where inversed and not buildable.
- Bugfix : Permanent alliance for France/UK was sometimes not called.
- Bugfix : Remove default upgrading, the vanilla engine allows upgrade to units requesting project before the project is completed...
- Feature : Add auto-upgrading function, one unit per turn may upgrade if there are enough materiel to allow that. Most experimented units upgrade first.
- Bugfix : Top Panel show begining of turn data, not end of last turn data.
- Bugfix : Custom victory events are now correctly called.
- Balance : remove Fast Bombers' city bonus.
- Balance : +1 move for embarked units (from 3 to 4)
- Balance : -1 move for submarines (from 6 to 5)
- Balance : Bf-109E and Spitfire Mk II are now FIGHTER_B class instead of FIGHTER class (in short : one level up)
- Balance : +10 Combat Value to Il-2
- Balance : +10 Combat Value and -1 Moves for Matilda II tank
- Added : 5th batch of units from danrell's WW2 packs (with help from T_KCommanderbly for Earth 1941 scenario) and some corresponding project :
	- Heavy Bombers : B-17 Flying Fortress
	- Bombers : B-25 Mitchell, Il-4
	- Destroyer : Kagero class, Fletcher class  
	- Cruiser : Takao, Balitmore
	- Attack Aircraft : Aichi
	- Fighters : Lavochkin La-5, Lavochkin La-5 v2, Lavochkin La-7, Fiat G.55 Centauro, Spitfire MK V, Spitfire MK IX, Bf-109F, Bf-109G, Fw-190, P-51
	- Heavy Fighters : Westland Whirlwind, Bristol Beaufighter, Bf-110, Bf-110 F4, Ju-88C, He-219, Potez 630, P-38
	- Cruiser/Cavalery Tanks : A9 Cruiser Mk I, A10 Cruiser Mk II, A13 Cruiser Mk III, A13 Mk II Cruiser Mk IV, H-35, H-39, BT-2, BT-7
	- Light Tanks : Type 95 Ha-Go, Type 4 Ke-Nu
	- Tanks : Panzer III Ausf J, Panzer IV Ausf G, Panzer IV Ausf H, T34-76, M14-41, M15-42, M4A1(76)W Sherman IIA, M4A2 Sherman III, M4 Firefly, Type 97 Shinhoto Chi-Ha, Type 1 Chi-He, Type 3 Chi-Nu
	- Heavy Tanks : A22 Churchill, Type 4 Chi-To, Type 5 Chi-Ri

v.10 (Sep 05, 2011):
- Feature : AI override function to force fighters on interception if it's needed and rebase them near bombed targets if necessary
- Feature : AI hack to prevent suicide attacks. This is done by deleting and respawning the suicide unit just before it can attack, giving a visual issue: the damage are reseted to current level, showing a red number (MaxHitPoints-ActualDamage), same for XP. But the respawned unit has exactly the same attributes as before the aborted attack. Function is deactivated by default.
- Feature : custom victory screens, to win the game you'll have to capture not only the capital, but 3 more key cities of your opponents. Here's the list of key cities:
	- England : London, Liverpool, Edinbugh, Newcaste
	- France : Paris, Caen, Dunkerque, Bordeaux  
	- Germany : Berlin, Kiel, Bremen, Frankfurt
	- Italy : Rome, Naple, Milan, Bologna
	- USSR : Moscow, Kiev, Stalingrad, Leningrad
- Bugfix : don't send reinforcements to embarked units.
- Bugfix : some events didn't happened at the correct date, the code was badly interpreting the calendar.
- Feature : give XP to aircraft making interceptions.
- Feature : after "Fall Of France" event, the french player can try to convert back it's colonies (by capturing the colony capital) or it's units. (by attacking them and dealing less damage than received or by attacking units with low health to force surrender) 
- Balance : reduced projects cost.
- Balance : allow supply line to start from cities of friendly minor civilizations
- Balance : slow down XP progression
- Balance : no XP from bombarding cities with land or naval units
- Balance : fighters can intercept 2 air attacks each turn
- Balance : raise city defense bonus for garisonned units
- Tweak map : names corrections, rivers placement, change NE plot of Nice from mountain to hill.
- Added : new scenario "Earth 1942" by T_KCommanderbly (beta version) with playable USA, Japan, China and with new units.
- Added : 4th batch of units from danrell's WW2 packs 
	- Heavy Bombers : Tupolev TB-3, He-177, HP Halifax, Petlyakov Pe-8, Tupolev TB-3
	- Fast Bombers : De Havilland Mosquito, Tupolev Tu-2, SM.79 Sparviero
	- Destroyers : Fantasque, Type 1934A, Triba, Gnevny, Soldati
	- Cruisers : La Galissoniere, Leipzig, Dido, Kirov
	- Heavy/Battle Cruisers : Deutschland, Zara
	- Battleships : Sovetsky Soyuz, King George V
	- Dreadnought : Queen Elizabeth, Gangut, Conte Di Cavour
	- Old Tanks : AMC-35, Char D1, Char D2, M3 Grant, T-28, M11-39
	- Light Tanks : Renault R-40, Panzer II Ausf L 

v0.9 (Aug 29, 2011):
- Bugfix : "Fall of Poland" should now works as intended.
- Bugfix : "Fall of France" too... (some cities were not flipped correctly to Vichy France if already captured by axis power)
- Feature : add real date for DoW / Annexation / Alliance compiled by NwabudikeMorgan
- Feature : add naval counter-attack mod by Mylon
- Balance : change Destroyer Anti-Submarine promotion to +200% (was 100%) 
- Balance : battleships range down to 1 (was 2)
- Balance : artillery get -50% combat against Naval units, -25% against Armor, +50% against cities and +25% against Gun 
- Change : USSR won't become permanently allied with Uk/France (to prevent Poland liberation by USSR)
	
v0.8 (Aug 25, 2011):
- Bugfix : Captured territories was wrongly liberated in some cases when making a permanent alliance
- Bugfix : Unit ratio for AI was wrongly applied for the human player too
- Feature : allied and friend CS give you a portion of their reinforcements in materiel and personnel
- Feature : "Fall of Poland" when Warsaw is captured by Germany or USSR with territory splitting if both are still at peace.
- Feature : add probability and more units available for calling reserve troops by the AI
- Feature : liberating a CS city give a diplo boost
- Balance : infantry start with city siege (+20% against cities)
- Balance : remove one movement point to a retreating unit.
- Balance : occupied cities produce less reinforcement than normal cities unless an Administrative Building is build
- Added: third (this one's even smaller, damn bugs, taking all my time !) batch of units from danrell's WW2 packs:
	- Poland units: infantry, Vickers MkE Type A, 10TP, PZL P.11, PZL P.37
	
v0.7 (Aug 22, 2011):
- Bugfix: "Fall of France" script should not liberate all plot on the map

v0.6 (Aug 22, 2011):
- Bugfix: Attack Aircrafts were getting +20% combat against city instead of -25%.
- Balance: Attack Aircrafts get +100% combat against land unit and +150% against armor (was +50% and +100%)
- Balance: Submarines ranged attack divided by 2, but give x2 bonus against all other sea units (except other subs)
- Balance: remove the "No City Capture" from armor units, AI was too much penalized.
- Bugfix: this time really liberate allied/friend tiles after a city capture have given them to another civ.
- Bugfix: unit escaping a captured city was getting wrong damage value.
- Bugfix: in some conditions, the supply line function was trying to find the cities of a dead player...
- Bugfix: flag of major civilization now correctly showing in war notification icons.
- Feature: display information about reinforcement needed by a unit on city build screen mouseover tooltip.
- Feature: "Buy War Bonds" (product materiel reiforcement) and "Your country needs you" (product personnel reinforcement) processes to city production.
- Feature: restriction on type of units build by AI based on ratio
- Feature: limited number of special unit classes for all game (ex: only two battleships of the Bismarck class allowed, if the Tirpiz is build and one of them is lost, no other can be build)
- Feature: fall of France when Paris is captured by Axis power. If you play as France, you don't want to lose Paris, you really don't...
- Added: Dawn of Man layout and texts by T_KCommanderbly
- Added: second (this one's small) batch of units from danrell's WW2 packs:
	- light tanks: AMR 35, FCM 36, Panzer 35(t), Vickers MKVIB, Tetrarch, Matilda I, T-26, L6/40

v0.5 (Aug 16, 2011):
- Bugfix: liberate allied/friend tiles after a city capture have given them to another civ.
- Feature: reserve units called in AI capital city (added but not working in v.4) under certain conditions (few units left and lose some territory)
- Include: edited version of CsebMod, and some change to other vanilla files to give more infos on units.
- For easier updating the mod is split in two components, both are needed :
	- R.E.D. WWII Data Files: the units, art and audio files size ~ 60 MB
	- R.E.D. WWII Edition: the mod core files, size < 1 MB
- Feature: Working German and USSR traits. France, UK and Italy are still W.I.P.
- Added: first batch of units from danrell's WW2 packs:
	- tanks: Somua S35, Char B1, Panzer I, Panzer II, Panzer III, Panzer IV, Matilda II, T-34, KV-1, P26/40
	- aircraft: Ju87, Ju-88, LN.401, IL2, Ba.65, MS406, MB.152, CR.42, Fiat G50, Polikarpov I-16, LaGG-3 
	- ships: Richelieu Class, Scharnhorst Class
- Converted: all previous units use new models version from danrell's WW2 packs.
- Added: pedia entries for some ships thanks to Hulfgar.
- Feature: Air units retreating from cities about to be captured. Add damage to units escaping city capture.

v0.4 (Aug 04, 2011):
- Bugfix: liberate allied/friend cities after capture
- Feature: units retreating under heavy casualties or from cities about to be captured
- Feature: update text description for buildings to reflect game mechanism
- Feature: units and building restrictions
- Feature: updated promotions
	- Heal = Combat Medics : -10% personnel needed to reinforce the unit
	- March = Field Hospital : -30% personnel needed to reinforce the unit
	- Repair and Air Repair : -20% materiel needed to reinforce the unit
	- Supply : -20% materiel and -30% personnel needed to reinforce the unit
- Test: Promotions for special force on Foreign Legion, can paradrop (20 tiles) only from cities

v0.3 (Jul 29, 2011):
- Code: major rewrite of the code related to saving/loading data tables, now save only once per turn and just before saving game. As a result, the advanced save menu is overridden by the mod (auto-named save file). 
- Bugfix: Ju 88 can be build without crashing the game...

v0.2 (Jul 28, 2011):
- Feature: added the base of the reinforcement gameplay, units will need personnel and materiel to "heal", the personnel/materiel ratio depend of the unit type, some buildings give bonus
- Tweak : Max Hit Points for units down to 50 as units can heal now (up to 5hp/turn if you have the needed reinforcements)
- Feature: better placement system for initial order of battle. Still to play test, nothing really balanced
- Feature: research new units via projects (2 units and 2 projects added, one for France and one for Germany, can be researched in cities with military academy)
- Feature: notification before declaring war (5 and 1 turn before). This is only for the DoW programmed from the player, it does not notify when another civ is going to DoW on you. 
- Feature: display real date (but most scripted events are not linked to the real time line yet)
- Include: Flag promotion mod (v.3 updated to last civilization patch)
- Bugfix: icon and city name of Swiss where broken for some players
- Bugfix: "ghost" of initial units were left in cities
- Bugfix: units renaming could use a bad number
- Gameplay fix: as the game engine consider embarked units as land units with low strength, bomber could one shoot them almost every time, even with the maritime malus. So embarked unit strength is raised, but the mod give all land units a strong penalty against Sea when embarked
- Tweak: name of Italian fighter and bomber squadron


v0.1 (Jul 16, 2011):
- initial release



---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Formatted presentation for Steam Workshop
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

[h1]R.E.D. WWII Edition is a total conversion wargame[/h1]
[quote][list]
[*]Frontline: units can capture tiles (or liberate your allied/friends tiles)
[*]Supply lines: units that are not connected to a city won't get reinforcement and a malus in combat
[*]Fuel: oil is stockpiled and some units are rationed when reserve are low with malus in movement and combat.  
[*]Reinforcements: personnel and materiel are needed to 'heal' your units.
[*]Retreat: units will retreat under heavy casualties.
[*]National units: each great power have it's own set of units models
[*]Convoy: automated naval units bringing resources, gold or new units to your coastal cities
[*]Hotseat supported
[/list][/quote]

[h1]Important Note[/h1]
[quote]The [url=http://steamcommunity.com/workshop/filedetails/?id=75520782]R.E.D. WWII Data Files[/url] mod must be activated to play this.

All other mods and most DLC will be automatically deactivated to prevent potential incompatibilities. A few mods are marked as authorized.

This mod use a custom DLL and so can only be used on Windows but you can found an older and Mac compatible version (v. 31 beta 4 with less advanced features) [url=forums.civfanatics.com/showpost.php?p=11745831&postcount=4]on civfanatics[/url]

New versions may brake saved games, always finish your previous game before updating
[/quote]

[h1]Installation[/h1]
[quote]
[olist]
[*] Click the 'subscribe' button and go back in game, in the mod section, it will be downloaded automatically.
[*] Disable all DLC (except the Mongol DLC) and any unhautorised mods. Don't worry, if you forgot to do it, the mod will deactivate theim and reinitialize to the main menu.
[*] Once downloaded, click the checkbox on the right of the mod line to enabled it.
[*] Get the [url=http://steamcommunity.com/sharedfiles/filedetails/?id=75520782 ]R.E.D. WWII Data Files mod[/url]  
[*] Once you've enabled the 2 R.E.D. WWII mods click 'NEXT'
[*] Click 'SINGLE PLAYER' then 'CUSTOM GAME', select 'R.E.D. WWII Edition' in the list and click 'LOAD MOD' (this step will be automated after your first game)
[*] At this point the mod will deactivate all DLC and mods that are not required and will navigate back to the main menu if needed, just go in the mods menu and do step 5-6 again (this step will be automated after your first game)
[*] Select a scenario or load a previously saved game (note that new version may break save games, always finish your game before updating)
[/olist]

[h1]PLEASE READ AND USE THE THREAD IN THE DISCUSSION SECTION IF YOU NEED HELP, COMMENTS RELATED TO INSTALLATION PROBLEMS MAY BE IGNORED.[/h1]

See also [url=http://forums.civfanatics.com/showthread.php?t=472345 ]Installation instructions and troubleshooting[/url] on CivFanatics

The mod copy files in the game's folder to prevent a crash when disabling the DLCs. To uninstall, or [b]if you downgrade to a previous version[/b], delete the [b]RED_WWII[/b] folder in [i]"..Steam\steamapps\common\sid meier's civilization v\Assets\DLC"[/i]
[/quote]

[h1]Scenarios[/h1]
[quote]Some scenarios have been disabled because they have not been updated since a long time and may cause bugs and crashes, now that you are warned, you can enable them following the instructions [url=http://steamcommunity.com/workshop/filedetails/discussion/75522294/617336568075278406/]here[/url]
[list]
[*][b]Stalingrad[/b] (map size: small) : Play as Germany or U.S.S.R. for the control of Stalingrad
[*][b]Europe 1939-1945[/b] (map size : large) : Play as Germany, Greece, Italy, France, U.K. or U.S.S.R. on the European and North African theatre.
[/list]
[/quote]

[h1]Feedback, bug reports and detailled informations[/h1]
[quote][url=http://forums.civfanatics.com/forumdisplay.php?f=471 ]R.E.D. WWII subforum on Civfanatics[/url]
[url=http://forums.civfanatics.com/showthread.php?t=484955 ]Credits list[/url][/quote]