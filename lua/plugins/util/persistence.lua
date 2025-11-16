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
			"<leader>qs",
			function()
				require("persistence").load()
			end,
			desc = "Load",
		},
		{
			"<leader>qS",
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
			"<leader>qd",
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
