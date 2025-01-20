return {
	"folke/which-key.nvim",
	enabled = true,
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
			{ "<leader>h", group = "hunk", icon = { icon = "", color = "red" }, mode = { "n", "v" } },
			{ "<leader>t", group = "trouble", icon = "T" },
			{ "<leader>L", icon = { icon = "󰫹", color = "red" } },
			{ "<leader>M", icon = { icon = "󰫺", color = "red" } },
			{ "<leader>e", icon = { icon = "󰙅", color = "blue" } },
			-- { "<leader>y", icon = { icon = "󰇥", color = "yellow" } },
		})
	end,
}
