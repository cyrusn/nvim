return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	keys = {
		{ "<leader>x", "<cmd>lua Snacks.bufdelete.delete()<cr>", desc = "Close Buffer" },
		{ "<leader>X", "<cmd>lua Snacks.bufdelete.other()<cr>", desc = "Close Other Buffers" },
		{ "<leader>hg", "<cmd>lua Snacks.lazygit()<cr>", desc = "Lazygit" },
		-- { "<leader>n", "<cmd>lua Snacks.notifier.show_history()<cr>", desc = "Show Notifier History" },
		{ "<leader>z", "<cmd>lua Snacks.terminal.toggle()<cr>", desc = "Terminal" },
	},
	opts = {
		bufdelete = { enabled = true },
		indent = { enabled = true },
		util = { enabled = true },
		lazygit = { enabled = true },
		statuscolumn = { enabled = true },
		-- notifier = { enabled = true },
		-- scroll = { enabled = true },
		terminal = { enabled = true },
	},
}
