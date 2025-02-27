return {
	"catppuccin/nvim",
	enabled = true,
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			flavour = "mocha", -- latte, frappe, macchiato, mocha
			integrations = {
				gitsigns = true,
				mason = true,
				mini = {
					enabled = true,
					indentscope_color = "",
				},
				fzf = true,
				fidget = true,
				snacks = true,
				lsp_trouble = true,
				navic = {
					enabled = true,
					custom_bg = "NONE",
				},
				which_key = true,
			},
		})
		vim.cmd.colorscheme("catppuccin")
	end,
}
