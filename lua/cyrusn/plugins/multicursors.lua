-- lazy.nvim:
return {
	"smoka7/multicursors.nvim",
	enabled = false,
	event = "VeryLazy",
	dependencies = {
		"smoka7/hydra.nvim",
	},
	opts = {},
	cmd = { "MCstart", "MCvisual", "MCclear", "MCpattern", "MCvisualPattern", "MCunderCursor" },
	keys = {
		{
			mode = { "v", "n" },
			"<Leader>mc",
			"<cmd>MCunderCursor<cr>",
			desc = "Select the char under the cursor",
		},
		{
			mode = { "v", "n" },
			"<Leader>me",
			"<cmd>MCstart<cr>",
			desc = "Select word under the cursor",
		},
	},
}
