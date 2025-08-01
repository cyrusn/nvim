return {
	"folke/which-key.nvim",
	enabled = true,
	event = "VeryLazy",
	keys = {
		{
			"<leader>a?",
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
		})
		wk.add({
			{ "<leader>c", group = "code" },
			{ "<leader>h", group = "hunk", icon = { icon = "", color = "red" }, mode = { "n", "v" } },
			{ "<leader>al", icon = { icon = "󰫹", color = "red" } },
			{ "<leader>am", icon = { icon = "󰫺", color = "red" } },
			{ "<leader>e", icon = { icon = "󰙅", color = "magenta" } },
			{ "<leader>w", group = "session", icon = { icon = "", color = "green" } },
			{ "<leader>s", group = "search" },
			{ "<leader>a", group = "action", icon = { icon = "󱐋", color = "blue" } },
			{ "<leader>l", group = "harpoon", icon = { icon = "", color = "blue" } },
		})
	end,
}
