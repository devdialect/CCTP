-- GW_Meter
-- Author: FramedArchitecture
-- DateCreated: 4/25/2013
--------------------------------------------------------------
local g_TopPanelToolTip = {}
TTManager:GetTypeControlTable("TooltipTypeTopPanel", g_TopPanelToolTip)

function ByScore(iPlayerA, iPlayerB)
	local iValueA = Players[iPlayerA]:GetScore()
	local iValueB = Players[iPlayerB]:GetScore()
	if (iValueA ~= iValueB) then
		-- Player with highest score comes first
		return iValueA > iValueB
	else
		-- otherwise player with lowest id comes first
		return iPlayerA < iPlayerB
	end
end

function GetMetMajorCivs(fnSort)
	local players = {}
	local iActivePlayer = Game.GetActivePlayer()
	local pActiveTeam = Teams[Game.GetActivePlayer()]
	for iPlayer = 0, GameDefines.MAX_MAJOR_CIVS do
		local pPlayer = Players[iPlayer]
		if (pPlayer:IsEverAlive()) then
			if (iPlayer == iActivePlayer or
				pActiveTeam:IsHasMet(pPlayer:GetTeam())) then
				table.insert(players, iPlayer)
			end
		end
	end
	if (type(fnSort) == "function") then
		table.sort(players, fnSort)
	end
	return players
end

function GetScoreToolTip()
	local sToolTip = ""
	local sPrefix = ""
	for _, iPlayer in ipairs(GetMetMajorCivs(ByScore)) do
		local pPlayer = Players[iPlayer]
		local sCiv = Locale.ConvertTextKey(GameInfo.Civilizations[pPlayer:GetCivilizationType()].ShortDescription)
		local sEra = Locale.ConvertTextKey(GameInfo.Eras[pPlayer:GetCurrentEra()].Description)
		local iScore = pPlayer:GetScore()
		sToolTip = string.format("%s%s%i:[COLOR_POSITIVE_TEXT]%s[ENDCOLOR] (%s)", sToolTip, sPrefix, iScore, sCiv, sEra)
		sPrefix = "[NEWLINE]"
	end
	return sToolTip
end

function ScoreTipHandler()
	g_TopPanelToolTip.TooltipLabel:SetText(GetScoreToolTip())
	g_TopPanelToolTip.TopPanelMouseover:SetHide(false)
	g_TopPanelToolTip.TopPanelMouseover:DoAutoSize()
end

function Init()
	local tabScore = {}
	ContextPtr:BuildInstanceForControl("TabItem", tabScore, Controls.TabStack)
	tabScore.Tab:SetToolTipCallback(ScoreTipHandler)
	tabScore.TabIn:SetText("[ICON_CAPITAL]")
	tabScore.TabOut:LocalizeAndSetText("TXT_KEY_TEST_FEEDBACK_SCORE")
end
Init()