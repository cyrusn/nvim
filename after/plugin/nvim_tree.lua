local status_ok, nvim_tree = pcall(require, "nvim-tree")

if not status_ok then
  return
end

-- empty setup using defaults
nvim_tree.setup({
  -- for Project
  -- https://github.com/ahmedkhalf/project.nvim
  update_focused_file = {
    enable = true,
    update_cwd = true,
  },
  diagnostics = {
    enable = true,
    show_on_dirs = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
})
