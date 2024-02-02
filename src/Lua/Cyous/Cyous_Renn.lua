function RenSpeak(pUnit, event, player)
    local prace = player:GetPlayerRace()                       
    pUnit:GossipCreateMenu(70010, player, 0)
    pUnit:GossipMenuAddItem(0, "I wish to challenge you.", 10, 0)
    pUnit:GossipMenuAddItem(5, "[EXIT]", 20, 0)
    pUnit:GossipSendMenu(player)
end

function RenOnSelect(pUnit, event, player, id, intid, code)
    if (intid == 10) then
    pUnit:GossipCreateMenu(70011, player, 0)
    pUnit:GossipMenuAddItem(4, "I Accept", 11, 0)
    pUnit:GossipMenuAddItem(4, "I Decline", 21, 0)
    pUnit:GossipSendMenu(player)
    end
    
    if (intid == 11) then
    pUnit:RegisterEvent("RenStartEvent", 1000, 1)
    player:GossipComplete()
    end
    
    if (intid == 21) then
        local name = player:GetName()
        pUnit:SendChatMessage(12, 0, "Very well "..name..", I imagine I will see you when you are ready.")
        player:GossipComplete()
    end
    
    if (intid == 20) then
        local name = player:GetName()
        pUnit:SendChatMessage(12, 0, "Very well "..name..", I imagine I will see you when you are ready.")
        player:GossipComplete()
    end
end

function RenCoordMap(pUnit, event)
    resetCheck = 0
    print "Cyrous Renn has been spawned. His coordinates have been stored and the resetCheck has been set to zero..."
    pUnit:CastSpell(45591)
    pUnit:SetFaction(35)
    pUnit:SetModel(27530)
    pUnit:RemoveAura(50161)
    pUnit:RemoveAllAuras()
    StartX = pUnit:GetX()
    StartY = pUnit:GetY()
    StartZ = pUnit:GetZ()
    StartO = pUnit:GetO()
end

-- Ren Cinematic Portion of Script--
function RenStartEvent(pUnit, event)
    resetCheck = 0
    print "Cyrous Renn's event has been intiated..."
    pUnit:SetCombatCapable(1)
    pUnit:CastSpell(50161)
    pUnit:SendChatMessage(12, 0, "It has certainly been a while. I imagined it would only be a matter of time before I was found.")
    pUnit:RegisterEvent("RenCin1", 5000, 1)
end

function RenCin1(pUnit, event)
    pUnit:SendChatMessage(12, 0, "Let me tell you a little story about my life...")
    pUnit:RegisterEvent("RenCin2", 6000, 1)
end

function RenCin2(pUnit, event)
    pUnit:SendChatMessage(17, 0, "Cyous Ren looks in your direction.")
    pUnit:SendChatMessage(12, 0, "Ever since the day I took up a sword, I dreamed of becoming the best in the empire. I trained long hours for days. Honing my skills to one day prove myself as a true warrior.")
    pUnit:RegisterEvent("RenCin3", 6000, 1)
end

function RenCin3(pUnit, event)
    local target = pUnit:GetRandomPlayer(0)
    local name = target:GetName()
    pUnit:MoveTo(target:GetX(), target:GetY() - 2, target:GetZ(), target:GetO())
    pUnit:SendChatMessage(12, 0, "Do you know what it is like "..name..", to strive to be the best of the best? Do you know the challenges it entails?!")
    pUnit:RegisterEvent("RenCin4", 6000, 1)
end

function RenCin4(pUnit, event)
    pUnit:SendChatMessage(14, 0, "Do you know how much power it has given me!")
    pUnit:RegisterEvent("RenCin5", 4000, 1)
end

function RenCin5(pUnit, event)
    local target = pUnit:GetRandomPlayer(0)
    pUnit:MoveTo(target:GetX(), target:GetY() - 2, target:GetZ(), target:GetO())
    pUnit:SendChatMessage(14, 0, "The strength and the ability to manipulate all that is around me! The power to wield a weapon flawlessly!")
    pUnit:RegisterEvent("RenCin6", 7000, 1)
    pUnit:RegisterEvent("RenVisual", 1000, 20)
end
function RenVisual(pUnit, event)
    local visual = pUnit:GetRandomFriend()
    pUnit:FullCastSpell(60038)
end
    

function RenCin6(pUnit, event)
    local target = pUnit:GetRandomPlayer(0)
    local name = target:GetName()
    pUnit:MoveTo(target:GetX(), target:GetY() - 2, target:GetZ(), target:GetO())
    pUnit:SendChatMessage(12, 0, "Surely "..name..", you do not think that I am going to talk you to death, a warrior of my skill? I only ask because you seem to have a puzzled look on your face.")
    pUnit:RegisterEvent("RenCin7", 12000, 1)
end

function RenCin7(pUnit, event)
    pUnit:MoveTo(StartX, StartY, StartZ, StartO)
    pUnit:SendChatMessage(12, 0, "I was the one to fell my own Emperor in a game that he himself created. Because of my power and the ability to slay my own king, instead of becoming a new king.....")
    pUnit:RegisterEvent("RenCin8", 14000, 1)
end

function RenCin8(pUnit, event)
    pUnit:SendChatMessage(14, 0, "I was cast out by my own people! The anger in their eyes! The rage and vengenace that attacked me! FOR A GAME HE CREATED!")
    pUnit:RegisterEvent("RenCin9", 15000, 1)
end

function RenCin9(pUnit, event)
    pUnit:SendChatMessage(14, 0, "That is the day I set out on my quest for limitless power! It was such a rush to slay him and see the tears and anger! It made me want more! AND NOW....")
    pUnit:RegisterEvent("RenCin10", 6000, 1)
end

function RenCin10(pUnit, event)
    pUnit:SetFaction(14)
    pUnit:SendChatMessage(14, 0, "I AM THE BEST!")
    pUnit:RegisterEvent("RenStartBattle", 6000, 1)
        for a = 1, 12, 1 do
            if a == 3 or 6 then
                p = pUnit:GetMainTank()
            else
                p = pUnit:GetRandomPlayer(0)
            end
            if not p then break end
            pUnit:FullCastSpell(60038)
    end
end
-- End Cinematic Section

---------------------Ren Abilities--------------------------------------
--(phase 1)--
function RenSlash(pUnit, event)
    local slash = pUnit:GetMainTank()
    if slash ~= nil then
        pUnit:FullCastSpellOnTarget(29765, slash)
    else
    end
end

function RenShock(pUnit, event)
    local shock = pUnit:GetRandomPlayer(0)
    if shock ~= nil then
    pUnit:FullCastSpellOnTarget(38897, shock)
    else
    end
end

function RenPlague(pUnit, event)
    local plague = pUnit:GetMainTank()
    if plague ~= nil then
    pUnit:FullCastSpellOnTarget(55322, plague)
    else
    end
end
--(phase 2)--
function RenSpecial2(pUnit, event)
    pUnit:SendChatMessage(14, 0, "Burn in hell!")
    pUnit:RegisterEvent("RenSpecial2Fire", 2000, 4)
end
function RenSpecial2Fire(pUnit, event)
    pUnit:CastSpell(38836)
end

function RenCleave(pUnit, event)
    local cleave = pUnit:GetMainTank()
    if cleave ~= nil then
        pUnit:FullCastSpellOnTarget(30619, cleave)
    else
    end
end
--(phase 3)--
function RenHead(pUnit, event)
    local head = pUnit:GetMainTank()
    if head ~= nil then
    pUnit:FullCastSpellOnTarget(48245, head)
    else
    end
end

function RenSpecial3(pUnit, event)
    pUnit:RemoveEvents()
    pUnit:CastSpell(50161)
    pUnit:CastSpell(42047)
    pUnit:SetCombatCapable(1)
    local selection = math.random(1, 3)
    if selection == 1 then
    pUnit:SendChatMessage(14, 0, "Let see how you can handle this!")
    end
    if selection == 2 then 
    pUnit:SendChatMessage(14, 0, "You better have your healers on the ball!")
    end
    if selection == 3 then
    pUnit:SendChatMessage(14, 0, "You should be afraid!")
    end
    pUnit:RegisterEvent("RenSpecial3Cast", 1000, 10)
    pUnit:RegisterEvent("RenPhase3", 11000, 1)
end
function RenSpecial3Cast(pUnit, event)
    pUnit:CastSpell(39175)
end
--(phase 4)--
function RenCountercharge(pUnit, event)
    local counter = pUnit:GetRandomPlayer(0)
    if counter ~= nil then 
    pUnit:FullCastSpellOnTarget(35039, counter)
    else
    end
end

function RenDnD(pUnit, event)
    pUnit:FullCastSpell(56359)
end

function RenSpecial4(pUnit, event)
    pUnit:RemoveEvents()
    pUnit:CastSpell(50161)
    pUnit:SetCombatCapable(1)
    local selection = math.random(1, 3)
    if selection == 1 then
    pUnit:SendChatMessage(14, 0, "It would be in your best interest to find some cover opponents.")
    end
    if selection == 2 then 
    local taunt = pUnit:GetRandomPlayer(0)
    local name1 = taunt:GetName()
    pUnit:SendChatMessage(14, 0, "This one is for you "..name1..". Let me know how it tastes!")
    end
    if selection == 3 then
    pUnit:SendChatMessage(14, 0, "Make sure you don't fall off!")
    end
    pUnit:RegisterEvent("RenSpecial4Cast", 1000, 1)
    pUnit:RegisterEvent("RenPhase4", 12000, 1)
end
function RenSpecial4Cast(pUnit, event)
    pUnit:FullCastSpell(29973)
end
--(phase 5)--
function RenSpecial5(pUnit, event)
    pUnit:RemoveEvents()
    pUnit:CastSpell(50161)
    pUnit:CastSpell(46907)
    pUnit:SetCombatCapable(1)
    local selection = math.random(1, 3)
    if selection == 1 then
    pUnit:SendChatMessage(14, 0, "I am gowing tired of your arrogance!")
    end
    if selection == 2 then 
    pUnit:SendChatMessage(14, 0, "Catch!")
    end
    if selection == 3 then
    pUnit:SendChatMessage(14, 0, "You are beginning to piss me off!")
    end
    pUnit:RegisterEvent("RenSpecial5Cast", 500, 20)
    pUnit:RegisterEvent("RenPhase5", 12000, 1)
end
function RenSpecial5Cast(pUnit, event)
    pUnit:CastSpell(30354)
end

function RenAgonizing(pUnit, event)
    local agonizing = pUnit:GetMainTank()
        if agonizing ~= nil then
            pUnit:FullCastSpellOnTarget(58504, agonizing)
        else
    end
end

function RenDemoralize(pUnit, event)
    pUnit:CastSpell(29584)
end
-----------------------------------------------------------------------


function RenStartBattle(pUnit, event)
    print "Cyrous Renn's cinematic has ended and the battle has started..."
    pUnit:SetCombatCapable(0)
    pUnit:RemoveAura(50161)
    pUnit:RegisterEvent("RenPhase1", 1000, 1)
end

function RenPhase1(pUnit, event)
    pUnit:RegisterEvent("RenSlash", 7000, 0)
    pUnit:RegisterEvent("RenShock", 12000, 0)
    pUnit:RegisterEvent("RenPlague", 20000, 0)
    pUnit:RegisterEvent("RenPhase2", 1000, 0)
end

function RenPhase2(pUnit, event)
    if pUnit:GetHealthPct() <= 80 then
    pUnit:RemoveEvents()
    print "Cyrous Renn has entered phase 2..."
    pUnit:SendChatMessage(14, 0, "Now things are getting interesting!")
    pUnit:RegisterEvent("RenSlash", 7000, 0)
    pUnit:RegisterEvent("RenShock", 12000, 0)
    pUnit:RegisterEvent("RenCleave", 16000, 0)
    pUnit:RegisterEvent("RenSpecial2", 25000, 0)
    pUnit:RegisterEvent("RenPhase3Start", 1000, 0)
    end
end

function RenPhase3Start(pUnit, event)
    if pUnit:GetHealthPct() <= 65 then
    pUnit:RemoveEvents()
    print "Cyrous Renn has entered phase 3..."
    pUnit:SendChatMessage(14, 0, "I haven't had this much fun in a long time!")
    pUnit:RegisterEvent("RenPhase3", 1000, 1)
    end
end

function RenPhase3(pUnit, event)
    pUnit:SetCombatCapable(0)
    pUnit:RemoveAura(50161)
    pUnit:RemoveAura(42047)
    pUnit:RegisterEvent("RenSlash", 7000, 0)
    pUnit:RegisterEvent("RenShock", 12000, 0)
    pUnit:RegisterEvent("RenHead", 16000, 0)
    pUnit:RegisterEvent("RenSpecial3", 29000, 0)
    pUnit:RegisterEvent("RenPhase4Start", 1000, 0)
end

function RenPhase4Start(pUnit, event)
    if pUnit:GetHealthPct() <= 45 then
    pUnit:RemoveEvents()
    print "Cyrous Renn has entered phase 4..."
    pUnit:SendChatMessage(14, 0, "You see how we are on a platform? I wonder what happens if I throw you off!")
    pUnit:RegisterEvent("RenPhase4", 1000, 1)
    end
end

function RenPhase4(pUnit, event)
    pUnit:SetCombatCapable(0)
    pUnit:RemoveAura(50161)
    pUnit:RegisterEvent("RenCountercharge", 15000, 0)
    pUnit:RegisterEvent("RenSlash", 7000, 0)
    pUnit:RegisterEvent("RenDnD", 20000, 0)
    pUnit:RegisterEvent("RenSpecial4", 45000, 0)
    pUnit:RegisterEvent("RenPhase5Start", 1000, 0)
end

function RenPhase5Start(pUnit, event)
    if pUnit:GetHealthPct() <= 30 then
    pUnit:RemoveEvents()
    print "Cyrous Renn has entered phase 5..."
    pUnit:SendChatMessage(14, 0, "You have proven to be more of an annoyance then I have anticipated!")
    pUnit:RegisterEvent("RenPhase5", 1000, 1)
    end
end

function RenPhase5(pUnit, event)
    pUnit:SetCombatCapable(0)
    pUnit:RemoveAura(46907)
    pUnit:RemoveAura(50161)
    pUnit:RegisterEvent("RenCountercharge", 15000, 0)
    pUnit:RegisterEvent("RenDemoralize", 24000, 0)
    pUnit:RegisterEvent("RenAgonizing", 12000, 0)
    pUnit:RegisterEvent("RenDnD", 20000, 0)
    pUnit:RegisterEvent("RenSpecial5", 30000, 0)
    pUnit:RegisterEvent("RenDefeat", 1000, 0)
end

--Cinematic Defeat--
function RenDefeat(pUnit, event)
    if pUnit:GetHealthPct() <= 6 then 
        pUnit:SetCombatCapable(1)
        resetCheck = 1
        print "Cyrous Renn has been defeated and the resetCheck set to 1..."
        pUnit:RemoveEvents()
        pUnit:CastSpell(40647)
        pUnit:CastSpell(50161)
        pUnit:SendChatMessage(12, 0, "Well it appears that I have been defeated..for now. I am no fool challengers. I rather live and grow stronger, instead of die and become one with the earth.")
        pUnit:MoveTo(StartX, StartY, StartZ, StartO)
        pUnit:RegisterEvent("RenDefeat1", 1000, 1)
    end
end

function RenDefeat1(pUnit, event)
    pUnit:SendChatMessage(12, 0, "I will say one thing however. This battle has partially satisfied me for the time being.")
    pUnit:RegisterEvent("RenDefeat2", 4000, 1)
end

function RenDefeat2(pUnit, event)
    local target = pUnit:GetRandomPlayer(0)
    local name3 = target:GetName()
    pUnit:SendChatMessage(12, 0, "Be warned opponents..When next we meet, I won't be so gentle. I am especially going to be watching you "..name3..", your skill in this battle was impressive.")
    pUnit:RegisterEvent("RenDefeat3", 5000, 1)
end

function RenDefeat3(pUnit, event)
    pUnit:SendChatMessage(12, 0, "Till next we meet victors...till next we meet.")
    pUnit:MoveTo(StartX + 10, StartY + 10, StartZ, StartO)
    pUnit:RegisterEvent("RenDefeat4", 3000, 1)
end

function RenDefeat4(pUnit, event)
    pUnit:CastSpell(32343)
    pUnit:SetModel(25865)
    pUnit:SendChatMessage(16, 0, "You can feel the immence power disperse with Cyous Renn's exit.")
    --pUnit:RegisterEvent("Renn_QuestReward", 1000, 1)
    pUnit:RegisterEvent("RenDefeat5", 2000, 1)
end

function RenDefeat5(pUnit, event)
    local chestSpawn = pUnit:GetRandomPlayer(0)
    pUnit:SendChatMessage(15, 0, "I anitcipate our next meeting to be sooner then you think.")
    print "Cyrous Renn's end cinematic has finished..."
    pUnit:SpawnGameObject(8000017, pUnit:GetX(), pUnit:GetY(), pUnit:GetZ() + 2, pUnit:GetO(), 500000)
    pUnit:RegisterEvent("RenDespawn", 5000, 1)
end

function RenDespawn(pUnit, event)
    pUnit:Despawn(500, 1200000)
end

function RenReset(pUnit, event)
    if resetCheck == 0 then
    pUnit:SendChatMessage(14, 0, "Why did you accept my challenge if you were not yet ready!")
    print "Cyrous Renn has left combat prematurely..."
    end
    pUnit:RemoveEvents()
    pUnit:SetFaction(35)
    pUnit:RemoveAura(46907)
    pUnit:RemoveAura(50161)
    pUnit:RemoveAura(42047)
end

function RenChestSpawn(pUnit, event, pMisc, pGameObject, player)
    pUnit:Despawn(300000, 0)
end

RegisterUnitEvent(800805, 2,  "RenReset")
RegisterUnitEvent(800805, 18, "RenCoordMap")

RegisterUnitGossipEvent(800805, 1, "RenSpeak")
RegisterUnitGossipEvent(800805, 2, "RenOnSelect")

RegisterGameObjectEvent(8000017, 2, "RenChestSpawn")
Here is the cinematic spoiler:
