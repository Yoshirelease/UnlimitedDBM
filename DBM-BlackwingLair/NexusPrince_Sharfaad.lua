local mod	= DBM:NewMod("NexusPrince_Sharfaad", "DBM-BlackwingLair")
local L		= mod:GetLocalizedStrings()

mod:SetUsedIcons(1, 2, 3, 4, 5, 6, 7, 8)
mod:SetRevision(("$Revision: 381 $"):sub(12, -3))
mod:SetCreatureID(418002)

mod:RegisterCombat("combat")

mod:RegisterEvents(
	"SPELL_AURA_APPLIED"
)

local specWarnVoidZone			= mod:NewSpecialWarning("specVoidZone", 98056)
local specWarnUmbralRush		= mod:NewSpecialWarning("specUmbralRush", 97973)
local specWarnUnboundEthereal	= mod:NewSpecialWarning("specUnboundEthereal", 97967)

local WarnSummonAdds			= mod:NewAnnounce("SummonedVoidSpawn", 1)
local warnUmbralRush			= mod:NewTargetAnnounce(97973, 2)

local timerVoidAdds				= mod:NewTimer(38, "NextVoidSpawn")
local timerUmbralRush			= mod:NewTimer(40, "NextUmbralRush")
local timerEnrageCountdown		= mod:NewTimer(60, "EnrageTimer")

local m_CountDown				= mod:NewCountdown(5, 97973)
local timerCountDown			= mod:NewTimer(10, "UmbralRushImpact")
local timerEnrageCD				= mod:NewCountdown(10, 97967)

mod:AddBoolOption("PlaySoundOnUmbralRush")

local FirstAddWave = true

function mod:OnCombatStart(delay)
	timerVoidAdds:Start(8)
	self:ScheduleMethod(8, "SharfaadAdds")
	timerUmbralRush:Start()
end

function mod:CountDown()
	m_CountDown:Start()
end

function mod:CountDownEnrage()
	timerEnrageCD:Start()
end

function mod:SharfaadAdds()
	if FirstAddWave == false then
		WarnSummonAdds:Show()
		timerVoidAdds:Start()
		self:ScheduleMethod(38, "SharfaadAdds")
		FirstAddWave = false
		if self.Options.Announce then
			if DBM:GetRaidRank() > 0 then
				SendChatMessage(VoidAdds_RW, "RAID_WARNING")
			end
		end
	else
		WarnSummonAdds:Show()
		timerVoidAdds:Start()
		self:ScheduleMethod(38, "SharfaadAdds")
		FirstAddWave = false
		if self.Options.Announce then
			if DBM:GetRaidRank() > 0 then
				SendChatMessage(VoidAdds_RW, "RAID_WARNING")
			end
		end
	end
end

local UmbralRush = {}
function mod:SPELL_AURA_APPLIED(args)
	if args:IsSpellID(97973) then -- boss charge
		table.insert(UmbralRush, args.destName)
		self:UnscheduleMethod("AnnounceUmbralRush")
		self:ScheduleMethod(0.5, "AnnounceUmbralRush")


		if args.destName == UnitName("player") then 
			timerUmbralRush:Start()
			timerCountDown:Start()
			self:ScheduleMethod(5, "CountDown")
			SendChatMessage(L.UmbralRush_yell, "YELL")
			specWarnUmbralRush:Show()
		end
		if self.Options.Announce then
			if DBM:GetRaidRank() > 0 then
				SendChatMessage(UmbralRush_RW.." "..args.destName, "RAID_WARNING")
			end
		end

	elseif args:IsSpellID(98056) or args:IsSpellID(98057) then -- void zone / void trap
		if args.destName == UnitName("player") then
			specWarnVoidZone:Show()
		end
	
	elseif args:IsSpellID(97967) then -- soft enrage
		specWarnUnboundEthereal:Show()
		self:ScheduleMethod(50, "CountDownEnrage")
		timerEnrageCountdown:Start()
		if self.Options.Announce then
			if DBM:GetRaidRank() > 0 then
				SendChatMessage(UnboundEthereal_RW, "RAID_WARNING")
			end
		end
	end
end

function mod:AnnounceUmbralRush()
	warnUmbralRush:Show(table.concat(UmbralRush, "< >"))
	for i = #UmbralRush, 1, -1 do
		self:SetIcon(UmbralRush[i], 8 - i, 4.5)
		UmbralRush[i] = nil
	end
end