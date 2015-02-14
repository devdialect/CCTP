-- Make hovering units (helicopters et al) embark at the coastal/ocean boundary if the promotion is available
INSERT INTO Unit_FreePromotions(UnitType, PromotionType) SELECT 'UNIT_HELICOPTER_GUNSHIP', Type FROM UnitPromotions WHERE Type='PROMOTION_DEEPWATER_EMBARKATION';
INSERT INTO Unit_FreePromotions(UnitType, PromotionType) SELECT 'UNIT_AIRSHIP', Type FROM UnitPromotions WHERE Type='PROMOTION_DEEPWATER_EMBARKATION';
