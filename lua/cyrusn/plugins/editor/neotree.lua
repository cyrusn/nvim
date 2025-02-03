return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	keys = {
		{ "<leader>e", "<cmd>Neotree toggle<cr>", desc = "Open Explorer" },
	},
	dependencies = {
		"Gvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
		-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
	},
	config = function()
		require("neo-tree").setup({
			window = {
				width = 30,
				position = "float",
				mappings = {
					["l"] = "open",
					["h"] = "close_node",
					["P"] = { "toggle_preview", config = { use_float = false, use_image_nvim = true } },
				},
			},
			filesystem = {
				follow_current_file = {
					enabled = true,
					leave_dirs_open = true,
				},
			},
			buffers = {
				follow_current_file = {
					enabled = true,
					leave_dirs_open = true,
				},
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
