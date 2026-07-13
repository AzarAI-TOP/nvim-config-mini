-- ~/.config/nvim/lua/plugins/lsp.lua
-- LSP support (mason + mason-lspconfig, via vim.pack)
--
-- nvim-lspconfig is NOT needed — using Neovim 0.11+ native
-- vim.lsp.config / vim.lsp.enable instead.

vim.pack.add({
    { src = "https://github.com/williamboman/mason.nvim" },
    { src = "https://github.com/williamboman/mason-lspconfig.nvim" },
})

require("mason").setup()

require("config.lsp")
