vim.keymap.set("n", "<leader>lp", "<cmd>lua vim.pack.update()<cr>", { desc = "Pack Update" })
vim.keymap.set("n", "<leader>ld", "<cmd>lua vim.pack.del()<cr>", { desc = "Pack Delete" })
vim.keymap.set("n", "<leader>lr", "<cmd>restart<cr>", { desc = "Restart" })
vim.keymap.set("n", "<leader>lh", "<cmd>checkhealth<cr>", { desc = "Cheak Health" })

vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })

vim.keymap.set("n", "<M-n>", "<cmd>cnext<cr>", { desc = "Next Quickfix" })
vim.keymap.set("n", "<M-p>", "<cmd>cprev<cr>", { desc = "Prev Quickfix" })

vim.keymap.set("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
vim.keymap.set("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })

vim.keymap.set("i", "<C-l>", "<C-x><C-o>")
