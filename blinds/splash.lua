local chance_to = 10

local blind = {
    loc_txt = {
        name = 'Emerald Splash',
        text = {
            "All uncommon jokers",
            "are debuffed"
        }
    },
    config = {extra = {odds = chance_to}},
    pos = {x = 0, y = 26 },
    atlas = 'pogo_chips',
    dollars = 8,
    mult = 2,
    boss = {showdown = true, min = 10, max = 10},
    boss_colour = HEX('00F756'),
    set_blind = function(self, reset, silent)
        if self.disabled then return end
        for _, card in ipairs(G.jokers.cards) do
            if card.config.center.rarity == 2 then
                card:juice_up()
                card:set_debuff(true)
                G.GAME.blind:wiggle()
            end
        end
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
            if card.config.center.rarity == 2 then
                card:juice_up()
                G.GAME.blind:wiggle()
                return true
            else
                return false
            end
        end
    end,
}

return blind
