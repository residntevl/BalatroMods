local blind = {
    loc_txt = {
        name = 'The Flow',
        text = {
            "Gain $2 per discard remaining",
            "Lose 1 discard per played hand"
        }
    },
    pos = {x = 0, y = 15 },
    atlas = 'pogo_chips',
    dollars = 5,
    mult = 2,
    boss = {min = 2},
    boss_colour = HEX('CCCFEA'),
    press_play = function(self)
        if self.disabled then return end
        self.triggered = true
        if not check then
            if G.GAME.current_round.discards_left ~= 0 then
                ease_dollars(G.GAME.current_round.discards_left * 2, true)
                G.GAME.blind.triggered = true
                G.GAME.blind:wiggle()
                ease_discard(-1)
            end
        end
    end
}

return blind
