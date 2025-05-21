local blind = {
    loc_txt = {
        name = 'The Regular',
        text = {
            "Must play < 5 cards."
        }
    },
    pos = {x = 0, y = 1 },
    atlas = 'pogo_chips',
    dollars = 5,
    debuff = {h_size_un = 4},
    mult = 2,
    boss = {min = 1},
    boss_colour = HEX('824499'),
    debuff_hand = function(self, cards, hand, handname, check)
        if self.disabled then return end
        if self.debuff then
            self.triggered = false
            if self.debuff.h_size_un and #cards > self.debuff.h_size_un then
                self.triggered = true
                G.GAME.blind:wiggle()
                return true
            end 
        end
    end
}

return blind