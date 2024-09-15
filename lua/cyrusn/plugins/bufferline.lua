return {
	"akinsho/bufferline.nvim",
	enabled = false,
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"catppuccin/nvim",
	},
	keys = {
		{ "<leader>X", "<Cmd>BufferLineCloseOthers<CR>", desc = "Close Other Buffers" },
		{ "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
		{ "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
	},
	version = "*",
	opts = function()
		local opts = {
			options = {
				separator_style = "slant",
				always_show_bufferline = false,
				diagnostics = "nvim_lsp",
				offsets = {
					{
						filetype = "NvimTree",
						text = "File Explorer",
						highlight = "Directory",
						separator = true, -- use a "true" to enable the default, or set your own character
					},
				},
			},
			highlights = require("catppuccin.groups.integrations.bufferline").get(),
		}
		return opts
	end,
}
