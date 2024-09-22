return {
	"nvim-tree/nvim-tree.lua",
	enabled = false,
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	cmd = { "NvimTreeToggle", "NvimTreeFocus" },
	keys = {
		{ "<leader>te", "<cmd>NvimTreeToggle<cr>", desc = "Toggle Explorer" },
		{ "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Toggle Explorer" },
	},
	opts = function()
		local icons = require("cyrusn.config").icons
		return {
			hijack_cursor = true,
			disable_netrw = true,
			hijack_netrw = true,
			view = {
				width = 25,
				adaptive_size = false,
				preserve_window_proportions = true,
			},
			diagnostics = {
				enable = true,
			},
			modified = {
				enable = true,
			},
			filters = {
				dotfiles = false,
				git_ignored = false,
				custom = { "^\\.git", "^\\.DS_Store", "node_modules" },
			},
			sync_root_with_cwd = true,
			update_focused_file = {
				enable = true,
				update_root = true,
			},
			respect_buf_cwd = true,
			filesystem_watchers = {
				enable = true,
			},
			renderer = {
				root_folder_label = false,
				highlight_git = true,
				highlight_modified = "all",
				highlight_diagnostics = true,
				indent_markers = {
					enable = true,
				},
				icons = {
					show = {
						file = true,
						folder = true,
						folder_arrow = true,
						git = true,
						modified = true,
						diagnostics = true,
					},
					glyphs = {
						default = icons.misc.default,
						symlink = icons.misc.symlink,
						folder = icons.folder,
						git = icons.git,
					},
				},
			},
		}
	end,
	config = function(_, opts)
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1
		require("nvim-tree").setup(opts)
	end,
}
