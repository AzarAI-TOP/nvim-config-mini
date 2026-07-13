-- ~/.config/nvim/lua/plugins/mini-core.lua
-- Core mini.* plugins (via vim.pack)
--
-- Merged from individual files for conciseness.
-- Each sub-module uses defaults unless noted otherwise.

local mini_plugins = {
    -- Textobjects — extends built-in text objects (i), (a)
    "ai",
    -- Comment toggling — gc (toggle), gcc (current line)
    "comment",
    -- Icon provider — file/directory/LSP icons for mini.files and others
    "icons",
    -- Indent scope visualization
    "indentscope",
    -- Move lines/selections — Alt+↑/↓
    "move",
    -- Trailspace highlight & trim
    "trailspace",
}

for _, name in ipairs(mini_plugins) do
    vim.pack.add({
        { src = "https://github.com/nvim-mini/mini." .. name },
    })
    require("mini." .. name).setup()
end

-- :TrimTrailSpace — remove trailing whitespace and trailing blank lines
vim.api.nvim_create_user_command("TrimTrailSpace", function()
    local view = vim.fn.winsaveview()
    require("mini.trailspace").trim()
    require("mini.trailspace").trim_last_lines()
    vim.fn.winrestview(view)
end, { desc = "Remove trailing whitespace and trailing blank lines in current buffer" })
