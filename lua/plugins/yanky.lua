vim.pack.add({ "https://github.com/gbprod/yanky.nvim" })
vim.keymap.set("n", "<leader>ky", "<cmd>lua Snacks.picker.yanky()<cr>", { desc = "Yank History" })
