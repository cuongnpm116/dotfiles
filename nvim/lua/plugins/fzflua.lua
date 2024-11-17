return {
  'ibhagwan/fzf-lua',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    files = {
      fd_opts = [[--color=never --type f --hidden --follow --exclude .git --exclude node_modules --exclude bin --exclude obj --exclude .next]],
    },
  },
  keys = {
    { '<leader>sh', "<cmd>lua require('fzf-lua').help_tags()<CR>" },
    { '<leader>sk', "<cmd>lua require('fzf-lua').keymaps()<CR>" },
    { '<leader>sf', "<cmd>lua require('fzf-lua').files()<CR>" },
    { '<leader>sg', "<cmd>lua require('fzf-lua').git_files()<CR>" },
    { '<leader>sd', "<cmd>lua require('fzf-lua').diagnostics()<CR>" },
    { '<leader>sl', "<cmd>lua require('fzf-lua').live_grep()<CR>" },
    { '<leader>sb', "<cmd>lua require('fzf-lua').buffers()<CR>" },
  },
}
