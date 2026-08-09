vim.pack.add({
	"https://github.com/nvim-mini/mini.ai",
	"https://github.com/nvim-mini/mini.basics",
	"https://github.com/nvim-mini/mini.move",
	"https://github.com/nvim-mini/mini.sessions",
	"https://github.com/nvim-mini/mini.trailspace",
})

local mini_sessions_opts = {
	directory = vim.fn.stdpath("data") .. "/session",
	autoread = false,
	autowrite = true,
}

vim.api.nvim_create_autocmd("VimLeavePre", {
	group = vim.api.nvim_create_augroup("MiniSessionsAutoSave", { clear = true }),
	callback = function()
		local name = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
		require("mini.sessions").write(name)
	end,
})

vim.keymap.set(
	"n",
	"<leader>ql",
	"<cmd>lua MiniSessions.read(vim.fn.fnamemodify(vim.fn.getcwd(), ':t'))<cr>",
	{ desc = "Load Project Session" }
)
vim.keymap.set("n", "<leader>qs", "<cmd>lua MiniSessions.select()<cr>", { desc = "Select Session" })
vim.keymap.set("n", "<leader>qd", '<cmd>lua MiniSessions.select("delete")<cr>', { desc = "Delete Session" })

local mini_basics_opts = {
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
}

require("mini.ai").setup()
require("mini.basics").setup(mini_basics_opts)
require("mini.move").setup()
require("mini.sessions").setup(mini_sessions_opts)
require("mini.trailspace").setup()
