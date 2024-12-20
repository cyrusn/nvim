return {
	"ibhagwan/fzf-lua",
	-- optional for icon support
	lazy = false,
	dependencies = { "nvim-tree/nvim-web-devicons" },
	keys = {
		-- Search:
		{ "<leader><space>", "<cmd>FzfLua files<cr>", desc = "Search Files" },

		{ "<leader>?", "<cmd>FzfLua grep<cr>", desc = "Search Grep" },
		{ "<leader>/", "<cmd>FzfLua live_grep<cr>", desc = "Search Live Grep" },
		{ "<leader>sf", "<cmd>FzfLua git_files<CR>", desc = "Git Files" },
		{ "<leader>sF", "<cmd>FzfLua files cwd='~/.config/nvim'<cr>", desc = "Config Files" },
		{ "<leader>sG", "<cmd>FzfLua git_commits<CR>", desc = "Git Commits" },
		{ "<leader>ss", "<cmd>FzfLua git_status<CR>", desc = "Git Status" },
		{ '<leader>s"', "<cmd>FzfLua registers<cr>", desc = "Registers" },
		{ "<leader>sB", "<cmd>FzfLua builtin<cr>", desc = "Builtin Commands" },
		{ "<leader>sc", "<cmd>FzfLua commands<cr>", desc = "Commands" },
		{ "<leader>sC", "<cmd>FzfLua command_history<cr>", desc = "Command History" },
		{ "<leader>sb", "<cmd>FzfLua buffers<cr>", desc = "Buffers" },
		{ "<leader>sh", "<cmd>FzfLua helptags<cr>", desc = "Help Pages" },
		{ "<leader>sH", "<cmd>FzfLua search_history<cr>", desc = "Search History" },
		{ "<leader>sk", "<cmd>FzfLua keymaps<cr>", desc = "Keymaps" },
		{ "<leader>sR", "<cmd>FzfLua resume<cr>", desc = "Resume" },
		{ "<leader>sd", "<cmd>FzfLua diagnostics_document<cr>", desc = "Document Diagnostics" },
		{ "<leader>sD", "<cmd>FzfLua diagnostics_workspace<cr>", desc = "Workspace Diagnostics" },
		{ "<leader>sl", "<cmd>FzfLua blines<cr>", desc = "Buffer Lines" },

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
		require("fzf-lua").register_ui_select()
	end,
}
