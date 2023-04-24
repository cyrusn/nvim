local gs = require('gitsigns')

local function keymap(mode, key, func, desc)
  vim.keymap.set(mode, key, func, { desc = desc })
end

-- Shorten function name
--Remap space as leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Suggested by theprimeagen, delete and paste in visual mode will not copy
keymap("v", "p", [["_dP]])
keymap("x", "p", [["_dP]])

-- https://github.com/ThePrimeagen/init.lua/blob/master/lua/theprimeagen/remap.lua
-- zz will redraw the cursor in the middle of window
keymap("n", "<C-d>", "<C-d>zz")
keymap("n", "<C-u>", "<C-u>zz")
keymap("n", "n", "nzzzv")
keymap("n", "N", "Nzzzv")
keymap("n", "<C-k>", "<cmd>cnext<CR>zz")
keymap("n", "<C-j>", "<cmd>cprev<CR>zz")
keymap("n", "<leader>k", "<cmd>lnext<CR>zz", "Next Location")
keymap("n", "<leader>j", "<cmd>lprev<CR>zz", "Prev Location")
keymap('n', 'j', 'jzzzj')
keymap('n', 'k', 'kzzzk')

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h")
keymap("n", "<C-j>", "<C-w>j")
keymap("n", "<C-k>", "<C-w>k")
keymap("n", "<C-l>", "<C-w>l")

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>")
keymap("n", "<C-Down>", ":resize +2<CR>")
keymap("n", "<C-Left>", ":vertical resize -2<CR>")
keymap("n", "<C-Right>", ":vertical resize +2<CR>")

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>")
keymap("n", "<S-h>", ":bprevious<CR>")

-- Move text up and down
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==", 'Move down')
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==", 'Move up')

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv")
keymap("v", ">", ">gv")

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", "Move up")
keymap("v", "<A-k>", ":m .-2<CR>==", "Move down")

-- Visual Block --
-- Move text up and down
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", "Move down")
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", "Move up")

-- Terminal --
-- Better terminal navigation
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Leader Mappings --
-- Basic
keymap("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", "Explorer")
keymap("n", "<leader>q", "<cmd>q<CR>", "Quit")
keymap("n", "<leader>c", "<cmd>Bdelete<CR>", "Close Buffer")
keymap("n", "<leader>w", "<cmd>w<CR>", "Save")
keymap("n", "<leader>b", "<cmd>Telescope buffers theme=dropdown previewer=false<cr>", "Search Buffers")
keymap("n", "<leader>f", "<cmd>Telescope find_files theme=dropdown previewer=false<cr>", "Find files")
keymap("n", "<leader>F", "<cmd>Telescope live_grep<cr>", "Find Text")
keymap("n", "<leader>u", "<cmd>Telescope undo<cr>", "Undo")
keymap("n", "<leader>S", "<cmd>:so<cr>", "Source File")
keymap("n", "<leader>Q", "<cmd>qa<CR>", "Quit All")

-- LSP
-- All LSP commands are configured in after/plugin/lsp.lua

-- Packer
keymap("n", "<leader>ps", "<cmd>PackerSync<cr>", "Sync")
keymap("n", "<leader>pu", "<cmd>PackerUpdate<cr>", "Update")

-- Git
keymap("n", "<leader>gs", "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk")
keymap("n", "<leader>gr", "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk")
keymap("n", "<leader>gp", "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk")
keymap("n", "<leader>gu", "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", "Undo Stage Hunk")
keymap("n", "<leader>gS", "<cmd>lua require 'gitsigns'.stage_buffer()<cr>", "Stage Buffer")
keymap("n", "<leader>gR", "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer")
keymap("n", "<leader>go", "<cmd>Telescope git_status<cr>", "Open changed file")
keymap("n", "<leader>gb", "<cmd>Telescope git_branches<cr>", "Checkout branch")
keymap("n", "<leader>gc", "<cmd>Telescope git_commits<cr>", "Checkout commit")
keymap("n", "<leader>gd", "<cmd>Gitsigns diffthis<cr>", "Diff")
keymap("n", "<leader>gD", "<cmd>Gitsigns diffthis Head<cr>", "Diff Head")
keymap("v", "<leader>gr", function() gs.reset_hunk { vim.fn.line("."), vim.fn.line("v") } end, "Reset Hunk")
keymap("v", "<leader>gs", function() gs.stage_hunk { vim.fn.line("."), vim.fn.line("v") } end, "Stage Hunk")

-- Search
keymap("n", "<leader>sp", "<cmd>Telescope projects theme=dropdown <cr>", "Projects")
keymap("n", "sh", "<cmd>Telescope help_tags theme=dropdown <cr>", "Helps")
keymap("n", "<leader>sk", "<cmd>Telescope keymaps theme=dropdown <cr>", "Keymaps")
keymap("n", "<leader>sm", "<cmd>Telescope man_pages theme=dropdown <cr>", "Man Pages")
keymap("n", "<leader>sr", "<cmd>Telescope oldfiles theme=dropdown <cr>", "Recent Files")
keymap("n", "<leader>sc", "<cmd>Telescope commands theme=dropdown <cr>", "Commands")
