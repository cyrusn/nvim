return {
	"echasnovski/mini.nvim",
	-- enabled = false,
	lazy = false,
	-- keys = {
	-- 	{ "<leader>e", "<cmd>lua MiniFiles.open()<cr>", desc = "File Tree" },
	-- },
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

		-- require("mini.tabline").setup()

		-- require("mini.files").setup({
		-- 	mappings = {
		-- 		close = "q",
		-- 		go_in = "L",
		-- 		go_in_plus = "l",
		-- 		go_out = "H",
		-- 		go_out_plus = "h",
		-- 		mark_goto = "'",
		-- 		mark_set = "m",
		-- 		reset = "<BS>",
		-- 		reveal_cwd = "@",
		-- 		show_help = "g?",
		-- 		synchronize = "=",
		-- 		trim_left = "<",
		-- 		trim_right = ">",
		-- 	},
		-- })

		-- local win_config = function()
		-- 	local has_statusline = vim.o.laststatus > 0
		-- 	local pad = vim.o.cmdheight + (has_statusline and 1 or 0)
		-- 	return { anchor = "SE", col = vim.o.columns, row = vim.o.lines - pad, title = "", border = "none" }
		-- end
		-- require("mini.notify").setup({
		-- 	window = { config = win_config, winblend = 0 },
		-- })
		--
		-- vim.api.nvim_set_hl(0, "MiniNotifyNormal", { link = "NormalNC", bg = "none" })
		-- vim.api.nvim_set_hl(0, "MiniNotifyLspProgress", { link = "NormalNC", bg = "none" })
	end,
}
