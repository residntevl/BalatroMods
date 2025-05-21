local road_odds = 4
local blind = {
    loc_txt = {
        name = 'The Road',
        text = {
            "#1# in #2# played",
            "cards are debuffed"
        }
    }, 
    config = {extra = {odds = road_odds}},
    pos = {x = 0, y = 0 },
    atlas = 'pogo_chips',
    dollars = 5,
    mult = 2,
    boss = {min = 1},
    boss_colour = HEX('597073'),
    vars = {''..(G.GAME and G.GAME.probabilities.normal or 1), road_odds},
    loc_vars = function(self)
        return {vars = {''..(G.GAME and G.GAME.probabilities.normal or 1), self.config.extra.odds}}
    end,
    press_play = function(self)
        for _, card in ipairs(G.hand.highlighted) do
            if pseudorandom(pseudoseed('road')) < G.GAME.probabilities.normal/self.config.extra.odds then
                card:set_debuff(true)
                G.GAME.blind:wiggle()
                G.GAME.blind.triggered = true
            end
        end
    end
}

return blind