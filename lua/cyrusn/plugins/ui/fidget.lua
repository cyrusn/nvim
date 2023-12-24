return {
	"j-hui/fidget.nvim",
	enabled = true,
	opts = {
		notification = {
			override_vim_notify = true,
			window = {
				winblend = 10,
				max_width = 80,
				max_height = 6,
			},
		},
		integration = {
			["nvim-tree"] = { enable = true },
		},
	},
}
