function Queen_Elaine_OnCombat(Unit, Event) 
Unit:SendChatMessage(11, 0, "Behold! Some brave champions have come... slaughter them!")
Unit:RegisterEvent("Queen_Elaine_phaseone",1000,0)
Unit:RegisterEvent("Queen_Elaine_reflectiveshield", 30000, 11)
Unit:RegisterEvent("Queen_Elaine_smite", 41000, 16)
Unit:RegisterEvent("Queen_Elaine_soulfaly", 67000, 11)
Unit:RegisterEvent("Queen_Elaine_disruption", 78000, 10)
Unit:RegisterEvent("Queen_Elaine_smite", 41000, 16)
Unit:RegisterEvent("Queen_Elaine_frostnova", 43000, 13)
Unit:RegisterEvent("Queen_Elaine_blizzard", 55000, 15)
Unit:RegisterEvent("Queen_Elaine_cohealing", 64000, 7)
Unit:RegisterEvent("Queen_Elaine_frostbolt", 63000, 18)
Unit:RegisterEvent("Queen_Elaine_frostblast", 47000, 15)
Unit:RegisterEvent("Queen_Elaine_soulfaly", 67000, 15)
Unit:RegisterEvent("Queen_Elaine_disruption", 78000, 12)
Unit:RegisterEvent("Queen_Elaine_flameburst", 80000, 11)
end

function Queen_Elaine_reflectiveshield(pUnit, Event) 
pUnit:CastSpell(66515, pUnit:GetClosestPlayer()) 
end

function Queen_Elaine_smite(pUnit, Event) 
pUnit:FullCastSpellOnTarget(41471, pUnit:GetRandomPlayer(0)) 
end

function Queen_Elaine_cohealing(pUnit, Event) 
pUnit:CastSpell(71133, pUnit:GetClosestPlayer()) 
end

function Queen_Elaine_blizzard(pUnit, Event) 
pUnit:FullCastSpellOnTarget(77924, pUnit:GetClosestPlayer(0)) 
end

function Queen_Elaine_frostnova(pUnit, Event) 
pUnit:CastSpell(71929, pUnit:GetClosestPlayer()) 
end

function Queen_Elaine_soulfaly(pUnit, Event) 
pUnit:FullCastSpellOnTarget(79264, pUnit:GetRandomPlayer(0)) 
end

function Queen_Elaine_frostblast(pUnit, Event) 
pUnit:CastSpell(72124, pUnit:GetClosestPlayer()) 
end

function Queen_Elaine_frostbolt(pUnit, Event) 
pUnit:FullCastSpellOnTarget(72167, pUnit:GetRandomPlayer(0)) 
end

function Queen_Elaine_disruption(pUnit, Event) 
pUnit:CastSpell(29310, pUnit:GetRandomPlayer(4)) 
end

function Queen_Elaine_flameburst(pUnit, Event) 
pUnit:CastSpell(41131, pUnit:GetRandomPlayer(7)) 
end

function Queen_Elaine_reflectiveshield(pUnit, Event) 
pUnit:CastSpell(66515, pUnit:GetClosestPlayer()) 
end

function Queen_Elaine_smite(pUnit, Event) 
pUnit:FullCastSpellOnTarget(41471, pUnit:GetRandomPlayer(0)) 
end

function Queen_Elaine_cohealing(pUnit, Event) 
pUnit:CastSpell(71133, pUnit:GetClosestPlayer()) 
end

function Queen_Elaine_blizzard(pUnit, Event) 
pUnit:FullCastSpellOnTarget(77942, pUnit:GetRandomPlayer(0)) 
end

function Queen_Elaine_flameburst(pUnit, Event) 
pUnit:CastSpell(41131, pUnit:GetRandomPlayer(7)) 
end

function Queen_Elaine_phaseone(pUnit, Event) 
if pUnit:GetHealthPct() < 100 then 
pUnit:RemoveEvents(); 
pUnit:FullCastSpell(41471)
pUnit:RegisterEvent("Queen_Elaine_reflectiveshield", 30000, 11)
pUnit:RegisterEvent("Queen_Elaine_smite", 41000, 16)
pUnit:RegisterEvent("Queen_Elaine_cohealing", 64000, 7)
pUnit:RegisterEvent("Queen_Elaine_phasetwo",1000,0)
end 
end

function Queen_Elaine_phasetwo(pUnit, Event) 
if pUnit:GetHealthPct() < 60 then 
pUnit:RemoveEvents(); 
pUnit:FullCastSpell(28478, 41482)
pUnit:RegisterEvent("Queen_Elaine_reflectiveshield", 30000, 11)
pUnit:RegisterEvent("Queen_Elaine_cohealing", 64000, 7)
pUnit:RegisterEvent("Queen_Elaine_blizzard", 55000, 15)
pUnit:RegisterEvent("Queen_Elaine_frostbolt", 63000, 18)
pUnit:RegisterEvent("Queen_Elaine_frostblast", 47000, 15)
pUnit:RegisterEvent("Queen_Elaine_phasethree",1000,0)
end 
end

function Queen_Elaine_phasethree(pUnit, Event) 
if pUnit:GetHealthPct() < 25 then 
pUnit:RemoveEvents(); 
pUnit:FullCastSpell(45442)
pUnit:RegisterEvent("Queen_Elaine_cohealing", 64000, 7)
pUnit:RegisterEvent("Queen_Elaine_reflectiveshield", 30000, 11)
pUnit:RegisterEvent("Queen_Elaine_frostnova", 43000, 13)
pUnit:RegisterEvent("Queen_Elaine_soulfaly", 67000, 11)
pUnit:RegisterEvent("Queen_Elaine_disruption", 78000, 10)
pUnit:RegisterEvent("Queen_Elaine_flameburst", 80000, 11)
end 
end

function Queen_Elaine_OnLeaveCombat(Unit, Event) 
Unit:RemoveEvents() 
Unit:SendChatMessage(11, 0, "Thats Weak...") 
end

function Queen_Elaine_OnDied(Unit, Event) 
Unit:RemoveEvents() 
Unit:SendChatMessage(12, 0, "Ah!! My King, I will wait for you in the next life.") 
end

function Queen_Elaine_OnKilledTarget(Unit, Event) 
Unit:SendChatMessage(11, 0, "Weak champions! surrender now and i maby will spare one life!") 
end

RegisterUnitEvent(800801, 1, "Queen_Elaine_OnCombat")
RegisterUnitEvent(800801, 2, "Queen_Elaine_OnLeaveCombat")
RegisterUnitEvent(800801, 3, "Queen_Elaine_OnKilledTarget")
RegisterUnitEvent(800801, 4, "Queen_Elaine_OnDied")
