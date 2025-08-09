local wezterm = require('wezterm') --[[@as Wezterm]]
local config = {}

-- config.enable_wayland = true
config.use_ime = true

config.font = wezterm.font('Hack Nerd Font Mono')
config.font_size = 14

-- config.window_decorations = 'RESIZE'
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false

local home = os.getenv('HOME')

local background = {
    {
        source = {
            File = home .. '/Pictures/Wallpapers/dead-by-daylight-game-maniac.jpg',
        },
        hsb = {
            brightness = 0.01,
        },
    },
}
config.background = background

config.color_scheme = 'Tokyo Night'

-- config.window_background_opacity = 0.9
config.colors = {
    tab_bar = {
        background = 'rgba(0,0,0,0)',
    },
}

return config
