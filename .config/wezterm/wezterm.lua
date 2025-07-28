local wezterm = require('wezterm') --[[@as Wezterm]]
local background = require('background')
local config = {}

config.font = wezterm.font('CaskaydiaMono Nerd Font')

-- config.window_decorations = 'RESIZE'
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false

config.background = background
config.color_scheme = 'Tokyo Night'

return config
