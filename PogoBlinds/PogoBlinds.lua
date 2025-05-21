
------------MOD CODE -------------------------
local blind_list = {
    -- comment out to disable
    "hangman",
    "plough",
    "crowd",
    "fence",
    "road",
    "burn",
    "clubbed",
    "catch",
    "regular",
    "gein",
    "flow",
    "shattering",
    "shackled",
    "exposed",
    "swallow",
    "tariff",
    "snake",
    "core",
    "haystack",
    "beheaded",
    "grill",
    "tumble",
    "marked",
    "queen",
    "rance",
    "pride",
    "splash",
}

local mod_path = SMODS.current_mod.path
SMODS.Atlas({key = 'pogo_chips', path = 'pogoblinds.png', px = 34, py = 34, frames = 21, atlas_table = 'ANIMATION_ATLAS'})

-- basically taken from Mystblinds, which was basically taken from 5CEBalatro lol
for k, v in ipairs(blind_list) do
    local blind = NFS.load(mod_path .. "blinds/" .. v .. ".lua")()
    -- don't fuck up the mod
    if not blind then
        sendErrorMessage("[PogoBlinds] Cannot find blind with shorthand: " .. v)
    else
        blind.key = v
        blind.discovered = false 
        local blind_obj = SMODS.Blind(blind)
        for k_, v_ in pairs(blind) do
            if type(v_) == 'function' then
                blind_obj[k_] = blind[k_]
            end
        end
    end
end


----------------------------------------------
------------MOD CODE END----------------------