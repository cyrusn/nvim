return {
	"saghen/blink.cmp",
	dependencies = { "rafamadriz/friendly-snippets", "L3MON4D3/LuaSnip" },
	version = "1.*",
	opts = {
		keymap = {
			preset = "default",
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
		snippets = { preset = "luasnip" },
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
