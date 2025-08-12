return {
	"saghen/blink.cmp",
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
			default = { "lsp", "path", "snippets", "buffer" },
			providers = {
				lsp = { fallbacks = {} },
			},
		},
		signature = { enabled = true },
		fuzzy = { implementation = "prefer_rust_with_warning" },
		completion = {
			menu = {
				auto_show = true,
			},
		},
		cmdline = {
			completion = { menu = { auto_show = true } },
		},
	},
	opts_extend = { "sources.default" },
}
