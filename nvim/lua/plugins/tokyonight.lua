function ColorMyPencils(color)
  color = color or 'tokyonight'
  vim.cmd.colorscheme(color)
end

return {
  'folke/tokyonight.nvim',
  enabled = true,
  lazy = true,
  priority = 1000,
  init = function()
    require('tokyonight').setup({
      style = 'day',
      transparent = false,
      styles = {
        sidebars = 'transparent',
        floats = 'transparent',
      },
      -- on_highlights = function(hl, colors)
      --   hl.LineNr = {
      --     fg = colors.orange,
      --   }
      --   hl.LineNrAbove = {
      --     fg = '#e3e2e1',
      --   }
      --   hl.LineNrBelow = {
      --     fg = '#e3e2e1',
      --   }
      --   hl.Comment = {
      --     fg = '#e3e2e1',
      --   }
      -- end,
    })
    ColorMyPencils()
  end,
}
