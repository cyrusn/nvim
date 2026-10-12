-- General & Timing
vim.opt.autowrite = true
vim.opt.clipboard = "unnamedplus"
vim.opt.confirm = true
vim.opt.shortmess:append("I")
vim.opt.timeoutlen = 300
vim.opt.undolevels = 10000
vim.opt.undofile = true -- saves undo history across restarts
vim.opt.updatetime = 200

-- Display & UI
vim.opt.laststatus = 3
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 4
vim.opt.list = true
vim.opt.listchars = {
	tab = "│ ",
	lead = "·",
	trail = "·",
	extends = "▸",
	precedes = "◂",
	leadmultispace = "│·",
}

-- Statusline & Winbar
vim.opt.statusline = "%<%f %h%m%r %= %y [%{&fenc==''?&enc:&fenc}] [Loc:%l,%c] [%P | %L]"
vim.opt.winbar = "%<%f %h%m%r"

-- Indentation & Folding
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.smartindent = true
vim.opt.tabstop = 2

vim.opt.foldmethod = "indent"
vim.opt.foldlevel = 99

-- Search & Spelling
vim.opt.hlsearch = false
vim.opt.spell = true
vim.opt.spelllang = { "en" }
vim.opt.spelloptions = "camel"

-- Netrw
vim.g.netrw_banner = 0
vim.g.netrw_preview = 1
vim.g.netrw_winsize = 30
vim.g.netrw_sizestyle = "h"
vim.g.netrw_localrmdir = "rm -rf"
vim.g.netrw_bufsettings = "noma nomod nu nobl nowrap ro"

