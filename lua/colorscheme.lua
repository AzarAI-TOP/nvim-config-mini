-- ~/.config/nvim/lua/colorscheme.lua
-- 颜色主题 (tokyonight，通过内置 vim.pack 管理)

vim.pack.add({
  { src = "https://github.com/folke/tokyonight.nvim" },
})

require("tokyonight").setup({
  style = "moon",
})

vim.cmd.colorscheme("tokyonight-moon")
