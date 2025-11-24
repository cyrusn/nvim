return {
	"nvim-lualine/lualine.nvim",
	-- enabled = false,
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"lewis6991/gitsigns.nvim",
	},
	config = function()
		local opts = {
			options = {
				theme = "auto",
				icons_enabled = true,
				component_separators = "",
				section_separators = { left = "", right = "" },
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = {
					"branch",
				},
				lualine_c = {
					{
						"diagnostics",
						symbols = {
							error = "✘ ",
							warn = " ",
							hint = " ",
							info = " ",
						},
					},
					{ "filename", path = 1, file_status = true, separator = "", padding = { left = 1 } },
					{ "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
				},
				lualine_x = {
					-- {
					-- 	require("noice").api.status.command.get,
					-- 	cond = require("noice").api.status.command.has,
					-- 	color = { fg = "#ff9e64" },
					-- },
					-- {
					-- 	require("noice").api.status.mode.get,
					-- 	cond = require("noice").api.status.mode.has,
					-- 	color = { fg = "#ff9e64" },
					-- },
					-- {
					-- 	require("noice").api.status.search.get,
					-- 	cond = require("noice").api.status.search.has,
					-- 	color = { fg = "#ff9e64" },
					-- },
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
					-- "encoding",
				},
				lualine_y = {
					{ "progress", separator = "", padding = { left = 1, right = 0 } },
					{ "location", padding = { left = 0, right = 1 } },
				},
				lualine_z = {
					function()
						return " " .. os.date("%R")
					end,
				},
			},
			extensions = {
				"lazy",
				"mason",
				"oil",
			},
		}

		require("lualine").setup(opts)
	end,
}
