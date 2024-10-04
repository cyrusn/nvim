local M = {}

-- load config
function M.setup()
	local modules = {
		"options",
		"autocmds",
		"keymaps",
	}
	for _, mod in ipairs(modules) do
		require("cyrusn.config." .. mod)
	end
end

-- lsp_zero and mason
-- the servers object below is the setup for mason `{ ensure_installed = servers }`
-- and lsp_zero `lsp_zero.setup_servers(servers)`
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
M.servers = {
	"clangd",
	"cssls",
	"emmet_ls",
	"eslint",
	"gopls",
	"graphql",
	"html",
	lua_ls = { settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	} },
	"prismals",
	"sqlls",
	"tailwindcss",
	"volar",
	"yamlls",
	ts_ls = {
		-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#tsserver
		init_options = {
			preferences = {
				-- disable CommonJS modules warning
				disableSuggestions = true,
			},
		},
	},
	pylsp = {
		-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#pylsp
		settings = {
			pylsp = {
				plugins = {
					pycodestyle = {
						maxLineLength = 88,
						ignore = { "E501" },
					},
				},
			},
		},
	},
}

-- conform.nvim
M.formatters_by_ft = {
	lua = { "stylua" },
	python = { "black" },
	vue = { "prettier" },
	html = { "prettier" },
	javascript = { { "prettierd", "prettier" } },
	markdown = { "markdownlint" },
	c = { "clang-format" },
	json = { "prettier" },
	go = { "goimports", "gofmt" },
	sql = { "sql_formatter" },
	["_"] = { "trim_whitespace" },
}

M.formatters = {
	prettier = {
		prepend_args = {
			"--single-quote",
			"--trailing-comma=none",
			"--jsx-single-quote",
			"--ignore-path=.prettierignore",
			"--no-semi",
		},
	},
}

M.listchars = {
	tab = "│ ",
	lead = "·",
	trail = "·",
	extends = "▸",
	precedes = "◂",
	leadmultispace = "│·",
}

return M
