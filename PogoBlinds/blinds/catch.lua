local blind = {
    loc_txt = {
        name = 'The Catch',
        text = {
            "Gain x3 base mult",
            "per Gold card scored",
        }
    },
    pos = {x = 0, y = 13 },
    atlas = 'pogo_chips',
    dollars = 5,
    mult = 4,
    boss = {min = 4},
    boss_colour = HEX('FFC56C'),
    modify_hand = function(self, cards, poker_hands, text, mult, hand_chips)
        -- to make it negative, destroy or debuff gold cards in hand
        if self.disabled then return mult, hand_chips, false end
            for i=1, #cards do
                if cards[i].config.center == G.P_CENTERS.m_gold then
                    mult = mult * 3
                    self.triggered = true
                    G.GAME.blind:wiggle()
                end
            end
            if self.triggered == true then
                return mult, hand_chips, true
            end
        return mult, hand_chips, false
    end
}

return blind
