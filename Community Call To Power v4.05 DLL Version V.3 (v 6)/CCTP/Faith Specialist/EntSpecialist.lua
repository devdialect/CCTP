-- EntSpecialist
-- Author: Gyogen
-- DateCreated: 10/2/2014 6:48:39 AM
--------------------------------------------------------------
LuaEvents.Player =	LuaEvents.Player	or function(player)	 end
--------------------------------------------------------------
local pResourceID = GameInfoTypes["RESOURCE_HAPPYYIELD"];
local iResourceID = GameInfoTypes["RESOURCE_HAPPYYIELDB"];
local happyYieldType		= GameInfo.Yields["YIELD_HAPPY"].Type

--------------------------------------------------------------

function UpdateEntFromSpecialists(iPlayer)	
	local iHappy = 0;
	if oldHappy == nil then oldHappy = 0 end
	print("oldHappy1", oldHappy);
	local pPlayer = Players[iPlayer]
	if not pPlayer:IsAlive() then return end
	if pPlayer:IsMinorCiv() then return end
	if pPlayer:IsBarbarian() then return end
	local pHappyB = pPlayer:GetNumResourceAvailable(iResourceID);
	local oldHappy = pPlayer:GetNumResourceAvailable(pResourceID);
	
	for eSpecialistInfo in GameInfo.Specialists() do	
		if (eSpecialistInfo.Type == "SPECIALIST_ENTERTAINER") then
			for pCity in pPlayer:Cities() do	
				local iCount = pCity:GetSpecialistCount( GameInfoTypes[eSpecialistInfo.Type] )
				if iCount >  0 then
					for row in GameInfo.SpecialistYields() do
						if row.YieldType == happyYieldType then
						print("yield", row.Yield);
						iHappy = iHappy + (iCount * row.Yield)
													
						end						 
					end
				end			
					if ( iHappy >= 0 ) then	
						addHappy = iHappy - oldHappy;						
						pCity:SetNumRealBuilding(GameInfoTypes["BUILDING_ENERGY_DUMMY"], addHappy);	
						pPlayer:ChangeNumResourceTotal(iResourceID, addEnergy);		
						pPlayer:ChangeNumResourceTotal(pResourceID, addEnergy);	
						print(pPlayer:GetName(), addHappy, oldHappy, iHappy );
					end								
			end
			
		end
	end		
	print("iHappy", iHappy);
	
	return iHappy;
	
end
GameEvents.PlayerDoTurn.Add( UpdateEntFromSpecialists )


--------------------------------------------------------------