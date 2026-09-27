vim.pack.add({
	"https://github.com/mason-org/mason.nvim",
	"https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim",
	"https://github.com/mason-org/mason-lspconfig.nvim",
	"https://github.com/neovim/nvim-lspconfig",
})

local capabilities = vim.tbl_deep_extend(
	"force",
	vim.lsp.protocol.make_client_capabilities(),
	require("mini.completion").get_lsp_capabilities()
)

local lsp_servers = {
	lua_ls = {
		settings = {
			Lua = {
				diagnostics = {
					globals = {
						"vim",
						"require",
						"MiniCompletion",
						"MiniExtra",
						"MiniPick",
						"MiniSessions",
						"MiniSnippets",
						"Snacks",
					},
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
	basedpyright = {},
}

vim.keymap.set("n", "<leader>lm", "<cmd>Mason<cr>", { desc = "Mason" })

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("cyrusn_lsp_keymaps", { clear = true }),
	callback = function(event)
		local map = function(mode, lhs, rhs, desc)
			vim.keymap.set(mode, lhs, rhs, { buffer = event.buf, desc = desc })
		end

		map("n", "K", vim.lsp.buf.hover, "Hover")
		map("n", "gd", vim.lsp.buf.definition, "Definition")
		map("n", "gD", vim.lsp.buf.declaration, "Declaration")
		map("n", "gr", vim.lsp.buf.references, "References")
		map("n", "<leader>rn", vim.lsp.buf.rename, "Rename")
		map("n", "<leader>ca", vim.lsp.buf.code_action, "Code Action")
		map("n", "[d", vim.diagnostic.goto_prev, "Previous Diagnostic")
		map("n", "]d", vim.diagnostic.goto_next, "Next Diagnostic")
		map("n", "gl", vim.diagnostic.open_float, "Line Diagnostics")
		map("i", "<C-k>", vim.lsp.buf.signature_help, "Signature Help")
	end,
})

require("mason").setup({})

require("mason-lspconfig").setup()
require("mason-tool-installer").setup({
	ensure_installed = vim.tbl_keys(lsp_servers),
})

for server, config in pairs(lsp_servers) do
	config.capabilities = capabilities
	vim.lsp.config(server, config)
	vim.lsp.enable(server)
end
