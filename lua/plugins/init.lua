-- ~/.config/nvim/lua/plugins/init.lua
-- 插件自动加载器
-- 加载本目录 (lua/plugins/) 下的所有 .lua 文件 (init.lua 自身除外)。
-- 每个插件文件自包含: 自带 vim.pack.add 与对应的 setup。
-- 因此新增/删除一个插件只需增删一个文件，无需在别处登记。

local dir = vim.fn.stdpath("config") .. "/lua/plugins"

for name, type in vim.fs.dir(dir) do
    if type == "file" and name:match("%.lua$") and name ~= "init.lua" then
        require("plugins." .. name:gsub("%.lua$", ""))
    end
end
