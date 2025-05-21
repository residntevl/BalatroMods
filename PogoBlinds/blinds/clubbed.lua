local blind = {
    loc_txt = {
        name = 'The Clubbed',
        text = {
            "Lose $2 per",
            "club card played",
        }
    },
    pos = {x = 0, y = 4 },
    atlas = 'pogo_chips',
    dollars = 5,
    mult = 2.2,
    boss = {min = 2},
    boss_colour = HEX('DB96A3'),
    press_play = function(self)
        if self.disabled then return end
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2, func = function()
            local wiggle = false
            for i = 1, #G.play.cards do
                if G.play.cards[i]:is_suit("Clubs") then 
                  G.E_MANAGER:add_event(Event({func = function() G.play.cards[i]:juice_up(); return true end })) 
                  ease_dollars(-2)
                  if not wiggle then
                    G.GAME.blind:wiggle()
                    wiggle = true
                  end
                  delay(0.23)
                end
            end
        return true end })) 
    end
}

return blind