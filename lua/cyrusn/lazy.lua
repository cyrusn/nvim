local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release

		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

-- Example using a list of specs with the default options

local opts = {
	dev = {
		patterns = { "cyrusn" },
	},
}

require("cyrusn.config").setup()

require("lazy").setup({
	-- { import = "cyrusn.plugins" },
	{ import = "cyrusn.plugins.editor" },
	{ import = "cyrusn.plugins.coding" },
  { import = "cyrusn.plugins.ui" },
  { import = "cyrusn.plugins.util" },
}, opts)
