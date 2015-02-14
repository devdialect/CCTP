print("---ImprovementsGrandsResources11---");
include( "SaveUtils" ); MY_MOD_NAME = "ImprovementsGrandsResources11";

--remote installation registry. Every time after modifying, make sure to call updateSaveData()
local aMotte_Bailey = {};

local mapMaxX, mapMaxY = Map.GetGridSize();



function onImprovementCreated(iHexX, iHexY)
	local pPlot = Map.GetPlot(ToGridFromHex(iHexX, iHexY));
	if (pPlot~= nil) then
		local improvementType = pPlot:GetImprovementType();
		if(improvementType == GameInfoTypes.IMPROVEMENT_MOTTE_BAILEY) then
	
			local plotID = pPlot:GetX() + pPlot:GetY() * mapMaxX;
			
			--local playerTeamID = Game.GetActiveTeam();
			local playerID = pPlot:GetOwner();		
			
			local isPillaged = pPlot:IsImprovementPillaged();		
			
			if(isPillaged) then
				if( aMotte_Bailey[plotID]~=nil and aMotte_Bailey[plotID].PlayerID ) then
					--need to take back Manpower resource
					DisconnectManpower( plotID, playerID );
				end
				print("Motte_Bailey Pillaged at plot ID:", plotID);
			else
				--we don't want to overwrite data if registered mine already exists on site
				if(aMotte_Bailey[plotID]==nil) then
					print("Motte_Bailey Built or Repaired", plotID);
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
	
	if(aMotte_Bailey[plotID]) then
		--local improvementType = pPlot:GetImprovementType();
		--if(improvementType == GameInfoTypes.IMPROVEMENT_MOTTE_BAILEY) then

		-- there used to be Motte_Bailey here - remove it
		print("onImprovementDestroyed: Motte_BaileyDestroyed");
		DisconnectManpower( plotID, aMotte_Bailey[plotID].PlayerID );
	end
	
end
Events.SerialEventImprovementDestroyed.Add(onImprovementDestroyed)


function onPlotOwnershipChange(iHexX, iHexY)
	local plotX, plotY = ToGridFromHex(iHexX, iHexY);
	local plotID = plotX + plotY * mapMaxX;	
	
	if(aMotte_Bailey[plotID]) then
		print("onPlotOwnershipChange: Motte_Bailey Ownership hac changed");
		DisconnectManpower( plotID, aMotte_Bailey[plotID].PlayerID );
		local pPlot = Map.GetPlot(ToGridFromHex(iHexX, iHexY));
		if(pPlot) then
			local newOwner = pPlot:GetOwner();
			ConnectManpower( plotID, newOwner );
		else
			print("ERROR in Motte_BaileyControl: Map.GetPlot returned nil");
		end
	end
	
end
Events.SerialEventHexCultureChanged.Add(onPlotOwnershipChange)

--Events.SerialEventCityCaptured.Add(CityCultureOnCapture)


function ConnectManpower( plotID, playerID )
	
	local pPlayer = Players[playerID];
	local iResourceID = GameInfoTypes.RESOURCE_MANPOWER;
	local iResourceNum = 2;

	if(pPlayer) then
		pPlayer:ChangeNumResourceTotal(iResourceID, iResourceNum);
	end

	--register/update mine status
	aMotte_Bailey[plotID] = {};
	aMotte_Bailey[plotID].PlayerID = playerID;
	updateSaveData(plotID);
	
	print("Connected resource ", iResourceID, " for player ", playerID, "amount:", iResourceNum);
end


function DisconnectManpower( plotID, playerID )

	local pPlayer = Players[playerID];
	local iResourceID = GameInfoTypes.RESOURCE_MANPOWER;
	local iResourceNum = 2;

	if(pPlayer) then
		pPlayer:ChangeNumResourceTotal(iResourceID, -iResourceNum);
	end
	
	--update Motte_Bailey status
	--aMotte_Bailey[plotID].PlayerID = false;
	aMotte_Bailey[plotID] = nil;
	updateSaveData(plotID);
	
	print("Disconnected resource ", iResourceID, " for player ", playerID, "amount:", iResourceNum);
end


function updateSaveData(plotID)
	local pPlayer = Players[Game.GetActivePlayer()];
	save( pPlayer, plotID, aMotte_Bailey[plotID] );
end


function loadSaveData()
	local pPlayer = Players[Game.GetActivePlayer()];
	local wholeTable = load( pPlayer );
	for plotID, v in pairs(wholeTable) do
		print("plotID:",plotID);
		for ii,kk in pairs(v) do
			print(ii,kk);
		end
		
		aMotte_Bailey[plotID] = v;
		
	end
end
loadSaveData();	--call on startup