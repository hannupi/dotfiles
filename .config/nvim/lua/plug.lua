local status, packer = pcall(require, 'packer')
if (not status) then
    print("Missing Packer!")
    return
end

return packer.startup(function(use)
    -- must-have stuff for good dev experience 
    use { 'wbthomason/packer.nvim' } -- to download plugins
    use { 'kyazdani42/nvim-tree.lua', requires = 'kyazdani42/nvim-web-devicons'} -- file browser
    use { 'windwp/nvim-autopairs' } -- autopair brackets and quotation marks
    use { 'nvim-telescope/telescope.nvim', requires = 'nvim-lua/plenary.nvim' } -- file search
    use { 'Yggdroot/indentLine' } --show indentation level like vscode
    use { 'akinsho/toggleterm.nvim' } -- togglable terminal inside nvim
    use { 'romgrk/barbar.nvim', requires = 'kyazdani42/nvim-web-devicons'} -- file tabs

    -- language stuff 
    use { 'neovim/nvim-lspconfig' } -- lsp handler
    use { 'hrsh7th/cmp-nvim-lsp' }
    use { 'hrsh7th/cmp-buffer' }
    use { 'hrsh7th/cmp-path' }
    use { 'hrsh7th/cmp-cmdline' }
    use { 'hrsh7th/nvim-cmp' } -- autocomplete
    use { 'MunifTanjim/prettier.nvim' } -- formatter
    use { 'L3MON4D3/LuaSnip', requires = 'saadparwaiz1/cmp_luasnip' } -- code snippets
    use { 'williamboman/mason.nvim' } -- lsp server downloader
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' } -- syntax highlighting
    use { 'jose-elias-alvarez/null-ls.nvim' } -- inject diagnostics etc
    use { 'MunifTnajim/prettier.nvim' } -- code formatter

    -- git
    use { 'tpope/vim-fugitive' }
    use { 'junegunn/gv.vim' }

    -- UI stuff
    use { 'mhinz/vim-startify' } -- front page 
    use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true }}
    use { 'DanilaMihailov/beacon.nvim' } -- show effect where cursor goes
    --use { 'navarasu/onedark.nvim' } -- one dark theme
    use {'nyoom-engineering/oxocarbon.nvim'}

end)

