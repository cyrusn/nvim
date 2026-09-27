vim.pack.add({ "https://github.com/stevearc/oil.nvim" })

require("oil").setup({
	default_file_explorer = false,
})

vim.keymap.set("n", "<leader>O", "<cmd>Oil<cr>", { desc = "Oil Explorer" })
