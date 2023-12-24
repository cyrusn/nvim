local M = {}

-- lsp-zero and mason
M.servers = {
	"cssls",
	"emmet_ls",
	"eslint",
	"graphql",
	"html",
	"lua_ls",
	"pylsp",
	"sqlls",
	"tailwindcss",
	"tsserver",
	"volar",
	"yamlls",
}

-- specific config for lspconfig
M.server_configs = {
	tsserver = {
		init_options = {
			preferences = {
				-- disable CommonJS modules warning
				disableSuggestions = true,
			},
		},
	},
}

-- conform.nvim
M.formatters_by_ft = {
	lua = { "stylua" },
	python = { "black" },
	vue = { "eslint_d" },
  html = { "prettier" },
	javascript = { "prettier" },
	json = { "prettier" },
	go = { "goimports", "gofmt" },
	sql = { "sql_formatter" },
	["*"] = { "codespell" },
	["_"] = { "trim_whitespace" },
}

M.formatters = {
	prettier = {
		prepend_args = {
			"--single-quote",
			"--trailing-comma=none",
			"--jsx-single-quote",
			"--no-semi",
		},
	},
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
	added = "+",
	modified = "~",
	removed = "-",
}

M.icons.git = {
	unstaged = "✗",
	staged = "✓",
	unmerged = "",
	renamed = "➜",
	untracked = "?",
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

M.icons.kinds = {
	Array = " ",
	Boolean = "󰨙 ",
	Class = " ",
	Codeium = "󰘦 ",
	Color = " ",
	Control = " ",
	Collapsed = " ",
	Constant = "󰏿 ",
	Constructor = " ",
	Copilot = " ",
	Enum = " ",
	EnumMember = " ",
	Event = " ",
	Field = " ",
	File = " ",
	Folder = " ",
	Function = "󰊕 ",
	Interface = " ",
	Key = " ",
	Keyword = " ",
	Method = "󰊕 ",
	Module = " ",
	Namespace = "󰦮 ",
	Null = " ",
	Number = "󰎠 ",
	Object = " ",
	Operator = " ",
	Package = " ",
	Property = " ",
	Reference = " ",
	Snippet = " ",
	String = " ",
	Struct = "󰆼 ",
	TabNine = "󰏚 ",
	Text = " ",
	TypeParameter = " ",
	Unit = " ",
	Value = " ",
	Variable = "󰀫 ",
}

return M
