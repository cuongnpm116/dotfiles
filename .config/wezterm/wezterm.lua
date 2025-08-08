local wezterm = require('wezterm') --[[@as Wezterm]]
local config = {}

config.enable_wayland = true

config.font = wezterm.font('Hack Nerd Font Mono')
config.font_size = 14

-- config.window_decorations = 'RESIZE'
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false

local home = os.getenv('HOME')

local background = {
    {
        source = {
            File = home .. '/Pictures/anime-girl-white-hair.jpg',
        },
        hsb = {
            brightness = 0.01,
        },
    },
}

config.background = background
config.color_scheme = 'Tokyo Night'

return config
