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
		-- require("mini.hues").setup({ background = "#002734", foreground = "#c0c8cc", accent = "fg" }) -- azure
	end,
}
