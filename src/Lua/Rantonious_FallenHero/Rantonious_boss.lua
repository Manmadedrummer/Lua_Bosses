function Rantonious_Combat(Unit, Event)
    Unit:SendChatMessage(12, 0, "Begone, you mortal fools!")
    Unit:RegisterEvent("Rantonious_Hero", 30000, 0)
    Unit:RegisterEvent("Rantonious_Whirlwind", 20000, 0)
    Unit:RegisterEvent("Malchezzar_Phase2", 1500, 0)
end

function Rantonious_Hero(Unit, Event)
    local faction = 14
    x = Unit:GetX();
    y = Unit:GetY();
    z = Unit:GetZ();
    o = Unit:GetO();
    Unit:SpawnCreature(822001, x, y, z, o, faction, 60000)
end

function Rantonious_Whirlwind(Unit, Event)
    Unit:CastSpell(26084)
    Unit:RegisterEvent("Rantonious_ShadowNova", 3000, 1)
end

function Rantonious_ShadowNova(Unit, Event)
    Unit:FullCastSpell(30852)
end

function Rantonious_Phase2(Unit, Event)
    if Unit:GetHealthPct() < 25 then
    Unit:RemoveEvents()
    Unit:SendChatMessage(12, 0, "I promise your death will be quick and easy!")
    Unit:RegisterEvent("Rantonious_Hero", 15000, 0)
    Unit:RegisterEvent("Rantonious_ShadowNova", 17000, 0)
    end
end

function Rantonious_Wipe(Unit, Event)
    Unit:RemoveEvents()
end

function Rantonious_Died(Unit, Event)
    Unit:SendChatMessage(12, 0, "How..could..this..happen?")
    Unit:RemoveEvents()
end

function Rantonious_KillPlayer(Unit, Event)
    Unit:SendChatMessage(12, 0, "Your death only feeds my power!")
end

RegisterUnitEvent(800804, 1, "Rantonious_Combat")
RegisterUnitEvent(800804, 2, "Rantonious_Wipe")
RegisterUnitEvent(800804, 3, "Rantonious_KillPlayer")
RegisterUnitEvent(800804, 4, "Rantonious_Died")
