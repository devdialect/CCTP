-- ResourceEraUpdate
-- Author: Richard
-- DateCreated: 10/2/2014 3:36:20 PM
--------------------------------------------------------------
g_OneTime = {};

function UpdateResources(iPlayer, iEra)
print("ResourceUpdate");
	local pPlayer = Players[iPlayer];
	if g_OneTime[iEra] == 1 then return end
	local ramount = 0
	--local eratype = pPlayer:GetCurrentEra();
	print("era", iEra);
		
		if iEra == 1 then ramount = 1;
		elseif iEra == 2 then ramount = 1;
		elseif iEra == 3 then ramount = 1;
		elseif iEra == 4 then ramount = 1;
		elseif iEra == 5 then ramount = 1;
		elseif iEra == 6 then ramount = 1;
		elseif iEra == 7 then ramount = 1;
		elseif iEra == 8 then ramount = 1;
		else ramount = 1;
		end
		
		for iPlot = 0, Map.GetNumPlots() - 1 do
			local plot = Map.GetPlotByIndex(iPlot)
			local tResource = plot:GetResourceType()
			local nResource = plot:GetNumResource()
			if nResource == nil then nResource = 0 end
				if ( nResource > 1 ) then
				
					print("nResource:", nResource);				
					nResource = nResource + ramount;
					plot:SetNumResource(nResource);
					print("nResource2", nResource);
				end			
		end
		if ramount > 0 then
		g_OneTime[iEra] = 1
		end
end
Events.SerialEventEraChanged.Add(UpdateResources)	

function SpawnRandomResourceCheck()

	local iTurn = Game.GetGameTurn()
	if ( iCounterR == iTurn ) then		 
		iCounterR = iTurn + Game.Rand(tRand, "Random Turn Count");
		print("icount", iCounterR);
		for id, area in Map.Areas() do
			if (area:IsWater() == false) then
				local bestPlot = nil;
				local iValue = 0;				
				local GridX, GridY = Map.GetGridSize();
				for iX = 0, GridX do
					for iY = 0, GridX do
						local plot = Map.GetPlot(iX, iY);
						if (plot ~= nil) and (plot:GetResourceType(-1) == -1) then
							if (plot:GetArea() == area:GetID()) then
								if (plot:HasBarbarianCamp() == false and plot:IsCity() == false and plot:IsUnit() == false and plot:IsMountain() == false and plot:IsOwned() == false) then
									iValue = Game.Rand(2000, "Resource Plot Selection");
									if (iValue > iBestValue) then
									bestPlot = plot;
									print ("plot", bestPlot);
									print("iValue1,iBestValue1", iValue, iBestValue);
									end
								end
							end
						end
					end
				end
			
	

				if (bestPlot ~= nil) then
				print ("plot2", bestPlot);
					local iValue = 0;
					local pResource = nil;
					local rRand = 1 + Game.Rand(7, "Choosing random resource");
					print("rrand", rRand);
					for row in GameInfo.Resources() do
						if (row.Spawn == rRand) then
							pResource = row.ID
							print("pres", pResource);
							iValue = Game.Rand(2500, "Resource Plot Selection");	
							if (iValue > iBestValue) then
							rNum = 1 + Game.Rand(11, "Resource Amount");
							bestPlot:SetResourceType(pResource, rNum);
							bestPlot:SetNumResource(rNum);	
							print("iValue2,iBestValue2", iValue, iBestValue);
							print("res", pResource, rNum);

							end
						end
					end
				end
			end	
		end
		iBestValue = iBestValue - 1;
		tRand = tRand + 1;
		print("iBestValue3", iBestValue);
	end	
end

GameEvents.PlayerDoTurn.Add(SpawnRandomResourceCheck)
function Init()

iCounterR = Game.GetGameTurn() + (Game.Rand(50, "Random Turn Count") +1);
 iBestValue = 1750;
 tRand = 25
 print("icount", iCounterR);
end

Init();