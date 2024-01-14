return {
	"williamboman/mason.nvim",
	build = ":MasonUpdate",
	dependencies = {
		"VonHeikemen/lsp-zero.nvim",
		"williamboman/mason-lspconfig.nvim",
	},
	keys = { { "<leader>M", "<cmd>Mason<cr>", desc = "Mason" } },
	config = true,
}
