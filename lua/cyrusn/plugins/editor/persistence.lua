return {
	"folke/persistence.nvim",
	event = "BufReadPre", -- this will only start session saving when an actual file was opened
	keys = {
		{
			"<leader>ss",
			function()
				require("persistence").load()
			end,
			desc = "Load",
		},
		{
			"<leader>sS",
			function()
				require("persistence").select()
			end,
			desc = "Select",
		},
		{
			"<leader>sl",
			function()
				require("persistence").load({ last = true })
			end,
			desc = "Last",
		},
		{
			"<leader>sx",
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
