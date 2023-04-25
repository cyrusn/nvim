local status_ok, lualine = pcall(require, "lualine")

if not status_ok then
  return
end

local hide_in_width = function()
  return vim.fn.winwidth(0) > 80
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
  always_visible = true,
}

local diff = {
  "diff",
  colored = false,
  symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
  cond = hide_in_width
}

local mode = {
  "mode",
}

local filetype = {
  "filetype",
  icons_enabled = false,
  icon = nil,
}

local branch = {
  "branch",
  icons_enabled = true,
  icon = "",
}

local location = {
  "location",
  cond = hide_in_width,
  padding = 0,
}

local filename = {
  'filename',
  path = 1,
  fmt  = function(str)
    return './' .. str:gsub(vim.fn.getcwd(), '.')
  end,
}

local hostname = {
  'hostname',
  cond = hide_in_width,
}

local datetime = {
  'datetime',
  style = '%H:%M:%S',
}

-- cool function for progress
--[[

local progress = function()
  local current_line = vim.fn.line(".")
  local total_lines = vim.fn.line("$")
  local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
  local line_ratio = current_line / total_lines
  local index = math.ceil(line_ratio * #chars)
  return chars[index]
end

local spaces = function()
  return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
end
--]]
lualine.setup({
  options = {
    icons_enabled = true,
    theme = "auto",
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    disabled_filetypes = { "alpha", "dashboard", "Outline", "NvimTree" },
    always_divide_middle = true,
  },
  sections = {
    lualine_a = { datetime, mode },
    lualine_b = { branch, },
    lualine_c = {},
    lualine_x = {},
    lualine_y = { diagnostics, diff, "encoding", filetype },
    lualine_z = { location },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { "filename" },
    lualine_x = { "location" },
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  extensions = {},
  winbar = {
    -- lualine_a = { datetime },
    -- lualine_b = { filename },
    -- lualine_c = {},
    -- lualine_x = { diagnostics },
    -- lualine_y = {},
    -- lualine_z = { hostname }
  }
})
