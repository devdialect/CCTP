--Extra Panel
--------------------------------------------------------------

include ( "IconSupport" );
include ( "InstanceManager" );
include ( "SupportFunctions" );

--------------------------------------------------------------


--------------------------------------------------------------
--------------------------------------------------------------


--------------------------------------------------------------




function UpdateGBData()

	local iPlayer = Game.GetActivePlayer();

	local pPlayer = Players[iPlayer];
	local pTeam = Teams[pPlayer:GetTeam()];
	local pCity = UI.GetHeadSelectedCity();

	local iNumCivsMet = pTeam:GetHasMetCivCount(false);
	local iMajorMetCount = pTeam:GetHasMetCivCount(true);
	local iMinorMetCount = iNumCivsMet - iMajorMetCount;

	local bIsResearchAgreementAllowed = pTeam:IsResearchAgreementTradingAllowed();
		
	Controls.BottomPanelInfoStack:SetHide(false);
	
		
	if (pPlayer:GetNumCities() > 0) then	
			
	

		-----------------------------
			-- Update Resources
			-----------------------------
			local pResource;
			local bShowResource;
			local iNumAvailable;
			local iNumUsed;
			local iNumTotal;
			
			local strResourceText = "";
			local strTempText = "";
			
			for pResource in GameInfo.Resources() do
				local iResourceLoop = pResource.ID;
				
				if (Game.GetResourceUsageType(iResourceLoop) == ResourceUsageTypes.RESOURCEUSAGE_STRATEGIC) then
					
					bShowResource = false;
					
					if (pTeam:GetTeamTechs():HasTech(GameInfoTypes[pResource.TechReveal])) then
						if (pTeam:GetTeamTechs():HasTech(GameInfoTypes[pResource.TechCityTrade])) then
							bShowResource = true;
						end
					end
					
					iNumAvailable = pPlayer:GetNumResourceAvailable(iResourceLoop, true);
					iNumUsed = pPlayer:GetNumResourceUsed(iResourceLoop);
					iNumTotal = pPlayer:GetNumResourceTotal(iResourceLoop, true);
					
					if (iNumUsed > 0) then
						bShowResource = true;
					end
							
					if (bShowResource) then
						local text = Locale.ConvertTextKey(pResource.IconString);
						strTempText = string.format("%i %s   ", iNumAvailable, text);
						
						-- Colorize for amount available
						if (iNumAvailable > 0) then
							strTempText = "[COLOR_POSITIVE_TEXT]" .. strTempText .. "[ENDCOLOR]";
						elseif (iNumAvailable < 0) then
							strTempText = "[COLOR_WARNING_TEXT]" .. strTempText .. "[ENDCOLOR]";
						end
						
						strResourceText = strResourceText .. strTempText;
					end
				end
			end
			
			Controls.ResourceString:SetText(strResourceText);
	end
end

--------------------------------------------------------------
--------------------------------------------------------------

function GetPlayer (iPlayerID)
	if (iPlayerID < 0) then
		return nil;
	end

	if (Players[iPlayerID]:IsHuman()) then
		return nil;
	end;

	return Players[iPlayerID];
end

--------------------------------------------------------------
--------------------------------------------------------------


--------------------------------------------------------------

function OnBottomPanelDirty()


	UpdateGBData();

	
end

-------------------------------------------------


function OnEnterCityScreen()
	
	ContextPtr:SetHide(true);

end

Events.SerialEventEnterCityScreen.Add(OnEnterCityScreen);

----------------------------

function OnExitCityScreen()

	ContextPtr:SetHide(false)

end

Events.SerialEventExitCityScreen.Add(OnExitCityScreen)

----------------------------

function OnTurnEndUpdate()

	ContextPtr:SetHide(true);

end



----------------------------

function OnTurnStartResume()

	ContextPtr:SetHide(false);

end



----------------------------



----------------------------

function BPTooltip()

	Controls.ResourceString:SetToolTipCallback( ResourcesTipHandler );
end

local tipControlTable = {};
TTManager:GetTypeControlTable( "TooltipTypeBottomPanel", tipControlTable );

----------------------------
-- Resources Tooltip
function ResourcesTipHandler( control )

	local strText;
	local iPlayerID = Game.GetActivePlayer();
	local pPlayer = Players[iPlayerID];
	local pTeam = Teams[pPlayer:GetTeam()];
	local pCity = UI.GetHeadSelectedCity();
	
	strText = "";
	
	local pResource;
	local bShowResource;
	local bThisIsFirstResourceShown = true;
	local iNumAvailable;
	local iNumUsed;
	local iNumTotal;
	
	for pResource in GameInfo.Resources() do
		local iResourceLoop = pResource.ID;
		
		if (Game.GetResourceUsageType(iResourceLoop) == ResourceUsageTypes.RESOURCEUSAGE_STRATEGIC) then
			
			bShowResource = false;
			
			if (pTeam:GetTeamTechs():HasTech(GameInfoTypes[pResource.TechReveal])) then
				if (pTeam:GetTeamTechs():HasTech(GameInfoTypes[pResource.TechCityTrade])) then
					bShowResource = true;
				end
			end
			
			if (bShowResource) then
				iNumAvailable = pPlayer:GetNumResourceAvailable(iResourceLoop, true);
				iNumUsed = pPlayer:GetNumResourceUsed(iResourceLoop);
				iNumTotal = pPlayer:GetNumResourceTotal(iResourceLoop, true);
				
				-- Add newline to the front of all entries that AREN'T the first
				if (bThisIsFirstResourceShown) then
					strText = "";
					bThisIsFirstResourceShown = false;
				else
					strText = strText .. "[NEWLINE][NEWLINE]";
				end
				
				strText = strText .. iNumAvailable .. " " .. pResource.IconString .. " " .. Locale.ConvertTextKey(pResource.Description);
				
				-- Details
				if (iNumUsed ~= 0 or iNumTotal ~= 0) then
					strText = strText .. ": ";
					strText = strText .. Locale.ConvertTextKey("TXT_KEY_TP_RESOURCE_INFO", iNumTotal, iNumUsed);
				end
			end
		end
	end
	
	print(strText);
	if(strText ~= "") then
		tipControlTable.BottomPanelMouseover:SetHide(false);
		tipControlTable.TooltipLabel:SetText( strText );
	else
		tipControlTable.BottomPanelMouseover:SetHide(true);
	end
    
    -- Autosize tooltip
    tipControlTable.BottomPanelMouseover:DoAutoSize();
	
end

--------------------------------------------------------------
--------------------------------------------------------------
--------------------------------------------------------------

Events.SerialEventGameDataDirty.Add(OnBottomPanelDirty);
Events.SerialEventTurnTimerDirty.Add(OnBottomPanelDirty);
Events.SerialEventCityInfoDirty.Add(OnBottomPanelDirty);

UpdateGBData();
BPTooltip();
