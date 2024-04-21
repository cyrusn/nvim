return {
	"michaelrommel/nvim-silicon",
	lazy = false,
	cmd = "Silicon",
	keys = {
		{ "<leader>cs", "<cmd>Silicon<cr>", desc = "Snapshot", mode = "v" },
	},
	config = function()
		require("silicon").setup({
			font = "FiraMono Nerd Font Mono",
			theme = "OneHalfDark",
			background = "#FFFFFF",
			pad_horiz = 20,
			pad_vert = 20,
			to_clipboard = true,
			window_title = function()
				return vim.fn.fnamemodify(vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf()), ":t")
			end,
			output = function()
				return "~/Desktop/" .. os.date("!%Y-%m-%dT%H-%M-%S") .. "_code.png"
			end,
		})
	end,
}
