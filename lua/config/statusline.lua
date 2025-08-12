-- https://nuxsh.is-a.dev/blog/custom-nvim-statusline.html
local M = {}

local modes = {
	["n"] = "NORMAL",
	["no"] = "NORMAL",
	["v"] = "VISUAL",
	["V"] = "V.LINE",
	[""] = "V.BLOCK",
	["s"] = "SELECT",
	["S"] = "S.LINE",
	[""] = "S.BLOCK",
	["i"] = "INSERT",
	["ic"] = "INSERT",
	["R"] = "REPLACE",
	["Rv"] = "V.REPLACE",
	["c"] = "COMMAND",
	["cv"] = "VIM EX",
	["ce"] = "EX",
	["r"] = "PROMPT",
	["rm"] = "MOAR",
	["r?"] = "CONFIRM",
	["!"] = "SHELL",
	["t"] = "TERMINAL",
}

local diagnostics_icons = {
	error = "✘ ",
	warn = " ",
	hint = " ",
	info = " ",
}

function M.mode()
	local current_mode = vim.api.nvim_get_mode().mode
	return string.format("  %s ", modes[current_mode]):upper()
end

function M.filepath()
	local fpath = vim.fn.fnamemodify(vim.fn.expand("%"), ":~:.:h")
	if fpath == "" or fpath == "." then
		return ""
	end

	return string.format("%s", fpath)
end

function M.diagnostic()
	local all_count = 0
	local count = {}
	local levels = {
		errors = "Error",
		warnings = "Warn",
		info = "Info",
		hints = "Hint",
	}

	for k, level in pairs(levels) do
		local tbl_count = vim.tbl_count(vim.diagnostic.get(0, { severity = level }))
		all_count = all_count + tbl_count
		count[k] = tbl_count
	end

	local errors = ""
	local warnings = ""
	local hints = ""
	local info = ""

	if count["errors"] ~= 0 then
		errors = "%#DiagnosticError#" .. diagnostics_icons.error .. count["errors"] .. " "
	end
	if count["warnings"] ~= 0 then
		warnings = "%#DiagnosticWarn#" .. diagnostics_icons.warn .. count["warnings"] .. " "
	end
	if count["hints"] ~= 0 then
		hints = "%#DiagnosticHint#" .. diagnostics_icons.hint .. count["hints"] .. " "
	end
	if count["info"] ~= 0 then
		info = "%#DiagnosticInfo#" .. diagnostics_icons.info .. count["info"] .. " "
	end

	if all_count == 0 then
		return ""
	end

	return "%#@comment#| " .. errors .. warnings .. hints .. info
end

function M.gitHead()
	local git_info = vim.b.gitsigns_status_dict
	if not git_info or git_info.head == "" then
		return ""
	end
	return table.concat({
		" ",
		git_info.head,
		" ",
	})
end

function M.gitsigns()
	local git_info = vim.b.gitsigns_status_dict
	if not git_info or git_info.head == "" then
		return ""
	end
	local added = git_info.added and ("%#GitSignsAdd#" .. "+" .. git_info.added .. " ") or ""
	local changed = git_info.changed and ("%#GitSignsChange#" .. "~" .. git_info.changed .. " ") or ""
	local removed = git_info.removed and ("%#GitSignsDelete#" .. "-" .. git_info.removed .. " ") or ""

	if git_info.added == 0 then
		added = ""
	end
	if git_info.changed == 0 then
		changed = ""
	end
	if git_info.removed == 0 then
		removed = ""
	end
	return table.concat({
		"%* ",
		added,
		changed,
		removed,
	})
end

function M.filetype()
	return string.format(" %s ", vim.bo.filetype):upper()
end

function M.time()
	return " " .. os.date("%Y-%m-%d %R")
end

function _G._statusline_component(name)
	return M[name]()
end

local statusline = {
	"%#Cursor#",
	'%{%v:lua._statusline_component("mode")%}',
	"%#StatusLine#",
	' %{%v:lua._statusline_component("gitHead")%}',
	"%#TabLine#",
	'  %{%v:lua._statusline_component("filepath")%}',
	"%t %m%r",
	"%=",
	"%#Cursor#",
	" %{&filetype} ",
	"%P %l:%c ",
}

local winbar = {
	"%#Cursor#",
	'  %{%v:lua._statusline_component("filepath")%}',
	'%{%v:lua._statusline_component("gitsigns")%}',
	'%{%v:lua._statusline_component("diagnostic")%}',
	'%=%#Cursor# %{%v:lua._statusline_component("time") %} ',
}

vim.o.winbar = table.concat(winbar, "")
vim.o.statusline = table.concat(statusline, "")
