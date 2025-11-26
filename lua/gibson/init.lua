local o = vim.o
local g = vim.g
local cmd = vim.cmd
local nvim_set_hl = vim.api.nvim_set_hl
local tbl_deep_extend = vim.tbl_deep_extend

---@class GibsonConfig
---@field italic_comment? boolean
---@field lualine_bg_color? string?
---@field colors? Palette
---@field theme? string?
---@field overrides? HighlightGroups | fun(colors: Palette): HighlightGroups
local DEFAULT_CONFIG = {
    italic_comment = false,
    lualine_bg_color = nil,
    colors = require("gibson.palette"),
    overrides = {},
    theme = 'gibson'
}

local function apply_term_colors(colors)
    g.terminal_color_0 = colors.black
    g.terminal_color_1 = colors.red
    g.terminal_color_2 = colors.green
    g.terminal_color_3 = colors.yellow
    g.terminal_color_4 = colors.blue
    g.terminal_color_5 = colors.magenta
    g.terminal_color_6 = colors.cyan
    g.terminal_color_7 = colors.white
    g.terminal_color_8 = colors.bright_black
    g.terminal_color_9 = colors.bright_red
    g.terminal_color_10 = colors.bright_green
    g.terminal_color_11 = colors.bright_yellow
    g.terminal_color_12 = colors.bright_blue
    g.terminal_color_13 = colors.bright_magenta
    g.terminal_color_14 = colors.bright_cyan
    g.terminal_color_15 = colors.bright_white
    g.terminal_color_background = colors.bg
    g.terminal_color_foreground = colors.fg
end

--- override colors with colors
---@param groups HighlightGroups
---@param overrides HighlightGroups
---@return HighlightGroups
local function override_groups(groups, overrides)
    for group, setting in pairs(overrides) do
        groups[group] = setting
    end
    return groups
end

---apply gibson colorscheme
---@param configs GibsonConfig
local function apply(configs)
    local colors = configs.colors
    apply_term_colors(colors)
    local groups = require("gibson.groups").setup(configs)

    if type(configs.overrides) == "table" then
        groups = override_groups(groups, configs.overrides --[[@as HighlightGroups]])
    elseif type(configs.overrides) == "function" then
        groups = override_groups(groups, configs.overrides(colors))
    end

    -- set defined highlights
    for group, setting in pairs(groups) do
       nvim_set_hl(0, group, setting)
    end
end

---@type GibsonConfig
local user_configs = {}

--- get gibson configs
---@return GibsonConfig
local function get_configs()
    local configs = DEFAULT_CONFIG

    configs.theme = 'gibson'
    configs.colors = require('gibson.palette')

    configs = tbl_deep_extend("force", configs, user_configs)

    return configs
end

---setup gibson colorscheme
---@param configs GibsonConfig?
local function setup(configs)
    if type(configs) == "table" then
        user_configs = configs --[[@as GibsonConfig]]
    end
end

---load gibson colorscheme
---@param theme string?
local function load(theme)
    -- reset colors
    if g.colors_name then
       cmd("hi clear")
    end

    if vim.fn.exists("syntax_on") then
       cmd("syntax reset")
    end

    o.background = "dark"
    o.termguicolors = true
    g.colors_name = theme or 'gibson'

    apply(get_configs())
end

return {
    load = load,
    setup = setup,
    configs = get_configs,
    colors = function() return get_configs().colors end,
}
