return {
	"folke/which-key.nvim",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	opts = {
		key_labels = {
			["<space>"] = "SPC",
		},
		window = {
			border = "single",
		},
	},
	config = function(_, opts)
		local wk = require("which-key")

		wk.register({
			["<leader>b"] = { name = "+buffers" },
			["<leader>m"] = { name = "+multi-cursors" },
			["<leader>s"] = { name = "+search" },
			["<leader>g"] = { name = "+git" },
			["<leader>t"] = { name = "+toggle" },
			["<leader>n"] = { name = "+notifications" },
		})
		wk.setup(opts)
	end,
}
