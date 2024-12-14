return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	keys = {
		{ "<leader>x", "<cmd>lua Snacks.bufdelete.delete()<cr>", desc = "Close Buffer" },
		{ "<leader>X", "<cmd>lua Snacks.bufdelete.other()<cr>", desc = "Close Other Buffers" },
		{ "<leader>cg", "<cmd>lua Snacks.lazygit()<cr>", desc = "Toggle lazygit" },
		{ "<leader>n", "<cmd>lua Snacks.notifier.show_history()<cr>", desc = "Show Notifier History" },
	},
	opts = {
		bufdelete = { enabled = true },
		lazygit = { enabled = true },
		indent = { enabled = true },
		notifier = { enabled = true },
		scroll = { enabled = true },
	},
}
