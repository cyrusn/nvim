return {
	"stevearc/oil.nvim",
	opts = {
		delete_to_trash = true,
		keymaps = {
			["l"] = "actions.select",
			["h"] = { "actions.parent", mode = "n" },
			["<ESC>"] = { "actions.close", mode = "n" },
		},
		float = {
			preview_split = "right",
		},
	},
	dependencies = { { "echasnovski/mini.icons", opts = {} } },
	keys = {
		{ "<leader>e", "<cmd>Oil --float<cr>", desc = "Open Oil" },
		{ "<leader>-", "<cmd>Oil --float .<cr>", desc = "Open Oil" },
	},
}
