-- Set leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Load configuration
require("config.options")

-- Load plugins via vim.pack
require("plugins")

require("config.autocmds")
require("config.keymaps")
