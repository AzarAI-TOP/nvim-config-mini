-- ~/.config/nvim/lua/option.lua
-- Neovim 基础选项

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- 显示
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.signcolumn = "yes"

-- 缩进
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.autoindent = true

-- 搜索
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- 编辑
vim.opt.wrap = false
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"
vim.opt.undofile = true
vim.opt.undodir = os.getenv("HOME") .. "/.local/share/nvim/undo"
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false

-- 界面
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.showmode = false
vim.opt.showcmd = true
vim.opt.ruler = true
vim.opt.title = true

-- 性能
vim.opt.timeoutlen = 300
vim.opt.updatetime = 100
vim.opt.redrawtime = 1500

-- 补全
vim.opt.wildmenu = true
vim.opt.wildmode = "list:longest,full"
vim.opt.wildignore = { "*.o", "*.pyc", "*.class", "node_modules/*" }

-- 历史
vim.opt.history = 1000
vim.opt.undolevels = 1000

-- 窗口
vim.opt.splitright = true
vim.opt.splitbelow = true

-- 编码
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
