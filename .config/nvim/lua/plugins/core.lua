local Util = require("lazyvim.util")
return {
	{
		"h4np/c1-theme.vim",
		config = function()
			vim.cmd.colorscheme("c1-theme")
		end,
	},

	{
		"nvim-neo-tree/neo-tree.nvim",
		cmd = "Neotree",
		keys = {
			{
				"<leader>fe",
				function()
					require("neo-tree.command").execute({
						position = "float",
						toggle = true,
						dir = Util.root(),
					})
				end,
				desc = "Explorer NeoTree (root dir)",
			},
			{
				"<leader><tab>",
				"<leader>fe",
				desc = "Explorer NeoTree (root dir)",
				remap = true,
			},
		},
	},
}
