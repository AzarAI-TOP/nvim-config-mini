-- ~/.config/nvim/lua/plugins/mini-move.lua
-- Move lines/selections (mini.move, via vim.pack)

vim.pack.add({
  { src = "https://github.com/nvim-mini/mini.move" },
})

require("mini.move").setup()
