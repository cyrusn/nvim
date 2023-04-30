-- Basic Leader
return {
  { "n", "<leader><leader>", "<cmd>Telescope find_files theme=dropdown previewer=false<cr>", "Find files" },
  { "n", "<leader>e",        "<cmd>NvimTreeToggle<cr>",                                      "Explorer" },
  { "n", "<leader>c",        "<cmd>Bdelete!<CR>",                                            "Close Buffer" },
  { "n", "<leader>f",        "<cmd>Telescope live_grep<cr>",                                 "Find Text" },
  { "n", "<leader>u",        "<cmd>Telescope undo<cr>",                                      "Undo" },
  { "n", "<leader>w",        "<cmd>w<CR>",                                                   "Save" },
  { "n", "<leader>qQ",       "<cmd>q!<CR>",                                                  "Force Quit" },
  { "n", "<leader>qq",       "<cmd>q<CR>",                                                   "Quit" },
  { "n", "<leader>qa",       "<cmd>qa<CR>",                                                  "Quit All" },
  { "n", "<leader>qA",       "<cmd>qa!<CR>",                                                 "Force Quit All" },
  { "n", "<leader>qw",       "<cmd>wq<CR>",                                                  "Save and quit" },
  { "n", "<leader>qW",       "<cmd>wqa<CR>",                                                 "Save and quit All" },
}
