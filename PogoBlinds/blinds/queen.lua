local chance_to = 10

local blind = {
    loc_txt = {
        name = 'Killer Queen',
        text = {
            "#1# in #2# chance to",
            "gunpowder, gelatine"
        }
    },
    config = {extra = {odds = chance_to}},
    pos = {x = 0, y = 23 },
    atlas = 'pogo_chips',
    dollars = 8,
    mult = 2,
    boss = {showdown = true, min = 10, max = 10},
    vars = {''..(G.GAME and G.GAME.probabilities.normal or 1), chance_to},
    boss_colour = HEX('FF75B7'),
    loc_vars = function(self)
        return {vars = {''..(G.GAME and G.GAME.probabilities.normal or 1), self.config.extra.odds}}
    end,
    press_play = function(self)
        local destructable_jokers = {}
        for i = 1, #G.jokers.cards do
            if G.jokers.cards[i] ~= self and not G.jokers.cards[i].ability.eternal and not G.jokers.cards[i].getting_sliced then destructable_jokers[#destructable_jokers+1] = G.jokers.cards[i] end
        end
        local joker_to_destroy = #destructable_jokers > 0 and pseudorandom_element(destructable_jokers, pseudoseed('madness')) or nil
        if pseudorandom(pseudoseed('bitesthedust')) < G.GAME.probabilities.normal/self.config.extra.odds then
            if joker_to_destroy then 
                joker_to_destroy.getting_sliced = true
                G.E_MANAGER:add_event(Event({func = function()
                    G.GAME.blind:wiggle()
                    self.triggered = true
                    joker_to_destroy:explode()
                return true end }))
            end
        end
    end
}

return blind
