function King_Theramis_OnCombat(event, creature, target)
    creature:SendUnitSay("To arms! Kill the intruders!", 0)
    creature:RegisterEvent(King_Theramis_PhaseOne, 1000, 0)
    creature:RegisterEvent(King_Theramis_Enrage, 90000, 3)
    creature:RegisterEvent(King_Theramis_Burst, 50000, 11)
    creature:RegisterEvent(King_Theramis_Scream, 60000, 7)
    creature:RegisterEvent(King_Theramis_PhaseThree, 1000, 0)
    creature:RegisterEvent(King_Theramis_Enrage, 90000, 4)
    creature:RegisterEvent(King_Theramis_PhaseTwo, 1000, 0)
    creature:RegisterEvent(King_Theramis_Frenzy, 90000, 4)
    creature:RegisterEvent(King_Theramis_Pound, 50000, 4)
    creature:RegisterEvent(King_Theramis_SpellReflect, 300000, 3)
    creature:RegisterEvent(King_Theramis_FlameCrash, 40000, 6)
    creature:RegisterEvent(King_Theramis_Aura, 70000, 4)
    creature:RegisterEvent(King_Theramis_Leap, 70000, 13)
    creature:RegisterEvent(King_Theramis_Whirlwind, 90000, 7)
    creature:RegisterEvent(King_Theramis_Blast, 90000, 8)
    creature:RegisterEvent(King_Theramis_Wrath, 140000, 5)
end

function King_Theramis_Aura(event, creature)
    creature:CastSpell(41541, creature:GetVictim())
end

function King_Theramis_Leap(event, creature)
    creature:CastSpell(67749, creature:GetRandomPlayer(7))
end

function King_Theramis_Enrage(event, creature)
    creature:CastSpell(78722, creature:GetRandomPlayer(0))
end

function King_Theramis_Frenzy(event, creature)
    creature:CastSpell(57086, creature:GetRandomPlayer(0))
end

function King_Theramis_Pound(event, creature)
    creature:CastSpell(53474, creature:GetVictim())
end

function King_Theramis_SpellReflect(event, creature)
    creature:CastSpell(69901, creature:GetVictim())
end

function King_Theramis_FlameCrash(event, creature)
    creature:CastSpell(40841, creature:GetVictim())
end

function King_Theramis_Whirlwind(event, creature)
    creature:CastSpell(63807, creature:GetRandomPlayer(7))
end

function King_Theramis_Blast(event, creature)
    creature:CastSpell(59700, creature:GetRandomPlayer(0))
end

function King_Theramis_Burst(event, creature)
    creature:CastSpell(48529, creature:GetRandomPlayer(7))
end

function King_Theramis_Scream(event, creature)
    creature:CastSpell(51750, creature:GetVictim())
end

function King_Theramis_Wrath(event, creature)
    creature:CastSpell(57466, creature:GetRandomPlayer(7))
end

function King_Theramis_PhaseOne(event, creature)
    if creature:GetHealthPct() < 100 then
        creature:RemoveEvents()
        creature:FullCastSpell(0)
        creature:RegisterEvent(King_Theramis_Scream, 60000, 7)
        creature:RegisterEvent(King_Theramis_Burst, 50000, 11)
        creature:RegisterEvent(King_Theramis_Enrage, 90000, 4)
        creature:RegisterEvent(King_Theramis_PhaseTwo, 1000, 0)
    end
end

function King_Theramis_PhaseTwo(event, creature)
    creature:SendUnitSay("Your kinda tough aren't you!", 0)
    if creature:GetHealthPct() < 70 then
        creature:RemoveEvents()
        creature:FullCastSpell(0)
        creature:RegisterEvent(King_Theramis_SpellReflect, 300000, 3)
        creature:RegisterEvent(King_Theramis_Frenzy, 90000, 6)
        creature:RegisterEvent(King_Theramis_PhaseThree, 1000, 0)
        creature:RegisterEvent(King_Theramis_Pound, 50000, 6)
        creature:RegisterEvent(King_Theramis_SpellReflect, 300000, 3)
        creature:RegisterEvent(King_Theramis_FlameCrash, 40000, 13)
    end
end

function King_Theramis_PhaseThree(event, creature)
        creature:SendUnitSay("Say your prayers!", 0)
    if creature:GetHealthPct() < 45 then
        creature:RemoveEvents()
        creature:FullCastSpell(0)
        creature:RegisterEvent(King_Theramis_Aura, 70000, 4)
        creature:RegisterEvent(King_Theramis_Leap, 70000, 13)
        creature:RegisterEvent(King_Theramis_Whirlwind, 90000, 7)
        creature:RegisterEvent(King_Theramis_Wrath, 140000, 5)
    end
end

function King_Theramis_OnLeaveCombat(event, creature)
    creature:RemoveEvents()
    creature:SendUnitSay("Weak...", 0)
end

function King_Theramis_OnDied(event, creature)
    creature:RemoveEvents()
    creature:SendUnitSay("Aaah, my love! I will see you in the next life!", 0)
end

function King_Theramis_OnKilledTarget(event, creature)
    creature:SendUnitSay("Don't worry; your friends will soon join you!", 0)
end

RegisterCreatureEvent(800800, 1, King_Theramis_OnCombat)
RegisterCreatureEvent(800800, 2, King_Theramis_OnLeaveCombat)
RegisterCreatureEvent(800800, 3, King_Theramis_OnKilledTarget)
RegisterCreatureEvent(800800, 4, King_Theramis_OnDied)
