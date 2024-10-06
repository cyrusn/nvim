local M = {}

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

-- helpers
--
M.helpers = {
	includes = function(tbl, str)
		local result = false

		for _, val in pairs(tbl) do
			if type(val) == "string" then
				if string.gsub(val, "^%s*(.-)%s*$", "%1") == string.gsub(str, "^%s*(.-)%s*$", "%1") then
					result = true
				end
			end
		end

		return result
	end,
}

-- nvim-treesitter
M.treesitter = {
	ensure_installed = {
		"bash",
		"comment",
		"css",
		"gitcommit",
		"html",
		"javascript",
		"lua",
		"markdown",
		"markdown_inline",
		"python",
		"toml",
		"vim",
		"vimdoc",
		"yaml",
		"lua",
		"markdown",
		"json",
	},
}

-- mason.nvim
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md
M.mason = {
	ensure_installed = {
		"cssls",
		"gopls",
		"html",
		"lua_ls",
		"pylsp",
		"bashls",
		"beautysh",
		"yamlfix",
		"sqlls",
		"ts_ls",
	},

	servers = {
		"clangd",
		"cssls",
		"emmet_ls",
		"eslint",
		"gopls",
		"graphql",
		"html",
		lua_ls = {
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
				},
			},
		},
		"prismals",
		"sqlls",
		"tailwindcss",
		"volar",
		"yamlls",
		ts_ls = {
			init_options = {
				preferences = {
					-- disable CommonJS modules warning
					disableSuggestions = true,
				},
			},
		},
		pylsp = {
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
	},
}

-- conform.nvim
M.conform = {
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "black" },
		vue = { "prettier" },
		html = { "prettier" },
		javascript = { "prettier" },
		markdown = { "markdownlint" },
		c = { "clang-format" },
		json = { "prettier" },
		go = { "goimports", "gofmt" },
		sql = { "sql_formatter" },
		["_"] = { "trim_whitespace" },
	},
	formatters = {
		prettier = {
			prepend_args = {
				"--single-quote",
				"--trailing-comma=none",
				"--jsx-single-quote",
				"--ignore-path=.prettierignore",
				"--no-semi",
			},
		},
	},
}
return M
