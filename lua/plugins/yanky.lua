vim.pack.add({ "https://github.com/gbprod/yanky.nvim" })

vim.keymap.set({ "n", "x" }, "<leader>p", "<cmd>lua Snacks.picker.yanky()<cr>", { desc = "Open Yank History" })

require("yanky").setup({})
