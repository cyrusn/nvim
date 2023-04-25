local function keymap(mode, key, func, desc)
  vim.keymap.set(mode, key, func, { desc = desc })
end

-- Shorten function name
--Remap space as leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",


local keymapSets = {
  require("user.keymap.basic"),
  require("user.keymap.leader"),
  require("user.keymap.packer"),
  require("user.keymap.search"),
  require("user.keymap.lsp"),
  require("user.keymap.git"),
}

for _, keymaps in ipairs(keymapSets) do
  for _, values in ipairs(keymaps) do
    local mode, key, func, desc = unpack(values)
    keymap(mode, key, func, desc)
  end
end
