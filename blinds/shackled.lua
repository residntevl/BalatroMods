local blind = {
    loc_txt = {
        name = 'The Shackled',
        text = {
            "-1 hand size for",
            " each hand played"
        }
    },
    pos = {x = 0, y = 17 },
    atlas = 'pogo_chips',
    dollars = 5,
    mult = 3,
    boss = {min = 2},
    boss_colour = HEX('303030'), 
    set_blind = function(self, reset, silent)
        if not G.GAME.blind.disabled then
            G.GAME.blind.hands_sub = 0
        end
    end,
    disable = function(self)
        G.hand:change_size(G.GAME.blind.hands_sub)
        G.GAME.blind.hands_sub = 0
    end,
    defeat = function(self, silent)
        G.hand:change_size(G.GAME.blind.hands_sub)
    end,
    press_play = function(self)
        sendInfoMessage(G.hand.config.card_limit)
        sendInfoMessage(G.GAME.blind.hands_sub)
        if G.hand.config.card_limit > 1 then
            G.hand:change_size(-1)
            G.GAME.blind.hands_sub = G.GAME.blind.hands_sub + 1 -- size removed
            G.GAME.blind:wiggle()
        end
    end
}

return blind