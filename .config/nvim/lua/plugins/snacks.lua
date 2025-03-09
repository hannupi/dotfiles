return {
	"folke/snacks.nvim",
	opts = {
		explorer = {
			enabled = false,
			replace_netrw = true,
			jump = { close = true },
		},
		picker = {
			enabled = true,
		},
		dashboard = {
			formats = {
				key = function(item)
					return {
						{ "[", hl = "special" },
						{ item.key, hl = "key" },
						{ "]", hl = "special" },
					}
				end,
			},
			sections = {
				{ section = "recent_files", limit = 10 },
				{
					padding = 0.5,
				},
				{
					section = "recent_files",
					cwd = true,
					limit = 8,
					padding = 1,
				},
				{ section = "projects", padding = 1 },
				{ section = "keys" },
			},
		},

		notifier = { enabled = false },
		scroll = { enabled = false },
	},
}
