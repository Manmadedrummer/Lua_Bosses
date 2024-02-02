function King_Theramis_OnCombat(Unit, Event) 
Unit:SendChatMessage(12, 0, "To arms! kill the intruders!")
Unit:RegisterEvent("King_Theramis_phaseone",1000,0)
Unit:RegisterEvent("King_Theramis_enrage", 90000, 3)
Unit:RegisterEvent("King_Theramis_brust", 50000, 11)
Unit:RegisterEvent("King_Theramis_screem", 60000, 7)
Unit:RegisterEvent("King_Theramis_phasethree",1000,0)
Unit:RegisterEvent("King_Theramis_enrage", 90000, 4)
Unit:RegisterEvent("King_Theramis_phasetwo",1000,0)
Unit:RegisterEvent("King_Theramis_frenzy", 90000, 4)
Unit:RegisterEvent("King_Theramis_pound", 50000, 4)
Unit:RegisterEvent("King_Theramis_spellreflect", 300000, 3)
Unit:RegisterEvent("King_Theramis_flamecrash", 40000, 6)
Unit:RegisterEvent("King_Theramis_aura", 70000, 4)
Unit:RegisterEvent("King_Theramis_leap", 70000, 13)
Unit:RegisterEvent("King_Theramis_whirlwind", 90000, 7)
Unit:RegisterEvent("King_Theramis_blast", 90000, 8)
Unit:RegisterEvent("King_Theramis_wrath", 140000, 5)
end

function King_Theramis_aura(pUnit, Event) 
pUnit:CastSpell(41541, pUnit:GetClosestPlayer()) 
end

function King_Theramis_leap(pUnit, Event) 
pUnit:CastSpell(59689, pUnit:GetRandomPlayer(7)) 
end

function King_Theramis_enrage(pUnit, Event) 
pUnit:CastSpell(48193, pUnit:GetRandomPlayer(0)) 
end

function King_Theramis_frenzy(pUnit, Event) 
pUnit:CastSpell(28747, pUnit:GetRandomPlayer(0)) 
end

function King_Theramis_pound(pUnit, Event) 
pUnit:CastSpell(53472, pUnit:GetClosestPlayer()) 
end

function King_Theramis_spellreflect(pUnit, Event) 
pUnit:CastSpell(47981, pUnit:GetClosestPlayer()) 
end

function King_Theramis_flamecrash(pUnit, Event) 
pUnit:CastSpell(40832, pUnit:GetClosestPlayer()) 
end

function King_Theramis_whirlwind(pUnit, Event) 
pUnit:CastSpell(41057, pUnit:GetRandomPlayer(7)) 
end

function King_Theramis_blast(pUnit, Event) 
pUnit:CastSpell(59700, pUnit:GetRandomPlayer(0)) 
end

function King_Theramis_burst(pUnit, Event) 
pUnit:CastSpell(48529, pUnit:GetRandomPlayer(7)) 
end

function King_Theramis_screem(pUnit, Event) 
pUnit:CastSpell(51750, pUnit:GetClosestPlayer()) 
end

function King_Theramis_leap(pUnit, Event) 
pUnit:CastSpell(59689, pUnit:GetRandomPlayer(7)) 
end

function King_Theramis_blast(pUnit, Event) 
pUnit:CastSpell(59700, pUnit:GetRandomPlayer(0)) 
end

function King_Theramis_spellreflect(pUnit, Event) 
pUnit:CastSpell(47981, pUnit:GetClosestPlayer()) 
end

function King_Theramis_flamecrash(pUnit, Event) 
pUnit:CastSpell(40832, pUnit:GetClosestPlayer()) 
end

function King_Theramis_wrath(pUnit, Event) 
pUnit:CastSpell(57466, pUnit:GetRandomPlayer(7)) 
end

function King_Theramis_phaseone(pUnit, Event) 
if pUnit:GetHealthPct() < 100 then 
pUnit:RemoveEvents(); 
pUnit:FullCastSpell(0)
pUnit:RegisterEvent("King_Theramis_screem", 60000, 7)
pUnit:RegisterEvent("King_Theramis_burst", 50000, 11)
pUnit:RegisterEvent("King_Theramis_enrage", 90000, 4)
pUnit:RegisterEvent("King_Theramis_phasetwo",1000,0)
end 
end

function King_Theramis_phasetwo(pUnit, Event) 
if pUnit:GetHealthPct() < 70 then 
pUnit:RemoveEvents(); 
pUnit:FullCastSpell(0)
pUnit:RegisterEvent("King_Theramis_spellreflect", 300000, 3)
pUnit:RegisterEvent("King_Theramis_frenzy", 90000, 6)
pUnit:RegisterEvent("King_Theramis_phasethree",1000,0)
pUnit:RegisterEvent("King_Theramis_pound", 50000, 6)
pUnit:RegisterEvent("King_Theramis_spellreflect", 300000, 3)
pUnit:RegisterEvent("King_Theramis_flamecrash", 40000, 13)
end 
end

function King_Theramis_phasethree(pUnit, Event) 
if pUnit:GetHealthPct() < 45 then 
pUnit:RemoveEvents(); 
pUnit:FullCastSpell(0)
pUnit:RegisterEvent("King_Theramis_aura", 70000, 4)
pUnit:RegisterEvent("King_Theramis_leap", 70000, 13)
pUnit:RegisterEvent("King_Theramis_whirlwind", 90000, 7)
pUnit:RegisterEvent("King_Theramis_wrath", 140000, 5)
end 
end

function King_Theramis_OnLeaveCombat(Unit, Event) 
Unit:RemoveEvents() 
Unit:SendChatMessage(11, 0, "Weak...") 
end

function King_Theramis_OnDied(Unit, Event) 
Unit:RemoveEvents() 
Unit:SendChatMessage(12, 0, "Aaah, my love! i will see you in the next life!") 
end

function King_Theramis_OnKilledTarget(Unit, Event) 
Unit:SendChatMessage(12, 0, "Don't be worry your friends will soon join you!") 
end

RegisterUnitEvent(800800, 1, "King_Theramis_OnCombat")
RegisterUnitEvent(800800, 2, "King_Theramis_OnLeaveCombat")
RegisterUnitEvent(800800, 3, "King_Theramis_OnKilledTarget")
RegisterUnitEvent(800800, 4, "King_Theramis_OnDied")
