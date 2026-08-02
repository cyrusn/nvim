vim.pack.add({
	"https://github.com/nvim-lualine/lualine.nvim",
	"https://github.com/folke/trouble.nvim",
})

local opts = {
	options = {
		component_separators = "",
	},
	winbar = {
		lualine_a = { "mode" },
		lualine_b = {
			"branch",
			"diff",
			"diagnostics",
		},
		lualine_c = {
			{ "filename", path = 1, file_status = true },
		},
	},
	sections = {
		lualine_a = { "mode" },
		lualine_c = {},
		lualine_x = { "encoding", "filetype" },
		lualine_y = { "progress", "location" },
		lualine_z = {
			function()
				return " " .. os.date("%R")
			end,
		},
	},
	extensions = {
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
