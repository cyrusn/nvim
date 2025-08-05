return {
	"j-hui/fidget.nvim",
	-- enabled = false,
	event = "VeryLazy",
	keys = {
		{ "<leader>n", "<cmd>:Fidget history<cr>", desc = "Notification History" },
	},
	opts = {
		-- options
		notification = {
			override_vim_notify = true,
		},
	},
}

