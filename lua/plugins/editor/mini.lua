return {
	"echasnovski/mini.nvim",
	-- enabled = false,
	lazy = false,
	dependancies = {
		"echasnovski/mini.icons",
	},
	config = function()
		require("mini.basics").setup({
			options = {
				basic = true,
			},
			mappings = {
				basic = true,
				option_toggle_prefix = [[\]],
				windows = true,
				move_with_alt = true,
			},
		})
    require("mini.move").setup()
	end,
}
