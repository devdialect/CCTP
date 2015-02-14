--------------------------------------------------------------
--------------------------------------------------------------
include( "IconSupport" );
include( "InstanceManager" );
include( "SupportFunctions" );

local m_sortTable;

local eCity  = 0;
local eTurns = 1;

local m_SortMode = eTurns;
local m_bSortReverse = false;

local m_ArtistIM = InstanceManager:new( "GPInstance", "Root", Controls.ArtistStack );
local m_EngineerIM = InstanceManager:new( "GPInstance", "Root", Controls.EngineerStack );
local m_MerchantIM = InstanceManager:new( "GPInstance", "Root", Controls.MerchantStack );
local m_MusicianIM = InstanceManager:new( "GPInstance", "Root", Controls.MusicianStack );
local m_ScientistIM = InstanceManager:new( "GPInstance", "Root", Controls.ScientistStack );
local m_WriterIM = InstanceManager:new( "GPInstance", "Root", Controls.WriterStack );
local m_EntertainerIM = InstanceManager:new( "GPInstance", "Root", Controls.EntertainerStack );
local m_EnergyIM = InstanceManager:new( "GPInstance", "Root", Controls.EnergyStack );
local m_PriestIM = InstanceManager:new( "GPInstance", "Root", Controls.PriestStack );
local m_IntellectualIM = InstanceManager:new( "GPInstance", "Root", Controls.IntellectualStack );
local m_LaborerIM = InstanceManager:new( "GPInstance", "Root", Controls.LaborerStack );
local m_EnvironmentIM = InstanceManager:new( "GPInstance", "Root", Controls.EnvironmentStack );
local m_DoctorIM = InstanceManager:new( "GPInstance", "Root", Controls.DoctorStack );
local m_TranscendIM = InstanceManager:new( "GPInstance", "Root", Controls.TranscendStack );
-------------------------------------------------
-------------------------------------------------
function ShowHideHandler( bIsHide )
	if( not bIsHide ) then
		UpdateDisplay();
	end
end
ContextPtr:SetShowHideHandler( ShowHideHandler );


-------------------------------------------------
-------------------------------------------------
function OnClose( )
	ContextPtr:SetHide( true );
	Events.OpenInfoCorner( InfoCornerID.None );
end
Controls.CloseButton:RegisterCallback( Mouse.eLClick, OnClose );


----------------------------------------------------------------
-- Key Down Processing
----------------------------------------------------------------
function InputHandler( uiMsg, wParam, lParam )
	if uiMsg == KeyEvents.KeyDown then
		if wParam == Keys.VK_ESCAPE then
			OnClose();
			return true;
		end
	end
end
ContextPtr:SetInputHandler( InputHandler );

-------------------------------------------------
-------------------------------------------------
function OnChangeEvent()
	if( ContextPtr:IsHidden() == false ) then
		UpdateDisplay();
	end
end
Events.SerialEventGameDataDirty.Add( OnChangeEvent );
Events.SerialEventCityInfoDirty.Add( OnChangeEvent );
Events.GameplaySetActivePlayer.Add( OnChangeEvent );

-------------------------------------------------
-------------------------------------------------
function UpdateDisplay()
	m_SortTable = {};

	local pPlayer = Players[Game:GetActivePlayer()];
	local pCity;
	local cityName;
	local instance;

	local bArtistFound = false;
	local bEngineerFound = false;
	local bMerchantFound = false;
	local bMusicianFound = false;
	local bScientistFound = false;
	local bWriterFound = false;
	local bEntertainerFound = false;
	local bEnergyFound = false;
	local bPriestFound = false;
	local bIntellectualFound = false;
	local bLaborerFound = false;
	local bEnvironmentFound = false;
	local bGuideFound = false;
	local bDoctorFound = false;
	local bTranscendFound = false;
	
	local iRate;
	local iThreshold;
	local iNumTurns;
	local iProgress;

	m_ArtistIM:ResetInstances();
	m_EngineerIM:ResetInstances();
	m_MerchantIM:ResetInstances();
	m_MusicianIM:ResetInstances();
	m_ScientistIM:ResetInstances();
	m_WriterIM:ResetInstances();
	m_EntertainerIM:ResetInstances();
	m_EnergyIM:ResetInstances();
	m_PriestIM:ResetInstances();
	m_IntellectualIM:ResetInstances();
	m_LaborerIM:ResetInstances();
	m_EnvironmentIM:ResetInstances();
	m_GuideIM:ResetInstances();
	m_DoctorIM:ResetInstances();
	m_TranscendIM:ResetInstances();
	
	if (checkIfGP(pPlayer)) then
		for pSpecialistInfo in GameInfo.Specialists() do	
			local iSpecialistIndex =  pSpecialistInfo.ID;
			for pCity in pPlayer:Cities() do
				if (checkIfSpecialist(pPlayer, pSpecialistInfo, pCity)) then
					if (pSpecialistInfo.Type == "SPECIALIST_ARTIST") then
						instance = m_ArtistIM:GetInstance();
						bArtistFound = true;
					elseif (pSpecialistInfo.Type == "SPECIALIST_ENGINEER") then
						instance = m_EngineerIM:GetInstance();
						bEngineerFound = true;
					elseif (pSpecialistInfo.Type == "SPECIALIST_MERCHANT") then
						instance = m_MerchantIM:GetInstance();
						bMerchantFound = true;
					elseif (pSpecialistInfo.Type == "SPECIALIST_MUSICIAN") then
						instance = m_MusicianIM:GetInstance();
						bMusicianFound = true;
					elseif (pSpecialistInfo.Type == "SPECIALIST_SCIENTIST") then
						instance = m_ScientistIM:GetInstance();
						bScientistFound = true;
					elseif (pSpecialistInfo.Type == "SPECIALIST_WRITER") then
						instance = m_WriterIM:GetInstance();
						bWriterFound = true;
					elseif (pSpecialistInfo.Type == "SPECIALIST_ENTERTAINER") then
						instance = m_EntertainerIM:GetInstance();
						bEngineerFound = true;
					elseif (pSpecialistInfo.Type == "SPECIALIST_ENERGY") then
						instance = m_EnergyIM:GetInstance();
						bMerchantFound = true;
					elseif (pSpecialistInfo.Type == "SPECIALIST_PRIEST") then
						instance = m_PriestIM:GetInstance();
						bMusicianFound = true;
					elseif (pSpecialistInfo.Type == "SPECIALIST_INTELLECTUAL") then
						instance = m_IntellectualIM:GetInstance();
						bScientistFound = true;
					elseif (pSpecialistInfo.Type == "SPECIALIST_LABORER") then
						instance = m_LaborerIM:GetInstance();
						bWriterFound = true;	
					elseif (pSpecialistInfo.Type == "SPECIALIST_ENVIRONMENT") then
						instance = m_EnvironmentIM:GetInstance();
						bScientistFound = true;
					elseif (pSpecialistInfo.Type == "SPECIALIST_GUIDE") then
						instance = m_GuideIM:GetInstance();
						bWriterFound = true;	
					elseif (pSpecialistInfo.Type == "SPECIALIST_DOCTOR") then
						instance = m_DoctorIM:GetInstance();
						bScientistFound = true;			
					elseif (pSpecialistInfo.Type == "SPECIALIST_TRANSCEND") then
						instance = m_TranscendIM:GetInstance();
						bScientistFound = true;						
					end		
							
					iProgress = pCity:GetSpecialistGreatPersonProgress(iSpecialistIndex);	
					if(iProgress>0) then 
						instance.Button:RegisterCallback( Mouse.eLClick, OnCityClick );
						instance.Button:RegisterCallback( Mouse.eRClick, OnCityRClick );
						instance.Button:SetVoids( pCity:GetX(), pCity:GetY() );
						
						local sortEntry = {};
						m_SortTable[ tostring( instance.Root ) ] = sortEntry;

						cityName = Locale.ConvertTextKey( pCity:GetNameKey() );
						sortEntry.name = cityName;
						TruncateString( instance.CityName, 74, sortEntry.name );

						local iUnitClass = GameInfo.UnitClasses[pSpecialistInfo.GreatPeopleUnitClass].ID
						iThreshold = pCity:GetSpecialistUpgradeThreshold(iUnitClass);
						iRate = getRateOfChange(pCity, pSpecialistInfo, pPlayer)

						local iNumTurns;
						local strNumTurns;
						
						if(iRate == 0) then
							iNumTurns = -1;
							strNumTurns = "--";
						elseif(iRate > 0) then
							if ((iThreshold - iProgress) == iRate) then
								iNumTurns = 9999;
								strNumTurns = "--";
							else
								iNumTurns = math.floor((((iThreshold - iProgress)/iRate)+1));
								strNumTurns = iNumTurns;
							end
						end

						--strTurns = Locale.ConvertTextKey( "TXT_KEY_GPLIST_TURNS", iRate, iNumTurns );
						strTurns = Locale.ConvertTextKey( "TXT_KEY_GPLIST_TURNS", iRate );
						strProgress = Locale.ConvertTextKey( "TXT_KEY_GPLIST_PROGRESS", iProgress, iThreshold, strNumTurns );

						sortEntry.turns = iNumTurns;

						instance.GPTurns:SetText( strTurns );
						instance.GPTurns:SetToolTipString( strProgress );
						instance.GPMeter:SetPercent( iProgress / iThreshold );
						instance.GPMeter:SetToolTipString( strProgress );

						instance.GPStack:CalculateSize();
						instance.GPStack:ReprocessAnchoring();
		
						sortEntry.cityID = pCity:GetID();
					end
				end
			end
		end
	end	

	--add great general at the end
	local fProgress  = pPlayer:GetCombatExperience();
	local fThreshold = pPlayer:GreatGeneralThreshold();
	local GGString = Locale.ConvertTextKey("TXT_KEY_GREAT_GENERAL_PROGRESS", fProgress, fThreshold);
	Controls.GGMeter:SetToolTipString( GGString );
	Controls.GGLabel:SetToolTipString( GGString );
	Controls.GGMeter:SetPercent( fProgress / fThreshold );
	
	
	local fProgress  = pPlayer:GetNavalCombatExperience();
	local fThreshold = pPlayer:GreatAdmiralThreshold();
	local GGString = Locale.ConvertTextKey("TXT_KEY_GREAT_GENERAL_PROGRESS", fProgress, fThreshold);
	Controls.GAMeter:SetToolTipString( GGString );
	Controls.GALabel:SetToolTipString( GGString );
	Controls.GAMeter:SetPercent( fProgress / fThreshold );

	Controls.ArtistStack:SortChildren( SortFunction );
	Controls.EngineerStack:SortChildren( SortFunction );
	Controls.MerchantStack:SortChildren( SortFunction );
	Controls.MusicianStack:SortChildren( SortFunction );
	Controls.ScientistStack:SortChildren( SortFunction );
	Controls.WriterStack:SortChildren( SortFunction );
	Controls.EntertainerStack:SortChildren( SortFunction );
	Controls.EnergyStack:SortChildren( SortFunction );
	Controls.PriestStack:SortChildren( SortFunction );
	Controls.IntellectualStack:SortChildren( SortFunction );
	Controls.LaborerStack:SortChildren( SortFunction );
	Controls.EnvironmentStack:SortChildren( SortFunction );
	Controls.GuideStack:SortChildren( SortFunction );
	Controls.DoctorStack:SortChildren( SortFunction );
	Controls.TranscendStack:SortChildren( SortFunction );

	Controls.ArtistHeader:SetHide( not bArtistFound );
	Controls.EngineerHeader:SetHide( not bEngineerFound );
	Controls.MerchantHeader:SetHide( not bMerchantFound );
	Controls.MusicianHeader:SetHide( not bMusicianFound );
	Controls.ScientistHeader:SetHide( not bScientistFound );
	Controls.WriterHeader:SetHide( not bWriterFound );
	Controls.EntertainerHeader:SetHide( not bEntertainerFound );
	Controls.EnergyHeader:SetHide( not bEnergyFound );
	Controls.PriestHeader:SetHide( not bPriestFound );
	Controls.InellectualHeader:SetHide( not bInellectualFound );
	Controls.LaborerHeader:SetHide( not bLaborerFound );
	Controls.EnvironmentHeader:SetHide( not bEnvironmentFound );
	Controls.GuideHeader:SetHide( not bGuideFound );
	Controls.DoctorHeader:SetHide( not bDoctorFound );
	Controls.TranscendHeader:SetHide( not bTranscendFound );

	Controls.ArtistStack:CalculateSize();
	Controls.ArtistStack:ReprocessAnchoring();
	Controls.EngineerStack:CalculateSize();
	Controls.EngineerStack:ReprocessAnchoring();
	Controls.MerchantStack:CalculateSize();
	Controls.MerchantStack:ReprocessAnchoring();
	Controls.MusicianStack:CalculateSize();
	Controls.MusicianStack:ReprocessAnchoring();
	Controls.ScientistStack:CalculateSize();
	Controls.ScientistStack:ReprocessAnchoring();
	Controls.WriterStack:CalculateSize();
	Controls.WriterStack:ReprocessAnchoring();
	Controls.EntertainerStack:CalculateSize();
	Controls.EntertainerStack:ReprocessAnchoring();
	Controls.EnergyStack:CalculateSize();
	Controls.EnergyStack:ReprocessAnchoring();
	Controls.PriestStack:CalculateSize();
	Controls.PriestStack:ReprocessAnchoring();
	Controls.IntellectualStack:CalculateSize();
	Controls.IntellectualStack:ReprocessAnchoring();
	Controls.LaborerStack:CalculateSize();
	Controls.LaborerStack:ReprocessAnchoring();
	Controls.EnvironmentStack:CalculateSize();
	Controls.EnvironmentStack:ReprocessAnchoring();	
	Controls.GuideStack:CalculateSize();
	Controls.GuideStack:ReprocessAnchoring();
	Controls.DoctorStack:CalculateSize();
	Controls.DoctorStack:ReprocessAnchoring();		
	Controls.TranscendStack:CalculateSize();
	Controls.TranscendStack:ReprocessAnchoring();	

	Controls.MainStack:CalculateSize();
	Controls.MainStack:ReprocessAnchoring();

	Controls.ScrollPanel:CalculateInternalSize();
	Controls.ScrollPanel:ReprocessAnchoring();
end

-------------------------------------------------
-------------------------------------------------
--check if player has any GPs being built
function checkIfGP(player) 
	for pCity in player:Cities() do
		for pSpecialistInfo in GameInfo.Specialists() do	
			local iSpecialistIndex =  pSpecialistInfo.ID;			
			local iProgress = pCity:GetSpecialistGreatPersonProgress(iSpecialistIndex);	
			if(iProgress>0) then
				return true;
			end
		end
	end
	return false;
end

-------------------------------------------------
-------------------------------------------------
--check if player has any of a specific Specialist being built
function checkIfSpecialist(player, specialist, city) 
	local iSpecialistIndex =  specialist.ID;			
	local iProgress = city:GetSpecialistGreatPersonProgress(iSpecialistIndex);	
	if(iProgress>0) then
		return true;
	end
	return false;
end

-------------------------------------------------
-------------------------------------------------
--given a city and GP, returns the progress per turn
function getRateOfChange(city, specialistInfo, player)
	local iCount = city:GetSpecialistCount( specialistInfo.ID );
	local iGPPChange = specialistInfo.GreatPeopleRateChange * iCount * 10;
	for building in GameInfo.Buildings() do
		local buildingID = building.ID;
		if building.SpecialistType == specialistInfo.Type then
			if (city:IsHasBuilding(buildingID)) then
				iGPPChange = iGPPChange + building.GreatPeopleRateChange * 10;
			end
		end
	end
	if iGPPChange > 0 then
		local iMod = 0;
		
		-- Generic GP mods
		local iPlayerMod = player:GetGreatPeopleRateModifier();
		local iCityMod = city:GetGreatPeopleRateModifier();
		local iGoldenAgeMod = 0;
		local bGoldenAge = (player:GetGoldenAgeTurns() > 0);
		
		-- GP mods by type		
		if (specialistInfo.GreatPeopleUnitClass == "UNITCLASS_WRITER") then
			iPlayerMod = iPlayerMod + player:GetGreatWriterRateModifier();
			if (bGoldenAge and player:GetGoldenAgeGreatWriterRateModifier() > 0) then
				iGoldenAgeMod = iGoldenAgeMod + player:GetGoldenAgeGreatWriterRateModifier();
			end
		elseif (specialistInfo.GreatPeopleUnitClass == "UNITCLASS_ARTIST") then
			iPlayerMod = iPlayerMod + player:GetGreatArtistRateModifier();
			if (bGoldenAge and player:GetGoldenAgeGreatArtistRateModifier() > 0) then
				iGoldenAgeMod = iGoldenAgeMod + player:GetGoldenAgeGreatArtistRateModifier();
			end
		elseif (specialistInfo.GreatPeopleUnitClass == "UNITCLASS_MUSICIAN") then
			iPlayerMod = iPlayerMod + player:GetGreatMusicianRateModifier();
			if (bGoldenAge and player:GetGoldenAgeGreatMusicianRateModifier() > 0) then
				iGoldenAgeMod = iGoldenAgeMod + player:GetGoldenAgeGreatMusicianRateModifier();
			end
		elseif (specialistInfo.GreatPeopleUnitClass == "UNITCLASS_SCIENTIST") then
			iPlayerMod = iPlayerMod + player:GetGreatScientistRateModifier();
		elseif (specialistInfo.GreatPeopleUnitClass == "UNITCLASS_MERCHANT") then
			iPlayerMod = iPlayerMod + player:GetGreatMerchantRateModifier();
		elseif (specialistInfo.GreatPeopleUnitClass == "UNITCLASS_ENGINEER") then
			iPlayerMod = iPlayerMod + player:GetGreatEngineerRateModifier();
		elseif (specialistInfo.GreatPeopleUnitClass == "SPECIALIST_ENTERTAINER") then
			iPlayerMod = iPlayerMod + player:GetGreatEntertainerRateModifier();
			print(player:GetGreatEntertainerRateModifier());
		elseif (specialistInfo.GreatPeopleUnitClass == "SPECIALIST_ENERGY") then
			iPlayerMod = iPlayerMod + player:GetGreatElectricianRateModifier();
			print(player:GetGreatElectricianRateModifier());
		elseif (specialistInfo.GreatPeopleUnitClass == "SPECIALIST_PRIEST") then
			iPlayerMod = iPlayerMod + player:GetGreatProphetRateModifier();	
			print(player:GetGreatProphetRateModifier());
		elseif (specialistInfo.GreatPeopleUnitClass == "SPECIALIST_INTELLECTUAL") then
			iPlayerMod = iPlayerMod + player:GetGreatIntellectualRateModifier();
			print(player:GetGreatIntellectualRateModifier());
		elseif (specialistInfo.GreatPeopleUnitClass == "SPECIALIST_LABORER") then
			iPlayerMod = iPlayerMod + player:GetGreatLaborerRateModifier();
			print(player:GetGreatLaborerRateModifier());
		elseif (specialistInfo.GreatPeopleUnitClass == "SPECIALIST_ENVIRONMENT") then
			iPlayerMod = iPlayerMod + player:GetGreatEnvironmentRateModifier();
			print(player:GetGreatEnvironmentRateModifier());
		elseif (specialistInfo.GreatPeopleUnitClass == "SPECIALIST_GUIDE") then
			iPlayerMod = iPlayerMod + player:GetGreatGuideRateModifier();
			print(player:GetGreatGuideRateModifier());
		elseif (specialistInfo.GreatPeopleUnitClass == "UNITCLASS_DOCTOR") then
			iPlayerMod = iPlayerMod + player:GetGreatDoctorRateModifier();
			print(player:GetGreatDoctorRateModifier());
	    elseif (specialistInfo.GreatPeopleUnitClass == "UNITCLASS_TRANSCEND") then
			iPlayerMod = iPlayerMod + player:GetGreatTranscendRateModifier();
			print(player:GetGreatTranscendRateModifier());
		end
		
		local iMod = iPlayerMod + iCityMod + iGoldenAgeMod;
		iGPPChange = (iGPPChange * (100 + iMod)) / 100;
		
		return math.floor(iGPPChange/100);
	else
		return 0;
	end
end

-------------------------------------------------
-------------------------------------------------
function OnArtistToggle()
	local bWasHidden = Controls.ArtistStack:IsHidden();
	Controls.ArtistStack:SetHide( not bWasHidden );
	if( bWasHidden ) then
		Controls.ArtistToggle:LocalizeAndSetText("TXT_KEY_GP_ARTIST_DETAILS_COLLAPSE");
	else
		Controls.ArtistToggle:LocalizeAndSetText("TXT_KEY_GP_ARTIST_DETAILS");
	end
	Controls.MainStack:CalculateSize();
	Controls.MainStack:ReprocessAnchoring();
	Controls.ScrollPanel:CalculateInternalSize();
	Controls.ScrollPanel:ReprocessAnchoring();
end
Controls.ArtistToggle:RegisterCallback( Mouse.eLClick, OnArtistToggle );

-------------------------------------------------
-------------------------------------------------
function OnEngineerToggle()
	local bWasHidden = Controls.EngineerStack:IsHidden();
	Controls.EngineerStack:SetHide( not bWasHidden );
	if( bWasHidden ) then
		Controls.EngineerToggle:LocalizeAndSetText("TXT_KEY_GP_ENGINEER_DETAILS_COLLAPSE");
	else
		Controls.EngineerToggle:LocalizeAndSetText("TXT_KEY_GP_ENGINEER_DETAILS");
	end
	Controls.MainStack:CalculateSize();
	Controls.MainStack:ReprocessAnchoring();
	Controls.ScrollPanel:CalculateInternalSize();
	Controls.ScrollPanel:ReprocessAnchoring();
end
Controls.EngineerToggle:RegisterCallback( Mouse.eLClick, OnEngineerToggle );

-------------------------------------------------
-------------------------------------------------
function OnMerchantToggle()
	local bWasHidden = Controls.MerchantStack:IsHidden();
	Controls.MerchantStack:SetHide( not bWasHidden );
	if( bWasHidden ) then
		Controls.MerchantToggle:LocalizeAndSetText("TXT_KEY_GP_MERCHANT_DETAILS_COLLAPSE");
	else
		Controls.MerchantToggle:LocalizeAndSetText("TXT_KEY_GP_MERCHANT_DETAILS");
	end
	Controls.MainStack:CalculateSize();
	Controls.MainStack:ReprocessAnchoring();
	Controls.ScrollPanel:CalculateInternalSize();
	Controls.ScrollPanel:ReprocessAnchoring();
end
Controls.MerchantToggle:RegisterCallback( Mouse.eLClick, OnMerchantToggle );

-------------------------------------------------
-------------------------------------------------
function OnMusicianToggle()
	local bWasHidden = Controls.MusicianStack:IsHidden();
	Controls.MusicianStack:SetHide( not bWasHidden );
	if( bWasHidden ) then
		Controls.MusicianToggle:LocalizeAndSetText("TXT_KEY_GP_MUSICIAN_DETAILS_COLLAPSE");
	else
		Controls.MusicianToggle:LocalizeAndSetText("TXT_KEY_GP_MUSICIAN_DETAILS");
	end
	Controls.MainStack:CalculateSize();
	Controls.MainStack:ReprocessAnchoring();
	Controls.ScrollPanel:CalculateInternalSize();
	Controls.ScrollPanel:ReprocessAnchoring();
end
Controls.MusicianToggle:RegisterCallback( Mouse.eLClick, OnMusicianToggle );

-------------------------------------------------
-------------------------------------------------
function OnScientistToggle()
	local bWasHidden = Controls.ScientistStack:IsHidden();
	Controls.ScientistStack:SetHide( not bWasHidden );
	if( bWasHidden ) then
		Controls.ScientistToggle:LocalizeAndSetText("TXT_KEY_GP_SCIENTIST_DETAILS_COLLAPSE");
	else
		Controls.ScientistToggle:LocalizeAndSetText("TXT_KEY_GP_SCIENTIST_DETAILS");
	end
	Controls.MainStack:CalculateSize();
	Controls.MainStack:ReprocessAnchoring();
	Controls.ScrollPanel:CalculateInternalSize();
	Controls.ScrollPanel:ReprocessAnchoring();
end
Controls.ScientistToggle:RegisterCallback( Mouse.eLClick, OnScientistToggle );

-------------------------------------------------
-------------------------------------------------
function OnWriterToggle()
	local bWasHidden = Controls.WriterStack:IsHidden();
	Controls.WriterStack:SetHide( not bWasHidden );
	if( bWasHidden ) then
		Controls.WriterToggle:LocalizeAndSetText("TXT_KEY_GP_WRITER_DETAILS_COLLAPSE");
	else
		Controls.WriterToggle:LocalizeAndSetText("TXT_KEY_GP_WRITER_DETAILS");
	end
	Controls.MainStack:CalculateSize();
	Controls.MainStack:ReprocessAnchoring();
	Controls.ScrollPanel:CalculateInternalSize();
	Controls.ScrollPanel:ReprocessAnchoring();
end
Controls.WriterToggle:RegisterCallback( Mouse.eLClick, OnWriterToggle );

-------------------------------------------------
-------------------------------------------------
function OnEntertainerToggle()
	local bWasHidden = Controls.EntertainerStack:IsHidden();
	Controls.EntertainerStack:SetHide( not bWasHidden );
	if( bWasHidden ) then
		Controls.EntertainerToggle:LocalizeAndSetText("TXT_KEY_GP_ENTERTAINER_DETAILS_COLLAPSE");
	else
		Controls.EntertainerToggle:LocalizeAndSetText("TXT_KEY_GP_Entertainer_DETAILS");
	end
	Controls.MainStack:CalculateSize();
	Controls.MainStack:ReprocessAnchoring();
	Controls.ScrollPanel:CalculateInternalSize();
	Controls.ScrollPanel:ReprocessAnchoring();
end
Controls.EntertainerToggle:RegisterCallback( Mouse.eLClick, OnEntertainerToggle );

-------------------------------------------------
-------------------------------------------------
function OnEnergyToggle()
	local bWasHidden = Controls.EnergyStack:IsHidden();
	Controls.EnergyStack:SetHide( not bWasHidden );
	if( bWasHidden ) then
		Controls.EnergyToggle:LocalizeAndSetText("TXT_KEY_GP_ENERGY_DETAILS_COLLAPSE");
	else
		Controls.EnergyToggle:LocalizeAndSetText("TXT_KEY_GP_ENERGY_DETAILS");
	end
	Controls.MainStack:CalculateSize();
	Controls.MainStack:ReprocessAnchoring();
	Controls.ScrollPanel:CalculateInternalSize();
	Controls.ScrollPanel:ReprocessAnchoring();
end
Controls.EnergyToggle:RegisterCallback( Mouse.eLClick, OnEnergyToggle );

-------------------------------------------------
-------------------------------------------------
function OnPriestToggle()
	local bWasHidden = Controls.PriestStack:IsHidden();
	Controls.PriestStack:SetHide( not bWasHidden );
	if( bWasHidden ) then
		Controls.PriestToggle:LocalizeAndSetText("TXT_KEY_GP_PRIEST_DETAILS_COLLAPSE");
	else
		Controls.PriestToggle:LocalizeAndSetText("TXT_KEY_GP_PRIEST_DETAILS");
	end
	Controls.MainStack:CalculateSize();
	Controls.MainStack:ReprocessAnchoring();
	Controls.ScrollPanel:CalculateInternalSize();
	Controls.ScrollPanel:ReprocessAnchoring();
end
Controls.PriestToggle:RegisterCallback( Mouse.eLClick, OnPriestToggle );

-------------------------------------------------
-------------------------------------------------
function OnIntellectualToggle()
	local bWasHidden = Controls.IntellectualStack:IsHidden();
	Controls.IntellectualStack:SetHide( not bWasHidden );
	if( bWasHidden ) then
		Controls.IntellectualToggle:LocalizeAndSetText("TXT_KEY_GP_INTELLECTUAL_DETAILS_COLLAPSE");
	else
		Controls.IntellectualToggle:LocalizeAndSetText("TXT_KEY_GP_INTELLECTUAL_DETAILS");
	end
	Controls.MainStack:CalculateSize();
	Controls.MainStack:ReprocessAnchoring();
	Controls.ScrollPanel:CalculateInternalSize();
	Controls.ScrollPanel:ReprocessAnchoring();
end
Controls.IntellectualToggle:RegisterCallback( Mouse.eLClick, OnIntellectualToggle );

-------------------------------------------------
-------------------------------------------------
function OnLaborerToggle()
	local bWasHidden = Controls.LaborerStack:IsHidden();
	Controls.LaborerStack:SetHide( not bWasHidden );
	if( bWasHidden ) then
		Controls.LaborerToggle:LocalizeAndSetText("TXT_KEY_GP_LABORER_DETAILS_COLLAPSE");
	else
		Controls.LaborertToggle:LocalizeAndSetText("TXT_KEY_GP_LABORER_DETAILS");
	end
	Controls.MainStack:CalculateSize();
	Controls.MainStack:ReprocessAnchoring();
	Controls.ScrollPanel:CalculateInternalSize();
	Controls.ScrollPanel:ReprocessAnchoring();
end
Controls.LaborerToggle:RegisterCallback( Mouse.eLClick, OnLaborerToggle );

-------------------------------------------------
-------------------------------------------------
function OnEnvironmentToggle()
	local bWasHidden = Controls.EnvironmentStack:IsHidden();
	Controls.EnvironmentStack:SetHide( not bWasHidden );
	if( bWasHidden ) then
		Controls.EnvironmentToggle:LocalizeAndSetText("TXT_KEY_GP_ENVIRONMENT_DETAILS_COLLAPSE");
	else
		Controls.EnvironmentToggle:LocalizeAndSetText("TXT_KEY_GP_ENVIRONMENT_DETAILS");
	end
	Controls.MainStack:CalculateSize();
	Controls.MainStack:ReprocessAnchoring();
	Controls.ScrollPanel:CalculateInternalSize();
	Controls.ScrollPanel:ReprocessAnchoring();
end
Controls.EnvironmentToggle:RegisterCallback( Mouse.eLClick, OnEnvironmentToggle );

-------------------------------------------------
-------------------------------------------------
function OnGuideToggle()
	local bWasHidden = Controls.GuideStack:IsHidden();
	Controls.GuideStack:SetHide( not bWasHidden );
	if( bWasHidden ) then
		Controls.GuideToggle:LocalizeAndSetText("TXT_KEY_GP_GUIDE_DETAILS_COLLAPSE");
	else
		Controls.GuideToggle:LocalizeAndSetText("TXT_KEY_GP_GUIDE_DETAILS");
	end
	Controls.MainStack:CalculateSize();
	Controls.MainStack:ReprocessAnchoring();
	Controls.ScrollPanel:CalculateInternalSize();
	Controls.ScrollPanel:ReprocessAnchoring();
end
Controls.GuideToggle:RegisterCallback( Mouse.eLClick, OnGuideToggle );

-------------------------------------------------
-------------------------------------------------
function OnDoctorToggle()
	local bWasHidden = Controls.DoctorStack:IsHidden();
	Controls.DoctorStack:SetHide( not bWasHidden );
	if( bWasHidden ) then
		Controls.DoctorToggle:LocalizeAndSetText("TXT_KEY_GP_DOCTOR_DETAILS_COLLAPSE");
	else
		Controls.DoctorToggle:LocalizeAndSetText("TXT_KEY_GP_DOCTOR_DETAILS");
	end
	Controls.MainStack:CalculateSize();
	Controls.MainStack:ReprocessAnchoring();
	Controls.ScrollPanel:CalculateInternalSize();
	Controls.ScrollPanel:ReprocessAnchoring();
end
Controls.DoctorToggle:RegisterCallback( Mouse.eLClick, OnDoctorToggle );

-------------------------------------------------
-------------------------------------------------
--function OnTranscendToggle()
--	local bWasHidden = Controls.TranscendStack:IsHidden();
--	Controls.TranscendStack:SetHide( not bWasHidden );
--	if( bWasHidden ) then
--		Controls.TranscendToggle:LocalizeAndSetText("TXT_KEY_GP_TRANSCEND_DETAILS_COLLAPSE");
--	else
--		Controls.TranscendToggle:LocalizeAndSetText("TXT_KEY_GP_TRANSCEND_DETAILS");
--	end
----	Controls.MainStack:CalculateSize();
--	Controls.MainStack:ReprocessAnchoring();
--	Controls.ScrollPanel:CalculateInternalSize();
--	Controls.ScrollPanel:ReprocessAnchoring();
--end
--Controls.TranscendToggle:RegisterCallback( Mouse.eLClick, OnTranscendToggle );
-------------------------------------------------
-------------------------------------------------
function SortFunction( a, b )
	local valueA, valueB;
	local entryA = m_SortTable[ tostring( a ) ];
	local entryB = m_SortTable[ tostring( b ) ];
	
	if (entryA == nil) or (entryB == nil) then 
		if entryA and (entryB == nil) then
			return false;
		elseif (entryA == nil) and entryB then
			return true;
		else
			if( m_bSortReverse ) then
				return tostring(a) > tostring(b); -- gotta do something deterministic
			else
				return tostring(a) < tostring(b); -- gotta do something deterministic
			end
		end
	else
		if( m_SortMode == eCity ) then
			valueA = entryA.name;
			valueB = entryB.name;
		elseif( m_SortMode == eTurns ) then
			valueA = entryA.turns;
			valueB = entryB.turns;
			if (valueA == -1) then
				valueA = 9999;
			end
			if (valueB == -1) then
				valueB = 9999;
			end
		end
		
		if( valueA == valueB ) then
			valueA = entryA.cityID;
			valueB = entryB.cityID;
		end
		
		if( m_bSortReverse ) then
			return valueA > valueB;
		else
			return valueA < valueB;
		end
	end
end

-------------------------------------------------
-------------------------------------------------
function OnSort( type )
	if( m_SortMode == type ) then
		m_bSortReverse = not m_bSortReverse;
	else
		m_bSortReverse = false;
	end

	m_SortMode = type;
	Controls.ArtistStack:SortChildren( SortFunction );
	Controls.EngineerStack:SortChildren( SortFunction );
	Controls.MerchantStack:SortChildren( SortFunction );
	Controls.ScientistStack:SortChildren( SortFunction );
end
Controls.SortCity:RegisterCallback( Mouse.eLClick, OnSort );
Controls.SortTurns:RegisterCallback( Mouse.eLClick, OnSort );
Controls.SortCity:SetVoid1( eCity );
Controls.SortTurns:SetVoid1( eTurns );

-------------------------------------------------
-------------------------------------------------
function OnOpenInfoCorner( iInfoType )
	if( iInfoType == InfoCornerID.GP ) then
		ContextPtr:SetHide( false );
	else
		ContextPtr:SetHide( true );
	end
end
Events.OpenInfoCorner.Add( OnOpenInfoCorner );

-------------------------------------------------
-------------------------------------------------
function OnCityClick( x, y )
    local plot = Map.GetPlot( x, y );
    if( plot ~= nil ) then
    	UI.DoSelectCityAtPlot( plot );
	end
end
	
-------------------------------------------------
-------------------------------------------------
function OnCityRClick( x, y )
    local plot = Map.GetPlot( x, y );
    if( plot ~= nil ) then
    	UI.LookAt( plot );
	end
end