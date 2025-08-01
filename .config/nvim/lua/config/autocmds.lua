local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local cuong = augroup("cuong", {})

autocmd({ "BufWritePre" }, {
    group = cuong,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

autocmd("TextYankPost", {
    group = cuong,
    pattern = "*",
    callback = function()
        vim.hl.on_yank({
            higroup = "IncSearch",
            timeout = 40,
        })
    end,
})

-- resize splits if window got resized
autocmd({ "VimResized" }, {
    group = cuong,
    callback = function()
        local current_tab = vim.fn.tabpagenr()
        vim.cmd("tabdo wincmd =")
        vim.cmd("tabnext " .. current_tab)
    end,
})

-- check if needed to reload
autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
    group = cuong,
    callback = function()
        if vim.o.buftype ~= "nofile" then
            vim.cmd("checktime")
        end
    end,
})

autocmd("LspAttach", {
    group = cuong,
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        local buf = args.buf
        local opts = { buffer = buf }

        vim.keymap.set("n", "gd", function()
            if client.name == "omnisharp" then
                require("omnisharp_extended").lsp_definitions()
            else
                vim.lsp.buf.definition()
            end
        end, opts)

        vim.keymap.set("n", "gr", function()
            if client.name == "omnisharp" then
                require("omnisharp_extended").references_handler()
            else
                vim.lsp.buf.references()
            end
        end, opts)

        vim.keymap.set("n", "gi", function()
            if client.name == "omnisharp" then
                require("omnisharp_extended").implementation_handler()
            else
                vim.lsp.buf.implementation()
            end
        end, opts)

        -- Phần còn lại áp dụng cho mọi LSP
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, opts)
        vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
        vim.keymap.set("n", "[d", function()
            vim.diagnostic.jump({ count = 1, float = true })
        end, opts)
        vim.keymap.set("n", "]d", function()
            vim.diagnostic.jump({ count = -1, float = true })
        end, opts)
    end,
})

-- autocmd("LspAttach", {
--     group = cuong,
--     callback = function(e)
--         local opts = { buffer = e.buf }
--         vim.keymap.set("n", "gd", function()
--             vim.lsp.buf.definition()
--         end, opts)
--
--         vim.keymap.set("n", "K", function()
--             vim.lsp.buf.hover()
--         end, opts)
--
--         vim.keymap.set("n", "<leader>ca", function()
--             vim.lsp.buf.code_action()
--         end, opts)
--
--         vim.keymap.set("n", "gr", function()
--             vim.lsp.buf.references()
--         end, opts)
--
--         vim.keymap.set("n", "gi", function()
--             vim.lsp.buf.implementation()
--         end, opts)
--
--         vim.keymap.set("n", "<leader>cr", function()
--             vim.lsp.buf.rename()
--         end, opts)
--
--         vim.keymap.set("i", "<C-h>", function()
--             vim.lsp.buf.signature_help()
--         end, opts)
--
--         vim.keymap.set("n", "[d", function()
--             vim.diagnostic.jump({ count = 1, float = true })
--         end, opts)
--
--         vim.keymap.set("n", "]d", function()
--             vim.diagnostic.jump({ count = -1, float = true })
--         end, opts)
--     end,
-- })
