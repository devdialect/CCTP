if(Game.GetCustomOption("GAMEOPTION_CULTURALCAPITALS") == 0) then
	return;
end
-- vymdt.01.2010.11.17.0000
-- Created by: Whys Alives, modified by Moaf -Open source
--===========================================================================
-- WhysUtils.lua
--===========================================================================
--[[
Global Functions: len(), out().
]]

local g_indentSize = 2;
--===========================================================================
--[[
Returns length of both tables and strings.  Returns false when given boolean,
function, userdata, or thread.
]]
function len( p )
  local r = 0; local t = type( p );
  if t == "boolean" or t == "function" or t == "userdata" or t == "thread"
      then r = false; print( "len(): Invalid type: "..t ); --error.
  elseif t == "table"  then for k,v in pairs( p ) do r = r +1; end
  elseif t == "string" then r = p:len();
  end
  return r;
end
--===========================================================================
--[[
Returns a string representation of any given data type.
]]
function out( p, indent )
  local r = ""; local t = type( p );
  if p ~= nil then
    if t ~= "table" then
      if t == "boolean" or t == "number" or t == "function"
          or t == "userdata"  or t == "thread" then
        r = tostring( p );
      else r = '"'..p..'"';
      end
    else
			local indent = indent or 0;
			local nextIndent = indent + g_indentSize;
			local iString = string.rep(" ", indent);
      r = "\n"..iString.."{"; local b = false;
      for k,v in pairs( p ) do
        if b then r = r..",\n"..iString; end
        r = r..out( k, nextIndent ).."="..out( v, nextIndent );
        b = true;
      end
      r = r.."\n"..iString.."}";
    end
  end
  return r;
end
--===========================================================================
--END WhysUtils.lua
--===========================================================================
-- Created by: Whys Alives -Open source