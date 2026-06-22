-- ~/.config/nvim/init.lua
-- 最小化 Neovim 配置

-- 核心编辑器配置
require("config.options")
require("config.keymaps")
require("config.autocmds")

-- 插件 (自动加载 lua/plugins/ 下的所有插件文件)
require("plugins")
