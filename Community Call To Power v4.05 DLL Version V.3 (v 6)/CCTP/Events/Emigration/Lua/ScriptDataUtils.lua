-- ScriptDataUtils
-- Author: killmeplease
-- DateCreated: 5/14/2013 11:16:33 AM
--------------------------------------------------------------

--------------------------------------------------------------
-- SERIALIZATION
--------------------------------------------------------------
function Serialize(tbl)
   local res = "{ ";
   local num = 0;
   for k, v in pairs(tbl) do
      if num > 0 then
         res = res.." ";
      end
      res = res..k.."=";
      if type(v) == "table" then
         res = res..Serialize(v);
      else		-- simple type?
         if v == false or v == true or type(v) == "number" then
            v = tostring(v);
         else	-- string
            v = v:gsub('"', "[QUOTE]");
            v = v:gsub('{', "[LCB]");
            v = v:gsub('}', "[RCB]");
            v = "\""..v.."\"";    
         end
         res = res..v;
      end
      num = num + 1;
   end
   return res.." }";
end
--------------------------------------------------------------
function Deserialize(str)
   local tbls = {};  -- nested tables
   local topTbl = {};
   repeat
      topTbl = {};  -- clear variable for top tbl
      -- find first top-level table position in str, its values list and key
      local strStart, strEnd, topTblKey, topTblVals = str:find("([%w]*)={%s([^{}]*)%s}");
      if topTblKey == nil then
         strStart, strEnd, topTblVals = str:find("{%s([^{}]*)%s}");
      end
      topTblVals = topTblVals or "";	-- emty table case

      -- parse values:
      -- save string values of top table to a temp table
      local strings = {};
      for vstr in topTblVals:gmatch('"([^"]*)"') do  -- match "..." string values
         vstr = vstr:gsub("%[QUOTE%]", '"');
         vstr = vstr:gsub("%[LCB%]", '{');
         vstr = vstr:gsub("%[RCB%]", '}');
         table.insert(strings, vstr);
      end
      -- cut string values from top table string and replace them with "@" symbol
      topTblVals = topTblVals:gsub('"[^"]*"', "@");

      -- parse key=value pairs
      stringNum = 1;
      for k, v in topTblVals:gmatch("(%S+)=(%S+)") do
         -- parse value
         if v == "#" then
            v = tbls[k];
         elseif v == "@" then
            v = strings[stringNum];
            stringNum = stringNum + 1;
         else
            -- parse simple value, a number or a boolean
            local n = tonumber(v);
            if n ~= nil then
               v = n;
            elseif v == "true" then
               v = true;
            elseif v == "false" then
               v = false;
            end
         end
         -- parse key:
         local n = tonumber(k);
         if n ~= nil then
            k = n;  
         end
         -- add value to the table:
         topTbl[k] = v;
      end
      if topTblKey ~= nil then  -- key is nil when it is a base table
         tbls[topTblKey] = topTbl;
          str = str:sub(1, strStart - 1)..topTblKey.."=#"..str:sub(strEnd + 1);
      else
         str = "#";
      end
      --print(str);
   until str == "#";
   return topTbl;
end
--------------------------------------------------------------
-- MOD DATA
--------------------------------------------------------------
function GetSavedValue(pItem, modName, key)
	-- script data
	local str = pItem:GetScriptData();	-- load data
	if str == "" or str == nil then
		return nil;
	end
	-- deserialized data
	local data = Deserialize(str);
	if data == nil then
		return nil;
	end
	-- mod data
	local modData = data[modName];
	if modData == nil then
		return nil;
	end
	-- value
	local value = modData[key];
	return value;
end