TidalShield_RW		= "Tidal Shield on Boss, use Spine!"
ImpalingSpine_RW	= "Impaling Spine on" -- results in Impaling Spine on Player
Phase1Change_RW		= "Back to Phase 1"
Phase2Change_RW		= "Phase 2"

local L

-----------------
--  Najentus  --
-----------------
L = DBM:GetModLocalization("Najentus")

L:SetGeneralLocalization{
	name = "High Warlord Naj'entus"
}

L:SetTimerLocalization{
	EnrageNajentus			= "Enrage"
}

L:SetMiscLocalization{
	ImpalingSpine_yell		= "Impaling Spine on >%s<!"
}

L:SetWarningLocalization{
	ImpalingSpine			= "Impaling Spine",
	TidalShield				= "Tidal Shield"
}

L:SetOptionLocalization{
	EnrageNajentus			= "Show Timer for Enrage",
	ImpalingSpine			= "Show Special Warning when anyone is affected by Impaling Spine",
	TidalShield				= "Announce Tidal Shield"
}

----------------
-- Supremus --
----------------
L = DBM:GetModLocalization("Supremus")

L:SetGeneralLocalization{
	name = "Supremus"
}

L:SetTimerLocalization{
	EnrageSupremus			= "Enrage",
	PhaseChangeSupremus		= "Next Phase Change"
}

L:SetWarningLocalization{
	specMoltenFlame			= "Move out",
	warnMoltenFlame			= "Molten Flame on >%s<",
	warnPhase1Supremus		= "Phase 1",
	warnPhase2Supremus		= "Phase 2"
}

L:SetOptionLocalization{
	warnMoltenFlame			= "Announce Molten Flame",
	warnPhase1Supremus		= "Announce Phase 1",
	warnPhase2Supremus		= "Announce Phase 2",
	specMoltenFlame			= "Show Special Warning when you are affected by Molten Flame",
	PhaseChangeSupremus		= "Show Timer for next Phase Change",
	EnrageSupremus			= "Show Timer for Enrage"
}

-------------------------
--  Shape of Akama  --
-------------------------
L = DBM:GetModLocalization("Akama")

L:SetGeneralLocalization{
	name = "Shade of Akama"
}

-------------------------
--  Teron Gorefiend  --
-------------------------
L = DBM:GetModLocalization("TeronGorefiend")

L:SetGeneralLocalization{
	name = "Teron Gorefiend"
}

----------------------------
--  Gurtogg Bloodboil  --
----------------------------
L = DBM:GetModLocalization("Bloodboil")

L:SetGeneralLocalization{
	name = "Gurtogg Bloodboil"
}

--------------------------
--  Essence Of Souls  --
--------------------------
L = DBM:GetModLocalization("Souls")

L:SetGeneralLocalization{
	name = "Essence of Souls"
}

-----------------------
--  Mother Shahraz --
-----------------------
L = DBM:GetModLocalization("Shahraz")

L:SetGeneralLocalization{
	name = "Mother Shahraz"
}

----------------------
--  Illidari Council  --
----------------------
L = DBM:GetModLocalization("Council")

L:SetGeneralLocalization{
	name = "Illidari Council"
}

-------------------------
--  Illidan Stormrage --
-------------------------
L = DBM:GetModLocalization("Illidan")

L:SetGeneralLocalization{
	name = "Illidan Stormrage"
}
