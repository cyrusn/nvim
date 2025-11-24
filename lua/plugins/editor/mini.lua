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

		require("mini.notify").setup({
			window = { config = { title = "", border = "none" }, winblend = 0 },
		})

		vim.api.nvim_set_hl(0, "MiniNotifyNormal", { link = "NormalNC", bg = "none" })
		vim.api.nvim_set_hl(0, "MiniNotifyLspProgress", { link = "NormalNC", bg = "none" })
	end,
}
