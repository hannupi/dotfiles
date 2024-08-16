local Util = require("lazyvim.util")
return {
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
}
