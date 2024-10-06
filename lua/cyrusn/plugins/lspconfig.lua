return {
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v4.x",
		lazy = true,
		config = false,
	},
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = true,
	},
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
			"onsails/lspkind.nvim",
		},
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")

			require("luasnip.loaders.from_vscode").lazy_load()

			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					["<CR>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							if luasnip.expandable() then
								luasnip.expand()
							else
								cmp.confirm({ select = true })
							end
						else
							fallback()
						end
					end),

					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif luasnip.locally_jumpable(1) then
							luasnip.jump(1)
						else
							fallback()
						end
					end, { "i", "s" }),

					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif luasnip.locally_jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, { "i", "s" }), -- scroll up and down the documentation window
					["<C-u>"] = cmp.mapping.scroll_docs(-4),
					["<C-d>"] = cmp.mapping.scroll_docs(4),
				}),

				sources = {
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "buffer" },
					{ name = "path" },
				},

				formatting = {
					format = require("lspkind").cmp_format(),
				},
			})

			cmp.setup.cmdline({ "/", "?" }, {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = "buffer" },
				},
			})

			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = "path" },
				}, {
					{ name = "cmdline" },
				}),
				matching = { disallow_symbol_nonprefix_matching = false },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		cmd = { "LspInfo", "LspInstall", "LspStart" },
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },
		},
		keys = { { "<leader>M", "<cmd>Mason<cr>", desc = "Mason" } },
		config = function()
			local lsp_zero = require("lsp-zero")
			local lspconfig = require("lspconfig")

			local config = require("cyrusn.config").mason
			local servers = config.servers
			local ensure_installed = config.ensure_installed

			local lsp_attach = function(_, bufnr)
				lsp_zero.default_keymaps({
					buffer = bufnr,
					preserve_mappings = false,
				})

				local map = function(mode, l, r, desc, opts)
					opts = opts or {}
					opts.buffer = bufnr
					opts.desc = desc
					return vim.keymap.set(mode, l, r, opts)
				end

				-- +code
				map("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action")
				map("n", "<leader>cr", "<cmd>lua vim.lsp.buf.rename()<cr>", "LSP Rename")
				map("n", "<leader>ci", "<cmd>LspInfo<cr>", "LSP Info")

				-- +diagnostics
				map("n", "<leader>cl", "<cmd>lua vim.diagnostic.open_float()<cr>", "Show Line Diagnostics")
				map("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>", "Prev Diagnostic")
				map("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>", "Next Diagnostic")
			end

			lsp_zero.extend_lspconfig({
				sign_text = true,
				float_border = "rounded",
				lsp_attach = lsp_attach,
				capabilities = require("cmp_nvim_lsp").default_capabilities(),
			})

			local handlers = {}

			for key, val in pairs(servers) do
				if type(key) == "number" then
					handlers[val] = function()
						lspconfig[val].setup({})
					end
				else
					handlers[key] = function()
						lspconfig[key].setup(val)
					end
				end
			end

			require("mason-lspconfig").setup({
				ensure_installed = ensure_installed,
				automatic_servers_installation = true,
				handlers = handlers,
			})
		end,
	},
}
