local lsp_servers = {
	lua_ls = {
		settings = {
			Lua = {
				diagnostics = {
					globals = { "vim", "require" },
				},
				codeLens = { enable = true },
			},
		},
	},
	eslint = {
		javascript = {
			settings = {
				implicitProjectConfiguration = {
					checkJs = true,
				},
			},
		},
	},
	emmet_ls = {
		filetypes = {
			"css",
			"eruby",
			"html",
			"javascript",
			"javascriptreact",
			"less",
			"sass",
			"scss",
			"svelte",
			"pug",
			"typescriptreact",
			"vue",
		},
	},
	html = {
		filetypes = { "html", "templ" },
		init_options = {
			configurationSection = { "html", "css", "javascript" },
			embeddedLanguages = {
				css = true,
				javascript = true,
			},
			provideFormatter = true,
		},
	},
	ts_ls = {},
	gopls = {},
	pylint = {},
}

return {
	{
		"mason-org/mason.nvim",
		keys = { { "<leader>lm", "<cmd>Mason<cr>", desc = "Mason" } },
		opts = {},
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = {
			"mason-org/mason.nvim",
			"mason-org/mason-lspconfig.nvim",
		},
		config = function()
			require("mason-lspconfig").setup()
			require("mason-tool-installer").setup({
				ensure_installed = vim.tbl_keys(lsp_servers),
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		event = "VeryLazy",
		config = function()
			for server, config in pairs(lsp_servers) do
				vim.lsp.config(server, config)
			end
		end,
		opts = {},
	},
}
