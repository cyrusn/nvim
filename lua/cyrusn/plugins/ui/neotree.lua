return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	keys = {
		{ "<leader>e", "<cmd>Neotree toggle<cr>", desc = "Open Explorer" },
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
		-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
	},
	config = function()
		require("neo-tree").setup({
			hide_root_node = true, -- Hide the root node.
			-- retain_hidden_root_indent = true, -- IF the root node is hidden, keep the indentation anyhow.
			auto_clean_after_session_restore = true,
			default_component_configs = {
				git_status = {
					symbols = {
						-- Change type
						added = "✚", -- or "✚", but this is redundant info if you use git_status_colors on the name
						modified = "", -- or "", but this is redundant info if you use git_status_colors on the name
						deleted = "✖", -- this can only be used in the git_status source
						renamed = "󰁕", -- this can only be used in the git_status source
						-- Status type
						untracked = "󰼅",
						ignored = "󰍑",
						unstaged = "󰟙",
						staged = "󰲕",
						conflict = "󰼇",
					},
				},
			},
			open_files_using_relative_paths = true,
			popup_border_style = "rounded", -- "double", "none", "rounded", "shadow", "single" or "solid"
			window = {
				width = 30,
				position = "float",
				mappings = {
					["l"] = "open",
					["h"] = "close_node",
					["P"] = { "toggle_preview", config = { use_float = true, use_image_nvim = true } },
				},
			},
			filesystem = {
				follow_current_file = {
					enabled = true,
					leave_dirs_open = true,
				},
				filtered_items = {
					show_hidden_count = false,
					hide_dotfiles = false,
					visible = false,
				},
			},
			buffers = {
				follow_current_file = {
					enabled = true,
					leave_dirs_open = false,
				},
				show_unloaded = true,
			},
			git_status = {
				follow_current_file = {
					enabled = true,
					leave_dirs_open = true,
				},
			},
		})
	end,
}
