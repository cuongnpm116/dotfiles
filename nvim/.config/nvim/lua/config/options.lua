vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.o.swapfile = false
vim.o.winborder = 'rounded'

vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.signcolumn = 'yes'
vim.o.wrap = false
vim.o.ignorecase = true
vim.o.smartindent = true

vim.o.termguicolors = true
vim.o.undofile = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.laststatus = 3

vim.o.scrolloff = 4
vim.o.mouse = ''

vim.diagnostic.config({
  update_in_insert = false,
  severity_sort = true,
  float = { border = 'rounded', source = 'if_many', focus = false },
  virtual_text = true,
  jump = {
    on_jump = function(diagnostic, bufnr)
      if diagnostic then
        vim.diagnostic.open_float(bufnr)
      end
    end,
  },
})
