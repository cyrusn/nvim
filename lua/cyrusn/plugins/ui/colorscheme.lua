return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
	},
	{
		"rebelot/kanagawa.nvim",
		config = function()
			require("kanagawa").setup({
				compile = false,
				undercurl = true,
				commentStyle = { italic = true },
				functionStyle = {},
				keywordStyle = { italic = true },
				statementStyle = { bold = true },
				typeStyle = {},
				transparent = false,
				dimInactive = false,
				terminalColors = true,
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

						NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
						LazyNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
						MasonNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
					}
				end,
			})
			vim.cmd("colorscheme kanagawa")
		end,
	},
}
