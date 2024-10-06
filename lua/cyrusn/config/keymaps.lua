vim.keymap.set("n", "<leader>L", "<cmd>Lazy<cr>", { desc = "Lazy" })
vim.keymap.set("n", "<leader>x", "<cmd>bd<cr>", { desc = "Close buffer" })
vim.keymap.set("n", "<leader>X", "<cmd>%bd|e#<cr>", { desc = "Close all other buffers" })

-- terminal
vim.keymap.set("n", "<leader>t", "<cmd>terminal<cr>", { desc = "Open terminal" })
vim.keymap.set("t", "<ESC><ESC>", "<C-\\><C-n>", { desc = "Quit terminal" })
vim.keymap.set({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- use bufferline instead
-- Move to next or previous buffer
vim.keymap.set("n", "<S-h>", "<cmd>bp<cr>", { desc = "Prev Buffer" })
vim.keymap.set("n", "<S-l>", "<cmd>bn<cr>", { desc = "Next Buffer" })

-- use mini.basics and mini.move instead
-- Move Lines
-- vim.keymap.set("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
-- vim.keymap.set("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
-- vim.keymap.set("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
-- vim.keymap.set("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
-- vim.keymap.set("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
-- vim.keymap.set("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- better up/down
-- vim.keymap.set({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
-- vim.keymap.set({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
-- vim.keymap.set({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
-- vim.keymap.set({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Move to window using the <ctrl> hjkl keys
-- vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to left window", remap = true })
-- vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to lower window", remap = true })
-- vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to upper window", remap = true })
-- vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to right window", remap = true })
