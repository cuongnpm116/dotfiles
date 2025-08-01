return {
    "ibhagwan/fzf-lua",
    opts = {
        winopts = {
            width = 0.95,
            height = 0.95,
            preview = {
                scrollbar = false,
                winopts = {
                    relativenumber = true,
                    cursorline = false,
                },
            },
        },
    },
    keys = {
        { "<leader>sf", "<cmd>FzfLua files<cr>" },
        { "<leader>slg", "<cmd>FzfLua live_grep<cr>" },
        { "<leader>gf", "<cmd>FzfLua git_files<cr>" },
        { "<leader>gb", "<cmd>FzfLua git_blame<cr>" },
    },
}
