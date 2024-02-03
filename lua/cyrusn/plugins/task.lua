return {
	"cyrusn/task.nvim",
	dev = true,
	dependancies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
	},
	keys = {
		{
			"<leader>st",
			function()
				require("task").search()
			end,
			desc = "Search today tasks",
		},
	},
	config = true,
}
