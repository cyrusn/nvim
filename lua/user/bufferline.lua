local status_ok, bufferline = pcall(require, "bufferline")

if not status_ok then
  return
end

local setup = {
  options = {
    diagnostics = 'nvim_lsp',
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        text_align = "center",
        separator = false
      }
    },
  },
}

bufferline.setup(setup)
