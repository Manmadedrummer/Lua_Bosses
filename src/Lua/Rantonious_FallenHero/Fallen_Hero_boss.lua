function Hero_Combat(event, creature, target)
    creature:CastSpell(30843)
    creature:RegisterEvent(Hero_Cleave, 4000, 0)
end

function Hero_Cleave(event, creature)
    creature:CastSpell(15284)
end

function Hero_Wipe(event, creature)
    creature:RemoveEvents()
end

RegisterCreatureEvent(800803, 1, Hero_Combat)
RegisterCreatureEvent(800803, 2, Hero_Wipe)

