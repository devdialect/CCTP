-- MUST be in a file on their own so they can fail if the DLL is not present

-- Permit hovering units to only heal when over land
UPDATE CustomModOptions SET Value=1 WHERE Name='UNITS_HOVERING_LAND_ONLY_HEAL';  

-- Enable hovering units to range attack over coastal tiles - range 1, ranged str = 1/2 of melee str
UPDATE CustomModOptions SET Value=1 WHERE Name='UNITS_HOVERING_COASTAL_ATTACKS'; 
INSERT OR REPLACE INTO CustomModOptions(Name, Value) VALUES('UNITS_HOVERING_COASTAL_ATTACKS_RANGE', 1);
INSERT OR REPLACE INTO CustomModOptions(Name, Value) VALUES('UNITS_HOVERING_COASTAL_ATTACKS_MULTIPLIER', 1);  
INSERT OR REPLACE INTO CustomModOptions(Name, Value) VALUES('UNITS_HOVERING_COASTAL_ATTACKS_DIVISOR', 2);  
