local mod	= DBM:NewMod("Specimen42", "DBM-BlackwingLair")
local L		= mod:GetLocalizedStrings()

mod:SetRevision(("$Revision: 385 $"):sub(12, -3))
mod:SetCreatureID(418039)

mod:RegisterCombat("combat")

mod:RegisterEvents(
	"SPELL_AURA_APPLIED",
	"SPELL_AURA_APPLIED_DOSE",
	"SPELL_AURA_REMOVED"
)

local specwarnHungry		= mod:NewSpecialWarning("Hungry")
local specwarnExperiment	= mod:NewSpecialWarning("Experiment")
local specwarnSeepingVoid	= mod:NewSpecialWarning("SeepingVoid")

local warnFelCough			= mod:NewAnnounce("FelCough", 2, 98043)
local warnFelCoughStacks	= mod:NewAnnounce("FelCoughStacks", 4, 98043)
local warnHungry			= mod:NewAnnounce("m_WarnHungry", 4, 98038)
local warnRecoveringCons	= mod:NewAnnounce("RecoveringCons", 2, 98042)

local timerCountDown		= mod:NewTimer(5, "HungryCD")
local m_countdown				= mod:NewCountdown(5, 98038)

mod:AddBoolOption("PlaySoundOnExperiment")

function mod:CountDown()
	m_countdown:Start()
end

function mod:SPELL_AURA_APPLIED(args)
	if args:IsSpellID(98043) then -- FelCough
		if args.amount == nil then args.amount = 1 end
		if args.amount >= 2 and args.amount <= 3 then
			warnFelCough:Show(args.destName, args.amount)
		elseif args.amount >= 4 then
			warnFelCoughStacks:Show(args.destName, args.amount)
			if self.Options.Announce then
				if DBM:GetRaidRank() > 0 then
					SendChatMessage(args.destName.." has "..args.amount.." stacks", "RAID_WARNING")
				end
			end
		end

	elseif args:IsSpellID(98067) then -- Seeping Void
		if args.destName == UnitName("player") then 
			specwarnSeepingVoid:Show()
		end

	elseif args:IsSpellID(98049) then -- Mindcontrol
		specwarnExperiment:Show()
		if args.destName == UnitName("player") then
			SendChatMessage(L.ExperimentYell, "Yell")
		end
		if self.Options.PlaySoundOnExperiment then
			PlaySoundFile("Sound\\Creature\\AlgalonTheObserver\\UR_Algalon_BHole01.wav")
		end
		if self.Options.Announce then
			if DBM:GetRaidRank() > 0 then
				SendChatMessage(Experiment_RW.." "..args.destName, "RAID_WARNING")
			end
		end

	elseif args:IsSpellID(98038) then -- Dwarf eating/healing
		warnHungry:Show()
		timerCountDown:Start()
		self:ScheduleMethod(0, "CountDown")
		if self.Options.Announce then
			if DBM:GetRaidRank() > 0 then
				SendChatMessage(PreHungry_RW, "RAID_WARNING")
			end
		end

	elseif args:IsSpellID(98042) then -- starting to remember who he is
		warnRecoveringCons:Show()
		if self.Options.Announce then
			if DBM:GetRaidRank() > 0 then
				SendChatMessage(RecoveringCons_RW, "RAID_WARNING")
			end
		end
	end
end

function mod:SPELL_AURA_REMOVED(args, spell)
	if args:IsSpellID(98038) then
		specwarnHungry:Show()
		if self.Options.Announce then
			if DBM:GetRaidRank() > 0 then
				SendChatMessage(Hungry_RW, "RAID_WARNING")
			end
		end
	end
end

mod.SPELL_AURA_APPLIED_DOSE = mod.SPELL_AURA_APPLIED