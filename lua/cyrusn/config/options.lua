vim.g.mapleader = " "

-- disable netrw
-- vim.g.loaded_netrwPlugin = 1
-- vim.g.loaded_netrw = 1
--
-- enable netrw if nvim-tree is not installed
vim.g.netrw_preview = 1
vim.g.netrw_liststyle = 0
vim.g.netrw_winsize = 20
vim.g.netrw_list_hide = vim.fn["netrw_gitignore#Hide"]()
vim.g.netrw_sizestyle = "H"
vim.g.netrw_banner = 0
vim.g.netrw_keepdir = 0
vim.g.netrw_localrmdir = "rm -rf"
vim.g.netrw_bufsettings = "noma nomod nu nobl nowrap ro"

-- vim.options
vim.opt.timeout = false
vim.opt.laststatus = 3
vim.opt.foldmethod = "indent"
vim.opt.foldlevel = 99 -- unfold all folds by default
vim.opt.helpheight = 36
vim.opt.autowrite = true -- Enable auto write
vim.opt.clipboard = "unnamedplus" -- Sync with system clipboard
vim.opt.conceallevel = 0 -- Hide * markup for bold and italic
vim.opt.confirm = true -- Confirm to save changes before exiting modified buffer
vim.opt.cursorline = true -- Enable highlighting of the current line
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.ignorecase = true -- Ignore case
vim.opt.list = true -- Show some invisible characters (tabs...
vim.opt.listchars:append({
	tab = "│ ",
	lead = "·",
	trail = "·",
	extends = "▸",
	precedes = "◂",
	leadmultispace = "│·",
})
vim.opt.mouse = "a" -- Enable mouse mode
vim.opt.number = true -- Print line number
vim.opt.relativenumber = true -- Relative line numbers
vim.opt.scrolloff = 4 -- Lines of context
vim.opt.shiftwidth = 2 -- Size of an indent
vim.opt.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time
vim.opt.smartcase = true -- Don't ignore case with capitals
vim.opt.smartindent = true -- Insert indents automatically
vim.opt.spelllang = { "en" }
vim.opt.spell = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.tabstop = 2 -- Number of spaces tabs count for
vim.opt.termguicolors = true -- True color support
vim.opt.timeoutlen = 300
vim.opt.undofile = true
vim.opt.undolevels = 10000
vim.opt.updatetime = 200 -- Save swap file and trigger CursorHold
vim.opt.wrap = false -- Disable line wrap

-- Module for defining new filetypes. I picked up these configurations based on inspirations from this dotfiles repo:
-- https://github.com/davidosomething/dotfiles/blob/be22db1fc97d49516f52cef5c2306528e0bf6028/nvim/lua/dko/filetypes.lua
vim.filetype.add({
	-- Detect and assign filetype based on the extension of the filename
	extension = {
		mdx = "mdx",
		log = "log",
		conf = "conf",
		env = "dotenv",
	},
	-- Detect and apply filetypes based on the entire filename
	filename = {
		[".env"] = "dotenv",
		["env"] = "dotenv",
		["tsconfig.json"] = "jsonc",
	},
	-- Detect and apply filetypes based on certain patterns of the filenames
	pattern = {
		-- INFO: Match filenames like - ".env.example", ".env.local" and so on
		["%.env%.[%w_.-]+"] = "dotenv",
	},
})
