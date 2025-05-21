local blind = {
    loc_txt = {
        name = 'The Core',
        text = {
            "First played hand",
            "is copied to deck",
        }
    },
    pos = {x = 0, y = 5 },
    atlas = 'pogo_chips',
    dollars = 3,
    mult = 2.5,
    boss = {min = 6},
    boss_colour = HEX('DB96A3'),
    press_play = function(self)
        if self.disabled then return end
        if G.GAME.current_round.hands_played == 0 then
            self.triggered = true
            G.GAME.blind:wiggle()
            G.E_MANAGER:add_event(Event({
                func = function()
                    if #G.play.cards > 0 then
                        for i = 1, #G.play.cards do
                            local _card = copy_card(G.play.cards[i], nil, nil, G.playing_card)
                            _card:add_to_deck()
                            G.deck.config.card_limit = G.deck.config.card_limit + 1
                            table.insert(G.playing_cards, _card)
                            G.hand:emplace(_card)
                            _card.states.visible = nil
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    _card:start_materialize()
                                    return true
                                    end
                            }))
                        end
                    end
                    return true 
                end
            }))
        end
    end
}

return blind