vim.pack.add({ "https://github.com/folke/noice.nvim" })

require("noice").setup({
	cmdline = { enabled = false },
	messages = { enabled = false },
	views = { mini = { position = { row = -2 } } },
})
