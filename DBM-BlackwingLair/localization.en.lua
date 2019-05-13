-- Nexus-Prince Sharfaad --
VoidAdds_RW				= "Adds appeared"
UmbralRush_RW			= "Umbral Rush on" -- results in Umbral Rush on PLAYER
UnboundEthereal_RW		= "Soft Enrage on Boss"

-- Mindbender Rar'sha --
-- nothing to announce yet

-- Xanirya --
EggSpawn_RW				= "Adds appeared"
SoulConsumption_RW		= "has Soul Consumption"

-- Professor Palirim --
DrinkHealthPotion_RW	= "Professor Palirim is drinking Health Potion, Interrupt him!"

-- Specimen 42 --
Experiment_RW			= "Mindcontrol on" -- results in Mindcontrol on PLAYER
PreHungry_RW			= "Specimen 42 is getting Hungry"
Hungry_RW				= "Specimen 42 is going to eat a Dwarf"
RecoveringCons_RW		= "Starting to remember, Nuke him now!"

-- Va'ri --
VariAdds_RW				= "Adds appeared!"
LosingDarkness_RW		= "Debuff on Boss - Burst him now!"

local L

-----------------------
-- Nexus-Prince Sharfaad --
-----------------------
L = DBM:GetModLocalization("NexusPrince_Sharfaad")

L:SetGeneralLocalization{
	name = "Nexus-Prince Sharfaad"
}

L:SetTimerLocalization{
	NextVoidSpawn			= "Next Void Spawn",
	NextUmbralRush			= "Next Umbral Rush",
	EnrageTimer				= "Enrage",
	UmbralRushImpact		= "Umbral Rush Impact"
}

L:SetMiscLocalization{
	UmbralRush_yell			= "Umbral Rush on me!"
}

L:SetWarningLocalization{
	SummonedVoidSpawn		= "Void Spawn appeared!",
	specVoidZone			= "Move out!",
	specUmbralRush			= "Stay away from Void Wyrms!",
	specUnboundEthereal		= "Enrage in 60 seconds!"
}

L:SetOptionLocalization{
	SummonedVoidSpawn		= "Announce Void Spawn",
	specVoidZone			= "Show Special Warning when you are in Void Zone",
	specUmbralRush			= "Show Special Warning when you are affected by Umbral Rush",
	specUnboundEthereal		= "Show Special Warning when Soft-Enrage is up",
	NextVoidSpawn			= "Show Timer for next Void Spawn",
	NextUmbralRush			= "Show Timer for next Umbral Rush",
	UmbralRushImpact		= "Show TImer for next Umbral Rush Impact",
	EnrageTimer				= "Show Timer for Enrage"

}

-----------------------
-- Mindbender Rar'sha --
-----------------------
L = DBM:GetModLocalization("Mindbender_Rarsha")

L:SetGeneralLocalization{
	name = "Mindbender Rar'sha"
}

L:SetMiscLocalization{
	Eric		= "Eric",
	Baleog		= "Baleog",
	Olaf		= "Olaf"
}

L:SetTimerLocalization{
	NorseForseTimer			= "Next Norse Force"
}

L:SetWarningLocalization{
	NorseForce				= "Shield on Bosses"
}

L:SetOptionLocalization{
	NorseForseTimer			= "Show Timer for next Norse Force",
	NorseForce				= "Announce Norse Force"
}

-----------------------
-- Xanirya --
-----------------------
L = DBM:GetModLocalization("Xanirya")

L:SetGeneralLocalization{
	name = "Xanirya"
}

L:SetTimerLocalization{
	NextEgg					= "Next Eggs",
	NextVoidPool			= "Next Soul Consumption",
	NextEggHatch			= "Egg Hatch",
	SoulConsumptionFade		= "Soul Consumption Expire"
}

L:SetMiscLocalization{
	SoulConsumption_yell	= "Soul Consumption on me!"
}

L:SetWarningLocalization{
	SoulConsumption			= "Move away!",
	VoidPool				= "Move out!",
	SummonedEggSpawn		= "Eggs appeared!"
}

L:SetOptionLocalization{
	SummonedEggSpawn		= "Announce Egg Spawn",
	VoidPool				= "Show Special Warning for VoidPool",
	SoulConsumption			= "Show Special Warning for Soul Consumption",
	NextEgg					= "Show Timer for next Egg Spawn",
	NextVoidPool			= "Show Timer for next Soul Consumption",
	NextEggHatch			= "Show Timer for Egg Hatch after Spawn",
	SoulConsumptionFade		= "Show Timer for next Soul Consumption Expire on Target"
}

-----------------------
-- Professor Palirim --
-----------------------
L = DBM:GetModLocalization("Professor_Palirim")

L:SetGeneralLocalization{
	name = "Professor Palirim"
}

L:SetTimerLocalization{
	NextPlagueSlime			= "Next Plague Slime",
	NextBloodSlime			= "Next Blood Slime",
	NextBlightSlime			= "Next Blight Slime",
	NextDrinkPotion			= "Next Drink Potion"
}

L:SetWarningLocalization{
	SpawnedPlagueSlime		= "Plague Slime appeared!",
	SpawnedBloodSlime		= "Blood Slime appeared!",
	SpawnedBlightSlime		= "Blight Slime appeared!",
	DrinkMutagenPotion		= "Mutagen Potion is up!",
	DrinkFelPotion			= "Fel Potion is up!",
	DrinkHealPotion			= "Heal Potion is up!",
	specwarnDrinkPotion		= "Professor Palirim is drinking!",
}

L:SetOptionLocalization{
	SpawnedPlagueSlime		= "Announce Plague Slimes",
	SpawnedBloodSlime		= "Announce Blood Slimes",
	SpawnedBlightSlime		= "Announce Blight Slime",
	DrinkMutagenPotion		= "Announce Mutagen Potion",
	DrinkFelPotion			= "Announce Fel Potion",
	DrinkHealPotion			= "Announce Heal Potion",
	specwarnDrinkPotion		= "Show Special Warning for Drink Potion",
	NextPlagueSlime			= "Show Timer for next Plague Slime",
	NextBloodSlime			= "Show Timer for next Blood Slime",
	NextBlightSlime			= "Show Timer for next Blight Slime",
	NextDrinkPotion			= "Show Timer for next Drink Potion"
}

-----------------------
-- Specimen 42 --
-----------------------
L = DBM:GetModLocalization("Specimen42")

L:SetGeneralLocalization{
	name = "Specimen 42"
}

L:SetTimerLocalization{
	HungryCD				= "Dwarf eating"
}
L:SetMiscLocalization{
	ExperimentYell			= "I got mindcontrolled, CC me!"
}

L:SetWarningLocalization{
	FelCough				= "Fel Cough on >%s< (%d)",
	FelCoughStacks			= "Fel Cough on >%s< has %d stacks, swap tanks!",
	Hungry					= "Speak to a dwarf!",
	Experiment				= "Experiment",
	SeepingVoid				= "Move out!",
	m_WarnHungry			= "Hungry in 5 seconds",
	RecoveringCons			= "Nuke him now!"
}

L:SetOptionLocalization{
	FelCough				= "Announce Fel Cough >2 stacks",
	FelCoughStacks			= "Announce Fel Cough >4 stacks",
	m_WarnHungry			= "Announce Pre-Hungry",
	RecoveringCons			= "Announce Recovering Consciousness",
	Hungry					= "Show Special Warning for Hungry",
	Experiment				= "Show Special Warning when you are affected by Experiment",
	SeepingVoid				= "Show Special Warning when you are affected by Seeping Void",
	HungryCD				= "Show Timer for Dwarf eating Countdown"
}
-----------------------
-- Va'ri --
-----------------------
L = DBM:GetModLocalization("Vari")

L:SetGeneralLocalization{
	name = "Va'ri"
}

L:SetTimerLocalization{
	NextVariAdds			= "Next Adds"
}

L:SetWarningLocalization{
	SummonedVariAdds		= "Adds appeared!",
	VoidTouched				= "Void Touched on >%s< (%d)",
	VoidTouchedStacks		= "Void Touched on >%s< has %d stacks, clean them!",
	HolyExposure			= "Holy Exposure on >%s< (%d)",
	HolyExposureStacks		= "Holy Exposure on >%s< has %d stacks, careful!",
	LosingDarkness			= "Losing Darkness on Boss, Focus!"
}

L:SetOptionLocalization{
	VoidTouched				= "Announce Void Touched >10 stacks",
	VoidTouchedStacks		= "Announce Void Touched >30 stacks",
	HolyExposure			= "Announce Holy Exposure >3 stacks",
	HolyExposureStacks		= "Announce Holy Exposure >7 stacks",
	SummonedVariAdds		= "Announce Adds Spawn",
	LosingDarkness			= "Announce Losing Darkness on Boss",
	NextVariAdds			= "Show Timer for next Add Spawn"
}
