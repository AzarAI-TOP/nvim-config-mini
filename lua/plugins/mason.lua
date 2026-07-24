-- ~/.config/nvim/lua/plugins/mason.lua
-- Mason: package manager for LSP servers, DAP, linters, formatters
--
-- LSP configs are in lua/lsp/<server>.lua (loaded by config.lsp).
-- nvim-lspconfig supplies the default cmd/filetypes/root_dir definitions;
-- Neovim's native vim.lsp.config API loads and extends those definitions.

vim.pack.add({
    { src = "https://github.com/williamboman/mason.nvim" },
    { src = "https://github.com/williamboman/mason-lspconfig.nvim" },
    { src = "https://github.com/neovim/nvim-lspconfig" },
})

require("mason").setup()
