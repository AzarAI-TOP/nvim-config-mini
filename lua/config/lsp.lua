-- ~/.config/nvim/lua/config/lsp.lua
-- LSP configuration (pure Neovim 0.11+ native API)
--
-- Uses vim.lsp.config + vim.lsp.enable instead of nvim-lspconfig.
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

-- Per-server native config (only non-default ones)
local function get_config(server)
    if server == "lua_ls" then
        return {
            settings = {
                Lua = {
                    runtime = { version = "LuaJIT" },
                    diagnostics = { globals = { "vim" } },
                    workspace = {
                        library = {
                            vim.fn.stdpath("data") .. "/site",
                            vim.env.VIMRUNTIME .. "/lua",
                        },
                        checkThirdParty = false,
                    },
                    telemetry = { enable = false },
                },
            },
        }
    end
    if server == "pyright" then
        return {
            settings = {
                python = {
                    analysis = {
                        autoSearchPaths = true,
                        useLibraryCodeForTypes = true,
                        diagnosticMode = "workspace",
                    },
                },
            },
        }
    end
    return {}
end

-- Register config + enable each server natively
for _, server in ipairs(servers) do
    vim.lsp.config[server] = get_config(server)
    vim.lsp.enable(server)
end
