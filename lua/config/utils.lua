-- ~/.config/nvim/lua/config/utils.lua
-- 通用工具函数

local M = {}

local comment_map = {
	lua = "--",
	python = "#",
	sh = "#",
	bash = "#",
	zsh = "#",
	javascript = "//",
	typescript = "//",
	c = "//",
	cpp = "//",
	java = "//",
	go = "//",
	rust = "//",
	php = "//",
	css = "/*",
	html = "<!--",
	xml = "<!--",
	vim = '"',
	markdown = "<!--",
	yaml = "#",
	toml = "#",
	conf = "#",
}

function M.toggle_comment()
	local ft = vim.bo.filetype
	local cs = comment_map[ft] or "#"
	local is_multi = cs == "/*" or cs == "<!--"
	local es = is_multi and (cs == "/*" and "*/" or "-->") or ""

	if vim.fn.mode() == "n" then
		local line = vim.fn.getline(".")
		local trimmed = vim.trim(line)
		if trimmed:sub(1, #cs) == cs then
			local new = line:gsub("^%s*" .. cs .. "%s*", "")
			if is_multi and es ~= "" then new = new:gsub("%s*" .. es .. "%s*$", "") end
			vim.fn.setline(".", new)
		else
			local indent = line:match("^%s*")
			local content = line:gsub("^%s*", "")
			if is_multi and es ~= "" then
				vim.fn.setline(".", indent .. cs .. " " .. content .. " " .. es)
			else
				vim.fn.setline(".", indent .. cs .. " " .. content)
			end
		end
	else
		vim.cmd('normal! gv"zc')
		local lines = vim.fn.getreg("z")
		local commented = {}
		for _, line in ipairs(lines) do
			local trimmed = vim.trim(line)
			if trimmed:sub(1, #cs) == cs then
				line = line:gsub("^%s*" .. cs .. "%s*", "")
				if is_multi and es ~= "" then line = line:gsub("%s*" .. es .. "%s*$", "") end
			else
				local indent = line:match("^%s*")
				local content = line:gsub("^%s*", "")
				if is_multi and es ~= "" then
					line = indent .. cs .. " " .. content .. " " .. es
				else
					line = indent .. cs .. " " .. content
				end
			end
			table.insert(commented, line)
		end
		vim.fn.setreg("z", commented)
		vim.cmd('normal! gv"zp')
	end
end

return M
