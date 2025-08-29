return {
	{
		"stevearc/oil.nvim",
		event = "VeryLazy",
		enabled = true,
		dependencies = { { "echasnovski/mini.icons", opts = {} } },
		keys = {
			{ "<leader>e", "<cmd>Oil<cr>", desc = "Open oil explorer" },
		},
		config = function()
			require("oil").setup({
				delete_to_trash = true,
				skip_confirm_for_simple_edits = true,
				view_options = {
					show_hidden = true,
					is_always_hidden = function(name)
						return name == ".." or name == ".git"
					end,
				},
				win_options = {
					signcolumn = "yes:2",
				},
			})
		end,
	},
	{
		"refractalize/oil-git-status.nvim",
		dependencies = {
			"stevearc/oil.nvim",
		},
		config = true,
	},
	{

		"JezerM/oil-lsp-diagnostics.nvim",
		dependencies = { "stevearc/oil.nvim" },
		opts = {},
	},
}
