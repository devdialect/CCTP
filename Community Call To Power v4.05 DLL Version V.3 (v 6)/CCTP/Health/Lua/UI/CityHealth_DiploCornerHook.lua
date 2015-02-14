function OnDiploCornerHook()
  print("OnDiploCornerHook(CityHealthDisplay)")
  LuaEvents.CityProductionDisplay() 
end
LuaEvents.DiploCornerAddin({text="TXT_KEY_CH_DIPLO_CORNER_HOOK", tip="TXT_KEY_CH_DIPLO_CORNER_HOOK_TT", group="economic", call=OnDiploCornerHook}) 
