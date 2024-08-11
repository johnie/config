local wezterm = require ('wezterm');
local act = wezterm.action

config = wezterm.config_builder()

config = {
    automatically_reload_config = true,
    window_close_confirmation = "NeverPrompt",
    window_decorations = "RESIZE",
    default_cursor_style = "BlinkingBar",
    color_scheme = 'astromouse (terminal.sexy)',
    font = wezterm.font("JetBrains Mono", { weight = "Bold"}),
    font_size = 12.5,
    window_padding = {
        left = 30,
        right = 30,
        top = 0,
        bottom = 0,
    },

    hide_tab_bar_if_only_one_tab = true,
    enable_scroll_bar = false,
    
    keys = {
        {
            key = 'LeftArrow',
            mods = 'OPT',
            action = act.SendKey { key = 'b', mods = 'ALT' },
        },
        {
            key = 'RightArrow', 
            mods = 'OPT',
            action = act.SendKey { key = 'f', mods = 'ALT' },
        },
        {
            key = '7',
            mods = 'OPT',
            action = act.SendString '|',
        },
    },
}

return config
