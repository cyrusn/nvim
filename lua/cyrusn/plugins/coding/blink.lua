return {
	"saghen/blink.cmp",
	event = { "VeryLazy" },
	dependencies = {
		"rafamadriz/friendly-snippets",
		"neovim/nvim-lspconfig",
		"mason-org/mason-lspconfig.nvim",
	},
	version = "1.*",
	opts = {
		keymap = {
			preset = "default",
			["<C-i>"] = { "show", "show_documentation", "hide_documentation" },
			["<C-space>"] = false, -- or {}
		},
		sources = {
			providers = {
				lsp = { fallbacks = {} },
			},
		},
		signature = { enabled = true },
		fuzzy = { implementation = "prefer_rust_with_warning" },
	},
	opts_extend = { "sources.default" },
}
