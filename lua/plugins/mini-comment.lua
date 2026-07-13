-- ~/.config/nvim/lua/plugins/mini-comment.lua
-- Comment toggling (mini.comment, via vim.pack)
--
-- Replaces the custom toggle_comment in utils.lua.
-- Uses default mappings: gc (toggle), gcc (current line).

vim.pack.add({
    { src = "https://github.com/nvim-mini/mini.comment" },
})

require("mini.comment").setup()
