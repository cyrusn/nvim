return {
	"stevearc/conform.nvim",
	lazy = false,
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
	opts = function()
		local config = require("cyrusn.config")
		return {
			formatters_by_ft = config.formatters_by_ft,
			formatters = config.formatters,
			format_on_save = {
				-- These options will be passed to conform.format()
				timeout_ms = 500,
				lsp_fallback = true,
			},
		}
	end,
}
