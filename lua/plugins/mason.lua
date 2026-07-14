-- ~/.config/nvim/lua/plugins/mason.lua
-- Mason: package manager for LSP servers, DAP, linters, formatters
--
-- LSP configs are in lua/lsp/<server>.lua (loaded by config.lsp).
-- nvim-lspconfig is NOT needed — using Neovim 0.11+ native API.

vim.pack.add({
    { src = "https://github.com/williamboman/mason.nvim" },
    { src = "https://github.com/williamboman/mason-lspconfig.nvim" },
})

require("mason").setup()
