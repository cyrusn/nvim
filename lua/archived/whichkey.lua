vim.pack.add({ "https://github.com/folke/which-key.nvim" })

vim.keymap.set(
	"n",
	"<leader>?",
	'<cmd>lua require("which-key").show({ global = false })<cr>',
	{ desc = "Local Keymaps" }
)

local wk = require("which-key")
wk.add({
	{ "<leader>c", group = "Code" },
	{ "<leader>g", group = "Git" },
	{ "<leader>q", group = "Session" },
	{ "<leader>s", group = "Search" },
	{ "<leader>f", group = "Find" },
	{ "<leader>u", group = "UI" },
	{ "<leader>b", group = "Buffer" },
	{ "<leader>x", group = "Trouble" },
	{ "<leader>l", group = "System" },
	{ "<leader>a", group = "AI" },
	{ "<leader>sh", group = "Search History" },
	{ "<leader>sg", group = "Search Git" },
	{ "<leader>s/", group = "Grep" },
	{ "gr", group = "LSP" },
})

require("which-key").setup({
	preset = "helix",
	triggers = {
		{ "<auto>", mode = "nixsotc" },
	},
	icons = { mappings = false },
})
