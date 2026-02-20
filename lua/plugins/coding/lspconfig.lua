return {
	"neovim/nvim-lspconfig",
	keys = { { "<leader>lm", "<cmd>Mason<cr>", desc = "Mason" } },
	dependencies = {
		"mason-org/mason.nvim",
		"mason-org/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function(_, opts)
		local servers = opts.servers
		require("mason").setup()
		require("mason-lspconfig").setup()
		require("mason-tool-installer").setup({
			ensure_installed = vim.tbl_keys(servers),
		})
		for server, config in pairs(servers) do
			vim.lsp.config(server, config)
		end
	end,
	opts = {
		servers = {
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
			jsonls = {},
			ts_ls = {},
			gopls = {},
			json_ls = {},
			pylint = {},
		},
	},
}
