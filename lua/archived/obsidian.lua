vim.pack.add({
	{
		src = "https://github.com/obsidian-nvim/obsidian.nvim",
		version = vim.version.range("*"), -- use latest release, remove to use latest commit
	},
})

vim.keymap.set("n", "<leader>o", "<cmd>Obsidian<cr>", { desc = "Obsidian" })

require("obsidian").setup({
	legacy_commands = false,
	daily_notes = {
		enabled = true,
		folder = "Diary",
		date_format = "/YYYY/MM/YYYY-MM-DD",
	},
	workspaces = {
		{
			name = "Note",
			path = "~/Dropbox/Obsidian/Notes/Note",
		},
	},
	picker = {
		name = "snacks.picker",
	},
})
