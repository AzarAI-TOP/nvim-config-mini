-- ~/.config/nvim/lua/config/lsp.lua
-- LSP configuration: mason-lspconfig + per-server settings

-- Servers already on PATH (enable directly)
vim.lsp.enable("gopls")
vim.lsp.enable("clangd")

-- Servers mason should install
local to_install = {
  "rust-analyzer",
  "typescript-language-server",
  "html-lsp",
  "css-lsp",
  "json-lsp",
  "pyright",
  "lua-language-server",
  "bash-language-server",
  "yaml-language-server",
  "kotlin-lsp",
}

-- Mason-lspconfig: installs missing servers + enables installed ones
require("mason-lspconfig").setup({
  ensure_installed = to_install,
  handlers = {
    -- Default handler: enable with per-server overrides
    function(server_name)
      local config = {}
      if server_name == "lua_ls" then
        config.settings = {
          Lua = {
            runtime = { version = "LuaJIT" },
            diagnostics = { globals = { "vim" } },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
            },
            telemetry = { enable = false },
          },
        }
      end
      if server_name == "pyright" then
        config.settings = {
          python = {
            analysis = {
              autoSearchPaths = true,
              useLibraryCodeForTypes = true,
              diagnosticMode = "workspace",
            },
          },
        }
      end
      -- Apply config before enabling
      if next(config) ~= nil then
        vim.lsp.config[server_name] = config
      end
      vim.lsp.enable(server_name)
    end,
  },
})
