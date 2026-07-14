-- ~/.config/nvim/lua/lsp/pyright.lua
-- Pyright / basedpyright configuration
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
