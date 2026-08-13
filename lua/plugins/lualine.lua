vim.pack.add({
	"https://github.com/nvim-lualine/lualine.nvim",
	"https://github.com/folke/trouble.nvim",
})

local clock = function()
	return " " .. os.date("%R")
end

local getFilename = function(highlight)
	return {
		"filename",
		path = 0,
		symbols = { modified = " ●", readonly = " " },
		file_status = true,
		color = function()
			if vim.bo.modified then
				return highlight
			end
		end,
	}
end

local opts = {
	options = {
		component_separators = "",
		always_show_tabline = true,
	},
	winbar = {
		lualine_a = { "mode" },
		lualine_b = { getFilename("lualine_b_replace") },
		lualine_c = {},
		lualine_x = {},
	},
	inactive_winbar = {
		lualine_c = { { "filename", path = 1 } },
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch" },
		lualine_c = {
			getFilename("Error"),
			"diff",
			"diagnostics",
		},
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
table.insert(opts.winbar.lualine_c, {
	symbols.get,
	cond = symbols.has,
})

require("lualine").setup(opts)
