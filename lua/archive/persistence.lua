vim.pack.add({ "https://github.com/folke/persistence.nvim" })

vim.keymap.set("n", "<leader>q", "", { desc = "+session" })
vim.keymap.set("n", "<leader>qs", function() require("persistence").load() end, { desc = "Load" })
vim.keymap.set("n", "<leader>qS", function() require("persistence").select() end, { desc = "Select" })
vim.keymap.set("n", "<leader>ql", function() require("persistence").load({ last = true }) end, { desc = "Last" })
vim.keymap.set("n", "<leader>qd", function() require("persistence").stop() end, { desc = "Stop" })

require("persistence").setup({})
