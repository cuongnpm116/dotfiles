local wezterm = require('wezterm')
local mux = wezterm.mux

local M = {}

function M.init()
  wezterm.on('gui-attached', function(domain)
    local workspace = mux.get_active_workspace()
    for _, window in ipairs(mux.all_windows()) do
      if window:get_workspace() == workspace then
        window:gui_window():maximize()
      end
    end
  end)
end

return M
