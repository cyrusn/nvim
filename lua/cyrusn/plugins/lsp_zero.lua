return {
	"VonHeikemen/lsp-zero.nvim",
	branch = "v4.x",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
		"hrsh7th/cmp-nvim-lsp",
	},
	keys = { { "<leader>M", "<cmd>Mason<cr>", desc = "Mason" } },
	config = function()
		local lsp_zero = require("lsp-zero")
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
			map("n", "<leader>df", "<cmd>lua vim.diagnostic.open_float()<cr>", "Show Line Diagnostics")
			map("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>", "Prev Diagnostic")
			map("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>", "Next Diagnostic")
		end

		lsp_zero.extend_lspconfig({
			sign_text = true,
			float_border = "rounded",
			lsp_attach = lsp_attach,
			capabilities = require("cmp_nvim_lsp").default_capabilities(),
		})

		require("mason").setup()

		local lspconfig = require("lspconfig")
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
}
