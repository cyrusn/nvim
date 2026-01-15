return {
	{
		"catppuccin/nvim",
		enabled = false,
		name = "catppuccin",
		priority = 1000,
		config = function()
			vim.cmd("colorscheme catppuccin")
		end,
	},
	{
		"rose-pine/neovim",
		enabled = false,
		name = "rose-pine",
		priority = 1000,
		config = function()
			vim.cmd("colorscheme rose-pine")
		end,
	},
	{
		"craftzdog/solarized-osaka.nvim",
		-- enabled = false,
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd("colorscheme solarized-osaka")
		end,
	},
	{
		"rebelot/kanagawa.nvim",
		enabled = false,
		priority = 1000,
		config = function()
			vim.cmd("colorscheme kanagawa-wave")
		end,
	},
}
