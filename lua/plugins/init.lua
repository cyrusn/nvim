local plugins = {
	"https://github.com/saghen/blink.cmp",
	"https://github.com/rafamadriz/friendly-snippets",
	"https://github.com/stevearc/conform.nvim",
	"https://github.com/lewis6991/gitsigns.nvim",
	"https://github.com/mason-org/mason.nvim",
	"https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim",
	"https://github.com/mason-org/mason-lspconfig.nvim",
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/nvim-treesitter/nvim-treesitter",
	"https://github.com/folke/snacks.nvim",
	"https://github.com/folke/todo-comments.nvim",
	"https://github.com/folke/trouble.nvim",
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/akinsho/bufferline.nvim",
	"https://github.com/nvim-tree/nvim-web-devicons",
	"https://github.com/folke/tokyonight.nvim",
	"https://github.com/catppuccin/nvim",
	"https://github.com/rose-pine/neovim",
	"https://github.com/craftzdog/solarized-osaka.nvim",
	"https://github.com/rebelot/kanagawa.nvim",
	"https://github.com/nvim-lualine/lualine.nvim",
	"https://github.com/folke/noice.nvim",
	"https://github.com/MunifTanjim/nui.nvim",
	"https://github.com/folke/which-key.nvim",
	"https://github.com/folke/persistence.nvim",
	"https://github.com/gbprod/yanky.nvim",
}

-- Setup hooks for build commands
vim.api.nvim_create_autocmd("PackChanged", {
	callback = function(ev)
		local name, kind = ev.data.spec.name, ev.data.kind
		if name == "nvim-treesitter" and (kind == "install" or kind == "update") then
			vim.cmd("TSUpdate")
		end
		if name == "blink.cmp" and (kind == "install" or kind == "update") then
			vim.system({ "cargo", "build", "--release" }, { cwd = ev.data.path }):wait()
		end
	end,
})

vim.pack.add(plugins)

-- Load plugin configurations
require("plugins.coding.blink")
require("plugins.coding.conform")
require("plugins.coding.gitsigns")
require("plugins.coding.lspconfig")
require("plugins.coding.treesitter")
require("plugins.editor.snacks")
require("plugins.editor.todo-comment")
require("plugins.editor.trouble_nvim")
require("plugins.ui.bufferline")
require("plugins.ui.colorscheme")
require("plugins.ui.lualine")
require("plugins.ui.noice")
require("plugins.ui.whichkey")
require("plugins.util.persistence")
require("plugins.util.yanky")
