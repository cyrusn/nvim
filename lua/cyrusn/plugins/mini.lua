return {
	"echasnovski/mini.nvim",
	lazy = false,
	keys = {
		{ "<leader>n", "<cmd>lua MiniNotify.show_history()<cr>", desc = "Show history" },
		{ "<leader>x", "<cmd>lua MiniBufremove.delete(0)<cr>", desc = "Delete Buffer" },
		{ "<leader>mf", "<cmd>lua MiniFiles.open()<cr>", desc = "Open files" },
		{ "<leader>e", "<cmd>lua MiniFiles.open()<cr>", desc = "Open files" },
		{ "<leader>mp", "<cmd>Pick files<cr>", desc = "Pick files" },
		{ "<leader>ms", "<cmd>lua MiniTrailspace.trim <cr>", desc = "trim space" },
		{ "<leader>me", "<cmd>lua MiniTrailspace.trim_last_lines<cr>", desc = "trim end-line" },
		{ "<leader><space>", "<cmd>Pick files<cr>", desc = "Pick files" },
		{ "<leader>mg", "<cmd>Pick grep_live<cr>", desc = "Pick grep" },
		{ "<leader>/", "<cmd>Pick grep_live<cr>", desc = "Pick grep" },

		-- Search:
		{ "<leader>sf", "<cmd>Pick git_files<CR>", desc = "Find Git Files" },
		{ "<leader>sG", "<cmd>Pick git_commits<CR>", desc = "Search Git Commits" },
		{ "<leader>sg", "<cmd>Pick git_hunk<CR>", desc = "Search Git Hunk" },
		{ '<leader>s"', "<cmd>Pick registers<cr>", desc = "Search Registers" },
		{ "<leader>sc", "<cmd>Pick commands<cr>", desc = "Search Commands" },
		{ "<leader>sC", "<cmd>Pick history<cr>", desc = "Search Command History" },
		{ "<leader>sb", "<cmd>Pick buffers<cr>", desc = "Search Buffers" },
		{ "<leader>bs", "<cmd>Pick buffers<cr>", desc = "Search Buffers" },
		{ "<leader>sh", "<cmd>Pick help<cr>", desc = "Search Help Pages" },
		{ "<leader>sk", "<cmd>Pick keymaps<cr>", desc = "Search Key Maps" },
		{ "<leader>sd", "<cmd>Pick lsp scope='diagnostic'<cr>", desc = "Search Workspace diagnostics" },

		-- Tools:
		{ "<leader>mf", "<cmd>lua MiniFiles.open()<cr>", desc = "Open files" },
		{ "<leader>ms", "<cmd>lua MiniTrailspace.trim <cr>", desc = "trim space" },
		{ "<leader>me", "<cmd>lua MiniTrailspace.trim_last_lines<cr>", desc = "trim end-line" },
		{ "<leader>md", "<cmd>Pick lsp scope='definiton'<cr>", desc = "Search Definition" },

		-- Code:
		{ "<leader>cd", "<cmd>lua Pick lsp scope='declaration'<cr>", desc = "Declaration" },
		{ "<leader>cD", "<cmd>lua MiniExtra.pickers.lsp({scope='definiton'})<cr>", desc = "Definition" },
		{ "<leader>cs", "<cmd>lua MiniExtra.pickers.lsp({scope='document_symbol'})<cr>", desc = "Document Symbol" },
		{ "<leader>cw", "<cmd>lua MiniExtra.pickers.lsp({scope='workspace_symbol'})<cr>", desc = "WorkspaceSymbol" },
		{ "<leader>ct", "<cmd>lua MiniExtra.pickers.lsp({scope='type_definitions'})<cr>", desc = "Type Definition" },
		{ "<leader>cI", "<cmd>lua MiniExtra.pickers.lsp({scope='implementations'})<cr>", desc = "LSP Implementations" },
		{ "<leader>cR", "<cmd>lua MiniExtra.pickers.lsp({scope='references'})<cr>", desc = "References" },
	},
	config = function()
		require("mini.files").setup({
			options = {
				use_as_default_explorer = true,
			},
		})
		require("mini.git").setup()
		require("mini.diff").setup()
		require("mini.tabline").setup()
		require("mini.statusline").setup()
		require("mini.pick").setup()
		require("mini.extra").setup()

		require("mini.align").setup()
		require("mini.basics").setup({
			mappings = { window = true },
		})
		require("mini.bufremove").setup()
		require("mini.comment").setup()
		require("mini.files").setup()
		require("mini.indentscope").setup()
		require("mini.move").setup()
		require("mini.pairs").setup()
		require("mini.pick").setup()
		require("mini.statusline").setup()
		require("mini.surround").setup()
		require("mini.tabline").setup()

		local miniclue = require("mini.clue")
		miniclue.setup({
			triggers = {
				-- Leader triggers
				{ mode = "n", keys = "<Leader>" },
				{ mode = "x", keys = "<Leader>" },

				-- Built-in completion
				{ mode = "i", keys = "<C-x>" },

				-- `g` key
				{ mode = "n", keys = "g" },
				{ mode = "x", keys = "g" },

				-- Marks
				{ mode = "n", keys = "'" },
				{ mode = "n", keys = "`" },
				{ mode = "x", keys = "'" },
				{ mode = "x", keys = "`" },

				-- Registers
				{ mode = "n", keys = '"' },
				{ mode = "x", keys = '"' },
				{ mode = "i", keys = "<C-r>" },
				{ mode = "c", keys = "<C-r>" },

				-- Window commands
				{ mode = "n", keys = "<C-w>" },

				-- `z` key
				{ mode = "n", keys = "z" },
				{ mode = "x", keys = "z" },
			},

			clues = {
				{ mode = "n", keys = "<leader>b", desc = "+buffer" },
				{ mode = "n", keys = "<leader>d", desc = "+diagnostic" },
				{ mode = "n", keys = "<leader>o", desc = "+obsidian" },
				{ mode = "n", keys = "<leader>s", desc = "+search" },
				{ mode = "n", keys = "<leader>t", desc = "+toggle" },
				{ mode = "n", keys = "<leader>c", desc = "+code" },
				{ mode = "n", keys = "<leader>h", desc = "+hunk" },
				{ mode = "x", keys = "<leader>c", desc = "+code" },
				{ mode = "x", keys = "<leader>h", desc = "+hunk" },
				{ mode = "n", keys = "<leader>m", desc = "+mini" },

				-- Enhance this by adding descriptions for <Leader> mapping groups
				miniclue.gen_clues.builtin_completion(),
				miniclue.gen_clues.g(),
				miniclue.gen_clues.marks(),
				miniclue.gen_clues.registers(),
				miniclue.gen_clues.windows(),
				miniclue.gen_clues.z(),
			},
			window = {
				delay = 500,
			},
		})

		local hipatterns = require("mini.hipatterns")
		hipatterns.setup({
			highlighters = {
				-- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
				fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
				hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
				todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
				note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },
				hex_color = hipatterns.gen_highlighter.hex_color(),
			},
		})

		local notify = require("mini.notify")
		notify.setup()
		vim.notify = notify.make_notify({
			ERROR = { duration = 3000 },
			WARN = { duration = 1000 },
			INFO = { duration = 1000 },
			DEBUG = { duration = 1000 },
			TRACE = { duration = 1000 },
			OFF = { duration = 1000 },
		})
	end,
}
