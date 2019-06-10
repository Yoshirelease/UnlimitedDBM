local mod	= DBM:NewMod("Supremus", "DBM-BlackTemple")
local L		= mod:GetLocalizedStrings()

mod:SetRevision(("$Revision: 402 $"):sub(12, -3))
mod:SetCreatureID(22898)

mod:RegisterCombat("combat")

mod:RegisterEvents(
	"SPELL_AURA_APPLIED"
)

local specwarnMolten		mod:NewSpecialWarning("specMoltenFlame", 40265)
local warnMolten			mod:NewAnnounce("warnMoltenFlame", 2, 40265)
local warnPhase1			mod:NewAnnounce("warnPhase1Supremus", 4)
local warnPhase2			mod:NewAnnounce("warnPhase2Supremus", 4)
local SupremusEnrage		mod:NewTimer(900, "EnrageSupremus")
local Phase2Timer			mod:NewTimer(60, "PhaseChangeSupremus")
local Phase_Countdown		mod:NewCountdown(5, 41951)

local phaseNum = 0

function mod:OnCombatStart()
	Phase2Timer:Start()
	self:ScheduleMethod(60, "PhaseChange")
	SupremusEnrage:Start()
	self:ScheduleMethod(55, "CountDown")
end

function mod:CountDown()
	Phase_Countdown:Start()
end

function mod:PhaseChange()
	if phaseNum == 0 then
		warnPhase1:Show()
		Phase2Timer:Start()
		self:ScheduleMethod(60, "PhaseChange")
		self:ScheduleMethod(55, "CountDown")
		if self.Options.Announce then
			if DBM:GetRaidRank() > 0 then
				SendChatMessage(Phase2Change_RW, "RAID_WARNING")
			end
		end
		phaseNum = 1
	elseif phaseNum == 1 then
		warnPhase2:Show()
		Phase2Timer:Start()
		self:ScheduleMethod(60, "PhaseChange")
		self:ScheduleMethod(55, "CountDown")
		if self.Options.Announce then
			if DBM:GetRaidRank() > 0 then
				SendChatMessage(Phase1Change_RW, "RAID_WARNING")
			end
		end
		phaseNum = 0
	end
end

function mod:SPELL_AURA_APPLIED(args)
	if args:IsSpellID(40265) then
		warnMolten:Show(args.destName)
		if args.destName == UnitName("player") then
			specwarnMolten:Show()
		end
	end
end