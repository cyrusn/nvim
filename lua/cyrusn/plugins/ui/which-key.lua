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
			["<leader>t"] = { name = "+toggle" },
			["<leader>b"] = { name = "+buffers" },
			["<leader>s"] = { name = "+search" },
			["<leader>g"] = { name = "+git" },
			["<leader>o"] = { name = "+obsidian" },
		})
		wk.setup(opts)
	end,
}
