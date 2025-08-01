return {
    "neovim/nvim-lspconfig",
    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        "mason-org/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",

        { "j-hui/fidget.nvim", event = "LspAttach", opts = {} },

        "saghen/blink.cmp",
    },
    config = function()
        local capabilities = require("blink.cmp").get_lsp_capabilities()
        local servers = {
            clangd = {},
            gopls = {},
            pyright = {},
            rust_analyzer = {},
            ts_ls = {},
            omnisharp = {
                handlers = {
                    ["textDocument/definition"] = function(...)
                        return require("omnisharp_extended").handler(...)
                    end,
                    ["textDocument/typeDefinition"] = function(...)
                        require("omnisharp_extended").type_definition_handler(...)
                    end,
                    ["textDocument/references"] = function(...)
                        require("omnisharp_extended").references_handler(...)
                    end,
                    ["textDocument/implementation"] = function(...)
                        require("omnisharp_extended").implementation_handler(...)
                    end,
                },
                enable_roslyn_analyzers = true,
                organize_imports_on_format = true,
                enable_import_completion = true,
            },
            lua_ls = {},
        }

        local ensure_installed = vim.tbl_keys(servers or {})
        vim.list_extend(ensure_installed, {
            "stylua",
            "prettierd",
        })
        require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

        require("mason-lspconfig").setup({
            ensure_installed = {},
            automatic_installation = false,
            handlers = {
                function(server_name)
                    local server = servers[server_name] or {}
                    server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
                    require("lspconfig")[server_name].setup(server)
                end,
            },
        })
    end,
}
