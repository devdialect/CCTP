-- Insert SQL Rules Here 

CREATE TABLE IDRemapper ( id INTEGER PRIMARY KEY AUTOINCREMENT, Type TEXT );
INSERT INTO IDRemapper (Type) SELECT Type FROM AICityStrategies ORDER BY ID;
UPDATE AICityStrategies SET ID =	( SELECT IDRemapper.id-1 FROM IDRemapper WHERE AICityStrategies.Type = IDRemapper.Type);

DROP TABLE IDRemapper;
CREATE TABLE IDRemapper ( id INTEGER PRIMARY KEY AUTOINCREMENT, Type TEXT );
INSERT INTO IDRemapper (Type) SELECT Type FROM AIEconomicStrategies ORDER BY ID;
UPDATE AIEconomicStrategies SET ID =	( SELECT IDRemapper.id-1 FROM IDRemapper WHERE AIEconomicStrategies.Type = IDRemapper.Type);

DROP TABLE IDRemapper;
CREATE TABLE IDRemapper ( id INTEGER PRIMARY KEY AUTOINCREMENT, Type TEXT );
INSERT INTO IDRemapper (Type) SELECT Type FROM AIGrandStrategies ORDER BY ID;
UPDATE AIGrandStrategies SET ID =	( SELECT IDRemapper.id-1 FROM IDRemapper WHERE AIGrandStrategies.Type = IDRemapper.Type);


DROP TABLE IDRemapper;
CREATE TABLE IDRemapper ( id INTEGER PRIMARY KEY AUTOINCREMENT, Type TEXT );
INSERT INTO IDRemapper (Type) SELECT Type FROM AIMilitaryStrategies ORDER BY ID;
UPDATE AIMilitaryStrategies SET ID =	( SELECT IDRemapper.id-1 FROM IDRemapper WHERE AIMilitaryStrategies.Type = IDRemapper.Type);

DROP TABLE IDRemapper;
CREATE TABLE IDRemapper ( id INTEGER PRIMARY KEY AUTOINCREMENT, Type TEXT );
INSERT INTO IDRemapper (Type) SELECT Type FROM CitySpecializations ORDER BY ID;
UPDATE CitySpecializations SET ID =	( SELECT IDRemapper.id-1 FROM IDRemapper WHERE CitySpecializations.Type = IDRemapper.Type);

DROP TABLE IDRemapper;
CREATE TABLE IDRemapper ( id INTEGER PRIMARY KEY AUTOINCREMENT, Type TEXT );
INSERT INTO IDRemapper (Type) SELECT Type FROM TacticalMoves ORDER BY ID;
UPDATE TacticalMoves SET ID =	( SELECT IDRemapper.id-1 FROM IDRemapper WHERE TacticalMoves.Type = IDRemapper.Type);

DROP TABLE IDRemapper;
CREATE TABLE IDRemapper ( id INTEGER PRIMARY KEY AUTOINCREMENT, Type TEXT );
INSERT INTO IDRemapper (Type) SELECT Type FROM Attitudes ORDER BY ID;
UPDATE Attitudes SET ID =	( SELECT IDRemapper.id-1 FROM IDRemapper WHERE Attitudes.Type = IDRemapper.Type);

DROP TABLE IDRemapper;
CREATE TABLE IDRemapper ( id INTEGER PRIMARY KEY AUTOINCREMENT, Type TEXT );
INSERT INTO IDRemapper (Type) SELECT Type FROM Calendars ORDER BY ID;
UPDATE Calendars SET ID =	( SELECT IDRemapper.id-1 FROM IDRemapper WHERE Calendars.Type = IDRemapper.Type);

DROP TABLE IDRemapper;
CREATE TABLE IDRemapper ( id INTEGER PRIMARY KEY AUTOINCREMENT, Type TEXT );
INSERT INTO IDRemapper (Type) SELECT Type FROM CitySizes ORDER BY ID;
UPDATE CitySizes SET ID =	( SELECT IDRemapper.id-1 FROM IDRemapper WHERE CitySizes.Type = IDRemapper.Type);

DROP TABLE IDRemapper;
CREATE TABLE IDRemapper ( id INTEGER PRIMARY KEY AUTOINCREMENT, Type TEXT );
INSERT INTO IDRemapper (Type) SELECT Type FROM Concepts ORDER BY ID;
UPDATE Concepts SET ID =	( SELECT IDRemapper.id-1 FROM IDRemapper WHERE Concepts.Type = IDRemapper.Type);

DROP TABLE IDRemapper;
CREATE TABLE IDRemapper ( id INTEGER PRIMARY KEY AUTOINCREMENT, Type TEXT );
INSERT INTO IDRemapper (Type) SELECT Type FROM Contacts ORDER BY ID;
UPDATE Contacts SET ID =	( SELECT IDRemapper.id-1 FROM IDRemapper WHERE Contacts.Type = IDRemapper.Type);

DROP TABLE IDRemapper;
CREATE TABLE IDRemapper ( id INTEGER PRIMARY KEY AUTOINCREMENT, Type TEXT );
INSERT INTO IDRemapper (Type) SELECT Type FROM Domains ORDER BY ID;
UPDATE Domains SET ID =	( SELECT IDRemapper.id-1 FROM IDRemapper WHERE Domains.Type = IDRemapper.Type);

DROP TABLE IDRemapper;
CREATE TABLE IDRemapper ( id INTEGER PRIMARY KEY AUTOINCREMENT, Type TEXT );
INSERT INTO IDRemapper (Type) SELECT Type FROM InvisibleInfos ORDER BY ID;
UPDATE InvisibleInfos SET ID =	( SELECT IDRemapper.id-1 FROM IDRemapper WHERE InvisibleInfos.Type = IDRemapper.Type);

DROP TABLE IDRemapper;
CREATE TABLE IDRemapper ( id INTEGER PRIMARY KEY AUTOINCREMENT, Type TEXT );
INSERT INTO IDRemapper (Type) SELECT Type FROM MajorCivApproachTypes ORDER BY ID;
UPDATE MajorCivApproachTypes SET ID =	( SELECT IDRemapper.id-1 FROM IDRemapper WHERE MajorCivApproachTypes.Type = IDRemapper.Type);

DROP TABLE IDRemapper;
CREATE TABLE IDRemapper ( id INTEGER PRIMARY KEY AUTOINCREMENT, Type TEXT );
INSERT INTO IDRemapper (Type) SELECT Type FROM MinorCivApproachTypes ORDER BY ID;
UPDATE MinorCivApproachTypes SET ID =	( SELECT IDRemapper.id-1 FROM IDRemapper WHERE MinorCivApproachTypes.Type = IDRemapper.Type);

DROP TABLE IDRemapper;
CREATE TABLE IDRemapper ( id INTEGER PRIMARY KEY AUTOINCREMENT, Type TEXT );
INSERT INTO IDRemapper (Type) SELECT Type FROM MinorCivTraits ORDER BY ID;
UPDATE MinorCivTraits SET ID =	( SELECT IDRemapper.id-1 FROM IDRemapper WHERE MinorCivTraits.Type = IDRemapper.Type);

DROP TABLE IDRemapper;
CREATE TABLE IDRemapper ( id INTEGER PRIMARY KEY AUTOINCREMENT, Type TEXT );
INSERT INTO IDRemapper (Type) SELECT Type FROM Months ORDER BY ID;
UPDATE Months SET ID =	( SELECT IDRemapper.id-1 FROM IDRemapper WHERE Months.Type = IDRemapper.Type);

DROP TABLE IDRemapper;
CREATE TABLE IDRemapper ( id INTEGER PRIMARY KEY AUTOINCREMENT, Type TEXT );
INSERT INTO IDRemapper (Type) SELECT Type FROM Seasons ORDER BY ID;
UPDATE Seasons SET ID =	( SELECT IDRemapper.id-1 FROM IDRemapper WHERE Seasons.Type = IDRemapper.Type);

DROP TABLE IDRemapper;
CREATE TABLE IDRemapper ( id INTEGER PRIMARY KEY AUTOINCREMENT, Type TEXT );
INSERT INTO IDRemapper (Type) SELECT Type FROM UnitAIInfos ORDER BY ID;
UPDATE UnitAIInfos SET ID =	( SELECT IDRemapper.id-1 FROM IDRemapper WHERE UnitAIInfos.Type = IDRemapper.Type);

DROP TABLE IDRemapper;
CREATE TABLE IDRemapper ( id INTEGER PRIMARY KEY AUTOINCREMENT, Type TEXT );
INSERT INTO IDRemapper (Type) SELECT Type FROM UnitCombatInfos ORDER BY ID;
UPDATE UnitCombatInfos SET ID =	( SELECT IDRemapper.id-1 FROM IDRemapper WHERE UnitCombatInfos.Type = IDRemapper.Type);

DROP TABLE IDRemapper;
CREATE TABLE IDRemapper ( id INTEGER PRIMARY KEY AUTOINCREMENT, Type TEXT );
INSERT INTO IDRemapper (Type) SELECT Type FROM BuildingClasses ORDER BY ID;
UPDATE BuildingClasses SET ID =	( SELECT IDRemapper.id-1 FROM IDRemapper WHERE BuildingClasses.Type = IDRemapper.Type);

DROP TABLE IDRemapper;
CREATE TABLE IDRemapper ( id INTEGER PRIMARY KEY AUTOINCREMENT, Type TEXT );
INSERT INTO IDRemapper (Type) SELECT Type FROM Buildings ORDER BY ID;
UPDATE Buildings SET ID =	( SELECT IDRemapper.id-1 FROM IDRemapper WHERE Buildings.Type = IDRemapper.Type);

DROP TABLE IDRemapper;
CREATE TABLE IDRemapper ( id INTEGER PRIMARY KEY AUTOINCREMENT, Type TEXT );
INSERT INTO IDRemapper (Type) SELECT Type FROM Civilizations ORDER BY ID;
UPDATE Civilizations SET ID =	( SELECT IDRemapper.id-1 FROM IDRemapper WHERE Civilizations.Type = IDRemapper.Type);

DROP TABLE IDRemapper;
CREATE TABLE IDRemapper ( id INTEGER PRIMARY KEY AUTOINCREMENT, Type TEXT );
INSERT INTO IDRemapper (Type) SELECT Type FROM MinorCivilizations ORDER BY ID;
UPDATE MinorCivilizations SET ID =	( SELECT IDRemapper.id-1 FROM IDRemapper WHERE MinorCivilizations.Type = IDRemapper.Type);

DROP TABLE IDRemapper;
CREATE TABLE IDRemapper ( id INTEGER PRIMARY KEY AUTOINCREMENT, Type TEXT );
INSERT INTO IDRemapper (Type) SELECT Type FROM Regions ORDER BY ID;
UPDATE Regions SET ID =	( SELECT IDRemapper.id-1 FROM IDRemapper WHERE Regions.Type = IDRemapper.Type);

DROP TABLE IDRemapper;
CREATE TABLE IDRemapper ( id INTEGER PRIMARY KEY AUTOINCREMENT, Type TEXT );
INSERT INTO IDRemapper (Type) SELECT Type FROM Traits ORDER BY ID;
UPDATE Traits SET ID =	( SELECT IDRemapper.id-1 FROM IDRemapper WHERE Traits.Type = IDRemapper.Type);

DROP TABLE IDRemapper;
CREATE TABLE IDRemapper ( id INTEGER PRIMARY KEY AUTOINCREMENT, Type TEXT );
INSERT INTO IDRemapper (Type) SELECT Type FROM ArtStyleTypes ORDER BY ID;
UPDATE ArtStyleTypes SET ID =	( SELECT IDRemapper.id-1 FROM IDRemapper WHERE ArtStyleTypes.Type = IDRemapper.Type);

DROP TABLE IDRemapper;
CREATE TABLE IDRemapper ( id INTEGER PRIMARY KEY AUTOINCREMENT, Type TEXT );
INSERT INTO IDRemapper (Type) SELECT Type FROM Climates ORDER BY ID;
UPDATE Climates SET ID =	( SELECT IDRemapper.id-1 FROM IDRemapper WHERE Climates.Type = IDRemapper.Type);

DROP TABLE IDRemapper;
CREATE TABLE IDRemapper ( id INTEGER PRIMARY KEY AUTOINCREMENT, Type TEXT );
INSERT INTO IDRemapper (Type) SELECT Type FROM Cursors ORDER BY ID;
UPDATE Cursors SET ID =	( SELECT IDRemapper.id-1 FROM IDRemapper WHERE Cursors.Type = IDRemapper.Type);

DROP TABLE IDRemapper;
CREATE TABLE IDRemapper ( id INTEGER PRIMARY KEY AUTOINCREMENT, Type TEXT );
INSERT INTO IDRemapper (Type) SELECT Type FROM EmphasizeInfos ORDER BY ID;
UPDATE EmphasizeInfos SET ID =	( SELECT IDRemapper.id-1 FROM IDRemapper WHERE EmphasizeInfos.Type = IDRemapper.Type);

DROP TABLE IDRemapper;
CREATE TABLE IDRemapper ( id INTEGER PRIMARY KEY AUTOINCREMENT, Type TEXT );
INSERT INTO IDRemapper (Type) SELECT Type FROM Eras ORDER BY ID;
UPDATE Eras SET ID =	( SELECT IDRemapper.id-1 FROM IDRemapper WHERE Eras.Type = IDRemapper.Type);

DROP TABLE IDRemapper;
CREATE TABLE IDRemapper ( id INTEGER PRIMARY KEY AUTOINCREMENT, Type TEXT );
INSERT INTO IDRemapper (Type) SELECT Type FROM Flavors ORDER BY ID;
UPDATE Flavors SET ID =	( SELECT IDRemapper.id-1 FROM IDRemapper WHERE Flavors.Type = IDRemapper.Type);

DROP TABLE IDRemapper;
CREATE TABLE IDRemapper ( id INTEGER PRIMARY KEY AUTOINCREMENT, Type TEXT );
INSERT INTO IDRemapper (Type) SELECT Type FROM GameOptions ORDER BY ID;
UPDATE GameOptions SET ID =	( SELECT IDRemapper.id-1 FROM IDRemapper WHERE GameOptions.Type = IDRemapper.Type);

DROP TABLE IDRemapper;
CREATE TABLE IDRemapper ( id INTEGER PRIMARY KEY AUTOINCREMENT, Type TEXT );
INSERT INTO IDRemapper (Type) SELECT Type FROM GameSpeeds ORDER BY ID;
UPDATE GameSpeeds SET ID =	( SELECT IDRemapper.id-1 FROM IDRemapper WHERE GameSpeeds.Type = IDRemapper.Type);

DROP TABLE IDRemapper;
CREATE TABLE IDRemapper ( id INTEGER PRIMARY KEY AUTOINCREMENT, Type TEXT );
INSERT INTO IDRemapper (Type) SELECT Type FROM GoodyHuts ORDER BY ID;
UPDATE GoodyHuts SET ID =	( SELECT IDRemapper.id-1 FROM IDRemapper WHERE GoodyHuts.Type = IDRemapper.Type);

DROP TABLE IDRemapper;
CREATE TABLE IDRemapper ( id INTEGER PRIMARY KEY AUTOINCREMENT, Type TEXT );
INSERT INTO IDRemapper (Type) SELECT Type FROM HandicapInfos ORDER BY ID;
UPDATE HandicapInfos SET ID =	( SELECT IDRemapper.id-1 FROM IDRemapper WHERE HandicapInfos.Type = IDRemapper.Type);

DROP TABLE IDRemapper;
CREATE TABLE IDRemapper ( id INTEGER PRIMARY KEY AUTOINCREMENT, Type TEXT );
INSERT INTO IDRemapper (Type) SELECT Type FROM HurryInfos ORDER BY ID;
UPDATE HurryInfos SET ID =	( SELECT IDRemapper.id-1 FROM IDRemapper WHERE HurryInfos.Type = IDRemapper.Type);

DROP TABLE IDRemapper;
CREATE TABLE IDRemapper ( id INTEGER PRIMARY KEY AUTOINCREMENT, Type TEXT );
INSERT INTO IDRemapper (Type) SELECT Type FROM MultiplayerOptions ORDER BY ID;
UPDATE MultiplayerOptions SET ID =	( SELECT IDRemapper.id-1 FROM IDRemapper WHERE MultiplayerOptions.Type = IDRemapper.Type);

DROP TABLE IDRemapper;
CREATE TABLE IDRemapper ( id INTEGER PRIMARY KEY AUTOINCREMENT, Type TEXT );
INSERT INTO IDRemapper (Type) SELECT Type FROM PlayerOptions ORDER BY ID;
UPDATE PlayerOptions SET ID =	( SELECT IDRemapper.id-1 FROM IDRemapper WHERE PlayerOptions.Type = IDRemapper.Type);

DROP TABLE IDRemapper;
CREATE TABLE IDRemapper ( id INTEGER PRIMARY KEY AUTOINCREMENT, Type TEXT );
INSERT INTO IDRemapper (Type) SELECT Type FROM Policies ORDER BY ID;
UPDATE Policies SET ID =	( SELECT IDRemapper.id-1 FROM IDRemapper WHERE Policies.Type = IDRemapper.Type);

DROP TABLE IDRemapper;
CREATE TABLE IDRemapper ( id INTEGER PRIMARY KEY AUTOINCREMENT, Type TEXT );
INSERT INTO IDRemapper (Type) SELECT Type FROM PolicyBranchTypes ORDER BY ID;
UPDATE PolicyBranchTypes SET ID =	( SELECT IDRemapper.id-1 FROM IDRemapper WHERE PolicyBranchTypes.Type = IDRemapper.Type);

DROP TABLE IDRemapper;
CREATE TABLE IDRemapper ( id INTEGER PRIMARY KEY AUTOINCREMENT, Type TEXT );
INSERT INTO IDRemapper (Type) SELECT Type FROM Processes ORDER BY ID;
UPDATE Processes SET ID =	( SELECT IDRemapper.id-1 FROM IDRemapper WHERE Processes.Type = IDRemapper.Type);

DROP TABLE IDRemapper;
CREATE TABLE IDRemapper ( id INTEGER PRIMARY KEY AUTOINCREMENT, Type TEXT );
INSERT INTO IDRemapper (Type) SELECT Type FROM Projects ORDER BY ID;
UPDATE Projects SET ID =	( SELECT IDRemapper.id-1 FROM IDRemapper WHERE Projects.Type = IDRemapper.Type);

DROP TABLE IDRemapper;
CREATE TABLE IDRemapper ( id INTEGER PRIMARY KEY AUTOINCREMENT, Type TEXT );
INSERT INTO IDRemapper (Type) SELECT Type FROM SeaLevels ORDER BY ID;
UPDATE SeaLevels SET ID =	( SELECT IDRemapper.id-1 FROM IDRemapper WHERE SeaLevels.Type = IDRemapper.Type);

DROP TABLE IDRemapper;
CREATE TABLE IDRemapper ( id INTEGER PRIMARY KEY AUTOINCREMENT, Type TEXT );
INSERT INTO IDRemapper (Type) SELECT Type FROM Specialists ORDER BY ID;
UPDATE Specialists SET ID =	( SELECT IDRemapper.id-1 FROM IDRemapper WHERE Specialists.Type = IDRemapper.Type);

DROP TABLE IDRemapper;
CREATE TABLE IDRemapper ( id INTEGER PRIMARY KEY AUTOINCREMENT, Type TEXT );
INSERT INTO IDRemapper (Type) SELECT Type FROM Trades ORDER BY ID;
UPDATE Trades SET ID =	( SELECT IDRemapper.id-1 FROM IDRemapper WHERE Trades.Type = IDRemapper.Type);

DROP TABLE IDRemapper;
CREATE TABLE IDRemapper ( id INTEGER PRIMARY KEY AUTOINCREMENT, Type TEXT );
INSERT INTO IDRemapper (Type) SELECT Type FROM TurnTimers ORDER BY ID;
UPDATE TurnTimers SET ID =	( SELECT IDRemapper.id-1 FROM IDRemapper WHERE TurnTimers.Type = IDRemapper.Type);

DROP TABLE IDRemapper;
CREATE TABLE IDRemapper ( id INTEGER PRIMARY KEY AUTOINCREMENT, Type TEXT );
INSERT INTO IDRemapper (Type) SELECT Type FROM Votes ORDER BY ID;
UPDATE Votes SET ID =	( SELECT IDRemapper.id-1 FROM IDRemapper WHERE Votes.Type = IDRemapper.Type);

DROP TABLE IDRemapper;
CREATE TABLE IDRemapper ( id INTEGER PRIMARY KEY AUTOINCREMENT, Type TEXT );
INSERT INTO IDRemapper (Type) SELECT Type FROM VoteSources ORDER BY ID;
UPDATE VoteSources SET ID =	( SELECT IDRemapper.id-1 FROM IDRemapper WHERE VoteSources.Type = IDRemapper.Type);

DROP TABLE IDRemapper;
CREATE TABLE IDRemapper ( id INTEGER PRIMARY KEY AUTOINCREMENT, Type TEXT );
INSERT INTO IDRemapper (Type) SELECT Type FROM Worlds ORDER BY ID;
UPDATE Worlds SET ID =	( SELECT IDRemapper.id-1 FROM IDRemapper WHERE Worlds.Type = IDRemapper.Type);

DROP TABLE IDRemapper;
CREATE TABLE IDRemapper ( id INTEGER PRIMARY KEY AUTOINCREMENT, Type TEXT );
INSERT INTO IDRemapper (Type) SELECT Type FROM Colors ORDER BY ID;
UPDATE Colors SET ID =	( SELECT IDRemapper.id-1 FROM IDRemapper WHERE Colors.Type = IDRemapper.Type);

DROP TABLE IDRemapper;
CREATE TABLE IDRemapper ( id INTEGER PRIMARY KEY AUTOINCREMENT, Type TEXT );
INSERT INTO IDRemapper (Type) SELECT Type FROM InterfaceModes ORDER BY ID;
UPDATE InterfaceModes SET ID =	( SELECT IDRemapper.id-1 FROM IDRemapper WHERE InterfaceModes.Type = IDRemapper.Type);

DROP TABLE IDRemapper;
CREATE TABLE IDRemapper ( id INTEGER PRIMARY KEY AUTOINCREMENT, Type TEXT );
INSERT INTO IDRemapper (Type) SELECT Type FROM Leaders ORDER BY ID;
UPDATE Leaders SET ID =	( SELECT IDRemapper.id-1 FROM IDRemapper WHERE Leaders.Type = IDRemapper.Type);

DROP TABLE IDRemapper;
CREATE TABLE IDRemapper ( id INTEGER PRIMARY KEY AUTOINCREMENT, Type TEXT );
INSERT INTO IDRemapper (Type) SELECT Type FROM PlayerColors ORDER BY ID;
UPDATE PlayerColors SET ID =	( SELECT IDRemapper.id-1 FROM IDRemapper WHERE PlayerColors.Type = IDRemapper.Type);

DROP TABLE IDRemapper;
CREATE TABLE IDRemapper ( id INTEGER PRIMARY KEY AUTOINCREMENT, Type TEXT );
INSERT INTO IDRemapper (Type) SELECT Type FROM Routes ORDER BY ID;
UPDATE Routes SET ID =	( SELECT IDRemapper.id-1 FROM IDRemapper WHERE Routes.Type = IDRemapper.Type);

DROP TABLE IDRemapper;
CREATE TABLE IDRemapper ( id INTEGER PRIMARY KEY AUTOINCREMENT, Type TEXT );
INSERT INTO IDRemapper (Type) SELECT Type FROM Features ORDER BY ID;
UPDATE Features SET ID =	( SELECT IDRemapper.id-1 FROM IDRemapper WHERE Features.Type = IDRemapper.Type);

DROP TABLE IDRemapper;
CREATE TABLE IDRemapper ( id INTEGER PRIMARY KEY AUTOINCREMENT, Type TEXT );
INSERT INTO IDRemapper (Type) SELECT Type FROM FakeFeatures ORDER BY ID;
UPDATE FakeFeatures SET ID =	( SELECT IDRemapper.id-1 FROM IDRemapper WHERE FakeFeatures.Type = IDRemapper.Type);

DROP TABLE IDRemapper;
CREATE TABLE IDRemapper ( id INTEGER PRIMARY KEY AUTOINCREMENT, Type TEXT );
INSERT INTO IDRemapper (Type) SELECT Type FROM Improvements ORDER BY ID;
UPDATE Improvements SET ID =	( SELECT IDRemapper.id-1 FROM IDRemapper WHERE Improvements.Type = IDRemapper.Type);

DROP TABLE IDRemapper;
CREATE TABLE IDRemapper ( id INTEGER PRIMARY KEY AUTOINCREMENT, Type TEXT );
INSERT INTO IDRemapper (Type) SELECT Type FROM ResourceClasses ORDER BY ID;
UPDATE ResourceClasses SET ID =	( SELECT IDRemapper.id-1 FROM IDRemapper WHERE ResourceClasses.Type = IDRemapper.Type);

DROP TABLE IDRemapper;
CREATE TABLE IDRemapper ( id INTEGER PRIMARY KEY AUTOINCREMENT, Type TEXT );
INSERT INTO IDRemapper (Type) SELECT Type FROM Resources ORDER BY ID;
UPDATE Resources SET ID =	( SELECT IDRemapper.id-1 FROM IDRemapper WHERE Resources.Type = IDRemapper.Type);

DROP TABLE IDRemapper;
CREATE TABLE IDRemapper ( id INTEGER PRIMARY KEY AUTOINCREMENT, Type TEXT );
INSERT INTO IDRemapper (Type) SELECT Type FROM Terrains ORDER BY ID;
UPDATE Terrains SET ID =	( SELECT IDRemapper.id-1 FROM IDRemapper WHERE Terrains.Type = IDRemapper.Type);

DROP TABLE IDRemapper;
CREATE TABLE IDRemapper ( id INTEGER PRIMARY KEY AUTOINCREMENT, Type TEXT );
INSERT INTO IDRemapper (Type) SELECT Type FROM Yields ORDER BY ID;
UPDATE Yields SET ID =	( SELECT IDRemapper.id-1 FROM IDRemapper WHERE Yields.Type = IDRemapper.Type);

DROP TABLE IDRemapper;
CREATE TABLE IDRemapper ( id INTEGER PRIMARY KEY AUTOINCREMENT, Type TEXT );
INSERT INTO IDRemapper (Type) SELECT Type FROM AnimationCategories ORDER BY ID;
UPDATE AnimationCategories SET ID =	( SELECT IDRemapper.id-1 FROM IDRemapper WHERE AnimationCategories.Type = IDRemapper.Type);

DROP TABLE IDRemapper;
CREATE TABLE IDRemapper ( id INTEGER PRIMARY KEY AUTOINCREMENT, Type TEXT );
INSERT INTO IDRemapper (Type) SELECT Type FROM AnimationPaths ORDER BY ID;
UPDATE AnimationPaths SET ID =	( SELECT IDRemapper.id-1 FROM IDRemapper WHERE AnimationPaths.Type = IDRemapper.Type);

DROP TABLE IDRemapper;
CREATE TABLE IDRemapper ( id INTEGER PRIMARY KEY AUTOINCREMENT, Type TEXT );
INSERT INTO IDRemapper (Type) SELECT Type FROM Automates ORDER BY ID;
UPDATE Automates SET ID =	( SELECT IDRemapper.id-1 FROM IDRemapper WHERE Automates.Type = IDRemapper.Type);

DROP TABLE IDRemapper;
CREATE TABLE IDRemapper ( id INTEGER PRIMARY KEY AUTOINCREMENT, Type TEXT );
INSERT INTO IDRemapper (Type) SELECT Type FROM Builds ORDER BY ID;
UPDATE Builds SET ID =	( SELECT IDRemapper.id-1 FROM IDRemapper WHERE Builds.Type = IDRemapper.Type);

DROP TABLE IDRemapper;
CREATE TABLE IDRemapper ( id INTEGER PRIMARY KEY AUTOINCREMENT, Type TEXT );
INSERT INTO IDRemapper (Type) SELECT Type FROM Commands ORDER BY ID;
UPDATE Commands SET ID =	( SELECT IDRemapper.id-1 FROM IDRemapper WHERE Commands.Type = IDRemapper.Type);

DROP TABLE IDRemapper;
CREATE TABLE IDRemapper ( id INTEGER PRIMARY KEY AUTOINCREMENT, Type TEXT );
INSERT INTO IDRemapper (Type) SELECT Type FROM Controls ORDER BY ID;
UPDATE Controls SET ID =	( SELECT IDRemapper.id-1 FROM IDRemapper WHERE Controls.Type = IDRemapper.Type);

DROP TABLE IDRemapper;
CREATE TABLE IDRemapper ( id INTEGER PRIMARY KEY AUTOINCREMENT, Type TEXT );
INSERT INTO IDRemapper (Type) SELECT Type FROM EntityEvents ORDER BY ID;
UPDATE EntityEvents SET ID =	( SELECT IDRemapper.id-1 FROM IDRemapper WHERE EntityEvents.Type = IDRemapper.Type);

DROP TABLE IDRemapper;
CREATE TABLE IDRemapper ( id INTEGER PRIMARY KEY AUTOINCREMENT, Type TEXT );
INSERT INTO IDRemapper (Type) SELECT Type FROM Missions ORDER BY ID;
UPDATE Missions SET ID =	( SELECT IDRemapper.id-1 FROM IDRemapper WHERE Missions.Type = IDRemapper.Type);

DROP TABLE IDRemapper;
CREATE TABLE IDRemapper ( id INTEGER PRIMARY KEY AUTOINCREMENT, Type TEXT );
INSERT INTO IDRemapper (Type) SELECT Type FROM MultiUnitFormations ORDER BY ID;
UPDATE MultiUnitFormations SET ID =	( SELECT IDRemapper.id-1 FROM IDRemapper WHERE MultiUnitFormations.Type = IDRemapper.Type);

DROP TABLE IDRemapper;
CREATE TABLE IDRemapper ( id INTEGER PRIMARY KEY AUTOINCREMENT, Type TEXT );
INSERT INTO IDRemapper (Type) SELECT Type FROM MultiUnitPositions ORDER BY ID;
UPDATE MultiUnitPositions SET ID =	( SELECT IDRemapper.id-1 FROM IDRemapper WHERE MultiUnitPositions.Type = IDRemapper.Type);

DROP TABLE IDRemapper;
CREATE TABLE IDRemapper ( id INTEGER PRIMARY KEY AUTOINCREMENT, Type TEXT );
INSERT INTO IDRemapper (Type) SELECT Type FROM SpecialUnits ORDER BY ID;
UPDATE SpecialUnits SET ID =	( SELECT IDRemapper.id-1 FROM IDRemapper WHERE SpecialUnits.Type = IDRemapper.Type);

DROP TABLE IDRemapper;
CREATE TABLE IDRemapper ( id INTEGER PRIMARY KEY AUTOINCREMENT, Type TEXT );
INSERT INTO IDRemapper (Type) SELECT Type FROM UnitClasses ORDER BY ID;
UPDATE UnitClasses SET ID =	( SELECT IDRemapper.id-1 FROM IDRemapper WHERE UnitClasses.Type = IDRemapper.Type);

DROP TABLE IDRemapper;
CREATE TABLE IDRemapper ( id INTEGER PRIMARY KEY AUTOINCREMENT, Type TEXT );
INSERT INTO IDRemapper (Type) SELECT Type FROM UnitPromotions ORDER BY ID;
UPDATE UnitPromotions SET ID =	( SELECT IDRemapper.id-1 FROM IDRemapper WHERE UnitPromotions.Type = IDRemapper.Type);

DROP TABLE IDRemapper;
CREATE TABLE IDRemapper ( id INTEGER PRIMARY KEY AUTOINCREMENT, Type TEXT );
INSERT INTO IDRemapper (Type) SELECT Type FROM Units ORDER BY ID;
UPDATE Units SET ID =	( SELECT IDRemapper.id-1 FROM IDRemapper WHERE Units.Type = IDRemapper.Type);

DROP TABLE IDRemapper;
CREATE TABLE IDRemapper ( id INTEGER PRIMARY KEY AUTOINCREMENT, Type TEXT );
INSERT INTO IDRemapper (Type) SELECT Type FROM Religions ORDER BY ID;
UPDATE Religions SET ID =	( SELECT IDRemapper.id-1 FROM IDRemapper WHERE Religions.Type = IDRemapper.Type);

DROP TABLE IDRemapper;
CREATE TABLE IDRemapper ( id INTEGER PRIMARY KEY AUTOINCREMENT, Type TEXT );
INSERT INTO IDRemapper (Type) SELECT Type FROM Beliefs ORDER BY ID;
UPDATE Beliefs SET ID =	( SELECT IDRemapper.id-1 FROM IDRemapper WHERE Beliefs.Type = IDRemapper.Type);


DROP TABLE IDRemapper;