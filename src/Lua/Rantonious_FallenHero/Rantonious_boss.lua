function Rantonious_Combat(event, creature, target)
    creature:SendUnitSay("Begone, you mortal fools!", 0)
    creature:RegisterEvent(Rantonious_Hero, 30000, 0)
    creature:RegisterEvent(Rantonious_Whirlwind, 20000, 0)
    creature:RegisterEvent(Rantonious_Phase2, 1500, 0)
end

function Rantonious_Hero(event, creature)
    local faction = 14
    local x, y, z, o = creature:GetX(), creature:GetY(), creature:GetZ(), creature:GetO()
    creature:SpawnCreature(800803, x, y, z, o, faction, 60000)
end

function Rantonious_Whirlwind(event, creature)
    creature:CastSpell(26084)
    creature:RegisterEvent(Rantonious_ShadowNova, 3000, 1)
end

function Rantonious_ShadowNova(event, creature)
    creature:FullCastSpell(30852)
end

function Rantonious_Phase2(event, creature)
    if creature:GetHealthPct() < 25 then
        creature:RemoveEvents()
        creature:SendUnitSay("I promise your death will be quick and easy!", 0)
        creature:RegisterEvent(Rantonious_Hero, 15000, 0)
        creature:RegisterEvent(Rantonious_ShadowNova, 17000, 0)
    end
end

function Rantonious_Wipe(event, creature)
    creature:RemoveEvents()
end

function Rantonious_Died(event, creature)
    creature:SendUnitSay("How..could..this..happen?", 0)
    creature:RemoveEvents()
end

function Rantonious_KillPlayer(event, creature)
    creature:SendUnitSay("Your death only feeds my power!", 0)
end

RegisterCreatureEvent(800804, 1, Rantonious_Combat)
RegisterCreatureEvent(800804, 2, Rantonious_Wipe)
RegisterCreatureEvent(800804, 3, Rantonious_KillPlayer)
RegisterCreatureEvent(800804, 4, Rantonious_Died)
