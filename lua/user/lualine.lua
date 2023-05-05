local status_ok, lualine = pcall(require, "lualine")

if not status_ok then
	return
end

local navic = require("nvim-navic")
local noice = require("noice")
local colors = require("material.colors")

local formatIcons = function(icons)
	local result = {}

	for key, value in pairs(icons) do
		result[key] = string.format("%s ", value)
	end

	return result
end

local diagnostics = {
	"diagnostics",
	sources = { "nvim_diagnostic" },
	sections = { "error", "warn", "info", "hint" },
	symbols = formatIcons(require("user.icons").diagnostics),
	colored = true,
	update_in_insert = false,
}

local filename = {
	"filename",
	path = 1,
	separator = " ",
}

local navic_location = {
	"navic",
	function()
		return navic.get_location()
	end,
	cond = function()
		return package.loaded["nvim-navic"] and navic.is_available()
	end,
}

local datetime = {
	"datetime",
	style = " %H:%M:%S",
}

local buffers = {
	"buffers",
	symbols = {
		alternate_file = "", -- Text to show to identify the alternate file
	},
}

local diff = {
	"diff",
	symbols = formatIcons(require("user.icons").git_status),
}

local noice_command = {
	function()
		return noice.api.status.command.get()
	end,
	cond = function()
		return package.loaded["noice"] and noice.api.status.command.has()
	end,
	color = {
		fg = colors.editor.accent,
		bg = colors.editor.bg,
	},
}

lualine.setup({
	options = {
		icons_enabled = true,
		theme = "auto",
		disabled_filetypes = { "alpha", "dashboard", "Outline" },
		always_divide_middle = true,
		globalstatus = true,
		section_separators = "",
		component_separators = "•",
	},
	inactive_sections = {
		lualine_a = { filename },
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {
		lualine_a = { buffers },
		lualine_b = {},
		lualine_c = {},
		lualine_x = { diagnostics, diff },
		lualine_y = {
			{
				"filetype",
				colored = false,
				icons_enabled = false,
				separator = " ",
				padding = { left = 1, right = 0 },
			},
			{
				"encoding",
				padding = { left = 0, right = 1 },
			},
		},
		lualine_z = {},
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch" },
		lualine_c = {
			filename,
			navic_location,
		},
		lualine_x = { noice_command },
		lualine_y = {
			{
				"progress",
				separator = " ",
				padding = { left = 1, right = 0 },
			},
			{
				"location",
				padding = { left = 0, right = 1 },
			},
		},
		lualine_z = {
			datetime,
		},
	},
	extensions = { "toggleterm", "nvim-tree", "trouble" },
	winbar = {},
})
