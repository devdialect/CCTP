ALTER TABLE Buildings ADD COLUMN CulturePerGP integer DEFAULT 0;

UPDATE Buildings SET CulturePerGP=1 WHERE Type='BUILDING_PAGODA';



