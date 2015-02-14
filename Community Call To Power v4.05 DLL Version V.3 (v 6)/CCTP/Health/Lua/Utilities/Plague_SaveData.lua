-- Plague_SaveData
-- Author: FramedArchitecture
-- DateCreated: 12/21/2013
--------------------------------------------------------------------
include("Serializer.lua");
--------------------------------------------------------------------
MapModData.g_Properties		= MapModData.g_Properties or {}
g_Properties				= MapModData.g_Properties;
g_PlagueCities				= {};
g_UpdatePlagueData			= true;
--------------------------------------------------------------------
local g_SaveData = Modding.OpenSaveData();
--------------------------------------------------------------------
function SavePlagueData()
	SetPersistentTable("g_PlagueCities", g_PlagueCities);
	g_UpdatePlagueData = true
end
--------------------------------------------------------------------
function GetPlagueData()
	return GetPersistentTable("g_PlagueCities");
end
--------------------------------------------------------------------
function SetPlagueTimer(iTurn)
	SetPersistentProperty("PlagueTimer", iTurn);
end
--------------------------------------------------------------------
function GetPlagueTimer()
	return GetPersistentProperty("PlagueTimer") or -1
end
--------------------------------------------------------------------
function SetCoolDownTimer(iTurn)
	SetPersistentProperty("CooldownTimer", iTurn);
end
--------------------------------------------------------------------
function GetCoolDownTimer()
	return GetPersistentProperty("CooldownTimer") or 0
end
--------------------------------------------------------------------
function SetSickThreshold(iThreshold)
	SetPersistentProperty("SickCityThreshold", iThreshold);
end
--------------------------------------------------------------------
function GetSickThreshold()
	return GetPersistentProperty("SickCityThreshold") or -1
end
--------------------------------------------------------------------
function SetLowestCurrentHealth(iHealth)
	SetPersistentProperty("CurrentLowestHealth", iHealth);
end
--------------------------------------------------------------------
function GetLowestCurrentHealth()
	return GetPersistentProperty("CurrentLowestHealth") or 0
end
--------------------------------------------------------------------
function SetEverPlagued(iPlayer, bBoolean)
	SetPersistentProperty(string.format("Player%iPlagued", iPlayer), bBoolean)
end
--------------------------------------------------------------------
function IsEverPlagued(iPlayer)
	return GetPersistentProperty(string.format("Player%iPlagued", iPlayer))
end
--------------------------------------------------------------------
function SetCurrentEra(iEra)
	SetPersistentProperty("CurrentEra", iEra);
end
--------------------------------------------------------------------
function GetCurrentEra()
	return GetPersistentProperty("CurrentEra") or 0
end
--------------------------------------------------------------------
function SetIsEspionageEra(bBoolean)
	SetPersistentProperty("IsEspionageEra", bBoolean);
end
--------------------------------------------------------------------
function IsEspionageEra()
	return GetPersistentProperty("IsEspionageEra");
end
--------------------------------------------------------------------
function SetInitialized(bBoolean)
	SetPersistentProperty("HealthPlague_Init", bBoolean);
end
--------------------------------------------------------------------
function IsInitialized()
	return GetPersistentProperty("HealthPlague_Init");
end
--------------------------------------------------------------------
function GetPersistentTable(name)
	if (g_Properties[name] == nil) then
		local code = g_SaveData.GetValue(name);
		g_Properties[name] = loadstring(code)();
	end
	return g_Properties[name];
end
--------------------------------------------------------------------
function SetPersistentTable(name, t)
    g_SaveData.SetValue(name, serialize(t))
	g_Properties[name] = t;
end
--------------------------------------------------------------------
function GetPersistentProperty(name)
	if (g_Properties[name] == nil) then
		g_Properties[name] = g_SaveData.GetValue(name);
	end
	return g_Properties[name];
end
--------------------------------------------------------------------
function SetPersistentProperty(name, value)
	g_SaveData.SetValue(name, value);
	g_Properties[name] = value;
end
--------------------------------------------------------------------