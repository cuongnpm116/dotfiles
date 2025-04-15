function ColorMyPencils(color)
  color = color or 'tokyonight'
  vim.cmd.colorscheme(color)
end

return {
  'folke/tokyonight.nvim',
  lazy = false,
  priority = 1000,
  opts = {
    style = 'day',
    transparent = false,
    styles = {
      sidebars = 'transparent',
      floats = 'transparent',
    },
  },
  init = function()
    ColorMyPencils()
  end,
}
