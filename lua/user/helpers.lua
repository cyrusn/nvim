local helpers = {}

function helpers.keymap(mode, key, func, desc)
  vim.keymap.set(mode, key, func, { desc = desc })
end

return helpers
