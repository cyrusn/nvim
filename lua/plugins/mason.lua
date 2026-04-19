vim.pack.add({
	"https://github.com/mason-org/mason.nvim",
	"https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim",
	"https://github.com/mason-org/mason-lspconfig.nvim",
	"https://github.com/neovim/nvim-lspconfig",
})

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

vim.keymap.set("n", "<leader>lm", "<cmd>Mason<cr>", { desc = "Mason" })
require("mason").setup({})

require("mason-lspconfig").setup()
require("mason-tool-installer").setup({
	ensure_installed = vim.tbl_keys(lsp_servers),
})

for server, config in pairs(lsp_servers) do
	vim.lsp.config(server, config)
	vim.lsp.enable(server)
end
