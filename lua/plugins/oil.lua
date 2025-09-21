vim.pack.add({
	"https://github.com/stevearc/oil.nvim",
	"https://github.com/nvim-tree/nvim-web-devicons",
	"https://github.com/refractalize/oil-git-status.nvim",
	"https://github.com/JezerM/oil-lsp-diagnostics.nvim",
})

vim.keymap.set("n", "<leader>o", "<cmd>Oil<cr>", { desc = "Open Oil explorer" })

require("oil").setup({
	delete_to_trash = true,
	skip_confirm_for_simple_edits = true,
	view_options = {
		show_hidden = true,
		is_always_hidden = function(name)
			return name == ".." or name == ".git"
		end,
	},
	keymaps = {
		["<C-s>"] = { "actions.select", opts = { horizontal = true } },
		["<C-v>"] = { "actions.select", opts = { vertical = true } },
		["<C-h>"] = false,
	},
	win_options = {
		signcolumn = "yes:2",
	},
})
