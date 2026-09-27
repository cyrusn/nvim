local MiniFiles = require("mini.files")
MiniFiles.setup({
	mappings = {
		go_in = "L",
		go_in_plus = "l",
		go_out = "H",
		go_out_plus = "h",
	},

	windows = {
		preview = true,
		width_focus = 25,
		width_nofocus = 15,
		width_preview = 60,
	},
})

vim.keymap.set("n", "<leader>e", function()
	MiniFiles.open(vim.api.nvim_buf_get_name(0))
end, { desc = "Explorer" })
