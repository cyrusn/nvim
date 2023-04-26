local status_ok, nvim_tree = pcall(require, "nvim-tree")

if not status_ok then
  return
end

-- Disable netrw completely at startup
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- empty setup using defaults
nvim_tree.setup({
  -- for Project
  -- https://github.com/ahmedkhalf/project.nvim
  update_focused_file = {
    enable = true,
    update_cwd = false,
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
  filters = {
    custom = {
      '^\\.git$'
    },
  }
})
