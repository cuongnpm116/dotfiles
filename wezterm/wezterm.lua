local wezterm = require("wezterm")
local act = wezterm.action

local config = {}

config.font = wezterm.font("CaskaydiaMono Nerd Font")
config.color_scheme = "Tokyo Night"
config.window_background_opacity = .9
config.default_prog = { "pwsh" }
config.max_fps = 144
config.hide_tab_bar_if_only_one_tab = true
config.initial_cols = 175
config.initial_rows = 45

config.launch_menu = {
	{
		label = "PowerShell",
		args = { "pwsh" },
	},
	{
		label = "WSL",
		args = { "wsl.exe" },
	},
}

-- Tmux-style keybindings
config.leader = { key = "b", mods = "CTRL" }
config.keys = {
	-- toggle fullscreen
	{
		key = "F11",
		action = act.ToggleFullScreen,
	},
	-- Splits
	{
		key = "|",
		mods = "LEADER|SHIFT",
		action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "-",
		mods = "LEADER",
		action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	-- close a pane
	{
		key = "w",
		mods = "LEADER|CTRL",
		action = act.CloseCurrentPane({ confirm = true }),
	},

	-- Di chuyển giữa panes
	{
		key = "h",
		mods = "LEADER",
		action = act.ActivatePaneDirection("Left"),
	},
	{
		key = "j",
		mods = "LEADER",
		action = act.ActivatePaneDirection("Down"),
	},
	{
		key = "k",
		mods = "LEADER",
		action = act.ActivatePaneDirection("Up"),
	},
	{
		key = "l",
		mods = "LEADER",
		action = act.ActivatePaneDirection("Right"),
	},

	-- Tabs
	{
		key = "c",
		mods = "LEADER",
		action = act.SpawnTab("CurrentPaneDomain"),
	},
	{
		key = "n",
		mods = "LEADER",
		action = act.ActivateTabRelative(1),
	},
	{
		key = "p",
		mods = "LEADER",
		action = act.ActivateTabRelative(-1),
	},

	-- Resize panes
	{
		key = "H",
		mods = "LEADER|SHIFT",
		action = act.AdjustPaneSize({ "Left", 5 }),
	},
	{
		key = "J",
		mods = "LEADER|SHIFT",
		action = act.AdjustPaneSize({ "Down", 5 }),
	},
	{
		key = "K",
		mods = "LEADER|SHIFT",
		action = act.AdjustPaneSize({ "Up", 5 }),
	},
	{
		key = "L",
		mods = "LEADER|SHIFT",
		action = act.AdjustPaneSize({ "Right", 5 }),
	},
}

wezterm.on("gui-startup", function(cmd)
	local screen = wezterm.gui.screens().main
	local ratio = 0.7
	local width, height = screen.width * ratio, screen.height * ratio
	local tab, pane, window = wezterm.mux.spawn_window(cmd or {
		position = { x = (screen.width - width) / 2, y = (screen.height - height) / 2 },
	})
	-- window:gui_window():maximize()
	window:gui_window():set_inner_size(width, height)
end)

return config
