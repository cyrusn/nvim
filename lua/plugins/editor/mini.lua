
vim.pack.add({
  {src = "https://github.com/nvim-mini/mini.nvim"},
  {src = "https://github.com/nvim-mini/mini.icons" }
})
		require("mini.basics").setup({
			options = {
				basic = true,
			},
			mappings = {
				basic = true,
				option_toggle_prefix = [[\]],
				windows = true,
				move_with_alt = true,
			},
		})
    require("mini.move").setup()
