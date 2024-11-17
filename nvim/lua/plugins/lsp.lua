return {
  'neovim/nvim-lspconfig',
  dependencies = {
    { 'williamboman/mason.nvim', config = true },
    'williamboman/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    { 'j-hui/fidget.nvim', opts = {} },
    'hrsh7th/cmp-nvim-lsp',
  },
  config = function()
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup(
        'kickstart-lsp-attach',
        { clear = true }
      ),
      callback = function(event)
        local map = function(keys, func, mode)
          mode = mode or 'n'
          vim.keymap.set(mode, keys, func, { buffer = event.buf })
        end

        --  To jump back, press <C-t>.
        map('gd', '<cmd>lua require("fzf-lua").lsp_definitions()<cr>')
        map('gr', '<cmd>lua require("fzf-lua").lsp_references()<cr>')
        map('gI', '<cmd>lua require("fzf-lua").lsp_implementations()<cr>')
        map('<leader>D', '<cmd>lua require("fzf-lua").lsp_typedefs()<cr>')
        map(
          '<leader>ds',
          '<cmd>lua require("fzf-lua").lsp_document_symbols()<cr>'
        )
        map(
          '<leader>ws',
          '<cmd>lua require("fzf-lua").lsp_workspace_symbols()<cr>'
        )
        map('<leader>rn', vim.lsp.buf.rename)
        map('<leader>ca', vim.lsp.buf.code_action, { 'n', 'x' })
        map('gD', vim.lsp.buf.declaration)

        -- The following two autocommands are used to highlight references of the
        -- word under your cursor when your cursor rests there for a little while.
        -- When you move your cursor, the highlights will be cleared (the second autocommand).
        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if
          client
          and client.supports_method(
            vim.lsp.protocol.Methods.textDocument_documentHighlight
          )
        then
          local highlight_augroup = vim.api.nvim_create_augroup(
            'kickstart-lsp-highlight',
            { clear = false }
          )
          vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.document_highlight,
          })

          vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.clear_references,
          })

          vim.api.nvim_create_autocmd('LspDetach', {
            group = vim.api.nvim_create_augroup(
              'kickstart-lsp-detach',
              { clear = true }
            ),
            callback = function(event2)
              vim.lsp.buf.clear_references()
              vim.api.nvim_clear_autocmds({
                group = 'kickstart-lsp-highlight',
                buffer = event2.buf,
              })
            end,
          })
        end
      end,
    })

    -- Change diagnostic symbols in the sign column (gutter)
    if vim.g.have_nerd_font then
      local signs = { Error = '', Warn = '', Hint = '', Info = '' }
      for type, icon in pairs(signs) do
        local hl = 'DiagnosticSign' .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
      end
    end

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend(
      'force',
      capabilities,
      require('cmp_nvim_lsp').default_capabilities()
    )

    local servers = {
      angularls = {},
      css_variables = {},
      cssls = {},
      cssmodules_ls = {},
      dockerls = {},
      eslint = {},
      html = {},
      jsonls = {},
      omnisharp = {},
      sqlls = {},
      clangd = {},
      gopls = {},
      pyright = {},
      rust_analyzer = {},
      tailwindcss = {},
      ts_ls = {},
      lua_ls = {
        settings = {
          Lua = {
            completion = {
              callSnippet = 'Replace',
            },
          },
        },
      },
    }

    require('mason').setup()

    local ensure_installed = vim.tbl_keys(servers or {})
    vim.list_extend(ensure_installed, {
      'stylua',
      'prettierd',
    })
    require('mason-tool-installer').setup({
      ensure_installed = ensure_installed,
    })

    require('mason-lspconfig').setup({
      handlers = {
        function(server_name)
          local server = servers[server_name] or {}
          server.capabilities = vim.tbl_deep_extend(
            'force',
            {},
            capabilities,
            server.capabilities or {}
          )
          require('lspconfig')[server_name].setup(server)
        end,
      },
    })
  end,
}
