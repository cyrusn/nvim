return {
	"rmagatti/auto-session",
	enabled = true,
	lazy = false,
	keys = {
		{ "<leader>sw", "<cmd>Autosession search<cr>", desc = "Search Session" },
		{ "<leader>sW", "<cmd>Autosession delete<cr>", desc = "Delete Session" },
	},
	config = true,
}
