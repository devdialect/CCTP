-------------------------------------------------
-- Economic
-------------------------------------------------

include( "IconSupport" );

local m_CurrentPanel = Controls.EconomicGeneralInfo;

-------------------------------------------------
-- On Popup
-------------------------------------------------
function OnPopup( popupInfo )
	if( popupInfo.Type == ButtonPopupTypes.BUTTONPOPUP_ECONOMIC_OVERVIEW ) then
		m_PopupInfo = popupInfo;
		
		if( m_PopupInfo.Data1 == 1 ) then
        	if( ContextPtr:IsHidden() == false ) then
        	    OnClose();
        	    return;
    	    else
            	UIManager:QueuePopup( ContextPtr, PopupPriority.InGameUtmost );
        	end
    	else
        	UIManager:QueuePopup( ContextPtr, PopupPriority.EconOverview );
    	end
	end
end
Events.SerialEventGameMessagePopup.Add( OnPopup );

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
function OnClose()
    UIManager:DequeuePopup( ContextPtr );
end
Controls.CloseButton:RegisterCallback( Mouse.eLClick, OnClose);


-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
function InputHandler( uiMsg, wParam, lParam )
    if uiMsg == KeyEvents.KeyDown then
        if wParam == Keys.VK_ESCAPE or wParam == Keys.VK_RETURN then
            OnClose();
            return true;
        end
    end
end
ContextPtr:SetInputHandler( InputHandler );


-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
function ShowHideHandler( bIsHide, bInitState )
    local pPlayer = Players[ Game.GetActivePlayer() ];
    if( pPlayer == nil ) then
        print( "Could not get player... huh?" );
        return;
    end
    
	-- Set Civ Icon
	CivIconHookup( Game.GetActivePlayer(), 64, Controls.CivIcon, Controls.CivIconBG, Controls.CivIconShadow, false, true );
	
    if( not bInitState ) then
        if( not bIsHide ) then
        	UI.incTurnTimerSemaphore();
        	
        	-- trigger the show/hide handler to update state
        	m_CurrentPanel:SetHide( false );
        	
        	Events.SerialEventGameMessagePopupShown(m_PopupInfo);
        else
            UI.decTurnTimerSemaphore();
            Events.SerialEventGameMessagePopupProcessed.CallImmediate(ButtonPopupTypes.BUTTONPOPUP_ECONOMIC_OVERVIEW, 0);
        end
    end
end
ContextPtr:SetShowHideHandler( ShowHideHandler );


-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
function OnGeneralInfoButton()
	
		-- Set Tabs
		Controls.GeneralInfoSelectHighlight:SetHide(false);
		Controls.HappinessSelectHighlight:SetHide(true);
		Controls.TaxSelectHighlight:SetHide(true);
		-- Set Panels
		Controls.EconomicGeneralInfo:SetHide( false );
		Controls.HappinessInfo:SetHide( true );
		Controls.TaxPopUp:SetHide( true );
		m_CurrentPanel = Controls.EconomicGeneralInfo;
end
Controls.GeneralInfoButton:RegisterCallback( Mouse.eLClick, OnGeneralInfoButton );


-------------------------------------------------------------------------------
function OnTaxRate()
	local pHumanPlayer = Players[0];
	local pTeam = Teams[pHumanPlayer:GetTeam()];
	if(Game.GetCustomOption("GAMEOPTION_CCTP_EVENTS") == 0) then
	return;
	end
	if (pTeam:IsHasTech(GameInfoTypes["TECH_TAXES"])) then
		-- Set Tabs
		Controls.GeneralInfoSelectHighlight:SetHide(true);
		Controls.HappinessSelectHighlight:SetHide(true);
		Controls.TaxSelectHighlight:SetHide(false);
		-- Set Panels
		Controls.EconomicGeneralInfo:SetHide( true );
		Controls.HappinessInfo:SetHide( true );
		Controls.TaxPopUp:SetHide( false );
		m_CurrentPanel = Controls.TaxPopUp;
	end
end
Controls.TaxButton:RegisterCallback( Mouse.eLClick, OnTaxRate );






-------------------------------------------------------------------------------
function OnHappinessButton()
	-- Set Tabs
	Controls.GeneralInfoSelectHighlight:SetHide(true);
	Controls.HappinessSelectHighlight:SetHide(false);
	Controls.TaxSelectHighlight:SetHide(true);
	-- Set Panels
    Controls.EconomicGeneralInfo:SetHide( true );
    Controls.HappinessInfo:SetHide( false );
	Controls.TaxPopUp:SetHide( true );
    m_CurrentPanel = Controls.HappinessInfo;
end
Controls.HappinessButton:RegisterCallback( Mouse.eLClick, OnHappinessButton );


OnGeneralInfoButton();

-- Disable Happiness section if Happiness is turned off.
if (Game.IsOption(GameOptionTypes.GAMEOPTION_NO_HAPPINESS)) then
	Controls.HappinessButton:SetDisabled(true);
	Controls.HappinessButton:LocalizeAndSetToolTip("TXT_KEY_TOP_PANEL_HAPPINESS_OFF_TOOLTIP");
end




----------------------------------------------------------------
-- 'Active' (local human) player has changed
----------------------------------------------------------------
Events.GameplaySetActivePlayer.Add(OnClose);
