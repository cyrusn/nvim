return {
	"nvim-lualine/lualine.nvim",
	enabled = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local opts = {
			options = {
				theme = "auto",
				icons_enabled = true,
				component_separators = "",
				section_separators = { left = "", right = "" },
			},
			winbar = {
				lualine_b = {
					{ "filename", path = 5 },
					{
						"diff",
						symbols = {
							added = " ",
							modified = " ",
							removed = " ",
						},
					},
					{
						"diagnostics",
						symbols = {
							error = "✘ ",
							warn = " ",
							hint = " ",
							info = " ",
						},
					},
				},
				lualine_y = {},
				lualine_z = {
					function()
						return " " .. os.date("%Y-%m-%d %R")
					end,
				},
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = {
					"branch",
				},
				lualine_c = {
					{ "filename", path = 1 },
				},
				lualine_x = {},
				lualine_y = {
					"encoding",
					"filetype",
					"filesize",
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
