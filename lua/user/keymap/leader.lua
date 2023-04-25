-- Basic Leader
return {
  { "n", "<leader>e", "<cmd>NvimTreeToggle<cr>",                                      "Explorer" },
  { "n", "<leader>q", "<cmd>q<CR>",                                                   "Quit" },
  { "n", "<leader>c", "<cmd>Bdelete<CR>",                                             "Close Buffer" },
  { "n", "<leader>w", "<cmd>w<CR>",                                                   "Save" },
  { "n", "<leader>b", "<cmd>Telescope buffers theme=dropdown previewer=false<cr>",    "Search Buffers" },
  { "n", "<leader>f", "<cmd>Telescope find_files theme=dropdown previewer=false<cr>", "Find files" },
  { "n", "<leader>F", "<cmd>Telescope live_grep<cr>",                                 "Find Text" },
  { "n", "<leader>u", "<cmd>Telescope undo<cr>",                                      "Undo" },
  { "n", "<leader>S", "<cmd>:so<cr>",                                                 "Source File" },
  { "n", "<leader>Q", "<cmd>qa<CR>",                                                  "Quit All" },
}
