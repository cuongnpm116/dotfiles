local wezterm = require("wezterm") --[[@as Wezterm]]

local config = {}

config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.window_background_opacity = 0.9

config.font = wezterm.font("CaskaydiaMono Nerd Font Mono")
config.font_size = 18
config.color_scheme = "Noctalia"

config.colors = {
	tab_bar = {
		background = "rgba(0, 0, 0, 0.8)",
	},
}

return config
