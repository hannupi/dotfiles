return {
	{
		"hannupi/c1-theme.vim",
		config = function()
			vim.cmd.colorscheme("c1-theme")
		end,
	},
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = function() end,
		},
	},
}
