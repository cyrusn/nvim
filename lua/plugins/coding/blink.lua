require("blink.cmp").setup({
	keymap = {
		preset = "default",
		["<tab>"] = { "show", "show_documentation", "hide_documentation" },
		["<C-space>"] = false,
		["<C-u>"] = { "scroll_documentation_up", "fallback" },
		["<C-d>"] = { "scroll_documentation_down", "fallback" },

	},
	signature = { enabled = true },
	fuzzy = { implementation = "prefer_rust" },
	completion = {
		menu = {
			auto_show = true,
		},
	},
})
