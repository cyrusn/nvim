return {
	"nvim-telescope/telescope.nvim",
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
	},
	keys = function()
		local builtin = require("telescope.builtin")

		return {
			{ "<leader><space>", builtin.find_files, desc = "Find Files" },
			{ "<C-p>", builtin.git_files, desc = "Find Git Files" },
			{ "<leader>/", builtin.live_grep, desc = "Search Live Grep" },
			-- find
			{ "<leader>?", builtin.current_buffer_fuzzy_find, desc = "Search in Current Buffer" },
			{ "<leader>sr", "<cmd>Telescope oldfiles<cr>", desc = "Search Recent" },
			-- git
			{ "<leader>sg", "<cmd>Telescope git_commits<CR>", desc = "Search Commits" },
			{ "<leader>sG", "<cmd>Telescope git_status<CR>", desc = "Search Status" },
			-- search
			{
				"<leader>si",
				function()
					local word = vim.fn.input("Grep > ")
					builtin.grep_string({ search = word })
				end,
				desc = "Search by Input",
			},
			{ '<leader>s"', "<cmd>Telescope registers<cr>", desc = "Search Registers" },
			{ "<leader>sa", "<cmd>Telescope autocommands<cr>", desc = "Search Auto Commands" },
			{ "<leader>sB", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Fuzzy Search in Buffer" },
			{ "<leader>sb", "<cmd>Telescope buffers<cr>", desc = "Search Buffers" },
			{ "<leader>bs", "<cmd>Telescope buffers<cr>", desc = "Search Buffers" },
			{ "<leader>sc", "<cmd>Telescope command_history<cr>", desc = "Search Command History" },
			{ "<leader>sC", "<cmd>Telescope commands<cr>", desc = "Search Commands" },
			{ "<leader>sd", "<cmd>Telescope diagnostics bufnr=0<cr>", desc = "Search Document diagnostics" },
			{ "<leader>sD", "<cmd>Telescope diagnostics<cr>", desc = "Search Workspace diagnostics" },
			{ "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Search Help Pages" },
			{ "<leader>sH", "<cmd>Telescope highlights<cr>", desc = "Search Highlight Groups" },
			{ "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Search Key Maps" },
			{ "<leader>sM", "<cmd>Telescope man_pages<cr>", desc = "Search Man Pages" },
			{ "<leader>sm", "<cmd>Telescope marks<cr>", desc = "Search Mark" },
			{ "<leader>so", "<cmd>Telescope vim_options<cr>", desc = "Search Options" },
			{ "<leader>sR", "<cmd>Telescope resume<cr>", desc = "Search Resume" },
			{
				"<leader>ss",
				function()
					require("telescope.builtin").lsp_document_symbols()
				end,
				desc = "Symbol",
			},
			{
				"<leader>sS",
				function()
					require("telescope.builtin").lsp_dynamic_workspace_symbols()
				end,
				desc = "Symbol (Workspace)",
			},
		}
	end,
	opts = {
		defaults = {
			file_ignore_patterns = { "node_modules" },
			layout_config = {
				preview_width = 0.5,
			},
		},
	},
}
