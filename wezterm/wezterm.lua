local wezterm = require("wezterm")
local config = {}

config.font = wezterm.font("CaskaydiaMono Nerd Font")
config.color_scheme = "Tokyo Night"
config.window_background_opacity = 0.7
config.default_prog = { "pwsh" }

return config
