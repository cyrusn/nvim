return {
	"gbprod/yanky.nvim",
	opts = {},
	dependencies = { "folke/snacks.nvim" },
	keys = {
		{
			"<leader>p",
			"<cmd>lua Snacks.picker.yanky()<cr>",
			mode = { "n", "x" },
			desc = "Open Yank History",
		},
	},
}
