vim.pack.add {
    { src = "https://github.com/neovim/nvim-lspconfig" }, -- skip defining defaults for language servers
}

vim.lsp.enable({
    "lua_ls",
    "gopls",
    "pyright",
})

vim.lsp.config.lua_ls = {
    cmd = { "lua-language-server" },
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" }, -- mute "vim" warnings
            },
        },
    },
}
