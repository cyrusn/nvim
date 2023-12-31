return {
	"nvim-pack/nvim-spectre",
	build = false,
	cmd = "Spectre",
	keys = {
		{
			"<leader>sz",
			function()
				require("spectre").open()
			end,
			desc = "Replace in files (Spectre)",
		},
	},
	config = true,
}
