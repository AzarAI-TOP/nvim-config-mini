-- ~/.config/nvim/lua/plugins/mini-icons.lua
-- Icon provider (mini.icons, via vim.pack)
--
-- Provides file/directory/LSP icons for mini.files and other plugins.

vim.pack.add({
  { src = "https://github.com/nvim-mini/mini.icons" },
})

require("mini.icons").setup()
