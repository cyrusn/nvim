return {
	"folke/persistence.nvim",
	event = "BufReadPre", -- this will only start session saving when an actual file was opened
	keys = {
		-- load the session for the current directory
		{
			"<leader>ws",
			function()
				require("persistence").load()
			end,
			desc = "Load Session",
		},
		{
			"<leader>sw",
			function()
				require("persistence").select()
			end,
			desc = "List Session",
		},
		{
			"<leader>wl",
			function()
				require("persistence").load({ last = true })
			end,
			desc = "Load Last Session",
		},
		{
			"<leader>wd",
			function()
				require("persistence").stop()
			end,
			desc = "Stop Session",
		},
	},
	opts = {
		-- add any custom options here
	},
}
