require("blink.cmp").setup({
	keymap = {
		preset = "default",
		["<C-i>"] = { "show", "show_documentation", "hide_documentation" },
		["<C-space>"] = {},
	},
	signature = { enabled = true },
	fuzzy = { implementation = "prefer_rust" },
	completion = {
		menu = {
			auto_show = true,
		},
	},
})
