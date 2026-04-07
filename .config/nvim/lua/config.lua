-- ~/.config/nvim-new/lua/configs.lua
local opt = vim.opt
opt.signcolumn = "yes:1" -- Always show sign column
opt.termguicolors = true -- Enable true colors
opt.ignorecase = true -- Ignore case in search
opt.swapfile = false -- Disable swap files
opt.autoindent = true -- Enable auto indentation
opt.expandtab = true -- Use spaces instead of tabs
opt.tabstop = 4 -- Number of spaces for a tab
opt.softtabstop = 4 -- Number of spaces for a tab when editing
opt.shiftwidth = 4 -- Number of spaces for autoindent
opt.shiftround = true -- Round indent to multiple of shiftwidth
opt.list = true -- Show whitespace characters
opt.number = true -- Show line numbers
opt.relativenumber = true -- Show relative line numbers
opt.wrap = false -- Disable line wrapping
opt.scrolloff = 8 -- Keep 8 lines above and below the cursor
opt.undodir = os.getenv('HOME') .. '/.vim/undodir' -- Directory for undo files
opt.undofile = true -- Enable persistent undo
opt.winborder = "rounded" -- Use rounded borders for windows
opt.hlsearch = false -- Disable highlighting of search results

--opt.listchars = "tab: ,multispace:|   ,eol:󰌑" -- Characters to show for tabs, spaces, and end of line
--opt.numberwidth = 1 -- Width of the line number column
--opt.cursorline = true -- Highlight the current line
--opt.inccommand = "nosplit" -- Shows the effects of a command incrementally in the buffer
--opt.guicursor = "i:block" -- Use block cursor in insert mode
--opt.completeopt = { "menuone", "popup", "noinsert" } -- Options for completion menu
--opt.colorcolumn = "80" -- Highlight column 80

opt.autocomplete = true
--opt.autocompletedelay = 100
--opt.complete = "o,.,w,b,u"
opt.completeopt = { "fuzzy", "menuone", "noselect", "popup" }

vim.diagnostic.config({
  virtual_text = true,
  signs = false,
  underline = true,
})

vim.schedule(function() vim.o.clipboard = 'unnamedplus' end)
--vim.cmd.filetype("plugin indent on") -- Enable filetype detection, plugins, and indentation

--vim.filetype.add({
--	filename = {
--		["docker-compose.yml"] = "yaml.docker-compose",
--		["docker-compose.yaml"] = "yaml.docker-compose",
--		["compose.yml"] = "yaml.docker-compose",
--		["compose.yaml"] = "yaml.docker-compose",
--	},
--})
