-- EnergySpecialist
-- Author: Based on code by FramedArchitecture
-- DateCreated: 9/27/2014 2:41:43 PM
--------------------------------------------------------------

--------------------------------------------------------------
MapModData.g_Properties		= MapModData.g_Properties or {}
g_Properties				= MapModData.g_Properties;
g_Properties.EnergySpecialist = false
--------------------------------------------------------------
LuaEvents.Player =	LuaEvents.Player	or function(player)	 end

--------------------------------------------------------------
local iResourceID = GameInfoTypes["RESOURCE_ELECTRICITY"];
local pResourceID = GameInfoTypes["RESOURCE_ENERGYYIELD"];
local energyYieldType		= GameInfo.Yields["YIELD_ENERGY"].Type

--------------------------------------------------------------
function UpdateEnergyFromSpecialists(iPlayer)	

	if oldEnergy == nil then oldEnergy = 0 end
	print("oldEnergy1", oldEnergy);
	local pPlayer = Players[iPlayer]
	if not pPlayer:IsAlive() then return end
	if pPlayer:IsMinorCiv() then return end
	if pPlayer:IsBarbarian() then return end
	local iEnergy = GetSpecialistEnergyMod(pPlayer);
	local oldEnergy = pPlayer:GetNumResourceAvailable(pResourceID);
	local pElec = pPlayer:GetNumResourceAvailable(iResourceID);
	print("oldEnergy", oldEnergy);
	if ( iEnergy >= 0 ) then		
		addEnergy = iEnergy - oldEnergy;	
		pPlayer:ChangeNumResourceTotal(iResourceID, addEnergy);		
		pPlayer:ChangeNumResourceTotal(pResourceID, addEnergy);	
			
	
		print(pPlayer:GetName(), addEnergy, oldEnergy, "ELEC", pElec );
	end
	
end
GameEvents.PlayerDoTurn.Add( UpdateEnergyFromSpecialists )
--------------------------------------------------------------

function GetSpecialistEnergyMod(pPlayer)	
	local iEnergy = 0;
	local ramount = EraYieldEnergy(pPlayer);
	for eSpecialistInfo in GameInfo.Specialists() do	
		if (eSpecialistInfo.Type == "SPECIALIST_ENERGY") then
			for pCity in pPlayer:Cities() do	
				local iCount = pCity:GetSpecialistCount( GameInfoTypes[eSpecialistInfo.Type] )
				if iCount >  0 then
					for row in GameInfo.SpecialistYields() do
						if row.YieldType == energyYieldType then
						print("yield", row.Yield);
						eYield = (row.Yield + ramount)
						print("eYield", eYield);
						iEnergy = iEnergy + (iCount * eYield)
							
						end
						 
					end			
				end					
			end
			
		end
	end		
	print("iEnergy", iEnergy);
	
	return iEnergy;
	
end
LuaEvents.Player.Add( GetSpecialistEnergyMod )


--------------------------------------------------------------
function EraYieldEnergy(pPlayer)
	local eratype = pPlayer:GetCurrentEra();
	print("era", eratype);
	if eratype == 1 then ramount = 1;
	elseif eratype == 2 then ramount = 1;
	elseif eratype == 3 then ramount = 1;
	elseif eratype == 4 then ramount = 1;
	elseif eratype == 5 then ramount = 1;
	elseif eratype == 6 then ramount = 1;
	elseif eratype == 7 then ramount = 1;
	elseif eratype == 8 then ramount = 1;
	else ramount = 0;
	end

	return ramount;
end
--------------------------------------------------------------------
function InitEnergySpecialist()
	for row in GameInfo.SpecialistYields() do
		if row.YieldType == "YIELD_ENERGY" then
			g_Properties.EnergySpecialist = true
			print("InitEnergySpecialist()")
			break;
		end
	end
end
--------------------------------------------------------------
InitEnergySpecialist();
