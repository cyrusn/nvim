return {
	"akinsho/bufferline.nvim",
	-- enabled = false,
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	lazy = false,
	config = function()
		require("bufferline").setup({})
	end,
}
