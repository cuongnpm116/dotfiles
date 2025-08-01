local ignoreDir = ".*\\.swp$,\\~$,\\.DS_Store,^node_modules/,^\\.git/,^obj/,^bin/,^.vs/,^.github/"

vim.g.netrw_list_hide = ignoreDir
vim.g.netrw_banner = 0
vim.g.netrw_bufsettings = "noma nomod nu rnu nobl nowrap ro"
vim.g.netrw_cursor = 1

vim.g.have_nerd_font = true

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- line number
vim.o.number = true
vim.o.relativenumber = true

-- show mode (insert, visual, etc.)
vim.o.showmode = true

-- save undo history
vim.o.undofile = true

vim.o.cursorline = false

-- indent
vim.o.breakindent = true
vim.o.autoindent = true

-- tab
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.expandtab = true

-- search
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = false
vim.o.incsearch = true

-- show diagnostic signs, git status, etc. left side of line number
vim.o.signcolumn = "yes"

vim.o.updatetime = 50
vim.o.timeoutlen = 1000

vim.o.termguicolors = true

vim.o.wrap = false
