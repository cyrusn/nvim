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
		{ "<A-h>", "<cmd>BufferLineMovePrev<cr>", desc = "Move Buffer to left" },
		{ "<A-l>", "<cmd>BufferLineMoveNext<cr>", desc = "Move Buffer to right" },
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
