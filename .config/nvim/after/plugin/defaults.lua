vim.opt.relativenumber = true
vim.opt.swapfile = false
--vim.opt.backup = false

vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

vim.keymap.set('n', '<leader><Tab>', [[:Ex <cr>]], { silent = true }) -- file explorer
vim.keymap.set('n', '<leader>h', [[:Telescope keymaps <cr>]], { silent= true }) -- show keybinds

