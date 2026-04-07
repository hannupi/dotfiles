vim.g.mapleader = " "

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<leader><Tab>", [[:Ex <cr>]], { silent = true, desc = "open netrw file explorer" })
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
    { desc = "rename word under cursor" })

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = "clear search" })

-- fzf
vim.keymap.set("n", "<leader><space>", "<cmd>FzfLua files<CR>", { desc = "Find Files (Project Root)" })
vim.keymap.set("n", "<leader>/", "<cmd>FzfLua live_grep<CR>", { desc = "Live Grep (Project Root)" })
vim.keymap.set("n", "<leader>F", "<cmd>FzfLua files cwd=$PWD<CR>", { desc = "Find Files (CWD)" })
vim.keymap.set("n", "<leader>f", "<cmd>FzfLua live_grep cwd=$PWD<CR>", { desc = "Live Grep (CWD)" })

-- lsp
vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
        local bufnr = args.buf
        local client = vim.lsp.get_client_by_id(args.data.client_id)

        local buf_map = function(mode, lhs, rhs, desc)
            vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
        end

        buf_map("n", "gd", vim.lsp.buf.definition, "Go to definition")
        buf_map("n", "<leader>cr", vim.lsp.buf.rename, "Rename variable")
        buf_map("n", "K", vim.lsp.buf.hover, "LSP Help")

        if client.server_capabilities.documentFormattingProvider then
            buf_map("n", "<leader>cf", vim.lsp.buf.format, "Format buffer")
        end
    end,
})

-- conform formatter
vim.keymap.set({ "n", "v" }, "<leader>cf", function()
    conform.format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 500,
    })
end, { desc = "Format file or range (conform)" })

vim.keymap.set("n", "<leader>uf", function()
    vim.g.disable_autoformat = not vim.g.disable_autoformat
    print("Autoformat: " .. (vim.g.disable_autoformat and "OFF" or "ON"))
end, { desc = "Toggle format on save" })

-- poor mans tab autocomplete functionality
vim.keymap.set('i', '<Tab>', function()
    return vim.fn.pumvisible() == 1 and "<C-n>" or "<Tab>"
end, { expr = true })

vim.keymap.set('i', '<S-Tab>', function()
    return vim.fn.pumvisible() == 1 and "<C-p>" or "<S-Tab>"
end, { expr = true })

vim.keymap.set('i', '<CR>', function()
    return vim.fn.pumvisible() == 1 and "<C-y>" or "<CR>"
end, { expr = true })
