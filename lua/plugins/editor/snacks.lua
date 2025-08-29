return {
	"folke/snacks.nvim",
	event = "VeryLazy",
	keys = {
		-- bufdelete
		{ "<leader>x", "<cmd>lua Snacks.bufdelete.delete()<cr>", desc = "Close Buffer" },
		{ "<leader>X", "<cmd>lua Snacks.bufdelete.other()<cr>", desc = "Close Other Buffers" },
		-- lazygit
		{ "<leader>hg", "<cmd>lua Snacks.lazygit()<cr>", desc = "Lazygit" },
		-- notifier
		{ "<leader>n", "<cmd>lua Snacks.picker.notifications()<cr>", desc = "Show Notifier History" },
		-- terminal
		{ "<leader>z", "<cmd>lua Snacks.terminal()<cr>", desc = "Terminal" },
		-- explorer
		-- { "<leader>e", "<cmd>lua Snacks.explorer()<cr>", desc = "File Explorer" },
		-- picker:main
		{ "<leader><space>", "<cmd>lua Snacks.picker.smart()<cr>", desc = "Smart" },
		{ "<leader>,", "<cmd>lua Snacks.picker.buffers()<cr>", desc = "Buffers" },
		{ "<leader>p", "<cmd>lua Snacks.picker.pickers()<cr>", desc = "Pickers", mode = { "n", "x" } },

		{ "<leader><tab>", "<cmd>lua Snacks.picker.resume()<cr>", desc = "Resume", mode = { "n", "x" } },
	},
	opts = {
		styles = {
			notification = {
				wo = { wrap = true }, -- wrap notifications
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
		notifier = {
			style = "minimal",
			top_down = false,
			width = { min = 1, max = 0.4 },
			height = { min = 1, max = 0.4 },
			margin = { top = 2, right = 1, bottom = 2 },
		},
		-- explorer = { replace_netrw = true },
		picker = {
			ui_select = { enabled = true },
			matcher = {
				frecency = true,
			},
			sources = {
				buffers = { focus = "list", current = false },
				-- explorer = {
				-- 	auto_close = true,
				-- 	git_status_open = true,
				-- 	diagnostics_open = true,
				-- 	hidden = true,
				-- },
				files = { hidden = true },
				grep_buffers = { live = false },
				lsp_references = { include_current = true, auto_confirm = false, focus = "list" },
				lsp_symbols = {
					include_current = true,
					auto_confirm = false,
					focus = "list",
					filter = {
						default = true,
					},
				},
				recent = { filter = { cwd = true } },
				lsp_type_definitions = { include_current = true, auto_confirm = false },
				lsp_workspace_symbols = { include_current = true },
				smart = { multi = { "buffers", "recent", "files" }, hidden = true },
				qflist = { focus = "list" },
				yanky = { focus = "list" },
			},
		},
		-- picker = {
		-- 	ui_select = { enabled = true },
		-- 	matcher = {
		-- 		frecency = true,
		-- 	},
		-- 	layout = { preset = "tall", cycle = true },
		-- 	layouts = {
		-- 		tall = {
		-- 			preview = false,
		-- 			layout = {
		-- 				col = -1,
		-- 				backdrop = false,
		-- 				width = 35,
		-- 				height = 0.9,
		-- 				title = "{title} {live} {flags}",
		-- 				title_pos = "center",
		-- 				border = "rounded",
		-- 				box = "vertical",
		-- 				{ win = "input", height = 1 },
		-- 				{
		-- 					box = "horizontal",
		-- 					{ win = "list" },
		-- 					{ win = "preview", width = 0.7 },
		-- 				},
		-- 			},
		-- 		},
		-- 		fat = {
		-- 			preview = false,
		-- 			layout = {
		-- 				box = "vertical",
		-- 				backdrop = false,
		-- 				row = -2,
		-- 				-- col = -1,
		-- 				width = 0.9,
		-- 				height = 12,
		-- 				border = "rounded",
		-- 				title = " {title} {live} {flags}",
		-- 				title_pos = "center",
		-- 				{
		-- 					box = "horizontal",
		-- 					{
		-- 						box = "vertical",
		-- 						{ win = "input", height = 1 },
		-- 						{ win = "list" },
		-- 					},
		-- 					{ win = "preview", width = 0.65 },
		-- 				},
		-- 			},
		-- 		},
		-- 		fat_preview = { preset = "fat", preview = true },
		-- 		fat_split = { preset = "fat", preview = "main" },
		-- 		tall_split = { preset = "tall", preview = "main" },
		-- 	},
		-- 	formatters = { file = { filename_first = true, truncate = 120 } },
		-- 	sources = {
		-- 		buffers = { focus = "list", current = false },
		-- 		command_history = { layout = { preset = "fat" } },
		-- 		commands = { layout = { preset = "fat" } },
		-- 		explorer = {
		-- 			layout = { preset = "tall", preview = "main" },
		-- 			auto_close = true,
		-- 			git_status_open = true,
		-- 			diagnostics_open = true,
		-- 			hidden = true,
		-- 		},
		-- 		files = { hidden = true },
		-- 		grep_buffers = { live = false },
		-- 		keymaps = { layout = { preset = "fat" } },
		-- 		highlights = { layout = { preset = "tall_split" } },
		-- 		lsp_references = { include_current = true, auto_confirm = false, focus = "list" },
		-- 		lsp_symbols = {
		-- 			include_current = true,
		-- 			auto_confirm = false,
		-- 			focus = "list",
		-- 			layout = { preset = "tall_split" },
		-- 			filter = {
		-- 				default = true,
		-- 			},
		-- 		},
		-- 		lsp_type_definitions = { include_current = true, auto_confirm = false },
		-- 		lsp_workspace_symbols = { include_current = true },
		-- 		pickers = { layout = { preset = "tall" } },
		-- 		projects = {
		-- 			layout = { preset = "tall_split" },
		-- 		},
		-- 		search_history = { layout = { preset = "fat" } },
		-- 		zoxide = { layout = "fat" },
		-- 		smart = { layout = "fat", multi = { "buffers", "recent", "files" }, hidden = true },
		-- 		undo = { layout = { preset = "fat_split" } },
		-- 		qflist = { focus = "list" },
		-- 		yanky = { focus = "list" },
		-- 	},
		-- },
	},
}
