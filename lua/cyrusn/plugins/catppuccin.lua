return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			flavour = "macchiato", -- latte, frappe, macchiato, mocha
			integrations = {
				gitsigns = true,
				mason = true,
				mini = {
					enabled = true,
					indentscope_color = "",
				},
				fzf = true,
			},
		})
		vim.cmd.colorscheme("catppuccin")
	end,
}
