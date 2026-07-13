-- ~/.config/nvim/lua/plugins/mini-indentscope.lua
-- Indent scope visualization (mini.indentscope, via vim.pack)

vim.pack.add({
  { src = "https://github.com/nvim-mini/mini.indentscope" },
})

require("mini.indentscope").setup()
