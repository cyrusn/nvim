return {
	{
		"neovim/nvim-lspconfig",
		cmd = { "LspInfo", "LspInstall", "LspStart" },
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			-- "hrsh7th/cmp-nvim-lsp",
			{
				"williamboman/mason.nvim",
				keys = { { "<leader>aM", "<cmd>Mason<cr>", desc = "Mason" } },
				config = true,
			},
			"williamboman/mason-lspconfig.nvim",
		},
		init = function()
			vim.opt.signcolumn = "yes"
		end,
		config = function()
			-- Add cmp_nvim_lsp capabilities settings to lspconfig
			-- This should be executed before you configure any language server

			vim.diagnostic.config({
				signs = {
					text = {
						[vim.diagnostic.severity.ERROR] = "✘",
						[vim.diagnostic.severity.WARN] = " ",
						[vim.diagnostic.severity.HINT] = " ",
						[vim.diagnostic.severity.INFO] = " ",
					},
				},
			})

			local lspconfig_defaults = require("lspconfig").util.default_config
			-- lspconfig_defaults.capabilities = vim.tbl_deep_extend(
			-- 	"force",
			-- 	lspconfig_defaults.capabilities,
			-- 	require("cmp_nvim_lsp").default_capabilities()
			-- )

			vim.api.nvim_create_autocmd("LspAttach", {
				desc = "LSP actions",
				callback = function(event)
					local map = function(mode, l, r, desc)
						local opts = { buffer = event.buf }
						opts.desc = desc
						return vim.keymap.set(mode, l, r, opts)
					end

					map("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action")
					map("n", "<leader>cr", "<cmd>lua vim.lsp.buf.rename()<cr>", "LSP Rename")
					map("n", "<leader>ci", "<cmd>LspInfo<cr>", "LSP Info")

					-- +diagnostics
					map("n", "<leader>cl", "<cmd>lua vim.diagnostic.open_float()<cr>", "Show Line Diagnostics")
					-- map("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>", "Prev Diagnostic")
					-- map("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>", "Next Diagnostic")
				end,
			})

			-- reference: https://lsp-zero.netlify.app/docs/language-server-configuration.html#configure-language-servers

			require("lspconfig").lua_ls.setup({
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim", "require" },
						},
					},
				},
			})
			require("lspconfig").emmet_ls.setup({
				-- on_attach = on_attach,
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
			})
			require("lspconfig").html.setup({
				cmd = { "vscode-html-language-server", "--stdio" },
				filetypes = { "html", "templ" },
				init_options = {
					configurationSection = { "html", "css", "javascript" },
					embeddedLanguages = {
						css = true,
						javascript = true,
					},
					provideFormatter = true,
				},
				root_dir = function()
					return vim.loop.cwd()
				end,
			})

			require("lspconfig").sqlls.setup({
				cmd = { "sql-language-server", "up", "--method", "stdio" },
				filetypes = { "sql", "mysql" },
				root_dir = function()
					return vim.loop.cwd()
				end,
			})

			require("mason-lspconfig").setup({
				automatic_enable = true,
				ensure_installed = { "lua_ls", "ts_ls", "eslint", "html", "jsonls" },
			})
		end,
	},
}
