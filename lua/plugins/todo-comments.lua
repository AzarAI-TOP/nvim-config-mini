-- ~/.config/nvim/lua/plugins/todo-comments.lua
-- TODO/FIX/HACK comment highlighting & search (via vim.pack)
--
-- Integrates with fzf-lua via :TodoFzfLua.

vim.pack.add({
    { src = "https://github.com/folke/todo-comments.nvim" },
})

require("todo-comments").setup()
