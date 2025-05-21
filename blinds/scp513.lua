local chance_to = 10

local blind = {
    loc_txt = {
        name = 'SCP 513',
        text = {
            "If you hear it",
            "he can touch you"
        }
    },
    config = {extra = {odds = chance_to}},
    pos = {x = 0, y = 27 },
    atlas = 'pogo_chips',
    dollars = 5,
    mult = 2,
    boss = {min = 1, max = 10},--showdown = true
    --showdown = true,
    boss_colour = HEX('FF75B7'),
    loc_vars = function(self)
        return {vars = {''..(G.GAME and G.GAME.probabilities.normal or 1), self.config.extra.odds}}
    end,
    --SMODS.add_card({ key = 'j_popcorn', area = G.jokers, edition = 'e_negative' })
    -- create_card(_type, area, legendary, _rarity, skip_materialize, soulable, forced_key, key_append)
    -- function, create an eternal negative joker named scp 513 that will do gameplay effects to mess with certain things (also has effects)
}

return blind
