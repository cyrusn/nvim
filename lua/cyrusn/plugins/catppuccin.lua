return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			integrations = {
				gitsigns = true,
				lsp_trouble = true,
				mason = true,
				navic = { enabled = true },
				nvimtree = true,
				which_key = true,
				noice = true,
				telescope = { enabled = true },
			},
		})
		vim.cmd.colorscheme("catppuccin")
	end,
}
