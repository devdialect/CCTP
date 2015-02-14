INSERT INTO Unit_FreePromotions(UnitType, PromotionType)
  SELECT Type, 'PROMOTION_INDIRECT_FIRE'
  FROM Units
  WHERE CombatClass = 'UNITCOMBAT_SIEGE'
  AND NOT EXISTS (
    SELECT 1
    FROM Unit_FreePromotions f
    WHERE f.UnitType = Units.Type
    AND f.PromotionType = 'PROMOTION_INDIRECT_FIRE'
  );