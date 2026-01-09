local map = vim.keymap

-- delete single char without yanking into register
map.set('n', 'x', '"_x')

-- keep last yanked when pasting
map.set('v', 'p', '"_dP')

-- page up/down then center
map.set('n', '<C-d>', '<C-d>zz')
map.set('n', '<C-u>', '<C-u>zz')

-- find and center
map.set('n', 'n', 'nzzzv')
map.set('n', 'N', 'Nzzzv')

-- stay in visual mode while indenting

map.set('v', '<', '<gv')
map.set('v', '>', '>gv')

-- up/down in visual mode
map.set('v', 'J', ":m '>+1<CR>gv=gv")
map.set('v', 'K', ":m '<-2<CR>gv=gv")

-- delete next line without moving cursor
map.set('n', 'J', 'mzJ`z')

map.set('n', '<Esc>', '<cmd>nohlsearch<cr>')

map.set('n', '<leader>x', '<cmd>close<cr>')

map.set('n', '<leader>|', '<cmd>vsplit<cr>')

map.set('n', '<leader>-', '<cmd>split<cr>')

map.set({ 'n', 'v', 'x' }, '<leader>y', '"+y')
map.set({ 'n', 'v', 'x' }, '<leader>p', '"+p')
