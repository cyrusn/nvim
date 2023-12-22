return {
	"williamboman/mason.nvim",
	dependancies = {
		"VonHeikemen/lsp-zero.nvim",
		"williamboman/mason-lspconfig.nvim",
	},
	keys = { { "<leader>M", "<cmd>Mason<cr>", desc = "Mason" } },
	build = ":MasonUpdate",
  config = true
}
