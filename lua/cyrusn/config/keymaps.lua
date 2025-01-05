vim.keymap.set("n", "<leader>L", "<cmd>Lazy<cr>", { desc = "Lazy" })
-- vim.keymap.set("n", "<leader>w", "<cmd>w<cr>", { desc = "Write file" })
-- vim.keymap.set("n", "<leader>W", "<cmd>wa<cr>", { desc = "Write files" })
vim.keymap.set("n", "<leader>q", "<cmd>wqa<cr>", { desc = "Save and Quit" })
-- vim.keymap.set("n", "<leader>Q", "<cmd>wqa<cr>", { desc = "Save and Quit" })

-- use mini.bufremove and bufferline to handle it, they won't affect the layout when buffer closed
-- vim.keymap.set("n", "<leader>x", "<cmd>bd #<cr>", { desc = "Close buffer" })
-- vim.keymap.set("n", "<leader>X", "<cmd>%bd|e#<cr>", { desc = "Close all other buffers" })

-- terminal
vim.keymap.set({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- better jumps
-- redraw after jumps
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-o>", "<C-o>zz")
vim.keymap.set("n", "<C-i>", "<C-i>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Window
vim.keymap.set("n", "<A-.>", "<c-w>5>", { desc = "increse width" })
vim.keymap.set("n", "<A-,>", "<c-w>5<", { desc = "decrese width" })
vim.keymap.set("n", "<A-=>", "<c-w>+", { desc = "increase height" })
vim.keymap.set("n", "<A-->", "<c-w>-", { desc = "decrese height" })
vim.keymap.set("n", "<A-o>", "<c-w>o", { desc = "close other window" })
vim.keymap.set("n", "<A-v>", "<c-w>v", { desc = "vsplit" })
vim.keymap.set("n", "<A-s>", "<c-w>s", { desc = "split window" })
vim.keymap.set("n", "<A-x>", "<c-w>c", { desc = "close window" })

-- better up/down
-- j and k will move visual line instead of move line
vim.keymap.set({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Move to next or previous buffer
-- vim.keymap.set("n", "<S-h>", "<cmd>bp<cr>", { desc = "Prev Buffer" })
-- vim.keymap.set("n", "<S-l>", "<cmd>bn<cr>", { desc = "Next Buffer" })

-- Move Lines
vim.keymap.set("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
vim.keymap.set("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
vim.keymap.set("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
vim.keymap.set("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
vim.keymap.set("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
vim.keymap.set("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- Move window using the <ctrl> hjkl keys
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to left window", remap = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to lower window", remap = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to upper window", remap = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to right window", remap = true })
