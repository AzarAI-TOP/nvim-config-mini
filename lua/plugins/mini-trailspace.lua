-- ~/.config/nvim/lua/plugins/mini-trailspace.lua
-- Trailspace highlight & trim (mini.trailspace, via vim.pack)

vim.pack.add({
  { src = "https://github.com/nvim-mini/mini.trailspace" },
})

require("mini.trailspace").setup()
