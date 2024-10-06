return {
	"ibhagwan/fzf-lua",
	-- optional for icon support
	dependencies = { "nvim-tree/nvim-web-devicons" },
	keys = {
		-- Mini.Pick and Mini.Extra
		{ "<leader><space>", "<cmd>FzfLua files<cr>", desc = "Search files" },
		{ "<leader>/", "<cmd>FzfLua grep<cr>", desc = "Search grep" },
		{ "<leader>?", "<cmd>FzfLua live_grep<cr>", desc = "Live Grep" },

		-- Search:
		{ "<leader>si", "<cmd>FzfLua builtin<cr>", desc = "Search FzfLua builtin" },
		{ "<leader>sf", "<cmd>FzfLua git_files<CR>", desc = "Search Git Files" },
		{ "<leader>sG", "<cmd>FzfLua git_commits<CR>", desc = "Search Git Commits" },
		{ "<leader>ss", "<cmd>FzfLua git_status<CR>", desc = "Search Git Status" },
		{ '<leader>s"', "<cmd>FzfLua registers<cr>", desc = "Search Registers" },
		{ "<leader>sc", "<cmd>FzfLua commands<cr>", desc = "Search Commands" },
		{ "<leader>sC", "<cmd>FzfLua command_history<cr>", desc = "Search Command History" },
		{ "<leader>sb", "<cmd>FzfLua buffers<cr>", desc = "Search Buffers" },
		{ "<leader>sH", "<cmd>FzfLua helptags<cr>", desc = "Search Help Pages" },
		{ "<leader>sh", "<cmd>FzfLua search_history<cr>", desc = "Search Search History" },
		{ "<leader>sk", "<cmd>FzfLua keymaps<cr>", desc = "Search Keymaps" },
		{ "<leader>se", "<cmd>FzfLua resume<cr>", desc = "Search resume" },
		{ "<leader>sd", "<cmd>FzfLua diagnostics_document<cr>", desc = "Search Document diagnostics" },
		{ "<leader>sD", "<cmd>FzfLua diagnostics_workspace<cr>", desc = "Search Workspace diagnostics" },
		{ "<leader>sl", "<cmd>FzfLua blines<cr>", desc = "Search buffer lines" },

		-- Code:
		{ "<leader>cD", "<cmd>FzfLua lsp_declarations<cr>", desc = "Declaration" },
		{ "<leader>cd", "<cmd>FzfLua lsp_definitions<cr>", desc = "Definition" },
		{ "<leader>cs", "<cmd>FzfLua lsp_document_symbols<cr>", desc = "Document Symbol" },
		{ "<leader>cw", "<cmd>FzfLua lsp_workspace_symbols<cr>", desc = "Workspace Symbol" },
		{ "<leader>ct", "<cmd>FzfLua lsp_typedefs<cr>", desc = "Type Definition" },
		{ "<leader>cI", "<cmd>FzfLua lsp_implementations<cr>", desc = "Implementations" },
		{ "<leader>cR", "<cmd>FzfLua lsp_references<cr>", desc = "References" },
		{ "<leader>cc", "<cmd>FzfLua lsp_code_actions<cr>", desc = "Code Actions" },
	},
	config = function()
		-- calling `setup` is optional for customization
		require("fzf-lua").setup({
			"default-title",
		})
	end,
}
