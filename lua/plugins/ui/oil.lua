return {
	{
		"stevearc/oil.nvim",
		event = "VeryLazy",
		enabled = true,
		dependencies = { { "nvim-tree/nvim-web-devicons", opts = {} } },
		keys = {
			{ "<leader>e", "<cmd>Oil<cr>", desc = "Open Oil explorer" },
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
				keymaps = {
					["<C-s>"] = { "actions.select", opts = { horizontal = true } },
					["<C-v>"] = { "actions.select", opts = { vertical = true } },
					["<C-h>"] = false,
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
