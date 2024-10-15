-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opts = { noremap = true, silent = true }
-- delete single character without yanking into register
vim.keymap.set("n", "x", '"_x', opts)

-- page up/page down then center
vim.keymap.set("n", "<C-d>", "<C-d>zz", opts)
vim.keymap.set("n", "<C-u>", "<C-u>zz", opts)

-- find and center
vim.keymap.set("n", "n", "nzzzv", opts)
vim.keymap.set("n", "N", "Nzzzv", opts)

-- keep last yanked when pasting
vim.keymap.set("v", "p", '"_dP', opts)

-- J but keep cursor at beginning position
vim.keymap.set("n", "J", "mzJ`z")

-- yank to system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])

-- delete but not save to clipboard
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])
