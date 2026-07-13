-- ~/.config/nvim/lua/plugins/init.lua
-- Plugin auto-loader
-- Requires every .lua file under lua/plugins/ except itself.
-- Each plugin file is self-contained: vim.pack.add + setup.
-- Adding or removing a plugin = adding or removing one file.

local dir = vim.fn.stdpath("config") .. "/lua/plugins"

for name, type in vim.fs.dir(dir) do
    if type == "file" and name:match("%.lua$") and name ~= "init.lua" then
        require("plugins." .. name:gsub("%.lua$", ""))
    end
end
