local plugin_dir = vim.fn.stdpath("config") .. "/lua/plugins"
local handle = vim.uv.fs_scandir(plugin_dir)
local files = {}

if handle then
    repeat
        local name, type = vim.uv.fs_scandir_next(handle)
        if name and type == "file" and name:match("%.lua$") then
            table.insert(files, name)
        end
    until not name
end


-- DIY setup to require stuff in order
table.sort(files)
for _, name in ipairs(files) do
    require("plugins." .. name:gsub("%.lua$", ""))
end

require('config')
require('keymaps')
