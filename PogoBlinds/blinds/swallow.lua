local blind = {
    loc_txt = {
        name = 'The Swallow',
        text = {
            "Reset first played hand level",
            "Gain $1 per level lost"
        }
    },
    pos = {x = 0, y = 18 },
    atlas = 'pogo_chips',
    dollars = 5,
    mult = 2,
    boss = {min = 5},
    boss_colour = HEX('5F8D9D'),
    debuff_hand = function(self, cards, hand, handname, check)
        if self.disabled then return end
        self.triggered = false
        -- handname refers to current hand
        if G.GAME.current_round.hands_played == 0 then
            -- will work to get the number of levels to assign, not to actuallyy get the hand name...
            -- prior function idea
            -- first played hand swaps level with highest leveled hand or highest played hand level
            --highest_hand = math.max(G.GAME.hands[1].level, G.GAME.hands[2].level, G.GAME.hands[3].level, G.GAME.hands[4].level, G.GAME.hands[5].level, G.GAME.hands[6].level, G.GAME.hands[7].level, G.GAME.hands[8].level, G.GAME.hands[9].level, G.GAME.hands[10].level, G.GAME.hands[11].level, G.GAME.hands[12].level)
            if G.GAME.hands[handname].level > 1 then
                self.triggered = true
                ease_dollars(hand.level)
                level_up_hand(G.hand, handname, nil, -hand.level+1)
                G.GAME.blind:wiggle()
            end
        end
    end
}

return blind
