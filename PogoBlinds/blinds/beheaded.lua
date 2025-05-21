local blind = {
    loc_txt = {
        name = 'The Beheaded',
        text = {
            "Gain x0.8 base mult",
            "per heart card played",
        }
    },
    pos = {x = 0, y = 3 },
    atlas = 'pogo_chips',
    dollars = 5,
    mult = 2,
    boss = {min = 1},
    boss_colour = HEX('BA5E4A'),
    debuff_hand = function(self, cards, hand, handname, check)
        if self.disabled then return end
        local function has_value (tab, val)
            for index, value in ipairs(tab) do
                if value:is_suit("Hearts") then
                    return true
                end
            end
            return false
        end
        if self.debuff then
            local safe = has_value(cards, "Hearts")
            self.triggered = false
            if not safe then
                self.triggered = true
                return true
            end
        end
    end,
    modify_hand = function(self, cards, poker_hands, text, mult, hand_chips)
        if self.disabled then return mult, hand_chips, false end
            for i=1, #cards do
                if cards[i]:is_suit("Hearts") then
                    mult = mult * 0.8
                    self.triggered = true
                    G.GAME.blind:wiggle()
                end
            end
            if self.triggered == true then
                return mult, hand_chips, true
            end
        return mult, hand_chips, false
    end
}

return blind