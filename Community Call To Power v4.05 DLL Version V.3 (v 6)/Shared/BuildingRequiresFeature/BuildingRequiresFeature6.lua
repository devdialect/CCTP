print("Building requires Feature/Jungle1")
GameEvents.CityCanConstruct.Add(function(iPlayer, iCity, iBuilding)
        --add desired building name
	local iJgarden = GameInfoTypes.BUILDING_JGARDEN
	if (iBuilding == iJgarden) then
		local pCityPlot = Players[iPlayer]:GetCityByID(iCity):Plot()
		local iOwner = pCityPlot:GetOwner()
		local directions = {DirectionTypes.DIRECTION_NORTHEAST, DirectionTypes.DIRECTION_EAST, DirectionTypes.DIRECTION_SOUTHEAST, DirectionTypes.DIRECTION_SOUTHWEST, DirectionTypes.DIRECTION_WEST, DirectionTypes.DIRECTION_NORTHWEST}
		
		 for loop, direction in ipairs(directions) do
			local pPlot = Map.PlotDirection(pCityPlot:GetX(), pCityPlot:GetY(), direction)

				-- Is the adjacent plot owned by the same player as the land plot
			if (pPlot ~= nil and iOwner == pPlot:GetOwner()) then
                               --add desired feature name
				local iJungle = GameInfoTypes.FEATURE_JUNGLE
				-- Is the adjacent plot a jungle
				if(pPlot:GetFeatureType() == iJungle) then
					return true
				end
			end
		end
		return false
	end
	return true
end)