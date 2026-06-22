-- ~/.config/nvim/lua/keymap.lua
-- Neovim 键位映射

local utils = require("utils")

-- 文件操作
vim.keymap.set("n", "<leader>w", ":write<CR>", { desc = "保存文件" })
vim.keymap.set("n", "<leader>q", ":quit<CR>", { desc = "退出" })
vim.keymap.set("n", "<leader>wq", ":write<CR>:quit<CR>", { desc = "保存并退出" })
vim.keymap.set("n", "<leader>W", ":write !sudo tee % > /dev/null<CR>", { desc = "提权保存" })
vim.keymap.set("n", "<leader>e", ":Ex<CR>", { desc = "文件浏览器" })
vim.keymap.set("n", "<leader>pv", ":Ex<CR>", { desc = "文件浏览器" })
vim.keymap.set("n", "<leader>wa", ":wall<CR>", { desc = "保存所有文件" })

-- 窗口导航
vim.keymap.set("n", "<M-h>", "<C-w>h", { desc = "左窗口" })
vim.keymap.set("n", "<M-j>", "<C-w>j", { desc = "下窗口" })
vim.keymap.set("n", "<M-k>", "<C-w>k", { desc = "上窗口" })
vim.keymap.set("n", "<M-l>", "<C-w>l", { desc = "右窗口" })

-- 窗口大小
vim.keymap.set("n", "<C-Up>", ":resize -2<CR>", { desc = "缩小高度" })
vim.keymap.set("n", "<C-Down>", ":resize +2<CR>", { desc = "增大高度" })
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "缩小宽度" })
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "增大宽度" })

-- 搜索
vim.keymap.set("n", "<leader>nh", ":nohlsearch<CR>", { desc = "清除搜索高亮" })
vim.keymap.set("n", "*", "*<C-o>", { desc = "搜索当前词不跳转" })

-- 缓冲区
vim.keymap.set("n", "]b", ":bnext<CR>", { desc = "下一个缓冲区" })
vim.keymap.set("n", "[b", ":bprevious<CR>", { desc = "上一个缓冲区" })
vim.keymap.set("n", "<leader>bd", ":bdelete<CR>", { desc = "删除当前缓冲区" })

-- 格式化
vim.keymap.set("n", "<leader>f", function()
    require("conform").format({ lsp_format = "fallback", timeout_ms = 1000 })
end, { desc = "格式化当前文件" })

-- 配置重载
vim.keymap.set("n", "<leader>sv", ":source $MYVIMRC<CR>", { desc = "重载配置" })
vim.keymap.set("n", "<leader>ev", ":vsplit $MYVIMRC<CR>", { desc = "编辑配置" })

-- 粘贴模式
vim.keymap.set("n", "<leader>p", ":set paste!<CR>", { desc = "切换粘贴模式" })

-- 页面滚动居中
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "向下半页居中" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "向上半页居中" })
vim.keymap.set("n", "n", "nzzzv", { desc = "下一个结果居中" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "上一个结果居中" })

-- 取消高亮
vim.keymap.set("n", "<Esc><Esc>", ":nohlsearch<CR>", { desc = "双击 Esc 取消高亮" })

-- 注释切换
vim.keymap.set({ "n", "v" }, "<C-/>", utils.toggle_comment, { desc = "切换注释" })
