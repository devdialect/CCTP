if(Game.GetCustomOption("GAMEOPTION_CCTP_EVENTS") == 0) then
	return;
end
-- TaxPopUp
-- Author: gyogen
-- DateCreated: 11/27/2014 12:04:23 PM
--------------------------------------------------------------
include("EventSaveData.lua");

--Taxes
local basePopIncome = 2

--------------------------------------------------------------
local fTax = GetPersistentProperty("fTax") or -1
if fTax == -1 then fTax = 0 end


function OnTaxSliderValueChanged(fValue)
	 local iTax = math.floor(fValue * 100)
	 Controls.TaxValue:SetText(iTax)
	 fTax = fValue
	 SetTax()
end
Controls.TaxSlider:RegisterSliderCallback(OnTaxSliderValueChanged)

function OnTaxValueChanged(sValue, control, bFire)
	 if (bFire) then
	 local iValue = tonumber(sValue)
		 if (iValue < 0) then
		 iValue = 0
		 elseif (iValue > 100) then
		 iValue = 100
		 end
		 fTax = iValue/100

 Controls.TaxValue:SetText(tostring(iValue))
 Controls.TaxSlider:SetValue(fTax)
 
	SetTax()
	 end
end
Controls.TaxValue:RegisterCallback(OnTaxValueChanged)

function SetTax()
	local playerID = Game.GetActivePlayer();
	local pPlayer = Players[playerID];
	local iCivPop = pPlayer:GetTotalPopulation();
	local iTaxes = GameInfoTypes["RESOURCE_TAXES"];
	local iCurrTaxes =  pPlayer:GetNumResourceTotal(iTaxes);
	pPlayer:ChangeNumResourceTotal(iTaxes, -iCurrTaxes);
	local iTaxBase = math.ceil((iCivPop * basePopIncome) * fTax);
	pPlayer:ChangeNumResourceTotal(iTaxes, iTaxBase);
	local iNewTaxes =  pPlayer:GetNumResourceTotal(iTaxes);
	Controls.TaxBase:LocalizeAndSetText("TXT_KEY_TAX_BASE", iNewTaxes);
	local taxVal = math.ceil(fTax * 100)
		
		 if taxVal <= 10 then
			taxString = Locale.ConvertTextKey( "TXT_KEY_TAX_ADVICEA" );
		elseif taxVal >10 and taxVal <=25 then
			taxString = Locale.ConvertTextKey( "TXT_KEY_TAX_ADVICEB" );
		elseif taxVal >25 and taxVal <=40 then
			local iNegHappy = (taxVal / 10);
			taxString = Locale.ConvertTextKey( "TXT_KEY_TAX_ADVICEC", iNegHappy );
		elseif taxVal >40 then
			local iNegHappy = (taxVal / 5);
			taxString = Locale.ConvertTextKey( "TXT_KEY_TAX_ADVICED", iNegHappy );
		end
		Controls.TaxAdvice:SetText(taxString);
	SetPersistentProperty("fTax", fTax);
end
Controls.TaxValue:SetText(fTax*100)
Controls.TaxSlider:SetValue(fTax)

--------------------------------------------------------------------


function Init()
 ContextPtr:SetHide(true)

end
Init()

