local status_ok, gitsigns = pcall(require, "gitsigns")

if not status_ok then
  return
end

-- Git
return {
  { "n", "<leader>gD", "<cmd>Gitsigns diffthis Head<cr>",                   "Diff Head" },
  { "n", "<leader>gR", "<cmd>lua require 'gitsigns'.reset_buffer()<cr>",    "Reset Buffer" },
  { "n", "<leader>gS", "<cmd>lua require 'gitsigns'.stage_buffer()<cr>",    "Stage Buffer" },
  { "n", "<leader>gb", "<cmd>Telescope git_branches<cr>",                   "Checkout branch" },
  { "n", "<leader>gc", "<cmd>Telescope git_commits<cr>",                    "Checkout commit" },
  { "n", "<leader>gd", "<cmd>Gitsigns diffthis<cr>",                        "Diff" },
  { "n", "<leader>go", "<cmd>Telescope git_status<cr>",                     "Open changed file" },
  { "n", "<leader>gp", "<cmd>lua require 'gitsigns'.preview_hunk()<cr>",    "Preview Hunk" },
  { "n", "<leader>gr", "<cmd>lua require 'gitsigns'.reset_hunk()<cr>",      "Reset Hunk" },
  { "n", "<leader>gs", "<cmd>lua require 'gitsigns'.stage_hunk()<cr>",      "Stage Hunk" },
  { "n", "<leader>gu", "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", "Undo Stage Hunk" },

  -- Visual mode mappings
  { "v", "<leader>gr",
    function()
      gitsigns.reset_hunk { vim.fn.line("."), vim.fn.line("v") }
    end, "Reset Hunk" },
  { "v", "<leader>gs",
    function()
      gitsigns.stage_hunk { vim.fn.line("."), vim.fn.line("v") }
    end, "Stage Hunk" },
}
