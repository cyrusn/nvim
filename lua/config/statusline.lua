-- https://nuxsh.is-a.dev/blog/custom-nvim-statusline.html
local M = {}

local diagnostics_icons = {
	error = "✘ ",
	warn = " ",
	hint = " ",
	info = " ",
}

function M.mode()
	local current_mode = vim.api.nvim_get_mode().mode
	return string.format(" [%s]", current_mode):upper()
end

function M.filepath()
	local fpath = vim.fn.fnamemodify(vim.fn.expand("%"), ":~:.:h")
	if fpath == "" or fpath == "." then
		return ""
	end

	return string.format(" %s", fpath) .. "/%t%m%r"
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
		table.insert(result, diagnostics_icons.error .. count.error)
	end
	if count.warn > 0 then
		table.insert(result, diagnostics_icons.warn .. count.warn)
	end
	if count.info > 0 then
		table.insert(result, diagnostics_icons.info .. count.info)
	end
	if count.hint > 0 then
		table.insert(result, diagnostics_icons.hint .. count.hint)
	end

	return table.concat(result, " ")
end

function M.gitHead()
	local git_info = vim.b.gitsigns_status_dict
	if not git_info or git_info.head == "" then
		return ""
	end
	return table.concat({
		" ",
		git_info.head,
	})
end

function M.gitsigns()
	local git_info = vim.b.gitsigns_status_dict
	if not git_info or git_info.head == "" then
		return ""
	end
	local added = git_info.added and ("+" .. git_info.added .. " ") or ""
	local changed = git_info.changed and ("~" .. git_info.changed .. " ") or ""
	local removed = git_info.removed and ("-" .. git_info.removed .. " ") or ""

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
		added,
		changed,
		removed,
	})
end

function M.filetype()
	return " " .. string.format("%s ", vim.bo.filetype)
end

function M.encoding()
	local str = "%{&fileencoding}"
	return string.format("[%s] ", str):upper()
end

function M.time()
	return " " .. os.date("%Y-%m-%d %R")
end

function M.lsp_server()
	local lsp = vim.lsp.get_clients()
	if #lsp ~= 0 then
		if lsp[1] ~= nil then
			local server = lsp[1].name
			return "  " .. server .. " "
		end
	else
		return ""
	end
end

function _G._getStatusline(name)
	return M[name]()
end

local winbar = {
	'%{%v:lua._getStatusline("mode")%} ',
	'%{%v:lua._getStatusline("filepath")%}',
	"%=",
	'%{%v:lua._getStatusline("time") %} ',
}

local statusline = {
	'%{%v:lua._getStatusline("mode")%} ',
	'%{%v:lua._getStatusline("filepath")%} ',
	"%=",
	'%{%v:lua._getStatusline("gitHead")%} ',
	'%{%v:lua._getStatusline("gitsigns")%}',
	'%{%v:lua._getStatusline("diagnostic")%}',
	'%{%v:lua._getStatusline("filetype")%}',
	"[%{&fileencoding}] ",
	" %P %l:%c ",
}

vim.o.winbar = table.concat(winbar, "")
vim.o.statusline = table.concat(statusline, "")
