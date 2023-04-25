local status_ok, bufferline = pcall(require, "bufferline")

if not status_ok then
  return
end

local setup = {
  options = {
    numbers = "none",
    themable = true,
    modified_icon = '●',
    close_icon = '',
    left_trunc_marker = '',
    indicator = { style = "icon", icon = "▎" },
    right_trunc_marker = '',
    diagnostics = 'nvim_lsp',
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        text_align = "center",
        separator = false
      }
    },
    show_tab_indicators = true,
  },
}

bufferline.setup(setup)
