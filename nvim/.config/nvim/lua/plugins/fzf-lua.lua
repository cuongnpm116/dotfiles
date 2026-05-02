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
  config = function()
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('cuong_lsp_attach', { clear = true }),
      callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if not client then
          return
        end
        local buf = args.buf
        local opts = { buffer = buf }

        vim.keymap.set('n', 'gd', '<cmd>FzfLua lsp_definitions<cr>', opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', '<leader>cr', vim.lsp.buf.rename, opts)
        vim.keymap.set('i', '<C-h>', vim.lsp.buf.signature_help, opts)
        vim.keymap.set('n', '[d', function()
          vim.diagnostic.jump({ count = -1 })
        end, opts)
        vim.keymap.set('n', ']d', function()
          vim.diagnostic.jump({ count = 1 })
        end, opts)
      end,
    })
  end,
}
