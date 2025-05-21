local blind = {
    loc_txt = {
        name = 'The Gein',
        text = {
            "Spade cards in hand",
            "will be butchered"
        }
    },
    pos = {x = 0, y = 14 },
    atlas = 'pogo_chips',
    dollars = 5,
    mult = 2,
    boss = {min = 1},
    boss_colour = HEX('B85D61'),
    press_play = function(self)
        if self.disabled then return end
        G.E_MANAGER:add_event(Event({ func = function()
            local any_selected = nil
            for i = 1, #G.hand.cards do
                if G.hand.cards[i]:is_suit("Spades") then 
                    G.hand.cards[i]:start_dissolve()
                    --G.hand:add_to_highlighted(G.hand.cards[i], true)
                    --table.remove(_cards, card_key)
                    --any_selected = true
                    --play_sound('card1', 1)
                end
            end
        return true end })) 
        self.triggered = true
        G.GAME.blind:wiggle()
        delay(0.7)
    end
}

return blind
