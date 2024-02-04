function Queen_Elaine_OnCombat(event, creature, target)
    creature:SendUnitSay("Behold! Some brave champions have come... slaughter them!", 0)
    creature:RegisterEvent(Queen_Elaine_PhaseOne, 1000, 0)
    creature:RegisterEvent(Queen_Elaine_ReflectiveShield, 30000, 11)
    creature:RegisterEvent(Queen_Elaine_Smite, 41000, 16)
    creature:RegisterEvent(Queen_Elaine_Soulfaly, 67000, 11)
    creature:RegisterEvent(Queen_Elaine_Disruption, 78000, 10)
    creature:RegisterEvent(Queen_Elaine_Smite, 41000, 16)
    creature:RegisterEvent(Queen_Elaine_FrostNova, 43000, 13)
    creature:RegisterEvent(Queen_Elaine_Blizzard, 55000, 15)
    creature:RegisterEvent(Queen_Elaine_CoHealing, 64000, 7)
    creature:RegisterEvent(Queen_Elaine_FrostBolt, 63000, 18)
    creature:RegisterEvent(Queen_Elaine_FrostBlast, 47000, 15)
    creature:RegisterEvent(Queen_Elaine_Soulfaly, 67000, 15)
    creature:RegisterEvent(Queen_Elaine_Disruption, 78000, 12)
    creature:RegisterEvent(Queen_Elaine_FlameBurst, 80000, 11)
end

function Queen_Elaine_ReflectiveShield(event, creature)
    creature:CastSpell(66515, creature:GetClosestPlayer())
end

function Queen_Elaine_Smite(event, creature)
    creature:FullCastSpellOnTarget(41471, creature:GetRandomPlayer(0))
end

function Queen_Elaine_CoHealing(event, creature)
    creature:CastSpell(71133, creature:GetClosestPlayer())
end

function Queen_Elaine_Blizzard(event, creature)
    creature:FullCastSpellOnTarget(77924, creature:GetClosestPlayer(0))
end

function Queen_Elaine_FrostNova(event, creature)
    creature:CastSpell(71929, creature:GetClosestPlayer())
end

function Queen_Elaine_Soulfaly(event, creature)
    creature:FullCastSpellOnTarget(79264, creature:GetRandomPlayer(0))
end

function Queen_Elaine_FrostBlast(event, creature)
    creature:CastSpell(72124, creature:GetClosestPlayer())
end

function Queen_Elaine_FrostBolt(event, creature)
    creature:FullCastSpellOnTarget(72167, creature:GetRandomPlayer(0))
end

function Queen_Elaine_Disruption(event, creature)
    creature:CastSpell(29310, creature:GetRandomPlayer(4))
end

function Queen_Elaine_FlameBurst(event, creature)
    creature:CastSpell(41131, creature:GetRandomPlayer(7))
end

function Queen_Elaine_PhaseOne(event, creature)
    if creature:GetHealthPct() < 100 then
        creature:RemoveEvents()
        creature:FullCastSpell(41471)
        creature:RegisterEvent(Queen_Elaine_ReflectiveShield, 30000, 11)
        creature:RegisterEvent(Queen_Elaine_Smite, 41000, 16)
        creature:RegisterEvent(Queen_Elaine_CoHealing, 64000, 7)
        creature:RegisterEvent(Queen_Elaine_PhaseTwo, 1000, 0)
    end
end

function Queen_Elaine_PhaseTwo(event, creature)
    if creature:GetHealthPct() < 60 then
        creature:RemoveEvents()
        creature:FullCastSpell(28478, 41482)
        creature:RegisterEvent(Queen_Elaine_ReflectiveShield, 30000, 11)
        creature:RegisterEvent(Queen_Elaine_CoHealing, 64000, 7)
        creature:RegisterEvent(Queen_Elaine_Blizzard, 55000, 15)
        creature:RegisterEvent(Queen_Elaine_FrostBolt, 63000, 18)
        creature:RegisterEvent(Queen_Elaine_FrostBlast, 47000, 15)
        creature:RegisterEvent(Queen_Elaine_PhaseThree, 1000, 0)
    end
end

function Queen_Elaine_PhaseThree(event, creature)
    if creature:GetHealthPct() < 25 then
        creature:RemoveEvents()
        creature:FullCastSpell(45442)
        creature:RegisterEvent(Queen_Elaine_CoHealing, 64000, 7)
        creature:RegisterEvent(Queen_Elaine_ReflectiveShield, 30000, 11)
        creature:RegisterEvent(Queen_Elaine_FrostNova, 43000, 13)
        creature:RegisterEvent(Queen_Elaine_Soulfaly, 67000, 11)
        creature:RegisterEvent(Queen_Elaine_Disruption, 78000, 10)
        creature:RegisterEvent(Queen_Elaine_FlameBurst, 80000, 11)
    end
end

function Queen_Elaine_OnLeaveCombat(event, creature)
    creature:RemoveEvents()
    creature:SendUnitSay("Thats Weak...", 0)
end

function Queen_Elaine_OnDied(event, creature)
    creature:RemoveEvents()
    creature:SendUnitSay("Ah!! My King, I will wait for you in the next life.", 0)
end

function Queen_Elaine_OnKilledTarget(event, creature)
    creature:SendUnitSay("Weak champions! Surrender now and maybe I will spare one life!", 0)
end


RegisterCreatureEvent(800801, 1, Queen_Elaine_OnCombat)
RegisterCreatureEvent(800801, 2, Queen_Elaine_OnLeaveCombat)
RegisterCreatureEvent(800801, 3, Queen_Elaine_OnKilledTarget)
RegisterCreatureEvent(800801, 4, Queen_Elaine_OnDied)
