return {
	"nvim-treesitter/nvim-treesitter",
	-- enabled = false,
	event = "VeryLazy",
	build = ":TSUpdate",
	cmd = { "TSUpdate", "TSInstall", "TSLog", "TSUninstall" },
	config = function()
		require("nvim-treesitter.config").setup({
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
