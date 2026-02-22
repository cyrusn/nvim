return {
	"saghen/blink.cmp",
	event = "VeryLazy",
	dependencies = {
		"rafamadriz/friendly-snippets",
	},
	version = "1.*",
	opts = {
		keymap = {
			preset = "default",
			["<C-i>"] = { "show", "show_documentation", "hide_documentation" },
			["<C-space>"] = false, -- or {}
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
