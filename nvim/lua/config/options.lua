local glb = vim.g

local ignoreDir =
  '.*\\.swp$,\\~$,\\.DS_Store,^node_modules/,^\\.git/,^obj/,^bin/,^.vs/,^.github/'

glb.netrw_list_hide = ignoreDir
glb.netrw_banner = 0

glb.have_nerd_font = true

glb.mapleader = ' '
glb.maplocalleader = ' '

local opt = vim.o

-- line number
opt.number = true
opt.relativenumber = true

-- show mode (insert, visual, etc.)
opt.showmode = true

-- save undo history
opt.undofile = true

opt.cursorline = false

-- indent
opt.breakindent = true
opt.autoindent = true

-- tab
opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4
opt.expandtab = true

-- search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false
opt.incsearch = true

-- show diagnostic signs, git status, etc. left side of line number
opt.signcolumn = 'yes'

opt.updatetime = 50
opt.timeoutlen = 1000

opt.termguicolors = true

opt.wrap = false
