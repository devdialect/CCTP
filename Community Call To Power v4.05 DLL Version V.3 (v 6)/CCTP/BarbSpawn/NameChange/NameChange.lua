-- NameChange
-- Author: Leugi
-- DateCreated: 2/26/2014 9:46:42 AM
--------------------------------------------------------------
print("name change started")
function BarbNameChange (pPlayer)
local eratype = pPlayer:GetCurrentEra();
				if eratype == 0 then
					str = "Savage";
					dsc = "Savage Tribes";
					name = "Savages";
					camp = "Savage Encampment";
					plunder0 = "Filthy Savages plundered the trade route you established between {1_CityName} and {2_CityName}.";
					plunder1 = "Savages plundered the trade route {1_PlayerName} established between {2_CityName} and {3_CityName}";
					csquest0 = "We want you to defeat Savages that are invading our territory.";
					csquest1 = "They want you to defeat Savages units that are invading their territory.";
					csquest2 = "They will reward the player that destroys a nearby Savage Encampment.";
					csquest3 = "You have successfully destroyed the Savage Encampment as requested by {1_MinorCivName:textkey}! Your [ICON_INFLUENCE] Influence over them has increased by [COLOR_POSITIVE_TEXT]{2_InfluenceReward}[ENDCOLOR].";
					csquest4 = "There is still that Savage Encampment nearby that we would like someone to take care of.";
					csquest5 = "They want a nearby Savage Encampment destroyed.";
					csquest6 = "{1_CivName:textkey} requests your assistance against invading Savages! Each Savage you kill will earn you [ICON_INFLUENCE] Influence over the City-State.";
					csquest7 = "{1_CivName:textkey} no longer needs your assistance against the Savages.";
					discover = "A Savage Encampment has been discovered! It will create Savage units until dispersed!";
					kill0 = "You have killed a group of Savages near {1_CivName:textkey}! They are grateful, and your [ICON_INFLUENCE] Influence with them has increased by 12!";
					kill1 = "Savage killed near {1_CivName:textkey}!";
					raid0 = "Your City of {@1_CityName} was raided by Savages, and {2_Num} Gold was stolen from the national treasury!";
					raid1 = "The Savages have killed your {@1_UnitName} because you refused to pay their ransom!";
					clear0 = "You have dispersed a villainous Savage Encampment and recovered {1_NumGold} [ICON_GOLD] Gold from it!";
					clear1 = "Savage Encampment Cleared!";
					capture0 = "A civilian was captured by Savages!";
					capture1 = "{TXT_KEY_GRAMMAR_UPPER_A_AN &lt;&lt; {@1_UnitName}} was captured by the Savages! They will take it to their nearest Encampment. If you wish to recover your unit you will have to track it down!";
					capture2 = "The Savages have captured one of your civilian Units! They are requesting {1_Num} Gold in exchange for the lives of your subjects. What is your response?";
					discover2 = "Savage Encampment discovered";
				elseif eratype == 1 then
					str = "Barbarian";
					name = "Barbarians";
					dsc = "Barbarian Horde";
					camp = "Barbarian Encampment";
					plunder0 = "Filthy barbarians plundered the trade route you established between {1_CityName} and {2_CityName}.";
					plunder1 = "Barbarians plundered the trade route {1_PlayerName} established between {2_CityName} and {3_CityName}";
					csquest0 = "We want you to defeat Barbarians that are invading our territory.";
					csquest1 = "They want you to defeat Barbarian units that are invading their territory.";
					csquest2 = "They will reward the player that destroys a nearby Barbarian Encampment.";
					csquest3 = "You have successfully destroyed the Barbarian Encampment as requested by {1_MinorCivName:textkey}! Your [ICON_INFLUENCE] Influence over them has increased by [COLOR_POSITIVE_TEXT]{2_InfluenceReward}[ENDCOLOR].";
					csquest4 = "There is still that Barbarian Encampment nearby that we would like someone to take care of.";
					csquest5 = "They want a nearby Barbarian Encampment destroyed.";
					csquest6 = "{1_CivName:textkey} requests your assistance against invading Barbarians! Each Barbarian you kill will earn you [ICON_INFLUENCE] Influence over the City-State.";
					csquest7 = "{1_CivName:textkey} no longer needs your assistance against the Barbarians.";
					discover = "A Barbarian Encampment has been discovered! It will create Barbarian units until dispersed!";
					kill0 = "You have killed a group of Barbarians near {1_CivName:textkey}! They are grateful, and your [ICON_INFLUENCE] Influence with them has increased by 12!";
					kill1 = "Barbarian killed near {1_CivName:textkey}!";
					raid0 = "Your City of {@1_CityName} was raided by Barbarians, and {2_Num} Gold was stolen from the national treasury!";
					raid1 = "The Barbarians have killed your {@1_UnitName} because you refused to pay their ransom!";
					clear0 = "You have dispersed a villainous Barbarian Encampment and recovered {1_NumGold} [ICON_GOLD] Gold from it!";
					clear1 = "Barbarian Encampment Cleared!";
					capture0 = "A civilian was captured by Barbarians!";
					capture1 = "{TXT_KEY_GRAMMAR_UPPER_A_AN &lt;&lt; {@1_UnitName}} was captured by the Barbarians! They will take it to their nearest Encampment. If you wish to recover your unit you will have to track it down!";
					capture2 = "The Barbarians have captured one of your civilian Units! They are requesting {1_Num} Gold in exchange for the lives of your subjects. What is your response?";
					discover2 = "Barbarian Encampment discovered";
				elseif eratype == 2 then
					str = "Brigand";
					dsc = "Brigandage";
					name = "Brigands";
					camp = "Brigand Encampment";
					plunder0 = "Filthy brigands plundered the trade route you established between {1_CityName} and {2_CityName}.";
					plunder1 = "Brigands plundered the trade route {1_PlayerName} established between {2_CityName} and {3_CityName}";
					csquest0 = "We want you to defeat Brigands that are invading our territory.";
					csquest1 = "They want you to defeat Brigand units that are invading their territory.";
					csquest2 = "They will reward the player that destroys a nearby Brigand Encampment.";
					csquest3 = "You have successfully destroyed the Brigand Encampment as requested by {1_MinorCivName:textkey}! Your [ICON_INFLUENCE] Influence over them has increased by [COLOR_POSITIVE_TEXT]{2_InfluenceReward}[ENDCOLOR].";
					csquest4 = "There is still that Brigand Encampment nearby that we would like someone to take care of.";
					csquest5 = "They want a nearby Brigand Encampment destroyed.";
					csquest6 = "{1_CivName:textkey} requests your assistance against invading Brigands! Each Brigand you kill will earn you [ICON_INFLUENCE] Influence over the City-State.";
					csquest7 = "{1_CivName:textkey} no longer needs your assistance against the Brigands.";
					discover = "A Brigand Encampment has been discovered! It will create Brigand units until dispersed!";
					kill0 = "You have killed a group of Brigands near {1_CivName:textkey}! They are grateful, and your [ICON_INFLUENCE] Influence with them has increased by 12!";
					kill1 = "Brigand killed near {1_CivName:textkey}!";
					raid0 = "Your City of {@1_CityName} was raided by Brigands, and {2_Num} Gold was stolen from the national treasury!";
					raid1 = "The Brigands have killed your {@1_UnitName} because you refused to pay their ransom!";
					clear0 = "You have dispersed a villainous Brigand Encampment and recovered {1_NumGold} [ICON_GOLD] Gold from it!";
					clear1 = "Brigand Encampment Cleared!";
					capture0 = "A civilian was captured by Brigands!";
					capture1 = "{TXT_KEY_GRAMMAR_UPPER_A_AN &lt;&lt; {@1_UnitName}} was captured by the Brigands! They will take it to their nearest Encampment. If you wish to recover your unit you will have to track it down!";
					capture2 = "The Brigands have captured one of your civilian Units! They are requesting {1_Num} Gold in exchange for the lives of your subjects. What is your response?";
					discover2 = "Brigand Encampment discovered";
				elseif eratype == 3 then
					str = "Vandal";
					dsc = "Vandal Kingdom";
					name = "Vandals";
					camp = "Visigoth Encampment";
					plunder0 = "Filthy Visigoths plundered the trade route you established between {1_CityName} and {2_CityName}.";
					plunder1 = "Visigoths plundered the trade route {1_PlayerName} established between {2_CityName} and {3_CityName}";
					csquest0 = "We want you to defeat Visigoths that are invading our territory.";
					csquest1 = "They want you to defeat Visigoth units that are invading their territory.";
					csquest2 = "They will reward the player that destroys a nearby Visigoth Encampment.";
					csquest3 = "You have successfully destroyed the Visigoth Encampment as requested by {1_MinorCivName:textkey}! Your [ICON_INFLUENCE] Influence over them has increased by [COLOR_POSITIVE_TEXT]{2_InfluenceReward}[ENDCOLOR].";
					csquest4 = "There is still that Visigoth Encampment nearby that we would like someone to take care of.";
					csquest5 = "They want a nearby Visigoth Encampment destroyed.";
					csquest6 = "{1_CivName:textkey} requests your assistance against invading Visigoths! Each Visigoth you kill will earn you [ICON_INFLUENCE] Influence over the City-State.";
					csquest7 = "{1_CivName:textkey} no longer needs your assistance against the Visigoths.";
					discover = "A Visigoth Encampment has been discovered! It will create Pirate units until dispersed!";
					kill0 = "You have killed a group of Visigoths near {1_CivName:textkey}! They are grateful, and your [ICON_INFLUENCE] Influence with them has increased by 12!";
					kill1 = "Pirate killed near {1_CivName:textkey}!";
					raid0 = "Your City of {@1_CityName} was raided by Visigoths, and {2_Num} Gold was stolen from the national treasury!";
					raid1 = "The Visigoths have killed your {@1_UnitName} because you refused to pay their ransom!";
					clear0 = "You have dispersed a villainous Visigoth Encampment and recovered {1_NumGold} [ICON_GOLD] Gold from it!";
					clear1 = "Visigoth Encampment Cleared!";
					capture0 = "A civilian was captured by Visigoths!";
					capture1 = "{TXT_KEY_GRAMMAR_UPPER_A_AN &lt;&lt; {@1_UnitName}} was captured by the Visigoths! They will take it to their nearest Encampment. If you wish to recover your unit you will have to track it down!";
					capture2 = "The Visigoths have captured one of your civilian Units! They are requesting {1_Num} Gold in exchange for the lives of your subjects. What is your response?";
					discover2 = "Visigoth Encampment discovered";
				elseif eratype == 4 then
					str = "Pirate";
					dsc = "Pirate Band";
					name = "Pirates";
					camp = "Pirate Encampment";
					plunder0 = "Filthy pirates plundered the trade route you established between {1_CityName} and {2_CityName}.";
					plunder1 = "Pirates plundered the trade route {1_PlayerName} established between {2_CityName} and {3_CityName}";
					csquest0 = "We want you to defeat Pirates that are invading our territory.";
					csquest1 = "They want you to defeat Pirate units that are invading their territory.";
					csquest2 = "They will reward the player that destroys a nearby Pirate Encampment.";
					csquest3 = "You have successfully destroyed the Pirate Encampment as requested by {1_MinorCivName:textkey}! Your [ICON_INFLUENCE] Influence over them has increased by [COLOR_POSITIVE_TEXT]{2_InfluenceReward}[ENDCOLOR].";
					csquest4 = "There is still that Pirate Encampment nearby that we would like someone to take care of.";
					csquest5 = "They want a nearby Pirate Encampment destroyed.";
					csquest6 = "{1_CivName:textkey} requests your assistance against invading Pirates! Each Pirate you kill will earn you [ICON_INFLUENCE] Influence over the City-State.";
					csquest7 = "{1_CivName:textkey} no longer needs your assistance against the Pirates.";
					discover = "A Pirate Encampment has been discovered! It will create Pirate units until dispersed!";
					kill0 = "You have killed a group of Pirates near {1_CivName:textkey}! They are grateful, and your [ICON_INFLUENCE] Influence with them has increased by 12!";
					kill1 = "Pirate killed near {1_CivName:textkey}!";
					raid0 = "Your City of {@1_CityName} was raided by Pirates, and {2_Num} Gold was stolen from the national treasury!";
					raid1 = "The Pirates have killed your {@1_UnitName} because you refused to pay their ransom!";
					clear0 = "You have dispersed a villainous Pirate Encampment and recovered {1_NumGold} [ICON_GOLD] Gold from it!";
					clear1 = "Pirate Encampment Cleared!";
					capture0 = "A civilian was captured by Pirates!";
					capture1 = "{TXT_KEY_GRAMMAR_UPPER_A_AN &lt;&lt; {@1_UnitName}} was captured by the Pirates! They will take it to their nearest Encampment. If you wish to recover your unit you will have to track it down!";
					capture2 = "The Pirates have captured one of your civilian Units! They are requesting {1_Num} Gold in exchange for the lives of your subjects. What is your response?";
					discover2 = "Pirate Encampment discovered";
					elseif eratype == 5 then
					str = "Rebel";
					dsc = "Rebel Confereracy";
					name = "Rebel";
					camp = "Rebel Base";
					plunder0 = "Filthy rebels plundered the trade route you established between {1_CityName} and {2_CityName}.";
					plunder1 = "Rebels plundered the trade route {1_PlayerName} established between {2_CityName} and {3_CityName}";
					csquest0 = "We want you to defeat Rebels that are invading our territory.";
					csquest1 = "They want you to defeat Rebel units that are invading their territory.";
					csquest2 = "They will reward the player that destroys a nearby Rebel Encampment.";
					csquest3 = "You have successfully destroyed the Rebel Encampment as requested by {1_MinorCivName:textkey}! Your [ICON_INFLUENCE] Influence over them has increased by [COLOR_POSITIVE_TEXT]{2_InfluenceReward}[ENDCOLOR].";
					csquest4 = "There is still that Rebel Encampment nearby that we would like someone to take care of.";
					csquest5 = "They want a nearby Rebel Encampment destroyed.";
					csquest6 = "{1_CivName:textkey} requests your assistance against invading Rebels! Each Rebel you kill will earn you [ICON_INFLUENCE] Influence over the City-State.";
					csquest7 = "{1_CivName:textkey} no longer needs your assistance against the Rebels.";
					discover = "A Rebel Encampment has been discovered! It will create Rebel units until dispersed!";
					kill0 = "You have killed a group of Rebels near {1_CivName:textkey}! They are grateful, and your [ICON_INFLUENCE] Influence with them has increased by 12!";
					kill1 = "Rebel killed near {1_CivName:textkey}!";
					raid0 = "Your City of {@1_CityName} was raided by Rebels, and {2_Num} Gold was stolen from the national treasury!";
					raid1 = "The Rebels have killed your {@1_UnitName} because you refused to pay heed to their demands!";
					clear0 = "You have dispersed a villainous Rebel Base and recovered {1_NumGold} [ICON_GOLD] Gold from it!";
					clear1 = "Rebel Base Cleared!";
					capture0 = "A civilian was captured by Rebels!";
					capture1 = "{TXT_KEY_GRAMMAR_UPPER_A_AN &lt;&lt; {@1_UnitName}} was captured by the Rebels! They will take it to their nearest Encampment. If you wish to recover your unit you will have to track it down!";
					capture2 = "The Rebels have captured one of your civilian Units! They are requesting {1_Num} Gold in exchange for the lives of your subjects. What is your response?";
					discover2 = "Rebel Base discovered";
				elseif eratype == 6 then
					str = "Terrorist";
					dsc = "Terrorist State";
					name = "Terrorists";
					camp = "Terrorist Base";
					plunder0 = "Filthy terrorists plundered the trade route you established between {1_CityName} and {2_CityName}.";
					plunder1 = "Terrorists plundered the trade route {1_PlayerName} established between {2_CityName} and {3_CityName}";
					csquest0 = "We want you to defeat Terrorists that are invading our territory.";
					csquest1 = "They want you to defeat Terrorist units that are invading their territory.";
					csquest2 = "They will reward the player that destroys a nearby Terrorist Encampment.";
					csquest3 = "You have successfully destroyed the Terrorist Encampment as requested by {1_MinorCivName:textkey}! Your [ICON_INFLUENCE] Influence over them has increased by [COLOR_POSITIVE_TEXT]{2_InfluenceReward}[ENDCOLOR].";
					csquest4 = "There is still that Terrorist Encampment nearby that we would like someone to take care of.";
					csquest5 = "They want a nearby Terrorist Encampment destroyed.";
					csquest6 = "{1_CivName:textkey} requests your assistance against invading Terrorists! Each Terrorist you kill will earn you [ICON_INFLUENCE] Influence over the City-State.";
					csquest7 = "{1_CivName:textkey} no longer needs your assistance against the Terrorists.";
					discover = "A Terrorist Encampment has been discovered! It will create Terrorist units until dispersed!";
					kill0 = "You have killed a group of Terrorists near {1_CivName:textkey}! They are grateful, and your [ICON_INFLUENCE] Influence with them has increased by 12!";
					kill1 = "Terrorist killed near {1_CivName:textkey}!";
					raid0 = "Your City of {@1_CityName} was raided by Terrorists, and {2_Num} Gold was stolen from the national treasury!";
					raid1 = "The Terrorists have killed your {@1_UnitName} because you refused to pay heed to their demands!";
					clear0 = "You have dispersed a villainous Terrorist Base and recovered {1_NumGold} [ICON_GOLD] Gold from it!";
					clear1 = "Terrorist Base Cleared!";
					capture0 = "A civilian was captured by Terrorists!";
					capture1 = "{TXT_KEY_GRAMMAR_UPPER_A_AN &lt;&lt; {@1_UnitName}} was captured by the Terrorists! They will take it to their nearest Encampment. If you wish to recover your unit you will have to track it down!";
					capture2 = "The Terrorists have captured one of your civilian Units! They are requesting {1_Num} Gold in exchange for the lives of your subjects. What is your response?";
					discover2 = "Terrorist Base discovered";
				elseif eratype >= 7 then
					str = "Alien";
					dsc = "Alien Hegemony";
					name = "Aliens";
					camp = "Alien Base";
					plunder0 = "Filthy Aliens plundered the trade route you established between {1_CityName} and {2_CityName}.";
					plunder1 = "Aliens plundered the trade route {1_PlayerName} established between {2_CityName} and {3_CityName}";
					csquest0 = "We want you to defeat Aliens that are invading our territory.";
					csquest1 = "They want you to defeat Aliens units that are invading their territory.";
					csquest2 = "They will reward the player that destroys a nearby Alien Encampment.";
					csquest3 = "You have successfully destroyed the Alien Encampment as requested by {1_MinorCivName:textkey}! Your [ICON_INFLUENCE] Influence over them has increased by [COLOR_POSITIVE_TEXT]{2_InfluenceReward}[ENDCOLOR].";
					csquest4 = "There is still that Alien Encampment nearby that we would like someone to take care of.";
					csquest5 = "They want a nearby Alien Encampment destroyed.";
					csquest6 = "{1_CivName:textkey} requests your assistance against invading Aliens! Each Alien you kill will earn you [ICON_INFLUENCE] Influence over the City-State.";
					csquest7 = "{1_CivName:textkey} no longer needs your assistance against the Aliens.";
					discover = "A Aliens Encampment has been discovered! It will create Alien units until dispersed!";
					kill0 = "You have killed a group of Aliens near {1_CivName:textkey}! They are grateful, and your [ICON_INFLUENCE] Influence with them has increased by 12!";
					kill1 = "Alien killed near {1_CivName:textkey}!";
					raid0 = "Your City of {@1_CityName} was raided by Aliens, and {2_Num} Gold was stolen from the national treasury!";
					raid1 = "The Aliens have killed your {@1_UnitName} because you refused to pay heed to their demands!";
					clear0 = "You have dispersed a villainous Alien Base and recovered {1_NumGold} [ICON_GOLD] Gold from it!";
					clear1 = "Alien Base Cleared!";
					capture0 = "A civilian was captured by Aliens!";
					capture1 = "{TXT_KEY_GRAMMAR_UPPER_A_AN &lt;&lt; {@1_UnitName}} was captured by the Aliens! They will take it to their nearest Encampment. If you wish to recover your unit you will have to track it down!";
					capture2 = "The Aliens have captured one of your civilian Units! They are requesting {1_Num} Gold in exchange for the lives of your subjects. What is your response?";
					discover2 = "Alien Base discovered";
				end
				--for _, bPlayer in pairs(Players) do
				--	if (bPlayer:IsAlive()) then
				--		if bPlayer:IsBarbarian() then
				--			for bUnit in bPlayer:Units() do
				--				bUnit:SetName(str);
				--			end
				--		end
				--	end
				--end
				-- update the English table 
				local tquery = {"UPDATE Language_en_US SET Text = '".. str .."' WHERE Tag = 'TXT_KEY_CIV_BARBARIAN_ADJECTIVE'",
				"UPDATE Language_en_US SET Text = '".. name .."' WHERE Tag = 'TXT_KEY_CIV_BARBARIAN_SHORT_DESC'",
				"UPDATE Language_en_US SET Text = '".. dsc .."' WHERE Tag = 'TXT_KEY_CIV_BARBARIAN_DESC'",
				"UPDATE Language_en_US SET Text = '".. camp .."' WHERE Tag = 'TXT_KEY_IMPROVEMENT_ENCAMPMENT'",
				"UPDATE Language_en_US SET Text = '".. plunder0 .."' WHERE Tag = 'TXT_KEY_NOTIFICATION_TRADE_UNIT_PLUNDERED_TRADER_BARBARIAN'",
				"UPDATE Language_en_US SET Text = '".. plunder1 .."' WHERE Tag = 'TXT_KEY_NOTIFICATION_TRADE_UNIT_PLUNDERED_TRADEE_BARBARIANS'",
				"UPDATE Language_en_US SET Text = '".. csquest0 .."' WHERE Tag = 'TXT_KEY_CITY_STATE_QUEST_INVADING_BARBS'",
				"UPDATE Language_en_US SET Text = '".. csquest1 .."' WHERE Tag = 'TXT_KEY_CITY_STATE_QUEST_INVADING_BARBS_FORMAL'",
				"UPDATE Language_en_US SET Text = '".. csquest2 .."' WHERE Tag = 'TXT_KEY_CITY_STATE_QUEST_KILL_CAMP_FORMAL'",
				"UPDATE Language_en_US SET Text = '".. csquest3 .."' WHERE Tag = 'TXT_KEY_NOTIFICATION_QUEST_COMPLETE_KILL_CAMP'",
				"UPDATE Language_en_US SET Text = '".. csquest4 .."' WHERE Tag = 'TXT_KEY_CITY_STATE_QUEST_KILL_CAMP'",
				"UPDATE Language_en_US SET Text = '".. csquest5 .."' WHERE Tag = 'TXT_KEY_CITY_STATE_QUEST_KILL_CAMP_FORMAL'",
				"UPDATE Language_en_US SET Text = '".. csquest6 .."' WHERE Tag = 'TXT_KEY_NOTIFICATION_MINOR_BARBS_QUEST'",
				"UPDATE Language_en_US SET Text = '".. csquest7 .."' WHERE Tag = 'TXT_KEY_NOTIFICATION_MINOR_BARBS_QUEST_LOST_CHANCE'",
				"UPDATE Language_en_US SET Text = '".. discover .."' WHERE Tag = 'TXT_KEY_NOTIFICATION_FOUND_BARB_CAMP'",
				"UPDATE Language_en_US SET Text = '".. kill0 .."' WHERE Tag = 'TXT_KEY_NOTIFICATION_MINOR_BARB_KILLED'",
				"UPDATE Language_en_US SET Text = '".. kill1 .."' WHERE Tag = 'TXT_KEY_NOTIFICATION_SM_MINOR_BARB_KILLED'" ,
				"UPDATE Language_en_US SET Text = '".. raid0 .."' WHERE Tag = 'TXT_KEY_MISC_YOU_CITY_RANSOMED_BY_BARBARIANS'",
				"UPDATE Language_en_US SET Text = '".. raid1 .."' WHERE Tag = 'TXT_KEY_MISC_YOU_UNIT_RANSOM_KILL_BY_BARBARIANS'",
				"UPDATE Language_en_US SET Text = '".. clear0 .."' WHERE Tag = 'TXT_KEY_BARB_CAMP_CLEARED'" ,
				"UPDATE Language_en_US SET Text = '".. clear1 .."' WHERE Tag = 'TXT_KEY_POP_BARBARIAN_CLEARED'",
				"UPDATE Language_en_US SET Text = '".. capture0 .."' WHERE Tag = 'TXT_KEY_UNIT_CAPTURED_BARBS'",
				"UPDATE Language_en_US SET Text = '".. capture1 .."' WHERE Tag = 'TXT_KEY_UNIT_CAPTURED_BARBS_DETAILED'",
				"UPDATE Language_en_US SET Text = '".. capture2 .."' WHERE Tag = 'TXT_KEY_RANSOM_POPUP_INFO'",
				"UPDATE Language_en_US SET Text = '".. discover2 .."' WHERE Tag = 'TXT_KEY_NOTIFICATION_SUMMARY_FOUND_BARB_CAMP'"
				}

				for i, iQuery in pairs(tquery) do
					print ("Changing Barbarian Texts: " .. i .. "/" .. #tquery );
					for result in DB.Query(iQuery) do
					end
				end

				-- refresh UI texts
				Locale.SetCurrentLanguage( Locale.GetCurrentLanguage().Type )
end

function CheckBarbarianEra (arg0, currPlayer)
	local empty = "";
	local pPlayer = Players[currPlayer];
		if (pPlayer:IsAlive()) then
			if (pPlayer:IsHuman()) then
				BarbNameChange (pPlayer)
			end
		end
end


function CheckBarbarianEraOnLoad (arg0, currPlayer)
	local empty = "";
	for _, pPlayer in pairs(Players) do
		if (pPlayer:IsAlive()) then
			if (pPlayer:IsHuman()) then
				BarbNameChange (pPlayer)
			end
		end
	end
end


function CheckBarbarianEraName (iPlayer)
	local empty = "";
	local pPlayer = Players[iPlayer];
		if (pPlayer:IsAlive()) then
			if (pPlayer:IsHuman()) then
				local eratype = pPlayer:GetCurrentEra();
				if eratype == 0 then
					str = "Savage";
				elseif eratype == 1 then
					str = "Barbarian";
				elseif eratype == 2 then
					str = "Brigand";
				elseif eratype == 3 then
					str = "Visigoth";
				elseif eratype == 4 then
					str = "Pirate";
				elseif eratype == 5 then
					str = "Rebel";
				elseif eratype == 6 then
					str = "Terrorist";
				elseif eratype >= 7 then
					str = "Alien";
				end
				for _, bPlayer in pairs(Players) do
					if (bPlayer:IsAlive()) then
						if bPlayer:IsBarbarian() then
							for bUnit in bPlayer:Units() do
								bUnit:SetName(str);
							end
						end
					end
				end
				-- update the English table 
			end
		end
end


Events.SerialEventEraChanged.Add(CheckBarbarianEra)
Events.LoadScreenClose.Add(CheckBarbarianEraOnLoad)