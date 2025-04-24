local map = vim.keymap

-- delete single char without yanking into register
map.set("n", "x", "'_x'")

-- keep last yanked when pasting
map.set("v", "p", "'_dP'")

-- page up/down then center
map.set("n", "<C-d>", "<C-d>zz")
map.set("n", "<C-u>", "<C-u>zz")
