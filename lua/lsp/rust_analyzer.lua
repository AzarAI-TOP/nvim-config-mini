-- ~/.config/nvim/lua/lsp/rust_analyzer.lua
-- Rust Language Server
return {
    settings = {
        ["rust-analyzer"] = {
            check = { command = "clippy" },
        },
    },
}
