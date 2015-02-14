
function Mountaineering(iPlayer)
	print("Assigning ski slopes");
	-- loop through all plots
	for iPlot = 0, Map.GetNumPlots() - 1 do
		local plot = Map.GetPlotByIndex(iPlot);
		if plot:IsMountain() and plot:GetFeatureType() == -1 then
			plot:SetFeatureType(GameInfoTypes.FEATURE_SKI);
		end
	end
end
Events.SequenceGameInitComplete.Add( Mountaineering );
