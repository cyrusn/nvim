return {
	"nvim-lualine/lualine.nvim",
	enabled = true,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local opts = {
			options = {
				theme = "catppuccin",
				icons_enabled = true,
				component_separators = "",
				section_separators = { left = "", right = "" },
			},
			winbar = {
				lualine_b = { { "filename", path = 4 } },
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = {
					"branch",
					"diff",
					"diagnostics",
				},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {
					"encoding",
					"filetype",
				},
				lualine_z = {
					{ "progress", separator = " ", padding = { left = 1, right = 0 } },
					{ "location", padding = { left = 0, right = 1 } },
				},
			},
			extensions = {
				"fzf",
				"lazy",
				"mason",
				"oil",
				"trouble",
			},
		}

		require("lualine").setup(opts)
	end,
}
