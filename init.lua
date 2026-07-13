-- ~/.config/nvim/init.lua
-- Minimal Neovim configuration

-- Core editor modules
require("config.options")
require("config.keymaps")
require("config.autocmds")

-- Plugins (auto-loaded from lua/plugins/)
require("plugins")

-- Ensure RPC socket is at a writable path, avoiding SELinux permission errors
vim.api.nvim_create_autocmd("VimEnter", {
  once = true,
  callback = function()
    pcall(vim.fn.serverstart, vim.fn.stdpath("data") .. "/nvim.sock")
  end,
})
