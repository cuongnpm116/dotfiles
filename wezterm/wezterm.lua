local wezterm = require('wezterm')

local keys = require('keys')
local background = require('background')
local events = require('events')

local config = {}

config.font = wezterm.font('CaskaydiaMono Nerd Font')
config.color_scheme = 'Tokyo Night'
-- config.window_background_opacity = 0.75
config.default_prog = { 'pwsh' }
-- config.max_fps = 144
config.hide_tab_bar_if_only_one_tab = true

config.background = background
config.leader = keys.leader
config.keys = keys.keys

if events.init then
  events.init()
end

return config
