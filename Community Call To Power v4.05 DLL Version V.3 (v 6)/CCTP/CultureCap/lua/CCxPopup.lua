if(Game.GetCustomOption("GAMEOPTION_CULTURALCAPITALS") == 0) then
	return;
end
-- CC
-- Author: Moaf
--------------------------------------------------------------
include("CCWhysUtils");
include("MoafsUtils");
include("CCXmlData");
include("IconSupport");
include("CCStorage");
include("FLuaVector");

local m_PopupInfo = nil;
local g_wisdom = nil;
local g_mode = "empty";
local g_selectedTheme = nil;
local g_evals = nil;
local g_showAll = false;
local g_showObsolete = false;

local g_duration = GetSpeedScale("Duration");

local g_goodColor       = GameInfo.Colors.COLOR_BLUE;
local g_goodColorVector = Vector4(g_goodColor.Red, g_goodColor.Green, g_goodColor.Blue, 0.0);
local g_badColor       = GameInfo.Colors.COLOR_RED;
local g_badColorVector = Vector4(g_badColor.Red, g_badColor.Green, g_badColor.Blue, 0.4);

local g_electedPlayerId = nil;
local g_electedCityId = nil;

-- ======================================================
-- CCPopup_Init()
-- ======================================================
function CCPopup_Init()
	InitXmlData();

	g_wisdom = doload("cc_wisdom") or nil;
	local container = ContextPtr:LookUpControl("../CCPopup/");
	container:ChangeParent(ContextPtr:LookUpControl("/InGame/WorldView/"));
end

-- ======================================================
-- CCPopup_OnShowCCPopup
-- ======================================================
function CCPopup_OnShowCCPopup(popupInfo) --, popupInfo)
  m_PopupInfo = popupInfo;
	if(popupInfo.Type ~= GameInfo.CCPopupTypes.MAIN.ID) then
		return;
	end

	g_electedPlayerId, g_electedCityId = LoadWinner();

	CCPopup_BuildInterface();
	CCPopup_ShowPopup();
end
Events.SerialEventGameMessagePopup.Add(CCPopup_OnShowCCPopup);

-- ======================================================
-- BuildInterface
-- ======================================================
-- Main function for building the popup interface
function CCPopup_BuildInterface()
	local titleLabel = ContextPtr:LookUpControl("../CCPopup/TitleLabel");
	local ccQuote = ContextPtr:LookUpControl("../CCPopup/CCQuote");
	local ccSource = ContextPtr:LookUpControl("../CCPopup/CCSource");
	local ccActiveButton = ContextPtr:LookUpControl("../CCPopup/CCActiveButton");
	local ccActiveLabel = ContextPtr:LookUpControl("../CCPopup/CCActiveLabel");
	local ccActivePortrait1 = ContextPtr:LookUpControl("../CCPopup/CCActivePortrait1");
	local ccActivePortrait2 = ContextPtr:LookUpControl("../CCPopup/CCActivePortrait2");
	local ccChooseThemeButton = ContextPtr:LookUpControl("../CCPopup/CCChooseThemeButton");

	local bPlayerHasChosenTheme = doload("cc_bPlayerHasChosenTheme") or false;
	local bPlayerHasWon = PlayerHasWon(Game.GetActivePlayer());

	local player, city = GetPlayerCity(g_electedPlayerId, g_electedCityId);

	if(bPlayerHasWon) then
		local year = doload("cc_electionYear") or Game.GetGameTurnYear();
		local date;
		if(year < 0) then
			date = Locale.ConvertTextKey("TXT_KEY_TIME_BC", math.abs(year));
		else
			date = Locale.ConvertTextKey("TXT_KEY_TIME_AD", math.abs(year));
		end
		local cityStr = "[ICON_CC] "..GetCityName(city).." [ICON_CC]";
		titleLabel:LocalizeAndSetText("TXT_KEY_CC_TITLE_PLAYER", date, cityStr);
	else
		titleLabel:LocalizeAndSetText("TXT_KEY_CC_TITLE");
	end

  if(g_wisdom == nil) then
		CCPopup_OnSelectNewWisdom();
	end
  ccQuote:SetText(g_wisdom.Quote);
  ccSource:SetText("- "..g_wisdom.Source);


	ccChooseThemeButton:SetHide(true);
	if ((not bPlayerHasWon) or bPlayerHasChosenTheme) then
		--ccChooseThemeButton:SetHide(true);

		ccActiveButton:SetHide(not bPlayerHasChosenTheme);
		ccQuote:SetHide(bPlayerHasChosenTheme);
		ccSource:SetHide(bPlayerHasChosenTheme);

		if(bPlayerHasChosenTheme) then
			local theme = doload("cc_chosenTheme");
			ccActiveButton:SetVoids(nil, nil);
			ccActiveButton:RegisterCallback(Mouse.eLClick, CCPopup_ShowActiveInfoButtonHandler);
			ccActiveLabel:LocalizeAndSetText("TXT_KEY_CC_ACTIVE_THEME", theme.ccType.Title);
			IconHookup(theme.ccType.PortraitIndex, 64, theme.ccType.IconAtlas, ccActivePortrait1);
			IconHookup(theme.ccType.PortraitIndex, 64, theme.ccType.IconAtlas, ccActivePortrait2);
			CCPopup_ShowActiveInfoButtonHandler(nil);
		end
	else
		ccActiveButton:SetHide(true);
		CCPopup_SwitchToMode("empty");
	end
  
  CCPopup_FillTypesStack();
  
  --if(not g_showAll) then
	--	local showObsoleteOption = ContextPtr:LookUpControl("../CCPopup/ShowObsoleteOption");
	--  showObsoleteOption:SetHide(true);
  --end
end

function CCPopup_SortByListing(a, b)
	local aList, bList = a.ccType.DisplayListing, b.ccType.DisplayListing;
	if(aList ~= bList) then
		return aList < bList;
	else
		return a.ccType.ID < b.ccType.ID;
	end
end

-- ======================================================
-- FillTypesStack
-- ======================================================
-- Fills the left hand side with all themes
function CCPopup_FillTypesStack()
	local bPlayerHasWon = PlayerHasWon(Game.GetActivePlayer());
  local allowedTypes, notAllowedTypes = GetAllowedCCTypes(g_electedPlayerId, g_electedCityId, not bPlayerHasWon);
	table.sort(allowedTypes, CCPopup_SortByListing);
	table.sort(notAllowedTypes, CCPopup_SortByListing);

	local ccPopup = ContextPtr:LookUpControl("../CCPopup/");
	local cityButton = ContextPtr:LookUpControl("../CCPopup/CityButton");
	local ccTypesStack = ContextPtr:LookUpControl("../CCPopup/CCTypesStack");
	local listScrollPanel = ContextPtr:LookUpControl("../CCPopup/ListScrollPanel");
	local showAllOption = ContextPtr:LookUpControl("../CCPopup/ShowAllOption");
	local showObsoleteOption = ContextPtr:LookUpControl("../CCPopup/ShowObsoleteOption");

	ccTypesStack:DestroyAllChildren();
	
	local bPlayerHasChosenTheme = doload("cc_bPlayerHasChosenTheme") or false;

	-- build allowed types
	for key, value in ipairs(allowedTypes) do
		local value = value.ccType;
    local controlTable = {};
    ccPopup:BuildInstanceForControl("CCTypeButtonInstance", controlTable, ccTypesStack );
    
    controlTable.CCTypeButton:SetVoids(value.ID, 1);
    controlTable.CCTypeButton:RegisterCallback(Mouse.eLClick, CCPopup_ShowBasicInfoButtonHandler);
		local toolTip;
		if(not bPlayerHasChosenTheme) then
			controlTable.CCTypeButton:LocalizeAndSetToolTip("TXT_KEY_CC_POPUP_BUTTON_TOOLTIP");
		else
			controlTable.CCTypeButton:LocalizeAndSetToolTip("TXT_KEY_CC_POPUP_BUTTON_ALREADY_CHOSEN_TOOLTIP");
		end
		
    
    controlTable.CCTypeLabel:LocalizeAndSetText(value.Title);
    IconHookup(value.PortraitIndex, 45, value.IconAtlas, controlTable.CCTypeIcon);
  end
  
	-- hide/unhide options
	showAllOption:SetHide(not bPlayerHasWon);
	showObsoleteOption:SetHide(not bPlayerHasWon or not g_showAll);
	cityButton:SetHide(not bPlayerHasWon);

  if(g_showAll) or (not bPlayerHasWon) then
    -- build not allowed types
    for key, value in ipairs(notAllowedTypes) do
			local value = value.ccType;
      local bIsObsolete = IsObsolete(g_electedPlayerId, value);
      
      if(not bIsObsolete) or (g_showObsolete and bIsObsolete) or (not bPlayerHasWon) then
        local controlTable = {};
        ccPopup:BuildInstanceForControl("CCInactiveTypeButtonInstance", controlTable, ccTypesStack );
        
        controlTable.CCInactiveTypeButton:SetVoids(value.ID, 0);
        controlTable.CCInactiveTypeButton:RegisterCallback(Mouse.eLClick, CCPopup_ShowBasicInfoButtonHandler);
        if(bIsObsolete) then
          controlTable.CCInactiveTypeButton:LocalizeAndSetToolTip("TXT_KEY_CC_POPUP_OBSOLETEBUTTON_TOOLTIP");
          controlTable.CCInactiveTypeLabel:SetColorByName("Red_Black"); 
        else
					if(not bPlayerHasWon) then
						controlTable.CCInactiveTypeButton:LocalizeAndSetToolTip("TXT_KEY_CC_POPUP_MUSTWIN_TOOLTIP");
					else
						controlTable.CCInactiveTypeButton:LocalizeAndSetToolTip("TXT_KEY_CC_POPUP_INACTIVEBUTTON_TOOLTIP");
					end
        end  
        controlTable.CCInactiveTypeLabel:LocalizeAndSetText(value.Title);
        IconHookup(value.PortraitIndex, 45, value.IconAtlas, controlTable.CCInactiveTypeIcon);
      end
    end
  end
  
  ccTypesStack:CalculateSize();
  listScrollPanel:CalculateInternalSize();
  ccTypesStack:ReprocessAnchoring();
end

        
-- ======================================================
-- ShowBasicInfoButtonHandler
-- ======================================================
-- determines whether or not to show the active theme in basic mode
function CCPopup_ShowBasicInfoButtonHandler(ccTypeId, iIsValid)
	local ccChooseThemeButton = ContextPtr:LookUpControl("../CCPopup/CCChooseThemeButton");
	local bIsValid = (iIsValid == 1);
	CCPopup_SwitchToMode("basic");

	local theme = GetThemeById(ccTypeId);
	local evals = GetEvaluatedTheme(GetPlayer():GetID(), theme);
	g_evals = evals;

	local bPlayerHasChosenTheme = doload("cc_bPlayerHasChosenTheme") or false;
	local bPlayerHasWon = PlayerHasWon(Game.GetActivePlayer());
	ccChooseThemeButton:SetHide(not bIsValid or not bPlayerHasWon or bPlayerHasChosenTheme);

	CCPopup_FillBasicInfo(theme, evals);
end

function CCPopup_ShowActiveInfoButtonHandler()
	local ccChooseThemeButton = ContextPtr:LookUpControl("../CCPopup/CCChooseThemeButton");
	local theme = doload("cc_chosenTheme");
	local evals = doload("cc_chosenThemeEvals");
	ccChooseThemeButton:SetHide(true);
	CCPopup_FillBasicInfo(theme, evals, 1);
end

-- ======================================================
-- FillBasicInfo
-- ======================================================
-- fills the right hand side with basic information about the theme
function CCPopup_FillBasicInfo(ccTypeData, evals, itypeMode)
	local ccPopup = ContextPtr:LookUpControl("../CCPopup/");
	local themeBasic = ContextPtr:LookUpControl("../CCPopup/ThemeBasic");
	local ccEffectsStack = ContextPtr:LookUpControl("../CCPopup/CCEffectsStack");
	local effectScrollPanel = ContextPtr:LookUpControl("../CCPopup/EffectScrollPanel");
	local ccEffectsUponAdoptionLabel = ContextPtr:LookUpControl("../CCPopup/CCEffectsUponAdoptionLabel");
	local ccActiveEffectsLabel = ContextPtr:LookUpControl("../CCPopup/CCActiveEffectsLabel");

	local typeMode = iTypedMode or 0;
	local ccType = ccTypeData.ccType;
  local ccBonuses = ccTypeData.ccBonuses;
	
	ccEffectsUponAdoptionLabel:SetHide(typeMode ~= 0);
	ccActiveEffectsLabel:SetHide(typeMode ~= 1);
  themeBasic:LocalizeAndSetText(ccType.Title);
  IconHookup(ccType.PortraitIndex, 64, ccType.IconAtlas, ContextPtr:LookUpControl("../CCPopup/BasicPortraitLeft"));
  IconHookup(ccType.PortraitIndex, 64, ccType.IconAtlas, ContextPtr:LookUpControl("../CCPopup/BasicPortraitRight"));
  
  -- fill effectstack
  ccEffectsStack:DestroyAllChildren();
	ResetEffectDict();

  for key, value in pairs(ccBonuses) do   
    local instance = {};
    local eval = evals[value.Type];

		ccPopup:BuildInstanceForControl("CCEffectInstance", instance, ccEffectsStack);
    
		if(value.IsMalus) then
			instance.CCEffectBox:SetColor(g_badColorVector);
    else
      instance.CCEffectBox:SetColor(g_goodColorVector);
    end
    
		if(value.DisplayUseNegative) then
			eval = -eval;
		end

		instance.CCEffectLabel:LocalizeAndSetText(value.Description, eval);
    instance.CCTimeIcon:SetHide(not value.IsTemporary);

		-- since icountdown is nil when no cc exists, set it to duration
		local iCountdown = doload("cc_iCountdown") or g_duration;
    instance.CCTimeIcon:SetToolTipString(Locale.ConvertTextKey("TXT_KEY_CC_TEMPORARY_EFFECT", iCountdown));

		local desc, help = CCPopup_GetEffectDescription(value);
		if(desc ~= nil) then
			local toolTip = "";
			if(help ~= nil) then
				toolTip = Locale.ConvertTextKey(help).."[NEWLINE][NEWLINE]";
			end
			toolTip = toolTip..Locale.ConvertTextKey("TXT_KEY_CC_EFFECT_CIVI");
			instance.CCEffectButton:SetToolTipString(toolTip);
			instance.CCEffectButton:SetVoids(SetEffectDict(desc), nil);
			instance.CCEffectButton:RegisterCallback(Mouse.eLClick, CCPopup_ShowCivilopediaForEffect);
		end
  end
  
  ccEffectsStack:CalculateSize();
  effectScrollPanel:CalculateInternalSize();
  ccEffectsStack:ReprocessAnchoring();
  
	CCPopup_FillRequirements(ccType);

  g_selectedTheme = ccTypeData;
end

function BuildStringForTheme(ccType)
	local retVal = "";
	if(ccType.Description ~= nil) then
	 retVal = retVal..Locale.ConvertTextKey(ccType.Description);
	end

	return retVal;
end

-- ======================================================
-- Dictionaries for Civilopedia
-- ======================================================
-- containing descriptions of specific items to search for in the civopedia
local g_dict = {};
local g_dictIdx = 0;

function ResetDict()
	g_dict = {};
	g_dictIdx = 0;
end

function SetDict(desc)
	g_dictIdx = g_dictIdx + 1;
	g_dict[g_dictIdx] = desc;
	return g_dictIdx;
end

function CCPopup_ShowCivilopedia(id)
  Events.SearchForPediaEntry(g_dict[id]);
  CCPopup_ClosePopup();
end

local g_effectDict = {};
local g_effectDictIdx = 0;

function ResetEffectDict()
	g_effectDict = {};
	g_effectDictIdx = 0;
end

function SetEffectDict(desc)
	g_effectDictIdx = g_effectDictIdx + 1;
	g_effectDict[g_effectDictIdx] = desc;
	return g_effectDictIdx;
end

function CCPopup_ShowCivilopediaForEffect(id)
  Events.SearchForPediaEntry(g_effectDict[id]);
  CCPopup_ClosePopup();
end

-- ======================================================
-- FillRequirements
-- ======================================================
-- Main method to fill the requirement stacks on the page
function CCPopup_FillRequirements(ccType)
	local playerId, cityId = LoadWinner();
  local player, city = GetPlayerCity(playerId, cityId);
	local ccMetStack = ContextPtr:LookUpControl("../CCPopup/CCMetStack");
	local ccUnmetStack = ContextPtr:LookUpControl("../CCPopup/CCUnmetStack");
	local ccMetScrollPanel = ContextPtr:LookUpControl("../CCPopup/CCMetScrollPanel");
	local ccUnmetScrollPanel = ContextPtr:LookUpControl("../CCPopup/CCUnmetScrollPanel");

  ResetDict();

  ccMetStack:DestroyAllChildren();
  ccUnmetStack:DestroyAllChildren();
  
  local instance = nil;
  
  -- Obsolete Tech Check
  if(ccType.ObsoleteTech ~= nil) then
    local tech = GameInfo.Technologies[ccType.ObsoleteTech];
		-- since other mods can delete techs, check if it exists
		if(tech ~= nil) then
			instance = CCPopup_GetReqInstance(IsObsoleteTech(player, ccType));
			IconHookup(tech.PortraitIndex, 64, tech.IconAtlas, instance.CCReqPortrait);
			local techDesc = Locale.ConvertTextKey(tech.Description);
			instance.CCReqButton:LocalizeAndSetToolTip("TXT_KEY_CC_OBSOLETE_TECH", techDesc);
			SetDict(techDesc);
			instance.CCReqButton:SetVoids(idx, nil);
			instance.CCReqButton:RegisterCallback(Mouse.eLClick, CCPopup_ShowCivilopedia);	
			instance.CCReqLabel:SetColorByName("Red_Black");
			instance.CCReqLabel:SetString("X");
			instance.CCReqLabel:SetHide(false);
			instance.CCEffectTypeLabel:SetHide(false);
			instance.CCEffectTypeLabel:SetString("[ICON_RESEARCH]");
		end
	end
  
	-- Obsolete Era Check
  if(ccType.ObsoleteEra ~= nil) then
    local era = GameInfo.Eras[ccType.ObsoleteEra];
		-- since other mods can delete techs, check if it exists
		if(era ~= nil) then
			instance = CCPopup_GetReqInstance(IsObsoleteEra(player, ccType));
			instance.CCReqLabel:SetColorByName("Red_Black");
			instance.CCReqLabel:SetString("X");
			instance.CCReqLabel:SetHide(false);
			IconHookup(era.ID, 64, "DIFFICULTY_ATLAS", instance.CCReqPortrait);
			local eraDesc = Locale.ConvertTextKey(era.Description);
			instance.CCReqButton:LocalizeAndSetToolTip("TXT_KEY_CC_OBSOLETE_ERA", eraDesc);
		end
	end

  -- SpecialistBuilding Check
  if(ccType.SpecialistBuildingRequired ~= nil) then
    local specialist = GameInfo.Specialists[ccType.SpecialistBuildingRequired];
		if(specialist ~= nil) then
			instance = CCPopup_GetReqInstance(FailsSpecialistBuildingCheck(city, ccType));
			IconHookup(specialist.PortraitIndex, 64, specialist.IconAtlas, instance.CCReqPortrait);   
			local specialistDesc = Locale.ConvertTextKey(specialist.Description); 
			instance.CCReqButton:LocalizeAndSetToolTip("TXT_KEY_CC_SPECIALISTBUILDING_REQUIRED", specialistDesc);
			instance.CCReqButton:SetVoids(SetDict(specialistDesc), nil);
			instance.CCReqButton:RegisterCallback(Mouse.eLClick, CCPopup_ShowCivilopedia);
		end
  end
  
  
  -- Wonders Check
  if(ccType.NoOfWondersRequired > 0) then
    instance = CCPopup_GetReqInstance(FailsWonderCheck(city, ccType));
    -- Pyramid icon
    IconHookup(0, 64, "BW_ATLAS_2", instance.CCReqPortrait);
    instance.CCReqButton:LocalizeAndSetToolTip("TXT_KEY_CC_WONDERS_REQUIRED", ccType.NoOfWondersRequired);
    instance.CCReqLabel:SetHide(false);
    instance.CCReqLabel:SetString(tostring(ccType.NoOfWondersRequired));
  end

	-- Cities Check
  if(ccType.NoOfCitiesRequired ~= 0) then
    instance = CCPopup_GetReqInstance(FailsCityCheck(player, ccType));
    local numCities = GetNoOfCitiesRequired(ccType);
		if(numCities < 0) then
			instance.CCReqLabel:SetColorByName("Red_Black");
			instance.CCReqButton:LocalizeAndSetToolTip("TXT_KEY_CC_MAXCITIES_REQUIRED", math.abs(numCities));
		else
			instance.CCReqButton:LocalizeAndSetToolTip("TXT_KEY_CC_MINCITIES_REQUIRED", numCities);
		end
		-- courthouse
    IconHookup(63, 64, "BW_ATLAS_1", instance.CCReqPortrait);
    instance.CCReqLabel:SetHide(false);
    instance.CCReqLabel:SetString(tostring(math.abs(numCities)));
		instance.CCEffectScopeLabel:SetHide(false);
  end
  
  -- CitySize Check
  if(ccType.CitySizeRequired ~= 0) then
    local iconIndex = 0;
    instance = CCPopup_GetReqInstance(FailsCitySizeCheck(city, ccType));
    if(ccType.CitySizeRequired < 0) then
      iconIndex = 5;
			instance.CCReqLabel:SetColorByName("Red_Black");
      instance.CCReqButton:LocalizeAndSetToolTip("TXT_KEY_CC_MAXSIZE_REQUIRED", math.abs(ccType.CitySizeRequired));
    else
      iconIndex = 0;
      instance.CCReqButton:LocalizeAndSetToolTip("TXT_KEY_CC_MINSIZE_REQUIRED", ccType.CitySizeRequired);
    end
    IconHookup(iconIndex, 64, "CITIZEN_ATLAS", instance.CCReqPortrait);
    instance.CCReqLabel:SetHide(false);
    instance.CCReqLabel:SetString(tostring(math.abs(ccType.CitySizeRequired)));
  end
  
  -- Tech Check
  if(ccType.TechRequired ~= nil) then
    local tech = GameInfo.Technologies[ccType.TechRequired];
		if(tech ~= nil) then
			instance = CCPopup_GetReqInstance(FailsTechCheck(player, ccType));
			IconHookup(tech.PortraitIndex, 64, tech.IconAtlas, instance.CCReqPortrait);
			local techDesc = Locale.ConvertTextKey(tech.Description);
			instance.CCReqButton:LocalizeAndSetToolTip("TXT_KEY_CC_TECH_REQUIRED", techDesc);	
			instance.CCReqButton:SetVoids(SetDict(techDesc), nil);
			instance.CCReqButton:RegisterCallback(Mouse.eLClick, CCPopup_ShowCivilopedia);
			instance.CCEffectTypeLabel:SetHide(false);
			instance.CCEffectTypeLabel:SetString("[ICON_RESEARCH]");
		end
  end
  
  -- Era Check
  if(ccType.EraRequired ~= nil) then
    local era = GameInfo.Eras[ccType.EraRequired];
		if(era ~= nil) then
			instance = CCPopup_GetReqInstance(FailsEraCheck(player, ccType));
			-- icons from difficulty-atlas
			IconHookup(era.ID, 64, "DIFFICULTY_ATLAS", instance.CCReqPortrait);
			local eraDesc = Locale.ConvertTextKey(era.Description);
			instance.CCReqButton:LocalizeAndSetToolTip("TXT_KEY_CC_ERA_REQUIRED", eraDesc);
		end
  end
 
  -- BuildingClass Check
  if(ccType.BuildingClassRequired ~= nil) then
    local building = GameInfo.Buildings[GameInfo.BuildingClasses[ccType.BuildingClassRequired].DefaultBuilding];
		if(building ~= nil) then
			instance = CCPopup_GetReqInstance(FailsBuildingClassCheck(city, ccType));
			IconHookup(building.PortraitIndex, 64, building.IconAtlas, instance.CCReqPortrait);
			local buildingDesc = Locale.ConvertTextKey(building.Description);
			instance.CCReqButton:LocalizeAndSetToolTip("TXT_KEY_CC_BUILDINGCLASS_REQUIRED", buildingDesc);	
			instance.CCReqButton:SetVoids(SetDict(buildingDesc), nil);
			instance.CCReqButton:RegisterCallback(Mouse.eLClick, CCPopup_ShowCivilopedia);
			instance.CCEffectTypeLabel:SetHide(false);
			instance.CCEffectTypeLabel:SetString("[ICON_PRODUCTION]");
		end
  end
  
  -- Policy Check
  if(ccType.PolicyRequired ~= nil) then
    local policy = GameInfo.Policies[ccType.PolicyRequired];
		if(policy ~= nil) then
			instance = CCPopup_GetReqInstance(FailsPolicyCheck(player, ccType));
			IconHookup(policy.PortraitIndex, 64, policy.IconAtlasAchieved, instance.CCReqPortrait);
			local policyDesc = Locale.ConvertTextKey(policy.Description);
			instance.CCReqButton:LocalizeAndSetToolTip("TXT_KEY_CC_POLICY_REQUIRED", policyDesc);	
			instance.CCReqButton:SetVoids(SetDict(policyDesc), nil);
			instance.CCReqButton:RegisterCallback(Mouse.eLClick, CCPopup_ShowCivilopedia);
			instance.CCEffectTypeLabel:SetHide(false);
			instance.CCEffectTypeLabel:SetString("[ICON_CULTURE]");
		end
  end
  
  -- Garrison Check
  if(ccType.GarrisonRequired) then
    instance = CCPopup_GetReqInstance(FailsGarrisonCheck(city, ccType));
    IconHookup(24, 64, "TERRAIN_ATLAS", instance.CCReqPortrait);
    instance.CCReqButton:LocalizeAndSetToolTip("TXT_KEY_CC_GARRISON_REQUIRED");	
  end

	-- MustProduce Check
  if(ccType.MustProduce) then
    instance = CCPopup_GetReqInstance(FailsMustProduceCheck(city, ccType));
    IconHookup(37, 64, "TERRAIN_ATLAS", instance.CCReqPortrait);
    instance.CCReqButton:LocalizeAndSetToolTip("TXT_KEY_CC_MUST_PRODUCE");	
  end
  
	-- BuildingClassExcluded Check
  if(ccType.BuildingClassExcluded ~= nil) then
		local buildingClass = GameInfo.BuildingClasses[ccType.BuildingClassExcluded];
		if(buildingClass ~= nil) then
			local building = GameInfo.Buildings[buildingClass.DefaultBuilding];
			if(building ~= nil) then
				instance = CCPopup_GetReqInstance(FailsBuildingClassExcludedCheck(city, ccType));
				IconHookup(building.PortraitIndex, 64, building.IconAtlas, instance.CCReqPortrait);
				local buildingDesc = Locale.ConvertTextKey(building.Description);
				instance.CCReqButton:LocalizeAndSetToolTip("TXT_KEY_CC_BUILDINGCLASS_EXCLUDED", buildingDesc);	
				instance.CCReqButton:SetVoids(SetDict(buildingDesc), nil);
				instance.CCReqButton:RegisterCallback(Mouse.eLClick, CCPopup_ShowCivilopedia);	
				instance.CCReqLabel:SetColorByName("Red_Black");
				instance.CCReqLabel:SetString("X");
				instance.CCReqLabel:SetHide(false);
				instance.CCEffectTypeLabel:SetHide(false);
				instance.CCEffectTypeLabel:SetString("[ICON_PRODUCTION]");
			end
		end
  end

	-- BuildingClassInEmpire Check
  if(ccType.BuildingClassInEmpireRequired ~= nil) then
		local buildingClass = GameInfo.BuildingClasses[ccType.BuildingClassInEmpireRequired];
		if(buildingClass ~= nil) then
			local building = GameInfo.Buildings[buildingClass.DefaultBuilding];
			if(building ~= nil) then
				instance = CCPopup_GetReqInstance(FailsBuildingClassInEmpireCheck(player, ccType));
				IconHookup(building.PortraitIndex, 64, building.IconAtlas, instance.CCReqPortrait);
				local buildingDesc = Locale.ConvertTextKey(building.Description);
				instance.CCReqButton:LocalizeAndSetToolTip("TXT_KEY_CC_BUILDINGCLASSINEMPIRE_REQUIRED", buildingDesc);	
				instance.CCReqButton:SetVoids(SetDict(buildingDesc), nil);
				instance.CCReqButton:RegisterCallback(Mouse.eLClick, CCPopup_ShowCivilopedia);
				instance.CCEffectTypeLabel:SetHide(false);
				instance.CCEffectTypeLabel:SetString("[ICON_PRODUCTION]");
				instance.CCEffectScopeLabel:SetHide(false);
			end
		end
  end

	-- BuildingClassInEmpireExcluded Check
  if(ccType.BuildingClassInEmpireExcluded ~= nil) then
		local buildingClass = GameInfo.BuildingClasses[ccType.BuildingClassInEmpireExcluded];
    if(buildingClass ~= nil) then
			local building = GameInfo.Buildings[buildingClass.DefaultBuilding];
			if(building ~= nil) then
				instance = CCPopup_GetReqInstance(FailsBuildingClassInEmpireExcludedCheck(player, ccType));
				IconHookup(building.PortraitIndex, 64, building.IconAtlas, instance.CCReqPortrait);
				local buildingDesc = Locale.ConvertTextKey(building.Description);
				instance.CCReqButton:LocalizeAndSetToolTip("TXT_KEY_CC_BUILDINGCLASSINEMPIRE_EXCLUDED", buildingDesc);	
				instance.CCReqButton:SetVoids(SetDict(buildingDesc), nil);
				instance.CCReqButton:RegisterCallback(Mouse.eLClick, CCPopup_ShowCivilopedia);	
				instance.CCReqLabel:SetColorByName("Red_Black");
				instance.CCReqLabel:SetString("X");
				instance.CCReqLabel:SetHide(false);
				instance.CCEffectTypeLabel:SetHide(false);
				instance.CCEffectTypeLabel:SetString("[ICON_PRODUCTION]");
				instance.CCEffectScopeLabel:SetHide(false);
			end
		end
  end

	-- CanHaveResource Check
  if(ccType.CanHaveResource ~= nil) then
		local resource = GameInfo.Resources[ccType.CanHaveResource];
		if(resource ~= nil) then
			instance = CCPopup_GetReqInstance(FailsCanHaveResourceCheck(city, ccType));
			IconHookup(resource.PortraitIndex, 64, resource.IconAtlas, instance.CCReqPortrait);
			local resourceDesc = Locale.ConvertTextKey(resource.Description);
			instance.CCReqButton:LocalizeAndSetToolTip("TXT_KEY_CC_CANHAVERESOURCE", resource.IconString..resourceDesc);	
			instance.CCReqButton:SetVoids(SetDict(resourceDesc), nil);
			instance.CCReqButton:RegisterCallback(Mouse.eLClick, CCPopup_ShowCivilopedia);
		end
  end
  
  ccMetStack:CalculateSize();
  ccMetScrollPanel:CalculateInternalSize();
  ccMetStack:ReprocessAnchoring();
  ccUnmetStack:CalculateSize();
  ccUnmetScrollPanel:CalculateInternalSize();
  ccUnmetStack:ReprocessAnchoring();
end

-- ======================================================
-- GetReqInstance
-- ======================================================
-- returns an instance for the correct stack depending on bFailed (requirement met or not met)
function CCPopup_GetReqInstance(bFailed)
	local ccMetStack = ContextPtr:LookUpControl("../CCPopup/CCMetStack");
	local ccUnmetStack = ContextPtr:LookUpControl("../CCPopup/CCUnmetStack");
	local ccPopup = ContextPtr:LookUpControl("../CCPopup/");

  local instance = {};
  if bFailed then
    ccPopup:BuildInstanceForControl("CCReqInstance", instance, ccUnmetStack);
  else
    ccPopup:BuildInstanceForControl("CCReqInstance", instance, ccMetStack);
  end
  
  return instance;
end

-- ======================================================
-- Options
-- ======================================================
local g_showAllOption = ContextPtr:LookUpControl("../CCPopup/ShowAllOption");
local g_showObsoleteOption = ContextPtr:LookUpControl("../CCPopup/ShowObsoleteOption");

function CCPopup_OnShowAllOptionChecked(bIsChecked)
	local showObsoleteOption = ContextPtr:LookUpControl("../CCPopup/ShowObsoleteOption");

	g_showAll = bIsChecked;
  showObsoleteOption:SetHide(not bIsChecked);

	CCPopup_FillTypesStack();
end
g_showAllOption:RegisterCheckHandler(CCPopup_OnShowAllOptionChecked);

function CCPopup_OnShowObsoleteOptionChecked(bIsChecked)
	g_showObsolete = bIsChecked;
	CCPopup_FillTypesStack();
end
g_showObsoleteOption:RegisterCheckHandler(CCPopup_OnShowObsoleteOptionChecked);

-- ======================================================
-- SwitchToMode
-- ======================================================
-- Switches the popup to the given mode ("empty", "basic")
function CCPopup_SwitchToMode(mode)
  if(g_mode == mode) then
    return;
  end
  
	local emptyBox = ContextPtr:LookUpControl("../CCPopup/EmptyBox");
	local basicBox = ContextPtr:LookUpControl("../CCPopup/BasicBox");

  if(mode == "empty") then
		emptyBox:SetHide(false);
    basicBox:SetHide(true);
  elseif(mode == "basic") then
    emptyBox:SetHide(true);
    basicBox:SetHide(false);
  end
  
  g_mode = mode;
end

-- ======================================================
-- OnSelectNewWisdom 
-- ======================================================
-- gets called as soon as a player had won the cc election
function CCPopup_OnSelectNewWisdom()
  g_wisdom = CCPopup_SelectNewWisdom();
	dosave("cc_wisdom", g_wisdom);
end
LuaEvents.CCPopupSelectNewWisdom.Add(CCPopup_OnSelectNewWisdom);

-- ======================================================
-- SelectNewWisdom
-- ======================================================
-- sets a new wisdom to fill the top panel with
function CCPopup_SelectNewWisdom()
  local wisdom = nil;
  while true do
    local random = Game.Rand(#GameInfo.CCQuotes, "(Lua::CCPopup.lua::CCPopup_SelectNewWisdom) Random wisdom");
    if(g_wisdom == nil) or (g_wisdom.ID ~= random) then
      wisdom = CCPopup_GetQuote(random);
      break;
    end
  end
  
  if(wisdom == nil) then
    wisdom = CCPopup_GetQuote(1);
  end
  return wisdom;
end

function CCPopup_GetEffectDescription(bonus)
	local ctx = GameInfo.CCContextTypes[bonus.Context];
	local cType = ctx.Type;
	local cTable1 = ctx.ContextRefTable1;
	local cTable2 = ctx.ContextRefTable2;
	local cRef1 = bonus.ContextRefType1;
	local cRef2 = bonus.ContextRefType2;

	local desc = nil;
	local help = nil
	if(cType == "CITY_ADDBUILDING") then
		if(TM_Assert(cTable1, cRef1)) then
			local entry = GameInfo[cTable1][cRef1];
			desc = entry.Description; 
			help = entry.Help;
			-- GetHelpTextForBuilding(iBuildingID, bExcludeName, bExcludeHeader, bNoMaintenance, bExcludeWritten)
			--help = GetHelpTextForBuilding(entry.ID, true, true, true, true);
		end
	end

	return desc, help;
end


-- ======================================================
-- GetQuote
-- ======================================================
function CCPopup_GetQuote(id)
  for row in GameInfo.CCQuotes{ID = id} do
    return row;
  end
  
  return nil;
end

local g_closeButton = ContextPtr:LookUpControl("../CCPopup/CloseButton");
local g_cityButton = ContextPtr:LookUpControl("../CCPopup/CityButton");
local g_chooseThemeButton = ContextPtr:LookUpControl("../CCPopup/CCChooseThemeButton");

-- ======================================================
-- General popup handling functions
-- ======================================================
function CCPopup_OnCloseButtonClicked()
  CCPopup_ClosePopup();
end
g_closeButton:RegisterCallback(Mouse.eLClick, CCPopup_OnCloseButtonClicked);

function CCPopup_OnCityButtonClicked()
  if(g_electedCityId == nil) then
    return;
  end
  
	local player, city = GetPlayerCity(g_electedPlayerId, g_electedCityId);
  UI.DoSelectCityAtPlot(city:Plot());
  CCPopup_ClosePopup();
end
g_cityButton:RegisterCallback(Mouse.eLClick, CCPopup_OnCityButtonClicked);

function CCPopup_OnChooseThemeButtonClicked()
	if(g_selectedTheme == nil) then
		return;
	end

	if(not IsValidCCType(g_electedPlayerId, g_electedCityId, g_selectedTheme.ccType)) then
		return;
	end
	dosave("cc_bPlayerHasChosenTheme", true);
	LuaEvents.CCThemeChosen(g_electedPlayerId, g_electedCityId, g_selectedTheme, g_evals);
	Events.AudioPlay2DSound("AS2D_EVENT_NOTIFICATION_GOOD");
	CCPopup_ClosePopup();

	local player, city = GetPlayerCity(g_electedPlayerId, g_electedCityId);
	UI.DoSelectCityAtPlot(city:Plot());

end
g_chooseThemeButton:RegisterCallback(Mouse.eLClick, CCPopup_OnChooseThemeButtonClicked);

local g_ccPopup = ContextPtr:LookUpControl("../CCPopup/");

function CCPopup_ShowHideHandler( bIsHide, bInitState )
  if( not bInitState ) then
    if( not bIsHide ) then
    	UI.incTurnTimerSemaphore();
    	Events.SerialEventGameMessagePopupShown(m_PopupInfo);
    else
      UI.decTurnTimerSemaphore();
      Events.SerialEventGameMessagePopupProcessed.CallImmediate(m_PopupInfo.Type, 1);
    end
  end
end
g_ccPopup:SetShowHideHandler(CCPopup_ShowHideHandler);

function CCPopup_ShowPopup()
	local ccPopup = ContextPtr:LookUpControl("../CCPopup/");
	UIManager:QueuePopup(ccPopup, PopupPriority.eUtmost );
end

function CCPopup_ClosePopup()
	local ccPopup = ContextPtr:LookUpControl("../CCPopup/");
	UIManager:DequeuePopup(ccPopup);
end


function CCPopup_InputHandler( uiMsg, wParam, lParam )
  if uiMsg == KeyEvents.KeyDown then
    if (wParam == Keys.VK_ESCAPE) or (wParam == Keys.VK_RETURN) then
      CCPopup_ClosePopup();
      return true;
    end
  end
end
g_ccPopup:SetInputHandler(CCPopup_InputHandler);