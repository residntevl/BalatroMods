local hand_bonus = 3
local blind = {
    loc_txt = {
        name = 'The Snake',
        text = {
            "+3 hand size",
            "After play, hand is discarded"
        }
    },
    pos = {x = 0, y = 20 },
    atlas = 'pogo_chips',
    dollars = 5,
    mult = 2,
    boss = {min = 3},
    boss_colour = HEX('AD5475'),
    set_blind = function(self, reset, silent)
        if self.disabled then return end
        G.hand:change_size(hand_bonus)
    end,
    disable = function(self)
        G.GAME.blind.hands_sub = 0
        G.hand:change_size(-hand_bonus)
    end,
    defeat = function(self, silent)
        if self.disabled then return end
        G.GAME.blind.hands_sub = 0
        G.hand:change_size(-hand_bonus)
    end,
    press_play = function(self)
        if self.disabled then return end
        G.E_MANAGER:add_event(Event({ func = function()
                local any_selected = nil
                local _cards = {}
                --for k, v in ipairs(G.hand.cards) do
                --    _cards[#_cards+1] = v
                --end
                -- im sure there's a while function or something but this is funnier 
                for i = 1, #G.hand.cards do
                    if G.hand.cards[i] then 
                        G.hand:add_to_highlighted(G.hand.cards[i], true)
                        --table.remove(_cards, card_key)
                        any_selected = true
                        play_sound('card1', 1)
                    end
                end
                if any_selected then G.FUNCS.discard_cards_from_highlighted(nil, true) end
                if #G.hand.cards > 0 then
                    for i = 1, #G.hand.cards do
                        if G.hand.cards[i] then 
                            G.hand:add_to_highlighted(G.hand.cards[i], true)
                            --table.remove(_cards, card_key)
                            any_selected = true
                            play_sound('card1', 1)
                        end
                    end 
                end
                if any_selected then G.FUNCS.discard_cards_from_highlighted(nil, true) end
                if #G.hand.cards > 0 then
                    for i = 1, #G.hand.cards do
                        if G.hand.cards[i] then 
                            G.hand:add_to_highlighted(G.hand.cards[i], true)
                            --table.remove(_cards, card_key)
                            any_selected = true
                            play_sound('card1', 1)
                        end
                    end 
                end
                if any_selected then G.FUNCS.discard_cards_from_highlighted(nil, true) end
            return true end })) 
            self.triggered = true
            delay(0.7)
        return true
    end
}

return blind
