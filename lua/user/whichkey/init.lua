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
  ignore_missing = true,
  window = {
    border = "rounded",       -- none, single, double, shadow
    position = "bottom",      -- bottom, top
    margin = { 0, 0, 0, 0 },  -- extra window margin [top, right, bottom, left]
    padding = { 0, 0, 1, 0 }, -- extra window padding [top, right, bottom, left]
  },
  motions = {
    count = true,
  },
  triggers_blacklist = {
    --  n = { "g" },
    --  v = { "g" },
  },
  key_labels = {
    -- override the label used to display some keys. It doesn"t effect WK in any other way.
    -- For example:
    ["<leader>"] = "SPACE",
    -- ["<cr>"] = "RET",
    -- ["<tab>"] = "TAB",
  },
}

which_key.setup(setup)

local keymapSets = {
  require("user.whichkey.git"),
  require("user.whichkey.basic"),
  require("user.whichkey.lsp"),
  require("user.whichkey.plugins"),
  require("user.whichkey.search"),
  require("user.whichkey.quit"),
  require("user.whichkey.buffers"),
}

RegisterKeymaps = {
  ["<leader>l"] = { name = "LSP" },
  ["<leader>g"] = { name = "Git" },
  ["<leader>s"] = { name = "Search" },
  ["<leader>q"] = { name = "Quit" },
  ["<leader>p"] = { name = "Plugins" },
  ["<leader>b"] = { name = "Buffers" },
}

for _, keymaps in ipairs(keymapSets) do
  for _, values in ipairs(keymaps) do
    local _, key, func, desc = unpack(values)
    RegisterKeymaps[key] = { func, desc }
  end
end

which_key.register(RegisterKeymaps, {
  mode = "n",
})

local git_status_ok, gitsigns = pcall(require, "gitsigns")

if not git_status_ok then
  return
end

which_key.register({
  ["<leader>gr"] = {
    function()
      gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
    end,
    "Reset Hunk",
  },
  ["<leader>gs"] = {
    function()
      gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
    end,
    "Stage Hunk",
  },
}, {
  mode = "v",     -- Visual mode
  buffer = nil,   -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true,  -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true,  -- use `nowait` when creating keymaps
})
