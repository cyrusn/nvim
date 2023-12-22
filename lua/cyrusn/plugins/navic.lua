return {
	"SmiteshP/nvim-navic",
	dependencies = { "neovim/nvim-lspconfig" },
	opts = function()
		return {
			depth_limit = 5,
			depth_limit_indicator = "..",
			highlight = true,
			separator = " ",
		}
	end,
}
