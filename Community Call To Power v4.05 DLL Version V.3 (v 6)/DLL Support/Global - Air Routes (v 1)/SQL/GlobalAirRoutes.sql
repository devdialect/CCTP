-- Move the extra aircraft capabilities of the Airport ...
UPDATE Buildings SET AirModifier=0 WHERE Type='BUILDING_AIRPORT';
-- ... to the Military Base
UPDATE Buildings SET AirModifier=4 WHERE Type='BUILDING_MILITARY_BASE';

INSERT OR REPLACE INTO CustomModOptions(Name, Value) VALUES('EVENTS_CITY_CONNECTIONS', 1);
