return {
	"nvim-treesitter/nvim-treesitter",
	event = "VeryLazy",
	build = ":TSUpdate",
	cmd = { "TSUpdate", "TSInstall", "TSLog", "TSUninstall" },
	config = function()
		require("nvim-treesitter.configs").setup({
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
		})
	end,
}
