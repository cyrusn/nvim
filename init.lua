vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.keymap.set("n", "<leader>u", "<cmd>lua vim.pack.update()<cr>", { desc = "Update Packages" })
require("config.autocmds")
require("config.options")

require("plugins.coding.lspconfig")
require("plugins.coding.conform")
require("plugins.coding.treesitter")
require("plugins.coding.blink")
require("plugins.coding.gitsigns")

require("plugins.editor.snacks")
require("plugins.editor.mini")

require("plugins.ui.colorscheme")
require("plugins.ui.whichkey")
require("plugins.ui.lualine")

require("plugins.util.persistence")
require("plugins.util.yanky")
require("plugins.util.oil")
