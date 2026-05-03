local wezterm = require("wezterm") --[[@as Wezterm]]

local config = {}

config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.window_background_opacity = 0.9

config.font = wezterm.font_with_fallback({
	"CaskaydiaMono Nerd Font Mono",
	"Noto Color Emoji",
})
config.font_size = 14
config.color_scheme = "Noctalia"

config.colors = {
	tab_bar = {
		background = "rgba(0, 0, 0, 0.8)",
	},
}

return config
