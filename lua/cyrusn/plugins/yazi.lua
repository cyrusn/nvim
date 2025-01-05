return {
	"rolv-apneseth/tfm.nvim",
	enabled = true,
	config = function()
		-- Set keymap so you can open the default terminal file manager (yazi)
		vim.api.nvim_set_keymap("n", "<leader>y", "", {
			noremap = true,
			callback = require("tfm").open,
			desc = "yazi",
		})
	end,
}
