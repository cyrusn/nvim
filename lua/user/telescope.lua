local status_ok, telescope = pcall(require, "telescope")

if not status_ok then
  return
end

telescope.setup {
  defaults = {
    path_display = { "smart" },
  },
  extensions = {
    undo = {},
  },
}

telescope.load_extension("undo")
