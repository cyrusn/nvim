return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			flavour = "macchiato", -- latte, frappe, macchiato, mocha
			integrations = {
				fidget = true,
				gitsigns = true,
				lsp_trouble = true,
				mason = true,
				mini = {
					enabled = true,
					indentscope_color = "",
				},
				nvimtree = true,
				telescope = { enabled = true },
				which_key = true,
			},
		})
		vim.cmd.colorscheme("catppuccin")
	end,
}
