return {
	"folke/persistence.nvim",
	-- event = "BufReadPre", -- this will only start session saving when an actual file was opened
	keys = {
		{
			"<leader>ww",
			function()
				require("persistence").load()
			end,
			desc = "Load",
		},
		{
			"<leader>ws",
			function()
				require("persistence").select()
			end,
			desc = "Select",
		},
		{
			"<leader>wl",
			function()
				require("persistence").load({ last = true })
			end,
			desc = "Last",
		},
		{
			"<leader>wd",
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
