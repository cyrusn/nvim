return {
	"zbirenbaum/copilot-cmp",
	enabled = false,
	config = true,
	dependencies = {
		{
			"zbirenbaum/copilot.lua",
			cmd = "Copilot",
			event = "InsertEnter",
			opts = {
				suggestion = { enabled = false },
				panel = { enabled = false },
			},
		},
	},
}
