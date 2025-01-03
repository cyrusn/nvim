return {
	"ibhagwan/fzf-lua",
	-- optional for icon support
	lazy = false,
	dependencies = { "nvim-tree/nvim-web-devicons" },
	keys = {
		-- Search:
		{ "<leader>l", "<cmd>FzfLua buffers formatter=path.filename_first<cr>", desc = "List Buffers" },
		{ "<leader><space>", "<cmd>FzfLua files formatter=path.filename_first<cr>", desc = "Search Files" },
		{ "<leader>p", "<cmd>FzfLua live_grep<cr>", desc = "Search Live Grep" },
		{ "<leader>/", "<cmd>FzfLua grep<cr>", desc = "Search Grep" },

		{ "<leader>sf", "<cmd>FzfLua git_files formatter=path.filename_first <CR>", desc = "Git Files" },
		{
			"<leader>sF",
			"<cmd>FzfLua files cwd='~/.config/nvim' formatter=path.filename_first<cr>",
			desc = "Config Files",
		},
		{ "<leader>sG", "<cmd>FzfLua git_commits<CR>", desc = "Git Commits" },
		{ "<leader>so", "<cmd>FzfLua oldfiles formatter=path.filename_first<CR>", desc = "Old Files" },
		{ "<leader>ss", "<cmd>FzfLua git_status formatter=path.filename_first<CR>", desc = "Git Status" },
		{ '<leader>s"', "<cmd>FzfLua registers<cr>", desc = "Registers" },
		{ "<leader>sB", "<cmd>FzfLua builtin<cr>", desc = "Builtin Commands" },
		{ "<leader>sc", "<cmd>FzfLua commands<cr>", desc = "Commands" },
		{ "<leader>sC", "<cmd>FzfLua command_history<cr>", desc = "Command History" },
		{ "<leader>sb", "<cmd>FzfLua buffers<cr>", desc = "Buffers" },
		{ "<leader>sh", "<cmd>FzfLua helptags<cr>", desc = "Help Pages" },
		{ "<leader>sH", "<cmd>FzfLua search_history<cr>", desc = "History" },
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
		local fzflua = require("fzf-lua")
		local actions = fzflua.actions

		fzflua.setup({
			"borderless",
			grep = {
				actions = {
					["ctrl-g"] = { actions.grep_lgrep },
					["ctrl-h"] = { actions.toggle_ignore },
				},
			},
		})
		require("fzf-lua").register_ui_select()
	end,
}
