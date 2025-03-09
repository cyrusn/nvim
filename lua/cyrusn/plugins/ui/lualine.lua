return {
	"nvim-lualine/lualine.nvim",
	enabled = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"lewis6991/gitsigns.nvim",
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
						source = function()
							local git_info = vim.b.gitsigns_status_dict
							if not git_info or git_info.head == "" then
								return nil
							end
							return {
								added = git_info.added,
								modified = git_info.changed,
								removed = git_info.removed,
							}
						end,
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
				"lazy",
				"mason",
			},
		}

		require("lualine").setup(opts)
	end,
}
