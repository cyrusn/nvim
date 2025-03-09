return {
	"echasnovski/mini.nvim",
	enabled = false,
	lazy = false,
	dependancies = {
		"echasnovski/mini.icons",
	},
	keys = {},
	config = function()
		require("mini.ai").setup()
		require("mini.bracketed").setup()
	end,
}
