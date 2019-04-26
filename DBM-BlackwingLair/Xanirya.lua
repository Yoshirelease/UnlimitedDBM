local mod	= DBM:NewMod("Xanirya", "DBM-BlackwingLair")
local L		= mod:GetLocalizedStrings()

mod:SetUsedIcons(1, 2, 3, 4, 5, 6, 7, 8)
mod:SetRevision(("$Revision: 383 $"):sub(12, -3))
mod:SetCreatureID(418032)

mod:RegisterCombat("combat")

mod:RegisterEvents(
	"SPELL_AURA_APPLIED",
	"SPELL_AURA_PERIODIC_DAMAGE"
)

local specwarnSoulConsumption	= mod:NewSpecialWarning("SoulConsumption")
local specwarnVoidPool			= mod:NewSpecialWarning("VoidPool")
local warnSoulConsumption		= mod:NewTargetAnnounce(98002, 2)

local warnSummonEggSpawn		= mod:NewAnnounce("SummonedEggSpawn", 1)

local timerEggSpawn				= mod:NewTimer(20.1, "NextEgg")
local timerSoulConsumption		= mod:NewTimer(18, "NextVoidPool")
local timerEggHatch				= mod:NewTimer(15, "NextEggHatch")

local m_countdown				= mod:NewCountdown(5, 98002)
local timerCountDown			= mod:NewTimer(10, "SoulConsumptionFade")

mod:AddBoolOption("PlaySoundOnSoulConsumption")

function mod:OnCombatStart(delay)
	timerEggSpawn:Start()
	self:ScheduleMethod(0, "XaniryaAdds")
	timerSoulConsumption:Start()
end

function mod:CountDown()
	m_countdown:Start()
end
	

function mod:XaniryaAdds()
	warnSummonEggSpawn:Show()
	timerEggHatch:Start()
	timerEggSpawn:Start()
	self:ScheduleMethod(20.05, "XaniryaAdds")
	FirstAddWave = false
	if self.Options.Announce then
		if DBM:GetRaidRank() > 0 then
				SendChatMessage(EggSpawn_RW, "RAID_WARNING")
		end
	end
end


local SoulConsumptionArray = {}
function mod:SPELL_AURA_APPLIED(args)
	if args:IsSpellID(98002) then
		table.insert(SoulConsumptionArray, args.destName)
		self:UnscheduleMethod("AnnounceSoulConsumptionTargets")
		self:ScheduleMethod(0.5, "AnnounceSoulConsumptionTargets")
		timerSoulConsumption:Start()

		if self.Options.PlaySoundOnSoulConsumption then
			PlaySoundFile("Sound\\Creature\\AlgalonTheObserver\\UR_Algalon_BHole01.wav")
		end	

		if args.destName == UnitName("player") then
			timerCountDown:Start()
			specwarnSoulConsumption:Show()
			SendChatMessage(L.SoulConsumption_yell, "Yell")
			self:ScheduleMethod(5, "CountDown")
		end

		if self.Options.Announce then
			if DBM:GetRaidRank() > 0 then
				SendChatMessage(args.destName.." "..SoulConsumption_RW, "RAID_WARNING")
			end
		end
	elseif args:IsSpellID(98059) then
		if args.destName == UnitName("player") then
			specwarnVoidPool:Show()
		end
	end
end

function mod:AnnounceSoulConsumptionTargets()
	warnSoulConsumption:Show(table.concat(SoulConsumptionArray, "< >"))
	for i = #SoulConsumptionArray, 1, -1 do
		self:SetIcon(SoulConsumptionArray[i], 8 - i, 4.5)
		SoulConsumptionArray[i] = nil
	end
end