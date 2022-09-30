-- space as leader key
vim.g.mapleader = " "
vim.g.localleader = "\\"

require('vars')
require('opts')      
require('keys')      
require('plug')      

-- add installed plugins here for checking
require('nvim-tree').setup{}
require('lualine').setup {
    options = {
        theme = 'dracula-nvim'
    }
}
require('nvim-autopairs').setup{}
