if(Game.GetCustomOption("GAMEOPTION_CCTP_EVENTS") == 0) then
	return;
end
-- EventOptions
-- Author: Gyogen
-- DateCreated: 10/5/2014 9:10:21 AM
--------------------------------------------------------------
----Event Decision---
calBaseCount         = 25    ----number of turns per month
BaseEventDice		 = 350  ----decreases by era
BaseCooldownTurnsMin = 10 
BaseCooldownTurnsMax = 50   ----base for random generation of turns between events----
EventProb			 = 25			 ----probability of event happening--------
EraEventChance		 = 50
PolicyEventChance	 = 25
VariousEventChance   = 35
DecisionEventChance  = 100

---Result Decision---
DestroyResource      = true  --- resurces destroyed in event
BaseMeltdownChance   = 7 ----out of 100-----
BaseTornadoChance    = 25
BaseFloodChance      = 25
BaseBombingChance    = 35
BomdEffect           = 2  ----production divided by this number to get damage to city production
BaseDepletionChance  = 40
BaseSettlerChance    = 50
BaseLuxuryChance     = 50
BaseGoldChance		 = 50
BaseEmploymentChance = 40
BaseCrashChance      = 40
BaseBabyBoomChance   = 40
BaseExodusChance     = 35

--Order and crime
BaseCrimeChance = 5
BasePoliceStateChance = 5
baseRevoltOdds = 15
baseCivRevOdds = 10
