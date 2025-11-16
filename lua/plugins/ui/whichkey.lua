return {
	"folke/which-key.nvim",
	-- enabled = false,
	event = "VeryLazy",
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
			{ "<leader>k", group = "search" },
			{ "<leader>u", group = "ui" },
			{ "<leader>b", group = "buffer" },
		})
	end,
}
