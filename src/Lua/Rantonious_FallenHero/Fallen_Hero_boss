function Hero_Combat(Unit, Event)
    Unit:CastSpell(30843)
    Unit:RegisterEvent("Hero_Cleave", 4000, 0)
end

function Hero_Cleave(Unit, Event)
    Unit:CastSpell(15284)
end

function Hero_Wipe(Unit, Event)
    Unit:RemoveEvents()
end

RegisterUnitEvent(800803, 1, "Hero_Combat")
RegisterUnitEvent(800803, 2, "Hero_Wipe")
