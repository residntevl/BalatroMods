local blind = {
    loc_txt = {
        name = 'The Hangman',
        text = {
            "Destroys 2 random",
            "cards per played hand",
        }
    },
    pos = {x = 0, y = 9 },
    atlas = 'pogo_chips',
    dollars = 5,
    mult = 2,
    boss = {min = 5},
    boss_colour = HEX('A92659'),
    press_play = function(self)
        if self.disabled then return end
        G.E_MANAGER:add_event(Event({ func = function()
            local any_selected = nil
            local _cards = {}
            for k, v in ipairs(G.hand.cards) do
                _cards[#_cards+1] = v
            end
            for i = 1, 2 do
                if G.hand.cards[i] then 
                    local selected_card, card_key = pseudorandom_element(_cards, pseudoseed('hook'))
                    G.hand:add_to_highlighted(selected_card, true)
                    --table.remove(_cards, card_key)
                    any_selected = true
                    --play_sound('card1', 1)
                end
            end
            for i = 1, #G.hand.highlighted do
                G.hand.highlighted[i]:explode()
            end
            if any_selected then 

            end
        return true end })) 
        self.triggered = true
        G.GAME.blind:wiggle()
        delay(0.7)
    end
}

return blind