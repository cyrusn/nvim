return {
	"neovim/nvim-lspconfig",
	cmd = { "LspInfo", "LspInstall", "LspStart" },
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		{ "VonHeikemen/lsp-zero.nvim", branch = "v4.x" },
		{ "williamboman/mason.nvim" },
		{ "hrsh7th/cmp-nvim-lsp" },
		{ "hrsh7th/nvim-cmp" },
	},
	config = function()
		local lsp_zero = require("lsp-zero")

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
		})
	end,
}
