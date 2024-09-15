return {
	"nvim-telescope/telescope.nvim",
	enabled = false,
	lazy = false,
	build = "make",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			config = function()
				require("telescope").load_extension("fzf")
			end,
		},
		{
			"jemag/telescope-diff.nvim",
			config = function()
				require("telescope").load_extension("diff")
				vim.api.nvim_create_user_command("DiffCurrent", function()
					require("telescope").extensions.diff.diff_current({ hidden = true })
				end, {})
				vim.api.nvim_create_user_command("Diff2Files", function()
					require("telescope").extensions.diff.diff_files({ hidden = true })
				end, {})
			end,
		},
	},
	keys = {
		{ "<C-p>", "<cmd> Telescope git_files<CR>", desc = "Find Git Files" },
		{ "<leader><space>", "<cmd>Telescope find_files<cr>", desc = "Find Files" },

		{ "<leader>p", "<cmd>lua require('telescope.builtin').find_files({no_ignore=true})<cr>", desc = "Find Files" },
    { "<leader>/", "<cmd>Telescope live_grep<CR>", desc = "Search Live Grep" },
		{ "<leader>sw", "<cmd>Telescope grep_string<CR>", desc = "Search String Under Cursor" },
		{ "<leader>sG", "<cmd>Telescope git_commits<CR>", desc = "Search Git Commits" },
		{ "<leader>sg", "<cmd>Telescope git_status<CR>", desc = "Search Git Status" },
		{ '<leader>s"', "<cmd>Telescope registers<cr>", desc = "Search Registers" },
		{ "<leader>sc", "<cmd>Telescope commands<cr>", desc = "Search Commands" },
		{ "<leader>sC", "<cmd>Telescope command_history<cr>", desc = "Search Command History" },
		{ "<leader>sa", "<cmd>Telescope autocommands<cr>", desc = "Search Auto Commands" },
		{ "<leader>sb", "<cmd>Telescope buffers<cr>", desc = "Search Buffers" },
		{ "<leader>bs", "<cmd>Telescope buffers<cr>", desc = "Search Buffers" },
		{ "<leader>sd", "<cmd>Telescope diagnostics<cr>", desc = "Search Workspace diagnostics" },
		{ "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Search Help Pages" },
		{ "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Search Key Maps" },
	},
	opts = {
		defaults = {
			file_ignore_patterns = { "node_modules" },
		},
	},
}
