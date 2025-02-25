-- https://nuxsh.is-a.dev/blog/custom-nvim-statusline.html
local M = {}

local modes = {
	["n"] = "NORMAL",
	["no"] = "NORMAL",
	["v"] = "VISUAL",
	["V"] = "VISUAL LINE",
	[""] = "VISUAL BLOCK",
	["s"] = "SELECT",
	["S"] = "SELECT LINE",
	[""] = "SELECT BLOCK",
	["i"] = "INSERT",
	["ic"] = "INSERT",
	["R"] = "REPLACE",
	["Rv"] = "VISUAL REPLACE",
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
	return "%#Normal#" .. string.format(" %s ", modes[current_mode]):upper() .. "%#Normal# "
end

function M.filepath()
	local fpath = vim.fn.fnamemodify(vim.fn.expand("%"), ":~:.:h")
	if fpath == "" or fpath == "." then
		return ""
	end

	return string.format("%%<%s/", fpath)
end

function M.filename()
	local fname = vim.fn.expand("%:t")
	if fname == "" then
		return ""
	end
	return fname .. " "
end

function M.lsp()
	local count = {}
	local levels = {
		errors = "Error",
		warnings = "Warn",
		info = "Info",
		hints = "Hint",
	}

	for k, level in pairs(levels) do
		count[k] = vim.tbl_count(vim.diagnostic.get(0, { severity = level }))
	end

	local errors = ""
	local warnings = ""
	local hints = ""
	local info = ""

	if count["errors"] ~= 0 then
		errors = diagnostics_icons.error .. count["errors"] .. " "
	end
	if count["warnings"] ~= 0 then
		warnings = diagnostics_icons.warn .. count["warnings"] .. " "
	end
	if count["hints"] ~= 0 then
		hints = diagnostics_icons.hint .. count["hints"] .. " "
	end
	if count["info"] ~= 0 then
		info = diagnostics_icons.hint .. count["info"] .. " "
	end

	return errors .. warnings .. hints .. info
end

function M.gitsigns()
	local git_info = vim.b.gitsigns_status_dict
	if not git_info or git_info.head == "" then
		return ""
	end
	local added = git_info.added and ("%#GitSignsAdd#+" .. git_info.added .. " ") or ""
	local changed = git_info.changed and ("%#GitSignsChange#~" .. git_info.changed .. " ") or ""
	local removed = git_info.removed and ("%#GitSignsDelete#-" .. git_info.removed .. " ") or ""
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
		"%#GitSignsAdd# ",
		git_info.head,
		" ",
		added,
		changed,
		removed,
		"%#Normal#",
	})
end

function M.filetype()
	return string.format(" %s ", vim.bo.filetype):upper()
end

function _G._statusline_component(name)
	return M[name]()
end

local statusline = {
	'%{%v:lua._statusline_component("mode")%}',
	"%#Normal#",
	'%{%v:lua._statusline_component("lsp")%}',
	'%{%v:lua._statusline_component("gitsigns")%}',
	"%m",
	"%r",
	'%{%v:lua._statusline_component("filepath")%}',
	'%{%v:lua._statusline_component("filename")%}',
	"%#Normal#",
	"%=",
	"%{&filetype} ",
	"%P %l:%c ",
}

vim.o.statusline = table.concat(statusline, "")
