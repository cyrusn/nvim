return {
	"folke/noice.nvim",
	event = "VeryLazy",
	opts = {
		cmdline = { enabled = false },
		messages = { enabled = false },
		views = { mini = { position = { row = -2 } } },
	},
	dependencies = {
		"MunifTanjim/nui.nvim",
	},
}
