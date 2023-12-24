return {
	"williamboman/mason.nvim",
	dependencies = {
		"VonHeikemen/lsp-zero.nvim",
		"williamboman/mason-lspconfig.nvim",
	},
	keys = { { "<leader>M", "<cmd>Mason<cr>", desc = "Mason" } },
	build = ":MasonUpdate",
	config = true,
}
