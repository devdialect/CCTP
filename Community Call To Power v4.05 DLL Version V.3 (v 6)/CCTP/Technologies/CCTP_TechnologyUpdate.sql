

-- Change free tech at game start from Agriculture to Language
ALTER TABLE Technologies ADD COLUMN 'UnitBaseHealModifier' integer;
ALTER TABLE Technologies ADD COLUMN 'UnitFortificationModifier' integer;
UPDATE Civilization_FreeTechs
SET TechType='TECH_SCENTIENCE'
WHERE TechType='TECH_AGRICULTURE';


-- Huns update
UPDATE Civilization_FreeTechs
SET TechType='TECH_SCENTIENCE'
WHERE TechType='TECH_ANIMAL_HUSBANDRY';


-- Add missing vanilla function to the table

UPDATE Technologies
SET ExtraVotesPerDiplomat= 1
WHERE Type='TECH_GLOBALIZATION';

-- Add new function to the table

UPDATE Technologies
SET UnitBaseHealModifier= 50
WHERE Type='TECH_BATTLEFIELD_MEDICINE';

-- Add new function to the table

UPDATE Technologies
SET UnitFortificationModifier= 25
WHERE Type='TECH_FORTIFICATION';

