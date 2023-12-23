return {
	"stevearc/conform.nvim",
	lazy = true,
	keys = {
		{
			"<leader>f",
			function()
				require("conform").format()
			end,
			desc = "Format",
			mode = { "n", "v" },
		},
	},
	config = function(_, opts)
		local config= require("cyrusn.config")
		opts.formatters_by_ft = config.formatters_by_ft
		opts.formatters= config.formatters

		require("conform").setup(opts)
	end,
}
