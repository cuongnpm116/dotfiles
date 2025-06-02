function ColorMyPencils(color)
  color = color or 'tokyonight'
  vim.cmd.colorscheme(color)
end

return {
  {
    'folke/tokyonight.nvim',
    enabled = true,
    priority = 1000,
    init = function()
      require('tokyonight').setup({
        style = 'night',
        transparent = true,
        styles = {
          sidebars = 'transparent',
          floats = 'transparent',
        },
        on_highlights = function(hl, colors)
          hl.LineNr = {
            fg = 'white',
          }
          hl.LineNrAbove = {
            fg = '#506477',
          }
          hl.LineNrBelow = {
            fg = '#506477',
          }
          hl.Comment = {
            fg = '#506477',
          }
        end,
      })
      ColorMyPencils()
    end,
  },
  {
    -- i really like the minimal color
    -- but its not good enough for me
    'olivercederborg/poimandres.nvim',
    enabled = true,
    priority = 1000,
    config = function()
      require('poimandres').setup({
        -- dim_nc_background = true,
        disable_background = true, -- disable background
        disable_float_background = true, -- disable background for floats
      })
      -- vim.cmd('colorscheme poimandres')
      vim.cmd([[
        highlight LspReferenceText guibg=#3b4261
        highlight LspReferenceRead guibg=#3b4261
        highlight LspReferenceWrite guibg=#3b4261
      ]])
      vim.cmd([[highlight ColorColumn guibg=black]])
    end,
  },
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    enabled = true,
    priority = 1000,
    init = function()
      require('catppuccin').setup({
        transparent_background = true,
      })
      -- ColorMyPencils('catppuccin')
    end,
  },
}
