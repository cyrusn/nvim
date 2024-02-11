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
				nvimtree = true,
				telescope = { enabled = true },
				which_key = true,
			},
			custom_highlights = function(colors)
				return {
					StatusLineAccent = { bg = colors.blue, fg = colors.mantle },
					StatuslineInsertAccent = { bg = colors.green, fg = colors.base },
					StatuslineVisualAccent = { bg = colors.mauve, fg = colors.base },
					StatuslineReplaceAccent = { bg = colors.red, fg = colors.base },
					StatuslineCmdLineAccent = { bg = colors.peach, fg = colors.base },
					StatuslineTerminalAccent = { bg = colors.green, fg = colors.base },
				}
			end,
		})
		vim.cmd.colorscheme("catppuccin")
	end,
}
