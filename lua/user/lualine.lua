local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  return
end

local diagnostics = {
  "diagnostics",
  sources = { "nvim_diagnostic" },
  sections = { "error", "warn", "info", "hint" },
  symbols = {
    hint = " ",
    info = " ",
    warning = " ",
    error = " ",
  },
  colored = true,
  update_in_insert = false,
}

local filename = {
  'filename',
  path = 1,
}

local datetime = {
  'datetime',
  style = ' %H:%M:%S',
}

local buffers = {
  'buffers',
  symbols = {
    alternate_file = '', -- Text to show to identify the alternate file
  },
}

local navic = require("nvim-navic")

lualine.setup({
  options = {
    icons_enabled = true,
    theme = "auto",
    disabled_filetypes = { "alpha", "dashboard", "Outline" },
    always_divide_middle = true,
    globalstatus = true,
    -- section_separators = '',
    -- component_separators = ''
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { "filename" },
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { buffers },
    lualine_x = { diagnostics, 'diff' },
    lualine_y = {},
    lualine_z = {}
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch" },
    lualine_c = {
      'diagnostics', 'filetype', filename, {
      'navic',
      function()
        return navic.get_location()
      end,
      cond = function()
        return package.loaded["nvim-navic"] and navic.is_available()
      end
    } },
    lualine_x = { 'encoding' },
    lualine_y = {
      {
        "progress",
        separator = " ",
        padding = { left = 1, right = 0 }
      },
      {
        "location",
        padding = { left = 0, right = 1 }
      },
    },
    lualine_z = {
      datetime
    },
  },
  extensions = { 'toggleterm', 'nvim-tree', 'trouble' },
  winbar = {},
})
