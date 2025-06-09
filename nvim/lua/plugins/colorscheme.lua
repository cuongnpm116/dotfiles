return {
  {
    'ellisonleao/gruvbox.nvim',
    enabled = false,
    priority = 1000,
    config = function()
      vim.opt.background = 'light'
      require('gruvbox').setup({
        contrast = 'soft',
      })
      vim.cmd.colorscheme('gruvbox')
    end,
  },

  {
    'folke/tokyonight.nvim',
    enabled = true,
    priority = 1000,
    config = function()
      require('tokyonight').setup({
        style = 'day',
        transparent = false,
        -- styles = {
        --   sidebars = 'transparent',
        --   floats = 'transparent',
        -- },
        on_highlights = function(hl, colors)
          hl.LineNr = { fg = 'white' }
          hl.LineNrAbove = { fg = '#506477' }
          hl.LineNrBelow = { fg = '#506477' }
          hl.Comment = { fg = '#506477' }
        end,
      })
    end,
  },
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    enabled = false,
    priority = 1000,
    config = function()
      require('catppuccin').setup({})
      vim.cmd.colorscheme('catppuccin')
    end,
  },
}
