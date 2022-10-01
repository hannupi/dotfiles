require('nvim-tree').setup{
    -- uncomment to have floating instead of buffer on left
    --[[view = {
        float = {
            enable = true,
            open_win_config = {
                relative = "editor",
                border = "rounded",
                width = 30,
                height = 30,
                row = 1,
                col = 1,
            },
        }
    },]]--
    actions = {
	    open_file = {
            quit_on_open = true
    	},
    }
}
