return {
	"akinsho/bufferline.nvim",
	enabled = true,
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"catppuccin/nvim",
	},
	keys = {
		{ "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
		{ "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
	},
	version = "*",
	opts = function()
		local opts = {
			options = {
				separator_style = "slant",
				always_show_bufferline = true,
				diagnostics = "nvim_lsp",
			},
			highlights = require("catppuccin.groups.integrations.bufferline").get(),
		}
		return opts
	end,
}
