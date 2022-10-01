vim.g.mapleader = " "   -- space as leader key
vim.g.localleader = "\\"

require('vars')
require('opts')      
require('keys')      
require('plug')      

-- plugins, configs live in their own files 
require 'pluginconfigs.nvim-tree'
require 'pluginconfigs.barbar'
require 'pluginconfigs.lualine'
require 'pluginconfigs.toggleterm'
require 'pluginconfigs.nvim-autopairs'
require 'pluginconfigs.colorscheme' 

