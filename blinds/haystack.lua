local hand_bonus = 3
-- to make more evil, could do minus 2 per hand played, or minus 2 per hands left >:)
local blind = {
    loc_txt = {
        name = 'The Haystack',
        text = {
            "+3 hands. Lose all discards",
            "Lose $2 when a hand is played"
        }
    },
    pos = {x = 0, y = 21 },
    atlas = 'pogo_chips',
    dollars = 5,
    mult = 2,
    boss = {min = 1},
    boss_colour = HEX('6D4D37'),
    set_blind = function(self, reset, silent)
        if self.disabled then return end
        self.discards_sub = G.GAME.current_round.discards_left
        ease_discard(-self.discards_sub)
        self.hands_sub = hand_bonus
        ease_hands_played(self.hands_sub)
    end,
    disable = function(self)
        ease_discard(self.discards_sub)
        if G.GAME.current_round.hands_left > 3 then
            ease_hands_played(-self.hands_sub)
        end
    end,
    press_play = function(self)
        if self.disabled then return end
        self.triggered = true
        ease_dollars(-2)
        G.GAME.blind:wiggle()
    end
}

return blind
