return {
	"echasnovski/mini.nvim",
	lazy = false,
	keys = {
		{
			"<leader>x",
			"<cmd>lua MiniBufremove.delete(0)<cr>",
			desc = "Delete Buffer",
		},
		{ "<leader>w", "<cmd>lua MiniFiles.open()<cr>", desc = "Open mini.files" },
	},
	config = function()
		require("mini.align").setup()
		require("mini.bufremove").setup()
		require("mini.comment").setup()
		require("mini.move").setup()
		require("mini.pairs").setup()
		require("mini.surround").setup()
		require("mini.tabline").setup()
		require("mini.files").setup({
			options = {
				use_as_default_explorer = false,
			},
			windows = {
				preview = true,
				width_focus = 20,
				width_nofocus = 15,
				width_preview = 60,
			},
		})

		require("mini.notify").setup()
		local MiniStatusline = require("mini.statusline")
		MiniStatusline.setup()

		-- force to show relative path

		MiniStatusline.section_filename = function()
			return vim.fn.expand("%:.") .. ": %m"
		end

		-- show Percentage in the file location
		MiniStatusline.section_location = function()
			if vim.bo.filetype == "alpha" then
				return ""
			end
			return "%P %l:%c "
		end
	end,
}
