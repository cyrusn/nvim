vim.pack.add({ "https://github.com/nvim-mini/mini.nvim" })

require("mini.sessions").setup({
	directory = vim.fn.stdpath("data") .. "/session",
	autoread = false,
	autowrite = true,
})

vim.api.nvim_create_autocmd("VimLeavePre", {
	group = vim.api.nvim_create_augroup("MiniSessionsAutoSave", { clear = true }),
	callback = function()
		local name = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
		require("mini.sessions").write(name)
	end,
})

vim.keymap.set("n", "<leader>qs", function()
	require("mini.sessions").select()
end, { desc = "Select Session" })

vim.keymap.set("n", "<leader>ql", function()
	local name = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
	require("mini.sessions").read(name)
end, { desc = "Load Project Session" })

vim.keymap.set("n", "<leader>qd", function()
	require("mini.sessions").select("delete")
end, { desc = "Delete Session" })

require("mini.move").setup()

require("mini.basics").setup({
	options = {
		basic = true,
		extra_ui = false,
		win_borders = "default",
	},
	mappings = {
		basic = true,
		option_toggle_prefix = "",
		windows = true,
		move_with_alt = true,
	},
	autocommands = {
		basic = true,
		relnum_in_visual_mode = false,
	},
})
