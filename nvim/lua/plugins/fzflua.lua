return {
  'ibhagwan/fzf-lua',
  enabled = true,
  dependencies = { 'echasnovski/mini.icons' },
  opts = {
    files = {
      fd_opts = [[--color=never --type f --hidden --follow --exclude .git --exclude node_modules --exclude bin --exclude obj --exclude .next]],
    },
  },
  keys = {
    {
      '<leader>sh',
      function()
        require('fzf-lua').helptags()
      end,
    },
    {
      '<leader>sk',
      function()
        require('fzf-lua').keymaps()
      end,
    },
    {
      '<leader>sf',
      function()
        require('fzf-lua').files()
      end,
    },
    {
      '<leader>sg',
      function()
        require('fzf-lua').git_files()
      end,
    },
    {
      '<leader>sdd',
      function()
        require('fzf-lua').diagnostics_document()
      end,
    },
    {
      '<leader>sdw',
      function()
        require('fzf-lua').diagnostics_workspace()
      end,
    },
    {
      '<leader>sl',
      function()
        require('fzf-lua').live_grep()
      end,
    },
    {
      '<leader>sb',
      function()
        require('fzf-lua').buffers()
      end,
    },
  },
}
