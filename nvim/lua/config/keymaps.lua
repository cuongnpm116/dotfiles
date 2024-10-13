vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.keymap.set('n', '<leader>qq', '<cmd>qa<cr>', { desc = 'quit all' })

-- disable the spacebar key's default behavior
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

local opts = { noremap = true, silent = true }

vim.keymap.set('n', '<leader>pv', '<cmd>Ex<cr>', opts)

-- delete single character without yanking into register
vim.keymap.set('n', 'x', '"_x', opts)

-- page up/page down then center
vim.keymap.set('n', '<C-d>', '<C-d>zz', opts)
vim.keymap.set('n', '<C-u>', '<C-u>zz', opts)

-- clear highlights on search
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- find and center
vim.keymap.set('n', 'n', 'nzzzv', opts)
vim.keymap.set('n', 'N', 'Nzzzv', opts)

-- window management
vim.keymap.set('n', '<leader>v', '<C-w>v', opts) -- split vertical
vim.keymap.set('n', '<leader>h', '<C-w>s', opts) -- split horizontal
vim.keymap.set('n', '<leader>xs', ':close<CR>', opts) -- close split window

-- navigation between windows
vim.keymap.set('n', '<C-k>', ':wincmd k<CR>', opts)
vim.keymap.set('n', '<C-j>', ':wincmd j<CR>', opts)
vim.keymap.set('n', '<C-h>', ':wincmd h<CR>', opts)
vim.keymap.set('n', '<C-l>', ':wincmd l<CR>', opts)

-- stay in visual mode while indenting
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)

-- keep last yanked when pasting
vim.keymap.set('v', 'p', '"_dP', opts)

-- diagnostic
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)

vim.keymap.set('n', '<leader>bd', '<cmd>bd<CR>')
