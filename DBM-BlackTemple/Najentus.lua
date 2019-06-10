local mod	= DBM:NewMod("Najentus", "DBM-BlackTemple")
local L		= mod:GetLocalizedStrings()

mod:SetUsedIcons(1, 2, 3, 4, 5, 6, 7, 8)
mod:SetRevision(("$Revision: 401 $"):sub(12, -3))
mod:SetCreatureID(22887)

mod:RegisterCombat("combat")

mod:RegisterEvents(
	"SPELL_AURA_APPLIED"
)

local specwarnSpine			= mod:NewSpecialWarning("ImpalingSpine", 39837)
local warnSpineTarget		= mod:NewTargetAnnounce(39837, 2)
local warnTidalShield		= mod:NewAnnounce("TidalShield", 4, 39872)
local NajentusEnrage		= mod:NewTimer(600, "EnrageNajentus")

function mod:OnCombatStart()
	NajentusEnrage:Start()
end

local ArImpalingSpine = {}
function mod:SPELL_AURA_APPLIED(args)
	if args:IsSPELLID(39872) then
		warnTidalShield:Show()
		if self.Options.Announce then
			if DBM:GetRaidRank() > 0 then
				SendChatMessage(TidalShield_RW, "RAID_WARNING")
			end
		end
	elseif args:IsSPELLID(39837) then
		table.insert(ArImpalingSpine, args.destName)
		self:UnscheduleMethod("AnnounceImpalingSpine")
		self:ScheduleMethod(0.5, "AnnounceImpalingSpine")

		specwarnSpine:Show()
		if args.destName == UnitName("player") then
			SendChatMessage(L.ImpalingSpine_yell.." "..args.destName, "YELL")
		end
		if self.Options.Announce then
			if DBM:GetRaidRank() > 0 then
				SendChatMessage(ImpalingSpine_RW.." "..args.destName, "RAID_WARNING")
			end
		end
	end
end

function mod:AnnounceImpalingSpine()
	warnSpineTarget:Show(table.concat(ArImpalingSpine, "< >"))
	for i = #ArImpalingSpine, 1, -1 do
		self:SetIcon(ArImpalingSpine[i], 8 - i, 4.5)
		ArImpalingSpine[i] = nil
	end
end