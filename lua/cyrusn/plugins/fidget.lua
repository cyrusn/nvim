return {
	"j-hui/fidget.nvim",
	event = "VeryLazy",
	keys = {
		{ "<leader>n", "<cmd>:Fidget history<cr>", desc = "Search notification" },
	},
	opts = {
		-- options
		notification = {
			filter = vim.log.levels.TRACE,
			override_vim_notify = true,
		},
	},
}
