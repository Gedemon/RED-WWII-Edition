
----------------------------------------------------------
-- ArtDefine_Landmarks
----------------------------------------------------------
INSERT INTO ArtDefine_LandmarkTypes (Type,	LandmarkType,	FriendlyName) VALUES
('ART_DEF_IMPROVEMENT_BUNKER',				'Improvement',	'Bunker'	);

INSERT INTO ArtDefine_StrategicView (StrategicViewType, TileType, Asset) VALUES
('ART_DEF_IMPROVEMENT_BUNKER',			'Improvement',	'sv_landmark.dds'	);


INSERT INTO ArtDefine_Landmarks (Era, State, Scale,	ImprovementType,					LayoutHandler,	ResourceType,					Model,						TerrainContour) VALUES
('Any', 'UnderConstruction',	1,  				'ART_DEF_IMPROVEMENT_BUNKER',		'RANDOM',		'ART_DEF_RESOURCE_NONE',		'Bunker_HB.fxsxml',			1	),
('Any', 'Constructed',			1,  				'ART_DEF_IMPROVEMENT_BUNKER',		'RANDOM',		'ART_DEF_RESOURCE_NONE',		'Bunker_B.fxsxml',			1	),
('Any', 'Pillaged',				1,  				'ART_DEF_IMPROVEMENT_BUNKER',		'RANDOM',		'ART_DEF_RESOURCE_NONE',		'Bunker_PL.fxsxml',			1	);

----------------------------------------------------------
-- Improvements
----------------------------------------------------------
INSERT INTO Improvements (Type,	Description,		Civilopedia,	ArtDefineTag,	Water,	PillageGold,	Permanent,	OutsideBorders, DestroyedWhenPillaged,	DefenseModifier,	PortraitIndex,	IconAtlas) VALUES
('IMPROVEMENT_BUNKER',	'Bunker',	'Bunker',	'ART_DEF_IMPROVEMENT_BUNKER',		0,		0,				1,			1,				0,						50,					54,	'UNIT_ACTION_ATLAS'	);

INSERT INTO Improvement_ValidTerrains (ImprovementType, TerrainType) VALUES
('IMPROVEMENT_BUNKER',			'TERRAIN_GRASS' ),
('IMPROVEMENT_BUNKER',			'TERRAIN_PLAINS'),
('IMPROVEMENT_BUNKER',			'TERRAIN_DESERT'),
('IMPROVEMENT_BUNKER',			'TERRAIN_TUNDRA'),
('IMPROVEMENT_BUNKER',			'TERRAIN_SNOW'	);
