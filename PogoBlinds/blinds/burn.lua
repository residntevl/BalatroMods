local blind = {
    loc_txt = {
        name = 'The Burn',
        text = {
            "Subtracts number of times played",
            "hand has been played from mult",
        }
    },
    pos = {x = 0, y = 12 },
    atlas = 'pogo_chips',
    dollars = 5,
    mult = 2,
    boss = {min = 4},
    boss_colour = HEX('FF8B63'),
    modify_hand = function(self, cards, poker_hands, text, mult, hand_chips)
        if G.GAME.blind.disabled then return mult, hand_chips, false end
        local mult_mod = G.GAME.hands[G.GAME.current_round.current_hand.handname].played
        if mult_mod > 1 then
            mult = mult - mult_mod
            if mult < 0 or mult == 0 then
                mult = 1
            end
            G.GAME.blind.triggered = true
            G.GAME.blind:wiggle()
            if G.GAME.blind.triggered == true then
                return mult, hand_chips, true
            end
        end
        return mult, hand_chips, false
    end
}

return blind
