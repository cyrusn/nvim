return {
	"saghen/blink.cmp",
	event = "VeryLazy",
	dependencies = {
		"rafamadriz/friendly-snippets",
		"neovim/nvim-lspconfig",
		"mason-org/mason-lspconfig.nvim",
		"marcoSven/blink-cmp-yanky",
	},
	version = "1.*",
	opts = {
		keymap = {
			preset = "default",
			["<C-i>"] = { "show", "show_documentation", "hide_documentation" },
			["<C-space>"] = false, -- or {}
		},
		sources = {
			default = { "lsp", "path", "snippets", "yank", "buffer" },
			providers = {
				lsp = { fallbacks = {} },
				yank = {
					name = "yank",
					module = "blink-yanky",
					opts = {
						minLength = 5,
						onlyCurrentFiletype = true,
						trigger_characters = { '"' },
						kind_icon = "󰅍",
					},
				},
			},
		},
		signature = { enabled = true },
		fuzzy = { implementation = "prefer_rust_with_warning" },
		completion = {
			menu = {
				auto_show = true,
			},
		},
	},
	opts_extend = { "sources.default" },
}
