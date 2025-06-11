return {
  {
    'LazyVim/LazyVim',
    opts = {
      colorscheme = 'solarized',
    },
  },
  {
    'maxmx03/solarized.nvim',
    lazy = false,
    priority = 1000,
    ---@type solarized.config
    opts = {},
    config = function(_, opts)
      vim.o.termguicolors = true
      vim.o.background = 'light'
      require('solarized').setup(opts)
    end,
  },
  {
    'folke/tokyonight.nvim',
    enabled = false,
    priority = 1000,
  },
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    enabled = false,
    priority = 1000,
    opts = {
      flavour = 'latte',
    },
  },
}
