-- Global_Warming
-- Author: FramedArchitecture
-- DateCreated: 11/9/2012
--------------------------------------------------------------
include("GlobalWarmingOptions.lua")
include("GlobalWarmingUtilities.lua")

print("---------------------------------")
print("--- Global Warming Mod Loaded ---")
print("---------------------------------")

gWarmingIndex = 0

local iWarmingInitialized = nil
local iCounter = 0

function GlobalEraCheck(iEra, iPlayer)
	if (iWarmingInitialized == 0) then
		if ( iEra == GameInfoTypes[EraThreshold]) then	
			iWarmingInitialized = 1
			print("-- Global Warming Initialized by Era --")

			gWarmingIndex = GetGlobalWarmingIndex()
			print("-- Calculated GWI: " ..gWarmingIndex)
	
			iCounter = Game.GetGameTurn() + IndexRecalcTurn
			print("-- Next Recalc Turn: " ..iCounter)

			-- Notification
			local text;
			local heading;
			local player = Players[Game.GetActivePlayer()];
			local eraName = Locale.ConvertTextKey(GameInfo.Eras[EraThreshold].Description)
			if ( player ~= nil ) then
				text = Locale.ConvertTextKey("TXT_KEY_GW_ERANOTIFY", eraName);
				heading = Locale.ConvertTextKey("TXT_KEY_GW_ERANOTIFY_SHORT");
     			player:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, text, heading, -1, -1); 
			end
		end
	end
end
Events.SerialEventEraChanged.Add(GlobalEraCheck)

function GlobalWarmingTurn(iPlayer)
	
	if (iPlayer > 0) then return false end

	if ( iWarmingInitialized == 1 ) then
		local iTurn = Game.GetGameTurn()

		if ( iCounter == iTurn ) then	
			gWarmingIndex = GetGlobalWarmingIndex()
			iCounter = iTurn + IndexRecalcTurn
		end

		local iRand = Game.Rand(100, "Choosing Global Warming Effect");
		print("iRand: " ..iRand)
		print("GWI: " ..gWarmingIndex)

		if ( iRand < gWarmingIndex ) then
			
			if ( iRand < 25 ) then
				if ( CoolingIce ) then
					IceMelt();
				else 
					LandWarm();
				end

			elseif ( iRand < 50 ) then
				LandWarm();

			elseif ( iRand < 75 ) then
				CoastalFlood();

			else
				HurricaneEvent();
			end

		end
	end
end
GameEvents.PlayerDoTurn.Add(GlobalWarmingTurn)

if (iWarmingInitialized == nil) then
	local eraID = GameInfo.Eras[EraThreshold].ID

	if eraID then
		
		iWarmingInitialized = 0

		if (  Game.GetCurrentEra() >= eraID ) then
			iWarmingInitialized = 1
			iCounter = Game.GetGameTurn() + 1
			print("-- Game meets EraThreshold on Initialize --")
		end	

		print("-- Global Warming Initialized --")
	else
		print("-- Global Warming Aborted: Invalid EraThreshold --")
	end
	
end




