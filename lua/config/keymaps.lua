vim.keymap.set("n", "<leader>ll", "<cmd>Lazy<cr>", { desc = "Lazy" })
-- vim.keymap.set("n", "<leader>-", "<cmd>Ex<cr>", { desc = "Netrw" })

vim.keymap.set("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
vim.keymap.set("n", "<S-h>", "<cmd>bprev<cr>", { desc = "Prev Buffer" })

vim.keymap.set("n", "<M-n>", "<cmd>cnext<cr>", { desc = "Next Quickfix" })
vim.keymap.set("n", "<M-p>", "<cmd>cprev<cr>", { desc = "Prev Quickfix" })
