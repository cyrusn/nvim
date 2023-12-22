return {
	"j-hui/fidget.nvim",
	enabled = false,
	opts = {
		notification = {
			override_vim_notify = true,
			window = {
				winblend = 10,
				max_width = 80,
				max_height = 6,
			},
		},
		integration = {
			["nvim-tree"] = { enable = true },
		},
	},
	config = function(_, opts)
		local fidget = require("fidget")
		fidget.setup(opts)
		vim.msg_show = fidget.notify
	end,
}
