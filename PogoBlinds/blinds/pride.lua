local blind = {
    loc_txt = {
        name = 'Peace and Love',
        text = {
            "Walls will crumble",
            "when all are united"
        }
    },
    config = {extra = {odds = chance_to}},
    pos = {x = 0, y = 24 },
    atlas = 'pogo_chips',
    dollars = 8,
    mult = 12,
    boss = {showdown = true, min = 10, max = 10},
    boss_colour = HEX('D4E3E5'),
}

return blind
