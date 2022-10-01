local status, packer = pcall(require, 'packer')
if (not status) then
    print("Missing Packer!")
    return
end

return packer.startup(function(use)
    -- must-have stuff
    use { 'wbthomason/packer.nvim' }
    use { 'kyazdani42/nvim-tree.lua', requires = 'kyazdani42/nvim-web-devicons'}
    use { 'windwp/nvim-autopairs' }
    use {
        'nvim-telescope/telescope.nvim',
        requires = {{ 'nvim-lua/plenary.nvim' }}
    }
    use { 'Yggdroot/indentLine' }
    use { 'akinsho/toggleterm.nvim' }
    use { 'romgrk/barbar.nvim', requires = 'kyazdani42/nvim-web-devicons'}

    -- language stuff 
    use { 'neovim/nvim-lspconfig' }
    use { 'MunifTanjim/prettier.nvim' }

    -- git
    use { 'tpope/vim-fugitive' }
    use { 'junegunn/gv.vim' }


    -- UI stuff
    use { 'mhinz/vim-startify' }
    use { 
        'nvim-lualine/lualine.nvim', 
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    use { 'DanilaMihailov/beacon.nvim' }
    use { 'navarasu/onedark.nvim' }

end)

