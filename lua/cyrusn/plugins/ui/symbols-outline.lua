return {
	"simrat39/symbols-outline.nvim",
	keys = { { "<leader>ts", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
	cmd = "SymbolsOutline",
	opts = function()
		local config = require("cyrusn.config")
		local defaults = require("symbols-outline.config").defaults
		local opts = {
			symbols = {},
			symbol_blacklist = {},
		}

		for kind, symbol in pairs(defaults.symbols) do
			opts.symbols[kind] = {
				icon = config.icons.kinds[kind] or symbol.icon,
				hl = symbol.hl,
			}
		end
		return opts
	end,
}
