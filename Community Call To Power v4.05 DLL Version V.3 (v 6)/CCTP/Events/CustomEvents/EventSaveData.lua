-- EventSaveData

-- DateCreated: 11/28/2014 9:13:03 PM
--------------------------------------------------------------
include("Serializer.lua");
--------------------------------------------------------------------
MapModData.g_Properties		= MapModData.g_Properties or {}
g_Properties				= MapModData.g_Properties;

local g_SaveData = Modding.OpenSaveData();
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