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
require('oxocarbon')

-- language improvements
require 'pluginconfigs.cmp'
require 'pluginconfigs.treesitter'
require 'pluginconfigs.lsp'
require('luasnip.loaders.from_vscode').lazy_load()
require 'pluginconfigs.mason'
require 'pluginconfigs.null-ls'


