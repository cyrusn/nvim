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
			triggers = {
				{ "<auto>", mode = "nixsotc" },
				{ "m", mode = { "n", "v" } },
			},
		})
		wk.add({
			{ "<leader>c", group = "code" },
			{ "<leader>h", group = "hunk", icon = { icon = "", color = "red" }, mode = { "n", "v" } },
			{ "<leader>t", group = "trouble", icon = "T" },
			{ "<leader>L", icon = { icon = "󰫹", color = "red" } },
			{ "<leader>M", icon = { icon = "󰫺", color = "red" } },
			{ "<leader>e", icon = { icon = "󰙅", color = "blue" } },
			{ "<leader>w", group = "session", icon = { icon = "", color = "green" } },
			-- { "<leader>y", icon = { icon = "󰇥", color = "yellow" } },
		})
	end,
}
