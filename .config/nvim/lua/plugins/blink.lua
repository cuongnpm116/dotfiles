return {
    "saghen/blink.cmp",
    event = "VimEnter",
    version = "1.*",
    dependencies = {
        {
            "L3MON4D3/LuaSnip",
            event = "InsertEnter",
            version = "2.*",
            build = "make install_jsregexp",
            dependencies = {
                -- {
                --   'rafamadriz/friendly-snippets',
                --   config = function()
                --     require('luasnip.loaders.from_vscode').lazy_load()
                --   end,
                -- },
            },
            opts = {},
        },
        "saghen/blink.compat",
    },
    --- @module 'blink.cmp'
    --- @type blink.cmp.Config
    opts = {
        keymap = {
            preset = "default",
        },
        appearance = {
            nerd_font_variant = "mono",
        },
        completion = {
            documentation = { auto_show = false, auto_show_delay_ms = 500 },
        },
        sources = {
            default = { "lsp", "path", "snippets", "supermaven" },
            providers = {
                supermaven = {
                    name = "supermaven",
                    module = "blink.compat.source",
                    score_offset = 3,
                },
            },
        },
        snippets = { preset = "luasnip" },
        fuzzy = { implementation = "lua" },

        -- Shows a signature help window while you type arguments for a function
        signature = { enabled = true },
    },
}
