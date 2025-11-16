return {
	"folke/persistence.nvim",
	-- event = "BufReadPre", -- this will only start session saving when an actual file was opened
	keys = {
		{
			"<leader>q",
			"",
			desc = "+session",
		},
		{
			"<leader>qw",
			function()
				require("persistence").load()
			end,
			desc = "Load",
		},
		{
			"<leader>qs",
			function()
				require("persistence").select()
			end,
			desc = "Select",
		},
		{
			"<leader>ql",
			function()
				require("persistence").load({ last = true })
			end,
			desc = "Last",
		},
		{
			"<leader>q",
			function()
				require("persistence").stop()
			end,
			desc = "Stop",
		},
	},
	opts = {
		-- add any custom options here
	},
}
