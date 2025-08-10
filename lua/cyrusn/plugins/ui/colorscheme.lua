return {
	{
		"catppuccin/nvim",
		enabled = false,
		name = "catppuccin",
	},
	{
		"rose-pine/neovim",
		-- enabled = false,
		name = "rose-pine",
		config = function()
			vim.cmd("colorscheme rose-pine")
		end,
	},
	{
		"rebelot/kanagawa.nvim",
		enabled = false,
		config = function()
			require("kanagawa").setup({
				functionStyle = { italic = true },
				colors = {
					theme = {
						all = {
							ui = {
								bg_gutter = "none",
							},
						},
					},
				},
				overrides = function(colors)
					local theme = colors.theme
					return {
						NormalFloat = { bg = theme.ui.bg_m1 },
						FloatBorder = { bg = theme.ui.bg_m1 },
						FloatTitle = { bg = theme.ui.bg_m1 },
					}
				end,
			})
			vim.cmd("colorscheme kanagawa-dragon")
		end,
	},
}
