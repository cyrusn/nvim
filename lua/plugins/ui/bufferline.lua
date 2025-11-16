return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	lazy = false,
	keys = {
		{ "<S-l>", "<cmd>bnext<cr>", desc = "Next Buffer" },
		{ "<S-h>", "<cmd>bprev<cr>", desc = "Prev Buffer" },
	},

	config = function()
		require("bufferline").setup({})
	end,
}
