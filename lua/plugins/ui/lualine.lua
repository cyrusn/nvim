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
			winbar = {
				lualine_c = {
					{ "filetype", icon_only = true, separator = "", padding = { left = 1 } },
					{ "filename", path = 1, file_status = true, separator = "", padding = { left = 0, right = 1 } },
					{
						"diff",
						separator = "",
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
						symbols = { error = "✘ ", warn = " ", hint = " ", info = " " },
					},
				},
				lualine_x = {},
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch" },
				lualine_c = {},
				lualine_x = {},
				lualine_y = {
					{ "progress", separator = "", padding = { left = 1, right = 1 } },
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
				"trouble",
			},
		}

		local trouble = require("trouble")
		local symbols = trouble.statusline({
			mode = "lsp_document_symbols",
			groups = {},
			title = false,
			filter = { range = true },
			format = "{kind_icon}{symbol.name:Normal}",
		})
		table.insert(opts.sections.lualine_c, {
			symbols.get,
			cond = symbols.has,
		})

		require("lualine").setup(opts)
	end,
}
