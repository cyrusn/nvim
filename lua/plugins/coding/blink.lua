vim.pack.add({
	{ src = "https://github.com/Saghen/blink.cmp" },
	{ src = "https://github.com/rafamadriz/friendly-snippets" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/mason-org/mason-lspconfig.nvim" },
	{ src = "https://github.com/marcoSven/blink-cmp-yanky" },
})

require("blink.cmp").setup({
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
	fuzzy = { implementation = "lua" },
	completion = {
		menu = {
			auto_show = true,
		},
	},
	cmdline = {
		completion = { menu = { auto_show = true } },
	},
})
