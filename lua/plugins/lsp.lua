-- ~/.config/nvim/lua/plugins/lsp.lua
-- LSP support (mason + lspconfig, via vim.pack)

vim.pack.add({
  { src = "https://github.com/williamboman/mason.nvim" },
  { src = "https://github.com/williamboman/mason-lspconfig.nvim" },
  { src = "https://github.com/neovim/nvim-lspconfig" },
})

require("mason").setup()

require("config.lsp")
