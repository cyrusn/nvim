return {
	"folke/which-key.nvim",
	lazy = false,
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Local Keymaps",
		},
	},
	config = function()
		local wk = require("which-key")
		wk.setup({
			preset = "helix",
			triggers = {
				{ "<auto>", mode = "nixsotc" },
			},
			icons = {
				mappings = false,
			},
		})
		wk.add({
			{ "<leader>c", group = "code" },
			{ "<leader>h", group = "hunk" },
			{ "<leader>w", group = "session" },
			{ "<leader>s", group = "search" },
			{ "<leader>k", group = "find" },
			{ "<leader>u", group = "ui" },
			{ "<leader>b", group = "buffer" },
			{ "<leader>x", group = "trouble" },
			{ "<leader>l", group = "System" },
			{ "gr", group = "LSP" },
		})
	end,
}
