return {
  'stevearc/oil.nvim',
  lazy = false,
  -- dependencies = {
  --   { 'nvim-mini/mini.icons', opts = {} },
  -- },
  keys = {
    { '<leader>e', '<cmd>Oil<cr>' },
  },
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {
    default_file_explorer = true,
    view_options = {
      show_hidden = true,
    },
  },
}
