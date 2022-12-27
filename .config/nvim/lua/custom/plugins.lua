return function(use)
	use 'mhinz/vim-startify' -- front page 

	--[[
	use { 'kyazdani42/nvim-tree.lua', requires = 'kyazdani42/nvim-web-devicons', config = function()
		require('nvim-tree').setup {
			actions = {
				open_file = {
					quit_on_open = true
				}
			}
		}
	end}
	]]--
end
