map = vim.api.nvim_set_keymap

map('n', '<leader><Tab>', [[:NvimTreeToggle<CR>]], {})
map('n', '<leader>f', [[:Telescope find_files<CR>]], {})


-- save file vscode keybind ctrl + s
--map('n', '<C-S>', [[:lua vim.lsp.buf.formatting()<CR>]], {})
map('n', '<C-S>', [[:update<cr>]], {})
map('n', '<S-S>', [[:x<cr>]], {})





