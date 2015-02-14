
print("---ImprovementsGrandsResources---");
include( "SaveUtils" ); MY_MOD_NAME = "ImprovementsGrandsResources";

--remote installation registry. Every time after modifying, make sure to call updateSaveData()
local aManufactory = {};

local mapMaxX, mapMaxY = Map.GetGridSize();



function onImprovementCreated(iHexX, iHexY)
	local pPlot = Map.GetPlot(ToGridFromHex(iHexX, iHexY));
	if (pPlot~= nil) then
		local improvementType = pPlot:GetImprovementType();
		if(improvementType == GameInfoTypes.IMPROVEMENT_MANUFACTORY) then
	
			local plotID = pPlot:GetX() + pPlot:GetY() * mapMaxX;
			
			--local playerTeamID = Game.GetActiveTeam();
			local playerID = pPlot:GetOwner();		
			
			local isPillaged = pPlot:IsImprovementPillaged();		
			
			if(isPillaged) then
				if( aManufactory[plotID]~=nil and aManufactory[plotID].PlayerID ) then
					--need to take back Manpower resource
					DisconnectManpower( plotID, playerID );
				end
				print("Manufactory Pillaged at plot ID:", plotID);
			else
				--we don't want to overwrite data if registered mine already exists on site
				if(aManufactory[plotID]==nil) then
					print("Manufactory Built or Repaired", plotID);
					ConnectManpower( plotID, playerID );
				end
			end
		
		end
	end
end
Events.SerialEventImprovementCreated.Add(onImprovementCreated)


function onImprovementDestroyed(iHexX, iHexY)
	local plotX, plotY = ToGridFromHex(iHexX, iHexY);
	local plotID = plotX + plotY * mapMaxX;
	
	if(aManufactory[plotID]) then
		--local improvementType = pPlot:GetImprovementType();
		--if(improvementType == GameInfoTypes.IMPROVEMENT_MANUFACTORY) then

		-- there used to be Manufactory here - remove it
		print("onImprovementDestroyed: ManufactoryDestroyed");
		DisconnectManpower( plotID, aManufactory[plotID].PlayerID );
	end
	
end
Events.SerialEventImprovementDestroyed.Add(onImprovementDestroyed)


function onPlotOwnershipChange(iHexX, iHexY)
	local plotX, plotY = ToGridFromHex(iHexX, iHexY);
	local plotID = plotX + plotY * mapMaxX;	
	
	if(aManufactory[plotID]) then
		print("onPlotOwnershipChange: Manufactory Ownership hac changed");
		DisconnectManpower( plotID, aManufactory[plotID].PlayerID );
		local pPlot = Map.GetPlot(ToGridFromHex(iHexX, iHexY));
		if(pPlot) then
			local newOwner = pPlot:GetOwner();
			ConnectManpower( plotID, newOwner );
		else
			print("ERROR in ManufactoryControl: Map.GetPlot returned nil");
		end
	end
	
end
Events.SerialEventHexCultureChanged.Add(onPlotOwnershipChange)

--Events.SerialEventCityCaptured.Add(CityCultureOnCapture)


function ConnectManpower( plotID, playerID )
	
	local pPlayer = Players[playerID];
	local iResourceID = GameInfoTypes.RESOURCE_MANPOWER;
	local iResourceNum = 3;

	if(pPlayer) then
		pPlayer:ChangeNumResourceTotal(iResourceID, iResourceNum);
	end

	--register/update mine status
	aManufactory[plotID] = {};
	aManufactory[plotID].PlayerID = playerID;
	updateSaveData(plotID);
	
	print("Connected resource ", iResourceID, " for player ", playerID, "amount:", iResourceNum);
end


function DisconnectManpower( plotID, playerID )

	local pPlayer = Players[playerID];
	local iResourceID = GameInfoTypes.RESOURCE_MANPOWER;
	local iResourceNum = 3;

	if(pPlayer) then
		pPlayer:ChangeNumResourceTotal(iResourceID, -iResourceNum);
	end
	
	--update Manufactory status
	--aManufactory[plotID].PlayerID = false;
	aManufactory[plotID] = nil;
	updateSaveData(plotID);
	
	print("Disconnected resource ", iResourceID, " for player ", playerID, "amount:", iResourceNum);
end


function updateSaveData(plotID)
	local pPlayer = Players[Game.GetActivePlayer()];
	save( pPlayer, plotID, aManufactory[plotID] );
end


function loadSaveData()
	local pPlayer = Players[Game.GetActivePlayer()];
	local wholeTable = load( pPlayer );
	for plotID, v in pairs(wholeTable) do
		print("plotID:",plotID);
		for ii,kk in pairs(v) do
			print(ii,kk);
		end
		
		aManufactory[plotID] = v;
		
	end
end
loadSaveData();	--call on startup
