return {
	"nvim-neo-tree/neo-tree.nvim",
	cmd = "Neotree",
	keys = {
		{
			"<leader>fe",
			function()
				require("neo-tree.command").execute({
					position = "current",
					toggle = true,
					--dir = vim.util.root(),
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
