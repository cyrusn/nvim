return {
	"echasnovski/mini.nvim",
	enabled = true,
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
