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
SELECT	'CARRIER',				30,		0,		500,	5,		0,		0,		2,		20,		15,		10,		'UNITCLASS_CARRIER',			70,			23,		'UNIT_ATLAS_2',	'UNIT_FLAG_ATLAS',	NULL,					'UNIT_CARRIER',				'TXT_KEY_UNIT_CARRIER',				'TXT_KEY_CIV5_INDUSTRIAL_CARRIER_TEXT',			'TXT_KEY_UNIT_CARRIER_STRATEGY',				'TXT_KEY_UNIT_HELP_CARRIER',			NULL,	NULL,	'UNITCOMBAT_NAVAL',		'DOMAIN_SEA',	NULL,	'UNITAI_CARRIER_SEA',	0,		0,		0,		1,		1,		1,		0,		0,		0,		0,		1,		0,		1,		0,		0,		NULL,	NULL,	NULL,	0,		60,		20,		0,		-1,		0,		0,		0,		0,		0,		0,		0,		0,		100,	0,		0,		0,		3,		3,		'SPECIALUNIT_EMBARKED',	'DOMAIN_AIR',	0,		0,		0,		0,		'ART_DEF_UNIT_CARRIER',					0,		0,		NULL,						NULL,	NULL,	0,		0,		1,		'BOAT'			UNION ALL
SELECT	'BATTLESHIP',			60,		42,		550,	4,		0,		1,		2,		25,		15,		8,		'UNITCLASS_BATTLESHIP',			68,			21,		'UNIT_ATLAS_2',	'UNIT_FLAG_ATLAS',	NULL,					'UNIT_BATTLESHIP',			'TXT_KEY_UNIT_BATTLESHIP',			'TXT_KEY_CIV5_INDUSTRIAL_BATTLESHIP_TEXT',		'TXT_KEY_UNIT_BATTLESHIP_STRATEGY',				'TXT_KEY_UNIT_HELP_BATTLESHIP',			NULL,	NULL,	'UNITCOMBAT_NAVAL',		'DOMAIN_SEA',	NULL,	'UNITAI_ATTACK_SEA',	0,		0,		0,		1,		1,		1,		0,		0,		0,		0,		1,		0,		1,		0,		0,		NULL,	NULL,	NULL,	0,		60,		20,		0,		-1,		0,		0,		0,		0,		0,		0,		0,		0,		100,	0,		0,		0,		3,		3,		NULL,					NULL,			0,		0,		0,		0,		'ART_DEF_UNIT_BATTLESHIP',				0,		0,		NULL,						NULL,	NULL,	0,		0,		1,		'BOAT'			UNION ALL
SELECT	'SUBMARINE',			25,		30,		300,	5,		0,		1,		2,		17,		3,		3,		'UNITCLASS_SUBMARINE',			69,			22,		'UNIT_ATLAS_2',	'UNIT_FLAG_ATLAS',	NULL,					'UNIT_SUBMARINE',			'TXT_KEY_UNIT_SUBMARINE',			'TXT_KEY_CIV5_INDUSTRIAL_SUBMARINE_TEXT',		'TXT_KEY_UNIT_SUBMARINE_STRATEGY',				'TXT_KEY_UNIT_HELP_SUBMARINE',			NULL,	NULL,	'UNITCOMBAT_NAVAL',		'DOMAIN_SEA',	NULL,	'UNITAI_ATTACK_SEA',	0,		0,		0,		1,		1,		1,		0,		0,		0,		0,		1,		0,		1,		0,		0,		NULL,	NULL,	NULL,	0,		60,		20,		0,		-1,		0,		0,		0,		0,		0,		0,		0,		0,		100,	1,		0,		0,		3,		3,		NULL,					NULL,			0,		0,		0,		0,		'ART_DEF_UNIT_SUBMARINE',				0,		0,		NULL,						NULL,	NULL,	0,		0,		1,		'SUB'			UNION ALL
SELECT	'DESTROYER',			35,		22,		375,	8,		0,		1,		2,		15,		5,		3,		'UNITCLASS_DESTROYER',			67,			20,		'UNIT_ATLAS_2',	'UNIT_FLAG_ATLAS',	NULL,					'UNIT_DESTROYER',			'TXT_KEY_UNIT_DESTROYER',			'TXT_KEY_CIV5_INDUSTRIAL_DESTROYER_TEXT',		'TXT_KEY_UNIT_DESTROYER_STRATEGY',				'TXT_KEY_UNIT_HELP_DESTROYER',			NULL,	NULL,	'UNITCOMBAT_NAVAL',		'DOMAIN_SEA',	NULL,	'UNITAI_ATTACK_SEA',	0,		0,		0,		1,		1,		1,		0,		0,		0,		0,		1,		0,		1,		0,		0,		NULL,	NULL,	NULL,	0,		60,		20,		0,		-1,		0,		0,		0,		0,		0,		0,		0,		0,		100,	0,		0,		0,		3,		3,		NULL,					NULL,			0,		0,		0,		0,		'ART_DEF_UNIT_DESTROYER',				0,		0,		NULL,						NULL,	NULL,	0,		0,		1,		'BOAT'			UNION ALL
SELECT	'ATOMIC_BOMB',			0,		0,		600,	2,		1,		16,		2,		0,		0,		0,		'UNITCLASS_ATOMIC_BOMB',		71,			24,		'UNIT_ATLAS_2',	'UNIT_FLAG_ATLAS',	'SPECIALUNIT_LANDBASED','UNIT_ATOMIC_BOMB',			'TXT_KEY_UNIT_ATOMIC_BOMB',			'TXT_KEY_CIV5_INDUSTRIAL_ATOMICBOMB_TEXT',		'TXT_KEY_UNIT_ATOMIC_BOMB_STRATEGY',			'TXT_KEY_UNIT_HELP_ATOMIC_BOMB',		NULL,	NULL,	NULL,					'DOMAIN_AIR',	NULL,	'UNITAI_ICBM',			0,		0,		0,		1,		1,		0,		0,		0,		0,		0,		1,		0,		1,		1,		0,		NULL,	NULL,	NULL,	0,		60,		-1,		0,		1,		0,		0,		0,		0,		0,		0,		0,		0,		0,		0,		0,		100,	0,		2,		NULL,					NULL,			0,		0,		0,		0,		'ART_DEF_UNIT_ATOMIC_BOMB',				0,		0,		'PROJECT_MANHATTAN_PROJECT',NULL,	NULL,	0,		0,		1,		'AIR_REBASE'	UNION ALL
SELECT	'BOMBER',				0,		50,		450,	2,		1,		14,		2,		24,		3,		6,		'UNITCLASS_BOMBER',				64,			18,		'UNIT_ATLAS_2',	'UNIT_FLAG_ATLAS',	'SPECIALUNIT_LANDBASED','UNIT_BOMBER',				'TXT_KEY_UNIT_BOMBER',				'TXT_KEY_CIV5_INDUSTRIAL_BOMBER_TEXT',			'TXT_KEY_UNIT_BOMBER_STRATEGY',					'TXT_KEY_UNIT_HELP_BOMBER',				NULL,	NULL,	'UNITCOMBAT_BOMBER',	'DOMAIN_AIR',	NULL,	'UNITAI_ATTACK_AIR',	0,		0,		0,		1,		1,		0,		0,		0,		0,		0,		1,		0,		1,		0,		0,		NULL,	NULL,	NULL,	0,		50,		-1,		1,		-1,		0,		0,		0,		0,		0,		0,		0,		0,		0,		0,		0,		100,	3,		2,		NULL,					NULL,			0,		0,		0,		0,		'ART_DEF_UNIT_BOMBER',					0,		0,		NULL,						NULL,	NULL,	0,		0,		1,		'AIR_REBASE'	UNION ALL
SELECT	'FIGHTER',				0,		40,		375,	2,		1,		10,		2,		17,		3,		4,		'UNITCLASS_FIGHTER',			62,			17,		'UNIT_ATLAS_2',	'UNIT_FLAG_ATLAS',	'SPECIALUNIT_LANDBASED','UNIT_FIGHTER',				'TXT_KEY_UNIT_FIGHTER',				'TXT_KEY_CIV5_INDUSTRIAL_FIGHTER_TEXT',			'TXT_KEY_UNIT_FIGHTER_STRATEGY',				'TXT_KEY_UNIT_HELP_FIGHTER',			NULL,	NULL,	'UNITCOMBAT_FIGHTER',	'DOMAIN_AIR',	NULL,	'UNITAI_DEFENSE_AIR',	0,		0,		0,		1,		1,		0,		0,		0,		0,		0,		1,		0,		1,		0,		0,		NULL,	NULL,	NULL,	0,		50,		-1,		1,		-1,		0,		0,		0,		0,		0,		0,		0,		0,		0,		0,		0,		100,	3,		2,		NULL,					NULL,			0,		0,		0,		0,		'ART_DEF_UNIT_FIGHTER',					0,		0,		NULL,						NULL,	NULL,	0,		0,		1,		'AIR_REBASE'	UNION ALL
SELECT	'TANK',					50,		0,		375,	5,		0,		0,		2,		16,		4,		5,		'UNITCLASS_TANK',				1,			13,		'UNIT_ATLAS_2',	'WW2_UNIT_FLAGS',	NULL,					'UNIT_TANK',				'TXT_KEY_UNIT_TANK',				'TXT_KEY_CIV5_INDUSTRIAL_TANK_TEXT',			'TXT_KEY_UNIT_TANK_STRATEGY',					'TXT_KEY_UNIT_HELP_TANK',				NULL,	NULL,	'UNITCOMBAT_ARMOR',		'DOMAIN_LAND',	NULL,	'UNITAI_FAST_ATTACK',	0,		0,		0,		1,		1,		1,		0,		0,		0,		0,		1,		0,		1,		0,		0,		NULL,	NULL,	NULL,	0,		50,		-1,		0,		-1,		0,		0,		0,		0,		0,		0,		0,		0,		100,	0,		0,		0,		3,		3,		NULL,					NULL,			0,		0,		0,		0,		'ART_DEF_UNIT_TANK',					0,		0,		NULL,						NULL,	NULL,	0,		0,		1,		'WHEELED'		UNION ALL
SELECT	'ANTI_AIRCRAFT_GUN',	20,		0,		270,	2,		0,		0,		2,		10,		10,		0,		'UNITCLASS_ANTI_AIRCRAFT_GUN',	22,			16,		'UNIT_ATLAS_2',	'WW2_UNIT_FLAGS',	NULL,					'UNIT_ANTI_AIRCRAFT_GUN',	'TXT_KEY_UNIT_ANTI_AIRCRAFT_GUN',	'TXT_KEY_CIV5_INDUSTRIAL_ANTIAIRCRAFTGUN_TEXT',	'TXT_KEY_UNIT_ANTI_AIRCRAFT_STRATEGY',			'TXT_KEY_UNIT_HELP_ANTI_AIRCRAFT_GUN',	NULL,	NULL,	'UNITCOMBAT_GUN',		'DOMAIN_LAND',	NULL,	'UNITAI_COUNTER',		0,		0,		0,		1,		1,		0,		0,		0,		0,		0,		1,		0,		0,		0,		0,		NULL,	NULL,	NULL,	0,		35,		-1,		0,		-1,		0,		0,		0,		0,		0,		0,		0,		0,		100,	0,		0,		0,		3,		3,		NULL,					NULL,			5,		0,		0,		0,		'ART_DEF_UNIT_ANTI_AIRCRAFT_GUN',		0,		0,		NULL,						NULL,	NULL,	0,		0,		1,		'WHEELED'		UNION ALL
SELECT	'FIELD_GUN',			16,		60,		280,	2,		0,		1,		2,		10,		10,		0,		'UNITCLASS_FIELD_GUN',			25,			15,		'UNIT_ATLAS_2',	'WW2_UNIT_FLAGS',	NULL,					'UNIT_FIELD_GUN',			'TXT_KEY_UNIT_AT_GUN',				'TXT_KEY_CIV5_INDUSTRIAL_ANTITANKGUN_TEXT',		'TXT_KEY_UNIT_AT_GUN_STRATEGY',					'TXT_KEY_UNIT_HELP_FIELD_GUN',			NULL,	NULL,	'UNITCOMBAT_SIEGE',		'DOMAIN_LAND',	NULL,	'UNITAI_CITY_BOMBARD',	0,		0,		0,		1,		1,		0,		0,		0,		0,		0,		1,		0,		0,		0,		0,		NULL,	NULL,	NULL,	0,		35,		-1,		0,		-1,		0,		0,		0,		0,		0,		0,		0,		0,		100,	0,		0,		0,		3,		3,		NULL,					NULL,			1,		0,		0,		0,		'ART_DEF_UNIT_ANTI_TANK_GUN',			0,		0,		NULL,						NULL,	NULL,	0,		0,		1,		'ARTILLERY'		UNION ALL
SELECT	'ARTILLERY',			14,		40,		290,	2,		0,		1,		2,		10,		10,		0,		'UNITCLASS_ARTILLERY',			11,			12,		'UNIT_ATLAS_2',	'WW2_UNIT_FLAGS',	NULL,					'UNIT_ARTILLERY',			'TXT_KEY_UNIT_ARTILLERY',			'TXT_KEY_CIV5_INDUSTRIAL_ARTILLERY_TEXT',		'TXT_KEY_UNIT_ARTILLERY_STRATEGY',				'TXT_KEY_UNIT_HELP_ARTILLERY',			NULL,	NULL,	'UNITCOMBAT_SIEGE',		'DOMAIN_LAND',	NULL,	'UNITAI_CITY_BOMBARD',	0,		0,		0,		1,		1,		0,		0,		0,		0,		0,		1,		0,		1,		0,		0,		NULL,	NULL,	NULL,	0,		40,		-1,		0,		-1,		0,		0,		0,		0,		0,		0,		0,		0,		100,	0,		0,		0,		3,		3,		NULL,					NULL,			0,		0,		0,		0,		'ART_DEF_UNIT_ARTILLERY',				0,		0,		NULL,						NULL,	NULL,	0,		0,		1,		'ARTILLERY'		UNION ALL
SELECT	'INFANTRY',				36,		0,		200,	2,		0,		0,		2,		1,		15,		0,		'UNITCLASS_INFANTRY',			0,			11,		'UNIT_ATLAS_2',	'WW2_UNIT_FLAGS',	NULL,					'UNIT_INFANTRY',			'TXT_KEY_UNIT_INFANTRY',			'TXT_KEY_CIV5_INDUSTRIAL_INFANTRY_TEXT',		'TXT_KEY_UNIT_INFANTRY_STRATEGY',				'TXT_KEY_UNIT_HELP_INFANTRY',			NULL,	NULL,	'UNITCOMBAT_GUN',		'DOMAIN_LAND',	NULL,	'UNITAI_DEFENSE',		0,		0,		0,		1,		1,		1,		0,		0,		0,		0,		1,		0,		0,		0,		0,		NULL,	NULL,	NULL,	0,		35,		-1,		0,		-1,		0,		0,		0,		0,		0,		0,		0,		0,		100,	0,		0,		0,		3,		3,		NULL,					NULL,			6,		0,		0,		0,		'ART_DEF_UNIT_INFANTRY',				0,		0,		NULL,						NULL,	NULL,	0,		0,		1,		'BIPED'			UNION ALL
SELECT	'PARATROOPER',			42,		0,		375,	2,		0,		0,		2,		2,		25,		0,		'UNITCLASS_PARATROOPER',		4,			11,		'UNIT_ATLAS_2',	'WW2_UNIT_FLAGS',	NULL,					'UNIT_PARATROOPER',			'TXT_KEY_UNIT_PARATROOPER',			'TXT_KEY_CIV5_INDUSTRIAL_PARATROOPER_TEXT',		'TXT_KEY_UNIT_PARATROOPER_STRATEGY',			'TXT_KEY_UNIT_HELP_PARATROOPER',		NULL,	NULL,	'UNITCOMBAT_GUN',		'DOMAIN_LAND',	NULL,	'UNITAI_DEFENSE',		0,		0,		0,		1,		1,		1,		0,		0,		0,		0,		1,		0,		0,		0,		0,		NULL,	NULL,	NULL,	0,		35,		-1,		0,		-1,		0,		0,		0,		0,		0,		0,		0,		0,		100,	0,		0,		0,		3,		3,		NULL,					NULL,			6,		0,		0,		0,		'ART_DEF_UNIT_PARATROOPER',				0,		0,		NULL,						NULL,	NULL,	0,		0,		1,		'BIPED'			UNION ALL
SELECT	'CONVOY',				25,		0,		-1,		4,		0,		1,		2,		0,		0,		0,		'UNITCLASS_CONVOY',				53,			10,		'UNIT_ATLAS_2',	'UNIT_FLAG_ATLAS',	NULL,					'UNIT_CONVOY',				'TXT_KEY_UNIT_CONVOY',				'TXT_KEY_CIV5_INDUSTRIAL_CONVOY_TEXT',			'TXT_KEY_UNIT_CONVOY_STRATEGY',					'TXT_KEY_UNIT_HELP_CONVOY',				NULL,	NULL,	'UNITCOMBAT_NAVAL',		'DOMAIN_SEA',	NULL,	'UNITAI_TREASURE',		0,		0,		0,		0,		0,		0,		0,		0,		0,		0,		1,		0,		1,		0,		0,		NULL,	NULL,	NULL,	0,		60,		20,		0,		-1,		0,		0,		0,		0,		0,		0,		0,		0,		100,	0,		0,		0,		3,		3,		NULL,					NULL,			0,		0,		0,		0,		'ART_DEF_UNIT_TRANSPORT',				0,		0,		NULL,						NULL,	NULL,	0,		0,		1,		'BOAT'			UNION ALL
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

INSERT INTO Unit_Flavors (UnitType, FlavorType, Flavor)	VALUES ('UNIT_ANTI_AIRCRAFT_GUN',	'FLAVOR_ANTIAIR',		10);
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
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.10 WHERE Type = 'ART_DEF_UNIT_MEMBER_DESTROYER';
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
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.065 WHERE Type = 'ART_DEF_UNIT_MEMBER_TRANSPORT';
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


/*

	OLD ENTRIES FOR REFERENCE

*/

--------------------------------------------------------------
-- Make change to existing units before copying "en masse"
--------------------------------------------------------------	

-- Convoy
--INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')	VALUES ('UNIT_CONVOY', 'PROMOTION_ONLY_DEFENSIVE');
-- INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')	VALUES ('UNIT_CONVOY', 'PROMOTION_SIGHT_PENALTY');	


--INSERT INTO Unit_FreePromotions ('UnitType', 'PromotionType')	VALUES ('UNIT_AIRFIELD', 'PROMOTION_ONLY_DEFENSIVE');
--INSERT INTO Unit_FreePromotions ('UnitType', 'PromotionType')	VALUES ('UNIT_AIRFIELD', 'PROMOTION_SIGHT_PENALTY');
--INSERT INTO Unit_FreePromotions ('UnitType', 'PromotionType')	VALUES ('UNIT_AIRFIELD', 'PROMOTION_CARGO_IV');


--------------------------------------------------------------
-- Land
--------------------------------------------------------------
/*

-- Special Force Promotion
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	VALUES ( 'UNIT_SPECIAL_FORCES', 'PROMOTION_IGNORE_TERRAIN_COST' );	
UPDATE Unit_FreePromotions
	SET UnitType = 'UNIT_SPECIAL_FORCES', PromotionType = 'PROMOTION_CITY_PENALTY'
	WHERE UnitType = 'UNIT_SPECIAL_FORCES' AND PromotionType = 'PROMOTION_CITY_SIEGE';
-- Some are optional, to add specifically
--INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
--	VALUES ( 'UNIT_SPECIAL_FORCES', 'PROMOTION_WITHDRAW_BEFORE_MELEE' );
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	VALUES ( 'UNIT_SPECIAL_FORCES', 'PROMOTION_CAN_MOVE_AFTER_ATTACKING' );
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	VALUES ( 'UNIT_SPECIAL_FORCES', 'PROMOTION_GUN_25' );
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	VALUES ( 'UNIT_SPECIAL_FORCES', 'PROMOTION_SPECIAL_FORCES' );
INSERT INTO "Unit_ResourceQuantityRequirements" ('UnitType', 'ResourceType', 'Cost')
	SELECT ("UNIT_SPECIAL_FORCES"), "ResourceType", "Cost"
	FROM "Unit_ResourceQuantityRequirements" WHERE (UnitType = "UNIT_INFANTRY");
----


-- Paratrooper
-- first change Infantry vs City specific promotion...
-- (Paradrop promotion is added via Lua using the g_Paradrop table in main or scenario define...)
UPDATE Unit_FreePromotions
	SET UnitType = 'UNIT_PARATROOPER', PromotionType = 'PROMOTION_LIGHT'
	WHERE UnitType = 'UNIT_PARATROOPER' AND PromotionType = 'PROMOTION_CITY_SIEGE';
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	VALUES ( 'UNIT_PARATROOPER', 'PROMOTION_IGNORE_TERRAIN_COST' );	
INSERT INTO "Unit_ResourceQuantityRequirements" ('UnitType', 'ResourceType', 'Cost')
	SELECT ("UNIT_SPECIAL_FORCES"), "ResourceType", "Cost"
	FROM "Unit_ResourceQuantityRequirements" WHERE (UnitType = "UNIT_INFANTRY");
----


-- light tank
INSERT INTO "Units" ('Type', 'Description', 'Civilopedia', 'Strategy', 'Help', 'Requirements', 'Combat', 'RangedCombat', 'Cost', 'Moves', 'Immobile', 'Range', 'BaseSightRange', 'Class', 'Special', 'Capture', 'CombatClass', 'Domain', 'CivilianAttackPriority', 'DefaultUnitAI', 'Food', 'NoBadGoodies', 'RivalTerritory', 'MilitarySupport', 'MilitaryProduction', 'Pillage', 'Found', 'FoundAbroad', 'CultureBombRadius', 'GoldenAgeTurns', 'IgnoreBuildingDefense', 'PrereqResources', 'Mechanized', 'Suicide', 'CaptureWhileEmbarked', 'PrereqTech', 'ObsoleteTech', 'GoodyHutUpgradeUnitClass', 'HurryCostModifier', 'AdvancedStartCost', 'MinAreaSize', 'AirUnitCap', 'NukeDamageLevel', 'WorkRate', 'NumFreeTechs', 'RushBuilding', 'BaseHurry', 'HurryMultiplier', 'BaseGold', 'NumGoldPerEra', 'SpreadReligion', 'IsReligious', 'CombatLimit', 'RangeAttackOnlyInDomain', 'RangeAttackIgnoreLOS', 'RangedCombatLimit', 'XPValueAttack', 'XPValueDefense', 'SpecialCargo', 'DomainCargo', 'Conscription', 'ExtraMaintenanceCost', 'NoMaintenance', 'Unhappiness', 'UnitArtInfo', 'UnitArtInfoCulturalVariation', 'UnitArtInfoEraVariation', 'ProjectPrereq', 'SpaceshipProject', 'LeaderPromotion', 'LeaderExperience', 'DontShowYields', 'ShowInPedia', 'MoveRate', 'UnitFlagIconOffset', 'PortraitIndex', 'IconAtlas', 'UnitFlagAtlas')
	SELECT	("UNIT_LIGHT_TANK"), ("TXT_KEY_UNIT_LIGHT_TANK"), "Civilopedia", "Strategy", ("TXT_KEY_UNIT_HELP_LIGHT_TANK"), "Requirements",
			(40), "RangedCombat", (300), (5), "Immobile", "Range", "BaseSightRange", ("UNITCLASS_LIGHT_TANK"), "Special", "Capture", "CombatClass", "Domain", "CivilianAttackPriority", "DefaultUnitAI", "Food", "NoBadGoodies", "RivalTerritory", "MilitarySupport", "MilitaryProduction", "Pillage", "Found", "FoundAbroad", "CultureBombRadius", "GoldenAgeTurns", "IgnoreBuildingDefense", "PrereqResources", "Mechanized", "Suicide", "CaptureWhileEmbarked", "PrereqTech", "ObsoleteTech", "GoodyHutUpgradeUnitClass", "HurryCostModifier", "AdvancedStartCost", "MinAreaSize", "AirUnitCap", "NukeDamageLevel", "WorkRate", "NumFreeTechs", "RushBuilding", "BaseHurry", "HurryMultiplier", "BaseGold", "NumGoldPerEra", "SpreadReligion", "IsReligious", "CombatLimit", "RangeAttackOnlyInDomain", "RangeAttackIgnoreLOS", "RangedCombatLimit", "XPValueAttack", "XPValueDefense", "SpecialCargo", "DomainCargo", "Conscription", "ExtraMaintenanceCost", "NoMaintenance", "Unhappiness",
			("ART_DEF_UNIT_LIGHT_TANK"), "UnitArtInfoCulturalVariation", "UnitArtInfoEraVariation", "ProjectPrereq", "SpaceshipProject", "LeaderPromotion", "LeaderExperience", "DontShowYields", "ShowInPedia", "MoveRate",
			("1"), ("7"), ("WW2_UNIT_ICONS"), ("WW2_UNIT_FLAGS")
	FROM "Units" WHERE (Type = "UNIT_TANK");
INSERT INTO "Unit_AITypes" ('UnitType', 'UnitAIType')
	SELECT ("UNIT_LIGHT_TANK"), "UnitAIType"
	FROM "Unit_AITypes" WHERE (UnitType = "UNIT_TANK");
INSERT INTO "Unit_ClassUpgrades" ('UnitType', 'UnitClassType')
	SELECT ("UNIT_LIGHT_TANK"), "UnitClassType"
	FROM "Unit_ClassUpgrades" WHERE (UnitType = "UNIT_TANK");
INSERT INTO "Unit_Flavors" ('UnitType', 'FlavorType', 'Flavor')
	SELECT ("UNIT_LIGHT_TANK"), "FlavorType", "Flavor"
	FROM "Unit_Flavors" WHERE (UnitType = "UNIT_TANK");
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	SELECT ("UNIT_LIGHT_TANK"), "PromotionType"
	FROM "Unit_FreePromotions" WHERE (UnitType = "UNIT_TANK");
-- special class promotions		
UPDATE Unit_FreePromotions
	SET UnitType = 'UNIT_LIGHT_TANK', PromotionType = 'PROMOTION_LIGHT_TANK'
	WHERE UnitType = 'UNIT_LIGHT_TANK' AND PromotionType = 'PROMOTION_SMALL_CITY_PENALTY';	
INSERT INTO "Unit_ResourceQuantityRequirements" ('UnitType', 'ResourceType', 'Cost')
	SELECT ("UNIT_LIGHT_TANK"), "ResourceType", "Cost"
	FROM "Unit_ResourceQuantityRequirements" WHERE (UnitType = "UNIT_TANK");
----
	
-- obsolete light tank
INSERT INTO "Units" ('Type', 'Description', 'Civilopedia', 'Strategy', 'Help', 'Requirements', 'Combat', 'RangedCombat', 'Cost', 'Moves', 'Immobile', 'Range', 'BaseSightRange', 'Class', 'Special', 'Capture', 'CombatClass', 'Domain', 'CivilianAttackPriority', 'DefaultUnitAI', 'Food', 'NoBadGoodies', 'RivalTerritory', 'MilitarySupport', 'MilitaryProduction', 'Pillage', 'Found', 'FoundAbroad', 'CultureBombRadius', 'GoldenAgeTurns', 'IgnoreBuildingDefense', 'PrereqResources', 'Mechanized', 'Suicide', 'CaptureWhileEmbarked', 'PrereqTech', 'ObsoleteTech', 'GoodyHutUpgradeUnitClass', 'HurryCostModifier', 'AdvancedStartCost', 'MinAreaSize', 'AirUnitCap', 'NukeDamageLevel', 'WorkRate', 'NumFreeTechs', 'RushBuilding', 'BaseHurry', 'HurryMultiplier', 'BaseGold', 'NumGoldPerEra', 'SpreadReligion', 'IsReligious', 'CombatLimit', 'RangeAttackOnlyInDomain', 'RangeAttackIgnoreLOS', 'RangedCombatLimit', 'XPValueAttack', 'XPValueDefense', 'SpecialCargo', 'DomainCargo', 'Conscription', 'ExtraMaintenanceCost', 'NoMaintenance', 'Unhappiness', 'UnitArtInfo', 'UnitArtInfoCulturalVariation', 'UnitArtInfoEraVariation', 'ProjectPrereq', 'SpaceshipProject', 'LeaderPromotion', 'LeaderExperience', 'DontShowYields', 'ShowInPedia', 'MoveRate', 'UnitFlagIconOffset', 'PortraitIndex', 'IconAtlas', 'UnitFlagAtlas')
	SELECT	("UNIT_OLD_LIGHT_TANK"), ("TXT_KEY_UNIT_LIGHT_TANK"), "Civilopedia", "Strategy", "Help", "Requirements",
			(38), "RangedCombat", (300), (4), "Immobile", "Range", "BaseSightRange", ("UNITCLASS_OLD_LIGHT_TANK"), "Special", "Capture", "CombatClass", "Domain", "CivilianAttackPriority", "DefaultUnitAI", "Food", "NoBadGoodies", "RivalTerritory", "MilitarySupport", "MilitaryProduction", "Pillage", "Found", "FoundAbroad", "CultureBombRadius", "GoldenAgeTurns", "IgnoreBuildingDefense", "PrereqResources", "Mechanized", "Suicide", "CaptureWhileEmbarked", "PrereqTech", "ObsoleteTech", "GoodyHutUpgradeUnitClass", "HurryCostModifier", "AdvancedStartCost", "MinAreaSize", "AirUnitCap", "NukeDamageLevel", "WorkRate", "NumFreeTechs", "RushBuilding", "BaseHurry", "HurryMultiplier", "BaseGold", "NumGoldPerEra", "SpreadReligion", "IsReligious", "CombatLimit", "RangeAttackOnlyInDomain", "RangeAttackIgnoreLOS", "RangedCombatLimit", "XPValueAttack", "XPValueDefense", "SpecialCargo", "DomainCargo", "Conscription", "ExtraMaintenanceCost", "NoMaintenance", "Unhappiness",
			("ART_DEF_UNIT_OLD_LIGHT_TANK"), "UnitArtInfoCulturalVariation", "UnitArtInfoEraVariation", "ProjectPrereq", "SpaceshipProject", "LeaderPromotion", "LeaderExperience", "DontShowYields", "ShowInPedia", "MoveRate",
			("1"), "PortraitIndex", "IconAtlas", ("WW2_UNIT_FLAGS")
	FROM "Units" WHERE (Type = "UNIT_LIGHT_TANK");
INSERT INTO "Unit_AITypes" ('UnitType', 'UnitAIType')
	SELECT ("UNIT_OLD_LIGHT_TANK"), "UnitAIType"
	FROM "Unit_AITypes" WHERE (UnitType = "UNIT_LIGHT_TANK");
INSERT INTO "Unit_ClassUpgrades" ('UnitType', 'UnitClassType')
	SELECT ("UNIT_OLD_LIGHT_TANK"), "UnitClassType"
	FROM "Unit_ClassUpgrades" WHERE (UnitType = "UNIT_LIGHT_TANK");
INSERT INTO "Unit_Flavors" ('UnitType', 'FlavorType', 'Flavor')
	SELECT ("UNIT_OLD_LIGHT_TANK"), "FlavorType", "Flavor"
	FROM "Unit_Flavors" WHERE (UnitType = "UNIT_LIGHT_TANK");
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	SELECT ("UNIT_OLD_LIGHT_TANK"), "PromotionType"
	FROM "Unit_FreePromotions" WHERE (UnitType = "UNIT_LIGHT_TANK");
INSERT INTO "Unit_ResourceQuantityRequirements" ('UnitType', 'ResourceType', 'Cost')
	SELECT ("UNIT_OLD_LIGHT_TANK"), "ResourceType", "Cost"
	FROM "Unit_ResourceQuantityRequirements" WHERE (UnitType = "UNIT_LIGHT_TANK");
----


-- light tank 2
INSERT INTO "Units" ('Type', 'Description', 'Civilopedia', 'Strategy', 'Help', 'Requirements', 'Combat', 'RangedCombat', 'Cost', 'Moves', 'Immobile', 'Range', 'BaseSightRange', 'Class', 'Special', 'Capture', 'CombatClass', 'Domain', 'CivilianAttackPriority', 'DefaultUnitAI', 'Food', 'NoBadGoodies', 'RivalTerritory', 'MilitarySupport', 'MilitaryProduction', 'Pillage', 'Found', 'FoundAbroad', 'CultureBombRadius', 'GoldenAgeTurns', 'IgnoreBuildingDefense', 'PrereqResources', 'Mechanized', 'Suicide', 'CaptureWhileEmbarked', 'PrereqTech', 'ObsoleteTech', 'GoodyHutUpgradeUnitClass', 'HurryCostModifier', 'AdvancedStartCost', 'MinAreaSize', 'AirUnitCap', 'NukeDamageLevel', 'WorkRate', 'NumFreeTechs', 'RushBuilding', 'BaseHurry', 'HurryMultiplier', 'BaseGold', 'NumGoldPerEra', 'SpreadReligion', 'IsReligious', 'CombatLimit', 'RangeAttackOnlyInDomain', 'RangeAttackIgnoreLOS', 'RangedCombatLimit', 'XPValueAttack', 'XPValueDefense', 'SpecialCargo', 'DomainCargo', 'Conscription', 'ExtraMaintenanceCost', 'NoMaintenance', 'Unhappiness', 'UnitArtInfo', 'UnitArtInfoCulturalVariation', 'UnitArtInfoEraVariation', 'ProjectPrereq', 'SpaceshipProject', 'LeaderPromotion', 'LeaderExperience', 'DontShowYields', 'ShowInPedia', 'MoveRate', 'UnitFlagIconOffset', 'PortraitIndex', 'IconAtlas', 'UnitFlagAtlas')
	SELECT	("UNIT_LIGHT_TANK_2"), ("TXT_KEY_UNIT_LIGHT_TANK"), "Civilopedia", "Strategy", "Help", "Requirements",
			(44), "RangedCombat", (320), (5), "Immobile", "Range", "BaseSightRange", ("UNITCLASS_LIGHT_TANK_2"), "Special", "Capture", "CombatClass", "Domain", "CivilianAttackPriority", "DefaultUnitAI", "Food", "NoBadGoodies", "RivalTerritory", "MilitarySupport", "MilitaryProduction", "Pillage", "Found", "FoundAbroad", "CultureBombRadius", "GoldenAgeTurns", "IgnoreBuildingDefense", "PrereqResources", "Mechanized", "Suicide", "CaptureWhileEmbarked", "PrereqTech", "ObsoleteTech", "GoodyHutUpgradeUnitClass", "HurryCostModifier", "AdvancedStartCost", "MinAreaSize", "AirUnitCap", "NukeDamageLevel", "WorkRate", "NumFreeTechs", "RushBuilding", "BaseHurry", "HurryMultiplier", "BaseGold", "NumGoldPerEra", "SpreadReligion", "IsReligious", "CombatLimit", "RangeAttackOnlyInDomain", "RangeAttackIgnoreLOS", "RangedCombatLimit", "XPValueAttack", "XPValueDefense", "SpecialCargo", "DomainCargo", "Conscription", "ExtraMaintenanceCost", "NoMaintenance", "Unhappiness",
			("ART_DEF_UNIT_LIGHT_TANK_2"), "UnitArtInfoCulturalVariation", "UnitArtInfoEraVariation", "ProjectPrereq", "SpaceshipProject", "LeaderPromotion", "LeaderExperience", "DontShowYields", "ShowInPedia", "MoveRate",
			("1"), "PortraitIndex", "IconAtlas", ("WW2_UNIT_FLAGS")
	FROM "Units" WHERE (Type = "UNIT_LIGHT_TANK");
INSERT INTO "Unit_AITypes" ('UnitType', 'UnitAIType')
	SELECT ("UNIT_LIGHT_TANK_2"), "UnitAIType"
	FROM "Unit_AITypes" WHERE (UnitType = "UNIT_LIGHT_TANK");
INSERT INTO "Unit_ClassUpgrades" ('UnitType', 'UnitClassType')
	SELECT ("UNIT_LIGHT_TANK_2"), "UnitClassType"
	FROM "Unit_ClassUpgrades" WHERE (UnitType = "UNIT_LIGHT_TANK");
INSERT INTO "Unit_Flavors" ('UnitType', 'FlavorType', 'Flavor')
	SELECT ("UNIT_LIGHT_TANK_2"), "FlavorType", "Flavor"
	FROM "Unit_Flavors" WHERE (UnitType = "UNIT_LIGHT_TANK");
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	SELECT ("UNIT_LIGHT_TANK_2"), "PromotionType"
	FROM "Unit_FreePromotions" WHERE (UnitType = "UNIT_LIGHT_TANK");
INSERT INTO "Unit_ResourceQuantityRequirements" ('UnitType', 'ResourceType', 'Cost')
	SELECT ("UNIT_LIGHT_TANK_2"), "ResourceType", "Cost"
	FROM "Unit_ResourceQuantityRequirements" WHERE (UnitType = "UNIT_LIGHT_TANK");
----

-- light tank 2 B
INSERT INTO "Units" ('Type', 'Description', 'Civilopedia', 'Strategy', 'Help', 'Requirements', 'Combat', 'RangedCombat', 'Cost', 'Moves', 'Immobile', 'Range', 'BaseSightRange', 'Class', 'Special', 'Capture', 'CombatClass', 'Domain', 'CivilianAttackPriority', 'DefaultUnitAI', 'Food', 'NoBadGoodies', 'RivalTerritory', 'MilitarySupport', 'MilitaryProduction', 'Pillage', 'Found', 'FoundAbroad', 'CultureBombRadius', 'GoldenAgeTurns', 'IgnoreBuildingDefense', 'PrereqResources', 'Mechanized', 'Suicide', 'CaptureWhileEmbarked', 'PrereqTech', 'ObsoleteTech', 'GoodyHutUpgradeUnitClass', 'HurryCostModifier', 'AdvancedStartCost', 'MinAreaSize', 'AirUnitCap', 'NukeDamageLevel', 'WorkRate', 'NumFreeTechs', 'RushBuilding', 'BaseHurry', 'HurryMultiplier', 'BaseGold', 'NumGoldPerEra', 'SpreadReligion', 'IsReligious', 'CombatLimit', 'RangeAttackOnlyInDomain', 'RangeAttackIgnoreLOS', 'RangedCombatLimit', 'XPValueAttack', 'XPValueDefense', 'SpecialCargo', 'DomainCargo', 'Conscription', 'ExtraMaintenanceCost', 'NoMaintenance', 'Unhappiness', 'UnitArtInfo', 'UnitArtInfoCulturalVariation', 'UnitArtInfoEraVariation', 'ProjectPrereq', 'SpaceshipProject', 'LeaderPromotion', 'LeaderExperience', 'DontShowYields', 'ShowInPedia', 'MoveRate', 'UnitFlagIconOffset', 'PortraitIndex', 'IconAtlas', 'UnitFlagAtlas')
	SELECT	("UNIT_LIGHT_TANK_2_B"), ("TXT_KEY_UNIT_LIGHT_TANK"), "Civilopedia", "Strategy", "Help", "Requirements",
			(48), "RangedCombat", (325), (5), "Immobile", "Range", "BaseSightRange", ("UNITCLASS_LIGHT_TANK_2_B"), "Special", "Capture", "CombatClass", "Domain", "CivilianAttackPriority", "DefaultUnitAI", "Food", "NoBadGoodies", "RivalTerritory", "MilitarySupport", "MilitaryProduction", "Pillage", "Found", "FoundAbroad", "CultureBombRadius", "GoldenAgeTurns", "IgnoreBuildingDefense", "PrereqResources", "Mechanized", "Suicide", "CaptureWhileEmbarked", "PrereqTech", "ObsoleteTech", "GoodyHutUpgradeUnitClass", "HurryCostModifier", "AdvancedStartCost", "MinAreaSize", "AirUnitCap", "NukeDamageLevel", "WorkRate", "NumFreeTechs", "RushBuilding", "BaseHurry", "HurryMultiplier", "BaseGold", "NumGoldPerEra", "SpreadReligion", "IsReligious", "CombatLimit", "RangeAttackOnlyInDomain", "RangeAttackIgnoreLOS", "RangedCombatLimit", "XPValueAttack", "XPValueDefense", "SpecialCargo", "DomainCargo", "Conscription", "ExtraMaintenanceCost", "NoMaintenance", "Unhappiness",
			("ART_DEF_UNIT_LIGHT_TANK_2"), "UnitArtInfoCulturalVariation", "UnitArtInfoEraVariation", "ProjectPrereq", "SpaceshipProject", "LeaderPromotion", "LeaderExperience", "DontShowYields", "ShowInPedia", "MoveRate",
			("1"), "PortraitIndex", "IconAtlas", ("WW2_UNIT_FLAGS")
	FROM "Units" WHERE (Type = "UNIT_LIGHT_TANK");
INSERT INTO "Unit_AITypes" ('UnitType', 'UnitAIType')
	SELECT ("UNIT_LIGHT_TANK_2_B"), "UnitAIType"
	FROM "Unit_AITypes" WHERE (UnitType = "UNIT_LIGHT_TANK");
INSERT INTO "Unit_ClassUpgrades" ('UnitType', 'UnitClassType')
	SELECT ("UNIT_LIGHT_TANK_2_B"), "UnitClassType"
	FROM "Unit_ClassUpgrades" WHERE (UnitType = "UNIT_LIGHT_TANK");
INSERT INTO "Unit_Flavors" ('UnitType', 'FlavorType', 'Flavor')
	SELECT ("UNIT_LIGHT_TANK_2_B"), "FlavorType", "Flavor"
	FROM "Unit_Flavors" WHERE (UnitType = "UNIT_LIGHT_TANK");
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	SELECT ("UNIT_LIGHT_TANK_2_B"), "PromotionType"
	FROM "Unit_FreePromotions" WHERE (UnitType = "UNIT_LIGHT_TANK");
INSERT INTO "Unit_ResourceQuantityRequirements" ('UnitType', 'ResourceType', 'Cost')
	SELECT ("UNIT_LIGHT_TANK_2_B"), "ResourceType", "Cost"
	FROM "Unit_ResourceQuantityRequirements" WHERE (UnitType = "UNIT_LIGHT_TANK");
----

-- light tank 3
INSERT INTO "Units" ('Type', 'Description', 'Civilopedia', 'Strategy', 'Help', 'Requirements', 'Combat', 'RangedCombat', 'Cost', 'Moves', 'Immobile', 'Range', 'BaseSightRange', 'Class', 'Special', 'Capture', 'CombatClass', 'Domain', 'CivilianAttackPriority', 'DefaultUnitAI', 'Food', 'NoBadGoodies', 'RivalTerritory', 'MilitarySupport', 'MilitaryProduction', 'Pillage', 'Found', 'FoundAbroad', 'CultureBombRadius', 'GoldenAgeTurns', 'IgnoreBuildingDefense', 'PrereqResources', 'Mechanized', 'Suicide', 'CaptureWhileEmbarked', 'PrereqTech', 'ObsoleteTech', 'GoodyHutUpgradeUnitClass', 'HurryCostModifier', 'AdvancedStartCost', 'MinAreaSize', 'AirUnitCap', 'NukeDamageLevel', 'WorkRate', 'NumFreeTechs', 'RushBuilding', 'BaseHurry', 'HurryMultiplier', 'BaseGold', 'NumGoldPerEra', 'SpreadReligion', 'IsReligious', 'CombatLimit', 'RangeAttackOnlyInDomain', 'RangeAttackIgnoreLOS', 'RangedCombatLimit', 'XPValueAttack', 'XPValueDefense', 'SpecialCargo', 'DomainCargo', 'Conscription', 'ExtraMaintenanceCost', 'NoMaintenance', 'Unhappiness', 'UnitArtInfo', 'UnitArtInfoCulturalVariation', 'UnitArtInfoEraVariation', 'ProjectPrereq', 'SpaceshipProject', 'LeaderPromotion', 'LeaderExperience', 'DontShowYields', 'ShowInPedia', 'MoveRate', 'UnitFlagIconOffset', 'PortraitIndex', 'IconAtlas', 'UnitFlagAtlas')
	SELECT	("UNIT_LIGHT_TANK_3"), ("TXT_KEY_UNIT_LIGHT_TANK"), "Civilopedia", "Strategy", "Help", "Requirements",
			(50), "RangedCombat", (330), (5), "Immobile", "Range", "BaseSightRange", ("UNITCLASS_LIGHT_TANK_3"), "Special", "Capture", "CombatClass", "Domain", "CivilianAttackPriority", "DefaultUnitAI", "Food", "NoBadGoodies", "RivalTerritory", "MilitarySupport", "MilitaryProduction", "Pillage", "Found", "FoundAbroad", "CultureBombRadius", "GoldenAgeTurns", "IgnoreBuildingDefense", "PrereqResources", "Mechanized", "Suicide", "CaptureWhileEmbarked", "PrereqTech", "ObsoleteTech", "GoodyHutUpgradeUnitClass", "HurryCostModifier", "AdvancedStartCost", "MinAreaSize", "AirUnitCap", "NukeDamageLevel", "WorkRate", "NumFreeTechs", "RushBuilding", "BaseHurry", "HurryMultiplier", "BaseGold", "NumGoldPerEra", "SpreadReligion", "IsReligious", "CombatLimit", "RangeAttackOnlyInDomain", "RangeAttackIgnoreLOS", "RangedCombatLimit", "XPValueAttack", "XPValueDefense", "SpecialCargo", "DomainCargo", "Conscription", "ExtraMaintenanceCost", "NoMaintenance", "Unhappiness",
			("ART_DEF_UNIT_LIGHT_TANK_2"), "UnitArtInfoCulturalVariation", "UnitArtInfoEraVariation", "ProjectPrereq", "SpaceshipProject", "LeaderPromotion", "LeaderExperience", "DontShowYields", "ShowInPedia", "MoveRate",
			("1"), "PortraitIndex", "IconAtlas", ("WW2_UNIT_FLAGS")
	FROM "Units" WHERE (Type = "UNIT_LIGHT_TANK");
INSERT INTO "Unit_AITypes" ('UnitType', 'UnitAIType')
	SELECT ("UNIT_LIGHT_TANK_3"), "UnitAIType"
	FROM "Unit_AITypes" WHERE (UnitType = "UNIT_LIGHT_TANK");
INSERT INTO "Unit_ClassUpgrades" ('UnitType', 'UnitClassType')
	SELECT ("UNIT_LIGHT_TANK_3"), "UnitClassType"
	FROM "Unit_ClassUpgrades" WHERE (UnitType = "UNIT_LIGHT_TANK");
INSERT INTO "Unit_Flavors" ('UnitType', 'FlavorType', 'Flavor')
	SELECT ("UNIT_LIGHT_TANK_3"), "FlavorType", "Flavor"
	FROM "Unit_Flavors" WHERE (UnitType = "UNIT_LIGHT_TANK");
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	SELECT ("UNIT_LIGHT_TANK_3"), "PromotionType"
	FROM "Unit_FreePromotions" WHERE (UnitType = "UNIT_LIGHT_TANK");
INSERT INTO "Unit_ResourceQuantityRequirements" ('UnitType', 'ResourceType', 'Cost')
	SELECT ("UNIT_LIGHT_TANK_3"), "ResourceType", "Cost"
	FROM "Unit_ResourceQuantityRequirements" WHERE (UnitType = "UNIT_LIGHT_TANK");
----


-- Assault Gun
INSERT INTO "Units" ('Type', 'Description', 'Civilopedia', 'Strategy', 'Help', 'Requirements', 'Combat', 'RangedCombat', 'Cost', 'Moves', 'Immobile', 'Range', 'BaseSightRange', 'Class', 'Special', 'Capture', 'CombatClass', 'Domain', 'CivilianAttackPriority', 'DefaultUnitAI', 'Food', 'NoBadGoodies', 'RivalTerritory', 'MilitarySupport', 'MilitaryProduction', 'Pillage', 'Found', 'FoundAbroad', 'CultureBombRadius', 'GoldenAgeTurns', 'IgnoreBuildingDefense', 'PrereqResources', 'Mechanized', 'Suicide', 'CaptureWhileEmbarked', 'PrereqTech', 'ObsoleteTech', 'GoodyHutUpgradeUnitClass', 'HurryCostModifier', 'AdvancedStartCost', 'MinAreaSize', 'AirUnitCap', 'NukeDamageLevel', 'WorkRate', 'NumFreeTechs', 'RushBuilding', 'BaseHurry', 'HurryMultiplier', 'BaseGold', 'NumGoldPerEra', 'SpreadReligion', 'IsReligious', 'CombatLimit', 'RangeAttackOnlyInDomain', 'RangeAttackIgnoreLOS', 'RangedCombatLimit', 'XPValueAttack', 'XPValueDefense', 'SpecialCargo', 'DomainCargo', 'Conscription', 'ExtraMaintenanceCost', 'NoMaintenance', 'Unhappiness', 'UnitArtInfo', 'UnitArtInfoCulturalVariation', 'UnitArtInfoEraVariation', 'ProjectPrereq', 'SpaceshipProject', 'LeaderPromotion', 'LeaderExperience', 'DontShowYields', 'ShowInPedia', 'MoveRate', 'UnitFlagIconOffset', 'PortraitIndex', 'IconAtlas', 'UnitFlagAtlas')
	SELECT	("UNIT_ASSAULT_GUN"), ("TXT_KEY_UNIT_ASSAULT_GUN"), "Civilopedia", "Strategy", ("TXT_KEY_UNIT_HELP_ASSAULT_GUN"), "Requirements",
			(50), "RangedCombat", (375), (3), "Immobile", "Range", "BaseSightRange", ("UNITCLASS_ASSAULT_GUN"), "Special", "Capture", "CombatClass", "Domain", "CivilianAttackPriority", "DefaultUnitAI", "Food", "NoBadGoodies", "RivalTerritory", "MilitarySupport", "MilitaryProduction", "Pillage", "Found", "FoundAbroad", "CultureBombRadius", "GoldenAgeTurns", "IgnoreBuildingDefense", "PrereqResources", "Mechanized", "Suicide", "CaptureWhileEmbarked", "PrereqTech", "ObsoleteTech", "GoodyHutUpgradeUnitClass", "HurryCostModifier", "AdvancedStartCost", "MinAreaSize", "AirUnitCap", "NukeDamageLevel", "WorkRate", "NumFreeTechs", "RushBuilding", "BaseHurry", "HurryMultiplier", "BaseGold", "NumGoldPerEra", "SpreadReligion", "IsReligious", "CombatLimit", "RangeAttackOnlyInDomain", "RangeAttackIgnoreLOS", "RangedCombatLimit", "XPValueAttack", "XPValueDefense", "SpecialCargo", "DomainCargo", "Conscription", "ExtraMaintenanceCost", "NoMaintenance", "Unhappiness",
			("ART_DEF_UNIT_TANK"), "UnitArtInfoCulturalVariation", "UnitArtInfoEraVariation", "ProjectPrereq", "SpaceshipProject", "LeaderPromotion", "LeaderExperience", "DontShowYields", "ShowInPedia", "MoveRate",
			("28"), ("0"), ("WW2_UNIT_ICONS"), ("WW2_UNIT_FLAGS")
	FROM "Units" WHERE (Type = "UNIT_TANK");
INSERT INTO "Unit_AITypes" ('UnitType', 'UnitAIType')
	SELECT ("UNIT_ASSAULT_GUN"), "UnitAIType"
	FROM "Unit_AITypes" WHERE (UnitType = "UNIT_TANK");
INSERT INTO "Unit_ClassUpgrades" ('UnitType', 'UnitClassType')
	SELECT ("UNIT_ASSAULT_GUN"), "UnitClassType"
	FROM "Unit_ClassUpgrades" WHERE (UnitType = "UNIT_TANK");
INSERT INTO "Unit_Flavors" ('UnitType', 'FlavorType', 'Flavor')
	SELECT ("UNIT_ASSAULT_GUN"), "FlavorType", "Flavor"
	FROM "Unit_Flavors" WHERE (UnitType = "UNIT_TANK");
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	SELECT ("UNIT_ASSAULT_GUN"), "PromotionType"
	FROM "Unit_FreePromotions" WHERE (UnitType = "UNIT_TANK");
-- Assault Gun promotions
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	VALUES ( 'UNIT_ASSAULT_GUN', 'PROMOTION_DEFENSE_PENALTY' );
UPDATE Unit_FreePromotions
	SET UnitType = 'UNIT_ASSAULT_GUN', PromotionType = 'PROMOTION_ASSAULT_GUN'
	WHERE UnitType = 'UNIT_ASSAULT_GUN' AND PromotionType = 'PROMOTION_SMALL_CITY_PENALTY';	
DELETE FROM Unit_FreePromotions WHERE UnitType = 'UNIT_ASSAULT_GUN' AND PromotionType='PROMOTION_CAN_MOVE_AFTER_ATTACKING'; 
--
INSERT INTO "Unit_ResourceQuantityRequirements" ('UnitType', 'ResourceType', 'Cost')
	SELECT ("UNIT_ASSAULT_GUN"), "ResourceType", "Cost"
	FROM "Unit_ResourceQuantityRequirements" WHERE (UnitType = "UNIT_TANK");
----


-- Heavy Assault Gun
INSERT INTO "Units" ('Type', 'Description', 'Civilopedia', 'Strategy', 'Help', 'Requirements', 'Combat', 'RangedCombat', 'Cost', 'Moves', 'Immobile', 'Range', 'BaseSightRange', 'Class', 'Special', 'Capture', 'CombatClass', 'Domain', 'CivilianAttackPriority', 'DefaultUnitAI', 'Food', 'NoBadGoodies', 'RivalTerritory', 'MilitarySupport', 'MilitaryProduction', 'Pillage', 'Found', 'FoundAbroad', 'CultureBombRadius', 'GoldenAgeTurns', 'IgnoreBuildingDefense', 'PrereqResources', 'Mechanized', 'Suicide', 'CaptureWhileEmbarked', 'PrereqTech', 'ObsoleteTech', 'GoodyHutUpgradeUnitClass', 'HurryCostModifier', 'AdvancedStartCost', 'MinAreaSize', 'AirUnitCap', 'NukeDamageLevel', 'WorkRate', 'NumFreeTechs', 'RushBuilding', 'BaseHurry', 'HurryMultiplier', 'BaseGold', 'NumGoldPerEra', 'SpreadReligion', 'IsReligious', 'CombatLimit', 'RangeAttackOnlyInDomain', 'RangeAttackIgnoreLOS', 'RangedCombatLimit', 'XPValueAttack', 'XPValueDefense', 'SpecialCargo', 'DomainCargo', 'Conscription', 'ExtraMaintenanceCost', 'NoMaintenance', 'Unhappiness', 'UnitArtInfo', 'UnitArtInfoCulturalVariation', 'UnitArtInfoEraVariation', 'ProjectPrereq', 'SpaceshipProject', 'LeaderPromotion', 'LeaderExperience', 'DontShowYields', 'ShowInPedia', 'MoveRate', 'UnitFlagIconOffset', 'PortraitIndex', 'IconAtlas', 'UnitFlagAtlas')
	SELECT	("UNIT_HEAVY_ASSAULT_GUN"), ("TXT_KEY_UNIT_HEAVY_ASSAULT_GUN"), "Civilopedia", "Strategy", ("TXT_KEY_UNIT_HELP_HEAVY_ASSAULT_GUN"), "Requirements",
			(80), "RangedCombat", (660), (2), "Immobile", "Range", "BaseSightRange", ("UNITCLASS_HEAVY_ASSAULT_GUN"), "Special", "Capture", "CombatClass", "Domain", "CivilianAttackPriority", "DefaultUnitAI", "Food", "NoBadGoodies", "RivalTerritory", "MilitarySupport", "MilitaryProduction", "Pillage", "Found", "FoundAbroad", "CultureBombRadius", "GoldenAgeTurns", "IgnoreBuildingDefense", "PrereqResources", "Mechanized", "Suicide", "CaptureWhileEmbarked", "PrereqTech", "ObsoleteTech", "GoodyHutUpgradeUnitClass", "HurryCostModifier", "AdvancedStartCost", "MinAreaSize", "AirUnitCap", "NukeDamageLevel", "WorkRate", "NumFreeTechs", "RushBuilding", "BaseHurry", "HurryMultiplier", "BaseGold", "NumGoldPerEra", "SpreadReligion", "IsReligious", "CombatLimit", "RangeAttackOnlyInDomain", "RangeAttackIgnoreLOS", "RangedCombatLimit", "XPValueAttack", "XPValueDefense", "SpecialCargo", "DomainCargo", "Conscription", "ExtraMaintenanceCost", "NoMaintenance", "Unhappiness",
			("ART_DEF_UNIT_TANK"), "UnitArtInfoCulturalVariation", "UnitArtInfoEraVariation", "ProjectPrereq", "SpaceshipProject", "LeaderPromotion", "LeaderExperience", "DontShowYields", "ShowInPedia", "MoveRate",
			("28"), ("2"), ("WW2_UNIT_ICONS"), ("WW2_UNIT_FLAGS")
	FROM "Units" WHERE (Type = "UNIT_TANK");
INSERT INTO "Unit_AITypes" ('UnitType', 'UnitAIType')
	SELECT ("UNIT_HEAVY_ASSAULT_GUN"), "UnitAIType"
	FROM "Unit_AITypes" WHERE (UnitType = "UNIT_TANK");
INSERT INTO "Unit_ClassUpgrades" ('UnitType', 'UnitClassType')
	SELECT ("UNIT_HEAVY_ASSAULT_GUN"), "UnitClassType"
	FROM "Unit_ClassUpgrades" WHERE (UnitType = "UNIT_TANK");
INSERT INTO "Unit_Flavors" ('UnitType', 'FlavorType', 'Flavor')
	SELECT ("UNIT_HEAVY_ASSAULT_GUN"), "FlavorType", "Flavor"
	FROM "Unit_Flavors" WHERE (UnitType = "UNIT_TANK");
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	SELECT ("UNIT_HEAVY_ASSAULT_GUN"), "PromotionType"
	FROM "Unit_FreePromotions" WHERE (UnitType = "UNIT_TANK");
-- Heavy Assault Gun promotions
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	VALUES ( 'UNIT_HEAVY_ASSAULT_GUN', 'PROMOTION_DEFENSE_PENALTY' );
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	VALUES ( 'UNIT_HEAVY_ASSAULT_GUN', 'PROMOTION_HEAVY' );
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	VALUES ( 'UNIT_HEAVY_ASSAULT_GUN', 'PROMOTION_LARGE_TARGET' );
UPDATE Unit_FreePromotions
	SET UnitType = 'UNIT_HEAVY_ASSAULT_GUN', PromotionType = 'PROMOTION_ASSAULT_GUN'
	WHERE UnitType = 'UNIT_HEAVY_ASSAULT_GUN' AND PromotionType = 'PROMOTION_SMALL_CITY_PENALTY';	
DELETE FROM Unit_FreePromotions WHERE UnitType = 'UNIT_HEAVY_ASSAULT_GUN' AND PromotionType='PROMOTION_CAN_MOVE_AFTER_ATTACKING'; 
--
INSERT INTO "Unit_ResourceQuantityRequirements" ('UnitType', 'ResourceType', 'Cost')
	SELECT ("UNIT_HEAVY_ASSAULT_GUN"), "ResourceType", "Cost"
	FROM "Unit_ResourceQuantityRequirements" WHERE (UnitType = "UNIT_TANK");
----

-- Old Heavy Assault Gun
INSERT INTO "Units" ('Type', 'Description', 'Civilopedia', 'Strategy', 'Help', 'Requirements', 'Combat', 'RangedCombat', 'Cost', 'Moves', 'Immobile', 'Range', 'BaseSightRange', 'Class', 'Special', 'Capture', 'CombatClass', 'Domain', 'CivilianAttackPriority', 'DefaultUnitAI', 'Food', 'NoBadGoodies', 'RivalTerritory', 'MilitarySupport', 'MilitaryProduction', 'Pillage', 'Found', 'FoundAbroad', 'CultureBombRadius', 'GoldenAgeTurns', 'IgnoreBuildingDefense', 'PrereqResources', 'Mechanized', 'Suicide', 'CaptureWhileEmbarked', 'PrereqTech', 'ObsoleteTech', 'GoodyHutUpgradeUnitClass', 'HurryCostModifier', 'AdvancedStartCost', 'MinAreaSize', 'AirUnitCap', 'NukeDamageLevel', 'WorkRate', 'NumFreeTechs', 'RushBuilding', 'BaseHurry', 'HurryMultiplier', 'BaseGold', 'NumGoldPerEra', 'SpreadReligion', 'IsReligious', 'CombatLimit', 'RangeAttackOnlyInDomain', 'RangeAttackIgnoreLOS', 'RangedCombatLimit', 'XPValueAttack', 'XPValueDefense', 'SpecialCargo', 'DomainCargo', 'Conscription', 'ExtraMaintenanceCost', 'NoMaintenance', 'Unhappiness', 'UnitArtInfo', 'UnitArtInfoCulturalVariation', 'UnitArtInfoEraVariation', 'ProjectPrereq', 'SpaceshipProject', 'LeaderPromotion', 'LeaderExperience', 'DontShowYields', 'ShowInPedia', 'MoveRate', 'UnitFlagIconOffset', 'PortraitIndex', 'IconAtlas', 'UnitFlagAtlas')
	SELECT	("UNIT_OLD_HEAVY_ASSAULT_GUN"), ("TXT_KEY_UNIT_OLD_HEAVY_ASSAULT_GUN"), "Civilopedia", "Strategy", "Help", "Requirements",
			(70), "RangedCombat", (685), (1), "Immobile", "Range", "BaseSightRange", ("UNITCLASS_OLD_HEAVY_ASSAULT_GUN"), "Special", "Capture", "CombatClass", "Domain", "CivilianAttackPriority", "DefaultUnitAI", "Food", "NoBadGoodies", "RivalTerritory", "MilitarySupport", "MilitaryProduction", "Pillage", "Found", "FoundAbroad", "CultureBombRadius", "GoldenAgeTurns", "IgnoreBuildingDefense", "PrereqResources", "Mechanized", "Suicide", "CaptureWhileEmbarked", "PrereqTech", "ObsoleteTech", "GoodyHutUpgradeUnitClass", "HurryCostModifier", "AdvancedStartCost", "MinAreaSize", "AirUnitCap", "NukeDamageLevel", "WorkRate", "NumFreeTechs", "RushBuilding", "BaseHurry", "HurryMultiplier", "BaseGold", "NumGoldPerEra", "SpreadReligion", "IsReligious", "CombatLimit", "RangeAttackOnlyInDomain", "RangeAttackIgnoreLOS", "RangedCombatLimit", "XPValueAttack", "XPValueDefense", "SpecialCargo", "DomainCargo", "Conscription", "ExtraMaintenanceCost", "NoMaintenance", "Unhappiness",
			("ART_DEF_UNIT_TANK"), "UnitArtInfoCulturalVariation", "UnitArtInfoEraVariation", "ProjectPrereq", "SpaceshipProject", "LeaderPromotion", "LeaderExperience", "DontShowYields", "ShowInPedia", "MoveRate",
			("28"), "PortraitIndex", "IconAtlas", ("WW2_UNIT_FLAGS")
	FROM "Units" WHERE (Type = "UNIT_HEAVY_ASSAULT_GUN");
INSERT INTO "Unit_AITypes" ('UnitType', 'UnitAIType')
	SELECT ("UNIT_OLD_HEAVY_ASSAULT_GUN"), "UnitAIType"
	FROM "Unit_AITypes" WHERE (UnitType = "UNIT_HEAVY_ASSAULT_GUN");
INSERT INTO "Unit_ClassUpgrades" ('UnitType', 'UnitClassType')
	SELECT ("UNIT_OLD_HEAVY_ASSAULT_GUN"), "UnitClassType"
	FROM "Unit_ClassUpgrades" WHERE (UnitType = "UNIT_HEAVY_ASSAULT_GUN");
INSERT INTO "Unit_Flavors" ('UnitType', 'FlavorType', 'Flavor')
	SELECT ("UNIT_OLD_HEAVY_ASSAULT_GUN"), "FlavorType", "Flavor"
	FROM "Unit_Flavors" WHERE (UnitType = "UNIT_HEAVY_ASSAULT_GUN");
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	SELECT ("UNIT_OLD_HEAVY_ASSAULT_GUN"), "PromotionType"
	FROM "Unit_FreePromotions" WHERE (UnitType = "UNIT_HEAVY_ASSAULT_GUN");
INSERT INTO "Unit_ResourceQuantityRequirements" ('UnitType', 'ResourceType', 'Cost')
	SELECT ("UNIT_OLD_HEAVY_ASSAULT_GUN"), "ResourceType", "Cost"
	FROM "Unit_ResourceQuantityRequirements" WHERE (UnitType = "UNIT_HEAVY_ASSAULT_GUN");
----


-- Now that we have updated the light tanks and assault guns, based on vanilla tank statistic, update Tank promotions
-- as other Tanks have higher penalty against city...
UPDATE Unit_FreePromotions
	SET UnitType = 'UNIT_TANK', PromotionType = 'PROMOTION_CITY_PENALTY'
	WHERE UnitType = 'UNIT_TANK' AND PromotionType = 'PROMOTION_SMALL_CITY_PENALTY';
----


-- Cruiser Tank
INSERT INTO "Units" ('Type', 'Description', 'Civilopedia', 'Strategy', 'Help', 'Requirements', 'Combat', 'RangedCombat', 'Cost', 'Moves', 'Immobile', 'Range', 'BaseSightRange', 'Class', 'Special', 'Capture', 'CombatClass', 'Domain', 'CivilianAttackPriority', 'DefaultUnitAI', 'Food', 'NoBadGoodies', 'RivalTerritory', 'MilitarySupport', 'MilitaryProduction', 'Pillage', 'Found', 'FoundAbroad', 'CultureBombRadius', 'GoldenAgeTurns', 'IgnoreBuildingDefense', 'PrereqResources', 'Mechanized', 'Suicide', 'CaptureWhileEmbarked', 'PrereqTech', 'ObsoleteTech', 'GoodyHutUpgradeUnitClass', 'HurryCostModifier', 'AdvancedStartCost', 'MinAreaSize', 'AirUnitCap', 'NukeDamageLevel', 'WorkRate', 'NumFreeTechs', 'RushBuilding', 'BaseHurry', 'HurryMultiplier', 'BaseGold', 'NumGoldPerEra', 'SpreadReligion', 'IsReligious', 'CombatLimit', 'RangeAttackOnlyInDomain', 'RangeAttackIgnoreLOS', 'RangedCombatLimit', 'XPValueAttack', 'XPValueDefense', 'SpecialCargo', 'DomainCargo', 'Conscription', 'ExtraMaintenanceCost', 'NoMaintenance', 'Unhappiness', 'UnitArtInfo', 'UnitArtInfoCulturalVariation', 'UnitArtInfoEraVariation', 'ProjectPrereq', 'SpaceshipProject', 'LeaderPromotion', 'LeaderExperience', 'DontShowYields', 'ShowInPedia', 'MoveRate', 'UnitFlagIconOffset', 'PortraitIndex', 'IconAtlas', 'UnitFlagAtlas')
	SELECT	("UNIT_CRUISER_TANK"), ("TXT_KEY_UNIT_CRUISER_TANK"), "Civilopedia", "Strategy", ("TXT_KEY_UNIT_HELP_CRUISER_TANK"), "Requirements",
			(40), "RangedCombat", (375), (6), "Immobile", "Range", "BaseSightRange", ("UNITCLASS_CRUISER_TANK"), "Special", "Capture", "CombatClass", "Domain", "CivilianAttackPriority", "DefaultUnitAI", "Food", "NoBadGoodies", "RivalTerritory", "MilitarySupport", "MilitaryProduction", "Pillage", "Found", "FoundAbroad", "CultureBombRadius", "GoldenAgeTurns", "IgnoreBuildingDefense", "PrereqResources", "Mechanized", "Suicide", "CaptureWhileEmbarked", "PrereqTech", "ObsoleteTech", "GoodyHutUpgradeUnitClass", "HurryCostModifier", "AdvancedStartCost", "MinAreaSize", "AirUnitCap", "NukeDamageLevel", "WorkRate", "NumFreeTechs", "RushBuilding", "BaseHurry", "HurryMultiplier", "BaseGold", "NumGoldPerEra", "SpreadReligion", "IsReligious", "CombatLimit", "RangeAttackOnlyInDomain", "RangeAttackIgnoreLOS", "RangedCombatLimit", "XPValueAttack", "XPValueDefense", "SpecialCargo", "DomainCargo", "Conscription", "ExtraMaintenanceCost", "NoMaintenance", "Unhappiness",
			("ART_DEF_UNIT_TANK"), "UnitArtInfoCulturalVariation", "UnitArtInfoEraVariation", "ProjectPrereq", "SpaceshipProject", "LeaderPromotion", "LeaderExperience", "DontShowYields", "ShowInPedia", "MoveRate",
			("1"), "PortraitIndex", "IconAtlas", ("WW2_UNIT_FLAGS")
	FROM "Units" WHERE (Type = "UNIT_TANK");
INSERT INTO "Unit_AITypes" ('UnitType', 'UnitAIType')
	SELECT ("UNIT_CRUISER_TANK"), "UnitAIType"
	FROM "Unit_AITypes" WHERE (UnitType = "UNIT_TANK");
INSERT INTO "Unit_ClassUpgrades" ('UnitType', 'UnitClassType')
	SELECT ("UNIT_CRUISER_TANK"), "UnitClassType"
	FROM "Unit_ClassUpgrades" WHERE (UnitType = "UNIT_TANK");
INSERT INTO "Unit_Flavors" ('UnitType', 'FlavorType', 'Flavor')
	SELECT ("UNIT_CRUISER_TANK"), "FlavorType", "Flavor"
	FROM "Unit_Flavors" WHERE (UnitType = "UNIT_TANK");
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	SELECT ("UNIT_CRUISER_TANK"), "PromotionType"
	FROM "Unit_FreePromotions" WHERE (UnitType = "UNIT_TANK");	
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	VALUES ( 'UNIT_CRUISER_TANK', 'PROMOTION_DEFENSE_PENALTY' );
INSERT INTO "Unit_ResourceQuantityRequirements" ('UnitType', 'ResourceType', 'Cost')
	SELECT ("UNIT_CRUISER_TANK"), "ResourceType", "Cost"
	FROM "Unit_ResourceQuantityRequirements" WHERE (UnitType = "UNIT_TANK");
----

-- Cruiser Tank B
INSERT INTO "Units" ('Type', 'Description', 'Civilopedia', 'Strategy', 'Help', 'Requirements', 'Combat', 'RangedCombat', 'Cost', 'Moves', 'Immobile', 'Range', 'BaseSightRange', 'Class', 'Special', 'Capture', 'CombatClass', 'Domain', 'CivilianAttackPriority', 'DefaultUnitAI', 'Food', 'NoBadGoodies', 'RivalTerritory', 'MilitarySupport', 'MilitaryProduction', 'Pillage', 'Found', 'FoundAbroad', 'CultureBombRadius', 'GoldenAgeTurns', 'IgnoreBuildingDefense', 'PrereqResources', 'Mechanized', 'Suicide', 'CaptureWhileEmbarked', 'PrereqTech', 'ObsoleteTech', 'GoodyHutUpgradeUnitClass', 'HurryCostModifier', 'AdvancedStartCost', 'MinAreaSize', 'AirUnitCap', 'NukeDamageLevel', 'WorkRate', 'NumFreeTechs', 'RushBuilding', 'BaseHurry', 'HurryMultiplier', 'BaseGold', 'NumGoldPerEra', 'SpreadReligion', 'IsReligious', 'CombatLimit', 'RangeAttackOnlyInDomain', 'RangeAttackIgnoreLOS', 'RangedCombatLimit', 'XPValueAttack', 'XPValueDefense', 'SpecialCargo', 'DomainCargo', 'Conscription', 'ExtraMaintenanceCost', 'NoMaintenance', 'Unhappiness', 'UnitArtInfo', 'UnitArtInfoCulturalVariation', 'UnitArtInfoEraVariation', 'ProjectPrereq', 'SpaceshipProject', 'LeaderPromotion', 'LeaderExperience', 'DontShowYields', 'ShowInPedia', 'MoveRate', 'UnitFlagIconOffset', 'PortraitIndex', 'IconAtlas', 'UnitFlagAtlas')
	SELECT	("UNIT_CRUISER_TANK_B"), "Description", "Civilopedia", "Strategy", "Help", "Requirements",
			(42), "RangedCombat", (380), (6), "Immobile", "Range", "BaseSightRange", ("UNITCLASS_CRUISER_TANK_B"), "Special", "Capture", "CombatClass", "Domain", "CivilianAttackPriority", "DefaultUnitAI", "Food", "NoBadGoodies", "RivalTerritory", "MilitarySupport", "MilitaryProduction", "Pillage", "Found", "FoundAbroad", "CultureBombRadius", "GoldenAgeTurns", "IgnoreBuildingDefense", "PrereqResources", "Mechanized", "Suicide", "CaptureWhileEmbarked", "PrereqTech", "ObsoleteTech", "GoodyHutUpgradeUnitClass", "HurryCostModifier", "AdvancedStartCost", "MinAreaSize", "AirUnitCap", "NukeDamageLevel", "WorkRate", "NumFreeTechs", "RushBuilding", "BaseHurry", "HurryMultiplier", "BaseGold", "NumGoldPerEra", "SpreadReligion", "IsReligious", "CombatLimit", "RangeAttackOnlyInDomain", "RangeAttackIgnoreLOS", "RangedCombatLimit", "XPValueAttack", "XPValueDefense", "SpecialCargo", "DomainCargo", "Conscription", "ExtraMaintenanceCost", "NoMaintenance", "Unhappiness",
			("ART_DEF_UNIT_TANK"), "UnitArtInfoCulturalVariation", "UnitArtInfoEraVariation", "ProjectPrereq", "SpaceshipProject", "LeaderPromotion", "LeaderExperience", "DontShowYields", "ShowInPedia", "MoveRate",
			("1"), "PortraitIndex", "IconAtlas", ("WW2_UNIT_FLAGS")
	FROM "Units" WHERE (Type = "UNIT_CRUISER_TANK");
INSERT INTO "Unit_AITypes" ('UnitType', 'UnitAIType')
	SELECT ("UNIT_CRUISER_TANK_B"), "UnitAIType"
	FROM "Unit_AITypes" WHERE (UnitType = "UNIT_CRUISER_TANK");
INSERT INTO "Unit_ClassUpgrades" ('UnitType', 'UnitClassType')
	SELECT ("UNIT_CRUISER_TANK_B"), "UnitClassType"
	FROM "Unit_ClassUpgrades" WHERE (UnitType = "UNIT_CRUISER_TANK");
INSERT INTO "Unit_Flavors" ('UnitType', 'FlavorType', 'Flavor')
	SELECT ("UNIT_CRUISER_TANK_B"), "FlavorType", "Flavor"
	FROM "Unit_Flavors" WHERE (UnitType = "UNIT_CRUISER_TANK");
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	SELECT ("UNIT_CRUISER_TANK_B"), "PromotionType"
	FROM "Unit_FreePromotions" WHERE (UnitType = "UNIT_CRUISER_TANK");	
INSERT INTO "Unit_ResourceQuantityRequirements" ('UnitType', 'ResourceType', 'Cost')
	SELECT ("UNIT_CRUISER_TANK_B"), "ResourceType", "Cost"
	FROM "Unit_ResourceQuantityRequirements" WHERE (UnitType = "UNIT_CRUISER_TANK");
----

-- Cruiser Tank 2
INSERT INTO "Units" ('Type', 'Description', 'Civilopedia', 'Strategy', 'Help', 'Requirements', 'Combat', 'RangedCombat', 'Cost', 'Moves', 'Immobile', 'Range', 'BaseSightRange', 'Class', 'Special', 'Capture', 'CombatClass', 'Domain', 'CivilianAttackPriority', 'DefaultUnitAI', 'Food', 'NoBadGoodies', 'RivalTerritory', 'MilitarySupport', 'MilitaryProduction', 'Pillage', 'Found', 'FoundAbroad', 'CultureBombRadius', 'GoldenAgeTurns', 'IgnoreBuildingDefense', 'PrereqResources', 'Mechanized', 'Suicide', 'CaptureWhileEmbarked', 'PrereqTech', 'ObsoleteTech', 'GoodyHutUpgradeUnitClass', 'HurryCostModifier', 'AdvancedStartCost', 'MinAreaSize', 'AirUnitCap', 'NukeDamageLevel', 'WorkRate', 'NumFreeTechs', 'RushBuilding', 'BaseHurry', 'HurryMultiplier', 'BaseGold', 'NumGoldPerEra', 'SpreadReligion', 'IsReligious', 'CombatLimit', 'RangeAttackOnlyInDomain', 'RangeAttackIgnoreLOS', 'RangedCombatLimit', 'XPValueAttack', 'XPValueDefense', 'SpecialCargo', 'DomainCargo', 'Conscription', 'ExtraMaintenanceCost', 'NoMaintenance', 'Unhappiness', 'UnitArtInfo', 'UnitArtInfoCulturalVariation', 'UnitArtInfoEraVariation', 'ProjectPrereq', 'SpaceshipProject', 'LeaderPromotion', 'LeaderExperience', 'DontShowYields', 'ShowInPedia', 'MoveRate', 'UnitFlagIconOffset', 'PortraitIndex', 'IconAtlas', 'UnitFlagAtlas')
	SELECT	("UNIT_CRUISER_TANK_2"), "Description", "Civilopedia", "Strategy", "Help", "Requirements",
			(45), "RangedCombat", (385), (6), "Immobile", "Range", "BaseSightRange", ("UNITCLASS_CRUISER_TANK_2"), "Special", "Capture", "CombatClass", "Domain", "CivilianAttackPriority", "DefaultUnitAI", "Food", "NoBadGoodies", "RivalTerritory", "MilitarySupport", "MilitaryProduction", "Pillage", "Found", "FoundAbroad", "CultureBombRadius", "GoldenAgeTurns", "IgnoreBuildingDefense", "PrereqResources", "Mechanized", "Suicide", "CaptureWhileEmbarked", "PrereqTech", "ObsoleteTech", "GoodyHutUpgradeUnitClass", "HurryCostModifier", "AdvancedStartCost", "MinAreaSize", "AirUnitCap", "NukeDamageLevel", "WorkRate", "NumFreeTechs", "RushBuilding", "BaseHurry", "HurryMultiplier", "BaseGold", "NumGoldPerEra", "SpreadReligion", "IsReligious", "CombatLimit", "RangeAttackOnlyInDomain", "RangeAttackIgnoreLOS", "RangedCombatLimit", "XPValueAttack", "XPValueDefense", "SpecialCargo", "DomainCargo", "Conscription", "ExtraMaintenanceCost", "NoMaintenance", "Unhappiness",
			("ART_DEF_UNIT_TANK"), "UnitArtInfoCulturalVariation", "UnitArtInfoEraVariation", "ProjectPrereq", "SpaceshipProject", "LeaderPromotion", "LeaderExperience", "DontShowYields", "ShowInPedia", "MoveRate",
			("1"), "PortraitIndex", "IconAtlas", ("WW2_UNIT_FLAGS")
	FROM "Units" WHERE (Type = "UNIT_CRUISER_TANK");
INSERT INTO "Unit_AITypes" ('UnitType', 'UnitAIType')
	SELECT ("UNIT_CRUISER_TANK_2"), "UnitAIType"
	FROM "Unit_AITypes" WHERE (UnitType = "UNIT_CRUISER_TANK");
INSERT INTO "Unit_ClassUpgrades" ('UnitType', 'UnitClassType')
	SELECT ("UNIT_CRUISER_TANK_2"), "UnitClassType"
	FROM "Unit_ClassUpgrades" WHERE (UnitType = "UNIT_CRUISER_TANK");
INSERT INTO "Unit_Flavors" ('UnitType', 'FlavorType', 'Flavor')
	SELECT ("UNIT_CRUISER_TANK_2"), "FlavorType", "Flavor"
	FROM "Unit_Flavors" WHERE (UnitType = "UNIT_CRUISER_TANK");
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	SELECT ("UNIT_CRUISER_TANK_2"), "PromotionType"
	FROM "Unit_FreePromotions" WHERE (UnitType = "UNIT_CRUISER_TANK");	
INSERT INTO "Unit_ResourceQuantityRequirements" ('UnitType', 'ResourceType', 'Cost')
	SELECT ("UNIT_CRUISER_TANK_2"), "ResourceType", "Cost"
	FROM "Unit_ResourceQuantityRequirements" WHERE (UnitType = "UNIT_CRUISER_TANK");
----

-- Cruiser Tank 2 B
INSERT INTO "Units" ('Type', 'Description', 'Civilopedia', 'Strategy', 'Help', 'Requirements', 'Combat', 'RangedCombat', 'Cost', 'Moves', 'Immobile', 'Range', 'BaseSightRange', 'Class', 'Special', 'Capture', 'CombatClass', 'Domain', 'CivilianAttackPriority', 'DefaultUnitAI', 'Food', 'NoBadGoodies', 'RivalTerritory', 'MilitarySupport', 'MilitaryProduction', 'Pillage', 'Found', 'FoundAbroad', 'CultureBombRadius', 'GoldenAgeTurns', 'IgnoreBuildingDefense', 'PrereqResources', 'Mechanized', 'Suicide', 'CaptureWhileEmbarked', 'PrereqTech', 'ObsoleteTech', 'GoodyHutUpgradeUnitClass', 'HurryCostModifier', 'AdvancedStartCost', 'MinAreaSize', 'AirUnitCap', 'NukeDamageLevel', 'WorkRate', 'NumFreeTechs', 'RushBuilding', 'BaseHurry', 'HurryMultiplier', 'BaseGold', 'NumGoldPerEra', 'SpreadReligion', 'IsReligious', 'CombatLimit', 'RangeAttackOnlyInDomain', 'RangeAttackIgnoreLOS', 'RangedCombatLimit', 'XPValueAttack', 'XPValueDefense', 'SpecialCargo', 'DomainCargo', 'Conscription', 'ExtraMaintenanceCost', 'NoMaintenance', 'Unhappiness', 'UnitArtInfo', 'UnitArtInfoCulturalVariation', 'UnitArtInfoEraVariation', 'ProjectPrereq', 'SpaceshipProject', 'LeaderPromotion', 'LeaderExperience', 'DontShowYields', 'ShowInPedia', 'MoveRate', 'UnitFlagIconOffset', 'PortraitIndex', 'IconAtlas', 'UnitFlagAtlas')
	SELECT	("UNIT_CRUISER_TANK_2_B"), "Description", "Civilopedia", "Strategy", "Help", "Requirements",
			(47), "RangedCombat", (390), (6), "Immobile", "Range", "BaseSightRange", ("UNITCLASS_CRUISER_TANK_2_B"), "Special", "Capture", "CombatClass", "Domain", "CivilianAttackPriority", "DefaultUnitAI", "Food", "NoBadGoodies", "RivalTerritory", "MilitarySupport", "MilitaryProduction", "Pillage", "Found", "FoundAbroad", "CultureBombRadius", "GoldenAgeTurns", "IgnoreBuildingDefense", "PrereqResources", "Mechanized", "Suicide", "CaptureWhileEmbarked", "PrereqTech", "ObsoleteTech", "GoodyHutUpgradeUnitClass", "HurryCostModifier", "AdvancedStartCost", "MinAreaSize", "AirUnitCap", "NukeDamageLevel", "WorkRate", "NumFreeTechs", "RushBuilding", "BaseHurry", "HurryMultiplier", "BaseGold", "NumGoldPerEra", "SpreadReligion", "IsReligious", "CombatLimit", "RangeAttackOnlyInDomain", "RangeAttackIgnoreLOS", "RangedCombatLimit", "XPValueAttack", "XPValueDefense", "SpecialCargo", "DomainCargo", "Conscription", "ExtraMaintenanceCost", "NoMaintenance", "Unhappiness",
			("ART_DEF_UNIT_TANK"), "UnitArtInfoCulturalVariation", "UnitArtInfoEraVariation", "ProjectPrereq", "SpaceshipProject", "LeaderPromotion", "LeaderExperience", "DontShowYields", "ShowInPedia", "MoveRate",
			("1"), "PortraitIndex", "IconAtlas", ("WW2_UNIT_FLAGS")
	FROM "Units" WHERE (Type = "UNIT_CRUISER_TANK");
INSERT INTO "Unit_AITypes" ('UnitType', 'UnitAIType')
	SELECT ("UNIT_CRUISER_TANK_2_B"), "UnitAIType"
	FROM "Unit_AITypes" WHERE (UnitType = "UNIT_CRUISER_TANK");
INSERT INTO "Unit_ClassUpgrades" ('UnitType', 'UnitClassType')
	SELECT ("UNIT_CRUISER_TANK_2_B"), "UnitClassType"
	FROM "Unit_ClassUpgrades" WHERE (UnitType = "UNIT_CRUISER_TANK");
INSERT INTO "Unit_Flavors" ('UnitType', 'FlavorType', 'Flavor')
	SELECT ("UNIT_CRUISER_TANK_2_B"), "FlavorType", "Flavor"
	FROM "Unit_Flavors" WHERE (UnitType = "UNIT_CRUISER_TANK");
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	SELECT ("UNIT_CRUISER_TANK_2_B"), "PromotionType"
	FROM "Unit_FreePromotions" WHERE (UnitType = "UNIT_CRUISER_TANK");	
INSERT INTO "Unit_ResourceQuantityRequirements" ('UnitType', 'ResourceType', 'Cost')
	SELECT ("UNIT_CRUISER_TANK_2_B"), "ResourceType", "Cost"
	FROM "Unit_ResourceQuantityRequirements" WHERE (UnitType = "UNIT_CRUISER_TANK");
----


-- Cruiser Tank 3
INSERT INTO "Units" ('Type', 'Description', 'Civilopedia', 'Strategy', 'Help', 'Requirements', 'Combat', 'RangedCombat', 'Cost', 'Moves', 'Immobile', 'Range', 'BaseSightRange', 'Class', 'Special', 'Capture', 'CombatClass', 'Domain', 'CivilianAttackPriority', 'DefaultUnitAI', 'Food', 'NoBadGoodies', 'RivalTerritory', 'MilitarySupport', 'MilitaryProduction', 'Pillage', 'Found', 'FoundAbroad', 'CultureBombRadius', 'GoldenAgeTurns', 'IgnoreBuildingDefense', 'PrereqResources', 'Mechanized', 'Suicide', 'CaptureWhileEmbarked', 'PrereqTech', 'ObsoleteTech', 'GoodyHutUpgradeUnitClass', 'HurryCostModifier', 'AdvancedStartCost', 'MinAreaSize', 'AirUnitCap', 'NukeDamageLevel', 'WorkRate', 'NumFreeTechs', 'RushBuilding', 'BaseHurry', 'HurryMultiplier', 'BaseGold', 'NumGoldPerEra', 'SpreadReligion', 'IsReligious', 'CombatLimit', 'RangeAttackOnlyInDomain', 'RangeAttackIgnoreLOS', 'RangedCombatLimit', 'XPValueAttack', 'XPValueDefense', 'SpecialCargo', 'DomainCargo', 'Conscription', 'ExtraMaintenanceCost', 'NoMaintenance', 'Unhappiness', 'UnitArtInfo', 'UnitArtInfoCulturalVariation', 'UnitArtInfoEraVariation', 'ProjectPrereq', 'SpaceshipProject', 'LeaderPromotion', 'LeaderExperience', 'DontShowYields', 'ShowInPedia', 'MoveRate', 'UnitFlagIconOffset', 'PortraitIndex', 'IconAtlas', 'UnitFlagAtlas')
	SELECT	("UNIT_CRUISER_TANK_3"), "Description", "Civilopedia", "Strategy", "Help", "Requirements",
			(48), "RangedCombat", (395), (6), "Immobile", "Range", "BaseSightRange", ("UNITCLASS_CRUISER_TANK_3"), "Special", "Capture", "CombatClass", "Domain", "CivilianAttackPriority", "DefaultUnitAI", "Food", "NoBadGoodies", "RivalTerritory", "MilitarySupport", "MilitaryProduction", "Pillage", "Found", "FoundAbroad", "CultureBombRadius", "GoldenAgeTurns", "IgnoreBuildingDefense", "PrereqResources", "Mechanized", "Suicide", "CaptureWhileEmbarked", "PrereqTech", "ObsoleteTech", "GoodyHutUpgradeUnitClass", "HurryCostModifier", "AdvancedStartCost", "MinAreaSize", "AirUnitCap", "NukeDamageLevel", "WorkRate", "NumFreeTechs", "RushBuilding", "BaseHurry", "HurryMultiplier", "BaseGold", "NumGoldPerEra", "SpreadReligion", "IsReligious", "CombatLimit", "RangeAttackOnlyInDomain", "RangeAttackIgnoreLOS", "RangedCombatLimit", "XPValueAttack", "XPValueDefense", "SpecialCargo", "DomainCargo", "Conscription", "ExtraMaintenanceCost", "NoMaintenance", "Unhappiness",
			("ART_DEF_UNIT_TANK"), "UnitArtInfoCulturalVariation", "UnitArtInfoEraVariation", "ProjectPrereq", "SpaceshipProject", "LeaderPromotion", "LeaderExperience", "DontShowYields", "ShowInPedia", "MoveRate",
			("1"), "PortraitIndex", "IconAtlas", ("WW2_UNIT_FLAGS")
	FROM "Units" WHERE (Type = "UNIT_CRUISER_TANK");
INSERT INTO "Unit_AITypes" ('UnitType', 'UnitAIType')
	SELECT ("UNIT_CRUISER_TANK_3"), "UnitAIType"
	FROM "Unit_AITypes" WHERE (UnitType = "UNIT_CRUISER_TANK");
INSERT INTO "Unit_ClassUpgrades" ('UnitType', 'UnitClassType')
	SELECT ("UNIT_CRUISER_TANK_3"), "UnitClassType"
	FROM "Unit_ClassUpgrades" WHERE (UnitType = "UNIT_CRUISER_TANK");
INSERT INTO "Unit_Flavors" ('UnitType', 'FlavorType', 'Flavor')
	SELECT ("UNIT_CRUISER_TANK_3"), "FlavorType", "Flavor"
	FROM "Unit_Flavors" WHERE (UnitType = "UNIT_CRUISER_TANK");
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	SELECT ("UNIT_CRUISER_TANK_3"), "PromotionType"
	FROM "Unit_FreePromotions" WHERE (UnitType = "UNIT_CRUISER_TANK");	
INSERT INTO "Unit_ResourceQuantityRequirements" ('UnitType', 'ResourceType', 'Cost')
	SELECT ("UNIT_CRUISER_TANK_3"), "ResourceType", "Cost"
	FROM "Unit_ResourceQuantityRequirements" WHERE (UnitType = "UNIT_CRUISER_TANK");
----


-- Cruiser Tank 4
INSERT INTO "Units" ('Type', 'Description', 'Civilopedia', 'Strategy', 'Help', 'Requirements', 'Combat', 'RangedCombat', 'Cost', 'Moves', 'Immobile', 'Range', 'BaseSightRange', 'Class', 'Special', 'Capture', 'CombatClass', 'Domain', 'CivilianAttackPriority', 'DefaultUnitAI', 'Food', 'NoBadGoodies', 'RivalTerritory', 'MilitarySupport', 'MilitaryProduction', 'Pillage', 'Found', 'FoundAbroad', 'CultureBombRadius', 'GoldenAgeTurns', 'IgnoreBuildingDefense', 'PrereqResources', 'Mechanized', 'Suicide', 'CaptureWhileEmbarked', 'PrereqTech', 'ObsoleteTech', 'GoodyHutUpgradeUnitClass', 'HurryCostModifier', 'AdvancedStartCost', 'MinAreaSize', 'AirUnitCap', 'NukeDamageLevel', 'WorkRate', 'NumFreeTechs', 'RushBuilding', 'BaseHurry', 'HurryMultiplier', 'BaseGold', 'NumGoldPerEra', 'SpreadReligion', 'IsReligious', 'CombatLimit', 'RangeAttackOnlyInDomain', 'RangeAttackIgnoreLOS', 'RangedCombatLimit', 'XPValueAttack', 'XPValueDefense', 'SpecialCargo', 'DomainCargo', 'Conscription', 'ExtraMaintenanceCost', 'NoMaintenance', 'Unhappiness', 'UnitArtInfo', 'UnitArtInfoCulturalVariation', 'UnitArtInfoEraVariation', 'ProjectPrereq', 'SpaceshipProject', 'LeaderPromotion', 'LeaderExperience', 'DontShowYields', 'ShowInPedia', 'MoveRate', 'UnitFlagIconOffset', 'PortraitIndex', 'IconAtlas', 'UnitFlagAtlas')
	SELECT	("UNIT_CRUISER_TANK_4"), "Description", "Civilopedia", "Strategy", "Help", "Requirements",
			(50), "RangedCombat", (405), (6), "Immobile", "Range", "BaseSightRange", ("UNITCLASS_CRUISER_TANK_4"), "Special", "Capture", "CombatClass", "Domain", "CivilianAttackPriority", "DefaultUnitAI", "Food", "NoBadGoodies", "RivalTerritory", "MilitarySupport", "MilitaryProduction", "Pillage", "Found", "FoundAbroad", "CultureBombRadius", "GoldenAgeTurns", "IgnoreBuildingDefense", "PrereqResources", "Mechanized", "Suicide", "CaptureWhileEmbarked", "PrereqTech", "ObsoleteTech", "GoodyHutUpgradeUnitClass", "HurryCostModifier", "AdvancedStartCost", "MinAreaSize", "AirUnitCap", "NukeDamageLevel", "WorkRate", "NumFreeTechs", "RushBuilding", "BaseHurry", "HurryMultiplier", "BaseGold", "NumGoldPerEra", "SpreadReligion", "IsReligious", "CombatLimit", "RangeAttackOnlyInDomain", "RangeAttackIgnoreLOS", "RangedCombatLimit", "XPValueAttack", "XPValueDefense", "SpecialCargo", "DomainCargo", "Conscription", "ExtraMaintenanceCost", "NoMaintenance", "Unhappiness",
			("ART_DEF_UNIT_TANK"), "UnitArtInfoCulturalVariation", "UnitArtInfoEraVariation", "ProjectPrereq", "SpaceshipProject", "LeaderPromotion", "LeaderExperience", "DontShowYields", "ShowInPedia", "MoveRate",
			("1"), "PortraitIndex", "IconAtlas", ("WW2_UNIT_FLAGS")
	FROM "Units" WHERE (Type = "UNIT_CRUISER_TANK");
INSERT INTO "Unit_AITypes" ('UnitType', 'UnitAIType')
	SELECT ("UNIT_CRUISER_TANK_4"), "UnitAIType"
	FROM "Unit_AITypes" WHERE (UnitType = "UNIT_CRUISER_TANK");
INSERT INTO "Unit_ClassUpgrades" ('UnitType', 'UnitClassType')
	SELECT ("UNIT_CRUISER_TANK_4"), "UnitClassType"
	FROM "Unit_ClassUpgrades" WHERE (UnitType = "UNIT_CRUISER_TANK");
INSERT INTO "Unit_Flavors" ('UnitType', 'FlavorType', 'Flavor')
	SELECT ("UNIT_CRUISER_TANK_4"), "FlavorType", "Flavor"
	FROM "Unit_Flavors" WHERE (UnitType = "UNIT_CRUISER_TANK");
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	SELECT ("UNIT_CRUISER_TANK_4"), "PromotionType"
	FROM "Unit_FreePromotions" WHERE (UnitType = "UNIT_CRUISER_TANK");	
INSERT INTO "Unit_ResourceQuantityRequirements" ('UnitType', 'ResourceType', 'Cost')
	SELECT ("UNIT_CRUISER_TANK_4"), "ResourceType", "Cost"
	FROM "Unit_ResourceQuantityRequirements" WHERE (UnitType = "UNIT_CRUISER_TANK");
----


-- Cruiser Tank 4B
INSERT INTO "Units" ('Type', 'Description', 'Civilopedia', 'Strategy', 'Help', 'Requirements', 'Combat', 'RangedCombat', 'Cost', 'Moves', 'Immobile', 'Range', 'BaseSightRange', 'Class', 'Special', 'Capture', 'CombatClass', 'Domain', 'CivilianAttackPriority', 'DefaultUnitAI', 'Food', 'NoBadGoodies', 'RivalTerritory', 'MilitarySupport', 'MilitaryProduction', 'Pillage', 'Found', 'FoundAbroad', 'CultureBombRadius', 'GoldenAgeTurns', 'IgnoreBuildingDefense', 'PrereqResources', 'Mechanized', 'Suicide', 'CaptureWhileEmbarked', 'PrereqTech', 'ObsoleteTech', 'GoodyHutUpgradeUnitClass', 'HurryCostModifier', 'AdvancedStartCost', 'MinAreaSize', 'AirUnitCap', 'NukeDamageLevel', 'WorkRate', 'NumFreeTechs', 'RushBuilding', 'BaseHurry', 'HurryMultiplier', 'BaseGold', 'NumGoldPerEra', 'SpreadReligion', 'IsReligious', 'CombatLimit', 'RangeAttackOnlyInDomain', 'RangeAttackIgnoreLOS', 'RangedCombatLimit', 'XPValueAttack', 'XPValueDefense', 'SpecialCargo', 'DomainCargo', 'Conscription', 'ExtraMaintenanceCost', 'NoMaintenance', 'Unhappiness', 'UnitArtInfo', 'UnitArtInfoCulturalVariation', 'UnitArtInfoEraVariation', 'ProjectPrereq', 'SpaceshipProject', 'LeaderPromotion', 'LeaderExperience', 'DontShowYields', 'ShowInPedia', 'MoveRate', 'UnitFlagIconOffset', 'PortraitIndex', 'IconAtlas', 'UnitFlagAtlas')
	SELECT	("UNIT_CRUISER_TANK_4_B"), "Description", "Civilopedia", "Strategy", "Help", "Requirements",
			(52), "RangedCombat", (410), (6), "Immobile", "Range", "BaseSightRange", ("UNITCLASS_CRUISER_TANK_4_B"), "Special", "Capture", "CombatClass", "Domain", "CivilianAttackPriority", "DefaultUnitAI", "Food", "NoBadGoodies", "RivalTerritory", "MilitarySupport", "MilitaryProduction", "Pillage", "Found", "FoundAbroad", "CultureBombRadius", "GoldenAgeTurns", "IgnoreBuildingDefense", "PrereqResources", "Mechanized", "Suicide", "CaptureWhileEmbarked", "PrereqTech", "ObsoleteTech", "GoodyHutUpgradeUnitClass", "HurryCostModifier", "AdvancedStartCost", "MinAreaSize", "AirUnitCap", "NukeDamageLevel", "WorkRate", "NumFreeTechs", "RushBuilding", "BaseHurry", "HurryMultiplier", "BaseGold", "NumGoldPerEra", "SpreadReligion", "IsReligious", "CombatLimit", "RangeAttackOnlyInDomain", "RangeAttackIgnoreLOS", "RangedCombatLimit", "XPValueAttack", "XPValueDefense", "SpecialCargo", "DomainCargo", "Conscription", "ExtraMaintenanceCost", "NoMaintenance", "Unhappiness",
			("ART_DEF_UNIT_TANK"), "UnitArtInfoCulturalVariation", "UnitArtInfoEraVariation", "ProjectPrereq", "SpaceshipProject", "LeaderPromotion", "LeaderExperience", "DontShowYields", "ShowInPedia", "MoveRate",
			("1"), "PortraitIndex", "IconAtlas", ("WW2_UNIT_FLAGS")
	FROM "Units" WHERE (Type = "UNIT_CRUISER_TANK");
INSERT INTO "Unit_AITypes" ('UnitType', 'UnitAIType')
	SELECT ("UNIT_CRUISER_TANK_4_B"), "UnitAIType"
	FROM "Unit_AITypes" WHERE (UnitType = "UNIT_CRUISER_TANK");
INSERT INTO "Unit_ClassUpgrades" ('UnitType', 'UnitClassType')
	SELECT ("UNIT_CRUISER_TANK_4_B"), "UnitClassType"
	FROM "Unit_ClassUpgrades" WHERE (UnitType = "UNIT_CRUISER_TANK");
INSERT INTO "Unit_Flavors" ('UnitType', 'FlavorType', 'Flavor')
	SELECT ("UNIT_CRUISER_TANK_4_B"), "FlavorType", "Flavor"
	FROM "Unit_Flavors" WHERE (UnitType = "UNIT_CRUISER_TANK");
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	SELECT ("UNIT_CRUISER_TANK_4_B"), "PromotionType"
	FROM "Unit_FreePromotions" WHERE (UnitType = "UNIT_CRUISER_TANK");	
INSERT INTO "Unit_ResourceQuantityRequirements" ('UnitType', 'ResourceType', 'Cost')
	SELECT ("UNIT_CRUISER_TANK_4_B"), "ResourceType", "Cost"
	FROM "Unit_ResourceQuantityRequirements" WHERE (UnitType = "UNIT_CRUISER_TANK");
----


-- Obsolete Tank
INSERT INTO "Units" ('Type', 'Description', 'Civilopedia', 'Strategy', 'Help', 'Requirements', 'Combat', 'RangedCombat', 'Cost', 'Moves', 'Immobile', 'Range', 'BaseSightRange', 'Class', 'Special', 'Capture', 'CombatClass', 'Domain', 'CivilianAttackPriority', 'DefaultUnitAI', 'Food', 'NoBadGoodies', 'RivalTerritory', 'MilitarySupport', 'MilitaryProduction', 'Pillage', 'Found', 'FoundAbroad', 'CultureBombRadius', 'GoldenAgeTurns', 'IgnoreBuildingDefense', 'PrereqResources', 'Mechanized', 'Suicide', 'CaptureWhileEmbarked', 'PrereqTech', 'ObsoleteTech', 'GoodyHutUpgradeUnitClass', 'HurryCostModifier', 'AdvancedStartCost', 'MinAreaSize', 'AirUnitCap', 'NukeDamageLevel', 'WorkRate', 'NumFreeTechs', 'RushBuilding', 'BaseHurry', 'HurryMultiplier', 'BaseGold', 'NumGoldPerEra', 'SpreadReligion', 'IsReligious', 'CombatLimit', 'RangeAttackOnlyInDomain', 'RangeAttackIgnoreLOS', 'RangedCombatLimit', 'XPValueAttack', 'XPValueDefense', 'SpecialCargo', 'DomainCargo', 'Conscription', 'ExtraMaintenanceCost', 'NoMaintenance', 'Unhappiness', 'UnitArtInfo', 'UnitArtInfoCulturalVariation', 'UnitArtInfoEraVariation', 'ProjectPrereq', 'SpaceshipProject', 'LeaderPromotion', 'LeaderExperience', 'DontShowYields', 'ShowInPedia', 'MoveRate', 'UnitFlagIconOffset', 'PortraitIndex', 'IconAtlas', 'UnitFlagAtlas')
	SELECT	("UNIT_OLD_TANK"), ("TXT_KEY_UNIT_TANK"), "Civilopedia", "Strategy", "Help", "Requirements",
			(48), "RangedCombat", (375), (4), "Immobile", "Range", "BaseSightRange", ("UNITCLASS_OLD_TANK"), "Special", "Capture", "CombatClass", "Domain", "CivilianAttackPriority", "DefaultUnitAI", "Food", "NoBadGoodies", "RivalTerritory", "MilitarySupport", "MilitaryProduction", "Pillage", "Found", "FoundAbroad", "CultureBombRadius", "GoldenAgeTurns", "IgnoreBuildingDefense", "PrereqResources", "Mechanized", "Suicide", "CaptureWhileEmbarked", "PrereqTech", "ObsoleteTech", "GoodyHutUpgradeUnitClass", "HurryCostModifier", "AdvancedStartCost", "MinAreaSize", "AirUnitCap", "NukeDamageLevel", "WorkRate", "NumFreeTechs", "RushBuilding", "BaseHurry", "HurryMultiplier", "BaseGold", "NumGoldPerEra", "SpreadReligion", "IsReligious", "CombatLimit", "RangeAttackOnlyInDomain", "RangeAttackIgnoreLOS", "RangedCombatLimit", "XPValueAttack", "XPValueDefense", "SpecialCargo", "DomainCargo", "Conscription", "ExtraMaintenanceCost", "NoMaintenance", "Unhappiness",
			("ART_DEF_UNIT_TANK"), "UnitArtInfoCulturalVariation", "UnitArtInfoEraVariation", "ProjectPrereq", "SpaceshipProject", "LeaderPromotion", "LeaderExperience", "DontShowYields", "ShowInPedia", "MoveRate",
			("1"), "PortraitIndex", "IconAtlas", ("WW2_UNIT_FLAGS")
	FROM "Units" WHERE (Type = "UNIT_TANK");
INSERT INTO "Unit_AITypes" ('UnitType', 'UnitAIType')
	SELECT ("UNIT_OLD_TANK"), "UnitAIType"
	FROM "Unit_AITypes" WHERE (UnitType = "UNIT_TANK");
INSERT INTO "Unit_ClassUpgrades" ('UnitType', 'UnitClassType')
	SELECT ("UNIT_OLD_TANK"), "UnitClassType"
	FROM "Unit_ClassUpgrades" WHERE (UnitType = "UNIT_TANK");
INSERT INTO "Unit_Flavors" ('UnitType', 'FlavorType', 'Flavor')
	SELECT ("UNIT_OLD_TANK"), "FlavorType", "Flavor"
	FROM "Unit_Flavors" WHERE (UnitType = "UNIT_TANK");
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	SELECT ("UNIT_OLD_TANK"), "PromotionType"
	FROM "Unit_FreePromotions" WHERE (UnitType = "UNIT_TANK");
INSERT INTO "Unit_ResourceQuantityRequirements" ('UnitType', 'ResourceType', 'Cost')
	SELECT ("UNIT_OLD_TANK"), "ResourceType", "Cost"
	FROM "Unit_ResourceQuantityRequirements" WHERE (UnitType = "UNIT_TANK");
----

-- Tank B
INSERT INTO "Units" ('Type', 'Description', 'Civilopedia', 'Strategy', 'Help', 'Requirements', 'Combat', 'RangedCombat', 'Cost', 'Moves', 'Immobile', 'Range', 'BaseSightRange', 'Class', 'Special', 'Capture', 'CombatClass', 'Domain', 'CivilianAttackPriority', 'DefaultUnitAI', 'Food', 'NoBadGoodies', 'RivalTerritory', 'MilitarySupport', 'MilitaryProduction', 'Pillage', 'Found', 'FoundAbroad', 'CultureBombRadius', 'GoldenAgeTurns', 'IgnoreBuildingDefense', 'PrereqResources', 'Mechanized', 'Suicide', 'CaptureWhileEmbarked', 'PrereqTech', 'ObsoleteTech', 'GoodyHutUpgradeUnitClass', 'HurryCostModifier', 'AdvancedStartCost', 'MinAreaSize', 'AirUnitCap', 'NukeDamageLevel', 'WorkRate', 'NumFreeTechs', 'RushBuilding', 'BaseHurry', 'HurryMultiplier', 'BaseGold', 'NumGoldPerEra', 'SpreadReligion', 'IsReligious', 'CombatLimit', 'RangeAttackOnlyInDomain', 'RangeAttackIgnoreLOS', 'RangedCombatLimit', 'XPValueAttack', 'XPValueDefense', 'SpecialCargo', 'DomainCargo', 'Conscription', 'ExtraMaintenanceCost', 'NoMaintenance', 'Unhappiness', 'UnitArtInfo', 'UnitArtInfoCulturalVariation', 'UnitArtInfoEraVariation', 'ProjectPrereq', 'SpaceshipProject', 'LeaderPromotion', 'LeaderExperience', 'DontShowYields', 'ShowInPedia', 'MoveRate', 'UnitFlagIconOffset', 'PortraitIndex', 'IconAtlas', 'UnitFlagAtlas')
	SELECT	("UNIT_TANK_B"), ("TXT_KEY_UNIT_TANK"), "Civilopedia", "Strategy", "Help", "Requirements",
			(54), "RangedCombat", (380), (5), "Immobile", "Range", "BaseSightRange", ("UNITCLASS_TANK_B"), "Special", "Capture", "CombatClass", "Domain", "CivilianAttackPriority", "DefaultUnitAI", "Food", "NoBadGoodies", "RivalTerritory", "MilitarySupport", "MilitaryProduction", "Pillage", "Found", "FoundAbroad", "CultureBombRadius", "GoldenAgeTurns", "IgnoreBuildingDefense", "PrereqResources", "Mechanized", "Suicide", "CaptureWhileEmbarked", "PrereqTech", "ObsoleteTech", "GoodyHutUpgradeUnitClass", "HurryCostModifier", "AdvancedStartCost", "MinAreaSize", "AirUnitCap", "NukeDamageLevel", "WorkRate", "NumFreeTechs", "RushBuilding", "BaseHurry", "HurryMultiplier", "BaseGold", "NumGoldPerEra", "SpreadReligion", "IsReligious", "CombatLimit", "RangeAttackOnlyInDomain", "RangeAttackIgnoreLOS", "RangedCombatLimit", "XPValueAttack", "XPValueDefense", "SpecialCargo", "DomainCargo", "Conscription", "ExtraMaintenanceCost", "NoMaintenance", "Unhappiness",
			("ART_DEF_UNIT_TANK"), "UnitArtInfoCulturalVariation", "UnitArtInfoEraVariation", "ProjectPrereq", "SpaceshipProject", "LeaderPromotion", "LeaderExperience", "DontShowYields", "ShowInPedia", "MoveRate",
			("1"), "PortraitIndex", "IconAtlas", ("WW2_UNIT_FLAGS")
	FROM "Units" WHERE (Type = "UNIT_TANK");
INSERT INTO "Unit_AITypes" ('UnitType', 'UnitAIType')
	SELECT ("UNIT_TANK_B"), "UnitAIType"
	FROM "Unit_AITypes" WHERE (UnitType = "UNIT_TANK");
INSERT INTO "Unit_ClassUpgrades" ('UnitType', 'UnitClassType')
	SELECT ("UNIT_TANK_B"), "UnitClassType"
	FROM "Unit_ClassUpgrades" WHERE (UnitType = "UNIT_TANK");
INSERT INTO "Unit_Flavors" ('UnitType', 'FlavorType', 'Flavor')
	SELECT ("UNIT_TANK_B"), "FlavorType", "Flavor"
	FROM "Unit_Flavors" WHERE (UnitType = "UNIT_TANK");
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	SELECT ("UNIT_TANK_B"), "PromotionType"
	FROM "Unit_FreePromotions" WHERE (UnitType = "UNIT_TANK");
INSERT INTO "Unit_ResourceQuantityRequirements" ('UnitType', 'ResourceType', 'Cost')
	SELECT ("UNIT_TANK_B"), "ResourceType", "Cost"
	FROM "Unit_ResourceQuantityRequirements" WHERE (UnitType = "UNIT_TANK");
----

-- Tank C
INSERT INTO "Units" ('Type', 'Description', 'Civilopedia', 'Strategy', 'Help', 'Requirements', 'Combat', 'RangedCombat', 'Cost', 'Moves', 'Immobile', 'Range', 'BaseSightRange', 'Class', 'Special', 'Capture', 'CombatClass', 'Domain', 'CivilianAttackPriority', 'DefaultUnitAI', 'Food', 'NoBadGoodies', 'RivalTerritory', 'MilitarySupport', 'MilitaryProduction', 'Pillage', 'Found', 'FoundAbroad', 'CultureBombRadius', 'GoldenAgeTurns', 'IgnoreBuildingDefense', 'PrereqResources', 'Mechanized', 'Suicide', 'CaptureWhileEmbarked', 'PrereqTech', 'ObsoleteTech', 'GoodyHutUpgradeUnitClass', 'HurryCostModifier', 'AdvancedStartCost', 'MinAreaSize', 'AirUnitCap', 'NukeDamageLevel', 'WorkRate', 'NumFreeTechs', 'RushBuilding', 'BaseHurry', 'HurryMultiplier', 'BaseGold', 'NumGoldPerEra', 'SpreadReligion', 'IsReligious', 'CombatLimit', 'RangeAttackOnlyInDomain', 'RangeAttackIgnoreLOS', 'RangedCombatLimit', 'XPValueAttack', 'XPValueDefense', 'SpecialCargo', 'DomainCargo', 'Conscription', 'ExtraMaintenanceCost', 'NoMaintenance', 'Unhappiness', 'UnitArtInfo', 'UnitArtInfoCulturalVariation', 'UnitArtInfoEraVariation', 'ProjectPrereq', 'SpaceshipProject', 'LeaderPromotion', 'LeaderExperience', 'DontShowYields', 'ShowInPedia', 'MoveRate', 'UnitFlagIconOffset', 'PortraitIndex', 'IconAtlas', 'UnitFlagAtlas')
	SELECT	("UNIT_TANK_C"), ("TXT_KEY_UNIT_TANK"), "Civilopedia", "Strategy", "Help", "Requirements",
			(56), "RangedCombat", (385), (5), "Immobile", "Range", "BaseSightRange", ("UNITCLASS_TANK_C"), "Special", "Capture", "CombatClass", "Domain", "CivilianAttackPriority", "DefaultUnitAI", "Food", "NoBadGoodies", "RivalTerritory", "MilitarySupport", "MilitaryProduction", "Pillage", "Found", "FoundAbroad", "CultureBombRadius", "GoldenAgeTurns", "IgnoreBuildingDefense", "PrereqResources", "Mechanized", "Suicide", "CaptureWhileEmbarked", "PrereqTech", "ObsoleteTech", "GoodyHutUpgradeUnitClass", "HurryCostModifier", "AdvancedStartCost", "MinAreaSize", "AirUnitCap", "NukeDamageLevel", "WorkRate", "NumFreeTechs", "RushBuilding", "BaseHurry", "HurryMultiplier", "BaseGold", "NumGoldPerEra", "SpreadReligion", "IsReligious", "CombatLimit", "RangeAttackOnlyInDomain", "RangeAttackIgnoreLOS", "RangedCombatLimit", "XPValueAttack", "XPValueDefense", "SpecialCargo", "DomainCargo", "Conscription", "ExtraMaintenanceCost", "NoMaintenance", "Unhappiness",
			("ART_DEF_UNIT_TANK"), "UnitArtInfoCulturalVariation", "UnitArtInfoEraVariation", "ProjectPrereq", "SpaceshipProject", "LeaderPromotion", "LeaderExperience", "DontShowYields", "ShowInPedia", "MoveRate",
			("1"), "PortraitIndex", "IconAtlas", ("WW2_UNIT_FLAGS")
	FROM "Units" WHERE (Type = "UNIT_TANK");
INSERT INTO "Unit_AITypes" ('UnitType', 'UnitAIType')
	SELECT ("UNIT_TANK_C"), "UnitAIType"
	FROM "Unit_AITypes" WHERE (UnitType = "UNIT_TANK");
INSERT INTO "Unit_ClassUpgrades" ('UnitType', 'UnitClassType')
	SELECT ("UNIT_TANK_C"), "UnitClassType"
	FROM "Unit_ClassUpgrades" WHERE (UnitType = "UNIT_TANK");
INSERT INTO "Unit_Flavors" ('UnitType', 'FlavorType', 'Flavor')
	SELECT ("UNIT_TANK_C"), "FlavorType", "Flavor"
	FROM "Unit_Flavors" WHERE (UnitType = "UNIT_TANK");
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	SELECT ("UNIT_TANK_C"), "PromotionType"
	FROM "Unit_FreePromotions" WHERE (UnitType = "UNIT_TANK");
INSERT INTO "Unit_ResourceQuantityRequirements" ('UnitType', 'ResourceType', 'Cost')
	SELECT ("UNIT_TANK_C"), "ResourceType", "Cost"
	FROM "Unit_ResourceQuantityRequirements" WHERE (UnitType = "UNIT_TANK");
----

-- Tank 2
INSERT INTO "Units" ('Type', 'Description', 'Civilopedia', 'Strategy', 'Help', 'Requirements', 'Combat', 'RangedCombat', 'Cost', 'Moves', 'Immobile', 'Range', 'BaseSightRange', 'Class', 'Special', 'Capture', 'CombatClass', 'Domain', 'CivilianAttackPriority', 'DefaultUnitAI', 'Food', 'NoBadGoodies', 'RivalTerritory', 'MilitarySupport', 'MilitaryProduction', 'Pillage', 'Found', 'FoundAbroad', 'CultureBombRadius', 'GoldenAgeTurns', 'IgnoreBuildingDefense', 'PrereqResources', 'Mechanized', 'Suicide', 'CaptureWhileEmbarked', 'PrereqTech', 'ObsoleteTech', 'GoodyHutUpgradeUnitClass', 'HurryCostModifier', 'AdvancedStartCost', 'MinAreaSize', 'AirUnitCap', 'NukeDamageLevel', 'WorkRate', 'NumFreeTechs', 'RushBuilding', 'BaseHurry', 'HurryMultiplier', 'BaseGold', 'NumGoldPerEra', 'SpreadReligion', 'IsReligious', 'CombatLimit', 'RangeAttackOnlyInDomain', 'RangeAttackIgnoreLOS', 'RangedCombatLimit', 'XPValueAttack', 'XPValueDefense', 'SpecialCargo', 'DomainCargo', 'Conscription', 'ExtraMaintenanceCost', 'NoMaintenance', 'Unhappiness', 'UnitArtInfo', 'UnitArtInfoCulturalVariation', 'UnitArtInfoEraVariation', 'ProjectPrereq', 'SpaceshipProject', 'LeaderPromotion', 'LeaderExperience', 'DontShowYields', 'ShowInPedia', 'MoveRate', 'UnitFlagIconOffset', 'PortraitIndex', 'IconAtlas', 'UnitFlagAtlas')
	SELECT	("UNIT_TANK_2"), ("TXT_KEY_UNIT_TANK"), "Civilopedia", "Strategy", "Help", "Requirements",
			(58), "RangedCombat", (385), (5), "Immobile", "Range", "BaseSightRange", ("UNITCLASS_TANK_2"), "Special", "Capture", "CombatClass", "Domain", "CivilianAttackPriority", "DefaultUnitAI", "Food", "NoBadGoodies", "RivalTerritory", "MilitarySupport", "MilitaryProduction", "Pillage", "Found", "FoundAbroad", "CultureBombRadius", "GoldenAgeTurns", "IgnoreBuildingDefense", "PrereqResources", "Mechanized", "Suicide", "CaptureWhileEmbarked", "PrereqTech", "ObsoleteTech", "GoodyHutUpgradeUnitClass", "HurryCostModifier", "AdvancedStartCost", "MinAreaSize", "AirUnitCap", "NukeDamageLevel", "WorkRate", "NumFreeTechs", "RushBuilding", "BaseHurry", "HurryMultiplier", "BaseGold", "NumGoldPerEra", "SpreadReligion", "IsReligious", "CombatLimit", "RangeAttackOnlyInDomain", "RangeAttackIgnoreLOS", "RangedCombatLimit", "XPValueAttack", "XPValueDefense", "SpecialCargo", "DomainCargo", "Conscription", "ExtraMaintenanceCost", "NoMaintenance", "Unhappiness",
			("ART_DEF_UNIT_TANK"), "UnitArtInfoCulturalVariation", "UnitArtInfoEraVariation", "ProjectPrereq", "SpaceshipProject", "LeaderPromotion", "LeaderExperience", "DontShowYields", "ShowInPedia", "MoveRate",
			("1"), "PortraitIndex", "IconAtlas", ("WW2_UNIT_FLAGS")
	FROM "Units" WHERE (Type = "UNIT_TANK");
INSERT INTO "Unit_AITypes" ('UnitType', 'UnitAIType')
	SELECT ("UNIT_TANK_2"), "UnitAIType"
	FROM "Unit_AITypes" WHERE (UnitType = "UNIT_TANK");
INSERT INTO "Unit_ClassUpgrades" ('UnitType', 'UnitClassType')
	SELECT ("UNIT_TANK_2"), "UnitClassType"
	FROM "Unit_ClassUpgrades" WHERE (UnitType = "UNIT_TANK");
INSERT INTO "Unit_Flavors" ('UnitType', 'FlavorType', 'Flavor')
	SELECT ("UNIT_TANK_2"), "FlavorType", "Flavor"
	FROM "Unit_Flavors" WHERE (UnitType = "UNIT_TANK");
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	SELECT ("UNIT_TANK_2"), "PromotionType"
	FROM "Unit_FreePromotions" WHERE (UnitType = "UNIT_TANK");
INSERT INTO "Unit_ResourceQuantityRequirements" ('UnitType', 'ResourceType', 'Cost')
	SELECT ("UNIT_TANK_2"), "ResourceType", "Cost"
	FROM "Unit_ResourceQuantityRequirements" WHERE (UnitType = "UNIT_TANK");
----

-- Tank 2 B
INSERT INTO "Units" ('Type', 'Description', 'Civilopedia', 'Strategy', 'Help', 'Requirements', 'Combat', 'RangedCombat', 'Cost', 'Moves', 'Immobile', 'Range', 'BaseSightRange', 'Class', 'Special', 'Capture', 'CombatClass', 'Domain', 'CivilianAttackPriority', 'DefaultUnitAI', 'Food', 'NoBadGoodies', 'RivalTerritory', 'MilitarySupport', 'MilitaryProduction', 'Pillage', 'Found', 'FoundAbroad', 'CultureBombRadius', 'GoldenAgeTurns', 'IgnoreBuildingDefense', 'PrereqResources', 'Mechanized', 'Suicide', 'CaptureWhileEmbarked', 'PrereqTech', 'ObsoleteTech', 'GoodyHutUpgradeUnitClass', 'HurryCostModifier', 'AdvancedStartCost', 'MinAreaSize', 'AirUnitCap', 'NukeDamageLevel', 'WorkRate', 'NumFreeTechs', 'RushBuilding', 'BaseHurry', 'HurryMultiplier', 'BaseGold', 'NumGoldPerEra', 'SpreadReligion', 'IsReligious', 'CombatLimit', 'RangeAttackOnlyInDomain', 'RangeAttackIgnoreLOS', 'RangedCombatLimit', 'XPValueAttack', 'XPValueDefense', 'SpecialCargo', 'DomainCargo', 'Conscription', 'ExtraMaintenanceCost', 'NoMaintenance', 'Unhappiness', 'UnitArtInfo', 'UnitArtInfoCulturalVariation', 'UnitArtInfoEraVariation', 'ProjectPrereq', 'SpaceshipProject', 'LeaderPromotion', 'LeaderExperience', 'DontShowYields', 'ShowInPedia', 'MoveRate', 'UnitFlagIconOffset', 'PortraitIndex', 'IconAtlas', 'UnitFlagAtlas')
	SELECT	("UNIT_TANK_2_B"), ("TXT_KEY_UNIT_TANK"), "Civilopedia", "Strategy", "Help", "Requirements",
			(62), "RangedCombat", (390), (5), "Immobile", "Range", "BaseSightRange", ("UNITCLASS_TANK_2_B"), "Special", "Capture", "CombatClass", "Domain", "CivilianAttackPriority", "DefaultUnitAI", "Food", "NoBadGoodies", "RivalTerritory", "MilitarySupport", "MilitaryProduction", "Pillage", "Found", "FoundAbroad", "CultureBombRadius", "GoldenAgeTurns", "IgnoreBuildingDefense", "PrereqResources", "Mechanized", "Suicide", "CaptureWhileEmbarked", "PrereqTech", "ObsoleteTech", "GoodyHutUpgradeUnitClass", "HurryCostModifier", "AdvancedStartCost", "MinAreaSize", "AirUnitCap", "NukeDamageLevel", "WorkRate", "NumFreeTechs", "RushBuilding", "BaseHurry", "HurryMultiplier", "BaseGold", "NumGoldPerEra", "SpreadReligion", "IsReligious", "CombatLimit", "RangeAttackOnlyInDomain", "RangeAttackIgnoreLOS", "RangedCombatLimit", "XPValueAttack", "XPValueDefense", "SpecialCargo", "DomainCargo", "Conscription", "ExtraMaintenanceCost", "NoMaintenance", "Unhappiness",
			("ART_DEF_UNIT_TANK"), "UnitArtInfoCulturalVariation", "UnitArtInfoEraVariation", "ProjectPrereq", "SpaceshipProject", "LeaderPromotion", "LeaderExperience", "DontShowYields", "ShowInPedia", "MoveRate",
			("1"), "PortraitIndex", "IconAtlas", ("WW2_UNIT_FLAGS")
	FROM "Units" WHERE (Type = "UNIT_TANK");
INSERT INTO "Unit_AITypes" ('UnitType', 'UnitAIType')
	SELECT ("UNIT_TANK_2_B"), "UnitAIType"
	FROM "Unit_AITypes" WHERE (UnitType = "UNIT_TANK");
INSERT INTO "Unit_ClassUpgrades" ('UnitType', 'UnitClassType')
	SELECT ("UNIT_TANK_2_B"), "UnitClassType"
	FROM "Unit_ClassUpgrades" WHERE (UnitType = "UNIT_TANK");
INSERT INTO "Unit_Flavors" ('UnitType', 'FlavorType', 'Flavor')
	SELECT ("UNIT_TANK_2_B"), "FlavorType", "Flavor"
	FROM "Unit_Flavors" WHERE (UnitType = "UNIT_TANK");
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	SELECT ("UNIT_TANK_2_B"), "PromotionType"
	FROM "Unit_FreePromotions" WHERE (UnitType = "UNIT_TANK");
INSERT INTO "Unit_ResourceQuantityRequirements" ('UnitType', 'ResourceType', 'Cost')
	SELECT ("UNIT_TANK_2_B"), "ResourceType", "Cost"
	FROM "Unit_ResourceQuantityRequirements" WHERE (UnitType = "UNIT_TANK");
----

-- Tank 2 C
INSERT INTO "Units" ('Type', 'Description', 'Civilopedia', 'Strategy', 'Help', 'Requirements', 'Combat', 'RangedCombat', 'Cost', 'Moves', 'Immobile', 'Range', 'BaseSightRange', 'Class', 'Special', 'Capture', 'CombatClass', 'Domain', 'CivilianAttackPriority', 'DefaultUnitAI', 'Food', 'NoBadGoodies', 'RivalTerritory', 'MilitarySupport', 'MilitaryProduction', 'Pillage', 'Found', 'FoundAbroad', 'CultureBombRadius', 'GoldenAgeTurns', 'IgnoreBuildingDefense', 'PrereqResources', 'Mechanized', 'Suicide', 'CaptureWhileEmbarked', 'PrereqTech', 'ObsoleteTech', 'GoodyHutUpgradeUnitClass', 'HurryCostModifier', 'AdvancedStartCost', 'MinAreaSize', 'AirUnitCap', 'NukeDamageLevel', 'WorkRate', 'NumFreeTechs', 'RushBuilding', 'BaseHurry', 'HurryMultiplier', 'BaseGold', 'NumGoldPerEra', 'SpreadReligion', 'IsReligious', 'CombatLimit', 'RangeAttackOnlyInDomain', 'RangeAttackIgnoreLOS', 'RangedCombatLimit', 'XPValueAttack', 'XPValueDefense', 'SpecialCargo', 'DomainCargo', 'Conscription', 'ExtraMaintenanceCost', 'NoMaintenance', 'Unhappiness', 'UnitArtInfo', 'UnitArtInfoCulturalVariation', 'UnitArtInfoEraVariation', 'ProjectPrereq', 'SpaceshipProject', 'LeaderPromotion', 'LeaderExperience', 'DontShowYields', 'ShowInPedia', 'MoveRate', 'UnitFlagIconOffset', 'PortraitIndex', 'IconAtlas', 'UnitFlagAtlas')
	SELECT	("UNIT_TANK_2_C"), ("TXT_KEY_UNIT_TANK"), "Civilopedia", "Strategy", "Help", "Requirements",
			(65), "RangedCombat", (395), (5), "Immobile", "Range", "BaseSightRange", ("UNITCLASS_TANK_2_C"), "Special", "Capture", "CombatClass", "Domain", "CivilianAttackPriority", "DefaultUnitAI", "Food", "NoBadGoodies", "RivalTerritory", "MilitarySupport", "MilitaryProduction", "Pillage", "Found", "FoundAbroad", "CultureBombRadius", "GoldenAgeTurns", "IgnoreBuildingDefense", "PrereqResources", "Mechanized", "Suicide", "CaptureWhileEmbarked", "PrereqTech", "ObsoleteTech", "GoodyHutUpgradeUnitClass", "HurryCostModifier", "AdvancedStartCost", "MinAreaSize", "AirUnitCap", "NukeDamageLevel", "WorkRate", "NumFreeTechs", "RushBuilding", "BaseHurry", "HurryMultiplier", "BaseGold", "NumGoldPerEra", "SpreadReligion", "IsReligious", "CombatLimit", "RangeAttackOnlyInDomain", "RangeAttackIgnoreLOS", "RangedCombatLimit", "XPValueAttack", "XPValueDefense", "SpecialCargo", "DomainCargo", "Conscription", "ExtraMaintenanceCost", "NoMaintenance", "Unhappiness",
			("ART_DEF_UNIT_TANK"), "UnitArtInfoCulturalVariation", "UnitArtInfoEraVariation", "ProjectPrereq", "SpaceshipProject", "LeaderPromotion", "LeaderExperience", "DontShowYields", "ShowInPedia", "MoveRate",
			("1"), "PortraitIndex", "IconAtlas", ("WW2_UNIT_FLAGS")
	FROM "Units" WHERE (Type = "UNIT_TANK");
INSERT INTO "Unit_AITypes" ('UnitType', 'UnitAIType')
	SELECT ("UNIT_TANK_2_C"), "UnitAIType"
	FROM "Unit_AITypes" WHERE (UnitType = "UNIT_TANK");
INSERT INTO "Unit_ClassUpgrades" ('UnitType', 'UnitClassType')
	SELECT ("UNIT_TANK_2_C"), "UnitClassType"
	FROM "Unit_ClassUpgrades" WHERE (UnitType = "UNIT_TANK");
INSERT INTO "Unit_Flavors" ('UnitType', 'FlavorType', 'Flavor')
	SELECT ("UNIT_TANK_2_C"), "FlavorType", "Flavor"
	FROM "Unit_Flavors" WHERE (UnitType = "UNIT_TANK");
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	SELECT ("UNIT_TANK_2_C"), "PromotionType"
	FROM "Unit_FreePromotions" WHERE (UnitType = "UNIT_TANK");
INSERT INTO "Unit_ResourceQuantityRequirements" ('UnitType', 'ResourceType', 'Cost')
	SELECT ("UNIT_TANK_2_C"), "ResourceType", "Cost"
	FROM "Unit_ResourceQuantityRequirements" WHERE (UnitType = "UNIT_TANK");
----

-- Tank 2 D
INSERT INTO "Units" ('Type', 'Description', 'Civilopedia', 'Strategy', 'Help', 'Requirements', 'Combat', 'RangedCombat', 'Cost', 'Moves', 'Immobile', 'Range', 'BaseSightRange', 'Class', 'Special', 'Capture', 'CombatClass', 'Domain', 'CivilianAttackPriority', 'DefaultUnitAI', 'Food', 'NoBadGoodies', 'RivalTerritory', 'MilitarySupport', 'MilitaryProduction', 'Pillage', 'Found', 'FoundAbroad', 'CultureBombRadius', 'GoldenAgeTurns', 'IgnoreBuildingDefense', 'PrereqResources', 'Mechanized', 'Suicide', 'CaptureWhileEmbarked', 'PrereqTech', 'ObsoleteTech', 'GoodyHutUpgradeUnitClass', 'HurryCostModifier', 'AdvancedStartCost', 'MinAreaSize', 'AirUnitCap', 'NukeDamageLevel', 'WorkRate', 'NumFreeTechs', 'RushBuilding', 'BaseHurry', 'HurryMultiplier', 'BaseGold', 'NumGoldPerEra', 'SpreadReligion', 'IsReligious', 'CombatLimit', 'RangeAttackOnlyInDomain', 'RangeAttackIgnoreLOS', 'RangedCombatLimit', 'XPValueAttack', 'XPValueDefense', 'SpecialCargo', 'DomainCargo', 'Conscription', 'ExtraMaintenanceCost', 'NoMaintenance', 'Unhappiness', 'UnitArtInfo', 'UnitArtInfoCulturalVariation', 'UnitArtInfoEraVariation', 'ProjectPrereq', 'SpaceshipProject', 'LeaderPromotion', 'LeaderExperience', 'DontShowYields', 'ShowInPedia', 'MoveRate', 'UnitFlagIconOffset', 'PortraitIndex', 'IconAtlas', 'UnitFlagAtlas')
	SELECT	("UNIT_TANK_2_D"), ("TXT_KEY_UNIT_TANK"), "Civilopedia", "Strategy", "Help", "Requirements",
			(70), "RangedCombat", (400), (5), "Immobile", "Range", "BaseSightRange", ("UNITCLASS_TANK_2_D"), "Special", "Capture", "CombatClass", "Domain", "CivilianAttackPriority", "DefaultUnitAI", "Food", "NoBadGoodies", "RivalTerritory", "MilitarySupport", "MilitaryProduction", "Pillage", "Found", "FoundAbroad", "CultureBombRadius", "GoldenAgeTurns", "IgnoreBuildingDefense", "PrereqResources", "Mechanized", "Suicide", "CaptureWhileEmbarked", "PrereqTech", "ObsoleteTech", "GoodyHutUpgradeUnitClass", "HurryCostModifier", "AdvancedStartCost", "MinAreaSize", "AirUnitCap", "NukeDamageLevel", "WorkRate", "NumFreeTechs", "RushBuilding", "BaseHurry", "HurryMultiplier", "BaseGold", "NumGoldPerEra", "SpreadReligion", "IsReligious", "CombatLimit", "RangeAttackOnlyInDomain", "RangeAttackIgnoreLOS", "RangedCombatLimit", "XPValueAttack", "XPValueDefense", "SpecialCargo", "DomainCargo", "Conscription", "ExtraMaintenanceCost", "NoMaintenance", "Unhappiness",
			("ART_DEF_UNIT_TANK"), "UnitArtInfoCulturalVariation", "UnitArtInfoEraVariation", "ProjectPrereq", "SpaceshipProject", "LeaderPromotion", "LeaderExperience", "DontShowYields", "ShowInPedia", "MoveRate",
			("1"), "PortraitIndex", "IconAtlas", ("WW2_UNIT_FLAGS")
	FROM "Units" WHERE (Type = "UNIT_TANK");
INSERT INTO "Unit_AITypes" ('UnitType', 'UnitAIType')
	SELECT ("UNIT_TANK_2_D"), "UnitAIType"
	FROM "Unit_AITypes" WHERE (UnitType = "UNIT_TANK");
INSERT INTO "Unit_ClassUpgrades" ('UnitType', 'UnitClassType')
	SELECT ("UNIT_TANK_2_D"), "UnitClassType"
	FROM "Unit_ClassUpgrades" WHERE (UnitType = "UNIT_TANK");
INSERT INTO "Unit_Flavors" ('UnitType', 'FlavorType', 'Flavor')
	SELECT ("UNIT_TANK_2_D"), "FlavorType", "Flavor"
	FROM "Unit_Flavors" WHERE (UnitType = "UNIT_TANK");
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	SELECT ("UNIT_TANK_2_D"), "PromotionType"
	FROM "Unit_FreePromotions" WHERE (UnitType = "UNIT_TANK");
INSERT INTO "Unit_ResourceQuantityRequirements" ('UnitType', 'ResourceType', 'Cost')
	SELECT ("UNIT_TANK_2_D"), "ResourceType", "Cost"
	FROM "Unit_ResourceQuantityRequirements" WHERE (UnitType = "UNIT_TANK");
----

-- Tank 3
INSERT INTO "Units" ('Type', 'Description', 'Civilopedia', 'Strategy', 'Help', 'Requirements', 'Combat', 'RangedCombat', 'Cost', 'Moves', 'Immobile', 'Range', 'BaseSightRange', 'Class', 'Special', 'Capture', 'CombatClass', 'Domain', 'CivilianAttackPriority', 'DefaultUnitAI', 'Food', 'NoBadGoodies', 'RivalTerritory', 'MilitarySupport', 'MilitaryProduction', 'Pillage', 'Found', 'FoundAbroad', 'CultureBombRadius', 'GoldenAgeTurns', 'IgnoreBuildingDefense', 'PrereqResources', 'Mechanized', 'Suicide', 'CaptureWhileEmbarked', 'PrereqTech', 'ObsoleteTech', 'GoodyHutUpgradeUnitClass', 'HurryCostModifier', 'AdvancedStartCost', 'MinAreaSize', 'AirUnitCap', 'NukeDamageLevel', 'WorkRate', 'NumFreeTechs', 'RushBuilding', 'BaseHurry', 'HurryMultiplier', 'BaseGold', 'NumGoldPerEra', 'SpreadReligion', 'IsReligious', 'CombatLimit', 'RangeAttackOnlyInDomain', 'RangeAttackIgnoreLOS', 'RangedCombatLimit', 'XPValueAttack', 'XPValueDefense', 'SpecialCargo', 'DomainCargo', 'Conscription', 'ExtraMaintenanceCost', 'NoMaintenance', 'Unhappiness', 'UnitArtInfo', 'UnitArtInfoCulturalVariation', 'UnitArtInfoEraVariation', 'ProjectPrereq', 'SpaceshipProject', 'LeaderPromotion', 'LeaderExperience', 'DontShowYields', 'ShowInPedia', 'MoveRate', 'UnitFlagIconOffset', 'PortraitIndex', 'IconAtlas', 'UnitFlagAtlas')
	SELECT	("UNIT_TANK_3"), ("TXT_KEY_UNIT_TANK"), "Civilopedia", "Strategy", "Help", "Requirements",
			(75), "RangedCombat", (395), (5), "Immobile", "Range", "BaseSightRange", ("UNITCLASS_TANK_3"), "Special", "Capture", "CombatClass", "Domain", "CivilianAttackPriority", "DefaultUnitAI", "Food", "NoBadGoodies", "RivalTerritory", "MilitarySupport", "MilitaryProduction", "Pillage", "Found", "FoundAbroad", "CultureBombRadius", "GoldenAgeTurns", "IgnoreBuildingDefense", "PrereqResources", "Mechanized", "Suicide", "CaptureWhileEmbarked", "PrereqTech", "ObsoleteTech", "GoodyHutUpgradeUnitClass", "HurryCostModifier", "AdvancedStartCost", "MinAreaSize", "AirUnitCap", "NukeDamageLevel", "WorkRate", "NumFreeTechs", "RushBuilding", "BaseHurry", "HurryMultiplier", "BaseGold", "NumGoldPerEra", "SpreadReligion", "IsReligious", "CombatLimit", "RangeAttackOnlyInDomain", "RangeAttackIgnoreLOS", "RangedCombatLimit", "XPValueAttack", "XPValueDefense", "SpecialCargo", "DomainCargo", "Conscription", "ExtraMaintenanceCost", "NoMaintenance", "Unhappiness",
			("ART_DEF_UNIT_TANK"), "UnitArtInfoCulturalVariation", "UnitArtInfoEraVariation", "ProjectPrereq", "SpaceshipProject", "LeaderPromotion", "LeaderExperience", "DontShowYields", "ShowInPedia", "MoveRate",
			("1"), "PortraitIndex", "IconAtlas", ("WW2_UNIT_FLAGS")
	FROM "Units" WHERE (Type = "UNIT_TANK");
INSERT INTO "Unit_AITypes" ('UnitType', 'UnitAIType')
	SELECT ("UNIT_TANK_3"), "UnitAIType"
	FROM "Unit_AITypes" WHERE (UnitType = "UNIT_TANK");
INSERT INTO "Unit_ClassUpgrades" ('UnitType', 'UnitClassType')
	SELECT ("UNIT_TANK_3"), "UnitClassType"
	FROM "Unit_ClassUpgrades" WHERE (UnitType = "UNIT_TANK");
INSERT INTO "Unit_Flavors" ('UnitType', 'FlavorType', 'Flavor')
	SELECT ("UNIT_TANK_3"), "FlavorType", "Flavor"
	FROM "Unit_Flavors" WHERE (UnitType = "UNIT_TANK");
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	SELECT ("UNIT_TANK_3"), "PromotionType"
	FROM "Unit_FreePromotions" WHERE (UnitType = "UNIT_TANK");
INSERT INTO "Unit_ResourceQuantityRequirements" ('UnitType', 'ResourceType', 'Cost')
	SELECT ("UNIT_TANK_3"), "ResourceType", "Cost"
	FROM "Unit_ResourceQuantityRequirements" WHERE (UnitType = "UNIT_TANK");
----

-- Heavy Tank
INSERT INTO "Units" ('Type', 'Description', 'Civilopedia', 'Strategy', 'Help', 'Requirements', 'Combat', 'RangedCombat', 'Cost', 'Moves', 'Immobile', 'Range', 'BaseSightRange', 'Class', 'Special', 'Capture', 'CombatClass', 'Domain', 'CivilianAttackPriority', 'DefaultUnitAI', 'Food', 'NoBadGoodies', 'RivalTerritory', 'MilitarySupport', 'MilitaryProduction', 'Pillage', 'Found', 'FoundAbroad', 'CultureBombRadius', 'GoldenAgeTurns', 'IgnoreBuildingDefense', 'PrereqResources', 'Mechanized', 'Suicide', 'CaptureWhileEmbarked', 'PrereqTech', 'ObsoleteTech', 'GoodyHutUpgradeUnitClass', 'HurryCostModifier', 'AdvancedStartCost', 'MinAreaSize', 'AirUnitCap', 'NukeDamageLevel', 'WorkRate', 'NumFreeTechs', 'RushBuilding', 'BaseHurry', 'HurryMultiplier', 'BaseGold', 'NumGoldPerEra', 'SpreadReligion', 'IsReligious', 'CombatLimit', 'RangeAttackOnlyInDomain', 'RangeAttackIgnoreLOS', 'RangedCombatLimit', 'XPValueAttack', 'XPValueDefense', 'SpecialCargo', 'DomainCargo', 'Conscription', 'ExtraMaintenanceCost', 'NoMaintenance', 'Unhappiness', 'UnitArtInfo', 'UnitArtInfoCulturalVariation', 'UnitArtInfoEraVariation', 'ProjectPrereq', 'SpaceshipProject', 'LeaderPromotion', 'LeaderExperience', 'DontShowYields', 'ShowInPedia', 'MoveRate', 'UnitFlagIconOffset', 'PortraitIndex', 'IconAtlas', 'UnitFlagAtlas')
	SELECT	("UNIT_HEAVY_TANK"), ("TXT_KEY_UNIT_HEAVY_TANK"), "Civilopedia", "Strategy", ("TXT_KEY_UNIT_HELP_HEAVY_TANK"), "Requirements",
			(65), "RangedCombat", (600), (3), "Immobile", "Range", "BaseSightRange", ("UNITCLASS_HEAVY_TANK"), "Special", "Capture", "CombatClass", "Domain", "CivilianAttackPriority", "DefaultUnitAI", "Food", "NoBadGoodies", "RivalTerritory", "MilitarySupport", "MilitaryProduction", "Pillage", "Found", "FoundAbroad", "CultureBombRadius", "GoldenAgeTurns", "IgnoreBuildingDefense", "PrereqResources", "Mechanized", "Suicide", "CaptureWhileEmbarked", "PrereqTech", "ObsoleteTech", "GoodyHutUpgradeUnitClass", "HurryCostModifier", "AdvancedStartCost", "MinAreaSize", "AirUnitCap", "NukeDamageLevel", "WorkRate", "NumFreeTechs", "RushBuilding", "BaseHurry", "HurryMultiplier", "BaseGold", "NumGoldPerEra", "SpreadReligion", "IsReligious", "CombatLimit", "RangeAttackOnlyInDomain", "RangeAttackIgnoreLOS", "RangedCombatLimit", "XPValueAttack", "XPValueDefense", "SpecialCargo", "DomainCargo", "Conscription", "ExtraMaintenanceCost", "NoMaintenance", "Unhappiness",
			("ART_DEF_UNIT_TANK"), "UnitArtInfoCulturalVariation", "UnitArtInfoEraVariation", "ProjectPrereq", "SpaceshipProject", "LeaderPromotion", "LeaderExperience", "DontShowYields", "ShowInPedia", "MoveRate",
			("1"), ("39"), "IconAtlas", ("WW2_UNIT_FLAGS")
			--("1"), ("1"), ("WW2_UNIT_ICONS"), ("WW2_UNIT_FLAGS") -- test for unit icons preview
	FROM "Units" WHERE (Type = "UNIT_TANK");
INSERT INTO "Unit_AITypes" ('UnitType', 'UnitAIType')
	SELECT ("UNIT_HEAVY_TANK"), "UnitAIType"
	FROM "Unit_AITypes" WHERE (UnitType = "UNIT_TANK");
INSERT INTO "Unit_ClassUpgrades" ('UnitType', 'UnitClassType')
	SELECT ("UNIT_HEAVY_TANK"), "UnitClassType"
	FROM "Unit_ClassUpgrades" WHERE (UnitType = "UNIT_TANK");
INSERT INTO "Unit_Flavors" ('UnitType', 'FlavorType', 'Flavor')
	SELECT ("UNIT_HEAVY_TANK"), "FlavorType", "Flavor"
	FROM "Unit_Flavors" WHERE (UnitType = "UNIT_TANK");
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	SELECT ("UNIT_HEAVY_TANK"), "PromotionType"
	FROM "Unit_FreePromotions" WHERE (UnitType = "UNIT_TANK");
-- Heavy Tanks promotions
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	VALUES ( 'UNIT_HEAVY_TANK', 'PROMOTION_HEAVY' );
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	VALUES ( 'UNIT_HEAVY_TANK', 'PROMOTION_LARGE_TARGET' );
UPDATE Unit_FreePromotions
	SET UnitType = 'UNIT_HEAVY_TANK', PromotionType = 'PROMOTION_HEAVY_TANK'
	WHERE UnitType = 'UNIT_HEAVY_TANK' AND PromotionType = 'PROMOTION_CITY_PENALTY';
INSERT INTO "Unit_ResourceQuantityRequirements" ('UnitType', 'ResourceType', 'Cost')
	SELECT ("UNIT_HEAVY_TANK"), "ResourceType", "Cost"
	FROM "Unit_ResourceQuantityRequirements" WHERE (UnitType = "UNIT_TANK");
----

-- Heavy Tank B
INSERT INTO "Units" ('Type', 'Description', 'Civilopedia', 'Strategy', 'Help', 'Requirements', 'Combat', 'RangedCombat', 'Cost', 'Moves', 'Immobile', 'Range', 'BaseSightRange', 'Class', 'Special', 'Capture', 'CombatClass', 'Domain', 'CivilianAttackPriority', 'DefaultUnitAI', 'Food', 'NoBadGoodies', 'RivalTerritory', 'MilitarySupport', 'MilitaryProduction', 'Pillage', 'Found', 'FoundAbroad', 'CultureBombRadius', 'GoldenAgeTurns', 'IgnoreBuildingDefense', 'PrereqResources', 'Mechanized', 'Suicide', 'CaptureWhileEmbarked', 'PrereqTech', 'ObsoleteTech', 'GoodyHutUpgradeUnitClass', 'HurryCostModifier', 'AdvancedStartCost', 'MinAreaSize', 'AirUnitCap', 'NukeDamageLevel', 'WorkRate', 'NumFreeTechs', 'RushBuilding', 'BaseHurry', 'HurryMultiplier', 'BaseGold', 'NumGoldPerEra', 'SpreadReligion', 'IsReligious', 'CombatLimit', 'RangeAttackOnlyInDomain', 'RangeAttackIgnoreLOS', 'RangedCombatLimit', 'XPValueAttack', 'XPValueDefense', 'SpecialCargo', 'DomainCargo', 'Conscription', 'ExtraMaintenanceCost', 'NoMaintenance', 'Unhappiness', 'UnitArtInfo', 'UnitArtInfoCulturalVariation', 'UnitArtInfoEraVariation', 'ProjectPrereq', 'SpaceshipProject', 'LeaderPromotion', 'LeaderExperience', 'DontShowYields', 'ShowInPedia', 'MoveRate', 'UnitFlagIconOffset', 'PortraitIndex', 'IconAtlas', 'UnitFlagAtlas')
	SELECT	("UNIT_HEAVY_TANK_B"), ("TXT_KEY_UNIT_HEAVY_TANK"), "Civilopedia", "Strategy", "Help", "Requirements",
			(70), "RangedCombat", (630), (3), "Immobile", "Range", "BaseSightRange", ("UNITCLASS_HEAVY_TANK_B"), "Special", "Capture", "CombatClass", "Domain", "CivilianAttackPriority", "DefaultUnitAI", "Food", "NoBadGoodies", "RivalTerritory", "MilitarySupport", "MilitaryProduction", "Pillage", "Found", "FoundAbroad", "CultureBombRadius", "GoldenAgeTurns", "IgnoreBuildingDefense", "PrereqResources", "Mechanized", "Suicide", "CaptureWhileEmbarked", "PrereqTech", "ObsoleteTech", "GoodyHutUpgradeUnitClass", "HurryCostModifier", "AdvancedStartCost", "MinAreaSize", "AirUnitCap", "NukeDamageLevel", "WorkRate", "NumFreeTechs", "RushBuilding", "BaseHurry", "HurryMultiplier", "BaseGold", "NumGoldPerEra", "SpreadReligion", "IsReligious", "CombatLimit", "RangeAttackOnlyInDomain", "RangeAttackIgnoreLOS", "RangedCombatLimit", "XPValueAttack", "XPValueDefense", "SpecialCargo", "DomainCargo", "Conscription", "ExtraMaintenanceCost", "NoMaintenance", "Unhappiness",
			("ART_DEF_UNIT_TANK"), "UnitArtInfoCulturalVariation", "UnitArtInfoEraVariation", "ProjectPrereq", "SpaceshipProject", "LeaderPromotion", "LeaderExperience", "DontShowYields", "ShowInPedia", "MoveRate",
			("1"), "PortraitIndex", "IconAtlas", ("WW2_UNIT_FLAGS")
			--("1"), ("1"), ("WW2_UNIT_ICONS"), ("WW2_UNIT_FLAGS") -- test for unit icons preview
	FROM "Units" WHERE (Type = "UNIT_HEAVY_TANK");
INSERT INTO "Unit_AITypes" ('UnitType', 'UnitAIType')
	SELECT ("UNIT_HEAVY_TANK_B"), "UnitAIType"
	FROM "Unit_AITypes" WHERE (UnitType = "UNIT_HEAVY_TANK");
INSERT INTO "Unit_ClassUpgrades" ('UnitType', 'UnitClassType')
	SELECT ("UNIT_HEAVY_TANK_B"), "UnitClassType"
	FROM "Unit_ClassUpgrades" WHERE (UnitType = "UNIT_HEAVY_TANK");
INSERT INTO "Unit_Flavors" ('UnitType', 'FlavorType', 'Flavor')
	SELECT ("UNIT_HEAVY_TANK_B"), "FlavorType", "Flavor"
	FROM "Unit_Flavors" WHERE (UnitType = "UNIT_HEAVY_TANK");
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	SELECT ("UNIT_HEAVY_TANK_B"), "PromotionType"
	FROM "Unit_FreePromotions" WHERE (UnitType = "UNIT_HEAVY_TANK");
INSERT INTO "Unit_ResourceQuantityRequirements" ('UnitType', 'ResourceType', 'Cost')
	SELECT ("UNIT_HEAVY_TANK_B"), "ResourceType", "Cost"
	FROM "Unit_ResourceQuantityRequirements" WHERE (UnitType = "UNIT_HEAVY_TANK");
----

-- Heavy Tank 2
INSERT INTO "Units" ('Type', 'Description', 'Civilopedia', 'Strategy', 'Help', 'Requirements', 'Combat', 'RangedCombat', 'Cost', 'Moves', 'Immobile', 'Range', 'BaseSightRange', 'Class', 'Special', 'Capture', 'CombatClass', 'Domain', 'CivilianAttackPriority', 'DefaultUnitAI', 'Food', 'NoBadGoodies', 'RivalTerritory', 'MilitarySupport', 'MilitaryProduction', 'Pillage', 'Found', 'FoundAbroad', 'CultureBombRadius', 'GoldenAgeTurns', 'IgnoreBuildingDefense', 'PrereqResources', 'Mechanized', 'Suicide', 'CaptureWhileEmbarked', 'PrereqTech', 'ObsoleteTech', 'GoodyHutUpgradeUnitClass', 'HurryCostModifier', 'AdvancedStartCost', 'MinAreaSize', 'AirUnitCap', 'NukeDamageLevel', 'WorkRate', 'NumFreeTechs', 'RushBuilding', 'BaseHurry', 'HurryMultiplier', 'BaseGold', 'NumGoldPerEra', 'SpreadReligion', 'IsReligious', 'CombatLimit', 'RangeAttackOnlyInDomain', 'RangeAttackIgnoreLOS', 'RangedCombatLimit', 'XPValueAttack', 'XPValueDefense', 'SpecialCargo', 'DomainCargo', 'Conscription', 'ExtraMaintenanceCost', 'NoMaintenance', 'Unhappiness', 'UnitArtInfo', 'UnitArtInfoCulturalVariation', 'UnitArtInfoEraVariation', 'ProjectPrereq', 'SpaceshipProject', 'LeaderPromotion', 'LeaderExperience', 'DontShowYields', 'ShowInPedia', 'MoveRate', 'UnitFlagIconOffset', 'PortraitIndex', 'IconAtlas', 'UnitFlagAtlas')
	SELECT	("UNIT_HEAVY_TANK_2"), ("TXT_KEY_UNIT_HEAVY_TANK"), "Civilopedia", "Strategy", "Help", "Requirements",
			(80), "RangedCombat", (650), (4), "Immobile", "Range", "BaseSightRange", ("UNITCLASS_HEAVY_TANK_2"), "Special", "Capture", "CombatClass", "Domain", "CivilianAttackPriority", "DefaultUnitAI", "Food", "NoBadGoodies", "RivalTerritory", "MilitarySupport", "MilitaryProduction", "Pillage", "Found", "FoundAbroad", "CultureBombRadius", "GoldenAgeTurns", "IgnoreBuildingDefense", "PrereqResources", "Mechanized", "Suicide", "CaptureWhileEmbarked", "PrereqTech", "ObsoleteTech", "GoodyHutUpgradeUnitClass", "HurryCostModifier", "AdvancedStartCost", "MinAreaSize", "AirUnitCap", "NukeDamageLevel", "WorkRate", "NumFreeTechs", "RushBuilding", "BaseHurry", "HurryMultiplier", "BaseGold", "NumGoldPerEra", "SpreadReligion", "IsReligious", "CombatLimit", "RangeAttackOnlyInDomain", "RangeAttackIgnoreLOS", "RangedCombatLimit", "XPValueAttack", "XPValueDefense", "SpecialCargo", "DomainCargo", "Conscription", "ExtraMaintenanceCost", "NoMaintenance", "Unhappiness",
			("ART_DEF_UNIT_TANK"), "UnitArtInfoCulturalVariation", "UnitArtInfoEraVariation", "ProjectPrereq", "SpaceshipProject", "LeaderPromotion", "LeaderExperience", "DontShowYields", "ShowInPedia", "MoveRate",
			("1"), "PortraitIndex", "IconAtlas", ("WW2_UNIT_FLAGS")
			--("1"), ("1"), ("WW2_UNIT_ICONS"), ("WW2_UNIT_FLAGS") -- test for unit icons preview
	FROM "Units" WHERE (Type = "UNIT_HEAVY_TANK");
INSERT INTO "Unit_AITypes" ('UnitType', 'UnitAIType')
	SELECT ("UNIT_HEAVY_TANK_2"), "UnitAIType"
	FROM "Unit_AITypes" WHERE (UnitType = "UNIT_HEAVY_TANK");
INSERT INTO "Unit_ClassUpgrades" ('UnitType', 'UnitClassType')
	SELECT ("UNIT_HEAVY_TANK_2"), "UnitClassType"
	FROM "Unit_ClassUpgrades" WHERE (UnitType = "UNIT_HEAVY_TANK");
INSERT INTO "Unit_Flavors" ('UnitType', 'FlavorType', 'Flavor')
	SELECT ("UNIT_HEAVY_TANK_2"), "FlavorType", "Flavor"
	FROM "Unit_Flavors" WHERE (UnitType = "UNIT_HEAVY_TANK");
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	SELECT ("UNIT_HEAVY_TANK_2"), "PromotionType"
	FROM "Unit_FreePromotions" WHERE (UnitType = "UNIT_HEAVY_TANK");
INSERT INTO "Unit_ResourceQuantityRequirements" ('UnitType', 'ResourceType', 'Cost')
	SELECT ("UNIT_HEAVY_TANK_2"), "ResourceType", "Cost"
	FROM "Unit_ResourceQuantityRequirements" WHERE (UnitType = "UNIT_HEAVY_TANK");
----

-- Heavy Tank 2 B
INSERT INTO "Units" ('Type', 'Description', 'Civilopedia', 'Strategy', 'Help', 'Requirements', 'Combat', 'RangedCombat', 'Cost', 'Moves', 'Immobile', 'Range', 'BaseSightRange', 'Class', 'Special', 'Capture', 'CombatClass', 'Domain', 'CivilianAttackPriority', 'DefaultUnitAI', 'Food', 'NoBadGoodies', 'RivalTerritory', 'MilitarySupport', 'MilitaryProduction', 'Pillage', 'Found', 'FoundAbroad', 'CultureBombRadius', 'GoldenAgeTurns', 'IgnoreBuildingDefense', 'PrereqResources', 'Mechanized', 'Suicide', 'CaptureWhileEmbarked', 'PrereqTech', 'ObsoleteTech', 'GoodyHutUpgradeUnitClass', 'HurryCostModifier', 'AdvancedStartCost', 'MinAreaSize', 'AirUnitCap', 'NukeDamageLevel', 'WorkRate', 'NumFreeTechs', 'RushBuilding', 'BaseHurry', 'HurryMultiplier', 'BaseGold', 'NumGoldPerEra', 'SpreadReligion', 'IsReligious', 'CombatLimit', 'RangeAttackOnlyInDomain', 'RangeAttackIgnoreLOS', 'RangedCombatLimit', 'XPValueAttack', 'XPValueDefense', 'SpecialCargo', 'DomainCargo', 'Conscription', 'ExtraMaintenanceCost', 'NoMaintenance', 'Unhappiness', 'UnitArtInfo', 'UnitArtInfoCulturalVariation', 'UnitArtInfoEraVariation', 'ProjectPrereq', 'SpaceshipProject', 'LeaderPromotion', 'LeaderExperience', 'DontShowYields', 'ShowInPedia', 'MoveRate', 'UnitFlagIconOffset', 'PortraitIndex', 'IconAtlas', 'UnitFlagAtlas')
	SELECT	("UNIT_HEAVY_TANK_2_B"), ("TXT_KEY_UNIT_HEAVY_TANK"), "Civilopedia", "Strategy", "Help", "Requirements",
			(85), "RangedCombat", (675), (4), "Immobile", "Range", "BaseSightRange", ("UNITCLASS_HEAVY_TANK_2_B"), "Special", "Capture", "CombatClass", "Domain", "CivilianAttackPriority", "DefaultUnitAI", "Food", "NoBadGoodies", "RivalTerritory", "MilitarySupport", "MilitaryProduction", "Pillage", "Found", "FoundAbroad", "CultureBombRadius", "GoldenAgeTurns", "IgnoreBuildingDefense", "PrereqResources", "Mechanized", "Suicide", "CaptureWhileEmbarked", "PrereqTech", "ObsoleteTech", "GoodyHutUpgradeUnitClass", "HurryCostModifier", "AdvancedStartCost", "MinAreaSize", "AirUnitCap", "NukeDamageLevel", "WorkRate", "NumFreeTechs", "RushBuilding", "BaseHurry", "HurryMultiplier", "BaseGold", "NumGoldPerEra", "SpreadReligion", "IsReligious", "CombatLimit", "RangeAttackOnlyInDomain", "RangeAttackIgnoreLOS", "RangedCombatLimit", "XPValueAttack", "XPValueDefense", "SpecialCargo", "DomainCargo", "Conscription", "ExtraMaintenanceCost", "NoMaintenance", "Unhappiness",
			("ART_DEF_UNIT_TANK"), "UnitArtInfoCulturalVariation", "UnitArtInfoEraVariation", "ProjectPrereq", "SpaceshipProject", "LeaderPromotion", "LeaderExperience", "DontShowYields", "ShowInPedia", "MoveRate",
			("1"), "PortraitIndex", "IconAtlas", ("WW2_UNIT_FLAGS")
			--("1"), ("1"), ("WW2_UNIT_ICONS"), ("WW2_UNIT_FLAGS") -- test for unit icons preview
	FROM "Units" WHERE (Type = "UNIT_HEAVY_TANK");
INSERT INTO "Unit_AITypes" ('UnitType', 'UnitAIType')
	SELECT ("UNIT_HEAVY_TANK_2_B"), "UnitAIType"
	FROM "Unit_AITypes" WHERE (UnitType = "UNIT_HEAVY_TANK");
INSERT INTO "Unit_ClassUpgrades" ('UnitType', 'UnitClassType')
	SELECT ("UNIT_HEAVY_TANK_2_B"), "UnitClassType"
	FROM "Unit_ClassUpgrades" WHERE (UnitType = "UNIT_HEAVY_TANK");
INSERT INTO "Unit_Flavors" ('UnitType', 'FlavorType', 'Flavor')
	SELECT ("UNIT_HEAVY_TANK_2_B"), "FlavorType", "Flavor"
	FROM "Unit_Flavors" WHERE (UnitType = "UNIT_HEAVY_TANK");
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	SELECT ("UNIT_HEAVY_TANK_2_B"), "PromotionType"
	FROM "Unit_FreePromotions" WHERE (UnitType = "UNIT_HEAVY_TANK");
INSERT INTO "Unit_ResourceQuantityRequirements" ('UnitType', 'ResourceType', 'Cost')
	SELECT ("UNIT_HEAVY_TANK_2_B"), "ResourceType", "Cost"
	FROM "Unit_ResourceQuantityRequirements" WHERE (UnitType = "UNIT_HEAVY_TANK");
----

--------------------------------------------------------------
-- Air
--------------------------------------------------------------

-- Old Fighter
INSERT INTO "Units" ('Type', 'Description', 'Civilopedia', 'Strategy', 'Help', 'Requirements', 'Combat', 'RangedCombat', 'Cost', 'Moves', 'Immobile', 'Range', 'BaseSightRange', 'Class', 'Special', 'Capture', 'CombatClass', 'Domain', 'CivilianAttackPriority', 'DefaultUnitAI', 'Food', 'NoBadGoodies', 'RivalTerritory', 'MilitarySupport', 'MilitaryProduction', 'Pillage', 'Found', 'FoundAbroad', 'CultureBombRadius', 'GoldenAgeTurns', 'IgnoreBuildingDefense', 'PrereqResources', 'Mechanized', 'Suicide', 'CaptureWhileEmbarked', 'PrereqTech', 'ObsoleteTech', 'GoodyHutUpgradeUnitClass', 'HurryCostModifier', 'AdvancedStartCost', 'MinAreaSize', 'AirUnitCap', 'NukeDamageLevel', 'WorkRate', 'NumFreeTechs', 'RushBuilding', 'BaseHurry', 'HurryMultiplier', 'BaseGold', 'NumGoldPerEra', 'SpreadReligion', 'IsReligious', 'CombatLimit', 'RangeAttackOnlyInDomain', 'RangeAttackIgnoreLOS', 'RangedCombatLimit', 'XPValueAttack', 'XPValueDefense', 'SpecialCargo', 'DomainCargo', 'Conscription', 'ExtraMaintenanceCost', 'NoMaintenance', 'Unhappiness', 'UnitArtInfo', 'UnitArtInfoCulturalVariation', 'UnitArtInfoEraVariation', 'ProjectPrereq', 'SpaceshipProject', 'LeaderPromotion', 'LeaderExperience', 'DontShowYields', 'ShowInPedia', 'MoveRate', 'UnitFlagIconOffset', 'PortraitIndex', 'IconAtlas', 'UnitFlagAtlas')
	SELECT	("UNIT_OLD_FIGHTER"), ("TXT_KEY_UNIT_FIGHTER"), "Civilopedia", "Strategy", "Help", "Requirements",
			"Combat", (30), (325), "Moves", "Immobile", (8), "BaseSightRange", ("UNITCLASS_OLD_FIGHTER"), "Special", "Capture", "CombatClass", "Domain", "CivilianAttackPriority", "DefaultUnitAI", "Food", "NoBadGoodies", "RivalTerritory", "MilitarySupport", "MilitaryProduction", "Pillage", "Found", "FoundAbroad", "CultureBombRadius", "GoldenAgeTurns", "IgnoreBuildingDefense", "PrereqResources", "Mechanized", "Suicide", "CaptureWhileEmbarked", "PrereqTech", "ObsoleteTech", "GoodyHutUpgradeUnitClass", "HurryCostModifier", "AdvancedStartCost", "MinAreaSize", "AirUnitCap", "NukeDamageLevel", "WorkRate", "NumFreeTechs", "RushBuilding", "BaseHurry", "HurryMultiplier", "BaseGold", "NumGoldPerEra", "SpreadReligion", "IsReligious", "CombatLimit", "RangeAttackOnlyInDomain", "RangeAttackIgnoreLOS", "RangedCombatLimit", "XPValueAttack", "XPValueDefense", "SpecialCargo", "DomainCargo", "Conscription", "ExtraMaintenanceCost", "NoMaintenance", "Unhappiness",
			("ART_DEF_UNIT_FIGHTER"), "UnitArtInfoCulturalVariation", "UnitArtInfoEraVariation", "ProjectPrereq", "SpaceshipProject", "LeaderPromotion", "LeaderExperience", "DontShowYields", "ShowInPedia", "MoveRate",
			"UnitFlagIconOffset", "PortraitIndex", "IconAtlas", "UnitFlagAtlas"
	FROM "Units" WHERE (Type = "UNIT_FIGHTER");
INSERT INTO "Unit_AITypes" ('UnitType', 'UnitAIType')
	SELECT ("UNIT_OLD_FIGHTER"), "UnitAIType"
	FROM "Unit_AITypes" WHERE (UnitType = "UNIT_FIGHTER");
INSERT INTO "Unit_ClassUpgrades" ('UnitType', 'UnitClassType')
	SELECT ("UNIT_OLD_FIGHTER"), "UnitClassType"
	FROM "Unit_ClassUpgrades" WHERE (UnitType = "UNIT_FIGHTER");
INSERT INTO "Unit_Flavors" ('UnitType', 'FlavorType', 'Flavor')
	SELECT ("UNIT_OLD_FIGHTER"), "FlavorType", "Flavor"
	FROM "Unit_Flavors" WHERE (UnitType = "UNIT_FIGHTER");
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	SELECT ("UNIT_OLD_FIGHTER"), "PromotionType"
	FROM "Unit_FreePromotions" WHERE (UnitType = "UNIT_FIGHTER");
INSERT INTO "Unit_ResourceQuantityRequirements" ('UnitType', 'ResourceType', 'Cost')
	SELECT ("UNIT_OLD_FIGHTER"), "ResourceType", "Cost"
	FROM "Unit_ResourceQuantityRequirements" WHERE (UnitType = "UNIT_FIGHTER");
----

-- Fighter B
INSERT INTO "Units" ('Type', 'Description', 'Civilopedia', 'Strategy', 'Help', 'Requirements', 'Combat', 'RangedCombat', 'Cost', 'Moves', 'Immobile', 'Range', 'BaseSightRange', 'Class', 'Special', 'Capture', 'CombatClass', 'Domain', 'CivilianAttackPriority', 'DefaultUnitAI', 'Food', 'NoBadGoodies', 'RivalTerritory', 'MilitarySupport', 'MilitaryProduction', 'Pillage', 'Found', 'FoundAbroad', 'CultureBombRadius', 'GoldenAgeTurns', 'IgnoreBuildingDefense', 'PrereqResources', 'Mechanized', 'Suicide', 'CaptureWhileEmbarked', 'PrereqTech', 'ObsoleteTech', 'GoodyHutUpgradeUnitClass', 'HurryCostModifier', 'AdvancedStartCost', 'MinAreaSize', 'AirUnitCap', 'NukeDamageLevel', 'WorkRate', 'NumFreeTechs', 'RushBuilding', 'BaseHurry', 'HurryMultiplier', 'BaseGold', 'NumGoldPerEra', 'SpreadReligion', 'IsReligious', 'CombatLimit', 'RangeAttackOnlyInDomain', 'RangeAttackIgnoreLOS', 'RangedCombatLimit', 'XPValueAttack', 'XPValueDefense', 'SpecialCargo', 'DomainCargo', 'Conscription', 'ExtraMaintenanceCost', 'NoMaintenance', 'Unhappiness', 'UnitArtInfo', 'UnitArtInfoCulturalVariation', 'UnitArtInfoEraVariation', 'ProjectPrereq', 'SpaceshipProject', 'LeaderPromotion', 'LeaderExperience', 'DontShowYields', 'ShowInPedia', 'MoveRate', 'UnitFlagIconOffset', 'PortraitIndex', 'IconAtlas', 'UnitFlagAtlas')
	SELECT	("UNIT_FIGHTER_B"), ("TXT_KEY_UNIT_FIGHTER"), "Civilopedia", "Strategy", "Help", "Requirements",
			"Combat", (44), (380), "Moves", "Immobile", (10), "BaseSightRange", ("UNITCLASS_FIGHTER_B"), "Special", "Capture", "CombatClass", "Domain", "CivilianAttackPriority", "DefaultUnitAI", "Food", "NoBadGoodies", "RivalTerritory", "MilitarySupport", "MilitaryProduction", "Pillage", "Found", "FoundAbroad", "CultureBombRadius", "GoldenAgeTurns", "IgnoreBuildingDefense", "PrereqResources", "Mechanized", "Suicide", "CaptureWhileEmbarked", "PrereqTech", "ObsoleteTech", "GoodyHutUpgradeUnitClass", "HurryCostModifier", "AdvancedStartCost", "MinAreaSize", "AirUnitCap", "NukeDamageLevel", "WorkRate", "NumFreeTechs", "RushBuilding", "BaseHurry", "HurryMultiplier", "BaseGold", "NumGoldPerEra", "SpreadReligion", "IsReligious", "CombatLimit", "RangeAttackOnlyInDomain", "RangeAttackIgnoreLOS", "RangedCombatLimit", "XPValueAttack", "XPValueDefense", "SpecialCargo", "DomainCargo", "Conscription", "ExtraMaintenanceCost", "NoMaintenance", "Unhappiness",
			("ART_DEF_UNIT_FIGHTER"), "UnitArtInfoCulturalVariation", "UnitArtInfoEraVariation", "ProjectPrereq", "SpaceshipProject", "LeaderPromotion", "LeaderExperience", "DontShowYields", "ShowInPedia", "MoveRate",
			"UnitFlagIconOffset", "PortraitIndex", "IconAtlas", "UnitFlagAtlas"
	FROM "Units" WHERE (Type = "UNIT_FIGHTER");
INSERT INTO "Unit_AITypes" ('UnitType', 'UnitAIType')
	SELECT ("UNIT_FIGHTER_B"), "UnitAIType"
	FROM "Unit_AITypes" WHERE (UnitType = "UNIT_FIGHTER");
INSERT INTO "Unit_ClassUpgrades" ('UnitType', 'UnitClassType')
	SELECT ("UNIT_FIGHTER_B"), "UnitClassType"
	FROM "Unit_ClassUpgrades" WHERE (UnitType = "UNIT_FIGHTER");
INSERT INTO "Unit_Flavors" ('UnitType', 'FlavorType', 'Flavor')
	SELECT ("UNIT_FIGHTER_B"), "FlavorType", "Flavor"
	FROM "Unit_Flavors" WHERE (UnitType = "UNIT_FIGHTER");
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	SELECT ("UNIT_FIGHTER_B"), "PromotionType"
	FROM "Unit_FreePromotions" WHERE (UnitType = "UNIT_FIGHTER");
INSERT INTO "Unit_ResourceQuantityRequirements" ('UnitType', 'ResourceType', 'Cost')
	SELECT ("UNIT_FIGHTER_B"), "ResourceType", "Cost"
	FROM "Unit_ResourceQuantityRequirements" WHERE (UnitType = "UNIT_FIGHTER");
----

-- Fighter C
INSERT INTO "Units" ('Type', 'Description', 'Civilopedia', 'Strategy', 'Help', 'Requirements', 'Combat', 'RangedCombat', 'Cost', 'Moves', 'Immobile', 'Range', 'BaseSightRange', 'Class', 'Special', 'Capture', 'CombatClass', 'Domain', 'CivilianAttackPriority', 'DefaultUnitAI', 'Food', 'NoBadGoodies', 'RivalTerritory', 'MilitarySupport', 'MilitaryProduction', 'Pillage', 'Found', 'FoundAbroad', 'CultureBombRadius', 'GoldenAgeTurns', 'IgnoreBuildingDefense', 'PrereqResources', 'Mechanized', 'Suicide', 'CaptureWhileEmbarked', 'PrereqTech', 'ObsoleteTech', 'GoodyHutUpgradeUnitClass', 'HurryCostModifier', 'AdvancedStartCost', 'MinAreaSize', 'AirUnitCap', 'NukeDamageLevel', 'WorkRate', 'NumFreeTechs', 'RushBuilding', 'BaseHurry', 'HurryMultiplier', 'BaseGold', 'NumGoldPerEra', 'SpreadReligion', 'IsReligious', 'CombatLimit', 'RangeAttackOnlyInDomain', 'RangeAttackIgnoreLOS', 'RangedCombatLimit', 'XPValueAttack', 'XPValueDefense', 'SpecialCargo', 'DomainCargo', 'Conscription', 'ExtraMaintenanceCost', 'NoMaintenance', 'Unhappiness', 'UnitArtInfo', 'UnitArtInfoCulturalVariation', 'UnitArtInfoEraVariation', 'ProjectPrereq', 'SpaceshipProject', 'LeaderPromotion', 'LeaderExperience', 'DontShowYields', 'ShowInPedia', 'MoveRate', 'UnitFlagIconOffset', 'PortraitIndex', 'IconAtlas', 'UnitFlagAtlas')
	SELECT	("UNIT_FIGHTER_C"), ("TXT_KEY_UNIT_FIGHTER"), "Civilopedia", "Strategy", "Help", "Requirements",
			"Combat", (48), (390), "Moves", "Immobile", (10), "BaseSightRange", ("UNITCLASS_FIGHTER_C"), "Special", "Capture", "CombatClass", "Domain", "CivilianAttackPriority", "DefaultUnitAI", "Food", "NoBadGoodies", "RivalTerritory", "MilitarySupport", "MilitaryProduction", "Pillage", "Found", "FoundAbroad", "CultureBombRadius", "GoldenAgeTurns", "IgnoreBuildingDefense", "PrereqResources", "Mechanized", "Suicide", "CaptureWhileEmbarked", "PrereqTech", "ObsoleteTech", "GoodyHutUpgradeUnitClass", "HurryCostModifier", "AdvancedStartCost", "MinAreaSize", "AirUnitCap", "NukeDamageLevel", "WorkRate", "NumFreeTechs", "RushBuilding", "BaseHurry", "HurryMultiplier", "BaseGold", "NumGoldPerEra", "SpreadReligion", "IsReligious", "CombatLimit", "RangeAttackOnlyInDomain", "RangeAttackIgnoreLOS", "RangedCombatLimit", "XPValueAttack", "XPValueDefense", "SpecialCargo", "DomainCargo", "Conscription", "ExtraMaintenanceCost", "NoMaintenance", "Unhappiness",
			("ART_DEF_UNIT_FIGHTER"), "UnitArtInfoCulturalVariation", "UnitArtInfoEraVariation", "ProjectPrereq", "SpaceshipProject", "LeaderPromotion", "LeaderExperience", "DontShowYields", "ShowInPedia", "MoveRate",
			"UnitFlagIconOffset", "PortraitIndex", "IconAtlas", "UnitFlagAtlas"
	FROM "Units" WHERE (Type = "UNIT_FIGHTER");
INSERT INTO "Unit_AITypes" ('UnitType', 'UnitAIType')
	SELECT ("UNIT_FIGHTER_C"), "UnitAIType"
	FROM "Unit_AITypes" WHERE (UnitType = "UNIT_FIGHTER");
INSERT INTO "Unit_ClassUpgrades" ('UnitType', 'UnitClassType')
	SELECT ("UNIT_FIGHTER_C"), "UnitClassType"
	FROM "Unit_ClassUpgrades" WHERE (UnitType = "UNIT_FIGHTER");
INSERT INTO "Unit_Flavors" ('UnitType', 'FlavorType', 'Flavor')
	SELECT ("UNIT_FIGHTER_C"), "FlavorType", "Flavor"
	FROM "Unit_Flavors" WHERE (UnitType = "UNIT_FIGHTER");
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	SELECT ("UNIT_FIGHTER_C"), "PromotionType"
	FROM "Unit_FreePromotions" WHERE (UnitType = "UNIT_FIGHTER");
INSERT INTO "Unit_ResourceQuantityRequirements" ('UnitType', 'ResourceType', 'Cost')
	SELECT ("UNIT_FIGHTER_C"), "ResourceType", "Cost"
	FROM "Unit_ResourceQuantityRequirements" WHERE (UnitType = "UNIT_FIGHTER");
----

-- Fighter D
INSERT INTO "Units" ('Type', 'Description', 'Civilopedia', 'Strategy', 'Help', 'Requirements', 'Combat', 'RangedCombat', 'Cost', 'Moves', 'Immobile', 'Range', 'BaseSightRange', 'Class', 'Special', 'Capture', 'CombatClass', 'Domain', 'CivilianAttackPriority', 'DefaultUnitAI', 'Food', 'NoBadGoodies', 'RivalTerritory', 'MilitarySupport', 'MilitaryProduction', 'Pillage', 'Found', 'FoundAbroad', 'CultureBombRadius', 'GoldenAgeTurns', 'IgnoreBuildingDefense', 'PrereqResources', 'Mechanized', 'Suicide', 'CaptureWhileEmbarked', 'PrereqTech', 'ObsoleteTech', 'GoodyHutUpgradeUnitClass', 'HurryCostModifier', 'AdvancedStartCost', 'MinAreaSize', 'AirUnitCap', 'NukeDamageLevel', 'WorkRate', 'NumFreeTechs', 'RushBuilding', 'BaseHurry', 'HurryMultiplier', 'BaseGold', 'NumGoldPerEra', 'SpreadReligion', 'IsReligious', 'CombatLimit', 'RangeAttackOnlyInDomain', 'RangeAttackIgnoreLOS', 'RangedCombatLimit', 'XPValueAttack', 'XPValueDefense', 'SpecialCargo', 'DomainCargo', 'Conscription', 'ExtraMaintenanceCost', 'NoMaintenance', 'Unhappiness', 'UnitArtInfo', 'UnitArtInfoCulturalVariation', 'UnitArtInfoEraVariation', 'ProjectPrereq', 'SpaceshipProject', 'LeaderPromotion', 'LeaderExperience', 'DontShowYields', 'ShowInPedia', 'MoveRate', 'UnitFlagIconOffset', 'PortraitIndex', 'IconAtlas', 'UnitFlagAtlas')
	SELECT	("UNIT_FIGHTER_D"), ("TXT_KEY_UNIT_FIGHTER"), "Civilopedia", "Strategy", "Help", "Requirements",
			"Combat", (50), (400), "Moves", "Immobile", (10), "BaseSightRange", ("UNITCLASS_FIGHTER_D"), "Special", "Capture", "CombatClass", "Domain", "CivilianAttackPriority", "DefaultUnitAI", "Food", "NoBadGoodies", "RivalTerritory", "MilitarySupport", "MilitaryProduction", "Pillage", "Found", "FoundAbroad", "CultureBombRadius", "GoldenAgeTurns", "IgnoreBuildingDefense", "PrereqResources", "Mechanized", "Suicide", "CaptureWhileEmbarked", "PrereqTech", "ObsoleteTech", "GoodyHutUpgradeUnitClass", "HurryCostModifier", "AdvancedStartCost", "MinAreaSize", "AirUnitCap", "NukeDamageLevel", "WorkRate", "NumFreeTechs", "RushBuilding", "BaseHurry", "HurryMultiplier", "BaseGold", "NumGoldPerEra", "SpreadReligion", "IsReligious", "CombatLimit", "RangeAttackOnlyInDomain", "RangeAttackIgnoreLOS", "RangedCombatLimit", "XPValueAttack", "XPValueDefense", "SpecialCargo", "DomainCargo", "Conscription", "ExtraMaintenanceCost", "NoMaintenance", "Unhappiness",
			("ART_DEF_UNIT_FIGHTER"), "UnitArtInfoCulturalVariation", "UnitArtInfoEraVariation", "ProjectPrereq", "SpaceshipProject", "LeaderPromotion", "LeaderExperience", "DontShowYields", "ShowInPedia", "MoveRate",
			"UnitFlagIconOffset", "PortraitIndex", "IconAtlas", "UnitFlagAtlas"
	FROM "Units" WHERE (Type = "UNIT_FIGHTER");
INSERT INTO "Unit_AITypes" ('UnitType', 'UnitAIType')
	SELECT ("UNIT_FIGHTER_D"), "UnitAIType"
	FROM "Unit_AITypes" WHERE (UnitType = "UNIT_FIGHTER");
INSERT INTO "Unit_ClassUpgrades" ('UnitType', 'UnitClassType')
	SELECT ("UNIT_FIGHTER_D"), "UnitClassType"
	FROM "Unit_ClassUpgrades" WHERE (UnitType = "UNIT_FIGHTER");
INSERT INTO "Unit_Flavors" ('UnitType', 'FlavorType', 'Flavor')
	SELECT ("UNIT_FIGHTER_D"), "FlavorType", "Flavor"
	FROM "Unit_Flavors" WHERE (UnitType = "UNIT_FIGHTER");
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	SELECT ("UNIT_FIGHTER_D"), "PromotionType"
	FROM "Unit_FreePromotions" WHERE (UnitType = "UNIT_FIGHTER");	
UPDATE Unit_FreePromotions
	SET UnitType = 'UNIT_FIGHTER_D', PromotionType = 'PROMOTION_MODERN_FIGHTER'
	WHERE UnitType = 'UNIT_FIGHTER_D' AND PromotionType = 'PROMOTION_FIGHTER';
INSERT INTO "Unit_ResourceQuantityRequirements" ('UnitType', 'ResourceType', 'Cost')
	SELECT ("UNIT_FIGHTER_D"), "ResourceType", "Cost"
	FROM "Unit_ResourceQuantityRequirements" WHERE (UnitType = "UNIT_FIGHTER");
----

-- Fighter 2
INSERT INTO "Units" ('Type', 'Description', 'Civilopedia', 'Strategy', 'Help', 'Requirements', 'Combat', 'RangedCombat', 'Cost', 'Moves', 'Immobile', 'Range', 'BaseSightRange', 'Class', 'Special', 'Capture', 'CombatClass', 'Domain', 'CivilianAttackPriority', 'DefaultUnitAI', 'Food', 'NoBadGoodies', 'RivalTerritory', 'MilitarySupport', 'MilitaryProduction', 'Pillage', 'Found', 'FoundAbroad', 'CultureBombRadius', 'GoldenAgeTurns', 'IgnoreBuildingDefense', 'PrereqResources', 'Mechanized', 'Suicide', 'CaptureWhileEmbarked', 'PrereqTech', 'ObsoleteTech', 'GoodyHutUpgradeUnitClass', 'HurryCostModifier', 'AdvancedStartCost', 'MinAreaSize', 'AirUnitCap', 'NukeDamageLevel', 'WorkRate', 'NumFreeTechs', 'RushBuilding', 'BaseHurry', 'HurryMultiplier', 'BaseGold', 'NumGoldPerEra', 'SpreadReligion', 'IsReligious', 'CombatLimit', 'RangeAttackOnlyInDomain', 'RangeAttackIgnoreLOS', 'RangedCombatLimit', 'XPValueAttack', 'XPValueDefense', 'SpecialCargo', 'DomainCargo', 'Conscription', 'ExtraMaintenanceCost', 'NoMaintenance', 'Unhappiness', 'UnitArtInfo', 'UnitArtInfoCulturalVariation', 'UnitArtInfoEraVariation', 'ProjectPrereq', 'SpaceshipProject', 'LeaderPromotion', 'LeaderExperience', 'DontShowYields', 'ShowInPedia', 'MoveRate', 'UnitFlagIconOffset', 'PortraitIndex', 'IconAtlas', 'UnitFlagAtlas')
	SELECT	("UNIT_FIGHTER_2"), ("TXT_KEY_UNIT_FIGHTER"), "Civilopedia", "Strategy", "Help", "Requirements",
			"Combat", (45), (385), "Moves", "Immobile", (11), "BaseSightRange", ("UNITCLASS_FIGHTER_2"), "Special", "Capture", "CombatClass", "Domain", "CivilianAttackPriority", "DefaultUnitAI", "Food", "NoBadGoodies", "RivalTerritory", "MilitarySupport", "MilitaryProduction", "Pillage", "Found", "FoundAbroad", "CultureBombRadius", "GoldenAgeTurns", "IgnoreBuildingDefense", "PrereqResources", "Mechanized", "Suicide", "CaptureWhileEmbarked", "PrereqTech", "ObsoleteTech", "GoodyHutUpgradeUnitClass", "HurryCostModifier", "AdvancedStartCost", "MinAreaSize", "AirUnitCap", "NukeDamageLevel", "WorkRate", "NumFreeTechs", "RushBuilding", "BaseHurry", "HurryMultiplier", "BaseGold", "NumGoldPerEra", "SpreadReligion", "IsReligious", "CombatLimit", "RangeAttackOnlyInDomain", "RangeAttackIgnoreLOS", "RangedCombatLimit", "XPValueAttack", "XPValueDefense", "SpecialCargo", "DomainCargo", "Conscription", "ExtraMaintenanceCost", "NoMaintenance", "Unhappiness",
			("ART_DEF_UNIT_FIGHTER"), "UnitArtInfoCulturalVariation", "UnitArtInfoEraVariation", "ProjectPrereq", "SpaceshipProject", "LeaderPromotion", "LeaderExperience", "DontShowYields", "ShowInPedia", "MoveRate",
			"UnitFlagIconOffset", "PortraitIndex", "IconAtlas", "UnitFlagAtlas"
	FROM "Units" WHERE (Type = "UNIT_FIGHTER");
INSERT INTO "Unit_AITypes" ('UnitType', 'UnitAIType')
	SELECT ("UNIT_FIGHTER_2"), "UnitAIType"
	FROM "Unit_AITypes" WHERE (UnitType = "UNIT_FIGHTER");
INSERT INTO "Unit_ClassUpgrades" ('UnitType', 'UnitClassType')
	SELECT ("UNIT_FIGHTER_2"), "UnitClassType"
	FROM "Unit_ClassUpgrades" WHERE (UnitType = "UNIT_FIGHTER");
INSERT INTO "Unit_Flavors" ('UnitType', 'FlavorType', 'Flavor')
	SELECT ("UNIT_FIGHTER_2"), "FlavorType", "Flavor"
	FROM "Unit_Flavors" WHERE (UnitType = "UNIT_FIGHTER");
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	SELECT ("UNIT_FIGHTER_2"), "PromotionType"
	FROM "Unit_FreePromotions" WHERE (UnitType = "UNIT_FIGHTER");
INSERT INTO "Unit_ResourceQuantityRequirements" ('UnitType', 'ResourceType', 'Cost')
	SELECT ("UNIT_FIGHTER_2"), "ResourceType", "Cost"
	FROM "Unit_ResourceQuantityRequirements" WHERE (UnitType = "UNIT_FIGHTER");
----

-- Fighter 2 B
INSERT INTO "Units" ('Type', 'Description', 'Civilopedia', 'Strategy', 'Help', 'Requirements', 'Combat', 'RangedCombat', 'Cost', 'Moves', 'Immobile', 'Range', 'BaseSightRange', 'Class', 'Special', 'Capture', 'CombatClass', 'Domain', 'CivilianAttackPriority', 'DefaultUnitAI', 'Food', 'NoBadGoodies', 'RivalTerritory', 'MilitarySupport', 'MilitaryProduction', 'Pillage', 'Found', 'FoundAbroad', 'CultureBombRadius', 'GoldenAgeTurns', 'IgnoreBuildingDefense', 'PrereqResources', 'Mechanized', 'Suicide', 'CaptureWhileEmbarked', 'PrereqTech', 'ObsoleteTech', 'GoodyHutUpgradeUnitClass', 'HurryCostModifier', 'AdvancedStartCost', 'MinAreaSize', 'AirUnitCap', 'NukeDamageLevel', 'WorkRate', 'NumFreeTechs', 'RushBuilding', 'BaseHurry', 'HurryMultiplier', 'BaseGold', 'NumGoldPerEra', 'SpreadReligion', 'IsReligious', 'CombatLimit', 'RangeAttackOnlyInDomain', 'RangeAttackIgnoreLOS', 'RangedCombatLimit', 'XPValueAttack', 'XPValueDefense', 'SpecialCargo', 'DomainCargo', 'Conscription', 'ExtraMaintenanceCost', 'NoMaintenance', 'Unhappiness', 'UnitArtInfo', 'UnitArtInfoCulturalVariation', 'UnitArtInfoEraVariation', 'ProjectPrereq', 'SpaceshipProject', 'LeaderPromotion', 'LeaderExperience', 'DontShowYields', 'ShowInPedia', 'MoveRate', 'UnitFlagIconOffset', 'PortraitIndex', 'IconAtlas', 'UnitFlagAtlas')
	SELECT	("UNIT_FIGHTER_2_B"), ("TXT_KEY_UNIT_FIGHTER"), "Civilopedia", "Strategy", "Help", "Requirements",
			"Combat", (48), (390), "Moves", "Immobile", (11), "BaseSightRange", ("UNITCLASS_FIGHTER_2_B"), "Special", "Capture", "CombatClass", "Domain", "CivilianAttackPriority", "DefaultUnitAI", "Food", "NoBadGoodies", "RivalTerritory", "MilitarySupport", "MilitaryProduction", "Pillage", "Found", "FoundAbroad", "CultureBombRadius", "GoldenAgeTurns", "IgnoreBuildingDefense", "PrereqResources", "Mechanized", "Suicide", "CaptureWhileEmbarked", "PrereqTech", "ObsoleteTech", "GoodyHutUpgradeUnitClass", "HurryCostModifier", "AdvancedStartCost", "MinAreaSize", "AirUnitCap", "NukeDamageLevel", "WorkRate", "NumFreeTechs", "RushBuilding", "BaseHurry", "HurryMultiplier", "BaseGold", "NumGoldPerEra", "SpreadReligion", "IsReligious", "CombatLimit", "RangeAttackOnlyInDomain", "RangeAttackIgnoreLOS", "RangedCombatLimit", "XPValueAttack", "XPValueDefense", "SpecialCargo", "DomainCargo", "Conscription", "ExtraMaintenanceCost", "NoMaintenance", "Unhappiness",
			("ART_DEF_UNIT_FIGHTER"), "UnitArtInfoCulturalVariation", "UnitArtInfoEraVariation", "ProjectPrereq", "SpaceshipProject", "LeaderPromotion", "LeaderExperience", "DontShowYields", "ShowInPedia", "MoveRate",
			"UnitFlagIconOffset", "PortraitIndex", "IconAtlas", "UnitFlagAtlas"
	FROM "Units" WHERE (Type = "UNIT_FIGHTER");
INSERT INTO "Unit_AITypes" ('UnitType', 'UnitAIType')
	SELECT ("UNIT_FIGHTER_2_B"), "UnitAIType"
	FROM "Unit_AITypes" WHERE (UnitType = "UNIT_FIGHTER");
INSERT INTO "Unit_ClassUpgrades" ('UnitType', 'UnitClassType')
	SELECT ("UNIT_FIGHTER_2_B"), "UnitClassType"
	FROM "Unit_ClassUpgrades" WHERE (UnitType = "UNIT_FIGHTER");
INSERT INTO "Unit_Flavors" ('UnitType', 'FlavorType', 'Flavor')
	SELECT ("UNIT_FIGHTER_2_B"), "FlavorType", "Flavor"
	FROM "Unit_Flavors" WHERE (UnitType = "UNIT_FIGHTER");
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	SELECT ("UNIT_FIGHTER_2_B"), "PromotionType"
	FROM "Unit_FreePromotions" WHERE (UnitType = "UNIT_FIGHTER");
UPDATE Unit_FreePromotions
	SET UnitType = 'UNIT_FIGHTER_2_B', PromotionType = 'PROMOTION_MODERN_FIGHTER'
	WHERE UnitType = 'UNIT_FIGHTER_2_B' AND PromotionType = 'PROMOTION_FIGHTER';
INSERT INTO "Unit_ResourceQuantityRequirements" ('UnitType', 'ResourceType', 'Cost')
	SELECT ("UNIT_FIGHTER_2_B"), "ResourceType", "Cost"
	FROM "Unit_ResourceQuantityRequirements" WHERE (UnitType = "UNIT_FIGHTER");
----

-- Fighter 3
INSERT INTO "Units" ('Type', 'Description', 'Civilopedia', 'Strategy', 'Help', 'Requirements', 'Combat', 'RangedCombat', 'Cost', 'Moves', 'Immobile', 'Range', 'BaseSightRange', 'Class', 'Special', 'Capture', 'CombatClass', 'Domain', 'CivilianAttackPriority', 'DefaultUnitAI', 'Food', 'NoBadGoodies', 'RivalTerritory', 'MilitarySupport', 'MilitaryProduction', 'Pillage', 'Found', 'FoundAbroad', 'CultureBombRadius', 'GoldenAgeTurns', 'IgnoreBuildingDefense', 'PrereqResources', 'Mechanized', 'Suicide', 'CaptureWhileEmbarked', 'PrereqTech', 'ObsoleteTech', 'GoodyHutUpgradeUnitClass', 'HurryCostModifier', 'AdvancedStartCost', 'MinAreaSize', 'AirUnitCap', 'NukeDamageLevel', 'WorkRate', 'NumFreeTechs', 'RushBuilding', 'BaseHurry', 'HurryMultiplier', 'BaseGold', 'NumGoldPerEra', 'SpreadReligion', 'IsReligious', 'CombatLimit', 'RangeAttackOnlyInDomain', 'RangeAttackIgnoreLOS', 'RangedCombatLimit', 'XPValueAttack', 'XPValueDefense', 'SpecialCargo', 'DomainCargo', 'Conscription', 'ExtraMaintenanceCost', 'NoMaintenance', 'Unhappiness', 'UnitArtInfo', 'UnitArtInfoCulturalVariation', 'UnitArtInfoEraVariation', 'ProjectPrereq', 'SpaceshipProject', 'LeaderPromotion', 'LeaderExperience', 'DontShowYields', 'ShowInPedia', 'MoveRate', 'UnitFlagIconOffset', 'PortraitIndex', 'IconAtlas', 'UnitFlagAtlas')
	SELECT	("UNIT_FIGHTER_3"), ("TXT_KEY_UNIT_FIGHTER"), "Civilopedia", "Strategy", "Help", "Requirements",
			"Combat", (55), (400), "Moves", "Immobile", (12), "BaseSightRange", ("UNITCLASS_FIGHTER_3"), "Special", "Capture", "CombatClass", "Domain", "CivilianAttackPriority", "DefaultUnitAI", "Food", "NoBadGoodies", "RivalTerritory", "MilitarySupport", "MilitaryProduction", "Pillage", "Found", "FoundAbroad", "CultureBombRadius", "GoldenAgeTurns", "IgnoreBuildingDefense", "PrereqResources", "Mechanized", "Suicide", "CaptureWhileEmbarked", "PrereqTech", "ObsoleteTech", "GoodyHutUpgradeUnitClass", "HurryCostModifier", "AdvancedStartCost", "MinAreaSize", "AirUnitCap", "NukeDamageLevel", "WorkRate", "NumFreeTechs", "RushBuilding", "BaseHurry", "HurryMultiplier", "BaseGold", "NumGoldPerEra", "SpreadReligion", "IsReligious", "CombatLimit", "RangeAttackOnlyInDomain", "RangeAttackIgnoreLOS", "RangedCombatLimit", "XPValueAttack", "XPValueDefense", "SpecialCargo", "DomainCargo", "Conscription", "ExtraMaintenanceCost", "NoMaintenance", "Unhappiness",
			("ART_DEF_UNIT_FIGHTER"), "UnitArtInfoCulturalVariation", "UnitArtInfoEraVariation", "ProjectPrereq", "SpaceshipProject", "LeaderPromotion", "LeaderExperience", "DontShowYields", "ShowInPedia", "MoveRate",
			"UnitFlagIconOffset", "PortraitIndex", "IconAtlas", "UnitFlagAtlas"
	FROM "Units" WHERE (Type = "UNIT_FIGHTER");
INSERT INTO "Unit_AITypes" ('UnitType', 'UnitAIType')
	SELECT ("UNIT_FIGHTER_3"), "UnitAIType"
	FROM "Unit_AITypes" WHERE (UnitType = "UNIT_FIGHTER");
INSERT INTO "Unit_ClassUpgrades" ('UnitType', 'UnitClassType')
	SELECT ("UNIT_FIGHTER_3"), "UnitClassType"
	FROM "Unit_ClassUpgrades" WHERE (UnitType = "UNIT_FIGHTER");
INSERT INTO "Unit_Flavors" ('UnitType', 'FlavorType', 'Flavor')
	SELECT ("UNIT_FIGHTER_3"), "FlavorType", "Flavor"
	FROM "Unit_Flavors" WHERE (UnitType = "UNIT_FIGHTER");
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	SELECT ("UNIT_FIGHTER_3"), "PromotionType"
	FROM "Unit_FreePromotions" WHERE (UnitType = "UNIT_FIGHTER");
UPDATE Unit_FreePromotions
	SET UnitType = 'UNIT_FIGHTER_3', PromotionType = 'PROMOTION_MODERN_FIGHTER'
	WHERE UnitType = 'UNIT_FIGHTER_3' AND PromotionType = 'PROMOTION_FIGHTER';
INSERT INTO "Unit_ResourceQuantityRequirements" ('UnitType', 'ResourceType', 'Cost')
	SELECT ("UNIT_FIGHTER_3"), "ResourceType", "Cost"
	FROM "Unit_ResourceQuantityRequirements" WHERE (UnitType = "UNIT_FIGHTER");
----

-- Heavy Fighter
INSERT INTO "Units" ('Type', 'Description', 'Civilopedia', 'Strategy', 'Help', 'Requirements', 'Combat', 'RangedCombat', 'Cost', 'Moves', 'Immobile', 'Range', 'BaseSightRange', 'Class', 'Special', 'Capture', 'CombatClass', 'Domain', 'CivilianAttackPriority', 'DefaultUnitAI', 'Food', 'NoBadGoodies', 'RivalTerritory', 'MilitarySupport', 'MilitaryProduction', 'Pillage', 'Found', 'FoundAbroad', 'CultureBombRadius', 'GoldenAgeTurns', 'IgnoreBuildingDefense', 'PrereqResources', 'Mechanized', 'Suicide', 'CaptureWhileEmbarked', 'PrereqTech', 'ObsoleteTech', 'GoodyHutUpgradeUnitClass', 'HurryCostModifier', 'AdvancedStartCost', 'MinAreaSize', 'AirUnitCap', 'NukeDamageLevel', 'WorkRate', 'NumFreeTechs', 'RushBuilding', 'BaseHurry', 'HurryMultiplier', 'BaseGold', 'NumGoldPerEra', 'SpreadReligion', 'IsReligious', 'CombatLimit', 'RangeAttackOnlyInDomain', 'RangeAttackIgnoreLOS', 'RangedCombatLimit', 'XPValueAttack', 'XPValueDefense', 'SpecialCargo', 'DomainCargo', 'Conscription', 'ExtraMaintenanceCost', 'NoMaintenance', 'Unhappiness', 'UnitArtInfo', 'UnitArtInfoCulturalVariation', 'UnitArtInfoEraVariation', 'ProjectPrereq', 'SpaceshipProject', 'LeaderPromotion', 'LeaderExperience', 'DontShowYields', 'ShowInPedia', 'MoveRate', 'UnitFlagIconOffset', 'PortraitIndex', 'IconAtlas', 'UnitFlagAtlas')
	SELECT	("UNIT_HEAVY_FIGHTER"), ("TXT_KEY_UNIT_HEAVY_FIGHTER"), "Civilopedia", "Strategy", ("TXT_KEY_UNIT_HELP_HEAVY_FIGHTER"), "Requirements",
			"Combat", (45), (390), "Moves", "Immobile", (12), "BaseSightRange", ("UNITCLASS_HEAVY_FIGHTER"), "Special", "Capture", "CombatClass", "Domain", "CivilianAttackPriority", "DefaultUnitAI", "Food", "NoBadGoodies", "RivalTerritory", "MilitarySupport", "MilitaryProduction", "Pillage", "Found", "FoundAbroad", "CultureBombRadius", "GoldenAgeTurns", "IgnoreBuildingDefense", "PrereqResources", "Mechanized", "Suicide", "CaptureWhileEmbarked", "PrereqTech", "ObsoleteTech", "GoodyHutUpgradeUnitClass", "HurryCostModifier", "AdvancedStartCost", "MinAreaSize", "AirUnitCap", "NukeDamageLevel", "WorkRate", "NumFreeTechs", "RushBuilding", "BaseHurry", "HurryMultiplier", "BaseGold", "NumGoldPerEra", "SpreadReligion", "IsReligious", "CombatLimit", "RangeAttackOnlyInDomain", "RangeAttackIgnoreLOS", "RangedCombatLimit", "XPValueAttack", "XPValueDefense", "SpecialCargo", "DomainCargo", "Conscription", "ExtraMaintenanceCost", "NoMaintenance", "Unhappiness",
			("ART_DEF_UNIT_FIGHTER"), "UnitArtInfoCulturalVariation", "UnitArtInfoEraVariation", "ProjectPrereq", "SpaceshipProject", "LeaderPromotion", "LeaderExperience", "DontShowYields", "ShowInPedia", "MoveRate",
			"UnitFlagIconOffset", ("3"), ("WW2_UNIT_ICONS"), "UnitFlagAtlas"
	FROM "Units" WHERE (Type = "UNIT_FIGHTER");
INSERT INTO "Unit_AITypes" ('UnitType', 'UnitAIType')
	SELECT ("UNIT_HEAVY_FIGHTER"), "UnitAIType"
	FROM "Unit_AITypes" WHERE (UnitType = "UNIT_FIGHTER");
INSERT INTO "Unit_ClassUpgrades" ('UnitType', 'UnitClassType')
	SELECT ("UNIT_HEAVY_FIGHTER"), "UnitClassType"
	FROM "Unit_ClassUpgrades" WHERE (UnitType = "UNIT_FIGHTER");
INSERT INTO "Unit_Flavors" ('UnitType', 'FlavorType', 'Flavor')
	SELECT ("UNIT_HEAVY_FIGHTER"), "FlavorType", "Flavor"
	FROM "Unit_Flavors" WHERE (UnitType = "UNIT_FIGHTER");
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	SELECT ("UNIT_HEAVY_FIGHTER"), "PromotionType"
	FROM "Unit_FreePromotions" WHERE (UnitType = "UNIT_FIGHTER");
UPDATE Unit_FreePromotions
	SET UnitType = 'UNIT_HEAVY_FIGHTER', PromotionType = 'PROMOTION_HEAVY_FIGHTER'
	WHERE UnitType = 'UNIT_HEAVY_FIGHTER' AND PromotionType = 'PROMOTION_FIGHTER';
INSERT INTO "Unit_ResourceQuantityRequirements" ('UnitType', 'ResourceType', 'Cost')
	SELECT ("UNIT_HEAVY_FIGHTER"), "ResourceType", "Cost"
	FROM "Unit_ResourceQuantityRequirements" WHERE (UnitType = "UNIT_FIGHTER");
----

-- Heavy Fighter B
INSERT INTO "Units" ('Type', 'Description', 'Civilopedia', 'Strategy', 'Help', 'Requirements', 'Combat', 'RangedCombat', 'Cost', 'Moves', 'Immobile', 'Range', 'BaseSightRange', 'Class', 'Special', 'Capture', 'CombatClass', 'Domain', 'CivilianAttackPriority', 'DefaultUnitAI', 'Food', 'NoBadGoodies', 'RivalTerritory', 'MilitarySupport', 'MilitaryProduction', 'Pillage', 'Found', 'FoundAbroad', 'CultureBombRadius', 'GoldenAgeTurns', 'IgnoreBuildingDefense', 'PrereqResources', 'Mechanized', 'Suicide', 'CaptureWhileEmbarked', 'PrereqTech', 'ObsoleteTech', 'GoodyHutUpgradeUnitClass', 'HurryCostModifier', 'AdvancedStartCost', 'MinAreaSize', 'AirUnitCap', 'NukeDamageLevel', 'WorkRate', 'NumFreeTechs', 'RushBuilding', 'BaseHurry', 'HurryMultiplier', 'BaseGold', 'NumGoldPerEra', 'SpreadReligion', 'IsReligious', 'CombatLimit', 'RangeAttackOnlyInDomain', 'RangeAttackIgnoreLOS', 'RangedCombatLimit', 'XPValueAttack', 'XPValueDefense', 'SpecialCargo', 'DomainCargo', 'Conscription', 'ExtraMaintenanceCost', 'NoMaintenance', 'Unhappiness', 'UnitArtInfo', 'UnitArtInfoCulturalVariation', 'UnitArtInfoEraVariation', 'ProjectPrereq', 'SpaceshipProject', 'LeaderPromotion', 'LeaderExperience', 'DontShowYields', 'ShowInPedia', 'MoveRate', 'UnitFlagIconOffset', 'PortraitIndex', 'IconAtlas', 'UnitFlagAtlas')
	SELECT	("UNIT_HEAVY_FIGHTER_B"), ("TXT_KEY_UNIT_HEAVY_FIGHTER"), "Civilopedia", "Strategy", "Help", "Requirements",
			"Combat", (48), (395), "Moves", "Immobile", (13), "BaseSightRange", ("UNITCLASS_HEAVY_FIGHTER_B"), "Special", "Capture", "CombatClass", "Domain", "CivilianAttackPriority", "DefaultUnitAI", "Food", "NoBadGoodies", "RivalTerritory", "MilitarySupport", "MilitaryProduction", "Pillage", "Found", "FoundAbroad", "CultureBombRadius", "GoldenAgeTurns", "IgnoreBuildingDefense", "PrereqResources", "Mechanized", "Suicide", "CaptureWhileEmbarked", "PrereqTech", "ObsoleteTech", "GoodyHutUpgradeUnitClass", "HurryCostModifier", "AdvancedStartCost", "MinAreaSize", "AirUnitCap", "NukeDamageLevel", "WorkRate", "NumFreeTechs", "RushBuilding", "BaseHurry", "HurryMultiplier", "BaseGold", "NumGoldPerEra", "SpreadReligion", "IsReligious", "CombatLimit", "RangeAttackOnlyInDomain", "RangeAttackIgnoreLOS", "RangedCombatLimit", "XPValueAttack", "XPValueDefense", "SpecialCargo", "DomainCargo", "Conscription", "ExtraMaintenanceCost", "NoMaintenance", "Unhappiness",
			("ART_DEF_UNIT_FIGHTER"), "UnitArtInfoCulturalVariation", "UnitArtInfoEraVariation", "ProjectPrereq", "SpaceshipProject", "LeaderPromotion", "LeaderExperience", "DontShowYields", "ShowInPedia", "MoveRate",
			"UnitFlagIconOffset", "PortraitIndex", "IconAtlas", "UnitFlagAtlas"
	FROM "Units" WHERE (Type = "UNIT_HEAVY_FIGHTER");
INSERT INTO "Unit_AITypes" ('UnitType', 'UnitAIType')
	SELECT ("UNIT_HEAVY_FIGHTER_B"), "UnitAIType"
	FROM "Unit_AITypes" WHERE (UnitType = "UNIT_HEAVY_FIGHTER");
INSERT INTO "Unit_ClassUpgrades" ('UnitType', 'UnitClassType')
	SELECT ("UNIT_HEAVY_FIGHTER_B"), "UnitClassType"
	FROM "Unit_ClassUpgrades" WHERE (UnitType = "UNIT_HEAVY_FIGHTER");
INSERT INTO "Unit_Flavors" ('UnitType', 'FlavorType', 'Flavor')
	SELECT ("UNIT_HEAVY_FIGHTER_B"), "FlavorType", "Flavor"
	FROM "Unit_Flavors" WHERE (UnitType = "UNIT_HEAVY_FIGHTER");
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	SELECT ("UNIT_HEAVY_FIGHTER_B"), "PromotionType"
	FROM "Unit_FreePromotions" WHERE (UnitType = "UNIT_HEAVY_FIGHTER");
INSERT INTO "Unit_ResourceQuantityRequirements" ('UnitType', 'ResourceType', 'Cost')
	SELECT ("UNIT_HEAVY_FIGHTER_B"), "ResourceType", "Cost"
	FROM "Unit_ResourceQuantityRequirements" WHERE (UnitType = "UNIT_HEAVY_FIGHTER");
----

-- Heavy Fighter 2
INSERT INTO "Units" ('Type', 'Description', 'Civilopedia', 'Strategy', 'Help', 'Requirements', 'Combat', 'RangedCombat', 'Cost', 'Moves', 'Immobile', 'Range', 'BaseSightRange', 'Class', 'Special', 'Capture', 'CombatClass', 'Domain', 'CivilianAttackPriority', 'DefaultUnitAI', 'Food', 'NoBadGoodies', 'RivalTerritory', 'MilitarySupport', 'MilitaryProduction', 'Pillage', 'Found', 'FoundAbroad', 'CultureBombRadius', 'GoldenAgeTurns', 'IgnoreBuildingDefense', 'PrereqResources', 'Mechanized', 'Suicide', 'CaptureWhileEmbarked', 'PrereqTech', 'ObsoleteTech', 'GoodyHutUpgradeUnitClass', 'HurryCostModifier', 'AdvancedStartCost', 'MinAreaSize', 'AirUnitCap', 'NukeDamageLevel', 'WorkRate', 'NumFreeTechs', 'RushBuilding', 'BaseHurry', 'HurryMultiplier', 'BaseGold', 'NumGoldPerEra', 'SpreadReligion', 'IsReligious', 'CombatLimit', 'RangeAttackOnlyInDomain', 'RangeAttackIgnoreLOS', 'RangedCombatLimit', 'XPValueAttack', 'XPValueDefense', 'SpecialCargo', 'DomainCargo', 'Conscription', 'ExtraMaintenanceCost', 'NoMaintenance', 'Unhappiness', 'UnitArtInfo', 'UnitArtInfoCulturalVariation', 'UnitArtInfoEraVariation', 'ProjectPrereq', 'SpaceshipProject', 'LeaderPromotion', 'LeaderExperience', 'DontShowYields', 'ShowInPedia', 'MoveRate', 'UnitFlagIconOffset', 'PortraitIndex', 'IconAtlas', 'UnitFlagAtlas')
	SELECT	("UNIT_HEAVY_FIGHTER_2"), ("TXT_KEY_UNIT_HEAVY_FIGHTER"), "Civilopedia", "Strategy", "Help", "Requirements",
			"Combat", (52), (400), "Moves", "Immobile", (13), "BaseSightRange", ("UNITCLASS_HEAVY_FIGHTER_2"), "Special", "Capture", "CombatClass", "Domain", "CivilianAttackPriority", "DefaultUnitAI", "Food", "NoBadGoodies", "RivalTerritory", "MilitarySupport", "MilitaryProduction", "Pillage", "Found", "FoundAbroad", "CultureBombRadius", "GoldenAgeTurns", "IgnoreBuildingDefense", "PrereqResources", "Mechanized", "Suicide", "CaptureWhileEmbarked", "PrereqTech", "ObsoleteTech", "GoodyHutUpgradeUnitClass", "HurryCostModifier", "AdvancedStartCost", "MinAreaSize", "AirUnitCap", "NukeDamageLevel", "WorkRate", "NumFreeTechs", "RushBuilding", "BaseHurry", "HurryMultiplier", "BaseGold", "NumGoldPerEra", "SpreadReligion", "IsReligious", "CombatLimit", "RangeAttackOnlyInDomain", "RangeAttackIgnoreLOS", "RangedCombatLimit", "XPValueAttack", "XPValueDefense", "SpecialCargo", "DomainCargo", "Conscription", "ExtraMaintenanceCost", "NoMaintenance", "Unhappiness",
			("ART_DEF_UNIT_FIGHTER"), "UnitArtInfoCulturalVariation", "UnitArtInfoEraVariation", "ProjectPrereq", "SpaceshipProject", "LeaderPromotion", "LeaderExperience", "DontShowYields", "ShowInPedia", "MoveRate",
			"UnitFlagIconOffset", "PortraitIndex", "IconAtlas", "UnitFlagAtlas"
	FROM "Units" WHERE (Type = "UNIT_HEAVY_FIGHTER");
INSERT INTO "Unit_AITypes" ('UnitType', 'UnitAIType')
	SELECT ("UNIT_HEAVY_FIGHTER_2"), "UnitAIType"
	FROM "Unit_AITypes" WHERE (UnitType = "UNIT_HEAVY_FIGHTER");
INSERT INTO "Unit_ClassUpgrades" ('UnitType', 'UnitClassType')
	SELECT ("UNIT_HEAVY_FIGHTER_2"), "UnitClassType"
	FROM "Unit_ClassUpgrades" WHERE (UnitType = "UNIT_HEAVY_FIGHTER");
INSERT INTO "Unit_Flavors" ('UnitType', 'FlavorType', 'Flavor')
	SELECT ("UNIT_HEAVY_FIGHTER_2"), "FlavorType", "Flavor"
	FROM "Unit_Flavors" WHERE (UnitType = "UNIT_HEAVY_FIGHTER");
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	SELECT ("UNIT_HEAVY_FIGHTER_2"), "PromotionType"
	FROM "Unit_FreePromotions" WHERE (UnitType = "UNIT_HEAVY_FIGHTER");
INSERT INTO "Unit_ResourceQuantityRequirements" ('UnitType', 'ResourceType', 'Cost')
	SELECT ("UNIT_HEAVY_FIGHTER_2"), "ResourceType", "Cost"
	FROM "Unit_ResourceQuantityRequirements" WHERE (UnitType = "UNIT_HEAVY_FIGHTER");
----

-- Heavy Fighter 3
INSERT INTO "Units" ('Type', 'Description', 'Civilopedia', 'Strategy', 'Help', 'Requirements', 'Combat', 'RangedCombat', 'Cost', 'Moves', 'Immobile', 'Range', 'BaseSightRange', 'Class', 'Special', 'Capture', 'CombatClass', 'Domain', 'CivilianAttackPriority', 'DefaultUnitAI', 'Food', 'NoBadGoodies', 'RivalTerritory', 'MilitarySupport', 'MilitaryProduction', 'Pillage', 'Found', 'FoundAbroad', 'CultureBombRadius', 'GoldenAgeTurns', 'IgnoreBuildingDefense', 'PrereqResources', 'Mechanized', 'Suicide', 'CaptureWhileEmbarked', 'PrereqTech', 'ObsoleteTech', 'GoodyHutUpgradeUnitClass', 'HurryCostModifier', 'AdvancedStartCost', 'MinAreaSize', 'AirUnitCap', 'NukeDamageLevel', 'WorkRate', 'NumFreeTechs', 'RushBuilding', 'BaseHurry', 'HurryMultiplier', 'BaseGold', 'NumGoldPerEra', 'SpreadReligion', 'IsReligious', 'CombatLimit', 'RangeAttackOnlyInDomain', 'RangeAttackIgnoreLOS', 'RangedCombatLimit', 'XPValueAttack', 'XPValueDefense', 'SpecialCargo', 'DomainCargo', 'Conscription', 'ExtraMaintenanceCost', 'NoMaintenance', 'Unhappiness', 'UnitArtInfo', 'UnitArtInfoCulturalVariation', 'UnitArtInfoEraVariation', 'ProjectPrereq', 'SpaceshipProject', 'LeaderPromotion', 'LeaderExperience', 'DontShowYields', 'ShowInPedia', 'MoveRate', 'UnitFlagIconOffset', 'PortraitIndex', 'IconAtlas', 'UnitFlagAtlas')
	SELECT	("UNIT_HEAVY_FIGHTER_3"), ("TXT_KEY_UNIT_HEAVY_FIGHTER"), "Civilopedia", "Strategy", "Help", "Requirements",
			"Combat", (65), (420), "Moves", "Immobile", (14), "BaseSightRange", ("UNITCLASS_HEAVY_FIGHTER_3"), "Special", "Capture", "CombatClass", "Domain", "CivilianAttackPriority", "DefaultUnitAI", "Food", "NoBadGoodies", "RivalTerritory", "MilitarySupport", "MilitaryProduction", "Pillage", "Found", "FoundAbroad", "CultureBombRadius", "GoldenAgeTurns", "IgnoreBuildingDefense", "PrereqResources", "Mechanized", "Suicide", "CaptureWhileEmbarked", "PrereqTech", "ObsoleteTech", "GoodyHutUpgradeUnitClass", "HurryCostModifier", "AdvancedStartCost", "MinAreaSize", "AirUnitCap", "NukeDamageLevel", "WorkRate", "NumFreeTechs", "RushBuilding", "BaseHurry", "HurryMultiplier", "BaseGold", "NumGoldPerEra", "SpreadReligion", "IsReligious", "CombatLimit", "RangeAttackOnlyInDomain", "RangeAttackIgnoreLOS", "RangedCombatLimit", "XPValueAttack", "XPValueDefense", "SpecialCargo", "DomainCargo", "Conscription", "ExtraMaintenanceCost", "NoMaintenance", "Unhappiness",
			("ART_DEF_UNIT_FIGHTER"), "UnitArtInfoCulturalVariation", "UnitArtInfoEraVariation", "ProjectPrereq", "SpaceshipProject", "LeaderPromotion", "LeaderExperience", "DontShowYields", "ShowInPedia", "MoveRate",
			"UnitFlagIconOffset", "PortraitIndex", "IconAtlas", "UnitFlagAtlas"
	FROM "Units" WHERE (Type = "UNIT_HEAVY_FIGHTER");
INSERT INTO "Unit_AITypes" ('UnitType', 'UnitAIType')
	SELECT ("UNIT_HEAVY_FIGHTER_3"), "UnitAIType"
	FROM "Unit_AITypes" WHERE (UnitType = "UNIT_HEAVY_FIGHTER");
INSERT INTO "Unit_ClassUpgrades" ('UnitType', 'UnitClassType')
	SELECT ("UNIT_HEAVY_FIGHTER_3"), "UnitClassType"
	FROM "Unit_ClassUpgrades" WHERE (UnitType = "UNIT_HEAVY_FIGHTER");
INSERT INTO "Unit_Flavors" ('UnitType', 'FlavorType', 'Flavor')
	SELECT ("UNIT_HEAVY_FIGHTER_3"), "FlavorType", "Flavor"
	FROM "Unit_Flavors" WHERE (UnitType = "UNIT_HEAVY_FIGHTER");
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	SELECT ("UNIT_HEAVY_FIGHTER_3"), "PromotionType"
	FROM "Unit_FreePromotions" WHERE (UnitType = "UNIT_HEAVY_FIGHTER");
INSERT INTO "Unit_ResourceQuantityRequirements" ('UnitType', 'ResourceType', 'Cost')
	SELECT ("UNIT_HEAVY_FIGHTER_3"), "ResourceType", "Cost"
	FROM "Unit_ResourceQuantityRequirements" WHERE (UnitType = "UNIT_HEAVY_FIGHTER");
----


-- Attack Aircraft
INSERT INTO "Units" ('Type', 'Description', 'Civilopedia', 'Strategy', 'Help', 'Requirements', 'Combat', 'RangedCombat', 'Cost', 'Moves', 'Immobile', 'Range', 'BaseSightRange', 'Class', 'Special', 'Capture', 'CombatClass', 'Domain', 'CivilianAttackPriority', 'DefaultUnitAI', 'Food', 'NoBadGoodies', 'RivalTerritory', 'MilitarySupport', 'MilitaryProduction', 'Pillage', 'Found', 'FoundAbroad', 'CultureBombRadius', 'GoldenAgeTurns', 'IgnoreBuildingDefense', 'PrereqResources', 'Mechanized', 'Suicide', 'CaptureWhileEmbarked', 'PrereqTech', 'ObsoleteTech', 'GoodyHutUpgradeUnitClass', 'HurryCostModifier', 'AdvancedStartCost', 'MinAreaSize', 'AirUnitCap', 'NukeDamageLevel', 'WorkRate', 'NumFreeTechs', 'RushBuilding', 'BaseHurry', 'HurryMultiplier', 'BaseGold', 'NumGoldPerEra', 'SpreadReligion', 'IsReligious', 'CombatLimit', 'RangeAttackOnlyInDomain', 'RangeAttackIgnoreLOS', 'RangedCombatLimit', 'XPValueAttack', 'XPValueDefense', 'SpecialCargo', 'DomainCargo', 'Conscription', 'ExtraMaintenanceCost', 'NoMaintenance', 'Unhappiness', 'UnitArtInfo', 'UnitArtInfoCulturalVariation', 'UnitArtInfoEraVariation', 'ProjectPrereq', 'SpaceshipProject', 'LeaderPromotion', 'LeaderExperience', 'DontShowYields', 'ShowInPedia', 'MoveRate', 'UnitFlagIconOffset', 'PortraitIndex', 'IconAtlas', 'UnitFlagAtlas')
	SELECT	("UNIT_ATTACK_AIRCRAFT"), ("TXT_KEY_UNIT_ATTACK_AIRCRAFT"), "Civilopedia", "Strategy", ("TXT_KEY_UNIT_HELP_ATTACK_AIRCRAFT"), "Requirements",
			"Combat", (30), (350), "Moves", "Immobile", (8), "BaseSightRange", ("UNITCLASS_ATTACK_AIRCRAFT"), "Special", "Capture", "CombatClass", "Domain", "CivilianAttackPriority", "DefaultUnitAI", "Food", "NoBadGoodies", "RivalTerritory", "MilitarySupport", "MilitaryProduction", "Pillage", "Found", "FoundAbroad", "CultureBombRadius", "GoldenAgeTurns", "IgnoreBuildingDefense", "PrereqResources", "Mechanized", "Suicide", "CaptureWhileEmbarked", "PrereqTech", "ObsoleteTech", "GoodyHutUpgradeUnitClass", "HurryCostModifier", "AdvancedStartCost", "MinAreaSize", "AirUnitCap", "NukeDamageLevel", "WorkRate", "NumFreeTechs", "RushBuilding", "BaseHurry", "HurryMultiplier", "BaseGold", "NumGoldPerEra", "SpreadReligion", "IsReligious", "CombatLimit", "RangeAttackOnlyInDomain", "RangeAttackIgnoreLOS", "RangedCombatLimit", "XPValueAttack", "XPValueDefense", "SpecialCargo", "DomainCargo", "Conscription", "ExtraMaintenanceCost", "NoMaintenance", "Unhappiness",
			("ART_DEF_UNIT_BOMBER"), "UnitArtInfoCulturalVariation", "UnitArtInfoEraVariation", "ProjectPrereq", "SpaceshipProject", "LeaderPromotion", "LeaderExperience", "DontShowYields", "ShowInPedia", "MoveRate",
			"UnitFlagIconOffset", ("5"), ("WW2_UNIT_ICONS"), "UnitFlagAtlas"
	FROM "Units" WHERE (Type = "UNIT_BOMBER");
INSERT INTO "Unit_AITypes" ('UnitType', 'UnitAIType')
	SELECT ("UNIT_ATTACK_AIRCRAFT"), "UnitAIType"
	FROM "Unit_AITypes" WHERE (UnitType = "UNIT_BOMBER");
INSERT INTO "Unit_ClassUpgrades" ('UnitType', 'UnitClassType')
	SELECT ("UNIT_ATTACK_AIRCRAFT"), "UnitClassType"
	FROM "Unit_ClassUpgrades" WHERE (UnitType = "UNIT_BOMBER");
INSERT INTO "Unit_Flavors" ('UnitType', 'FlavorType', 'Flavor')
	SELECT ("UNIT_ATTACK_AIRCRAFT"), "FlavorType", "Flavor"
	FROM "Unit_Flavors" WHERE (UnitType = "UNIT_BOMBER");
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	SELECT ("UNIT_ATTACK_AIRCRAFT"), "PromotionType"
	FROM "Unit_FreePromotions" WHERE (UnitType = "UNIT_BOMBER");
-- Special Promotion against land
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	VALUES ( 'UNIT_ATTACK_AIRCRAFT', 'PROMOTION_ATTACK_AIRCRAFT' );
-- No penalty against ship
DELETE FROM "Unit_FreePromotions" WHERE (UnitType = "UNIT_ATTACK_AIRCRAFT" AND PromotionType = "PROMOTION_NAVAL_PENALTY");
--
INSERT INTO "Unit_ResourceQuantityRequirements" ('UnitType', 'ResourceType', 'Cost')
	SELECT ("UNIT_ATTACK_AIRCRAFT"), "ResourceType", "Cost"
	FROM "Unit_ResourceQuantityRequirements" WHERE (UnitType = "UNIT_BOMBER");
----

-- Fast Bomber
INSERT INTO "Units" ('Type', 'Description', 'Civilopedia', 'Strategy', 'Help', 'Requirements', 'Combat', 'RangedCombat', 'Cost', 'Moves', 'Immobile', 'Range', 'BaseSightRange', 'Class', 'Special', 'Capture', 'CombatClass', 'Domain', 'CivilianAttackPriority', 'DefaultUnitAI', 'Food', 'NoBadGoodies', 'RivalTerritory', 'MilitarySupport', 'MilitaryProduction', 'Pillage', 'Found', 'FoundAbroad', 'CultureBombRadius', 'GoldenAgeTurns', 'IgnoreBuildingDefense', 'PrereqResources', 'Mechanized', 'Suicide', 'CaptureWhileEmbarked', 'PrereqTech', 'ObsoleteTech', 'GoodyHutUpgradeUnitClass', 'HurryCostModifier', 'AdvancedStartCost', 'MinAreaSize', 'AirUnitCap', 'NukeDamageLevel', 'WorkRate', 'NumFreeTechs', 'RushBuilding', 'BaseHurry', 'HurryMultiplier', 'BaseGold', 'NumGoldPerEra', 'SpreadReligion', 'IsReligious', 'CombatLimit', 'RangeAttackOnlyInDomain', 'RangeAttackIgnoreLOS', 'RangedCombatLimit', 'XPValueAttack', 'XPValueDefense', 'SpecialCargo', 'DomainCargo', 'Conscription', 'ExtraMaintenanceCost', 'NoMaintenance', 'Unhappiness', 'UnitArtInfo', 'UnitArtInfoCulturalVariation', 'UnitArtInfoEraVariation', 'ProjectPrereq', 'SpaceshipProject', 'LeaderPromotion', 'LeaderExperience', 'DontShowYields', 'ShowInPedia', 'MoveRate', 'UnitFlagIconOffset', 'PortraitIndex', 'IconAtlas', 'UnitFlagAtlas')
	SELECT	("UNIT_FAST_BOMBER"), ("TXT_KEY_UNIT_FAST_BOMBER"), "Civilopedia", "Strategy", ("TXT_KEY_UNIT_HELP_FAST_BOMBER"), "Requirements",
			"Combat", (40), (420), "Moves", "Immobile", (12), "BaseSightRange", ("UNITCLASS_FAST_BOMBER"), "Special", "Capture", "CombatClass", "Domain", "CivilianAttackPriority", "DefaultUnitAI", "Food", "NoBadGoodies", "RivalTerritory", "MilitarySupport", "MilitaryProduction", "Pillage", "Found", "FoundAbroad", "CultureBombRadius", "GoldenAgeTurns", "IgnoreBuildingDefense", "PrereqResources", "Mechanized", "Suicide", "CaptureWhileEmbarked", "PrereqTech", "ObsoleteTech", "GoodyHutUpgradeUnitClass", "HurryCostModifier", "AdvancedStartCost", "MinAreaSize", "AirUnitCap", "NukeDamageLevel", "WorkRate", "NumFreeTechs", "RushBuilding", "BaseHurry", "HurryMultiplier", "BaseGold", "NumGoldPerEra", "SpreadReligion", "IsReligious", "CombatLimit", "RangeAttackOnlyInDomain", "RangeAttackIgnoreLOS", "RangedCombatLimit", "XPValueAttack", "XPValueDefense", "SpecialCargo", "DomainCargo", "Conscription", "ExtraMaintenanceCost", "NoMaintenance", "Unhappiness",
			("ART_DEF_UNIT_BOMBER"), "UnitArtInfoCulturalVariation", "UnitArtInfoEraVariation", "ProjectPrereq", "SpaceshipProject", "LeaderPromotion", "LeaderExperience", "DontShowYields", "ShowInPedia", "MoveRate",
			"UnitFlagIconOffset", ("1"), ("WW2_UNIT_ICONS"), "UnitFlagAtlas"
	FROM "Units" WHERE (Type = "UNIT_BOMBER");
INSERT INTO "Unit_AITypes" ('UnitType', 'UnitAIType')
	SELECT ("UNIT_FAST_BOMBER"), "UnitAIType"
	FROM "Unit_AITypes" WHERE (UnitType = "UNIT_BOMBER");
INSERT INTO "Unit_ClassUpgrades" ('UnitType', 'UnitClassType')
	SELECT ("UNIT_FAST_BOMBER"), "UnitClassType"
	FROM "Unit_ClassUpgrades" WHERE (UnitType = "UNIT_BOMBER");
INSERT INTO "Unit_Flavors" ('UnitType', 'FlavorType', 'Flavor')
	SELECT ("UNIT_FAST_BOMBER"), "FlavorType", "Flavor"
	FROM "Unit_Flavors" WHERE (UnitType = "UNIT_BOMBER");
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	SELECT ("UNIT_FAST_BOMBER"), "PromotionType"
	FROM "Unit_FreePromotions" WHERE (UnitType = "UNIT_BOMBER");
-- Special Promotion against land
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	VALUES ( 'UNIT_FAST_BOMBER', 'PROMOTION_FAST_BOMBER' );
-- No penalty against ship
DELETE FROM "Unit_FreePromotions" WHERE (UnitType = "UNIT_FAST_BOMBER" AND PromotionType = "PROMOTION_NAVAL_PENALTY");
--
INSERT INTO "Unit_ResourceQuantityRequirements" ('UnitType', 'ResourceType', 'Cost')
	SELECT ("UNIT_FAST_BOMBER"), "ResourceType", "Cost"
	FROM "Unit_ResourceQuantityRequirements" WHERE (UnitType = "UNIT_BOMBER");
----

-- Fast Bomber 2
INSERT INTO "Units" ('Type', 'Description', 'Civilopedia', 'Strategy', 'Help', 'Requirements', 'Combat', 'RangedCombat', 'Cost', 'Moves', 'Immobile', 'Range', 'BaseSightRange', 'Class', 'Special', 'Capture', 'CombatClass', 'Domain', 'CivilianAttackPriority', 'DefaultUnitAI', 'Food', 'NoBadGoodies', 'RivalTerritory', 'MilitarySupport', 'MilitaryProduction', 'Pillage', 'Found', 'FoundAbroad', 'CultureBombRadius', 'GoldenAgeTurns', 'IgnoreBuildingDefense', 'PrereqResources', 'Mechanized', 'Suicide', 'CaptureWhileEmbarked', 'PrereqTech', 'ObsoleteTech', 'GoodyHutUpgradeUnitClass', 'HurryCostModifier', 'AdvancedStartCost', 'MinAreaSize', 'AirUnitCap', 'NukeDamageLevel', 'WorkRate', 'NumFreeTechs', 'RushBuilding', 'BaseHurry', 'HurryMultiplier', 'BaseGold', 'NumGoldPerEra', 'SpreadReligion', 'IsReligious', 'CombatLimit', 'RangeAttackOnlyInDomain', 'RangeAttackIgnoreLOS', 'RangedCombatLimit', 'XPValueAttack', 'XPValueDefense', 'SpecialCargo', 'DomainCargo', 'Conscription', 'ExtraMaintenanceCost', 'NoMaintenance', 'Unhappiness', 'UnitArtInfo', 'UnitArtInfoCulturalVariation', 'UnitArtInfoEraVariation', 'ProjectPrereq', 'SpaceshipProject', 'LeaderPromotion', 'LeaderExperience', 'DontShowYields', 'ShowInPedia', 'MoveRate', 'UnitFlagIconOffset', 'PortraitIndex', 'IconAtlas', 'UnitFlagAtlas')
	SELECT	("UNIT_FAST_BOMBER_2"), ("TXT_KEY_UNIT_FAST_BOMBER"), "Civilopedia", "Strategy", "Help", "Requirements",
			"Combat", (44), (425), "Moves", "Immobile", (12), "BaseSightRange", ("UNITCLASS_FAST_BOMBER_2"), "Special", "Capture", "CombatClass", "Domain", "CivilianAttackPriority", "DefaultUnitAI", "Food", "NoBadGoodies", "RivalTerritory", "MilitarySupport", "MilitaryProduction", "Pillage", "Found", "FoundAbroad", "CultureBombRadius", "GoldenAgeTurns", "IgnoreBuildingDefense", "PrereqResources", "Mechanized", "Suicide", "CaptureWhileEmbarked", "PrereqTech", "ObsoleteTech", "GoodyHutUpgradeUnitClass", "HurryCostModifier", "AdvancedStartCost", "MinAreaSize", "AirUnitCap", "NukeDamageLevel", "WorkRate", "NumFreeTechs", "RushBuilding", "BaseHurry", "HurryMultiplier", "BaseGold", "NumGoldPerEra", "SpreadReligion", "IsReligious", "CombatLimit", "RangeAttackOnlyInDomain", "RangeAttackIgnoreLOS", "RangedCombatLimit", "XPValueAttack", "XPValueDefense", "SpecialCargo", "DomainCargo", "Conscription", "ExtraMaintenanceCost", "NoMaintenance", "Unhappiness",
			("ART_DEF_UNIT_BOMBER"), "UnitArtInfoCulturalVariation", "UnitArtInfoEraVariation", "ProjectPrereq", "SpaceshipProject", "LeaderPromotion", "LeaderExperience", "DontShowYields", "ShowInPedia", "MoveRate",
			"UnitFlagIconOffset", "PortraitIndex", "IconAtlas", "UnitFlagAtlas"
	FROM "Units" WHERE (Type = "UNIT_FAST_BOMBER");
INSERT INTO "Unit_AITypes" ('UnitType', 'UnitAIType')
	SELECT ("UNIT_FAST_BOMBER_2"), "UnitAIType"
	FROM "Unit_AITypes" WHERE (UnitType = "UNIT_FAST_BOMBER");
INSERT INTO "Unit_ClassUpgrades" ('UnitType', 'UnitClassType')
	SELECT ("UNIT_FAST_BOMBER_2"), "UnitClassType"
	FROM "Unit_ClassUpgrades" WHERE (UnitType = "UNIT_FAST_BOMBER");
INSERT INTO "Unit_Flavors" ('UnitType', 'FlavorType', 'Flavor')
	SELECT ("UNIT_FAST_BOMBER_2"), "FlavorType", "Flavor"
	FROM "Unit_Flavors" WHERE (UnitType = "UNIT_FAST_BOMBER");
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	SELECT ("UNIT_FAST_BOMBER_2"), "PromotionType"
	FROM "Unit_FreePromotions" WHERE (UnitType = "UNIT_FAST_BOMBER");
-- Small Evasion 2
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	VALUES ( 'UNIT_FAST_BOMBER_2', 'PROMOTION_SMALL_EVASION' );
INSERT INTO "Unit_ResourceQuantityRequirements" ('UnitType', 'ResourceType', 'Cost')
	SELECT ("UNIT_FAST_BOMBER_2"), "ResourceType", "Cost"
	FROM "Unit_ResourceQuantityRequirements" WHERE (UnitType = "UNIT_FAST_BOMBER");
----

-- Heavy Bomber
INSERT INTO "Units" ('Type', 'Description', 'Civilopedia', 'Strategy', 'Help', 'Requirements', 'Combat', 'RangedCombat', 'Cost', 'Moves', 'Immobile', 'Range', 'BaseSightRange', 'Class', 'Special', 'Capture', 'CombatClass', 'Domain', 'CivilianAttackPriority', 'DefaultUnitAI', 'Food', 'NoBadGoodies', 'RivalTerritory', 'MilitarySupport', 'MilitaryProduction', 'Pillage', 'Found', 'FoundAbroad', 'CultureBombRadius', 'GoldenAgeTurns', 'IgnoreBuildingDefense', 'PrereqResources', 'Mechanized', 'Suicide', 'CaptureWhileEmbarked', 'PrereqTech', 'ObsoleteTech', 'GoodyHutUpgradeUnitClass', 'HurryCostModifier', 'AdvancedStartCost', 'MinAreaSize', 'AirUnitCap', 'NukeDamageLevel', 'WorkRate', 'NumFreeTechs', 'RushBuilding', 'BaseHurry', 'HurryMultiplier', 'BaseGold', 'NumGoldPerEra', 'SpreadReligion', 'IsReligious', 'CombatLimit', 'RangeAttackOnlyInDomain', 'RangeAttackIgnoreLOS', 'RangedCombatLimit', 'XPValueAttack', 'XPValueDefense', 'SpecialCargo', 'DomainCargo', 'Conscription', 'ExtraMaintenanceCost', 'NoMaintenance', 'Unhappiness', 'UnitArtInfo', 'UnitArtInfoCulturalVariation', 'UnitArtInfoEraVariation', 'ProjectPrereq', 'SpaceshipProject', 'LeaderPromotion', 'LeaderExperience', 'DontShowYields', 'ShowInPedia', 'MoveRate', 'UnitFlagIconOffset', 'PortraitIndex', 'IconAtlas', 'UnitFlagAtlas')
	SELECT	("UNIT_HEAVY_BOMBER"), ("TXT_KEY_UNIT_HEAVY_BOMBER"), "Civilopedia", "Strategy", ("TXT_KEY_UNIT_HELP_HEAVY_BOMBER"), "Requirements",
			"Combat", (70), (500), "Moves", "Immobile", (16), "BaseSightRange", ("UNITCLASS_HEAVY_BOMBER"), "Special", "Capture", "CombatClass", "Domain", "CivilianAttackPriority", "DefaultUnitAI", "Food", "NoBadGoodies", "RivalTerritory", "MilitarySupport", "MilitaryProduction", "Pillage", "Found", "FoundAbroad", "CultureBombRadius", "GoldenAgeTurns", "IgnoreBuildingDefense", "PrereqResources", "Mechanized", "Suicide", "CaptureWhileEmbarked", "PrereqTech", "ObsoleteTech", "GoodyHutUpgradeUnitClass", "HurryCostModifier", "AdvancedStartCost", "MinAreaSize", "AirUnitCap", "NukeDamageLevel", "WorkRate", "NumFreeTechs", "RushBuilding", "BaseHurry", "HurryMultiplier", "BaseGold", "NumGoldPerEra", "SpreadReligion", "IsReligious", "CombatLimit", "RangeAttackOnlyInDomain", "RangeAttackIgnoreLOS", "RangedCombatLimit", "XPValueAttack", "XPValueDefense", "SpecialCargo", "DomainCargo", "Conscription", "ExtraMaintenanceCost", "NoMaintenance", "Unhappiness",
			("ART_DEF_UNIT_BOMBER"), "UnitArtInfoCulturalVariation", "UnitArtInfoEraVariation", "ProjectPrereq", "SpaceshipProject", "LeaderPromotion", "LeaderExperience", "DontShowYields", "ShowInPedia", "MoveRate",
			"UnitFlagIconOffset", ("42"), "IconAtlas", "UnitFlagAtlas"
	FROM "Units" WHERE (Type = "UNIT_BOMBER");
INSERT INTO "Unit_AITypes" ('UnitType', 'UnitAIType')
	SELECT ("UNIT_HEAVY_BOMBER"), "UnitAIType"
	FROM "Unit_AITypes" WHERE (UnitType = "UNIT_BOMBER");
INSERT INTO "Unit_ClassUpgrades" ('UnitType', 'UnitClassType')
	SELECT ("UNIT_HEAVY_BOMBER"), "UnitClassType"
	FROM "Unit_ClassUpgrades" WHERE (UnitType = "UNIT_BOMBER");
INSERT INTO "Unit_Flavors" ('UnitType', 'FlavorType', 'Flavor')
	SELECT ("UNIT_HEAVY_BOMBER"), "FlavorType", "Flavor"
	FROM "Unit_Flavors" WHERE (UnitType = "UNIT_BOMBER");
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	SELECT ("UNIT_HEAVY_BOMBER"), "PromotionType"
	FROM "Unit_FreePromotions" WHERE (UnitType = "UNIT_BOMBER");
-- Heavy Bombers promotions
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	VALUES ( 'UNIT_HEAVY_BOMBER', 'PROMOTION_HEAVY' );
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	VALUES ( 'UNIT_HEAVY_BOMBER', 'PROMOTION_HEAVY_BOMBER' );	
-- penalty against ship is part of PROMOTION_HEAVY_BOMBER !
DELETE FROM "Unit_FreePromotions" WHERE (UnitType = "UNIT_HEAVY_BOMBER" AND PromotionType = "PROMOTION_NAVAL_PENALTY");
--
INSERT INTO "Unit_ResourceQuantityRequirements" ('UnitType', 'ResourceType', 'Cost')
	SELECT ("UNIT_HEAVY_BOMBER"), "ResourceType", "Cost"
	FROM "Unit_ResourceQuantityRequirements" WHERE (UnitType = "UNIT_BOMBER");
----

-- Heavy Bomber 2
INSERT INTO "Units" ('Type', 'Description', 'Civilopedia', 'Strategy', 'Help', 'Requirements', 'Combat', 'RangedCombat', 'Cost', 'Moves', 'Immobile', 'Range', 'BaseSightRange', 'Class', 'Special', 'Capture', 'CombatClass', 'Domain', 'CivilianAttackPriority', 'DefaultUnitAI', 'Food', 'NoBadGoodies', 'RivalTerritory', 'MilitarySupport', 'MilitaryProduction', 'Pillage', 'Found', 'FoundAbroad', 'CultureBombRadius', 'GoldenAgeTurns', 'IgnoreBuildingDefense', 'PrereqResources', 'Mechanized', 'Suicide', 'CaptureWhileEmbarked', 'PrereqTech', 'ObsoleteTech', 'GoodyHutUpgradeUnitClass', 'HurryCostModifier', 'AdvancedStartCost', 'MinAreaSize', 'AirUnitCap', 'NukeDamageLevel', 'WorkRate', 'NumFreeTechs', 'RushBuilding', 'BaseHurry', 'HurryMultiplier', 'BaseGold', 'NumGoldPerEra', 'SpreadReligion', 'IsReligious', 'CombatLimit', 'RangeAttackOnlyInDomain', 'RangeAttackIgnoreLOS', 'RangedCombatLimit', 'XPValueAttack', 'XPValueDefense', 'SpecialCargo', 'DomainCargo', 'Conscription', 'ExtraMaintenanceCost', 'NoMaintenance', 'Unhappiness', 'UnitArtInfo', 'UnitArtInfoCulturalVariation', 'UnitArtInfoEraVariation', 'ProjectPrereq', 'SpaceshipProject', 'LeaderPromotion', 'LeaderExperience', 'DontShowYields', 'ShowInPedia', 'MoveRate', 'UnitFlagIconOffset', 'PortraitIndex', 'IconAtlas', 'UnitFlagAtlas')
	SELECT	("UNIT_HEAVY_BOMBER_2"), ("TXT_KEY_UNIT_HEAVY_BOMBER"), "Civilopedia", "Strategy", "Help", "Requirements",
			"Combat", (80), (525), "Moves", "Immobile", (18), "BaseSightRange", ("UNITCLASS_HEAVY_BOMBER_2"), "Special", "Capture", "CombatClass", "Domain", "CivilianAttackPriority", "DefaultUnitAI", "Food", "NoBadGoodies", "RivalTerritory", "MilitarySupport", "MilitaryProduction", "Pillage", "Found", "FoundAbroad", "CultureBombRadius", "GoldenAgeTurns", "IgnoreBuildingDefense", "PrereqResources", "Mechanized", "Suicide", "CaptureWhileEmbarked", "PrereqTech", "ObsoleteTech", "GoodyHutUpgradeUnitClass", "HurryCostModifier", "AdvancedStartCost", "MinAreaSize", "AirUnitCap", "NukeDamageLevel", "WorkRate", "NumFreeTechs", "RushBuilding", "BaseHurry", "HurryMultiplier", "BaseGold", "NumGoldPerEra", "SpreadReligion", "IsReligious", "CombatLimit", "RangeAttackOnlyInDomain", "RangeAttackIgnoreLOS", "RangedCombatLimit", "XPValueAttack", "XPValueDefense", "SpecialCargo", "DomainCargo", "Conscription", "ExtraMaintenanceCost", "NoMaintenance", "Unhappiness",
			("ART_DEF_UNIT_BOMBER"), "UnitArtInfoCulturalVariation", "UnitArtInfoEraVariation", "ProjectPrereq", "SpaceshipProject", "LeaderPromotion", "LeaderExperience", "DontShowYields", "ShowInPedia", "MoveRate",
			"UnitFlagIconOffset", "PortraitIndex", "IconAtlas", "UnitFlagAtlas"
	FROM "Units" WHERE (Type = "UNIT_HEAVY_BOMBER");
INSERT INTO "Unit_AITypes" ('UnitType', 'UnitAIType')
	SELECT ("UNIT_HEAVY_BOMBER_2"), "UnitAIType"
	FROM "Unit_AITypes" WHERE (UnitType = "UNIT_HEAVY_BOMBER");
INSERT INTO "Unit_ClassUpgrades" ('UnitType', 'UnitClassType')
	SELECT ("UNIT_HEAVY_BOMBER_2"), "UnitClassType"
	FROM "Unit_ClassUpgrades" WHERE (UnitType = "UNIT_HEAVY_BOMBER");
INSERT INTO "Unit_Flavors" ('UnitType', 'FlavorType', 'Flavor')
	SELECT ("UNIT_HEAVY_BOMBER_2"), "FlavorType", "Flavor"
	FROM "Unit_Flavors" WHERE (UnitType = "UNIT_HEAVY_BOMBER");
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	SELECT ("UNIT_HEAVY_BOMBER_2"), "PromotionType"
	FROM "Unit_FreePromotions" WHERE (UnitType = "UNIT_HEAVY_BOMBER");
INSERT INTO "Unit_ResourceQuantityRequirements" ('UnitType', 'ResourceType', 'Cost')
	SELECT ("UNIT_HEAVY_BOMBER_2"), "ResourceType", "Cost"
	FROM "Unit_ResourceQuantityRequirements" WHERE (UnitType = "UNIT_HEAVY_BOMBER");
----

-- Old Heavy Bomber
INSERT INTO "Units" ('Type', 'Description', 'Civilopedia', 'Strategy', 'Help', 'Requirements', 'Combat', 'RangedCombat', 'Cost', 'Moves', 'Immobile', 'Range', 'BaseSightRange', 'Class', 'Special', 'Capture', 'CombatClass', 'Domain', 'CivilianAttackPriority', 'DefaultUnitAI', 'Food', 'NoBadGoodies', 'RivalTerritory', 'MilitarySupport', 'MilitaryProduction', 'Pillage', 'Found', 'FoundAbroad', 'CultureBombRadius', 'GoldenAgeTurns', 'IgnoreBuildingDefense', 'PrereqResources', 'Mechanized', 'Suicide', 'CaptureWhileEmbarked', 'PrereqTech', 'ObsoleteTech', 'GoodyHutUpgradeUnitClass', 'HurryCostModifier', 'AdvancedStartCost', 'MinAreaSize', 'AirUnitCap', 'NukeDamageLevel', 'WorkRate', 'NumFreeTechs', 'RushBuilding', 'BaseHurry', 'HurryMultiplier', 'BaseGold', 'NumGoldPerEra', 'SpreadReligion', 'IsReligious', 'CombatLimit', 'RangeAttackOnlyInDomain', 'RangeAttackIgnoreLOS', 'RangedCombatLimit', 'XPValueAttack', 'XPValueDefense', 'SpecialCargo', 'DomainCargo', 'Conscription', 'ExtraMaintenanceCost', 'NoMaintenance', 'Unhappiness', 'UnitArtInfo', 'UnitArtInfoCulturalVariation', 'UnitArtInfoEraVariation', 'ProjectPrereq', 'SpaceshipProject', 'LeaderPromotion', 'LeaderExperience', 'DontShowYields', 'ShowInPedia', 'MoveRate', 'UnitFlagIconOffset', 'PortraitIndex', 'IconAtlas', 'UnitFlagAtlas')
	SELECT	("UNIT_OLD_HEAVY_BOMBER"), ("TXT_KEY_UNIT_HEAVY_BOMBER"), "Civilopedia", "Strategy", "Help", "Requirements",
			"Combat", (60), (450), "Moves", "Immobile", (15), "BaseSightRange", ("UNITCLASS_OLD_HEAVY_BOMBER"), "Special", "Capture", "CombatClass", "Domain", "CivilianAttackPriority", "DefaultUnitAI", "Food", "NoBadGoodies", "RivalTerritory", "MilitarySupport", "MilitaryProduction", "Pillage", "Found", "FoundAbroad", "CultureBombRadius", "GoldenAgeTurns", "IgnoreBuildingDefense", "PrereqResources", "Mechanized", "Suicide", "CaptureWhileEmbarked", "PrereqTech", "ObsoleteTech", "GoodyHutUpgradeUnitClass", "HurryCostModifier", "AdvancedStartCost", "MinAreaSize", "AirUnitCap", "NukeDamageLevel", "WorkRate", "NumFreeTechs", "RushBuilding", "BaseHurry", "HurryMultiplier", "BaseGold", "NumGoldPerEra", "SpreadReligion", "IsReligious", "CombatLimit", "RangeAttackOnlyInDomain", "RangeAttackIgnoreLOS", "RangedCombatLimit", "XPValueAttack", "XPValueDefense", "SpecialCargo", "DomainCargo", "Conscription", "ExtraMaintenanceCost", "NoMaintenance", "Unhappiness",
			("ART_DEF_UNIT_BOMBER"), "UnitArtInfoCulturalVariation", "UnitArtInfoEraVariation", "ProjectPrereq", "SpaceshipProject", "LeaderPromotion", "LeaderExperience", "DontShowYields", "ShowInPedia", "MoveRate",
			"UnitFlagIconOffset", "PortraitIndex", "IconAtlas", "UnitFlagAtlas"
	FROM "Units" WHERE (Type = "UNIT_HEAVY_BOMBER");
INSERT INTO "Unit_AITypes" ('UnitType', 'UnitAIType')
	SELECT ("UNIT_OLD_HEAVY_BOMBER"), "UnitAIType"
	FROM "Unit_AITypes" WHERE (UnitType = "UNIT_HEAVY_BOMBER");
INSERT INTO "Unit_ClassUpgrades" ('UnitType', 'UnitClassType')
	SELECT ("UNIT_OLD_HEAVY_BOMBER"), "UnitClassType"
	FROM "Unit_ClassUpgrades" WHERE (UnitType = "UNIT_HEAVY_BOMBER");
INSERT INTO "Unit_Flavors" ('UnitType', 'FlavorType', 'Flavor')
	SELECT ("UNIT_OLD_HEAVY_BOMBER"), "FlavorType", "Flavor"
	FROM "Unit_Flavors" WHERE (UnitType = "UNIT_HEAVY_BOMBER");
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	SELECT ("UNIT_OLD_HEAVY_BOMBER"), "PromotionType"
	FROM "Unit_FreePromotions" WHERE (UnitType = "UNIT_HEAVY_BOMBER");
--
INSERT INTO "Unit_ResourceQuantityRequirements" ('UnitType', 'ResourceType', 'Cost')
	SELECT ("UNIT_OLD_HEAVY_BOMBER"), "ResourceType", "Cost"
	FROM "Unit_ResourceQuantityRequirements" WHERE (UnitType = "UNIT_HEAVY_BOMBER");
----

--------------------------------------------------------------
-- Sea
--------------------------------------------------------------


-- Battleship 2
INSERT INTO "Units" ('Type', 'Description', 'Civilopedia', 'Strategy', 'Help', 'Requirements', 'Combat', 'RangedCombat', 'Cost', 'Moves', 'Immobile', 'Range', 'BaseSightRange', 'Class', 'Special', 'Capture', 'CombatClass', 'Domain', 'CivilianAttackPriority', 'DefaultUnitAI', 'Food', 'NoBadGoodies', 'RivalTerritory', 'MilitarySupport', 'MilitaryProduction', 'Pillage', 'Found', 'FoundAbroad', 'CultureBombRadius', 'GoldenAgeTurns', 'IgnoreBuildingDefense', 'PrereqResources', 'Mechanized', 'Suicide', 'CaptureWhileEmbarked', 'PrereqTech', 'ObsoleteTech', 'GoodyHutUpgradeUnitClass', 'HurryCostModifier', 'AdvancedStartCost', 'MinAreaSize', 'AirUnitCap', 'NukeDamageLevel', 'WorkRate', 'NumFreeTechs', 'RushBuilding', 'BaseHurry', 'HurryMultiplier', 'BaseGold', 'NumGoldPerEra', 'SpreadReligion', 'IsReligious', 'CombatLimit', 'RangeAttackOnlyInDomain', 'RangeAttackIgnoreLOS', 'RangedCombatLimit', 'XPValueAttack', 'XPValueDefense', 'SpecialCargo', 'DomainCargo', 'Conscription', 'ExtraMaintenanceCost', 'NoMaintenance', 'Unhappiness', 'UnitArtInfo', 'UnitArtInfoCulturalVariation', 'UnitArtInfoEraVariation', 'ProjectPrereq', 'SpaceshipProject', 'LeaderPromotion', 'LeaderExperience', 'DontShowYields', 'ShowInPedia', 'MoveRate', 'UnitFlagIconOffset', 'PortraitIndex', 'IconAtlas', 'UnitFlagAtlas')
	SELECT	("UNIT_BATTLESHIP_2"), ("TXT_KEY_UNIT_BATTLESHIP_2"), "Civilopedia", "Strategy", "Help", "Requirements",
			(75), (50), (750), "Moves", "Immobile", "Range", "BaseSightRange", ("UNITCLASS_BATTLESHIP_2"), "Special", "Capture", "CombatClass", "Domain", "CivilianAttackPriority", "DefaultUnitAI", "Food", "NoBadGoodies", "RivalTerritory", "MilitarySupport", "MilitaryProduction", "Pillage", "Found", "FoundAbroad", "CultureBombRadius", "GoldenAgeTurns", "IgnoreBuildingDefense", "PrereqResources", "Mechanized", "Suicide", "CaptureWhileEmbarked", "PrereqTech", "ObsoleteTech", "GoodyHutUpgradeUnitClass", "HurryCostModifier", "AdvancedStartCost", "MinAreaSize", "AirUnitCap", "NukeDamageLevel", "WorkRate", "NumFreeTechs", "RushBuilding", "BaseHurry", "HurryMultiplier", "BaseGold", "NumGoldPerEra", "SpreadReligion", "IsReligious", "CombatLimit", "RangeAttackOnlyInDomain", "RangeAttackIgnoreLOS", "RangedCombatLimit", "XPValueAttack", "XPValueDefense", "SpecialCargo", "DomainCargo", "Conscription", "ExtraMaintenanceCost", "NoMaintenance", "Unhappiness",
			("ART_DEF_UNIT_BATTLESHIP"), "UnitArtInfoCulturalVariation", "UnitArtInfoEraVariation", "ProjectPrereq", "SpaceshipProject", "LeaderPromotion", "LeaderExperience", "DontShowYields", "ShowInPedia", "MoveRate",
			"UnitFlagIconOffset", "PortraitIndex", "IconAtlas", "UnitFlagAtlas"
	FROM "Units" WHERE (Type = "UNIT_BATTLESHIP");
INSERT INTO "Unit_AITypes" ('UnitType', 'UnitAIType')
	SELECT ("UNIT_BATTLESHIP_2"), "UnitAIType"
	FROM "Unit_AITypes" WHERE (UnitType = "UNIT_BATTLESHIP");
INSERT INTO "Unit_ClassUpgrades" ('UnitType', 'UnitClassType')
	SELECT ("UNIT_BATTLESHIP_2"), "UnitClassType"
	FROM "Unit_ClassUpgrades" WHERE (UnitType = "UNIT_BATTLESHIP");
INSERT INTO "Unit_Flavors" ('UnitType', 'FlavorType', 'Flavor')
	SELECT ("UNIT_BATTLESHIP_2"), "FlavorType", "Flavor"
	FROM "Unit_Flavors" WHERE (UnitType = "UNIT_BATTLESHIP");
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	SELECT ("UNIT_BATTLESHIP_2"), "PromotionType"
	FROM "Unit_FreePromotions" WHERE (UnitType = "UNIT_BATTLESHIP");
INSERT INTO "Unit_ResourceQuantityRequirements" ('UnitType', 'ResourceType', 'Cost')
	SELECT ("UNIT_BATTLESHIP_2"), "ResourceType", "Cost"
	FROM "Unit_ResourceQuantityRequirements" WHERE (UnitType = "UNIT_BATTLESHIP");

-- Cruiser
INSERT INTO "Units" ('Type', 'Description', 'Civilopedia', 'Strategy', 'Help', 'Requirements', 'Combat', 'RangedCombat', 'Cost', 'Moves', 'Immobile', 'Range', 'BaseSightRange', 'Class', 'Special', 'Capture', 'CombatClass', 'Domain', 'CivilianAttackPriority', 'DefaultUnitAI', 'Food', 'NoBadGoodies', 'RivalTerritory', 'MilitarySupport', 'MilitaryProduction', 'Pillage', 'Found', 'FoundAbroad', 'CultureBombRadius', 'GoldenAgeTurns', 'IgnoreBuildingDefense', 'PrereqResources', 'Mechanized', 'Suicide', 'CaptureWhileEmbarked', 'PrereqTech', 'ObsoleteTech', 'GoodyHutUpgradeUnitClass', 'HurryCostModifier', 'AdvancedStartCost', 'MinAreaSize', 'AirUnitCap', 'NukeDamageLevel', 'WorkRate', 'NumFreeTechs', 'RushBuilding', 'BaseHurry', 'HurryMultiplier', 'BaseGold', 'NumGoldPerEra', 'SpreadReligion', 'IsReligious', 'CombatLimit', 'RangeAttackOnlyInDomain', 'RangeAttackIgnoreLOS', 'RangedCombatLimit', 'XPValueAttack', 'XPValueDefense', 'SpecialCargo', 'DomainCargo', 'Conscription', 'ExtraMaintenanceCost', 'NoMaintenance', 'Unhappiness', 'UnitArtInfo', 'UnitArtInfoCulturalVariation', 'UnitArtInfoEraVariation', 'ProjectPrereq', 'SpaceshipProject', 'LeaderPromotion', 'LeaderExperience', 'DontShowYields', 'ShowInPedia', 'MoveRate', 'UnitFlagIconOffset', 'PortraitIndex', 'IconAtlas', 'UnitFlagAtlas')
	SELECT	("UNIT_CRUISER"), ("TXT_KEY_UNIT_CRUISER"), "Civilopedia", "Strategy", ("TXT_KEY_UNIT_HELP_CRUISER"), "Requirements",
			(45), (30), (435), (6), "Immobile", "Range", "BaseSightRange", ("UNITCLASS_CRUISER"), "Special", "Capture", "CombatClass", "Domain", "CivilianAttackPriority", "DefaultUnitAI", "Food", "NoBadGoodies", "RivalTerritory", "MilitarySupport", "MilitaryProduction", "Pillage", "Found", "FoundAbroad", "CultureBombRadius", "GoldenAgeTurns", "IgnoreBuildingDefense", "PrereqResources", "Mechanized", "Suicide", "CaptureWhileEmbarked", "PrereqTech", "ObsoleteTech", "GoodyHutUpgradeUnitClass", "HurryCostModifier", "AdvancedStartCost", "MinAreaSize", "AirUnitCap", "NukeDamageLevel", "WorkRate", "NumFreeTechs", "RushBuilding", "BaseHurry", "HurryMultiplier", "BaseGold", "NumGoldPerEra", "SpreadReligion", "IsReligious", "CombatLimit", "RangeAttackOnlyInDomain", "RangeAttackIgnoreLOS", "RangedCombatLimit", "XPValueAttack", "XPValueDefense", "SpecialCargo", "DomainCargo", "Conscription", "ExtraMaintenanceCost", "NoMaintenance", "Unhappiness",
			("ART_DEF_UNIT_CRUISER"), "UnitArtInfoCulturalVariation", "UnitArtInfoEraVariation", "ProjectPrereq", "SpaceshipProject", "LeaderPromotion", "LeaderExperience", "DontShowYields", "ShowInPedia", "MoveRate",
			"UnitFlagIconOffset", (20), "IconAtlas", "UnitFlagAtlas"
	FROM "Units" WHERE (Type = "UNIT_BATTLESHIP");
INSERT INTO "Unit_AITypes" ('UnitType', 'UnitAIType')
	SELECT ("UNIT_CRUISER"), "UnitAIType"
	FROM "Unit_AITypes" WHERE (UnitType = "UNIT_BATTLESHIP");
INSERT INTO "Unit_ClassUpgrades" ('UnitType', 'UnitClassType')
	SELECT ("UNIT_CRUISER"), "UnitClassType"
	FROM "Unit_ClassUpgrades" WHERE (UnitType = "UNIT_BATTLESHIP");
INSERT INTO "Unit_Flavors" ('UnitType', 'FlavorType', 'Flavor')
	SELECT ("UNIT_CRUISER"), "FlavorType", "Flavor"
	FROM "Unit_Flavors" WHERE (UnitType = "UNIT_BATTLESHIP");
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	SELECT ("UNIT_CRUISER"), "PromotionType"
	FROM "Unit_FreePromotions" WHERE (UnitType = "UNIT_BATTLESHIP");
-- cruiser promotion
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	VALUES ( 'UNIT_CRUISER', 'PROMOTION_CRUISER' );
-- antisubmarine
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	VALUES ( 'UNIT_CRUISER', 'PROMOTION_ANTI_SUBMARINE_I' );
--
INSERT INTO "Unit_ResourceQuantityRequirements" ('UnitType', 'ResourceType', 'Cost')
	SELECT ("UNIT_CRUISER"), "ResourceType", "Cost"
	FROM "Unit_ResourceQuantityRequirements" WHERE (UnitType = "UNIT_BATTLESHIP");


-- HEAVY CRUISER
INSERT INTO "Units" ('Type', 'Description', 'Civilopedia', 'Strategy', 'Help', 'Requirements', 'Combat', 'RangedCombat', 'Cost', 'Moves', 'Immobile', 'Range', 'BaseSightRange', 'Class', 'Special', 'Capture', 'CombatClass', 'Domain', 'CivilianAttackPriority', 'DefaultUnitAI', 'Food', 'NoBadGoodies', 'RivalTerritory', 'MilitarySupport', 'MilitaryProduction', 'Pillage', 'Found', 'FoundAbroad', 'CultureBombRadius', 'GoldenAgeTurns', 'IgnoreBuildingDefense', 'PrereqResources', 'Mechanized', 'Suicide', 'CaptureWhileEmbarked', 'PrereqTech', 'ObsoleteTech', 'GoodyHutUpgradeUnitClass', 'HurryCostModifier', 'AdvancedStartCost', 'MinAreaSize', 'AirUnitCap', 'NukeDamageLevel', 'WorkRate', 'NumFreeTechs', 'RushBuilding', 'BaseHurry', 'HurryMultiplier', 'BaseGold', 'NumGoldPerEra', 'SpreadReligion', 'IsReligious', 'CombatLimit', 'RangeAttackOnlyInDomain', 'RangeAttackIgnoreLOS', 'RangedCombatLimit', 'XPValueAttack', 'XPValueDefense', 'SpecialCargo', 'DomainCargo', 'Conscription', 'ExtraMaintenanceCost', 'NoMaintenance', 'Unhappiness', 'UnitArtInfo', 'UnitArtInfoCulturalVariation', 'UnitArtInfoEraVariation', 'ProjectPrereq', 'SpaceshipProject', 'LeaderPromotion', 'LeaderExperience', 'DontShowYields', 'ShowInPedia', 'MoveRate', 'UnitFlagIconOffset', 'PortraitIndex', 'IconAtlas', 'UnitFlagAtlas')
	SELECT	("UNIT_HEAVY_CRUISER"), ("TXT_KEY_UNIT_CRUISER"), "Civilopedia", "Strategy", ("TXT_KEY_UNIT_HELP_HEAVY_CRUISER"), "Requirements",
			(50), (36), (485), (5), "Immobile", "Range", "BaseSightRange", ("UNITCLASS_HEAVY_CRUISER"), "Special", "Capture", "CombatClass", "Domain", "CivilianAttackPriority", "DefaultUnitAI", "Food", "NoBadGoodies", "RivalTerritory", "MilitarySupport", "MilitaryProduction", "Pillage", "Found", "FoundAbroad", "CultureBombRadius", "GoldenAgeTurns", "IgnoreBuildingDefense", "PrereqResources", "Mechanized", "Suicide", "CaptureWhileEmbarked", "PrereqTech", "ObsoleteTech", "GoodyHutUpgradeUnitClass", "HurryCostModifier", "AdvancedStartCost", "MinAreaSize", "AirUnitCap", "NukeDamageLevel", "WorkRate", "NumFreeTechs", "RushBuilding", "BaseHurry", "HurryMultiplier", "BaseGold", "NumGoldPerEra", "SpreadReligion", "IsReligious", "CombatLimit", "RangeAttackOnlyInDomain", "RangeAttackIgnoreLOS", "RangedCombatLimit", "XPValueAttack", "XPValueDefense", "SpecialCargo", "DomainCargo", "Conscription", "ExtraMaintenanceCost", "NoMaintenance", "Unhappiness",
			("ART_DEF_UNIT_CRUISER"), "UnitArtInfoCulturalVariation", "UnitArtInfoEraVariation", "ProjectPrereq", "SpaceshipProject", "LeaderPromotion", "LeaderExperience", "DontShowYields", "ShowInPedia", "MoveRate",
			"UnitFlagIconOffset", "PortraitIndex", "IconAtlas", "UnitFlagAtlas"
	FROM "Units" WHERE (Type = "UNIT_BATTLESHIP");
INSERT INTO "Unit_AITypes" ('UnitType', 'UnitAIType')
	SELECT ("UNIT_HEAVY_CRUISER"), "UnitAIType"
	FROM "Unit_AITypes" WHERE (UnitType = "UNIT_BATTLESHIP");
INSERT INTO "Unit_ClassUpgrades" ('UnitType', 'UnitClassType')
	SELECT ("UNIT_HEAVY_CRUISER"), "UnitClassType"
	FROM "Unit_ClassUpgrades" WHERE (UnitType = "UNIT_BATTLESHIP");
INSERT INTO "Unit_Flavors" ('UnitType', 'FlavorType', 'Flavor')
	SELECT ("UNIT_HEAVY_CRUISER"), "FlavorType", "Flavor"
	FROM "Unit_Flavors" WHERE (UnitType = "UNIT_BATTLESHIP");
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	SELECT ("UNIT_HEAVY_CRUISER"), "PromotionType"
	FROM "Unit_FreePromotions" WHERE (UnitType = "UNIT_BATTLESHIP");
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	VALUES ( 'UNIT_HEAVY_CRUISER', 'PROMOTION_CRUISER' );
INSERT INTO "Unit_ResourceQuantityRequirements" ('UnitType', 'ResourceType', 'Cost')
	SELECT ("UNIT_HEAVY_CRUISER"), "ResourceType", "Cost"
	FROM "Unit_ResourceQuantityRequirements" WHERE (UnitType = "UNIT_BATTLESHIP");

	
-- DREADNOUGHT
INSERT INTO "Units" ('Type', 'Description', 'Civilopedia', 'Strategy', 'Help', 'Requirements', 'Combat', 'RangedCombat', 'Cost', 'Moves', 'Immobile', 'Range', 'BaseSightRange', 'Class', 'Special', 'Capture', 'CombatClass', 'Domain', 'CivilianAttackPriority', 'DefaultUnitAI', 'Food', 'NoBadGoodies', 'RivalTerritory', 'MilitarySupport', 'MilitaryProduction', 'Pillage', 'Found', 'FoundAbroad', 'CultureBombRadius', 'GoldenAgeTurns', 'IgnoreBuildingDefense', 'PrereqResources', 'Mechanized', 'Suicide', 'CaptureWhileEmbarked', 'PrereqTech', 'ObsoleteTech', 'GoodyHutUpgradeUnitClass', 'HurryCostModifier', 'AdvancedStartCost', 'MinAreaSize', 'AirUnitCap', 'NukeDamageLevel', 'WorkRate', 'NumFreeTechs', 'RushBuilding', 'BaseHurry', 'HurryMultiplier', 'BaseGold', 'NumGoldPerEra', 'SpreadReligion', 'IsReligious', 'CombatLimit', 'RangeAttackOnlyInDomain', 'RangeAttackIgnoreLOS', 'RangedCombatLimit', 'XPValueAttack', 'XPValueDefense', 'SpecialCargo', 'DomainCargo', 'Conscription', 'ExtraMaintenanceCost', 'NoMaintenance', 'Unhappiness', 'UnitArtInfo', 'UnitArtInfoCulturalVariation', 'UnitArtInfoEraVariation', 'ProjectPrereq', 'SpaceshipProject', 'LeaderPromotion', 'LeaderExperience', 'DontShowYields', 'ShowInPedia', 'MoveRate', 'UnitFlagIconOffset', 'PortraitIndex', 'IconAtlas', 'UnitFlagAtlas')
	SELECT	("UNIT_DREADNOUGHT"), ("TXT_KEY_UNIT_CRUISER"), "Civilopedia", "Strategy", ("TXT_KEY_UNIT_HELP_DREADNOUGHT"), "Requirements",
			(50), (36), (525), (4), "Immobile", "Range", "BaseSightRange", ("UNITCLASS_DREADNOUGHT"), "Special", "Capture", "CombatClass", "Domain", "CivilianAttackPriority", "DefaultUnitAI", "Food", "NoBadGoodies", "RivalTerritory", "MilitarySupport", "MilitaryProduction", "Pillage", "Found", "FoundAbroad", "CultureBombRadius", "GoldenAgeTurns", "IgnoreBuildingDefense", "PrereqResources", "Mechanized", "Suicide", "CaptureWhileEmbarked", "PrereqTech", "ObsoleteTech", "GoodyHutUpgradeUnitClass", "HurryCostModifier", "AdvancedStartCost", "MinAreaSize", "AirUnitCap", "NukeDamageLevel", "WorkRate", "NumFreeTechs", "RushBuilding", "BaseHurry", "HurryMultiplier", "BaseGold", "NumGoldPerEra", "SpreadReligion", "IsReligious", "CombatLimit", "RangeAttackOnlyInDomain", "RangeAttackIgnoreLOS", "RangedCombatLimit", "XPValueAttack", "XPValueDefense", "SpecialCargo", "DomainCargo", "Conscription", "ExtraMaintenanceCost", "NoMaintenance", "Unhappiness",
			("ART_DEF_UNIT_DREADNOUGHT"), "UnitArtInfoCulturalVariation", "UnitArtInfoEraVariation", "ProjectPrereq", "SpaceshipProject", "LeaderPromotion", "LeaderExperience", "DontShowYields", "ShowInPedia", "MoveRate",
			"UnitFlagIconOffset", (10), "IconAtlas", "UnitFlagAtlas"
	FROM "Units" WHERE (Type = "UNIT_BATTLESHIP");
INSERT INTO "Unit_AITypes" ('UnitType', 'UnitAIType')
	SELECT ("UNIT_DREADNOUGHT"), "UnitAIType"
	FROM "Unit_AITypes" WHERE (UnitType = "UNIT_BATTLESHIP");
INSERT INTO "Unit_ClassUpgrades" ('UnitType', 'UnitClassType')
	SELECT ("UNIT_DREADNOUGHT"), "UnitClassType"
	FROM "Unit_ClassUpgrades" WHERE (UnitType = "UNIT_BATTLESHIP");
INSERT INTO "Unit_Flavors" ('UnitType', 'FlavorType', 'Flavor')
	SELECT ("UNIT_DREADNOUGHT"), "FlavorType", "Flavor"
	FROM "Unit_Flavors" WHERE (UnitType = "UNIT_BATTLESHIP");
INSERT INTO "Unit_FreePromotions" ('UnitType', 'PromotionType')
	SELECT ("UNIT_DREADNOUGHT"), "PromotionType"
	FROM "Unit_FreePromotions" WHERE (UnitType = "UNIT_BATTLESHIP");
INSERT INTO "Unit_ResourceQuantityRequirements" ('UnitType', 'ResourceType', 'Cost')
	SELECT ("UNIT_DREADNOUGHT"), "ResourceType", "Cost"
	FROM "Unit_ResourceQuantityRequirements" WHERE (UnitType = "UNIT_BATTLESHIP");


*/
