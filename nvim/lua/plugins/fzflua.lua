return {
  'ibhagwan/fzf-lua',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    files = {
      fd_opts = [[--color=never --type f --hidden --follow --exclude .git --exclude node_modules --exclude bin --exclude obj --exclude .next]],
    },
  },
  keys = {
    -- <cmd> == :
    -- <cmd> must end with <cr>
    { '<leader>sh', '<cmd>FzfLua help_tags<CR>' },
    { '<leader>sk', '<cmd>FzfLua keymaps<CR>' },
    { '<leader>sf', '<cmd>FzfLua files<cr>' },
    { '<leader>sg', '<cmd>FzfLua git_files<CR>' },
    { '<leader>sd', '<cmd>FzfLua diagnostics<CR>' },
    { '<leader>sl', '<cmd>FzfLua live_grep<CR>' },
    { '<leader>sb', '<cmd>FzfLua buffers<CR>' },
  },
}
