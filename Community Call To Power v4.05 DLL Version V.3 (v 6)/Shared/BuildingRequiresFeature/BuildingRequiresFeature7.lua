print("Building requires Feature/OASIS1")
GameEvents.CityCanConstruct.Add(function(iPlayer, iCity, iBuilding)
        --add desired building name
	local iOfarmer = GameInfoTypes.BUILDING_OFARMER
	if (iBuilding == iOfarmer) then
		local pCityPlot = Players[iPlayer]:GetCityByID(iCity):Plot()
		local iOwner = pCityPlot:GetOwner()
		local directions = {DirectionTypes.DIRECTION_NORTHEAST, DirectionTypes.DIRECTION_EAST, DirectionTypes.DIRECTION_SOUTHEAST, DirectionTypes.DIRECTION_SOUTHWEST, DirectionTypes.DIRECTION_WEST, DirectionTypes.DIRECTION_NORTHWEST}
		
		 for loop, direction in ipairs(directions) do
			local pPlot = Map.PlotDirection(pCityPlot:GetX(), pCityPlot:GetY(), direction)

				-- Is the adjacent plot owned by the same player as the land plot
			if (pPlot ~= nil and iOwner == pPlot:GetOwner()) then
                               --add desired feature name
				local iOasis = GameInfoTypes.FEATURE_OASIS
				-- Is the adjacent plot a oasis
				if(pPlot:GetFeatureType() == iOasis) then
					return true
				end
			end
		end
		return false
	end
	return true
end)