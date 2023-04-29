-- Git
return {
  { "n", "<leader>gD", '<cmd>Glua require"gitsigns".diffthis("~")<cr>',                   "Diff Head" },
  { "n", "<leader>gR", "<cmd>Gitsigns reset_buffer<cr>",    "Reset Buffer" },
  { "n", "<leader>gS", "<cmd>Gitsigns stage_buffer<cr>",    "Stage Buffer" },
  { "n", "<leader>gp", "<cmd>Gitsigns preview_hunk<cr>",    "Preview Hunk" },
  { "n", "<leader>gu", "<cmd>Gitsigns undo_stage_hunk<cr>", "Undo Stage Hunk" },
  { "n", "<leader>gb", "<cmd>Telescope git_branches<cr>",                   "Checkout branch" },
  { "n", "<leader>gc", "<cmd>Telescope git_commits<cr>",                    "Checkout commit" },
  { "n", "<leader>gd", "<cmd>Gitsigns diffthis<cr>",                        "Diff" },
  { "n", "<leader>go", "<cmd>Telescope git_status<cr>",                     "Open changed file" },
  { "n", "<leader>gs", "<cmd>Gitsigns stage_hunk<cr>",      "Stage Hunk" },
  { "v", "<leader>gs", "<cmd>Gitsigns stage_hunk<cr>",      "Stage Hunk" },
  { "n", "<leader>gr", "<cmd>Gitsigns reset_hunk<cr>",      "Reset Hunk" },
  { "v", "<leader>gr", "<cmd>Gitsigns reset_hunk<cr>",      "Reset Hunk" },

  -- Visual mode mappings
}
