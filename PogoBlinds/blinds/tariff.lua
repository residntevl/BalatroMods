local blind = {
    loc_txt = {
        name = 'The Tariff',
        text = {
            "Lose $2 for each",
            "enhanced card in hand"
        }
    },
    pos = {x = 0, y = 19 },
    atlas = 'pogo_chips',
    dollars = 5,
    mult = 2,
    boss = {min = 4},
    boss_colour = HEX('AF4B4D'),
    press_play = function(self)
        for _, card in ipairs(G.hand.cards) do
            if card.config.center ~= G.P_CENTERS.c_base then
                self.triggered = true
                G.E_MANAGER:add_event(Event({
                func = function()
                    ease_dollars(-2)
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
