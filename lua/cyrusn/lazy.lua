local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end

vim.opt.rtp:prepend(lazypath)
require("cyrusn.config.options")
require("cyrusn.config.statusline")
require("cyrusn.config.keymaps")
require("cyrusn.config.autocmds")

require("lazy").setup({
	spec = {
		{ import = "cyrusn.plugins.editor" },
		{ import = "cyrusn.plugins.coding" },
		{ import = "cyrusn.plugins.ui" },
		{ import = "cyrusn.plugins.util" },
	},
	install = { colorscheme = { "default" } },
	checker = { enabled = true },
	dev = {
		patterns = { "cyrusn" },
	},
})

-- require("cyrusn.config.lsp")
