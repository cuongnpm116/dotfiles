return {
  'neovim/nvim-lspconfig',
  dependencies = {
    { 'mason-org/mason.nvim', opts = {} },
    { 'mason-org/mason-lspconfig.nvim', opts = {} },
    {
      'WhoIsSethDaniel/mason-tool-installer.nvim',
      opts = {
        ensure_installed = {
          -- lsp
          'lua_ls',
          'pyright',
          'prettierd',
          'qmlls',
          -- formatter
          'stylua', -- lua
          'black', -- python
          'isort', -- python (format import)
        },
      },
    },
  },
}
