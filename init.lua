vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.keymap.set("n", "<leader>u", "<cmd>lua vim.pack.update()<cr>", { desc = "Update Packages" })
vim.keymap.set("n", "<leader>r", "<cmd>wa | restart<cr>", { desc = "Restart" })

vim.pack.add({ "https://github.com/rose-pine/neovim" })
vim.cmd("colorscheme rose-pine-main")

require("configs/autocmds")
require("configs/options")

require("plugins/blink")
require("plugins/conform")
require("plugins/gitsigns")
require("plugins/lspconfig")
require("plugins/lualine")
require("plugins/mini")
require("plugins/oil")
require("plugins/persistence")
require("plugins/snacks")
require("plugins/treesitter")
require("plugins/whichkey")
require("plugins/yanky")
