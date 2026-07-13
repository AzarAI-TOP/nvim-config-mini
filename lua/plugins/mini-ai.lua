-- ~/.config/nvim/lua/plugins/mini-ai.lua
-- Textobjects (mini.ai, via vim.pack)

vim.pack.add({
  { src = "https://github.com/nvim-mini/mini.ai" },
})

require("mini.ai").setup()
