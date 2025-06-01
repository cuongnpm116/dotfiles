local wezterm = require('wezterm') --[[@as Wezterm]]
local keys = require('keys')
local background = require('background')
local events = require('events')
local config = {}

config.font = wezterm.font('CaskaydiaMono Nerd Font')

-- config.window_decorations = 'RESIZE'
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false

config.color_scheme = 'tokyonight_night'

config.colors = {
  background = 'white',
}

-- config.background = background

-- use background image -> no need for window transparent
-- config.window_background_opacity = 0.75

config.default_prog = { 'pwsh' }

config.leader = keys.leader
config.keys = keys.keys

if events.init then
  events.init()
end
return config
