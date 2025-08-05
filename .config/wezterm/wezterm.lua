local wezterm = require('wezterm') --[[@as Wezterm]]
local background = require('background')
local config = {}

config.font = wezterm.font('JetBrainsMono Nerd Font Mono')
config.font_size = 14

-- config.window_decorations = 'RESIZE'
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false

config.background = background
config.color_scheme = 'Tokyo Night'

return config
