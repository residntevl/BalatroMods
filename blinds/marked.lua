local chance_to = 4

local blind = {
    loc_txt = {
        name = 'The Marked',
        text = {
            "#1# in #2# chance to mark",
            "played face cards"
        }
    },
    config = {extra = {odds = chance_to}},
    pos = {x = 0, y = 22 },
    atlas = 'pogo_chips',
    dollars = 5,
    mult = 2,
    boss = {min = 4},
    vars = {''..(G.GAME and G.GAME.probabilities.normal or 1), chance_to},
    boss_colour = HEX('523B5E'),
    loc_vars = function(self)
        return {vars = {''..(G.GAME and G.GAME.probabilities.normal or 1), self.config.extra.odds}}
    end,
    press_play = function(self)
        if self.disabled then return end
        self.triggered = false
        local picky = { "m_bonus", "m_mult", "m_wild", "m_glass", "m_steel", "m_stone", "m_gold", "m_lucky" }
        for _, card in ipairs(G.hand.highlighted) do
            if card:is_face(true) and pseudorandom(pseudoseed('mark')) < G.GAME.probabilities.normal/self.config.extra.odds then
                -- pick a random one asdfg
                self.triggered = true
                card:set_ability(picky[math.random(#picky)], nil, true)
                G.E_MANAGER:add_event(Event({
                    func = function()
                        card:juice_up()
                        return true
                end}))
            end
        end
        if self.triggered then
            G.GAME.blind:wiggle()
        end
    end,
}

return blind
