-- ~/.config/nvim/lua/config/keymaps.lua
-- Neovim 键位映射
--
-- 按 <leader> 前缀分类:
--   <leader>b  缓冲区 (buffer)
--   <leader>c  配置   (config)
--   <leader>l  语言   (language: lsp / 格式化)
--   <leader>f  查找   (find / file)
--   <leader>w  窗口   (window，转发到 <C-w>)
--   <leader>t  开关   (toggle)
-- 高频的文件/会话操作保留为顶层无前缀键 (<C-s> 保存等)。

local utils = require("config.utils")

-- 小工具: 简化 vim.keymap.set 调用
local function map(mode, lhs, rhs, desc, opts)
    opts = vim.tbl_extend("force", { desc = desc }, opts or {})
    vim.keymap.set(mode, lhs, rhs, opts)
end

-- =============================================
-- 顶层: 文件 / 会话 (高频，无前缀)
-- =============================================
map({ "n", "i" }, "<C-s>", "<Esc>:write<CR>", "保存文件")
map("n", "<leader>q", ":quit<CR>", "退出")
map("n", "<leader>Q", ":qa<CR>", "退出全部")
map("n", "<leader>W", ":write !sudo tee % > /dev/null<CR>", "提权保存")
map("n", "<leader>nh", ":nohlsearch<CR>", "清除搜索高亮")

-- =============================================
-- <leader>b — 缓冲区 (buffer)
-- =============================================
map("n", "<leader>bd", ":bdelete<CR>", "删除当前缓冲区")
map("n", "<leader>bn", ":bnext<CR>", "下一个缓冲区")
map("n", "<leader>bp", ":bprevious<CR>", "上一个缓冲区")

-- =============================================
-- <leader>c — 配置 (config)
-- =============================================
map("n", "<leader>ce", ":vsplit $MYVIMRC<CR>", "编辑配置")
map("n", "<leader>cr", ":source $MYVIMRC<CR>", "重载配置")

-- =============================================
-- <leader>l — 语言 (language: lsp / 格式化)
-- =============================================
map("n", "<leader>lf", function()
    require("conform").format({ lsp_format = "fallback", timeout_ms = 1000 })
end, "格式化当前文件")

-- =============================================
-- <leader>f — 查找 / 文件 (find / file)
-- =============================================
map("n", "<leader>fe", ":Ex<CR>", "文件浏览器")

-- =============================================
-- <leader>w — 窗口 (window，转发到 <C-w> 子菜单)
-- =============================================
-- <leader>w 后接原生 <C-w> 操作: ws 分屏 / wv 竖分 / wc 关闭 / wo 仅留当前 /
-- wh wj wk wl 切换 / w= 平衡 等。
map("n", "<leader>w", "<C-w>", "窗口", { remap = true })

-- 直达键 (与上面的子菜单互补)
map("n", "<M-h>", "<C-w>h", "左窗口")
map("n", "<M-j>", "<C-w>j", "下窗口")
map("n", "<M-k>", "<C-w>k", "上窗口")
map("n", "<M-l>", "<C-w>l", "右窗口")
map("n", "<C-Up>", ":resize -2<CR>", "缩小高度")
map("n", "<C-Down>", ":resize +2<CR>", "增大高度")
map("n", "<C-Left>", ":vertical resize -2<CR>", "缩小宽度")
map("n", "<C-Right>", ":vertical resize +2<CR>", "增大宽度")

-- =============================================
-- <leader>t — 开关 (toggle)
-- =============================================
map("n", "<leader>tp", ":set paste!<CR>", "切换粘贴模式")
map("n", "<leader>tw", ":set wrap!<CR>", "切换自动换行")

-- =============================================
-- 其它 (无前缀直达键)
-- =============================================
-- 缓冲区快速切换
map("n", "]b", ":bnext<CR>", "下一个缓冲区")
map("n", "[b", ":bprevious<CR>", "上一个缓冲区")

-- 搜索
map("n", "*", "*<C-o>", "搜索当前词不跳转")
map("n", "<Esc><Esc>", ":nohlsearch<CR>", "双击 Esc 取消高亮")

-- 页面滚动居中
map("n", "<C-d>", "<C-d>zz", "向下半页居中")
map("n", "<C-u>", "<C-u>zz", "向上半页居中")
map("n", "n", "nzzzv", "下一个结果居中")
map("n", "N", "Nzzzv", "上一个结果居中")

-- 注释切换
map({ "n", "v" }, "<C-/>", utils.toggle_comment, "切换注释")
