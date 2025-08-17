-- https://nuxsh.is-a.dev/blog/custom-nvim-statusline.html
local M = {}

local diagnostics_icons = {
	error = "✘ ",
	warn = " ",
	hint = " ",
	info = " ",
}

function M.mode()
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

	local mode = vim.api.nvim_get_mode().mode
	local color = "%#@comment.info#"
	if mode == "c" or mode == "cv" or mode == "ce" then
		color = "%#@comment.todo#"
	elseif mode == "i" or mode == "I" or mode == "^I" then
		color = "%#@comment.note#"
	elseif mode == "v" or mode == "V" or mode == "^V" then
		color = "%#@comment.hint#"
	elseif mode == "s" or mode == "S" or mode == "^S" then
		color = "%#@comment.hint#"
	end

	return color .. string.format(" %s ", modes[mode]):upper() .. "%* "
end

function M.filepath()
	local fpath = vim.fn.fnamemodify(vim.fn.expand("%"), ":~:.:h")
	if fpath == "" or fpath == "." then
		fpath = ""
	end

	return "%*" .. string.format(" %s", fpath) .. "/%t%m%r" .. "%* "
end

function M.diagnostic()
	local diagnostics = vim.diagnostic.get(0)
	local count = { error = 0, warn = 0, info = 0, hint = 0 }

	for _, diagnostic in ipairs(diagnostics) do
		if diagnostic.severity == vim.diagnostic.severity.ERROR then
			count.error = count.error + 1
		elseif diagnostic.severity == vim.diagnostic.severity.WARN then
			count.warn = count.warn + 1
		elseif diagnostic.severity == vim.diagnostic.severity.INFO then
			count.info = count.info + 1
		elseif diagnostic.severity == vim.diagnostic.severity.HINT then
			count.hint = count.hint + 1
		end
	end

	local result = {}
	if count.error > 0 then
		table.insert(result, "%#DiagnosticError#" .. diagnostics_icons.error .. count.error .. "%*")
	end
	if count.warn > 0 then
		table.insert(result, "%#DiagnosticWarn#" .. diagnostics_icons.warn .. count.warn .. "%*")
	end
	if count.info > 0 then
		table.insert(result, "%#DiagnosticInfo#" .. diagnostics_icons.info .. count.info .. "%*")
	end
	if count.hint > 0 then
		table.insert(result, "%#DiagnosticHint#" .. diagnostics_icons.hint .. count.hint .. "%*")
	end

	return table.concat(result, " ")
end

function M.gitsigns()
	local git_info = vim.b.gitsigns_status_dict
	if not git_info or git_info.head == "" then
		return ""
	end

	local added = git_info.added and ("%#GitSignsAdd#" .. "+" .. git_info.added .. "%* ") or ""
	local changed = git_info.changed and ("%#GitSignsChange#" .. "~" .. git_info.changed .. "%* ") or ""
	local removed = git_info.removed and ("%#GitSignsDelete#" .. "-" .. git_info.removed .. "%* ") or ""

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
		"%#CursorLineNr#",
		" ",
		git_info.head,
		" ",
		added,
		changed,
		removed,
		"%*",
	})
end

function M.filetype()
	return "%* " .. string.format("%s", vim.bo.filetype) .. "·%{&fileencoding}" .. "%* "
end

function M.time()
	return "%#@attribute.builtin# " .. os.date("%Y-%m-%d %R") .. "%* "
end

function _G._getStatusline(name)
	return M[name]()
end

local winbar = {
	'%{%v:lua._getStatusline("mode")%}',
	'%{%v:lua._getStatusline("filepath")%}',
	'%{%v:lua._getStatusline("gitsigns")%}',
	'%{%v:lua._getStatusline("diagnostic")%}',
	"%=",
	'%{%v:lua._getStatusline("time") %} ',
}

local statusline = {
	'%{%v:lua._getStatusline("mode")%}',
	'%{%v:lua._getStatusline("filepath")%}',
	'%{%v:lua._getStatusline("gitsigns")%}',
	'%{%v:lua._getStatusline("diagnostic")%}',
	"%=",
	'%{%v:lua._getStatusline("filetype")%}',
	" %7(%l/%3L%):%2c%* [%P] ",
}

vim.o.winbar = table.concat(winbar, "")
vim.o.statusline = table.concat(statusline, "")
