-- LaborSpecialist
-- Author: Based on code by FramedArchitecture
-- DateCreated: 9/27/2014 2:41:43 PM
--------------------------------------------------------------

--------------------------------------------------------------
MapModData.g_Properties		= MapModData.g_Properties or {}
g_Properties				= MapModData.g_Properties;
g_Properties.LaborSpecialist = false
--------------------------------------------------------------
LuaEvents.Player =	LuaEvents.Player	or function(player)	 end

--------------------------------------------------------------
local iResourceID = GameInfoTypes["RESOURCE_MANPOWER"];
local pResourceID = GameInfoTypes["RESOURCE_OLDYIELD"];
local manpowerYieldType		= GameInfo.Yields["YIELD_LABOR"].Type
--------------------------------------------------------------
function UpdateManpowerFromSpecialists(iPlayer)	
	if oldYield == nil then oldYield = 0 end
	print("oldYield1", oldYield);
	if laborSpec == nil then laborSpec = 0 end	
	local pPlayer = Players[iPlayer]
	if not pPlayer:IsAlive() then return end
	if pPlayer:IsMinorCiv() then return end
	if pPlayer:IsBarbarian() then return end
	local iManpower = GetSpecialistManpowerMod(pPlayer);
	local oldYield = pPlayer:GetNumResourceAvailable(pResourceID);
	print("oldYield", oldYield);
	print("laborSpec", laborSpec);
	if ( iManpower >= 0 ) then	
		print("doingm");
		addManpower = iManpower - oldYield;	
		pPlayer:ChangeNumResourceTotal(iResourceID, addManpower);		
		pPlayer:ChangeNumResourceTotal(pResourceID, addManpower);
	
		print(pPlayer:GetName(), addManpower, laborSpec,oldYield );
	end
	
end
GameEvents.PlayerDoTurn.Add( UpdateManpowerFromSpecialists )
--------------------------------------------------------------

function GetSpecialistManpowerMod(pPlayer)	
	local iManpower = 0;
	local ramount = EraYieldLabor(pPlayer);
	for pSpecialistInfo in GameInfo.Specialists() do	
		if (pSpecialistInfo.Type == "SPECIALIST_LABORER") then
			for pCity in pPlayer:Cities() do	
				local iCount = pCity:GetSpecialistCount( GameInfoTypes[pSpecialistInfo.Type] )
				if iCount >  0 then
					for row in GameInfo.SpecialistYields() do
						if row.YieldType == manpowerYieldType then
						print("yield", row.Yield);
						mYield = (row.Yield + ramount)
						print("mYield", mYield);
						iManpower = iManpower + (iCount * mYield)
							
						end
						 
					end			
				end					
			end
			
		end
	end		
	print("iManpower", iManpower);
	
	return iManpower;
	
end
LuaEvents.Player.Add( GetSpecialistManpowerMod )

--------------------------------------------------------------------
function EraYieldLabor(pPlayer)
	
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

function InitLaborSpecialist()
	for row in GameInfo.SpecialistYields() do
		if row.YieldType == "YIELD_LABOR" then
			g_Properties.LaborSpecialist = true
			print("InitLAborSpecialist()")
			break;
		end
	end
end
--------------------------------------------------------------
InitLaborSpecialist();
