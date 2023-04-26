local status_ok, which_key = pcall(require, "which-key")

if not status_ok then
  return
end

local setup = {
  plugins = {
    marks = false,
    presets = {
      operators = false,    -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = false,      -- adds help for motions
      text_objects = false, -- help for text objects triggered after entering an operator
      windows = true,       -- default bindings on <c-w>
      nav = false,          -- misc bindings to work with windows
      z = false,            -- bindings for folds, spelling and others prefixed with z
      g = false,            -- bindings for prefixed with g
    },
  },
  ignore_missing = false,
  window = {
    border = "rounded",       -- none, single, double, shadow
    position = "bottom",      -- bottom, top
    margin = { 0, 0, 0, 0 },  -- extra window margin [top, right, bottom, left]
    padding = { 0, 0, 0, 0 }, -- extra window padding [top, right, bottom, left]
  },
}
which_key.setup(setup)
which_key.register({
  ["l"] = { name = 'LSP' },
  ["lg"] = { name = 'Go to' },
  ["g"] = { name = 'Git' },
  ["s"] = { name = 'Search' },
  ["p"] = { name = 'Packer' },
}, {
  prefix = '<leader>',
  mode = 'n',
})


which_key.register({
  ["g"] = { name = 'Git' },
}, {
  mode = "v",     -- Visual mode
  prefix = "<leader>",
  buffer = nil,   -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true,  -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true,  -- use `nowait` when creating keymaps
})
