return {
	"j-hui/fidget.nvim",
	enabled = true,
	event = "VeryLazy",
	keys = {
		{ "<leader>n", "<cmd>:Fidget history<cr>", desc = "Show Notification History" },
	},
	opts = {
		-- options
		notification = {
			override_vim_notify = true,
		},
	},
}
