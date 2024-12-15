return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Buffer Local Keymaps",
		},
	},
	config = function()
		local wk = require("which-key")
		wk.setup({
			preset = "helix",
		})
		wk.add({
			{ "<leader>c", group = "code" },
			{ "<leader>s", group = "search" },
			{ "<leader>h", group = "hunk" },
		})
	end,
}
