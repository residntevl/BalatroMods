local blind = {
    loc_txt = {
        name = 'The Grill',
        text = {
            "Gain $1 per",
            "card played.",
        }
    },
    pos = {x = 0, y = 6 },
    atlas = 'pogo_chips',
    dollars = 2,
    mult = 1.5,
    boss = {min = 1},
    boss_colour = HEX('A58524'),
    press_play = function(self)
        if self.disabled then return end
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2, func = function()
            for i = 1, #G.play.cards do
                G.E_MANAGER:add_event(Event({func = function() G.play.cards[i]:juice_up(); return true end })) 
                ease_dollars(1)
                delay(0.23)
            end
        return true end })) 
        self.triggered = true
        G.GAME.blind:wiggle()
        return true
    end
}

return blind