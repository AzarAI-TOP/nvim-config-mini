-- ~/.config/nvim/lua/plugins/conform.lua
-- 代码格式化 (conform.nvim，通过内置 vim.pack 管理)
-- 说明: conform 本身不安装格式化器，需自行将对应二进制放入 PATH。
--       某文件类型缺少格式化器时会被静默跳过。

vim.pack.add({
    { src = "https://github.com/stevearc/conform.nvim" },
})

require("conform").setup({
    formatters_by_ft = {
        lua = { "stylua" },
        python = { "isort", "black" },
        rust = { "rustfmt" },
        go = { "goimports", "gofmt" },
        c = { "clang-format" },
        cpp = { "clang-format" },
        java = { "clang-format" },
        -- prettierd 覆盖前端 / 标记 / 声明式语言
        javascript = { "prettierd" },
        javascriptreact = { "prettierd" },
        typescript = { "prettierd" },
        typescriptreact = { "prettierd" },
        html = { "prettierd" },
        css = { "prettierd" },
        scss = { "prettierd" },
        json = { "prettierd" },
        jsonc = { "prettierd" },
        yaml = { "prettierd" },
        markdown = { "prettierd" },
        sh = { "shfmt" },
        bash = { "shfmt" },
        toml = { "taplo" },
    },
})
