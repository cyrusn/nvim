local mini_diff_opts = {
	view = {
		style = "sign",
		signs = { add = "+", change = "~", delete = "-" },
	},
	mappings = {
		apply = "<leader>gs",
		reset = "<leader>gr",
		textobject = "ih",
		goto_prev = "[h",
		goto_next = "]h",
		goto_first = "[H",
		goto_last = "]H",
	},
}

require("mini.git").setup()
require("mini.diff").setup(mini_diff_opts)

vim.keymap.set("n", "<leader>gS", "<cmd>Git add %<cr>", { desc = "Stage Buffer" })
vim.keymap.set("n", "<leader>gR", "<cmd>Git restore --worktree -- %<cr>", { desc = "Reset Buffer" })
vim.keymap.set("n", "<leader>gu", "<cmd>Git restore --staged -- %<cr>", { desc = "Unstage Buffer" })
vim.keymap.set("n", "<leader>gp", require("mini.diff").toggle_overlay, { desc = "Toggle Hunk Overlay" })
vim.keymap.set("n", "<leader>gd", "<cmd>Git diff -- %<cr>", { desc = "Diff Buffer" })
vim.keymap.set("n", "<leader>gD", "<cmd>Git diff --cached -- %<cr>", { desc = "Diff Staged Buffer" })
vim.keymap.set("n", "<leader>gB", "<cmd>vertical Git blame -- %<cr>", { desc = "Blame Buffer" })

vim.keymap.set("n", "<leader>gs", function()
	return require("mini.diff").operator("apply") .. "ih"
end, { expr = true, desc = "Stage Hunk" })
vim.keymap.set("n", "<leader>gr", function()
	return require("mini.diff").operator("reset") .. "ih"
end, { expr = true, desc = "Reset Hunk" })
