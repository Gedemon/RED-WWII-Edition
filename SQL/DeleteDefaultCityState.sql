-- Insert SQL Rules Here 
DROP TABLE MinorCivilizations;
CREATE TABLE MinorCivilizations('ID' integer primary key autoincrement , 'Type' text  not null unique , 'Description' text , 'Civilopedia' text , 'ShortDescription' text , 'Adjective' text , 'ArtDefineTag' text , 'DefaultPlayerColor' text default NULL , 'ArtStyleType' text default NULL , 'ArtStyleSuffix' text default NULL , 'ArtStylePrefix' text default NULL , 'MinorCivTrait' text  not null , foreign key (MinorCivTrait) references MinorCivTraits(Type));

DELETE FROM MinorCivilization_Flavors;
DELETE FROM MinorCivilization_CityNames;