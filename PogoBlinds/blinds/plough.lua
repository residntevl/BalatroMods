local blind = {
    loc_txt = {
        name = 'The Plough',
        text = {
            "If played hand is not most",
            "played it gains +1 level",
        }
    },
    pos = {x = 0, y = 7 },
    atlas = 'pogo_chips',
    dollars = 4,
    mult = 4,
    boss = {min = 3},
    boss_colour = HEX('6D13A8'),
    debuff_hand = function(self, cards, hand, handname, check)
        if self.disabled then return end
        self.triggered = false
        if handname ~= G.GAME.current_round.most_played_poker_hand then
            self.triggered = true
            if not check then
                level_up_hand(G.hand, handname, nil, 1)
                G.GAME.blind:wiggle()
            end
        end 
    end
}

return blind