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
			{ "<leader>aL", icon = { icon = "󰫹", color = "red" } },
			{ "<leader>aM", icon = { icon = "󰫺", color = "red" } },
			{ "<leader>e", icon = { icon = "󰙅", color = "magenta" } },
			{ "<leader>s", group = "session", icon = { icon = "", color = "green" } },
			{ "<leader>/", group = "search" },
			{ "<leader>a", group = "action", icon = { icon = "󱐋", color = "blue" } },
		})
	end,
}
