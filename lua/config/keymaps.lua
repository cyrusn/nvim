vim.keymap.set("n", "<leader>lp", "<cmd>lua vim.pack.update()<cr>", { desc = "Pack Update" })
vim.keymap.set("n", "<leader>ld", "<cmd>lua vim.pack.del()<cr>", { desc = "Pack Delete" })
vim.keymap.set("n", "<leader>lr", "<cmd>restart<cr>", { desc = "Restart" })
vim.keymap.set("n", "<leader>lh", "<cmd>checkhealth<cr>", { desc = "Cheak Health" })

vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })

vim.keymap.set("n", "<M-n>", "<cmd>cnext<cr>", { desc = "Next Quickfix" })
vim.keymap.set("n", "<M-p>", "<cmd>cprev<cr>", { desc = "Prev Quickfix" })

vim.keymap.set("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
vim.keymap.set("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })

vim.keymap.set("n", "n", "'Nn'[v:searchforward].'zv'", { expr = true, desc = "Next Search Result" })
vim.keymap.set("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
vim.keymap.set("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
vim.keymap.set("n", "N", "'nN'[v:searchforward].'zv'", { expr = true, desc = "Prev Search Result" })
vim.keymap.set("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })
vim.keymap.set("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })
