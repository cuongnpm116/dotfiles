return {
  'ibhagwan/fzf-lua',
  opts = {
    winopts = {
      height = 0.95,
      width = 0.95,
    },
  },
  keys = {
    { '<leader>ff', '<cmd>FzfLua files<cr>' },
    { '<leader>fg', '<cmd>FzfLua live_grep<cr>' },
    { '<leader>fb', '<cmd>FzfLua buffers<cr>' },
    { '<leader>fh', '<cmd>FzfLua help_tags<cr>' },
    { '<leader>gf', '<cmd>FzfLua git_files<cr>' },
    { '<leader>gb', '<cmd>FzfLua git_blame<cr>' },
  },
}
