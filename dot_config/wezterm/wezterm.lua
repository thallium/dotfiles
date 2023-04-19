local wezterm = require 'wezterm'
local theme = require'theme'
local act = wezterm.action

wezterm.on('window-config-reloaded', function (window, pane)
    local overrides = window:get_config_overrides() or {}
    local target = theme.get_color()
    if overrides.colors ~= target.colors then
        overrides.colors = target.colors
        overrides.window_frame = target.window_frame
        window:set_config_overrides(overrides)
    end
end)

local color = theme.get_color()

return {
    font = wezterm.font_with_fallback{
        "FiraCode Nerd Font Mono",
        "Noto Sans CJK SC"
    },
    font_size = 15,

    line_height = 1.1,
    colors = color.colors,
    window_frame = color.window_frame,
    tab_bar_at_bottom = true,
    hide_tab_bar_if_only_one_tab = true,
    default_cursor_style = 'SteadyBar',

    keys = {
        {
            key = 'Space',
            mods = 'CTRL',
            action = act.SendKey { key = 'Insert' }
        },
        {
            key = 'Tab',
            mods = 'CTRL',
            action = act.Multiple {
                act.SendKey { key = 'Insert' },
                act.SendKey { key = '.' },
            }
        },
        {
            key = 'Tab',
            mods = 'CTRL|SHIFT',
            action = act.Multiple {
                act.SendKey { key = 'Insert' },
                act.SendKey { key = ',' },
            }
        },
        {
            key = 'Enter',
            mods = 'ALT',
            action = act.DisableDefaultAssignment,
        }
    }
}
