return {
	{
		"hannupi/oldworld.nvim",
		config = function()
			require("oldworld").setup({
				variant = "oled",
				terminal_colors = true,
			})
			vim.cmd.colorscheme("oldworld")
		end,
	},
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = function() end,
		},
	},
}
