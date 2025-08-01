return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		enabled = false,
		priority = 1000,
		opts = {},
	},
	{
		"catppuccin/nvim",
		enabled = false,
		name = "catppuccin",
		priority = 1000,
	},
	{
		"rose-pine/neovim",
		enabled = true,
		name = "rose-pine",
		config = function()
			vim.cmd("colorscheme rose-pine-main")
		end,
	},
	{
		"rebelot/kanagawa.nvim",
		enabled = false,
	},
	{},
}
