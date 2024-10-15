local ignoreDirectory = ".*\\.swp$,\\~$,\\.DS_Store,^node_modules/,^\\.git/,^obj/,^bin/,^.vs/,^.github/"
vim.g.netrw_list_hide = ignoreDirectory

vim.g.have_nerd_font = true

vim.o.showmode = false

vim.o.number = true
vim.o.relativenumber = true

vim.o.breakindent = true
vim.o.autoindent = true

vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.signcolumn = "yes"

vim.o.updatetime = 250
vim.o.timeoutlen = 1000

vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.expandtab = true

vim.o.scrolloff = 8

vim.o.termguicolors = true

vim.o.updatetime = 50

vim.o.colorcolumn = "80"

vim.o.wrap = false

vim.g.mapleader = " "
vim.g.maplocalleader = " "
