local M = {}

-- lsp-zero and mason
M.servers = {
	"cssls",
	"emmet_ls",
	"eslint",
	"graphql",
	"html",
	"lua_ls",
	"pyright",
	"sqlls",
	"tailwindcss",
	"tsserver",
	"vuels",
	"yamlls",
}

-- conform.nvim
M.formatters = {
	lua = { "stylua" },
	python = { "black" },
	javascript = { { "prettierd", "prettier" } },
	go = { "goimports", "gofmt" },
	sql = { "sql_formatter" },
}

-- icons set
M.icons = {}

M.icons.misc = {
	default = "󰈚",
	symlink = "",
}

M.icons.diagnostics = {
	error = " ",
	warn = " ",
	hint = " ",
	info = " ",
}

M.icons.diff = {
	added = " ",
	modified = " ",
	removed = " ",
}

M.icons.git = {
	unstaged = "✗",
	staged = "✓",
	unmerged = "",
	renamed = "➜",
	untracked = "★",
	deleted = "",
	ignored = "◌",
}

M.icons.folder = {
	default = "",
	empty = "",
	empty_open = "",
	open = "",
	symlink = "",
	symlink_open = "",
	arrow_open = "",
	arrow_closed = "",
}
return M
