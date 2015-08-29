/*

	R.E.D. WWII Edition
	Default Units Define.
	by Gedemon (2013)
	
	MUST BE LOADED AFTER Promotions tables	
	MUST BE LOADED BEFORE all other units tables

*/

--------------------------------------------------------------
-- Reinitialize Units table with Civ 5 vanilla units
--------------------------------------------------------------

DROP TABLE IF EXISTS Units;

CREATE TABLE Units (	'ID' integer primary key autoincrement , 'Type' text  not null unique , 'Description' text , 'Civilopedia' text , 'Strategy' text ,	'Help' text , 'Requirements' text , 'Combat' integer default 0 ,
						'RangedCombat' integer default 0 , 'Cost' integer default 0 , 'Moves' integer default 0 , 'Immobile' boolean default 0 , 'Range' integer default 0 , 'BaseSightRange' integer default 2 ,
						'Class' text default NULL , 'Special' text default NULL , 'Capture' text default NULL , 'CombatClass' text default NULL , 'Domain' text default NULL , 'CivilianAttackPriority' text default NULL ,
						'DefaultUnitAI' text default NULL , 'Food' boolean default 0 , 'NoBadGoodies' boolean default 0 , 'RivalTerritory' boolean default 0 , 'MilitarySupport' boolean default 0 ,
						'MilitaryProduction' boolean default 0 , 'Pillage' boolean default 0 , 'Found' boolean default 0 , 'FoundAbroad' boolean default 0 , 'CultureBombRadius' integer default 0 ,
						'GoldenAgeTurns' integer default 0 , 'IgnoreBuildingDefense' boolean default 0 , 'PrereqResources' boolean default 0 , 'Mechanized' boolean default 0 , 'Suicide' boolean default 0 ,
						'CaptureWhileEmbarked' boolean default 0 , 'PrereqTech' text default NULL , 'ObsoleteTech' text default NULL , 'GoodyHutUpgradeUnitClass' text default NULL , 'HurryCostModifier' integer default 0 ,
						'AdvancedStartCost' integer default 0 , 'MinAreaSize' integer default '-1' , 'AirUnitCap' integer default 0 , 'NukeDamageLevel' integer default '-1' , 'WorkRate' integer default 0 ,
						'NumFreeTechs' integer default 0 , 'RushBuilding' boolean default 0 , 'BaseHurry' integer default 0 , 'HurryMultiplier' integer default 0 , 'BaseGold' integer default 0 ,
						'NumGoldPerEra' integer default 0 , 'SpreadReligion' boolean default 0 , 'IsReligious' boolean default 0 , 'CombatLimit' integer default 100 , 'RangeAttackOnlyInDomain' boolean default 0 ,
						'RangeAttackIgnoreLOS' boolean default 0 , 'RangedCombatLimit' integer default 0 , 'XPValueAttack' integer default 0 , 'XPValueDefense' integer default 0 , 'SpecialCargo' text default NULL ,
						'DomainCargo' text default NULL , 'Conscription' integer default 0 , 'ExtraMaintenanceCost' integer default 0 , 'NoMaintenance' boolean default 0 , 'Unhappiness' integer default 0 ,
						'UnitArtInfo' text default NULL , 'UnitArtInfoCulturalVariation' boolean default 0 , 'UnitArtInfoEraVariation' boolean default 0 , 'ProjectPrereq' text default NULL ,
						'SpaceshipProject' text default NULL , 'LeaderPromotion' text default NULL , 'LeaderExperience' integer default 0 , 'DontShowYields' boolean default 0 , 'ShowInPedia' boolean default 1 ,
						'MoveRate' text default 'BIPED' , 'UnitFlagIconOffset' integer default 0 , 'PortraitIndex' integer default '-1' , 'IconAtlas' text default NULL , 'UnitFlagAtlas' text default 'UNIT_FLAG_ATLAS' ,
						'Materiel' integer not null default 10, 'Personnel' integer not null default 10, 'FuelConsumption' integer not null default 0, 'KeyName' text not null unique, 
						
						foreign key (Description) references Language_en_US(Tag), foreign key (Civilopedia) references Language_en_US(Tag), foreign key (Strategy) references Language_en_US(Tag),
						foreign key (Help) references Language_en_US(Tag), foreign key (Class) references UnitClasses(Type), foreign key (Special) references SpecialUnits(Type),
						foreign key (Capture) references UnitClasses(Type), foreign key (CombatClass) references UnitCombatInfos(Type), foreign key (Domain) references Domains(Type),
						foreign key (DefaultUnitAI) references UnitAIInfos(Type), foreign key (PrereqTech) references Technologies(Type), foreign key (ObsoleteTech) references Technologies(Type),
						foreign key (GoodyHutUpgradeUnitClass) references UnitClasses(Type), foreign key (SpecialCargo) references SpecialUnits(Type), foreign key (DomainCargo) references Domains(Type),
						foreign key (ProjectPrereq) references Projects(Type), foreign key (SpaceshipProject) references Projects(Type), foreign key (LeaderPromotion) references UnitPromotions(Type),
						foreign key (MoveRate) references MovementRates(Type), foreign key (IconAtlas) references IconTextureAtlases(Atlas), foreign key (UnitFlagAtlas) references IconTextureAtlases(Atlas)
					);
					
					
INSERT INTO Units (	KeyName, Combat, RangedCombat, Cost, Moves, Immobile, Range, BaseSightRange, Materiel, Personnel, FuelConsumption, Class, UnitFlagIconOffset, PortraitIndex, IconAtlas, UnitFlagAtlas, Special, Type, Description, Civilopedia, Strategy, Help, Requirements, Capture, CombatClass, Domain, CivilianAttackPriority, DefaultUnitAI, Food, NoBadGoodies, RivalTerritory, MilitarySupport, MilitaryProduction, Pillage, Found, FoundAbroad, CultureBombRadius, GoldenAgeTurns, IgnoreBuildingDefense, PrereqResources, Mechanized, Suicide, CaptureWhileEmbarked, PrereqTech, ObsoleteTech, GoodyHutUpgradeUnitClass, HurryCostModifier, AdvancedStartCost, MinAreaSize, AirUnitCap, NukeDamageLevel, WorkRate, NumFreeTechs, RushBuilding, BaseHurry, HurryMultiplier, BaseGold, NumGoldPerEra, SpreadReligion, CombatLimit, RangeAttackOnlyInDomain, RangeAttackIgnoreLOS, RangedCombatLimit, XPValueAttack, XPValueDefense, SpecialCargo, DomainCargo, Conscription, ExtraMaintenanceCost, NoMaintenance, Unhappiness,	UnitArtInfo, UnitArtInfoCulturalVariation, UnitArtInfoEraVariation, ProjectPrereq, SpaceshipProject, LeaderPromotion, LeaderExperience, DontShowYields, ShowInPedia, MoveRate)
--		Key name 				combat	rngcbt	cost	move	immo	range	sight	mat		pers	fuel	class							FlagIdx		IcIdx	IconAtlas		FlagAtlas			special					Type						Description							Civilopedia										Strategy										Help									Req.	capture	CombatClass				Domain			AttPrio		AI					fd		nbg		rt		ms		mp		p		f		fa		cb		ga		ibd		pr		mec		s		cwe		Tech	obsol.	ghuuc	hcm		as		mas		auc		ndl		wr		nft		rb		bh		hm		bg		nge		sr		cl		raod	rail	rcl		xpa		xpd		specialcargo			domaincargo		c		emc		nm		u		UnitArtInfo								uaicv	uaiev	projectprerequ				sp		lp		lxp		dsy		sip		moverate																																																																													
SELECT	'SETTLER',				0,		0,		-1,		2,		0,		0,		3,		0,		0,		0,		'UNITCLASS_SETTLER',			0,			0,		'UNIT_ATLAS_1',	'UNIT_FLAG_ATLAS',	NULL,					'UNIT_SETTLER',				'TXT_KEY_UNIT_SETTLER',				'TXT_KEY_CIV5_ANTIQUITY_SETTLER_TEXT',			'TXT_KEY_UNIT_SETTLER_STRATEGY',				'TXT_KEY_UNIT_HELP_SETTLER',			NULL,	NULL,	NULL,					'DOMAIN_LAND',	NULL,	'UNITAI_SETTLE',		1,		0,		0,		0,		0,		0,		1,		0,		0,		0,		0,		0,		0,		0,		0,		NULL,	NULL,	NULL,	20,		0,		-1,		0,		-1,		0,		0,		0,		0,		0,		0,		0,		0,		0,		0,		0,		0,		0,		0,		NULL,					NULL,			0,		0,		0,		0,		'ART_DEF_UNIT__SETTLER',				0,		0,		NULL,						NULL,	NULL,	0,		0,		1,		'BIPED'			UNION ALL
SELECT	'CARRIER',				30,		0,		500,	5,		0,		0,		2,		20,		15,		15,		'UNITCLASS_CARRIER',			70,			23,		'UNIT_ATLAS_2',	'UNIT_FLAG_ATLAS',	NULL,					'UNIT_CARRIER',				'TXT_KEY_UNIT_CARRIER',				'TXT_KEY_CIV5_INDUSTRIAL_CARRIER_TEXT',			'TXT_KEY_UNIT_CARRIER_STRATEGY',				'TXT_KEY_UNIT_HELP_CARRIER',			NULL,	NULL,	'UNITCOMBAT_NAVAL',		'DOMAIN_SEA',	NULL,	'UNITAI_CARRIER_SEA',	0,		0,		0,		1,		1,		1,		0,		0,		0,		0,		1,		0,		1,		0,		0,		NULL,	NULL,	NULL,	0,		60,		20,		0,		-1,		0,		0,		0,		0,		0,		0,		0,		0,		100,	0,		0,		0,		3,		3,		'SPECIALUNIT_EMBARKED',	'DOMAIN_AIR',	0,		0,		0,		0,		'ART_DEF_UNIT_CARRIER',					0,		0,		NULL,						NULL,	NULL,	0,		0,		1,		'BOAT'			UNION ALL
SELECT	'BATTLESHIP',			60,		42,		550,	4,		0,		1,		2,		25,		15,		15,		'UNITCLASS_BATTLESHIP',			68,			21,		'UNIT_ATLAS_2',	'UNIT_FLAG_ATLAS',	NULL,					'UNIT_BATTLESHIP',			'TXT_KEY_UNIT_BATTLESHIP',			'TXT_KEY_CIV5_INDUSTRIAL_BATTLESHIP_TEXT',		'TXT_KEY_UNIT_BATTLESHIP_STRATEGY',				'TXT_KEY_UNIT_HELP_BATTLESHIP',			NULL,	NULL,	'UNITCOMBAT_NAVAL',		'DOMAIN_SEA',	NULL,	'UNITAI_ATTACK_SEA',	0,		0,		0,		1,		1,		1,		0,		0,		0,		0,		1,		0,		1,		0,		0,		NULL,	NULL,	NULL,	0,		60,		20,		0,		-1,		0,		0,		0,		0,		0,		0,		0,		0,		100,	0,		0,		0,		3,		3,		NULL,					NULL,			0,		0,		0,		0,		'ART_DEF_UNIT_BATTLESHIP',				0,		0,		NULL,						NULL,	NULL,	0,		0,		1,		'BOAT'			UNION ALL
SELECT	'SUBMARINE',			25,		30,		300,	5,		0,		1,		2,		17,		3,		4,		'UNITCLASS_SUBMARINE',			69,			22,		'UNIT_ATLAS_2',	'UNIT_FLAG_ATLAS',	NULL,					'UNIT_SUBMARINE',			'TXT_KEY_UNIT_SUBMARINE',			'TXT_KEY_CIV5_INDUSTRIAL_SUBMARINE_TEXT',		'TXT_KEY_UNIT_SUBMARINE_STRATEGY',				'TXT_KEY_UNIT_HELP_SUBMARINE',			NULL,	NULL,	'UNITCOMBAT_NAVAL',		'DOMAIN_SEA',	NULL,	'UNITAI_ATTACK_SEA',	0,		0,		0,		1,		1,		1,		0,		0,		0,		0,		1,		0,		1,		0,		0,		NULL,	NULL,	NULL,	0,		60,		20,		0,		-1,		0,		0,		0,		0,		0,		0,		0,		0,		100,	1,		0,		0,		3,		3,		NULL,					NULL,			0,		0,		0,		0,		'ART_DEF_UNIT_SUBMARINE',				0,		0,		NULL,						NULL,	NULL,	0,		0,		1,		'SUB'			UNION ALL
SELECT	'DESTROYER',			35,		22,		375,	8,		0,		1,		2,		15,		5,		5,		'UNITCLASS_DESTROYER',			67,			20,		'UNIT_ATLAS_2',	'UNIT_FLAG_ATLAS',	NULL,					'UNIT_DESTROYER',			'TXT_KEY_UNIT_DESTROYER',			'TXT_KEY_CIV5_INDUSTRIAL_DESTROYER_TEXT',		'TXT_KEY_UNIT_DESTROYER_STRATEGY',				'TXT_KEY_UNIT_HELP_DESTROYER',			NULL,	NULL,	'UNITCOMBAT_NAVAL',		'DOMAIN_SEA',	NULL,	'UNITAI_ATTACK_SEA',	0,		0,		0,		1,		1,		1,		0,		0,		0,		0,		1,		0,		1,		0,		0,		NULL,	NULL,	NULL,	0,		60,		20,		0,		-1,		0,		0,		0,		0,		0,		0,		0,		0,		100,	0,		0,		0,		3,		3,		NULL,					NULL,			0,		0,		0,		0,		'ART_DEF_UNIT_DESTROYER',				0,		0,		NULL,						NULL,	NULL,	0,		0,		1,		'BOAT'			UNION ALL
SELECT	'ATOMIC_BOMB',			0,		0,		600,	2,		1,		16,		2,		0,		0,		0,		'UNITCLASS_ATOMIC_BOMB',		71,			24,		'UNIT_ATLAS_2',	'UNIT_FLAG_ATLAS',	'SPECIALUNIT_LANDBASED','UNIT_ATOMIC_BOMB',			'TXT_KEY_UNIT_ATOMIC_BOMB',			'TXT_KEY_CIV5_INDUSTRIAL_ATOMICBOMB_TEXT',		'TXT_KEY_UNIT_ATOMIC_BOMB_STRATEGY',			'TXT_KEY_UNIT_HELP_ATOMIC_BOMB',		NULL,	NULL,	NULL,					'DOMAIN_AIR',	NULL,	'UNITAI_ICBM',			0,		0,		0,		1,		1,		0,		0,		0,		0,		0,		1,		0,		1,		1,		0,		NULL,	NULL,	NULL,	0,		60,		-1,		0,		1,		0,		0,		0,		0,		0,		0,		0,		0,		0,		0,		0,		100,	0,		2,		NULL,					NULL,			0,		0,		0,		0,		'ART_DEF_UNIT_ATOMIC_BOMB',				0,		0,		'PROJECT_MANHATTAN_PROJECT',NULL,	NULL,	0,		0,		1,		'AIR_REBASE'	UNION ALL
SELECT	'BOMBER',				0,		50,		450,	2,		1,		14,		2,		24,		3,		10,		'UNITCLASS_BOMBER',				64,			18,		'UNIT_ATLAS_2',	'UNIT_FLAG_ATLAS',	'SPECIALUNIT_LANDBASED','UNIT_BOMBER',				'TXT_KEY_UNIT_BOMBER',				'TXT_KEY_CIV5_INDUSTRIAL_BOMBER_TEXT',			'TXT_KEY_UNIT_BOMBER_STRATEGY',					'TXT_KEY_UNIT_HELP_BOMBER',				NULL,	NULL,	'UNITCOMBAT_BOMBER',	'DOMAIN_AIR',	NULL,	'UNITAI_ATTACK_AIR',	0,		0,		0,		1,		1,		0,		0,		0,		0,		0,		1,		0,		1,		0,		0,		NULL,	NULL,	NULL,	0,		50,		-1,		1,		-1,		0,		0,		0,		0,		0,		0,		0,		0,		0,		0,		0,		100,	3,		2,		NULL,					NULL,			0,		0,		0,		0,		'ART_DEF_UNIT_BOMBER',					0,		0,		NULL,						NULL,	NULL,	0,		0,		1,		'AIR_REBASE'	UNION ALL
SELECT	'FIGHTER',				0,		40,		375,	2,		1,		10,		2,		17,		3,		5,		'UNITCLASS_FIGHTER',			62,			17,		'UNIT_ATLAS_2',	'UNIT_FLAG_ATLAS',	'SPECIALUNIT_LANDBASED','UNIT_FIGHTER',				'TXT_KEY_UNIT_FIGHTER',				'TXT_KEY_CIV5_INDUSTRIAL_FIGHTER_TEXT',			'TXT_KEY_UNIT_FIGHTER_STRATEGY',				'TXT_KEY_UNIT_HELP_FIGHTER',			NULL,	NULL,	'UNITCOMBAT_FIGHTER',	'DOMAIN_AIR',	NULL,	'UNITAI_DEFENSE_AIR',	0,		0,		0,		1,		1,		0,		0,		0,		0,		0,		1,		0,		1,		0,		0,		NULL,	NULL,	NULL,	0,		50,		-1,		1,		-1,		0,		0,		0,		0,		0,		0,		0,		0,		0,		0,		0,		100,	3,		2,		NULL,					NULL,			0,		0,		0,		0,		'ART_DEF_UNIT_FIGHTER',					0,		0,		NULL,						NULL,	NULL,	0,		0,		1,		'AIR_REBASE'	UNION ALL
SELECT	'TANK',					50,		0,		375,	5,		0,		0,		2,		16,		4,		5,		'UNITCLASS_TANK',				1,			13,		'UNIT_ATLAS_2',	'WW2_UNIT_FLAGS',	NULL,					'UNIT_TANK',				'TXT_KEY_UNIT_TANK',				'TXT_KEY_CIV5_INDUSTRIAL_TANK_TEXT',			'TXT_KEY_UNIT_TANK_STRATEGY',					'TXT_KEY_UNIT_HELP_TANK',				NULL,	NULL,	'UNITCOMBAT_ARMOR',		'DOMAIN_LAND',	NULL,	'UNITAI_FAST_ATTACK',	0,		0,		0,		1,		1,		1,		0,		0,		0,		0,		1,		0,		1,		0,		0,		NULL,	NULL,	NULL,	0,		50,		-1,		0,		-1,		0,		0,		0,		0,		0,		0,		0,		0,		100,	0,		0,		0,		3,		3,		NULL,					NULL,			0,		0,		0,		0,		'ART_DEF_UNIT_TANK',					0,		0,		NULL,						NULL,	NULL,	0,		0,		1,		'WHEELED'		UNION ALL
SELECT	'ANTI_AIRCRAFT_GUN',	20,		0,		270,	2,		0,		0,		2,		10,		10,		0,		'UNITCLASS_ANTI_AIRCRAFT_GUN',	22,			16,		'UNIT_ATLAS_2',	'WW2_UNIT_FLAGS',	NULL,					'UNIT_ANTI_AIRCRAFT_GUN',	'TXT_KEY_UNIT_ANTI_AIRCRAFT_GUN',	'TXT_KEY_CIV5_INDUSTRIAL_ANTIAIRCRAFTGUN_TEXT',	'TXT_KEY_UNIT_ANTI_AIRCRAFT_STRATEGY',			'TXT_KEY_UNIT_HELP_ANTI_AIRCRAFT_GUN',	NULL,	NULL,	'UNITCOMBAT_GUN',		'DOMAIN_LAND',	NULL,	'UNITAI_COUNTER',		0,		0,		0,		1,		1,		0,		0,		0,		0,		0,		1,		0,		0,		0,		0,		NULL,	NULL,	NULL,	0,		35,		-1,		0,		-1,		0,		0,		0,		0,		0,		0,		0,		0,		100,	0,		0,		0,		3,		3,		NULL,					NULL,			5,		0,		0,		0,		'ART_DEF_UNIT_ANTI_AIRCRAFT_GUN',		0,		0,		NULL,						NULL,	NULL,	0,		0,		1,		'WHEELED'		UNION ALL
SELECT	'FIELD_GUN',			16,		60,		280,	2,		0,		1,		2,		10,		10,		0,		'UNITCLASS_FIELD_GUN',			25,			15,		'UNIT_ATLAS_2',	'WW2_UNIT_FLAGS',	NULL,					'UNIT_FIELD_GUN',			'TXT_KEY_UNIT_AT_GUN',				'TXT_KEY_CIV5_INDUSTRIAL_ANTITANKGUN_TEXT',		'TXT_KEY_UNIT_AT_GUN_STRATEGY',					'TXT_KEY_UNIT_HELP_FIELD_GUN',			NULL,	NULL,	'UNITCOMBAT_SIEGE',		'DOMAIN_LAND',	NULL,	'UNITAI_CITY_BOMBARD',	0,		0,		0,		1,		1,		0,		0,		0,		0,		0,		1,		0,		0,		0,		0,		NULL,	NULL,	NULL,	0,		35,		-1,		0,		-1,		0,		0,		0,		0,		0,		0,		0,		0,		100,	0,		0,		0,		3,		3,		NULL,					NULL,			1,		0,		0,		0,		'ART_DEF_UNIT_FIELD_GUN',				0,		0,		NULL,						NULL,	NULL,	0,		0,		1,		'ARTILLERY'		UNION ALL
SELECT	'ARTILLERY',			14,		40,		290,	2,		0,		1,		2,		10,		10,		0,		'UNITCLASS_ARTILLERY',			11,			12,		'UNIT_ATLAS_2',	'WW2_UNIT_FLAGS',	NULL,					'UNIT_ARTILLERY',			'TXT_KEY_UNIT_ARTILLERY',			'TXT_KEY_CIV5_INDUSTRIAL_ARTILLERY_TEXT',		'TXT_KEY_UNIT_ARTILLERY_STRATEGY',				'TXT_KEY_UNIT_HELP_ARTILLERY',			NULL,	NULL,	'UNITCOMBAT_SIEGE',		'DOMAIN_LAND',	NULL,	'UNITAI_CITY_BOMBARD',	0,		0,		0,		1,		1,		0,		0,		0,		0,		0,		1,		0,		1,		0,		0,		NULL,	NULL,	NULL,	0,		40,		-1,		0,		-1,		0,		0,		0,		0,		0,		0,		0,		0,		100,	0,		0,		0,		3,		3,		NULL,					NULL,			0,		0,		0,		0,		'ART_DEF_UNIT_ARTILLERY',				0,		0,		NULL,						NULL,	NULL,	0,		0,		1,		'ARTILLERY'		UNION ALL
SELECT	'INFANTRY',				36,		0,		200,	2,		0,		0,		2,		1,		15,		0,		'UNITCLASS_INFANTRY',			0,			11,		'UNIT_ATLAS_2',	'WW2_UNIT_FLAGS',	NULL,					'UNIT_INFANTRY',			'TXT_KEY_UNIT_INFANTRY',			'TXT_KEY_CIV5_INDUSTRIAL_INFANTRY_TEXT',		'TXT_KEY_UNIT_INFANTRY_STRATEGY',				'TXT_KEY_UNIT_HELP_INFANTRY',			NULL,	NULL,	'UNITCOMBAT_GUN',		'DOMAIN_LAND',	NULL,	'UNITAI_DEFENSE',		0,		0,		0,		1,		1,		1,		0,		0,		0,		0,		1,		0,		0,		0,		0,		NULL,	NULL,	NULL,	0,		35,		-1,		0,		-1,		0,		0,		0,		0,		0,		0,		0,		0,		100,	0,		0,		0,		3,		3,		NULL,					NULL,			6,		0,		0,		0,		'ART_DEF_UNIT_INFANTRY',				0,		0,		NULL,						NULL,	NULL,	0,		0,		1,		'BIPED'			UNION ALL
SELECT	'PARATROOPER',			42,		0,		375,	2,		0,		0,		2,		2,		25,		0,		'UNITCLASS_PARATROOPER',		4,			11,		'UNIT_ATLAS_2',	'WW2_UNIT_FLAGS',	NULL,					'UNIT_PARATROOPER',			'TXT_KEY_UNIT_PARATROOPER',			'TXT_KEY_CIV5_INDUSTRIAL_PARATROOPER_TEXT',		'TXT_KEY_UNIT_PARATROOPER_STRATEGY',			'TXT_KEY_UNIT_HELP_PARATROOPER',		NULL,	NULL,	'UNITCOMBAT_GUN',		'DOMAIN_LAND',	NULL,	'UNITAI_DEFENSE',		0,		0,		0,		1,		1,		1,		0,		0,		0,		0,		1,		0,		0,		0,		0,		NULL,	NULL,	NULL,	0,		35,		-1,		0,		-1,		0,		0,		0,		0,		0,		0,		0,		0,		100,	0,		0,		0,		3,		3,		NULL,					NULL,			6,		0,		0,		0,		'ART_DEF_UNIT_PARATROOPER',				0,		0,		NULL,						NULL,	NULL,	0,		0,		1,		'BIPED'			UNION ALL
SELECT	'CONVOY',				25,		0,		-1,		4,		0,		1,		2,		0,		0,		0,		'UNITCLASS_CONVOY',				53,			10,		'UNIT_ATLAS_2',	'UNIT_FLAG_ATLAS',	NULL,					'UNIT_CONVOY',				'TXT_KEY_UNIT_CONVOY',				'TXT_KEY_CIV5_INDUSTRIAL_CONVOY_TEXT',			'TXT_KEY_UNIT_CONVOY_STRATEGY',					'TXT_KEY_UNIT_HELP_CONVOY',				NULL,	NULL,	'UNITCOMBAT_NAVAL',		'DOMAIN_SEA',	NULL,	'UNITAI_TREASURE',		0,		0,		0,		0,		0,		0,		0,		0,		0,		0,		1,		0,		1,		0,		0,		NULL,	NULL,	NULL,	0,		60,		20,		0,		-1,		0,		0,		0,		0,		0,		0,		0,		0,		100,	0,		0,		0,		3,		3,		NULL,					NULL,			0,		0,		0,		0,		'ART_DEF_UNIT_TRANSPORT',				0,		0,		NULL,						NULL,	NULL,	0,		0,		1,		'BOAT'			UNION ALL
SELECT	'FORTIFIED_GUN',		40,		75,		-1,		0,		0,		1,		1,		15,		15,		0,		'UNITCLASS_FORTIFIED_GUN',		18,			15,		'UNIT_ATLAS_2',	'WW2_UNIT_FLAGS',	NULL,					'UNIT_FORTIFIED_GUN',		'TXT_KEY_UNIT_FORTIFIED_GUN',		'TXT_KEY_CIV5_INDUSTRIAL_ANTITANKGUN_TEXT',		'TXT_KEY_UNIT_FORTIFIED_GUN_STRATEGY',			'TXT_KEY_UNIT_HELP_FORTIFIED_GUN',		NULL,	NULL,	'UNITCOMBAT_SIEGE',		'DOMAIN_LAND',	NULL,	'UNITAI_CITY_BOMBARD',	0,		0,		0,		0,		1,		0,		0,		0,		0,		0,		1,		0,		0,		0,		0,		NULL,	NULL,	NULL,	0,		35,		-1,		0,		-1,		0,		0,		0,		0,		0,		0,		0,		0,		100,	0,		0,		0,		3,		3,		NULL,					NULL,			1,		0,		0,		0,		'ART_DEF_UNIT_FIELD_GUN',				0,		0,		NULL,						NULL,	NULL,	0,		0,		1,		'ARTILLERY'		UNION ALL
SELECT	'AIRFIELD',				0,		0,		-1,		0,		1,		0,		1,		15,		15,		0,		'UNITCLASS_AIRFIELD',			9,			10,		'BW_ATLAS_1',	'WW2_UNIT_FLAGS',	NULL,					'UNIT_AIRFIELD',			'TXT_KEY_UNIT_AIRFIELD',			'TXT_KEY_CIV5_INDUSTRIAL_AIRFIELD_TEXT',		'TXT_KEY_UNIT_AIRFIELD_STRATEGY',				'TXT_KEY_UNIT_HELP_AIRFIELD',			NULL,	NULL,	NULL,					'DOMAIN_LAND',	NULL,	'UNITAI_CARRIER_SEA',	0,		0,		0,		1,		1,		1,		0,		0,		0,		0,		1,		0,		1,		0,		0,		NULL,	NULL,	NULL,	0,		60,		20,		0,		-1,		0,		0,		0,		0,		0,		0,		0,		0,		100,	0,		0,		0,		3,		3,		NULL,					'DOMAIN_AIR',	0,		0,		0,		0,		'ART_DEF_UNIT__SETTLER',				0,		0,		NULL,						NULL,	NULL,	0,		0,		1,		'BIPED';--		UNION ALL


-- Reset default classes...
DROP TABLE IF EXISTS "UnitClasses";
CREATE TABLE UnitClasses ('ID' integer primary key autoincrement , 'Type' text  not null unique , 'Description' text , 'MaxGlobalInstances' integer default '-1' , 'MaxTeamInstances' integer default '-1' , 'MaxPlayerInstances' integer default '-1' , 'InstanceCostModifier' integer default 0 , 'DefaultUnit' text );
INSERT INTO UnitClasses (Type, Description, MaxGlobalInstances, MaxTeamInstances, MaxPlayerInstances, InstanceCostModifier, DefaultUnit)
	SELECT 'UNITCLASS_' || KeyName, Description, -1, -1, -1, 0, 'UNIT_' || KeyName
	FROM Units;
	
-- Features from the tables below are (or will be) handled in Lua...
DELETE FROM Unit_ResourceQuantityRequirements;
DELETE FROM Unit_BuildingClassRequireds;
DELETE FROM Unit_ClassUpgrades;

-- Reset unit class override (defined in "Update New Units Table.sql")
DELETE FROM Civilization_UnitClassOverrides;

-- Add new type to special unit table (to handle embarked units)
INSERT INTO SpecialUnits (Type, Description, Valid, CityLoad)	VALUES ('SPECIALUNIT_LANDBASED', 'TXT_KEY_SPECIALUNIT_FIGHTER', 1, 1);
INSERT INTO SpecialUnits (Type, Description, Valid, CityLoad)	VALUES ('SPECIALUNIT_EMBARKED', 'TXT_KEY_SPECIALUNIT_FIGHTER', 1, 1);	

-- Change Strategic View Icons
--REPLACE INTO "ArtDefine_StrategicView" VALUES('ART_DEF_UNIT_INFANTRY','Unit','SV_Blank.dds');

-- Make convoy "high priority" target for the AI
UPDATE Units SET CivilianAttackPriority ='CIVILIAN_ATTACK_PRIORITY_HIGH' WHERE Type = 'UNIT_CONVOY';

--------------------------------------------------------------
-- Reset flavors
--------------------------------------------------------------
DROP TABLE IF EXISTS Unit_Flavors; -- Recreate the table to set (UnitType, FlavorType) as Primary Key (prevent duplicate entries when updating flavors for class, sub-classes and units)
CREATE TABLE Unit_Flavors ('UnitType' text  not null, 'FlavorType' text  not null, 'Flavor' integer  not null , PRIMARY KEY (UnitType, FlavorType), foreign key (UnitType) references Units(Type), foreign key (FlavorType) references Flavors(Type));

INSERT INTO Unit_Flavors (UnitType, FlavorType, Flavor)	VALUES ('UNIT_PARATROOPER',			'FLAVOR_AIR',			3);
INSERT INTO Unit_Flavors (UnitType, FlavorType, Flavor)	VALUES ('UNIT_PARATROOPER',			'FLAVOR_DEFENSE',		7);
INSERT INTO Unit_Flavors (UnitType, FlavorType, Flavor)	VALUES ('UNIT_PARATROOPER',			'FLAVOR_OFFENSE',		14);
INSERT INTO Unit_Flavors (UnitType, FlavorType, Flavor)	VALUES ('UNIT_PARATROOPER',			'FLAVOR_NAVAL_RECON',	3);

INSERT INTO Unit_Flavors (UnitType, FlavorType, Flavor)	VALUES ('UNIT_INFANTRY',			'FLAVOR_DEFENSE',		12);
INSERT INTO Unit_Flavors (UnitType, FlavorType, Flavor)	VALUES ('UNIT_INFANTRY',			'FLAVOR_OFFENSE',		12);

INSERT INTO Unit_Flavors (UnitType, FlavorType, Flavor)	VALUES ('UNIT_FIELD_GUN',			'FLAVOR_RANGED',		12);
INSERT INTO Unit_Flavors (UnitType, FlavorType, Flavor)	VALUES ('UNIT_FIELD_GUN',			'FLAVOR_DEFENSE',		7);
INSERT INTO Unit_Flavors (UnitType, FlavorType, Flavor)	VALUES ('UNIT_FIELD_GUN',			'FLAVOR_OFFENSE',		5);

INSERT INTO Unit_Flavors (UnitType, FlavorType, Flavor)	VALUES ('UNIT_ARTILLERY',			'FLAVOR_RANGED',		12);
INSERT INTO Unit_Flavors (UnitType, FlavorType, Flavor)	VALUES ('UNIT_ARTILLERY',			'FLAVOR_DEFENSE',		5);
INSERT INTO Unit_Flavors (UnitType, FlavorType, Flavor)	VALUES ('UNIT_ARTILLERY',			'FLAVOR_OFFENSE',		7);

INSERT INTO Unit_Flavors (UnitType, FlavorType, Flavor)	VALUES ('UNIT_TANK',				'FLAVOR_MOBILE',		10);
INSERT INTO Unit_Flavors (UnitType, FlavorType, Flavor)	VALUES ('UNIT_TANK',				'FLAVOR_DEFENSE',		9);
INSERT INTO Unit_Flavors (UnitType, FlavorType, Flavor)	VALUES ('UNIT_TANK',				'FLAVOR_OFFENSE',		12);

INSERT INTO Unit_Flavors (UnitType, FlavorType, Flavor)	VALUES ('UNIT_FIGHTER',				'FLAVOR_AIR',			12);
INSERT INTO Unit_Flavors (UnitType, FlavorType, Flavor)	VALUES ('UNIT_FIGHTER',				'FLAVOR_DEFENSE',		8);
INSERT INTO Unit_Flavors (UnitType, FlavorType, Flavor)	VALUES ('UNIT_FIGHTER',				'FLAVOR_OFFENSE',		8);
INSERT INTO Unit_Flavors (UnitType, FlavorType, Flavor)	VALUES ('UNIT_FIGHTER',				'FLAVOR_ANTIAIR',		20);

INSERT INTO Unit_Flavors (UnitType, FlavorType, Flavor)	VALUES ('UNIT_BOMBER',				'FLAVOR_AIR',			15);
INSERT INTO Unit_Flavors (UnitType, FlavorType, Flavor)	VALUES ('UNIT_BOMBER',				'FLAVOR_DEFENSE',		6);
INSERT INTO Unit_Flavors (UnitType, FlavorType, Flavor)	VALUES ('UNIT_BOMBER',				'FLAVOR_OFFENSE',		12);

INSERT INTO Unit_Flavors (UnitType, FlavorType, Flavor)	VALUES ('UNIT_ATOMIC_BOMB',			'FLAVOR_NUKE',			16);
INSERT INTO Unit_Flavors (UnitType, FlavorType, Flavor)	VALUES ('UNIT_ATOMIC_BOMB',			'FLAVOR_OFFENSE',		8);
INSERT INTO Unit_Flavors (UnitType, FlavorType, Flavor)	VALUES ('UNIT_ATOMIC_BOMB',			'FLAVOR_DEFENSE',		8);

INSERT INTO Unit_Flavors (UnitType, FlavorType, Flavor)	VALUES ('UNIT_ANTI_AIRCRAFT_GUN',	'FLAVOR_ANTIAIR',		6);
INSERT INTO Unit_Flavors (UnitType, FlavorType, Flavor)	VALUES ('UNIT_ANTI_AIRCRAFT_GUN',	'FLAVOR_DEFENSE',		4);

INSERT INTO Unit_Flavors (UnitType, FlavorType, Flavor)	VALUES ('UNIT_CARRIER',				'FLAVOR_AIR',			3);
INSERT INTO Unit_Flavors (UnitType, FlavorType, Flavor)	VALUES ('UNIT_CARRIER',				'FLAVOR_DEFENSE',		4);
INSERT INTO Unit_Flavors (UnitType, FlavorType, Flavor)	VALUES ('UNIT_CARRIER',				'FLAVOR_OFFENSE',		9);
INSERT INTO Unit_Flavors (UnitType, FlavorType, Flavor)	VALUES ('UNIT_CARRIER',				'FLAVOR_NAVAL',			7);

INSERT INTO Unit_Flavors (UnitType, FlavorType, Flavor)	VALUES ('UNIT_BATTLESHIP',			'FLAVOR_DEFENSE',		9);
INSERT INTO Unit_Flavors (UnitType, FlavorType, Flavor)	VALUES ('UNIT_BATTLESHIP',			'FLAVOR_OFFENSE',		9);
INSERT INTO Unit_Flavors (UnitType, FlavorType, Flavor)	VALUES ('UNIT_BATTLESHIP',			'FLAVOR_NAVAL',			9);

INSERT INTO Unit_Flavors (UnitType, FlavorType, Flavor)	VALUES ('UNIT_SUBMARINE',			'FLAVOR_NAVAL_RECON',	2);
INSERT INTO Unit_Flavors (UnitType, FlavorType, Flavor)	VALUES ('UNIT_SUBMARINE',			'FLAVOR_DEFENSE',		8);
INSERT INTO Unit_Flavors (UnitType, FlavorType, Flavor)	VALUES ('UNIT_SUBMARINE',			'FLAVOR_OFFENSE',		6);
INSERT INTO Unit_Flavors (UnitType, FlavorType, Flavor)	VALUES ('UNIT_SUBMARINE',			'FLAVOR_NAVAL',			8);

INSERT INTO Unit_Flavors (UnitType, FlavorType, Flavor)	VALUES ('UNIT_DESTROYER',			'FLAVOR_NAVAL_RECON',	4);
INSERT INTO Unit_Flavors (UnitType, FlavorType, Flavor)	VALUES ('UNIT_DESTROYER',			'FLAVOR_DEFENSE',		6);
INSERT INTO Unit_Flavors (UnitType, FlavorType, Flavor)	VALUES ('UNIT_DESTROYER',			'FLAVOR_OFFENSE',		6);
INSERT INTO Unit_Flavors (UnitType, FlavorType, Flavor)	VALUES ('UNIT_DESTROYER',			'FLAVOR_NAVAL',			7);

--------------------------------------------------------------
-- Change on promotions
--------------------------------------------------------------

-- Only one global free promotion for each unit / class !
DROP TABLE IF EXISTS Unit_FreePromotions;
CREATE TABLE Unit_FreePromotions ('UnitType' text not null unique , 'PromotionType' text , foreign key (UnitType) references Units(Type), foreign key (PromotionType) references UnitPromotions(Type));
INSERT INTO Unit_FreePromotions (UnitType, PromotionType)
	SELECT 'UNIT_' || KeyName, 'PROMOTION_' || KeyName
	FROM UnitPromotions JOIN Units ON (UnitPromotions.Type = 'PROMOTION_' || Units.KeyName);

-- Change to Prerequiste
--UPDATE UnitPromotions SET PromotionPrereqOr4 ='PROMOTION_LIGHT_TANK' WHERE Type = 'PROMOTION_MOBILITY'; -- to do: change the sort of hardcoding here, what if we want to set a custom promotion for a subclass of ligh tanks, or a specific light tank unit ?
UPDATE UnitPromotions SET PromotionPrereqOr3 ='PROMOTION_SENTRY' WHERE Type = 'PROMOTION_MOBILITY';
UPDATE UnitPromotions SET PromotionPrereqOr1 = NULL, PromotionPrereqOr2 = NULL, PromotionPrereqOr3 = NULL, PromotionPrereqOr4 = NULL WHERE Type = 'PROMOTION_AIR_TARGETING_1';

-- Changed Promotions to fit the reinforcement Rules...
DELETE FROM UnitPromotions_UnitCombats 
	WHERE PromotionType='PROMOTION_INSTA_HEAL' or PromotionType='PROMOTION_ANTI_HELICOPTER' or PromotionType='PROMOTION_FORMATION_1' or PromotionType='PROMOTION_INDIRECT_FIRE' 
	or PromotionType='PROMOTION_FORMATION_2' or PromotionType='PROMOTION_RANGE' or PromotionType='PROMOTION_AIR_RANGE' or PromotionType='PROMOTION_AMPHIBIOUS';
UPDATE UnitPromotions SET AdjacentTileHealChange = 0 WHERE Type = 'PROMOTION_MEDIC';
UPDATE UnitPromotions SET AlwaysHeal = 0 WHERE Type = 'PROMOTION_MARCH';
UPDATE UnitPromotions SET AlwaysHeal = 0 WHERE Type = 'PROMOTION_REPAIR';
UPDATE UnitPromotions SET AlwaysHeal = 0 WHERE Type = 'PROMOTION_AIR_REPAIR';
UPDATE UnitPromotions SET Help = 'TXT_KEY_PROMOTION_REPAIR_HELP' WHERE Type = 'PROMOTION_REPAIR';
UPDATE UnitPromotions SET Help = 'TXT_KEY_PROMOTION_REPAIR_HELP' WHERE Type = 'PROMOTION_AIR_REPAIR';
UPDATE UnitPromotions SET Help = 'TXT_KEY_PROMOTION_ANTI_SUBMARINE_I_HELP' WHERE Type = 'PROMOTION_ANTI_SUBMARINE_I';
UPDATE UnitPromotions SET Help = 'TXT_KEY_PROMOTION_ANTI_SUBMARINE_II_HELP' WHERE Type = 'PROMOTION_ANTI_SUBMARINE_II';
UPDATE UnitPromotions SET HealOutsideFriendly = 0, EnemyHealChange = 0, NeutralHealChange = 0 WHERE Type = 'PROMOTION_SUPPLY';
UPDATE UnitPromotions SET DropRange = 20 WHERE Type = 'PROMOTION_PARADROP';
UPDATE UnitPromotions SET DefenseMod = -25 WHERE Type = 'PROMOTION_DEFENSE_PENALTY';


-----------------------------------------------------------------------------
-- Rescaling, change formation & set default models for base units
-----------------------------------------------------------------------------

-- ANTI-AIRCRAFT GUN
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.09 WHERE Type = 'ART_DEF_UNIT_MEMBER_ANTI_AIRCRAFT_GUN';
UPDATE ArtDefine_UnitInfoMemberInfos SET NumMembers = 4 WHERE UnitMemberInfoType = 'ART_DEF_UNIT_MEMBER_ANTI_AIRCRAFT_GUN';
UPDATE ArtDefine_UnitInfos SET Formation = 'FourBigGuns' WHERE Type = 'ART_DEF_UNIT_ANTI_AIRCRAFT_GUN';

-- ANTI-TANK GUN
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.09 WHERE Type = 'ART_DEF_UNIT_MEMBER_ANTI_TANK_GUN';

-- ARTILLERY
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.09 WHERE Type = 'ART_DEF_UNIT_MEMBER_ARTILLERY';
UPDATE ArtDefine_UnitInfoMemberInfos SET NumMembers = 3 WHERE UnitMemberInfoType = 'ART_DEF_UNIT_MEMBER_ARTILLERY';
UPDATE ArtDefine_UnitInfos SET Formation = 'FourBigGuns' WHERE Type = 'ART_DEF_UNIT_ARTILLERY';

-- FIELD GUNS
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.09 WHERE Type = 'ART_DEF_UNIT_MEMBER_ANTI_TANK_GUN';
UPDATE ArtDefine_UnitInfoMemberInfos SET NumMembers = 3 WHERE UnitMemberInfoType = 'ART_DEF_UNIT_MEMBER_ANTI_TANK_GUN';
UPDATE ArtDefine_UnitInfos SET Formation = 'FourBigGuns' WHERE Type = 'ART_DEF_UNIT_ANTI_TANK_GUN';

UPDATE ArtDefine_UnitMemberInfos SET Type = 'ART_DEF_UNIT_MEMBER_FIELD_GUN' WHERE Type = 'ART_DEF_UNIT_MEMBER_ANTI_TANK_GUN';
UPDATE ArtDefine_UnitInfoMemberInfos SET UnitMemberInfoType = 'ART_DEF_UNIT_MEMBER_FIELD_GUN' WHERE UnitMemberInfoType = 'ART_DEF_UNIT_MEMBER_ANTI_TANK_GUN';
UPDATE ArtDefine_UnitInfoMemberInfos SET UnitInfoType = 'ART_DEF_UNIT_FIELD_GUN' WHERE UnitInfoType = 'ART_DEF_UNIT_ANTI_TANK_GUN';
UPDATE ArtDefine_UnitInfos SET Type = 'ART_DEF_UNIT_FIELD_GUN' WHERE Type = 'ART_DEF_UNIT_ANTI_TANK_GUN';
UPDATE ArtDefine_UnitMemberCombats SET UnitMemberType = 'ART_DEF_UNIT_MEMBER_FIELD_GUN' WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_ANTI_TANK_GUN';
UPDATE ArtDefine_UnitMemberCombatWeapons SET UnitMemberType = 'ART_DEF_UNIT_MEMBER_FIELD_GUN' WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_ANTI_TANK_GUN';

-- ATOMIC BOMB
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.09 WHERE Type = 'ART_DEF_UNIT_MEMBER_ATOMICBOMB';
UPDATE ArtDefine_UnitMemberCombats SET MoveRate = 1.5 WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_ATOMICBOMB';

-- BATTLESHIP				
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.105 WHERE Type = 'ART_DEF_UNIT_MEMBER_BATTLESHIP';
UPDATE ArtDefine_UnitMemberInfos SET Model = 'Battleship_Generic.fxsxml' WHERE Type = 'ART_DEF_UNIT_MEMBER_BATTLESHIP';

-- BOMBER				
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.09 WHERE Type = 'ART_DEF_UNIT_MEMBER_BOMBER';
UPDATE ArtDefine_UnitMemberCombats SET MoveRate = 1.7 WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_BOMBER';
UPDATE ArtDefine_UnitInfoMemberInfos SET NumMembers = 3 WHERE UnitMemberInfoType = 'ART_DEF_UNIT_MEMBER_BOMBER';

-- CARRIER
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.105 WHERE Type = 'ART_DEF_UNIT_MEMBER_CARRIER';
UPDATE ArtDefine_UnitMemberInfos SET Model = 'Carrier_Generic.fxsxml' WHERE Type = 'ART_DEF_UNIT_MEMBER_CARRIER';

-- CAVALRY
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.085 WHERE Type = 'ART_DEF_UNIT_MEMBER_CAVALRY';
UPDATE ArtDefine_UnitInfoMemberInfos SET NumMembers = 7 WHERE UnitMemberInfoType = 'ART_DEF_UNIT_MEMBER_CAVALRY';

-- DESTROYER
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.08 WHERE Type = 'ART_DEF_UNIT_MEMBER_DESTROYER';
UPDATE ArtDefine_UnitInfoMemberInfos SET NumMembers = 2 WHERE UnitMemberInfoType = 'ART_DEF_UNIT_MEMBER_DESTROYER';
UPDATE ArtDefine_UnitInfos SET Formation = 'Nelson' WHERE Type = 'ART_DEF_UNIT_DESTROYER';
UPDATE ArtDefine_UnitMemberInfos SET Model = 'Destroyer_Generic.fxsxml' WHERE Type = 'ART_DEF_UNIT_MEMBER_DESTROYER';

-- FIGHTER
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.07 WHERE Type = 'ART_DEF_UNIT_MEMBER_FIGHTER';
UPDATE ArtDefine_UnitMemberCombats SET MoveRate = 2.0 WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_FIGHTER';
UPDATE ArtDefine_UnitInfoMemberInfos SET NumMembers = 4 WHERE UnitMemberInfoType = 'ART_DEF_UNIT_MEMBER_FIGHTER';
UPDATE ArtDefine_UnitInfos SET Formation = 'FighterDiamond' WHERE Type = 'ART_DEF_UNIT_FIGHTER';

-- GUIDED MISSILE
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.14 WHERE Type = 'ART_DEF_UNIT_MEMBER_GUIDEDMISSILE';

-- GREAT ENGINEER
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.08 WHERE Type = 'ART_DEF_UNIT_MEMBER_GREATENGINEER_LATE';

-- GREAT GENERAL
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.09 WHERE Type = 'ART_DEF_UNIT_MEMBER_GREATGENERAL_LATE';

-- INFANTRY (infantry for vanilla, late infantry for G&K)
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.09 WHERE Type = 'ART_DEF_UNIT_MEMBER_INFANTRY';
UPDATE ArtDefine_UnitInfoMemberInfos SET NumMembers = 18 WHERE UnitMemberInfoType = 'ART_DEF_UNIT_MEMBER_INFANTRY';
UPDATE Units SET UnitArtInfo = "ART_DEF_UNIT_INFANTRY" WHERE Type = 'UNIT_INFANTRY'; 
UPDATE ArtDefine_UnitMemberInfos SET Model = 'Infantry_Generic.fxsxml' WHERE Type = 'ART_DEF_UNIT_MEMBER_INFANTRY';

-- IRONCLAD
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.10 WHERE Type = 'ART_DEF_UNIT_MEMBER_IRONCLAD';

-- JETFIGHTER
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.09 WHERE Type = 'ART_DEF_UNIT_MEMBER_JETFIGHTER';
UPDATE ArtDefine_UnitMemberCombats SET MoveRate = 2.5 WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_JETFIGHTER';

-- MODERN ARMOR
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.10 WHERE Type = 'ART_DEF_UNIT_MEMBER_MODERNARMOR';

-- PARATROOPER
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.09 WHERE Type = 'ART_DEF_UNIT_MEMBER_PARATROOPER';
DELETE FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType='ART_DEF_UNIT_PARATROOPER';
INSERT INTO ArtDefine_UnitInfoMemberInfos VALUES ('ART_DEF_UNIT_PARATROOPER','ART_DEF_UNIT_MEMBER_PARATROOPER', 14);
UPDATE ArtDefine_UnitMemberInfos SET Model = 'Paratrooper_Generic_MG_v3.fxsxml' WHERE Type = 'ART_DEF_UNIT_MEMBER_PARATROOPER';

-- RIFLEMAN
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.09 WHERE Type = 'ART_DEF_UNIT_MEMBER_RIFLEMAN';
UPDATE ArtDefine_UnitInfoMemberInfos SET NumMembers = 19 WHERE UnitMemberInfoType = 'ART_DEF_UNIT_MEMBER_RIFLEMAN';

-- ROCKET ARTILLERY
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.09 WHERE Type = 'ART_DEF_UNIT_MEMBER_ROCKETARTILLERY';

-- SETTLER ("Spotter"/invisible units)
DELETE FROM ArtDefine_UnitInfos WHERE Type LIKE 'ART_DEF_UNIT__SETTLER_%';
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.00009 WHERE Type LIKE 'ART_DEF_UNIT_MEMBER_EURO%';

-- SUBMARINE
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.12 WHERE Type = 'ART_DEF_UNIT_MEMBER_SUBMARINE';
UPDATE ArtDefine_UnitInfoMemberInfos SET NumMembers = 3 WHERE UnitMemberInfoType = 'ART_DEF_UNIT_MEMBER_SUBMARINE';
UPDATE ArtDefine_UnitInfos SET Formation = 'Wolfpack' WHERE Type = 'ART_DEF_UNIT_SUBMARINE';
UPDATE ArtDefine_UnitMemberInfos SET Model = 'Submarine_Generic.fxsxml' WHERE Type = 'ART_DEF_UNIT_MEMBER_SUBMARINE';

-- TANK
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.12 WHERE Type = 'ART_DEF_UNIT_MEMBER_TANK';

-- TRANSPORT
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.060 WHERE Type = 'ART_DEF_UNIT_MEMBER_TRANSPORT';
UPDATE ArtDefine_UnitInfoMemberInfos SET NumMembers = 3 WHERE UnitMemberInfoType = 'ART_DEF_UNIT_MEMBER_TRANSPORT';
UPDATE ArtDefine_UnitInfos SET Formation = 'Flotilla' WHERE Type = 'ART_DEF_UNIT_TRANSPORT';

-- WORKBOAT
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.055 WHERE Type = 'ART_DEF_UNIT_MEMBER_WORKBOAT';
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.057 WHERE Type = 'ART_DEF_UNIT_MEMBER_WORKBOAT_INDUSTRIAL';
UPDATE ArtDefine_UnitInfoMemberInfos SET NumMembers = 3 WHERE UnitMemberInfoType = 'ART_DEF_UNIT_MEMBER_WORKBOAT';
UPDATE ArtDefine_UnitInfoMemberInfos SET NumMembers = 2 WHERE UnitMemberInfoType = 'ART_DEF_UNIT_MEMBER_WORKBOAT_INDUSTRIAL';
UPDATE ArtDefine_UnitInfos SET Formation = 'Flotilla' WHERE Type = 'ART_DEF_UNIT_WORKBOAT';
UPDATE ArtDefine_UnitInfos SET Formation = 'Flotilla' WHERE Type = 'ART_DEF_UNIT_WORKBOAT_LATE';

-- WORKER
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.09 WHERE Type = 'ART_DEF_UNIT_MEMBER_WORKER_EURO';
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.09 WHERE Type = 'ART_DEF_UNIT_MEMBER_WORKER_EURO_LATE';

-----------------------------------------------------------------------------
-- Unique Units (Vanilla)
-----------------------------------------------------------------------------

-- AMERICAN B-17
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.10 WHERE Type = 'ART_DEF_UNIT_MEMBER_U_AMERICAN_B17';
UPDATE ArtDefine_UnitMemberCombats SET MoveRate = 1.7 WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_U_AMERICAN_B17';
UPDATE ArtDefine_UnitInfoMemberInfos SET NumMembers = 3 WHERE UnitMemberInfoType = 'ART_DEF_UNIT_MEMBER_U_AMERICAN_B17';

-- FRENCH FOREIGN LEGION
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.09 WHERE Type = 'ART_DEF_UNIT_MEMBER_U_FRENCH_FOREIGNLEGION';
UPDATE ArtDefine_UnitInfoMemberInfos SET NumMembers = 18 WHERE UnitMemberInfoType = 'ART_DEF_UNIT_MEMBER_U_FRENCH_FOREIGNLEGION';

-- GERMAN PANZER
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.11 WHERE Type = 'ART_DEF_UNIT_MEMBER_U_GERMAN_PANZER';

-- JAPANESE ZERO
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.06 WHERE Type = 'ART_DEF_UNIT_MEMBER_U_JAPANESE_ZERO';
UPDATE ArtDefine_UnitMemberCombats SET MoveRate = 2.0 WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_U_JAPANESE_ZERO';
UPDATE ArtDefine_UnitInfoMemberInfos SET NumMembers = 4 WHERE UnitMemberInfoType = 'ART_DEF_UNIT_MEMBER_U_JAPANESE_ZERO';
UPDATE ArtDefine_UnitInfos SET Formation = 'FighterDiamond' WHERE Type = 'ART_DEF_UNIT_U_JAPANESE_ZERO';

-- GREAT ADMIRAL
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.10 WHERE Type = 'ART_DEF_UNIT_MEMBER_GREAT_ADMIRAL';
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.10 WHERE Type = 'ART_DEF_UNIT_MEMBER_GREAT_ADMIRAL_LATE';

-- MARINE
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.09 WHERE Type = 'ART_DEF_UNIT_MEMBER_MARINE';
UPDATE ArtDefine_UnitInfoMemberInfos SET NumMembers = 18 WHERE UnitMemberInfoType = 'ART_DEF_UNIT_MEMBER_MARINE';

-- MACHINEGUN
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.09 WHERE Type = 'ART_DEF_UNIT_MEMBER_MACHINEGUN';

-- WW1 BOMBER
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.075 WHERE Type = 'ART_DEF_UNIT_MEMBER_WW1_BOMBER';
UPDATE ArtDefine_UnitMemberCombats SET MoveRate = 1.5 WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_WW1_BOMBER';
UPDATE ArtDefine_UnitInfoMemberInfos SET NumMembers = 2 WHERE UnitMemberInfoType = 'ART_DEF_UNIT_MEMBER_WW1_BOMBER';

-- WW1 FIGHTER
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.07 WHERE Type = 'ART_DEF_UNIT_MEMBER_WW1_FIGHTER';
UPDATE ArtDefine_UnitMemberCombats SET MoveRate = 1.8 WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_WW1_FIGHTER';

-- WW1 INFANTRY
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.09 WHERE Type = 'ART_DEF_UNIT_MEMBER_WW1_INFANTRY';
UPDATE ArtDefine_UnitInfoMemberInfos SET NumMembers = 18 WHERE UnitMemberInfoType = 'ART_DEF_UNIT_MEMBER_WW1_INFANTRY';

-- WW1 TANK
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.12 WHERE Type = 'ART_DEF_UNIT_MEMBER_WW1_TANK';

-- WW2 INFANTRY
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.09 WHERE Type = 'ART_DEF_UNIT_MEMBER_WW2_INFANTRY';
UPDATE ArtDefine_UnitInfoMemberInfos SET NumMembers = 18 WHERE UnitMemberInfoType = 'ART_DEF_UNIT_MEMBER_WW2_INFANTRY';

-- GATLINGGUN
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.085 WHERE Type = 'ART_DEF_UNIT_MEMBER_GATLINGGUN';