vim.g.netrw_preview = 1
vim.g.netrw_liststyle = 3
vim.g.netrw_winsize = 30
vim.g.netrw_sizestyle = "h"
vim.g.netrw_banner = 0
vim.g.netrw_localrmdir = "rm -rf"
vim.g.netrw_bufsettings = "noma nomod nu nobl nowrap ro"

vim.diagnostic.config({
	virtual_text = true,
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "✘",
			[vim.diagnostic.severity.WARN] = " ",
			[vim.diagnostic.severity.HINT] = " ",
			[vim.diagnostic.severity.INFO] = " ",
		},
	},
})
vim.opt.timeout = true
vim.opt.laststatus = 3
vim.opt.foldmethod = "indent"
vim.opt.foldlevel = 99
vim.opt.autowrite = true
vim.opt.clipboard = "unnamedplus"
vim.opt.conceallevel = 0
vim.opt.confirm = true
vim.opt.expandtab = true
vim.opt.hlsearch = false
vim.opt.relativenumber = true
vim.opt.scrolloff = 4
vim.opt.shiftwidth = 2
vim.opt.smartindent = true
vim.opt.spelllang = { "en" }
vim.opt.spelloptions = "camel"
vim.opt.spell = true
vim.opt.tabstop = 2
vim.opt.timeoutlen = 300
vim.opt.undolevels = 10000
vim.opt.updatetime = 200
