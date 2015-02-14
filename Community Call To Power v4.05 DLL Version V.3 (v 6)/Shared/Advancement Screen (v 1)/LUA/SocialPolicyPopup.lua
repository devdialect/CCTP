-- SocialPolicyPopup
-- Author: Eric "Jheral" Lindroth
--------------------------------------------------------------

include( "IconSupport" );
include( "InstanceManager" );
include( "CommonBehaviors" );
include( "FLuaVector" );

local m_PopupInfo = nil;

local g_PolicyPipeManager = InstanceManager:new( "ConnectorPipe", "ConnectorImage", Controls.PolicyPanel );
local g_PolicyInstanceManager = InstanceManager:new( "PolicyButton", "PolicyIcon", Controls.PolicyPanel );

local g_BranchInstanceManager = InstanceManager:new( "BranchButtonInstance", "BranchButton", Controls.BranchStack );

local g_TabInstanceManager = InstanceManager:new( "TabButtonInstance", "TabButton", Controls.TabPanel );

local fullColor		= {x = 1, y = 1, z = 1, w = 1	};
local fadeColor		= {x = 1, y = 1, z = 1, w = 0	};
local fadeColorRV	= {x = 1, y = 1, z = 1, w = 0.2	};
local pinkColor		= {x = 2, y = 0, z = 2, w = 1	};

local lockTexture	= "48Lock.dds";
local checkTexture	= "48Checked.dds";

local hTexture = "Connect_H.dds";
local vTexture = "Connect_V.dds";

local topRightTexture		= "Connect_JonCurve_TopRight.dds";
local topLeftTexture		= "Connect_JonCurve_TopLeft.dds";
local bottomRightTexture	= "Connect_JonCurve_BottomRight.dds";
local bottomLeftTexture		= "Connect_JonCurve_BottomLeft.dds";

local g_PolicyXOffset = 28;
local g_PolicyYOffset = 68;

local g_PolicyPipeXOffset = 28;
local g_PolicyPipeYOffset = 68;

local m_gPolicyID;
local m_gAdoptingPolicy;

local bShowAllTenets = false;

local currentView = {
	["Class"] = nil,
	["Style"] = nil,
	["Branch"] = nil,
};

tableTabs = {};
tableBranches = {};
tableTabButtons = {};
tableBranchButtons = {};
tablePolicies = {};

g_IdeologyBackgrounds = {
	-- Should this be dynamically generated?
	[0] = "PolicyBranch_Ideology.dds",
	POLICY_BRANCH_AUTOCRACY = "SocialPoliciesAutocracy.dds",
	POLICY_BRANCH_FREEDOM = "SocialPoliciesFreedom.dds",
	POLICY_BRANCH_ORDER = "SocialPoliciesOrder.dds",
};
----------------------------------------------------------------        
-- Key Down Processing
----------------------------------------------------------------    
function InputHandler( uiMsg, wParam, lParam )      
    if uiMsg == KeyEvents.KeyDown then
        if (wParam == Keys.VK_RETURN or wParam == Keys.VK_ESCAPE) then
			if Controls.PolicyConfirm:IsHidden() == false then
				Controls.PolicyConfirm:SetHide(true);
				Controls.BGBlock:SetHide(false);
			else
				OnClose();
			end
			return true;
        end
    end
end
ContextPtr:SetInputHandler( InputHandler );

-------------------------------------------------
-- On Close
-- Closes the Popup or the whole window
-------------------------------------------------
function OnClose()
    UIManager:DequeuePopup( ContextPtr );
end
Controls.CloseButton:RegisterCallback( Mouse.eLClick, OnClose );

---------------------------------------------------
---- Diplo Corner Hook
---------------------------------------------------
--function OnAdditionalInformationDropdownGatherEntries(additionalEntries)
--        table.insert(additionalEntries, {
--                text=Locale.ConvertTextKey('TXT_KEY_ADVANCEMENTS_SCREEN'),
--                call=function() 
--					currentView = {["Class"]=nil,["Style"]=nil,["Branch"]=nil}; 
--					UpdateDisplay(); 
--					UIManager:QueuePopup( ContextPtr, PopupPriority.SocialPolicy ); 
--				end
--        });
--end
--LuaEvents.AdditionalInformationDropdownGatherEntries.Add(OnAdditionalInformationDropdownGatherEntries);
--LuaEvents.RequestRefreshAdditionalInformationDropdownEntries();

-------------------------------------------------
-- Confirmation Popup
-------------------------------------------------

function OnYes( )
	Controls.PolicyConfirm:SetHide(true);
	Controls.BGBlock:SetHide(false);
	
	Network.SendUpdatePolicies(m_gPolicyID, m_gAdoptingPolicy, true);
	Events.AudioPlay2DSound("AS2D_INTERFACE_POLICY");
	UpdateDisplay();
end
Controls.Yes:RegisterCallback( Mouse.eLClick, OnYes );

function OnNo( )
	Controls.PolicyConfirm:SetHide(true);
	Controls.BGBlock:SetHide(false);
end
Controls.No:RegisterCallback( Mouse.eLClick, OnNo );

-------------------------------------------------
-- On Popup Message
-------------------------------------------------
function OnPopupMessage(popupInfo)
	local popupType = popupInfo.Type;
	if popupType == ButtonPopupTypes.BUTTONPOPUP_CHOOSEPOLICY then
		
	
	
		m_PopupInfo = popupInfo;

		UpdateDisplay();
	
		if( m_PopupInfo.Data1 == 1 ) then
			if( ContextPtr:IsHidden() == false ) then
			OnClose();
			else
				UIManager:QueuePopup( ContextPtr, PopupPriority.InGameUtmost );
			end
		else
			UIManager:QueuePopup( ContextPtr, PopupPriority.SocialPolicy );
		end
	end	
end
Events.SerialEventGameMessagePopup.Add( OnPopupMessage );

-------------------------------------------------
-- Switch Tabs
-------------------------------------------------
function SwitchTabs(iBranchClass)
	for i, button in pairs(tableTabButtons) do
		if button.TabButtonHL	~= nil then button.TabButtonHL:SetHide(true);	end
	end
	local eBranchClass = tableTabs[iBranchClass];

	--print(string.format("%s - %s", eBranchClass.Type, eBranchClass.Style));
	
	currentView.Class = eBranchClass;
	tableTabButtons[eBranchClass.Type].TabButtonHL:SetHide(false);

	if eBranchClass.Style == "SOCIAL_POLICY" then
		currentView.Style = "SOCIAL_POLICY";
		currentView.Branch = nil;
		--print("Policy Style");
	elseif eBranchClass.Style == "IDEOLOGY" then
		currentView.Style = "IDEOLOGY";
		currentView.Branch = nil;
		--print("Ideology Style");
	else
		currentView = {["Class"]=nil,["Style"]=nil,["Branch"]=nil};
		--print("Nothing Style");
	end
	UpdateDisplay();
end

-------------------------------------------------
-- Update Display
-------------------------------------------------
function UpdateDisplay() -- TODO: Make this work with ideologies
    local pPlayer = Players[Game.GetActivePlayer()];
    if pPlayer == nil then
		return;
    end
    local pTeam = Teams[pPlayer:GetTeam()];
    local playerHas1City = pPlayer:GetNumCities() > 0;
    local bShowAll = OptionsManager.GetPolicyInfo();
    local iTurns;
    local iCultureNeeded = pPlayer:GetNextPolicyCost() - pPlayer:GetJONSCulture();
    if (iCultureNeeded <= 0) then
		iTurns = 0;
    else
		if (pPlayer:GetTotalJONSCulturePerTurn() == 0) then
			iTurns = "?";
		else
			iTurns = iCultureNeeded / pPlayer:GetTotalJONSCulturePerTurn();
			iTurns = iTurns + 1;
			iTurns = math.floor(iTurns);
		end
    end

	PopulateBranchClassList();
    Controls.NextCost:LocalizeAndSetText("TXT_KEY_NEXT_POLICY_COST_LABEL", pPlayer:GetNextPolicyCost());
    Controls.CurrentCultureLabel:LocalizeAndSetText("TXT_KEY_CURRENT_CULTURE_LABEL", pPlayer:GetJONSCulture());
    Controls.CulturePerTurnLabel:LocalizeAndSetText("TXT_KEY_CULTURE_PER_TURN_LABEL", pPlayer:GetTotalJONSCulturePerTurn());
    Controls.NextPolicyTurnLabel:LocalizeAndSetText("TXT_KEY_NEXT_POLICY_TURN_LABEL", iTurns);
	
    local iNumFreePolicies = pPlayer:GetNumFreePolicies();
    if (iNumFreePolicies > 0) then
	    Controls.FreePoliciesLabel:LocalizeAndSetText( "TXT_KEY_FREE_POLICIES_LABEL", iNumFreePolicies );
	    Controls.FreePoliciesLabel:SetHide( false );
	else
	    Controls.FreePoliciesLabel:SetHide( true );
    end
    
	Controls.InfoStack:ReprocessAnchoring();
	Controls.InfoStack2:ReprocessAnchoring();
	Controls.InfoStack3:ReprocessAnchoring();
	
	if currentView.Class ~= nil then
		Controls.TenetStyle:SetHide(true);
		Controls.PolicyStyle:SetHide(true);
		--print(string.format("%s - %s", Locale.ConvertTextKey(currentView.Class.Description), currentView.Style));
		if currentView.Style == "IDEOLOGY" then
			Controls.TenetStyle:SetHide(false);
			PopulateIdeologyList(currentView.Class.Type);
			ViewIdeology(currentView.Branch);
		elseif currentView.Style == "SOCIAL_POLICY" then
			Controls.PolicyStyle:SetHide(false);
			PopulateBranchList(currentView.Class.Type);
			ViewPolicyBranch(currentView.Branch);
		end
	else
		Controls.TenetStyle:SetHide(true);
		Controls.PolicyStyle:SetHide(true);
	end
end
Events.EventPoliciesDirty.Add( UpdateDisplay );

-------------------------------------------------
-- On Show All Tenets
-------------------------------------------------
function OnShowAllTenets(bIsChecked)
	if bIsChecked then bShowAllTenets = true; else bShowAllTenets = false; end
	UpdateDisplay();
end
Controls.ShowAllCheck:RegisterCheckHandler( OnShowAllTenets );

-------------------------------------------------
-- Find Policy By ID
-------------------------------------------------
function GetPolicyByID(iBranchID)
	local i = 0;
	local policyInfo = GameInfo.Policies[i];
	while policyInfo ~= nil do
		if policyInfo.ID == iBranchID then
			return policyInfo;
		end
		i = i + 1;
		policyInfo = GameInfo.Policies[i];
	end
	return nil;
end

-------------------------------------------------
-- Get Policies
-------------------------------------------------
function GetPolicies(eBranch)
	local policies = {};

	local i = 0;
	local policyInfo = GameInfo.Policies[i];
	while policyInfo ~= nil do
		if (policyInfo.PolicyBranchType == eBranch.Type) then
			policies[policyInfo.Type] = policyInfo;
			--print(string.format("%s - %s", policyInfo.ID, policyInfo.Type));
		end
		i = i + 1;
		policyInfo = GameInfo.Policies[i];
	end
	return policies;
end

-------------------------------------------------
-- Build Policy Button
-- Builds the buttons for the policy branch's tree
-------------------------------------------------
function BuildPolicyButton(pPlayer, ePolicy, instance)
	local bIsAdopted = pPlayer:HasPolicy(ePolicy.ID);
	local bCanAdopt = pPlayer:CanAdoptPolicy(ePolicy.ID);
	local bUnlocked = pPlayer:CanAdoptPolicy(ePolicy.ID, true);
	local bBlocked = pPlayer:IsPolicyBlocked(i);

	local strTooltip = Locale.ConvertTextKey( ePolicy.Help );
	
    local playerHas1City = pPlayer:GetNumCities() > 0;
	
	local justLooking = true;
	if pPlayer:GetJONSCulture() >= pPlayer:GetNextPolicyCost() then
		justLooking = false;
	end

	-- If Player has adopted the policy
	if (bIsAdopted) then 
		instance.MouseOverContainer:SetHide( true );
		instance.PolicyIcon:SetDisabled( true );
		instance.PolicyImage:SetColor( fullColor );
		IconHookup( ePolicy.PortraitIndex, 64, ePolicy.IconAtlasAchieved, instance.PolicyImage );

	 -- if Player has no cities
	elseif (not playerHas1City) then
		instance.MouseOverContainer:SetHide( true );
		instance.PolicyIcon:SetDisabled( true );
		instance.PolicyImage:SetColor( fadeColorRV );
		IconHookup( ePolicy.PortraitIndex, 64, ePolicy.IconAtlas, instance.PolicyImage );
		-- Tooltip
		strTooltip = strTooltip .. "[NEWLINE][NEWLINE]"

	 -- if Player can Adopt the policy right now
	elseif (bCanAdopt) then
		instance.MouseOverContainer:SetHide( false );
		instance.PolicyIcon:SetDisabled( false );
		if justLooking then
			instance.PolicyImage:SetColor( fullColor );
		else
			instance.PolicyIcon:SetVoid1( i ); -- indicates policy to be chosen
			instance.PolicyImage:SetColor( fullColor );
		end
		IconHookup( ePolicy.PortraitIndex, 64, ePolicy.IconAtlas, instance.PolicyImage );
		
	-- if Player can Adopt the policy, but lacks culture
	elseif (bUnlocked) then
		instance.MouseOverContainer:SetHide( true );
		instance.PolicyIcon:SetDisabled( true );
		instance.PolicyImage:SetColor( fadeColorRV );
		IconHookup( ePolicy.PortraitIndex, 64, ePolicy.IconAtlas, instance.PolicyImage );
		-- Tooltip
		strTooltip = strTooltip .. "[NEWLINE][NEWLINE]" .. Locale.ConvertTextKey("TXT_KEY_POLICY_BRANCH_CANNOT_UNLOCK_CULTURE", pPlayer:GetNextPolicyCost());
	else
		instance.MouseOverContainer:SetHide( true );
		instance.PolicyIcon:SetDisabled( true );
		instance.PolicyImage:SetColor( fadeColorRV );
		IconHookup( ePolicy.PortraitIndex, 64, ePolicy.IconAtlas, instance.PolicyImage );
		-- Tooltip
		strTooltip = strTooltip .. "[NEWLINE][NEWLINE]" .. Locale.ConvertTextKey("TXT_KEY_POLICY_CANNOT_UNLOCK");
	end

	-- if Policy is Blocked by another Policy
	if pPlayer:IsPolicyBlocked(i) then
		instance.PolicyImage:SetColor( fadeColorRV );
		IconHookup( ePolicy.PortraitIndex, 64, ePolicy.IconAtlas, instance.PolicyImage );
				
		-- Update tooltip if we have this Policy
		if pPlayer:HasPolicy( i ) then
			strTooltip = strTooltip .. "[NEWLINE][NEWLINE]" .. Locale.ConvertTextKey("TXT_KEY_POLICY_BRANCH_BLOCKED");
		end
	end
	instance.PolicyIcon:SetToolTipString( strTooltip );

	IconHookup(ePolicy.PortraitIndex, 64, ePolicy.IconAtlas, instance.PolicyImage);
	instance.PolicyIcon:SetOffsetVal((ePolicy.GridX-1)*g_PolicyXOffset+16,(ePolicy.GridY-1)*g_PolicyYOffset+12);
	instance.PolicyIcon:SetVoid1( ePolicy.ID );
	instance.PolicyIcon:RegisterCallback( Mouse.eLClick, PolicySelected );
end

-------------------------------------------------
-- Build Tenet
-- Builds the instances for the Tenet stacks
-------------------------------------------------
function BuildTenet(pPlayer, ePolicy, instance)
	if ePolicy ~= nil and instance ~= nil then
		local bIsAdopted = pPlayer:HasPolicy(ePolicy.ID);
		local bCanAdopt = pPlayer:CanAdoptPolicy(ePolicy.ID);
		
		if bIsAdopted then
			instance.Box:SetColor({x=0.24, y=0.48, z=0.24, w=0.5});
			instance.TenetButton:SetHide(false);
		elseif bCanAdopt then
			instance.TenetButton:SetHide(false);
			instance.TenetAdoptButton:SetHide(false);
			instance.TenetAdoptButton:SetToolTipString(Locale.ConvertTextKey(ePolicy.Help));
		elseif bShowAllTenets then
			instance.TenetButton:SetHide(false);
		else
			instance.TenetButton:SetHide(true);
			return false;
		end
		
		instance.TenetLabel:LocalizeAndSetText(ePolicy.Description);
		instance.TenetButton:SetToolTipString(Locale.ConvertTextKey(ePolicy.Help));
		instance.TenetAdoptButton:SetVoid1( ePolicy.ID );
		instance.TenetAdoptButton:RegisterCallback( Mouse.eLClick, PolicySelected );
		return true;
	else
		return false;
	end
end

-------------------------------------------------
-- Build Pipe Paths
-- Builds the Pipe Connectors of the current tree,
-- indicating which policies require others
-------------------------------------------------
function BuildPipePaths( iBranchIndex )
	local eBranch = GetBranchByID(iBranchIndex);
	if eBranch == nil then
		print("Branch Index Nil Value Error - BuildPipePaths");
		return;
	end
	local PolicyTable = GetPolicies(eBranch);
	local PrereqsTable = {};
	local policyPipes = {};

	local cnxCenter = 1; 
	local cnxLeft = 2; 
	local cnxRight = 4;

	for i, row in pairs(PolicyTable) do
		policyPipes[row.Type] = 
		{
			upConnectionLeft = false;
			upConnectionRight = false;
			upConnectionCenter = false;
			upConnectionType = 0;
			downConnectionLeft = false;
			downConnectionRight = false;
			downConnectionCenter = false;
			downConnectionType = 0;
			yOffset = 0;
			policyType = row.Type;
		};
	end
	
	-- Get the prereqs that involve the policies in the active tree
	for row in GameInfo.Policy_PrereqPolicies() do
		local bValidType = false;
		local bValidPrereq = false;
		for _, policy in pairs(PolicyTable) do
			if row.PolicyType == policy.Type then
				bValidType = true;
			elseif row.PrereqPolicy == policy.Type then
				bValidPrereq = true;
			end		
		end
		if bValidPrereq and bValidType then
			table.insert(PrereqsTable, row);

		end
	end

	-- Evaluate all the pipe "bends" to make sure the right ones are being used
	for _, row in pairs(PrereqsTable) do
		local prereq = GameInfo.Policies[row.PrereqPolicy];
		local policy = GameInfo.Policies[row.PolicyType];
		if policy and prereq then
			if policy.GridX < prereq.GridX then
				policyPipes[policy.Type].upConnectionRight = true;
				policyPipes[prereq.Type].downConnectionLeft = true;
			elseif policy.GridX > prereq.GridX then
				policyPipes[policy.Type].upConnectionLeft = true;
				policyPipes[prereq.Type].downConnectionRight = true;
			else
				policyPipes[policy.Type].upConnectionCenter = true;
				policyPipes[prereq.Type].downConnectionCenter = true;
			end
			local yOffset = (policy.GridY - prereq.GridY) - 1;
			if yOffset > policyPipes[prereq.Type].yOffset then
				policyPipes[prereq.Type].yOffset = yOffset;
			end
		end
	end
	
	for pipeIndex, thisPipe in pairs(policyPipes) do
		if thisPipe.upConnectionLeft then thisPipe.upConnectionType = thisPipe.upConnectionType + cnxLeft; end 
		if thisPipe.upConnectionRight then thisPipe.upConnectionType = thisPipe.upConnectionType + cnxRight; end 
		if thisPipe.upConnectionCenter then thisPipe.upConnectionType = thisPipe.upConnectionType + cnxCenter; end 
		if thisPipe.downConnectionLeft then thisPipe.downConnectionType = thisPipe.downConnectionType + cnxLeft; end 
		if thisPipe.downConnectionRight then thisPipe.downConnectionType = thisPipe.downConnectionType + cnxRight; end 
		if thisPipe.downConnectionCenter then thisPipe.downConnectionType = thisPipe.downConnectionType + cnxCenter; end 
	end
	
	-- Draw the straight connecting pipes
	for _, prereq in pairs(PrereqsTable) do
		local currentPipe = policyPipes[prereq.PrereqPolicy];
		local currentPolicy = PolicyTable[prereq.PolicyType];
		local currentPrereq = PolicyTable[prereq.PrereqPolicy];

		if currentPolicy.GridY - currentPrereq.GridY > 1 or currentPolicy.GridY - currentPrereq.GridY < -1 then
			local xOffset = (currentPrereq.GridX-1)*g_PolicyPipeXOffset + 30;
			local pipe = g_PolicyPipeManager:GetInstance();
			local size = { x = 19; y = g_PolicyPipeYOffset*(currentPolicy.GridY - currentPrereq.GridY - 1); };
			pipe.ConnectorImage:SetOffsetVal(xOffset, (currentPrereq.GridY-1)*g_PolicyPipeYOffset + 58);
			pipe.ConnectorImage:SetTexture(vTexture);
			pipe.ConnectorImage:SetSize(size);
		end

		--Generalize this like so?
		local distance = math.abs(currentPolicy.GridX - currentPrereq.GridX);
		local xOffset = 0;
		if currentPolicy.GridX - currentPrereq.GridX > 0 then
			xOffset = (currentPrereq.GridX-1)*g_PolicyPipeXOffset + 30;
		elseif currentPolicy.GridX - currentPrereq.GridX < 0 then
			xOffset = (currentPolicy.GridX-1)*g_PolicyPipeXOffset + 30;
		end
		local pipe = g_PolicyPipeManager:GetInstance();
		local sizeX = distance*20*(1 + (distance/20));
		local size = { x = sizeX; y = 19; };
		pipe.ConnectorImage:SetOffsetVal(xOffset + 16, (currentPrereq.GridY-1 + currentPipe.yOffset)*g_PolicyPipeYOffset + 58);
		pipe.ConnectorImage:SetTexture(hTexture);
		pipe.ConnectorImage:SetSize(size);
	end
	
	-- Draw the downward bend connecting pipes
	for pipeIndex, thisPipe in pairs(policyPipes) do
		local policy = GameInfo.Policies[thisPipe.policyType];
		local xOffset = (policy.GridX-1)*g_PolicyPipeXOffset + 30;
		if thisPipe.downConnectionType >= 1 then
			
			local startPipe = g_PolicyPipeManager:GetInstance();
			startPipe.ConnectorImage:SetOffsetVal( xOffset, (policy.GridY-1)*g_PolicyPipeYOffset + 48 );
			startPipe.ConnectorImage:SetTexture(vTexture);
			
			local pipe = g_PolicyPipeManager:GetInstance();			
			if thisPipe.downConnectionType == 1 then
				pipe.ConnectorImage:SetOffsetVal( xOffset, (policy.GridY-1)*g_PolicyPipeYOffset + 58 );
				pipe.ConnectorImage:SetTexture(vTexture);
			elseif thisPipe.downConnectionType == 2 then
				pipe.ConnectorImage:SetOffsetVal( xOffset, (policy.GridY-1 + thisPipe.yOffset)*g_PolicyPipeYOffset + 58 );
				pipe.ConnectorImage:SetTexture(bottomRightTexture);
			elseif thisPipe.downConnectionType == 3 then
				pipe.ConnectorImage:SetOffsetVal( xOffset, (policy.GridY-1)*g_PolicyPipeYOffset + 58 );
				pipe.ConnectorImage:SetTexture(vTexture);
				pipe = g_PolicyPipeManager:GetInstance();			
				pipe.ConnectorImage:SetOffsetVal( xOffset, (policy.GridY-1 + thisPipe.yOffset)*g_PolicyPipeYOffset + 58 );
				pipe.ConnectorImage:SetTexture(bottomRightTexture);
			elseif thisPipe.downConnectionType == 4 then
				pipe.ConnectorImage:SetOffsetVal( xOffset, (policy.GridY-1)*g_PolicyPipeYOffset + 58 );
				pipe.ConnectorImage:SetTexture(bottomLeftTexture);
			elseif thisPipe.downConnectionType == 5 then
				pipe.ConnectorImage:SetOffsetVal( xOffset, (policy.GridY-1)*g_PolicyPipeYOffset + 58 );
				pipe.ConnectorImage:SetTexture(vTexture);
				pipe = g_PolicyPipeManager:GetInstance();			
				pipe.ConnectorImage:SetOffsetVal( xOffset, (policy.GridY-1 + thisPipe.yOffset)*g_PolicyPipeYOffset + 58 );
				pipe.ConnectorImage:SetTexture(bottomLeftTexture);
			elseif thisPipe.downConnectionType == 6 then
				pipe.ConnectorImage:SetOffsetVal( xOffset, (policy.GridY-1 + thisPipe.yOffset)*g_PolicyPipeYOffset + 58 );
				pipe.ConnectorImage:SetTexture(bottomRightTexture);
				pipe = g_PolicyPipeManager:GetInstance();		
				pipe.ConnectorImage:SetOffsetVal( xOffset, (policy.GridY-1 + thisPipe.yOffset)*g_PolicyPipeYOffset + 58 );
				pipe.ConnectorImage:SetTexture(bottomLeftTexture);
			else
				pipe.ConnectorImage:SetOffsetVal( xOffset, (policy.GridY-1)*g_PolicyPipeYOffset + 58 );
				pipe.ConnectorImage:SetTexture(vTexture);
				pipe = g_PolicyPipeManager:GetInstance();		
				pipe.ConnectorImage:SetOffsetVal( xOffset, (policy.GridY-1 + thisPipe.yOffset)*g_PolicyPipeYOffset + 58 );
				pipe.ConnectorImage:SetTexture(bottomRightTexture);
				pipe = g_PolicyPipeManager:GetInstance();
				pipe.ConnectorImage:SetOffsetVal( xOffset, (policy.GridY-1 + thisPipe.yOffset)*g_PolicyPipeYOffset + 58 );
				pipe.ConnectorImage:SetTexture(bottomLeftTexture);
			end
		end
	end

	-- Draw the upward bend connecting pipes
	for pipeIndex, thisPipe in pairs(policyPipes) do
		local policy = GameInfo.Policies[thisPipe.policyType];
		local xOffset = (policy.GridX-1)*g_PolicyPipeXOffset + 30;
		
		if thisPipe.upConnectionType >= 1 then
			
			local startPipe = g_PolicyPipeManager:GetInstance();
			startPipe.ConnectorImage:SetOffsetVal( xOffset, (policy.GridY-1)*g_PolicyPipeYOffset + 0 );
			startPipe.ConnectorImage:SetTexture(vTexture);
			
			local pipe = g_PolicyPipeManager:GetInstance();			
			if thisPipe.upConnectionType == 1 then
				pipe.ConnectorImage:SetOffsetVal( xOffset, (policy.GridY-1)*g_PolicyPipeYOffset - 10 );
				pipe.ConnectorImage:SetTexture(vTexture);
			elseif thisPipe.upConnectionType == 2 then
				pipe.ConnectorImage:SetOffsetVal( xOffset, (policy.GridY-1)*g_PolicyPipeYOffset - 10 );
				pipe.ConnectorImage:SetTexture(topRightTexture);
			elseif thisPipe.upConnectionType == 3 then
				pipe.ConnectorImage:SetOffsetVal( xOffset, (policy.GridY-1)*g_PolicyPipeYOffset - 10 );
				pipe.ConnectorImage:SetTexture(vTexture);
				pipe = g_PolicyPipeManager:GetInstance();			
				pipe.ConnectorImage:SetOffsetVal( xOffset, (policy.GridY-1)*g_PolicyPipeYOffset - 10 );
				pipe.ConnectorImage:SetTexture(topRightTexture);
			elseif thisPipe.upConnectionType == 4 then
				pipe.ConnectorImage:SetOffsetVal( xOffset, (policy.GridY-1)*g_PolicyPipeYOffset - 10 );
				pipe.ConnectorImage:SetTexture(topLeftTexture);
			elseif thisPipe.upConnectionType == 5 then
				pipe.ConnectorImage:SetOffsetVal( xOffset, (policy.GridY-1)*g_PolicyPipeYOffset - 10 );
				pipe.ConnectorImage:SetTexture(vTexture);
				pipe = g_PolicyPipeManager:GetInstance();			
				pipe.ConnectorImage:SetOffsetVal( xOffset, (policy.GridY-1)*g_PolicyPipeYOffset - 10 );
				pipe.ConnectorImage:SetTexture(topLeftTexture);
			elseif thisPipe.upConnectionType == 6 then
				pipe.ConnectorImage:SetOffsetVal( xOffset, (policy.GridY-1)*g_PolicyPipeYOffset - 10 );
				pipe.ConnectorImage:SetTexture(topRightTexture);
				pipe = g_PolicyPipeManager:GetInstance();		
				pipe.ConnectorImage:SetOffsetVal( xOffset, (policy.GridY-1)*g_PolicyPipeYOffset - 10 );
				pipe.ConnectorImage:SetTexture(topLeftTexture);
			else
				pipe.ConnectorImage:SetOffsetVal( xOffset, (policy.GridY-1)*g_PolicyPipeYOffset - 10 );
				pipe.ConnectorImage:SetTexture(vTexture);
				pipe = g_PolicyPipeManager:GetInstance();		
				pipe.ConnectorImage:SetOffsetVal( xOffset, (policy.GridY-1)*g_PolicyPipeYOffset - 10 );
				pipe.ConnectorImage:SetTexture(topRightTexture);
				pipe = g_PolicyPipeManager:GetInstance();
				pipe.ConnectorImage:SetOffsetVal( xOffset, (policy.GridY-1)*g_PolicyPipeYOffset - 10 );
				pipe.ConnectorImage:SetTexture(topLeftTexture);
			end
		end
	end
end

-------------------------------------------------
-- Policy Selected
-- When a policy is elected in the tree, this is run.
-------------------------------------------------
function PolicySelected( policyIndex )
    
    print("Clicked on Policy: " .. tostring(policyIndex));
    
	if policyIndex == -1 then
		return;
	end
    local player = Players[Game.GetActivePlayer()];   
    if player == nil then
		return;
    end
    
    local bHasPolicy = player:HasPolicy(policyIndex);
    local bCanAdoptPolicy = player:CanAdoptPolicy(policyIndex);
    
    print("bHasPolicy: " .. tostring(bHasPolicy));
    print("bCanAdoptPolicy: " .. tostring(bCanAdoptPolicy));
    print("Policy Blocked: " .. tostring(player:IsPolicyBlocked(policyIndex)));
    
    local bPolicyBlocked = false;
    
    -- If we can get this, OR we already have it, see if we can unblock it first
    if (bHasPolicy or bCanAdoptPolicy) then
    
		-- Policy blocked off right now? If so, try to activate
		if (player:IsPolicyBlocked(policyIndex)) then
			
			bPolicyBlocked = true;
			
			local strPolicyBranch = GameInfo.Policies[policyIndex].PolicyBranchType;
			local iPolicyBranch = GameInfoTypes[strPolicyBranch];
			
			print("Policy Branch: " .. tostring(iPolicyBranch));
			
			local popupInfo = {
				Type = ButtonPopupTypes.BUTTONPOPUP_CONFIRM_POLICY_BRANCH_SWITCH,
				Data1 = iPolicyBranch;
			}
			Events.SerialEventGameMessagePopup(popupInfo);
			
		end
    end
    
    -- Can adopt Policy right now - don't try this if we're going to unblock the Policy instead
    if (bCanAdoptPolicy and not bPolicyBlocked) then
		m_gPolicyID = policyIndex;
		m_gAdoptingPolicy = true;
		Controls.PolicyConfirm:SetHide(false);
		Controls.BGBlock:SetHide(true);
	end
	
end

-------------------------------------------------
-- Policy Branch Selected
-- When a policy branch's Adopt button is clicked, this is run.
-------------------------------------------------
function PolicyBranchSelected( policyBranchIndex )
    
    --print("Clicked on PolicyBranch: " .. tostring(policyBranchIndex));
    
	if policyBranchIndex == -1 then
		return;
	end
    local player = Players[Game.GetActivePlayer()];   
    if player == nil then
		return;
    end
    
    local bHasPolicyBranch = player:IsPolicyBranchUnlocked(policyBranchIndex);
    local bCanAdoptPolicyBranch = player:CanUnlockPolicyBranch(policyBranchIndex);
    
    --print("bHasPolicyBranch: " .. tostring(bHasPolicyBranch));
    --print("bCanAdoptPolicyBranch: " .. tostring(bCanAdoptPolicyBranch));
   -- print("PolicyBranch Blocked: " .. tostring(player:IsPolicyBranchBlocked(policyBranchIndex)));
    
    local bUnblockingPolicyBranch = false;
    
    -- If we can get this, OR we already have it, see if we can unblock it first
    if (bHasPolicyBranch or bCanAdoptPolicyBranch) then
    
		-- Policy Branch blocked off right now? If so, try to activate
		if (player:IsPolicyBranchBlocked(policyBranchIndex)) then
			
			bUnblockingPolicyBranch = true;
			
			local popupInfo = {
				Type = ButtonPopupTypes.BUTTONPOPUP_CONFIRM_POLICY_BRANCH_SWITCH,
				Data1 = policyBranchIndex;
			}
			Events.SerialEventGameMessagePopup(popupInfo);
		end
    end
    
    -- Can adopt Policy Branch right now - don't try this if we're going to unblock the Policy Branch instead
    if (bCanAdoptPolicyBranch and not bUnblockingPolicyBranch) then
		m_gPolicyID = policyBranchIndex;
		m_gAdoptingPolicy = false;
		Controls.PolicyConfirm:SetHide(false);
		Controls.BGBlock:SetHide(true);
	end
end


-------------------------------------------------
-- Find Branch By ID
-------------------------------------------------
function GetBranchByID(iBranchID)
	local i = 0;
	local policyBranchInfo = GameInfo.PolicyBranchTypes[i];
	while policyBranchInfo ~= nil do
		if policyBranchInfo.ID == iBranchID then
			return policyBranchInfo;
		end
		i = i + 1;
		policyBranchInfo = GameInfo.PolicyBranchTypes[i];
	end
	return nil;
end

-------------------------------------------------
-- Get Branches
-------------------------------------------------
function GetBranches(sBranchType)
	local branches = {};

	local i = 0;
	local policyBranchInfo = GameInfo.PolicyBranchTypes[i];
	while policyBranchInfo ~= nil do
		if policyBranchInfo.PolicyBranchClass == sBranchType then
			local policyCount = tableLength(GetPolicies(policyBranchInfo));
			--print(policyCount);
			if (policyCount > 0) then
				table.insert(branches, policyBranchInfo);
			end
		end
		i = i + 1;
		policyBranchInfo = GameInfo.PolicyBranchTypes[i];
	end
	return branches;
end

-------------------------------------------------
-- Build Branch Button
-- Builds the buttons for the branch list
-------------------------------------------------
function BuildBranchButton(pPlayer, eBranch, instance)
	local bBranchUnlocked	 = pPlayer:IsPolicyBranchUnlocked(eBranch.ID);
	local bBranchBlocked	 = pPlayer:IsPolicyBranchBlocked(eBranch.ID);
	local bBranchFinished	 = pPlayer:IsPolicyBranchFinished(eBranch.ID);
	local bBranchCanAdopt	 = pPlayer:CanUnlockPolicyBranch(eBranch.ID);
	--print(string.format("%s - %s", eBranch.Type,tableLength(GetPolicies(eBranch))));
	if (bBranchUnlocked) then
		instance.PolicyCountLabel:LocalizeAndSetText("TXT_KEY_POLICYBRANCH_POLICY_COUNT_ADOPTED",pPlayer:GetNumPoliciesInBranch(eBranch.ID), tableLength(GetPolicies(eBranch)));
		if (bBranchFinished) then
			instance.BranchStatusLabel:LocalizeAndSetText("TXT_KEY_POLICYBRANCH_COMPLETED");
		else
			instance.BranchStatusLabel:LocalizeAndSetText("TXT_KEY_POLICYBRANCH_ADOPTED");
		end
	else
		instance.PolicyCountLabel:LocalizeAndSetText("TXT_KEY_POLICYBRANCH_POLICY_COUNT_NOT_ADOPTED", tableLength(GetPolicies(eBranch)));
		if (bBranchBlocked) then
			instance.BranchStatusLabel:LocalizeAndSetText("TXT_KEY_POLICYBRANCH_BLOCKED");
		elseif (bBranchCanAdopt) then
			instance.BranchStatusLabel:LocalizeAndSetText("TXT_KEY_POLICYBRANCH_NOT_ADOPTED");
		else
			if eBranch.EraPrereq ~= nil then
				instance.BranchStatusLabel:LocalizeAndSetText("TXT_KEY_POLICYBRANCH_ERA_REQUIRED", GameInfo.Eras[GameInfoTypes[eBranch.EraPrereq]].Description);
			else
				instance.BranchStatusLabel:LocalizeAndSetText("TXT_KEY_POLICYBRANCH_NOT_ADOPTED");
			end
		end
	end
	instance.BranchLabel:LocalizeAndSetText(eBranch.Description);
    instance.BranchButton:SetVoid1( eBranch.ID );
	instance.BranchButton:RegisterCallback( Mouse.eLClick, UpdateBranchView );
	--print("test:%s", instance.BranchLabel:GetText());
end
-------------------------------------------------
-- Build Ideology Button
-- Builds the buttons for the ideology list
-------------------------------------------------
function BuildIdeologyButton(pPlayer, eBranch, instance)
	local pPlayer = Players[Game.GetActivePlayer()];
    instance.IdeologyButton:SetVoid1( eBranch.ID );
	instance.IdeologyButton:RegisterCallback( Mouse.eLClick, UpdateBranchView );
	if pPlayer:IsPolicyBranchUnlocked(eBranch.ID) then
		instance.IdeologyLabel:SetText(string.format("[COLOR_POSITIVE_TEXT]%s[ENDCOLOR]",Locale.ConvertTextKey(eBranch.Description)));
		if currentView.Branch == nil then currentView.Branch = eBranch; end
	else
		instance.IdeologyLabel:LocalizeAndSetText(eBranch.Description);
	end
	--print("test:%s", instance.BranchLabel:GetText());
end
-------------------------------------------------
-- UpdateBranchView
-- Sets the branch/ideology to be show, and calls the update routine
-------------------------------------------------
function UpdateBranchView( iBranchIndex )
	local eBranch = GetBranchByID(iBranchIndex);
	if eBranch ~= nil then
		local eClass = GameInfo.PolicyBranchClassTypes[GameInfoTypes[eBranch.PolicyBranchClass]];
		sStyle = eClass.Style;
		currentView = {["Class"] = eClass,["Style"] = sStyle,["Branch"] = eBranch,};
		--print(string.format("Next View - %s - %s - %s",currentView.Class.Description,currentView.Style,currentView.Branch.Description));
	end
	UpdateDisplay();
end
-------------------------------------------------
-- View Policy Branch
-- When a policy branch is selected in the left sidebar, this is run.
-- All policies belonging to that specific branch are loaded, so that
-- the tree for that branch can be built.
-------------------------------------------------
function ViewPolicyBranch( eBranch )
	--if eBranch ~= nil then
	--	print(string.format("ViewPolicyBranch - %s", Locale.ConvertTextKey(eBranch.Description)));
	--else
	--	print(string.format("ViewPolicyBranch - %s", "Nil Branch"));
	--end
	Controls.PolicyPanel:DestroyAllChildren();
	if eBranch ~= nil then
		currentView.Branch = eBranch;
		
		local pPlayer = Players[Game.GetActivePlayer()];
		local pTeam = Teams[pPlayer:GetTeam()];
		local policies = GetPolicies(eBranch);
		
		local bBranchUnlocked	 = pPlayer:IsPolicyBranchUnlocked(eBranch.ID);
		local bBranchFinished	 = pPlayer:IsPolicyBranchFinished(eBranch.ID);
		local bBranchBlocked	 = pPlayer:IsPolicyBranchBlocked(eBranch.ID);
		local bBranchCanAdopt	 = pPlayer:CanUnlockPolicyBranch(eBranch.ID);

		tableBranchButtons[eBranch.Type].BranchButtonHL:SetHide(false);

		Controls.TreePanelLabel:LocalizeAndSetText(eBranch.Description);
		Controls.AdoptBranchButton:SetToolTipString(Locale.ConvertTextKey(eBranch.Help));
		Controls.BranchImage:SetToolTipString(Locale.ConvertTextKey(eBranch.Help));
		Controls.AdoptBranchButton:SetVoid1( eBranch.ID );
		Controls.AdoptBranchButton:RegisterCallback( Mouse.eLClick, PolicyBranchSelected );
		
   		CivIconHookup( pPlayer:GetID(), 64, Controls.CivIcon, Controls.CivIconBG, Controls.CivIconShadow, false, true );
		Controls.BranchImage:SetTexture( eBranch.PolicyBranchImage );

		local iEraPrereq = GameInfoTypes[eBranch.EraPrereq]
		local bEraLock = false;
		if (iEraPrereq ~= nil and pTeam:GetCurrentEra() < iEraPrereq) then
			bEraLock = true;
		end
		print(eBranch);
		local bTechLock = false;
		for row in GameInfo.PolicyBranchTechs() do 
			if eBranch.Type == row.Type then
				local iTechPrereq = GameInfoTypes[row.TechPrereq];
					if (iTechPrereq ~= -1 and not pTeam:GetTeamTechs():HasTech(iTechPrereq)) then
					bTechLock = true;
					
			print("tech", iTechPrereq)
					end
			end
		end	
		
		Controls.AdoptBranchButton:SetDisabled(false);
		Controls.AdoptBranchButton:SetHide(false);
		Controls.BranchImageFade:SetHide(false);
		Controls.Lock:SetHide(false);

		if bEraLock then
			Controls.AdoptBranchButton:LocalizeAndSetText("TXT_KEY_POLICYBRANCH_ERA_REQUIRED", GameInfo.Eras[GameInfoTypes[eBranch.EraPrereq]].Description);
			Controls.AdoptBranchButton:SetDisabled(true);
		else
			if 	bTechLock then
				Controls.AdoptBranchButton:LocalizeAndSetText("TXT_KEY_POLICYBRANCHE_TECH_REQUIRED");
				Controls.AdoptBranchButton:SetDisabled(true);
			else
				if bBranchUnlocked then
					Controls.AdoptBranchButton:SetHide(true);
					Controls.BranchImageFade:SetHide(true);
				else
					if bBranchBlocked then
						Controls.AdoptBranchButton:LocalizeAndSetText("TXT_KEY_POLICYBRANCH_ADOPT_BLOCKED");
					elseif bBranchCanAdopt then
						Controls.AdoptBranchButton:LocalizeAndSetText("TXT_KEY_POLICYBRANCH_ADOPT");
						Controls.Lock:SetHide(true);
					else
						Controls.AdoptBranchButton:LocalizeAndSetText("TXT_KEY_POLICYBRANCH_ADOPT");
						Controls.AdoptBranchButton:SetDisabled(true);
					end
				end
			end
		end
		
		BuildPipePaths( eBranch.ID );
		for i, ePolicy in pairs(policies) do
			local instance = {};
			ContextPtr:BuildInstanceForControl("PolicyButton", instance, Controls.PolicyPanel);
			BuildPolicyButton(pPlayer, ePolicy, instance);
		end
		Controls.PolicyTreePanel:SetHide(false);
	else
		Controls.PolicyTreePanel:SetHide(true);
	end
end

-------------------------------------------------
-- View Ideology
-- Shows the Ideology's tenets in the right-hand area of the popup
-------------------------------------------------
function ViewIdeology( eBranch )
	--if eBranch ~= nil then
	--	print(string.format("ViewIdeology - %s", Locale.ConvertTextKey(eBranch.Description)));
	--else
	--	print(string.format("ViewIdeology - %s", "Nil Branch"));
	--end
	Controls.TenetWrapper:DestroyAllChildren();
	if eBranch ~= nil then
		tableBranchButtons = {};
		currentView.Branch = eBranch;

		local pPlayer = Players[Game.GetActivePlayer()];

		local pTeam = Teams[pPlayer:GetTeam()];
		local policies = GetPolicies(eBranch);
		local tableTenets = {};
		local topTier = 0;
		
   		CivIconHookup( pPlayer:GetID(), 64, Controls.TenetCivIcon, Controls.TenetCivIconBG, Controls.TenetCivIconShadow, false, true );
		Controls.IdeologyImage:SetTexture( eBranch.PolicyBranchImage );

		for i, tenet in pairs(policies) do 
			if tenet.Level > topTier then topTier = tenet.Level; end 
			if tableTenets[tenet.Level] == nil then
				tableTenets[tenet.Level] = {};
			end
			table.insert(tableTenets[tenet.Level], tenet);
		end

		if topTier > 0 then
			for i = 1, topTier do
				local stackInstance = {};
				ContextPtr:BuildInstanceForControl("TenetStackInstance", stackInstance, Controls.TenetWrapper);
				stackInstance.TenetStackLabel:LocalizeAndSetText("TXT_KEY_TENETSTACK_LABEL", i);
				local tenetIM = InstanceManager:new("TenetInstance", "TenetButton", stackInstance.TenetStack);
				local tenetCount = 0;
				if tableTenets[i] ~= nil then
					for j, tenet in pairs(tableTenets[i]) do
						local tenetInstance = tenetIM:GetInstance();
						local bAdded = BuildTenet(pPlayer, tenet, tenetInstance);
						if bAdded then tenetCount = tenetCount + 1; end
					end
				end
				stackInstance.TenetStack:CalculateSize();
				stackInstance.TenetStack:ReprocessAnchoring();
				stackInstance.StackPanel:SetSizeY( (tenetCount*24) + 57);
				stackInstance.StackPanel:CalculateInternalSize();
			end
			Controls.TenetTreePanel:SetHide(false);
		end

		if pPlayer:IsPolicyBranchUnlocked(eBranch.ID) then
			local szOpinionString;
			local iOpinion = pPlayer:GetPublicOpinionType();
			if (iOpinion == PublicOpinionTypes.PUBLIC_OPINION_DISSIDENTS) then
				szOpinionString = Locale.ConvertTextKey("TXT_KEY_CO_PUBLIC_OPINION_DISSIDENTS");
			elseif (iOpinion == PublicOpinionTypes.PUBLIC_OPINION_CIVIL_RESISTANCE) then
				szOpinionString = Locale.ConvertTextKey("TXT_KEY_CO_PUBLIC_OPINION_CIVIL_RESISTANCE");
			elseif (iOpinion == PublicOpinionTypes.PUBLIC_OPINION_REVOLUTIONARY_WAVE) then
				szOpinionString = Locale.ConvertTextKey("TXT_KEY_CO_PUBLIC_OPINION_REVOLUTIONARY_WAVE");
			else
				szOpinionString = Locale.ConvertTextKey("TXT_KEY_CO_PUBLIC_OPINION_CONTENT");
			end
			Controls.PublicOpinion:SetText(szOpinionString);
			Controls.PublicOpinion:SetToolTipString(pPlayer:GetPublicOpinionTooltip());
			
			local iUnhappiness = -1 * pPlayer:GetPublicOpinionUnhappiness();
			local strPublicOpinionUnhappiness = tostring(0);
			local strChangeIdeologyTooltip = "";
			if (iUnhappiness < 0) then
				strPublicOpinionUnhappiness = Locale.ConvertTextKey("TXT_KEY_CO_PUBLIC_OPINION_UNHAPPINESS", iUnhappiness);
				Controls.SwitchIdeologyButton:SetDisabled(false);	
				local ePreferredIdeology = pPlayer:GetPublicOpinionPreferredIdeology();
				local strPreferredIdeology = GameInfo.PolicyBranchTypes[ePreferredIdeology].Description;
				strChangeIdeologyTooltip = Locale.ConvertTextKey("TXT_KEY_POLICYSCREEN_CHANGE_IDEOLOGY_TT", strPreferredIdeology, (-1 * iUnhappiness), 2);
		    
				Controls.SwitchIdeologyButton:RegisterCallback(Mouse.eLClick, function()
						ChooseChangeIdeology();
				end);
			else
				Controls.SwitchIdeologyButton:SetDisabled(true);	
				strChangeIdeologyTooltip = Locale.ConvertTextKey("TXT_KEY_POLICYSCREEN_CHANGE_IDEOLOGY_DISABLED_TT");
			end
			Controls.PublicOpinionUnhappiness:SetText(strPublicOpinionUnhappiness);
			Controls.PublicOpinionUnhappiness:SetToolTipString(pPlayer:GetPublicOpinionUnhappinessTooltip());
			Controls.SwitchIdeologyButton:SetToolTipString(strChangeIdeologyTooltip);

			Controls.PublicOpinionPanel:SetHide(false);
		else
			Controls.PublicOpinionPanel:SetHide(true);
		end

		Controls.TenetWrapper:CalculateSize();
		Controls.TenetWrapper:ReprocessAnchoring();
		Controls.TenetScrollPanel:CalculateInternalSize();
		Controls.TenetTreePanel:SetHide(false);
	else
		Controls.TenetTreePanel:SetHide(true);
	end
end
-------------------------------------------------
-- Switch Ideology Button
-------------------------------------------------
function ChooseChangeIdeology()
    local player = Players[Game.GetActivePlayer()];
	local iAnarchyTurns = GameDefines["SWITCH_POLICY_BRANCHES_ANARCHY_TURNS"];
	local eCurrentIdeology = player:GetLateGamePolicyTree();
	local iCurrentIdeologyTenets = player:GetNumPoliciesInBranch(eCurrentIdeology);
	local iPreferredIdeologyTenets = iCurrentIdeologyTenets - GameDefines["SWITCH_POLICY_BRANCHES_TENETS_LOST"];
	if (iPreferredIdeologyTenets < 0) then
		iPreferredIdeologyTenets = 0;
	end
	local iUnhappiness = player:GetPublicOpinionUnhappiness();
	local strCurrentIdeology = GameInfo.PolicyBranchTypes[eCurrentIdeology].Description;	
	local ePreferredIdeology = player:GetPublicOpinionPreferredIdeology();
	local strPreferredIdeology = GameInfo.PolicyBranchTypes[ePreferredIdeology].Description;
	Controls.LabelConfirmChangeIdeology:LocalizeAndSetText("TXT_KEY_POLICYSCREEN_CONFIRM_CHANGE_IDEOLOGY", iAnarchyTurns, iCurrentIdeologyTenets, strCurrentIdeology, iPreferredIdeologyTenets, strPreferredIdeology, iUnhappiness);
	Controls.ChangeIdeologyConfirm:SetHide(false);
end


function OnChangeIdeologyConfirmYes( )

	Controls.ChangeIdeologyConfirm:SetHide(true);
	Network.SendChangeIdeology();
	Events.AudioPlay2DSound("AS2D_INTERFACE_POLICY");	
end
Controls.ChangeIdeologyConfirmYes:RegisterCallback( Mouse.eLClick, OnChangeIdeologyConfirmYes );

function OnChangeIdeologyConfirmNo( )
	Controls.ChangeIdeologyConfirm:SetHide(true);
end
Controls.ChangeIdeologyConfirmNo:RegisterCallback( Mouse.eLClick, OnChangeIdeologyConfirmNo );
-------------------------------------------------
-- Build Tab Button
-------------------------------------------------
function BuildTabButton(pPlayer, eBranchClass, instance)
	instance.TabButton:LocalizeAndSetText( eBranchClass.Description );
    instance.TabButton:SetVoid1( eBranchClass.ID );
	instance.TabButton:RegisterCallback( Mouse.eLClick, SwitchTabs );
end

-------------------------------------------------
-- Populate Branch List
-------------------------------------------------
function PopulateBranchList(sBranchClass)
	Controls.BranchStack:DestroyAllChildren();
	local pPlayer = Players[Game.GetActivePlayer()];
	if pPlayer == nil then return;
	else
		local branchList = GetBranches(sBranchClass);
		for i, eBranch in pairs(branchList) do
			local instance = {};
			ContextPtr:BuildInstanceForControl("BranchButtonInstance", instance, Controls.BranchStack);
			BuildBranchButton(pPlayer, eBranch, instance);
			tableBranchButtons[eBranch.Type] = instance;
		end
	end
	Controls.BranchStack:SetHide(false);
	Controls.BranchStack:CalculateSize();
    Controls.BranchStack:ReprocessAnchoring();
    Controls.BranchListScrollPanel:CalculateInternalSize();
end

-------------------------------------------------
-- Populate Ideology List
-------------------------------------------------
function PopulateIdeologyList(sBranchClass)
	Controls.IdeologyStack:DestroyAllChildren();
	local pPlayer = Players[Game.GetActivePlayer()];
	if pPlayer == nil then return;
	else
		local branchList = GetBranches(sBranchClass);
		for i, eBranch in pairs(branchList) do
			local instance = {};
			ContextPtr:BuildInstanceForControl("IdeologyButtonInstance", instance, Controls.IdeologyStack);
			BuildIdeologyButton(pPlayer, eBranch, instance);
			tableBranchButtons[eBranch.Type] = instance;
		end
	end
	Controls.IdeologyStack:SetHide(false);
	Controls.IdeologyStack:CalculateSize();
    Controls.IdeologyStack:ReprocessAnchoring();
    Controls.IdeologyListScrollPanel:CalculateInternalSize();
end

-------------------------------------------------
-- Populate Branch Class List
-------------------------------------------------
function PopulateBranchClassList()
	Controls.TabStack:DestroyAllChildren();
	local pPlayer = Players[Game.GetActivePlayer()];
	if pPlayer == nil then return;
	else
		local tabList = DB.Query("SELECT * FROM PolicyBranchClassTypes");
		for eBranchClass in tabList do
			--print(string.format("%s - %s", eBranchClass.Type, eBranchClass.Style));
			local instance = {};
			ContextPtr:BuildInstanceForControl("TabButtonInstance", instance, Controls.TabStack);
			BuildTabButton(pPlayer, eBranchClass, instance);
			tableTabs[eBranchClass.ID] = eBranchClass;
			tableTabButtons[eBranchClass.Type] = instance;
		end
	end
	Controls.TabStack:SetHide(false);
	Controls.TabStack:CalculateSize();
    Controls.TabStack:ReprocessAnchoring();
    Controls.TabPanel:CalculateInternalSize();
end

-------------------------------------------------
-- Init
-------------------------------------------------
function Init()
	PopulateBranchClassList();
	tableBranches = GetBranches("BRANCHCLASS_SOCIAL_POLICY");
	UpdateDisplay();
	ContextPtr:SetHide(true);
end

-- START DEBUG FUNCTIONS --

function tableLength(T)
	local count = 0;
	for _ in pairs(T) do count = count + 1 end;
	return count;
end

-- END DEBUG --
Init();