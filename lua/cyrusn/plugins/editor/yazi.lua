return {
	"mikavilpas/yazi.nvim",
	enabled = true,
	event = "VeryLazy",
	keys = {
		-- 👇 in this section, choose your own keymappings!
		{
			"<leader>e",
			"<cmd>Yazi<cr>",
			desc = "Open yazi at the current file",
		},
		{
			-- Open in the current working directory
			"<leader>y",
			"<cmd>Yazi cwd<cr>",
			desc = "Open the file manager",
		},
	},
	opts = {
		-- if you want to open yazi instead of netrw, see below for more info
		open_for_directories = true,
		keymaps = {
			show_help = "<f1>",
		},
	},
}
