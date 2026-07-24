-- ~/.config/nvim/lua/config/lsp.lua
-- LSP configuration (pure Neovim 0.11+ native API)
--
-- Auto-loads per-server configs from lua/lsp/<server>.lua.
-- Mason handles installing LSP servers; mason-lspconfig provides
-- ensure_installed convenience.

-- Diagnostic display configuration
vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
    float = {
        border = "rounded",
        source = "if_many",
        header = "",
        prefix = "",
    },
})

-- LSP servers to install (names match mason-lspconfig registry)
local servers = {
    "gopls",
    "clangd",
    "rust_analyzer",
    "ts_ls",
    "html",
    "cssls",
    "jsonls",
    "pyright",
    "lua_ls",
    "bashls",
    "yamlls",
    "kotlin_lsp",
}

-- Mason: install LSP servers on first run
require("mason-lspconfig").setup({
    ensure_installed = servers,
})

-- Auto-load per-server configs from lua/lsp/<server>.lua
-- Each file must return a config table (or empty for defaults).
local lsp_dir = vim.fn.stdpath("config") .. "/lua/lsp"
for name, ftype in vim.fs.dir(lsp_dir) do
    if ftype == "file" and name:match("%.lua$") then
        local server_name = name:gsub("%.lua$", "")
        local ok, config = pcall(require, "lsp." .. server_name)
        if ok and type(config) == "table" then vim.lsp.config(server_name, config) end
    end
end

-- Load each server's runtime definition and enable it.
for _, server in ipairs(servers) do
    vim.lsp.enable(server)
end
