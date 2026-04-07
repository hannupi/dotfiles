vim.pack.add({
    { src = "https://github.com/nvim-treesitter/nvim-treesitter", branch = "main" }
})

local ts = require('nvim-treesitter')

ts.install {
    "vimdoc", "javascript", "typescript", "c",
    "lua", "rust", "jsdoc", "bash", "go"
}

local ignore_ft = {
    "fzf",
    "fzf-lua",
    "TelescopePrompt",
    "gitcommit",
}

vim.api.nvim_create_autocmd({ 'FileType', 'BufEnter' }, {
    callback = function(args)
        local ft = vim.bo[args.buf].filetype

        for _, name in ipairs(ignore_ft) do
            if ft == name then return end
        end

        local lang = vim.treesitter.language.get_lang(ft)
        if lang then
            pcall(vim.treesitter.start, args.buf)
        end
    end,
})

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldenable = false
