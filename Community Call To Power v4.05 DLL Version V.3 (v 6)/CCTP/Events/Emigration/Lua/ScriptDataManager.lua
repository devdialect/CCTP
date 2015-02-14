-- ScriptDataManager
-- Author: killmeplease
-- DateCreated: 10/19/2010 8:55:27 PM
--------------------------------------------------------------
include( "ScriptDataUtils" );
--------------------------------------------------------------
-- SCRIPT DATA MANAGER
--------------------------------------------------------------

scriptData = { };	-- cache table
--print("SCRIPT DATA MANAGER LOADED");

function AccessData(pItem, modName)
	local itemData = scriptData[pItem];
	if itemData == nil then
		-- was not initialized yet (being accessing for the first time)
		--print("try get script data");
		local sdata = pItem:GetScriptData();	-- load data
		--print("...ok");
		if sdata == "" or sdata == nil then		-- is no data?
			--print("the data is nil. create new");
			scriptData[pItem] = { [modName] = {} };	-- create the empty data for the item and for the mod
		else
			-- there is a data for the given item, deserialize it:
			scriptData[pItem] = Deserialize(sdata);
			--print("script data is "..sdata);
			if scriptData[pItem][modName] == nil then
				scriptData[pItem][modName] = {};	-- if there's no data for the mod - create an empty entry
			end
		end
	end
	-- return mod data, loaded or newly created (empty)
	return scriptData[pItem][modName];
end

function SaveData(pItem)	-- save function works for all mods data for an item so no need to specify a mod
	sdata = Serialize(scriptData[pItem]);
	pItem:SetScriptData(sdata);
end