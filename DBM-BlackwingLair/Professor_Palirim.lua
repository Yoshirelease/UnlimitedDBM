local mod	= DBM:NewMod("Professor_Palirim", "DBM-BlackwingLair")
local L		= mod:GetLocalizedStrings()

mod:SetRevision(("$Revision: 384 $"):sub(12, -3))
mod:SetCreatureID(418038)

mod:RegisterCombat("combat")

mod:RegisterEvents(
	"SPELL_AURA_APPLIED",
	"SPELL_CAST_START",
	"UNIT_SPELLCAST_START"
)

local timerPlagueSlime			= mod:NewTimer(16, "NextPlagueSlime")
local timerBlightSlime			= mod:NewTimer(32, "NextBlightSlime")
local timerBloodSlime			= mod:NewTimer(26, "NextBloodSlime")

local timerDrinkPotion			= mod:NewTimer(25, "NextDrinkPotion")

local warnPlagueSlime			= mod:NewAnnounce("SpawnedPlagueSlime", 1)
local warnBloodSlime			= mod:NewAnnounce("SpawnedBloodSlime", 1)
local warnBlightSlime			= mod:NewAnnounce("SpawnedBlightSlime", 1)

local specwarnDrinkPotion		= mod:NewSpecialWarning("specwarnDrinkPotion")

local warnMutagenPotion			= mod:NewAnnounce("DrinkMutagenPotion", 2, 98036)
local warnFelPotion				= mod:NewAnnounce("DrinkFelPotion", 2, 98034)
local warnHealPotion			= mod:NewAnnounce("DrinkHealPotion", 2, 98031)

local firstBloodSpawn = true

function mod:OnCombatStart(delay)
	timerBlightSlime:Start(32) 
	self:ScheduleMethod(32, "BlightSlime")
	timerBloodSlime:Start(26) 
	self:ScheduleMethod(26, "BloodSlime")
	timerPlagueSlime:Start(16) 
	self:ScheduleMethod(16, "PlagueSlime")
	timerDrinkPotion:Start()
end

function mod:BlightSlime()
	warnBlightSlime:Show()
	timerBlightSlime:Start()
	self:ScheduleMethod(32, "BlightSlime")
end

function mod:BloodSlime()
	warnBloodSlime:Show()
	timerBloodSlime:Start()
	self:ScheduleMethod(26, "BloodSlime")
end

function mod:PlagueSlime()
	warnPlagueSlime:Show()
	timerPlagueSlime:Start()
	self:ScheduleMethod(16, "PlagueSlime")
end

function mod:UNIT_SPELLCAST_START(unit,spell)
	if spell == "Drink Health Potion" and unit == "boss1" then
		warnHealPotion:Show()
		specwarnDrinkPotion:Show()
		timerDrinkPotion:Start()
		if self.Options.Announce then
			if DBM:GetRaidRank() > 0 then
				SendChatMessage(DrinkHealthPotion_RW, "RAID_WARNING")
			end
		end
	elseif spell == "Drink Fel Potion" and unit == "boss1" then
		warnFelPotion:Show()
		specwarnDrinkPotion:Show()
		timerDrinkPotion:Start()
	elseif spell == "Drink Mutagen Potion" and unit == "boss1" then
		warnMutagenPotion:Show()
		specwarnDrinkPotion:Show()
		timerDrinkPotion:Start()
	end
end