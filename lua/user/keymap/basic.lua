-- https://github.com/ThePrimeagen/init.lua/blob/master/lua/theprimeagen/remap.lua

return {
  -- zz will redraw the cursor in the middle of window
  { "n", "<C-d>",     "<C-d>zz" },
  { "n", "<C-u>",     "<C-u>zz" },
  { "n", "n",         "nzzzv" },
  { "n", "N",         "Nzzzv" },
  { "n", "<C-k>",     "<cmd>cnext<CR>zz" },
  { "n", "<C-j>",     "<cmd>cprev<CR>zz" },
  -- { "n", "<leader>k", "<cmd>lnext<CR>zz",       "Next Location" },
  -- { "n", "<leader>j", "<cmd>lprev<CR>zz",       "Prev Location" },
  { 'n', 'j',         'jzzzj' },
  { 'n', 'k',         'kzzzk' },

  -- Suggested by theprimeagen, delete and paste in visual mode will not copy
  { "v", "p",         [["_dP]] },
  { "x", "p",         [["_dP]] },

  -- Normal --
  -- Better window navigation
  { "n", "<C-h>",     "<C-w>h" },
  { "n", "<C-j>",     "<C-w>j" },
  { "n", "<C-k>",     "<C-w>k" },
  { "n", "<C-l>",     "<C-w>l" },

  -- Resize with arrows
  { "n", "<C-Up>",    ":resize -2<CR>" },
  { "n", "<C-Down>",  ":resize +2<CR>" },
  { "n", "<C-Left>",  ":vertical resize -2<CR>" },
  { "n", "<C-Right>", ":vertical resize +2<CR>" },

  -- Navigate buffers
  { "n", "<S-l>",     ":bnext<CR>" },
  { "n", "<S-h>",     ":bprevious<CR>" },

  { 't', '<esc>',     [[<C-\><C-n>]],            "Terminal" },
  -- Visual --
  -- Stay in indent mode
  -- { "v", "<",         "<gv" },
  -- { "v", ">",         ">gv" },

  -- Move text up and down
  --
  { "i", "<A-j>",     "<esc><cmd>m .+1<cr>==gi", "Move down" },
  { "i", "<A-k>",     "<esc><cmd>m .-2<cr>==gi", "Move up" },
  { "n", "<A-k>",     "<Cmd>:m .-2<CR>==",       'Move down' },
  { "n", "<A-j>",     "<Cmd>:m .+1<CR>==",       'Move up' },
  { "v", "<A-j>",     ":m .+1<CR>==",            "Move up" },
  { "v", "<A-k>",     ":m .-2<CR>==",            "Move down" },
  { "x", "<A-k>",     ":move '<-2<CR>gv=gv",     "Move down" },
  { "x", "<A-j>",     ":move '>+1<CR>gv=gv",     "Move up" },

}
