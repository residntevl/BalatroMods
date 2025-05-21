local blind = {
    loc_txt = {
        name = 'The Shattering',
        text = {
            "All scored diamonds",
            "become glass cards"
        }
    },
    pos = {x = 0, y = 16 },
    atlas = 'pogo_chips',
    dollars = 5,
    mult = 5,
    boss = {min = 4},
    boss_colour = HEX('8FA79D'),
    press_play = function(self)
        for _, card in ipairs(G.hand.highlighted) do
            if card:is_suit("Diamonds") then
                self.triggered = true
                card:set_ability('m_glass', nil, true)
                G.E_MANAGER:add_event(Event({
                func = function()
                    card:juice_up()
                    return true
                end
                }))
            end
        end
        if self.triggered then
            G.GAME.blind:wiggle()
        end
    end
}

return blind
