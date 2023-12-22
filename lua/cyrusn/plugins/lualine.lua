return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	opts = function()
		local icons = require("cyrusn.config").icons
		local diagnostics_icons = icons.diagnostics
		local diff_icons = icons.diff

		return {
			options = {
				theme = "auto",
				icons_enabled = true,
				component_separators = "",
				section_separators = { left = "", right = "" },
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = {
					"branch",
					{ "diff", symbols = diff_icons },
					{
						"diagnostics",
						symbols = diagnostics_icons,
					},
				},
				lualine_c = {
					{ "filename", path = 4 },
					{ "navic" },
				},
				lualine_x = {
					-- {
					-- 	require("noice").api.status.command.get,
					-- 	cond = require("noice").api.status.command.has,
					-- 	color = { fg = "#ff9e64" },
					-- },
					{
						require("lazy.status").updates,
						cond = require("lazy.status").has_updates,
						color = { fg = "#ff9e64" },
					},
					"encoding",
					"filetype",
					"selectioncount",
				},
				lualine_y = {
					"progress",
				},
				lualine_z = {
					"location",
				},
			},
			extensions = {

				"neo-tree",
				"lazy",
			},
		}
	end,
}
