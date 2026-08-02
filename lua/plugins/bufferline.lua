vim.pack.add({ "https://github.com/akinsho/bufferline.nvim" })
vim.pack.add({ "https://github.com/catppuccin/nvim" })

local bufferline = require("bufferline")

bufferline.setup({
	options = {
		separator_style = "slant",
	},
})
