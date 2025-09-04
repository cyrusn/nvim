-- terminal
vim.keymap.set({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- better jumps
-- redraw after jumps
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")

-- Window
vim.keymap.set("n", "<A-.>", "<c-w>5>", { desc = "increse width" })
vim.keymap.set("n", "<A-,>", "<c-w>5<", { desc = "decrese width" })
vim.keymap.set("n", "<A-->", "<c-w>-", { desc = "decrese height" })
vim.keymap.set("n", "<A-=>", "<c-w>+", { desc = "increase height" })
vim.keymap.set("n", "<A-v>", "<c-w>v", { desc = "vsplit" })
vim.keymap.set("n", "<A-o>", "<c-w>o", { desc = "close other window" })
vim.keymap.set("n", "<A-s>", "<c-w>s", { desc = "split window" })
vim.keymap.set("n", "<A-c>", "<c-w>c", { desc = "close window" })

-- Move window
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to left window", remap = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to lower window", remap = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to upper window", remap = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to right window", remap = true })

-- better up/down
-- j and k will move visual line instead of move line
vim.keymap.set({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Move Lines
vim.keymap.set("n", "<A-j>", "<cmd>m .+1<cr>==zz", { desc = "Move down" })
vim.keymap.set("n", "<A-k>", "<cmd>m .-2<cr>==zz", { desc = "Move up" })
vim.keymap.set("i", "<A-j>", "<esc><cmd>m .+1<cr>==zzgi", { desc = "Move down" })
vim.keymap.set("i", "<A-k>", "<esc><cmd>m .-2<cr>==zzgi", { desc = "Move up" })
vim.keymap.set("v", "<A-j>", ":m '>+1<cr>gv=gvzz", { desc = "Move down" })
vim.keymap.set("v", "<A-k>", ":m '<-2<cr>gv=gvzz", { desc = "Move up" })
