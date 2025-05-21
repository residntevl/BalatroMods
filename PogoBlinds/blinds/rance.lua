RATIO_THRESHOLD = 0.5
local blind = {
    loc_txt = {
        name = 'Rancid Plans',
        text = {
            "All jokers debuffed",
            "until score is half of blind"
        }
    },
    pos = {x = 0, y = 25 },
    atlas = 'pogo_chips',
    dollars = 8,
    mult = 2,
    boss = {showdown = true, min = 10, max = 10},
    boss_colour = HEX('357660'),
    set_blind = function(self, reset, silent)
        if self.disabled then return end
        for _, card in ipairs(G.jokers.cards) do
            card:set_debuff(true)
            card:juice_up()
        end
        --G.GAME.blind:wiggle()
        G.GAME.blind.prepped = false
    end,
    press_play = function(self)
        G.GAME.blind.prepped = true
    end,
    disable = function(self)
        for _, card in ipairs(G.jokers.cards) do
            card:set_debuff(false)
        end
    end,
    defeat = function(self, silent)
        if self.disabled then return end
        for _, card in ipairs(G.jokers.cards) do
            card:set_debuff(false)
        end
    end,
    debuff_card = function(self, card, from_blind)
        if card.area == G.jokers then
            if card then
                card:juice_up()
                G.GAME.blind:wiggle()
                return true
            else
                return false
            end
        end
    end,
    drawn_to_hand = function(self)
    if G.GAME.blind.prepped then
        local ratio = G.GAME.chips / G.GAME.blind.chips
        -- talisman compat
        if type(ratio) == "table" then
            ratio = ratio:to_number()
        end
        if ratio > RATIO_THRESHOLD and ratio < 1.0 then
            G.GAME.blind:wiggle()
            G.GAME.blind:disable()
            -- just in case lol
        end
    end
end
}

return blind
