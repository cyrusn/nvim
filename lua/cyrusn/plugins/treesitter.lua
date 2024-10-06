return {
	"nvim-treesitter/nvim-treesitter",
	config = function()
		local config = require("cyrusn.config").treesitter

		require("nvim-treesitter.configs").setup({
			autotag = {
				enable = true,
			},
			ensure_installed = config.ensure_installed,
      auto_install = true,
			sync_install = false,
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
