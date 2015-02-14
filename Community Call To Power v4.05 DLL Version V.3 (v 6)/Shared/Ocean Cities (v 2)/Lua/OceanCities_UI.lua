-- OceanCities_UI
-- Author: FramedArchitecture
-- DateCreated: 3/2014 
--------------------------------------------------------------
-- support functions copied from PlotMouseOverInclude
--------------------------------------------------------------
local LocaleLookup = Locale.Lookup;
function Memoize_TableDescriptionByType(tableName)
	local memoizeData = {};
	local dbTable = GameInfo[tableName];
	
	return function(type)
		local text = memoizeData[type];
		if(text == nil) then
			text =  LocaleLookup(dbTable[type].Description);
			memoizeData[type] = text;
		end
		
		return text;
	end
end

local memoize_LocaleLookupData = {};
function Memoize_LocaleLookup(key)
	local text = memoize_LocaleLookupData[key];
	if(text == nil) then
		text = LocaleLookup(key);
		memoize_LocaleLookupData[key] = text;
	end
	
	return text;
end

local GetFeatureText = Memoize_TableDescriptionByType("Features");
local GetTerrainText = Memoize_TableDescriptionByType("Terrains");
local GetImprovementText = Memoize_TableDescriptionByType("Improvements");
local GetRouteText = Memoize_TableDescriptionByType("Routes");
--------------------------------------------------------------
function GetOCMODResourceString(plot, bLongForm, data)
	
	local improvementStr = "";
	
	if data == nil then
		return improvementStr;
	end

	local iActiveTeam = Game.GetActiveTeam();
	local pTeam = Teams[iActiveTeam];
	
	if data.resource then
		local resourceType = data.resource
		local pResource = GameInfo.Resources[resourceType];
		
		if data.resnum then
			improvementStr = improvementStr .. data.resnum .. " ";
		end
		
		local convertedKey = Memoize_LocaleLookup(pResource.Description);		
		improvementStr = improvementStr .. pResource.IconString .. " " .. convertedKey;
		
		-- Resource Hookup info
		local iTechCityTrade = GameInfoTypes[pResource.TechCityTrade];
		if (iTechCityTrade ~= nil) then
			if (iTechCityTrade ~= -1 and not pTeam:GetTeamTechs():HasTech(iTechCityTrade)) then

				local techName = GameInfo.Technologies[iTechCityTrade].Description;
				if (bLongForm) then
					improvementStr = improvementStr .. " " .. Locale.ConvertTextKey( "TXT_KEY_PLOTROLL_REQUIRES_TECH_TO_USE", techName );
				else
					improvementStr = improvementStr .. " " .. Locale.ConvertTextKey( "TXT_KEY_PLOTROLL_REQUIRES_TECH", techName );
				end
			end
		end
	end
	
	return improvementStr;
	
end
--------------------------------------------------------------
function GetOCMODImprovementString(plot, data)

	local improvementStr = "";
	
	if data == nil then
		return improvementStr;
	end

	local iActiveTeam = Game.GetActiveTeam();
	local pTeam = Teams[iActiveTeam];

	local iImprovementType = data.improvement
	if data.improvement then
		if (improvementStr ~= "") then
			improvementStr = improvementStr .. ", ";
		end
		local convertedKey = GetImprovementText(iImprovementType);	
		improvementStr = improvementStr .. convertedKey;
		if data.pillaged then
			improvementStr = improvementStr .." " .. Memoize_LocaleLookup("TXT_KEY_PLOTROLL_PILLAGED")
		end
	end

	local iRouteType = plot:GetRevealedRouteType(iActiveTeam, bIsDebug);
	if (iRouteType > -1) then
		if (improvementStr ~= "") then
			improvementStr = improvementStr .. ", ";
		end
		local convertedKey = GetRouteText(iRouteType);		
		improvementStr = improvementStr .. convertedKey;
		--improvementStr = improvementStr .. "Road";
		
		if (plot:IsRoutePillaged()) then
			improvementStr = improvementStr .. " " .. Memoize_LocaleLookup("TXT_KEY_PLOTROLL_PILLAGED")
		end
	end
	
	return improvementStr;

end
--------------------------------------------------------------
function GetOCMODNatureString(plot, data)
	
	local natureStr = "";
	
	if data == nil then
		return natureStr;
	end

	local bFirst = true;
	
	local iFeature = data.feature and data.feature or -1;
			
		local bMountain = false;
		
		-- Feature
		if (iFeature > -1) then
			if (bFirst) then
				bFirst = false;
			else
				natureStr = natureStr .. ", ";
			end
			
			-- Block terrian type below
			if (GameInfo.Features[iFeature].NaturalWonder) then
				bMountain = true;
			end
			
			local convertedKey = GetFeatureText(iFeature);
			natureStr = natureStr .. convertedKey;
			
		-- No Feature
		else
			
			-- Mountain
			if (plot:IsMountain()) then
				if (bFirst) then
					bFirst = false;
				else
					natureStr = natureStr .. ", ";
				end
				
				bMountain = true;
				
				natureStr = natureStr .. Memoize_LocaleLookup( "TXT_KEY_PLOTROLL_MOUNTAIN" );
			end
			
		end
			
		-- Terrain
		if (not bMountain) then
			if (bFirst) then
				bFirst = false;
			else
				natureStr = natureStr .. ", ";
			end
			
			local convertedKey = "";
			
			-- Lake?
			if data.terrain then
				convertedKey = GetTerrainText(data.terrain);
			end
			
			natureStr = natureStr .. convertedKey;
		end
	-- End Feature hack
	
	-- Hills
	if (plot:IsHills()) then
		if (bFirst) then
			bFirst = false;
		else
			natureStr = natureStr .. ", ";
		end
		
		natureStr = natureStr .. Memoize_LocaleLookup( "TXT_KEY_PLOTROLL_HILL" );
	end

	-- River
	if (plot:IsRiver()) then
		if (bFirst) then
			bFirst = false;
		else
			natureStr = natureStr .. ", ";
		end
		
		natureStr = natureStr .. Memoize_LocaleLookup( "TXT_KEY_PLOTROLL_RIVER" );
	end
	
	return natureStr;
	
end