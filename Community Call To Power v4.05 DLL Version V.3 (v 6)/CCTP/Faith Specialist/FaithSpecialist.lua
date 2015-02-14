-- Faith_Specialist
-- Author: FramedArchitecture
-- DateCreated: 7/22/2013
--------------------------------------------------------------
MapModData.g_Properties		= MapModData.g_Properties or {}
g_Properties				= MapModData.g_Properties;
g_Properties.FaithSpecialist = false
--------------------------------------------------------------
LuaEvents.Player =	LuaEvents.Player	or function(player)	 end
LuaEvents.City =	LuaEvents.City		or function(city)	 end
PlayerClass = getmetatable(Players[0]).__index
--------------------------------------------------------------
local yieldID = GameInfo.Yields["YIELD_FAITH"].ID
--------------------------------------------------------------
function UpdateFaithFromSpecialists(iPlayer)
	if not g_Properties.FaithSpecialist then return end

	local pPlayer = Players[iPlayer]
	if not pPlayer:IsAlive() then return end
	if pPlayer:IsMinorCiv() then return end
	local iFaith = pPlayer:GetFaithFromSpecialists();
	if ( iFaith > 0 ) then
		pPlayer:ChangeFaith(iFaith);
		print(pPlayer:GetName(), iFaith .. "[ICON_PEACE] from Specialists.")
	end
end
GameEvents.PlayerDoTurn.Add( UpdateFaithFromSpecialists )
--------------------------------------------------------------
function PlayerClass.GetFaithFromSpecialists(pPlayer)	
	local iFaith = 0;
	if not g_Properties.FaithSpecialist then return iFaith end

	for pCity in pPlayer:Cities() do
		if pCity then
			iFaith = iFaith + City_GetFaithFromSpecialists(pCity);
		end
	end
	return iFaith;

end
LuaEvents.Player.Add( PlayerClass.GetFaithFromSpecialists )
--------------------------------------------------------------
function City_GetFaithFromSpecialists(pCity)
	local iFaith = 0
	if not g_Properties.FaithSpecialist then return iFaith end

	for row in GameInfo.Specialists() do
		local specialistID = row.ID
		local faithYield = pCity:GetSpecialistYield(specialistID, yieldID);
		if ( faithYield > 0 ) then
			iFaith = iFaith + (pCity:GetSpecialistCount( specialistID ) * faithYield );
		end
	end
	return iFaith;
end
LuaEvents.City.Add( City_GetFaithFromSpecialists )
--------------------------------------------------------------
-- CityView TT
function GetMODFaithTooltip(pCity)
	
	local faithTips = {};
	
	if (Game.IsOption(GameOptionTypes.GAMEOPTION_NO_RELIGION)) then
		table.insert(faithTips, Locale.ConvertTextKey("TXT_KEY_TOP_PANEL_RELIGION_OFF_TOOLTIP"));
	else

		if (not OptionsManager.IsNoBasicHelp()) then
			table.insert(faithTips, Locale.ConvertTextKey("TXT_KEY_FAITH_HELP_INFO"));
		end
	
		-- Faith from Buildings
		local iFaithFromBuildings = pCity:GetFaithPerTurnFromBuildings();
		if (iFaithFromBuildings ~= 0) then
		
			table.insert(faithTips, "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_FAITH_FROM_BUILDINGS", iFaithFromBuildings));
		end
	
		-- Faith from Traits
		local iFaithFromTraits = pCity:GetFaithPerTurnFromTraits();
		if (iFaithFromTraits ~= 0) then
			print("traitfaith", iFaithFromTraits);	
			table.insert(faithTips, "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_FAITH_FROM_TRAITS", iFaithFromTraits));
		end
	
		-- Faith from Terrain
		local iFaithFromTerrain = pCity:GetBaseYieldRateFromTerrain(YieldTypes.YIELD_FAITH);
		if (iFaithFromTerrain ~= 0) then
				
			table.insert(faithTips, "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_FAITH_FROM_TERRAIN", iFaithFromTerrain));
		end

		-- Faith from Policies
		local iFaithFromPolicies = pCity:GetFaithPerTurnFromPolicies();
		if (iFaithFromPolicies ~= 0) then
					
			table.insert(faithTips, "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_FAITH_FROM_POLICIES", iFaithFromPolicies));
		end

		-- Faith from Religion
		local iFaithFromReligion = pCity:GetFaithPerTurnFromReligion();
		if (iFaithFromReligion ~= 0) then
				
			table.insert(faithTips, "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_FAITH_FROM_RELIGION", iFaithFromReligion));
		end
		
		-- MOD Faith from Specialists 
		local iFaithFromSpecialists = City_GetFaithFromSpecialists(pCity);
		if (iFaithFromSpecialists ~= 0) then
				
			table.insert(faithTips, "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_FAITH_FROM_SPECIALISTS", iFaithFromSpecialists));
		end
		--end MOD

		-- Puppet modifier
		if (pCity:IsPuppet()) then
			iAmount = GameDefines.PUPPET_FAITH_MODIFIER;
		
			if (iAmount ~= 0) then
				table.insert(faithTips, Locale.ConvertTextKey("TXT_KEY_PRODMOD_PUPPET", iAmount));
			end
		end
	
		-- Citizens breakdown
		table.insert(faithTips, "----------------");

		table.insert(faithTips, GetReligionTooltip(pCity));
	end
	
	local strFaithToolTip = table.concat(faithTips, "[NEWLINE]");
	return strFaithToolTip;
end
--------------------------------------------------------------
function InitFaithSpecialist()
	for row in GameInfo.SpecialistYields() do
		if row.YieldType == "YIELD_FAITH" then
			g_Properties.FaithSpecialist = true
			print("InitFaithSpecialist() in Plague Context")
			break;
		end
	end
end
--------------------------------------------------------------
InitFaithSpecialist();