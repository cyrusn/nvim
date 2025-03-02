return {
	"rmagatti/auto-session",
	enabled = false,
	lazy = false,
	keys = {
		{ "<leader>ws", "<cmd>Autosession search<cr>", desc = "Search Session" },
		{ "<leader>wx", "<cmd>Autosession delete<cr>", desc = "Delete Session" },
	},
	config = true,
}
