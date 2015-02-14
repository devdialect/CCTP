MapModData.leaderTitles = MapModData.leaderTitles or {}

include( "CustomNotification.lua" );

print("Spawn started");


function SpawnUnits( iPlayer )
	if (Players[iPlayer]:IsBarbarian() == false) then
		return;
	end

	if (Game:GetNumCivCities() < Game:CountCivPlayersAlive()) then
		return;
	end

	for id, area in Map.Areas() do
		if (area:IsWater() == false) then
			local iNeededAliens = ((area:GetNumUnownedTiles() / GameDefines.UNOWNED_TILES_PER_GAME_ALIEN) - area:GetUnitsPerPlayer(iPlayer));
			if (iNeededAliens > 0) then
				iNeededAliens = ((iNeededAliens / 5) + 1);
				for iAlien = 0, iNeededAliens do
					local bestPlot = nil;
					local iValue = 0;
					local iBestValue = 0;
					local GridX, GridY = Map.GetGridSize();
					for iX = 0, GridX do
						for iY = 0, GridX do
							local plot = Map.GetPlot(iX, iY);
							if (plot ~= nil) then
								if (plot:GetArea() == area:GetID()) then
									if (plot:HasBarbarianCamp() == false and plot:IsCity() == false and plot:IsUnit() == false and plot:IsMountain() == false and plot:IsOwned() == false) then
										iValue = 1 + Map.Rand(1000, "Spawn Plot Selection");
										if (iValue > iBestValue) then
											bestPlot = plot;
											iBestValue = iValue;

										end
									end
								end
							end
						end
					end
					if (bestPlot ~= nil) then
						if bestPlot:GetFeatureType() ~= -1 and(GameInfo.Features[bestPlot:GetFeatureType()].NaturalWonder) then
						return
						end
						local bestUnit = nil;						
						local iValue = 0;
						local spwnrate = 0;	

								local pOtherPlayer = Players[0];
								local eratype = pOtherPlayer:GetCurrentEra();
								
									if eratype == 0 then
									spwnrate = 410;
									elseif eratype == 1 then
									spwnrate = 415;
									elseif eratype == 2 then
									spwnrate = 420;
									elseif eratype == 3 then
									spwnrate = 430;
									elseif eratype == 4 then
									spwnrate = 435;
									elseif eratype == 5 then
									spwnrate = 440;
									elseif eratype == 6 then
									spwnrate = 450;
									elseif eratype == 7 then
									spwnrate = 475;	
									elseif eratype == 8 then
									spwnrate = 500;	
									end
									iValue = Map.Rand(spwnrate, "Spawn Unit Selection");
									local iRandUnit = math.random(1, 4);
									print("unit", iRandUnit);
									for row in GameInfo.Units() do
										if (row.EraSpawn == eratype) then	
											if eratype < 7 then
												if (row.Spawn == 1) then
													bestUnit = row.ID;
												end
											elseif eratype >= 7 then
												if (row.Spawn == iRandUnit) then
												bestUnit = row.ID;
												end
											end
										end
									end
						
						local pOtherPlayer = Players[0];
						local eratype = pOtherPlayer:GetCurrentEra();	
						--print("spwnrate", spwnrate);
						--print("eratype", eratype);
						--print("iPlayer", iPlayer);
						--print("Spawn Spawn chance", iValue);
						--print("Spawn unit", bestUnit);
						if (iValue > 400) and (bestUnit ~= nil) then
						local iX = bestPlot:GetX();
						local iY = bestPlot:GetY()
							Players[iPlayer]:InitUnit(bestUnit, iX, iY);
								if eratype >= 7 then
									if (bestPlot:IsVisible(pOtherPlayer:GetTeam(), false)) then
									text = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_SUMMARY_ALIEN");
									heading = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_ALIEN");
									pOtherPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, text, heading, iX, iY);
									end
								end						
						end	
																			
							
									
					end
				end
			end
		end
	end
end

GameEvents.PlayerDoTurn.Add( SpawnUnits );
