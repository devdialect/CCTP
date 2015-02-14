function Hillengineering(iPlayer)
	print("Assigning Hill slopes");
	-- loop through all plots
	for iPlot = 1, Map.GetNumPlots() - 1 do
		local plot = Map.GetPlotByIndex(iPlot);
		if plot:IsHills() and plot:GetFeatureType() == -1 then
			plot:SetFeatureType(GameInfoTypes.FEATURE_BERG);
		end
	end
end
Events.SequenceGameInitComplete.Add( Hillengineering );
