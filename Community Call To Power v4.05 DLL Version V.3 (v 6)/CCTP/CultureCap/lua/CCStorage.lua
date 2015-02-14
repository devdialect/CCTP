if(Game.GetCustomOption("GAMEOPTION_CULTURALCAPITALS") == 0) then
	return;
end

-- CC
-- Author: Moaf
--------------------------------------------------------------
include("CCSaveUtils");
local g_mod = "6763d715-af95-4bbf-8c04-13a11de025b5";
MY_MOD_NAME = g_mod;
WARN_NOT_SHARED = false;

--local g_container = Players[0];
-- assuming that there are at least some plots on the map!
local g_container = Map.GetPlotByIndex(11);

local g_shareContext = "CulturalCapital";

local g_saveData = nil;

local g_tableIndicator = "#T#";
local g_tableKeyDelim = "#Key#";
local g_tableValueDelim = "#Value#";

local g_cache = {};

local function savetocache(key, value)
	g_cache[key] = value;
end

local function loadfromcache(key)
	return g_cache[key];
end

function InitSaveData()
	g_saveData = Modding.OpenSaveData();
end

function dosetCacheState(value)
	setCacheState(value);
end

-- saves a value to the modding.savegamedata
-- (very slow db access, plus the data does not seem to be cached)
--function dosavegd(key, value)
	--Debug("Start saving " .. key);
	--savetocache(key, value);
	--if((value ~= nil) and (type(value) == "table")) then
	--	--Debug("Table to save : " .. out(value));
	--	local n = #value;
	--	g_saveData.SetValue(key, g_tableIndicator);
	--	-- save the size of the table
	--	g_saveData.SetValue(key .. g_tableIndicator, n);
	--	local i = 0;
	--	for k, v in pairs(value) do
	--		-- save the key for the array here
	--		g_saveData.SetValue(key .. g_tableKeyDelim .. i, k);
	--		-- save recursively
	--		dosave(key .. g_tableValueDelim .. i, v);
	--	end
	--else
	--	g_saveData.SetValue(key, value);
	--end
	--return value;
--end

-- loads a value from modding.savegamedata
--function doloadgd(key)
	--Debug("Start loading " .. key);
	--local cachedData = loadfromcache(key);
	--if(cachedData ~= nil) then
	--	Debug("Loaded " .. key);
	--	return cachedData;
	--end

	--local value = g_saveData.GetValue(key);
	--if((value ~= nil) and (type(value) == "string")) then
	--	-- check if it's a table
	--	if(value == g_tableIndicator) then
	--		local t = {};
	--		local n = g_saveData.GetValue(key .. g_tableIndicator);
	--		for i = 0, n do
	--			local tKey = g_saveData.GetValue(key .. g_tableKeyDelim .. i);
	--			local tValue = doload(key .. g_tableValueDelim .. i);
	--			t[tKey] = tValue;
	--		end
	--		value = t;
	--		--Debug("Retrieved table : " .. out(value));
	--	end
	--end

	--Debug("Loaded " .. key);
	--return value;
--end

function dosave(key, value)
	save(g_container, key, value);
  return value;
end

function doload(key)
  return load(g_container, key);
end

function dodelete(key)
  delete(g_container, key);
end

function doshare(key, value)
  share(key, value, g_shareContext);
end

function dogetshared(key)
  return getShared(key, g_shareContext);
end

function dosetshared(key, value)
  setShared(key, value, g_shareContext);
end

function dohasshared(key)
  return hasShared(key, g_shareContext);
end

function dormvshared(key)
  rmvShared(key, g_shareContext);
end