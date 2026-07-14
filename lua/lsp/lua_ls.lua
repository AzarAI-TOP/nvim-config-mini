-- ~/.config/nvim/lua/lsp/lua_ls.lua
-- Lua Language Server configuration
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
