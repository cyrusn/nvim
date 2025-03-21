return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	keys = {
		-- bufdelete
		{ "<leader>x", "<cmd>lua Snacks.bufdelete.delete()<cr>", desc = "Close Buffer" },
		{ "<leader>X", "<cmd>lua Snacks.bufdelete.other()<cr>", desc = "Close Other Buffers" },
		-- lazygit
		{ "<leader>hg", "<cmd>lua Snacks.lazygit()<cr>", desc = "Lazygit" },
		-- notifier
		{ "<leader>n", "<cmd>lua Snacks.notifier.show_history()<cr>", desc = "Show Notifier History" },
		-- terminal
		{ "<leader>z", "<cmd>lua Snacks.terminal.toggle()<cr>", desc = "Terminal" },
		-- dashboard
		{ "<leader>d", "<cmd>lua Snacks.dashboard()<cr>", desc = "Dashboard " },
		-- explorer
		{ "<leader>e", "<cmd>lua Snacks.explorer()<cr>", desc = "File Explorer" },
		-- picker:main
		{ "<leader><space>", "<cmd>lua Snacks.picker.smart()<cr>", desc = "Smart Find Files" },
		{ "<leader>C", "<cmd>lua Snacks.picker.files({cwd=vim.fn.stdpath('config')})<cr>", desc = "Find Config Files" },
		{ "<leader>,", "<cmd>lua Snacks.picker.buffers()<cr>", desc = "Buffers" },
		{ "<leader>/", "<cmd>lua Snacks.picker.grep_word()<cr>", desc = "Grep Words" },
		{ "<leader>r", "<cmd>lua Snacks.picker.lsp_references()<cr>", nowait = true, desc = "References" },
		{ "<leader>p", "<cmd>lua Snacks.picker.pickers()<cr>", desc = "Pickers", mode = { "n", "x" } },
		{ "<leader>P", "<cmd>lua Snacks.picker.grep()<cr>", desc = "Grep", mode = { "n", "x" } },
		{ "<leader>.", "<cmd>lua Snacks.picker.resume()<cr>", desc = "Resume" },
	},
	opts = {
		styles = {
			notification = {},
		},
		bufdelete = {},
		explorer = { replace_netrw = true },
		indent = {},
		lazygit = {},
		notifier = {
			style = "minimal",
			top_down = false,
			margin = { top = 0, right = 0, bottom = 2 },
		},
		words = {},
		picker = {
			layout = { preset = "fat_split" },
			layouts = {
				tall = {
					preview = false,
					layout = {
						backdrop = false,
						row = -2,
						col = -1,
						width = 35,
						height = 0.6,
						title = "{title} {live} {flags}",
						title_pos = "center",
						border = "rounded",
						box = "vertical",
						{ win = "input", height = 1 },
						{
							box = "horizontal",
							{ win = "list" },
							{ win = "preview", width = 0.7 },
						},
					},
				},
				fat = {
					preview = false,
					layout = {
						box = "vertical",
						backdrop = false,
						row = -2,
						col = -1,
						width = 0.65,
						height = 12,
						border = "rounded",
						title = " {title} {live} {flags}",
						title_pos = "center",
						{ win = "input", height = 1 },
						{
							box = "horizontal",
							{ win = "list", border = "none" },
							{ win = "preview", title = "{preview}", width = 0.7 },
						},
					},
				},
				fat_preview = { preset = "fat", preview = true },
				fat_split = { preset = "fat", preview = "main" },
				tall_split = { preset = "tall", preview = "main" },
			},
			formatters = { file = { filename_first = true } },
			sources = {
				buffers = { current = false },
				command_history = { layout = { preset = "fat" } },
				commands = { layout = { preset = "fat" } },
				explorer = { layout = { preset = "tall_split" }, auto_close = true },
				keymaps = { layout = { preset = "fat" } },
				highhighlights = { layout = { preset = "tall" } },
				lsp_references = { include_current = true, auto_confirm = false },
				lsp_symbols = { include_current = true },
				lsp_type_definitions = { include_current = true, auto_confirm = false },
				lsp_workspace_symbols = { include_current = true },
				pickers = { layout = { preset = "tall" } },
				project = { layout = { preset = "fat_preview" } },
				search_history = { layout = { preset = "fat" } },
				zoxide = { layout = { preset = "fat" } },
				smart = { multi = { "buffers", "files" } },
				undo = { layout = { preset = "fat_preview" } },
			},
		},
		statuscolumn = {},
		terminal = {},
		util = {},
	},
}
