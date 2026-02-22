return {
	"folke/which-key.nvim",
	lazy = false,
	keys = {
		{ "<leader>?", '<cmd>require("which-key").show({ global = false })<cr>', desc = "Local Keymaps" },
	},
	opts = {
		preset = "helix",
		triggers = {
			{ "<auto>", mode = "nixsotc" },
		},
		icons = {
			mappings = false,
		},
	},
	init = function()
		local wk = require("which-key")
		wk.add({
			{ "<leader>c", group = "code" },
			{ "<leader>g", group = "git" },
			{ "<leader>w", group = "session" },
			{ "<leader>s", group = "search" },
			{ "<leader>f", group = "find" },
			{ "<leader>u", group = "ui" },
			{ "<leader>b", group = "buffer" },
			{ "<leader>x", group = "trouble" },
			{ "<leader>l", group = "System" },
			{ "gr", group = "LSP" },
		})
	end,
}
