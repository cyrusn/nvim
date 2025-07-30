return {
	"saghen/blink.cmp",
	dependencies = { "rafamadriz/friendly-snippets" },
	version = "1.*",
	opts = {
		keymap = {
			preset = "super-tab",
		},
		appearance = {
			nerd_font_variant = "mono",
		},
		completion = {
			documentation = { auto_show = true },
			ghost_text = { enabled = true },
		},
		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
			providers = {
				lsp = { fallbacks = {} },
			},
		},
		snippets = { preset = "default" },
		fuzzy = { implementation = "prefer_rust_with_warning" },
		cmdline = {
			keymap = {
				preset = "inherit",
			},
			completion = {
				menu = { auto_show = true },
				ghost_text = { enabled = true },
			},
		},
	},
	opts_extend = { "sources.default" },
}
