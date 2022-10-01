require('onedark').setup {
    style = 'deep',
    --transparent = true,
    term_colors = true,
    ending_tildes = false,

    lualine = {
        transparent = true,
    },

    -- custom
    --colors = {}, -- override
    --highlights = {}, --override
}

require('onedark').load()
