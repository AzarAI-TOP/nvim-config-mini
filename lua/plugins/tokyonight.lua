-- ~/.config/nvim/lua/plugins/tokyonight.lua
-- Colorscheme (tokyonight, via vim.pack)

vim.pack.add({
  { src = "https://github.com/folke/tokyonight.nvim" },
})

require("tokyonight").setup({
  style = "moon",
})

vim.cmd.colorscheme("tokyonight-moon")
