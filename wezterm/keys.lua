local wezterm = require('wezterm')
local act = wezterm.action

return {
  leader = { key = 'b', mods = 'CTRL', timeout_milliseconds = 1000 },
  keys = {
    -- Tabs stick with the default
    -- Ctrl + Shift + t to open new tab
    -- Ctrl + Shift + w to close tab
    -- Splits
    {
      key = '|',
      mods = 'LEADER|SHIFT',
      action = act.SplitHorizontal({ domain = 'CurrentPaneDomain' }),
    },
    {
      key = '-',
      mods = 'LEADER',
      action = act.SplitVertical({ domain = 'CurrentPaneDomain' }),
    },
    {
      key = 'w',
      mods = 'LEADER|CTRL',
      action = act.CloseCurrentPane({ confirm = true }),
    },
    -- Pane movement
    {
      key = 'h',
      mods = 'LEADER',
      action = act.ActivatePaneDirection('Left'),
    },
    {
      key = 'j',
      mods = 'LEADER',
      action = act.ActivatePaneDirection('Down'),
    },
    {
      key = 'k',
      mods = 'LEADER',
      action = act.ActivatePaneDirection('Up'),
    },
    {
      key = 'l',
      mods = 'LEADER',
      action = act.ActivatePaneDirection('Right'),
    },
    -- Resize panes
    {
      key = 'H',
      mods = 'LEADER|SHIFT',
      action = act.AdjustPaneSize({ 'Left', 5 }),
    },
    {
      key = 'J',
      mods = 'LEADER|SHIFT',
      action = act.AdjustPaneSize({ 'Down', 5 }),
    },
    {
      key = 'K',
      mods = 'LEADER|SHIFT',
      action = act.AdjustPaneSize({ 'Up', 5 }),
    },
    {
      key = 'L',
      mods = 'LEADER|SHIFT',
      action = act.AdjustPaneSize({ 'Right', 5 }),
    },
  },
}
