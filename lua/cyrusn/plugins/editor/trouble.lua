return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	keys = {
		{
			"<leader>tt",
			function()
				require("trouble").toggle()
			end,
			desc = "Toggle Trouble",
		},
	},
	config = true,
}
