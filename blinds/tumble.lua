local blind =  {
    loc_txt = {
        name = 'The Tumble',
        text = {
            "Scored cards",
            "lose 5 chips"
        }
    },
    pos = {x = 0, y = 2 },
    atlas = 'pogo_chips',
    dollars = 5,
    mult = 2,
    boss = {min = 3},
    boss_colour = HEX('009ECC'),
    press_play = function(self)
        if self.disabled then return end
        self.triggered = true
        G.GAME.blind:wiggle()
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2, func = function()
            for i = 1, #G.play.cards do
                G.play.cards[i]:juice_up(0.5, 0.5)
                G.play.cards[i].ability.perma_bonus = G.play.cards[i].ability.perma_bonus or 0
                G.play.cards[i].ability.perma_bonus = G.play.cards[i].ability.perma_bonus - 5
                delay(0.23)
            end
        return true end })) 
    end
}

return blind