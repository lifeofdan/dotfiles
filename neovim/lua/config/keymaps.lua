-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

local map = vim.keymap.set

map("n", "<C-j>", "<C-w>j", { silent = true, desc = "Move to the pane below" })
map("n", "<C-k>", "<C-w>k", { silent = true, desc = "Move to the pane above" })
