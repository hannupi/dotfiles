vim.g.mapleader = " "   -- space as leader key
vim.g.localleader = " "

-- basic conf files
require('vars')
require('opts')      
require('keys')      
require('plug')      

-- plugins, configs live in their own files that are called here
require 'pluginconfigs.nvim-tree'
require 'pluginconfigs.barbar'
require 'pluginconfigs.lualine'
require 'pluginconfigs.toggleterm'
require 'pluginconfigs.nvim-autopairs'
require 'pluginconfigs.colorscheme' 


-- languages
require 'pluginconfigs.cmp'
require 'pluginconfigs.lsp'
require 'pluginconfigs.mason'

