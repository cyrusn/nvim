vim.pack.add({
	"https://github.com/nvim-lualine/lualine.nvim",
	"https://github.com/folke/trouble.nvim",
})

local lualine_a = { "mode" }
local lualine_b = { "branch", "diff", "diagnostics" }
local clock = function()
	return " " .. os.date("%R")
end

local opts = {
	options = {
		component_separators = "",
	},
	winbar = {
		lualine_a = lualine_a,
		lualine_b = lualine_b,
		lualine_c = {
			{ "filename", path = 1, file_status = true },
		},
	},
	sections = {
		lualine_a = lualine_a,
		lualine_b = lualine_b,
		lualine_c = {},
		lualine_x = { "encoding", "filetype" },
		lualine_y = { "progress", "location" },
		lualine_z = { clock },
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
