local blind = {
    loc_txt = {
        name = 'The Crowd',
        text = {
            "First played hand",
            "goes a little wild",
        }
    },
    pos = {x = 0, y = 10 },
    atlas = 'pogo_chips',
    dollars = 5,
    mult = 2,
    boss = {min = 3},
    boss_colour = HEX('3CA45F'),
    press_play = function(self)
        if self.disabled then return end
        if G.GAME.current_round.hands_played == 0 then
            self.triggered = true
            G.GAME.blind:wiggle()
            for _, card in ipairs(G.hand.highlighted) do
                card:set_ability('m_wild', nil, true)
                G.E_MANAGER:add_event(Event({
                func = function()
                    card:juice_up()
                    return true
                end
                }))
            end
        end
    end,
    -- to make this more interesting, random enhancements at a chance
}

return blind