return {
	"lukas-reineke/indent-blankline.nvim",
	opts = {
		indent = {
			char = "│",
			tab_char = "│",
		},
		scope = { enabled = false },
		exclude = {
			filetypes = {
				"help",
				"trouble",
				"lazy",
				"mason",
			},
		},
	},
	main = "ibl",
}
