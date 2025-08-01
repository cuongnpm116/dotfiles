local map = vim.keymap

-- disable Space's default behavior
map.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- open file explorer (netrw)
map.set("n", "<leader>pv", "<cmd>Ex<cr>", { silent = true })

-- delete single char without yanking into register
map.set("n", "x", '"_x')

-- keep last yanked when pasting
map.set("v", "p", '"_dP')

-- clear highlights on search
map.set("n", "<Esc>", "<cmd>nohlsearch<cr>")

-- page up/down then center
map.set("n", "<C-d>", "<C-d>zz")
map.set("n", "<C-u>", "<C-u>zz")

-- find and center
map.set("n", "n", "nzzzv")
map.set("n", "N", "Nzzzv")

-- window management
map.set("n", "<leader>xs", "<cmd>close<cr>")
map.set("n", "<leader>|", "<cmd>vsplit<cr>")
map.set("n", "<leader>-", "<cmd>split<cr>")

-- stay in visual mode while indenting
map.set("v", "<", "<gv")
map.set("v", ">", ">gv")

-- up/down in visual mode
map.set("v", "J", ":m '>+1<CR>gv=gv")
map.set("v", "K", ":m '<-2<CR>gv=gv")
