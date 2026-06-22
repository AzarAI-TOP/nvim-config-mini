-- ~/.config/nvim/lua/treesitter.lua
-- Tree-sitter 语法高亮 (通过内置 vim.pack 管理 nvim-treesitter)
-- 说明: Neovim 自带的 7 个解析器无法覆盖 JavaScript 等语言，
--       未安装解析器时会回退到粗糙的正则语法 (只高亮少量元素)。

-- nvim-treesitter 的新 API 位于 main 分支 (需 Neovim 0.11+)，显式锁定分支
vim.pack.add({
    { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
})

-- 需要安装的解析器 (语言名，非文件类型)。编译需要 PATH 中有 C 编译器 (cc/gcc)。
local parsers = {
    "lua", "vim", "vimdoc", "query",
    "javascript", "typescript", "tsx",
    "html", "css", "scss",
    "json", "jsonc", "yaml", "toml",
    "bash", "markdown", "markdown_inline",
    "python", "rust", "go", "c", "cpp", "java",
}

-- 异步安装/更新解析器 (已安装的会自动跳过)
require("nvim-treesitter").install(parsers)

-- 文件类型 -> 语言 映射 (文件类型名与解析器名不一致的情况)
vim.treesitter.language.register("javascript", { "javascriptreact" }) -- jsx 由 javascript 解析器处理
vim.treesitter.language.register("tsx", { "typescriptreact" })
vim.treesitter.language.register("bash", { "sh" })

-- 在任意文件类型上自动启用 tree-sitter 高亮:
-- 仅当对应语言的解析器确实已安装时才启用，否则静默回退到正则语法。
-- 这样新装的解析器会自动生效，无需手动维护文件类型列表。
vim.api.nvim_create_autocmd("FileType", {
    group = vim.api.nvim_create_augroup("treesitter_highlight", { clear = true }),
    callback = function(args)
        -- 文件类型 -> 语言 (未注册映射则返回 nil)
        local lang = vim.treesitter.language.get_lang(args.match)
        if not lang then
            return
        end
        -- 尝试加载解析器: 成功返回 true，缺失则返回 nil
        local ok, loaded = pcall(vim.treesitter.language.add, lang)
        if ok and loaded then
            vim.treesitter.start(args.buf, lang)
        end
    end,
})
