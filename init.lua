vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.keymap.set("n", "<leader>u", "<cmd>lua vim.pack.update()<cr>", { desc = "Update Packages" })
require("config.autocmds")
require("config.options")

require("plugins.blink")
require("plugins.colorscheme")
require("plugins.conform")
require("plugins.gitsigns")
require("plugins.lspconfig")
require("plugins.lualine")
require("plugins.mini")
require("plugins.oil")
require("plugins.persistence")
require("plugins.snacks")
require("plugins.treesitter")
require("plugins.whichkey")
require("plugins.yanky")
