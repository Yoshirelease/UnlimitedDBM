local mod	= DBM:NewMod("Mindbender_Rarsha", "DBM-BlackwingLair")
local L		= mod:GetLocalizedStrings()

mod:SetRevision(("$Revision: 382 $"):sub(12, -3))
mod:SetCreatureID(418028, 418029, 418030, 418031)

mod:RegisterCombat("combat")

mod:RegisterEvents(
	"SPELL_AURA_APPLIED"
)

local timerNorseForce		= mod:NewTimer(18, "NorseForseTimer")
local announceNorseForce	= mod:NewAnnounce("NorseForce", 2, 97993)

mod:SetBossHealthInfo(
	418028, L.Eric,
	418029, L.Baleog,
	418030, L.Olaf
)

function mod:OnCombatStart()
	timerNorseForce:Start()
	self:ScheduleMethod(18, "m_TimerNorseForce")
end

function mod:m_TimerNorseForce()
	timerNorseForce:Start()
	announceNorseForce:Show()
	self:ScheduleMethod(18, "m_TimerNorseForce")
end