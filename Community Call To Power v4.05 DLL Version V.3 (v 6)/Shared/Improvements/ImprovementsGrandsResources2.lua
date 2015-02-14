print("---ImprovementsGrandsResources2---");
include( "SaveUtils" ); MY_MOD_NAME = "ImprovementsGrandsResources2";

--remote installation registry. Every time after modifying, make sure to call updateSaveData()
local aAcademy = {};

local mapMaxX, mapMaxY = Map.GetGridSize();



function onImprovementCreated(iHexX, iHexY)
	local pPlot = Map.GetPlot(ToGridFromHex(iHexX, iHexY));
	if (pPlot~= nil) then
		local improvementType = pPlot:GetImprovementType();
		if(improvementType == GameInfoTypes.IMPROVEMENT_ACADEMY) then
	
			local plotID = pPlot:GetX() + pPlot:GetY() * mapMaxX;
			
			--local playerTeamID = Game.GetActiveTeam();
			local playerID = pPlot:GetOwner();		
			
			local isPillaged = pPlot:IsImprovementPillaged();		
			
			if(isPillaged) then
				if( aAcademy[plotID]~=nil and aAcademy[plotID].PlayerID ) then
					--need to take back Manuscript resource
					DisconnectManuscript( plotID, playerID );
				end
				print("Academy Pillaged at plot ID:", plotID);
			else
				--we don't want to overwrite data if registered mine already exists on site
				if(aAcademy[plotID]==nil) then
					print("Academy Built or Repaired", plotID);
					ConnectManuscript( plotID, playerID );
				end
			end
		
		end
	end
end
Events.SerialEventImprovementCreated.Add(onImprovementCreated)


function onImprovementDestroyed(iHexX, iHexY)
	local plotX, plotY = ToGridFromHex(iHexX, iHexY);
	local plotID = plotX + plotY * mapMaxX;
	
	if(aAcademy[plotID]) then
		--local improvementType = pPlot:GetImprovementType();
		--if(improvementType == GameInfoTypes.IMPROVEMENT_ACADEMY) then

		-- there used to be Academy here - remove it
		print("onImprovementDestroyed: AcademyDestroyed");
		DisconnectManuscript( plotID, aAcademy[plotID].PlayerID );
	end
	
end
Events.SerialEventImprovementDestroyed.Add(onImprovementDestroyed)


function onPlotOwnershipChange(iHexX, iHexY)
	local plotX, plotY = ToGridFromHex(iHexX, iHexY);
	local plotID = plotX + plotY * mapMaxX;	
	
	if(aAcademy[plotID]) then
		print("onPlotOwnershipChange: Academy Ownership hac changed");
		DisconnectManuscript( plotID, aAcademy[plotID].PlayerID );
		local pPlot = Map.GetPlot(ToGridFromHex(iHexX, iHexY));
		if(pPlot) then
			local newOwner = pPlot:GetOwner();
			ConnectManuscript( plotID, newOwner );
		else
			print("ERROR inAcademyControl: Map.GetPlot returned nil");
		end
	end
	
end
Events.SerialEventHexCultureChanged.Add(onPlotOwnershipChange)

--Events.SerialEventCityCaptured.Add(CityCultureOnCapture)


function ConnectManuscript( plotID, playerID )
	
	local pPlayer = Players[playerID];
	local iResourceID = GameInfoTypes.RESOURCE_MANUSCRIPT;
	local iResourceNum = 1;

	if(pPlayer) then
		pPlayer:ChangeNumResourceTotal(iResourceID, iResourceNum);
	end

	--register/update mine status
	aAcademy[plotID] = {};
	aAcademy[plotID].PlayerID = playerID;
	updateSaveData(plotID);
	
	print("Connected resource ", iResourceID, " for player ", playerID, "amount:", iResourceNum);
end


function DisconnectManuscript( plotID, playerID )

	local pPlayer = Players[playerID];
	local iResourceID = GameInfoTypes.RESOURCE_MANUSCRIPT;
	local iResourceNum = 1;

	if(pPlayer) then
		pPlayer:ChangeNumResourceTotal(iResourceID, -iResourceNum);
	end
	
	--update Academy status
	--aAcademy[plotID].PlayerID = false;
	aAcademy[plotID] = nil;
	updateSaveData(plotID);
	
	print("Disconnected resource ", iResourceID, " for player ", playerID, "amount:", iResourceNum);
end


function updateSaveData(plotID)
	local pPlayer = Players[Game.GetActivePlayer()];
	save( pPlayer, plotID, aAcademy[plotID] );
end


function loadSaveData()
	local pPlayer = Players[Game.GetActivePlayer()];
	local wholeTable = load( pPlayer );
	for plotID, v in pairs(wholeTable) do
		print("plotID:",plotID);
		for ii,kk in pairs(v) do
			print(ii,kk);
		end
		
		aAcademy[plotID] = v;
		
	end
end
loadSaveData();	--call on startup
