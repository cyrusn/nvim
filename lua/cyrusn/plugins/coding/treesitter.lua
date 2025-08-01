return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	config = function()
		require("nvim-treesitter.configs").setup({
			autotag = {
				enable = true,
			},
			ensure_installed = {
				"bash",
				"comment",
				"css",
				"gitcommit",
				"html",
				"javascript",
				"lua",
				"markdown",
				"markdown_inline",
				"go",
				"python",
				"toml",
				"vim",
				"vimdoc",
				"yaml",
				"lua",
				"markdown",
				"json",
			},
			auto_install = true,
			sync_install = true,
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
