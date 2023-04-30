-- Shorten function name
--Remap space as leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymapSets = {
  require("user.keymap.basic"),
  require("user.keymap.terminal"),
  require("user.keymap.lsp"),
}

for _, keymaps in ipairs(keymapSets) do
  for _, values in ipairs(keymaps) do
    local mode, key, func, desc = unpack(values)
    vim.keymap.set(mode, key, func, { desc = desc })
  end
end
