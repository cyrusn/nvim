return {
	"stevearc/oil.nvim",
	lazy = false,
	opts = {
		default_file_explorer = true,
		columns = {
			"icon",
		},
		delete_to_trash = true,
		view_options = {
			show_hidden = true,
		},
	},
	-- Optional dependencies
	dependencies = { "nvim-tree/nvim-web-devicons" },
	keys = {
		{ "<leader>e", "<cmd>Oil<cr>", desc = "Open Oil Explorer" },
	},
	config = function(_, opts)
		require("oil").setup(opts)
	end,
}
