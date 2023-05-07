local status_ok, material = pcall(require, "material")

if not status_ok then
	return
end

material.setup({
	contrast = {
		non_current_windows = true,
		cursor_line = true,
		sidebars = true,
		terminal = true,
	},
	plugins = { -- Uncomment the plugins that you use to highlight them
		-- Available plugins:
		"gitsigns",
		"indent-blankline",
		"nvim-cmp",
		"nvim-navic",
		"nvim-tree",
		"nvim-web-devicons",
		"telescope",
		"trouble",
		"which-key",
	},
	disable = {
		colored_cursor = false, -- Disable the colored cursor
		borders = true, -- Disable borders between verticaly split windows
		background = false, -- Prevent the theme from setting the background (NeoVim then uses your terminal background)
		term_colors = false, -- Prevent the theme from setting terminal colors
		eob_lines = true, -- Hide the end-of-buffer lines
	},
	high_visibility = {
		darker = true, -- Enable higher contrast text for lighter style
	},
	lualine_style = "stealth",
	styles = {
		comments = {
			italic = true,
		},
	},
	custom_colors = function(colors)
		-- colors.syntax.variable = colors.editor.fg
		-- colors.syntax.field = colors.editor.fg
		-- colors.syntax.keyword = colors.main.purple
		-- colors.syntax.value = colors.main.orange
		-- colors.syntax.operator = colors.main.cyan
		-- colors.syntax.fn = colors.main.blue
		-- colors.syntax.string = colors.main.green
		-- colors.syntax.type = colors.main.purple
	end,
})

vim.g.material_style = "darker"
vim.cmd("colorscheme material")

-- tokyonight
-- local status_ok, scheme = pcall(require, "tokyonight")
--
-- if not status_ok then
--   return
-- end
--
-- scheme.setup({
--   style = 'night',
--   dim_inactive = true,
--   transparent = true,
-- })
-- vim.cmd('colorscheme tokyonight')
