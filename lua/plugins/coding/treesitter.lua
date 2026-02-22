return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	cmd = { "TSUpdate", "TSInstall", "TSLog", "TSUninstall" },
	opts = {},
	init = function()
		local ensure_installed = {
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
		}
		require("nvim-treesitter").install(ensure_installed)
	end,
}
