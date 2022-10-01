local opts = { noremap = true, silent = true }
-- keybinds
map('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', opts)
map('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', opts)
map('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', opts)
map('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', opts)
map('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', opts)
map('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', opts)

map('n', '<S-Q>', '<Cmd>BufferClose<CR>', opts)

-- settings

require('bufferline').setup {
    animation = true,
    auto_hide = false,
    clickable = true, -- left click goes to buffer, middle click to delete
    icons = true,
}
