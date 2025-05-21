local blind = {
    loc_txt = {
        name = 'The Exposed',
        text = {
            "Enhanced cards",
            "are debuffed"
        }
    }, 
    config = {},
    pos = {x = 0, y = 8 },
    atlas = 'pogo_chips',
    dollars = 5,
    mult = 2,
    boss = {min = 4},
    boss_colour = HEX('D79527'),
    debuff_card = function(self, card, from_blind)
        if card.area ~= G.jokers then
            return card.config.center ~= G.P_CENTERS.c_base
        end
    end
}

return blind