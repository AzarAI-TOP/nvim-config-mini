-- ~/.config/nvim/lua/autocmd.lua
-- Neovim 自动命令

-- 复制时高亮
vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("highlight_yank", { clear = true }),
	callback = function() vim.highlight.on_yank({ higroup = "IncSearch", timeout = 150 }) end,
})

-- 打开文件回到上次编辑位置
vim.api.nvim_create_autocmd("BufReadPost", {
	group = vim.api.nvim_create_augroup("last_position", { clear = true }),
	callback = function()
		local mark = vim.api.nvim_buf_get_mark(0, '"')
		local lcount = vim.api.nvim_buf_line_count(0)
		if mark[1] > 0 and mark[1] <= lcount then pcall(vim.api.nvim_win_set_cursor, 0, mark) end
	end,
})

-- =============================================
-- 文件类型缩进配置
-- =============================================
-- 全局默认值定义在 option.lua: 4 空格缩进, expandtab
-- 此处仅覆盖与全局默认不同的文件类型
-- 未在此列出的文件类型将使用全局默认 (4 空格, expandtab)

local indent_augroup = vim.api.nvim_create_augroup("indent_settings", { clear = true })

-- 缩进配置组: [tabstop, shiftwidth, expandtab, filetypes列表]
local indent_groups = {
	-- 2 空格缩进 — 前端 / 脚本 / 标记语言 / 声明式语言
	{ 2, 2, true, {
		"lua", "vim",
		"javascript", "javascriptreact", "typescript", "typescriptreact",
		"html", "css", "scss", "less", "sass",
		"json", "jsonc",
		"yaml",
		"ruby", "eruby",
		"sh", "bash", "zsh", "fish",
		"markdown",
		"elixir", "eelixir", "heex",
		"haskell", "lhaskell",
		"ocaml", "reason",
		"scala",
		"dart",
		"cmake",
		"graphql",
		"svelte", "vue",
		"terraform", "hcl",
		"toml",
		"nix",
		"rescript",
		"gleam",
	} },

	-- 4 空格缩进 — 系统编程 / 传统语言
	{ 4, 4, true, {
		"python",
		"rust",
		"c", "cpp",
		"java",
		"kotlin",
		"swift",
		"fsharp",
		"zig",
		"ada",
		"perl",
		"prolog",
		"solidity",
		"pascal",
	} },

	-- Tab 缩进 — 工具链强制使用 Tab 的语言
	{ 4, 4, false, {
		"go",
		"make",
	} },
}

for _, group in ipairs(indent_groups) do
	local ts, sw, et, fts = unpack(group)
	vim.api.nvim_create_autocmd("FileType", {
		group = indent_augroup,
		pattern = fts,
		callback = function()
			vim.opt_local.tabstop = ts
			vim.opt_local.shiftwidth = sw
			vim.opt_local.expandtab = et
		end,
	})
end
