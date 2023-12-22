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
		local formatters = require("cyrusn.config").formatters
		opts.formatters_by_ft = formatters

		require("conform").setup(opts)
	end,
}
