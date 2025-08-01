return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	keys = {
		-- bufdelete
		{ "<leader>x", "<cmd>lua Snacks.bufdelete.delete()<cr>", desc = "Close Buffer" },
		{ "<leader>ax", "<cmd>lua Snacks.bufdelete.other()<cr>", desc = "Close Others Buffers" },
		{ "<leader>aX", "<cmd>lua Snacks.bufdelete.all()<cr>", desc = "Close All Buffers" },
		-- lazygit
		{ "<leader>hg", "<cmd>lua Snacks.lazygit()<cr>", desc = "Lazygit" },
		-- notifier
		-- { "<leader>n", "<cmd>lua Snacks.picker.notifications()<cr>", desc = "Show Notifier History" },
		-- terminal
		{ "<leader>z", "<cmd>lua Snacks.terminal()<cr>", desc = "Terminal" },
		-- -- dashboard
		-- { "<leader>ad", "<cmd>lua Snacks.dashboard()<cr>", desc = "Dashboard " },
		-- explorer
		{ "<leader>e", "<cmd>lua Snacks.explorer()<cr>", desc = "File Explorer" },
		-- picker:main
		{ "<leader><space>", "<cmd>lua Snacks.picker.files()<cr>", desc = "Find Files" },
		{
			"<leader>ac",
			"<cmd>lua Snacks.picker.explorer({cwd=vim.fn.stdpath('config')})<cr>",
			desc = "Find Config Files",
		},
		{ "<leader>,", "<cmd>lua Snacks.picker.buffers()<cr>", desc = "Buffers" },
		{ "<leader>p", "<cmd>lua Snacks.picker.pickers()<cr>", desc = "Pickers", mode = { "n", "x" } },
		{ "<leader>sw", "<cmd>lua Snacks.picker.grep_word()<cr>", desc = "Grep Word" },
		{ "<leader>ss", "<cmd>lua Snacks.picker.lsp_symbols()<cr>", desc = "LSP Symbols" },
		{ "<leader>sl", "<cmd>lua Snacks.picker.lines()<cr>", desc = "Lines" },
		{ "<leader>sd", "<cmd>lua Snacks.picker.lsp_definitions()<cr>", desc = "LSP Definitions" },
		{ "<leader>sS", "<cmd>lua Snacks.picker.lsp_workspace_symbols()<cr>", desc = "Workspace Symbols" },
		{ "<leader>sr", "<cmd>lua Snacks.picker.lsp_references()<cr>", nowait = true, desc = "LSP References" },
		{ "<leader>sb", "<cmd>lua Snacks.picker.grep_buffers()<cr>", desc = "Grep Word in Buffers" },
		{ "<leader>sp", "<cmd>lua Snacks.picker.grep()<cr>", desc = "Grep", mode = { "n", "x" } },
		{ "<leader>sq", "<cmd>lua Snacks.picker.qflist()<cr>", desc = "Quickfix List", mode = { "n", "x" } },
		{ "<leader><tab>", "<cmd>lua Snacks.picker.resume()<cr>", desc = "Resume", mode = { "n", "x" } },
	},
	opts = {
		styles = {
			notification = {
				wo = { wrap = true }, -- Wrap notifications
			},
		},
		bufdelete = {},
		indent = {},
		scope = {},
		lazygit = {},
		quickfile = {},
		bigfile = {},
		words = {},
		statuscolumn = {},
		terminal = {},
		util = {},
		-- notifier = {
		-- 	style = "minimal",
		-- 	top_down = true,
		-- 	width = { min = 40, max = 0.4 },
		-- 	height = { min = 1, max = 0.4 },
		-- 	margin = { top = 2, right = 1, bottom = 1 },
		-- },
		explorer = { replace_netrw = true },
		picker = {
			ui_select = { enabled = true },
			matcher = {
				frecency = true,
			},
			layout = { preset = "fat_preview" },
			layouts = {
				tall = {
					preview = false,
					layout = {
						col = -1,
						backdrop = false,
						width = 35,
						height = 0.9,
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
						-- col = -1,
						width = 0.9,
						height = 12,
						border = "rounded",
						title = " {title} {live} {flags}",
						title_pos = "center",
						{
							box = "horizontal",
							{
								box = "vertical",
								{ win = "input", height = 1 },
								{ win = "list" },
							},
							{ win = "preview", width = 0.65 },
						},
					},
				},
				fat_preview = { preset = "fat", preview = true },
				fat_split = { preset = "fat", preview = "main" },
				tall_split = { preset = "tall", preview = "main" },
			},
			formatters = { file = { filename_first = true, truncate = 120 } },
			sources = {
				buffers = { focus = "list", current = false },
				command_history = { layout = { preset = "fat" } },
				commands = { layout = { preset = "fat" } },
				explorer = {
					layout = { preset = "tall" },
					auto_close = true,
					git_status_open = true,
					diagnostics_open = true,
					hidden = true,
				},
				files = { hidden = true },
				grep_buffers = { live = false },
				keymaps = { layout = { preset = "fat" } },
				highlights = { layout = { preset = "tall_split" } },
				lsp_references = { include_current = true, auto_confirm = false, focus = "list" },
				lsp_symbols = {
					include_current = true,
					auto_confirm = false,
					focus = "list",
					layout = { preset = "tall_split" },
					filter = {
						default = true,
					},
				},
				lsp_type_definitions = { include_current = true, auto_confirm = false },
				lsp_workspace_symbols = { include_current = true },
				pickers = { layout = { preset = "tall" } },
				projects = {
					layout = { preset = "tall_split" },
				},
				search_history = { layout = { preset = "fat" } },
				zoxide = { layout = { preset = "fat" } },
				smart = { multi = { "recent", "files" }, hidden = true },
				undo = { layout = { preset = "fat_split" } },
				qflist = { focus = "list" },
			},
		},
	},
}
