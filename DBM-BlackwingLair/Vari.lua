local mod	= DBM:NewMod("Vari", "DBM-BlackwingLair")
local L		= mod:GetLocalizedStrings()


mod:SetRevision(("$Revision: 386 $"):sub(12, -3))
mod:SetCreatureID(418040, 418046)

mod:RegisterCombat("combat")


mod:RegisterEvents(
	"SPELL_AURA_APPLIED",
	"SPELL_AURA_APPLIED_DOSE",
	"UNIT_DIED",
	"UNIT_AURA"
)

local timer6thAdds				= mod:NewTimer(30, "NextVariAdds")

local warn6thAdds				= mod:NewAnnounce("SummonedVariAdds", 1)
local warnVoidTouched			= mod:NewAnnounce("VoidTouched", 2, 98080)
local warnVoidTouchedStacks		= mod:NewAnnounce("VoidTouchedStacks", 4, 98080)
local warnHolyExposure			= mod:NewAnnounce("HolyExposure", 2, 98078)
local warnHolyExposureStacks	= mod:NewAnnounce("HolyExposureStacks", 4, 98078)
local warnLosingDarkness		= mod:NewAnnounce("LosingDarkness", 3, 98072)

local once = false
local m_6thAdds = true

function mod:OnCombatStart()
-- hack fix to start Va'ri
 self:ScheduleMethod(1, "CheckForTarget")
 local once = false
 local m_6thAdds = false
end

function mod:UNIT_AURA(unit)
	if once == false then
		if unit == "boss1" then
			self:SendSync("TankTarget", targetname)
			once = true
		end
	end
end

function mod:CheckForTarget()
	local targetname = self:GetThreatTarget(418040)
	if not targetname then
		self:ScheduleMethod(1, "CheckForTarget")
	else
		self:UnscheduleMethod("CheckForTarget")
		self:SendSync("TankTarget", targetname)
	end
end

function mod:OnSync(msg, target)
	if msg == "TankTarget" then
		timer6thAdds:Start(5)
		self:ScheduleMethod(5, "VariAdds")
	end
end


function mod:VariAdds()
	if m_6thAdds == false then
		warn6thAdds:Show()
		timer6thAdds:Start()
		self:ScheduleMethod(30, "VariAdds")
		if self.Options.Announce then
			if DBM:GetRaidRank() > 0 then
				SendChatMessage(VariAdds_RW, "RAID_WARNING")
			end
		end
	end
end

function mod:SPELL_AURA_APPLIED(args, spell)
	if args:IsSpellID(98072) or args:IsSpellID(98071) or spell == "Losing Darkness" then
		warnLosingDarkness:Show()
		if self.Options.Announce then
			if DBM:GetRaidRank() > 0 then
				SendChatMessage(LosingDarkness_RW, "RAID_WARNING")
			end
		end
	elseif args:IsSpellID(98080) or spell == "Void touched" then
		if args.amount == nil then args.amount = 9 end
		if args.amount >= 10 and args.amount <= 29 then
			warnVoidTouched:Show(args.destName, args.amount)
		elseif args.amount >= 30 then
			warnVoidTouchedStacks:Show(args.destName, args.amount)
			if self.Options.Announce then
				if DBM:GetRaidRank() > 0 then
					SendChatMessage(args.destName.." has "..args.amount.." stacks", "RAID_WARNING")
				end
			end
		end
	elseif args:IsSpellID(98078) or spell == "Holy exposure" then
		if args.amount == nil then args.amount = 2 end
		if args.amount >= 3 and args.amount <= 6 then
			warnHolyExposure:Show(args.destName, args.amount)
		elseif args.amount >= 7 then
			warnHolyExposureStacks:Show(args.destName, args.amount)
		end
	end
end

mod.SPELL_AURA_APPLIED_DOSE = mod.SPELL_AURA_APPLIED