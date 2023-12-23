return {
	"nvim-tree/nvim-tree.lua",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	cmd = { "NvimTreeToggle", "NvimTreeFocus" },
	keys = {
		{ "<leader>te", "<cmd>NvimTreeToggle<cr>", desc = "Explorer" },
	},
	opts = function()
		local icons = require("cyrusn.config").icons
		return {
			diagnostics = {
				enable = true,
			},
			modified = {
				enable = true,
			},
			filters = {
				dotfiles = false,
				git_ignored = false,
				custom = { ".git", ".DS_Store", "node_modules" },
			},
			disable_netrw = true,
			hijack_netrw = true,
			hijack_cursor = true,
			hijack_unnamed_buffer_when_opening = false,
			sync_root_with_cwd = true,
			update_focused_file = {
				enable = true,
				update_root = false,
			},
			filesystem_watchers = {
				enable = true,
			},
			view = {
				adaptive_size = false,
				preserve_window_proportions = true,
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
}
