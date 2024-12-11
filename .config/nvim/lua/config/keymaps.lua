-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "<leader><Tab>", [[:Ex <cr>]], { silent = true }) -- file explorer
--map("n", "<leader>h", [[:Telescope keymaps <cr>]], { silent = true }) -- show keybinds

-- remap semicolon to colon because i keep capitalizing W
map("n", ";", ":")
map("n", ",", ";")
