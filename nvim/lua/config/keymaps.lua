local map = vim.keymap

-- disable Space's default behavior
map.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- quit all
map.set('n', '<leader>qq', '<cmd>qa<cr>')
map.set('n', '<leader>wa', '<cmd>wa<cr>')

map.set('n', '<leader>lz', '<cmd>Lazy<cr>')
map.set('n', '<leader>ms', '<cmd>Mason<cr>')

-- open file explorer (netrw)
map.set('n', '<leader>pv', '<cmd>Ex<cr>', { silent = true })

-- delete single char without yanking into register
map.set('n', 'x', '"_x')

-- keep last yanked when pasting
map.set('v', 'p', '"_dP')

-- clear highlights on search
map.set('n', '<Esc>', '<cmd>nohlsearch<cr>')

-- page up/down then center
map.set('n', '<C-d>', '<C-d>zz')
map.set('n', '<C-u>', '<C-u>zz')

-- find and center
map.set('n', 'n', 'nzzzv')
map.set('n', 'N', 'Nzzzv')

-- window management
map.set('n', '<leader>xs', '<cmd>close<cr>')
map.set('n', '<leader>vs', '<cmd>vsplit<cr>')
map.set('n', '<leader>hs', '<cmd>split<cr>')

-- stay in visual mode while indenting
map.set('v', '<', '<gv')
map.set('v', '>', '>gv')

-- up/down in visual mode
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-- diagnostic
map.set('n', '[d', vim.diagnostic.goto_prev)
map.set('n', ']d', vim.diagnostic.goto_next)
map.set('n', '<leader>qf', vim.diagnostic.setloclist) -- quick fix list

-- close buffer
map.set('n', '<leader>bd', '<cmd>bd<cr>')
